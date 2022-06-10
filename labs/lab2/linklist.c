#include <stdio.h>
#include <stdlib.h>

typedef struct Link {
    int  elem;
    struct Link *next;
}link;

int main()
{
    link p1;
    p1.elem = 0;
    p1.next = NULL;
    int n = 0;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        link *p2 = (link *)malloc(sizeof(link));
        int x = 0;
        scanf("%d", &x);
        p2->elem = x;
        p2->next = NULL;
        if (p1.next != NULL)
        {
            p2->next = p1.next;
        }
        p1.next = p2;
    }
    link *p = &p1;
    while (p->next != NULL)
    {
        printf("%d ", p->elem);
        p = p->next;
    }
    printf("%d ", p->elem);
}