
// Producers and Consumers.
// Two producers vs two consumers
// At any time, only one person can access count
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
int count = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
void *mom(void *arg)
{
    int i = 5;
    if (count == 5)
    {
        pthread_cond_signal(&cond);
        printf("MOM leaves\n");
        return NULL;
    }
    while (i--)
    {
        pthread_mutex_lock(&mutex);
        printf("MOM go out\n");
        count++;
        printf("MOM buy %d Bottles of milk\n", count);
        if (count > 0)
        {
            pthread_cond_signal(&cond);
        }
        printf("MOM leaves\n");
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}
void *sister(void *arg)
{
    int i = 5;
    if (count == 5)
    {
        pthread_cond_signal(&cond);
        printf("SISTER leaves\n");
        return NULL;
    }
    while (i--)
    {
        pthread_mutex_lock(&mutex);
        printf("SISTER go out\n");
        count++;
        printf("SISTER buy %d bottles of milk\n", count);
        if (count > 0)
        {
            pthread_cond_signal(&cond);
        }
        printf("SISTER leaves\n");
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}
void *dad(void *arg)
{
    int i = 5;
    while (i--)
    {
        pthread_mutex_lock(&mutex);
        printf("DAD check the fridge\n");
        if (count <= 0)
        {
            printf("DAD call MOM and SISTER\n");
            pthread_cond_wait(&cond, &mutex);
            printf(" DAD end wait\n");
        }
        count--;
        printf("The milk is %d bottles\n", count);
        pthread_mutex_unlock(&mutex);
        printf("DAD leaves\n");
    }
    return NULL;
}
void *son(void *arg)
{
    int i = 5;
    while (i--)
    {
        pthread_mutex_lock(&mutex);
        printf("Son check fridge\n");
        if (count <= 0)
        {
            printf("call mom and sister\n");
            pthread_cond_wait(&cond, &mutex);
            printf(" SON end wait\n");
        }
        count--;
        printf("The milk is %d bottlwes\n", count);
        pthread_mutex_unlock(&mutex);
        printf("SON leaves\n");
    }
    return NULL;
}
int main()
{
    pthread_t producethread1, producethread2, consumethread1, consumethread2;
    pthread_create(&consumethread1, NULL, dad, NULL);
    pthread_create(&consumethread2, NULL, son, NULL);
    pthread_create(&producethread1, NULL, mom, NULL);
    pthread_create(&producethread2, NULL, sister, NULL);
    pthread_join(producethread1, NULL);
    pthread_join(consumethread1, NULL);
    pthread_join(producethread2, NULL);
    pthread_join(consumethread2, NULL);
    return 0;
}