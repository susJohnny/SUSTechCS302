# Week5-lab-report

### 11911609 葛兆宁

## Q1

* ebreak之后，会产生中断信号，之后系统会寻找stvec寄存器中村的地址，调到对应位置，执行相应中断函数，执行前通过入口先用结构体封装上下文便于保存，然后打包给trap函数保存，trap函数调用exception_handler()处理中断，处理万后返回之前保存的上下文

## Q2

* ### code

  in trap.c:
  change the case Illegal exception in exception_handler():  

  ```text
    case CAUSE_ILLEGAL_INSTRUCTION:
        cprintf("illegel caught at 0x%016llx\n", tf->epc);
        tf->epc += 2;
        break;
  ```

  in init.c:  
  add one sentence before while(1):
  
  ```code
    asm volatile("mret" ::);
  ```

* ### result

```text
11911609JohnnyGe@johnny-Ge-WXX9:~/OS/labs/lab5/lab5_code$  make qemu
+ cc kern/init/init.c
+ cc kern/trap/trap.c
+ ld bin/kernel
riscv64-unknown-elf-objcopy bin/kernel --strip-all -O binary bin/ucore.bin

OpenSBI v0.6
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name          : QEMU Virt Machine
Platform HART Features : RV64ACDFIMSU
Platform Max HARTs     : 8
Current Hart           : 0
Firmware Base          : 0x80000000
Firmware Size          : 120 KB
Runtime SBI Version    : 0.2

MIDELEG : 0x0000000000000222
MEDELEG : 0x000000000000b109
PMP0    : 0x0000000080000000-0x000000008001ffff (A)
PMP1    : 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
os is loading ...

ebreak caught at 0x000000008020003a
illegel caught at 0x000000008020003c

```
