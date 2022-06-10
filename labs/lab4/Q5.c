#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
int main()
{
    printf("waiting for the child\n");
    if (fork())
    {
        int a = wait(NULL);
        printf("success!\n");
    }
    else
    {
        execl("/bin/ps", "ps", "-al", NULL);
        printf("task finished\n");
    }
}