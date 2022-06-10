#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <sys/wait.h>
#include <malloc.h>
int main()
{
    // initialise present user directory
    char address[200] = "~/OS/assignments/week4";
    while (1)
    {
        // get present user directory
        getcwd(address, 200 * sizeof(char));
        // print out the user account & user directory
        printf("11911609JohnnyGe@johnny-Ge-WXX9:%s$ ", address);
        // command arguments initialise
        char *args[5];
        // number of the arguments, default=0
        int length = 0;
        // scan in unit
        char ch;
        int j = 0;
        // use to temporarily store the argument
        char arg[10];
        // input command
        while (ch = getchar())
        {
            // the all command end
            if (ch == '\n')
            {
                arg[j] = '\0';
                char *argl = (char *)malloc((j + 2) * sizeof(char));
                strcpy(argl, arg);
                args[length] = argl;
                length++;
                j = 0;
                break;
            }
            // one argument input end
            if (ch == ' ')
            {
                arg[j] = '\0';
                char *argl = (char *)malloc((j + 2) * sizeof(char));
                strcpy(argl, arg);
                args[length] = argl;
                length++;
                j = 0;
            }
            // combine to a complete argument
            else
            {
                arg[j++] = ch;
            }
        }
        // initialise the space that has not argument
        for (int i = length; i < 5; i++)
        {
            args[i] = NULL;
        }
        // get command and execute
        if (length != 0)
        {
            // execute cd
            if (strcmp("cd", args[0]) == 0)
            {
                if (chdir(args[1]) != 0)
                {
                    printf("No such directory\n!");
                }
            }
            // execute command in /bin directory
            else
            {
                if (fork())
                {
                    wait(NULL);
                    // return the argument space to OS
                    for (int i = 0; i < 5; i++)
                    {
                        free(args[i]);
                    }
                }
                // execute command in child process
                else
                {
                    char filename[20] = "/bin/";
                    strcat(filename, args[0]);
                    execl(filename, args[0], args[1], args[2], args[3], args[4], NULL);
                }
            }
        }
    }
}