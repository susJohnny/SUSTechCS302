#include <stdio.h>
#include <unistd.h>
int main()
{
    if (fork())
    {
        printf("The parent process pid is %d\n", getpid());
        while (1)
            ;
    }
    else
    {
        printf("The child's pid process is %d\n", getpid());
    }
}