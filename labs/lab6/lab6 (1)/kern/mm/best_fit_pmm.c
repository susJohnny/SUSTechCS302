#include <pmm.h>
#include <list.h>
#include <string.h>
#include <best_fit_pmm.h>
#include <stdio.h>

free_area_t free_area;

#define free_list (free_area.free_list)
#define nr_free (free_area.nr_free)

static void
best_fit_init(void)
{
    // TODO
    list_init(&free_list);
    nr_free = 0;
}

static void
best_fit_init_memmap(struct Page *base, size_t n)
{
    // TODO
    assert(n > 0);
    struct Page *p = base;
    for (; p != base + n; p++)
    {
        assert(PageReserved(p));
        p->flags = p->property = 0;
        set_page_ref(p, 0);
    }
    base->property = n;
    SetPageProperty(base);
    nr_free += n;
    if (list_empty(&free_list))
    {
        list_add(&free_list, &(base->page_link));
    }
    else
    {
        list_entry_t *le = &free_list;
        while ((le = list_next(le)) != &free_list)
        {
            struct Page *page = le2page(le, page_link);
            if (base < page)
            {
                list_add_before(le, &(base->page_link));
                break;
            }
            else if (list_next(le) == &free_list)
            {
                list_add(le, &(base->page_link));
            }
        }
    }
}

static struct Page *
best_fit_alloc_pages(size_t n)
{
    assert(n > 0);
    if (n > nr_free)
    {
        return NULL;
    }
    struct Page *page = NULL;
    list_entry_t *le = &free_list;
    int min = 1000000;
    while ((le = list_next(le)) != &free_list)
    {
        struct Page *p = le2page(le, page_link);
        if (p->property >= n)
        {
            if (p->property == n)
            {
                page = p;
                break;
            }
            else if (p->property < min)
            {
                page = p;
                min = p->property;
            }
        }
    }
    if (page != NULL)
    {
        list_entry_t *prev = list_prev(&(page->page_link));
        list_del(&(page->page_link));
        // prev->next = (prev->next)->next;
        // (prev->next)->prev = prev;

        if (page->property > n)
        {
            struct Page *p = page + n;
            p->property = page->property - n;
            SetPageProperty(p);
            list_add(prev, &(p->page_link));
        }
        nr_free -= n;
        ClearPageProperty(page);
    }
    return page;
}

static void
best_fit_free_pages(struct Page *base, size_t n)
{
    assert(n > 0);
    struct Page *p = base;
    for (; p != base + n; p++)
    {
        // cprintf("adrress :%p\n",p,NULL);
        assert(!PageReserved(p) && !PageProperty(p));
        // cputs("ok\n");
        p->flags = 0;
        set_page_ref(p, 0);
    }
    base->property = n;
    SetPageProperty(base);
    nr_free += n;

    if (list_empty(&free_list))
    {
        list_add(&free_list, &(base->page_link));
    }
    else
    {
        list_entry_t *le = &free_list;
        while ((le = list_next(le)) != &free_list)
        {
            struct Page *page = le2page(le, page_link);
            if (base < page)
            {
                list_add_before(le, &(base->page_link));
                break;
            }
            else if (list_next(le) == &free_list)
            {
                list_add(le, &(base->page_link));
            }
        }
    }

    //-----------------------合并空闲块--------------------
    list_entry_t *le = &free_list;
    le = list_next(le);
    while (1)
    {
        if (le == &free_list)
        {
            break;
        }
        struct Page *page = le2page(le, page_link);
        list_entry_t *le_next = list_next(le);
        if (le_next == &free_list)
        {
            break;
        }
        struct Page *page_next = le2page(le_next, page_link);
        if (page + page->property == page_next)
        {
            page->property += page_next->property;
            page_next->property = 0;
            // SetPageReserved(page_next);
            // set_page_ref(p, 0);
            // assert(list_next(le) != &free_list);
            // cputs("assert1 success\n");
            le->next = le_next->next;
            (le->next)->prev = le;
            // assert(list_next(le) == &free_list);
            // cputs("assert2 success\n");

            ClearPageProperty(page_next);
            // cprintf("page:%p and page_next:%p\n", page, page_next);
        }
        else
            le = le_next;
    }
}

static size_t
best_fit_nr_free_pages(void)
{
    return nr_free;
}

