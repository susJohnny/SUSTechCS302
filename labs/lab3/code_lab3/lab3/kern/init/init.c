#include <stdio.h>
#include <string.h>
#include <console.h>

int kern_init(void) __attribute__((noreturn));

int kern_init(void)
{
    extern char edata[], end[];
    memset(edata, 0, end - edata);

    const char *message = "os is loading ...\n";
    cputs(message);

    // const char *new_message = "SUSTech OS\n";
    // cputs(new_message);

    // new_message = "ILOVEOS\n";
    // doubleputs(new_message);
    cputs("The system will close.\n");
    shutdown();

    while (1)
        ;
}
