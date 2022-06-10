#include<stdio.h>
int main(int argc, char** argv)
{
    if(argc>1)
    {
        printf("name:%s sid:%s\n",argv[1],argv[2]);
    }
    else
    {
        printf("name:Johnny sid:11911609\n");
    }
}