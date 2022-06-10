# Week15-Assignment-Report

* 11911609-葛兆宁

## Q1

1) Seek Time + Rotational latency + Transfer Time

2)
|schedule idea|access sequence|required time|
| ---- | ---- | ---- |
|FIFO|70,30,90,60,20|seek time = (\|70-100\|+\|30-70\|+\|90-30\|+\|120-90\|+\|60-120\|+\|60-20\|)x1ms = 260 ms <br> rotation latency = 6 x0.5x5ms/r=15ms<br>total_time = seek time + rotation latancy =275ms|
|SSTF|90,70,60,30,20,120|seek time = (\|100-90\|+\|90-70\|+\|70-60\|+\|60-30\|+\|30-20\|+\|20-120\|)x1ms = 180ms<br>rotation latency=15ms<br>total time= 195ms|
|SCAN|120,199,90,70,60,30,20| seek time =(99 +179) x 1ms = 278ms<br> rotation latency = 15ms<br>total time=293s|
|CSCAN|120,199,0,20,30,60,70,90|seek time = (99+199+90) x 1ms = 388ms<br> rotation latency = 15ms<br>total_time = 403ms |

## Q2

![image](Q2.jpg)

* Those are the things I've tried my best to describe...even though I've read the Lab-15 doc many time...
