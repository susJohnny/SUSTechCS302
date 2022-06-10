#include <stdio.h>
#include <condvar.h>
#include <kmalloc.h>
#include <assert.h>

void cond_init(condvar_t *cvp)
{
    //================your code=====================
    cvp->cnt = 0;
}

// Unlock one of threads waiting on the condition variable.
void cond_signal(condvar_t *cvp)
{
    //================your code=====================
    (cvp->cnt) = 1;
}

void cond_wait(condvar_t *cvp, semaphore_t *mutex)
{
    //================your code=====================
    up(mutex);
    while ((cvp->cnt) == 0)
    {
        schedule();
    }
    (cvp->cnt)--;

    down(mutex);
}
