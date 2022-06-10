# LAB6-Report

### 11911609-葛兆宁

## Q1

* *le2page(le, member)的宏展开为((struct Page\*)((char\*)(ptr)-((size_t)(&((struct Page\*)0)->member))))*

* *le2page的工作原理是先算出Page类型的成员地址距离申请空间的首地址的偏移量，然后根据任意一个Page的任意一个成员变量获取这个Page的首地址位置*

## Q2

* *default_allocate_pages(size_t n)函数为申请一个为n个page大小的page-list空间，并往里面构建n个page大小的page-list，实现途径为先在一个内存空间中遍历，找到能存n个page大小的空间，然后塞进page-list并对每个page初始化。*

* *default_free_pages(struct Page\* base, size_t n)函数为将base为首地址之后n个page的空间释放出来，具体实现过程是将先是base之后n个page进行检查，查看page是否存在，然后对于base之后的每一个page进行空间释放，返回给freelist空间。*
