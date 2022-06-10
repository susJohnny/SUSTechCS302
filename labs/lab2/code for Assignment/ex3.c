# include <stdio.h>
# include <string.h>
struct AGE
{
    int year;
    int month;
    int day;
};
struct STUDENT
{
    char name[20]; 
    int num;  
    struct AGE birthday; 
    float score;  
};
int main(void)
{
    struct STUDENT student1; 
    struct STUDENT *p = NULL;  
    p = &student1;  
    // ----start----
    // 1. 填空，完成名字赋值(将下划线替换成你的代码)
    strcpy(_____________, "OS_Bob"); 
    // 2. 设置出生年月为2001-2-23
   
    
   	// 3. 填空，学号和分数设置为12100001和100(将下划线替换成你的代码)
    p->__________________;
    p->__________________; 
    
    
    // 4.请将相关信息打印到屏幕上，并截图
    
    // ----end----
    return 0;
}