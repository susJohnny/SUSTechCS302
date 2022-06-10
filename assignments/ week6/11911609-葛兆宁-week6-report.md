# Week6-Assignmet-Report

### 11911609-葛兆宁

## Q1

* In CPU hardware, the work it does is to set physical base and bound address in its MMU registers, and accomplish the address translation. Secondly, support special instructions to change the base and bound for OS. Then, it is also responsible for the address-valid check. Finally, it offers and raises exceptions for the illegal memory access and process.

* OS is responsible for creating process and use CPU to find a suitable space for its address space in memory, and cleans up and recycle the space in the memory when the process terminated. Secondly, it is used to manage the context switch. Thirldly, it offers the exception handlers when CPU hardware raises exceptions.

## Q2

* size of chunks:  

  * segmentation: differnt sizes
  
  * paging: same size each page

* management of the free spaces:
  
  * segmentation: easy to have external fragments that needs rearranging

  * paging: get fragmentation problem better but too slow

* status bits:

  * segmentation: not found

  * paging: cpu will use zero flag

* protection bits:

  * segmentation:per segment

  * paging: per page

## Q3

* because the page size is 8kB, so physical offset of VA is log(8*1024)=13 bit.

* because the VA is 46bit , so page table offset =46-13=33 bit.

* whatever the x86 PTE, or without those other conditional bit, the size of a page table is 2^x(x is the number of PPN bit), it need x bits for that Page Table  offset.

* get x86 as a example,there are 20 bits of PPN, so it needs 2 levels of Page table.((int)33/20+1=2)

* so it needs at least 2 levels of the page table

## Q4

* (a)page size=2^12=4kB Page table size(Maximum)= 2^20= 1MB

* (b)
  * first level page bit is 0x30C, offset=770

  * second level page bit is 0x266, offset=1707

## Q5

* code:![code1](image\code1.png)(in default_pmm.c)

* result:![result1](image\result1.png)

## Q6

* code: ![code2](image\code2.png)(in best_fi_pmm.c,other balnks is same as default_pmm.c)

* result: ![result2](image\result2.png)