static void
basic_check(void)
{
    struct Page *p0, *p1, *p2;
    p0 = p1 = p2 = NULL;
    // cprintf("page_size:%d\n", sizeof(struct Page), NULL);
    assert((p0 = alloc_page()) != NULL);
    assert((p1 = alloc_page()) != NULL);
    assert((p2 = alloc_page()) != NULL);

    assert(p0 != p1 && p0 != p2 && p1 != p2);
    assert(page_ref(p0) == 0 && page_ref(p1) == 0 && page_ref(p2) == 0);

    assert(page2pa(p0) < npage * PGSIZE);
    assert(page2pa(p1) < npage * PGSIZE);
    assert(page2pa(p2) < npage * PGSIZE);

    list_entry_t free_list_store = free_list;
    list_init(&free_list);
    assert(list_empty(&free_list));

    unsigned int nr_free_store = nr_free;
    nr_free = 0;

    assert(alloc_page() == NULL);
    // cputs("the previous is ok");
    free_page(p0);
    // cputs("p0 isok");
    free_page(p1);
    // cputs("p1 is ok");
    free_page(p2);
    // cputs("p2 is ok");
    list_entry_t *le = &free_list;
    // while ((le = list_next(le)) != &free_list)
    // {
    //     struct Page *page = le2page(le, page_link);
    //     cprintf("list memeber address:%p property:%d\n", page, page->property);
    // }
    assert(nr_free == 3);
    assert((p0 = alloc_page()) != NULL);
    assert((p1 = alloc_page()) != NULL);
    assert((p2 = alloc_page()) != NULL);
    // cprintf("address alooc:%p", p0);
    // cprintf("address alooc:%p", p1);
    // cprintf("address alooc:%p", p2);
    assert(alloc_page() == NULL);

    free_page(p0);
    // cputs("p0 is ok second");
    assert(!list_empty(&free_list));

    struct Page *p;
    assert((p = alloc_page()) == p0);
    assert(alloc_page() == NULL);

    assert(nr_free == 0);


    free_list = free_list_store;
    nr_free = nr_free_store;

    free_page(p);
    free_page(p1);
    free_page(p2);
}

// below code is used to check the best fit allocation algorithm (your EXERCISE 1)
// NOTICE: You SHOULD NOT CHANGE basic_check, default_check functions!
static void
best_fit_check(void)
{
    int score = 0, sumscore = 6;
    int count = 0, total = 0;
    list_entry_t *le = &free_list;
    while ((le = list_next(le)) != &free_list)
    {
        struct Page *p = le2page(le, page_link);
        assert(PageProperty(p));
        count++, total += p->property;
    }
    assert(total == nr_free_pages());

    basic_check();

#ifdef ucore_test
    score += 1;
    cprintf("grading: %d / %d points\n", score, sumscore);
#endif
    struct Page *p0 = alloc_pages(5), *p1, *p2;
    assert(p0 != NULL);
    assert(!PageProperty(p0));

#ifdef ucore_test
    score += 1;
    cprintf("grading: %d / %d points\n", score, sumscore);
#endif
    list_entry_t free_list_store = free_list;
    list_init(&free_list);
    assert(list_empty(&free_list));
    assert(&free_list==(&free_list)->next);
    assert(alloc_page() == NULL);

#ifdef ucore_test
    score += 1;
    cprintf("grading: %d / %d points\n", score, sumscore);
#endif
    unsigned int nr_free_store = nr_free;
    nr_free = 0;

    // * - - * -

    free_pages(p0 + 1, 2);
    // cprintf("address:\n %p\n %p\n %p\n", &free_list, (&free_list)->next, (&free_list)->next->next);
    // cputs("p0+1:ok");
    free_pages(p0 + 4, 1);
    // cprintf("address12345:\n %p\n %p\n %p\n %p\n", &free_list, (&free_list)->next, (&free_list)->next->next, (&free_list)->next->next->next);
    // cputs("p0+4: ok");

    assert(alloc_pages(4) == NULL);
    assert(PageProperty(p0 + 1) && p0[1].property == 2);
    // * - - * *
    assert((p1 = alloc_pages(1)) != NULL);
    // cprintf("address123:\n %p\n %p\n %p\n", &free_list, (&free_list)->next, (&free_list)->next->next);
    struct Page *px;
    assert((px = alloc_pages(2)) != NULL);
    // cprintf("address of px:%p\n", px, NULL);
    assert(p0 + 4 == p1);

#ifdef ucore_test
    score += 1;
    cprintf("grading: %d / %d points\n", score, sumscore);
#endif
    p2 = p0 + 1;
    // cputs("ok\n");
    // cprintf("adress:\n %p\n %p\n %p\n ", p0, p1, p2, NULL);
    // cprintf("address:\n %p\n %p\n %p\n %d\n", &free_list, (&free_list)->next, (&free_list)->next->next, le2page((&free_list)->next, page_link)->property, NULL);
    free_pages(p0, 5);
    // cprintf("%d\n", nr_free, NULL);
    assert((p0 = alloc_pages(5)) != NULL);
    assert(alloc_page() == NULL);

#ifdef ucore_test
    score += 1;
    cprintf("grading: %d / %d points\n", score, sumscore);
#endif
    assert(nr_free == 0);
    // cputs("Hello");
    nr_free = nr_free_store;

    free_list = free_list_store;
    free_pages(p0, 5);

    le = &free_list;
    while ((le = list_next(le)) != &free_list)
    {
        struct Page *p = le2page(le, page_link);
        // cprintf("le:%p\tp:%p\n", le, p);
        count--, total -= p->property;
    }
    assert(count == 0);
    assert(total == 0);
    // cprintf("success\n");
#ifdef ucore_test
    score += 1;
    cprintf("grading: %d / %d points\n", score, sumscore);
#endif
}

const struct pmm_manager best_fit_pmm_manager = {
    .name = "best_fit_pmm_manager",
    .init = best_fit_init,
    .init_memmap = best_fit_init_memmap,
    .alloc_pages = best_fit_alloc_pages,
    .free_pages = best_fit_free_pages,
    .nr_free_pages = best_fit_nr_free_pages,
    .check = best_fit_check,
};
