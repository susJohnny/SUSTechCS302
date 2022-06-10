#include <stdio.h>
#include <stdlib.h>
#include <time.h> 
#include <pthread.h>
#include <semaphore.h>


pthread_mutex_t fri_lock;
sem_t sonlock;
sem_t parent_lock;
void *mom(int *num){
    for(int i=0;i<10;i++){
        sem_wait(&parent_lock);
        // pthread_mutex_lock(&fri_lock);
        printf("Mom comes home.\n");
        sleep(rand()%2+1);
        printf("Mom goes to buy milk.\n");
        *num += 1;
        if (*num > 2){
            printf("What a waste of food! The fridge can not hold so much milk!\n");
            while(1)printf("TAT~");
        }
        printf("Mom puts milk in fridge and leaves.\n");
        // pthread_mutex_unlock(&fri_lock);
        sem_post(&sonlock);
    }
    
}

void *dad(int *num){
    for(int i=0;i<10;i++){
        sem_wait(&parent_lock);
        // pthread_mutex_lock(&fri_lock);
        printf("Dad comes home.\n");
        sleep(rand()%2+1);
        printf("Dad goes to buy milk.\n");
        *num += 1;
        if (*num > 2){
            printf("What a waste of food! The fridge can not hold so much milk!\n");
            while(1)printf("TAT~");
        }
        printf("Dad puts milk in fridge and leaves.\n");  
        // pthread_mutex_unlock(&fri_lock);
        sem_post(&sonlock);
    }
    
}

void *grandfather(int *num){
    
    for(int i=0;i<10;i++){
        sem_wait(&parent_lock);
        // pthread_mutex_lock(&fri_lock);
        printf("Grandfather comes home.\n");
        sleep(rand()%2+1);
        printf("Grandfather goes to buy milk.\n");
        *num += 1;
        if (*num > 2){
            printf("What a waste of food! The fridge can not hold so much milk!\n");
            while(1){
            	printf("TAT~");
            }
        }
        printf("Grandfather puts milk in fridge and leaves.\n");
        // pthread_mutex_unlock(&fri_lock);
        sem_post(&sonlock);
    }
    
}

void *son(int *num){
    for(int i = 0; i < 30 ; i++){
        sem_wait(&sonlock);
        pthread_mutex_lock(&fri_lock);
        printf("Son comes home.\n");
        if(*num == 0){
            printf("The fridge is empty!\n");
            while(1){
            	printf("TAT~");
            }
        }
        printf("Son fetches a milk\n");
        *num -= 1;
        printf("Son leaves\n");
        pthread_mutex_unlock(&fri_lock);
        sem_post(&parent_lock);
    }
    
}

int main(int argc, char * argv[]) {
    srand(time(0));

    sem_init(&sonlock,0,0);
    sem_init(&parent_lock,0,2);

    int num_milk = 0;
    pthread_t p1, p2, p3, p4;
    pthread_mutex_init(&fri_lock,NULL);

    // Create two threads (both run func)  
    pthread_create(&p1, NULL, mom, &num_milk); 
    pthread_create(&p2, NULL, dad, &num_milk); 
    pthread_create(&p3, NULL, grandfather, &num_milk); 
    pthread_create(&p4, NULL, son, &num_milk); 
  
    // Wait for the threads to end. 
    pthread_join(p1, NULL); 
    pthread_join(p2, NULL); 
    pthread_join(p3, NULL); 
    pthread_join(p4, NULL); 

    printf("success!\n");
}
