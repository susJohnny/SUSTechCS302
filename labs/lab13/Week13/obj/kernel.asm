
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c020d2b7          	lui	t0,0xc020d
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c020d137          	lui	sp,0xc020d
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	0000e517          	auipc	a0,0xe
ffffffffc0200036:	05e50513          	addi	a0,a0,94 # ffffffffc020e090 <buf>
ffffffffc020003a:	00019617          	auipc	a2,0x19
ffffffffc020003e:	70e60613          	addi	a2,a2,1806 # ffffffffc0219748 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	2a3070ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc020004e:	570000ef          	jal	ra,ffffffffc02005be <cons_init>
ffffffffc0200052:	00008597          	auipc	a1,0x8
ffffffffc0200056:	ece58593          	addi	a1,a1,-306 # ffffffffc0207f20 <etext+0x6>
ffffffffc020005a:	00008517          	auipc	a0,0x8
ffffffffc020005e:	ede50513          	addi	a0,a0,-290 # ffffffffc0207f38 <etext+0x1e>
ffffffffc0200062:	06a000ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200066:	788020ef          	jal	ra,ffffffffc02027ee <pmm_init>
ffffffffc020006a:	5c6000ef          	jal	ra,ffffffffc0200630 <pic_init>
ffffffffc020006e:	5d0000ef          	jal	ra,ffffffffc020063e <idt_init>
ffffffffc0200072:	050010ef          	jal	ra,ffffffffc02010c2 <vmm_init>
ffffffffc0200076:	0ed040ef          	jal	ra,ffffffffc0204962 <sched_init>
ffffffffc020007a:	6da040ef          	jal	ra,ffffffffc0204754 <proc_init>
ffffffffc020007e:	4a2000ef          	jal	ra,ffffffffc0200520 <ide_init>
ffffffffc0200082:	1d8010ef          	jal	ra,ffffffffc020125a <swap_init>
ffffffffc0200086:	4f0000ef          	jal	ra,ffffffffc0200576 <clock_init>
ffffffffc020008a:	5a8000ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020008e:	7fc040ef          	jal	ra,ffffffffc020488a <cpu_idle>

ffffffffc0200092 <cputch>:
ffffffffc0200092:	1141                	addi	sp,sp,-16
ffffffffc0200094:	e022                	sd	s0,0(sp)
ffffffffc0200096:	e406                	sd	ra,8(sp)
ffffffffc0200098:	842e                	mv	s0,a1
ffffffffc020009a:	526000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc020009e:	401c                	lw	a5,0(s0)
ffffffffc02000a0:	60a2                	ld	ra,8(sp)
ffffffffc02000a2:	2785                	addiw	a5,a5,1
ffffffffc02000a4:	c01c                	sw	a5,0(s0)
ffffffffc02000a6:	6402                	ld	s0,0(sp)
ffffffffc02000a8:	0141                	addi	sp,sp,16
ffffffffc02000aa:	8082                	ret

ffffffffc02000ac <vcprintf>:
ffffffffc02000ac:	1101                	addi	sp,sp,-32
ffffffffc02000ae:	862a                	mv	a2,a0
ffffffffc02000b0:	86ae                	mv	a3,a1
ffffffffc02000b2:	00000517          	auipc	a0,0x0
ffffffffc02000b6:	fe050513          	addi	a0,a0,-32 # ffffffffc0200092 <cputch>
ffffffffc02000ba:	006c                	addi	a1,sp,12
ffffffffc02000bc:	ec06                	sd	ra,24(sp)
ffffffffc02000be:	c602                	sw	zero,12(sp)
ffffffffc02000c0:	2c3070ef          	jal	ra,ffffffffc0207b82 <vprintfmt>
ffffffffc02000c4:	60e2                	ld	ra,24(sp)
ffffffffc02000c6:	4532                	lw	a0,12(sp)
ffffffffc02000c8:	6105                	addi	sp,sp,32
ffffffffc02000ca:	8082                	ret

ffffffffc02000cc <cprintf>:
ffffffffc02000cc:	711d                	addi	sp,sp,-96
ffffffffc02000ce:	02810313          	addi	t1,sp,40 # ffffffffc020d028 <boot_page_table_sv39+0x28>
ffffffffc02000d2:	8e2a                	mv	t3,a0
ffffffffc02000d4:	f42e                	sd	a1,40(sp)
ffffffffc02000d6:	f832                	sd	a2,48(sp)
ffffffffc02000d8:	fc36                	sd	a3,56(sp)
ffffffffc02000da:	00000517          	auipc	a0,0x0
ffffffffc02000de:	fb850513          	addi	a0,a0,-72 # ffffffffc0200092 <cputch>
ffffffffc02000e2:	004c                	addi	a1,sp,4
ffffffffc02000e4:	869a                	mv	a3,t1
ffffffffc02000e6:	8672                	mv	a2,t3
ffffffffc02000e8:	ec06                	sd	ra,24(sp)
ffffffffc02000ea:	e0ba                	sd	a4,64(sp)
ffffffffc02000ec:	e4be                	sd	a5,72(sp)
ffffffffc02000ee:	e8c2                	sd	a6,80(sp)
ffffffffc02000f0:	ecc6                	sd	a7,88(sp)
ffffffffc02000f2:	e41a                	sd	t1,8(sp)
ffffffffc02000f4:	c202                	sw	zero,4(sp)
ffffffffc02000f6:	28d070ef          	jal	ra,ffffffffc0207b82 <vprintfmt>
ffffffffc02000fa:	60e2                	ld	ra,24(sp)
ffffffffc02000fc:	4512                	lw	a0,4(sp)
ffffffffc02000fe:	6125                	addi	sp,sp,96
ffffffffc0200100:	8082                	ret

ffffffffc0200102 <cputchar>:
ffffffffc0200102:	a97d                	j	ffffffffc02005c0 <cons_putc>

ffffffffc0200104 <cputs>:
ffffffffc0200104:	1101                	addi	sp,sp,-32
ffffffffc0200106:	e822                	sd	s0,16(sp)
ffffffffc0200108:	ec06                	sd	ra,24(sp)
ffffffffc020010a:	e426                	sd	s1,8(sp)
ffffffffc020010c:	842a                	mv	s0,a0
ffffffffc020010e:	00054503          	lbu	a0,0(a0)
ffffffffc0200112:	c51d                	beqz	a0,ffffffffc0200140 <cputs+0x3c>
ffffffffc0200114:	0405                	addi	s0,s0,1
ffffffffc0200116:	4485                	li	s1,1
ffffffffc0200118:	9c81                	subw	s1,s1,s0
ffffffffc020011a:	4a6000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc020011e:	00044503          	lbu	a0,0(s0)
ffffffffc0200122:	008487bb          	addw	a5,s1,s0
ffffffffc0200126:	0405                	addi	s0,s0,1
ffffffffc0200128:	f96d                	bnez	a0,ffffffffc020011a <cputs+0x16>
ffffffffc020012a:	0017841b          	addiw	s0,a5,1
ffffffffc020012e:	4529                	li	a0,10
ffffffffc0200130:	490000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc0200134:	60e2                	ld	ra,24(sp)
ffffffffc0200136:	8522                	mv	a0,s0
ffffffffc0200138:	6442                	ld	s0,16(sp)
ffffffffc020013a:	64a2                	ld	s1,8(sp)
ffffffffc020013c:	6105                	addi	sp,sp,32
ffffffffc020013e:	8082                	ret
ffffffffc0200140:	4405                	li	s0,1
ffffffffc0200142:	b7f5                	j	ffffffffc020012e <cputs+0x2a>

ffffffffc0200144 <getchar>:
ffffffffc0200144:	1141                	addi	sp,sp,-16
ffffffffc0200146:	e406                	sd	ra,8(sp)
ffffffffc0200148:	4ac000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020014c:	dd75                	beqz	a0,ffffffffc0200148 <getchar+0x4>
ffffffffc020014e:	60a2                	ld	ra,8(sp)
ffffffffc0200150:	0141                	addi	sp,sp,16
ffffffffc0200152:	8082                	ret

ffffffffc0200154 <readline>:
ffffffffc0200154:	715d                	addi	sp,sp,-80
ffffffffc0200156:	e486                	sd	ra,72(sp)
ffffffffc0200158:	e0a6                	sd	s1,64(sp)
ffffffffc020015a:	fc4a                	sd	s2,56(sp)
ffffffffc020015c:	f84e                	sd	s3,48(sp)
ffffffffc020015e:	f452                	sd	s4,40(sp)
ffffffffc0200160:	f056                	sd	s5,32(sp)
ffffffffc0200162:	ec5a                	sd	s6,24(sp)
ffffffffc0200164:	e85e                	sd	s7,16(sp)
ffffffffc0200166:	c901                	beqz	a0,ffffffffc0200176 <readline+0x22>
ffffffffc0200168:	85aa                	mv	a1,a0
ffffffffc020016a:	00008517          	auipc	a0,0x8
ffffffffc020016e:	dd650513          	addi	a0,a0,-554 # ffffffffc0207f40 <etext+0x26>
ffffffffc0200172:	f5bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200176:	4481                	li	s1,0
ffffffffc0200178:	497d                	li	s2,31
ffffffffc020017a:	49a1                	li	s3,8
ffffffffc020017c:	4aa9                	li	s5,10
ffffffffc020017e:	4b35                	li	s6,13
ffffffffc0200180:	0000eb97          	auipc	s7,0xe
ffffffffc0200184:	f10b8b93          	addi	s7,s7,-240 # ffffffffc020e090 <buf>
ffffffffc0200188:	3fe00a13          	li	s4,1022
ffffffffc020018c:	fb9ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc0200190:	00054a63          	bltz	a0,ffffffffc02001a4 <readline+0x50>
ffffffffc0200194:	00a95a63          	bge	s2,a0,ffffffffc02001a8 <readline+0x54>
ffffffffc0200198:	029a5263          	bge	s4,s1,ffffffffc02001bc <readline+0x68>
ffffffffc020019c:	fa9ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc02001a0:	fe055ae3          	bgez	a0,ffffffffc0200194 <readline+0x40>
ffffffffc02001a4:	4501                	li	a0,0
ffffffffc02001a6:	a091                	j	ffffffffc02001ea <readline+0x96>
ffffffffc02001a8:	03351463          	bne	a0,s3,ffffffffc02001d0 <readline+0x7c>
ffffffffc02001ac:	e8a9                	bnez	s1,ffffffffc02001fe <readline+0xaa>
ffffffffc02001ae:	f97ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc02001b2:	fe0549e3          	bltz	a0,ffffffffc02001a4 <readline+0x50>
ffffffffc02001b6:	fea959e3          	bge	s2,a0,ffffffffc02001a8 <readline+0x54>
ffffffffc02001ba:	4481                	li	s1,0
ffffffffc02001bc:	e42a                	sd	a0,8(sp)
ffffffffc02001be:	f45ff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc02001c2:	6522                	ld	a0,8(sp)
ffffffffc02001c4:	009b87b3          	add	a5,s7,s1
ffffffffc02001c8:	2485                	addiw	s1,s1,1
ffffffffc02001ca:	00a78023          	sb	a0,0(a5)
ffffffffc02001ce:	bf7d                	j	ffffffffc020018c <readline+0x38>
ffffffffc02001d0:	01550463          	beq	a0,s5,ffffffffc02001d8 <readline+0x84>
ffffffffc02001d4:	fb651ce3          	bne	a0,s6,ffffffffc020018c <readline+0x38>
ffffffffc02001d8:	f2bff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc02001dc:	0000e517          	auipc	a0,0xe
ffffffffc02001e0:	eb450513          	addi	a0,a0,-332 # ffffffffc020e090 <buf>
ffffffffc02001e4:	94aa                	add	s1,s1,a0
ffffffffc02001e6:	00048023          	sb	zero,0(s1)
ffffffffc02001ea:	60a6                	ld	ra,72(sp)
ffffffffc02001ec:	6486                	ld	s1,64(sp)
ffffffffc02001ee:	7962                	ld	s2,56(sp)
ffffffffc02001f0:	79c2                	ld	s3,48(sp)
ffffffffc02001f2:	7a22                	ld	s4,40(sp)
ffffffffc02001f4:	7a82                	ld	s5,32(sp)
ffffffffc02001f6:	6b62                	ld	s6,24(sp)
ffffffffc02001f8:	6bc2                	ld	s7,16(sp)
ffffffffc02001fa:	6161                	addi	sp,sp,80
ffffffffc02001fc:	8082                	ret
ffffffffc02001fe:	4521                	li	a0,8
ffffffffc0200200:	f03ff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc0200204:	34fd                	addiw	s1,s1,-1
ffffffffc0200206:	b759                	j	ffffffffc020018c <readline+0x38>

ffffffffc0200208 <__panic>:
ffffffffc0200208:	00019317          	auipc	t1,0x19
ffffffffc020020c:	2b830313          	addi	t1,t1,696 # ffffffffc02194c0 <is_panic>
ffffffffc0200210:	00033e03          	ld	t3,0(t1)
ffffffffc0200214:	715d                	addi	sp,sp,-80
ffffffffc0200216:	ec06                	sd	ra,24(sp)
ffffffffc0200218:	e822                	sd	s0,16(sp)
ffffffffc020021a:	f436                	sd	a3,40(sp)
ffffffffc020021c:	f83a                	sd	a4,48(sp)
ffffffffc020021e:	fc3e                	sd	a5,56(sp)
ffffffffc0200220:	e0c2                	sd	a6,64(sp)
ffffffffc0200222:	e4c6                	sd	a7,72(sp)
ffffffffc0200224:	020e1a63          	bnez	t3,ffffffffc0200258 <__panic+0x50>
ffffffffc0200228:	4785                	li	a5,1
ffffffffc020022a:	00f33023          	sd	a5,0(t1)
ffffffffc020022e:	8432                	mv	s0,a2
ffffffffc0200230:	103c                	addi	a5,sp,40
ffffffffc0200232:	862e                	mv	a2,a1
ffffffffc0200234:	85aa                	mv	a1,a0
ffffffffc0200236:	00008517          	auipc	a0,0x8
ffffffffc020023a:	d1250513          	addi	a0,a0,-750 # ffffffffc0207f48 <etext+0x2e>
ffffffffc020023e:	e43e                	sd	a5,8(sp)
ffffffffc0200240:	e8dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200244:	65a2                	ld	a1,8(sp)
ffffffffc0200246:	8522                	mv	a0,s0
ffffffffc0200248:	e65ff0ef          	jal	ra,ffffffffc02000ac <vcprintf>
ffffffffc020024c:	00009517          	auipc	a0,0x9
ffffffffc0200250:	1cc50513          	addi	a0,a0,460 # ffffffffc0209418 <default_pmm_manager+0x228>
ffffffffc0200254:	e79ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200258:	4501                	li	a0,0
ffffffffc020025a:	4581                	li	a1,0
ffffffffc020025c:	4601                	li	a2,0
ffffffffc020025e:	48a1                	li	a7,8
ffffffffc0200260:	00000073          	ecall
ffffffffc0200264:	3d4000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200268:	4501                	li	a0,0
ffffffffc020026a:	174000ef          	jal	ra,ffffffffc02003de <kmonitor>
ffffffffc020026e:	bfed                	j	ffffffffc0200268 <__panic+0x60>

ffffffffc0200270 <__warn>:
ffffffffc0200270:	715d                	addi	sp,sp,-80
ffffffffc0200272:	832e                	mv	t1,a1
ffffffffc0200274:	e822                	sd	s0,16(sp)
ffffffffc0200276:	85aa                	mv	a1,a0
ffffffffc0200278:	8432                	mv	s0,a2
ffffffffc020027a:	fc3e                	sd	a5,56(sp)
ffffffffc020027c:	861a                	mv	a2,t1
ffffffffc020027e:	103c                	addi	a5,sp,40
ffffffffc0200280:	00008517          	auipc	a0,0x8
ffffffffc0200284:	ce850513          	addi	a0,a0,-792 # ffffffffc0207f68 <etext+0x4e>
ffffffffc0200288:	ec06                	sd	ra,24(sp)
ffffffffc020028a:	f436                	sd	a3,40(sp)
ffffffffc020028c:	f83a                	sd	a4,48(sp)
ffffffffc020028e:	e0c2                	sd	a6,64(sp)
ffffffffc0200290:	e4c6                	sd	a7,72(sp)
ffffffffc0200292:	e43e                	sd	a5,8(sp)
ffffffffc0200294:	e39ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200298:	65a2                	ld	a1,8(sp)
ffffffffc020029a:	8522                	mv	a0,s0
ffffffffc020029c:	e11ff0ef          	jal	ra,ffffffffc02000ac <vcprintf>
ffffffffc02002a0:	00009517          	auipc	a0,0x9
ffffffffc02002a4:	17850513          	addi	a0,a0,376 # ffffffffc0209418 <default_pmm_manager+0x228>
ffffffffc02002a8:	e25ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002ac:	60e2                	ld	ra,24(sp)
ffffffffc02002ae:	6442                	ld	s0,16(sp)
ffffffffc02002b0:	6161                	addi	sp,sp,80
ffffffffc02002b2:	8082                	ret

ffffffffc02002b4 <print_kerninfo>:
ffffffffc02002b4:	1141                	addi	sp,sp,-16
ffffffffc02002b6:	00008517          	auipc	a0,0x8
ffffffffc02002ba:	cd250513          	addi	a0,a0,-814 # ffffffffc0207f88 <etext+0x6e>
ffffffffc02002be:	e406                	sd	ra,8(sp)
ffffffffc02002c0:	e0dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002c4:	00000597          	auipc	a1,0x0
ffffffffc02002c8:	d6e58593          	addi	a1,a1,-658 # ffffffffc0200032 <kern_init>
ffffffffc02002cc:	00008517          	auipc	a0,0x8
ffffffffc02002d0:	cdc50513          	addi	a0,a0,-804 # ffffffffc0207fa8 <etext+0x8e>
ffffffffc02002d4:	df9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002d8:	00008597          	auipc	a1,0x8
ffffffffc02002dc:	c4258593          	addi	a1,a1,-958 # ffffffffc0207f1a <etext>
ffffffffc02002e0:	00008517          	auipc	a0,0x8
ffffffffc02002e4:	ce850513          	addi	a0,a0,-792 # ffffffffc0207fc8 <etext+0xae>
ffffffffc02002e8:	de5ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002ec:	0000e597          	auipc	a1,0xe
ffffffffc02002f0:	da458593          	addi	a1,a1,-604 # ffffffffc020e090 <buf>
ffffffffc02002f4:	00008517          	auipc	a0,0x8
ffffffffc02002f8:	cf450513          	addi	a0,a0,-780 # ffffffffc0207fe8 <etext+0xce>
ffffffffc02002fc:	dd1ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200300:	00019597          	auipc	a1,0x19
ffffffffc0200304:	44858593          	addi	a1,a1,1096 # ffffffffc0219748 <end>
ffffffffc0200308:	00008517          	auipc	a0,0x8
ffffffffc020030c:	d0050513          	addi	a0,a0,-768 # ffffffffc0208008 <etext+0xee>
ffffffffc0200310:	dbdff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200314:	0001a597          	auipc	a1,0x1a
ffffffffc0200318:	83358593          	addi	a1,a1,-1997 # ffffffffc0219b47 <end+0x3ff>
ffffffffc020031c:	00000797          	auipc	a5,0x0
ffffffffc0200320:	d1678793          	addi	a5,a5,-746 # ffffffffc0200032 <kern_init>
ffffffffc0200324:	40f587b3          	sub	a5,a1,a5
ffffffffc0200328:	43f7d593          	srai	a1,a5,0x3f
ffffffffc020032c:	60a2                	ld	ra,8(sp)
ffffffffc020032e:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200332:	95be                	add	a1,a1,a5
ffffffffc0200334:	85a9                	srai	a1,a1,0xa
ffffffffc0200336:	00008517          	auipc	a0,0x8
ffffffffc020033a:	cf250513          	addi	a0,a0,-782 # ffffffffc0208028 <etext+0x10e>
ffffffffc020033e:	0141                	addi	sp,sp,16
ffffffffc0200340:	b371                	j	ffffffffc02000cc <cprintf>

ffffffffc0200342 <print_stackframe>:
ffffffffc0200342:	1141                	addi	sp,sp,-16
ffffffffc0200344:	00008617          	auipc	a2,0x8
ffffffffc0200348:	d1460613          	addi	a2,a2,-748 # ffffffffc0208058 <etext+0x13e>
ffffffffc020034c:	05b00593          	li	a1,91
ffffffffc0200350:	00008517          	auipc	a0,0x8
ffffffffc0200354:	d2050513          	addi	a0,a0,-736 # ffffffffc0208070 <etext+0x156>
ffffffffc0200358:	e406                	sd	ra,8(sp)
ffffffffc020035a:	eafff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020035e <mon_help>:
ffffffffc020035e:	1141                	addi	sp,sp,-16
ffffffffc0200360:	00008617          	auipc	a2,0x8
ffffffffc0200364:	d2860613          	addi	a2,a2,-728 # ffffffffc0208088 <etext+0x16e>
ffffffffc0200368:	00008597          	auipc	a1,0x8
ffffffffc020036c:	d4058593          	addi	a1,a1,-704 # ffffffffc02080a8 <etext+0x18e>
ffffffffc0200370:	00008517          	auipc	a0,0x8
ffffffffc0200374:	d4050513          	addi	a0,a0,-704 # ffffffffc02080b0 <etext+0x196>
ffffffffc0200378:	e406                	sd	ra,8(sp)
ffffffffc020037a:	d53ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020037e:	00008617          	auipc	a2,0x8
ffffffffc0200382:	d4260613          	addi	a2,a2,-702 # ffffffffc02080c0 <etext+0x1a6>
ffffffffc0200386:	00008597          	auipc	a1,0x8
ffffffffc020038a:	d6258593          	addi	a1,a1,-670 # ffffffffc02080e8 <etext+0x1ce>
ffffffffc020038e:	00008517          	auipc	a0,0x8
ffffffffc0200392:	d2250513          	addi	a0,a0,-734 # ffffffffc02080b0 <etext+0x196>
ffffffffc0200396:	d37ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020039a:	00008617          	auipc	a2,0x8
ffffffffc020039e:	d5e60613          	addi	a2,a2,-674 # ffffffffc02080f8 <etext+0x1de>
ffffffffc02003a2:	00008597          	auipc	a1,0x8
ffffffffc02003a6:	d7658593          	addi	a1,a1,-650 # ffffffffc0208118 <etext+0x1fe>
ffffffffc02003aa:	00008517          	auipc	a0,0x8
ffffffffc02003ae:	d0650513          	addi	a0,a0,-762 # ffffffffc02080b0 <etext+0x196>
ffffffffc02003b2:	d1bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02003b6:	60a2                	ld	ra,8(sp)
ffffffffc02003b8:	4501                	li	a0,0
ffffffffc02003ba:	0141                	addi	sp,sp,16
ffffffffc02003bc:	8082                	ret

ffffffffc02003be <mon_kerninfo>:
ffffffffc02003be:	1141                	addi	sp,sp,-16
ffffffffc02003c0:	e406                	sd	ra,8(sp)
ffffffffc02003c2:	ef3ff0ef          	jal	ra,ffffffffc02002b4 <print_kerninfo>
ffffffffc02003c6:	60a2                	ld	ra,8(sp)
ffffffffc02003c8:	4501                	li	a0,0
ffffffffc02003ca:	0141                	addi	sp,sp,16
ffffffffc02003cc:	8082                	ret

ffffffffc02003ce <mon_backtrace>:
ffffffffc02003ce:	1141                	addi	sp,sp,-16
ffffffffc02003d0:	e406                	sd	ra,8(sp)
ffffffffc02003d2:	f71ff0ef          	jal	ra,ffffffffc0200342 <print_stackframe>
ffffffffc02003d6:	60a2                	ld	ra,8(sp)
ffffffffc02003d8:	4501                	li	a0,0
ffffffffc02003da:	0141                	addi	sp,sp,16
ffffffffc02003dc:	8082                	ret

ffffffffc02003de <kmonitor>:
ffffffffc02003de:	7115                	addi	sp,sp,-224
ffffffffc02003e0:	e962                	sd	s8,144(sp)
ffffffffc02003e2:	8c2a                	mv	s8,a0
ffffffffc02003e4:	00008517          	auipc	a0,0x8
ffffffffc02003e8:	d4450513          	addi	a0,a0,-700 # ffffffffc0208128 <etext+0x20e>
ffffffffc02003ec:	ed86                	sd	ra,216(sp)
ffffffffc02003ee:	e9a2                	sd	s0,208(sp)
ffffffffc02003f0:	e5a6                	sd	s1,200(sp)
ffffffffc02003f2:	e1ca                	sd	s2,192(sp)
ffffffffc02003f4:	fd4e                	sd	s3,184(sp)
ffffffffc02003f6:	f952                	sd	s4,176(sp)
ffffffffc02003f8:	f556                	sd	s5,168(sp)
ffffffffc02003fa:	f15a                	sd	s6,160(sp)
ffffffffc02003fc:	ed5e                	sd	s7,152(sp)
ffffffffc02003fe:	e566                	sd	s9,136(sp)
ffffffffc0200400:	e16a                	sd	s10,128(sp)
ffffffffc0200402:	ccbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200406:	00008517          	auipc	a0,0x8
ffffffffc020040a:	d4a50513          	addi	a0,a0,-694 # ffffffffc0208150 <etext+0x236>
ffffffffc020040e:	cbfff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200412:	000c0563          	beqz	s8,ffffffffc020041c <kmonitor+0x3e>
ffffffffc0200416:	8562                	mv	a0,s8
ffffffffc0200418:	40e000ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc020041c:	00008c97          	auipc	s9,0x8
ffffffffc0200420:	da4c8c93          	addi	s9,s9,-604 # ffffffffc02081c0 <commands>
ffffffffc0200424:	00008997          	auipc	s3,0x8
ffffffffc0200428:	d5498993          	addi	s3,s3,-684 # ffffffffc0208178 <etext+0x25e>
ffffffffc020042c:	00008917          	auipc	s2,0x8
ffffffffc0200430:	d5490913          	addi	s2,s2,-684 # ffffffffc0208180 <etext+0x266>
ffffffffc0200434:	4a3d                	li	s4,15
ffffffffc0200436:	00008b17          	auipc	s6,0x8
ffffffffc020043a:	d52b0b13          	addi	s6,s6,-686 # ffffffffc0208188 <etext+0x26e>
ffffffffc020043e:	00008a97          	auipc	s5,0x8
ffffffffc0200442:	c6aa8a93          	addi	s5,s5,-918 # ffffffffc02080a8 <etext+0x18e>
ffffffffc0200446:	4b8d                	li	s7,3
ffffffffc0200448:	854e                	mv	a0,s3
ffffffffc020044a:	d0bff0ef          	jal	ra,ffffffffc0200154 <readline>
ffffffffc020044e:	842a                	mv	s0,a0
ffffffffc0200450:	dd65                	beqz	a0,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc0200452:	00054583          	lbu	a1,0(a0)
ffffffffc0200456:	4481                	li	s1,0
ffffffffc0200458:	c999                	beqz	a1,ffffffffc020046e <kmonitor+0x90>
ffffffffc020045a:	854a                	mv	a0,s2
ffffffffc020045c:	67a070ef          	jal	ra,ffffffffc0207ad6 <strchr>
ffffffffc0200460:	c925                	beqz	a0,ffffffffc02004d0 <kmonitor+0xf2>
ffffffffc0200462:	00144583          	lbu	a1,1(s0)
ffffffffc0200466:	00040023          	sb	zero,0(s0)
ffffffffc020046a:	0405                	addi	s0,s0,1
ffffffffc020046c:	f5fd                	bnez	a1,ffffffffc020045a <kmonitor+0x7c>
ffffffffc020046e:	dce9                	beqz	s1,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc0200470:	6582                	ld	a1,0(sp)
ffffffffc0200472:	00008d17          	auipc	s10,0x8
ffffffffc0200476:	d4ed0d13          	addi	s10,s10,-690 # ffffffffc02081c0 <commands>
ffffffffc020047a:	8556                	mv	a0,s5
ffffffffc020047c:	4401                	li	s0,0
ffffffffc020047e:	0d61                	addi	s10,s10,24
ffffffffc0200480:	638070ef          	jal	ra,ffffffffc0207ab8 <strcmp>
ffffffffc0200484:	c919                	beqz	a0,ffffffffc020049a <kmonitor+0xbc>
ffffffffc0200486:	2405                	addiw	s0,s0,1
ffffffffc0200488:	09740463          	beq	s0,s7,ffffffffc0200510 <kmonitor+0x132>
ffffffffc020048c:	000d3503          	ld	a0,0(s10)
ffffffffc0200490:	6582                	ld	a1,0(sp)
ffffffffc0200492:	0d61                	addi	s10,s10,24
ffffffffc0200494:	624070ef          	jal	ra,ffffffffc0207ab8 <strcmp>
ffffffffc0200498:	f57d                	bnez	a0,ffffffffc0200486 <kmonitor+0xa8>
ffffffffc020049a:	00141793          	slli	a5,s0,0x1
ffffffffc020049e:	97a2                	add	a5,a5,s0
ffffffffc02004a0:	078e                	slli	a5,a5,0x3
ffffffffc02004a2:	97e6                	add	a5,a5,s9
ffffffffc02004a4:	6b9c                	ld	a5,16(a5)
ffffffffc02004a6:	8662                	mv	a2,s8
ffffffffc02004a8:	002c                	addi	a1,sp,8
ffffffffc02004aa:	fff4851b          	addiw	a0,s1,-1
ffffffffc02004ae:	9782                	jalr	a5
ffffffffc02004b0:	f8055ce3          	bgez	a0,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc02004b4:	60ee                	ld	ra,216(sp)
ffffffffc02004b6:	644e                	ld	s0,208(sp)
ffffffffc02004b8:	64ae                	ld	s1,200(sp)
ffffffffc02004ba:	690e                	ld	s2,192(sp)
ffffffffc02004bc:	79ea                	ld	s3,184(sp)
ffffffffc02004be:	7a4a                	ld	s4,176(sp)
ffffffffc02004c0:	7aaa                	ld	s5,168(sp)
ffffffffc02004c2:	7b0a                	ld	s6,160(sp)
ffffffffc02004c4:	6bea                	ld	s7,152(sp)
ffffffffc02004c6:	6c4a                	ld	s8,144(sp)
ffffffffc02004c8:	6caa                	ld	s9,136(sp)
ffffffffc02004ca:	6d0a                	ld	s10,128(sp)
ffffffffc02004cc:	612d                	addi	sp,sp,224
ffffffffc02004ce:	8082                	ret
ffffffffc02004d0:	00044783          	lbu	a5,0(s0)
ffffffffc02004d4:	dfc9                	beqz	a5,ffffffffc020046e <kmonitor+0x90>
ffffffffc02004d6:	03448863          	beq	s1,s4,ffffffffc0200506 <kmonitor+0x128>
ffffffffc02004da:	00349793          	slli	a5,s1,0x3
ffffffffc02004de:	0118                	addi	a4,sp,128
ffffffffc02004e0:	97ba                	add	a5,a5,a4
ffffffffc02004e2:	f887b023          	sd	s0,-128(a5)
ffffffffc02004e6:	00044583          	lbu	a1,0(s0)
ffffffffc02004ea:	2485                	addiw	s1,s1,1
ffffffffc02004ec:	e591                	bnez	a1,ffffffffc02004f8 <kmonitor+0x11a>
ffffffffc02004ee:	b749                	j	ffffffffc0200470 <kmonitor+0x92>
ffffffffc02004f0:	00144583          	lbu	a1,1(s0)
ffffffffc02004f4:	0405                	addi	s0,s0,1
ffffffffc02004f6:	ddad                	beqz	a1,ffffffffc0200470 <kmonitor+0x92>
ffffffffc02004f8:	854a                	mv	a0,s2
ffffffffc02004fa:	5dc070ef          	jal	ra,ffffffffc0207ad6 <strchr>
ffffffffc02004fe:	d96d                	beqz	a0,ffffffffc02004f0 <kmonitor+0x112>
ffffffffc0200500:	00044583          	lbu	a1,0(s0)
ffffffffc0200504:	bf91                	j	ffffffffc0200458 <kmonitor+0x7a>
ffffffffc0200506:	45c1                	li	a1,16
ffffffffc0200508:	855a                	mv	a0,s6
ffffffffc020050a:	bc3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020050e:	b7f1                	j	ffffffffc02004da <kmonitor+0xfc>
ffffffffc0200510:	6582                	ld	a1,0(sp)
ffffffffc0200512:	00008517          	auipc	a0,0x8
ffffffffc0200516:	c9650513          	addi	a0,a0,-874 # ffffffffc02081a8 <etext+0x28e>
ffffffffc020051a:	bb3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020051e:	b72d                	j	ffffffffc0200448 <kmonitor+0x6a>

ffffffffc0200520 <ide_init>:
ffffffffc0200520:	8082                	ret

ffffffffc0200522 <ide_device_valid>:
ffffffffc0200522:	00253513          	sltiu	a0,a0,2
ffffffffc0200526:	8082                	ret

ffffffffc0200528 <ide_device_size>:
ffffffffc0200528:	03800513          	li	a0,56
ffffffffc020052c:	8082                	ret

ffffffffc020052e <ide_read_secs>:
ffffffffc020052e:	0000e797          	auipc	a5,0xe
ffffffffc0200532:	f6278793          	addi	a5,a5,-158 # ffffffffc020e490 <ide>
ffffffffc0200536:	0095959b          	slliw	a1,a1,0x9
ffffffffc020053a:	1141                	addi	sp,sp,-16
ffffffffc020053c:	8532                	mv	a0,a2
ffffffffc020053e:	95be                	add	a1,a1,a5
ffffffffc0200540:	00969613          	slli	a2,a3,0x9
ffffffffc0200544:	e406                	sd	ra,8(sp)
ffffffffc0200546:	5b8070ef          	jal	ra,ffffffffc0207afe <memcpy>
ffffffffc020054a:	60a2                	ld	ra,8(sp)
ffffffffc020054c:	4501                	li	a0,0
ffffffffc020054e:	0141                	addi	sp,sp,16
ffffffffc0200550:	8082                	ret

ffffffffc0200552 <ide_write_secs>:
ffffffffc0200552:	0095979b          	slliw	a5,a1,0x9
ffffffffc0200556:	0000e517          	auipc	a0,0xe
ffffffffc020055a:	f3a50513          	addi	a0,a0,-198 # ffffffffc020e490 <ide>
ffffffffc020055e:	1141                	addi	sp,sp,-16
ffffffffc0200560:	85b2                	mv	a1,a2
ffffffffc0200562:	953e                	add	a0,a0,a5
ffffffffc0200564:	00969613          	slli	a2,a3,0x9
ffffffffc0200568:	e406                	sd	ra,8(sp)
ffffffffc020056a:	594070ef          	jal	ra,ffffffffc0207afe <memcpy>
ffffffffc020056e:	60a2                	ld	ra,8(sp)
ffffffffc0200570:	4501                	li	a0,0
ffffffffc0200572:	0141                	addi	sp,sp,16
ffffffffc0200574:	8082                	ret

ffffffffc0200576 <clock_init>:
ffffffffc0200576:	02000793          	li	a5,32
ffffffffc020057a:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc020057e:	c0102573          	rdtime	a0
ffffffffc0200582:	67e1                	lui	a5,0x18
ffffffffc0200584:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc0200588:	953e                	add	a0,a0,a5
ffffffffc020058a:	4581                	li	a1,0
ffffffffc020058c:	4601                	li	a2,0
ffffffffc020058e:	4881                	li	a7,0
ffffffffc0200590:	00000073          	ecall
ffffffffc0200594:	00008517          	auipc	a0,0x8
ffffffffc0200598:	c7450513          	addi	a0,a0,-908 # ffffffffc0208208 <commands+0x48>
ffffffffc020059c:	00019797          	auipc	a5,0x19
ffffffffc02005a0:	f807b623          	sd	zero,-116(a5) # ffffffffc0219528 <ticks>
ffffffffc02005a4:	b625                	j	ffffffffc02000cc <cprintf>

ffffffffc02005a6 <clock_set_next_event>:
ffffffffc02005a6:	c0102573          	rdtime	a0
ffffffffc02005aa:	67e1                	lui	a5,0x18
ffffffffc02005ac:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc02005b0:	953e                	add	a0,a0,a5
ffffffffc02005b2:	4581                	li	a1,0
ffffffffc02005b4:	4601                	li	a2,0
ffffffffc02005b6:	4881                	li	a7,0
ffffffffc02005b8:	00000073          	ecall
ffffffffc02005bc:	8082                	ret

ffffffffc02005be <cons_init>:
ffffffffc02005be:	8082                	ret

ffffffffc02005c0 <cons_putc>:
ffffffffc02005c0:	100027f3          	csrr	a5,sstatus
ffffffffc02005c4:	8b89                	andi	a5,a5,2
ffffffffc02005c6:	0ff57513          	andi	a0,a0,255
ffffffffc02005ca:	e799                	bnez	a5,ffffffffc02005d8 <cons_putc+0x18>
ffffffffc02005cc:	4581                	li	a1,0
ffffffffc02005ce:	4601                	li	a2,0
ffffffffc02005d0:	4885                	li	a7,1
ffffffffc02005d2:	00000073          	ecall
ffffffffc02005d6:	8082                	ret
ffffffffc02005d8:	1101                	addi	sp,sp,-32
ffffffffc02005da:	ec06                	sd	ra,24(sp)
ffffffffc02005dc:	e42a                	sd	a0,8(sp)
ffffffffc02005de:	05a000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02005e2:	6522                	ld	a0,8(sp)
ffffffffc02005e4:	4581                	li	a1,0
ffffffffc02005e6:	4601                	li	a2,0
ffffffffc02005e8:	4885                	li	a7,1
ffffffffc02005ea:	00000073          	ecall
ffffffffc02005ee:	60e2                	ld	ra,24(sp)
ffffffffc02005f0:	6105                	addi	sp,sp,32
ffffffffc02005f2:	a081                	j	ffffffffc0200632 <intr_enable>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	100027f3          	csrr	a5,sstatus
ffffffffc02005f8:	8b89                	andi	a5,a5,2
ffffffffc02005fa:	eb89                	bnez	a5,ffffffffc020060c <cons_getc+0x18>
ffffffffc02005fc:	4501                	li	a0,0
ffffffffc02005fe:	4581                	li	a1,0
ffffffffc0200600:	4601                	li	a2,0
ffffffffc0200602:	4889                	li	a7,2
ffffffffc0200604:	00000073          	ecall
ffffffffc0200608:	2501                	sext.w	a0,a0
ffffffffc020060a:	8082                	ret
ffffffffc020060c:	1101                	addi	sp,sp,-32
ffffffffc020060e:	ec06                	sd	ra,24(sp)
ffffffffc0200610:	028000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200614:	4501                	li	a0,0
ffffffffc0200616:	4581                	li	a1,0
ffffffffc0200618:	4601                	li	a2,0
ffffffffc020061a:	4889                	li	a7,2
ffffffffc020061c:	00000073          	ecall
ffffffffc0200620:	2501                	sext.w	a0,a0
ffffffffc0200622:	e42a                	sd	a0,8(sp)
ffffffffc0200624:	00e000ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0200628:	60e2                	ld	ra,24(sp)
ffffffffc020062a:	6522                	ld	a0,8(sp)
ffffffffc020062c:	6105                	addi	sp,sp,32
ffffffffc020062e:	8082                	ret

ffffffffc0200630 <pic_init>:
ffffffffc0200630:	8082                	ret

ffffffffc0200632 <intr_enable>:
ffffffffc0200632:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200636:	8082                	ret

ffffffffc0200638 <intr_disable>:
ffffffffc0200638:	100177f3          	csrrci	a5,sstatus,2
ffffffffc020063c:	8082                	ret

ffffffffc020063e <idt_init>:
ffffffffc020063e:	14005073          	csrwi	sscratch,0
ffffffffc0200642:	00000797          	auipc	a5,0x0
ffffffffc0200646:	61e78793          	addi	a5,a5,1566 # ffffffffc0200c60 <__alltraps>
ffffffffc020064a:	10579073          	csrw	stvec,a5
ffffffffc020064e:	000407b7          	lui	a5,0x40
ffffffffc0200652:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200656:	8082                	ret

ffffffffc0200658 <print_regs>:
ffffffffc0200658:	610c                	ld	a1,0(a0)
ffffffffc020065a:	1141                	addi	sp,sp,-16
ffffffffc020065c:	e022                	sd	s0,0(sp)
ffffffffc020065e:	842a                	mv	s0,a0
ffffffffc0200660:	00008517          	auipc	a0,0x8
ffffffffc0200664:	bc850513          	addi	a0,a0,-1080 # ffffffffc0208228 <commands+0x68>
ffffffffc0200668:	e406                	sd	ra,8(sp)
ffffffffc020066a:	a63ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020066e:	640c                	ld	a1,8(s0)
ffffffffc0200670:	00008517          	auipc	a0,0x8
ffffffffc0200674:	bd050513          	addi	a0,a0,-1072 # ffffffffc0208240 <commands+0x80>
ffffffffc0200678:	a55ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020067c:	680c                	ld	a1,16(s0)
ffffffffc020067e:	00008517          	auipc	a0,0x8
ffffffffc0200682:	bda50513          	addi	a0,a0,-1062 # ffffffffc0208258 <commands+0x98>
ffffffffc0200686:	a47ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020068a:	6c0c                	ld	a1,24(s0)
ffffffffc020068c:	00008517          	auipc	a0,0x8
ffffffffc0200690:	be450513          	addi	a0,a0,-1052 # ffffffffc0208270 <commands+0xb0>
ffffffffc0200694:	a39ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200698:	700c                	ld	a1,32(s0)
ffffffffc020069a:	00008517          	auipc	a0,0x8
ffffffffc020069e:	bee50513          	addi	a0,a0,-1042 # ffffffffc0208288 <commands+0xc8>
ffffffffc02006a2:	a2bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006a6:	740c                	ld	a1,40(s0)
ffffffffc02006a8:	00008517          	auipc	a0,0x8
ffffffffc02006ac:	bf850513          	addi	a0,a0,-1032 # ffffffffc02082a0 <commands+0xe0>
ffffffffc02006b0:	a1dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006b4:	780c                	ld	a1,48(s0)
ffffffffc02006b6:	00008517          	auipc	a0,0x8
ffffffffc02006ba:	c0250513          	addi	a0,a0,-1022 # ffffffffc02082b8 <commands+0xf8>
ffffffffc02006be:	a0fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006c2:	7c0c                	ld	a1,56(s0)
ffffffffc02006c4:	00008517          	auipc	a0,0x8
ffffffffc02006c8:	c0c50513          	addi	a0,a0,-1012 # ffffffffc02082d0 <commands+0x110>
ffffffffc02006cc:	a01ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006d0:	602c                	ld	a1,64(s0)
ffffffffc02006d2:	00008517          	auipc	a0,0x8
ffffffffc02006d6:	c1650513          	addi	a0,a0,-1002 # ffffffffc02082e8 <commands+0x128>
ffffffffc02006da:	9f3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006de:	642c                	ld	a1,72(s0)
ffffffffc02006e0:	00008517          	auipc	a0,0x8
ffffffffc02006e4:	c2050513          	addi	a0,a0,-992 # ffffffffc0208300 <commands+0x140>
ffffffffc02006e8:	9e5ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006ec:	682c                	ld	a1,80(s0)
ffffffffc02006ee:	00008517          	auipc	a0,0x8
ffffffffc02006f2:	c2a50513          	addi	a0,a0,-982 # ffffffffc0208318 <commands+0x158>
ffffffffc02006f6:	9d7ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006fa:	6c2c                	ld	a1,88(s0)
ffffffffc02006fc:	00008517          	auipc	a0,0x8
ffffffffc0200700:	c3450513          	addi	a0,a0,-972 # ffffffffc0208330 <commands+0x170>
ffffffffc0200704:	9c9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200708:	702c                	ld	a1,96(s0)
ffffffffc020070a:	00008517          	auipc	a0,0x8
ffffffffc020070e:	c3e50513          	addi	a0,a0,-962 # ffffffffc0208348 <commands+0x188>
ffffffffc0200712:	9bbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200716:	742c                	ld	a1,104(s0)
ffffffffc0200718:	00008517          	auipc	a0,0x8
ffffffffc020071c:	c4850513          	addi	a0,a0,-952 # ffffffffc0208360 <commands+0x1a0>
ffffffffc0200720:	9adff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200724:	782c                	ld	a1,112(s0)
ffffffffc0200726:	00008517          	auipc	a0,0x8
ffffffffc020072a:	c5250513          	addi	a0,a0,-942 # ffffffffc0208378 <commands+0x1b8>
ffffffffc020072e:	99fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200732:	7c2c                	ld	a1,120(s0)
ffffffffc0200734:	00008517          	auipc	a0,0x8
ffffffffc0200738:	c5c50513          	addi	a0,a0,-932 # ffffffffc0208390 <commands+0x1d0>
ffffffffc020073c:	991ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200740:	604c                	ld	a1,128(s0)
ffffffffc0200742:	00008517          	auipc	a0,0x8
ffffffffc0200746:	c6650513          	addi	a0,a0,-922 # ffffffffc02083a8 <commands+0x1e8>
ffffffffc020074a:	983ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020074e:	644c                	ld	a1,136(s0)
ffffffffc0200750:	00008517          	auipc	a0,0x8
ffffffffc0200754:	c7050513          	addi	a0,a0,-912 # ffffffffc02083c0 <commands+0x200>
ffffffffc0200758:	975ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020075c:	684c                	ld	a1,144(s0)
ffffffffc020075e:	00008517          	auipc	a0,0x8
ffffffffc0200762:	c7a50513          	addi	a0,a0,-902 # ffffffffc02083d8 <commands+0x218>
ffffffffc0200766:	967ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020076a:	6c4c                	ld	a1,152(s0)
ffffffffc020076c:	00008517          	auipc	a0,0x8
ffffffffc0200770:	c8450513          	addi	a0,a0,-892 # ffffffffc02083f0 <commands+0x230>
ffffffffc0200774:	959ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200778:	704c                	ld	a1,160(s0)
ffffffffc020077a:	00008517          	auipc	a0,0x8
ffffffffc020077e:	c8e50513          	addi	a0,a0,-882 # ffffffffc0208408 <commands+0x248>
ffffffffc0200782:	94bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200786:	744c                	ld	a1,168(s0)
ffffffffc0200788:	00008517          	auipc	a0,0x8
ffffffffc020078c:	c9850513          	addi	a0,a0,-872 # ffffffffc0208420 <commands+0x260>
ffffffffc0200790:	93dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200794:	784c                	ld	a1,176(s0)
ffffffffc0200796:	00008517          	auipc	a0,0x8
ffffffffc020079a:	ca250513          	addi	a0,a0,-862 # ffffffffc0208438 <commands+0x278>
ffffffffc020079e:	92fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007a2:	7c4c                	ld	a1,184(s0)
ffffffffc02007a4:	00008517          	auipc	a0,0x8
ffffffffc02007a8:	cac50513          	addi	a0,a0,-852 # ffffffffc0208450 <commands+0x290>
ffffffffc02007ac:	921ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007b0:	606c                	ld	a1,192(s0)
ffffffffc02007b2:	00008517          	auipc	a0,0x8
ffffffffc02007b6:	cb650513          	addi	a0,a0,-842 # ffffffffc0208468 <commands+0x2a8>
ffffffffc02007ba:	913ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007be:	646c                	ld	a1,200(s0)
ffffffffc02007c0:	00008517          	auipc	a0,0x8
ffffffffc02007c4:	cc050513          	addi	a0,a0,-832 # ffffffffc0208480 <commands+0x2c0>
ffffffffc02007c8:	905ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007cc:	686c                	ld	a1,208(s0)
ffffffffc02007ce:	00008517          	auipc	a0,0x8
ffffffffc02007d2:	cca50513          	addi	a0,a0,-822 # ffffffffc0208498 <commands+0x2d8>
ffffffffc02007d6:	8f7ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007da:	6c6c                	ld	a1,216(s0)
ffffffffc02007dc:	00008517          	auipc	a0,0x8
ffffffffc02007e0:	cd450513          	addi	a0,a0,-812 # ffffffffc02084b0 <commands+0x2f0>
ffffffffc02007e4:	8e9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007e8:	706c                	ld	a1,224(s0)
ffffffffc02007ea:	00008517          	auipc	a0,0x8
ffffffffc02007ee:	cde50513          	addi	a0,a0,-802 # ffffffffc02084c8 <commands+0x308>
ffffffffc02007f2:	8dbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007f6:	746c                	ld	a1,232(s0)
ffffffffc02007f8:	00008517          	auipc	a0,0x8
ffffffffc02007fc:	ce850513          	addi	a0,a0,-792 # ffffffffc02084e0 <commands+0x320>
ffffffffc0200800:	8cdff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200804:	786c                	ld	a1,240(s0)
ffffffffc0200806:	00008517          	auipc	a0,0x8
ffffffffc020080a:	cf250513          	addi	a0,a0,-782 # ffffffffc02084f8 <commands+0x338>
ffffffffc020080e:	8bfff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200812:	7c6c                	ld	a1,248(s0)
ffffffffc0200814:	6402                	ld	s0,0(sp)
ffffffffc0200816:	60a2                	ld	ra,8(sp)
ffffffffc0200818:	00008517          	auipc	a0,0x8
ffffffffc020081c:	cf850513          	addi	a0,a0,-776 # ffffffffc0208510 <commands+0x350>
ffffffffc0200820:	0141                	addi	sp,sp,16
ffffffffc0200822:	8abff06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0200826 <print_trapframe>:
ffffffffc0200826:	1141                	addi	sp,sp,-16
ffffffffc0200828:	e022                	sd	s0,0(sp)
ffffffffc020082a:	85aa                	mv	a1,a0
ffffffffc020082c:	842a                	mv	s0,a0
ffffffffc020082e:	00008517          	auipc	a0,0x8
ffffffffc0200832:	cfa50513          	addi	a0,a0,-774 # ffffffffc0208528 <commands+0x368>
ffffffffc0200836:	e406                	sd	ra,8(sp)
ffffffffc0200838:	895ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020083c:	8522                	mv	a0,s0
ffffffffc020083e:	e1bff0ef          	jal	ra,ffffffffc0200658 <print_regs>
ffffffffc0200842:	10043583          	ld	a1,256(s0)
ffffffffc0200846:	00008517          	auipc	a0,0x8
ffffffffc020084a:	cfa50513          	addi	a0,a0,-774 # ffffffffc0208540 <commands+0x380>
ffffffffc020084e:	87fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200852:	10843583          	ld	a1,264(s0)
ffffffffc0200856:	00008517          	auipc	a0,0x8
ffffffffc020085a:	d0250513          	addi	a0,a0,-766 # ffffffffc0208558 <commands+0x398>
ffffffffc020085e:	86fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200862:	11043583          	ld	a1,272(s0)
ffffffffc0200866:	00008517          	auipc	a0,0x8
ffffffffc020086a:	d0a50513          	addi	a0,a0,-758 # ffffffffc0208570 <commands+0x3b0>
ffffffffc020086e:	85fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200872:	11843583          	ld	a1,280(s0)
ffffffffc0200876:	6402                	ld	s0,0(sp)
ffffffffc0200878:	60a2                	ld	ra,8(sp)
ffffffffc020087a:	00008517          	auipc	a0,0x8
ffffffffc020087e:	d0650513          	addi	a0,a0,-762 # ffffffffc0208580 <commands+0x3c0>
ffffffffc0200882:	0141                	addi	sp,sp,16
ffffffffc0200884:	849ff06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0200888 <pgfault_handler>:
ffffffffc0200888:	1101                	addi	sp,sp,-32
ffffffffc020088a:	e426                	sd	s1,8(sp)
ffffffffc020088c:	00019497          	auipc	s1,0x19
ffffffffc0200890:	ca448493          	addi	s1,s1,-860 # ffffffffc0219530 <check_mm_struct>
ffffffffc0200894:	609c                	ld	a5,0(s1)
ffffffffc0200896:	e822                	sd	s0,16(sp)
ffffffffc0200898:	ec06                	sd	ra,24(sp)
ffffffffc020089a:	842a                	mv	s0,a0
ffffffffc020089c:	cbad                	beqz	a5,ffffffffc020090e <pgfault_handler+0x86>
ffffffffc020089e:	10053783          	ld	a5,256(a0)
ffffffffc02008a2:	11053583          	ld	a1,272(a0)
ffffffffc02008a6:	04b00613          	li	a2,75
ffffffffc02008aa:	1007f793          	andi	a5,a5,256
ffffffffc02008ae:	c7b1                	beqz	a5,ffffffffc02008fa <pgfault_handler+0x72>
ffffffffc02008b0:	11843703          	ld	a4,280(s0)
ffffffffc02008b4:	47bd                	li	a5,15
ffffffffc02008b6:	05700693          	li	a3,87
ffffffffc02008ba:	00f70463          	beq	a4,a5,ffffffffc02008c2 <pgfault_handler+0x3a>
ffffffffc02008be:	05200693          	li	a3,82
ffffffffc02008c2:	00008517          	auipc	a0,0x8
ffffffffc02008c6:	cd650513          	addi	a0,a0,-810 # ffffffffc0208598 <commands+0x3d8>
ffffffffc02008ca:	803ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02008ce:	6088                	ld	a0,0(s1)
ffffffffc02008d0:	cd1d                	beqz	a0,ffffffffc020090e <pgfault_handler+0x86>
ffffffffc02008d2:	00019717          	auipc	a4,0x19
ffffffffc02008d6:	c2673703          	ld	a4,-986(a4) # ffffffffc02194f8 <current>
ffffffffc02008da:	00019797          	auipc	a5,0x19
ffffffffc02008de:	c267b783          	ld	a5,-986(a5) # ffffffffc0219500 <idleproc>
ffffffffc02008e2:	04f71663          	bne	a4,a5,ffffffffc020092e <pgfault_handler+0xa6>
ffffffffc02008e6:	11043603          	ld	a2,272(s0)
ffffffffc02008ea:	11843583          	ld	a1,280(s0)
ffffffffc02008ee:	6442                	ld	s0,16(sp)
ffffffffc02008f0:	60e2                	ld	ra,24(sp)
ffffffffc02008f2:	64a2                	ld	s1,8(sp)
ffffffffc02008f4:	6105                	addi	sp,sp,32
ffffffffc02008f6:	7ce0006f          	j	ffffffffc02010c4 <do_pgfault>
ffffffffc02008fa:	11843703          	ld	a4,280(s0)
ffffffffc02008fe:	47bd                	li	a5,15
ffffffffc0200900:	05500613          	li	a2,85
ffffffffc0200904:	05700693          	li	a3,87
ffffffffc0200908:	faf71be3          	bne	a4,a5,ffffffffc02008be <pgfault_handler+0x36>
ffffffffc020090c:	bf5d                	j	ffffffffc02008c2 <pgfault_handler+0x3a>
ffffffffc020090e:	00019797          	auipc	a5,0x19
ffffffffc0200912:	bea7b783          	ld	a5,-1046(a5) # ffffffffc02194f8 <current>
ffffffffc0200916:	cf85                	beqz	a5,ffffffffc020094e <pgfault_handler+0xc6>
ffffffffc0200918:	11043603          	ld	a2,272(s0)
ffffffffc020091c:	11843583          	ld	a1,280(s0)
ffffffffc0200920:	6442                	ld	s0,16(sp)
ffffffffc0200922:	60e2                	ld	ra,24(sp)
ffffffffc0200924:	64a2                	ld	s1,8(sp)
ffffffffc0200926:	7788                	ld	a0,40(a5)
ffffffffc0200928:	6105                	addi	sp,sp,32
ffffffffc020092a:	79a0006f          	j	ffffffffc02010c4 <do_pgfault>
ffffffffc020092e:	00008697          	auipc	a3,0x8
ffffffffc0200932:	c8a68693          	addi	a3,a3,-886 # ffffffffc02085b8 <commands+0x3f8>
ffffffffc0200936:	00008617          	auipc	a2,0x8
ffffffffc020093a:	c9a60613          	addi	a2,a2,-870 # ffffffffc02085d0 <commands+0x410>
ffffffffc020093e:	06c00593          	li	a1,108
ffffffffc0200942:	00008517          	auipc	a0,0x8
ffffffffc0200946:	ca650513          	addi	a0,a0,-858 # ffffffffc02085e8 <commands+0x428>
ffffffffc020094a:	8bfff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020094e:	8522                	mv	a0,s0
ffffffffc0200950:	ed7ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200954:	10043783          	ld	a5,256(s0)
ffffffffc0200958:	11043583          	ld	a1,272(s0)
ffffffffc020095c:	04b00613          	li	a2,75
ffffffffc0200960:	1007f793          	andi	a5,a5,256
ffffffffc0200964:	e399                	bnez	a5,ffffffffc020096a <pgfault_handler+0xe2>
ffffffffc0200966:	05500613          	li	a2,85
ffffffffc020096a:	11843703          	ld	a4,280(s0)
ffffffffc020096e:	47bd                	li	a5,15
ffffffffc0200970:	02f70663          	beq	a4,a5,ffffffffc020099c <pgfault_handler+0x114>
ffffffffc0200974:	05200693          	li	a3,82
ffffffffc0200978:	00008517          	auipc	a0,0x8
ffffffffc020097c:	c2050513          	addi	a0,a0,-992 # ffffffffc0208598 <commands+0x3d8>
ffffffffc0200980:	f4cff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200984:	00008617          	auipc	a2,0x8
ffffffffc0200988:	c7c60613          	addi	a2,a2,-900 # ffffffffc0208600 <commands+0x440>
ffffffffc020098c:	07300593          	li	a1,115
ffffffffc0200990:	00008517          	auipc	a0,0x8
ffffffffc0200994:	c5850513          	addi	a0,a0,-936 # ffffffffc02085e8 <commands+0x428>
ffffffffc0200998:	871ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020099c:	05700693          	li	a3,87
ffffffffc02009a0:	bfe1                	j	ffffffffc0200978 <pgfault_handler+0xf0>

ffffffffc02009a2 <interrupt_handler>:
ffffffffc02009a2:	11853783          	ld	a5,280(a0)
ffffffffc02009a6:	472d                	li	a4,11
ffffffffc02009a8:	0786                	slli	a5,a5,0x1
ffffffffc02009aa:	8385                	srli	a5,a5,0x1
ffffffffc02009ac:	06f76863          	bltu	a4,a5,ffffffffc0200a1c <interrupt_handler+0x7a>
ffffffffc02009b0:	00008717          	auipc	a4,0x8
ffffffffc02009b4:	d0870713          	addi	a4,a4,-760 # ffffffffc02086b8 <commands+0x4f8>
ffffffffc02009b8:	078a                	slli	a5,a5,0x2
ffffffffc02009ba:	97ba                	add	a5,a5,a4
ffffffffc02009bc:	439c                	lw	a5,0(a5)
ffffffffc02009be:	97ba                	add	a5,a5,a4
ffffffffc02009c0:	8782                	jr	a5
ffffffffc02009c2:	00008517          	auipc	a0,0x8
ffffffffc02009c6:	cb650513          	addi	a0,a0,-842 # ffffffffc0208678 <commands+0x4b8>
ffffffffc02009ca:	f02ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009ce:	00008517          	auipc	a0,0x8
ffffffffc02009d2:	c8a50513          	addi	a0,a0,-886 # ffffffffc0208658 <commands+0x498>
ffffffffc02009d6:	ef6ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009da:	00008517          	auipc	a0,0x8
ffffffffc02009de:	c3e50513          	addi	a0,a0,-962 # ffffffffc0208618 <commands+0x458>
ffffffffc02009e2:	eeaff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009e6:	00008517          	auipc	a0,0x8
ffffffffc02009ea:	c5250513          	addi	a0,a0,-942 # ffffffffc0208638 <commands+0x478>
ffffffffc02009ee:	edeff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009f2:	1141                	addi	sp,sp,-16
ffffffffc02009f4:	e406                	sd	ra,8(sp)
ffffffffc02009f6:	bb1ff0ef          	jal	ra,ffffffffc02005a6 <clock_set_next_event>
ffffffffc02009fa:	00019717          	auipc	a4,0x19
ffffffffc02009fe:	b2e70713          	addi	a4,a4,-1234 # ffffffffc0219528 <ticks>
ffffffffc0200a02:	631c                	ld	a5,0(a4)
ffffffffc0200a04:	60a2                	ld	ra,8(sp)
ffffffffc0200a06:	0785                	addi	a5,a5,1
ffffffffc0200a08:	e31c                	sd	a5,0(a4)
ffffffffc0200a0a:	0141                	addi	sp,sp,16
ffffffffc0200a0c:	26c0406f          	j	ffffffffc0204c78 <run_timer_list>
ffffffffc0200a10:	00008517          	auipc	a0,0x8
ffffffffc0200a14:	c8850513          	addi	a0,a0,-888 # ffffffffc0208698 <commands+0x4d8>
ffffffffc0200a18:	eb4ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc0200a1c:	b529                	j	ffffffffc0200826 <print_trapframe>

ffffffffc0200a1e <exception_handler>:
ffffffffc0200a1e:	11853783          	ld	a5,280(a0)
ffffffffc0200a22:	1101                	addi	sp,sp,-32
ffffffffc0200a24:	e822                	sd	s0,16(sp)
ffffffffc0200a26:	ec06                	sd	ra,24(sp)
ffffffffc0200a28:	e426                	sd	s1,8(sp)
ffffffffc0200a2a:	473d                	li	a4,15
ffffffffc0200a2c:	842a                	mv	s0,a0
ffffffffc0200a2e:	16f76163          	bltu	a4,a5,ffffffffc0200b90 <exception_handler+0x172>
ffffffffc0200a32:	00008717          	auipc	a4,0x8
ffffffffc0200a36:	e4e70713          	addi	a4,a4,-434 # ffffffffc0208880 <commands+0x6c0>
ffffffffc0200a3a:	078a                	slli	a5,a5,0x2
ffffffffc0200a3c:	97ba                	add	a5,a5,a4
ffffffffc0200a3e:	439c                	lw	a5,0(a5)
ffffffffc0200a40:	97ba                	add	a5,a5,a4
ffffffffc0200a42:	8782                	jr	a5
ffffffffc0200a44:	00008517          	auipc	a0,0x8
ffffffffc0200a48:	d9450513          	addi	a0,a0,-620 # ffffffffc02087d8 <commands+0x618>
ffffffffc0200a4c:	e80ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200a50:	10843783          	ld	a5,264(s0)
ffffffffc0200a54:	60e2                	ld	ra,24(sp)
ffffffffc0200a56:	64a2                	ld	s1,8(sp)
ffffffffc0200a58:	0791                	addi	a5,a5,4
ffffffffc0200a5a:	10f43423          	sd	a5,264(s0)
ffffffffc0200a5e:	6442                	ld	s0,16(sp)
ffffffffc0200a60:	6105                	addi	sp,sp,32
ffffffffc0200a62:	7b90606f          	j	ffffffffc0207a1a <syscall>
ffffffffc0200a66:	00008517          	auipc	a0,0x8
ffffffffc0200a6a:	d9250513          	addi	a0,a0,-622 # ffffffffc02087f8 <commands+0x638>
ffffffffc0200a6e:	6442                	ld	s0,16(sp)
ffffffffc0200a70:	60e2                	ld	ra,24(sp)
ffffffffc0200a72:	64a2                	ld	s1,8(sp)
ffffffffc0200a74:	6105                	addi	sp,sp,32
ffffffffc0200a76:	e56ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc0200a7a:	00008517          	auipc	a0,0x8
ffffffffc0200a7e:	d9e50513          	addi	a0,a0,-610 # ffffffffc0208818 <commands+0x658>
ffffffffc0200a82:	b7f5                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200a84:	00008517          	auipc	a0,0x8
ffffffffc0200a88:	db450513          	addi	a0,a0,-588 # ffffffffc0208838 <commands+0x678>
ffffffffc0200a8c:	b7cd                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200a8e:	00008517          	auipc	a0,0x8
ffffffffc0200a92:	dc250513          	addi	a0,a0,-574 # ffffffffc0208850 <commands+0x690>
ffffffffc0200a96:	e36ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200a9a:	8522                	mv	a0,s0
ffffffffc0200a9c:	dedff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200aa0:	84aa                	mv	s1,a0
ffffffffc0200aa2:	10051963          	bnez	a0,ffffffffc0200bb4 <exception_handler+0x196>
ffffffffc0200aa6:	60e2                	ld	ra,24(sp)
ffffffffc0200aa8:	6442                	ld	s0,16(sp)
ffffffffc0200aaa:	64a2                	ld	s1,8(sp)
ffffffffc0200aac:	6105                	addi	sp,sp,32
ffffffffc0200aae:	8082                	ret
ffffffffc0200ab0:	00008517          	auipc	a0,0x8
ffffffffc0200ab4:	db850513          	addi	a0,a0,-584 # ffffffffc0208868 <commands+0x6a8>
ffffffffc0200ab8:	e14ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200abc:	8522                	mv	a0,s0
ffffffffc0200abe:	dcbff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200ac2:	84aa                	mv	s1,a0
ffffffffc0200ac4:	d16d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200ac6:	8522                	mv	a0,s0
ffffffffc0200ac8:	d5fff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200acc:	86a6                	mv	a3,s1
ffffffffc0200ace:	00008617          	auipc	a2,0x8
ffffffffc0200ad2:	cba60613          	addi	a2,a2,-838 # ffffffffc0208788 <commands+0x5c8>
ffffffffc0200ad6:	0f600593          	li	a1,246
ffffffffc0200ada:	00008517          	auipc	a0,0x8
ffffffffc0200ade:	b0e50513          	addi	a0,a0,-1266 # ffffffffc02085e8 <commands+0x428>
ffffffffc0200ae2:	f26ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200ae6:	00008517          	auipc	a0,0x8
ffffffffc0200aea:	c0250513          	addi	a0,a0,-1022 # ffffffffc02086e8 <commands+0x528>
ffffffffc0200aee:	b741                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200af0:	00008517          	auipc	a0,0x8
ffffffffc0200af4:	c1850513          	addi	a0,a0,-1000 # ffffffffc0208708 <commands+0x548>
ffffffffc0200af8:	bf9d                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200afa:	00008517          	auipc	a0,0x8
ffffffffc0200afe:	c2e50513          	addi	a0,a0,-978 # ffffffffc0208728 <commands+0x568>
ffffffffc0200b02:	b7b5                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200b04:	00008517          	auipc	a0,0x8
ffffffffc0200b08:	c3c50513          	addi	a0,a0,-964 # ffffffffc0208740 <commands+0x580>
ffffffffc0200b0c:	dc0ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b10:	6458                	ld	a4,136(s0)
ffffffffc0200b12:	47a9                	li	a5,10
ffffffffc0200b14:	f8f719e3          	bne	a4,a5,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b18:	bf25                	j	ffffffffc0200a50 <exception_handler+0x32>
ffffffffc0200b1a:	00008517          	auipc	a0,0x8
ffffffffc0200b1e:	c3650513          	addi	a0,a0,-970 # ffffffffc0208750 <commands+0x590>
ffffffffc0200b22:	b7b1                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200b24:	00008517          	auipc	a0,0x8
ffffffffc0200b28:	c4c50513          	addi	a0,a0,-948 # ffffffffc0208770 <commands+0x5b0>
ffffffffc0200b2c:	da0ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b30:	8522                	mv	a0,s0
ffffffffc0200b32:	d57ff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200b36:	84aa                	mv	s1,a0
ffffffffc0200b38:	d53d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b3a:	8522                	mv	a0,s0
ffffffffc0200b3c:	cebff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200b40:	86a6                	mv	a3,s1
ffffffffc0200b42:	00008617          	auipc	a2,0x8
ffffffffc0200b46:	c4660613          	addi	a2,a2,-954 # ffffffffc0208788 <commands+0x5c8>
ffffffffc0200b4a:	0cb00593          	li	a1,203
ffffffffc0200b4e:	00008517          	auipc	a0,0x8
ffffffffc0200b52:	a9a50513          	addi	a0,a0,-1382 # ffffffffc02085e8 <commands+0x428>
ffffffffc0200b56:	eb2ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200b5a:	00008517          	auipc	a0,0x8
ffffffffc0200b5e:	c6650513          	addi	a0,a0,-922 # ffffffffc02087c0 <commands+0x600>
ffffffffc0200b62:	d6aff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b66:	8522                	mv	a0,s0
ffffffffc0200b68:	d21ff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200b6c:	84aa                	mv	s1,a0
ffffffffc0200b6e:	dd05                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b70:	8522                	mv	a0,s0
ffffffffc0200b72:	cb5ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200b76:	86a6                	mv	a3,s1
ffffffffc0200b78:	00008617          	auipc	a2,0x8
ffffffffc0200b7c:	c1060613          	addi	a2,a2,-1008 # ffffffffc0208788 <commands+0x5c8>
ffffffffc0200b80:	0d500593          	li	a1,213
ffffffffc0200b84:	00008517          	auipc	a0,0x8
ffffffffc0200b88:	a6450513          	addi	a0,a0,-1436 # ffffffffc02085e8 <commands+0x428>
ffffffffc0200b8c:	e7cff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200b90:	8522                	mv	a0,s0
ffffffffc0200b92:	6442                	ld	s0,16(sp)
ffffffffc0200b94:	60e2                	ld	ra,24(sp)
ffffffffc0200b96:	64a2                	ld	s1,8(sp)
ffffffffc0200b98:	6105                	addi	sp,sp,32
ffffffffc0200b9a:	b171                	j	ffffffffc0200826 <print_trapframe>
ffffffffc0200b9c:	00008617          	auipc	a2,0x8
ffffffffc0200ba0:	c0c60613          	addi	a2,a2,-1012 # ffffffffc02087a8 <commands+0x5e8>
ffffffffc0200ba4:	0cf00593          	li	a1,207
ffffffffc0200ba8:	00008517          	auipc	a0,0x8
ffffffffc0200bac:	a4050513          	addi	a0,a0,-1472 # ffffffffc02085e8 <commands+0x428>
ffffffffc0200bb0:	e58ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200bb4:	8522                	mv	a0,s0
ffffffffc0200bb6:	c71ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200bba:	86a6                	mv	a3,s1
ffffffffc0200bbc:	00008617          	auipc	a2,0x8
ffffffffc0200bc0:	bcc60613          	addi	a2,a2,-1076 # ffffffffc0208788 <commands+0x5c8>
ffffffffc0200bc4:	0ef00593          	li	a1,239
ffffffffc0200bc8:	00008517          	auipc	a0,0x8
ffffffffc0200bcc:	a2050513          	addi	a0,a0,-1504 # ffffffffc02085e8 <commands+0x428>
ffffffffc0200bd0:	e38ff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200bd4 <trap>:
ffffffffc0200bd4:	1101                	addi	sp,sp,-32
ffffffffc0200bd6:	e822                	sd	s0,16(sp)
ffffffffc0200bd8:	00019417          	auipc	s0,0x19
ffffffffc0200bdc:	92040413          	addi	s0,s0,-1760 # ffffffffc02194f8 <current>
ffffffffc0200be0:	6018                	ld	a4,0(s0)
ffffffffc0200be2:	ec06                	sd	ra,24(sp)
ffffffffc0200be4:	e426                	sd	s1,8(sp)
ffffffffc0200be6:	e04a                	sd	s2,0(sp)
ffffffffc0200be8:	11853683          	ld	a3,280(a0)
ffffffffc0200bec:	cf1d                	beqz	a4,ffffffffc0200c2a <trap+0x56>
ffffffffc0200bee:	10053483          	ld	s1,256(a0)
ffffffffc0200bf2:	0a073903          	ld	s2,160(a4)
ffffffffc0200bf6:	f348                	sd	a0,160(a4)
ffffffffc0200bf8:	1004f493          	andi	s1,s1,256
ffffffffc0200bfc:	0206c463          	bltz	a3,ffffffffc0200c24 <trap+0x50>
ffffffffc0200c00:	e1fff0ef          	jal	ra,ffffffffc0200a1e <exception_handler>
ffffffffc0200c04:	601c                	ld	a5,0(s0)
ffffffffc0200c06:	0b27b023          	sd	s2,160(a5)
ffffffffc0200c0a:	e499                	bnez	s1,ffffffffc0200c18 <trap+0x44>
ffffffffc0200c0c:	0b07a703          	lw	a4,176(a5)
ffffffffc0200c10:	8b05                	andi	a4,a4,1
ffffffffc0200c12:	e329                	bnez	a4,ffffffffc0200c54 <trap+0x80>
ffffffffc0200c14:	6f9c                	ld	a5,24(a5)
ffffffffc0200c16:	eb85                	bnez	a5,ffffffffc0200c46 <trap+0x72>
ffffffffc0200c18:	60e2                	ld	ra,24(sp)
ffffffffc0200c1a:	6442                	ld	s0,16(sp)
ffffffffc0200c1c:	64a2                	ld	s1,8(sp)
ffffffffc0200c1e:	6902                	ld	s2,0(sp)
ffffffffc0200c20:	6105                	addi	sp,sp,32
ffffffffc0200c22:	8082                	ret
ffffffffc0200c24:	d7fff0ef          	jal	ra,ffffffffc02009a2 <interrupt_handler>
ffffffffc0200c28:	bff1                	j	ffffffffc0200c04 <trap+0x30>
ffffffffc0200c2a:	0006c863          	bltz	a3,ffffffffc0200c3a <trap+0x66>
ffffffffc0200c2e:	6442                	ld	s0,16(sp)
ffffffffc0200c30:	60e2                	ld	ra,24(sp)
ffffffffc0200c32:	64a2                	ld	s1,8(sp)
ffffffffc0200c34:	6902                	ld	s2,0(sp)
ffffffffc0200c36:	6105                	addi	sp,sp,32
ffffffffc0200c38:	b3dd                	j	ffffffffc0200a1e <exception_handler>
ffffffffc0200c3a:	6442                	ld	s0,16(sp)
ffffffffc0200c3c:	60e2                	ld	ra,24(sp)
ffffffffc0200c3e:	64a2                	ld	s1,8(sp)
ffffffffc0200c40:	6902                	ld	s2,0(sp)
ffffffffc0200c42:	6105                	addi	sp,sp,32
ffffffffc0200c44:	bbb9                	j	ffffffffc02009a2 <interrupt_handler>
ffffffffc0200c46:	6442                	ld	s0,16(sp)
ffffffffc0200c48:	60e2                	ld	ra,24(sp)
ffffffffc0200c4a:	64a2                	ld	s1,8(sp)
ffffffffc0200c4c:	6902                	ld	s2,0(sp)
ffffffffc0200c4e:	6105                	addi	sp,sp,32
ffffffffc0200c50:	6170306f          	j	ffffffffc0204a66 <schedule>
ffffffffc0200c54:	555d                	li	a0,-9
ffffffffc0200c56:	096030ef          	jal	ra,ffffffffc0203cec <do_exit>
ffffffffc0200c5a:	601c                	ld	a5,0(s0)
ffffffffc0200c5c:	bf65                	j	ffffffffc0200c14 <trap+0x40>
	...

ffffffffc0200c60 <__alltraps>:
ffffffffc0200c60:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0200c64:	00011463          	bnez	sp,ffffffffc0200c6c <__alltraps+0xc>
ffffffffc0200c68:	14002173          	csrr	sp,sscratch
ffffffffc0200c6c:	712d                	addi	sp,sp,-288
ffffffffc0200c6e:	e002                	sd	zero,0(sp)
ffffffffc0200c70:	e406                	sd	ra,8(sp)
ffffffffc0200c72:	ec0e                	sd	gp,24(sp)
ffffffffc0200c74:	f012                	sd	tp,32(sp)
ffffffffc0200c76:	f416                	sd	t0,40(sp)
ffffffffc0200c78:	f81a                	sd	t1,48(sp)
ffffffffc0200c7a:	fc1e                	sd	t2,56(sp)
ffffffffc0200c7c:	e0a2                	sd	s0,64(sp)
ffffffffc0200c7e:	e4a6                	sd	s1,72(sp)
ffffffffc0200c80:	e8aa                	sd	a0,80(sp)
ffffffffc0200c82:	ecae                	sd	a1,88(sp)
ffffffffc0200c84:	f0b2                	sd	a2,96(sp)
ffffffffc0200c86:	f4b6                	sd	a3,104(sp)
ffffffffc0200c88:	f8ba                	sd	a4,112(sp)
ffffffffc0200c8a:	fcbe                	sd	a5,120(sp)
ffffffffc0200c8c:	e142                	sd	a6,128(sp)
ffffffffc0200c8e:	e546                	sd	a7,136(sp)
ffffffffc0200c90:	e94a                	sd	s2,144(sp)
ffffffffc0200c92:	ed4e                	sd	s3,152(sp)
ffffffffc0200c94:	f152                	sd	s4,160(sp)
ffffffffc0200c96:	f556                	sd	s5,168(sp)
ffffffffc0200c98:	f95a                	sd	s6,176(sp)
ffffffffc0200c9a:	fd5e                	sd	s7,184(sp)
ffffffffc0200c9c:	e1e2                	sd	s8,192(sp)
ffffffffc0200c9e:	e5e6                	sd	s9,200(sp)
ffffffffc0200ca0:	e9ea                	sd	s10,208(sp)
ffffffffc0200ca2:	edee                	sd	s11,216(sp)
ffffffffc0200ca4:	f1f2                	sd	t3,224(sp)
ffffffffc0200ca6:	f5f6                	sd	t4,232(sp)
ffffffffc0200ca8:	f9fa                	sd	t5,240(sp)
ffffffffc0200caa:	fdfe                	sd	t6,248(sp)
ffffffffc0200cac:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200cb0:	100024f3          	csrr	s1,sstatus
ffffffffc0200cb4:	14102973          	csrr	s2,sepc
ffffffffc0200cb8:	143029f3          	csrr	s3,stval
ffffffffc0200cbc:	14202a73          	csrr	s4,scause
ffffffffc0200cc0:	e822                	sd	s0,16(sp)
ffffffffc0200cc2:	e226                	sd	s1,256(sp)
ffffffffc0200cc4:	e64a                	sd	s2,264(sp)
ffffffffc0200cc6:	ea4e                	sd	s3,272(sp)
ffffffffc0200cc8:	ee52                	sd	s4,280(sp)
ffffffffc0200cca:	850a                	mv	a0,sp
ffffffffc0200ccc:	f09ff0ef          	jal	ra,ffffffffc0200bd4 <trap>

ffffffffc0200cd0 <__trapret>:
ffffffffc0200cd0:	6492                	ld	s1,256(sp)
ffffffffc0200cd2:	6932                	ld	s2,264(sp)
ffffffffc0200cd4:	1004f413          	andi	s0,s1,256
ffffffffc0200cd8:	e401                	bnez	s0,ffffffffc0200ce0 <__trapret+0x10>
ffffffffc0200cda:	1200                	addi	s0,sp,288
ffffffffc0200cdc:	14041073          	csrw	sscratch,s0
ffffffffc0200ce0:	10049073          	csrw	sstatus,s1
ffffffffc0200ce4:	14191073          	csrw	sepc,s2
ffffffffc0200ce8:	60a2                	ld	ra,8(sp)
ffffffffc0200cea:	61e2                	ld	gp,24(sp)
ffffffffc0200cec:	7202                	ld	tp,32(sp)
ffffffffc0200cee:	72a2                	ld	t0,40(sp)
ffffffffc0200cf0:	7342                	ld	t1,48(sp)
ffffffffc0200cf2:	73e2                	ld	t2,56(sp)
ffffffffc0200cf4:	6406                	ld	s0,64(sp)
ffffffffc0200cf6:	64a6                	ld	s1,72(sp)
ffffffffc0200cf8:	6546                	ld	a0,80(sp)
ffffffffc0200cfa:	65e6                	ld	a1,88(sp)
ffffffffc0200cfc:	7606                	ld	a2,96(sp)
ffffffffc0200cfe:	76a6                	ld	a3,104(sp)
ffffffffc0200d00:	7746                	ld	a4,112(sp)
ffffffffc0200d02:	77e6                	ld	a5,120(sp)
ffffffffc0200d04:	680a                	ld	a6,128(sp)
ffffffffc0200d06:	68aa                	ld	a7,136(sp)
ffffffffc0200d08:	694a                	ld	s2,144(sp)
ffffffffc0200d0a:	69ea                	ld	s3,152(sp)
ffffffffc0200d0c:	7a0a                	ld	s4,160(sp)
ffffffffc0200d0e:	7aaa                	ld	s5,168(sp)
ffffffffc0200d10:	7b4a                	ld	s6,176(sp)
ffffffffc0200d12:	7bea                	ld	s7,184(sp)
ffffffffc0200d14:	6c0e                	ld	s8,192(sp)
ffffffffc0200d16:	6cae                	ld	s9,200(sp)
ffffffffc0200d18:	6d4e                	ld	s10,208(sp)
ffffffffc0200d1a:	6dee                	ld	s11,216(sp)
ffffffffc0200d1c:	7e0e                	ld	t3,224(sp)
ffffffffc0200d1e:	7eae                	ld	t4,232(sp)
ffffffffc0200d20:	7f4e                	ld	t5,240(sp)
ffffffffc0200d22:	7fee                	ld	t6,248(sp)
ffffffffc0200d24:	6142                	ld	sp,16(sp)
ffffffffc0200d26:	10200073          	sret

ffffffffc0200d2a <forkrets>:
ffffffffc0200d2a:	812a                	mv	sp,a0
ffffffffc0200d2c:	b755                	j	ffffffffc0200cd0 <__trapret>

ffffffffc0200d2e <check_vma_overlap.isra.0.part.0>:
ffffffffc0200d2e:	1141                	addi	sp,sp,-16
ffffffffc0200d30:	00008697          	auipc	a3,0x8
ffffffffc0200d34:	b9068693          	addi	a3,a3,-1136 # ffffffffc02088c0 <commands+0x700>
ffffffffc0200d38:	00008617          	auipc	a2,0x8
ffffffffc0200d3c:	89860613          	addi	a2,a2,-1896 # ffffffffc02085d0 <commands+0x410>
ffffffffc0200d40:	06d00593          	li	a1,109
ffffffffc0200d44:	00008517          	auipc	a0,0x8
ffffffffc0200d48:	b9c50513          	addi	a0,a0,-1124 # ffffffffc02088e0 <commands+0x720>
ffffffffc0200d4c:	e406                	sd	ra,8(sp)
ffffffffc0200d4e:	cbaff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200d52 <mm_create>:
ffffffffc0200d52:	1141                	addi	sp,sp,-16
ffffffffc0200d54:	05800513          	li	a0,88
ffffffffc0200d58:	e022                	sd	s0,0(sp)
ffffffffc0200d5a:	e406                	sd	ra,8(sp)
ffffffffc0200d5c:	12f000ef          	jal	ra,ffffffffc020168a <kmalloc>
ffffffffc0200d60:	842a                	mv	s0,a0
ffffffffc0200d62:	c51d                	beqz	a0,ffffffffc0200d90 <mm_create+0x3e>
ffffffffc0200d64:	e408                	sd	a0,8(s0)
ffffffffc0200d66:	e008                	sd	a0,0(s0)
ffffffffc0200d68:	00053823          	sd	zero,16(a0)
ffffffffc0200d6c:	00053c23          	sd	zero,24(a0)
ffffffffc0200d70:	02052023          	sw	zero,32(a0)
ffffffffc0200d74:	00018797          	auipc	a5,0x18
ffffffffc0200d78:	7647a783          	lw	a5,1892(a5) # ffffffffc02194d8 <swap_init_ok>
ffffffffc0200d7c:	ef99                	bnez	a5,ffffffffc0200d9a <mm_create+0x48>
ffffffffc0200d7e:	02053423          	sd	zero,40(a0)
ffffffffc0200d82:	02042823          	sw	zero,48(s0)
ffffffffc0200d86:	4585                	li	a1,1
ffffffffc0200d88:	03840513          	addi	a0,s0,56
ffffffffc0200d8c:	74c020ef          	jal	ra,ffffffffc02034d8 <sem_init>
ffffffffc0200d90:	60a2                	ld	ra,8(sp)
ffffffffc0200d92:	8522                	mv	a0,s0
ffffffffc0200d94:	6402                	ld	s0,0(sp)
ffffffffc0200d96:	0141                	addi	sp,sp,16
ffffffffc0200d98:	8082                	ret
ffffffffc0200d9a:	546000ef          	jal	ra,ffffffffc02012e0 <swap_init_mm>
ffffffffc0200d9e:	b7d5                	j	ffffffffc0200d82 <mm_create+0x30>

ffffffffc0200da0 <find_vma>:
ffffffffc0200da0:	86aa                	mv	a3,a0
ffffffffc0200da2:	c505                	beqz	a0,ffffffffc0200dca <find_vma+0x2a>
ffffffffc0200da4:	6908                	ld	a0,16(a0)
ffffffffc0200da6:	c501                	beqz	a0,ffffffffc0200dae <find_vma+0xe>
ffffffffc0200da8:	651c                	ld	a5,8(a0)
ffffffffc0200daa:	02f5f263          	bgeu	a1,a5,ffffffffc0200dce <find_vma+0x2e>
ffffffffc0200dae:	669c                	ld	a5,8(a3)
ffffffffc0200db0:	00f68d63          	beq	a3,a5,ffffffffc0200dca <find_vma+0x2a>
ffffffffc0200db4:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200db8:	00e5e663          	bltu	a1,a4,ffffffffc0200dc4 <find_vma+0x24>
ffffffffc0200dbc:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200dc0:	00e5ec63          	bltu	a1,a4,ffffffffc0200dd8 <find_vma+0x38>
ffffffffc0200dc4:	679c                	ld	a5,8(a5)
ffffffffc0200dc6:	fef697e3          	bne	a3,a5,ffffffffc0200db4 <find_vma+0x14>
ffffffffc0200dca:	4501                	li	a0,0
ffffffffc0200dcc:	8082                	ret
ffffffffc0200dce:	691c                	ld	a5,16(a0)
ffffffffc0200dd0:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0200dae <find_vma+0xe>
ffffffffc0200dd4:	ea88                	sd	a0,16(a3)
ffffffffc0200dd6:	8082                	ret
ffffffffc0200dd8:	fe078513          	addi	a0,a5,-32
ffffffffc0200ddc:	ea88                	sd	a0,16(a3)
ffffffffc0200dde:	8082                	ret

ffffffffc0200de0 <insert_vma_struct>:
ffffffffc0200de0:	6590                	ld	a2,8(a1)
ffffffffc0200de2:	0105b803          	ld	a6,16(a1)
ffffffffc0200de6:	1141                	addi	sp,sp,-16
ffffffffc0200de8:	e406                	sd	ra,8(sp)
ffffffffc0200dea:	87aa                	mv	a5,a0
ffffffffc0200dec:	01066763          	bltu	a2,a6,ffffffffc0200dfa <insert_vma_struct+0x1a>
ffffffffc0200df0:	a085                	j	ffffffffc0200e50 <insert_vma_struct+0x70>
ffffffffc0200df2:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200df6:	04e66863          	bltu	a2,a4,ffffffffc0200e46 <insert_vma_struct+0x66>
ffffffffc0200dfa:	86be                	mv	a3,a5
ffffffffc0200dfc:	679c                	ld	a5,8(a5)
ffffffffc0200dfe:	fef51ae3          	bne	a0,a5,ffffffffc0200df2 <insert_vma_struct+0x12>
ffffffffc0200e02:	02a68463          	beq	a3,a0,ffffffffc0200e2a <insert_vma_struct+0x4a>
ffffffffc0200e06:	ff06b703          	ld	a4,-16(a3)
ffffffffc0200e0a:	fe86b883          	ld	a7,-24(a3)
ffffffffc0200e0e:	08e8f163          	bgeu	a7,a4,ffffffffc0200e90 <insert_vma_struct+0xb0>
ffffffffc0200e12:	04e66f63          	bltu	a2,a4,ffffffffc0200e70 <insert_vma_struct+0x90>
ffffffffc0200e16:	00f50a63          	beq	a0,a5,ffffffffc0200e2a <insert_vma_struct+0x4a>
ffffffffc0200e1a:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200e1e:	05076963          	bltu	a4,a6,ffffffffc0200e70 <insert_vma_struct+0x90>
ffffffffc0200e22:	ff07b603          	ld	a2,-16(a5)
ffffffffc0200e26:	02c77363          	bgeu	a4,a2,ffffffffc0200e4c <insert_vma_struct+0x6c>
ffffffffc0200e2a:	5118                	lw	a4,32(a0)
ffffffffc0200e2c:	e188                	sd	a0,0(a1)
ffffffffc0200e2e:	02058613          	addi	a2,a1,32
ffffffffc0200e32:	e390                	sd	a2,0(a5)
ffffffffc0200e34:	e690                	sd	a2,8(a3)
ffffffffc0200e36:	60a2                	ld	ra,8(sp)
ffffffffc0200e38:	f59c                	sd	a5,40(a1)
ffffffffc0200e3a:	f194                	sd	a3,32(a1)
ffffffffc0200e3c:	0017079b          	addiw	a5,a4,1
ffffffffc0200e40:	d11c                	sw	a5,32(a0)
ffffffffc0200e42:	0141                	addi	sp,sp,16
ffffffffc0200e44:	8082                	ret
ffffffffc0200e46:	fca690e3          	bne	a3,a0,ffffffffc0200e06 <insert_vma_struct+0x26>
ffffffffc0200e4a:	bfd1                	j	ffffffffc0200e1e <insert_vma_struct+0x3e>
ffffffffc0200e4c:	ee3ff0ef          	jal	ra,ffffffffc0200d2e <check_vma_overlap.isra.0.part.0>
ffffffffc0200e50:	00008697          	auipc	a3,0x8
ffffffffc0200e54:	aa068693          	addi	a3,a3,-1376 # ffffffffc02088f0 <commands+0x730>
ffffffffc0200e58:	00007617          	auipc	a2,0x7
ffffffffc0200e5c:	77860613          	addi	a2,a2,1912 # ffffffffc02085d0 <commands+0x410>
ffffffffc0200e60:	07400593          	li	a1,116
ffffffffc0200e64:	00008517          	auipc	a0,0x8
ffffffffc0200e68:	a7c50513          	addi	a0,a0,-1412 # ffffffffc02088e0 <commands+0x720>
ffffffffc0200e6c:	b9cff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200e70:	00008697          	auipc	a3,0x8
ffffffffc0200e74:	ac068693          	addi	a3,a3,-1344 # ffffffffc0208930 <commands+0x770>
ffffffffc0200e78:	00007617          	auipc	a2,0x7
ffffffffc0200e7c:	75860613          	addi	a2,a2,1880 # ffffffffc02085d0 <commands+0x410>
ffffffffc0200e80:	06c00593          	li	a1,108
ffffffffc0200e84:	00008517          	auipc	a0,0x8
ffffffffc0200e88:	a5c50513          	addi	a0,a0,-1444 # ffffffffc02088e0 <commands+0x720>
ffffffffc0200e8c:	b7cff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200e90:	00008697          	auipc	a3,0x8
ffffffffc0200e94:	a8068693          	addi	a3,a3,-1408 # ffffffffc0208910 <commands+0x750>
ffffffffc0200e98:	00007617          	auipc	a2,0x7
ffffffffc0200e9c:	73860613          	addi	a2,a2,1848 # ffffffffc02085d0 <commands+0x410>
ffffffffc0200ea0:	06b00593          	li	a1,107
ffffffffc0200ea4:	00008517          	auipc	a0,0x8
ffffffffc0200ea8:	a3c50513          	addi	a0,a0,-1476 # ffffffffc02088e0 <commands+0x720>
ffffffffc0200eac:	b5cff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200eb0 <mm_destroy>:
ffffffffc0200eb0:	591c                	lw	a5,48(a0)
ffffffffc0200eb2:	1141                	addi	sp,sp,-16
ffffffffc0200eb4:	e406                	sd	ra,8(sp)
ffffffffc0200eb6:	e022                	sd	s0,0(sp)
ffffffffc0200eb8:	e78d                	bnez	a5,ffffffffc0200ee2 <mm_destroy+0x32>
ffffffffc0200eba:	842a                	mv	s0,a0
ffffffffc0200ebc:	6508                	ld	a0,8(a0)
ffffffffc0200ebe:	00a40c63          	beq	s0,a0,ffffffffc0200ed6 <mm_destroy+0x26>
ffffffffc0200ec2:	6118                	ld	a4,0(a0)
ffffffffc0200ec4:	651c                	ld	a5,8(a0)
ffffffffc0200ec6:	1501                	addi	a0,a0,-32
ffffffffc0200ec8:	e71c                	sd	a5,8(a4)
ffffffffc0200eca:	e398                	sd	a4,0(a5)
ffffffffc0200ecc:	06f000ef          	jal	ra,ffffffffc020173a <kfree>
ffffffffc0200ed0:	6408                	ld	a0,8(s0)
ffffffffc0200ed2:	fea418e3          	bne	s0,a0,ffffffffc0200ec2 <mm_destroy+0x12>
ffffffffc0200ed6:	8522                	mv	a0,s0
ffffffffc0200ed8:	6402                	ld	s0,0(sp)
ffffffffc0200eda:	60a2                	ld	ra,8(sp)
ffffffffc0200edc:	0141                	addi	sp,sp,16
ffffffffc0200ede:	05d0006f          	j	ffffffffc020173a <kfree>
ffffffffc0200ee2:	00008697          	auipc	a3,0x8
ffffffffc0200ee6:	a6e68693          	addi	a3,a3,-1426 # ffffffffc0208950 <commands+0x790>
ffffffffc0200eea:	00007617          	auipc	a2,0x7
ffffffffc0200eee:	6e660613          	addi	a2,a2,1766 # ffffffffc02085d0 <commands+0x410>
ffffffffc0200ef2:	09400593          	li	a1,148
ffffffffc0200ef6:	00008517          	auipc	a0,0x8
ffffffffc0200efa:	9ea50513          	addi	a0,a0,-1558 # ffffffffc02088e0 <commands+0x720>
ffffffffc0200efe:	b0aff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200f02 <mm_map>:
ffffffffc0200f02:	7139                	addi	sp,sp,-64
ffffffffc0200f04:	f822                	sd	s0,48(sp)
ffffffffc0200f06:	6405                	lui	s0,0x1
ffffffffc0200f08:	147d                	addi	s0,s0,-1
ffffffffc0200f0a:	77fd                	lui	a5,0xfffff
ffffffffc0200f0c:	9622                	add	a2,a2,s0
ffffffffc0200f0e:	962e                	add	a2,a2,a1
ffffffffc0200f10:	f426                	sd	s1,40(sp)
ffffffffc0200f12:	fc06                	sd	ra,56(sp)
ffffffffc0200f14:	00f5f4b3          	and	s1,a1,a5
ffffffffc0200f18:	f04a                	sd	s2,32(sp)
ffffffffc0200f1a:	ec4e                	sd	s3,24(sp)
ffffffffc0200f1c:	e852                	sd	s4,16(sp)
ffffffffc0200f1e:	e456                	sd	s5,8(sp)
ffffffffc0200f20:	002005b7          	lui	a1,0x200
ffffffffc0200f24:	00f67433          	and	s0,a2,a5
ffffffffc0200f28:	06b4e363          	bltu	s1,a1,ffffffffc0200f8e <mm_map+0x8c>
ffffffffc0200f2c:	0684f163          	bgeu	s1,s0,ffffffffc0200f8e <mm_map+0x8c>
ffffffffc0200f30:	4785                	li	a5,1
ffffffffc0200f32:	07fe                	slli	a5,a5,0x1f
ffffffffc0200f34:	0487ed63          	bltu	a5,s0,ffffffffc0200f8e <mm_map+0x8c>
ffffffffc0200f38:	89aa                	mv	s3,a0
ffffffffc0200f3a:	cd21                	beqz	a0,ffffffffc0200f92 <mm_map+0x90>
ffffffffc0200f3c:	85a6                	mv	a1,s1
ffffffffc0200f3e:	8ab6                	mv	s5,a3
ffffffffc0200f40:	8a3a                	mv	s4,a4
ffffffffc0200f42:	e5fff0ef          	jal	ra,ffffffffc0200da0 <find_vma>
ffffffffc0200f46:	c501                	beqz	a0,ffffffffc0200f4e <mm_map+0x4c>
ffffffffc0200f48:	651c                	ld	a5,8(a0)
ffffffffc0200f4a:	0487e263          	bltu	a5,s0,ffffffffc0200f8e <mm_map+0x8c>
ffffffffc0200f4e:	03000513          	li	a0,48
ffffffffc0200f52:	738000ef          	jal	ra,ffffffffc020168a <kmalloc>
ffffffffc0200f56:	892a                	mv	s2,a0
ffffffffc0200f58:	5571                	li	a0,-4
ffffffffc0200f5a:	02090163          	beqz	s2,ffffffffc0200f7c <mm_map+0x7a>
ffffffffc0200f5e:	854e                	mv	a0,s3
ffffffffc0200f60:	00993423          	sd	s1,8(s2)
ffffffffc0200f64:	00893823          	sd	s0,16(s2)
ffffffffc0200f68:	01592c23          	sw	s5,24(s2)
ffffffffc0200f6c:	85ca                	mv	a1,s2
ffffffffc0200f6e:	e73ff0ef          	jal	ra,ffffffffc0200de0 <insert_vma_struct>
ffffffffc0200f72:	4501                	li	a0,0
ffffffffc0200f74:	000a0463          	beqz	s4,ffffffffc0200f7c <mm_map+0x7a>
ffffffffc0200f78:	012a3023          	sd	s2,0(s4)
ffffffffc0200f7c:	70e2                	ld	ra,56(sp)
ffffffffc0200f7e:	7442                	ld	s0,48(sp)
ffffffffc0200f80:	74a2                	ld	s1,40(sp)
ffffffffc0200f82:	7902                	ld	s2,32(sp)
ffffffffc0200f84:	69e2                	ld	s3,24(sp)
ffffffffc0200f86:	6a42                	ld	s4,16(sp)
ffffffffc0200f88:	6aa2                	ld	s5,8(sp)
ffffffffc0200f8a:	6121                	addi	sp,sp,64
ffffffffc0200f8c:	8082                	ret
ffffffffc0200f8e:	5575                	li	a0,-3
ffffffffc0200f90:	b7f5                	j	ffffffffc0200f7c <mm_map+0x7a>
ffffffffc0200f92:	00008697          	auipc	a3,0x8
ffffffffc0200f96:	9d668693          	addi	a3,a3,-1578 # ffffffffc0208968 <commands+0x7a8>
ffffffffc0200f9a:	00007617          	auipc	a2,0x7
ffffffffc0200f9e:	63660613          	addi	a2,a2,1590 # ffffffffc02085d0 <commands+0x410>
ffffffffc0200fa2:	0a700593          	li	a1,167
ffffffffc0200fa6:	00008517          	auipc	a0,0x8
ffffffffc0200faa:	93a50513          	addi	a0,a0,-1734 # ffffffffc02088e0 <commands+0x720>
ffffffffc0200fae:	a5aff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200fb2 <dup_mmap>:
ffffffffc0200fb2:	7139                	addi	sp,sp,-64
ffffffffc0200fb4:	fc06                	sd	ra,56(sp)
ffffffffc0200fb6:	f822                	sd	s0,48(sp)
ffffffffc0200fb8:	f426                	sd	s1,40(sp)
ffffffffc0200fba:	f04a                	sd	s2,32(sp)
ffffffffc0200fbc:	ec4e                	sd	s3,24(sp)
ffffffffc0200fbe:	e852                	sd	s4,16(sp)
ffffffffc0200fc0:	e456                	sd	s5,8(sp)
ffffffffc0200fc2:	c52d                	beqz	a0,ffffffffc020102c <dup_mmap+0x7a>
ffffffffc0200fc4:	892a                	mv	s2,a0
ffffffffc0200fc6:	84ae                	mv	s1,a1
ffffffffc0200fc8:	842e                	mv	s0,a1
ffffffffc0200fca:	e595                	bnez	a1,ffffffffc0200ff6 <dup_mmap+0x44>
ffffffffc0200fcc:	a085                	j	ffffffffc020102c <dup_mmap+0x7a>
ffffffffc0200fce:	854a                	mv	a0,s2
ffffffffc0200fd0:	0155b423          	sd	s5,8(a1) # 200008 <kern_entry-0xffffffffbffffff8>
ffffffffc0200fd4:	0145b823          	sd	s4,16(a1)
ffffffffc0200fd8:	0135ac23          	sw	s3,24(a1)
ffffffffc0200fdc:	e05ff0ef          	jal	ra,ffffffffc0200de0 <insert_vma_struct>
ffffffffc0200fe0:	ff043683          	ld	a3,-16(s0) # ff0 <kern_entry-0xffffffffc01ff010>
ffffffffc0200fe4:	fe843603          	ld	a2,-24(s0)
ffffffffc0200fe8:	6c8c                	ld	a1,24(s1)
ffffffffc0200fea:	01893503          	ld	a0,24(s2)
ffffffffc0200fee:	4701                	li	a4,0
ffffffffc0200ff0:	5f5010ef          	jal	ra,ffffffffc0202de4 <copy_range>
ffffffffc0200ff4:	e105                	bnez	a0,ffffffffc0201014 <dup_mmap+0x62>
ffffffffc0200ff6:	6000                	ld	s0,0(s0)
ffffffffc0200ff8:	02848863          	beq	s1,s0,ffffffffc0201028 <dup_mmap+0x76>
ffffffffc0200ffc:	03000513          	li	a0,48
ffffffffc0201000:	fe843a83          	ld	s5,-24(s0)
ffffffffc0201004:	ff043a03          	ld	s4,-16(s0)
ffffffffc0201008:	ff842983          	lw	s3,-8(s0)
ffffffffc020100c:	67e000ef          	jal	ra,ffffffffc020168a <kmalloc>
ffffffffc0201010:	85aa                	mv	a1,a0
ffffffffc0201012:	fd55                	bnez	a0,ffffffffc0200fce <dup_mmap+0x1c>
ffffffffc0201014:	5571                	li	a0,-4
ffffffffc0201016:	70e2                	ld	ra,56(sp)
ffffffffc0201018:	7442                	ld	s0,48(sp)
ffffffffc020101a:	74a2                	ld	s1,40(sp)
ffffffffc020101c:	7902                	ld	s2,32(sp)
ffffffffc020101e:	69e2                	ld	s3,24(sp)
ffffffffc0201020:	6a42                	ld	s4,16(sp)
ffffffffc0201022:	6aa2                	ld	s5,8(sp)
ffffffffc0201024:	6121                	addi	sp,sp,64
ffffffffc0201026:	8082                	ret
ffffffffc0201028:	4501                	li	a0,0
ffffffffc020102a:	b7f5                	j	ffffffffc0201016 <dup_mmap+0x64>
ffffffffc020102c:	00008697          	auipc	a3,0x8
ffffffffc0201030:	94c68693          	addi	a3,a3,-1716 # ffffffffc0208978 <commands+0x7b8>
ffffffffc0201034:	00007617          	auipc	a2,0x7
ffffffffc0201038:	59c60613          	addi	a2,a2,1436 # ffffffffc02085d0 <commands+0x410>
ffffffffc020103c:	0c000593          	li	a1,192
ffffffffc0201040:	00008517          	auipc	a0,0x8
ffffffffc0201044:	8a050513          	addi	a0,a0,-1888 # ffffffffc02088e0 <commands+0x720>
ffffffffc0201048:	9c0ff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020104c <exit_mmap>:
ffffffffc020104c:	1101                	addi	sp,sp,-32
ffffffffc020104e:	ec06                	sd	ra,24(sp)
ffffffffc0201050:	e822                	sd	s0,16(sp)
ffffffffc0201052:	e426                	sd	s1,8(sp)
ffffffffc0201054:	e04a                	sd	s2,0(sp)
ffffffffc0201056:	c531                	beqz	a0,ffffffffc02010a2 <exit_mmap+0x56>
ffffffffc0201058:	591c                	lw	a5,48(a0)
ffffffffc020105a:	84aa                	mv	s1,a0
ffffffffc020105c:	e3b9                	bnez	a5,ffffffffc02010a2 <exit_mmap+0x56>
ffffffffc020105e:	6500                	ld	s0,8(a0)
ffffffffc0201060:	01853903          	ld	s2,24(a0)
ffffffffc0201064:	02850663          	beq	a0,s0,ffffffffc0201090 <exit_mmap+0x44>
ffffffffc0201068:	ff043603          	ld	a2,-16(s0)
ffffffffc020106c:	fe843583          	ld	a1,-24(s0)
ffffffffc0201070:	854a                	mv	a0,s2
ffffffffc0201072:	2a3010ef          	jal	ra,ffffffffc0202b14 <unmap_range>
ffffffffc0201076:	6400                	ld	s0,8(s0)
ffffffffc0201078:	fe8498e3          	bne	s1,s0,ffffffffc0201068 <exit_mmap+0x1c>
ffffffffc020107c:	6400                	ld	s0,8(s0)
ffffffffc020107e:	00848c63          	beq	s1,s0,ffffffffc0201096 <exit_mmap+0x4a>
ffffffffc0201082:	ff043603          	ld	a2,-16(s0)
ffffffffc0201086:	fe843583          	ld	a1,-24(s0)
ffffffffc020108a:	854a                	mv	a0,s2
ffffffffc020108c:	39f010ef          	jal	ra,ffffffffc0202c2a <exit_range>
ffffffffc0201090:	6400                	ld	s0,8(s0)
ffffffffc0201092:	fe8498e3          	bne	s1,s0,ffffffffc0201082 <exit_mmap+0x36>
ffffffffc0201096:	60e2                	ld	ra,24(sp)
ffffffffc0201098:	6442                	ld	s0,16(sp)
ffffffffc020109a:	64a2                	ld	s1,8(sp)
ffffffffc020109c:	6902                	ld	s2,0(sp)
ffffffffc020109e:	6105                	addi	sp,sp,32
ffffffffc02010a0:	8082                	ret
ffffffffc02010a2:	00008697          	auipc	a3,0x8
ffffffffc02010a6:	8f668693          	addi	a3,a3,-1802 # ffffffffc0208998 <commands+0x7d8>
ffffffffc02010aa:	00007617          	auipc	a2,0x7
ffffffffc02010ae:	52660613          	addi	a2,a2,1318 # ffffffffc02085d0 <commands+0x410>
ffffffffc02010b2:	0d600593          	li	a1,214
ffffffffc02010b6:	00008517          	auipc	a0,0x8
ffffffffc02010ba:	82a50513          	addi	a0,a0,-2006 # ffffffffc02088e0 <commands+0x720>
ffffffffc02010be:	94aff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02010c2 <vmm_init>:
ffffffffc02010c2:	8082                	ret

ffffffffc02010c4 <do_pgfault>:
ffffffffc02010c4:	7139                	addi	sp,sp,-64
ffffffffc02010c6:	85b2                	mv	a1,a2
ffffffffc02010c8:	f822                	sd	s0,48(sp)
ffffffffc02010ca:	f426                	sd	s1,40(sp)
ffffffffc02010cc:	fc06                	sd	ra,56(sp)
ffffffffc02010ce:	f04a                	sd	s2,32(sp)
ffffffffc02010d0:	ec4e                	sd	s3,24(sp)
ffffffffc02010d2:	8432                	mv	s0,a2
ffffffffc02010d4:	84aa                	mv	s1,a0
ffffffffc02010d6:	ccbff0ef          	jal	ra,ffffffffc0200da0 <find_vma>
ffffffffc02010da:	00018797          	auipc	a5,0x18
ffffffffc02010de:	3ee7a783          	lw	a5,1006(a5) # ffffffffc02194c8 <pgfault_num>
ffffffffc02010e2:	2785                	addiw	a5,a5,1
ffffffffc02010e4:	00018717          	auipc	a4,0x18
ffffffffc02010e8:	3ef72223          	sw	a5,996(a4) # ffffffffc02194c8 <pgfault_num>
ffffffffc02010ec:	c545                	beqz	a0,ffffffffc0201194 <do_pgfault+0xd0>
ffffffffc02010ee:	651c                	ld	a5,8(a0)
ffffffffc02010f0:	0af46263          	bltu	s0,a5,ffffffffc0201194 <do_pgfault+0xd0>
ffffffffc02010f4:	4d1c                	lw	a5,24(a0)
ffffffffc02010f6:	49c1                	li	s3,16
ffffffffc02010f8:	8b89                	andi	a5,a5,2
ffffffffc02010fa:	efb1                	bnez	a5,ffffffffc0201156 <do_pgfault+0x92>
ffffffffc02010fc:	75fd                	lui	a1,0xfffff
ffffffffc02010fe:	6c88                	ld	a0,24(s1)
ffffffffc0201100:	8c6d                	and	s0,s0,a1
ffffffffc0201102:	4605                	li	a2,1
ffffffffc0201104:	85a2                	mv	a1,s0
ffffffffc0201106:	03d010ef          	jal	ra,ffffffffc0202942 <get_pte>
ffffffffc020110a:	c555                	beqz	a0,ffffffffc02011b6 <do_pgfault+0xf2>
ffffffffc020110c:	610c                	ld	a1,0(a0)
ffffffffc020110e:	c5a5                	beqz	a1,ffffffffc0201176 <do_pgfault+0xb2>
ffffffffc0201110:	00018797          	auipc	a5,0x18
ffffffffc0201114:	3c87a783          	lw	a5,968(a5) # ffffffffc02194d8 <swap_init_ok>
ffffffffc0201118:	c7d9                	beqz	a5,ffffffffc02011a6 <do_pgfault+0xe2>
ffffffffc020111a:	0030                	addi	a2,sp,8
ffffffffc020111c:	85a2                	mv	a1,s0
ffffffffc020111e:	8526                	mv	a0,s1
ffffffffc0201120:	e402                	sd	zero,8(sp)
ffffffffc0201122:	2ee000ef          	jal	ra,ffffffffc0201410 <swap_in>
ffffffffc0201126:	892a                	mv	s2,a0
ffffffffc0201128:	e90d                	bnez	a0,ffffffffc020115a <do_pgfault+0x96>
ffffffffc020112a:	65a2                	ld	a1,8(sp)
ffffffffc020112c:	6c88                	ld	a0,24(s1)
ffffffffc020112e:	86ce                	mv	a3,s3
ffffffffc0201130:	8622                	mv	a2,s0
ffffffffc0201132:	3f7010ef          	jal	ra,ffffffffc0202d28 <page_insert>
ffffffffc0201136:	6622                	ld	a2,8(sp)
ffffffffc0201138:	4685                	li	a3,1
ffffffffc020113a:	85a2                	mv	a1,s0
ffffffffc020113c:	8526                	mv	a0,s1
ffffffffc020113e:	1b0000ef          	jal	ra,ffffffffc02012ee <swap_map_swappable>
ffffffffc0201142:	67a2                	ld	a5,8(sp)
ffffffffc0201144:	ff80                	sd	s0,56(a5)
ffffffffc0201146:	70e2                	ld	ra,56(sp)
ffffffffc0201148:	7442                	ld	s0,48(sp)
ffffffffc020114a:	74a2                	ld	s1,40(sp)
ffffffffc020114c:	69e2                	ld	s3,24(sp)
ffffffffc020114e:	854a                	mv	a0,s2
ffffffffc0201150:	7902                	ld	s2,32(sp)
ffffffffc0201152:	6121                	addi	sp,sp,64
ffffffffc0201154:	8082                	ret
ffffffffc0201156:	49dd                	li	s3,23
ffffffffc0201158:	b755                	j	ffffffffc02010fc <do_pgfault+0x38>
ffffffffc020115a:	00008517          	auipc	a0,0x8
ffffffffc020115e:	8d650513          	addi	a0,a0,-1834 # ffffffffc0208a30 <commands+0x870>
ffffffffc0201162:	f6bfe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201166:	70e2                	ld	ra,56(sp)
ffffffffc0201168:	7442                	ld	s0,48(sp)
ffffffffc020116a:	74a2                	ld	s1,40(sp)
ffffffffc020116c:	69e2                	ld	s3,24(sp)
ffffffffc020116e:	854a                	mv	a0,s2
ffffffffc0201170:	7902                	ld	s2,32(sp)
ffffffffc0201172:	6121                	addi	sp,sp,64
ffffffffc0201174:	8082                	ret
ffffffffc0201176:	6c88                	ld	a0,24(s1)
ffffffffc0201178:	864e                	mv	a2,s3
ffffffffc020117a:	85a2                	mv	a1,s0
ffffffffc020117c:	69f010ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0201180:	4901                	li	s2,0
ffffffffc0201182:	f171                	bnez	a0,ffffffffc0201146 <do_pgfault+0x82>
ffffffffc0201184:	00008517          	auipc	a0,0x8
ffffffffc0201188:	88450513          	addi	a0,a0,-1916 # ffffffffc0208a08 <commands+0x848>
ffffffffc020118c:	f41fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201190:	5971                	li	s2,-4
ffffffffc0201192:	bf55                	j	ffffffffc0201146 <do_pgfault+0x82>
ffffffffc0201194:	85a2                	mv	a1,s0
ffffffffc0201196:	00008517          	auipc	a0,0x8
ffffffffc020119a:	82250513          	addi	a0,a0,-2014 # ffffffffc02089b8 <commands+0x7f8>
ffffffffc020119e:	f2ffe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02011a2:	5975                	li	s2,-3
ffffffffc02011a4:	b74d                	j	ffffffffc0201146 <do_pgfault+0x82>
ffffffffc02011a6:	00008517          	auipc	a0,0x8
ffffffffc02011aa:	8aa50513          	addi	a0,a0,-1878 # ffffffffc0208a50 <commands+0x890>
ffffffffc02011ae:	f1ffe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02011b2:	5971                	li	s2,-4
ffffffffc02011b4:	bf49                	j	ffffffffc0201146 <do_pgfault+0x82>
ffffffffc02011b6:	00008517          	auipc	a0,0x8
ffffffffc02011ba:	83250513          	addi	a0,a0,-1998 # ffffffffc02089e8 <commands+0x828>
ffffffffc02011be:	f0ffe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02011c2:	5971                	li	s2,-4
ffffffffc02011c4:	b749                	j	ffffffffc0201146 <do_pgfault+0x82>

ffffffffc02011c6 <user_mem_check>:
ffffffffc02011c6:	7179                	addi	sp,sp,-48
ffffffffc02011c8:	f022                	sd	s0,32(sp)
ffffffffc02011ca:	f406                	sd	ra,40(sp)
ffffffffc02011cc:	ec26                	sd	s1,24(sp)
ffffffffc02011ce:	e84a                	sd	s2,16(sp)
ffffffffc02011d0:	e44e                	sd	s3,8(sp)
ffffffffc02011d2:	e052                	sd	s4,0(sp)
ffffffffc02011d4:	842e                	mv	s0,a1
ffffffffc02011d6:	c135                	beqz	a0,ffffffffc020123a <user_mem_check+0x74>
ffffffffc02011d8:	002007b7          	lui	a5,0x200
ffffffffc02011dc:	04f5e663          	bltu	a1,a5,ffffffffc0201228 <user_mem_check+0x62>
ffffffffc02011e0:	00c584b3          	add	s1,a1,a2
ffffffffc02011e4:	0495f263          	bgeu	a1,s1,ffffffffc0201228 <user_mem_check+0x62>
ffffffffc02011e8:	4785                	li	a5,1
ffffffffc02011ea:	07fe                	slli	a5,a5,0x1f
ffffffffc02011ec:	0297ee63          	bltu	a5,s1,ffffffffc0201228 <user_mem_check+0x62>
ffffffffc02011f0:	892a                	mv	s2,a0
ffffffffc02011f2:	89b6                	mv	s3,a3
ffffffffc02011f4:	6a05                	lui	s4,0x1
ffffffffc02011f6:	a821                	j	ffffffffc020120e <user_mem_check+0x48>
ffffffffc02011f8:	0027f693          	andi	a3,a5,2
ffffffffc02011fc:	9752                	add	a4,a4,s4
ffffffffc02011fe:	8ba1                	andi	a5,a5,8
ffffffffc0201200:	c685                	beqz	a3,ffffffffc0201228 <user_mem_check+0x62>
ffffffffc0201202:	c399                	beqz	a5,ffffffffc0201208 <user_mem_check+0x42>
ffffffffc0201204:	02e46263          	bltu	s0,a4,ffffffffc0201228 <user_mem_check+0x62>
ffffffffc0201208:	6900                	ld	s0,16(a0)
ffffffffc020120a:	04947663          	bgeu	s0,s1,ffffffffc0201256 <user_mem_check+0x90>
ffffffffc020120e:	85a2                	mv	a1,s0
ffffffffc0201210:	854a                	mv	a0,s2
ffffffffc0201212:	b8fff0ef          	jal	ra,ffffffffc0200da0 <find_vma>
ffffffffc0201216:	c909                	beqz	a0,ffffffffc0201228 <user_mem_check+0x62>
ffffffffc0201218:	6518                	ld	a4,8(a0)
ffffffffc020121a:	00e46763          	bltu	s0,a4,ffffffffc0201228 <user_mem_check+0x62>
ffffffffc020121e:	4d1c                	lw	a5,24(a0)
ffffffffc0201220:	fc099ce3          	bnez	s3,ffffffffc02011f8 <user_mem_check+0x32>
ffffffffc0201224:	8b85                	andi	a5,a5,1
ffffffffc0201226:	f3ed                	bnez	a5,ffffffffc0201208 <user_mem_check+0x42>
ffffffffc0201228:	4501                	li	a0,0
ffffffffc020122a:	70a2                	ld	ra,40(sp)
ffffffffc020122c:	7402                	ld	s0,32(sp)
ffffffffc020122e:	64e2                	ld	s1,24(sp)
ffffffffc0201230:	6942                	ld	s2,16(sp)
ffffffffc0201232:	69a2                	ld	s3,8(sp)
ffffffffc0201234:	6a02                	ld	s4,0(sp)
ffffffffc0201236:	6145                	addi	sp,sp,48
ffffffffc0201238:	8082                	ret
ffffffffc020123a:	c02007b7          	lui	a5,0xc0200
ffffffffc020123e:	4501                	li	a0,0
ffffffffc0201240:	fef5e5e3          	bltu	a1,a5,ffffffffc020122a <user_mem_check+0x64>
ffffffffc0201244:	962e                	add	a2,a2,a1
ffffffffc0201246:	fec5f2e3          	bgeu	a1,a2,ffffffffc020122a <user_mem_check+0x64>
ffffffffc020124a:	c8000537          	lui	a0,0xc8000
ffffffffc020124e:	0505                	addi	a0,a0,1
ffffffffc0201250:	00a63533          	sltu	a0,a2,a0
ffffffffc0201254:	bfd9                	j	ffffffffc020122a <user_mem_check+0x64>
ffffffffc0201256:	4505                	li	a0,1
ffffffffc0201258:	bfc9                	j	ffffffffc020122a <user_mem_check+0x64>

ffffffffc020125a <swap_init>:
ffffffffc020125a:	1101                	addi	sp,sp,-32
ffffffffc020125c:	ec06                	sd	ra,24(sp)
ffffffffc020125e:	e822                	sd	s0,16(sp)
ffffffffc0201260:	e426                	sd	s1,8(sp)
ffffffffc0201262:	2b2020ef          	jal	ra,ffffffffc0203514 <swapfs_init>
ffffffffc0201266:	00018697          	auipc	a3,0x18
ffffffffc020126a:	35a6b683          	ld	a3,858(a3) # ffffffffc02195c0 <max_swap_offset>
ffffffffc020126e:	010007b7          	lui	a5,0x1000
ffffffffc0201272:	ff968713          	addi	a4,a3,-7
ffffffffc0201276:	17e1                	addi	a5,a5,-8
ffffffffc0201278:	04e7e863          	bltu	a5,a4,ffffffffc02012c8 <swap_init+0x6e>
ffffffffc020127c:	0000d797          	auipc	a5,0xd
ffffffffc0201280:	d9478793          	addi	a5,a5,-620 # ffffffffc020e010 <swap_manager_fifo>
ffffffffc0201284:	6798                	ld	a4,8(a5)
ffffffffc0201286:	00018497          	auipc	s1,0x18
ffffffffc020128a:	24a48493          	addi	s1,s1,586 # ffffffffc02194d0 <sm>
ffffffffc020128e:	e09c                	sd	a5,0(s1)
ffffffffc0201290:	9702                	jalr	a4
ffffffffc0201292:	842a                	mv	s0,a0
ffffffffc0201294:	c519                	beqz	a0,ffffffffc02012a2 <swap_init+0x48>
ffffffffc0201296:	60e2                	ld	ra,24(sp)
ffffffffc0201298:	8522                	mv	a0,s0
ffffffffc020129a:	6442                	ld	s0,16(sp)
ffffffffc020129c:	64a2                	ld	s1,8(sp)
ffffffffc020129e:	6105                	addi	sp,sp,32
ffffffffc02012a0:	8082                	ret
ffffffffc02012a2:	609c                	ld	a5,0(s1)
ffffffffc02012a4:	00008517          	auipc	a0,0x8
ffffffffc02012a8:	80450513          	addi	a0,a0,-2044 # ffffffffc0208aa8 <commands+0x8e8>
ffffffffc02012ac:	638c                	ld	a1,0(a5)
ffffffffc02012ae:	4785                	li	a5,1
ffffffffc02012b0:	00018717          	auipc	a4,0x18
ffffffffc02012b4:	22f72423          	sw	a5,552(a4) # ffffffffc02194d8 <swap_init_ok>
ffffffffc02012b8:	e15fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02012bc:	60e2                	ld	ra,24(sp)
ffffffffc02012be:	8522                	mv	a0,s0
ffffffffc02012c0:	6442                	ld	s0,16(sp)
ffffffffc02012c2:	64a2                	ld	s1,8(sp)
ffffffffc02012c4:	6105                	addi	sp,sp,32
ffffffffc02012c6:	8082                	ret
ffffffffc02012c8:	00007617          	auipc	a2,0x7
ffffffffc02012cc:	7b060613          	addi	a2,a2,1968 # ffffffffc0208a78 <commands+0x8b8>
ffffffffc02012d0:	02800593          	li	a1,40
ffffffffc02012d4:	00007517          	auipc	a0,0x7
ffffffffc02012d8:	7c450513          	addi	a0,a0,1988 # ffffffffc0208a98 <commands+0x8d8>
ffffffffc02012dc:	f2dfe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02012e0 <swap_init_mm>:
ffffffffc02012e0:	00018797          	auipc	a5,0x18
ffffffffc02012e4:	1f07b783          	ld	a5,496(a5) # ffffffffc02194d0 <sm>
ffffffffc02012e8:	0107b303          	ld	t1,16(a5)
ffffffffc02012ec:	8302                	jr	t1

ffffffffc02012ee <swap_map_swappable>:
ffffffffc02012ee:	00018797          	auipc	a5,0x18
ffffffffc02012f2:	1e27b783          	ld	a5,482(a5) # ffffffffc02194d0 <sm>
ffffffffc02012f6:	0207b303          	ld	t1,32(a5)
ffffffffc02012fa:	8302                	jr	t1

ffffffffc02012fc <swap_out>:
ffffffffc02012fc:	711d                	addi	sp,sp,-96
ffffffffc02012fe:	ec86                	sd	ra,88(sp)
ffffffffc0201300:	e8a2                	sd	s0,80(sp)
ffffffffc0201302:	e4a6                	sd	s1,72(sp)
ffffffffc0201304:	e0ca                	sd	s2,64(sp)
ffffffffc0201306:	fc4e                	sd	s3,56(sp)
ffffffffc0201308:	f852                	sd	s4,48(sp)
ffffffffc020130a:	f456                	sd	s5,40(sp)
ffffffffc020130c:	f05a                	sd	s6,32(sp)
ffffffffc020130e:	ec5e                	sd	s7,24(sp)
ffffffffc0201310:	e862                	sd	s8,16(sp)
ffffffffc0201312:	cde9                	beqz	a1,ffffffffc02013ec <swap_out+0xf0>
ffffffffc0201314:	8a2e                	mv	s4,a1
ffffffffc0201316:	892a                	mv	s2,a0
ffffffffc0201318:	8ab2                	mv	s5,a2
ffffffffc020131a:	4401                	li	s0,0
ffffffffc020131c:	00018997          	auipc	s3,0x18
ffffffffc0201320:	1b498993          	addi	s3,s3,436 # ffffffffc02194d0 <sm>
ffffffffc0201324:	00007b17          	auipc	s6,0x7
ffffffffc0201328:	7fcb0b13          	addi	s6,s6,2044 # ffffffffc0208b20 <commands+0x960>
ffffffffc020132c:	00007b97          	auipc	s7,0x7
ffffffffc0201330:	7dcb8b93          	addi	s7,s7,2012 # ffffffffc0208b08 <commands+0x948>
ffffffffc0201334:	a825                	j	ffffffffc020136c <swap_out+0x70>
ffffffffc0201336:	67a2                	ld	a5,8(sp)
ffffffffc0201338:	8626                	mv	a2,s1
ffffffffc020133a:	85a2                	mv	a1,s0
ffffffffc020133c:	7f94                	ld	a3,56(a5)
ffffffffc020133e:	855a                	mv	a0,s6
ffffffffc0201340:	2405                	addiw	s0,s0,1
ffffffffc0201342:	82b1                	srli	a3,a3,0xc
ffffffffc0201344:	0685                	addi	a3,a3,1
ffffffffc0201346:	d87fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020134a:	6522                	ld	a0,8(sp)
ffffffffc020134c:	4585                	li	a1,1
ffffffffc020134e:	7d1c                	ld	a5,56(a0)
ffffffffc0201350:	83b1                	srli	a5,a5,0xc
ffffffffc0201352:	0785                	addi	a5,a5,1
ffffffffc0201354:	07a2                	slli	a5,a5,0x8
ffffffffc0201356:	00fc3023          	sd	a5,0(s8)
ffffffffc020135a:	416010ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc020135e:	01893503          	ld	a0,24(s2)
ffffffffc0201362:	85a6                	mv	a1,s1
ffffffffc0201364:	4b1010ef          	jal	ra,ffffffffc0203014 <tlb_invalidate>
ffffffffc0201368:	048a0d63          	beq	s4,s0,ffffffffc02013c2 <swap_out+0xc6>
ffffffffc020136c:	0009b783          	ld	a5,0(s3)
ffffffffc0201370:	8656                	mv	a2,s5
ffffffffc0201372:	002c                	addi	a1,sp,8
ffffffffc0201374:	7b9c                	ld	a5,48(a5)
ffffffffc0201376:	854a                	mv	a0,s2
ffffffffc0201378:	9782                	jalr	a5
ffffffffc020137a:	e12d                	bnez	a0,ffffffffc02013dc <swap_out+0xe0>
ffffffffc020137c:	67a2                	ld	a5,8(sp)
ffffffffc020137e:	01893503          	ld	a0,24(s2)
ffffffffc0201382:	4601                	li	a2,0
ffffffffc0201384:	7f84                	ld	s1,56(a5)
ffffffffc0201386:	85a6                	mv	a1,s1
ffffffffc0201388:	5ba010ef          	jal	ra,ffffffffc0202942 <get_pte>
ffffffffc020138c:	611c                	ld	a5,0(a0)
ffffffffc020138e:	8c2a                	mv	s8,a0
ffffffffc0201390:	8b85                	andi	a5,a5,1
ffffffffc0201392:	cfb9                	beqz	a5,ffffffffc02013f0 <swap_out+0xf4>
ffffffffc0201394:	65a2                	ld	a1,8(sp)
ffffffffc0201396:	7d9c                	ld	a5,56(a1)
ffffffffc0201398:	83b1                	srli	a5,a5,0xc
ffffffffc020139a:	0785                	addi	a5,a5,1
ffffffffc020139c:	00879513          	slli	a0,a5,0x8
ffffffffc02013a0:	23a020ef          	jal	ra,ffffffffc02035da <swapfs_write>
ffffffffc02013a4:	d949                	beqz	a0,ffffffffc0201336 <swap_out+0x3a>
ffffffffc02013a6:	855e                	mv	a0,s7
ffffffffc02013a8:	d25fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02013ac:	0009b783          	ld	a5,0(s3)
ffffffffc02013b0:	6622                	ld	a2,8(sp)
ffffffffc02013b2:	4681                	li	a3,0
ffffffffc02013b4:	739c                	ld	a5,32(a5)
ffffffffc02013b6:	85a6                	mv	a1,s1
ffffffffc02013b8:	854a                	mv	a0,s2
ffffffffc02013ba:	2405                	addiw	s0,s0,1
ffffffffc02013bc:	9782                	jalr	a5
ffffffffc02013be:	fa8a17e3          	bne	s4,s0,ffffffffc020136c <swap_out+0x70>
ffffffffc02013c2:	60e6                	ld	ra,88(sp)
ffffffffc02013c4:	8522                	mv	a0,s0
ffffffffc02013c6:	6446                	ld	s0,80(sp)
ffffffffc02013c8:	64a6                	ld	s1,72(sp)
ffffffffc02013ca:	6906                	ld	s2,64(sp)
ffffffffc02013cc:	79e2                	ld	s3,56(sp)
ffffffffc02013ce:	7a42                	ld	s4,48(sp)
ffffffffc02013d0:	7aa2                	ld	s5,40(sp)
ffffffffc02013d2:	7b02                	ld	s6,32(sp)
ffffffffc02013d4:	6be2                	ld	s7,24(sp)
ffffffffc02013d6:	6c42                	ld	s8,16(sp)
ffffffffc02013d8:	6125                	addi	sp,sp,96
ffffffffc02013da:	8082                	ret
ffffffffc02013dc:	85a2                	mv	a1,s0
ffffffffc02013de:	00007517          	auipc	a0,0x7
ffffffffc02013e2:	6e250513          	addi	a0,a0,1762 # ffffffffc0208ac0 <commands+0x900>
ffffffffc02013e6:	ce7fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02013ea:	bfe1                	j	ffffffffc02013c2 <swap_out+0xc6>
ffffffffc02013ec:	4401                	li	s0,0
ffffffffc02013ee:	bfd1                	j	ffffffffc02013c2 <swap_out+0xc6>
ffffffffc02013f0:	00007697          	auipc	a3,0x7
ffffffffc02013f4:	70068693          	addi	a3,a3,1792 # ffffffffc0208af0 <commands+0x930>
ffffffffc02013f8:	00007617          	auipc	a2,0x7
ffffffffc02013fc:	1d860613          	addi	a2,a2,472 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201400:	06800593          	li	a1,104
ffffffffc0201404:	00007517          	auipc	a0,0x7
ffffffffc0201408:	69450513          	addi	a0,a0,1684 # ffffffffc0208a98 <commands+0x8d8>
ffffffffc020140c:	dfdfe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201410 <swap_in>:
ffffffffc0201410:	7179                	addi	sp,sp,-48
ffffffffc0201412:	e84a                	sd	s2,16(sp)
ffffffffc0201414:	892a                	mv	s2,a0
ffffffffc0201416:	4505                	li	a0,1
ffffffffc0201418:	ec26                	sd	s1,24(sp)
ffffffffc020141a:	e44e                	sd	s3,8(sp)
ffffffffc020141c:	f406                	sd	ra,40(sp)
ffffffffc020141e:	f022                	sd	s0,32(sp)
ffffffffc0201420:	84ae                	mv	s1,a1
ffffffffc0201422:	89b2                	mv	s3,a2
ffffffffc0201424:	2ba010ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201428:	c129                	beqz	a0,ffffffffc020146a <swap_in+0x5a>
ffffffffc020142a:	842a                	mv	s0,a0
ffffffffc020142c:	01893503          	ld	a0,24(s2)
ffffffffc0201430:	4601                	li	a2,0
ffffffffc0201432:	85a6                	mv	a1,s1
ffffffffc0201434:	50e010ef          	jal	ra,ffffffffc0202942 <get_pte>
ffffffffc0201438:	892a                	mv	s2,a0
ffffffffc020143a:	6108                	ld	a0,0(a0)
ffffffffc020143c:	85a2                	mv	a1,s0
ffffffffc020143e:	10e020ef          	jal	ra,ffffffffc020354c <swapfs_read>
ffffffffc0201442:	00093583          	ld	a1,0(s2)
ffffffffc0201446:	8626                	mv	a2,s1
ffffffffc0201448:	00007517          	auipc	a0,0x7
ffffffffc020144c:	72850513          	addi	a0,a0,1832 # ffffffffc0208b70 <commands+0x9b0>
ffffffffc0201450:	81a1                	srli	a1,a1,0x8
ffffffffc0201452:	c7bfe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201456:	70a2                	ld	ra,40(sp)
ffffffffc0201458:	0089b023          	sd	s0,0(s3)
ffffffffc020145c:	7402                	ld	s0,32(sp)
ffffffffc020145e:	64e2                	ld	s1,24(sp)
ffffffffc0201460:	6942                	ld	s2,16(sp)
ffffffffc0201462:	69a2                	ld	s3,8(sp)
ffffffffc0201464:	4501                	li	a0,0
ffffffffc0201466:	6145                	addi	sp,sp,48
ffffffffc0201468:	8082                	ret
ffffffffc020146a:	00007697          	auipc	a3,0x7
ffffffffc020146e:	6f668693          	addi	a3,a3,1782 # ffffffffc0208b60 <commands+0x9a0>
ffffffffc0201472:	00007617          	auipc	a2,0x7
ffffffffc0201476:	15e60613          	addi	a2,a2,350 # ffffffffc02085d0 <commands+0x410>
ffffffffc020147a:	07e00593          	li	a1,126
ffffffffc020147e:	00007517          	auipc	a0,0x7
ffffffffc0201482:	61a50513          	addi	a0,a0,1562 # ffffffffc0208a98 <commands+0x8d8>
ffffffffc0201486:	d83fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020148a <slob_free>:
ffffffffc020148a:	c145                	beqz	a0,ffffffffc020152a <slob_free+0xa0>
ffffffffc020148c:	1141                	addi	sp,sp,-16
ffffffffc020148e:	e022                	sd	s0,0(sp)
ffffffffc0201490:	e406                	sd	ra,8(sp)
ffffffffc0201492:	842a                	mv	s0,a0
ffffffffc0201494:	edb1                	bnez	a1,ffffffffc02014f0 <slob_free+0x66>
ffffffffc0201496:	100027f3          	csrr	a5,sstatus
ffffffffc020149a:	8b89                	andi	a5,a5,2
ffffffffc020149c:	4501                	li	a0,0
ffffffffc020149e:	e3ad                	bnez	a5,ffffffffc0201500 <slob_free+0x76>
ffffffffc02014a0:	0000d617          	auipc	a2,0xd
ffffffffc02014a4:	be060613          	addi	a2,a2,-1056 # ffffffffc020e080 <slobfree>
ffffffffc02014a8:	621c                	ld	a5,0(a2)
ffffffffc02014aa:	6798                	ld	a4,8(a5)
ffffffffc02014ac:	0087fa63          	bgeu	a5,s0,ffffffffc02014c0 <slob_free+0x36>
ffffffffc02014b0:	00e46c63          	bltu	s0,a4,ffffffffc02014c8 <slob_free+0x3e>
ffffffffc02014b4:	00e7fa63          	bgeu	a5,a4,ffffffffc02014c8 <slob_free+0x3e>
ffffffffc02014b8:	87ba                	mv	a5,a4
ffffffffc02014ba:	6798                	ld	a4,8(a5)
ffffffffc02014bc:	fe87eae3          	bltu	a5,s0,ffffffffc02014b0 <slob_free+0x26>
ffffffffc02014c0:	fee7ece3          	bltu	a5,a4,ffffffffc02014b8 <slob_free+0x2e>
ffffffffc02014c4:	fee47ae3          	bgeu	s0,a4,ffffffffc02014b8 <slob_free+0x2e>
ffffffffc02014c8:	400c                	lw	a1,0(s0)
ffffffffc02014ca:	00459693          	slli	a3,a1,0x4
ffffffffc02014ce:	96a2                	add	a3,a3,s0
ffffffffc02014d0:	04d70763          	beq	a4,a3,ffffffffc020151e <slob_free+0x94>
ffffffffc02014d4:	e418                	sd	a4,8(s0)
ffffffffc02014d6:	4394                	lw	a3,0(a5)
ffffffffc02014d8:	00469713          	slli	a4,a3,0x4
ffffffffc02014dc:	973e                	add	a4,a4,a5
ffffffffc02014de:	02e40a63          	beq	s0,a4,ffffffffc0201512 <slob_free+0x88>
ffffffffc02014e2:	e780                	sd	s0,8(a5)
ffffffffc02014e4:	e21c                	sd	a5,0(a2)
ffffffffc02014e6:	e10d                	bnez	a0,ffffffffc0201508 <slob_free+0x7e>
ffffffffc02014e8:	60a2                	ld	ra,8(sp)
ffffffffc02014ea:	6402                	ld	s0,0(sp)
ffffffffc02014ec:	0141                	addi	sp,sp,16
ffffffffc02014ee:	8082                	ret
ffffffffc02014f0:	05bd                	addi	a1,a1,15
ffffffffc02014f2:	8191                	srli	a1,a1,0x4
ffffffffc02014f4:	c10c                	sw	a1,0(a0)
ffffffffc02014f6:	100027f3          	csrr	a5,sstatus
ffffffffc02014fa:	8b89                	andi	a5,a5,2
ffffffffc02014fc:	4501                	li	a0,0
ffffffffc02014fe:	d3cd                	beqz	a5,ffffffffc02014a0 <slob_free+0x16>
ffffffffc0201500:	938ff0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0201504:	4505                	li	a0,1
ffffffffc0201506:	bf69                	j	ffffffffc02014a0 <slob_free+0x16>
ffffffffc0201508:	6402                	ld	s0,0(sp)
ffffffffc020150a:	60a2                	ld	ra,8(sp)
ffffffffc020150c:	0141                	addi	sp,sp,16
ffffffffc020150e:	924ff06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0201512:	4018                	lw	a4,0(s0)
ffffffffc0201514:	640c                	ld	a1,8(s0)
ffffffffc0201516:	9eb9                	addw	a3,a3,a4
ffffffffc0201518:	c394                	sw	a3,0(a5)
ffffffffc020151a:	e78c                	sd	a1,8(a5)
ffffffffc020151c:	b7e1                	j	ffffffffc02014e4 <slob_free+0x5a>
ffffffffc020151e:	4314                	lw	a3,0(a4)
ffffffffc0201520:	6718                	ld	a4,8(a4)
ffffffffc0201522:	9db5                	addw	a1,a1,a3
ffffffffc0201524:	c00c                	sw	a1,0(s0)
ffffffffc0201526:	e418                	sd	a4,8(s0)
ffffffffc0201528:	b77d                	j	ffffffffc02014d6 <slob_free+0x4c>
ffffffffc020152a:	8082                	ret

ffffffffc020152c <__slob_get_free_pages.isra.0>:
ffffffffc020152c:	4785                	li	a5,1
ffffffffc020152e:	1141                	addi	sp,sp,-16
ffffffffc0201530:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201534:	e406                	sd	ra,8(sp)
ffffffffc0201536:	1a8010ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc020153a:	c91d                	beqz	a0,ffffffffc0201570 <__slob_get_free_pages.isra.0+0x44>
ffffffffc020153c:	00018697          	auipc	a3,0x18
ffffffffc0201540:	1046b683          	ld	a3,260(a3) # ffffffffc0219640 <pages>
ffffffffc0201544:	8d15                	sub	a0,a0,a3
ffffffffc0201546:	8519                	srai	a0,a0,0x6
ffffffffc0201548:	00009697          	auipc	a3,0x9
ffffffffc020154c:	0d06b683          	ld	a3,208(a3) # ffffffffc020a618 <nbase>
ffffffffc0201550:	9536                	add	a0,a0,a3
ffffffffc0201552:	00c51793          	slli	a5,a0,0xc
ffffffffc0201556:	83b1                	srli	a5,a5,0xc
ffffffffc0201558:	00018717          	auipc	a4,0x18
ffffffffc020155c:	f9873703          	ld	a4,-104(a4) # ffffffffc02194f0 <npage>
ffffffffc0201560:	0532                	slli	a0,a0,0xc
ffffffffc0201562:	00e7fa63          	bgeu	a5,a4,ffffffffc0201576 <__slob_get_free_pages.isra.0+0x4a>
ffffffffc0201566:	00018697          	auipc	a3,0x18
ffffffffc020156a:	0ca6b683          	ld	a3,202(a3) # ffffffffc0219630 <va_pa_offset>
ffffffffc020156e:	9536                	add	a0,a0,a3
ffffffffc0201570:	60a2                	ld	ra,8(sp)
ffffffffc0201572:	0141                	addi	sp,sp,16
ffffffffc0201574:	8082                	ret
ffffffffc0201576:	86aa                	mv	a3,a0
ffffffffc0201578:	00007617          	auipc	a2,0x7
ffffffffc020157c:	63860613          	addi	a2,a2,1592 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc0201580:	06900593          	li	a1,105
ffffffffc0201584:	00007517          	auipc	a0,0x7
ffffffffc0201588:	65450513          	addi	a0,a0,1620 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc020158c:	c7dfe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201590 <slob_alloc.isra.0.constprop.0>:
ffffffffc0201590:	1101                	addi	sp,sp,-32
ffffffffc0201592:	ec06                	sd	ra,24(sp)
ffffffffc0201594:	e822                	sd	s0,16(sp)
ffffffffc0201596:	e426                	sd	s1,8(sp)
ffffffffc0201598:	e04a                	sd	s2,0(sp)
ffffffffc020159a:	01050713          	addi	a4,a0,16
ffffffffc020159e:	6785                	lui	a5,0x1
ffffffffc02015a0:	0cf77363          	bgeu	a4,a5,ffffffffc0201666 <slob_alloc.isra.0.constprop.0+0xd6>
ffffffffc02015a4:	00f50493          	addi	s1,a0,15
ffffffffc02015a8:	8091                	srli	s1,s1,0x4
ffffffffc02015aa:	2481                	sext.w	s1,s1
ffffffffc02015ac:	10002673          	csrr	a2,sstatus
ffffffffc02015b0:	8a09                	andi	a2,a2,2
ffffffffc02015b2:	e25d                	bnez	a2,ffffffffc0201658 <slob_alloc.isra.0.constprop.0+0xc8>
ffffffffc02015b4:	0000d917          	auipc	s2,0xd
ffffffffc02015b8:	acc90913          	addi	s2,s2,-1332 # ffffffffc020e080 <slobfree>
ffffffffc02015bc:	00093683          	ld	a3,0(s2)
ffffffffc02015c0:	669c                	ld	a5,8(a3)
ffffffffc02015c2:	4398                	lw	a4,0(a5)
ffffffffc02015c4:	08975e63          	bge	a4,s1,ffffffffc0201660 <slob_alloc.isra.0.constprop.0+0xd0>
ffffffffc02015c8:	00d78b63          	beq	a5,a3,ffffffffc02015de <slob_alloc.isra.0.constprop.0+0x4e>
ffffffffc02015cc:	6780                	ld	s0,8(a5)
ffffffffc02015ce:	4018                	lw	a4,0(s0)
ffffffffc02015d0:	02975a63          	bge	a4,s1,ffffffffc0201604 <slob_alloc.isra.0.constprop.0+0x74>
ffffffffc02015d4:	00093683          	ld	a3,0(s2)
ffffffffc02015d8:	87a2                	mv	a5,s0
ffffffffc02015da:	fed799e3          	bne	a5,a3,ffffffffc02015cc <slob_alloc.isra.0.constprop.0+0x3c>
ffffffffc02015de:	ee31                	bnez	a2,ffffffffc020163a <slob_alloc.isra.0.constprop.0+0xaa>
ffffffffc02015e0:	4501                	li	a0,0
ffffffffc02015e2:	f4bff0ef          	jal	ra,ffffffffc020152c <__slob_get_free_pages.isra.0>
ffffffffc02015e6:	842a                	mv	s0,a0
ffffffffc02015e8:	cd05                	beqz	a0,ffffffffc0201620 <slob_alloc.isra.0.constprop.0+0x90>
ffffffffc02015ea:	6585                	lui	a1,0x1
ffffffffc02015ec:	e9fff0ef          	jal	ra,ffffffffc020148a <slob_free>
ffffffffc02015f0:	10002673          	csrr	a2,sstatus
ffffffffc02015f4:	8a09                	andi	a2,a2,2
ffffffffc02015f6:	ee05                	bnez	a2,ffffffffc020162e <slob_alloc.isra.0.constprop.0+0x9e>
ffffffffc02015f8:	00093783          	ld	a5,0(s2)
ffffffffc02015fc:	6780                	ld	s0,8(a5)
ffffffffc02015fe:	4018                	lw	a4,0(s0)
ffffffffc0201600:	fc974ae3          	blt	a4,s1,ffffffffc02015d4 <slob_alloc.isra.0.constprop.0+0x44>
ffffffffc0201604:	04e48763          	beq	s1,a4,ffffffffc0201652 <slob_alloc.isra.0.constprop.0+0xc2>
ffffffffc0201608:	00449693          	slli	a3,s1,0x4
ffffffffc020160c:	96a2                	add	a3,a3,s0
ffffffffc020160e:	e794                	sd	a3,8(a5)
ffffffffc0201610:	640c                	ld	a1,8(s0)
ffffffffc0201612:	9f05                	subw	a4,a4,s1
ffffffffc0201614:	c298                	sw	a4,0(a3)
ffffffffc0201616:	e68c                	sd	a1,8(a3)
ffffffffc0201618:	c004                	sw	s1,0(s0)
ffffffffc020161a:	00f93023          	sd	a5,0(s2)
ffffffffc020161e:	e20d                	bnez	a2,ffffffffc0201640 <slob_alloc.isra.0.constprop.0+0xb0>
ffffffffc0201620:	60e2                	ld	ra,24(sp)
ffffffffc0201622:	8522                	mv	a0,s0
ffffffffc0201624:	6442                	ld	s0,16(sp)
ffffffffc0201626:	64a2                	ld	s1,8(sp)
ffffffffc0201628:	6902                	ld	s2,0(sp)
ffffffffc020162a:	6105                	addi	sp,sp,32
ffffffffc020162c:	8082                	ret
ffffffffc020162e:	80aff0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0201632:	00093783          	ld	a5,0(s2)
ffffffffc0201636:	4605                	li	a2,1
ffffffffc0201638:	b7d1                	j	ffffffffc02015fc <slob_alloc.isra.0.constprop.0+0x6c>
ffffffffc020163a:	ff9fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020163e:	b74d                	j	ffffffffc02015e0 <slob_alloc.isra.0.constprop.0+0x50>
ffffffffc0201640:	ff3fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0201644:	60e2                	ld	ra,24(sp)
ffffffffc0201646:	8522                	mv	a0,s0
ffffffffc0201648:	6442                	ld	s0,16(sp)
ffffffffc020164a:	64a2                	ld	s1,8(sp)
ffffffffc020164c:	6902                	ld	s2,0(sp)
ffffffffc020164e:	6105                	addi	sp,sp,32
ffffffffc0201650:	8082                	ret
ffffffffc0201652:	6418                	ld	a4,8(s0)
ffffffffc0201654:	e798                	sd	a4,8(a5)
ffffffffc0201656:	b7d1                	j	ffffffffc020161a <slob_alloc.isra.0.constprop.0+0x8a>
ffffffffc0201658:	fe1fe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc020165c:	4605                	li	a2,1
ffffffffc020165e:	bf99                	j	ffffffffc02015b4 <slob_alloc.isra.0.constprop.0+0x24>
ffffffffc0201660:	843e                	mv	s0,a5
ffffffffc0201662:	87b6                	mv	a5,a3
ffffffffc0201664:	b745                	j	ffffffffc0201604 <slob_alloc.isra.0.constprop.0+0x74>
ffffffffc0201666:	00007697          	auipc	a3,0x7
ffffffffc020166a:	58268693          	addi	a3,a3,1410 # ffffffffc0208be8 <commands+0xa28>
ffffffffc020166e:	00007617          	auipc	a2,0x7
ffffffffc0201672:	f6260613          	addi	a2,a2,-158 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201676:	06400593          	li	a1,100
ffffffffc020167a:	00007517          	auipc	a0,0x7
ffffffffc020167e:	58e50513          	addi	a0,a0,1422 # ffffffffc0208c08 <commands+0xa48>
ffffffffc0201682:	b87fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201686 <kallocated>:
ffffffffc0201686:	4501                	li	a0,0
ffffffffc0201688:	8082                	ret

ffffffffc020168a <kmalloc>:
ffffffffc020168a:	1101                	addi	sp,sp,-32
ffffffffc020168c:	e04a                	sd	s2,0(sp)
ffffffffc020168e:	6905                	lui	s2,0x1
ffffffffc0201690:	e822                	sd	s0,16(sp)
ffffffffc0201692:	ec06                	sd	ra,24(sp)
ffffffffc0201694:	e426                	sd	s1,8(sp)
ffffffffc0201696:	fef90793          	addi	a5,s2,-17 # fef <kern_entry-0xffffffffc01ff011>
ffffffffc020169a:	842a                	mv	s0,a0
ffffffffc020169c:	04a7f963          	bgeu	a5,a0,ffffffffc02016ee <kmalloc+0x64>
ffffffffc02016a0:	4561                	li	a0,24
ffffffffc02016a2:	eefff0ef          	jal	ra,ffffffffc0201590 <slob_alloc.isra.0.constprop.0>
ffffffffc02016a6:	84aa                	mv	s1,a0
ffffffffc02016a8:	c929                	beqz	a0,ffffffffc02016fa <kmalloc+0x70>
ffffffffc02016aa:	0004079b          	sext.w	a5,s0
ffffffffc02016ae:	4501                	li	a0,0
ffffffffc02016b0:	00f95763          	bge	s2,a5,ffffffffc02016be <kmalloc+0x34>
ffffffffc02016b4:	6705                	lui	a4,0x1
ffffffffc02016b6:	8785                	srai	a5,a5,0x1
ffffffffc02016b8:	2505                	addiw	a0,a0,1
ffffffffc02016ba:	fef74ee3          	blt	a4,a5,ffffffffc02016b6 <kmalloc+0x2c>
ffffffffc02016be:	c088                	sw	a0,0(s1)
ffffffffc02016c0:	e6dff0ef          	jal	ra,ffffffffc020152c <__slob_get_free_pages.isra.0>
ffffffffc02016c4:	e488                	sd	a0,8(s1)
ffffffffc02016c6:	842a                	mv	s0,a0
ffffffffc02016c8:	c525                	beqz	a0,ffffffffc0201730 <kmalloc+0xa6>
ffffffffc02016ca:	100027f3          	csrr	a5,sstatus
ffffffffc02016ce:	8b89                	andi	a5,a5,2
ffffffffc02016d0:	ef8d                	bnez	a5,ffffffffc020170a <kmalloc+0x80>
ffffffffc02016d2:	00018797          	auipc	a5,0x18
ffffffffc02016d6:	e0e78793          	addi	a5,a5,-498 # ffffffffc02194e0 <bigblocks>
ffffffffc02016da:	6398                	ld	a4,0(a5)
ffffffffc02016dc:	e384                	sd	s1,0(a5)
ffffffffc02016de:	e898                	sd	a4,16(s1)
ffffffffc02016e0:	60e2                	ld	ra,24(sp)
ffffffffc02016e2:	8522                	mv	a0,s0
ffffffffc02016e4:	6442                	ld	s0,16(sp)
ffffffffc02016e6:	64a2                	ld	s1,8(sp)
ffffffffc02016e8:	6902                	ld	s2,0(sp)
ffffffffc02016ea:	6105                	addi	sp,sp,32
ffffffffc02016ec:	8082                	ret
ffffffffc02016ee:	0541                	addi	a0,a0,16
ffffffffc02016f0:	ea1ff0ef          	jal	ra,ffffffffc0201590 <slob_alloc.isra.0.constprop.0>
ffffffffc02016f4:	01050413          	addi	s0,a0,16
ffffffffc02016f8:	f565                	bnez	a0,ffffffffc02016e0 <kmalloc+0x56>
ffffffffc02016fa:	4401                	li	s0,0
ffffffffc02016fc:	60e2                	ld	ra,24(sp)
ffffffffc02016fe:	8522                	mv	a0,s0
ffffffffc0201700:	6442                	ld	s0,16(sp)
ffffffffc0201702:	64a2                	ld	s1,8(sp)
ffffffffc0201704:	6902                	ld	s2,0(sp)
ffffffffc0201706:	6105                	addi	sp,sp,32
ffffffffc0201708:	8082                	ret
ffffffffc020170a:	f2ffe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc020170e:	00018797          	auipc	a5,0x18
ffffffffc0201712:	dd278793          	addi	a5,a5,-558 # ffffffffc02194e0 <bigblocks>
ffffffffc0201716:	6398                	ld	a4,0(a5)
ffffffffc0201718:	e384                	sd	s1,0(a5)
ffffffffc020171a:	e898                	sd	a4,16(s1)
ffffffffc020171c:	f17fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0201720:	6480                	ld	s0,8(s1)
ffffffffc0201722:	60e2                	ld	ra,24(sp)
ffffffffc0201724:	64a2                	ld	s1,8(sp)
ffffffffc0201726:	8522                	mv	a0,s0
ffffffffc0201728:	6442                	ld	s0,16(sp)
ffffffffc020172a:	6902                	ld	s2,0(sp)
ffffffffc020172c:	6105                	addi	sp,sp,32
ffffffffc020172e:	8082                	ret
ffffffffc0201730:	45e1                	li	a1,24
ffffffffc0201732:	8526                	mv	a0,s1
ffffffffc0201734:	d57ff0ef          	jal	ra,ffffffffc020148a <slob_free>
ffffffffc0201738:	b765                	j	ffffffffc02016e0 <kmalloc+0x56>

ffffffffc020173a <kfree>:
ffffffffc020173a:	c169                	beqz	a0,ffffffffc02017fc <kfree+0xc2>
ffffffffc020173c:	1101                	addi	sp,sp,-32
ffffffffc020173e:	e822                	sd	s0,16(sp)
ffffffffc0201740:	ec06                	sd	ra,24(sp)
ffffffffc0201742:	e426                	sd	s1,8(sp)
ffffffffc0201744:	03451793          	slli	a5,a0,0x34
ffffffffc0201748:	842a                	mv	s0,a0
ffffffffc020174a:	e7c9                	bnez	a5,ffffffffc02017d4 <kfree+0x9a>
ffffffffc020174c:	100027f3          	csrr	a5,sstatus
ffffffffc0201750:	8b89                	andi	a5,a5,2
ffffffffc0201752:	ebc9                	bnez	a5,ffffffffc02017e4 <kfree+0xaa>
ffffffffc0201754:	00018797          	auipc	a5,0x18
ffffffffc0201758:	d8c7b783          	ld	a5,-628(a5) # ffffffffc02194e0 <bigblocks>
ffffffffc020175c:	4601                	li	a2,0
ffffffffc020175e:	cbbd                	beqz	a5,ffffffffc02017d4 <kfree+0x9a>
ffffffffc0201760:	00018697          	auipc	a3,0x18
ffffffffc0201764:	d8068693          	addi	a3,a3,-640 # ffffffffc02194e0 <bigblocks>
ffffffffc0201768:	a021                	j	ffffffffc0201770 <kfree+0x36>
ffffffffc020176a:	01048693          	addi	a3,s1,16
ffffffffc020176e:	c3a5                	beqz	a5,ffffffffc02017ce <kfree+0x94>
ffffffffc0201770:	6798                	ld	a4,8(a5)
ffffffffc0201772:	84be                	mv	s1,a5
ffffffffc0201774:	6b9c                	ld	a5,16(a5)
ffffffffc0201776:	fe871ae3          	bne	a4,s0,ffffffffc020176a <kfree+0x30>
ffffffffc020177a:	e29c                	sd	a5,0(a3)
ffffffffc020177c:	ee2d                	bnez	a2,ffffffffc02017f6 <kfree+0xbc>
ffffffffc020177e:	c02007b7          	lui	a5,0xc0200
ffffffffc0201782:	4098                	lw	a4,0(s1)
ffffffffc0201784:	08f46963          	bltu	s0,a5,ffffffffc0201816 <kfree+0xdc>
ffffffffc0201788:	00018697          	auipc	a3,0x18
ffffffffc020178c:	ea86b683          	ld	a3,-344(a3) # ffffffffc0219630 <va_pa_offset>
ffffffffc0201790:	8c15                	sub	s0,s0,a3
ffffffffc0201792:	8031                	srli	s0,s0,0xc
ffffffffc0201794:	00018797          	auipc	a5,0x18
ffffffffc0201798:	d5c7b783          	ld	a5,-676(a5) # ffffffffc02194f0 <npage>
ffffffffc020179c:	06f47163          	bgeu	s0,a5,ffffffffc02017fe <kfree+0xc4>
ffffffffc02017a0:	00009517          	auipc	a0,0x9
ffffffffc02017a4:	e7853503          	ld	a0,-392(a0) # ffffffffc020a618 <nbase>
ffffffffc02017a8:	8c09                	sub	s0,s0,a0
ffffffffc02017aa:	041a                	slli	s0,s0,0x6
ffffffffc02017ac:	00018517          	auipc	a0,0x18
ffffffffc02017b0:	e9453503          	ld	a0,-364(a0) # ffffffffc0219640 <pages>
ffffffffc02017b4:	4585                	li	a1,1
ffffffffc02017b6:	9522                	add	a0,a0,s0
ffffffffc02017b8:	00e595bb          	sllw	a1,a1,a4
ffffffffc02017bc:	7b5000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc02017c0:	6442                	ld	s0,16(sp)
ffffffffc02017c2:	60e2                	ld	ra,24(sp)
ffffffffc02017c4:	8526                	mv	a0,s1
ffffffffc02017c6:	64a2                	ld	s1,8(sp)
ffffffffc02017c8:	45e1                	li	a1,24
ffffffffc02017ca:	6105                	addi	sp,sp,32
ffffffffc02017cc:	b97d                	j	ffffffffc020148a <slob_free>
ffffffffc02017ce:	c219                	beqz	a2,ffffffffc02017d4 <kfree+0x9a>
ffffffffc02017d0:	e63fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc02017d4:	ff040513          	addi	a0,s0,-16
ffffffffc02017d8:	6442                	ld	s0,16(sp)
ffffffffc02017da:	60e2                	ld	ra,24(sp)
ffffffffc02017dc:	64a2                	ld	s1,8(sp)
ffffffffc02017de:	4581                	li	a1,0
ffffffffc02017e0:	6105                	addi	sp,sp,32
ffffffffc02017e2:	b165                	j	ffffffffc020148a <slob_free>
ffffffffc02017e4:	e55fe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02017e8:	00018797          	auipc	a5,0x18
ffffffffc02017ec:	cf87b783          	ld	a5,-776(a5) # ffffffffc02194e0 <bigblocks>
ffffffffc02017f0:	4605                	li	a2,1
ffffffffc02017f2:	f7bd                	bnez	a5,ffffffffc0201760 <kfree+0x26>
ffffffffc02017f4:	bff1                	j	ffffffffc02017d0 <kfree+0x96>
ffffffffc02017f6:	e3dfe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc02017fa:	b751                	j	ffffffffc020177e <kfree+0x44>
ffffffffc02017fc:	8082                	ret
ffffffffc02017fe:	00007617          	auipc	a2,0x7
ffffffffc0201802:	44a60613          	addi	a2,a2,1098 # ffffffffc0208c48 <commands+0xa88>
ffffffffc0201806:	06200593          	li	a1,98
ffffffffc020180a:	00007517          	auipc	a0,0x7
ffffffffc020180e:	3ce50513          	addi	a0,a0,974 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0201812:	9f7fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201816:	86a2                	mv	a3,s0
ffffffffc0201818:	00007617          	auipc	a2,0x7
ffffffffc020181c:	40860613          	addi	a2,a2,1032 # ffffffffc0208c20 <commands+0xa60>
ffffffffc0201820:	06e00593          	li	a1,110
ffffffffc0201824:	00007517          	auipc	a0,0x7
ffffffffc0201828:	3b450513          	addi	a0,a0,948 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc020182c:	9ddfe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201830 <_fifo_init_mm>:
ffffffffc0201830:	00018797          	auipc	a5,0x18
ffffffffc0201834:	dd078793          	addi	a5,a5,-560 # ffffffffc0219600 <pra_list_head>
ffffffffc0201838:	f51c                	sd	a5,40(a0)
ffffffffc020183a:	e79c                	sd	a5,8(a5)
ffffffffc020183c:	e39c                	sd	a5,0(a5)
ffffffffc020183e:	4501                	li	a0,0
ffffffffc0201840:	8082                	ret

ffffffffc0201842 <_fifo_init>:
ffffffffc0201842:	4501                	li	a0,0
ffffffffc0201844:	8082                	ret

ffffffffc0201846 <_fifo_set_unswappable>:
ffffffffc0201846:	4501                	li	a0,0
ffffffffc0201848:	8082                	ret

ffffffffc020184a <_fifo_tick_event>:
ffffffffc020184a:	4501                	li	a0,0
ffffffffc020184c:	8082                	ret

ffffffffc020184e <_fifo_check_swap>:
ffffffffc020184e:	711d                	addi	sp,sp,-96
ffffffffc0201850:	fc4e                	sd	s3,56(sp)
ffffffffc0201852:	f852                	sd	s4,48(sp)
ffffffffc0201854:	00007517          	auipc	a0,0x7
ffffffffc0201858:	41450513          	addi	a0,a0,1044 # ffffffffc0208c68 <commands+0xaa8>
ffffffffc020185c:	698d                	lui	s3,0x3
ffffffffc020185e:	4a31                	li	s4,12
ffffffffc0201860:	e0ca                	sd	s2,64(sp)
ffffffffc0201862:	ec86                	sd	ra,88(sp)
ffffffffc0201864:	e8a2                	sd	s0,80(sp)
ffffffffc0201866:	e4a6                	sd	s1,72(sp)
ffffffffc0201868:	f456                	sd	s5,40(sp)
ffffffffc020186a:	f05a                	sd	s6,32(sp)
ffffffffc020186c:	ec5e                	sd	s7,24(sp)
ffffffffc020186e:	e862                	sd	s8,16(sp)
ffffffffc0201870:	e466                	sd	s9,8(sp)
ffffffffc0201872:	e06a                	sd	s10,0(sp)
ffffffffc0201874:	859fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201878:	01498023          	sb	s4,0(s3) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc020187c:	00018917          	auipc	s2,0x18
ffffffffc0201880:	c4c92903          	lw	s2,-948(s2) # ffffffffc02194c8 <pgfault_num>
ffffffffc0201884:	4791                	li	a5,4
ffffffffc0201886:	14f91e63          	bne	s2,a5,ffffffffc02019e2 <_fifo_check_swap+0x194>
ffffffffc020188a:	00007517          	auipc	a0,0x7
ffffffffc020188e:	42e50513          	addi	a0,a0,1070 # ffffffffc0208cb8 <commands+0xaf8>
ffffffffc0201892:	6a85                	lui	s5,0x1
ffffffffc0201894:	4b29                	li	s6,10
ffffffffc0201896:	837fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020189a:	00018417          	auipc	s0,0x18
ffffffffc020189e:	c2e40413          	addi	s0,s0,-978 # ffffffffc02194c8 <pgfault_num>
ffffffffc02018a2:	016a8023          	sb	s6,0(s5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc02018a6:	4004                	lw	s1,0(s0)
ffffffffc02018a8:	2481                	sext.w	s1,s1
ffffffffc02018aa:	2b249c63          	bne	s1,s2,ffffffffc0201b62 <_fifo_check_swap+0x314>
ffffffffc02018ae:	00007517          	auipc	a0,0x7
ffffffffc02018b2:	43250513          	addi	a0,a0,1074 # ffffffffc0208ce0 <commands+0xb20>
ffffffffc02018b6:	6b91                	lui	s7,0x4
ffffffffc02018b8:	4c35                	li	s8,13
ffffffffc02018ba:	813fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02018be:	018b8023          	sb	s8,0(s7) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc02018c2:	00042903          	lw	s2,0(s0)
ffffffffc02018c6:	2901                	sext.w	s2,s2
ffffffffc02018c8:	26991d63          	bne	s2,s1,ffffffffc0201b42 <_fifo_check_swap+0x2f4>
ffffffffc02018cc:	00007517          	auipc	a0,0x7
ffffffffc02018d0:	43c50513          	addi	a0,a0,1084 # ffffffffc0208d08 <commands+0xb48>
ffffffffc02018d4:	6c89                	lui	s9,0x2
ffffffffc02018d6:	4d2d                	li	s10,11
ffffffffc02018d8:	ff4fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02018dc:	01ac8023          	sb	s10,0(s9) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc02018e0:	401c                	lw	a5,0(s0)
ffffffffc02018e2:	2781                	sext.w	a5,a5
ffffffffc02018e4:	23279f63          	bne	a5,s2,ffffffffc0201b22 <_fifo_check_swap+0x2d4>
ffffffffc02018e8:	00007517          	auipc	a0,0x7
ffffffffc02018ec:	44850513          	addi	a0,a0,1096 # ffffffffc0208d30 <commands+0xb70>
ffffffffc02018f0:	fdcfe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02018f4:	6795                	lui	a5,0x5
ffffffffc02018f6:	4739                	li	a4,14
ffffffffc02018f8:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc02018fc:	4004                	lw	s1,0(s0)
ffffffffc02018fe:	4795                	li	a5,5
ffffffffc0201900:	2481                	sext.w	s1,s1
ffffffffc0201902:	20f49063          	bne	s1,a5,ffffffffc0201b02 <_fifo_check_swap+0x2b4>
ffffffffc0201906:	00007517          	auipc	a0,0x7
ffffffffc020190a:	40250513          	addi	a0,a0,1026 # ffffffffc0208d08 <commands+0xb48>
ffffffffc020190e:	fbefe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201912:	01ac8023          	sb	s10,0(s9)
ffffffffc0201916:	401c                	lw	a5,0(s0)
ffffffffc0201918:	2781                	sext.w	a5,a5
ffffffffc020191a:	1c979463          	bne	a5,s1,ffffffffc0201ae2 <_fifo_check_swap+0x294>
ffffffffc020191e:	00007517          	auipc	a0,0x7
ffffffffc0201922:	39a50513          	addi	a0,a0,922 # ffffffffc0208cb8 <commands+0xaf8>
ffffffffc0201926:	fa6fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020192a:	016a8023          	sb	s6,0(s5)
ffffffffc020192e:	401c                	lw	a5,0(s0)
ffffffffc0201930:	4719                	li	a4,6
ffffffffc0201932:	2781                	sext.w	a5,a5
ffffffffc0201934:	18e79763          	bne	a5,a4,ffffffffc0201ac2 <_fifo_check_swap+0x274>
ffffffffc0201938:	00007517          	auipc	a0,0x7
ffffffffc020193c:	3d050513          	addi	a0,a0,976 # ffffffffc0208d08 <commands+0xb48>
ffffffffc0201940:	f8cfe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201944:	01ac8023          	sb	s10,0(s9)
ffffffffc0201948:	401c                	lw	a5,0(s0)
ffffffffc020194a:	471d                	li	a4,7
ffffffffc020194c:	2781                	sext.w	a5,a5
ffffffffc020194e:	14e79a63          	bne	a5,a4,ffffffffc0201aa2 <_fifo_check_swap+0x254>
ffffffffc0201952:	00007517          	auipc	a0,0x7
ffffffffc0201956:	31650513          	addi	a0,a0,790 # ffffffffc0208c68 <commands+0xaa8>
ffffffffc020195a:	f72fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020195e:	01498023          	sb	s4,0(s3)
ffffffffc0201962:	401c                	lw	a5,0(s0)
ffffffffc0201964:	4721                	li	a4,8
ffffffffc0201966:	2781                	sext.w	a5,a5
ffffffffc0201968:	10e79d63          	bne	a5,a4,ffffffffc0201a82 <_fifo_check_swap+0x234>
ffffffffc020196c:	00007517          	auipc	a0,0x7
ffffffffc0201970:	37450513          	addi	a0,a0,884 # ffffffffc0208ce0 <commands+0xb20>
ffffffffc0201974:	f58fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201978:	018b8023          	sb	s8,0(s7)
ffffffffc020197c:	401c                	lw	a5,0(s0)
ffffffffc020197e:	4725                	li	a4,9
ffffffffc0201980:	2781                	sext.w	a5,a5
ffffffffc0201982:	0ee79063          	bne	a5,a4,ffffffffc0201a62 <_fifo_check_swap+0x214>
ffffffffc0201986:	00007517          	auipc	a0,0x7
ffffffffc020198a:	3aa50513          	addi	a0,a0,938 # ffffffffc0208d30 <commands+0xb70>
ffffffffc020198e:	f3efe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201992:	6795                	lui	a5,0x5
ffffffffc0201994:	4739                	li	a4,14
ffffffffc0201996:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc020199a:	4004                	lw	s1,0(s0)
ffffffffc020199c:	47a9                	li	a5,10
ffffffffc020199e:	2481                	sext.w	s1,s1
ffffffffc02019a0:	0af49163          	bne	s1,a5,ffffffffc0201a42 <_fifo_check_swap+0x1f4>
ffffffffc02019a4:	00007517          	auipc	a0,0x7
ffffffffc02019a8:	31450513          	addi	a0,a0,788 # ffffffffc0208cb8 <commands+0xaf8>
ffffffffc02019ac:	f20fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02019b0:	6785                	lui	a5,0x1
ffffffffc02019b2:	0007c783          	lbu	a5,0(a5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc02019b6:	06979663          	bne	a5,s1,ffffffffc0201a22 <_fifo_check_swap+0x1d4>
ffffffffc02019ba:	401c                	lw	a5,0(s0)
ffffffffc02019bc:	472d                	li	a4,11
ffffffffc02019be:	2781                	sext.w	a5,a5
ffffffffc02019c0:	04e79163          	bne	a5,a4,ffffffffc0201a02 <_fifo_check_swap+0x1b4>
ffffffffc02019c4:	60e6                	ld	ra,88(sp)
ffffffffc02019c6:	6446                	ld	s0,80(sp)
ffffffffc02019c8:	64a6                	ld	s1,72(sp)
ffffffffc02019ca:	6906                	ld	s2,64(sp)
ffffffffc02019cc:	79e2                	ld	s3,56(sp)
ffffffffc02019ce:	7a42                	ld	s4,48(sp)
ffffffffc02019d0:	7aa2                	ld	s5,40(sp)
ffffffffc02019d2:	7b02                	ld	s6,32(sp)
ffffffffc02019d4:	6be2                	ld	s7,24(sp)
ffffffffc02019d6:	6c42                	ld	s8,16(sp)
ffffffffc02019d8:	6ca2                	ld	s9,8(sp)
ffffffffc02019da:	6d02                	ld	s10,0(sp)
ffffffffc02019dc:	4501                	li	a0,0
ffffffffc02019de:	6125                	addi	sp,sp,96
ffffffffc02019e0:	8082                	ret
ffffffffc02019e2:	00007697          	auipc	a3,0x7
ffffffffc02019e6:	2ae68693          	addi	a3,a3,686 # ffffffffc0208c90 <commands+0xad0>
ffffffffc02019ea:	00007617          	auipc	a2,0x7
ffffffffc02019ee:	be660613          	addi	a2,a2,-1050 # ffffffffc02085d0 <commands+0x410>
ffffffffc02019f2:	05100593          	li	a1,81
ffffffffc02019f6:	00007517          	auipc	a0,0x7
ffffffffc02019fa:	2aa50513          	addi	a0,a0,682 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc02019fe:	80bfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a02:	00007697          	auipc	a3,0x7
ffffffffc0201a06:	3de68693          	addi	a3,a3,990 # ffffffffc0208de0 <commands+0xc20>
ffffffffc0201a0a:	00007617          	auipc	a2,0x7
ffffffffc0201a0e:	bc660613          	addi	a2,a2,-1082 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201a12:	07300593          	li	a1,115
ffffffffc0201a16:	00007517          	auipc	a0,0x7
ffffffffc0201a1a:	28a50513          	addi	a0,a0,650 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201a1e:	feafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a22:	00007697          	auipc	a3,0x7
ffffffffc0201a26:	39668693          	addi	a3,a3,918 # ffffffffc0208db8 <commands+0xbf8>
ffffffffc0201a2a:	00007617          	auipc	a2,0x7
ffffffffc0201a2e:	ba660613          	addi	a2,a2,-1114 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201a32:	07100593          	li	a1,113
ffffffffc0201a36:	00007517          	auipc	a0,0x7
ffffffffc0201a3a:	26a50513          	addi	a0,a0,618 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201a3e:	fcafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a42:	00007697          	auipc	a3,0x7
ffffffffc0201a46:	36668693          	addi	a3,a3,870 # ffffffffc0208da8 <commands+0xbe8>
ffffffffc0201a4a:	00007617          	auipc	a2,0x7
ffffffffc0201a4e:	b8660613          	addi	a2,a2,-1146 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201a52:	06f00593          	li	a1,111
ffffffffc0201a56:	00007517          	auipc	a0,0x7
ffffffffc0201a5a:	24a50513          	addi	a0,a0,586 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201a5e:	faafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a62:	00007697          	auipc	a3,0x7
ffffffffc0201a66:	33668693          	addi	a3,a3,822 # ffffffffc0208d98 <commands+0xbd8>
ffffffffc0201a6a:	00007617          	auipc	a2,0x7
ffffffffc0201a6e:	b6660613          	addi	a2,a2,-1178 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201a72:	06c00593          	li	a1,108
ffffffffc0201a76:	00007517          	auipc	a0,0x7
ffffffffc0201a7a:	22a50513          	addi	a0,a0,554 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201a7e:	f8afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a82:	00007697          	auipc	a3,0x7
ffffffffc0201a86:	30668693          	addi	a3,a3,774 # ffffffffc0208d88 <commands+0xbc8>
ffffffffc0201a8a:	00007617          	auipc	a2,0x7
ffffffffc0201a8e:	b4660613          	addi	a2,a2,-1210 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201a92:	06900593          	li	a1,105
ffffffffc0201a96:	00007517          	auipc	a0,0x7
ffffffffc0201a9a:	20a50513          	addi	a0,a0,522 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201a9e:	f6afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201aa2:	00007697          	auipc	a3,0x7
ffffffffc0201aa6:	2d668693          	addi	a3,a3,726 # ffffffffc0208d78 <commands+0xbb8>
ffffffffc0201aaa:	00007617          	auipc	a2,0x7
ffffffffc0201aae:	b2660613          	addi	a2,a2,-1242 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201ab2:	06600593          	li	a1,102
ffffffffc0201ab6:	00007517          	auipc	a0,0x7
ffffffffc0201aba:	1ea50513          	addi	a0,a0,490 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201abe:	f4afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201ac2:	00007697          	auipc	a3,0x7
ffffffffc0201ac6:	2a668693          	addi	a3,a3,678 # ffffffffc0208d68 <commands+0xba8>
ffffffffc0201aca:	00007617          	auipc	a2,0x7
ffffffffc0201ace:	b0660613          	addi	a2,a2,-1274 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201ad2:	06300593          	li	a1,99
ffffffffc0201ad6:	00007517          	auipc	a0,0x7
ffffffffc0201ada:	1ca50513          	addi	a0,a0,458 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201ade:	f2afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201ae2:	00007697          	auipc	a3,0x7
ffffffffc0201ae6:	27668693          	addi	a3,a3,630 # ffffffffc0208d58 <commands+0xb98>
ffffffffc0201aea:	00007617          	auipc	a2,0x7
ffffffffc0201aee:	ae660613          	addi	a2,a2,-1306 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201af2:	06000593          	li	a1,96
ffffffffc0201af6:	00007517          	auipc	a0,0x7
ffffffffc0201afa:	1aa50513          	addi	a0,a0,426 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201afe:	f0afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201b02:	00007697          	auipc	a3,0x7
ffffffffc0201b06:	25668693          	addi	a3,a3,598 # ffffffffc0208d58 <commands+0xb98>
ffffffffc0201b0a:	00007617          	auipc	a2,0x7
ffffffffc0201b0e:	ac660613          	addi	a2,a2,-1338 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201b12:	05d00593          	li	a1,93
ffffffffc0201b16:	00007517          	auipc	a0,0x7
ffffffffc0201b1a:	18a50513          	addi	a0,a0,394 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201b1e:	eeafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201b22:	00007697          	auipc	a3,0x7
ffffffffc0201b26:	16e68693          	addi	a3,a3,366 # ffffffffc0208c90 <commands+0xad0>
ffffffffc0201b2a:	00007617          	auipc	a2,0x7
ffffffffc0201b2e:	aa660613          	addi	a2,a2,-1370 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201b32:	05a00593          	li	a1,90
ffffffffc0201b36:	00007517          	auipc	a0,0x7
ffffffffc0201b3a:	16a50513          	addi	a0,a0,362 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201b3e:	ecafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201b42:	00007697          	auipc	a3,0x7
ffffffffc0201b46:	14e68693          	addi	a3,a3,334 # ffffffffc0208c90 <commands+0xad0>
ffffffffc0201b4a:	00007617          	auipc	a2,0x7
ffffffffc0201b4e:	a8660613          	addi	a2,a2,-1402 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201b52:	05700593          	li	a1,87
ffffffffc0201b56:	00007517          	auipc	a0,0x7
ffffffffc0201b5a:	14a50513          	addi	a0,a0,330 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201b5e:	eaafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201b62:	00007697          	auipc	a3,0x7
ffffffffc0201b66:	12e68693          	addi	a3,a3,302 # ffffffffc0208c90 <commands+0xad0>
ffffffffc0201b6a:	00007617          	auipc	a2,0x7
ffffffffc0201b6e:	a6660613          	addi	a2,a2,-1434 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201b72:	05400593          	li	a1,84
ffffffffc0201b76:	00007517          	auipc	a0,0x7
ffffffffc0201b7a:	12a50513          	addi	a0,a0,298 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201b7e:	e8afe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201b82 <_fifo_swap_out_victim>:
ffffffffc0201b82:	751c                	ld	a5,40(a0)
ffffffffc0201b84:	1141                	addi	sp,sp,-16
ffffffffc0201b86:	e406                	sd	ra,8(sp)
ffffffffc0201b88:	cf91                	beqz	a5,ffffffffc0201ba4 <_fifo_swap_out_victim+0x22>
ffffffffc0201b8a:	ee0d                	bnez	a2,ffffffffc0201bc4 <_fifo_swap_out_victim+0x42>
ffffffffc0201b8c:	679c                	ld	a5,8(a5)
ffffffffc0201b8e:	60a2                	ld	ra,8(sp)
ffffffffc0201b90:	4501                	li	a0,0
ffffffffc0201b92:	6394                	ld	a3,0(a5)
ffffffffc0201b94:	6798                	ld	a4,8(a5)
ffffffffc0201b96:	fd878793          	addi	a5,a5,-40
ffffffffc0201b9a:	e698                	sd	a4,8(a3)
ffffffffc0201b9c:	e314                	sd	a3,0(a4)
ffffffffc0201b9e:	e19c                	sd	a5,0(a1)
ffffffffc0201ba0:	0141                	addi	sp,sp,16
ffffffffc0201ba2:	8082                	ret
ffffffffc0201ba4:	00007697          	auipc	a3,0x7
ffffffffc0201ba8:	24c68693          	addi	a3,a3,588 # ffffffffc0208df0 <commands+0xc30>
ffffffffc0201bac:	00007617          	auipc	a2,0x7
ffffffffc0201bb0:	a2460613          	addi	a2,a2,-1500 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201bb4:	04100593          	li	a1,65
ffffffffc0201bb8:	00007517          	auipc	a0,0x7
ffffffffc0201bbc:	0e850513          	addi	a0,a0,232 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201bc0:	e48fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201bc4:	00007697          	auipc	a3,0x7
ffffffffc0201bc8:	23c68693          	addi	a3,a3,572 # ffffffffc0208e00 <commands+0xc40>
ffffffffc0201bcc:	00007617          	auipc	a2,0x7
ffffffffc0201bd0:	a0460613          	addi	a2,a2,-1532 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201bd4:	04200593          	li	a1,66
ffffffffc0201bd8:	00007517          	auipc	a0,0x7
ffffffffc0201bdc:	0c850513          	addi	a0,a0,200 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201be0:	e28fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201be4 <_fifo_map_swappable>:
ffffffffc0201be4:	751c                	ld	a5,40(a0)
ffffffffc0201be6:	cb91                	beqz	a5,ffffffffc0201bfa <_fifo_map_swappable+0x16>
ffffffffc0201be8:	6394                	ld	a3,0(a5)
ffffffffc0201bea:	02860713          	addi	a4,a2,40
ffffffffc0201bee:	e398                	sd	a4,0(a5)
ffffffffc0201bf0:	e698                	sd	a4,8(a3)
ffffffffc0201bf2:	4501                	li	a0,0
ffffffffc0201bf4:	fa1c                	sd	a5,48(a2)
ffffffffc0201bf6:	f614                	sd	a3,40(a2)
ffffffffc0201bf8:	8082                	ret
ffffffffc0201bfa:	1141                	addi	sp,sp,-16
ffffffffc0201bfc:	00007697          	auipc	a3,0x7
ffffffffc0201c00:	21468693          	addi	a3,a3,532 # ffffffffc0208e10 <commands+0xc50>
ffffffffc0201c04:	00007617          	auipc	a2,0x7
ffffffffc0201c08:	9cc60613          	addi	a2,a2,-1588 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201c0c:	03200593          	li	a1,50
ffffffffc0201c10:	00007517          	auipc	a0,0x7
ffffffffc0201c14:	09050513          	addi	a0,a0,144 # ffffffffc0208ca0 <commands+0xae0>
ffffffffc0201c18:	e406                	sd	ra,8(sp)
ffffffffc0201c1a:	deefe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201c1e <default_init>:
ffffffffc0201c1e:	00018797          	auipc	a5,0x18
ffffffffc0201c22:	9f278793          	addi	a5,a5,-1550 # ffffffffc0219610 <free_area>
ffffffffc0201c26:	e79c                	sd	a5,8(a5)
ffffffffc0201c28:	e39c                	sd	a5,0(a5)
ffffffffc0201c2a:	0007a823          	sw	zero,16(a5)
ffffffffc0201c2e:	8082                	ret

ffffffffc0201c30 <default_nr_free_pages>:
ffffffffc0201c30:	00018517          	auipc	a0,0x18
ffffffffc0201c34:	9f056503          	lwu	a0,-1552(a0) # ffffffffc0219620 <free_area+0x10>
ffffffffc0201c38:	8082                	ret

ffffffffc0201c3a <default_check>:
ffffffffc0201c3a:	715d                	addi	sp,sp,-80
ffffffffc0201c3c:	e0a2                	sd	s0,64(sp)
ffffffffc0201c3e:	00018417          	auipc	s0,0x18
ffffffffc0201c42:	9d240413          	addi	s0,s0,-1582 # ffffffffc0219610 <free_area>
ffffffffc0201c46:	641c                	ld	a5,8(s0)
ffffffffc0201c48:	e486                	sd	ra,72(sp)
ffffffffc0201c4a:	fc26                	sd	s1,56(sp)
ffffffffc0201c4c:	f84a                	sd	s2,48(sp)
ffffffffc0201c4e:	f44e                	sd	s3,40(sp)
ffffffffc0201c50:	f052                	sd	s4,32(sp)
ffffffffc0201c52:	ec56                	sd	s5,24(sp)
ffffffffc0201c54:	e85a                	sd	s6,16(sp)
ffffffffc0201c56:	e45e                	sd	s7,8(sp)
ffffffffc0201c58:	e062                	sd	s8,0(sp)
ffffffffc0201c5a:	2a878d63          	beq	a5,s0,ffffffffc0201f14 <default_check+0x2da>
ffffffffc0201c5e:	4481                	li	s1,0
ffffffffc0201c60:	4901                	li	s2,0
ffffffffc0201c62:	ff07b703          	ld	a4,-16(a5)
ffffffffc0201c66:	8b09                	andi	a4,a4,2
ffffffffc0201c68:	2a070a63          	beqz	a4,ffffffffc0201f1c <default_check+0x2e2>
ffffffffc0201c6c:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201c70:	679c                	ld	a5,8(a5)
ffffffffc0201c72:	2905                	addiw	s2,s2,1
ffffffffc0201c74:	9cb9                	addw	s1,s1,a4
ffffffffc0201c76:	fe8796e3          	bne	a5,s0,ffffffffc0201c62 <default_check+0x28>
ffffffffc0201c7a:	89a6                	mv	s3,s1
ffffffffc0201c7c:	337000ef          	jal	ra,ffffffffc02027b2 <nr_free_pages>
ffffffffc0201c80:	6f351e63          	bne	a0,s3,ffffffffc020237c <default_check+0x742>
ffffffffc0201c84:	4505                	li	a0,1
ffffffffc0201c86:	259000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201c8a:	8aaa                	mv	s5,a0
ffffffffc0201c8c:	42050863          	beqz	a0,ffffffffc02020bc <default_check+0x482>
ffffffffc0201c90:	4505                	li	a0,1
ffffffffc0201c92:	24d000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201c96:	89aa                	mv	s3,a0
ffffffffc0201c98:	70050263          	beqz	a0,ffffffffc020239c <default_check+0x762>
ffffffffc0201c9c:	4505                	li	a0,1
ffffffffc0201c9e:	241000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201ca2:	8a2a                	mv	s4,a0
ffffffffc0201ca4:	48050c63          	beqz	a0,ffffffffc020213c <default_check+0x502>
ffffffffc0201ca8:	293a8a63          	beq	s5,s3,ffffffffc0201f3c <default_check+0x302>
ffffffffc0201cac:	28aa8863          	beq	s5,a0,ffffffffc0201f3c <default_check+0x302>
ffffffffc0201cb0:	28a98663          	beq	s3,a0,ffffffffc0201f3c <default_check+0x302>
ffffffffc0201cb4:	000aa783          	lw	a5,0(s5)
ffffffffc0201cb8:	2a079263          	bnez	a5,ffffffffc0201f5c <default_check+0x322>
ffffffffc0201cbc:	0009a783          	lw	a5,0(s3)
ffffffffc0201cc0:	28079e63          	bnez	a5,ffffffffc0201f5c <default_check+0x322>
ffffffffc0201cc4:	411c                	lw	a5,0(a0)
ffffffffc0201cc6:	28079b63          	bnez	a5,ffffffffc0201f5c <default_check+0x322>
ffffffffc0201cca:	00018797          	auipc	a5,0x18
ffffffffc0201cce:	9767b783          	ld	a5,-1674(a5) # ffffffffc0219640 <pages>
ffffffffc0201cd2:	40fa8733          	sub	a4,s5,a5
ffffffffc0201cd6:	00009617          	auipc	a2,0x9
ffffffffc0201cda:	94263603          	ld	a2,-1726(a2) # ffffffffc020a618 <nbase>
ffffffffc0201cde:	8719                	srai	a4,a4,0x6
ffffffffc0201ce0:	9732                	add	a4,a4,a2
ffffffffc0201ce2:	00018697          	auipc	a3,0x18
ffffffffc0201ce6:	80e6b683          	ld	a3,-2034(a3) # ffffffffc02194f0 <npage>
ffffffffc0201cea:	06b2                	slli	a3,a3,0xc
ffffffffc0201cec:	0732                	slli	a4,a4,0xc
ffffffffc0201cee:	28d77763          	bgeu	a4,a3,ffffffffc0201f7c <default_check+0x342>
ffffffffc0201cf2:	40f98733          	sub	a4,s3,a5
ffffffffc0201cf6:	8719                	srai	a4,a4,0x6
ffffffffc0201cf8:	9732                	add	a4,a4,a2
ffffffffc0201cfa:	0732                	slli	a4,a4,0xc
ffffffffc0201cfc:	4cd77063          	bgeu	a4,a3,ffffffffc02021bc <default_check+0x582>
ffffffffc0201d00:	40f507b3          	sub	a5,a0,a5
ffffffffc0201d04:	8799                	srai	a5,a5,0x6
ffffffffc0201d06:	97b2                	add	a5,a5,a2
ffffffffc0201d08:	07b2                	slli	a5,a5,0xc
ffffffffc0201d0a:	30d7f963          	bgeu	a5,a3,ffffffffc020201c <default_check+0x3e2>
ffffffffc0201d0e:	4505                	li	a0,1
ffffffffc0201d10:	00043c03          	ld	s8,0(s0)
ffffffffc0201d14:	00843b83          	ld	s7,8(s0)
ffffffffc0201d18:	01042b03          	lw	s6,16(s0)
ffffffffc0201d1c:	e400                	sd	s0,8(s0)
ffffffffc0201d1e:	e000                	sd	s0,0(s0)
ffffffffc0201d20:	00018797          	auipc	a5,0x18
ffffffffc0201d24:	9007a023          	sw	zero,-1792(a5) # ffffffffc0219620 <free_area+0x10>
ffffffffc0201d28:	1b7000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201d2c:	2c051863          	bnez	a0,ffffffffc0201ffc <default_check+0x3c2>
ffffffffc0201d30:	4585                	li	a1,1
ffffffffc0201d32:	8556                	mv	a0,s5
ffffffffc0201d34:	23d000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201d38:	4585                	li	a1,1
ffffffffc0201d3a:	854e                	mv	a0,s3
ffffffffc0201d3c:	235000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201d40:	4585                	li	a1,1
ffffffffc0201d42:	8552                	mv	a0,s4
ffffffffc0201d44:	22d000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201d48:	4818                	lw	a4,16(s0)
ffffffffc0201d4a:	478d                	li	a5,3
ffffffffc0201d4c:	28f71863          	bne	a4,a5,ffffffffc0201fdc <default_check+0x3a2>
ffffffffc0201d50:	4505                	li	a0,1
ffffffffc0201d52:	18d000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201d56:	89aa                	mv	s3,a0
ffffffffc0201d58:	26050263          	beqz	a0,ffffffffc0201fbc <default_check+0x382>
ffffffffc0201d5c:	4505                	li	a0,1
ffffffffc0201d5e:	181000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201d62:	8aaa                	mv	s5,a0
ffffffffc0201d64:	3a050c63          	beqz	a0,ffffffffc020211c <default_check+0x4e2>
ffffffffc0201d68:	4505                	li	a0,1
ffffffffc0201d6a:	175000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201d6e:	8a2a                	mv	s4,a0
ffffffffc0201d70:	38050663          	beqz	a0,ffffffffc02020fc <default_check+0x4c2>
ffffffffc0201d74:	4505                	li	a0,1
ffffffffc0201d76:	169000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201d7a:	36051163          	bnez	a0,ffffffffc02020dc <default_check+0x4a2>
ffffffffc0201d7e:	4585                	li	a1,1
ffffffffc0201d80:	854e                	mv	a0,s3
ffffffffc0201d82:	1ef000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201d86:	641c                	ld	a5,8(s0)
ffffffffc0201d88:	20878a63          	beq	a5,s0,ffffffffc0201f9c <default_check+0x362>
ffffffffc0201d8c:	4505                	li	a0,1
ffffffffc0201d8e:	151000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201d92:	30a99563          	bne	s3,a0,ffffffffc020209c <default_check+0x462>
ffffffffc0201d96:	4505                	li	a0,1
ffffffffc0201d98:	147000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201d9c:	2e051063          	bnez	a0,ffffffffc020207c <default_check+0x442>
ffffffffc0201da0:	481c                	lw	a5,16(s0)
ffffffffc0201da2:	2a079d63          	bnez	a5,ffffffffc020205c <default_check+0x422>
ffffffffc0201da6:	854e                	mv	a0,s3
ffffffffc0201da8:	4585                	li	a1,1
ffffffffc0201daa:	01843023          	sd	s8,0(s0)
ffffffffc0201dae:	01743423          	sd	s7,8(s0)
ffffffffc0201db2:	01642823          	sw	s6,16(s0)
ffffffffc0201db6:	1bb000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201dba:	4585                	li	a1,1
ffffffffc0201dbc:	8556                	mv	a0,s5
ffffffffc0201dbe:	1b3000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201dc2:	4585                	li	a1,1
ffffffffc0201dc4:	8552                	mv	a0,s4
ffffffffc0201dc6:	1ab000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201dca:	4515                	li	a0,5
ffffffffc0201dcc:	113000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201dd0:	89aa                	mv	s3,a0
ffffffffc0201dd2:	26050563          	beqz	a0,ffffffffc020203c <default_check+0x402>
ffffffffc0201dd6:	651c                	ld	a5,8(a0)
ffffffffc0201dd8:	8385                	srli	a5,a5,0x1
ffffffffc0201dda:	8b85                	andi	a5,a5,1
ffffffffc0201ddc:	54079063          	bnez	a5,ffffffffc020231c <default_check+0x6e2>
ffffffffc0201de0:	4505                	li	a0,1
ffffffffc0201de2:	00043b03          	ld	s6,0(s0)
ffffffffc0201de6:	00843a83          	ld	s5,8(s0)
ffffffffc0201dea:	e000                	sd	s0,0(s0)
ffffffffc0201dec:	e400                	sd	s0,8(s0)
ffffffffc0201dee:	0f1000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201df2:	50051563          	bnez	a0,ffffffffc02022fc <default_check+0x6c2>
ffffffffc0201df6:	08098a13          	addi	s4,s3,128
ffffffffc0201dfa:	8552                	mv	a0,s4
ffffffffc0201dfc:	458d                	li	a1,3
ffffffffc0201dfe:	01042b83          	lw	s7,16(s0)
ffffffffc0201e02:	00018797          	auipc	a5,0x18
ffffffffc0201e06:	8007af23          	sw	zero,-2018(a5) # ffffffffc0219620 <free_area+0x10>
ffffffffc0201e0a:	167000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201e0e:	4511                	li	a0,4
ffffffffc0201e10:	0cf000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201e14:	4c051463          	bnez	a0,ffffffffc02022dc <default_check+0x6a2>
ffffffffc0201e18:	0889b783          	ld	a5,136(s3)
ffffffffc0201e1c:	8385                	srli	a5,a5,0x1
ffffffffc0201e1e:	8b85                	andi	a5,a5,1
ffffffffc0201e20:	48078e63          	beqz	a5,ffffffffc02022bc <default_check+0x682>
ffffffffc0201e24:	0909a703          	lw	a4,144(s3)
ffffffffc0201e28:	478d                	li	a5,3
ffffffffc0201e2a:	48f71963          	bne	a4,a5,ffffffffc02022bc <default_check+0x682>
ffffffffc0201e2e:	450d                	li	a0,3
ffffffffc0201e30:	0af000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201e34:	8c2a                	mv	s8,a0
ffffffffc0201e36:	46050363          	beqz	a0,ffffffffc020229c <default_check+0x662>
ffffffffc0201e3a:	4505                	li	a0,1
ffffffffc0201e3c:	0a3000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201e40:	42051e63          	bnez	a0,ffffffffc020227c <default_check+0x642>
ffffffffc0201e44:	418a1c63          	bne	s4,s8,ffffffffc020225c <default_check+0x622>
ffffffffc0201e48:	4585                	li	a1,1
ffffffffc0201e4a:	854e                	mv	a0,s3
ffffffffc0201e4c:	125000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201e50:	458d                	li	a1,3
ffffffffc0201e52:	8552                	mv	a0,s4
ffffffffc0201e54:	11d000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201e58:	0089b783          	ld	a5,8(s3)
ffffffffc0201e5c:	04098c13          	addi	s8,s3,64
ffffffffc0201e60:	8385                	srli	a5,a5,0x1
ffffffffc0201e62:	8b85                	andi	a5,a5,1
ffffffffc0201e64:	3c078c63          	beqz	a5,ffffffffc020223c <default_check+0x602>
ffffffffc0201e68:	0109a703          	lw	a4,16(s3)
ffffffffc0201e6c:	4785                	li	a5,1
ffffffffc0201e6e:	3cf71763          	bne	a4,a5,ffffffffc020223c <default_check+0x602>
ffffffffc0201e72:	008a3783          	ld	a5,8(s4) # 1008 <kern_entry-0xffffffffc01feff8>
ffffffffc0201e76:	8385                	srli	a5,a5,0x1
ffffffffc0201e78:	8b85                	andi	a5,a5,1
ffffffffc0201e7a:	3a078163          	beqz	a5,ffffffffc020221c <default_check+0x5e2>
ffffffffc0201e7e:	010a2703          	lw	a4,16(s4)
ffffffffc0201e82:	478d                	li	a5,3
ffffffffc0201e84:	38f71c63          	bne	a4,a5,ffffffffc020221c <default_check+0x5e2>
ffffffffc0201e88:	4505                	li	a0,1
ffffffffc0201e8a:	055000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201e8e:	36a99763          	bne	s3,a0,ffffffffc02021fc <default_check+0x5c2>
ffffffffc0201e92:	4585                	li	a1,1
ffffffffc0201e94:	0dd000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201e98:	4509                	li	a0,2
ffffffffc0201e9a:	045000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201e9e:	32aa1f63          	bne	s4,a0,ffffffffc02021dc <default_check+0x5a2>
ffffffffc0201ea2:	4589                	li	a1,2
ffffffffc0201ea4:	0cd000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201ea8:	4585                	li	a1,1
ffffffffc0201eaa:	8562                	mv	a0,s8
ffffffffc0201eac:	0c5000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201eb0:	4515                	li	a0,5
ffffffffc0201eb2:	02d000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201eb6:	89aa                	mv	s3,a0
ffffffffc0201eb8:	48050263          	beqz	a0,ffffffffc020233c <default_check+0x702>
ffffffffc0201ebc:	4505                	li	a0,1
ffffffffc0201ebe:	021000ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0201ec2:	2c051d63          	bnez	a0,ffffffffc020219c <default_check+0x562>
ffffffffc0201ec6:	481c                	lw	a5,16(s0)
ffffffffc0201ec8:	2a079a63          	bnez	a5,ffffffffc020217c <default_check+0x542>
ffffffffc0201ecc:	4595                	li	a1,5
ffffffffc0201ece:	854e                	mv	a0,s3
ffffffffc0201ed0:	01742823          	sw	s7,16(s0)
ffffffffc0201ed4:	01643023          	sd	s6,0(s0)
ffffffffc0201ed8:	01543423          	sd	s5,8(s0)
ffffffffc0201edc:	095000ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0201ee0:	641c                	ld	a5,8(s0)
ffffffffc0201ee2:	00878963          	beq	a5,s0,ffffffffc0201ef4 <default_check+0x2ba>
ffffffffc0201ee6:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201eea:	679c                	ld	a5,8(a5)
ffffffffc0201eec:	397d                	addiw	s2,s2,-1
ffffffffc0201eee:	9c99                	subw	s1,s1,a4
ffffffffc0201ef0:	fe879be3          	bne	a5,s0,ffffffffc0201ee6 <default_check+0x2ac>
ffffffffc0201ef4:	26091463          	bnez	s2,ffffffffc020215c <default_check+0x522>
ffffffffc0201ef8:	46049263          	bnez	s1,ffffffffc020235c <default_check+0x722>
ffffffffc0201efc:	60a6                	ld	ra,72(sp)
ffffffffc0201efe:	6406                	ld	s0,64(sp)
ffffffffc0201f00:	74e2                	ld	s1,56(sp)
ffffffffc0201f02:	7942                	ld	s2,48(sp)
ffffffffc0201f04:	79a2                	ld	s3,40(sp)
ffffffffc0201f06:	7a02                	ld	s4,32(sp)
ffffffffc0201f08:	6ae2                	ld	s5,24(sp)
ffffffffc0201f0a:	6b42                	ld	s6,16(sp)
ffffffffc0201f0c:	6ba2                	ld	s7,8(sp)
ffffffffc0201f0e:	6c02                	ld	s8,0(sp)
ffffffffc0201f10:	6161                	addi	sp,sp,80
ffffffffc0201f12:	8082                	ret
ffffffffc0201f14:	4981                	li	s3,0
ffffffffc0201f16:	4481                	li	s1,0
ffffffffc0201f18:	4901                	li	s2,0
ffffffffc0201f1a:	b38d                	j	ffffffffc0201c7c <default_check+0x42>
ffffffffc0201f1c:	00007697          	auipc	a3,0x7
ffffffffc0201f20:	f2c68693          	addi	a3,a3,-212 # ffffffffc0208e48 <commands+0xc88>
ffffffffc0201f24:	00006617          	auipc	a2,0x6
ffffffffc0201f28:	6ac60613          	addi	a2,a2,1708 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201f2c:	0f000593          	li	a1,240
ffffffffc0201f30:	00007517          	auipc	a0,0x7
ffffffffc0201f34:	f2850513          	addi	a0,a0,-216 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0201f38:	ad0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201f3c:	00007697          	auipc	a3,0x7
ffffffffc0201f40:	fb468693          	addi	a3,a3,-76 # ffffffffc0208ef0 <commands+0xd30>
ffffffffc0201f44:	00006617          	auipc	a2,0x6
ffffffffc0201f48:	68c60613          	addi	a2,a2,1676 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201f4c:	0bd00593          	li	a1,189
ffffffffc0201f50:	00007517          	auipc	a0,0x7
ffffffffc0201f54:	f0850513          	addi	a0,a0,-248 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0201f58:	ab0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201f5c:	00007697          	auipc	a3,0x7
ffffffffc0201f60:	fbc68693          	addi	a3,a3,-68 # ffffffffc0208f18 <commands+0xd58>
ffffffffc0201f64:	00006617          	auipc	a2,0x6
ffffffffc0201f68:	66c60613          	addi	a2,a2,1644 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201f6c:	0be00593          	li	a1,190
ffffffffc0201f70:	00007517          	auipc	a0,0x7
ffffffffc0201f74:	ee850513          	addi	a0,a0,-280 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0201f78:	a90fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201f7c:	00007697          	auipc	a3,0x7
ffffffffc0201f80:	fdc68693          	addi	a3,a3,-36 # ffffffffc0208f58 <commands+0xd98>
ffffffffc0201f84:	00006617          	auipc	a2,0x6
ffffffffc0201f88:	64c60613          	addi	a2,a2,1612 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201f8c:	0c000593          	li	a1,192
ffffffffc0201f90:	00007517          	auipc	a0,0x7
ffffffffc0201f94:	ec850513          	addi	a0,a0,-312 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0201f98:	a70fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201f9c:	00007697          	auipc	a3,0x7
ffffffffc0201fa0:	04468693          	addi	a3,a3,68 # ffffffffc0208fe0 <commands+0xe20>
ffffffffc0201fa4:	00006617          	auipc	a2,0x6
ffffffffc0201fa8:	62c60613          	addi	a2,a2,1580 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201fac:	0d900593          	li	a1,217
ffffffffc0201fb0:	00007517          	auipc	a0,0x7
ffffffffc0201fb4:	ea850513          	addi	a0,a0,-344 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0201fb8:	a50fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201fbc:	00007697          	auipc	a3,0x7
ffffffffc0201fc0:	ed468693          	addi	a3,a3,-300 # ffffffffc0208e90 <commands+0xcd0>
ffffffffc0201fc4:	00006617          	auipc	a2,0x6
ffffffffc0201fc8:	60c60613          	addi	a2,a2,1548 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201fcc:	0d200593          	li	a1,210
ffffffffc0201fd0:	00007517          	auipc	a0,0x7
ffffffffc0201fd4:	e8850513          	addi	a0,a0,-376 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0201fd8:	a30fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201fdc:	00007697          	auipc	a3,0x7
ffffffffc0201fe0:	ff468693          	addi	a3,a3,-12 # ffffffffc0208fd0 <commands+0xe10>
ffffffffc0201fe4:	00006617          	auipc	a2,0x6
ffffffffc0201fe8:	5ec60613          	addi	a2,a2,1516 # ffffffffc02085d0 <commands+0x410>
ffffffffc0201fec:	0d000593          	li	a1,208
ffffffffc0201ff0:	00007517          	auipc	a0,0x7
ffffffffc0201ff4:	e6850513          	addi	a0,a0,-408 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0201ff8:	a10fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201ffc:	00007697          	auipc	a3,0x7
ffffffffc0202000:	fbc68693          	addi	a3,a3,-68 # ffffffffc0208fb8 <commands+0xdf8>
ffffffffc0202004:	00006617          	auipc	a2,0x6
ffffffffc0202008:	5cc60613          	addi	a2,a2,1484 # ffffffffc02085d0 <commands+0x410>
ffffffffc020200c:	0cb00593          	li	a1,203
ffffffffc0202010:	00007517          	auipc	a0,0x7
ffffffffc0202014:	e4850513          	addi	a0,a0,-440 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202018:	9f0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020201c:	00007697          	auipc	a3,0x7
ffffffffc0202020:	f7c68693          	addi	a3,a3,-132 # ffffffffc0208f98 <commands+0xdd8>
ffffffffc0202024:	00006617          	auipc	a2,0x6
ffffffffc0202028:	5ac60613          	addi	a2,a2,1452 # ffffffffc02085d0 <commands+0x410>
ffffffffc020202c:	0c200593          	li	a1,194
ffffffffc0202030:	00007517          	auipc	a0,0x7
ffffffffc0202034:	e2850513          	addi	a0,a0,-472 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202038:	9d0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020203c:	00007697          	auipc	a3,0x7
ffffffffc0202040:	fec68693          	addi	a3,a3,-20 # ffffffffc0209028 <commands+0xe68>
ffffffffc0202044:	00006617          	auipc	a2,0x6
ffffffffc0202048:	58c60613          	addi	a2,a2,1420 # ffffffffc02085d0 <commands+0x410>
ffffffffc020204c:	0f800593          	li	a1,248
ffffffffc0202050:	00007517          	auipc	a0,0x7
ffffffffc0202054:	e0850513          	addi	a0,a0,-504 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202058:	9b0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020205c:	00007697          	auipc	a3,0x7
ffffffffc0202060:	fbc68693          	addi	a3,a3,-68 # ffffffffc0209018 <commands+0xe58>
ffffffffc0202064:	00006617          	auipc	a2,0x6
ffffffffc0202068:	56c60613          	addi	a2,a2,1388 # ffffffffc02085d0 <commands+0x410>
ffffffffc020206c:	0df00593          	li	a1,223
ffffffffc0202070:	00007517          	auipc	a0,0x7
ffffffffc0202074:	de850513          	addi	a0,a0,-536 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202078:	990fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020207c:	00007697          	auipc	a3,0x7
ffffffffc0202080:	f3c68693          	addi	a3,a3,-196 # ffffffffc0208fb8 <commands+0xdf8>
ffffffffc0202084:	00006617          	auipc	a2,0x6
ffffffffc0202088:	54c60613          	addi	a2,a2,1356 # ffffffffc02085d0 <commands+0x410>
ffffffffc020208c:	0dd00593          	li	a1,221
ffffffffc0202090:	00007517          	auipc	a0,0x7
ffffffffc0202094:	dc850513          	addi	a0,a0,-568 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202098:	970fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020209c:	00007697          	auipc	a3,0x7
ffffffffc02020a0:	f5c68693          	addi	a3,a3,-164 # ffffffffc0208ff8 <commands+0xe38>
ffffffffc02020a4:	00006617          	auipc	a2,0x6
ffffffffc02020a8:	52c60613          	addi	a2,a2,1324 # ffffffffc02085d0 <commands+0x410>
ffffffffc02020ac:	0dc00593          	li	a1,220
ffffffffc02020b0:	00007517          	auipc	a0,0x7
ffffffffc02020b4:	da850513          	addi	a0,a0,-600 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02020b8:	950fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02020bc:	00007697          	auipc	a3,0x7
ffffffffc02020c0:	dd468693          	addi	a3,a3,-556 # ffffffffc0208e90 <commands+0xcd0>
ffffffffc02020c4:	00006617          	auipc	a2,0x6
ffffffffc02020c8:	50c60613          	addi	a2,a2,1292 # ffffffffc02085d0 <commands+0x410>
ffffffffc02020cc:	0b900593          	li	a1,185
ffffffffc02020d0:	00007517          	auipc	a0,0x7
ffffffffc02020d4:	d8850513          	addi	a0,a0,-632 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02020d8:	930fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02020dc:	00007697          	auipc	a3,0x7
ffffffffc02020e0:	edc68693          	addi	a3,a3,-292 # ffffffffc0208fb8 <commands+0xdf8>
ffffffffc02020e4:	00006617          	auipc	a2,0x6
ffffffffc02020e8:	4ec60613          	addi	a2,a2,1260 # ffffffffc02085d0 <commands+0x410>
ffffffffc02020ec:	0d600593          	li	a1,214
ffffffffc02020f0:	00007517          	auipc	a0,0x7
ffffffffc02020f4:	d6850513          	addi	a0,a0,-664 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02020f8:	910fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02020fc:	00007697          	auipc	a3,0x7
ffffffffc0202100:	dd468693          	addi	a3,a3,-556 # ffffffffc0208ed0 <commands+0xd10>
ffffffffc0202104:	00006617          	auipc	a2,0x6
ffffffffc0202108:	4cc60613          	addi	a2,a2,1228 # ffffffffc02085d0 <commands+0x410>
ffffffffc020210c:	0d400593          	li	a1,212
ffffffffc0202110:	00007517          	auipc	a0,0x7
ffffffffc0202114:	d4850513          	addi	a0,a0,-696 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202118:	8f0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020211c:	00007697          	auipc	a3,0x7
ffffffffc0202120:	d9468693          	addi	a3,a3,-620 # ffffffffc0208eb0 <commands+0xcf0>
ffffffffc0202124:	00006617          	auipc	a2,0x6
ffffffffc0202128:	4ac60613          	addi	a2,a2,1196 # ffffffffc02085d0 <commands+0x410>
ffffffffc020212c:	0d300593          	li	a1,211
ffffffffc0202130:	00007517          	auipc	a0,0x7
ffffffffc0202134:	d2850513          	addi	a0,a0,-728 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202138:	8d0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020213c:	00007697          	auipc	a3,0x7
ffffffffc0202140:	d9468693          	addi	a3,a3,-620 # ffffffffc0208ed0 <commands+0xd10>
ffffffffc0202144:	00006617          	auipc	a2,0x6
ffffffffc0202148:	48c60613          	addi	a2,a2,1164 # ffffffffc02085d0 <commands+0x410>
ffffffffc020214c:	0bb00593          	li	a1,187
ffffffffc0202150:	00007517          	auipc	a0,0x7
ffffffffc0202154:	d0850513          	addi	a0,a0,-760 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202158:	8b0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020215c:	00007697          	auipc	a3,0x7
ffffffffc0202160:	01c68693          	addi	a3,a3,28 # ffffffffc0209178 <commands+0xfb8>
ffffffffc0202164:	00006617          	auipc	a2,0x6
ffffffffc0202168:	46c60613          	addi	a2,a2,1132 # ffffffffc02085d0 <commands+0x410>
ffffffffc020216c:	12500593          	li	a1,293
ffffffffc0202170:	00007517          	auipc	a0,0x7
ffffffffc0202174:	ce850513          	addi	a0,a0,-792 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202178:	890fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020217c:	00007697          	auipc	a3,0x7
ffffffffc0202180:	e9c68693          	addi	a3,a3,-356 # ffffffffc0209018 <commands+0xe58>
ffffffffc0202184:	00006617          	auipc	a2,0x6
ffffffffc0202188:	44c60613          	addi	a2,a2,1100 # ffffffffc02085d0 <commands+0x410>
ffffffffc020218c:	11a00593          	li	a1,282
ffffffffc0202190:	00007517          	auipc	a0,0x7
ffffffffc0202194:	cc850513          	addi	a0,a0,-824 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202198:	870fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020219c:	00007697          	auipc	a3,0x7
ffffffffc02021a0:	e1c68693          	addi	a3,a3,-484 # ffffffffc0208fb8 <commands+0xdf8>
ffffffffc02021a4:	00006617          	auipc	a2,0x6
ffffffffc02021a8:	42c60613          	addi	a2,a2,1068 # ffffffffc02085d0 <commands+0x410>
ffffffffc02021ac:	11800593          	li	a1,280
ffffffffc02021b0:	00007517          	auipc	a0,0x7
ffffffffc02021b4:	ca850513          	addi	a0,a0,-856 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02021b8:	850fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02021bc:	00007697          	auipc	a3,0x7
ffffffffc02021c0:	dbc68693          	addi	a3,a3,-580 # ffffffffc0208f78 <commands+0xdb8>
ffffffffc02021c4:	00006617          	auipc	a2,0x6
ffffffffc02021c8:	40c60613          	addi	a2,a2,1036 # ffffffffc02085d0 <commands+0x410>
ffffffffc02021cc:	0c100593          	li	a1,193
ffffffffc02021d0:	00007517          	auipc	a0,0x7
ffffffffc02021d4:	c8850513          	addi	a0,a0,-888 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02021d8:	830fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02021dc:	00007697          	auipc	a3,0x7
ffffffffc02021e0:	f5c68693          	addi	a3,a3,-164 # ffffffffc0209138 <commands+0xf78>
ffffffffc02021e4:	00006617          	auipc	a2,0x6
ffffffffc02021e8:	3ec60613          	addi	a2,a2,1004 # ffffffffc02085d0 <commands+0x410>
ffffffffc02021ec:	11200593          	li	a1,274
ffffffffc02021f0:	00007517          	auipc	a0,0x7
ffffffffc02021f4:	c6850513          	addi	a0,a0,-920 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02021f8:	810fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02021fc:	00007697          	auipc	a3,0x7
ffffffffc0202200:	f1c68693          	addi	a3,a3,-228 # ffffffffc0209118 <commands+0xf58>
ffffffffc0202204:	00006617          	auipc	a2,0x6
ffffffffc0202208:	3cc60613          	addi	a2,a2,972 # ffffffffc02085d0 <commands+0x410>
ffffffffc020220c:	11000593          	li	a1,272
ffffffffc0202210:	00007517          	auipc	a0,0x7
ffffffffc0202214:	c4850513          	addi	a0,a0,-952 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202218:	ff1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020221c:	00007697          	auipc	a3,0x7
ffffffffc0202220:	ed468693          	addi	a3,a3,-300 # ffffffffc02090f0 <commands+0xf30>
ffffffffc0202224:	00006617          	auipc	a2,0x6
ffffffffc0202228:	3ac60613          	addi	a2,a2,940 # ffffffffc02085d0 <commands+0x410>
ffffffffc020222c:	10e00593          	li	a1,270
ffffffffc0202230:	00007517          	auipc	a0,0x7
ffffffffc0202234:	c2850513          	addi	a0,a0,-984 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202238:	fd1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020223c:	00007697          	auipc	a3,0x7
ffffffffc0202240:	e8c68693          	addi	a3,a3,-372 # ffffffffc02090c8 <commands+0xf08>
ffffffffc0202244:	00006617          	auipc	a2,0x6
ffffffffc0202248:	38c60613          	addi	a2,a2,908 # ffffffffc02085d0 <commands+0x410>
ffffffffc020224c:	10d00593          	li	a1,269
ffffffffc0202250:	00007517          	auipc	a0,0x7
ffffffffc0202254:	c0850513          	addi	a0,a0,-1016 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202258:	fb1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020225c:	00007697          	auipc	a3,0x7
ffffffffc0202260:	e5c68693          	addi	a3,a3,-420 # ffffffffc02090b8 <commands+0xef8>
ffffffffc0202264:	00006617          	auipc	a2,0x6
ffffffffc0202268:	36c60613          	addi	a2,a2,876 # ffffffffc02085d0 <commands+0x410>
ffffffffc020226c:	10800593          	li	a1,264
ffffffffc0202270:	00007517          	auipc	a0,0x7
ffffffffc0202274:	be850513          	addi	a0,a0,-1048 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202278:	f91fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020227c:	00007697          	auipc	a3,0x7
ffffffffc0202280:	d3c68693          	addi	a3,a3,-708 # ffffffffc0208fb8 <commands+0xdf8>
ffffffffc0202284:	00006617          	auipc	a2,0x6
ffffffffc0202288:	34c60613          	addi	a2,a2,844 # ffffffffc02085d0 <commands+0x410>
ffffffffc020228c:	10700593          	li	a1,263
ffffffffc0202290:	00007517          	auipc	a0,0x7
ffffffffc0202294:	bc850513          	addi	a0,a0,-1080 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202298:	f71fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020229c:	00007697          	auipc	a3,0x7
ffffffffc02022a0:	dfc68693          	addi	a3,a3,-516 # ffffffffc0209098 <commands+0xed8>
ffffffffc02022a4:	00006617          	auipc	a2,0x6
ffffffffc02022a8:	32c60613          	addi	a2,a2,812 # ffffffffc02085d0 <commands+0x410>
ffffffffc02022ac:	10600593          	li	a1,262
ffffffffc02022b0:	00007517          	auipc	a0,0x7
ffffffffc02022b4:	ba850513          	addi	a0,a0,-1112 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02022b8:	f51fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02022bc:	00007697          	auipc	a3,0x7
ffffffffc02022c0:	dac68693          	addi	a3,a3,-596 # ffffffffc0209068 <commands+0xea8>
ffffffffc02022c4:	00006617          	auipc	a2,0x6
ffffffffc02022c8:	30c60613          	addi	a2,a2,780 # ffffffffc02085d0 <commands+0x410>
ffffffffc02022cc:	10500593          	li	a1,261
ffffffffc02022d0:	00007517          	auipc	a0,0x7
ffffffffc02022d4:	b8850513          	addi	a0,a0,-1144 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02022d8:	f31fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02022dc:	00007697          	auipc	a3,0x7
ffffffffc02022e0:	d7468693          	addi	a3,a3,-652 # ffffffffc0209050 <commands+0xe90>
ffffffffc02022e4:	00006617          	auipc	a2,0x6
ffffffffc02022e8:	2ec60613          	addi	a2,a2,748 # ffffffffc02085d0 <commands+0x410>
ffffffffc02022ec:	10400593          	li	a1,260
ffffffffc02022f0:	00007517          	auipc	a0,0x7
ffffffffc02022f4:	b6850513          	addi	a0,a0,-1176 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02022f8:	f11fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02022fc:	00007697          	auipc	a3,0x7
ffffffffc0202300:	cbc68693          	addi	a3,a3,-836 # ffffffffc0208fb8 <commands+0xdf8>
ffffffffc0202304:	00006617          	auipc	a2,0x6
ffffffffc0202308:	2cc60613          	addi	a2,a2,716 # ffffffffc02085d0 <commands+0x410>
ffffffffc020230c:	0fe00593          	li	a1,254
ffffffffc0202310:	00007517          	auipc	a0,0x7
ffffffffc0202314:	b4850513          	addi	a0,a0,-1208 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202318:	ef1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020231c:	00007697          	auipc	a3,0x7
ffffffffc0202320:	d1c68693          	addi	a3,a3,-740 # ffffffffc0209038 <commands+0xe78>
ffffffffc0202324:	00006617          	auipc	a2,0x6
ffffffffc0202328:	2ac60613          	addi	a2,a2,684 # ffffffffc02085d0 <commands+0x410>
ffffffffc020232c:	0f900593          	li	a1,249
ffffffffc0202330:	00007517          	auipc	a0,0x7
ffffffffc0202334:	b2850513          	addi	a0,a0,-1240 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202338:	ed1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020233c:	00007697          	auipc	a3,0x7
ffffffffc0202340:	e1c68693          	addi	a3,a3,-484 # ffffffffc0209158 <commands+0xf98>
ffffffffc0202344:	00006617          	auipc	a2,0x6
ffffffffc0202348:	28c60613          	addi	a2,a2,652 # ffffffffc02085d0 <commands+0x410>
ffffffffc020234c:	11700593          	li	a1,279
ffffffffc0202350:	00007517          	auipc	a0,0x7
ffffffffc0202354:	b0850513          	addi	a0,a0,-1272 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202358:	eb1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020235c:	00007697          	auipc	a3,0x7
ffffffffc0202360:	e2c68693          	addi	a3,a3,-468 # ffffffffc0209188 <commands+0xfc8>
ffffffffc0202364:	00006617          	auipc	a2,0x6
ffffffffc0202368:	26c60613          	addi	a2,a2,620 # ffffffffc02085d0 <commands+0x410>
ffffffffc020236c:	12600593          	li	a1,294
ffffffffc0202370:	00007517          	auipc	a0,0x7
ffffffffc0202374:	ae850513          	addi	a0,a0,-1304 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202378:	e91fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020237c:	00007697          	auipc	a3,0x7
ffffffffc0202380:	af468693          	addi	a3,a3,-1292 # ffffffffc0208e70 <commands+0xcb0>
ffffffffc0202384:	00006617          	auipc	a2,0x6
ffffffffc0202388:	24c60613          	addi	a2,a2,588 # ffffffffc02085d0 <commands+0x410>
ffffffffc020238c:	0f300593          	li	a1,243
ffffffffc0202390:	00007517          	auipc	a0,0x7
ffffffffc0202394:	ac850513          	addi	a0,a0,-1336 # ffffffffc0208e58 <commands+0xc98>
ffffffffc0202398:	e71fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020239c:	00007697          	auipc	a3,0x7
ffffffffc02023a0:	b1468693          	addi	a3,a3,-1260 # ffffffffc0208eb0 <commands+0xcf0>
ffffffffc02023a4:	00006617          	auipc	a2,0x6
ffffffffc02023a8:	22c60613          	addi	a2,a2,556 # ffffffffc02085d0 <commands+0x410>
ffffffffc02023ac:	0ba00593          	li	a1,186
ffffffffc02023b0:	00007517          	auipc	a0,0x7
ffffffffc02023b4:	aa850513          	addi	a0,a0,-1368 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02023b8:	e51fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02023bc <default_free_pages>:
ffffffffc02023bc:	1141                	addi	sp,sp,-16
ffffffffc02023be:	e406                	sd	ra,8(sp)
ffffffffc02023c0:	12058f63          	beqz	a1,ffffffffc02024fe <default_free_pages+0x142>
ffffffffc02023c4:	00659693          	slli	a3,a1,0x6
ffffffffc02023c8:	96aa                	add	a3,a3,a0
ffffffffc02023ca:	87aa                	mv	a5,a0
ffffffffc02023cc:	02d50263          	beq	a0,a3,ffffffffc02023f0 <default_free_pages+0x34>
ffffffffc02023d0:	6798                	ld	a4,8(a5)
ffffffffc02023d2:	8b05                	andi	a4,a4,1
ffffffffc02023d4:	10071563          	bnez	a4,ffffffffc02024de <default_free_pages+0x122>
ffffffffc02023d8:	6798                	ld	a4,8(a5)
ffffffffc02023da:	8b09                	andi	a4,a4,2
ffffffffc02023dc:	10071163          	bnez	a4,ffffffffc02024de <default_free_pages+0x122>
ffffffffc02023e0:	0007b423          	sd	zero,8(a5)
ffffffffc02023e4:	0007a023          	sw	zero,0(a5)
ffffffffc02023e8:	04078793          	addi	a5,a5,64
ffffffffc02023ec:	fed792e3          	bne	a5,a3,ffffffffc02023d0 <default_free_pages+0x14>
ffffffffc02023f0:	2581                	sext.w	a1,a1
ffffffffc02023f2:	c90c                	sw	a1,16(a0)
ffffffffc02023f4:	00850893          	addi	a7,a0,8
ffffffffc02023f8:	4789                	li	a5,2
ffffffffc02023fa:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc02023fe:	00017697          	auipc	a3,0x17
ffffffffc0202402:	21268693          	addi	a3,a3,530 # ffffffffc0219610 <free_area>
ffffffffc0202406:	4a98                	lw	a4,16(a3)
ffffffffc0202408:	669c                	ld	a5,8(a3)
ffffffffc020240a:	01850613          	addi	a2,a0,24
ffffffffc020240e:	9db9                	addw	a1,a1,a4
ffffffffc0202410:	ca8c                	sw	a1,16(a3)
ffffffffc0202412:	08d78f63          	beq	a5,a3,ffffffffc02024b0 <default_free_pages+0xf4>
ffffffffc0202416:	fe878713          	addi	a4,a5,-24
ffffffffc020241a:	0006b803          	ld	a6,0(a3)
ffffffffc020241e:	4581                	li	a1,0
ffffffffc0202420:	00e56a63          	bltu	a0,a4,ffffffffc0202434 <default_free_pages+0x78>
ffffffffc0202424:	6798                	ld	a4,8(a5)
ffffffffc0202426:	04d70a63          	beq	a4,a3,ffffffffc020247a <default_free_pages+0xbe>
ffffffffc020242a:	87ba                	mv	a5,a4
ffffffffc020242c:	fe878713          	addi	a4,a5,-24
ffffffffc0202430:	fee57ae3          	bgeu	a0,a4,ffffffffc0202424 <default_free_pages+0x68>
ffffffffc0202434:	c199                	beqz	a1,ffffffffc020243a <default_free_pages+0x7e>
ffffffffc0202436:	0106b023          	sd	a6,0(a3)
ffffffffc020243a:	6398                	ld	a4,0(a5)
ffffffffc020243c:	e390                	sd	a2,0(a5)
ffffffffc020243e:	e710                	sd	a2,8(a4)
ffffffffc0202440:	f11c                	sd	a5,32(a0)
ffffffffc0202442:	ed18                	sd	a4,24(a0)
ffffffffc0202444:	00d70c63          	beq	a4,a3,ffffffffc020245c <default_free_pages+0xa0>
ffffffffc0202448:	ff872583          	lw	a1,-8(a4) # ff8 <kern_entry-0xffffffffc01ff008>
ffffffffc020244c:	fe870613          	addi	a2,a4,-24
ffffffffc0202450:	02059793          	slli	a5,a1,0x20
ffffffffc0202454:	83e9                	srli	a5,a5,0x1a
ffffffffc0202456:	97b2                	add	a5,a5,a2
ffffffffc0202458:	02f50b63          	beq	a0,a5,ffffffffc020248e <default_free_pages+0xd2>
ffffffffc020245c:	7118                	ld	a4,32(a0)
ffffffffc020245e:	00d70b63          	beq	a4,a3,ffffffffc0202474 <default_free_pages+0xb8>
ffffffffc0202462:	4910                	lw	a2,16(a0)
ffffffffc0202464:	fe870693          	addi	a3,a4,-24
ffffffffc0202468:	02061793          	slli	a5,a2,0x20
ffffffffc020246c:	83e9                	srli	a5,a5,0x1a
ffffffffc020246e:	97aa                	add	a5,a5,a0
ffffffffc0202470:	04f68763          	beq	a3,a5,ffffffffc02024be <default_free_pages+0x102>
ffffffffc0202474:	60a2                	ld	ra,8(sp)
ffffffffc0202476:	0141                	addi	sp,sp,16
ffffffffc0202478:	8082                	ret
ffffffffc020247a:	e790                	sd	a2,8(a5)
ffffffffc020247c:	f114                	sd	a3,32(a0)
ffffffffc020247e:	6798                	ld	a4,8(a5)
ffffffffc0202480:	ed1c                	sd	a5,24(a0)
ffffffffc0202482:	02d70463          	beq	a4,a3,ffffffffc02024aa <default_free_pages+0xee>
ffffffffc0202486:	8832                	mv	a6,a2
ffffffffc0202488:	4585                	li	a1,1
ffffffffc020248a:	87ba                	mv	a5,a4
ffffffffc020248c:	b745                	j	ffffffffc020242c <default_free_pages+0x70>
ffffffffc020248e:	491c                	lw	a5,16(a0)
ffffffffc0202490:	9dbd                	addw	a1,a1,a5
ffffffffc0202492:	feb72c23          	sw	a1,-8(a4)
ffffffffc0202496:	57f5                	li	a5,-3
ffffffffc0202498:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc020249c:	6d0c                	ld	a1,24(a0)
ffffffffc020249e:	711c                	ld	a5,32(a0)
ffffffffc02024a0:	8532                	mv	a0,a2
ffffffffc02024a2:	e59c                	sd	a5,8(a1)
ffffffffc02024a4:	6718                	ld	a4,8(a4)
ffffffffc02024a6:	e38c                	sd	a1,0(a5)
ffffffffc02024a8:	bf5d                	j	ffffffffc020245e <default_free_pages+0xa2>
ffffffffc02024aa:	e290                	sd	a2,0(a3)
ffffffffc02024ac:	873e                	mv	a4,a5
ffffffffc02024ae:	bf69                	j	ffffffffc0202448 <default_free_pages+0x8c>
ffffffffc02024b0:	60a2                	ld	ra,8(sp)
ffffffffc02024b2:	e390                	sd	a2,0(a5)
ffffffffc02024b4:	e790                	sd	a2,8(a5)
ffffffffc02024b6:	f11c                	sd	a5,32(a0)
ffffffffc02024b8:	ed1c                	sd	a5,24(a0)
ffffffffc02024ba:	0141                	addi	sp,sp,16
ffffffffc02024bc:	8082                	ret
ffffffffc02024be:	ff872783          	lw	a5,-8(a4)
ffffffffc02024c2:	ff070693          	addi	a3,a4,-16
ffffffffc02024c6:	9e3d                	addw	a2,a2,a5
ffffffffc02024c8:	c910                	sw	a2,16(a0)
ffffffffc02024ca:	57f5                	li	a5,-3
ffffffffc02024cc:	60f6b02f          	amoand.d	zero,a5,(a3)
ffffffffc02024d0:	6314                	ld	a3,0(a4)
ffffffffc02024d2:	671c                	ld	a5,8(a4)
ffffffffc02024d4:	60a2                	ld	ra,8(sp)
ffffffffc02024d6:	e69c                	sd	a5,8(a3)
ffffffffc02024d8:	e394                	sd	a3,0(a5)
ffffffffc02024da:	0141                	addi	sp,sp,16
ffffffffc02024dc:	8082                	ret
ffffffffc02024de:	00007697          	auipc	a3,0x7
ffffffffc02024e2:	cc268693          	addi	a3,a3,-830 # ffffffffc02091a0 <commands+0xfe0>
ffffffffc02024e6:	00006617          	auipc	a2,0x6
ffffffffc02024ea:	0ea60613          	addi	a2,a2,234 # ffffffffc02085d0 <commands+0x410>
ffffffffc02024ee:	08300593          	li	a1,131
ffffffffc02024f2:	00007517          	auipc	a0,0x7
ffffffffc02024f6:	96650513          	addi	a0,a0,-1690 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02024fa:	d0ffd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02024fe:	00007697          	auipc	a3,0x7
ffffffffc0202502:	c9a68693          	addi	a3,a3,-870 # ffffffffc0209198 <commands+0xfd8>
ffffffffc0202506:	00006617          	auipc	a2,0x6
ffffffffc020250a:	0ca60613          	addi	a2,a2,202 # ffffffffc02085d0 <commands+0x410>
ffffffffc020250e:	08000593          	li	a1,128
ffffffffc0202512:	00007517          	auipc	a0,0x7
ffffffffc0202516:	94650513          	addi	a0,a0,-1722 # ffffffffc0208e58 <commands+0xc98>
ffffffffc020251a:	ceffd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020251e <default_alloc_pages>:
ffffffffc020251e:	c941                	beqz	a0,ffffffffc02025ae <default_alloc_pages+0x90>
ffffffffc0202520:	00017597          	auipc	a1,0x17
ffffffffc0202524:	0f058593          	addi	a1,a1,240 # ffffffffc0219610 <free_area>
ffffffffc0202528:	0105a803          	lw	a6,16(a1)
ffffffffc020252c:	872a                	mv	a4,a0
ffffffffc020252e:	02081793          	slli	a5,a6,0x20
ffffffffc0202532:	9381                	srli	a5,a5,0x20
ffffffffc0202534:	00a7ee63          	bltu	a5,a0,ffffffffc0202550 <default_alloc_pages+0x32>
ffffffffc0202538:	87ae                	mv	a5,a1
ffffffffc020253a:	a801                	j	ffffffffc020254a <default_alloc_pages+0x2c>
ffffffffc020253c:	ff87a683          	lw	a3,-8(a5)
ffffffffc0202540:	02069613          	slli	a2,a3,0x20
ffffffffc0202544:	9201                	srli	a2,a2,0x20
ffffffffc0202546:	00e67763          	bgeu	a2,a4,ffffffffc0202554 <default_alloc_pages+0x36>
ffffffffc020254a:	679c                	ld	a5,8(a5)
ffffffffc020254c:	feb798e3          	bne	a5,a1,ffffffffc020253c <default_alloc_pages+0x1e>
ffffffffc0202550:	4501                	li	a0,0
ffffffffc0202552:	8082                	ret
ffffffffc0202554:	0007b883          	ld	a7,0(a5)
ffffffffc0202558:	0087b303          	ld	t1,8(a5)
ffffffffc020255c:	fe878513          	addi	a0,a5,-24
ffffffffc0202560:	00070e1b          	sext.w	t3,a4
ffffffffc0202564:	0068b423          	sd	t1,8(a7)
ffffffffc0202568:	01133023          	sd	a7,0(t1)
ffffffffc020256c:	02c77863          	bgeu	a4,a2,ffffffffc020259c <default_alloc_pages+0x7e>
ffffffffc0202570:	071a                	slli	a4,a4,0x6
ffffffffc0202572:	972a                	add	a4,a4,a0
ffffffffc0202574:	41c686bb          	subw	a3,a3,t3
ffffffffc0202578:	cb14                	sw	a3,16(a4)
ffffffffc020257a:	00870613          	addi	a2,a4,8
ffffffffc020257e:	4689                	li	a3,2
ffffffffc0202580:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0202584:	0088b683          	ld	a3,8(a7)
ffffffffc0202588:	01870613          	addi	a2,a4,24
ffffffffc020258c:	0105a803          	lw	a6,16(a1)
ffffffffc0202590:	e290                	sd	a2,0(a3)
ffffffffc0202592:	00c8b423          	sd	a2,8(a7)
ffffffffc0202596:	f314                	sd	a3,32(a4)
ffffffffc0202598:	01173c23          	sd	a7,24(a4)
ffffffffc020259c:	41c8083b          	subw	a6,a6,t3
ffffffffc02025a0:	0105a823          	sw	a6,16(a1)
ffffffffc02025a4:	5775                	li	a4,-3
ffffffffc02025a6:	17c1                	addi	a5,a5,-16
ffffffffc02025a8:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc02025ac:	8082                	ret
ffffffffc02025ae:	1141                	addi	sp,sp,-16
ffffffffc02025b0:	00007697          	auipc	a3,0x7
ffffffffc02025b4:	be868693          	addi	a3,a3,-1048 # ffffffffc0209198 <commands+0xfd8>
ffffffffc02025b8:	00006617          	auipc	a2,0x6
ffffffffc02025bc:	01860613          	addi	a2,a2,24 # ffffffffc02085d0 <commands+0x410>
ffffffffc02025c0:	06200593          	li	a1,98
ffffffffc02025c4:	00007517          	auipc	a0,0x7
ffffffffc02025c8:	89450513          	addi	a0,a0,-1900 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02025cc:	e406                	sd	ra,8(sp)
ffffffffc02025ce:	c3bfd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02025d2 <default_init_memmap>:
ffffffffc02025d2:	1141                	addi	sp,sp,-16
ffffffffc02025d4:	e406                	sd	ra,8(sp)
ffffffffc02025d6:	c5f1                	beqz	a1,ffffffffc02026a2 <default_init_memmap+0xd0>
ffffffffc02025d8:	00659693          	slli	a3,a1,0x6
ffffffffc02025dc:	96aa                	add	a3,a3,a0
ffffffffc02025de:	87aa                	mv	a5,a0
ffffffffc02025e0:	00d50f63          	beq	a0,a3,ffffffffc02025fe <default_init_memmap+0x2c>
ffffffffc02025e4:	6798                	ld	a4,8(a5)
ffffffffc02025e6:	8b05                	andi	a4,a4,1
ffffffffc02025e8:	cf49                	beqz	a4,ffffffffc0202682 <default_init_memmap+0xb0>
ffffffffc02025ea:	0007a823          	sw	zero,16(a5)
ffffffffc02025ee:	0007b423          	sd	zero,8(a5)
ffffffffc02025f2:	0007a023          	sw	zero,0(a5)
ffffffffc02025f6:	04078793          	addi	a5,a5,64
ffffffffc02025fa:	fed795e3          	bne	a5,a3,ffffffffc02025e4 <default_init_memmap+0x12>
ffffffffc02025fe:	2581                	sext.w	a1,a1
ffffffffc0202600:	c90c                	sw	a1,16(a0)
ffffffffc0202602:	4789                	li	a5,2
ffffffffc0202604:	00850713          	addi	a4,a0,8
ffffffffc0202608:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc020260c:	00017697          	auipc	a3,0x17
ffffffffc0202610:	00468693          	addi	a3,a3,4 # ffffffffc0219610 <free_area>
ffffffffc0202614:	4a98                	lw	a4,16(a3)
ffffffffc0202616:	669c                	ld	a5,8(a3)
ffffffffc0202618:	01850613          	addi	a2,a0,24
ffffffffc020261c:	9db9                	addw	a1,a1,a4
ffffffffc020261e:	ca8c                	sw	a1,16(a3)
ffffffffc0202620:	04d78a63          	beq	a5,a3,ffffffffc0202674 <default_init_memmap+0xa2>
ffffffffc0202624:	fe878713          	addi	a4,a5,-24
ffffffffc0202628:	0006b803          	ld	a6,0(a3)
ffffffffc020262c:	4581                	li	a1,0
ffffffffc020262e:	00e56a63          	bltu	a0,a4,ffffffffc0202642 <default_init_memmap+0x70>
ffffffffc0202632:	6798                	ld	a4,8(a5)
ffffffffc0202634:	02d70263          	beq	a4,a3,ffffffffc0202658 <default_init_memmap+0x86>
ffffffffc0202638:	87ba                	mv	a5,a4
ffffffffc020263a:	fe878713          	addi	a4,a5,-24
ffffffffc020263e:	fee57ae3          	bgeu	a0,a4,ffffffffc0202632 <default_init_memmap+0x60>
ffffffffc0202642:	c199                	beqz	a1,ffffffffc0202648 <default_init_memmap+0x76>
ffffffffc0202644:	0106b023          	sd	a6,0(a3)
ffffffffc0202648:	6398                	ld	a4,0(a5)
ffffffffc020264a:	60a2                	ld	ra,8(sp)
ffffffffc020264c:	e390                	sd	a2,0(a5)
ffffffffc020264e:	e710                	sd	a2,8(a4)
ffffffffc0202650:	f11c                	sd	a5,32(a0)
ffffffffc0202652:	ed18                	sd	a4,24(a0)
ffffffffc0202654:	0141                	addi	sp,sp,16
ffffffffc0202656:	8082                	ret
ffffffffc0202658:	e790                	sd	a2,8(a5)
ffffffffc020265a:	f114                	sd	a3,32(a0)
ffffffffc020265c:	6798                	ld	a4,8(a5)
ffffffffc020265e:	ed1c                	sd	a5,24(a0)
ffffffffc0202660:	00d70663          	beq	a4,a3,ffffffffc020266c <default_init_memmap+0x9a>
ffffffffc0202664:	8832                	mv	a6,a2
ffffffffc0202666:	4585                	li	a1,1
ffffffffc0202668:	87ba                	mv	a5,a4
ffffffffc020266a:	bfc1                	j	ffffffffc020263a <default_init_memmap+0x68>
ffffffffc020266c:	60a2                	ld	ra,8(sp)
ffffffffc020266e:	e290                	sd	a2,0(a3)
ffffffffc0202670:	0141                	addi	sp,sp,16
ffffffffc0202672:	8082                	ret
ffffffffc0202674:	60a2                	ld	ra,8(sp)
ffffffffc0202676:	e390                	sd	a2,0(a5)
ffffffffc0202678:	e790                	sd	a2,8(a5)
ffffffffc020267a:	f11c                	sd	a5,32(a0)
ffffffffc020267c:	ed1c                	sd	a5,24(a0)
ffffffffc020267e:	0141                	addi	sp,sp,16
ffffffffc0202680:	8082                	ret
ffffffffc0202682:	00007697          	auipc	a3,0x7
ffffffffc0202686:	b4668693          	addi	a3,a3,-1210 # ffffffffc02091c8 <commands+0x1008>
ffffffffc020268a:	00006617          	auipc	a2,0x6
ffffffffc020268e:	f4660613          	addi	a2,a2,-186 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202692:	04900593          	li	a1,73
ffffffffc0202696:	00006517          	auipc	a0,0x6
ffffffffc020269a:	7c250513          	addi	a0,a0,1986 # ffffffffc0208e58 <commands+0xc98>
ffffffffc020269e:	b6bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02026a2:	00007697          	auipc	a3,0x7
ffffffffc02026a6:	af668693          	addi	a3,a3,-1290 # ffffffffc0209198 <commands+0xfd8>
ffffffffc02026aa:	00006617          	auipc	a2,0x6
ffffffffc02026ae:	f2660613          	addi	a2,a2,-218 # ffffffffc02085d0 <commands+0x410>
ffffffffc02026b2:	04600593          	li	a1,70
ffffffffc02026b6:	00006517          	auipc	a0,0x6
ffffffffc02026ba:	7a250513          	addi	a0,a0,1954 # ffffffffc0208e58 <commands+0xc98>
ffffffffc02026be:	b4bfd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02026c2 <pa2page.part.0>:
ffffffffc02026c2:	1141                	addi	sp,sp,-16
ffffffffc02026c4:	00006617          	auipc	a2,0x6
ffffffffc02026c8:	58460613          	addi	a2,a2,1412 # ffffffffc0208c48 <commands+0xa88>
ffffffffc02026cc:	06200593          	li	a1,98
ffffffffc02026d0:	00006517          	auipc	a0,0x6
ffffffffc02026d4:	50850513          	addi	a0,a0,1288 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc02026d8:	e406                	sd	ra,8(sp)
ffffffffc02026da:	b2ffd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02026de <alloc_pages>:
ffffffffc02026de:	7139                	addi	sp,sp,-64
ffffffffc02026e0:	f426                	sd	s1,40(sp)
ffffffffc02026e2:	f04a                	sd	s2,32(sp)
ffffffffc02026e4:	ec4e                	sd	s3,24(sp)
ffffffffc02026e6:	e852                	sd	s4,16(sp)
ffffffffc02026e8:	e456                	sd	s5,8(sp)
ffffffffc02026ea:	e05a                	sd	s6,0(sp)
ffffffffc02026ec:	fc06                	sd	ra,56(sp)
ffffffffc02026ee:	f822                	sd	s0,48(sp)
ffffffffc02026f0:	84aa                	mv	s1,a0
ffffffffc02026f2:	00017917          	auipc	s2,0x17
ffffffffc02026f6:	f3690913          	addi	s2,s2,-202 # ffffffffc0219628 <pmm_manager>
ffffffffc02026fa:	4a05                	li	s4,1
ffffffffc02026fc:	00017a97          	auipc	s5,0x17
ffffffffc0202700:	ddca8a93          	addi	s5,s5,-548 # ffffffffc02194d8 <swap_init_ok>
ffffffffc0202704:	0005099b          	sext.w	s3,a0
ffffffffc0202708:	00017b17          	auipc	s6,0x17
ffffffffc020270c:	e28b0b13          	addi	s6,s6,-472 # ffffffffc0219530 <check_mm_struct>
ffffffffc0202710:	a01d                	j	ffffffffc0202736 <alloc_pages+0x58>
ffffffffc0202712:	00093783          	ld	a5,0(s2)
ffffffffc0202716:	6f9c                	ld	a5,24(a5)
ffffffffc0202718:	9782                	jalr	a5
ffffffffc020271a:	842a                	mv	s0,a0
ffffffffc020271c:	4601                	li	a2,0
ffffffffc020271e:	85ce                	mv	a1,s3
ffffffffc0202720:	ec0d                	bnez	s0,ffffffffc020275a <alloc_pages+0x7c>
ffffffffc0202722:	029a6c63          	bltu	s4,s1,ffffffffc020275a <alloc_pages+0x7c>
ffffffffc0202726:	000aa783          	lw	a5,0(s5)
ffffffffc020272a:	2781                	sext.w	a5,a5
ffffffffc020272c:	c79d                	beqz	a5,ffffffffc020275a <alloc_pages+0x7c>
ffffffffc020272e:	000b3503          	ld	a0,0(s6)
ffffffffc0202732:	bcbfe0ef          	jal	ra,ffffffffc02012fc <swap_out>
ffffffffc0202736:	100027f3          	csrr	a5,sstatus
ffffffffc020273a:	8b89                	andi	a5,a5,2
ffffffffc020273c:	8526                	mv	a0,s1
ffffffffc020273e:	dbf1                	beqz	a5,ffffffffc0202712 <alloc_pages+0x34>
ffffffffc0202740:	ef9fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0202744:	00093783          	ld	a5,0(s2)
ffffffffc0202748:	8526                	mv	a0,s1
ffffffffc020274a:	6f9c                	ld	a5,24(a5)
ffffffffc020274c:	9782                	jalr	a5
ffffffffc020274e:	842a                	mv	s0,a0
ffffffffc0202750:	ee3fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0202754:	4601                	li	a2,0
ffffffffc0202756:	85ce                	mv	a1,s3
ffffffffc0202758:	d469                	beqz	s0,ffffffffc0202722 <alloc_pages+0x44>
ffffffffc020275a:	70e2                	ld	ra,56(sp)
ffffffffc020275c:	8522                	mv	a0,s0
ffffffffc020275e:	7442                	ld	s0,48(sp)
ffffffffc0202760:	74a2                	ld	s1,40(sp)
ffffffffc0202762:	7902                	ld	s2,32(sp)
ffffffffc0202764:	69e2                	ld	s3,24(sp)
ffffffffc0202766:	6a42                	ld	s4,16(sp)
ffffffffc0202768:	6aa2                	ld	s5,8(sp)
ffffffffc020276a:	6b02                	ld	s6,0(sp)
ffffffffc020276c:	6121                	addi	sp,sp,64
ffffffffc020276e:	8082                	ret

ffffffffc0202770 <free_pages>:
ffffffffc0202770:	100027f3          	csrr	a5,sstatus
ffffffffc0202774:	8b89                	andi	a5,a5,2
ffffffffc0202776:	eb81                	bnez	a5,ffffffffc0202786 <free_pages+0x16>
ffffffffc0202778:	00017797          	auipc	a5,0x17
ffffffffc020277c:	eb07b783          	ld	a5,-336(a5) # ffffffffc0219628 <pmm_manager>
ffffffffc0202780:	0207b303          	ld	t1,32(a5)
ffffffffc0202784:	8302                	jr	t1
ffffffffc0202786:	1101                	addi	sp,sp,-32
ffffffffc0202788:	ec06                	sd	ra,24(sp)
ffffffffc020278a:	e822                	sd	s0,16(sp)
ffffffffc020278c:	e426                	sd	s1,8(sp)
ffffffffc020278e:	842a                	mv	s0,a0
ffffffffc0202790:	84ae                	mv	s1,a1
ffffffffc0202792:	ea7fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0202796:	00017797          	auipc	a5,0x17
ffffffffc020279a:	e927b783          	ld	a5,-366(a5) # ffffffffc0219628 <pmm_manager>
ffffffffc020279e:	739c                	ld	a5,32(a5)
ffffffffc02027a0:	85a6                	mv	a1,s1
ffffffffc02027a2:	8522                	mv	a0,s0
ffffffffc02027a4:	9782                	jalr	a5
ffffffffc02027a6:	6442                	ld	s0,16(sp)
ffffffffc02027a8:	60e2                	ld	ra,24(sp)
ffffffffc02027aa:	64a2                	ld	s1,8(sp)
ffffffffc02027ac:	6105                	addi	sp,sp,32
ffffffffc02027ae:	e85fd06f          	j	ffffffffc0200632 <intr_enable>

ffffffffc02027b2 <nr_free_pages>:
ffffffffc02027b2:	100027f3          	csrr	a5,sstatus
ffffffffc02027b6:	8b89                	andi	a5,a5,2
ffffffffc02027b8:	eb81                	bnez	a5,ffffffffc02027c8 <nr_free_pages+0x16>
ffffffffc02027ba:	00017797          	auipc	a5,0x17
ffffffffc02027be:	e6e7b783          	ld	a5,-402(a5) # ffffffffc0219628 <pmm_manager>
ffffffffc02027c2:	0287b303          	ld	t1,40(a5)
ffffffffc02027c6:	8302                	jr	t1
ffffffffc02027c8:	1141                	addi	sp,sp,-16
ffffffffc02027ca:	e406                	sd	ra,8(sp)
ffffffffc02027cc:	e022                	sd	s0,0(sp)
ffffffffc02027ce:	e6bfd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02027d2:	00017797          	auipc	a5,0x17
ffffffffc02027d6:	e567b783          	ld	a5,-426(a5) # ffffffffc0219628 <pmm_manager>
ffffffffc02027da:	779c                	ld	a5,40(a5)
ffffffffc02027dc:	9782                	jalr	a5
ffffffffc02027de:	842a                	mv	s0,a0
ffffffffc02027e0:	e53fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc02027e4:	60a2                	ld	ra,8(sp)
ffffffffc02027e6:	8522                	mv	a0,s0
ffffffffc02027e8:	6402                	ld	s0,0(sp)
ffffffffc02027ea:	0141                	addi	sp,sp,16
ffffffffc02027ec:	8082                	ret

ffffffffc02027ee <pmm_init>:
ffffffffc02027ee:	00007797          	auipc	a5,0x7
ffffffffc02027f2:	a0278793          	addi	a5,a5,-1534 # ffffffffc02091f0 <default_pmm_manager>
ffffffffc02027f6:	638c                	ld	a1,0(a5)
ffffffffc02027f8:	1101                	addi	sp,sp,-32
ffffffffc02027fa:	e426                	sd	s1,8(sp)
ffffffffc02027fc:	00007517          	auipc	a0,0x7
ffffffffc0202800:	a2c50513          	addi	a0,a0,-1492 # ffffffffc0209228 <default_pmm_manager+0x38>
ffffffffc0202804:	00017497          	auipc	s1,0x17
ffffffffc0202808:	e2448493          	addi	s1,s1,-476 # ffffffffc0219628 <pmm_manager>
ffffffffc020280c:	ec06                	sd	ra,24(sp)
ffffffffc020280e:	e822                	sd	s0,16(sp)
ffffffffc0202810:	e09c                	sd	a5,0(s1)
ffffffffc0202812:	8bbfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202816:	609c                	ld	a5,0(s1)
ffffffffc0202818:	00017417          	auipc	s0,0x17
ffffffffc020281c:	e1840413          	addi	s0,s0,-488 # ffffffffc0219630 <va_pa_offset>
ffffffffc0202820:	679c                	ld	a5,8(a5)
ffffffffc0202822:	9782                	jalr	a5
ffffffffc0202824:	57f5                	li	a5,-3
ffffffffc0202826:	07fa                	slli	a5,a5,0x1e
ffffffffc0202828:	00007517          	auipc	a0,0x7
ffffffffc020282c:	a1850513          	addi	a0,a0,-1512 # ffffffffc0209240 <default_pmm_manager+0x50>
ffffffffc0202830:	e01c                	sd	a5,0(s0)
ffffffffc0202832:	89bfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202836:	44300693          	li	a3,1091
ffffffffc020283a:	06d6                	slli	a3,a3,0x15
ffffffffc020283c:	40100613          	li	a2,1025
ffffffffc0202840:	0656                	slli	a2,a2,0x15
ffffffffc0202842:	088005b7          	lui	a1,0x8800
ffffffffc0202846:	16fd                	addi	a3,a3,-1
ffffffffc0202848:	00007517          	auipc	a0,0x7
ffffffffc020284c:	a1050513          	addi	a0,a0,-1520 # ffffffffc0209258 <default_pmm_manager+0x68>
ffffffffc0202850:	87dfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202854:	777d                	lui	a4,0xfffff
ffffffffc0202856:	00018797          	auipc	a5,0x18
ffffffffc020285a:	ef178793          	addi	a5,a5,-271 # ffffffffc021a747 <end+0xfff>
ffffffffc020285e:	8ff9                	and	a5,a5,a4
ffffffffc0202860:	00088737          	lui	a4,0x88
ffffffffc0202864:	60070713          	addi	a4,a4,1536 # 88600 <kern_entry-0xffffffffc0177a00>
ffffffffc0202868:	00017597          	auipc	a1,0x17
ffffffffc020286c:	c8858593          	addi	a1,a1,-888 # ffffffffc02194f0 <npage>
ffffffffc0202870:	00017617          	auipc	a2,0x17
ffffffffc0202874:	dd060613          	addi	a2,a2,-560 # ffffffffc0219640 <pages>
ffffffffc0202878:	e198                	sd	a4,0(a1)
ffffffffc020287a:	e21c                	sd	a5,0(a2)
ffffffffc020287c:	4701                	li	a4,0
ffffffffc020287e:	4505                	li	a0,1
ffffffffc0202880:	fff80837          	lui	a6,0xfff80
ffffffffc0202884:	a011                	j	ffffffffc0202888 <pmm_init+0x9a>
ffffffffc0202886:	621c                	ld	a5,0(a2)
ffffffffc0202888:	00671693          	slli	a3,a4,0x6
ffffffffc020288c:	97b6                	add	a5,a5,a3
ffffffffc020288e:	07a1                	addi	a5,a5,8
ffffffffc0202890:	40a7b02f          	amoor.d	zero,a0,(a5)
ffffffffc0202894:	0005b883          	ld	a7,0(a1)
ffffffffc0202898:	0705                	addi	a4,a4,1
ffffffffc020289a:	010886b3          	add	a3,a7,a6
ffffffffc020289e:	fed764e3          	bltu	a4,a3,ffffffffc0202886 <pmm_init+0x98>
ffffffffc02028a2:	6208                	ld	a0,0(a2)
ffffffffc02028a4:	069a                	slli	a3,a3,0x6
ffffffffc02028a6:	c02007b7          	lui	a5,0xc0200
ffffffffc02028aa:	96aa                	add	a3,a3,a0
ffffffffc02028ac:	06f6e163          	bltu	a3,a5,ffffffffc020290e <pmm_init+0x120>
ffffffffc02028b0:	601c                	ld	a5,0(s0)
ffffffffc02028b2:	44300593          	li	a1,1091
ffffffffc02028b6:	05d6                	slli	a1,a1,0x15
ffffffffc02028b8:	8e9d                	sub	a3,a3,a5
ffffffffc02028ba:	02b6f363          	bgeu	a3,a1,ffffffffc02028e0 <pmm_init+0xf2>
ffffffffc02028be:	6785                	lui	a5,0x1
ffffffffc02028c0:	17fd                	addi	a5,a5,-1
ffffffffc02028c2:	96be                	add	a3,a3,a5
ffffffffc02028c4:	00c6d793          	srli	a5,a3,0xc
ffffffffc02028c8:	0717fb63          	bgeu	a5,a7,ffffffffc020293e <pmm_init+0x150>
ffffffffc02028cc:	6098                	ld	a4,0(s1)
ffffffffc02028ce:	767d                	lui	a2,0xfffff
ffffffffc02028d0:	8ef1                	and	a3,a3,a2
ffffffffc02028d2:	97c2                	add	a5,a5,a6
ffffffffc02028d4:	6b18                	ld	a4,16(a4)
ffffffffc02028d6:	8d95                	sub	a1,a1,a3
ffffffffc02028d8:	079a                	slli	a5,a5,0x6
ffffffffc02028da:	81b1                	srli	a1,a1,0xc
ffffffffc02028dc:	953e                	add	a0,a0,a5
ffffffffc02028de:	9702                	jalr	a4
ffffffffc02028e0:	0000a697          	auipc	a3,0xa
ffffffffc02028e4:	72068693          	addi	a3,a3,1824 # ffffffffc020d000 <boot_page_table_sv39>
ffffffffc02028e8:	00017797          	auipc	a5,0x17
ffffffffc02028ec:	c0d7b023          	sd	a3,-1024(a5) # ffffffffc02194e8 <boot_pgdir>
ffffffffc02028f0:	c02007b7          	lui	a5,0xc0200
ffffffffc02028f4:	02f6e963          	bltu	a3,a5,ffffffffc0202926 <pmm_init+0x138>
ffffffffc02028f8:	601c                	ld	a5,0(s0)
ffffffffc02028fa:	60e2                	ld	ra,24(sp)
ffffffffc02028fc:	6442                	ld	s0,16(sp)
ffffffffc02028fe:	8e9d                	sub	a3,a3,a5
ffffffffc0202900:	00017797          	auipc	a5,0x17
ffffffffc0202904:	d2d7bc23          	sd	a3,-712(a5) # ffffffffc0219638 <boot_cr3>
ffffffffc0202908:	64a2                	ld	s1,8(sp)
ffffffffc020290a:	6105                	addi	sp,sp,32
ffffffffc020290c:	8082                	ret
ffffffffc020290e:	00006617          	auipc	a2,0x6
ffffffffc0202912:	31260613          	addi	a2,a2,786 # ffffffffc0208c20 <commands+0xa60>
ffffffffc0202916:	07f00593          	li	a1,127
ffffffffc020291a:	00007517          	auipc	a0,0x7
ffffffffc020291e:	96650513          	addi	a0,a0,-1690 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202922:	8e7fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202926:	00006617          	auipc	a2,0x6
ffffffffc020292a:	2fa60613          	addi	a2,a2,762 # ffffffffc0208c20 <commands+0xa60>
ffffffffc020292e:	0c100593          	li	a1,193
ffffffffc0202932:	00007517          	auipc	a0,0x7
ffffffffc0202936:	94e50513          	addi	a0,a0,-1714 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc020293a:	8cffd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020293e:	d85ff0ef          	jal	ra,ffffffffc02026c2 <pa2page.part.0>

ffffffffc0202942 <get_pte>:
ffffffffc0202942:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0202946:	1ff7f793          	andi	a5,a5,511
ffffffffc020294a:	7139                	addi	sp,sp,-64
ffffffffc020294c:	078e                	slli	a5,a5,0x3
ffffffffc020294e:	f426                	sd	s1,40(sp)
ffffffffc0202950:	00f504b3          	add	s1,a0,a5
ffffffffc0202954:	6094                	ld	a3,0(s1)
ffffffffc0202956:	f04a                	sd	s2,32(sp)
ffffffffc0202958:	ec4e                	sd	s3,24(sp)
ffffffffc020295a:	e852                	sd	s4,16(sp)
ffffffffc020295c:	fc06                	sd	ra,56(sp)
ffffffffc020295e:	f822                	sd	s0,48(sp)
ffffffffc0202960:	e456                	sd	s5,8(sp)
ffffffffc0202962:	e05a                	sd	s6,0(sp)
ffffffffc0202964:	0016f793          	andi	a5,a3,1
ffffffffc0202968:	892e                	mv	s2,a1
ffffffffc020296a:	89b2                	mv	s3,a2
ffffffffc020296c:	00017a17          	auipc	s4,0x17
ffffffffc0202970:	b84a0a13          	addi	s4,s4,-1148 # ffffffffc02194f0 <npage>
ffffffffc0202974:	e7b5                	bnez	a5,ffffffffc02029e0 <get_pte+0x9e>
ffffffffc0202976:	12060b63          	beqz	a2,ffffffffc0202aac <get_pte+0x16a>
ffffffffc020297a:	4505                	li	a0,1
ffffffffc020297c:	d63ff0ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0202980:	842a                	mv	s0,a0
ffffffffc0202982:	12050563          	beqz	a0,ffffffffc0202aac <get_pte+0x16a>
ffffffffc0202986:	00017b17          	auipc	s6,0x17
ffffffffc020298a:	cbab0b13          	addi	s6,s6,-838 # ffffffffc0219640 <pages>
ffffffffc020298e:	000b3503          	ld	a0,0(s6)
ffffffffc0202992:	00080ab7          	lui	s5,0x80
ffffffffc0202996:	00017a17          	auipc	s4,0x17
ffffffffc020299a:	b5aa0a13          	addi	s4,s4,-1190 # ffffffffc02194f0 <npage>
ffffffffc020299e:	40a40533          	sub	a0,s0,a0
ffffffffc02029a2:	8519                	srai	a0,a0,0x6
ffffffffc02029a4:	9556                	add	a0,a0,s5
ffffffffc02029a6:	000a3703          	ld	a4,0(s4)
ffffffffc02029aa:	00c51793          	slli	a5,a0,0xc
ffffffffc02029ae:	4685                	li	a3,1
ffffffffc02029b0:	c014                	sw	a3,0(s0)
ffffffffc02029b2:	83b1                	srli	a5,a5,0xc
ffffffffc02029b4:	0532                	slli	a0,a0,0xc
ffffffffc02029b6:	14e7f263          	bgeu	a5,a4,ffffffffc0202afa <get_pte+0x1b8>
ffffffffc02029ba:	00017797          	auipc	a5,0x17
ffffffffc02029be:	c767b783          	ld	a5,-906(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc02029c2:	6605                	lui	a2,0x1
ffffffffc02029c4:	4581                	li	a1,0
ffffffffc02029c6:	953e                	add	a0,a0,a5
ffffffffc02029c8:	124050ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc02029cc:	000b3683          	ld	a3,0(s6)
ffffffffc02029d0:	40d406b3          	sub	a3,s0,a3
ffffffffc02029d4:	8699                	srai	a3,a3,0x6
ffffffffc02029d6:	96d6                	add	a3,a3,s5
ffffffffc02029d8:	06aa                	slli	a3,a3,0xa
ffffffffc02029da:	0116e693          	ori	a3,a3,17
ffffffffc02029de:	e094                	sd	a3,0(s1)
ffffffffc02029e0:	77fd                	lui	a5,0xfffff
ffffffffc02029e2:	068a                	slli	a3,a3,0x2
ffffffffc02029e4:	000a3703          	ld	a4,0(s4)
ffffffffc02029e8:	8efd                	and	a3,a3,a5
ffffffffc02029ea:	00c6d793          	srli	a5,a3,0xc
ffffffffc02029ee:	0ce7f163          	bgeu	a5,a4,ffffffffc0202ab0 <get_pte+0x16e>
ffffffffc02029f2:	00017a97          	auipc	s5,0x17
ffffffffc02029f6:	c3ea8a93          	addi	s5,s5,-962 # ffffffffc0219630 <va_pa_offset>
ffffffffc02029fa:	000ab403          	ld	s0,0(s5)
ffffffffc02029fe:	01595793          	srli	a5,s2,0x15
ffffffffc0202a02:	1ff7f793          	andi	a5,a5,511
ffffffffc0202a06:	96a2                	add	a3,a3,s0
ffffffffc0202a08:	00379413          	slli	s0,a5,0x3
ffffffffc0202a0c:	9436                	add	s0,s0,a3
ffffffffc0202a0e:	6014                	ld	a3,0(s0)
ffffffffc0202a10:	0016f793          	andi	a5,a3,1
ffffffffc0202a14:	e3ad                	bnez	a5,ffffffffc0202a76 <get_pte+0x134>
ffffffffc0202a16:	08098b63          	beqz	s3,ffffffffc0202aac <get_pte+0x16a>
ffffffffc0202a1a:	4505                	li	a0,1
ffffffffc0202a1c:	cc3ff0ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0202a20:	84aa                	mv	s1,a0
ffffffffc0202a22:	c549                	beqz	a0,ffffffffc0202aac <get_pte+0x16a>
ffffffffc0202a24:	00017b17          	auipc	s6,0x17
ffffffffc0202a28:	c1cb0b13          	addi	s6,s6,-996 # ffffffffc0219640 <pages>
ffffffffc0202a2c:	000b3503          	ld	a0,0(s6)
ffffffffc0202a30:	000809b7          	lui	s3,0x80
ffffffffc0202a34:	000a3703          	ld	a4,0(s4)
ffffffffc0202a38:	40a48533          	sub	a0,s1,a0
ffffffffc0202a3c:	8519                	srai	a0,a0,0x6
ffffffffc0202a3e:	954e                	add	a0,a0,s3
ffffffffc0202a40:	00c51793          	slli	a5,a0,0xc
ffffffffc0202a44:	4685                	li	a3,1
ffffffffc0202a46:	c094                	sw	a3,0(s1)
ffffffffc0202a48:	83b1                	srli	a5,a5,0xc
ffffffffc0202a4a:	0532                	slli	a0,a0,0xc
ffffffffc0202a4c:	08e7fa63          	bgeu	a5,a4,ffffffffc0202ae0 <get_pte+0x19e>
ffffffffc0202a50:	000ab783          	ld	a5,0(s5)
ffffffffc0202a54:	6605                	lui	a2,0x1
ffffffffc0202a56:	4581                	li	a1,0
ffffffffc0202a58:	953e                	add	a0,a0,a5
ffffffffc0202a5a:	092050ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc0202a5e:	000b3683          	ld	a3,0(s6)
ffffffffc0202a62:	40d486b3          	sub	a3,s1,a3
ffffffffc0202a66:	8699                	srai	a3,a3,0x6
ffffffffc0202a68:	96ce                	add	a3,a3,s3
ffffffffc0202a6a:	06aa                	slli	a3,a3,0xa
ffffffffc0202a6c:	0116e693          	ori	a3,a3,17
ffffffffc0202a70:	e014                	sd	a3,0(s0)
ffffffffc0202a72:	000a3703          	ld	a4,0(s4)
ffffffffc0202a76:	068a                	slli	a3,a3,0x2
ffffffffc0202a78:	757d                	lui	a0,0xfffff
ffffffffc0202a7a:	8ee9                	and	a3,a3,a0
ffffffffc0202a7c:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202a80:	04e7f463          	bgeu	a5,a4,ffffffffc0202ac8 <get_pte+0x186>
ffffffffc0202a84:	000ab503          	ld	a0,0(s5)
ffffffffc0202a88:	00c95913          	srli	s2,s2,0xc
ffffffffc0202a8c:	1ff97913          	andi	s2,s2,511
ffffffffc0202a90:	96aa                	add	a3,a3,a0
ffffffffc0202a92:	00391513          	slli	a0,s2,0x3
ffffffffc0202a96:	9536                	add	a0,a0,a3
ffffffffc0202a98:	70e2                	ld	ra,56(sp)
ffffffffc0202a9a:	7442                	ld	s0,48(sp)
ffffffffc0202a9c:	74a2                	ld	s1,40(sp)
ffffffffc0202a9e:	7902                	ld	s2,32(sp)
ffffffffc0202aa0:	69e2                	ld	s3,24(sp)
ffffffffc0202aa2:	6a42                	ld	s4,16(sp)
ffffffffc0202aa4:	6aa2                	ld	s5,8(sp)
ffffffffc0202aa6:	6b02                	ld	s6,0(sp)
ffffffffc0202aa8:	6121                	addi	sp,sp,64
ffffffffc0202aaa:	8082                	ret
ffffffffc0202aac:	4501                	li	a0,0
ffffffffc0202aae:	b7ed                	j	ffffffffc0202a98 <get_pte+0x156>
ffffffffc0202ab0:	00006617          	auipc	a2,0x6
ffffffffc0202ab4:	10060613          	addi	a2,a2,256 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc0202ab8:	0fe00593          	li	a1,254
ffffffffc0202abc:	00006517          	auipc	a0,0x6
ffffffffc0202ac0:	7c450513          	addi	a0,a0,1988 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202ac4:	f44fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ac8:	00006617          	auipc	a2,0x6
ffffffffc0202acc:	0e860613          	addi	a2,a2,232 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc0202ad0:	10900593          	li	a1,265
ffffffffc0202ad4:	00006517          	auipc	a0,0x6
ffffffffc0202ad8:	7ac50513          	addi	a0,a0,1964 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202adc:	f2cfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ae0:	86aa                	mv	a3,a0
ffffffffc0202ae2:	00006617          	auipc	a2,0x6
ffffffffc0202ae6:	0ce60613          	addi	a2,a2,206 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc0202aea:	10600593          	li	a1,262
ffffffffc0202aee:	00006517          	auipc	a0,0x6
ffffffffc0202af2:	79250513          	addi	a0,a0,1938 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202af6:	f12fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202afa:	86aa                	mv	a3,a0
ffffffffc0202afc:	00006617          	auipc	a2,0x6
ffffffffc0202b00:	0b460613          	addi	a2,a2,180 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc0202b04:	0fa00593          	li	a1,250
ffffffffc0202b08:	00006517          	auipc	a0,0x6
ffffffffc0202b0c:	77850513          	addi	a0,a0,1912 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202b10:	ef8fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202b14 <unmap_range>:
ffffffffc0202b14:	711d                	addi	sp,sp,-96
ffffffffc0202b16:	00c5e7b3          	or	a5,a1,a2
ffffffffc0202b1a:	ec86                	sd	ra,88(sp)
ffffffffc0202b1c:	e8a2                	sd	s0,80(sp)
ffffffffc0202b1e:	e4a6                	sd	s1,72(sp)
ffffffffc0202b20:	e0ca                	sd	s2,64(sp)
ffffffffc0202b22:	fc4e                	sd	s3,56(sp)
ffffffffc0202b24:	f852                	sd	s4,48(sp)
ffffffffc0202b26:	f456                	sd	s5,40(sp)
ffffffffc0202b28:	f05a                	sd	s6,32(sp)
ffffffffc0202b2a:	ec5e                	sd	s7,24(sp)
ffffffffc0202b2c:	e862                	sd	s8,16(sp)
ffffffffc0202b2e:	e466                	sd	s9,8(sp)
ffffffffc0202b30:	17d2                	slli	a5,a5,0x34
ffffffffc0202b32:	ebf1                	bnez	a5,ffffffffc0202c06 <unmap_range+0xf2>
ffffffffc0202b34:	002007b7          	lui	a5,0x200
ffffffffc0202b38:	842e                	mv	s0,a1
ffffffffc0202b3a:	0af5e663          	bltu	a1,a5,ffffffffc0202be6 <unmap_range+0xd2>
ffffffffc0202b3e:	8932                	mv	s2,a2
ffffffffc0202b40:	0ac5f363          	bgeu	a1,a2,ffffffffc0202be6 <unmap_range+0xd2>
ffffffffc0202b44:	4785                	li	a5,1
ffffffffc0202b46:	07fe                	slli	a5,a5,0x1f
ffffffffc0202b48:	08c7ef63          	bltu	a5,a2,ffffffffc0202be6 <unmap_range+0xd2>
ffffffffc0202b4c:	89aa                	mv	s3,a0
ffffffffc0202b4e:	6a05                	lui	s4,0x1
ffffffffc0202b50:	00017c97          	auipc	s9,0x17
ffffffffc0202b54:	9a0c8c93          	addi	s9,s9,-1632 # ffffffffc02194f0 <npage>
ffffffffc0202b58:	00017c17          	auipc	s8,0x17
ffffffffc0202b5c:	ae8c0c13          	addi	s8,s8,-1304 # ffffffffc0219640 <pages>
ffffffffc0202b60:	fff80bb7          	lui	s7,0xfff80
ffffffffc0202b64:	00200b37          	lui	s6,0x200
ffffffffc0202b68:	ffe00ab7          	lui	s5,0xffe00
ffffffffc0202b6c:	4601                	li	a2,0
ffffffffc0202b6e:	85a2                	mv	a1,s0
ffffffffc0202b70:	854e                	mv	a0,s3
ffffffffc0202b72:	dd1ff0ef          	jal	ra,ffffffffc0202942 <get_pte>
ffffffffc0202b76:	84aa                	mv	s1,a0
ffffffffc0202b78:	cd21                	beqz	a0,ffffffffc0202bd0 <unmap_range+0xbc>
ffffffffc0202b7a:	611c                	ld	a5,0(a0)
ffffffffc0202b7c:	e38d                	bnez	a5,ffffffffc0202b9e <unmap_range+0x8a>
ffffffffc0202b7e:	9452                	add	s0,s0,s4
ffffffffc0202b80:	ff2466e3          	bltu	s0,s2,ffffffffc0202b6c <unmap_range+0x58>
ffffffffc0202b84:	60e6                	ld	ra,88(sp)
ffffffffc0202b86:	6446                	ld	s0,80(sp)
ffffffffc0202b88:	64a6                	ld	s1,72(sp)
ffffffffc0202b8a:	6906                	ld	s2,64(sp)
ffffffffc0202b8c:	79e2                	ld	s3,56(sp)
ffffffffc0202b8e:	7a42                	ld	s4,48(sp)
ffffffffc0202b90:	7aa2                	ld	s5,40(sp)
ffffffffc0202b92:	7b02                	ld	s6,32(sp)
ffffffffc0202b94:	6be2                	ld	s7,24(sp)
ffffffffc0202b96:	6c42                	ld	s8,16(sp)
ffffffffc0202b98:	6ca2                	ld	s9,8(sp)
ffffffffc0202b9a:	6125                	addi	sp,sp,96
ffffffffc0202b9c:	8082                	ret
ffffffffc0202b9e:	0017f713          	andi	a4,a5,1
ffffffffc0202ba2:	df71                	beqz	a4,ffffffffc0202b7e <unmap_range+0x6a>
ffffffffc0202ba4:	000cb703          	ld	a4,0(s9)
ffffffffc0202ba8:	078a                	slli	a5,a5,0x2
ffffffffc0202baa:	83b1                	srli	a5,a5,0xc
ffffffffc0202bac:	06e7fd63          	bgeu	a5,a4,ffffffffc0202c26 <unmap_range+0x112>
ffffffffc0202bb0:	000c3503          	ld	a0,0(s8)
ffffffffc0202bb4:	97de                	add	a5,a5,s7
ffffffffc0202bb6:	079a                	slli	a5,a5,0x6
ffffffffc0202bb8:	953e                	add	a0,a0,a5
ffffffffc0202bba:	411c                	lw	a5,0(a0)
ffffffffc0202bbc:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202bc0:	c118                	sw	a4,0(a0)
ffffffffc0202bc2:	cf11                	beqz	a4,ffffffffc0202bde <unmap_range+0xca>
ffffffffc0202bc4:	0004b023          	sd	zero,0(s1)
ffffffffc0202bc8:	12040073          	sfence.vma	s0
ffffffffc0202bcc:	9452                	add	s0,s0,s4
ffffffffc0202bce:	bf4d                	j	ffffffffc0202b80 <unmap_range+0x6c>
ffffffffc0202bd0:	945a                	add	s0,s0,s6
ffffffffc0202bd2:	01547433          	and	s0,s0,s5
ffffffffc0202bd6:	d45d                	beqz	s0,ffffffffc0202b84 <unmap_range+0x70>
ffffffffc0202bd8:	f9246ae3          	bltu	s0,s2,ffffffffc0202b6c <unmap_range+0x58>
ffffffffc0202bdc:	b765                	j	ffffffffc0202b84 <unmap_range+0x70>
ffffffffc0202bde:	4585                	li	a1,1
ffffffffc0202be0:	b91ff0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0202be4:	b7c5                	j	ffffffffc0202bc4 <unmap_range+0xb0>
ffffffffc0202be6:	00006697          	auipc	a3,0x6
ffffffffc0202bea:	6da68693          	addi	a3,a3,1754 # ffffffffc02092c0 <default_pmm_manager+0xd0>
ffffffffc0202bee:	00006617          	auipc	a2,0x6
ffffffffc0202bf2:	9e260613          	addi	a2,a2,-1566 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202bf6:	14100593          	li	a1,321
ffffffffc0202bfa:	00006517          	auipc	a0,0x6
ffffffffc0202bfe:	68650513          	addi	a0,a0,1670 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202c02:	e06fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c06:	00006697          	auipc	a3,0x6
ffffffffc0202c0a:	68a68693          	addi	a3,a3,1674 # ffffffffc0209290 <default_pmm_manager+0xa0>
ffffffffc0202c0e:	00006617          	auipc	a2,0x6
ffffffffc0202c12:	9c260613          	addi	a2,a2,-1598 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202c16:	14000593          	li	a1,320
ffffffffc0202c1a:	00006517          	auipc	a0,0x6
ffffffffc0202c1e:	66650513          	addi	a0,a0,1638 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202c22:	de6fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c26:	a9dff0ef          	jal	ra,ffffffffc02026c2 <pa2page.part.0>

ffffffffc0202c2a <exit_range>:
ffffffffc0202c2a:	715d                	addi	sp,sp,-80
ffffffffc0202c2c:	00c5e7b3          	or	a5,a1,a2
ffffffffc0202c30:	e486                	sd	ra,72(sp)
ffffffffc0202c32:	e0a2                	sd	s0,64(sp)
ffffffffc0202c34:	fc26                	sd	s1,56(sp)
ffffffffc0202c36:	f84a                	sd	s2,48(sp)
ffffffffc0202c38:	f44e                	sd	s3,40(sp)
ffffffffc0202c3a:	f052                	sd	s4,32(sp)
ffffffffc0202c3c:	ec56                	sd	s5,24(sp)
ffffffffc0202c3e:	e85a                	sd	s6,16(sp)
ffffffffc0202c40:	e45e                	sd	s7,8(sp)
ffffffffc0202c42:	17d2                	slli	a5,a5,0x34
ffffffffc0202c44:	e3f1                	bnez	a5,ffffffffc0202d08 <exit_range+0xde>
ffffffffc0202c46:	002007b7          	lui	a5,0x200
ffffffffc0202c4a:	08f5ef63          	bltu	a1,a5,ffffffffc0202ce8 <exit_range+0xbe>
ffffffffc0202c4e:	89b2                	mv	s3,a2
ffffffffc0202c50:	08c5fc63          	bgeu	a1,a2,ffffffffc0202ce8 <exit_range+0xbe>
ffffffffc0202c54:	4785                	li	a5,1
ffffffffc0202c56:	ffe004b7          	lui	s1,0xffe00
ffffffffc0202c5a:	07fe                	slli	a5,a5,0x1f
ffffffffc0202c5c:	8ced                	and	s1,s1,a1
ffffffffc0202c5e:	08c7e563          	bltu	a5,a2,ffffffffc0202ce8 <exit_range+0xbe>
ffffffffc0202c62:	8a2a                	mv	s4,a0
ffffffffc0202c64:	00017b17          	auipc	s6,0x17
ffffffffc0202c68:	88cb0b13          	addi	s6,s6,-1908 # ffffffffc02194f0 <npage>
ffffffffc0202c6c:	00017b97          	auipc	s7,0x17
ffffffffc0202c70:	9d4b8b93          	addi	s7,s7,-1580 # ffffffffc0219640 <pages>
ffffffffc0202c74:	fff80937          	lui	s2,0xfff80
ffffffffc0202c78:	00200ab7          	lui	s5,0x200
ffffffffc0202c7c:	a019                	j	ffffffffc0202c82 <exit_range+0x58>
ffffffffc0202c7e:	0334fe63          	bgeu	s1,s3,ffffffffc0202cba <exit_range+0x90>
ffffffffc0202c82:	01e4d413          	srli	s0,s1,0x1e
ffffffffc0202c86:	1ff47413          	andi	s0,s0,511
ffffffffc0202c8a:	040e                	slli	s0,s0,0x3
ffffffffc0202c8c:	9452                	add	s0,s0,s4
ffffffffc0202c8e:	601c                	ld	a5,0(s0)
ffffffffc0202c90:	0017f713          	andi	a4,a5,1
ffffffffc0202c94:	c30d                	beqz	a4,ffffffffc0202cb6 <exit_range+0x8c>
ffffffffc0202c96:	000b3703          	ld	a4,0(s6)
ffffffffc0202c9a:	078a                	slli	a5,a5,0x2
ffffffffc0202c9c:	83b1                	srli	a5,a5,0xc
ffffffffc0202c9e:	02e7f963          	bgeu	a5,a4,ffffffffc0202cd0 <exit_range+0xa6>
ffffffffc0202ca2:	000bb503          	ld	a0,0(s7)
ffffffffc0202ca6:	97ca                	add	a5,a5,s2
ffffffffc0202ca8:	079a                	slli	a5,a5,0x6
ffffffffc0202caa:	4585                	li	a1,1
ffffffffc0202cac:	953e                	add	a0,a0,a5
ffffffffc0202cae:	ac3ff0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0202cb2:	00043023          	sd	zero,0(s0)
ffffffffc0202cb6:	94d6                	add	s1,s1,s5
ffffffffc0202cb8:	f0f9                	bnez	s1,ffffffffc0202c7e <exit_range+0x54>
ffffffffc0202cba:	60a6                	ld	ra,72(sp)
ffffffffc0202cbc:	6406                	ld	s0,64(sp)
ffffffffc0202cbe:	74e2                	ld	s1,56(sp)
ffffffffc0202cc0:	7942                	ld	s2,48(sp)
ffffffffc0202cc2:	79a2                	ld	s3,40(sp)
ffffffffc0202cc4:	7a02                	ld	s4,32(sp)
ffffffffc0202cc6:	6ae2                	ld	s5,24(sp)
ffffffffc0202cc8:	6b42                	ld	s6,16(sp)
ffffffffc0202cca:	6ba2                	ld	s7,8(sp)
ffffffffc0202ccc:	6161                	addi	sp,sp,80
ffffffffc0202cce:	8082                	ret
ffffffffc0202cd0:	00006617          	auipc	a2,0x6
ffffffffc0202cd4:	f7860613          	addi	a2,a2,-136 # ffffffffc0208c48 <commands+0xa88>
ffffffffc0202cd8:	06200593          	li	a1,98
ffffffffc0202cdc:	00006517          	auipc	a0,0x6
ffffffffc0202ce0:	efc50513          	addi	a0,a0,-260 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0202ce4:	d24fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ce8:	00006697          	auipc	a3,0x6
ffffffffc0202cec:	5d868693          	addi	a3,a3,1496 # ffffffffc02092c0 <default_pmm_manager+0xd0>
ffffffffc0202cf0:	00006617          	auipc	a2,0x6
ffffffffc0202cf4:	8e060613          	addi	a2,a2,-1824 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202cf8:	15200593          	li	a1,338
ffffffffc0202cfc:	00006517          	auipc	a0,0x6
ffffffffc0202d00:	58450513          	addi	a0,a0,1412 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202d04:	d04fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d08:	00006697          	auipc	a3,0x6
ffffffffc0202d0c:	58868693          	addi	a3,a3,1416 # ffffffffc0209290 <default_pmm_manager+0xa0>
ffffffffc0202d10:	00006617          	auipc	a2,0x6
ffffffffc0202d14:	8c060613          	addi	a2,a2,-1856 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202d18:	15100593          	li	a1,337
ffffffffc0202d1c:	00006517          	auipc	a0,0x6
ffffffffc0202d20:	56450513          	addi	a0,a0,1380 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202d24:	ce4fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202d28 <page_insert>:
ffffffffc0202d28:	7179                	addi	sp,sp,-48
ffffffffc0202d2a:	e44e                	sd	s3,8(sp)
ffffffffc0202d2c:	89b2                	mv	s3,a2
ffffffffc0202d2e:	f022                	sd	s0,32(sp)
ffffffffc0202d30:	4605                	li	a2,1
ffffffffc0202d32:	842e                	mv	s0,a1
ffffffffc0202d34:	85ce                	mv	a1,s3
ffffffffc0202d36:	ec26                	sd	s1,24(sp)
ffffffffc0202d38:	f406                	sd	ra,40(sp)
ffffffffc0202d3a:	e84a                	sd	s2,16(sp)
ffffffffc0202d3c:	e052                	sd	s4,0(sp)
ffffffffc0202d3e:	84b6                	mv	s1,a3
ffffffffc0202d40:	c03ff0ef          	jal	ra,ffffffffc0202942 <get_pte>
ffffffffc0202d44:	cd41                	beqz	a0,ffffffffc0202ddc <page_insert+0xb4>
ffffffffc0202d46:	4014                	lw	a3,0(s0)
ffffffffc0202d48:	611c                	ld	a5,0(a0)
ffffffffc0202d4a:	892a                	mv	s2,a0
ffffffffc0202d4c:	0016871b          	addiw	a4,a3,1
ffffffffc0202d50:	c018                	sw	a4,0(s0)
ffffffffc0202d52:	0017f713          	andi	a4,a5,1
ffffffffc0202d56:	eb1d                	bnez	a4,ffffffffc0202d8c <page_insert+0x64>
ffffffffc0202d58:	00017717          	auipc	a4,0x17
ffffffffc0202d5c:	8e873703          	ld	a4,-1816(a4) # ffffffffc0219640 <pages>
ffffffffc0202d60:	8c19                	sub	s0,s0,a4
ffffffffc0202d62:	000807b7          	lui	a5,0x80
ffffffffc0202d66:	8419                	srai	s0,s0,0x6
ffffffffc0202d68:	943e                	add	s0,s0,a5
ffffffffc0202d6a:	042a                	slli	s0,s0,0xa
ffffffffc0202d6c:	8c45                	or	s0,s0,s1
ffffffffc0202d6e:	00146413          	ori	s0,s0,1
ffffffffc0202d72:	00893023          	sd	s0,0(s2) # fffffffffff80000 <end+0x3fd668b8>
ffffffffc0202d76:	12098073          	sfence.vma	s3
ffffffffc0202d7a:	4501                	li	a0,0
ffffffffc0202d7c:	70a2                	ld	ra,40(sp)
ffffffffc0202d7e:	7402                	ld	s0,32(sp)
ffffffffc0202d80:	64e2                	ld	s1,24(sp)
ffffffffc0202d82:	6942                	ld	s2,16(sp)
ffffffffc0202d84:	69a2                	ld	s3,8(sp)
ffffffffc0202d86:	6a02                	ld	s4,0(sp)
ffffffffc0202d88:	6145                	addi	sp,sp,48
ffffffffc0202d8a:	8082                	ret
ffffffffc0202d8c:	078a                	slli	a5,a5,0x2
ffffffffc0202d8e:	83b1                	srli	a5,a5,0xc
ffffffffc0202d90:	00016717          	auipc	a4,0x16
ffffffffc0202d94:	76073703          	ld	a4,1888(a4) # ffffffffc02194f0 <npage>
ffffffffc0202d98:	04e7f463          	bgeu	a5,a4,ffffffffc0202de0 <page_insert+0xb8>
ffffffffc0202d9c:	00017a17          	auipc	s4,0x17
ffffffffc0202da0:	8a4a0a13          	addi	s4,s4,-1884 # ffffffffc0219640 <pages>
ffffffffc0202da4:	000a3703          	ld	a4,0(s4)
ffffffffc0202da8:	fff80537          	lui	a0,0xfff80
ffffffffc0202dac:	97aa                	add	a5,a5,a0
ffffffffc0202dae:	079a                	slli	a5,a5,0x6
ffffffffc0202db0:	97ba                	add	a5,a5,a4
ffffffffc0202db2:	00f40a63          	beq	s0,a5,ffffffffc0202dc6 <page_insert+0x9e>
ffffffffc0202db6:	4394                	lw	a3,0(a5)
ffffffffc0202db8:	fff6861b          	addiw	a2,a3,-1
ffffffffc0202dbc:	c390                	sw	a2,0(a5)
ffffffffc0202dbe:	c611                	beqz	a2,ffffffffc0202dca <page_insert+0xa2>
ffffffffc0202dc0:	12098073          	sfence.vma	s3
ffffffffc0202dc4:	bf71                	j	ffffffffc0202d60 <page_insert+0x38>
ffffffffc0202dc6:	c014                	sw	a3,0(s0)
ffffffffc0202dc8:	bf61                	j	ffffffffc0202d60 <page_insert+0x38>
ffffffffc0202dca:	4585                	li	a1,1
ffffffffc0202dcc:	853e                	mv	a0,a5
ffffffffc0202dce:	9a3ff0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0202dd2:	000a3703          	ld	a4,0(s4)
ffffffffc0202dd6:	12098073          	sfence.vma	s3
ffffffffc0202dda:	b759                	j	ffffffffc0202d60 <page_insert+0x38>
ffffffffc0202ddc:	5571                	li	a0,-4
ffffffffc0202dde:	bf79                	j	ffffffffc0202d7c <page_insert+0x54>
ffffffffc0202de0:	8e3ff0ef          	jal	ra,ffffffffc02026c2 <pa2page.part.0>

ffffffffc0202de4 <copy_range>:
ffffffffc0202de4:	7159                	addi	sp,sp,-112
ffffffffc0202de6:	00d667b3          	or	a5,a2,a3
ffffffffc0202dea:	f486                	sd	ra,104(sp)
ffffffffc0202dec:	f0a2                	sd	s0,96(sp)
ffffffffc0202dee:	eca6                	sd	s1,88(sp)
ffffffffc0202df0:	e8ca                	sd	s2,80(sp)
ffffffffc0202df2:	e4ce                	sd	s3,72(sp)
ffffffffc0202df4:	e0d2                	sd	s4,64(sp)
ffffffffc0202df6:	fc56                	sd	s5,56(sp)
ffffffffc0202df8:	f85a                	sd	s6,48(sp)
ffffffffc0202dfa:	f45e                	sd	s7,40(sp)
ffffffffc0202dfc:	f062                	sd	s8,32(sp)
ffffffffc0202dfe:	ec66                	sd	s9,24(sp)
ffffffffc0202e00:	e86a                	sd	s10,16(sp)
ffffffffc0202e02:	e46e                	sd	s11,8(sp)
ffffffffc0202e04:	17d2                	slli	a5,a5,0x34
ffffffffc0202e06:	1e079763          	bnez	a5,ffffffffc0202ff4 <copy_range+0x210>
ffffffffc0202e0a:	002007b7          	lui	a5,0x200
ffffffffc0202e0e:	8432                	mv	s0,a2
ffffffffc0202e10:	16f66a63          	bltu	a2,a5,ffffffffc0202f84 <copy_range+0x1a0>
ffffffffc0202e14:	8936                	mv	s2,a3
ffffffffc0202e16:	16d67763          	bgeu	a2,a3,ffffffffc0202f84 <copy_range+0x1a0>
ffffffffc0202e1a:	4785                	li	a5,1
ffffffffc0202e1c:	07fe                	slli	a5,a5,0x1f
ffffffffc0202e1e:	16d7e363          	bltu	a5,a3,ffffffffc0202f84 <copy_range+0x1a0>
ffffffffc0202e22:	5b7d                	li	s6,-1
ffffffffc0202e24:	8aaa                	mv	s5,a0
ffffffffc0202e26:	89ae                	mv	s3,a1
ffffffffc0202e28:	6a05                	lui	s4,0x1
ffffffffc0202e2a:	00016c97          	auipc	s9,0x16
ffffffffc0202e2e:	6c6c8c93          	addi	s9,s9,1734 # ffffffffc02194f0 <npage>
ffffffffc0202e32:	00017c17          	auipc	s8,0x17
ffffffffc0202e36:	80ec0c13          	addi	s8,s8,-2034 # ffffffffc0219640 <pages>
ffffffffc0202e3a:	00080bb7          	lui	s7,0x80
ffffffffc0202e3e:	00cb5b13          	srli	s6,s6,0xc
ffffffffc0202e42:	4601                	li	a2,0
ffffffffc0202e44:	85a2                	mv	a1,s0
ffffffffc0202e46:	854e                	mv	a0,s3
ffffffffc0202e48:	afbff0ef          	jal	ra,ffffffffc0202942 <get_pte>
ffffffffc0202e4c:	84aa                	mv	s1,a0
ffffffffc0202e4e:	c175                	beqz	a0,ffffffffc0202f32 <copy_range+0x14e>
ffffffffc0202e50:	611c                	ld	a5,0(a0)
ffffffffc0202e52:	8b85                	andi	a5,a5,1
ffffffffc0202e54:	e785                	bnez	a5,ffffffffc0202e7c <copy_range+0x98>
ffffffffc0202e56:	9452                	add	s0,s0,s4
ffffffffc0202e58:	ff2465e3          	bltu	s0,s2,ffffffffc0202e42 <copy_range+0x5e>
ffffffffc0202e5c:	4501                	li	a0,0
ffffffffc0202e5e:	70a6                	ld	ra,104(sp)
ffffffffc0202e60:	7406                	ld	s0,96(sp)
ffffffffc0202e62:	64e6                	ld	s1,88(sp)
ffffffffc0202e64:	6946                	ld	s2,80(sp)
ffffffffc0202e66:	69a6                	ld	s3,72(sp)
ffffffffc0202e68:	6a06                	ld	s4,64(sp)
ffffffffc0202e6a:	7ae2                	ld	s5,56(sp)
ffffffffc0202e6c:	7b42                	ld	s6,48(sp)
ffffffffc0202e6e:	7ba2                	ld	s7,40(sp)
ffffffffc0202e70:	7c02                	ld	s8,32(sp)
ffffffffc0202e72:	6ce2                	ld	s9,24(sp)
ffffffffc0202e74:	6d42                	ld	s10,16(sp)
ffffffffc0202e76:	6da2                	ld	s11,8(sp)
ffffffffc0202e78:	6165                	addi	sp,sp,112
ffffffffc0202e7a:	8082                	ret
ffffffffc0202e7c:	4605                	li	a2,1
ffffffffc0202e7e:	85a2                	mv	a1,s0
ffffffffc0202e80:	8556                	mv	a0,s5
ffffffffc0202e82:	ac1ff0ef          	jal	ra,ffffffffc0202942 <get_pte>
ffffffffc0202e86:	c161                	beqz	a0,ffffffffc0202f46 <copy_range+0x162>
ffffffffc0202e88:	609c                	ld	a5,0(s1)
ffffffffc0202e8a:	0017f713          	andi	a4,a5,1
ffffffffc0202e8e:	01f7f493          	andi	s1,a5,31
ffffffffc0202e92:	14070563          	beqz	a4,ffffffffc0202fdc <copy_range+0x1f8>
ffffffffc0202e96:	000cb683          	ld	a3,0(s9)
ffffffffc0202e9a:	078a                	slli	a5,a5,0x2
ffffffffc0202e9c:	00c7d713          	srli	a4,a5,0xc
ffffffffc0202ea0:	12d77263          	bgeu	a4,a3,ffffffffc0202fc4 <copy_range+0x1e0>
ffffffffc0202ea4:	000c3783          	ld	a5,0(s8)
ffffffffc0202ea8:	fff806b7          	lui	a3,0xfff80
ffffffffc0202eac:	9736                	add	a4,a4,a3
ffffffffc0202eae:	071a                	slli	a4,a4,0x6
ffffffffc0202eb0:	4505                	li	a0,1
ffffffffc0202eb2:	00e78db3          	add	s11,a5,a4
ffffffffc0202eb6:	829ff0ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0202eba:	8d2a                	mv	s10,a0
ffffffffc0202ebc:	0a0d8463          	beqz	s11,ffffffffc0202f64 <copy_range+0x180>
ffffffffc0202ec0:	c175                	beqz	a0,ffffffffc0202fa4 <copy_range+0x1c0>
ffffffffc0202ec2:	000c3703          	ld	a4,0(s8)
ffffffffc0202ec6:	000cb603          	ld	a2,0(s9)
ffffffffc0202eca:	40ed86b3          	sub	a3,s11,a4
ffffffffc0202ece:	8699                	srai	a3,a3,0x6
ffffffffc0202ed0:	96de                	add	a3,a3,s7
ffffffffc0202ed2:	0166f7b3          	and	a5,a3,s6
ffffffffc0202ed6:	06b2                	slli	a3,a3,0xc
ffffffffc0202ed8:	06c7fa63          	bgeu	a5,a2,ffffffffc0202f4c <copy_range+0x168>
ffffffffc0202edc:	40e507b3          	sub	a5,a0,a4
ffffffffc0202ee0:	00016717          	auipc	a4,0x16
ffffffffc0202ee4:	75070713          	addi	a4,a4,1872 # ffffffffc0219630 <va_pa_offset>
ffffffffc0202ee8:	6308                	ld	a0,0(a4)
ffffffffc0202eea:	8799                	srai	a5,a5,0x6
ffffffffc0202eec:	97de                	add	a5,a5,s7
ffffffffc0202eee:	0167f733          	and	a4,a5,s6
ffffffffc0202ef2:	00a685b3          	add	a1,a3,a0
ffffffffc0202ef6:	07b2                	slli	a5,a5,0xc
ffffffffc0202ef8:	04c77963          	bgeu	a4,a2,ffffffffc0202f4a <copy_range+0x166>
ffffffffc0202efc:	6605                	lui	a2,0x1
ffffffffc0202efe:	953e                	add	a0,a0,a5
ffffffffc0202f00:	3ff040ef          	jal	ra,ffffffffc0207afe <memcpy>
ffffffffc0202f04:	86a6                	mv	a3,s1
ffffffffc0202f06:	8622                	mv	a2,s0
ffffffffc0202f08:	85ea                	mv	a1,s10
ffffffffc0202f0a:	8556                	mv	a0,s5
ffffffffc0202f0c:	e1dff0ef          	jal	ra,ffffffffc0202d28 <page_insert>
ffffffffc0202f10:	d139                	beqz	a0,ffffffffc0202e56 <copy_range+0x72>
ffffffffc0202f12:	00006697          	auipc	a3,0x6
ffffffffc0202f16:	40e68693          	addi	a3,a3,1038 # ffffffffc0209320 <default_pmm_manager+0x130>
ffffffffc0202f1a:	00005617          	auipc	a2,0x5
ffffffffc0202f1e:	6b660613          	addi	a2,a2,1718 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202f22:	19900593          	li	a1,409
ffffffffc0202f26:	00006517          	auipc	a0,0x6
ffffffffc0202f2a:	35a50513          	addi	a0,a0,858 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202f2e:	adafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202f32:	00200637          	lui	a2,0x200
ffffffffc0202f36:	9432                	add	s0,s0,a2
ffffffffc0202f38:	ffe00637          	lui	a2,0xffe00
ffffffffc0202f3c:	8c71                	and	s0,s0,a2
ffffffffc0202f3e:	dc19                	beqz	s0,ffffffffc0202e5c <copy_range+0x78>
ffffffffc0202f40:	f12461e3          	bltu	s0,s2,ffffffffc0202e42 <copy_range+0x5e>
ffffffffc0202f44:	bf21                	j	ffffffffc0202e5c <copy_range+0x78>
ffffffffc0202f46:	5571                	li	a0,-4
ffffffffc0202f48:	bf19                	j	ffffffffc0202e5e <copy_range+0x7a>
ffffffffc0202f4a:	86be                	mv	a3,a5
ffffffffc0202f4c:	00006617          	auipc	a2,0x6
ffffffffc0202f50:	c6460613          	addi	a2,a2,-924 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc0202f54:	06900593          	li	a1,105
ffffffffc0202f58:	00006517          	auipc	a0,0x6
ffffffffc0202f5c:	c8050513          	addi	a0,a0,-896 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0202f60:	aa8fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202f64:	00006697          	auipc	a3,0x6
ffffffffc0202f68:	39c68693          	addi	a3,a3,924 # ffffffffc0209300 <default_pmm_manager+0x110>
ffffffffc0202f6c:	00005617          	auipc	a2,0x5
ffffffffc0202f70:	66460613          	addi	a2,a2,1636 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202f74:	17e00593          	li	a1,382
ffffffffc0202f78:	00006517          	auipc	a0,0x6
ffffffffc0202f7c:	30850513          	addi	a0,a0,776 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202f80:	a88fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202f84:	00006697          	auipc	a3,0x6
ffffffffc0202f88:	33c68693          	addi	a3,a3,828 # ffffffffc02092c0 <default_pmm_manager+0xd0>
ffffffffc0202f8c:	00005617          	auipc	a2,0x5
ffffffffc0202f90:	64460613          	addi	a2,a2,1604 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202f94:	16a00593          	li	a1,362
ffffffffc0202f98:	00006517          	auipc	a0,0x6
ffffffffc0202f9c:	2e850513          	addi	a0,a0,744 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202fa0:	a68fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202fa4:	00006697          	auipc	a3,0x6
ffffffffc0202fa8:	36c68693          	addi	a3,a3,876 # ffffffffc0209310 <default_pmm_manager+0x120>
ffffffffc0202fac:	00005617          	auipc	a2,0x5
ffffffffc0202fb0:	62460613          	addi	a2,a2,1572 # ffffffffc02085d0 <commands+0x410>
ffffffffc0202fb4:	17f00593          	li	a1,383
ffffffffc0202fb8:	00006517          	auipc	a0,0x6
ffffffffc0202fbc:	2c850513          	addi	a0,a0,712 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0202fc0:	a48fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202fc4:	00006617          	auipc	a2,0x6
ffffffffc0202fc8:	c8460613          	addi	a2,a2,-892 # ffffffffc0208c48 <commands+0xa88>
ffffffffc0202fcc:	06200593          	li	a1,98
ffffffffc0202fd0:	00006517          	auipc	a0,0x6
ffffffffc0202fd4:	c0850513          	addi	a0,a0,-1016 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0202fd8:	a30fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202fdc:	00006617          	auipc	a2,0x6
ffffffffc0202fe0:	2fc60613          	addi	a2,a2,764 # ffffffffc02092d8 <default_pmm_manager+0xe8>
ffffffffc0202fe4:	07400593          	li	a1,116
ffffffffc0202fe8:	00006517          	auipc	a0,0x6
ffffffffc0202fec:	bf050513          	addi	a0,a0,-1040 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0202ff0:	a18fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ff4:	00006697          	auipc	a3,0x6
ffffffffc0202ff8:	29c68693          	addi	a3,a3,668 # ffffffffc0209290 <default_pmm_manager+0xa0>
ffffffffc0202ffc:	00005617          	auipc	a2,0x5
ffffffffc0203000:	5d460613          	addi	a2,a2,1492 # ffffffffc02085d0 <commands+0x410>
ffffffffc0203004:	16900593          	li	a1,361
ffffffffc0203008:	00006517          	auipc	a0,0x6
ffffffffc020300c:	27850513          	addi	a0,a0,632 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc0203010:	9f8fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203014 <tlb_invalidate>:
ffffffffc0203014:	12058073          	sfence.vma	a1
ffffffffc0203018:	8082                	ret

ffffffffc020301a <pgdir_alloc_page>:
ffffffffc020301a:	7179                	addi	sp,sp,-48
ffffffffc020301c:	e84a                	sd	s2,16(sp)
ffffffffc020301e:	892a                	mv	s2,a0
ffffffffc0203020:	4505                	li	a0,1
ffffffffc0203022:	f022                	sd	s0,32(sp)
ffffffffc0203024:	ec26                	sd	s1,24(sp)
ffffffffc0203026:	e44e                	sd	s3,8(sp)
ffffffffc0203028:	f406                	sd	ra,40(sp)
ffffffffc020302a:	84ae                	mv	s1,a1
ffffffffc020302c:	89b2                	mv	s3,a2
ffffffffc020302e:	eb0ff0ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0203032:	842a                	mv	s0,a0
ffffffffc0203034:	cd05                	beqz	a0,ffffffffc020306c <pgdir_alloc_page+0x52>
ffffffffc0203036:	85aa                	mv	a1,a0
ffffffffc0203038:	86ce                	mv	a3,s3
ffffffffc020303a:	8626                	mv	a2,s1
ffffffffc020303c:	854a                	mv	a0,s2
ffffffffc020303e:	cebff0ef          	jal	ra,ffffffffc0202d28 <page_insert>
ffffffffc0203042:	ed0d                	bnez	a0,ffffffffc020307c <pgdir_alloc_page+0x62>
ffffffffc0203044:	00016797          	auipc	a5,0x16
ffffffffc0203048:	4947a783          	lw	a5,1172(a5) # ffffffffc02194d8 <swap_init_ok>
ffffffffc020304c:	c385                	beqz	a5,ffffffffc020306c <pgdir_alloc_page+0x52>
ffffffffc020304e:	00016517          	auipc	a0,0x16
ffffffffc0203052:	4e253503          	ld	a0,1250(a0) # ffffffffc0219530 <check_mm_struct>
ffffffffc0203056:	c919                	beqz	a0,ffffffffc020306c <pgdir_alloc_page+0x52>
ffffffffc0203058:	4681                	li	a3,0
ffffffffc020305a:	8622                	mv	a2,s0
ffffffffc020305c:	85a6                	mv	a1,s1
ffffffffc020305e:	a90fe0ef          	jal	ra,ffffffffc02012ee <swap_map_swappable>
ffffffffc0203062:	4018                	lw	a4,0(s0)
ffffffffc0203064:	fc04                	sd	s1,56(s0)
ffffffffc0203066:	4785                	li	a5,1
ffffffffc0203068:	02f71063          	bne	a4,a5,ffffffffc0203088 <pgdir_alloc_page+0x6e>
ffffffffc020306c:	70a2                	ld	ra,40(sp)
ffffffffc020306e:	8522                	mv	a0,s0
ffffffffc0203070:	7402                	ld	s0,32(sp)
ffffffffc0203072:	64e2                	ld	s1,24(sp)
ffffffffc0203074:	6942                	ld	s2,16(sp)
ffffffffc0203076:	69a2                	ld	s3,8(sp)
ffffffffc0203078:	6145                	addi	sp,sp,48
ffffffffc020307a:	8082                	ret
ffffffffc020307c:	8522                	mv	a0,s0
ffffffffc020307e:	4585                	li	a1,1
ffffffffc0203080:	ef0ff0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203084:	4401                	li	s0,0
ffffffffc0203086:	b7dd                	j	ffffffffc020306c <pgdir_alloc_page+0x52>
ffffffffc0203088:	00006697          	auipc	a3,0x6
ffffffffc020308c:	2a868693          	addi	a3,a3,680 # ffffffffc0209330 <default_pmm_manager+0x140>
ffffffffc0203090:	00005617          	auipc	a2,0x5
ffffffffc0203094:	54060613          	addi	a2,a2,1344 # ffffffffc02085d0 <commands+0x410>
ffffffffc0203098:	1d800593          	li	a1,472
ffffffffc020309c:	00006517          	auipc	a0,0x6
ffffffffc02030a0:	1e450513          	addi	a0,a0,484 # ffffffffc0209280 <default_pmm_manager+0x90>
ffffffffc02030a4:	964fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02030a8 <phi_test_sema>:
ffffffffc02030a8:	00016697          	auipc	a3,0x16
ffffffffc02030ac:	5d868693          	addi	a3,a3,1496 # ffffffffc0219680 <state_sema>
ffffffffc02030b0:	00251793          	slli	a5,a0,0x2
ffffffffc02030b4:	97b6                	add	a5,a5,a3
ffffffffc02030b6:	4390                	lw	a2,0(a5)
ffffffffc02030b8:	4705                	li	a4,1
ffffffffc02030ba:	00e60363          	beq	a2,a4,ffffffffc02030c0 <phi_test_sema+0x18>
ffffffffc02030be:	8082                	ret
ffffffffc02030c0:	0045071b          	addiw	a4,a0,4
ffffffffc02030c4:	4595                	li	a1,5
ffffffffc02030c6:	02b7673b          	remw	a4,a4,a1
ffffffffc02030ca:	070a                	slli	a4,a4,0x2
ffffffffc02030cc:	9736                	add	a4,a4,a3
ffffffffc02030ce:	4318                	lw	a4,0(a4)
ffffffffc02030d0:	fec707e3          	beq	a4,a2,ffffffffc02030be <phi_test_sema+0x16>
ffffffffc02030d4:	0015071b          	addiw	a4,a0,1
ffffffffc02030d8:	02b7673b          	remw	a4,a4,a1
ffffffffc02030dc:	070a                	slli	a4,a4,0x2
ffffffffc02030de:	96ba                	add	a3,a3,a4
ffffffffc02030e0:	4298                	lw	a4,0(a3)
ffffffffc02030e2:	fcc70ee3          	beq	a4,a2,ffffffffc02030be <phi_test_sema+0x16>
ffffffffc02030e6:	00151713          	slli	a4,a0,0x1
ffffffffc02030ea:	953a                	add	a0,a0,a4
ffffffffc02030ec:	050e                	slli	a0,a0,0x3
ffffffffc02030ee:	00016717          	auipc	a4,0x16
ffffffffc02030f2:	5d270713          	addi	a4,a4,1490 # ffffffffc02196c0 <s>
ffffffffc02030f6:	953a                	add	a0,a0,a4
ffffffffc02030f8:	4709                	li	a4,2
ffffffffc02030fa:	c398                	sw	a4,0(a5)
ffffffffc02030fc:	a6d5                	j	ffffffffc02034e0 <up>

ffffffffc02030fe <phi_take_forks_sema>:
ffffffffc02030fe:	1141                	addi	sp,sp,-16
ffffffffc0203100:	e022                	sd	s0,0(sp)
ffffffffc0203102:	842a                	mv	s0,a0
ffffffffc0203104:	00016517          	auipc	a0,0x16
ffffffffc0203108:	54c50513          	addi	a0,a0,1356 # ffffffffc0219650 <mutex>
ffffffffc020310c:	e406                	sd	ra,8(sp)
ffffffffc020310e:	3d4000ef          	jal	ra,ffffffffc02034e2 <down>
ffffffffc0203112:	00241713          	slli	a4,s0,0x2
ffffffffc0203116:	00016797          	auipc	a5,0x16
ffffffffc020311a:	56a78793          	addi	a5,a5,1386 # ffffffffc0219680 <state_sema>
ffffffffc020311e:	97ba                	add	a5,a5,a4
ffffffffc0203120:	8522                	mv	a0,s0
ffffffffc0203122:	4705                	li	a4,1
ffffffffc0203124:	c398                	sw	a4,0(a5)
ffffffffc0203126:	f83ff0ef          	jal	ra,ffffffffc02030a8 <phi_test_sema>
ffffffffc020312a:	00016517          	auipc	a0,0x16
ffffffffc020312e:	52650513          	addi	a0,a0,1318 # ffffffffc0219650 <mutex>
ffffffffc0203132:	3ae000ef          	jal	ra,ffffffffc02034e0 <up>
ffffffffc0203136:	00141513          	slli	a0,s0,0x1
ffffffffc020313a:	942a                	add	s0,s0,a0
ffffffffc020313c:	040e                	slli	s0,s0,0x3
ffffffffc020313e:	00016517          	auipc	a0,0x16
ffffffffc0203142:	58250513          	addi	a0,a0,1410 # ffffffffc02196c0 <s>
ffffffffc0203146:	9522                	add	a0,a0,s0
ffffffffc0203148:	6402                	ld	s0,0(sp)
ffffffffc020314a:	60a2                	ld	ra,8(sp)
ffffffffc020314c:	0141                	addi	sp,sp,16
ffffffffc020314e:	ae51                	j	ffffffffc02034e2 <down>

ffffffffc0203150 <phi_put_forks_sema>:
ffffffffc0203150:	1101                	addi	sp,sp,-32
ffffffffc0203152:	e822                	sd	s0,16(sp)
ffffffffc0203154:	e426                	sd	s1,8(sp)
ffffffffc0203156:	842a                	mv	s0,a0
ffffffffc0203158:	4495                	li	s1,5
ffffffffc020315a:	2511                	addiw	a0,a0,4
ffffffffc020315c:	0295653b          	remw	a0,a0,s1
ffffffffc0203160:	00241713          	slli	a4,s0,0x2
ffffffffc0203164:	00016797          	auipc	a5,0x16
ffffffffc0203168:	51c78793          	addi	a5,a5,1308 # ffffffffc0219680 <state_sema>
ffffffffc020316c:	ec06                	sd	ra,24(sp)
ffffffffc020316e:	97ba                	add	a5,a5,a4
ffffffffc0203170:	0007a023          	sw	zero,0(a5)
ffffffffc0203174:	f35ff0ef          	jal	ra,ffffffffc02030a8 <phi_test_sema>
ffffffffc0203178:	0014051b          	addiw	a0,s0,1
ffffffffc020317c:	0295653b          	remw	a0,a0,s1
ffffffffc0203180:	6442                	ld	s0,16(sp)
ffffffffc0203182:	60e2                	ld	ra,24(sp)
ffffffffc0203184:	64a2                	ld	s1,8(sp)
ffffffffc0203186:	6105                	addi	sp,sp,32
ffffffffc0203188:	b705                	j	ffffffffc02030a8 <phi_test_sema>

ffffffffc020318a <philosopher_using_semaphore>:
ffffffffc020318a:	7179                	addi	sp,sp,-48
ffffffffc020318c:	f022                	sd	s0,32(sp)
ffffffffc020318e:	0005041b          	sext.w	s0,a0
ffffffffc0203192:	85a2                	mv	a1,s0
ffffffffc0203194:	00006517          	auipc	a0,0x6
ffffffffc0203198:	1b450513          	addi	a0,a0,436 # ffffffffc0209348 <default_pmm_manager+0x158>
ffffffffc020319c:	ec26                	sd	s1,24(sp)
ffffffffc020319e:	e84a                	sd	s2,16(sp)
ffffffffc02031a0:	e44e                	sd	s3,8(sp)
ffffffffc02031a2:	e052                	sd	s4,0(sp)
ffffffffc02031a4:	f406                	sd	ra,40(sp)
ffffffffc02031a6:	4485                	li	s1,1
ffffffffc02031a8:	f25fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031ac:	00006a17          	auipc	s4,0x6
ffffffffc02031b0:	1bca0a13          	addi	s4,s4,444 # ffffffffc0209368 <default_pmm_manager+0x178>
ffffffffc02031b4:	00006997          	auipc	s3,0x6
ffffffffc02031b8:	1e498993          	addi	s3,s3,484 # ffffffffc0209398 <default_pmm_manager+0x1a8>
ffffffffc02031bc:	4915                	li	s2,5
ffffffffc02031be:	85a6                	mv	a1,s1
ffffffffc02031c0:	8622                	mv	a2,s0
ffffffffc02031c2:	8552                	mv	a0,s4
ffffffffc02031c4:	f09fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031c8:	4529                	li	a0,10
ffffffffc02031ca:	714010ef          	jal	ra,ffffffffc02048de <do_sleep>
ffffffffc02031ce:	8522                	mv	a0,s0
ffffffffc02031d0:	f2fff0ef          	jal	ra,ffffffffc02030fe <phi_take_forks_sema>
ffffffffc02031d4:	85a6                	mv	a1,s1
ffffffffc02031d6:	8622                	mv	a2,s0
ffffffffc02031d8:	854e                	mv	a0,s3
ffffffffc02031da:	ef3fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031de:	4529                	li	a0,10
ffffffffc02031e0:	6fe010ef          	jal	ra,ffffffffc02048de <do_sleep>
ffffffffc02031e4:	2485                	addiw	s1,s1,1
ffffffffc02031e6:	8522                	mv	a0,s0
ffffffffc02031e8:	f69ff0ef          	jal	ra,ffffffffc0203150 <phi_put_forks_sema>
ffffffffc02031ec:	fd2499e3          	bne	s1,s2,ffffffffc02031be <philosopher_using_semaphore+0x34>
ffffffffc02031f0:	85a2                	mv	a1,s0
ffffffffc02031f2:	00006517          	auipc	a0,0x6
ffffffffc02031f6:	1d650513          	addi	a0,a0,470 # ffffffffc02093c8 <default_pmm_manager+0x1d8>
ffffffffc02031fa:	ed3fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031fe:	70a2                	ld	ra,40(sp)
ffffffffc0203200:	7402                	ld	s0,32(sp)
ffffffffc0203202:	64e2                	ld	s1,24(sp)
ffffffffc0203204:	6942                	ld	s2,16(sp)
ffffffffc0203206:	69a2                	ld	s3,8(sp)
ffffffffc0203208:	6a02                	ld	s4,0(sp)
ffffffffc020320a:	4501                	li	a0,0
ffffffffc020320c:	6145                	addi	sp,sp,48
ffffffffc020320e:	8082                	ret

ffffffffc0203210 <check_sync>:
ffffffffc0203210:	7139                	addi	sp,sp,-64
ffffffffc0203212:	4585                	li	a1,1
ffffffffc0203214:	00016517          	auipc	a0,0x16
ffffffffc0203218:	43c50513          	addi	a0,a0,1084 # ffffffffc0219650 <mutex>
ffffffffc020321c:	f822                	sd	s0,48(sp)
ffffffffc020321e:	f426                	sd	s1,40(sp)
ffffffffc0203220:	f04a                	sd	s2,32(sp)
ffffffffc0203222:	ec4e                	sd	s3,24(sp)
ffffffffc0203224:	e852                	sd	s4,16(sp)
ffffffffc0203226:	e456                	sd	s5,8(sp)
ffffffffc0203228:	fc06                	sd	ra,56(sp)
ffffffffc020322a:	00016917          	auipc	s2,0x16
ffffffffc020322e:	49690913          	addi	s2,s2,1174 # ffffffffc02196c0 <s>
ffffffffc0203232:	2a6000ef          	jal	ra,ffffffffc02034d8 <sem_init>
ffffffffc0203236:	00016497          	auipc	s1,0x16
ffffffffc020323a:	46248493          	addi	s1,s1,1122 # ffffffffc0219698 <philosopher_proc_sema>
ffffffffc020323e:	4401                	li	s0,0
ffffffffc0203240:	00000a97          	auipc	s5,0x0
ffffffffc0203244:	f4aa8a93          	addi	s5,s5,-182 # ffffffffc020318a <philosopher_using_semaphore>
ffffffffc0203248:	00006a17          	auipc	s4,0x6
ffffffffc020324c:	1f0a0a13          	addi	s4,s4,496 # ffffffffc0209438 <default_pmm_manager+0x248>
ffffffffc0203250:	4995                	li	s3,5
ffffffffc0203252:	4585                	li	a1,1
ffffffffc0203254:	854a                	mv	a0,s2
ffffffffc0203256:	282000ef          	jal	ra,ffffffffc02034d8 <sem_init>
ffffffffc020325a:	4601                	li	a2,0
ffffffffc020325c:	85a2                	mv	a1,s0
ffffffffc020325e:	8556                	mv	a0,s5
ffffffffc0203260:	23d000ef          	jal	ra,ffffffffc0203c9c <kernel_thread>
ffffffffc0203264:	02a05663          	blez	a0,ffffffffc0203290 <check_sync+0x80>
ffffffffc0203268:	60a000ef          	jal	ra,ffffffffc0203872 <find_proc>
ffffffffc020326c:	85d2                	mv	a1,s4
ffffffffc020326e:	0405                	addi	s0,s0,1
ffffffffc0203270:	e088                	sd	a0,0(s1)
ffffffffc0203272:	0961                	addi	s2,s2,24
ffffffffc0203274:	568000ef          	jal	ra,ffffffffc02037dc <set_proc_name>
ffffffffc0203278:	04a1                	addi	s1,s1,8
ffffffffc020327a:	fd341ce3          	bne	s0,s3,ffffffffc0203252 <check_sync+0x42>
ffffffffc020327e:	70e2                	ld	ra,56(sp)
ffffffffc0203280:	7442                	ld	s0,48(sp)
ffffffffc0203282:	74a2                	ld	s1,40(sp)
ffffffffc0203284:	7902                	ld	s2,32(sp)
ffffffffc0203286:	69e2                	ld	s3,24(sp)
ffffffffc0203288:	6a42                	ld	s4,16(sp)
ffffffffc020328a:	6aa2                	ld	s5,8(sp)
ffffffffc020328c:	6121                	addi	sp,sp,64
ffffffffc020328e:	8082                	ret
ffffffffc0203290:	00006617          	auipc	a2,0x6
ffffffffc0203294:	15860613          	addi	a2,a2,344 # ffffffffc02093e8 <default_pmm_manager+0x1f8>
ffffffffc0203298:	06700593          	li	a1,103
ffffffffc020329c:	00006517          	auipc	a0,0x6
ffffffffc02032a0:	18450513          	addi	a0,a0,388 # ffffffffc0209420 <default_pmm_manager+0x230>
ffffffffc02032a4:	f65fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02032a8 <wait_queue_del.part.0>:
ffffffffc02032a8:	1141                	addi	sp,sp,-16
ffffffffc02032aa:	00006697          	auipc	a3,0x6
ffffffffc02032ae:	1a668693          	addi	a3,a3,422 # ffffffffc0209450 <default_pmm_manager+0x260>
ffffffffc02032b2:	00005617          	auipc	a2,0x5
ffffffffc02032b6:	31e60613          	addi	a2,a2,798 # ffffffffc02085d0 <commands+0x410>
ffffffffc02032ba:	45f1                	li	a1,28
ffffffffc02032bc:	00006517          	auipc	a0,0x6
ffffffffc02032c0:	1d450513          	addi	a0,a0,468 # ffffffffc0209490 <default_pmm_manager+0x2a0>
ffffffffc02032c4:	e406                	sd	ra,8(sp)
ffffffffc02032c6:	f43fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02032ca <wait_queue_init>:
ffffffffc02032ca:	e508                	sd	a0,8(a0)
ffffffffc02032cc:	e108                	sd	a0,0(a0)
ffffffffc02032ce:	8082                	ret

ffffffffc02032d0 <wait_queue_del>:
ffffffffc02032d0:	7198                	ld	a4,32(a1)
ffffffffc02032d2:	01858793          	addi	a5,a1,24
ffffffffc02032d6:	00e78b63          	beq	a5,a4,ffffffffc02032ec <wait_queue_del+0x1c>
ffffffffc02032da:	6994                	ld	a3,16(a1)
ffffffffc02032dc:	00a69863          	bne	a3,a0,ffffffffc02032ec <wait_queue_del+0x1c>
ffffffffc02032e0:	6d94                	ld	a3,24(a1)
ffffffffc02032e2:	e698                	sd	a4,8(a3)
ffffffffc02032e4:	e314                	sd	a3,0(a4)
ffffffffc02032e6:	f19c                	sd	a5,32(a1)
ffffffffc02032e8:	ed9c                	sd	a5,24(a1)
ffffffffc02032ea:	8082                	ret
ffffffffc02032ec:	1141                	addi	sp,sp,-16
ffffffffc02032ee:	e406                	sd	ra,8(sp)
ffffffffc02032f0:	fb9ff0ef          	jal	ra,ffffffffc02032a8 <wait_queue_del.part.0>

ffffffffc02032f4 <wait_queue_first>:
ffffffffc02032f4:	651c                	ld	a5,8(a0)
ffffffffc02032f6:	00f50563          	beq	a0,a5,ffffffffc0203300 <wait_queue_first+0xc>
ffffffffc02032fa:	fe878513          	addi	a0,a5,-24
ffffffffc02032fe:	8082                	ret
ffffffffc0203300:	4501                	li	a0,0
ffffffffc0203302:	8082                	ret

ffffffffc0203304 <wait_in_queue>:
ffffffffc0203304:	711c                	ld	a5,32(a0)
ffffffffc0203306:	0561                	addi	a0,a0,24
ffffffffc0203308:	40a78533          	sub	a0,a5,a0
ffffffffc020330c:	00a03533          	snez	a0,a0
ffffffffc0203310:	8082                	ret

ffffffffc0203312 <wakeup_wait>:
ffffffffc0203312:	ce91                	beqz	a3,ffffffffc020332e <wakeup_wait+0x1c>
ffffffffc0203314:	7198                	ld	a4,32(a1)
ffffffffc0203316:	01858793          	addi	a5,a1,24
ffffffffc020331a:	00e78e63          	beq	a5,a4,ffffffffc0203336 <wakeup_wait+0x24>
ffffffffc020331e:	6994                	ld	a3,16(a1)
ffffffffc0203320:	00d51b63          	bne	a0,a3,ffffffffc0203336 <wakeup_wait+0x24>
ffffffffc0203324:	6d94                	ld	a3,24(a1)
ffffffffc0203326:	e698                	sd	a4,8(a3)
ffffffffc0203328:	e314                	sd	a3,0(a4)
ffffffffc020332a:	f19c                	sd	a5,32(a1)
ffffffffc020332c:	ed9c                	sd	a5,24(a1)
ffffffffc020332e:	6188                	ld	a0,0(a1)
ffffffffc0203330:	c590                	sw	a2,8(a1)
ffffffffc0203332:	6820106f          	j	ffffffffc02049b4 <wakeup_proc>
ffffffffc0203336:	1141                	addi	sp,sp,-16
ffffffffc0203338:	e406                	sd	ra,8(sp)
ffffffffc020333a:	f6fff0ef          	jal	ra,ffffffffc02032a8 <wait_queue_del.part.0>

ffffffffc020333e <wait_current_set>:
ffffffffc020333e:	00016797          	auipc	a5,0x16
ffffffffc0203342:	1ba7b783          	ld	a5,442(a5) # ffffffffc02194f8 <current>
ffffffffc0203346:	c39d                	beqz	a5,ffffffffc020336c <wait_current_set+0x2e>
ffffffffc0203348:	01858713          	addi	a4,a1,24
ffffffffc020334c:	800006b7          	lui	a3,0x80000
ffffffffc0203350:	ed98                	sd	a4,24(a1)
ffffffffc0203352:	e19c                	sd	a5,0(a1)
ffffffffc0203354:	c594                	sw	a3,8(a1)
ffffffffc0203356:	4685                	li	a3,1
ffffffffc0203358:	c394                	sw	a3,0(a5)
ffffffffc020335a:	0ec7a623          	sw	a2,236(a5)
ffffffffc020335e:	611c                	ld	a5,0(a0)
ffffffffc0203360:	e988                	sd	a0,16(a1)
ffffffffc0203362:	e118                	sd	a4,0(a0)
ffffffffc0203364:	e798                	sd	a4,8(a5)
ffffffffc0203366:	f188                	sd	a0,32(a1)
ffffffffc0203368:	ed9c                	sd	a5,24(a1)
ffffffffc020336a:	8082                	ret
ffffffffc020336c:	1141                	addi	sp,sp,-16
ffffffffc020336e:	00006697          	auipc	a3,0x6
ffffffffc0203372:	13a68693          	addi	a3,a3,314 # ffffffffc02094a8 <default_pmm_manager+0x2b8>
ffffffffc0203376:	00005617          	auipc	a2,0x5
ffffffffc020337a:	25a60613          	addi	a2,a2,602 # ffffffffc02085d0 <commands+0x410>
ffffffffc020337e:	07400593          	li	a1,116
ffffffffc0203382:	00006517          	auipc	a0,0x6
ffffffffc0203386:	10e50513          	addi	a0,a0,270 # ffffffffc0209490 <default_pmm_manager+0x2a0>
ffffffffc020338a:	e406                	sd	ra,8(sp)
ffffffffc020338c:	e7dfc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203390 <__down.constprop.0>:
ffffffffc0203390:	715d                	addi	sp,sp,-80
ffffffffc0203392:	e0a2                	sd	s0,64(sp)
ffffffffc0203394:	e486                	sd	ra,72(sp)
ffffffffc0203396:	fc26                	sd	s1,56(sp)
ffffffffc0203398:	842a                	mv	s0,a0
ffffffffc020339a:	100027f3          	csrr	a5,sstatus
ffffffffc020339e:	8b89                	andi	a5,a5,2
ffffffffc02033a0:	ebb1                	bnez	a5,ffffffffc02033f4 <__down.constprop.0+0x64>
ffffffffc02033a2:	411c                	lw	a5,0(a0)
ffffffffc02033a4:	00f05a63          	blez	a5,ffffffffc02033b8 <__down.constprop.0+0x28>
ffffffffc02033a8:	37fd                	addiw	a5,a5,-1
ffffffffc02033aa:	c11c                	sw	a5,0(a0)
ffffffffc02033ac:	4501                	li	a0,0
ffffffffc02033ae:	60a6                	ld	ra,72(sp)
ffffffffc02033b0:	6406                	ld	s0,64(sp)
ffffffffc02033b2:	74e2                	ld	s1,56(sp)
ffffffffc02033b4:	6161                	addi	sp,sp,80
ffffffffc02033b6:	8082                	ret
ffffffffc02033b8:	00850413          	addi	s0,a0,8
ffffffffc02033bc:	0024                	addi	s1,sp,8
ffffffffc02033be:	10000613          	li	a2,256
ffffffffc02033c2:	85a6                	mv	a1,s1
ffffffffc02033c4:	8522                	mv	a0,s0
ffffffffc02033c6:	f79ff0ef          	jal	ra,ffffffffc020333e <wait_current_set>
ffffffffc02033ca:	69c010ef          	jal	ra,ffffffffc0204a66 <schedule>
ffffffffc02033ce:	100027f3          	csrr	a5,sstatus
ffffffffc02033d2:	8b89                	andi	a5,a5,2
ffffffffc02033d4:	efb9                	bnez	a5,ffffffffc0203432 <__down.constprop.0+0xa2>
ffffffffc02033d6:	8526                	mv	a0,s1
ffffffffc02033d8:	f2dff0ef          	jal	ra,ffffffffc0203304 <wait_in_queue>
ffffffffc02033dc:	e531                	bnez	a0,ffffffffc0203428 <__down.constprop.0+0x98>
ffffffffc02033de:	4542                	lw	a0,16(sp)
ffffffffc02033e0:	10000793          	li	a5,256
ffffffffc02033e4:	fcf515e3          	bne	a0,a5,ffffffffc02033ae <__down.constprop.0+0x1e>
ffffffffc02033e8:	60a6                	ld	ra,72(sp)
ffffffffc02033ea:	6406                	ld	s0,64(sp)
ffffffffc02033ec:	74e2                	ld	s1,56(sp)
ffffffffc02033ee:	4501                	li	a0,0
ffffffffc02033f0:	6161                	addi	sp,sp,80
ffffffffc02033f2:	8082                	ret
ffffffffc02033f4:	a44fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02033f8:	401c                	lw	a5,0(s0)
ffffffffc02033fa:	00f05c63          	blez	a5,ffffffffc0203412 <__down.constprop.0+0x82>
ffffffffc02033fe:	37fd                	addiw	a5,a5,-1
ffffffffc0203400:	c01c                	sw	a5,0(s0)
ffffffffc0203402:	a30fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203406:	60a6                	ld	ra,72(sp)
ffffffffc0203408:	6406                	ld	s0,64(sp)
ffffffffc020340a:	74e2                	ld	s1,56(sp)
ffffffffc020340c:	4501                	li	a0,0
ffffffffc020340e:	6161                	addi	sp,sp,80
ffffffffc0203410:	8082                	ret
ffffffffc0203412:	0421                	addi	s0,s0,8
ffffffffc0203414:	0024                	addi	s1,sp,8
ffffffffc0203416:	10000613          	li	a2,256
ffffffffc020341a:	85a6                	mv	a1,s1
ffffffffc020341c:	8522                	mv	a0,s0
ffffffffc020341e:	f21ff0ef          	jal	ra,ffffffffc020333e <wait_current_set>
ffffffffc0203422:	a10fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203426:	b755                	j	ffffffffc02033ca <__down.constprop.0+0x3a>
ffffffffc0203428:	85a6                	mv	a1,s1
ffffffffc020342a:	8522                	mv	a0,s0
ffffffffc020342c:	ea5ff0ef          	jal	ra,ffffffffc02032d0 <wait_queue_del>
ffffffffc0203430:	b77d                	j	ffffffffc02033de <__down.constprop.0+0x4e>
ffffffffc0203432:	a06fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203436:	8526                	mv	a0,s1
ffffffffc0203438:	ecdff0ef          	jal	ra,ffffffffc0203304 <wait_in_queue>
ffffffffc020343c:	e501                	bnez	a0,ffffffffc0203444 <__down.constprop.0+0xb4>
ffffffffc020343e:	9f4fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203442:	bf71                	j	ffffffffc02033de <__down.constprop.0+0x4e>
ffffffffc0203444:	85a6                	mv	a1,s1
ffffffffc0203446:	8522                	mv	a0,s0
ffffffffc0203448:	e89ff0ef          	jal	ra,ffffffffc02032d0 <wait_queue_del>
ffffffffc020344c:	bfcd                	j	ffffffffc020343e <__down.constprop.0+0xae>

ffffffffc020344e <__up.constprop.0>:
ffffffffc020344e:	1101                	addi	sp,sp,-32
ffffffffc0203450:	e822                	sd	s0,16(sp)
ffffffffc0203452:	ec06                	sd	ra,24(sp)
ffffffffc0203454:	e426                	sd	s1,8(sp)
ffffffffc0203456:	e04a                	sd	s2,0(sp)
ffffffffc0203458:	842a                	mv	s0,a0
ffffffffc020345a:	100027f3          	csrr	a5,sstatus
ffffffffc020345e:	8b89                	andi	a5,a5,2
ffffffffc0203460:	4901                	li	s2,0
ffffffffc0203462:	eba1                	bnez	a5,ffffffffc02034b2 <__up.constprop.0+0x64>
ffffffffc0203464:	00840493          	addi	s1,s0,8
ffffffffc0203468:	8526                	mv	a0,s1
ffffffffc020346a:	e8bff0ef          	jal	ra,ffffffffc02032f4 <wait_queue_first>
ffffffffc020346e:	85aa                	mv	a1,a0
ffffffffc0203470:	cd0d                	beqz	a0,ffffffffc02034aa <__up.constprop.0+0x5c>
ffffffffc0203472:	6118                	ld	a4,0(a0)
ffffffffc0203474:	10000793          	li	a5,256
ffffffffc0203478:	0ec72703          	lw	a4,236(a4)
ffffffffc020347c:	02f71f63          	bne	a4,a5,ffffffffc02034ba <__up.constprop.0+0x6c>
ffffffffc0203480:	4685                	li	a3,1
ffffffffc0203482:	10000613          	li	a2,256
ffffffffc0203486:	8526                	mv	a0,s1
ffffffffc0203488:	e8bff0ef          	jal	ra,ffffffffc0203312 <wakeup_wait>
ffffffffc020348c:	00091863          	bnez	s2,ffffffffc020349c <__up.constprop.0+0x4e>
ffffffffc0203490:	60e2                	ld	ra,24(sp)
ffffffffc0203492:	6442                	ld	s0,16(sp)
ffffffffc0203494:	64a2                	ld	s1,8(sp)
ffffffffc0203496:	6902                	ld	s2,0(sp)
ffffffffc0203498:	6105                	addi	sp,sp,32
ffffffffc020349a:	8082                	ret
ffffffffc020349c:	6442                	ld	s0,16(sp)
ffffffffc020349e:	60e2                	ld	ra,24(sp)
ffffffffc02034a0:	64a2                	ld	s1,8(sp)
ffffffffc02034a2:	6902                	ld	s2,0(sp)
ffffffffc02034a4:	6105                	addi	sp,sp,32
ffffffffc02034a6:	98cfd06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc02034aa:	401c                	lw	a5,0(s0)
ffffffffc02034ac:	2785                	addiw	a5,a5,1
ffffffffc02034ae:	c01c                	sw	a5,0(s0)
ffffffffc02034b0:	bff1                	j	ffffffffc020348c <__up.constprop.0+0x3e>
ffffffffc02034b2:	986fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02034b6:	4905                	li	s2,1
ffffffffc02034b8:	b775                	j	ffffffffc0203464 <__up.constprop.0+0x16>
ffffffffc02034ba:	00006697          	auipc	a3,0x6
ffffffffc02034be:	ffe68693          	addi	a3,a3,-2 # ffffffffc02094b8 <default_pmm_manager+0x2c8>
ffffffffc02034c2:	00005617          	auipc	a2,0x5
ffffffffc02034c6:	10e60613          	addi	a2,a2,270 # ffffffffc02085d0 <commands+0x410>
ffffffffc02034ca:	45e5                	li	a1,25
ffffffffc02034cc:	00006517          	auipc	a0,0x6
ffffffffc02034d0:	01450513          	addi	a0,a0,20 # ffffffffc02094e0 <default_pmm_manager+0x2f0>
ffffffffc02034d4:	d35fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02034d8 <sem_init>:
ffffffffc02034d8:	c10c                	sw	a1,0(a0)
ffffffffc02034da:	0521                	addi	a0,a0,8
ffffffffc02034dc:	defff06f          	j	ffffffffc02032ca <wait_queue_init>

ffffffffc02034e0 <up>:
ffffffffc02034e0:	b7bd                	j	ffffffffc020344e <__up.constprop.0>

ffffffffc02034e2 <down>:
ffffffffc02034e2:	1141                	addi	sp,sp,-16
ffffffffc02034e4:	e406                	sd	ra,8(sp)
ffffffffc02034e6:	eabff0ef          	jal	ra,ffffffffc0203390 <__down.constprop.0>
ffffffffc02034ea:	2501                	sext.w	a0,a0
ffffffffc02034ec:	e501                	bnez	a0,ffffffffc02034f4 <down+0x12>
ffffffffc02034ee:	60a2                	ld	ra,8(sp)
ffffffffc02034f0:	0141                	addi	sp,sp,16
ffffffffc02034f2:	8082                	ret
ffffffffc02034f4:	00006697          	auipc	a3,0x6
ffffffffc02034f8:	ffc68693          	addi	a3,a3,-4 # ffffffffc02094f0 <default_pmm_manager+0x300>
ffffffffc02034fc:	00005617          	auipc	a2,0x5
ffffffffc0203500:	0d460613          	addi	a2,a2,212 # ffffffffc02085d0 <commands+0x410>
ffffffffc0203504:	04000593          	li	a1,64
ffffffffc0203508:	00006517          	auipc	a0,0x6
ffffffffc020350c:	fd850513          	addi	a0,a0,-40 # ffffffffc02094e0 <default_pmm_manager+0x2f0>
ffffffffc0203510:	cf9fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203514 <swapfs_init>:
ffffffffc0203514:	1141                	addi	sp,sp,-16
ffffffffc0203516:	4505                	li	a0,1
ffffffffc0203518:	e406                	sd	ra,8(sp)
ffffffffc020351a:	808fd0ef          	jal	ra,ffffffffc0200522 <ide_device_valid>
ffffffffc020351e:	cd01                	beqz	a0,ffffffffc0203536 <swapfs_init+0x22>
ffffffffc0203520:	4505                	li	a0,1
ffffffffc0203522:	806fd0ef          	jal	ra,ffffffffc0200528 <ide_device_size>
ffffffffc0203526:	60a2                	ld	ra,8(sp)
ffffffffc0203528:	810d                	srli	a0,a0,0x3
ffffffffc020352a:	00016797          	auipc	a5,0x16
ffffffffc020352e:	08a7bb23          	sd	a0,150(a5) # ffffffffc02195c0 <max_swap_offset>
ffffffffc0203532:	0141                	addi	sp,sp,16
ffffffffc0203534:	8082                	ret
ffffffffc0203536:	00006617          	auipc	a2,0x6
ffffffffc020353a:	fca60613          	addi	a2,a2,-54 # ffffffffc0209500 <default_pmm_manager+0x310>
ffffffffc020353e:	45b5                	li	a1,13
ffffffffc0203540:	00006517          	auipc	a0,0x6
ffffffffc0203544:	fe050513          	addi	a0,a0,-32 # ffffffffc0209520 <default_pmm_manager+0x330>
ffffffffc0203548:	cc1fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020354c <swapfs_read>:
ffffffffc020354c:	1141                	addi	sp,sp,-16
ffffffffc020354e:	e406                	sd	ra,8(sp)
ffffffffc0203550:	00855793          	srli	a5,a0,0x8
ffffffffc0203554:	cbb1                	beqz	a5,ffffffffc02035a8 <swapfs_read+0x5c>
ffffffffc0203556:	00016717          	auipc	a4,0x16
ffffffffc020355a:	06a73703          	ld	a4,106(a4) # ffffffffc02195c0 <max_swap_offset>
ffffffffc020355e:	04e7f563          	bgeu	a5,a4,ffffffffc02035a8 <swapfs_read+0x5c>
ffffffffc0203562:	00016617          	auipc	a2,0x16
ffffffffc0203566:	0de63603          	ld	a2,222(a2) # ffffffffc0219640 <pages>
ffffffffc020356a:	8d91                	sub	a1,a1,a2
ffffffffc020356c:	4065d613          	srai	a2,a1,0x6
ffffffffc0203570:	00007717          	auipc	a4,0x7
ffffffffc0203574:	0a873703          	ld	a4,168(a4) # ffffffffc020a618 <nbase>
ffffffffc0203578:	963a                	add	a2,a2,a4
ffffffffc020357a:	00c61713          	slli	a4,a2,0xc
ffffffffc020357e:	8331                	srli	a4,a4,0xc
ffffffffc0203580:	00016697          	auipc	a3,0x16
ffffffffc0203584:	f706b683          	ld	a3,-144(a3) # ffffffffc02194f0 <npage>
ffffffffc0203588:	0037959b          	slliw	a1,a5,0x3
ffffffffc020358c:	0632                	slli	a2,a2,0xc
ffffffffc020358e:	02d77963          	bgeu	a4,a3,ffffffffc02035c0 <swapfs_read+0x74>
ffffffffc0203592:	60a2                	ld	ra,8(sp)
ffffffffc0203594:	00016797          	auipc	a5,0x16
ffffffffc0203598:	09c7b783          	ld	a5,156(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc020359c:	46a1                	li	a3,8
ffffffffc020359e:	963e                	add	a2,a2,a5
ffffffffc02035a0:	4505                	li	a0,1
ffffffffc02035a2:	0141                	addi	sp,sp,16
ffffffffc02035a4:	f8bfc06f          	j	ffffffffc020052e <ide_read_secs>
ffffffffc02035a8:	86aa                	mv	a3,a0
ffffffffc02035aa:	00006617          	auipc	a2,0x6
ffffffffc02035ae:	f8e60613          	addi	a2,a2,-114 # ffffffffc0209538 <default_pmm_manager+0x348>
ffffffffc02035b2:	45d1                	li	a1,20
ffffffffc02035b4:	00006517          	auipc	a0,0x6
ffffffffc02035b8:	f6c50513          	addi	a0,a0,-148 # ffffffffc0209520 <default_pmm_manager+0x330>
ffffffffc02035bc:	c4dfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02035c0:	86b2                	mv	a3,a2
ffffffffc02035c2:	06900593          	li	a1,105
ffffffffc02035c6:	00005617          	auipc	a2,0x5
ffffffffc02035ca:	5ea60613          	addi	a2,a2,1514 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc02035ce:	00005517          	auipc	a0,0x5
ffffffffc02035d2:	60a50513          	addi	a0,a0,1546 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc02035d6:	c33fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02035da <swapfs_write>:
ffffffffc02035da:	1141                	addi	sp,sp,-16
ffffffffc02035dc:	e406                	sd	ra,8(sp)
ffffffffc02035de:	00855793          	srli	a5,a0,0x8
ffffffffc02035e2:	cbb1                	beqz	a5,ffffffffc0203636 <swapfs_write+0x5c>
ffffffffc02035e4:	00016717          	auipc	a4,0x16
ffffffffc02035e8:	fdc73703          	ld	a4,-36(a4) # ffffffffc02195c0 <max_swap_offset>
ffffffffc02035ec:	04e7f563          	bgeu	a5,a4,ffffffffc0203636 <swapfs_write+0x5c>
ffffffffc02035f0:	00016617          	auipc	a2,0x16
ffffffffc02035f4:	05063603          	ld	a2,80(a2) # ffffffffc0219640 <pages>
ffffffffc02035f8:	8d91                	sub	a1,a1,a2
ffffffffc02035fa:	4065d613          	srai	a2,a1,0x6
ffffffffc02035fe:	00007717          	auipc	a4,0x7
ffffffffc0203602:	01a73703          	ld	a4,26(a4) # ffffffffc020a618 <nbase>
ffffffffc0203606:	963a                	add	a2,a2,a4
ffffffffc0203608:	00c61713          	slli	a4,a2,0xc
ffffffffc020360c:	8331                	srli	a4,a4,0xc
ffffffffc020360e:	00016697          	auipc	a3,0x16
ffffffffc0203612:	ee26b683          	ld	a3,-286(a3) # ffffffffc02194f0 <npage>
ffffffffc0203616:	0037959b          	slliw	a1,a5,0x3
ffffffffc020361a:	0632                	slli	a2,a2,0xc
ffffffffc020361c:	02d77963          	bgeu	a4,a3,ffffffffc020364e <swapfs_write+0x74>
ffffffffc0203620:	60a2                	ld	ra,8(sp)
ffffffffc0203622:	00016797          	auipc	a5,0x16
ffffffffc0203626:	00e7b783          	ld	a5,14(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc020362a:	46a1                	li	a3,8
ffffffffc020362c:	963e                	add	a2,a2,a5
ffffffffc020362e:	4505                	li	a0,1
ffffffffc0203630:	0141                	addi	sp,sp,16
ffffffffc0203632:	f21fc06f          	j	ffffffffc0200552 <ide_write_secs>
ffffffffc0203636:	86aa                	mv	a3,a0
ffffffffc0203638:	00006617          	auipc	a2,0x6
ffffffffc020363c:	f0060613          	addi	a2,a2,-256 # ffffffffc0209538 <default_pmm_manager+0x348>
ffffffffc0203640:	45e5                	li	a1,25
ffffffffc0203642:	00006517          	auipc	a0,0x6
ffffffffc0203646:	ede50513          	addi	a0,a0,-290 # ffffffffc0209520 <default_pmm_manager+0x330>
ffffffffc020364a:	bbffc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020364e:	86b2                	mv	a3,a2
ffffffffc0203650:	06900593          	li	a1,105
ffffffffc0203654:	00005617          	auipc	a2,0x5
ffffffffc0203658:	55c60613          	addi	a2,a2,1372 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc020365c:	00005517          	auipc	a0,0x5
ffffffffc0203660:	57c50513          	addi	a0,a0,1404 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0203664:	ba5fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203668 <switch_to>:
ffffffffc0203668:	00153023          	sd	ra,0(a0)
ffffffffc020366c:	00253423          	sd	sp,8(a0)
ffffffffc0203670:	e900                	sd	s0,16(a0)
ffffffffc0203672:	ed04                	sd	s1,24(a0)
ffffffffc0203674:	03253023          	sd	s2,32(a0)
ffffffffc0203678:	03353423          	sd	s3,40(a0)
ffffffffc020367c:	03453823          	sd	s4,48(a0)
ffffffffc0203680:	03553c23          	sd	s5,56(a0)
ffffffffc0203684:	05653023          	sd	s6,64(a0)
ffffffffc0203688:	05753423          	sd	s7,72(a0)
ffffffffc020368c:	05853823          	sd	s8,80(a0)
ffffffffc0203690:	05953c23          	sd	s9,88(a0)
ffffffffc0203694:	07a53023          	sd	s10,96(a0)
ffffffffc0203698:	07b53423          	sd	s11,104(a0)
ffffffffc020369c:	0005b083          	ld	ra,0(a1)
ffffffffc02036a0:	0085b103          	ld	sp,8(a1)
ffffffffc02036a4:	6980                	ld	s0,16(a1)
ffffffffc02036a6:	6d84                	ld	s1,24(a1)
ffffffffc02036a8:	0205b903          	ld	s2,32(a1)
ffffffffc02036ac:	0285b983          	ld	s3,40(a1)
ffffffffc02036b0:	0305ba03          	ld	s4,48(a1)
ffffffffc02036b4:	0385ba83          	ld	s5,56(a1)
ffffffffc02036b8:	0405bb03          	ld	s6,64(a1)
ffffffffc02036bc:	0485bb83          	ld	s7,72(a1)
ffffffffc02036c0:	0505bc03          	ld	s8,80(a1)
ffffffffc02036c4:	0585bc83          	ld	s9,88(a1)
ffffffffc02036c8:	0605bd03          	ld	s10,96(a1)
ffffffffc02036cc:	0685bd83          	ld	s11,104(a1)
ffffffffc02036d0:	8082                	ret

ffffffffc02036d2 <kernel_thread_entry>:
ffffffffc02036d2:	8526                	mv	a0,s1
ffffffffc02036d4:	9402                	jalr	s0
ffffffffc02036d6:	616000ef          	jal	ra,ffffffffc0203cec <do_exit>

ffffffffc02036da <alloc_proc>:
ffffffffc02036da:	1141                	addi	sp,sp,-16
ffffffffc02036dc:	14800513          	li	a0,328
ffffffffc02036e0:	e022                	sd	s0,0(sp)
ffffffffc02036e2:	e406                	sd	ra,8(sp)
ffffffffc02036e4:	fa7fd0ef          	jal	ra,ffffffffc020168a <kmalloc>
ffffffffc02036e8:	842a                	mv	s0,a0
ffffffffc02036ea:	cd21                	beqz	a0,ffffffffc0203742 <alloc_proc+0x68>
ffffffffc02036ec:	57fd                	li	a5,-1
ffffffffc02036ee:	1782                	slli	a5,a5,0x20
ffffffffc02036f0:	e11c                	sd	a5,0(a0)
ffffffffc02036f2:	07000613          	li	a2,112
ffffffffc02036f6:	4581                	li	a1,0
ffffffffc02036f8:	00052423          	sw	zero,8(a0)
ffffffffc02036fc:	00053823          	sd	zero,16(a0)
ffffffffc0203700:	00053c23          	sd	zero,24(a0)
ffffffffc0203704:	02053023          	sd	zero,32(a0)
ffffffffc0203708:	02053423          	sd	zero,40(a0)
ffffffffc020370c:	03050513          	addi	a0,a0,48
ffffffffc0203710:	3dc040ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc0203714:	00016797          	auipc	a5,0x16
ffffffffc0203718:	f247b783          	ld	a5,-220(a5) # ffffffffc0219638 <boot_cr3>
ffffffffc020371c:	0a043023          	sd	zero,160(s0)
ffffffffc0203720:	f45c                	sd	a5,168(s0)
ffffffffc0203722:	0a042823          	sw	zero,176(s0)
ffffffffc0203726:	463d                	li	a2,15
ffffffffc0203728:	4581                	li	a1,0
ffffffffc020372a:	0b440513          	addi	a0,s0,180
ffffffffc020372e:	3be040ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc0203732:	0e042623          	sw	zero,236(s0)
ffffffffc0203736:	0e043c23          	sd	zero,248(s0)
ffffffffc020373a:	10043023          	sd	zero,256(s0)
ffffffffc020373e:	0e043823          	sd	zero,240(s0)
ffffffffc0203742:	60a2                	ld	ra,8(sp)
ffffffffc0203744:	8522                	mv	a0,s0
ffffffffc0203746:	6402                	ld	s0,0(sp)
ffffffffc0203748:	0141                	addi	sp,sp,16
ffffffffc020374a:	8082                	ret

ffffffffc020374c <forkret>:
ffffffffc020374c:	00016797          	auipc	a5,0x16
ffffffffc0203750:	dac7b783          	ld	a5,-596(a5) # ffffffffc02194f8 <current>
ffffffffc0203754:	73c8                	ld	a0,160(a5)
ffffffffc0203756:	dd4fd06f          	j	ffffffffc0200d2a <forkrets>

ffffffffc020375a <setup_pgdir.isra.0>:
ffffffffc020375a:	1101                	addi	sp,sp,-32
ffffffffc020375c:	e426                	sd	s1,8(sp)
ffffffffc020375e:	84aa                	mv	s1,a0
ffffffffc0203760:	4505                	li	a0,1
ffffffffc0203762:	ec06                	sd	ra,24(sp)
ffffffffc0203764:	e822                	sd	s0,16(sp)
ffffffffc0203766:	f79fe0ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc020376a:	c939                	beqz	a0,ffffffffc02037c0 <setup_pgdir.isra.0+0x66>
ffffffffc020376c:	00016697          	auipc	a3,0x16
ffffffffc0203770:	ed46b683          	ld	a3,-300(a3) # ffffffffc0219640 <pages>
ffffffffc0203774:	40d506b3          	sub	a3,a0,a3
ffffffffc0203778:	8699                	srai	a3,a3,0x6
ffffffffc020377a:	00007417          	auipc	s0,0x7
ffffffffc020377e:	e9e43403          	ld	s0,-354(s0) # ffffffffc020a618 <nbase>
ffffffffc0203782:	96a2                	add	a3,a3,s0
ffffffffc0203784:	00c69793          	slli	a5,a3,0xc
ffffffffc0203788:	83b1                	srli	a5,a5,0xc
ffffffffc020378a:	00016717          	auipc	a4,0x16
ffffffffc020378e:	d6673703          	ld	a4,-666(a4) # ffffffffc02194f0 <npage>
ffffffffc0203792:	06b2                	slli	a3,a3,0xc
ffffffffc0203794:	02e7f863          	bgeu	a5,a4,ffffffffc02037c4 <setup_pgdir.isra.0+0x6a>
ffffffffc0203798:	00016417          	auipc	s0,0x16
ffffffffc020379c:	e9843403          	ld	s0,-360(s0) # ffffffffc0219630 <va_pa_offset>
ffffffffc02037a0:	9436                	add	s0,s0,a3
ffffffffc02037a2:	6605                	lui	a2,0x1
ffffffffc02037a4:	00016597          	auipc	a1,0x16
ffffffffc02037a8:	d445b583          	ld	a1,-700(a1) # ffffffffc02194e8 <boot_pgdir>
ffffffffc02037ac:	8522                	mv	a0,s0
ffffffffc02037ae:	350040ef          	jal	ra,ffffffffc0207afe <memcpy>
ffffffffc02037b2:	4501                	li	a0,0
ffffffffc02037b4:	e080                	sd	s0,0(s1)
ffffffffc02037b6:	60e2                	ld	ra,24(sp)
ffffffffc02037b8:	6442                	ld	s0,16(sp)
ffffffffc02037ba:	64a2                	ld	s1,8(sp)
ffffffffc02037bc:	6105                	addi	sp,sp,32
ffffffffc02037be:	8082                	ret
ffffffffc02037c0:	5571                	li	a0,-4
ffffffffc02037c2:	bfd5                	j	ffffffffc02037b6 <setup_pgdir.isra.0+0x5c>
ffffffffc02037c4:	00005617          	auipc	a2,0x5
ffffffffc02037c8:	3ec60613          	addi	a2,a2,1004 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc02037cc:	06900593          	li	a1,105
ffffffffc02037d0:	00005517          	auipc	a0,0x5
ffffffffc02037d4:	40850513          	addi	a0,a0,1032 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc02037d8:	a31fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02037dc <set_proc_name>:
ffffffffc02037dc:	1101                	addi	sp,sp,-32
ffffffffc02037de:	e822                	sd	s0,16(sp)
ffffffffc02037e0:	0b450413          	addi	s0,a0,180
ffffffffc02037e4:	e426                	sd	s1,8(sp)
ffffffffc02037e6:	4641                	li	a2,16
ffffffffc02037e8:	84ae                	mv	s1,a1
ffffffffc02037ea:	8522                	mv	a0,s0
ffffffffc02037ec:	4581                	li	a1,0
ffffffffc02037ee:	ec06                	sd	ra,24(sp)
ffffffffc02037f0:	2fc040ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc02037f4:	8522                	mv	a0,s0
ffffffffc02037f6:	6442                	ld	s0,16(sp)
ffffffffc02037f8:	60e2                	ld	ra,24(sp)
ffffffffc02037fa:	85a6                	mv	a1,s1
ffffffffc02037fc:	64a2                	ld	s1,8(sp)
ffffffffc02037fe:	463d                	li	a2,15
ffffffffc0203800:	6105                	addi	sp,sp,32
ffffffffc0203802:	2fc0406f          	j	ffffffffc0207afe <memcpy>

ffffffffc0203806 <proc_run>:
ffffffffc0203806:	7179                	addi	sp,sp,-48
ffffffffc0203808:	ec4a                	sd	s2,24(sp)
ffffffffc020380a:	00016917          	auipc	s2,0x16
ffffffffc020380e:	cee90913          	addi	s2,s2,-786 # ffffffffc02194f8 <current>
ffffffffc0203812:	f026                	sd	s1,32(sp)
ffffffffc0203814:	00093483          	ld	s1,0(s2)
ffffffffc0203818:	f406                	sd	ra,40(sp)
ffffffffc020381a:	e84e                	sd	s3,16(sp)
ffffffffc020381c:	02a48863          	beq	s1,a0,ffffffffc020384c <proc_run+0x46>
ffffffffc0203820:	100027f3          	csrr	a5,sstatus
ffffffffc0203824:	8b89                	andi	a5,a5,2
ffffffffc0203826:	4981                	li	s3,0
ffffffffc0203828:	ef9d                	bnez	a5,ffffffffc0203866 <proc_run+0x60>
ffffffffc020382a:	755c                	ld	a5,168(a0)
ffffffffc020382c:	577d                	li	a4,-1
ffffffffc020382e:	177e                	slli	a4,a4,0x3f
ffffffffc0203830:	83b1                	srli	a5,a5,0xc
ffffffffc0203832:	00a93023          	sd	a0,0(s2)
ffffffffc0203836:	8fd9                	or	a5,a5,a4
ffffffffc0203838:	18079073          	csrw	satp,a5
ffffffffc020383c:	03050593          	addi	a1,a0,48
ffffffffc0203840:	03048513          	addi	a0,s1,48
ffffffffc0203844:	e25ff0ef          	jal	ra,ffffffffc0203668 <switch_to>
ffffffffc0203848:	00099863          	bnez	s3,ffffffffc0203858 <proc_run+0x52>
ffffffffc020384c:	70a2                	ld	ra,40(sp)
ffffffffc020384e:	7482                	ld	s1,32(sp)
ffffffffc0203850:	6962                	ld	s2,24(sp)
ffffffffc0203852:	69c2                	ld	s3,16(sp)
ffffffffc0203854:	6145                	addi	sp,sp,48
ffffffffc0203856:	8082                	ret
ffffffffc0203858:	70a2                	ld	ra,40(sp)
ffffffffc020385a:	7482                	ld	s1,32(sp)
ffffffffc020385c:	6962                	ld	s2,24(sp)
ffffffffc020385e:	69c2                	ld	s3,16(sp)
ffffffffc0203860:	6145                	addi	sp,sp,48
ffffffffc0203862:	dd1fc06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0203866:	e42a                	sd	a0,8(sp)
ffffffffc0203868:	dd1fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc020386c:	6522                	ld	a0,8(sp)
ffffffffc020386e:	4985                	li	s3,1
ffffffffc0203870:	bf6d                	j	ffffffffc020382a <proc_run+0x24>

ffffffffc0203872 <find_proc>:
ffffffffc0203872:	6789                	lui	a5,0x2
ffffffffc0203874:	fff5071b          	addiw	a4,a0,-1
ffffffffc0203878:	17f9                	addi	a5,a5,-2
ffffffffc020387a:	04e7e063          	bltu	a5,a4,ffffffffc02038ba <find_proc+0x48>
ffffffffc020387e:	1141                	addi	sp,sp,-16
ffffffffc0203880:	e022                	sd	s0,0(sp)
ffffffffc0203882:	45a9                	li	a1,10
ffffffffc0203884:	842a                	mv	s0,a0
ffffffffc0203886:	2501                	sext.w	a0,a0
ffffffffc0203888:	e406                	sd	ra,8(sp)
ffffffffc020388a:	67a040ef          	jal	ra,ffffffffc0207f04 <hash32>
ffffffffc020388e:	02051693          	slli	a3,a0,0x20
ffffffffc0203892:	00012797          	auipc	a5,0x12
ffffffffc0203896:	bfe78793          	addi	a5,a5,-1026 # ffffffffc0215490 <hash_list>
ffffffffc020389a:	82f1                	srli	a3,a3,0x1c
ffffffffc020389c:	96be                	add	a3,a3,a5
ffffffffc020389e:	87b6                	mv	a5,a3
ffffffffc02038a0:	a029                	j	ffffffffc02038aa <find_proc+0x38>
ffffffffc02038a2:	f2c7a703          	lw	a4,-212(a5)
ffffffffc02038a6:	00870c63          	beq	a4,s0,ffffffffc02038be <find_proc+0x4c>
ffffffffc02038aa:	679c                	ld	a5,8(a5)
ffffffffc02038ac:	fef69be3          	bne	a3,a5,ffffffffc02038a2 <find_proc+0x30>
ffffffffc02038b0:	60a2                	ld	ra,8(sp)
ffffffffc02038b2:	6402                	ld	s0,0(sp)
ffffffffc02038b4:	4501                	li	a0,0
ffffffffc02038b6:	0141                	addi	sp,sp,16
ffffffffc02038b8:	8082                	ret
ffffffffc02038ba:	4501                	li	a0,0
ffffffffc02038bc:	8082                	ret
ffffffffc02038be:	60a2                	ld	ra,8(sp)
ffffffffc02038c0:	6402                	ld	s0,0(sp)
ffffffffc02038c2:	f2878513          	addi	a0,a5,-216
ffffffffc02038c6:	0141                	addi	sp,sp,16
ffffffffc02038c8:	8082                	ret

ffffffffc02038ca <do_fork>:
ffffffffc02038ca:	7159                	addi	sp,sp,-112
ffffffffc02038cc:	e4ce                	sd	s3,72(sp)
ffffffffc02038ce:	00016997          	auipc	s3,0x16
ffffffffc02038d2:	c4298993          	addi	s3,s3,-958 # ffffffffc0219510 <nr_process>
ffffffffc02038d6:	0009a703          	lw	a4,0(s3)
ffffffffc02038da:	f486                	sd	ra,104(sp)
ffffffffc02038dc:	f0a2                	sd	s0,96(sp)
ffffffffc02038de:	eca6                	sd	s1,88(sp)
ffffffffc02038e0:	e8ca                	sd	s2,80(sp)
ffffffffc02038e2:	e0d2                	sd	s4,64(sp)
ffffffffc02038e4:	fc56                	sd	s5,56(sp)
ffffffffc02038e6:	f85a                	sd	s6,48(sp)
ffffffffc02038e8:	f45e                	sd	s7,40(sp)
ffffffffc02038ea:	f062                	sd	s8,32(sp)
ffffffffc02038ec:	ec66                	sd	s9,24(sp)
ffffffffc02038ee:	e86a                	sd	s10,16(sp)
ffffffffc02038f0:	e46e                	sd	s11,8(sp)
ffffffffc02038f2:	6785                	lui	a5,0x1
ffffffffc02038f4:	30f75f63          	bge	a4,a5,ffffffffc0203c12 <do_fork+0x348>
ffffffffc02038f8:	8a2a                	mv	s4,a0
ffffffffc02038fa:	892e                	mv	s2,a1
ffffffffc02038fc:	84b2                	mv	s1,a2
ffffffffc02038fe:	dddff0ef          	jal	ra,ffffffffc02036da <alloc_proc>
ffffffffc0203902:	842a                	mv	s0,a0
ffffffffc0203904:	28050263          	beqz	a0,ffffffffc0203b88 <do_fork+0x2be>
ffffffffc0203908:	00016b97          	auipc	s7,0x16
ffffffffc020390c:	bf0b8b93          	addi	s7,s7,-1040 # ffffffffc02194f8 <current>
ffffffffc0203910:	000bb783          	ld	a5,0(s7)
ffffffffc0203914:	0ec7a703          	lw	a4,236(a5) # 10ec <kern_entry-0xffffffffc01fef14>
ffffffffc0203918:	f11c                	sd	a5,32(a0)
ffffffffc020391a:	30071c63          	bnez	a4,ffffffffc0203c32 <do_fork+0x368>
ffffffffc020391e:	4509                	li	a0,2
ffffffffc0203920:	dbffe0ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc0203924:	24050f63          	beqz	a0,ffffffffc0203b82 <do_fork+0x2b8>
ffffffffc0203928:	00016c17          	auipc	s8,0x16
ffffffffc020392c:	d18c0c13          	addi	s8,s8,-744 # ffffffffc0219640 <pages>
ffffffffc0203930:	000c3683          	ld	a3,0(s8)
ffffffffc0203934:	00007a97          	auipc	s5,0x7
ffffffffc0203938:	ce4aba83          	ld	s5,-796(s5) # ffffffffc020a618 <nbase>
ffffffffc020393c:	00016c97          	auipc	s9,0x16
ffffffffc0203940:	bb4c8c93          	addi	s9,s9,-1100 # ffffffffc02194f0 <npage>
ffffffffc0203944:	40d506b3          	sub	a3,a0,a3
ffffffffc0203948:	8699                	srai	a3,a3,0x6
ffffffffc020394a:	96d6                	add	a3,a3,s5
ffffffffc020394c:	000cb703          	ld	a4,0(s9)
ffffffffc0203950:	00c69793          	slli	a5,a3,0xc
ffffffffc0203954:	83b1                	srli	a5,a5,0xc
ffffffffc0203956:	06b2                	slli	a3,a3,0xc
ffffffffc0203958:	2ce7f163          	bgeu	a5,a4,ffffffffc0203c1a <do_fork+0x350>
ffffffffc020395c:	000bb703          	ld	a4,0(s7)
ffffffffc0203960:	00016d17          	auipc	s10,0x16
ffffffffc0203964:	cd0d0d13          	addi	s10,s10,-816 # ffffffffc0219630 <va_pa_offset>
ffffffffc0203968:	000d3783          	ld	a5,0(s10)
ffffffffc020396c:	02873b03          	ld	s6,40(a4)
ffffffffc0203970:	96be                	add	a3,a3,a5
ffffffffc0203972:	e814                	sd	a3,16(s0)
ffffffffc0203974:	020b0863          	beqz	s6,ffffffffc02039a4 <do_fork+0xda>
ffffffffc0203978:	100a7a13          	andi	s4,s4,256
ffffffffc020397c:	1c0a0163          	beqz	s4,ffffffffc0203b3e <do_fork+0x274>
ffffffffc0203980:	030b2703          	lw	a4,48(s6)
ffffffffc0203984:	018b3783          	ld	a5,24(s6)
ffffffffc0203988:	c02006b7          	lui	a3,0xc0200
ffffffffc020398c:	2705                	addiw	a4,a4,1
ffffffffc020398e:	02eb2823          	sw	a4,48(s6)
ffffffffc0203992:	03643423          	sd	s6,40(s0)
ffffffffc0203996:	2ad7ee63          	bltu	a5,a3,ffffffffc0203c52 <do_fork+0x388>
ffffffffc020399a:	000d3703          	ld	a4,0(s10)
ffffffffc020399e:	6814                	ld	a3,16(s0)
ffffffffc02039a0:	8f99                	sub	a5,a5,a4
ffffffffc02039a2:	f45c                	sd	a5,168(s0)
ffffffffc02039a4:	6789                	lui	a5,0x2
ffffffffc02039a6:	ee078793          	addi	a5,a5,-288 # 1ee0 <kern_entry-0xffffffffc01fe120>
ffffffffc02039aa:	97b6                	add	a5,a5,a3
ffffffffc02039ac:	8626                	mv	a2,s1
ffffffffc02039ae:	f05c                	sd	a5,160(s0)
ffffffffc02039b0:	873e                	mv	a4,a5
ffffffffc02039b2:	12048313          	addi	t1,s1,288
ffffffffc02039b6:	00063883          	ld	a7,0(a2)
ffffffffc02039ba:	00863803          	ld	a6,8(a2)
ffffffffc02039be:	6a08                	ld	a0,16(a2)
ffffffffc02039c0:	6e0c                	ld	a1,24(a2)
ffffffffc02039c2:	01173023          	sd	a7,0(a4)
ffffffffc02039c6:	01073423          	sd	a6,8(a4)
ffffffffc02039ca:	eb08                	sd	a0,16(a4)
ffffffffc02039cc:	ef0c                	sd	a1,24(a4)
ffffffffc02039ce:	02060613          	addi	a2,a2,32
ffffffffc02039d2:	02070713          	addi	a4,a4,32
ffffffffc02039d6:	fe6610e3          	bne	a2,t1,ffffffffc02039b6 <do_fork+0xec>
ffffffffc02039da:	0407b823          	sd	zero,80(a5)
ffffffffc02039de:	12090a63          	beqz	s2,ffffffffc0203b12 <do_fork+0x248>
ffffffffc02039e2:	0127b823          	sd	s2,16(a5)
ffffffffc02039e6:	00000717          	auipc	a4,0x0
ffffffffc02039ea:	d6670713          	addi	a4,a4,-666 # ffffffffc020374c <forkret>
ffffffffc02039ee:	f818                	sd	a4,48(s0)
ffffffffc02039f0:	fc1c                	sd	a5,56(s0)
ffffffffc02039f2:	100027f3          	csrr	a5,sstatus
ffffffffc02039f6:	8b89                	andi	a5,a5,2
ffffffffc02039f8:	4901                	li	s2,0
ffffffffc02039fa:	12079e63          	bnez	a5,ffffffffc0203b36 <do_fork+0x26c>
ffffffffc02039fe:	0000a597          	auipc	a1,0xa
ffffffffc0203a02:	68a58593          	addi	a1,a1,1674 # ffffffffc020e088 <last_pid.1812>
ffffffffc0203a06:	419c                	lw	a5,0(a1)
ffffffffc0203a08:	6709                	lui	a4,0x2
ffffffffc0203a0a:	0017851b          	addiw	a0,a5,1
ffffffffc0203a0e:	c188                	sw	a0,0(a1)
ffffffffc0203a10:	08e55b63          	bge	a0,a4,ffffffffc0203aa6 <do_fork+0x1dc>
ffffffffc0203a14:	0000a897          	auipc	a7,0xa
ffffffffc0203a18:	67888893          	addi	a7,a7,1656 # ffffffffc020e08c <next_safe.1811>
ffffffffc0203a1c:	0008a783          	lw	a5,0(a7)
ffffffffc0203a20:	00016497          	auipc	s1,0x16
ffffffffc0203a24:	d1848493          	addi	s1,s1,-744 # ffffffffc0219738 <proc_list>
ffffffffc0203a28:	08f55663          	bge	a0,a5,ffffffffc0203ab4 <do_fork+0x1ea>
ffffffffc0203a2c:	c048                	sw	a0,4(s0)
ffffffffc0203a2e:	45a9                	li	a1,10
ffffffffc0203a30:	2501                	sext.w	a0,a0
ffffffffc0203a32:	4d2040ef          	jal	ra,ffffffffc0207f04 <hash32>
ffffffffc0203a36:	1502                	slli	a0,a0,0x20
ffffffffc0203a38:	00012797          	auipc	a5,0x12
ffffffffc0203a3c:	a5878793          	addi	a5,a5,-1448 # ffffffffc0215490 <hash_list>
ffffffffc0203a40:	8171                	srli	a0,a0,0x1c
ffffffffc0203a42:	953e                	add	a0,a0,a5
ffffffffc0203a44:	650c                	ld	a1,8(a0)
ffffffffc0203a46:	7014                	ld	a3,32(s0)
ffffffffc0203a48:	0d840793          	addi	a5,s0,216
ffffffffc0203a4c:	e19c                	sd	a5,0(a1)
ffffffffc0203a4e:	6490                	ld	a2,8(s1)
ffffffffc0203a50:	e51c                	sd	a5,8(a0)
ffffffffc0203a52:	7af8                	ld	a4,240(a3)
ffffffffc0203a54:	0c840793          	addi	a5,s0,200
ffffffffc0203a58:	f06c                	sd	a1,224(s0)
ffffffffc0203a5a:	ec68                	sd	a0,216(s0)
ffffffffc0203a5c:	e21c                	sd	a5,0(a2)
ffffffffc0203a5e:	e49c                	sd	a5,8(s1)
ffffffffc0203a60:	e870                	sd	a2,208(s0)
ffffffffc0203a62:	e464                	sd	s1,200(s0)
ffffffffc0203a64:	0e043c23          	sd	zero,248(s0)
ffffffffc0203a68:	10e43023          	sd	a4,256(s0)
ffffffffc0203a6c:	c311                	beqz	a4,ffffffffc0203a70 <do_fork+0x1a6>
ffffffffc0203a6e:	ff60                	sd	s0,248(a4)
ffffffffc0203a70:	0009a783          	lw	a5,0(s3)
ffffffffc0203a74:	fae0                	sd	s0,240(a3)
ffffffffc0203a76:	2785                	addiw	a5,a5,1
ffffffffc0203a78:	00f9a023          	sw	a5,0(s3)
ffffffffc0203a7c:	10091863          	bnez	s2,ffffffffc0203b8c <do_fork+0x2c2>
ffffffffc0203a80:	8522                	mv	a0,s0
ffffffffc0203a82:	733000ef          	jal	ra,ffffffffc02049b4 <wakeup_proc>
ffffffffc0203a86:	4048                	lw	a0,4(s0)
ffffffffc0203a88:	70a6                	ld	ra,104(sp)
ffffffffc0203a8a:	7406                	ld	s0,96(sp)
ffffffffc0203a8c:	64e6                	ld	s1,88(sp)
ffffffffc0203a8e:	6946                	ld	s2,80(sp)
ffffffffc0203a90:	69a6                	ld	s3,72(sp)
ffffffffc0203a92:	6a06                	ld	s4,64(sp)
ffffffffc0203a94:	7ae2                	ld	s5,56(sp)
ffffffffc0203a96:	7b42                	ld	s6,48(sp)
ffffffffc0203a98:	7ba2                	ld	s7,40(sp)
ffffffffc0203a9a:	7c02                	ld	s8,32(sp)
ffffffffc0203a9c:	6ce2                	ld	s9,24(sp)
ffffffffc0203a9e:	6d42                	ld	s10,16(sp)
ffffffffc0203aa0:	6da2                	ld	s11,8(sp)
ffffffffc0203aa2:	6165                	addi	sp,sp,112
ffffffffc0203aa4:	8082                	ret
ffffffffc0203aa6:	4785                	li	a5,1
ffffffffc0203aa8:	c19c                	sw	a5,0(a1)
ffffffffc0203aaa:	4505                	li	a0,1
ffffffffc0203aac:	0000a897          	auipc	a7,0xa
ffffffffc0203ab0:	5e088893          	addi	a7,a7,1504 # ffffffffc020e08c <next_safe.1811>
ffffffffc0203ab4:	00016497          	auipc	s1,0x16
ffffffffc0203ab8:	c8448493          	addi	s1,s1,-892 # ffffffffc0219738 <proc_list>
ffffffffc0203abc:	0084b303          	ld	t1,8(s1)
ffffffffc0203ac0:	6789                	lui	a5,0x2
ffffffffc0203ac2:	00f8a023          	sw	a5,0(a7)
ffffffffc0203ac6:	4801                	li	a6,0
ffffffffc0203ac8:	87aa                	mv	a5,a0
ffffffffc0203aca:	6e89                	lui	t4,0x2
ffffffffc0203acc:	12930e63          	beq	t1,s1,ffffffffc0203c08 <do_fork+0x33e>
ffffffffc0203ad0:	8e42                	mv	t3,a6
ffffffffc0203ad2:	869a                	mv	a3,t1
ffffffffc0203ad4:	6609                	lui	a2,0x2
ffffffffc0203ad6:	a811                	j	ffffffffc0203aea <do_fork+0x220>
ffffffffc0203ad8:	00e7d663          	bge	a5,a4,ffffffffc0203ae4 <do_fork+0x21a>
ffffffffc0203adc:	00c75463          	bge	a4,a2,ffffffffc0203ae4 <do_fork+0x21a>
ffffffffc0203ae0:	863a                	mv	a2,a4
ffffffffc0203ae2:	4e05                	li	t3,1
ffffffffc0203ae4:	6694                	ld	a3,8(a3)
ffffffffc0203ae6:	00968d63          	beq	a3,s1,ffffffffc0203b00 <do_fork+0x236>
ffffffffc0203aea:	f3c6a703          	lw	a4,-196(a3) # ffffffffc01fff3c <kern_entry-0xc4>
ffffffffc0203aee:	fef715e3          	bne	a4,a5,ffffffffc0203ad8 <do_fork+0x20e>
ffffffffc0203af2:	2785                	addiw	a5,a5,1
ffffffffc0203af4:	08c7df63          	bge	a5,a2,ffffffffc0203b92 <do_fork+0x2c8>
ffffffffc0203af8:	6694                	ld	a3,8(a3)
ffffffffc0203afa:	4805                	li	a6,1
ffffffffc0203afc:	fe9697e3          	bne	a3,s1,ffffffffc0203aea <do_fork+0x220>
ffffffffc0203b00:	00080463          	beqz	a6,ffffffffc0203b08 <do_fork+0x23e>
ffffffffc0203b04:	c19c                	sw	a5,0(a1)
ffffffffc0203b06:	853e                	mv	a0,a5
ffffffffc0203b08:	f20e02e3          	beqz	t3,ffffffffc0203a2c <do_fork+0x162>
ffffffffc0203b0c:	00c8a023          	sw	a2,0(a7)
ffffffffc0203b10:	bf31                	j	ffffffffc0203a2c <do_fork+0x162>
ffffffffc0203b12:	6909                	lui	s2,0x2
ffffffffc0203b14:	edc90913          	addi	s2,s2,-292 # 1edc <kern_entry-0xffffffffc01fe124>
ffffffffc0203b18:	9936                	add	s2,s2,a3
ffffffffc0203b1a:	0127b823          	sd	s2,16(a5) # 2010 <kern_entry-0xffffffffc01fdff0>
ffffffffc0203b1e:	00000717          	auipc	a4,0x0
ffffffffc0203b22:	c2e70713          	addi	a4,a4,-978 # ffffffffc020374c <forkret>
ffffffffc0203b26:	f818                	sd	a4,48(s0)
ffffffffc0203b28:	fc1c                	sd	a5,56(s0)
ffffffffc0203b2a:	100027f3          	csrr	a5,sstatus
ffffffffc0203b2e:	8b89                	andi	a5,a5,2
ffffffffc0203b30:	4901                	li	s2,0
ffffffffc0203b32:	ec0786e3          	beqz	a5,ffffffffc02039fe <do_fork+0x134>
ffffffffc0203b36:	b03fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203b3a:	4905                	li	s2,1
ffffffffc0203b3c:	b5c9                	j	ffffffffc02039fe <do_fork+0x134>
ffffffffc0203b3e:	a14fd0ef          	jal	ra,ffffffffc0200d52 <mm_create>
ffffffffc0203b42:	8a2a                	mv	s4,a0
ffffffffc0203b44:	c901                	beqz	a0,ffffffffc0203b54 <do_fork+0x28a>
ffffffffc0203b46:	0561                	addi	a0,a0,24
ffffffffc0203b48:	c13ff0ef          	jal	ra,ffffffffc020375a <setup_pgdir.isra.0>
ffffffffc0203b4c:	c921                	beqz	a0,ffffffffc0203b9c <do_fork+0x2d2>
ffffffffc0203b4e:	8552                	mv	a0,s4
ffffffffc0203b50:	b60fd0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0203b54:	6814                	ld	a3,16(s0)
ffffffffc0203b56:	c02007b7          	lui	a5,0xc0200
ffffffffc0203b5a:	12f6e563          	bltu	a3,a5,ffffffffc0203c84 <do_fork+0x3ba>
ffffffffc0203b5e:	000d3783          	ld	a5,0(s10)
ffffffffc0203b62:	000cb703          	ld	a4,0(s9)
ffffffffc0203b66:	40f687b3          	sub	a5,a3,a5
ffffffffc0203b6a:	83b1                	srli	a5,a5,0xc
ffffffffc0203b6c:	10e7f063          	bgeu	a5,a4,ffffffffc0203c6c <do_fork+0x3a2>
ffffffffc0203b70:	000c3503          	ld	a0,0(s8)
ffffffffc0203b74:	415787b3          	sub	a5,a5,s5
ffffffffc0203b78:	079a                	slli	a5,a5,0x6
ffffffffc0203b7a:	4589                	li	a1,2
ffffffffc0203b7c:	953e                	add	a0,a0,a5
ffffffffc0203b7e:	bf3fe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203b82:	8522                	mv	a0,s0
ffffffffc0203b84:	bb7fd0ef          	jal	ra,ffffffffc020173a <kfree>
ffffffffc0203b88:	5571                	li	a0,-4
ffffffffc0203b8a:	bdfd                	j	ffffffffc0203a88 <do_fork+0x1be>
ffffffffc0203b8c:	aa7fc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203b90:	bdc5                	j	ffffffffc0203a80 <do_fork+0x1b6>
ffffffffc0203b92:	01d7c363          	blt	a5,t4,ffffffffc0203b98 <do_fork+0x2ce>
ffffffffc0203b96:	4785                	li	a5,1
ffffffffc0203b98:	4805                	li	a6,1
ffffffffc0203b9a:	bf0d                	j	ffffffffc0203acc <do_fork+0x202>
ffffffffc0203b9c:	038b0d93          	addi	s11,s6,56
ffffffffc0203ba0:	856e                	mv	a0,s11
ffffffffc0203ba2:	941ff0ef          	jal	ra,ffffffffc02034e2 <down>
ffffffffc0203ba6:	000bb783          	ld	a5,0(s7)
ffffffffc0203baa:	c781                	beqz	a5,ffffffffc0203bb2 <do_fork+0x2e8>
ffffffffc0203bac:	43dc                	lw	a5,4(a5)
ffffffffc0203bae:	04fb2823          	sw	a5,80(s6)
ffffffffc0203bb2:	85da                	mv	a1,s6
ffffffffc0203bb4:	8552                	mv	a0,s4
ffffffffc0203bb6:	bfcfd0ef          	jal	ra,ffffffffc0200fb2 <dup_mmap>
ffffffffc0203bba:	8baa                	mv	s7,a0
ffffffffc0203bbc:	856e                	mv	a0,s11
ffffffffc0203bbe:	923ff0ef          	jal	ra,ffffffffc02034e0 <up>
ffffffffc0203bc2:	040b2823          	sw	zero,80(s6)
ffffffffc0203bc6:	8b52                	mv	s6,s4
ffffffffc0203bc8:	da0b8ce3          	beqz	s7,ffffffffc0203980 <do_fork+0xb6>
ffffffffc0203bcc:	8552                	mv	a0,s4
ffffffffc0203bce:	c7efd0ef          	jal	ra,ffffffffc020104c <exit_mmap>
ffffffffc0203bd2:	018a3683          	ld	a3,24(s4)
ffffffffc0203bd6:	c02007b7          	lui	a5,0xc0200
ffffffffc0203bda:	0af6e563          	bltu	a3,a5,ffffffffc0203c84 <do_fork+0x3ba>
ffffffffc0203bde:	000d3703          	ld	a4,0(s10)
ffffffffc0203be2:	000cb783          	ld	a5,0(s9)
ffffffffc0203be6:	8e99                	sub	a3,a3,a4
ffffffffc0203be8:	82b1                	srli	a3,a3,0xc
ffffffffc0203bea:	08f6f163          	bgeu	a3,a5,ffffffffc0203c6c <do_fork+0x3a2>
ffffffffc0203bee:	000c3503          	ld	a0,0(s8)
ffffffffc0203bf2:	415686b3          	sub	a3,a3,s5
ffffffffc0203bf6:	069a                	slli	a3,a3,0x6
ffffffffc0203bf8:	9536                	add	a0,a0,a3
ffffffffc0203bfa:	4585                	li	a1,1
ffffffffc0203bfc:	b75fe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203c00:	8552                	mv	a0,s4
ffffffffc0203c02:	aaefd0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0203c06:	b7b9                	j	ffffffffc0203b54 <do_fork+0x28a>
ffffffffc0203c08:	00080763          	beqz	a6,ffffffffc0203c16 <do_fork+0x34c>
ffffffffc0203c0c:	c19c                	sw	a5,0(a1)
ffffffffc0203c0e:	853e                	mv	a0,a5
ffffffffc0203c10:	bd31                	j	ffffffffc0203a2c <do_fork+0x162>
ffffffffc0203c12:	556d                	li	a0,-5
ffffffffc0203c14:	bd95                	j	ffffffffc0203a88 <do_fork+0x1be>
ffffffffc0203c16:	4188                	lw	a0,0(a1)
ffffffffc0203c18:	bd11                	j	ffffffffc0203a2c <do_fork+0x162>
ffffffffc0203c1a:	00005617          	auipc	a2,0x5
ffffffffc0203c1e:	f9660613          	addi	a2,a2,-106 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc0203c22:	06900593          	li	a1,105
ffffffffc0203c26:	00005517          	auipc	a0,0x5
ffffffffc0203c2a:	fb250513          	addi	a0,a0,-78 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0203c2e:	ddafc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203c32:	00006697          	auipc	a3,0x6
ffffffffc0203c36:	92668693          	addi	a3,a3,-1754 # ffffffffc0209558 <default_pmm_manager+0x368>
ffffffffc0203c3a:	00005617          	auipc	a2,0x5
ffffffffc0203c3e:	99660613          	addi	a2,a2,-1642 # ffffffffc02085d0 <commands+0x410>
ffffffffc0203c42:	1a600593          	li	a1,422
ffffffffc0203c46:	00006517          	auipc	a0,0x6
ffffffffc0203c4a:	93250513          	addi	a0,a0,-1742 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0203c4e:	dbafc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203c52:	86be                	mv	a3,a5
ffffffffc0203c54:	00005617          	auipc	a2,0x5
ffffffffc0203c58:	fcc60613          	addi	a2,a2,-52 # ffffffffc0208c20 <commands+0xa60>
ffffffffc0203c5c:	15900593          	li	a1,345
ffffffffc0203c60:	00006517          	auipc	a0,0x6
ffffffffc0203c64:	91850513          	addi	a0,a0,-1768 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0203c68:	da0fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203c6c:	00005617          	auipc	a2,0x5
ffffffffc0203c70:	fdc60613          	addi	a2,a2,-36 # ffffffffc0208c48 <commands+0xa88>
ffffffffc0203c74:	06200593          	li	a1,98
ffffffffc0203c78:	00005517          	auipc	a0,0x5
ffffffffc0203c7c:	f6050513          	addi	a0,a0,-160 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0203c80:	d88fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203c84:	00005617          	auipc	a2,0x5
ffffffffc0203c88:	f9c60613          	addi	a2,a2,-100 # ffffffffc0208c20 <commands+0xa60>
ffffffffc0203c8c:	06e00593          	li	a1,110
ffffffffc0203c90:	00005517          	auipc	a0,0x5
ffffffffc0203c94:	f4850513          	addi	a0,a0,-184 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0203c98:	d70fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203c9c <kernel_thread>:
ffffffffc0203c9c:	7129                	addi	sp,sp,-320
ffffffffc0203c9e:	fa22                	sd	s0,304(sp)
ffffffffc0203ca0:	f626                	sd	s1,296(sp)
ffffffffc0203ca2:	f24a                	sd	s2,288(sp)
ffffffffc0203ca4:	84ae                	mv	s1,a1
ffffffffc0203ca6:	892a                	mv	s2,a0
ffffffffc0203ca8:	8432                	mv	s0,a2
ffffffffc0203caa:	4581                	li	a1,0
ffffffffc0203cac:	12000613          	li	a2,288
ffffffffc0203cb0:	850a                	mv	a0,sp
ffffffffc0203cb2:	fe06                	sd	ra,312(sp)
ffffffffc0203cb4:	639030ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc0203cb8:	e0ca                	sd	s2,64(sp)
ffffffffc0203cba:	e4a6                	sd	s1,72(sp)
ffffffffc0203cbc:	100027f3          	csrr	a5,sstatus
ffffffffc0203cc0:	edd7f793          	andi	a5,a5,-291
ffffffffc0203cc4:	1207e793          	ori	a5,a5,288
ffffffffc0203cc8:	e23e                	sd	a5,256(sp)
ffffffffc0203cca:	860a                	mv	a2,sp
ffffffffc0203ccc:	10046513          	ori	a0,s0,256
ffffffffc0203cd0:	00000797          	auipc	a5,0x0
ffffffffc0203cd4:	a0278793          	addi	a5,a5,-1534 # ffffffffc02036d2 <kernel_thread_entry>
ffffffffc0203cd8:	4581                	li	a1,0
ffffffffc0203cda:	e63e                	sd	a5,264(sp)
ffffffffc0203cdc:	befff0ef          	jal	ra,ffffffffc02038ca <do_fork>
ffffffffc0203ce0:	70f2                	ld	ra,312(sp)
ffffffffc0203ce2:	7452                	ld	s0,304(sp)
ffffffffc0203ce4:	74b2                	ld	s1,296(sp)
ffffffffc0203ce6:	7912                	ld	s2,288(sp)
ffffffffc0203ce8:	6131                	addi	sp,sp,320
ffffffffc0203cea:	8082                	ret

ffffffffc0203cec <do_exit>:
ffffffffc0203cec:	7179                	addi	sp,sp,-48
ffffffffc0203cee:	f022                	sd	s0,32(sp)
ffffffffc0203cf0:	00016417          	auipc	s0,0x16
ffffffffc0203cf4:	80840413          	addi	s0,s0,-2040 # ffffffffc02194f8 <current>
ffffffffc0203cf8:	601c                	ld	a5,0(s0)
ffffffffc0203cfa:	f406                	sd	ra,40(sp)
ffffffffc0203cfc:	ec26                	sd	s1,24(sp)
ffffffffc0203cfe:	e84a                	sd	s2,16(sp)
ffffffffc0203d00:	e44e                	sd	s3,8(sp)
ffffffffc0203d02:	e052                	sd	s4,0(sp)
ffffffffc0203d04:	00015717          	auipc	a4,0x15
ffffffffc0203d08:	7fc73703          	ld	a4,2044(a4) # ffffffffc0219500 <idleproc>
ffffffffc0203d0c:	0ce78d63          	beq	a5,a4,ffffffffc0203de6 <do_exit+0xfa>
ffffffffc0203d10:	00015497          	auipc	s1,0x15
ffffffffc0203d14:	7f848493          	addi	s1,s1,2040 # ffffffffc0219508 <initproc>
ffffffffc0203d18:	6098                	ld	a4,0(s1)
ffffffffc0203d1a:	12e78963          	beq	a5,a4,ffffffffc0203e4c <do_exit+0x160>
ffffffffc0203d1e:	0287b903          	ld	s2,40(a5)
ffffffffc0203d22:	89aa                	mv	s3,a0
ffffffffc0203d24:	02090663          	beqz	s2,ffffffffc0203d50 <do_exit+0x64>
ffffffffc0203d28:	00016797          	auipc	a5,0x16
ffffffffc0203d2c:	9107b783          	ld	a5,-1776(a5) # ffffffffc0219638 <boot_cr3>
ffffffffc0203d30:	577d                	li	a4,-1
ffffffffc0203d32:	177e                	slli	a4,a4,0x3f
ffffffffc0203d34:	83b1                	srli	a5,a5,0xc
ffffffffc0203d36:	8fd9                	or	a5,a5,a4
ffffffffc0203d38:	18079073          	csrw	satp,a5
ffffffffc0203d3c:	03092783          	lw	a5,48(s2)
ffffffffc0203d40:	fff7871b          	addiw	a4,a5,-1
ffffffffc0203d44:	02e92823          	sw	a4,48(s2)
ffffffffc0203d48:	cb5d                	beqz	a4,ffffffffc0203dfe <do_exit+0x112>
ffffffffc0203d4a:	601c                	ld	a5,0(s0)
ffffffffc0203d4c:	0207b423          	sd	zero,40(a5)
ffffffffc0203d50:	601c                	ld	a5,0(s0)
ffffffffc0203d52:	470d                	li	a4,3
ffffffffc0203d54:	c398                	sw	a4,0(a5)
ffffffffc0203d56:	0f37a423          	sw	s3,232(a5)
ffffffffc0203d5a:	100027f3          	csrr	a5,sstatus
ffffffffc0203d5e:	8b89                	andi	a5,a5,2
ffffffffc0203d60:	4a01                	li	s4,0
ffffffffc0203d62:	10079163          	bnez	a5,ffffffffc0203e64 <do_exit+0x178>
ffffffffc0203d66:	6018                	ld	a4,0(s0)
ffffffffc0203d68:	800007b7          	lui	a5,0x80000
ffffffffc0203d6c:	0785                	addi	a5,a5,1
ffffffffc0203d6e:	7308                	ld	a0,32(a4)
ffffffffc0203d70:	0ec52703          	lw	a4,236(a0)
ffffffffc0203d74:	0ef70c63          	beq	a4,a5,ffffffffc0203e6c <do_exit+0x180>
ffffffffc0203d78:	6018                	ld	a4,0(s0)
ffffffffc0203d7a:	7b7c                	ld	a5,240(a4)
ffffffffc0203d7c:	c3a1                	beqz	a5,ffffffffc0203dbc <do_exit+0xd0>
ffffffffc0203d7e:	800009b7          	lui	s3,0x80000
ffffffffc0203d82:	490d                	li	s2,3
ffffffffc0203d84:	0985                	addi	s3,s3,1
ffffffffc0203d86:	a021                	j	ffffffffc0203d8e <do_exit+0xa2>
ffffffffc0203d88:	6018                	ld	a4,0(s0)
ffffffffc0203d8a:	7b7c                	ld	a5,240(a4)
ffffffffc0203d8c:	cb85                	beqz	a5,ffffffffc0203dbc <do_exit+0xd0>
ffffffffc0203d8e:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <kern_entry-0x401fff00>
ffffffffc0203d92:	6088                	ld	a0,0(s1)
ffffffffc0203d94:	fb74                	sd	a3,240(a4)
ffffffffc0203d96:	7978                	ld	a4,240(a0)
ffffffffc0203d98:	0e07bc23          	sd	zero,248(a5)
ffffffffc0203d9c:	10e7b023          	sd	a4,256(a5)
ffffffffc0203da0:	c311                	beqz	a4,ffffffffc0203da4 <do_exit+0xb8>
ffffffffc0203da2:	ff7c                	sd	a5,248(a4)
ffffffffc0203da4:	4398                	lw	a4,0(a5)
ffffffffc0203da6:	f388                	sd	a0,32(a5)
ffffffffc0203da8:	f97c                	sd	a5,240(a0)
ffffffffc0203daa:	fd271fe3          	bne	a4,s2,ffffffffc0203d88 <do_exit+0x9c>
ffffffffc0203dae:	0ec52783          	lw	a5,236(a0)
ffffffffc0203db2:	fd379be3          	bne	a5,s3,ffffffffc0203d88 <do_exit+0x9c>
ffffffffc0203db6:	3ff000ef          	jal	ra,ffffffffc02049b4 <wakeup_proc>
ffffffffc0203dba:	b7f9                	j	ffffffffc0203d88 <do_exit+0x9c>
ffffffffc0203dbc:	020a1263          	bnez	s4,ffffffffc0203de0 <do_exit+0xf4>
ffffffffc0203dc0:	4a7000ef          	jal	ra,ffffffffc0204a66 <schedule>
ffffffffc0203dc4:	601c                	ld	a5,0(s0)
ffffffffc0203dc6:	00005617          	auipc	a2,0x5
ffffffffc0203dca:	7ea60613          	addi	a2,a2,2026 # ffffffffc02095b0 <default_pmm_manager+0x3c0>
ffffffffc0203dce:	1f900593          	li	a1,505
ffffffffc0203dd2:	43d4                	lw	a3,4(a5)
ffffffffc0203dd4:	00005517          	auipc	a0,0x5
ffffffffc0203dd8:	7a450513          	addi	a0,a0,1956 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0203ddc:	c2cfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203de0:	853fc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203de4:	bff1                	j	ffffffffc0203dc0 <do_exit+0xd4>
ffffffffc0203de6:	00005617          	auipc	a2,0x5
ffffffffc0203dea:	7aa60613          	addi	a2,a2,1962 # ffffffffc0209590 <default_pmm_manager+0x3a0>
ffffffffc0203dee:	1cd00593          	li	a1,461
ffffffffc0203df2:	00005517          	auipc	a0,0x5
ffffffffc0203df6:	78650513          	addi	a0,a0,1926 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0203dfa:	c0efc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203dfe:	854a                	mv	a0,s2
ffffffffc0203e00:	a4cfd0ef          	jal	ra,ffffffffc020104c <exit_mmap>
ffffffffc0203e04:	01893683          	ld	a3,24(s2)
ffffffffc0203e08:	c02007b7          	lui	a5,0xc0200
ffffffffc0203e0c:	06f6e363          	bltu	a3,a5,ffffffffc0203e72 <do_exit+0x186>
ffffffffc0203e10:	00016797          	auipc	a5,0x16
ffffffffc0203e14:	8207b783          	ld	a5,-2016(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc0203e18:	8e9d                	sub	a3,a3,a5
ffffffffc0203e1a:	82b1                	srli	a3,a3,0xc
ffffffffc0203e1c:	00015797          	auipc	a5,0x15
ffffffffc0203e20:	6d47b783          	ld	a5,1748(a5) # ffffffffc02194f0 <npage>
ffffffffc0203e24:	06f6f363          	bgeu	a3,a5,ffffffffc0203e8a <do_exit+0x19e>
ffffffffc0203e28:	00006517          	auipc	a0,0x6
ffffffffc0203e2c:	7f053503          	ld	a0,2032(a0) # ffffffffc020a618 <nbase>
ffffffffc0203e30:	8e89                	sub	a3,a3,a0
ffffffffc0203e32:	069a                	slli	a3,a3,0x6
ffffffffc0203e34:	00016517          	auipc	a0,0x16
ffffffffc0203e38:	80c53503          	ld	a0,-2036(a0) # ffffffffc0219640 <pages>
ffffffffc0203e3c:	9536                	add	a0,a0,a3
ffffffffc0203e3e:	4585                	li	a1,1
ffffffffc0203e40:	931fe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203e44:	854a                	mv	a0,s2
ffffffffc0203e46:	86afd0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0203e4a:	b701                	j	ffffffffc0203d4a <do_exit+0x5e>
ffffffffc0203e4c:	00005617          	auipc	a2,0x5
ffffffffc0203e50:	75460613          	addi	a2,a2,1876 # ffffffffc02095a0 <default_pmm_manager+0x3b0>
ffffffffc0203e54:	1d000593          	li	a1,464
ffffffffc0203e58:	00005517          	auipc	a0,0x5
ffffffffc0203e5c:	72050513          	addi	a0,a0,1824 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0203e60:	ba8fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203e64:	fd4fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203e68:	4a05                	li	s4,1
ffffffffc0203e6a:	bdf5                	j	ffffffffc0203d66 <do_exit+0x7a>
ffffffffc0203e6c:	349000ef          	jal	ra,ffffffffc02049b4 <wakeup_proc>
ffffffffc0203e70:	b721                	j	ffffffffc0203d78 <do_exit+0x8c>
ffffffffc0203e72:	00005617          	auipc	a2,0x5
ffffffffc0203e76:	dae60613          	addi	a2,a2,-594 # ffffffffc0208c20 <commands+0xa60>
ffffffffc0203e7a:	06e00593          	li	a1,110
ffffffffc0203e7e:	00005517          	auipc	a0,0x5
ffffffffc0203e82:	d5a50513          	addi	a0,a0,-678 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0203e86:	b82fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203e8a:	00005617          	auipc	a2,0x5
ffffffffc0203e8e:	dbe60613          	addi	a2,a2,-578 # ffffffffc0208c48 <commands+0xa88>
ffffffffc0203e92:	06200593          	li	a1,98
ffffffffc0203e96:	00005517          	auipc	a0,0x5
ffffffffc0203e9a:	d4250513          	addi	a0,a0,-702 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0203e9e:	b6afc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203ea2 <do_wait.part.0>:
ffffffffc0203ea2:	7139                	addi	sp,sp,-64
ffffffffc0203ea4:	e852                	sd	s4,16(sp)
ffffffffc0203ea6:	80000a37          	lui	s4,0x80000
ffffffffc0203eaa:	f426                	sd	s1,40(sp)
ffffffffc0203eac:	f04a                	sd	s2,32(sp)
ffffffffc0203eae:	ec4e                	sd	s3,24(sp)
ffffffffc0203eb0:	e456                	sd	s5,8(sp)
ffffffffc0203eb2:	e05a                	sd	s6,0(sp)
ffffffffc0203eb4:	fc06                	sd	ra,56(sp)
ffffffffc0203eb6:	f822                	sd	s0,48(sp)
ffffffffc0203eb8:	892a                	mv	s2,a0
ffffffffc0203eba:	8aae                	mv	s5,a1
ffffffffc0203ebc:	00015997          	auipc	s3,0x15
ffffffffc0203ec0:	63c98993          	addi	s3,s3,1596 # ffffffffc02194f8 <current>
ffffffffc0203ec4:	448d                	li	s1,3
ffffffffc0203ec6:	4b05                	li	s6,1
ffffffffc0203ec8:	2a05                	addiw	s4,s4,1
ffffffffc0203eca:	02090f63          	beqz	s2,ffffffffc0203f08 <do_wait.part.0+0x66>
ffffffffc0203ece:	854a                	mv	a0,s2
ffffffffc0203ed0:	9a3ff0ef          	jal	ra,ffffffffc0203872 <find_proc>
ffffffffc0203ed4:	842a                	mv	s0,a0
ffffffffc0203ed6:	10050763          	beqz	a0,ffffffffc0203fe4 <do_wait.part.0+0x142>
ffffffffc0203eda:	0009b703          	ld	a4,0(s3)
ffffffffc0203ede:	711c                	ld	a5,32(a0)
ffffffffc0203ee0:	10e79263          	bne	a5,a4,ffffffffc0203fe4 <do_wait.part.0+0x142>
ffffffffc0203ee4:	411c                	lw	a5,0(a0)
ffffffffc0203ee6:	02978c63          	beq	a5,s1,ffffffffc0203f1e <do_wait.part.0+0x7c>
ffffffffc0203eea:	01672023          	sw	s6,0(a4)
ffffffffc0203eee:	0f472623          	sw	s4,236(a4)
ffffffffc0203ef2:	375000ef          	jal	ra,ffffffffc0204a66 <schedule>
ffffffffc0203ef6:	0009b783          	ld	a5,0(s3)
ffffffffc0203efa:	0b07a783          	lw	a5,176(a5)
ffffffffc0203efe:	8b85                	andi	a5,a5,1
ffffffffc0203f00:	d7e9                	beqz	a5,ffffffffc0203eca <do_wait.part.0+0x28>
ffffffffc0203f02:	555d                	li	a0,-9
ffffffffc0203f04:	de9ff0ef          	jal	ra,ffffffffc0203cec <do_exit>
ffffffffc0203f08:	0009b703          	ld	a4,0(s3)
ffffffffc0203f0c:	7b60                	ld	s0,240(a4)
ffffffffc0203f0e:	e409                	bnez	s0,ffffffffc0203f18 <do_wait.part.0+0x76>
ffffffffc0203f10:	a8d1                	j	ffffffffc0203fe4 <do_wait.part.0+0x142>
ffffffffc0203f12:	10043403          	ld	s0,256(s0)
ffffffffc0203f16:	d871                	beqz	s0,ffffffffc0203eea <do_wait.part.0+0x48>
ffffffffc0203f18:	401c                	lw	a5,0(s0)
ffffffffc0203f1a:	fe979ce3          	bne	a5,s1,ffffffffc0203f12 <do_wait.part.0+0x70>
ffffffffc0203f1e:	00015797          	auipc	a5,0x15
ffffffffc0203f22:	5e27b783          	ld	a5,1506(a5) # ffffffffc0219500 <idleproc>
ffffffffc0203f26:	0c878563          	beq	a5,s0,ffffffffc0203ff0 <do_wait.part.0+0x14e>
ffffffffc0203f2a:	00015797          	auipc	a5,0x15
ffffffffc0203f2e:	5de7b783          	ld	a5,1502(a5) # ffffffffc0219508 <initproc>
ffffffffc0203f32:	0af40f63          	beq	s0,a5,ffffffffc0203ff0 <do_wait.part.0+0x14e>
ffffffffc0203f36:	000a8663          	beqz	s5,ffffffffc0203f42 <do_wait.part.0+0xa0>
ffffffffc0203f3a:	0e842783          	lw	a5,232(s0)
ffffffffc0203f3e:	00faa023          	sw	a5,0(s5)
ffffffffc0203f42:	100027f3          	csrr	a5,sstatus
ffffffffc0203f46:	8b89                	andi	a5,a5,2
ffffffffc0203f48:	4581                	li	a1,0
ffffffffc0203f4a:	efd9                	bnez	a5,ffffffffc0203fe8 <do_wait.part.0+0x146>
ffffffffc0203f4c:	6c70                	ld	a2,216(s0)
ffffffffc0203f4e:	7074                	ld	a3,224(s0)
ffffffffc0203f50:	10043703          	ld	a4,256(s0)
ffffffffc0203f54:	7c7c                	ld	a5,248(s0)
ffffffffc0203f56:	e614                	sd	a3,8(a2)
ffffffffc0203f58:	e290                	sd	a2,0(a3)
ffffffffc0203f5a:	6470                	ld	a2,200(s0)
ffffffffc0203f5c:	6874                	ld	a3,208(s0)
ffffffffc0203f5e:	e614                	sd	a3,8(a2)
ffffffffc0203f60:	e290                	sd	a2,0(a3)
ffffffffc0203f62:	c319                	beqz	a4,ffffffffc0203f68 <do_wait.part.0+0xc6>
ffffffffc0203f64:	ff7c                	sd	a5,248(a4)
ffffffffc0203f66:	7c7c                	ld	a5,248(s0)
ffffffffc0203f68:	cbbd                	beqz	a5,ffffffffc0203fde <do_wait.part.0+0x13c>
ffffffffc0203f6a:	10e7b023          	sd	a4,256(a5)
ffffffffc0203f6e:	00015717          	auipc	a4,0x15
ffffffffc0203f72:	5a270713          	addi	a4,a4,1442 # ffffffffc0219510 <nr_process>
ffffffffc0203f76:	431c                	lw	a5,0(a4)
ffffffffc0203f78:	37fd                	addiw	a5,a5,-1
ffffffffc0203f7a:	c31c                	sw	a5,0(a4)
ffffffffc0203f7c:	edb1                	bnez	a1,ffffffffc0203fd8 <do_wait.part.0+0x136>
ffffffffc0203f7e:	6814                	ld	a3,16(s0)
ffffffffc0203f80:	c02007b7          	lui	a5,0xc0200
ffffffffc0203f84:	08f6ee63          	bltu	a3,a5,ffffffffc0204020 <do_wait.part.0+0x17e>
ffffffffc0203f88:	00015797          	auipc	a5,0x15
ffffffffc0203f8c:	6a87b783          	ld	a5,1704(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc0203f90:	8e9d                	sub	a3,a3,a5
ffffffffc0203f92:	82b1                	srli	a3,a3,0xc
ffffffffc0203f94:	00015797          	auipc	a5,0x15
ffffffffc0203f98:	55c7b783          	ld	a5,1372(a5) # ffffffffc02194f0 <npage>
ffffffffc0203f9c:	06f6f663          	bgeu	a3,a5,ffffffffc0204008 <do_wait.part.0+0x166>
ffffffffc0203fa0:	00006517          	auipc	a0,0x6
ffffffffc0203fa4:	67853503          	ld	a0,1656(a0) # ffffffffc020a618 <nbase>
ffffffffc0203fa8:	8e89                	sub	a3,a3,a0
ffffffffc0203faa:	069a                	slli	a3,a3,0x6
ffffffffc0203fac:	00015517          	auipc	a0,0x15
ffffffffc0203fb0:	69453503          	ld	a0,1684(a0) # ffffffffc0219640 <pages>
ffffffffc0203fb4:	9536                	add	a0,a0,a3
ffffffffc0203fb6:	4589                	li	a1,2
ffffffffc0203fb8:	fb8fe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203fbc:	8522                	mv	a0,s0
ffffffffc0203fbe:	f7cfd0ef          	jal	ra,ffffffffc020173a <kfree>
ffffffffc0203fc2:	4501                	li	a0,0
ffffffffc0203fc4:	70e2                	ld	ra,56(sp)
ffffffffc0203fc6:	7442                	ld	s0,48(sp)
ffffffffc0203fc8:	74a2                	ld	s1,40(sp)
ffffffffc0203fca:	7902                	ld	s2,32(sp)
ffffffffc0203fcc:	69e2                	ld	s3,24(sp)
ffffffffc0203fce:	6a42                	ld	s4,16(sp)
ffffffffc0203fd0:	6aa2                	ld	s5,8(sp)
ffffffffc0203fd2:	6b02                	ld	s6,0(sp)
ffffffffc0203fd4:	6121                	addi	sp,sp,64
ffffffffc0203fd6:	8082                	ret
ffffffffc0203fd8:	e5afc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203fdc:	b74d                	j	ffffffffc0203f7e <do_wait.part.0+0xdc>
ffffffffc0203fde:	701c                	ld	a5,32(s0)
ffffffffc0203fe0:	fbf8                	sd	a4,240(a5)
ffffffffc0203fe2:	b771                	j	ffffffffc0203f6e <do_wait.part.0+0xcc>
ffffffffc0203fe4:	5579                	li	a0,-2
ffffffffc0203fe6:	bff9                	j	ffffffffc0203fc4 <do_wait.part.0+0x122>
ffffffffc0203fe8:	e50fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203fec:	4585                	li	a1,1
ffffffffc0203fee:	bfb9                	j	ffffffffc0203f4c <do_wait.part.0+0xaa>
ffffffffc0203ff0:	00005617          	auipc	a2,0x5
ffffffffc0203ff4:	5e060613          	addi	a2,a2,1504 # ffffffffc02095d0 <default_pmm_manager+0x3e0>
ffffffffc0203ff8:	2f600593          	li	a1,758
ffffffffc0203ffc:	00005517          	auipc	a0,0x5
ffffffffc0204000:	57c50513          	addi	a0,a0,1404 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0204004:	a04fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204008:	00005617          	auipc	a2,0x5
ffffffffc020400c:	c4060613          	addi	a2,a2,-960 # ffffffffc0208c48 <commands+0xa88>
ffffffffc0204010:	06200593          	li	a1,98
ffffffffc0204014:	00005517          	auipc	a0,0x5
ffffffffc0204018:	bc450513          	addi	a0,a0,-1084 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc020401c:	9ecfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204020:	00005617          	auipc	a2,0x5
ffffffffc0204024:	c0060613          	addi	a2,a2,-1024 # ffffffffc0208c20 <commands+0xa60>
ffffffffc0204028:	06e00593          	li	a1,110
ffffffffc020402c:	00005517          	auipc	a0,0x5
ffffffffc0204030:	bac50513          	addi	a0,a0,-1108 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0204034:	9d4fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204038 <init_main>:
ffffffffc0204038:	1141                	addi	sp,sp,-16
ffffffffc020403a:	e406                	sd	ra,8(sp)
ffffffffc020403c:	f76fe0ef          	jal	ra,ffffffffc02027b2 <nr_free_pages>
ffffffffc0204040:	e46fd0ef          	jal	ra,ffffffffc0201686 <kallocated>
ffffffffc0204044:	9ccff0ef          	jal	ra,ffffffffc0203210 <check_sync>
ffffffffc0204048:	a019                	j	ffffffffc020404e <init_main+0x16>
ffffffffc020404a:	21d000ef          	jal	ra,ffffffffc0204a66 <schedule>
ffffffffc020404e:	4581                	li	a1,0
ffffffffc0204050:	4501                	li	a0,0
ffffffffc0204052:	e51ff0ef          	jal	ra,ffffffffc0203ea2 <do_wait.part.0>
ffffffffc0204056:	d975                	beqz	a0,ffffffffc020404a <init_main+0x12>
ffffffffc0204058:	00005517          	auipc	a0,0x5
ffffffffc020405c:	59850513          	addi	a0,a0,1432 # ffffffffc02095f0 <default_pmm_manager+0x400>
ffffffffc0204060:	86cfc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0204064:	00015797          	auipc	a5,0x15
ffffffffc0204068:	4a47b783          	ld	a5,1188(a5) # ffffffffc0219508 <initproc>
ffffffffc020406c:	7bf8                	ld	a4,240(a5)
ffffffffc020406e:	e339                	bnez	a4,ffffffffc02040b4 <init_main+0x7c>
ffffffffc0204070:	7ff8                	ld	a4,248(a5)
ffffffffc0204072:	e329                	bnez	a4,ffffffffc02040b4 <init_main+0x7c>
ffffffffc0204074:	1007b703          	ld	a4,256(a5)
ffffffffc0204078:	ef15                	bnez	a4,ffffffffc02040b4 <init_main+0x7c>
ffffffffc020407a:	00015697          	auipc	a3,0x15
ffffffffc020407e:	4966a683          	lw	a3,1174(a3) # ffffffffc0219510 <nr_process>
ffffffffc0204082:	4709                	li	a4,2
ffffffffc0204084:	08e69863          	bne	a3,a4,ffffffffc0204114 <init_main+0xdc>
ffffffffc0204088:	00015717          	auipc	a4,0x15
ffffffffc020408c:	6b070713          	addi	a4,a4,1712 # ffffffffc0219738 <proc_list>
ffffffffc0204090:	6714                	ld	a3,8(a4)
ffffffffc0204092:	0c878793          	addi	a5,a5,200
ffffffffc0204096:	04d79f63          	bne	a5,a3,ffffffffc02040f4 <init_main+0xbc>
ffffffffc020409a:	6318                	ld	a4,0(a4)
ffffffffc020409c:	02e79c63          	bne	a5,a4,ffffffffc02040d4 <init_main+0x9c>
ffffffffc02040a0:	00005517          	auipc	a0,0x5
ffffffffc02040a4:	63850513          	addi	a0,a0,1592 # ffffffffc02096d8 <default_pmm_manager+0x4e8>
ffffffffc02040a8:	824fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02040ac:	60a2                	ld	ra,8(sp)
ffffffffc02040ae:	4501                	li	a0,0
ffffffffc02040b0:	0141                	addi	sp,sp,16
ffffffffc02040b2:	8082                	ret
ffffffffc02040b4:	00005697          	auipc	a3,0x5
ffffffffc02040b8:	56468693          	addi	a3,a3,1380 # ffffffffc0209618 <default_pmm_manager+0x428>
ffffffffc02040bc:	00004617          	auipc	a2,0x4
ffffffffc02040c0:	51460613          	addi	a2,a2,1300 # ffffffffc02085d0 <commands+0x410>
ffffffffc02040c4:	35f00593          	li	a1,863
ffffffffc02040c8:	00005517          	auipc	a0,0x5
ffffffffc02040cc:	4b050513          	addi	a0,a0,1200 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc02040d0:	938fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02040d4:	00005697          	auipc	a3,0x5
ffffffffc02040d8:	5d468693          	addi	a3,a3,1492 # ffffffffc02096a8 <default_pmm_manager+0x4b8>
ffffffffc02040dc:	00004617          	auipc	a2,0x4
ffffffffc02040e0:	4f460613          	addi	a2,a2,1268 # ffffffffc02085d0 <commands+0x410>
ffffffffc02040e4:	36200593          	li	a1,866
ffffffffc02040e8:	00005517          	auipc	a0,0x5
ffffffffc02040ec:	49050513          	addi	a0,a0,1168 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc02040f0:	918fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02040f4:	00005697          	auipc	a3,0x5
ffffffffc02040f8:	58468693          	addi	a3,a3,1412 # ffffffffc0209678 <default_pmm_manager+0x488>
ffffffffc02040fc:	00004617          	auipc	a2,0x4
ffffffffc0204100:	4d460613          	addi	a2,a2,1236 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204104:	36100593          	li	a1,865
ffffffffc0204108:	00005517          	auipc	a0,0x5
ffffffffc020410c:	47050513          	addi	a0,a0,1136 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0204110:	8f8fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204114:	00005697          	auipc	a3,0x5
ffffffffc0204118:	55468693          	addi	a3,a3,1364 # ffffffffc0209668 <default_pmm_manager+0x478>
ffffffffc020411c:	00004617          	auipc	a2,0x4
ffffffffc0204120:	4b460613          	addi	a2,a2,1204 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204124:	36000593          	li	a1,864
ffffffffc0204128:	00005517          	auipc	a0,0x5
ffffffffc020412c:	45050513          	addi	a0,a0,1104 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0204130:	8d8fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204134 <do_execve>:
ffffffffc0204134:	7135                	addi	sp,sp,-160
ffffffffc0204136:	f4d6                	sd	s5,104(sp)
ffffffffc0204138:	00015a97          	auipc	s5,0x15
ffffffffc020413c:	3c0a8a93          	addi	s5,s5,960 # ffffffffc02194f8 <current>
ffffffffc0204140:	000ab783          	ld	a5,0(s5)
ffffffffc0204144:	f8d2                	sd	s4,112(sp)
ffffffffc0204146:	e526                	sd	s1,136(sp)
ffffffffc0204148:	0287ba03          	ld	s4,40(a5)
ffffffffc020414c:	e14a                	sd	s2,128(sp)
ffffffffc020414e:	fcce                	sd	s3,120(sp)
ffffffffc0204150:	892a                	mv	s2,a0
ffffffffc0204152:	84ae                	mv	s1,a1
ffffffffc0204154:	89b2                	mv	s3,a2
ffffffffc0204156:	4681                	li	a3,0
ffffffffc0204158:	862e                	mv	a2,a1
ffffffffc020415a:	85aa                	mv	a1,a0
ffffffffc020415c:	8552                	mv	a0,s4
ffffffffc020415e:	ed06                	sd	ra,152(sp)
ffffffffc0204160:	e922                	sd	s0,144(sp)
ffffffffc0204162:	f0da                	sd	s6,96(sp)
ffffffffc0204164:	ecde                	sd	s7,88(sp)
ffffffffc0204166:	e8e2                	sd	s8,80(sp)
ffffffffc0204168:	e4e6                	sd	s9,72(sp)
ffffffffc020416a:	e0ea                	sd	s10,64(sp)
ffffffffc020416c:	fc6e                	sd	s11,56(sp)
ffffffffc020416e:	858fd0ef          	jal	ra,ffffffffc02011c6 <user_mem_check>
ffffffffc0204172:	46050063          	beqz	a0,ffffffffc02045d2 <do_execve+0x49e>
ffffffffc0204176:	4641                	li	a2,16
ffffffffc0204178:	4581                	li	a1,0
ffffffffc020417a:	1008                	addi	a0,sp,32
ffffffffc020417c:	171030ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc0204180:	47bd                	li	a5,15
ffffffffc0204182:	8626                	mv	a2,s1
ffffffffc0204184:	1897ea63          	bltu	a5,s1,ffffffffc0204318 <do_execve+0x1e4>
ffffffffc0204188:	85ca                	mv	a1,s2
ffffffffc020418a:	1008                	addi	a0,sp,32
ffffffffc020418c:	173030ef          	jal	ra,ffffffffc0207afe <memcpy>
ffffffffc0204190:	180a0b63          	beqz	s4,ffffffffc0204326 <do_execve+0x1f2>
ffffffffc0204194:	00004517          	auipc	a0,0x4
ffffffffc0204198:	7d450513          	addi	a0,a0,2004 # ffffffffc0208968 <commands+0x7a8>
ffffffffc020419c:	f69fb0ef          	jal	ra,ffffffffc0200104 <cputs>
ffffffffc02041a0:	00015797          	auipc	a5,0x15
ffffffffc02041a4:	4987b783          	ld	a5,1176(a5) # ffffffffc0219638 <boot_cr3>
ffffffffc02041a8:	577d                	li	a4,-1
ffffffffc02041aa:	177e                	slli	a4,a4,0x3f
ffffffffc02041ac:	83b1                	srli	a5,a5,0xc
ffffffffc02041ae:	8fd9                	or	a5,a5,a4
ffffffffc02041b0:	18079073          	csrw	satp,a5
ffffffffc02041b4:	030a2783          	lw	a5,48(s4) # ffffffff80000030 <kern_entry-0x401fffd0>
ffffffffc02041b8:	fff7871b          	addiw	a4,a5,-1
ffffffffc02041bc:	02ea2823          	sw	a4,48(s4)
ffffffffc02041c0:	2c070163          	beqz	a4,ffffffffc0204482 <do_execve+0x34e>
ffffffffc02041c4:	000ab783          	ld	a5,0(s5)
ffffffffc02041c8:	0207b423          	sd	zero,40(a5)
ffffffffc02041cc:	b87fc0ef          	jal	ra,ffffffffc0200d52 <mm_create>
ffffffffc02041d0:	84aa                	mv	s1,a0
ffffffffc02041d2:	18050263          	beqz	a0,ffffffffc0204356 <do_execve+0x222>
ffffffffc02041d6:	0561                	addi	a0,a0,24
ffffffffc02041d8:	d82ff0ef          	jal	ra,ffffffffc020375a <setup_pgdir.isra.0>
ffffffffc02041dc:	16051663          	bnez	a0,ffffffffc0204348 <do_execve+0x214>
ffffffffc02041e0:	0009a703          	lw	a4,0(s3)
ffffffffc02041e4:	464c47b7          	lui	a5,0x464c4
ffffffffc02041e8:	57f78793          	addi	a5,a5,1407 # 464c457f <kern_entry-0xffffffff79d3ba81>
ffffffffc02041ec:	24f71763          	bne	a4,a5,ffffffffc020443a <do_execve+0x306>
ffffffffc02041f0:	0389d703          	lhu	a4,56(s3)
ffffffffc02041f4:	0209b903          	ld	s2,32(s3)
ffffffffc02041f8:	00371793          	slli	a5,a4,0x3
ffffffffc02041fc:	8f99                	sub	a5,a5,a4
ffffffffc02041fe:	994e                	add	s2,s2,s3
ffffffffc0204200:	078e                	slli	a5,a5,0x3
ffffffffc0204202:	97ca                	add	a5,a5,s2
ffffffffc0204204:	ec3e                	sd	a5,24(sp)
ffffffffc0204206:	02f97c63          	bgeu	s2,a5,ffffffffc020423e <do_execve+0x10a>
ffffffffc020420a:	5bfd                	li	s7,-1
ffffffffc020420c:	00cbd793          	srli	a5,s7,0xc
ffffffffc0204210:	00015d97          	auipc	s11,0x15
ffffffffc0204214:	430d8d93          	addi	s11,s11,1072 # ffffffffc0219640 <pages>
ffffffffc0204218:	00006d17          	auipc	s10,0x6
ffffffffc020421c:	400d0d13          	addi	s10,s10,1024 # ffffffffc020a618 <nbase>
ffffffffc0204220:	e43e                	sd	a5,8(sp)
ffffffffc0204222:	00015c97          	auipc	s9,0x15
ffffffffc0204226:	2cec8c93          	addi	s9,s9,718 # ffffffffc02194f0 <npage>
ffffffffc020422a:	00092703          	lw	a4,0(s2)
ffffffffc020422e:	4785                	li	a5,1
ffffffffc0204230:	12f70563          	beq	a4,a5,ffffffffc020435a <do_execve+0x226>
ffffffffc0204234:	67e2                	ld	a5,24(sp)
ffffffffc0204236:	03890913          	addi	s2,s2,56
ffffffffc020423a:	fef968e3          	bltu	s2,a5,ffffffffc020422a <do_execve+0xf6>
ffffffffc020423e:	4701                	li	a4,0
ffffffffc0204240:	46ad                	li	a3,11
ffffffffc0204242:	00100637          	lui	a2,0x100
ffffffffc0204246:	7ff005b7          	lui	a1,0x7ff00
ffffffffc020424a:	8526                	mv	a0,s1
ffffffffc020424c:	cb7fc0ef          	jal	ra,ffffffffc0200f02 <mm_map>
ffffffffc0204250:	8a2a                	mv	s4,a0
ffffffffc0204252:	1e051063          	bnez	a0,ffffffffc0204432 <do_execve+0x2fe>
ffffffffc0204256:	6c88                	ld	a0,24(s1)
ffffffffc0204258:	467d                	li	a2,31
ffffffffc020425a:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc020425e:	dbdfe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204262:	42050e63          	beqz	a0,ffffffffc020469e <do_execve+0x56a>
ffffffffc0204266:	6c88                	ld	a0,24(s1)
ffffffffc0204268:	467d                	li	a2,31
ffffffffc020426a:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc020426e:	dadfe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204272:	40050663          	beqz	a0,ffffffffc020467e <do_execve+0x54a>
ffffffffc0204276:	6c88                	ld	a0,24(s1)
ffffffffc0204278:	467d                	li	a2,31
ffffffffc020427a:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc020427e:	d9dfe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204282:	3c050e63          	beqz	a0,ffffffffc020465e <do_execve+0x52a>
ffffffffc0204286:	6c88                	ld	a0,24(s1)
ffffffffc0204288:	467d                	li	a2,31
ffffffffc020428a:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc020428e:	d8dfe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204292:	3a050663          	beqz	a0,ffffffffc020463e <do_execve+0x50a>
ffffffffc0204296:	589c                	lw	a5,48(s1)
ffffffffc0204298:	000ab603          	ld	a2,0(s5)
ffffffffc020429c:	6c94                	ld	a3,24(s1)
ffffffffc020429e:	2785                	addiw	a5,a5,1
ffffffffc02042a0:	d89c                	sw	a5,48(s1)
ffffffffc02042a2:	f604                	sd	s1,40(a2)
ffffffffc02042a4:	c02007b7          	lui	a5,0xc0200
ffffffffc02042a8:	36f6ef63          	bltu	a3,a5,ffffffffc0204626 <do_execve+0x4f2>
ffffffffc02042ac:	00015797          	auipc	a5,0x15
ffffffffc02042b0:	3847b783          	ld	a5,900(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc02042b4:	8e9d                	sub	a3,a3,a5
ffffffffc02042b6:	577d                	li	a4,-1
ffffffffc02042b8:	00c6d793          	srli	a5,a3,0xc
ffffffffc02042bc:	177e                	slli	a4,a4,0x3f
ffffffffc02042be:	f654                	sd	a3,168(a2)
ffffffffc02042c0:	8fd9                	or	a5,a5,a4
ffffffffc02042c2:	18079073          	csrw	satp,a5
ffffffffc02042c6:	7240                	ld	s0,160(a2)
ffffffffc02042c8:	4581                	li	a1,0
ffffffffc02042ca:	12000613          	li	a2,288
ffffffffc02042ce:	8522                	mv	a0,s0
ffffffffc02042d0:	10043483          	ld	s1,256(s0)
ffffffffc02042d4:	019030ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc02042d8:	0189b703          	ld	a4,24(s3)
ffffffffc02042dc:	4785                	li	a5,1
ffffffffc02042de:	000ab503          	ld	a0,0(s5)
ffffffffc02042e2:	edf4f493          	andi	s1,s1,-289
ffffffffc02042e6:	07fe                	slli	a5,a5,0x1f
ffffffffc02042e8:	e81c                	sd	a5,16(s0)
ffffffffc02042ea:	10e43423          	sd	a4,264(s0)
ffffffffc02042ee:	10943023          	sd	s1,256(s0)
ffffffffc02042f2:	100c                	addi	a1,sp,32
ffffffffc02042f4:	ce8ff0ef          	jal	ra,ffffffffc02037dc <set_proc_name>
ffffffffc02042f8:	60ea                	ld	ra,152(sp)
ffffffffc02042fa:	644a                	ld	s0,144(sp)
ffffffffc02042fc:	64aa                	ld	s1,136(sp)
ffffffffc02042fe:	690a                	ld	s2,128(sp)
ffffffffc0204300:	79e6                	ld	s3,120(sp)
ffffffffc0204302:	7aa6                	ld	s5,104(sp)
ffffffffc0204304:	7b06                	ld	s6,96(sp)
ffffffffc0204306:	6be6                	ld	s7,88(sp)
ffffffffc0204308:	6c46                	ld	s8,80(sp)
ffffffffc020430a:	6ca6                	ld	s9,72(sp)
ffffffffc020430c:	6d06                	ld	s10,64(sp)
ffffffffc020430e:	7de2                	ld	s11,56(sp)
ffffffffc0204310:	8552                	mv	a0,s4
ffffffffc0204312:	7a46                	ld	s4,112(sp)
ffffffffc0204314:	610d                	addi	sp,sp,160
ffffffffc0204316:	8082                	ret
ffffffffc0204318:	463d                	li	a2,15
ffffffffc020431a:	85ca                	mv	a1,s2
ffffffffc020431c:	1008                	addi	a0,sp,32
ffffffffc020431e:	7e0030ef          	jal	ra,ffffffffc0207afe <memcpy>
ffffffffc0204322:	e60a19e3          	bnez	s4,ffffffffc0204194 <do_execve+0x60>
ffffffffc0204326:	000ab783          	ld	a5,0(s5)
ffffffffc020432a:	779c                	ld	a5,40(a5)
ffffffffc020432c:	ea0780e3          	beqz	a5,ffffffffc02041cc <do_execve+0x98>
ffffffffc0204330:	00005617          	auipc	a2,0x5
ffffffffc0204334:	3c860613          	addi	a2,a2,968 # ffffffffc02096f8 <default_pmm_manager+0x508>
ffffffffc0204338:	20300593          	li	a1,515
ffffffffc020433c:	00005517          	auipc	a0,0x5
ffffffffc0204340:	23c50513          	addi	a0,a0,572 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0204344:	ec5fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204348:	8526                	mv	a0,s1
ffffffffc020434a:	b67fc0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc020434e:	5a71                	li	s4,-4
ffffffffc0204350:	8552                	mv	a0,s4
ffffffffc0204352:	99bff0ef          	jal	ra,ffffffffc0203cec <do_exit>
ffffffffc0204356:	5a71                	li	s4,-4
ffffffffc0204358:	bfe5                	j	ffffffffc0204350 <do_execve+0x21c>
ffffffffc020435a:	02893603          	ld	a2,40(s2)
ffffffffc020435e:	02093783          	ld	a5,32(s2)
ffffffffc0204362:	26f66c63          	bltu	a2,a5,ffffffffc02045da <do_execve+0x4a6>
ffffffffc0204366:	00492783          	lw	a5,4(s2)
ffffffffc020436a:	0017f693          	andi	a3,a5,1
ffffffffc020436e:	c291                	beqz	a3,ffffffffc0204372 <do_execve+0x23e>
ffffffffc0204370:	4691                	li	a3,4
ffffffffc0204372:	0027f713          	andi	a4,a5,2
ffffffffc0204376:	8b91                	andi	a5,a5,4
ffffffffc0204378:	14071c63          	bnez	a4,ffffffffc02044d0 <do_execve+0x39c>
ffffffffc020437c:	4745                	li	a4,17
ffffffffc020437e:	e03a                	sd	a4,0(sp)
ffffffffc0204380:	c789                	beqz	a5,ffffffffc020438a <do_execve+0x256>
ffffffffc0204382:	47cd                	li	a5,19
ffffffffc0204384:	0016e693          	ori	a3,a3,1
ffffffffc0204388:	e03e                	sd	a5,0(sp)
ffffffffc020438a:	0026f793          	andi	a5,a3,2
ffffffffc020438e:	14079563          	bnez	a5,ffffffffc02044d8 <do_execve+0x3a4>
ffffffffc0204392:	0046f793          	andi	a5,a3,4
ffffffffc0204396:	c789                	beqz	a5,ffffffffc02043a0 <do_execve+0x26c>
ffffffffc0204398:	6782                	ld	a5,0(sp)
ffffffffc020439a:	0087e793          	ori	a5,a5,8
ffffffffc020439e:	e03e                	sd	a5,0(sp)
ffffffffc02043a0:	01093583          	ld	a1,16(s2)
ffffffffc02043a4:	4701                	li	a4,0
ffffffffc02043a6:	8526                	mv	a0,s1
ffffffffc02043a8:	b5bfc0ef          	jal	ra,ffffffffc0200f02 <mm_map>
ffffffffc02043ac:	8a2a                	mv	s4,a0
ffffffffc02043ae:	e151                	bnez	a0,ffffffffc0204432 <do_execve+0x2fe>
ffffffffc02043b0:	01093c03          	ld	s8,16(s2)
ffffffffc02043b4:	02093a03          	ld	s4,32(s2)
ffffffffc02043b8:	00893b03          	ld	s6,8(s2)
ffffffffc02043bc:	77fd                	lui	a5,0xfffff
ffffffffc02043be:	9a62                	add	s4,s4,s8
ffffffffc02043c0:	9b4e                	add	s6,s6,s3
ffffffffc02043c2:	00fc7bb3          	and	s7,s8,a5
ffffffffc02043c6:	054c6e63          	bltu	s8,s4,ffffffffc0204422 <do_execve+0x2ee>
ffffffffc02043ca:	a431                	j	ffffffffc02045d6 <do_execve+0x4a2>
ffffffffc02043cc:	6785                	lui	a5,0x1
ffffffffc02043ce:	417c0533          	sub	a0,s8,s7
ffffffffc02043d2:	9bbe                	add	s7,s7,a5
ffffffffc02043d4:	418b8633          	sub	a2,s7,s8
ffffffffc02043d8:	017a7463          	bgeu	s4,s7,ffffffffc02043e0 <do_execve+0x2ac>
ffffffffc02043dc:	418a0633          	sub	a2,s4,s8
ffffffffc02043e0:	000db683          	ld	a3,0(s11)
ffffffffc02043e4:	000d3803          	ld	a6,0(s10)
ffffffffc02043e8:	67a2                	ld	a5,8(sp)
ffffffffc02043ea:	40d406b3          	sub	a3,s0,a3
ffffffffc02043ee:	8699                	srai	a3,a3,0x6
ffffffffc02043f0:	000cb583          	ld	a1,0(s9)
ffffffffc02043f4:	96c2                	add	a3,a3,a6
ffffffffc02043f6:	00f6f833          	and	a6,a3,a5
ffffffffc02043fa:	06b2                	slli	a3,a3,0xc
ffffffffc02043fc:	1eb87163          	bgeu	a6,a1,ffffffffc02045de <do_execve+0x4aa>
ffffffffc0204400:	00015797          	auipc	a5,0x15
ffffffffc0204404:	23078793          	addi	a5,a5,560 # ffffffffc0219630 <va_pa_offset>
ffffffffc0204408:	0007b803          	ld	a6,0(a5)
ffffffffc020440c:	85da                	mv	a1,s6
ffffffffc020440e:	9c32                	add	s8,s8,a2
ffffffffc0204410:	96c2                	add	a3,a3,a6
ffffffffc0204412:	9536                	add	a0,a0,a3
ffffffffc0204414:	e832                	sd	a2,16(sp)
ffffffffc0204416:	6e8030ef          	jal	ra,ffffffffc0207afe <memcpy>
ffffffffc020441a:	6642                	ld	a2,16(sp)
ffffffffc020441c:	9b32                	add	s6,s6,a2
ffffffffc020441e:	0d4c7063          	bgeu	s8,s4,ffffffffc02044de <do_execve+0x3aa>
ffffffffc0204422:	6c88                	ld	a0,24(s1)
ffffffffc0204424:	6602                	ld	a2,0(sp)
ffffffffc0204426:	85de                	mv	a1,s7
ffffffffc0204428:	bf3fe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc020442c:	842a                	mv	s0,a0
ffffffffc020442e:	fd59                	bnez	a0,ffffffffc02043cc <do_execve+0x298>
ffffffffc0204430:	5a71                	li	s4,-4
ffffffffc0204432:	8526                	mv	a0,s1
ffffffffc0204434:	c19fc0ef          	jal	ra,ffffffffc020104c <exit_mmap>
ffffffffc0204438:	a011                	j	ffffffffc020443c <do_execve+0x308>
ffffffffc020443a:	5a61                	li	s4,-8
ffffffffc020443c:	6c94                	ld	a3,24(s1)
ffffffffc020443e:	c02007b7          	lui	a5,0xc0200
ffffffffc0204442:	1af6ea63          	bltu	a3,a5,ffffffffc02045f6 <do_execve+0x4c2>
ffffffffc0204446:	00015517          	auipc	a0,0x15
ffffffffc020444a:	1ea53503          	ld	a0,490(a0) # ffffffffc0219630 <va_pa_offset>
ffffffffc020444e:	8e89                	sub	a3,a3,a0
ffffffffc0204450:	82b1                	srli	a3,a3,0xc
ffffffffc0204452:	00015797          	auipc	a5,0x15
ffffffffc0204456:	09e7b783          	ld	a5,158(a5) # ffffffffc02194f0 <npage>
ffffffffc020445a:	1af6fa63          	bgeu	a3,a5,ffffffffc020460e <do_execve+0x4da>
ffffffffc020445e:	00006517          	auipc	a0,0x6
ffffffffc0204462:	1ba53503          	ld	a0,442(a0) # ffffffffc020a618 <nbase>
ffffffffc0204466:	8e89                	sub	a3,a3,a0
ffffffffc0204468:	069a                	slli	a3,a3,0x6
ffffffffc020446a:	00015517          	auipc	a0,0x15
ffffffffc020446e:	1d653503          	ld	a0,470(a0) # ffffffffc0219640 <pages>
ffffffffc0204472:	9536                	add	a0,a0,a3
ffffffffc0204474:	4585                	li	a1,1
ffffffffc0204476:	afafe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc020447a:	8526                	mv	a0,s1
ffffffffc020447c:	a35fc0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0204480:	bdc1                	j	ffffffffc0204350 <do_execve+0x21c>
ffffffffc0204482:	8552                	mv	a0,s4
ffffffffc0204484:	bc9fc0ef          	jal	ra,ffffffffc020104c <exit_mmap>
ffffffffc0204488:	018a3683          	ld	a3,24(s4)
ffffffffc020448c:	c02007b7          	lui	a5,0xc0200
ffffffffc0204490:	16f6e363          	bltu	a3,a5,ffffffffc02045f6 <do_execve+0x4c2>
ffffffffc0204494:	00015797          	auipc	a5,0x15
ffffffffc0204498:	19c7b783          	ld	a5,412(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc020449c:	8e9d                	sub	a3,a3,a5
ffffffffc020449e:	82b1                	srli	a3,a3,0xc
ffffffffc02044a0:	00015797          	auipc	a5,0x15
ffffffffc02044a4:	0507b783          	ld	a5,80(a5) # ffffffffc02194f0 <npage>
ffffffffc02044a8:	16f6f363          	bgeu	a3,a5,ffffffffc020460e <do_execve+0x4da>
ffffffffc02044ac:	00006517          	auipc	a0,0x6
ffffffffc02044b0:	16c53503          	ld	a0,364(a0) # ffffffffc020a618 <nbase>
ffffffffc02044b4:	8e89                	sub	a3,a3,a0
ffffffffc02044b6:	069a                	slli	a3,a3,0x6
ffffffffc02044b8:	00015517          	auipc	a0,0x15
ffffffffc02044bc:	18853503          	ld	a0,392(a0) # ffffffffc0219640 <pages>
ffffffffc02044c0:	9536                	add	a0,a0,a3
ffffffffc02044c2:	4585                	li	a1,1
ffffffffc02044c4:	aacfe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc02044c8:	8552                	mv	a0,s4
ffffffffc02044ca:	9e7fc0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc02044ce:	b9dd                	j	ffffffffc02041c4 <do_execve+0x90>
ffffffffc02044d0:	0026e693          	ori	a3,a3,2
ffffffffc02044d4:	ea0797e3          	bnez	a5,ffffffffc0204382 <do_execve+0x24e>
ffffffffc02044d8:	47dd                	li	a5,23
ffffffffc02044da:	e03e                	sd	a5,0(sp)
ffffffffc02044dc:	bd5d                	j	ffffffffc0204392 <do_execve+0x25e>
ffffffffc02044de:	01093a03          	ld	s4,16(s2)
ffffffffc02044e2:	02893683          	ld	a3,40(s2)
ffffffffc02044e6:	9a36                	add	s4,s4,a3
ffffffffc02044e8:	077c7f63          	bgeu	s8,s7,ffffffffc0204566 <do_execve+0x432>
ffffffffc02044ec:	d58a04e3          	beq	s4,s8,ffffffffc0204234 <do_execve+0x100>
ffffffffc02044f0:	6505                	lui	a0,0x1
ffffffffc02044f2:	9562                	add	a0,a0,s8
ffffffffc02044f4:	41750533          	sub	a0,a0,s7
ffffffffc02044f8:	418a0b33          	sub	s6,s4,s8
ffffffffc02044fc:	0d7a7863          	bgeu	s4,s7,ffffffffc02045cc <do_execve+0x498>
ffffffffc0204500:	000db683          	ld	a3,0(s11)
ffffffffc0204504:	000d3583          	ld	a1,0(s10)
ffffffffc0204508:	67a2                	ld	a5,8(sp)
ffffffffc020450a:	40d406b3          	sub	a3,s0,a3
ffffffffc020450e:	8699                	srai	a3,a3,0x6
ffffffffc0204510:	000cb603          	ld	a2,0(s9)
ffffffffc0204514:	96ae                	add	a3,a3,a1
ffffffffc0204516:	00f6f5b3          	and	a1,a3,a5
ffffffffc020451a:	06b2                	slli	a3,a3,0xc
ffffffffc020451c:	0cc5f163          	bgeu	a1,a2,ffffffffc02045de <do_execve+0x4aa>
ffffffffc0204520:	00015617          	auipc	a2,0x15
ffffffffc0204524:	11063603          	ld	a2,272(a2) # ffffffffc0219630 <va_pa_offset>
ffffffffc0204528:	96b2                	add	a3,a3,a2
ffffffffc020452a:	4581                	li	a1,0
ffffffffc020452c:	865a                	mv	a2,s6
ffffffffc020452e:	9536                	add	a0,a0,a3
ffffffffc0204530:	5bc030ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc0204534:	018b0733          	add	a4,s6,s8
ffffffffc0204538:	037a7463          	bgeu	s4,s7,ffffffffc0204560 <do_execve+0x42c>
ffffffffc020453c:	ceea0ce3          	beq	s4,a4,ffffffffc0204234 <do_execve+0x100>
ffffffffc0204540:	00005697          	auipc	a3,0x5
ffffffffc0204544:	1e068693          	addi	a3,a3,480 # ffffffffc0209720 <default_pmm_manager+0x530>
ffffffffc0204548:	00004617          	auipc	a2,0x4
ffffffffc020454c:	08860613          	addi	a2,a2,136 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204550:	25800593          	li	a1,600
ffffffffc0204554:	00005517          	auipc	a0,0x5
ffffffffc0204558:	02450513          	addi	a0,a0,36 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc020455c:	cadfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204560:	ff7710e3          	bne	a4,s7,ffffffffc0204540 <do_execve+0x40c>
ffffffffc0204564:	8c5e                	mv	s8,s7
ffffffffc0204566:	00015b17          	auipc	s6,0x15
ffffffffc020456a:	0cab0b13          	addi	s6,s6,202 # ffffffffc0219630 <va_pa_offset>
ffffffffc020456e:	054c6763          	bltu	s8,s4,ffffffffc02045bc <do_execve+0x488>
ffffffffc0204572:	b1c9                	j	ffffffffc0204234 <do_execve+0x100>
ffffffffc0204574:	6785                	lui	a5,0x1
ffffffffc0204576:	417c0533          	sub	a0,s8,s7
ffffffffc020457a:	9bbe                	add	s7,s7,a5
ffffffffc020457c:	418b8633          	sub	a2,s7,s8
ffffffffc0204580:	017a7463          	bgeu	s4,s7,ffffffffc0204588 <do_execve+0x454>
ffffffffc0204584:	418a0633          	sub	a2,s4,s8
ffffffffc0204588:	000db683          	ld	a3,0(s11)
ffffffffc020458c:	000d3803          	ld	a6,0(s10)
ffffffffc0204590:	67a2                	ld	a5,8(sp)
ffffffffc0204592:	40d406b3          	sub	a3,s0,a3
ffffffffc0204596:	8699                	srai	a3,a3,0x6
ffffffffc0204598:	000cb583          	ld	a1,0(s9)
ffffffffc020459c:	96c2                	add	a3,a3,a6
ffffffffc020459e:	00f6f833          	and	a6,a3,a5
ffffffffc02045a2:	06b2                	slli	a3,a3,0xc
ffffffffc02045a4:	02b87d63          	bgeu	a6,a1,ffffffffc02045de <do_execve+0x4aa>
ffffffffc02045a8:	000b3803          	ld	a6,0(s6)
ffffffffc02045ac:	9c32                	add	s8,s8,a2
ffffffffc02045ae:	4581                	li	a1,0
ffffffffc02045b0:	96c2                	add	a3,a3,a6
ffffffffc02045b2:	9536                	add	a0,a0,a3
ffffffffc02045b4:	538030ef          	jal	ra,ffffffffc0207aec <memset>
ffffffffc02045b8:	c74c7ee3          	bgeu	s8,s4,ffffffffc0204234 <do_execve+0x100>
ffffffffc02045bc:	6c88                	ld	a0,24(s1)
ffffffffc02045be:	6602                	ld	a2,0(sp)
ffffffffc02045c0:	85de                	mv	a1,s7
ffffffffc02045c2:	a59fe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc02045c6:	842a                	mv	s0,a0
ffffffffc02045c8:	f555                	bnez	a0,ffffffffc0204574 <do_execve+0x440>
ffffffffc02045ca:	b59d                	j	ffffffffc0204430 <do_execve+0x2fc>
ffffffffc02045cc:	418b8b33          	sub	s6,s7,s8
ffffffffc02045d0:	bf05                	j	ffffffffc0204500 <do_execve+0x3cc>
ffffffffc02045d2:	5a75                	li	s4,-3
ffffffffc02045d4:	b315                	j	ffffffffc02042f8 <do_execve+0x1c4>
ffffffffc02045d6:	8a62                	mv	s4,s8
ffffffffc02045d8:	b729                	j	ffffffffc02044e2 <do_execve+0x3ae>
ffffffffc02045da:	5a61                	li	s4,-8
ffffffffc02045dc:	bd99                	j	ffffffffc0204432 <do_execve+0x2fe>
ffffffffc02045de:	00004617          	auipc	a2,0x4
ffffffffc02045e2:	5d260613          	addi	a2,a2,1490 # ffffffffc0208bb0 <commands+0x9f0>
ffffffffc02045e6:	06900593          	li	a1,105
ffffffffc02045ea:	00004517          	auipc	a0,0x4
ffffffffc02045ee:	5ee50513          	addi	a0,a0,1518 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc02045f2:	c17fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02045f6:	00004617          	auipc	a2,0x4
ffffffffc02045fa:	62a60613          	addi	a2,a2,1578 # ffffffffc0208c20 <commands+0xa60>
ffffffffc02045fe:	06e00593          	li	a1,110
ffffffffc0204602:	00004517          	auipc	a0,0x4
ffffffffc0204606:	5d650513          	addi	a0,a0,1494 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc020460a:	bfffb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020460e:	00004617          	auipc	a2,0x4
ffffffffc0204612:	63a60613          	addi	a2,a2,1594 # ffffffffc0208c48 <commands+0xa88>
ffffffffc0204616:	06200593          	li	a1,98
ffffffffc020461a:	00004517          	auipc	a0,0x4
ffffffffc020461e:	5be50513          	addi	a0,a0,1470 # ffffffffc0208bd8 <commands+0xa18>
ffffffffc0204622:	be7fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204626:	00004617          	auipc	a2,0x4
ffffffffc020462a:	5fa60613          	addi	a2,a2,1530 # ffffffffc0208c20 <commands+0xa60>
ffffffffc020462e:	27300593          	li	a1,627
ffffffffc0204632:	00005517          	auipc	a0,0x5
ffffffffc0204636:	f4650513          	addi	a0,a0,-186 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc020463a:	bcffb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020463e:	00005697          	auipc	a3,0x5
ffffffffc0204642:	1fa68693          	addi	a3,a3,506 # ffffffffc0209838 <default_pmm_manager+0x648>
ffffffffc0204646:	00004617          	auipc	a2,0x4
ffffffffc020464a:	f8a60613          	addi	a2,a2,-118 # ffffffffc02085d0 <commands+0x410>
ffffffffc020464e:	26e00593          	li	a1,622
ffffffffc0204652:	00005517          	auipc	a0,0x5
ffffffffc0204656:	f2650513          	addi	a0,a0,-218 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc020465a:	baffb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020465e:	00005697          	auipc	a3,0x5
ffffffffc0204662:	19268693          	addi	a3,a3,402 # ffffffffc02097f0 <default_pmm_manager+0x600>
ffffffffc0204666:	00004617          	auipc	a2,0x4
ffffffffc020466a:	f6a60613          	addi	a2,a2,-150 # ffffffffc02085d0 <commands+0x410>
ffffffffc020466e:	26d00593          	li	a1,621
ffffffffc0204672:	00005517          	auipc	a0,0x5
ffffffffc0204676:	f0650513          	addi	a0,a0,-250 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc020467a:	b8ffb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020467e:	00005697          	auipc	a3,0x5
ffffffffc0204682:	12a68693          	addi	a3,a3,298 # ffffffffc02097a8 <default_pmm_manager+0x5b8>
ffffffffc0204686:	00004617          	auipc	a2,0x4
ffffffffc020468a:	f4a60613          	addi	a2,a2,-182 # ffffffffc02085d0 <commands+0x410>
ffffffffc020468e:	26c00593          	li	a1,620
ffffffffc0204692:	00005517          	auipc	a0,0x5
ffffffffc0204696:	ee650513          	addi	a0,a0,-282 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc020469a:	b6ffb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020469e:	00005697          	auipc	a3,0x5
ffffffffc02046a2:	0c268693          	addi	a3,a3,194 # ffffffffc0209760 <default_pmm_manager+0x570>
ffffffffc02046a6:	00004617          	auipc	a2,0x4
ffffffffc02046aa:	f2a60613          	addi	a2,a2,-214 # ffffffffc02085d0 <commands+0x410>
ffffffffc02046ae:	26b00593          	li	a1,619
ffffffffc02046b2:	00005517          	auipc	a0,0x5
ffffffffc02046b6:	ec650513          	addi	a0,a0,-314 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc02046ba:	b4ffb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02046be <do_yield>:
ffffffffc02046be:	00015797          	auipc	a5,0x15
ffffffffc02046c2:	e3a7b783          	ld	a5,-454(a5) # ffffffffc02194f8 <current>
ffffffffc02046c6:	4705                	li	a4,1
ffffffffc02046c8:	ef98                	sd	a4,24(a5)
ffffffffc02046ca:	4501                	li	a0,0
ffffffffc02046cc:	8082                	ret

ffffffffc02046ce <do_wait>:
ffffffffc02046ce:	1101                	addi	sp,sp,-32
ffffffffc02046d0:	e822                	sd	s0,16(sp)
ffffffffc02046d2:	e426                	sd	s1,8(sp)
ffffffffc02046d4:	ec06                	sd	ra,24(sp)
ffffffffc02046d6:	842e                	mv	s0,a1
ffffffffc02046d8:	84aa                	mv	s1,a0
ffffffffc02046da:	c999                	beqz	a1,ffffffffc02046f0 <do_wait+0x22>
ffffffffc02046dc:	00015797          	auipc	a5,0x15
ffffffffc02046e0:	e1c7b783          	ld	a5,-484(a5) # ffffffffc02194f8 <current>
ffffffffc02046e4:	7788                	ld	a0,40(a5)
ffffffffc02046e6:	4685                	li	a3,1
ffffffffc02046e8:	4611                	li	a2,4
ffffffffc02046ea:	addfc0ef          	jal	ra,ffffffffc02011c6 <user_mem_check>
ffffffffc02046ee:	c909                	beqz	a0,ffffffffc0204700 <do_wait+0x32>
ffffffffc02046f0:	85a2                	mv	a1,s0
ffffffffc02046f2:	6442                	ld	s0,16(sp)
ffffffffc02046f4:	60e2                	ld	ra,24(sp)
ffffffffc02046f6:	8526                	mv	a0,s1
ffffffffc02046f8:	64a2                	ld	s1,8(sp)
ffffffffc02046fa:	6105                	addi	sp,sp,32
ffffffffc02046fc:	fa6ff06f          	j	ffffffffc0203ea2 <do_wait.part.0>
ffffffffc0204700:	60e2                	ld	ra,24(sp)
ffffffffc0204702:	6442                	ld	s0,16(sp)
ffffffffc0204704:	64a2                	ld	s1,8(sp)
ffffffffc0204706:	5575                	li	a0,-3
ffffffffc0204708:	6105                	addi	sp,sp,32
ffffffffc020470a:	8082                	ret

ffffffffc020470c <do_kill>:
ffffffffc020470c:	1141                	addi	sp,sp,-16
ffffffffc020470e:	e406                	sd	ra,8(sp)
ffffffffc0204710:	e022                	sd	s0,0(sp)
ffffffffc0204712:	960ff0ef          	jal	ra,ffffffffc0203872 <find_proc>
ffffffffc0204716:	cd0d                	beqz	a0,ffffffffc0204750 <do_kill+0x44>
ffffffffc0204718:	0b052703          	lw	a4,176(a0)
ffffffffc020471c:	00177693          	andi	a3,a4,1
ffffffffc0204720:	e695                	bnez	a3,ffffffffc020474c <do_kill+0x40>
ffffffffc0204722:	0ec52683          	lw	a3,236(a0)
ffffffffc0204726:	00176713          	ori	a4,a4,1
ffffffffc020472a:	0ae52823          	sw	a4,176(a0)
ffffffffc020472e:	4401                	li	s0,0
ffffffffc0204730:	0006c763          	bltz	a3,ffffffffc020473e <do_kill+0x32>
ffffffffc0204734:	60a2                	ld	ra,8(sp)
ffffffffc0204736:	8522                	mv	a0,s0
ffffffffc0204738:	6402                	ld	s0,0(sp)
ffffffffc020473a:	0141                	addi	sp,sp,16
ffffffffc020473c:	8082                	ret
ffffffffc020473e:	276000ef          	jal	ra,ffffffffc02049b4 <wakeup_proc>
ffffffffc0204742:	60a2                	ld	ra,8(sp)
ffffffffc0204744:	8522                	mv	a0,s0
ffffffffc0204746:	6402                	ld	s0,0(sp)
ffffffffc0204748:	0141                	addi	sp,sp,16
ffffffffc020474a:	8082                	ret
ffffffffc020474c:	545d                	li	s0,-9
ffffffffc020474e:	b7dd                	j	ffffffffc0204734 <do_kill+0x28>
ffffffffc0204750:	5475                	li	s0,-3
ffffffffc0204752:	b7cd                	j	ffffffffc0204734 <do_kill+0x28>

ffffffffc0204754 <proc_init>:
ffffffffc0204754:	1101                	addi	sp,sp,-32
ffffffffc0204756:	00015797          	auipc	a5,0x15
ffffffffc020475a:	fe278793          	addi	a5,a5,-30 # ffffffffc0219738 <proc_list>
ffffffffc020475e:	ec06                	sd	ra,24(sp)
ffffffffc0204760:	e822                	sd	s0,16(sp)
ffffffffc0204762:	e426                	sd	s1,8(sp)
ffffffffc0204764:	e04a                	sd	s2,0(sp)
ffffffffc0204766:	e79c                	sd	a5,8(a5)
ffffffffc0204768:	e39c                	sd	a5,0(a5)
ffffffffc020476a:	00015717          	auipc	a4,0x15
ffffffffc020476e:	d2670713          	addi	a4,a4,-730 # ffffffffc0219490 <__rq>
ffffffffc0204772:	00011797          	auipc	a5,0x11
ffffffffc0204776:	d1e78793          	addi	a5,a5,-738 # ffffffffc0215490 <hash_list>
ffffffffc020477a:	e79c                	sd	a5,8(a5)
ffffffffc020477c:	e39c                	sd	a5,0(a5)
ffffffffc020477e:	07c1                	addi	a5,a5,16
ffffffffc0204780:	fef71de3          	bne	a4,a5,ffffffffc020477a <proc_init+0x26>
ffffffffc0204784:	f57fe0ef          	jal	ra,ffffffffc02036da <alloc_proc>
ffffffffc0204788:	00015417          	auipc	s0,0x15
ffffffffc020478c:	d7840413          	addi	s0,s0,-648 # ffffffffc0219500 <idleproc>
ffffffffc0204790:	e008                	sd	a0,0(s0)
ffffffffc0204792:	c541                	beqz	a0,ffffffffc020481a <proc_init+0xc6>
ffffffffc0204794:	4709                	li	a4,2
ffffffffc0204796:	e118                	sd	a4,0(a0)
ffffffffc0204798:	4485                	li	s1,1
ffffffffc020479a:	00007717          	auipc	a4,0x7
ffffffffc020479e:	86670713          	addi	a4,a4,-1946 # ffffffffc020b000 <bootstack>
ffffffffc02047a2:	00005597          	auipc	a1,0x5
ffffffffc02047a6:	0f658593          	addi	a1,a1,246 # ffffffffc0209898 <default_pmm_manager+0x6a8>
ffffffffc02047aa:	e918                	sd	a4,16(a0)
ffffffffc02047ac:	ed04                	sd	s1,24(a0)
ffffffffc02047ae:	82eff0ef          	jal	ra,ffffffffc02037dc <set_proc_name>
ffffffffc02047b2:	00015717          	auipc	a4,0x15
ffffffffc02047b6:	d5e70713          	addi	a4,a4,-674 # ffffffffc0219510 <nr_process>
ffffffffc02047ba:	431c                	lw	a5,0(a4)
ffffffffc02047bc:	6014                	ld	a3,0(s0)
ffffffffc02047be:	4601                	li	a2,0
ffffffffc02047c0:	2785                	addiw	a5,a5,1
ffffffffc02047c2:	4581                	li	a1,0
ffffffffc02047c4:	00000517          	auipc	a0,0x0
ffffffffc02047c8:	87450513          	addi	a0,a0,-1932 # ffffffffc0204038 <init_main>
ffffffffc02047cc:	c31c                	sw	a5,0(a4)
ffffffffc02047ce:	00015797          	auipc	a5,0x15
ffffffffc02047d2:	d2d7b523          	sd	a3,-726(a5) # ffffffffc02194f8 <current>
ffffffffc02047d6:	cc6ff0ef          	jal	ra,ffffffffc0203c9c <kernel_thread>
ffffffffc02047da:	08a05c63          	blez	a0,ffffffffc0204872 <proc_init+0x11e>
ffffffffc02047de:	894ff0ef          	jal	ra,ffffffffc0203872 <find_proc>
ffffffffc02047e2:	00015917          	auipc	s2,0x15
ffffffffc02047e6:	d2690913          	addi	s2,s2,-730 # ffffffffc0219508 <initproc>
ffffffffc02047ea:	00005597          	auipc	a1,0x5
ffffffffc02047ee:	0d658593          	addi	a1,a1,214 # ffffffffc02098c0 <default_pmm_manager+0x6d0>
ffffffffc02047f2:	00a93023          	sd	a0,0(s2)
ffffffffc02047f6:	fe7fe0ef          	jal	ra,ffffffffc02037dc <set_proc_name>
ffffffffc02047fa:	601c                	ld	a5,0(s0)
ffffffffc02047fc:	cbb9                	beqz	a5,ffffffffc0204852 <proc_init+0xfe>
ffffffffc02047fe:	43dc                	lw	a5,4(a5)
ffffffffc0204800:	eba9                	bnez	a5,ffffffffc0204852 <proc_init+0xfe>
ffffffffc0204802:	00093783          	ld	a5,0(s2)
ffffffffc0204806:	c795                	beqz	a5,ffffffffc0204832 <proc_init+0xde>
ffffffffc0204808:	43dc                	lw	a5,4(a5)
ffffffffc020480a:	02979463          	bne	a5,s1,ffffffffc0204832 <proc_init+0xde>
ffffffffc020480e:	60e2                	ld	ra,24(sp)
ffffffffc0204810:	6442                	ld	s0,16(sp)
ffffffffc0204812:	64a2                	ld	s1,8(sp)
ffffffffc0204814:	6902                	ld	s2,0(sp)
ffffffffc0204816:	6105                	addi	sp,sp,32
ffffffffc0204818:	8082                	ret
ffffffffc020481a:	00005617          	auipc	a2,0x5
ffffffffc020481e:	06660613          	addi	a2,a2,102 # ffffffffc0209880 <default_pmm_manager+0x690>
ffffffffc0204822:	37400593          	li	a1,884
ffffffffc0204826:	00005517          	auipc	a0,0x5
ffffffffc020482a:	d5250513          	addi	a0,a0,-686 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc020482e:	9dbfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204832:	00005697          	auipc	a3,0x5
ffffffffc0204836:	0be68693          	addi	a3,a3,190 # ffffffffc02098f0 <default_pmm_manager+0x700>
ffffffffc020483a:	00004617          	auipc	a2,0x4
ffffffffc020483e:	d9660613          	addi	a2,a2,-618 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204842:	38900593          	li	a1,905
ffffffffc0204846:	00005517          	auipc	a0,0x5
ffffffffc020484a:	d3250513          	addi	a0,a0,-718 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc020484e:	9bbfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204852:	00005697          	auipc	a3,0x5
ffffffffc0204856:	07668693          	addi	a3,a3,118 # ffffffffc02098c8 <default_pmm_manager+0x6d8>
ffffffffc020485a:	00004617          	auipc	a2,0x4
ffffffffc020485e:	d7660613          	addi	a2,a2,-650 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204862:	38800593          	li	a1,904
ffffffffc0204866:	00005517          	auipc	a0,0x5
ffffffffc020486a:	d1250513          	addi	a0,a0,-750 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc020486e:	99bfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204872:	00005617          	auipc	a2,0x5
ffffffffc0204876:	02e60613          	addi	a2,a2,46 # ffffffffc02098a0 <default_pmm_manager+0x6b0>
ffffffffc020487a:	38200593          	li	a1,898
ffffffffc020487e:	00005517          	auipc	a0,0x5
ffffffffc0204882:	cfa50513          	addi	a0,a0,-774 # ffffffffc0209578 <default_pmm_manager+0x388>
ffffffffc0204886:	983fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020488a <cpu_idle>:
ffffffffc020488a:	1141                	addi	sp,sp,-16
ffffffffc020488c:	e022                	sd	s0,0(sp)
ffffffffc020488e:	e406                	sd	ra,8(sp)
ffffffffc0204890:	00015417          	auipc	s0,0x15
ffffffffc0204894:	c6840413          	addi	s0,s0,-920 # ffffffffc02194f8 <current>
ffffffffc0204898:	6018                	ld	a4,0(s0)
ffffffffc020489a:	6f1c                	ld	a5,24(a4)
ffffffffc020489c:	dffd                	beqz	a5,ffffffffc020489a <cpu_idle+0x10>
ffffffffc020489e:	1c8000ef          	jal	ra,ffffffffc0204a66 <schedule>
ffffffffc02048a2:	bfdd                	j	ffffffffc0204898 <cpu_idle+0xe>

ffffffffc02048a4 <lab6_set_priority>:
ffffffffc02048a4:	1141                	addi	sp,sp,-16
ffffffffc02048a6:	e022                	sd	s0,0(sp)
ffffffffc02048a8:	85aa                	mv	a1,a0
ffffffffc02048aa:	842a                	mv	s0,a0
ffffffffc02048ac:	00005517          	auipc	a0,0x5
ffffffffc02048b0:	06c50513          	addi	a0,a0,108 # ffffffffc0209918 <default_pmm_manager+0x728>
ffffffffc02048b4:	e406                	sd	ra,8(sp)
ffffffffc02048b6:	817fb0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02048ba:	00015797          	auipc	a5,0x15
ffffffffc02048be:	c3e7b783          	ld	a5,-962(a5) # ffffffffc02194f8 <current>
ffffffffc02048c2:	e801                	bnez	s0,ffffffffc02048d2 <lab6_set_priority+0x2e>
ffffffffc02048c4:	60a2                	ld	ra,8(sp)
ffffffffc02048c6:	6402                	ld	s0,0(sp)
ffffffffc02048c8:	4705                	li	a4,1
ffffffffc02048ca:	14e7a223          	sw	a4,324(a5)
ffffffffc02048ce:	0141                	addi	sp,sp,16
ffffffffc02048d0:	8082                	ret
ffffffffc02048d2:	60a2                	ld	ra,8(sp)
ffffffffc02048d4:	1487a223          	sw	s0,324(a5)
ffffffffc02048d8:	6402                	ld	s0,0(sp)
ffffffffc02048da:	0141                	addi	sp,sp,16
ffffffffc02048dc:	8082                	ret

ffffffffc02048de <do_sleep>:
ffffffffc02048de:	c539                	beqz	a0,ffffffffc020492c <do_sleep+0x4e>
ffffffffc02048e0:	7179                	addi	sp,sp,-48
ffffffffc02048e2:	f022                	sd	s0,32(sp)
ffffffffc02048e4:	f406                	sd	ra,40(sp)
ffffffffc02048e6:	842a                	mv	s0,a0
ffffffffc02048e8:	100027f3          	csrr	a5,sstatus
ffffffffc02048ec:	8b89                	andi	a5,a5,2
ffffffffc02048ee:	e3a9                	bnez	a5,ffffffffc0204930 <do_sleep+0x52>
ffffffffc02048f0:	00015797          	auipc	a5,0x15
ffffffffc02048f4:	c087b783          	ld	a5,-1016(a5) # ffffffffc02194f8 <current>
ffffffffc02048f8:	0818                	addi	a4,sp,16
ffffffffc02048fa:	c02a                	sw	a0,0(sp)
ffffffffc02048fc:	ec3a                	sd	a4,24(sp)
ffffffffc02048fe:	e83a                	sd	a4,16(sp)
ffffffffc0204900:	e43e                	sd	a5,8(sp)
ffffffffc0204902:	4705                	li	a4,1
ffffffffc0204904:	c398                	sw	a4,0(a5)
ffffffffc0204906:	80000737          	lui	a4,0x80000
ffffffffc020490a:	840a                	mv	s0,sp
ffffffffc020490c:	2709                	addiw	a4,a4,2
ffffffffc020490e:	0ee7a623          	sw	a4,236(a5)
ffffffffc0204912:	8522                	mv	a0,s0
ffffffffc0204914:	218000ef          	jal	ra,ffffffffc0204b2c <add_timer>
ffffffffc0204918:	14e000ef          	jal	ra,ffffffffc0204a66 <schedule>
ffffffffc020491c:	8522                	mv	a0,s0
ffffffffc020491e:	2d6000ef          	jal	ra,ffffffffc0204bf4 <del_timer>
ffffffffc0204922:	70a2                	ld	ra,40(sp)
ffffffffc0204924:	7402                	ld	s0,32(sp)
ffffffffc0204926:	4501                	li	a0,0
ffffffffc0204928:	6145                	addi	sp,sp,48
ffffffffc020492a:	8082                	ret
ffffffffc020492c:	4501                	li	a0,0
ffffffffc020492e:	8082                	ret
ffffffffc0204930:	d09fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204934:	00015797          	auipc	a5,0x15
ffffffffc0204938:	bc47b783          	ld	a5,-1084(a5) # ffffffffc02194f8 <current>
ffffffffc020493c:	0818                	addi	a4,sp,16
ffffffffc020493e:	c022                	sw	s0,0(sp)
ffffffffc0204940:	e43e                	sd	a5,8(sp)
ffffffffc0204942:	ec3a                	sd	a4,24(sp)
ffffffffc0204944:	e83a                	sd	a4,16(sp)
ffffffffc0204946:	4705                	li	a4,1
ffffffffc0204948:	c398                	sw	a4,0(a5)
ffffffffc020494a:	80000737          	lui	a4,0x80000
ffffffffc020494e:	2709                	addiw	a4,a4,2
ffffffffc0204950:	840a                	mv	s0,sp
ffffffffc0204952:	8522                	mv	a0,s0
ffffffffc0204954:	0ee7a623          	sw	a4,236(a5)
ffffffffc0204958:	1d4000ef          	jal	ra,ffffffffc0204b2c <add_timer>
ffffffffc020495c:	cd7fb0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0204960:	bf65                	j	ffffffffc0204918 <do_sleep+0x3a>

ffffffffc0204962 <sched_init>:
ffffffffc0204962:	1141                	addi	sp,sp,-16
ffffffffc0204964:	00009717          	auipc	a4,0x9
ffffffffc0204968:	6ec70713          	addi	a4,a4,1772 # ffffffffc020e050 <default_sched_class>
ffffffffc020496c:	e022                	sd	s0,0(sp)
ffffffffc020496e:	e406                	sd	ra,8(sp)
ffffffffc0204970:	00015797          	auipc	a5,0x15
ffffffffc0204974:	b4078793          	addi	a5,a5,-1216 # ffffffffc02194b0 <timer_list>
ffffffffc0204978:	6714                	ld	a3,8(a4)
ffffffffc020497a:	00015517          	auipc	a0,0x15
ffffffffc020497e:	b1650513          	addi	a0,a0,-1258 # ffffffffc0219490 <__rq>
ffffffffc0204982:	e79c                	sd	a5,8(a5)
ffffffffc0204984:	e39c                	sd	a5,0(a5)
ffffffffc0204986:	4795                	li	a5,5
ffffffffc0204988:	c95c                	sw	a5,20(a0)
ffffffffc020498a:	00015417          	auipc	s0,0x15
ffffffffc020498e:	b9640413          	addi	s0,s0,-1130 # ffffffffc0219520 <sched_class>
ffffffffc0204992:	00015797          	auipc	a5,0x15
ffffffffc0204996:	b8a7b323          	sd	a0,-1146(a5) # ffffffffc0219518 <rq>
ffffffffc020499a:	e018                	sd	a4,0(s0)
ffffffffc020499c:	9682                	jalr	a3
ffffffffc020499e:	601c                	ld	a5,0(s0)
ffffffffc02049a0:	6402                	ld	s0,0(sp)
ffffffffc02049a2:	60a2                	ld	ra,8(sp)
ffffffffc02049a4:	638c                	ld	a1,0(a5)
ffffffffc02049a6:	00005517          	auipc	a0,0x5
ffffffffc02049aa:	f8a50513          	addi	a0,a0,-118 # ffffffffc0209930 <default_pmm_manager+0x740>
ffffffffc02049ae:	0141                	addi	sp,sp,16
ffffffffc02049b0:	f1cfb06f          	j	ffffffffc02000cc <cprintf>

ffffffffc02049b4 <wakeup_proc>:
ffffffffc02049b4:	4118                	lw	a4,0(a0)
ffffffffc02049b6:	1101                	addi	sp,sp,-32
ffffffffc02049b8:	ec06                	sd	ra,24(sp)
ffffffffc02049ba:	e822                	sd	s0,16(sp)
ffffffffc02049bc:	e426                	sd	s1,8(sp)
ffffffffc02049be:	478d                	li	a5,3
ffffffffc02049c0:	08f70363          	beq	a4,a5,ffffffffc0204a46 <wakeup_proc+0x92>
ffffffffc02049c4:	842a                	mv	s0,a0
ffffffffc02049c6:	100027f3          	csrr	a5,sstatus
ffffffffc02049ca:	8b89                	andi	a5,a5,2
ffffffffc02049cc:	4481                	li	s1,0
ffffffffc02049ce:	e7bd                	bnez	a5,ffffffffc0204a3c <wakeup_proc+0x88>
ffffffffc02049d0:	4789                	li	a5,2
ffffffffc02049d2:	04f70863          	beq	a4,a5,ffffffffc0204a22 <wakeup_proc+0x6e>
ffffffffc02049d6:	c01c                	sw	a5,0(s0)
ffffffffc02049d8:	0e042623          	sw	zero,236(s0)
ffffffffc02049dc:	00015797          	auipc	a5,0x15
ffffffffc02049e0:	b1c7b783          	ld	a5,-1252(a5) # ffffffffc02194f8 <current>
ffffffffc02049e4:	02878363          	beq	a5,s0,ffffffffc0204a0a <wakeup_proc+0x56>
ffffffffc02049e8:	00015797          	auipc	a5,0x15
ffffffffc02049ec:	b187b783          	ld	a5,-1256(a5) # ffffffffc0219500 <idleproc>
ffffffffc02049f0:	00f40d63          	beq	s0,a5,ffffffffc0204a0a <wakeup_proc+0x56>
ffffffffc02049f4:	00015797          	auipc	a5,0x15
ffffffffc02049f8:	b2c7b783          	ld	a5,-1236(a5) # ffffffffc0219520 <sched_class>
ffffffffc02049fc:	6b9c                	ld	a5,16(a5)
ffffffffc02049fe:	85a2                	mv	a1,s0
ffffffffc0204a00:	00015517          	auipc	a0,0x15
ffffffffc0204a04:	b1853503          	ld	a0,-1256(a0) # ffffffffc0219518 <rq>
ffffffffc0204a08:	9782                	jalr	a5
ffffffffc0204a0a:	e491                	bnez	s1,ffffffffc0204a16 <wakeup_proc+0x62>
ffffffffc0204a0c:	60e2                	ld	ra,24(sp)
ffffffffc0204a0e:	6442                	ld	s0,16(sp)
ffffffffc0204a10:	64a2                	ld	s1,8(sp)
ffffffffc0204a12:	6105                	addi	sp,sp,32
ffffffffc0204a14:	8082                	ret
ffffffffc0204a16:	6442                	ld	s0,16(sp)
ffffffffc0204a18:	60e2                	ld	ra,24(sp)
ffffffffc0204a1a:	64a2                	ld	s1,8(sp)
ffffffffc0204a1c:	6105                	addi	sp,sp,32
ffffffffc0204a1e:	c15fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204a22:	00005617          	auipc	a2,0x5
ffffffffc0204a26:	f5e60613          	addi	a2,a2,-162 # ffffffffc0209980 <default_pmm_manager+0x790>
ffffffffc0204a2a:	04800593          	li	a1,72
ffffffffc0204a2e:	00005517          	auipc	a0,0x5
ffffffffc0204a32:	f3a50513          	addi	a0,a0,-198 # ffffffffc0209968 <default_pmm_manager+0x778>
ffffffffc0204a36:	83bfb0ef          	jal	ra,ffffffffc0200270 <__warn>
ffffffffc0204a3a:	bfc1                	j	ffffffffc0204a0a <wakeup_proc+0x56>
ffffffffc0204a3c:	bfdfb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204a40:	4018                	lw	a4,0(s0)
ffffffffc0204a42:	4485                	li	s1,1
ffffffffc0204a44:	b771                	j	ffffffffc02049d0 <wakeup_proc+0x1c>
ffffffffc0204a46:	00005697          	auipc	a3,0x5
ffffffffc0204a4a:	f0268693          	addi	a3,a3,-254 # ffffffffc0209948 <default_pmm_manager+0x758>
ffffffffc0204a4e:	00004617          	auipc	a2,0x4
ffffffffc0204a52:	b8260613          	addi	a2,a2,-1150 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204a56:	03c00593          	li	a1,60
ffffffffc0204a5a:	00005517          	auipc	a0,0x5
ffffffffc0204a5e:	f0e50513          	addi	a0,a0,-242 # ffffffffc0209968 <default_pmm_manager+0x778>
ffffffffc0204a62:	fa6fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204a66 <schedule>:
ffffffffc0204a66:	7179                	addi	sp,sp,-48
ffffffffc0204a68:	f406                	sd	ra,40(sp)
ffffffffc0204a6a:	f022                	sd	s0,32(sp)
ffffffffc0204a6c:	ec26                	sd	s1,24(sp)
ffffffffc0204a6e:	e84a                	sd	s2,16(sp)
ffffffffc0204a70:	e44e                	sd	s3,8(sp)
ffffffffc0204a72:	e052                	sd	s4,0(sp)
ffffffffc0204a74:	100027f3          	csrr	a5,sstatus
ffffffffc0204a78:	8b89                	andi	a5,a5,2
ffffffffc0204a7a:	4a01                	li	s4,0
ffffffffc0204a7c:	e7c5                	bnez	a5,ffffffffc0204b24 <schedule+0xbe>
ffffffffc0204a7e:	00015497          	auipc	s1,0x15
ffffffffc0204a82:	a7a48493          	addi	s1,s1,-1414 # ffffffffc02194f8 <current>
ffffffffc0204a86:	608c                	ld	a1,0(s1)
ffffffffc0204a88:	00015997          	auipc	s3,0x15
ffffffffc0204a8c:	a9898993          	addi	s3,s3,-1384 # ffffffffc0219520 <sched_class>
ffffffffc0204a90:	00015917          	auipc	s2,0x15
ffffffffc0204a94:	a8890913          	addi	s2,s2,-1400 # ffffffffc0219518 <rq>
ffffffffc0204a98:	4194                	lw	a3,0(a1)
ffffffffc0204a9a:	0005bc23          	sd	zero,24(a1)
ffffffffc0204a9e:	4709                	li	a4,2
ffffffffc0204aa0:	0009b783          	ld	a5,0(s3)
ffffffffc0204aa4:	00093503          	ld	a0,0(s2)
ffffffffc0204aa8:	04e68063          	beq	a3,a4,ffffffffc0204ae8 <schedule+0x82>
ffffffffc0204aac:	739c                	ld	a5,32(a5)
ffffffffc0204aae:	9782                	jalr	a5
ffffffffc0204ab0:	842a                	mv	s0,a0
ffffffffc0204ab2:	c939                	beqz	a0,ffffffffc0204b08 <schedule+0xa2>
ffffffffc0204ab4:	0009b783          	ld	a5,0(s3)
ffffffffc0204ab8:	00093503          	ld	a0,0(s2)
ffffffffc0204abc:	85a2                	mv	a1,s0
ffffffffc0204abe:	6f9c                	ld	a5,24(a5)
ffffffffc0204ac0:	9782                	jalr	a5
ffffffffc0204ac2:	441c                	lw	a5,8(s0)
ffffffffc0204ac4:	6098                	ld	a4,0(s1)
ffffffffc0204ac6:	2785                	addiw	a5,a5,1
ffffffffc0204ac8:	c41c                	sw	a5,8(s0)
ffffffffc0204aca:	00870563          	beq	a4,s0,ffffffffc0204ad4 <schedule+0x6e>
ffffffffc0204ace:	8522                	mv	a0,s0
ffffffffc0204ad0:	d37fe0ef          	jal	ra,ffffffffc0203806 <proc_run>
ffffffffc0204ad4:	020a1f63          	bnez	s4,ffffffffc0204b12 <schedule+0xac>
ffffffffc0204ad8:	70a2                	ld	ra,40(sp)
ffffffffc0204ada:	7402                	ld	s0,32(sp)
ffffffffc0204adc:	64e2                	ld	s1,24(sp)
ffffffffc0204ade:	6942                	ld	s2,16(sp)
ffffffffc0204ae0:	69a2                	ld	s3,8(sp)
ffffffffc0204ae2:	6a02                	ld	s4,0(sp)
ffffffffc0204ae4:	6145                	addi	sp,sp,48
ffffffffc0204ae6:	8082                	ret
ffffffffc0204ae8:	00015717          	auipc	a4,0x15
ffffffffc0204aec:	a1873703          	ld	a4,-1512(a4) # ffffffffc0219500 <idleproc>
ffffffffc0204af0:	fae58ee3          	beq	a1,a4,ffffffffc0204aac <schedule+0x46>
ffffffffc0204af4:	6b9c                	ld	a5,16(a5)
ffffffffc0204af6:	9782                	jalr	a5
ffffffffc0204af8:	0009b783          	ld	a5,0(s3)
ffffffffc0204afc:	00093503          	ld	a0,0(s2)
ffffffffc0204b00:	739c                	ld	a5,32(a5)
ffffffffc0204b02:	9782                	jalr	a5
ffffffffc0204b04:	842a                	mv	s0,a0
ffffffffc0204b06:	f55d                	bnez	a0,ffffffffc0204ab4 <schedule+0x4e>
ffffffffc0204b08:	00015417          	auipc	s0,0x15
ffffffffc0204b0c:	9f843403          	ld	s0,-1544(s0) # ffffffffc0219500 <idleproc>
ffffffffc0204b10:	bf4d                	j	ffffffffc0204ac2 <schedule+0x5c>
ffffffffc0204b12:	7402                	ld	s0,32(sp)
ffffffffc0204b14:	70a2                	ld	ra,40(sp)
ffffffffc0204b16:	64e2                	ld	s1,24(sp)
ffffffffc0204b18:	6942                	ld	s2,16(sp)
ffffffffc0204b1a:	69a2                	ld	s3,8(sp)
ffffffffc0204b1c:	6a02                	ld	s4,0(sp)
ffffffffc0204b1e:	6145                	addi	sp,sp,48
ffffffffc0204b20:	b13fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204b24:	b15fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204b28:	4a05                	li	s4,1
ffffffffc0204b2a:	bf91                	j	ffffffffc0204a7e <schedule+0x18>

ffffffffc0204b2c <add_timer>:
ffffffffc0204b2c:	1141                	addi	sp,sp,-16
ffffffffc0204b2e:	e022                	sd	s0,0(sp)
ffffffffc0204b30:	e406                	sd	ra,8(sp)
ffffffffc0204b32:	842a                	mv	s0,a0
ffffffffc0204b34:	100027f3          	csrr	a5,sstatus
ffffffffc0204b38:	8b89                	andi	a5,a5,2
ffffffffc0204b3a:	4501                	li	a0,0
ffffffffc0204b3c:	eba5                	bnez	a5,ffffffffc0204bac <add_timer+0x80>
ffffffffc0204b3e:	401c                	lw	a5,0(s0)
ffffffffc0204b40:	cbb5                	beqz	a5,ffffffffc0204bb4 <add_timer+0x88>
ffffffffc0204b42:	6418                	ld	a4,8(s0)
ffffffffc0204b44:	cb25                	beqz	a4,ffffffffc0204bb4 <add_timer+0x88>
ffffffffc0204b46:	6c18                	ld	a4,24(s0)
ffffffffc0204b48:	01040593          	addi	a1,s0,16
ffffffffc0204b4c:	08e59463          	bne	a1,a4,ffffffffc0204bd4 <add_timer+0xa8>
ffffffffc0204b50:	00015617          	auipc	a2,0x15
ffffffffc0204b54:	96060613          	addi	a2,a2,-1696 # ffffffffc02194b0 <timer_list>
ffffffffc0204b58:	6618                	ld	a4,8(a2)
ffffffffc0204b5a:	00c71863          	bne	a4,a2,ffffffffc0204b6a <add_timer+0x3e>
ffffffffc0204b5e:	a80d                	j	ffffffffc0204b90 <add_timer+0x64>
ffffffffc0204b60:	6718                	ld	a4,8(a4)
ffffffffc0204b62:	9f95                	subw	a5,a5,a3
ffffffffc0204b64:	c01c                	sw	a5,0(s0)
ffffffffc0204b66:	02c70563          	beq	a4,a2,ffffffffc0204b90 <add_timer+0x64>
ffffffffc0204b6a:	ff072683          	lw	a3,-16(a4)
ffffffffc0204b6e:	fed7f9e3          	bgeu	a5,a3,ffffffffc0204b60 <add_timer+0x34>
ffffffffc0204b72:	40f687bb          	subw	a5,a3,a5
ffffffffc0204b76:	fef72823          	sw	a5,-16(a4)
ffffffffc0204b7a:	631c                	ld	a5,0(a4)
ffffffffc0204b7c:	e30c                	sd	a1,0(a4)
ffffffffc0204b7e:	e78c                	sd	a1,8(a5)
ffffffffc0204b80:	ec18                	sd	a4,24(s0)
ffffffffc0204b82:	e81c                	sd	a5,16(s0)
ffffffffc0204b84:	c105                	beqz	a0,ffffffffc0204ba4 <add_timer+0x78>
ffffffffc0204b86:	6402                	ld	s0,0(sp)
ffffffffc0204b88:	60a2                	ld	ra,8(sp)
ffffffffc0204b8a:	0141                	addi	sp,sp,16
ffffffffc0204b8c:	aa7fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204b90:	00015717          	auipc	a4,0x15
ffffffffc0204b94:	92070713          	addi	a4,a4,-1760 # ffffffffc02194b0 <timer_list>
ffffffffc0204b98:	631c                	ld	a5,0(a4)
ffffffffc0204b9a:	e30c                	sd	a1,0(a4)
ffffffffc0204b9c:	e78c                	sd	a1,8(a5)
ffffffffc0204b9e:	ec18                	sd	a4,24(s0)
ffffffffc0204ba0:	e81c                	sd	a5,16(s0)
ffffffffc0204ba2:	f175                	bnez	a0,ffffffffc0204b86 <add_timer+0x5a>
ffffffffc0204ba4:	60a2                	ld	ra,8(sp)
ffffffffc0204ba6:	6402                	ld	s0,0(sp)
ffffffffc0204ba8:	0141                	addi	sp,sp,16
ffffffffc0204baa:	8082                	ret
ffffffffc0204bac:	a8dfb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204bb0:	4505                	li	a0,1
ffffffffc0204bb2:	b771                	j	ffffffffc0204b3e <add_timer+0x12>
ffffffffc0204bb4:	00005697          	auipc	a3,0x5
ffffffffc0204bb8:	dec68693          	addi	a3,a3,-532 # ffffffffc02099a0 <default_pmm_manager+0x7b0>
ffffffffc0204bbc:	00004617          	auipc	a2,0x4
ffffffffc0204bc0:	a1460613          	addi	a2,a2,-1516 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204bc4:	06c00593          	li	a1,108
ffffffffc0204bc8:	00005517          	auipc	a0,0x5
ffffffffc0204bcc:	da050513          	addi	a0,a0,-608 # ffffffffc0209968 <default_pmm_manager+0x778>
ffffffffc0204bd0:	e38fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204bd4:	00005697          	auipc	a3,0x5
ffffffffc0204bd8:	dfc68693          	addi	a3,a3,-516 # ffffffffc02099d0 <default_pmm_manager+0x7e0>
ffffffffc0204bdc:	00004617          	auipc	a2,0x4
ffffffffc0204be0:	9f460613          	addi	a2,a2,-1548 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204be4:	06d00593          	li	a1,109
ffffffffc0204be8:	00005517          	auipc	a0,0x5
ffffffffc0204bec:	d8050513          	addi	a0,a0,-640 # ffffffffc0209968 <default_pmm_manager+0x778>
ffffffffc0204bf0:	e18fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204bf4 <del_timer>:
ffffffffc0204bf4:	1101                	addi	sp,sp,-32
ffffffffc0204bf6:	e822                	sd	s0,16(sp)
ffffffffc0204bf8:	ec06                	sd	ra,24(sp)
ffffffffc0204bfa:	e426                	sd	s1,8(sp)
ffffffffc0204bfc:	842a                	mv	s0,a0
ffffffffc0204bfe:	100027f3          	csrr	a5,sstatus
ffffffffc0204c02:	8b89                	andi	a5,a5,2
ffffffffc0204c04:	01050493          	addi	s1,a0,16
ffffffffc0204c08:	eb9d                	bnez	a5,ffffffffc0204c3e <del_timer+0x4a>
ffffffffc0204c0a:	6d1c                	ld	a5,24(a0)
ffffffffc0204c0c:	02978463          	beq	a5,s1,ffffffffc0204c34 <del_timer+0x40>
ffffffffc0204c10:	4114                	lw	a3,0(a0)
ffffffffc0204c12:	6918                	ld	a4,16(a0)
ffffffffc0204c14:	ce81                	beqz	a3,ffffffffc0204c2c <del_timer+0x38>
ffffffffc0204c16:	00015617          	auipc	a2,0x15
ffffffffc0204c1a:	89a60613          	addi	a2,a2,-1894 # ffffffffc02194b0 <timer_list>
ffffffffc0204c1e:	00c78763          	beq	a5,a2,ffffffffc0204c2c <del_timer+0x38>
ffffffffc0204c22:	ff07a603          	lw	a2,-16(a5)
ffffffffc0204c26:	9eb1                	addw	a3,a3,a2
ffffffffc0204c28:	fed7a823          	sw	a3,-16(a5)
ffffffffc0204c2c:	e71c                	sd	a5,8(a4)
ffffffffc0204c2e:	e398                	sd	a4,0(a5)
ffffffffc0204c30:	ec04                	sd	s1,24(s0)
ffffffffc0204c32:	e804                	sd	s1,16(s0)
ffffffffc0204c34:	60e2                	ld	ra,24(sp)
ffffffffc0204c36:	6442                	ld	s0,16(sp)
ffffffffc0204c38:	64a2                	ld	s1,8(sp)
ffffffffc0204c3a:	6105                	addi	sp,sp,32
ffffffffc0204c3c:	8082                	ret
ffffffffc0204c3e:	9fbfb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204c42:	6c1c                	ld	a5,24(s0)
ffffffffc0204c44:	02978463          	beq	a5,s1,ffffffffc0204c6c <del_timer+0x78>
ffffffffc0204c48:	4014                	lw	a3,0(s0)
ffffffffc0204c4a:	6818                	ld	a4,16(s0)
ffffffffc0204c4c:	ce81                	beqz	a3,ffffffffc0204c64 <del_timer+0x70>
ffffffffc0204c4e:	00015617          	auipc	a2,0x15
ffffffffc0204c52:	86260613          	addi	a2,a2,-1950 # ffffffffc02194b0 <timer_list>
ffffffffc0204c56:	00c78763          	beq	a5,a2,ffffffffc0204c64 <del_timer+0x70>
ffffffffc0204c5a:	ff07a603          	lw	a2,-16(a5)
ffffffffc0204c5e:	9eb1                	addw	a3,a3,a2
ffffffffc0204c60:	fed7a823          	sw	a3,-16(a5)
ffffffffc0204c64:	e71c                	sd	a5,8(a4)
ffffffffc0204c66:	e398                	sd	a4,0(a5)
ffffffffc0204c68:	ec04                	sd	s1,24(s0)
ffffffffc0204c6a:	e804                	sd	s1,16(s0)
ffffffffc0204c6c:	6442                	ld	s0,16(sp)
ffffffffc0204c6e:	60e2                	ld	ra,24(sp)
ffffffffc0204c70:	64a2                	ld	s1,8(sp)
ffffffffc0204c72:	6105                	addi	sp,sp,32
ffffffffc0204c74:	9bffb06f          	j	ffffffffc0200632 <intr_enable>

ffffffffc0204c78 <run_timer_list>:
ffffffffc0204c78:	7139                	addi	sp,sp,-64
ffffffffc0204c7a:	fc06                	sd	ra,56(sp)
ffffffffc0204c7c:	f822                	sd	s0,48(sp)
ffffffffc0204c7e:	f426                	sd	s1,40(sp)
ffffffffc0204c80:	f04a                	sd	s2,32(sp)
ffffffffc0204c82:	ec4e                	sd	s3,24(sp)
ffffffffc0204c84:	e852                	sd	s4,16(sp)
ffffffffc0204c86:	e456                	sd	s5,8(sp)
ffffffffc0204c88:	e05a                	sd	s6,0(sp)
ffffffffc0204c8a:	100027f3          	csrr	a5,sstatus
ffffffffc0204c8e:	8b89                	andi	a5,a5,2
ffffffffc0204c90:	4b01                	li	s6,0
ffffffffc0204c92:	eff9                	bnez	a5,ffffffffc0204d70 <run_timer_list+0xf8>
ffffffffc0204c94:	00015997          	auipc	s3,0x15
ffffffffc0204c98:	81c98993          	addi	s3,s3,-2020 # ffffffffc02194b0 <timer_list>
ffffffffc0204c9c:	0089b403          	ld	s0,8(s3)
ffffffffc0204ca0:	07340a63          	beq	s0,s3,ffffffffc0204d14 <run_timer_list+0x9c>
ffffffffc0204ca4:	ff042783          	lw	a5,-16(s0)
ffffffffc0204ca8:	ff040913          	addi	s2,s0,-16
ffffffffc0204cac:	0e078663          	beqz	a5,ffffffffc0204d98 <run_timer_list+0x120>
ffffffffc0204cb0:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204cb4:	fee42823          	sw	a4,-16(s0)
ffffffffc0204cb8:	ef31                	bnez	a4,ffffffffc0204d14 <run_timer_list+0x9c>
ffffffffc0204cba:	00005a97          	auipc	s5,0x5
ffffffffc0204cbe:	d7ea8a93          	addi	s5,s5,-642 # ffffffffc0209a38 <default_pmm_manager+0x848>
ffffffffc0204cc2:	00005a17          	auipc	s4,0x5
ffffffffc0204cc6:	ca6a0a13          	addi	s4,s4,-858 # ffffffffc0209968 <default_pmm_manager+0x778>
ffffffffc0204cca:	a005                	j	ffffffffc0204cea <run_timer_list+0x72>
ffffffffc0204ccc:	0a07d663          	bgez	a5,ffffffffc0204d78 <run_timer_list+0x100>
ffffffffc0204cd0:	8526                	mv	a0,s1
ffffffffc0204cd2:	ce3ff0ef          	jal	ra,ffffffffc02049b4 <wakeup_proc>
ffffffffc0204cd6:	854a                	mv	a0,s2
ffffffffc0204cd8:	f1dff0ef          	jal	ra,ffffffffc0204bf4 <del_timer>
ffffffffc0204cdc:	03340c63          	beq	s0,s3,ffffffffc0204d14 <run_timer_list+0x9c>
ffffffffc0204ce0:	ff042783          	lw	a5,-16(s0)
ffffffffc0204ce4:	ff040913          	addi	s2,s0,-16
ffffffffc0204ce8:	e795                	bnez	a5,ffffffffc0204d14 <run_timer_list+0x9c>
ffffffffc0204cea:	00893483          	ld	s1,8(s2)
ffffffffc0204cee:	6400                	ld	s0,8(s0)
ffffffffc0204cf0:	0ec4a783          	lw	a5,236(s1)
ffffffffc0204cf4:	ffe1                	bnez	a5,ffffffffc0204ccc <run_timer_list+0x54>
ffffffffc0204cf6:	40d4                	lw	a3,4(s1)
ffffffffc0204cf8:	8656                	mv	a2,s5
ffffffffc0204cfa:	0a300593          	li	a1,163
ffffffffc0204cfe:	8552                	mv	a0,s4
ffffffffc0204d00:	d70fb0ef          	jal	ra,ffffffffc0200270 <__warn>
ffffffffc0204d04:	8526                	mv	a0,s1
ffffffffc0204d06:	cafff0ef          	jal	ra,ffffffffc02049b4 <wakeup_proc>
ffffffffc0204d0a:	854a                	mv	a0,s2
ffffffffc0204d0c:	ee9ff0ef          	jal	ra,ffffffffc0204bf4 <del_timer>
ffffffffc0204d10:	fd3418e3          	bne	s0,s3,ffffffffc0204ce0 <run_timer_list+0x68>
ffffffffc0204d14:	00014597          	auipc	a1,0x14
ffffffffc0204d18:	7e45b583          	ld	a1,2020(a1) # ffffffffc02194f8 <current>
ffffffffc0204d1c:	00014797          	auipc	a5,0x14
ffffffffc0204d20:	7e47b783          	ld	a5,2020(a5) # ffffffffc0219500 <idleproc>
ffffffffc0204d24:	04f58363          	beq	a1,a5,ffffffffc0204d6a <run_timer_list+0xf2>
ffffffffc0204d28:	00014797          	auipc	a5,0x14
ffffffffc0204d2c:	7f87b783          	ld	a5,2040(a5) # ffffffffc0219520 <sched_class>
ffffffffc0204d30:	779c                	ld	a5,40(a5)
ffffffffc0204d32:	00014517          	auipc	a0,0x14
ffffffffc0204d36:	7e653503          	ld	a0,2022(a0) # ffffffffc0219518 <rq>
ffffffffc0204d3a:	9782                	jalr	a5
ffffffffc0204d3c:	000b1c63          	bnez	s6,ffffffffc0204d54 <run_timer_list+0xdc>
ffffffffc0204d40:	70e2                	ld	ra,56(sp)
ffffffffc0204d42:	7442                	ld	s0,48(sp)
ffffffffc0204d44:	74a2                	ld	s1,40(sp)
ffffffffc0204d46:	7902                	ld	s2,32(sp)
ffffffffc0204d48:	69e2                	ld	s3,24(sp)
ffffffffc0204d4a:	6a42                	ld	s4,16(sp)
ffffffffc0204d4c:	6aa2                	ld	s5,8(sp)
ffffffffc0204d4e:	6b02                	ld	s6,0(sp)
ffffffffc0204d50:	6121                	addi	sp,sp,64
ffffffffc0204d52:	8082                	ret
ffffffffc0204d54:	7442                	ld	s0,48(sp)
ffffffffc0204d56:	70e2                	ld	ra,56(sp)
ffffffffc0204d58:	74a2                	ld	s1,40(sp)
ffffffffc0204d5a:	7902                	ld	s2,32(sp)
ffffffffc0204d5c:	69e2                	ld	s3,24(sp)
ffffffffc0204d5e:	6a42                	ld	s4,16(sp)
ffffffffc0204d60:	6aa2                	ld	s5,8(sp)
ffffffffc0204d62:	6b02                	ld	s6,0(sp)
ffffffffc0204d64:	6121                	addi	sp,sp,64
ffffffffc0204d66:	8cdfb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204d6a:	4785                	li	a5,1
ffffffffc0204d6c:	ed9c                	sd	a5,24(a1)
ffffffffc0204d6e:	b7f9                	j	ffffffffc0204d3c <run_timer_list+0xc4>
ffffffffc0204d70:	8c9fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204d74:	4b05                	li	s6,1
ffffffffc0204d76:	bf39                	j	ffffffffc0204c94 <run_timer_list+0x1c>
ffffffffc0204d78:	00005697          	auipc	a3,0x5
ffffffffc0204d7c:	c9868693          	addi	a3,a3,-872 # ffffffffc0209a10 <default_pmm_manager+0x820>
ffffffffc0204d80:	00004617          	auipc	a2,0x4
ffffffffc0204d84:	85060613          	addi	a2,a2,-1968 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204d88:	0a000593          	li	a1,160
ffffffffc0204d8c:	00005517          	auipc	a0,0x5
ffffffffc0204d90:	bdc50513          	addi	a0,a0,-1060 # ffffffffc0209968 <default_pmm_manager+0x778>
ffffffffc0204d94:	c74fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204d98:	00005697          	auipc	a3,0x5
ffffffffc0204d9c:	c6068693          	addi	a3,a3,-928 # ffffffffc02099f8 <default_pmm_manager+0x808>
ffffffffc0204da0:	00004617          	auipc	a2,0x4
ffffffffc0204da4:	83060613          	addi	a2,a2,-2000 # ffffffffc02085d0 <commands+0x410>
ffffffffc0204da8:	09a00593          	li	a1,154
ffffffffc0204dac:	00005517          	auipc	a0,0x5
ffffffffc0204db0:	bbc50513          	addi	a0,a0,-1092 # ffffffffc0209968 <default_pmm_manager+0x778>
ffffffffc0204db4:	c54fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204db8 <proc_stride_comp_f>:
ffffffffc0204db8:	4d08                	lw	a0,24(a0)
ffffffffc0204dba:	4d9c                	lw	a5,24(a1)
ffffffffc0204dbc:	9d1d                	subw	a0,a0,a5
ffffffffc0204dbe:	00a04763          	bgtz	a0,ffffffffc0204dcc <proc_stride_comp_f+0x14>
ffffffffc0204dc2:	00a03533          	snez	a0,a0
ffffffffc0204dc6:	40a00533          	neg	a0,a0
ffffffffc0204dca:	8082                	ret
ffffffffc0204dcc:	4505                	li	a0,1
ffffffffc0204dce:	8082                	ret

ffffffffc0204dd0 <stride_init>:
ffffffffc0204dd0:	e508                	sd	a0,8(a0)
ffffffffc0204dd2:	e108                	sd	a0,0(a0)
ffffffffc0204dd4:	00053c23          	sd	zero,24(a0)
ffffffffc0204dd8:	00052823          	sw	zero,16(a0)
ffffffffc0204ddc:	8082                	ret

ffffffffc0204dde <stride_pick_next>:
ffffffffc0204dde:	6d1c                	ld	a5,24(a0)
ffffffffc0204de0:	cf89                	beqz	a5,ffffffffc0204dfa <stride_pick_next+0x1c>
ffffffffc0204de2:	4fd0                	lw	a2,28(a5)
ffffffffc0204de4:	4f98                	lw	a4,24(a5)
ffffffffc0204de6:	ed878513          	addi	a0,a5,-296
ffffffffc0204dea:	400006b7          	lui	a3,0x40000
ffffffffc0204dee:	c219                	beqz	a2,ffffffffc0204df4 <stride_pick_next+0x16>
ffffffffc0204df0:	02c6d6bb          	divuw	a3,a3,a2
ffffffffc0204df4:	9f35                	addw	a4,a4,a3
ffffffffc0204df6:	cf98                	sw	a4,24(a5)
ffffffffc0204df8:	8082                	ret
ffffffffc0204dfa:	4501                	li	a0,0
ffffffffc0204dfc:	8082                	ret

ffffffffc0204dfe <stride_proc_tick>:
ffffffffc0204dfe:	1205a783          	lw	a5,288(a1)
ffffffffc0204e02:	00f05563          	blez	a5,ffffffffc0204e0c <stride_proc_tick+0xe>
ffffffffc0204e06:	37fd                	addiw	a5,a5,-1
ffffffffc0204e08:	12f5a023          	sw	a5,288(a1)
ffffffffc0204e0c:	e399                	bnez	a5,ffffffffc0204e12 <stride_proc_tick+0x14>
ffffffffc0204e0e:	4785                	li	a5,1
ffffffffc0204e10:	ed9c                	sd	a5,24(a1)
ffffffffc0204e12:	8082                	ret

ffffffffc0204e14 <skew_heap_merge.constprop.0>:
ffffffffc0204e14:	1101                	addi	sp,sp,-32
ffffffffc0204e16:	e822                	sd	s0,16(sp)
ffffffffc0204e18:	ec06                	sd	ra,24(sp)
ffffffffc0204e1a:	e426                	sd	s1,8(sp)
ffffffffc0204e1c:	e04a                	sd	s2,0(sp)
ffffffffc0204e1e:	842e                	mv	s0,a1
ffffffffc0204e20:	c11d                	beqz	a0,ffffffffc0204e46 <skew_heap_merge.constprop.0+0x32>
ffffffffc0204e22:	84aa                	mv	s1,a0
ffffffffc0204e24:	c1b9                	beqz	a1,ffffffffc0204e6a <skew_heap_merge.constprop.0+0x56>
ffffffffc0204e26:	f93ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0204e2a:	57fd                	li	a5,-1
ffffffffc0204e2c:	02f50463          	beq	a0,a5,ffffffffc0204e54 <skew_heap_merge.constprop.0+0x40>
ffffffffc0204e30:	680c                	ld	a1,16(s0)
ffffffffc0204e32:	00843903          	ld	s2,8(s0)
ffffffffc0204e36:	8526                	mv	a0,s1
ffffffffc0204e38:	fddff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0204e3c:	e408                	sd	a0,8(s0)
ffffffffc0204e3e:	01243823          	sd	s2,16(s0)
ffffffffc0204e42:	c111                	beqz	a0,ffffffffc0204e46 <skew_heap_merge.constprop.0+0x32>
ffffffffc0204e44:	e100                	sd	s0,0(a0)
ffffffffc0204e46:	60e2                	ld	ra,24(sp)
ffffffffc0204e48:	8522                	mv	a0,s0
ffffffffc0204e4a:	6442                	ld	s0,16(sp)
ffffffffc0204e4c:	64a2                	ld	s1,8(sp)
ffffffffc0204e4e:	6902                	ld	s2,0(sp)
ffffffffc0204e50:	6105                	addi	sp,sp,32
ffffffffc0204e52:	8082                	ret
ffffffffc0204e54:	6888                	ld	a0,16(s1)
ffffffffc0204e56:	0084b903          	ld	s2,8(s1)
ffffffffc0204e5a:	85a2                	mv	a1,s0
ffffffffc0204e5c:	fb9ff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0204e60:	e488                	sd	a0,8(s1)
ffffffffc0204e62:	0124b823          	sd	s2,16(s1)
ffffffffc0204e66:	c111                	beqz	a0,ffffffffc0204e6a <skew_heap_merge.constprop.0+0x56>
ffffffffc0204e68:	e104                	sd	s1,0(a0)
ffffffffc0204e6a:	60e2                	ld	ra,24(sp)
ffffffffc0204e6c:	6442                	ld	s0,16(sp)
ffffffffc0204e6e:	6902                	ld	s2,0(sp)
ffffffffc0204e70:	8526                	mv	a0,s1
ffffffffc0204e72:	64a2                	ld	s1,8(sp)
ffffffffc0204e74:	6105                	addi	sp,sp,32
ffffffffc0204e76:	8082                	ret

ffffffffc0204e78 <stride_enqueue>:
ffffffffc0204e78:	7119                	addi	sp,sp,-128
ffffffffc0204e7a:	f4a6                	sd	s1,104(sp)
ffffffffc0204e7c:	6d04                	ld	s1,24(a0)
ffffffffc0204e7e:	f8a2                	sd	s0,112(sp)
ffffffffc0204e80:	f0ca                	sd	s2,96(sp)
ffffffffc0204e82:	e8d2                	sd	s4,80(sp)
ffffffffc0204e84:	fc86                	sd	ra,120(sp)
ffffffffc0204e86:	ecce                	sd	s3,88(sp)
ffffffffc0204e88:	e4d6                	sd	s5,72(sp)
ffffffffc0204e8a:	e0da                	sd	s6,64(sp)
ffffffffc0204e8c:	fc5e                	sd	s7,56(sp)
ffffffffc0204e8e:	f862                	sd	s8,48(sp)
ffffffffc0204e90:	f466                	sd	s9,40(sp)
ffffffffc0204e92:	f06a                	sd	s10,32(sp)
ffffffffc0204e94:	ec6e                	sd	s11,24(sp)
ffffffffc0204e96:	1205b423          	sd	zero,296(a1)
ffffffffc0204e9a:	1205bc23          	sd	zero,312(a1)
ffffffffc0204e9e:	1205b823          	sd	zero,304(a1)
ffffffffc0204ea2:	8a2a                	mv	s4,a0
ffffffffc0204ea4:	842e                	mv	s0,a1
ffffffffc0204ea6:	12858913          	addi	s2,a1,296
ffffffffc0204eaa:	cc89                	beqz	s1,ffffffffc0204ec4 <stride_enqueue+0x4c>
ffffffffc0204eac:	85ca                	mv	a1,s2
ffffffffc0204eae:	8526                	mv	a0,s1
ffffffffc0204eb0:	f09ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0204eb4:	57fd                	li	a5,-1
ffffffffc0204eb6:	89aa                	mv	s3,a0
ffffffffc0204eb8:	04f50763          	beq	a0,a5,ffffffffc0204f06 <stride_enqueue+0x8e>
ffffffffc0204ebc:	12943823          	sd	s1,304(s0)
ffffffffc0204ec0:	0124b023          	sd	s2,0(s1)
ffffffffc0204ec4:	12042783          	lw	a5,288(s0)
ffffffffc0204ec8:	012a3c23          	sd	s2,24(s4)
ffffffffc0204ecc:	014a2703          	lw	a4,20(s4)
ffffffffc0204ed0:	c399                	beqz	a5,ffffffffc0204ed6 <stride_enqueue+0x5e>
ffffffffc0204ed2:	00f75463          	bge	a4,a5,ffffffffc0204eda <stride_enqueue+0x62>
ffffffffc0204ed6:	12e42023          	sw	a4,288(s0)
ffffffffc0204eda:	010a2783          	lw	a5,16(s4)
ffffffffc0204ede:	70e6                	ld	ra,120(sp)
ffffffffc0204ee0:	11443423          	sd	s4,264(s0)
ffffffffc0204ee4:	7446                	ld	s0,112(sp)
ffffffffc0204ee6:	2785                	addiw	a5,a5,1
ffffffffc0204ee8:	00fa2823          	sw	a5,16(s4)
ffffffffc0204eec:	74a6                	ld	s1,104(sp)
ffffffffc0204eee:	7906                	ld	s2,96(sp)
ffffffffc0204ef0:	69e6                	ld	s3,88(sp)
ffffffffc0204ef2:	6a46                	ld	s4,80(sp)
ffffffffc0204ef4:	6aa6                	ld	s5,72(sp)
ffffffffc0204ef6:	6b06                	ld	s6,64(sp)
ffffffffc0204ef8:	7be2                	ld	s7,56(sp)
ffffffffc0204efa:	7c42                	ld	s8,48(sp)
ffffffffc0204efc:	7ca2                	ld	s9,40(sp)
ffffffffc0204efe:	7d02                	ld	s10,32(sp)
ffffffffc0204f00:	6de2                	ld	s11,24(sp)
ffffffffc0204f02:	6109                	addi	sp,sp,128
ffffffffc0204f04:	8082                	ret
ffffffffc0204f06:	0104ba83          	ld	s5,16(s1)
ffffffffc0204f0a:	0084bb83          	ld	s7,8(s1)
ffffffffc0204f0e:	000a8d63          	beqz	s5,ffffffffc0204f28 <stride_enqueue+0xb0>
ffffffffc0204f12:	85ca                	mv	a1,s2
ffffffffc0204f14:	8556                	mv	a0,s5
ffffffffc0204f16:	ea3ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0204f1a:	8b2a                	mv	s6,a0
ffffffffc0204f1c:	01350e63          	beq	a0,s3,ffffffffc0204f38 <stride_enqueue+0xc0>
ffffffffc0204f20:	13543823          	sd	s5,304(s0)
ffffffffc0204f24:	012ab023          	sd	s2,0(s5)
ffffffffc0204f28:	0124b423          	sd	s2,8(s1)
ffffffffc0204f2c:	0174b823          	sd	s7,16(s1)
ffffffffc0204f30:	00993023          	sd	s1,0(s2)
ffffffffc0204f34:	8926                	mv	s2,s1
ffffffffc0204f36:	b779                	j	ffffffffc0204ec4 <stride_enqueue+0x4c>
ffffffffc0204f38:	010ab983          	ld	s3,16(s5)
ffffffffc0204f3c:	008abc83          	ld	s9,8(s5)
ffffffffc0204f40:	00098d63          	beqz	s3,ffffffffc0204f5a <stride_enqueue+0xe2>
ffffffffc0204f44:	85ca                	mv	a1,s2
ffffffffc0204f46:	854e                	mv	a0,s3
ffffffffc0204f48:	e71ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0204f4c:	8c2a                	mv	s8,a0
ffffffffc0204f4e:	01650e63          	beq	a0,s6,ffffffffc0204f6a <stride_enqueue+0xf2>
ffffffffc0204f52:	13343823          	sd	s3,304(s0)
ffffffffc0204f56:	0129b023          	sd	s2,0(s3)
ffffffffc0204f5a:	012ab423          	sd	s2,8(s5)
ffffffffc0204f5e:	019ab823          	sd	s9,16(s5)
ffffffffc0204f62:	01593023          	sd	s5,0(s2)
ffffffffc0204f66:	8956                	mv	s2,s5
ffffffffc0204f68:	b7c1                	j	ffffffffc0204f28 <stride_enqueue+0xb0>
ffffffffc0204f6a:	0109bb03          	ld	s6,16(s3)
ffffffffc0204f6e:	0089bd83          	ld	s11,8(s3)
ffffffffc0204f72:	000b0d63          	beqz	s6,ffffffffc0204f8c <stride_enqueue+0x114>
ffffffffc0204f76:	85ca                	mv	a1,s2
ffffffffc0204f78:	855a                	mv	a0,s6
ffffffffc0204f7a:	e3fff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0204f7e:	8d2a                	mv	s10,a0
ffffffffc0204f80:	01850e63          	beq	a0,s8,ffffffffc0204f9c <stride_enqueue+0x124>
ffffffffc0204f84:	13643823          	sd	s6,304(s0)
ffffffffc0204f88:	012b3023          	sd	s2,0(s6)
ffffffffc0204f8c:	0129b423          	sd	s2,8(s3)
ffffffffc0204f90:	01b9b823          	sd	s11,16(s3)
ffffffffc0204f94:	01393023          	sd	s3,0(s2)
ffffffffc0204f98:	894e                	mv	s2,s3
ffffffffc0204f9a:	b7c1                	j	ffffffffc0204f5a <stride_enqueue+0xe2>
ffffffffc0204f9c:	008b3783          	ld	a5,8(s6)
ffffffffc0204fa0:	010b3c03          	ld	s8,16(s6)
ffffffffc0204fa4:	e43e                	sd	a5,8(sp)
ffffffffc0204fa6:	000c0c63          	beqz	s8,ffffffffc0204fbe <stride_enqueue+0x146>
ffffffffc0204faa:	85ca                	mv	a1,s2
ffffffffc0204fac:	8562                	mv	a0,s8
ffffffffc0204fae:	e0bff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0204fb2:	01a50f63          	beq	a0,s10,ffffffffc0204fd0 <stride_enqueue+0x158>
ffffffffc0204fb6:	13843823          	sd	s8,304(s0)
ffffffffc0204fba:	012c3023          	sd	s2,0(s8)
ffffffffc0204fbe:	67a2                	ld	a5,8(sp)
ffffffffc0204fc0:	012b3423          	sd	s2,8(s6)
ffffffffc0204fc4:	00fb3823          	sd	a5,16(s6)
ffffffffc0204fc8:	01693023          	sd	s6,0(s2)
ffffffffc0204fcc:	895a                	mv	s2,s6
ffffffffc0204fce:	bf7d                	j	ffffffffc0204f8c <stride_enqueue+0x114>
ffffffffc0204fd0:	010c3503          	ld	a0,16(s8)
ffffffffc0204fd4:	008c3d03          	ld	s10,8(s8)
ffffffffc0204fd8:	85ca                	mv	a1,s2
ffffffffc0204fda:	e3bff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0204fde:	00ac3423          	sd	a0,8(s8)
ffffffffc0204fe2:	01ac3823          	sd	s10,16(s8)
ffffffffc0204fe6:	c509                	beqz	a0,ffffffffc0204ff0 <stride_enqueue+0x178>
ffffffffc0204fe8:	01853023          	sd	s8,0(a0)
ffffffffc0204fec:	8962                	mv	s2,s8
ffffffffc0204fee:	bfc1                	j	ffffffffc0204fbe <stride_enqueue+0x146>
ffffffffc0204ff0:	8962                	mv	s2,s8
ffffffffc0204ff2:	b7f1                	j	ffffffffc0204fbe <stride_enqueue+0x146>

ffffffffc0204ff4 <stride_dequeue>:
ffffffffc0204ff4:	1085b783          	ld	a5,264(a1)
ffffffffc0204ff8:	7171                	addi	sp,sp,-176
ffffffffc0204ffa:	f506                	sd	ra,168(sp)
ffffffffc0204ffc:	f122                	sd	s0,160(sp)
ffffffffc0204ffe:	ed26                	sd	s1,152(sp)
ffffffffc0205000:	e94a                	sd	s2,144(sp)
ffffffffc0205002:	e54e                	sd	s3,136(sp)
ffffffffc0205004:	e152                	sd	s4,128(sp)
ffffffffc0205006:	fcd6                	sd	s5,120(sp)
ffffffffc0205008:	f8da                	sd	s6,112(sp)
ffffffffc020500a:	f4de                	sd	s7,104(sp)
ffffffffc020500c:	f0e2                	sd	s8,96(sp)
ffffffffc020500e:	ece6                	sd	s9,88(sp)
ffffffffc0205010:	e8ea                	sd	s10,80(sp)
ffffffffc0205012:	e4ee                	sd	s11,72(sp)
ffffffffc0205014:	00a78463          	beq	a5,a0,ffffffffc020501c <stride_dequeue+0x28>
ffffffffc0205018:	7870106f          	j	ffffffffc0206f9e <stride_dequeue+0x1faa>
ffffffffc020501c:	01052983          	lw	s3,16(a0)
ffffffffc0205020:	8c2a                	mv	s8,a0
ffffffffc0205022:	8b4e                	mv	s6,s3
ffffffffc0205024:	00099463          	bnez	s3,ffffffffc020502c <stride_dequeue+0x38>
ffffffffc0205028:	7770106f          	j	ffffffffc0206f9e <stride_dequeue+0x1faa>
ffffffffc020502c:	1305b903          	ld	s2,304(a1)
ffffffffc0205030:	01853a83          	ld	s5,24(a0)
ffffffffc0205034:	1285bd03          	ld	s10,296(a1)
ffffffffc0205038:	1385b483          	ld	s1,312(a1)
ffffffffc020503c:	842e                	mv	s0,a1
ffffffffc020503e:	2e090263          	beqz	s2,ffffffffc0205322 <stride_dequeue+0x32e>
ffffffffc0205042:	42048263          	beqz	s1,ffffffffc0205466 <stride_dequeue+0x472>
ffffffffc0205046:	85a6                	mv	a1,s1
ffffffffc0205048:	854a                	mv	a0,s2
ffffffffc020504a:	d6fff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020504e:	5cfd                	li	s9,-1
ffffffffc0205050:	8a2a                	mv	s4,a0
ffffffffc0205052:	19950163          	beq	a0,s9,ffffffffc02051d4 <stride_dequeue+0x1e0>
ffffffffc0205056:	0104ba03          	ld	s4,16(s1)
ffffffffc020505a:	0084bb83          	ld	s7,8(s1)
ffffffffc020505e:	120a0563          	beqz	s4,ffffffffc0205188 <stride_dequeue+0x194>
ffffffffc0205062:	85d2                	mv	a1,s4
ffffffffc0205064:	854a                	mv	a0,s2
ffffffffc0205066:	d53ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020506a:	2d950563          	beq	a0,s9,ffffffffc0205334 <stride_dequeue+0x340>
ffffffffc020506e:	008a3783          	ld	a5,8(s4)
ffffffffc0205072:	010a3d83          	ld	s11,16(s4)
ffffffffc0205076:	e03e                	sd	a5,0(sp)
ffffffffc0205078:	100d8063          	beqz	s11,ffffffffc0205178 <stride_dequeue+0x184>
ffffffffc020507c:	85ee                	mv	a1,s11
ffffffffc020507e:	854a                	mv	a0,s2
ffffffffc0205080:	d39ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205084:	7f950563          	beq	a0,s9,ffffffffc020586e <stride_dequeue+0x87a>
ffffffffc0205088:	008db783          	ld	a5,8(s11)
ffffffffc020508c:	010dbc83          	ld	s9,16(s11)
ffffffffc0205090:	e43e                	sd	a5,8(sp)
ffffffffc0205092:	0c0c8b63          	beqz	s9,ffffffffc0205168 <stride_dequeue+0x174>
ffffffffc0205096:	85e6                	mv	a1,s9
ffffffffc0205098:	854a                	mv	a0,s2
ffffffffc020509a:	d1fff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020509e:	58fd                	li	a7,-1
ffffffffc02050a0:	71150063          	beq	a0,a7,ffffffffc02057a0 <stride_dequeue+0x7ac>
ffffffffc02050a4:	008cb783          	ld	a5,8(s9)
ffffffffc02050a8:	010cb803          	ld	a6,16(s9)
ffffffffc02050ac:	e83e                	sd	a5,16(sp)
ffffffffc02050ae:	0a080563          	beqz	a6,ffffffffc0205158 <stride_dequeue+0x164>
ffffffffc02050b2:	85c2                	mv	a1,a6
ffffffffc02050b4:	854a                	mv	a0,s2
ffffffffc02050b6:	ec42                	sd	a6,24(sp)
ffffffffc02050b8:	d01ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02050bc:	58fd                	li	a7,-1
ffffffffc02050be:	6862                	ld	a6,24(sp)
ffffffffc02050c0:	41150be3          	beq	a0,a7,ffffffffc0205cd6 <stride_dequeue+0xce2>
ffffffffc02050c4:	00883703          	ld	a4,8(a6) # fffffffffff80008 <end+0x3fd668c0>
ffffffffc02050c8:	01083783          	ld	a5,16(a6)
ffffffffc02050cc:	ec3a                	sd	a4,24(sp)
ffffffffc02050ce:	cfad                	beqz	a5,ffffffffc0205148 <stride_dequeue+0x154>
ffffffffc02050d0:	85be                	mv	a1,a5
ffffffffc02050d2:	854a                	mv	a0,s2
ffffffffc02050d4:	f442                	sd	a6,40(sp)
ffffffffc02050d6:	f03e                	sd	a5,32(sp)
ffffffffc02050d8:	ce1ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02050dc:	58fd                	li	a7,-1
ffffffffc02050de:	7782                	ld	a5,32(sp)
ffffffffc02050e0:	7822                	ld	a6,40(sp)
ffffffffc02050e2:	01151463          	bne	a0,a7,ffffffffc02050ea <stride_dequeue+0xf6>
ffffffffc02050e6:	17a0106f          	j	ffffffffc0206260 <stride_dequeue+0x126c>
ffffffffc02050ea:	6798                	ld	a4,8(a5)
ffffffffc02050ec:	0107bb03          	ld	s6,16(a5)
ffffffffc02050f0:	f03a                	sd	a4,32(sp)
ffffffffc02050f2:	040b0463          	beqz	s6,ffffffffc020513a <stride_dequeue+0x146>
ffffffffc02050f6:	85da                	mv	a1,s6
ffffffffc02050f8:	854a                	mv	a0,s2
ffffffffc02050fa:	f83e                	sd	a5,48(sp)
ffffffffc02050fc:	f442                	sd	a6,40(sp)
ffffffffc02050fe:	cbbff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205102:	58fd                	li	a7,-1
ffffffffc0205104:	7822                	ld	a6,40(sp)
ffffffffc0205106:	77c2                	ld	a5,48(sp)
ffffffffc0205108:	01151463          	bne	a0,a7,ffffffffc0205110 <stride_dequeue+0x11c>
ffffffffc020510c:	00d0106f          	j	ffffffffc0206918 <stride_dequeue+0x1924>
ffffffffc0205110:	010b3583          	ld	a1,16(s6)
ffffffffc0205114:	008b3983          	ld	s3,8(s6)
ffffffffc0205118:	854a                	mv	a0,s2
ffffffffc020511a:	f83e                	sd	a5,48(sp)
ffffffffc020511c:	f442                	sd	a6,40(sp)
ffffffffc020511e:	cf7ff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205122:	00ab3423          	sd	a0,8(s6)
ffffffffc0205126:	013b3823          	sd	s3,16(s6)
ffffffffc020512a:	7822                	ld	a6,40(sp)
ffffffffc020512c:	77c2                	ld	a5,48(sp)
ffffffffc020512e:	010c2983          	lw	s3,16(s8)
ffffffffc0205132:	c119                	beqz	a0,ffffffffc0205138 <stride_dequeue+0x144>
ffffffffc0205134:	01653023          	sd	s6,0(a0)
ffffffffc0205138:	895a                	mv	s2,s6
ffffffffc020513a:	7702                	ld	a4,32(sp)
ffffffffc020513c:	0127b423          	sd	s2,8(a5)
ffffffffc0205140:	eb98                	sd	a4,16(a5)
ffffffffc0205142:	00f93023          	sd	a5,0(s2)
ffffffffc0205146:	893e                	mv	s2,a5
ffffffffc0205148:	67e2                	ld	a5,24(sp)
ffffffffc020514a:	01283423          	sd	s2,8(a6)
ffffffffc020514e:	00f83823          	sd	a5,16(a6)
ffffffffc0205152:	01093023          	sd	a6,0(s2)
ffffffffc0205156:	8942                	mv	s2,a6
ffffffffc0205158:	67c2                	ld	a5,16(sp)
ffffffffc020515a:	012cb423          	sd	s2,8(s9)
ffffffffc020515e:	00fcb823          	sd	a5,16(s9)
ffffffffc0205162:	01993023          	sd	s9,0(s2)
ffffffffc0205166:	8966                	mv	s2,s9
ffffffffc0205168:	67a2                	ld	a5,8(sp)
ffffffffc020516a:	012db423          	sd	s2,8(s11)
ffffffffc020516e:	00fdb823          	sd	a5,16(s11)
ffffffffc0205172:	01b93023          	sd	s11,0(s2)
ffffffffc0205176:	896e                	mv	s2,s11
ffffffffc0205178:	6782                	ld	a5,0(sp)
ffffffffc020517a:	012a3423          	sd	s2,8(s4)
ffffffffc020517e:	00fa3823          	sd	a5,16(s4)
ffffffffc0205182:	01493023          	sd	s4,0(s2)
ffffffffc0205186:	8952                	mv	s2,s4
ffffffffc0205188:	0124b423          	sd	s2,8(s1)
ffffffffc020518c:	0174b823          	sd	s7,16(s1)
ffffffffc0205190:	00993023          	sd	s1,0(s2)
ffffffffc0205194:	01a4b023          	sd	s10,0(s1)
ffffffffc0205198:	180d0963          	beqz	s10,ffffffffc020532a <stride_dequeue+0x336>
ffffffffc020519c:	008d3683          	ld	a3,8(s10)
ffffffffc02051a0:	12840413          	addi	s0,s0,296
ffffffffc02051a4:	18868563          	beq	a3,s0,ffffffffc020532e <stride_dequeue+0x33a>
ffffffffc02051a8:	009d3823          	sd	s1,16(s10)
ffffffffc02051ac:	70aa                	ld	ra,168(sp)
ffffffffc02051ae:	740a                	ld	s0,160(sp)
ffffffffc02051b0:	39fd                	addiw	s3,s3,-1
ffffffffc02051b2:	015c3c23          	sd	s5,24(s8)
ffffffffc02051b6:	013c2823          	sw	s3,16(s8)
ffffffffc02051ba:	64ea                	ld	s1,152(sp)
ffffffffc02051bc:	694a                	ld	s2,144(sp)
ffffffffc02051be:	69aa                	ld	s3,136(sp)
ffffffffc02051c0:	6a0a                	ld	s4,128(sp)
ffffffffc02051c2:	7ae6                	ld	s5,120(sp)
ffffffffc02051c4:	7b46                	ld	s6,112(sp)
ffffffffc02051c6:	7ba6                	ld	s7,104(sp)
ffffffffc02051c8:	7c06                	ld	s8,96(sp)
ffffffffc02051ca:	6ce6                	ld	s9,88(sp)
ffffffffc02051cc:	6d46                	ld	s10,80(sp)
ffffffffc02051ce:	6da6                	ld	s11,72(sp)
ffffffffc02051d0:	614d                	addi	sp,sp,176
ffffffffc02051d2:	8082                	ret
ffffffffc02051d4:	01093d83          	ld	s11,16(s2)
ffffffffc02051d8:	00893b83          	ld	s7,8(s2)
ffffffffc02051dc:	120d8963          	beqz	s11,ffffffffc020530e <stride_dequeue+0x31a>
ffffffffc02051e0:	85a6                	mv	a1,s1
ffffffffc02051e2:	856e                	mv	a0,s11
ffffffffc02051e4:	bd5ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02051e8:	29450363          	beq	a0,s4,ffffffffc020546e <stride_dequeue+0x47a>
ffffffffc02051ec:	649c                	ld	a5,8(s1)
ffffffffc02051ee:	0104bc83          	ld	s9,16(s1)
ffffffffc02051f2:	e03e                	sd	a5,0(sp)
ffffffffc02051f4:	100c8763          	beqz	s9,ffffffffc0205302 <stride_dequeue+0x30e>
ffffffffc02051f8:	85e6                	mv	a1,s9
ffffffffc02051fa:	856e                	mv	a0,s11
ffffffffc02051fc:	bbdff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205200:	4b450263          	beq	a0,s4,ffffffffc02056a4 <stride_dequeue+0x6b0>
ffffffffc0205204:	008cb783          	ld	a5,8(s9)
ffffffffc0205208:	010cba03          	ld	s4,16(s9)
ffffffffc020520c:	e43e                	sd	a5,8(sp)
ffffffffc020520e:	0e0a0263          	beqz	s4,ffffffffc02052f2 <stride_dequeue+0x2fe>
ffffffffc0205212:	85d2                	mv	a1,s4
ffffffffc0205214:	856e                	mv	a0,s11
ffffffffc0205216:	ba3ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020521a:	58fd                	li	a7,-1
ffffffffc020521c:	03150fe3          	beq	a0,a7,ffffffffc0205a5a <stride_dequeue+0xa66>
ffffffffc0205220:	008a3783          	ld	a5,8(s4)
ffffffffc0205224:	010a3803          	ld	a6,16(s4)
ffffffffc0205228:	e83e                	sd	a5,16(sp)
ffffffffc020522a:	0a080c63          	beqz	a6,ffffffffc02052e2 <stride_dequeue+0x2ee>
ffffffffc020522e:	85c2                	mv	a1,a6
ffffffffc0205230:	856e                	mv	a0,s11
ffffffffc0205232:	ec42                	sd	a6,24(sp)
ffffffffc0205234:	b85ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205238:	58fd                	li	a7,-1
ffffffffc020523a:	6862                	ld	a6,24(sp)
ffffffffc020523c:	01151463          	bne	a0,a7,ffffffffc0205244 <stride_dequeue+0x250>
ffffffffc0205240:	6e10006f          	j	ffffffffc0206120 <stride_dequeue+0x112c>
ffffffffc0205244:	00883783          	ld	a5,8(a6)
ffffffffc0205248:	01083303          	ld	t1,16(a6)
ffffffffc020524c:	ec3e                	sd	a5,24(sp)
ffffffffc020524e:	08030263          	beqz	t1,ffffffffc02052d2 <stride_dequeue+0x2de>
ffffffffc0205252:	859a                	mv	a1,t1
ffffffffc0205254:	856e                	mv	a0,s11
ffffffffc0205256:	f442                	sd	a6,40(sp)
ffffffffc0205258:	f01a                	sd	t1,32(sp)
ffffffffc020525a:	b5fff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020525e:	58fd                	li	a7,-1
ffffffffc0205260:	7302                	ld	t1,32(sp)
ffffffffc0205262:	7822                	ld	a6,40(sp)
ffffffffc0205264:	01151463          	bne	a0,a7,ffffffffc020526c <stride_dequeue+0x278>
ffffffffc0205268:	5ee0106f          	j	ffffffffc0206856 <stride_dequeue+0x1862>
ffffffffc020526c:	00833783          	ld	a5,8(t1)
ffffffffc0205270:	01033983          	ld	s3,16(t1)
ffffffffc0205274:	f03e                	sd	a5,32(sp)
ffffffffc0205276:	00099463          	bnez	s3,ffffffffc020527e <stride_dequeue+0x28a>
ffffffffc020527a:	26f0106f          	j	ffffffffc0206ce8 <stride_dequeue+0x1cf4>
ffffffffc020527e:	85ce                	mv	a1,s3
ffffffffc0205280:	856e                	mv	a0,s11
ffffffffc0205282:	f842                	sd	a6,48(sp)
ffffffffc0205284:	f41a                	sd	t1,40(sp)
ffffffffc0205286:	b33ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020528a:	58fd                	li	a7,-1
ffffffffc020528c:	7322                	ld	t1,40(sp)
ffffffffc020528e:	7842                	ld	a6,48(sp)
ffffffffc0205290:	01151463          	bne	a0,a7,ffffffffc0205298 <stride_dequeue+0x2a4>
ffffffffc0205294:	4d30106f          	j	ffffffffc0206f66 <stride_dequeue+0x1f72>
ffffffffc0205298:	0109b583          	ld	a1,16(s3)
ffffffffc020529c:	0089bb03          	ld	s6,8(s3)
ffffffffc02052a0:	856e                	mv	a0,s11
ffffffffc02052a2:	f842                	sd	a6,48(sp)
ffffffffc02052a4:	f41a                	sd	t1,40(sp)
ffffffffc02052a6:	b6fff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02052aa:	00a9b423          	sd	a0,8(s3)
ffffffffc02052ae:	0169b823          	sd	s6,16(s3)
ffffffffc02052b2:	7322                	ld	t1,40(sp)
ffffffffc02052b4:	7842                	ld	a6,48(sp)
ffffffffc02052b6:	010c2b03          	lw	s6,16(s8)
ffffffffc02052ba:	c119                	beqz	a0,ffffffffc02052c0 <stride_dequeue+0x2cc>
ffffffffc02052bc:	01353023          	sd	s3,0(a0)
ffffffffc02052c0:	7782                	ld	a5,32(sp)
ffffffffc02052c2:	01333423          	sd	s3,8(t1)
ffffffffc02052c6:	8d9a                	mv	s11,t1
ffffffffc02052c8:	00f33823          	sd	a5,16(t1)
ffffffffc02052cc:	0069b023          	sd	t1,0(s3)
ffffffffc02052d0:	89da                	mv	s3,s6
ffffffffc02052d2:	67e2                	ld	a5,24(sp)
ffffffffc02052d4:	01b83423          	sd	s11,8(a6)
ffffffffc02052d8:	00f83823          	sd	a5,16(a6)
ffffffffc02052dc:	010db023          	sd	a6,0(s11)
ffffffffc02052e0:	8dc2                	mv	s11,a6
ffffffffc02052e2:	67c2                	ld	a5,16(sp)
ffffffffc02052e4:	01ba3423          	sd	s11,8(s4)
ffffffffc02052e8:	00fa3823          	sd	a5,16(s4)
ffffffffc02052ec:	014db023          	sd	s4,0(s11)
ffffffffc02052f0:	8dd2                	mv	s11,s4
ffffffffc02052f2:	67a2                	ld	a5,8(sp)
ffffffffc02052f4:	01bcb423          	sd	s11,8(s9)
ffffffffc02052f8:	00fcb823          	sd	a5,16(s9)
ffffffffc02052fc:	019db023          	sd	s9,0(s11)
ffffffffc0205300:	8de6                	mv	s11,s9
ffffffffc0205302:	6782                	ld	a5,0(sp)
ffffffffc0205304:	01b4b423          	sd	s11,8(s1)
ffffffffc0205308:	e89c                	sd	a5,16(s1)
ffffffffc020530a:	009db023          	sd	s1,0(s11)
ffffffffc020530e:	00993423          	sd	s1,8(s2)
ffffffffc0205312:	01793823          	sd	s7,16(s2)
ffffffffc0205316:	0124b023          	sd	s2,0(s1)
ffffffffc020531a:	84ca                	mv	s1,s2
ffffffffc020531c:	01a4b023          	sd	s10,0(s1)
ffffffffc0205320:	bda5                	j	ffffffffc0205198 <stride_dequeue+0x1a4>
ffffffffc0205322:	e60499e3          	bnez	s1,ffffffffc0205194 <stride_dequeue+0x1a0>
ffffffffc0205326:	e60d1be3          	bnez	s10,ffffffffc020519c <stride_dequeue+0x1a8>
ffffffffc020532a:	8aa6                	mv	s5,s1
ffffffffc020532c:	b541                	j	ffffffffc02051ac <stride_dequeue+0x1b8>
ffffffffc020532e:	009d3423          	sd	s1,8(s10)
ffffffffc0205332:	bdad                	j	ffffffffc02051ac <stride_dequeue+0x1b8>
ffffffffc0205334:	01093d83          	ld	s11,16(s2)
ffffffffc0205338:	e02a                	sd	a0,0(sp)
ffffffffc020533a:	00893c83          	ld	s9,8(s2)
ffffffffc020533e:	100d8d63          	beqz	s11,ffffffffc0205458 <stride_dequeue+0x464>
ffffffffc0205342:	85d2                	mv	a1,s4
ffffffffc0205344:	856e                	mv	a0,s11
ffffffffc0205346:	a73ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020534a:	6782                	ld	a5,0(sp)
ffffffffc020534c:	24f50563          	beq	a0,a5,ffffffffc0205596 <stride_dequeue+0x5a2>
ffffffffc0205350:	008a3783          	ld	a5,8(s4)
ffffffffc0205354:	010a3603          	ld	a2,16(s4)
ffffffffc0205358:	e03e                	sd	a5,0(sp)
ffffffffc020535a:	0e060863          	beqz	a2,ffffffffc020544a <stride_dequeue+0x456>
ffffffffc020535e:	85b2                	mv	a1,a2
ffffffffc0205360:	856e                	mv	a0,s11
ffffffffc0205362:	e432                	sd	a2,8(sp)
ffffffffc0205364:	a55ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205368:	58fd                	li	a7,-1
ffffffffc020536a:	6622                	ld	a2,8(sp)
ffffffffc020536c:	7b150f63          	beq	a0,a7,ffffffffc0205b2a <stride_dequeue+0xb36>
ffffffffc0205370:	661c                	ld	a5,8(a2)
ffffffffc0205372:	01063803          	ld	a6,16(a2)
ffffffffc0205376:	e43e                	sd	a5,8(sp)
ffffffffc0205378:	0c080263          	beqz	a6,ffffffffc020543c <stride_dequeue+0x448>
ffffffffc020537c:	85c2                	mv	a1,a6
ffffffffc020537e:	856e                	mv	a0,s11
ffffffffc0205380:	ec32                	sd	a2,24(sp)
ffffffffc0205382:	e842                	sd	a6,16(sp)
ffffffffc0205384:	a35ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205388:	58fd                	li	a7,-1
ffffffffc020538a:	6842                	ld	a6,16(sp)
ffffffffc020538c:	6662                	ld	a2,24(sp)
ffffffffc020538e:	631507e3          	beq	a0,a7,ffffffffc02061bc <stride_dequeue+0x11c8>
ffffffffc0205392:	00883783          	ld	a5,8(a6)
ffffffffc0205396:	01083303          	ld	t1,16(a6)
ffffffffc020539a:	e83e                	sd	a5,16(sp)
ffffffffc020539c:	08030863          	beqz	t1,ffffffffc020542c <stride_dequeue+0x438>
ffffffffc02053a0:	859a                	mv	a1,t1
ffffffffc02053a2:	856e                	mv	a0,s11
ffffffffc02053a4:	f442                	sd	a6,40(sp)
ffffffffc02053a6:	f032                	sd	a2,32(sp)
ffffffffc02053a8:	ec1a                	sd	t1,24(sp)
ffffffffc02053aa:	a0fff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02053ae:	58fd                	li	a7,-1
ffffffffc02053b0:	6362                	ld	t1,24(sp)
ffffffffc02053b2:	7602                	ld	a2,32(sp)
ffffffffc02053b4:	7822                	ld	a6,40(sp)
ffffffffc02053b6:	01151463          	bne	a0,a7,ffffffffc02053be <stride_dequeue+0x3ca>
ffffffffc02053ba:	3d00106f          	j	ffffffffc020678a <stride_dequeue+0x1796>
ffffffffc02053be:	00833783          	ld	a5,8(t1)
ffffffffc02053c2:	01033983          	ld	s3,16(t1)
ffffffffc02053c6:	ec3e                	sd	a5,24(sp)
ffffffffc02053c8:	00099463          	bnez	s3,ffffffffc02053d0 <stride_dequeue+0x3dc>
ffffffffc02053cc:	2af0106f          	j	ffffffffc0206e7a <stride_dequeue+0x1e86>
ffffffffc02053d0:	85ce                	mv	a1,s3
ffffffffc02053d2:	856e                	mv	a0,s11
ffffffffc02053d4:	f81a                	sd	t1,48(sp)
ffffffffc02053d6:	f442                	sd	a6,40(sp)
ffffffffc02053d8:	f032                	sd	a2,32(sp)
ffffffffc02053da:	9dfff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02053de:	58fd                	li	a7,-1
ffffffffc02053e0:	7602                	ld	a2,32(sp)
ffffffffc02053e2:	7822                	ld	a6,40(sp)
ffffffffc02053e4:	7342                	ld	t1,48(sp)
ffffffffc02053e6:	01151463          	bne	a0,a7,ffffffffc02053ee <stride_dequeue+0x3fa>
ffffffffc02053ea:	3510106f          	j	ffffffffc0206f3a <stride_dequeue+0x1f46>
ffffffffc02053ee:	0109b583          	ld	a1,16(s3)
ffffffffc02053f2:	0089bb03          	ld	s6,8(s3)
ffffffffc02053f6:	856e                	mv	a0,s11
ffffffffc02053f8:	f81a                	sd	t1,48(sp)
ffffffffc02053fa:	f442                	sd	a6,40(sp)
ffffffffc02053fc:	f032                	sd	a2,32(sp)
ffffffffc02053fe:	a17ff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205402:	00a9b423          	sd	a0,8(s3)
ffffffffc0205406:	0169b823          	sd	s6,16(s3)
ffffffffc020540a:	7602                	ld	a2,32(sp)
ffffffffc020540c:	7822                	ld	a6,40(sp)
ffffffffc020540e:	7342                	ld	t1,48(sp)
ffffffffc0205410:	010c2b03          	lw	s6,16(s8)
ffffffffc0205414:	c119                	beqz	a0,ffffffffc020541a <stride_dequeue+0x426>
ffffffffc0205416:	01353023          	sd	s3,0(a0)
ffffffffc020541a:	67e2                	ld	a5,24(sp)
ffffffffc020541c:	01333423          	sd	s3,8(t1)
ffffffffc0205420:	8d9a                	mv	s11,t1
ffffffffc0205422:	00f33823          	sd	a5,16(t1)
ffffffffc0205426:	0069b023          	sd	t1,0(s3)
ffffffffc020542a:	89da                	mv	s3,s6
ffffffffc020542c:	67c2                	ld	a5,16(sp)
ffffffffc020542e:	01b83423          	sd	s11,8(a6)
ffffffffc0205432:	00f83823          	sd	a5,16(a6)
ffffffffc0205436:	010db023          	sd	a6,0(s11)
ffffffffc020543a:	8dc2                	mv	s11,a6
ffffffffc020543c:	67a2                	ld	a5,8(sp)
ffffffffc020543e:	01b63423          	sd	s11,8(a2)
ffffffffc0205442:	ea1c                	sd	a5,16(a2)
ffffffffc0205444:	00cdb023          	sd	a2,0(s11)
ffffffffc0205448:	8db2                	mv	s11,a2
ffffffffc020544a:	6782                	ld	a5,0(sp)
ffffffffc020544c:	01ba3423          	sd	s11,8(s4)
ffffffffc0205450:	00fa3823          	sd	a5,16(s4)
ffffffffc0205454:	014db023          	sd	s4,0(s11)
ffffffffc0205458:	01493423          	sd	s4,8(s2)
ffffffffc020545c:	01993823          	sd	s9,16(s2)
ffffffffc0205460:	012a3023          	sd	s2,0(s4)
ffffffffc0205464:	b315                	j	ffffffffc0205188 <stride_dequeue+0x194>
ffffffffc0205466:	84ca                	mv	s1,s2
ffffffffc0205468:	01a4b023          	sd	s10,0(s1)
ffffffffc020546c:	b335                	j	ffffffffc0205198 <stride_dequeue+0x1a4>
ffffffffc020546e:	008db783          	ld	a5,8(s11)
ffffffffc0205472:	010dbc83          	ld	s9,16(s11)
ffffffffc0205476:	e42a                	sd	a0,8(sp)
ffffffffc0205478:	e03e                	sd	a5,0(sp)
ffffffffc020547a:	100c8563          	beqz	s9,ffffffffc0205584 <stride_dequeue+0x590>
ffffffffc020547e:	85a6                	mv	a1,s1
ffffffffc0205480:	8566                	mv	a0,s9
ffffffffc0205482:	937ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205486:	67a2                	ld	a5,8(sp)
ffffffffc0205488:	4cf50e63          	beq	a0,a5,ffffffffc0205964 <stride_dequeue+0x970>
ffffffffc020548c:	649c                	ld	a5,8(s1)
ffffffffc020548e:	0104ba03          	ld	s4,16(s1)
ffffffffc0205492:	e43e                	sd	a5,8(sp)
ffffffffc0205494:	0e0a0263          	beqz	s4,ffffffffc0205578 <stride_dequeue+0x584>
ffffffffc0205498:	85d2                	mv	a1,s4
ffffffffc020549a:	8566                	mv	a0,s9
ffffffffc020549c:	91dff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02054a0:	58fd                	li	a7,-1
ffffffffc02054a2:	0d1505e3          	beq	a0,a7,ffffffffc0205d6c <stride_dequeue+0xd78>
ffffffffc02054a6:	008a3783          	ld	a5,8(s4)
ffffffffc02054aa:	010a3803          	ld	a6,16(s4)
ffffffffc02054ae:	e83e                	sd	a5,16(sp)
ffffffffc02054b0:	0a080c63          	beqz	a6,ffffffffc0205568 <stride_dequeue+0x574>
ffffffffc02054b4:	85c2                	mv	a1,a6
ffffffffc02054b6:	8566                	mv	a0,s9
ffffffffc02054b8:	ec42                	sd	a6,24(sp)
ffffffffc02054ba:	8ffff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02054be:	58fd                	li	a7,-1
ffffffffc02054c0:	6862                	ld	a6,24(sp)
ffffffffc02054c2:	01151463          	bne	a0,a7,ffffffffc02054ca <stride_dequeue+0x4d6>
ffffffffc02054c6:	07c0106f          	j	ffffffffc0206542 <stride_dequeue+0x154e>
ffffffffc02054ca:	00883783          	ld	a5,8(a6)
ffffffffc02054ce:	01083983          	ld	s3,16(a6)
ffffffffc02054d2:	ec3e                	sd	a5,24(sp)
ffffffffc02054d4:	00099463          	bnez	s3,ffffffffc02054dc <stride_dequeue+0x4e8>
ffffffffc02054d8:	2bb0106f          	j	ffffffffc0206f92 <stride_dequeue+0x1f9e>
ffffffffc02054dc:	85ce                	mv	a1,s3
ffffffffc02054de:	8566                	mv	a0,s9
ffffffffc02054e0:	f042                	sd	a6,32(sp)
ffffffffc02054e2:	8d7ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02054e6:	58fd                	li	a7,-1
ffffffffc02054e8:	7802                	ld	a6,32(sp)
ffffffffc02054ea:	01151463          	bne	a0,a7,ffffffffc02054f2 <stride_dequeue+0x4fe>
ffffffffc02054ee:	05f0106f          	j	ffffffffc0206d4c <stride_dequeue+0x1d58>
ffffffffc02054f2:	0089b783          	ld	a5,8(s3)
ffffffffc02054f6:	0109be03          	ld	t3,16(s3)
ffffffffc02054fa:	f03e                	sd	a5,32(sp)
ffffffffc02054fc:	040e0663          	beqz	t3,ffffffffc0205548 <stride_dequeue+0x554>
ffffffffc0205500:	85f2                	mv	a1,t3
ffffffffc0205502:	8566                	mv	a0,s9
ffffffffc0205504:	f842                	sd	a6,48(sp)
ffffffffc0205506:	f472                	sd	t3,40(sp)
ffffffffc0205508:	8b1ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020550c:	58fd                	li	a7,-1
ffffffffc020550e:	7e22                	ld	t3,40(sp)
ffffffffc0205510:	7842                	ld	a6,48(sp)
ffffffffc0205512:	01151463          	bne	a0,a7,ffffffffc020551a <stride_dequeue+0x526>
ffffffffc0205516:	4e70106f          	j	ffffffffc02071fc <stride_dequeue+0x2208>
ffffffffc020551a:	010e3583          	ld	a1,16(t3)
ffffffffc020551e:	8566                	mv	a0,s9
ffffffffc0205520:	008e3b03          	ld	s6,8(t3)
ffffffffc0205524:	f842                	sd	a6,48(sp)
ffffffffc0205526:	f472                	sd	t3,40(sp)
ffffffffc0205528:	8edff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020552c:	7e22                	ld	t3,40(sp)
ffffffffc020552e:	7842                	ld	a6,48(sp)
ffffffffc0205530:	016e3823          	sd	s6,16(t3)
ffffffffc0205534:	00ae3423          	sd	a0,8(t3)
ffffffffc0205538:	010c2b03          	lw	s6,16(s8)
ffffffffc020553c:	e119                	bnez	a0,ffffffffc0205542 <stride_dequeue+0x54e>
ffffffffc020553e:	7bb0106f          	j	ffffffffc02074f8 <stride_dequeue+0x2504>
ffffffffc0205542:	01c53023          	sd	t3,0(a0)
ffffffffc0205546:	8cf2                	mv	s9,t3
ffffffffc0205548:	7782                	ld	a5,32(sp)
ffffffffc020554a:	0199b423          	sd	s9,8(s3)
ffffffffc020554e:	00f9b823          	sd	a5,16(s3)
ffffffffc0205552:	013cb023          	sd	s3,0(s9)
ffffffffc0205556:	67e2                	ld	a5,24(sp)
ffffffffc0205558:	01383423          	sd	s3,8(a6)
ffffffffc020555c:	8cc2                	mv	s9,a6
ffffffffc020555e:	00f83823          	sd	a5,16(a6)
ffffffffc0205562:	0109b023          	sd	a6,0(s3)
ffffffffc0205566:	89da                	mv	s3,s6
ffffffffc0205568:	67c2                	ld	a5,16(sp)
ffffffffc020556a:	019a3423          	sd	s9,8(s4)
ffffffffc020556e:	00fa3823          	sd	a5,16(s4)
ffffffffc0205572:	014cb023          	sd	s4,0(s9)
ffffffffc0205576:	8cd2                	mv	s9,s4
ffffffffc0205578:	67a2                	ld	a5,8(sp)
ffffffffc020557a:	0194b423          	sd	s9,8(s1)
ffffffffc020557e:	e89c                	sd	a5,16(s1)
ffffffffc0205580:	009cb023          	sd	s1,0(s9)
ffffffffc0205584:	6782                	ld	a5,0(sp)
ffffffffc0205586:	009db423          	sd	s1,8(s11)
ffffffffc020558a:	00fdb823          	sd	a5,16(s11)
ffffffffc020558e:	01b4b023          	sd	s11,0(s1)
ffffffffc0205592:	84ee                	mv	s1,s11
ffffffffc0205594:	bbad                	j	ffffffffc020530e <stride_dequeue+0x31a>
ffffffffc0205596:	008db783          	ld	a5,8(s11)
ffffffffc020559a:	010db603          	ld	a2,16(s11)
ffffffffc020559e:	e03e                	sd	a5,0(sp)
ffffffffc02055a0:	0e060963          	beqz	a2,ffffffffc0205692 <stride_dequeue+0x69e>
ffffffffc02055a4:	8532                	mv	a0,a2
ffffffffc02055a6:	85d2                	mv	a1,s4
ffffffffc02055a8:	e432                	sd	a2,8(sp)
ffffffffc02055aa:	80fff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02055ae:	58fd                	li	a7,-1
ffffffffc02055b0:	6622                	ld	a2,8(sp)
ffffffffc02055b2:	091504e3          	beq	a0,a7,ffffffffc0205e3a <stride_dequeue+0xe46>
ffffffffc02055b6:	008a3783          	ld	a5,8(s4)
ffffffffc02055ba:	010a3803          	ld	a6,16(s4)
ffffffffc02055be:	e43e                	sd	a5,8(sp)
ffffffffc02055c0:	0c080263          	beqz	a6,ffffffffc0205684 <stride_dequeue+0x690>
ffffffffc02055c4:	85c2                	mv	a1,a6
ffffffffc02055c6:	8532                	mv	a0,a2
ffffffffc02055c8:	ec42                	sd	a6,24(sp)
ffffffffc02055ca:	e832                	sd	a2,16(sp)
ffffffffc02055cc:	fecff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02055d0:	58fd                	li	a7,-1
ffffffffc02055d2:	6642                	ld	a2,16(sp)
ffffffffc02055d4:	6862                	ld	a6,24(sp)
ffffffffc02055d6:	01151463          	bne	a0,a7,ffffffffc02055de <stride_dequeue+0x5ea>
ffffffffc02055da:	00a0106f          	j	ffffffffc02065e4 <stride_dequeue+0x15f0>
ffffffffc02055de:	00883783          	ld	a5,8(a6)
ffffffffc02055e2:	01083983          	ld	s3,16(a6)
ffffffffc02055e6:	e83e                	sd	a5,16(sp)
ffffffffc02055e8:	00099463          	bnez	s3,ffffffffc02055f0 <stride_dequeue+0x5fc>
ffffffffc02055ec:	1e50106f          	j	ffffffffc0206fd0 <stride_dequeue+0x1fdc>
ffffffffc02055f0:	8532                	mv	a0,a2
ffffffffc02055f2:	85ce                	mv	a1,s3
ffffffffc02055f4:	f042                	sd	a6,32(sp)
ffffffffc02055f6:	ec32                	sd	a2,24(sp)
ffffffffc02055f8:	fc0ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02055fc:	58fd                	li	a7,-1
ffffffffc02055fe:	6662                	ld	a2,24(sp)
ffffffffc0205600:	7802                	ld	a6,32(sp)
ffffffffc0205602:	01151463          	bne	a0,a7,ffffffffc020560a <stride_dequeue+0x616>
ffffffffc0205606:	4fc0106f          	j	ffffffffc0206b02 <stride_dequeue+0x1b0e>
ffffffffc020560a:	0089b783          	ld	a5,8(s3)
ffffffffc020560e:	0109be03          	ld	t3,16(s3)
ffffffffc0205612:	ec3e                	sd	a5,24(sp)
ffffffffc0205614:	040e0863          	beqz	t3,ffffffffc0205664 <stride_dequeue+0x670>
ffffffffc0205618:	85f2                	mv	a1,t3
ffffffffc020561a:	8532                	mv	a0,a2
ffffffffc020561c:	f842                	sd	a6,48(sp)
ffffffffc020561e:	f472                	sd	t3,40(sp)
ffffffffc0205620:	f032                	sd	a2,32(sp)
ffffffffc0205622:	f96ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205626:	7842                	ld	a6,48(sp)
ffffffffc0205628:	7e22                	ld	t3,40(sp)
ffffffffc020562a:	58fd                	li	a7,-1
ffffffffc020562c:	f442                	sd	a6,40(sp)
ffffffffc020562e:	7602                	ld	a2,32(sp)
ffffffffc0205630:	01151463          	bne	a0,a7,ffffffffc0205638 <stride_dequeue+0x644>
ffffffffc0205634:	37b0106f          	j	ffffffffc02071ae <stride_dequeue+0x21ba>
ffffffffc0205638:	010e3583          	ld	a1,16(t3)
ffffffffc020563c:	8532                	mv	a0,a2
ffffffffc020563e:	008e3b03          	ld	s6,8(t3)
ffffffffc0205642:	f072                	sd	t3,32(sp)
ffffffffc0205644:	fd0ff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205648:	7e02                	ld	t3,32(sp)
ffffffffc020564a:	7822                	ld	a6,40(sp)
ffffffffc020564c:	016e3823          	sd	s6,16(t3)
ffffffffc0205650:	00ae3423          	sd	a0,8(t3)
ffffffffc0205654:	010c2b03          	lw	s6,16(s8)
ffffffffc0205658:	e119                	bnez	a0,ffffffffc020565e <stride_dequeue+0x66a>
ffffffffc020565a:	7090106f          	j	ffffffffc0207562 <stride_dequeue+0x256e>
ffffffffc020565e:	01c53023          	sd	t3,0(a0)
ffffffffc0205662:	8672                	mv	a2,t3
ffffffffc0205664:	67e2                	ld	a5,24(sp)
ffffffffc0205666:	00c9b423          	sd	a2,8(s3)
ffffffffc020566a:	00f9b823          	sd	a5,16(s3)
ffffffffc020566e:	01363023          	sd	s3,0(a2)
ffffffffc0205672:	67c2                	ld	a5,16(sp)
ffffffffc0205674:	01383423          	sd	s3,8(a6)
ffffffffc0205678:	8642                	mv	a2,a6
ffffffffc020567a:	00f83823          	sd	a5,16(a6)
ffffffffc020567e:	0109b023          	sd	a6,0(s3)
ffffffffc0205682:	89da                	mv	s3,s6
ffffffffc0205684:	67a2                	ld	a5,8(sp)
ffffffffc0205686:	00ca3423          	sd	a2,8(s4)
ffffffffc020568a:	00fa3823          	sd	a5,16(s4)
ffffffffc020568e:	01463023          	sd	s4,0(a2)
ffffffffc0205692:	6782                	ld	a5,0(sp)
ffffffffc0205694:	014db423          	sd	s4,8(s11)
ffffffffc0205698:	00fdb823          	sd	a5,16(s11)
ffffffffc020569c:	01ba3023          	sd	s11,0(s4)
ffffffffc02056a0:	8a6e                	mv	s4,s11
ffffffffc02056a2:	bb5d                	j	ffffffffc0205458 <stride_dequeue+0x464>
ffffffffc02056a4:	008db783          	ld	a5,8(s11)
ffffffffc02056a8:	010dba03          	ld	s4,16(s11)
ffffffffc02056ac:	e43e                	sd	a5,8(sp)
ffffffffc02056ae:	0e0a0163          	beqz	s4,ffffffffc0205790 <stride_dequeue+0x79c>
ffffffffc02056b2:	85e6                	mv	a1,s9
ffffffffc02056b4:	8552                	mv	a0,s4
ffffffffc02056b6:	f02ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02056ba:	58fd                	li	a7,-1
ffffffffc02056bc:	05150de3          	beq	a0,a7,ffffffffc0205f16 <stride_dequeue+0xf22>
ffffffffc02056c0:	008cb783          	ld	a5,8(s9)
ffffffffc02056c4:	010cb803          	ld	a6,16(s9)
ffffffffc02056c8:	e83e                	sd	a5,16(sp)
ffffffffc02056ca:	0a080c63          	beqz	a6,ffffffffc0205782 <stride_dequeue+0x78e>
ffffffffc02056ce:	85c2                	mv	a1,a6
ffffffffc02056d0:	8552                	mv	a0,s4
ffffffffc02056d2:	ec42                	sd	a6,24(sp)
ffffffffc02056d4:	ee4ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02056d8:	58fd                	li	a7,-1
ffffffffc02056da:	6862                	ld	a6,24(sp)
ffffffffc02056dc:	01151463          	bne	a0,a7,ffffffffc02056e4 <stride_dequeue+0x6f0>
ffffffffc02056e0:	7ab0006f          	j	ffffffffc020668a <stride_dequeue+0x1696>
ffffffffc02056e4:	00883783          	ld	a5,8(a6)
ffffffffc02056e8:	01083983          	ld	s3,16(a6)
ffffffffc02056ec:	ec3e                	sd	a5,24(sp)
ffffffffc02056ee:	00099463          	bnez	s3,ffffffffc02056f6 <stride_dequeue+0x702>
ffffffffc02056f2:	0cd0106f          	j	ffffffffc0206fbe <stride_dequeue+0x1fca>
ffffffffc02056f6:	85ce                	mv	a1,s3
ffffffffc02056f8:	8552                	mv	a0,s4
ffffffffc02056fa:	f042                	sd	a6,32(sp)
ffffffffc02056fc:	ebcff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205700:	58fd                	li	a7,-1
ffffffffc0205702:	7802                	ld	a6,32(sp)
ffffffffc0205704:	01151463          	bne	a0,a7,ffffffffc020570c <stride_dequeue+0x718>
ffffffffc0205708:	39c0106f          	j	ffffffffc0206aa4 <stride_dequeue+0x1ab0>
ffffffffc020570c:	0089b783          	ld	a5,8(s3)
ffffffffc0205710:	0109be03          	ld	t3,16(s3)
ffffffffc0205714:	f03e                	sd	a5,32(sp)
ffffffffc0205716:	040e0663          	beqz	t3,ffffffffc0205762 <stride_dequeue+0x76e>
ffffffffc020571a:	85f2                	mv	a1,t3
ffffffffc020571c:	8552                	mv	a0,s4
ffffffffc020571e:	f842                	sd	a6,48(sp)
ffffffffc0205720:	f472                	sd	t3,40(sp)
ffffffffc0205722:	e96ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205726:	58fd                	li	a7,-1
ffffffffc0205728:	7e22                	ld	t3,40(sp)
ffffffffc020572a:	7842                	ld	a6,48(sp)
ffffffffc020572c:	01151463          	bne	a0,a7,ffffffffc0205734 <stride_dequeue+0x740>
ffffffffc0205730:	2f90106f          	j	ffffffffc0207228 <stride_dequeue+0x2234>
ffffffffc0205734:	010e3583          	ld	a1,16(t3)
ffffffffc0205738:	8552                	mv	a0,s4
ffffffffc020573a:	008e3b03          	ld	s6,8(t3)
ffffffffc020573e:	f842                	sd	a6,48(sp)
ffffffffc0205740:	f472                	sd	t3,40(sp)
ffffffffc0205742:	ed2ff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205746:	7e22                	ld	t3,40(sp)
ffffffffc0205748:	7842                	ld	a6,48(sp)
ffffffffc020574a:	016e3823          	sd	s6,16(t3)
ffffffffc020574e:	00ae3423          	sd	a0,8(t3)
ffffffffc0205752:	010c2b03          	lw	s6,16(s8)
ffffffffc0205756:	e119                	bnez	a0,ffffffffc020575c <stride_dequeue+0x768>
ffffffffc0205758:	5a70106f          	j	ffffffffc02074fe <stride_dequeue+0x250a>
ffffffffc020575c:	01c53023          	sd	t3,0(a0)
ffffffffc0205760:	8a72                	mv	s4,t3
ffffffffc0205762:	7782                	ld	a5,32(sp)
ffffffffc0205764:	0149b423          	sd	s4,8(s3)
ffffffffc0205768:	00f9b823          	sd	a5,16(s3)
ffffffffc020576c:	013a3023          	sd	s3,0(s4)
ffffffffc0205770:	67e2                	ld	a5,24(sp)
ffffffffc0205772:	01383423          	sd	s3,8(a6)
ffffffffc0205776:	8a42                	mv	s4,a6
ffffffffc0205778:	00f83823          	sd	a5,16(a6)
ffffffffc020577c:	0109b023          	sd	a6,0(s3)
ffffffffc0205780:	89da                	mv	s3,s6
ffffffffc0205782:	67c2                	ld	a5,16(sp)
ffffffffc0205784:	014cb423          	sd	s4,8(s9)
ffffffffc0205788:	00fcb823          	sd	a5,16(s9)
ffffffffc020578c:	019a3023          	sd	s9,0(s4)
ffffffffc0205790:	67a2                	ld	a5,8(sp)
ffffffffc0205792:	019db423          	sd	s9,8(s11)
ffffffffc0205796:	00fdb823          	sd	a5,16(s11)
ffffffffc020579a:	01bcb023          	sd	s11,0(s9)
ffffffffc020579e:	b695                	j	ffffffffc0205302 <stride_dequeue+0x30e>
ffffffffc02057a0:	00893783          	ld	a5,8(s2)
ffffffffc02057a4:	01093883          	ld	a7,16(s2)
ffffffffc02057a8:	ec2a                	sd	a0,24(sp)
ffffffffc02057aa:	e83e                	sd	a5,16(sp)
ffffffffc02057ac:	0a088963          	beqz	a7,ffffffffc020585e <stride_dequeue+0x86a>
ffffffffc02057b0:	8546                	mv	a0,a7
ffffffffc02057b2:	85e6                	mv	a1,s9
ffffffffc02057b4:	f046                	sd	a7,32(sp)
ffffffffc02057b6:	e02ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02057ba:	6862                	ld	a6,24(sp)
ffffffffc02057bc:	7882                	ld	a7,32(sp)
ffffffffc02057be:	030504e3          	beq	a0,a6,ffffffffc0205fe6 <stride_dequeue+0xff2>
ffffffffc02057c2:	008cb783          	ld	a5,8(s9)
ffffffffc02057c6:	010cb303          	ld	t1,16(s9)
ffffffffc02057ca:	f042                	sd	a6,32(sp)
ffffffffc02057cc:	ec3e                	sd	a5,24(sp)
ffffffffc02057ce:	08030163          	beqz	t1,ffffffffc0205850 <stride_dequeue+0x85c>
ffffffffc02057d2:	859a                	mv	a1,t1
ffffffffc02057d4:	8546                	mv	a0,a7
ffffffffc02057d6:	f81a                	sd	t1,48(sp)
ffffffffc02057d8:	f446                	sd	a7,40(sp)
ffffffffc02057da:	ddeff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02057de:	7802                	ld	a6,32(sp)
ffffffffc02057e0:	78a2                	ld	a7,40(sp)
ffffffffc02057e2:	7342                	ld	t1,48(sp)
ffffffffc02057e4:	01051463          	bne	a0,a6,ffffffffc02057ec <stride_dequeue+0x7f8>
ffffffffc02057e8:	0d00106f          	j	ffffffffc02068b8 <stride_dequeue+0x18c4>
ffffffffc02057ec:	00833783          	ld	a5,8(t1)
ffffffffc02057f0:	01033983          	ld	s3,16(t1)
ffffffffc02057f4:	f442                	sd	a6,40(sp)
ffffffffc02057f6:	f03e                	sd	a5,32(sp)
ffffffffc02057f8:	00099463          	bnez	s3,ffffffffc0205800 <stride_dequeue+0x80c>
ffffffffc02057fc:	6720106f          	j	ffffffffc0206e6e <stride_dequeue+0x1e7a>
ffffffffc0205800:	8546                	mv	a0,a7
ffffffffc0205802:	85ce                	mv	a1,s3
ffffffffc0205804:	fc1a                	sd	t1,56(sp)
ffffffffc0205806:	f846                	sd	a7,48(sp)
ffffffffc0205808:	db0ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020580c:	7822                	ld	a6,40(sp)
ffffffffc020580e:	78c2                	ld	a7,48(sp)
ffffffffc0205810:	7362                	ld	t1,56(sp)
ffffffffc0205812:	01051463          	bne	a0,a6,ffffffffc020581a <stride_dequeue+0x826>
ffffffffc0205816:	6700106f          	j	ffffffffc0206e86 <stride_dequeue+0x1e92>
ffffffffc020581a:	0109b583          	ld	a1,16(s3)
ffffffffc020581e:	0089bb03          	ld	s6,8(s3)
ffffffffc0205822:	8546                	mv	a0,a7
ffffffffc0205824:	f41a                	sd	t1,40(sp)
ffffffffc0205826:	deeff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020582a:	00a9b423          	sd	a0,8(s3)
ffffffffc020582e:	0169b823          	sd	s6,16(s3)
ffffffffc0205832:	7322                	ld	t1,40(sp)
ffffffffc0205834:	010c2b03          	lw	s6,16(s8)
ffffffffc0205838:	c119                	beqz	a0,ffffffffc020583e <stride_dequeue+0x84a>
ffffffffc020583a:	01353023          	sd	s3,0(a0)
ffffffffc020583e:	7782                	ld	a5,32(sp)
ffffffffc0205840:	01333423          	sd	s3,8(t1)
ffffffffc0205844:	889a                	mv	a7,t1
ffffffffc0205846:	00f33823          	sd	a5,16(t1)
ffffffffc020584a:	0069b023          	sd	t1,0(s3)
ffffffffc020584e:	89da                	mv	s3,s6
ffffffffc0205850:	67e2                	ld	a5,24(sp)
ffffffffc0205852:	011cb423          	sd	a7,8(s9)
ffffffffc0205856:	00fcb823          	sd	a5,16(s9)
ffffffffc020585a:	0198b023          	sd	s9,0(a7)
ffffffffc020585e:	67c2                	ld	a5,16(sp)
ffffffffc0205860:	01993423          	sd	s9,8(s2)
ffffffffc0205864:	00f93823          	sd	a5,16(s2)
ffffffffc0205868:	012cb023          	sd	s2,0(s9)
ffffffffc020586c:	b8f5                	j	ffffffffc0205168 <stride_dequeue+0x174>
ffffffffc020586e:	00893783          	ld	a5,8(s2)
ffffffffc0205872:	01093c83          	ld	s9,16(s2)
ffffffffc0205876:	e43e                	sd	a5,8(sp)
ffffffffc0205878:	0c0c8d63          	beqz	s9,ffffffffc0205952 <stride_dequeue+0x95e>
ffffffffc020587c:	85ee                	mv	a1,s11
ffffffffc020587e:	8566                	mv	a0,s9
ffffffffc0205880:	d38ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205884:	58fd                	li	a7,-1
ffffffffc0205886:	39150063          	beq	a0,a7,ffffffffc0205c06 <stride_dequeue+0xc12>
ffffffffc020588a:	008db783          	ld	a5,8(s11)
ffffffffc020588e:	010db803          	ld	a6,16(s11)
ffffffffc0205892:	e83e                	sd	a5,16(sp)
ffffffffc0205894:	0a080863          	beqz	a6,ffffffffc0205944 <stride_dequeue+0x950>
ffffffffc0205898:	85c2                	mv	a1,a6
ffffffffc020589a:	8566                	mv	a0,s9
ffffffffc020589c:	ec42                	sd	a6,24(sp)
ffffffffc020589e:	d1aff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02058a2:	58fd                	li	a7,-1
ffffffffc02058a4:	6862                	ld	a6,24(sp)
ffffffffc02058a6:	7d150f63          	beq	a0,a7,ffffffffc0206084 <stride_dequeue+0x1090>
ffffffffc02058aa:	00883783          	ld	a5,8(a6)
ffffffffc02058ae:	01083303          	ld	t1,16(a6)
ffffffffc02058b2:	ec3e                	sd	a5,24(sp)
ffffffffc02058b4:	08030063          	beqz	t1,ffffffffc0205934 <stride_dequeue+0x940>
ffffffffc02058b8:	859a                	mv	a1,t1
ffffffffc02058ba:	8566                	mv	a0,s9
ffffffffc02058bc:	f442                	sd	a6,40(sp)
ffffffffc02058be:	f01a                	sd	t1,32(sp)
ffffffffc02058c0:	cf8ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02058c4:	58fd                	li	a7,-1
ffffffffc02058c6:	7302                	ld	t1,32(sp)
ffffffffc02058c8:	7822                	ld	a6,40(sp)
ffffffffc02058ca:	65150fe3          	beq	a0,a7,ffffffffc0206728 <stride_dequeue+0x1734>
ffffffffc02058ce:	00833783          	ld	a5,8(t1)
ffffffffc02058d2:	01033983          	ld	s3,16(t1)
ffffffffc02058d6:	f03e                	sd	a5,32(sp)
ffffffffc02058d8:	00099463          	bnez	s3,ffffffffc02058e0 <stride_dequeue+0x8ec>
ffffffffc02058dc:	5980106f          	j	ffffffffc0206e74 <stride_dequeue+0x1e80>
ffffffffc02058e0:	85ce                	mv	a1,s3
ffffffffc02058e2:	8566                	mv	a0,s9
ffffffffc02058e4:	f81a                	sd	t1,48(sp)
ffffffffc02058e6:	f442                	sd	a6,40(sp)
ffffffffc02058e8:	cd0ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02058ec:	58fd                	li	a7,-1
ffffffffc02058ee:	7822                	ld	a6,40(sp)
ffffffffc02058f0:	7342                	ld	t1,48(sp)
ffffffffc02058f2:	01151463          	bne	a0,a7,ffffffffc02058fa <stride_dequeue+0x906>
ffffffffc02058f6:	5ea0106f          	j	ffffffffc0206ee0 <stride_dequeue+0x1eec>
ffffffffc02058fa:	0109b583          	ld	a1,16(s3)
ffffffffc02058fe:	0089bb03          	ld	s6,8(s3)
ffffffffc0205902:	8566                	mv	a0,s9
ffffffffc0205904:	f81a                	sd	t1,48(sp)
ffffffffc0205906:	f442                	sd	a6,40(sp)
ffffffffc0205908:	d0cff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020590c:	00a9b423          	sd	a0,8(s3)
ffffffffc0205910:	0169b823          	sd	s6,16(s3)
ffffffffc0205914:	7822                	ld	a6,40(sp)
ffffffffc0205916:	7342                	ld	t1,48(sp)
ffffffffc0205918:	010c2b03          	lw	s6,16(s8)
ffffffffc020591c:	c119                	beqz	a0,ffffffffc0205922 <stride_dequeue+0x92e>
ffffffffc020591e:	01353023          	sd	s3,0(a0)
ffffffffc0205922:	7782                	ld	a5,32(sp)
ffffffffc0205924:	01333423          	sd	s3,8(t1)
ffffffffc0205928:	8c9a                	mv	s9,t1
ffffffffc020592a:	00f33823          	sd	a5,16(t1)
ffffffffc020592e:	0069b023          	sd	t1,0(s3)
ffffffffc0205932:	89da                	mv	s3,s6
ffffffffc0205934:	67e2                	ld	a5,24(sp)
ffffffffc0205936:	01983423          	sd	s9,8(a6)
ffffffffc020593a:	00f83823          	sd	a5,16(a6)
ffffffffc020593e:	010cb023          	sd	a6,0(s9)
ffffffffc0205942:	8cc2                	mv	s9,a6
ffffffffc0205944:	67c2                	ld	a5,16(sp)
ffffffffc0205946:	019db423          	sd	s9,8(s11)
ffffffffc020594a:	00fdb823          	sd	a5,16(s11)
ffffffffc020594e:	01bcb023          	sd	s11,0(s9)
ffffffffc0205952:	67a2                	ld	a5,8(sp)
ffffffffc0205954:	01b93423          	sd	s11,8(s2)
ffffffffc0205958:	00f93823          	sd	a5,16(s2)
ffffffffc020595c:	012db023          	sd	s2,0(s11)
ffffffffc0205960:	819ff06f          	j	ffffffffc0205178 <stride_dequeue+0x184>
ffffffffc0205964:	008cb783          	ld	a5,8(s9)
ffffffffc0205968:	010cba03          	ld	s4,16(s9)
ffffffffc020596c:	e43e                	sd	a5,8(sp)
ffffffffc020596e:	0c0a0d63          	beqz	s4,ffffffffc0205a48 <stride_dequeue+0xa54>
ffffffffc0205972:	85a6                	mv	a1,s1
ffffffffc0205974:	8552                	mv	a0,s4
ffffffffc0205976:	c42ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020597a:	58fd                	li	a7,-1
ffffffffc020597c:	151500e3          	beq	a0,a7,ffffffffc02062bc <stride_dequeue+0x12c8>
ffffffffc0205980:	649c                	ld	a5,8(s1)
ffffffffc0205982:	0104b983          	ld	s3,16(s1)
ffffffffc0205986:	e83e                	sd	a5,16(sp)
ffffffffc0205988:	00099463          	bnez	s3,ffffffffc0205990 <stride_dequeue+0x99c>
ffffffffc020598c:	4f40106f          	j	ffffffffc0206e80 <stride_dequeue+0x1e8c>
ffffffffc0205990:	85ce                	mv	a1,s3
ffffffffc0205992:	8552                	mv	a0,s4
ffffffffc0205994:	c24ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205998:	58fd                	li	a7,-1
ffffffffc020599a:	01151463          	bne	a0,a7,ffffffffc02059a2 <stride_dequeue+0x9ae>
ffffffffc020599e:	0b00106f          	j	ffffffffc0206a4e <stride_dequeue+0x1a5a>
ffffffffc02059a2:	0089b783          	ld	a5,8(s3)
ffffffffc02059a6:	0109b303          	ld	t1,16(s3)
ffffffffc02059aa:	ec3e                	sd	a5,24(sp)
ffffffffc02059ac:	08030063          	beqz	t1,ffffffffc0205a2c <stride_dequeue+0xa38>
ffffffffc02059b0:	859a                	mv	a1,t1
ffffffffc02059b2:	8552                	mv	a0,s4
ffffffffc02059b4:	f01a                	sd	t1,32(sp)
ffffffffc02059b6:	c02ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02059ba:	58fd                	li	a7,-1
ffffffffc02059bc:	7302                	ld	t1,32(sp)
ffffffffc02059be:	01151463          	bne	a0,a7,ffffffffc02059c6 <stride_dequeue+0x9d2>
ffffffffc02059c2:	0130106f          	j	ffffffffc02071d4 <stride_dequeue+0x21e0>
ffffffffc02059c6:	00833783          	ld	a5,8(t1)
ffffffffc02059ca:	01033e03          	ld	t3,16(t1)
ffffffffc02059ce:	f03e                	sd	a5,32(sp)
ffffffffc02059d0:	040e0663          	beqz	t3,ffffffffc0205a1c <stride_dequeue+0xa28>
ffffffffc02059d4:	85f2                	mv	a1,t3
ffffffffc02059d6:	8552                	mv	a0,s4
ffffffffc02059d8:	f81a                	sd	t1,48(sp)
ffffffffc02059da:	f472                	sd	t3,40(sp)
ffffffffc02059dc:	bdcff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02059e0:	58fd                	li	a7,-1
ffffffffc02059e2:	7e22                	ld	t3,40(sp)
ffffffffc02059e4:	7342                	ld	t1,48(sp)
ffffffffc02059e6:	01151463          	bne	a0,a7,ffffffffc02059ee <stride_dequeue+0x9fa>
ffffffffc02059ea:	53d0106f          	j	ffffffffc0207726 <stride_dequeue+0x2732>
ffffffffc02059ee:	010e3583          	ld	a1,16(t3)
ffffffffc02059f2:	8552                	mv	a0,s4
ffffffffc02059f4:	008e3b03          	ld	s6,8(t3)
ffffffffc02059f8:	f81a                	sd	t1,48(sp)
ffffffffc02059fa:	f472                	sd	t3,40(sp)
ffffffffc02059fc:	c18ff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205a00:	7e22                	ld	t3,40(sp)
ffffffffc0205a02:	7342                	ld	t1,48(sp)
ffffffffc0205a04:	016e3823          	sd	s6,16(t3)
ffffffffc0205a08:	00ae3423          	sd	a0,8(t3)
ffffffffc0205a0c:	010c2b03          	lw	s6,16(s8)
ffffffffc0205a10:	e119                	bnez	a0,ffffffffc0205a16 <stride_dequeue+0xa22>
ffffffffc0205a12:	76d0106f          	j	ffffffffc020797e <stride_dequeue+0x298a>
ffffffffc0205a16:	01c53023          	sd	t3,0(a0)
ffffffffc0205a1a:	8a72                	mv	s4,t3
ffffffffc0205a1c:	7782                	ld	a5,32(sp)
ffffffffc0205a1e:	01433423          	sd	s4,8(t1)
ffffffffc0205a22:	00f33823          	sd	a5,16(t1)
ffffffffc0205a26:	006a3023          	sd	t1,0(s4)
ffffffffc0205a2a:	8a1a                	mv	s4,t1
ffffffffc0205a2c:	67e2                	ld	a5,24(sp)
ffffffffc0205a2e:	0149b423          	sd	s4,8(s3)
ffffffffc0205a32:	00f9b823          	sd	a5,16(s3)
ffffffffc0205a36:	013a3023          	sd	s3,0(s4)
ffffffffc0205a3a:	67c2                	ld	a5,16(sp)
ffffffffc0205a3c:	0134b423          	sd	s3,8(s1)
ffffffffc0205a40:	e89c                	sd	a5,16(s1)
ffffffffc0205a42:	0099b023          	sd	s1,0(s3)
ffffffffc0205a46:	89da                	mv	s3,s6
ffffffffc0205a48:	67a2                	ld	a5,8(sp)
ffffffffc0205a4a:	009cb423          	sd	s1,8(s9)
ffffffffc0205a4e:	00fcb823          	sd	a5,16(s9)
ffffffffc0205a52:	0194b023          	sd	s9,0(s1)
ffffffffc0205a56:	84e6                	mv	s1,s9
ffffffffc0205a58:	b635                	j	ffffffffc0205584 <stride_dequeue+0x590>
ffffffffc0205a5a:	008db783          	ld	a5,8(s11)
ffffffffc0205a5e:	010db883          	ld	a7,16(s11)
ffffffffc0205a62:	ec2a                	sd	a0,24(sp)
ffffffffc0205a64:	e83e                	sd	a5,16(sp)
ffffffffc0205a66:	0a088963          	beqz	a7,ffffffffc0205b18 <stride_dequeue+0xb24>
ffffffffc0205a6a:	8546                	mv	a0,a7
ffffffffc0205a6c:	85d2                	mv	a1,s4
ffffffffc0205a6e:	f046                	sd	a7,32(sp)
ffffffffc0205a70:	b48ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205a74:	6862                	ld	a6,24(sp)
ffffffffc0205a76:	7882                	ld	a7,32(sp)
ffffffffc0205a78:	0d050ae3          	beq	a0,a6,ffffffffc020634c <stride_dequeue+0x1358>
ffffffffc0205a7c:	008a3783          	ld	a5,8(s4)
ffffffffc0205a80:	010a3983          	ld	s3,16(s4)
ffffffffc0205a84:	f042                	sd	a6,32(sp)
ffffffffc0205a86:	ec3e                	sd	a5,24(sp)
ffffffffc0205a88:	00099463          	bnez	s3,ffffffffc0205a90 <stride_dequeue+0xa9c>
ffffffffc0205a8c:	53e0106f          	j	ffffffffc0206fca <stride_dequeue+0x1fd6>
ffffffffc0205a90:	8546                	mv	a0,a7
ffffffffc0205a92:	85ce                	mv	a1,s3
ffffffffc0205a94:	f446                	sd	a7,40(sp)
ffffffffc0205a96:	b22ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205a9a:	7802                	ld	a6,32(sp)
ffffffffc0205a9c:	78a2                	ld	a7,40(sp)
ffffffffc0205a9e:	01051463          	bne	a0,a6,ffffffffc0205aa6 <stride_dequeue+0xab2>
ffffffffc0205aa2:	1260106f          	j	ffffffffc0206bc8 <stride_dequeue+0x1bd4>
ffffffffc0205aa6:	0089b783          	ld	a5,8(s3)
ffffffffc0205aaa:	0109be03          	ld	t3,16(s3)
ffffffffc0205aae:	f442                	sd	a6,40(sp)
ffffffffc0205ab0:	f03e                	sd	a5,32(sp)
ffffffffc0205ab2:	040e0463          	beqz	t3,ffffffffc0205afa <stride_dequeue+0xb06>
ffffffffc0205ab6:	85f2                	mv	a1,t3
ffffffffc0205ab8:	8546                	mv	a0,a7
ffffffffc0205aba:	fc72                	sd	t3,56(sp)
ffffffffc0205abc:	f846                	sd	a7,48(sp)
ffffffffc0205abe:	afaff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205ac2:	7822                	ld	a6,40(sp)
ffffffffc0205ac4:	78c2                	ld	a7,48(sp)
ffffffffc0205ac6:	7e62                	ld	t3,56(sp)
ffffffffc0205ac8:	01051463          	bne	a0,a6,ffffffffc0205ad0 <stride_dequeue+0xadc>
ffffffffc0205acc:	0e70106f          	j	ffffffffc02073b2 <stride_dequeue+0x23be>
ffffffffc0205ad0:	010e3583          	ld	a1,16(t3)
ffffffffc0205ad4:	8546                	mv	a0,a7
ffffffffc0205ad6:	008e3b03          	ld	s6,8(t3)
ffffffffc0205ada:	f472                	sd	t3,40(sp)
ffffffffc0205adc:	b38ff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205ae0:	7e22                	ld	t3,40(sp)
ffffffffc0205ae2:	016e3823          	sd	s6,16(t3)
ffffffffc0205ae6:	00ae3423          	sd	a0,8(t3)
ffffffffc0205aea:	010c2b03          	lw	s6,16(s8)
ffffffffc0205aee:	e119                	bnez	a0,ffffffffc0205af4 <stride_dequeue+0xb00>
ffffffffc0205af0:	1c10106f          	j	ffffffffc02074b0 <stride_dequeue+0x24bc>
ffffffffc0205af4:	01c53023          	sd	t3,0(a0)
ffffffffc0205af8:	88f2                	mv	a7,t3
ffffffffc0205afa:	7782                	ld	a5,32(sp)
ffffffffc0205afc:	0119b423          	sd	a7,8(s3)
ffffffffc0205b00:	00f9b823          	sd	a5,16(s3)
ffffffffc0205b04:	0138b023          	sd	s3,0(a7)
ffffffffc0205b08:	67e2                	ld	a5,24(sp)
ffffffffc0205b0a:	013a3423          	sd	s3,8(s4)
ffffffffc0205b0e:	00fa3823          	sd	a5,16(s4)
ffffffffc0205b12:	0149b023          	sd	s4,0(s3)
ffffffffc0205b16:	89da                	mv	s3,s6
ffffffffc0205b18:	67c2                	ld	a5,16(sp)
ffffffffc0205b1a:	014db423          	sd	s4,8(s11)
ffffffffc0205b1e:	00fdb823          	sd	a5,16(s11)
ffffffffc0205b22:	01ba3023          	sd	s11,0(s4)
ffffffffc0205b26:	fccff06f          	j	ffffffffc02052f2 <stride_dequeue+0x2fe>
ffffffffc0205b2a:	008db783          	ld	a5,8(s11)
ffffffffc0205b2e:	010db883          	ld	a7,16(s11)
ffffffffc0205b32:	e82a                	sd	a0,16(sp)
ffffffffc0205b34:	e43e                	sd	a5,8(sp)
ffffffffc0205b36:	0a088f63          	beqz	a7,ffffffffc0205bf4 <stride_dequeue+0xc00>
ffffffffc0205b3a:	85b2                	mv	a1,a2
ffffffffc0205b3c:	8546                	mv	a0,a7
ffffffffc0205b3e:	f032                	sd	a2,32(sp)
ffffffffc0205b40:	ec46                	sd	a7,24(sp)
ffffffffc0205b42:	a76ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205b46:	6842                	ld	a6,16(sp)
ffffffffc0205b48:	68e2                	ld	a7,24(sp)
ffffffffc0205b4a:	7602                	ld	a2,32(sp)
ffffffffc0205b4c:	150506e3          	beq	a0,a6,ffffffffc0206498 <stride_dequeue+0x14a4>
ffffffffc0205b50:	661c                	ld	a5,8(a2)
ffffffffc0205b52:	01063983          	ld	s3,16(a2)
ffffffffc0205b56:	ec42                	sd	a6,24(sp)
ffffffffc0205b58:	e83e                	sd	a5,16(sp)
ffffffffc0205b5a:	00099463          	bnez	s3,ffffffffc0205b62 <stride_dequeue+0xb6e>
ffffffffc0205b5e:	4660106f          	j	ffffffffc0206fc4 <stride_dequeue+0x1fd0>
ffffffffc0205b62:	8546                	mv	a0,a7
ffffffffc0205b64:	85ce                	mv	a1,s3
ffffffffc0205b66:	f432                	sd	a2,40(sp)
ffffffffc0205b68:	f046                	sd	a7,32(sp)
ffffffffc0205b6a:	a4eff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205b6e:	6862                	ld	a6,24(sp)
ffffffffc0205b70:	7882                	ld	a7,32(sp)
ffffffffc0205b72:	7622                	ld	a2,40(sp)
ffffffffc0205b74:	01051463          	bne	a0,a6,ffffffffc0205b7c <stride_dequeue+0xb88>
ffffffffc0205b78:	0ae0106f          	j	ffffffffc0206c26 <stride_dequeue+0x1c32>
ffffffffc0205b7c:	0089b783          	ld	a5,8(s3)
ffffffffc0205b80:	0109be03          	ld	t3,16(s3)
ffffffffc0205b84:	f042                	sd	a6,32(sp)
ffffffffc0205b86:	ec3e                	sd	a5,24(sp)
ffffffffc0205b88:	040e0863          	beqz	t3,ffffffffc0205bd8 <stride_dequeue+0xbe4>
ffffffffc0205b8c:	85f2                	mv	a1,t3
ffffffffc0205b8e:	8546                	mv	a0,a7
ffffffffc0205b90:	fc32                	sd	a2,56(sp)
ffffffffc0205b92:	f872                	sd	t3,48(sp)
ffffffffc0205b94:	f446                	sd	a7,40(sp)
ffffffffc0205b96:	a22ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205b9a:	7662                	ld	a2,56(sp)
ffffffffc0205b9c:	7802                	ld	a6,32(sp)
ffffffffc0205b9e:	78a2                	ld	a7,40(sp)
ffffffffc0205ba0:	f432                	sd	a2,40(sp)
ffffffffc0205ba2:	7e42                	ld	t3,48(sp)
ffffffffc0205ba4:	01051463          	bne	a0,a6,ffffffffc0205bac <stride_dequeue+0xbb8>
ffffffffc0205ba8:	6ac0106f          	j	ffffffffc0207254 <stride_dequeue+0x2260>
ffffffffc0205bac:	010e3583          	ld	a1,16(t3)
ffffffffc0205bb0:	8546                	mv	a0,a7
ffffffffc0205bb2:	008e3b03          	ld	s6,8(t3)
ffffffffc0205bb6:	f072                	sd	t3,32(sp)
ffffffffc0205bb8:	a5cff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205bbc:	7e02                	ld	t3,32(sp)
ffffffffc0205bbe:	7622                	ld	a2,40(sp)
ffffffffc0205bc0:	016e3823          	sd	s6,16(t3)
ffffffffc0205bc4:	00ae3423          	sd	a0,8(t3)
ffffffffc0205bc8:	010c2b03          	lw	s6,16(s8)
ffffffffc0205bcc:	e119                	bnez	a0,ffffffffc0205bd2 <stride_dequeue+0xbde>
ffffffffc0205bce:	1370106f          	j	ffffffffc0207504 <stride_dequeue+0x2510>
ffffffffc0205bd2:	01c53023          	sd	t3,0(a0)
ffffffffc0205bd6:	88f2                	mv	a7,t3
ffffffffc0205bd8:	67e2                	ld	a5,24(sp)
ffffffffc0205bda:	0119b423          	sd	a7,8(s3)
ffffffffc0205bde:	00f9b823          	sd	a5,16(s3)
ffffffffc0205be2:	0138b023          	sd	s3,0(a7)
ffffffffc0205be6:	67c2                	ld	a5,16(sp)
ffffffffc0205be8:	01363423          	sd	s3,8(a2)
ffffffffc0205bec:	ea1c                	sd	a5,16(a2)
ffffffffc0205bee:	00c9b023          	sd	a2,0(s3)
ffffffffc0205bf2:	89da                	mv	s3,s6
ffffffffc0205bf4:	67a2                	ld	a5,8(sp)
ffffffffc0205bf6:	00cdb423          	sd	a2,8(s11)
ffffffffc0205bfa:	00fdb823          	sd	a5,16(s11)
ffffffffc0205bfe:	01b63023          	sd	s11,0(a2)
ffffffffc0205c02:	849ff06f          	j	ffffffffc020544a <stride_dequeue+0x456>
ffffffffc0205c06:	008cb783          	ld	a5,8(s9)
ffffffffc0205c0a:	010cb883          	ld	a7,16(s9)
ffffffffc0205c0e:	ec2a                	sd	a0,24(sp)
ffffffffc0205c10:	e83e                	sd	a5,16(sp)
ffffffffc0205c12:	0a088963          	beqz	a7,ffffffffc0205cc4 <stride_dequeue+0xcd0>
ffffffffc0205c16:	8546                	mv	a0,a7
ffffffffc0205c18:	85ee                	mv	a1,s11
ffffffffc0205c1a:	f046                	sd	a7,32(sp)
ffffffffc0205c1c:	99cff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205c20:	6862                	ld	a6,24(sp)
ffffffffc0205c22:	7882                	ld	a7,32(sp)
ffffffffc0205c24:	7d050863          	beq	a0,a6,ffffffffc02063f4 <stride_dequeue+0x1400>
ffffffffc0205c28:	008db783          	ld	a5,8(s11)
ffffffffc0205c2c:	010db983          	ld	s3,16(s11)
ffffffffc0205c30:	f042                	sd	a6,32(sp)
ffffffffc0205c32:	ec3e                	sd	a5,24(sp)
ffffffffc0205c34:	00099463          	bnez	s3,ffffffffc0205c3c <stride_dequeue+0xc48>
ffffffffc0205c38:	3600106f          	j	ffffffffc0206f98 <stride_dequeue+0x1fa4>
ffffffffc0205c3c:	8546                	mv	a0,a7
ffffffffc0205c3e:	85ce                	mv	a1,s3
ffffffffc0205c40:	f446                	sd	a7,40(sp)
ffffffffc0205c42:	976ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205c46:	7802                	ld	a6,32(sp)
ffffffffc0205c48:	78a2                	ld	a7,40(sp)
ffffffffc0205c4a:	01051463          	bne	a0,a6,ffffffffc0205c52 <stride_dequeue+0xc5e>
ffffffffc0205c4e:	71d0006f          	j	ffffffffc0206b6a <stride_dequeue+0x1b76>
ffffffffc0205c52:	0089b783          	ld	a5,8(s3)
ffffffffc0205c56:	0109be03          	ld	t3,16(s3)
ffffffffc0205c5a:	f442                	sd	a6,40(sp)
ffffffffc0205c5c:	f03e                	sd	a5,32(sp)
ffffffffc0205c5e:	040e0463          	beqz	t3,ffffffffc0205ca6 <stride_dequeue+0xcb2>
ffffffffc0205c62:	85f2                	mv	a1,t3
ffffffffc0205c64:	8546                	mv	a0,a7
ffffffffc0205c66:	fc72                	sd	t3,56(sp)
ffffffffc0205c68:	f846                	sd	a7,48(sp)
ffffffffc0205c6a:	94eff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205c6e:	7822                	ld	a6,40(sp)
ffffffffc0205c70:	78c2                	ld	a7,48(sp)
ffffffffc0205c72:	7e62                	ld	t3,56(sp)
ffffffffc0205c74:	01051463          	bne	a0,a6,ffffffffc0205c7c <stride_dequeue+0xc88>
ffffffffc0205c78:	60a0106f          	j	ffffffffc0207282 <stride_dequeue+0x228e>
ffffffffc0205c7c:	010e3583          	ld	a1,16(t3)
ffffffffc0205c80:	8546                	mv	a0,a7
ffffffffc0205c82:	008e3b03          	ld	s6,8(t3)
ffffffffc0205c86:	f472                	sd	t3,40(sp)
ffffffffc0205c88:	98cff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205c8c:	7e22                	ld	t3,40(sp)
ffffffffc0205c8e:	016e3823          	sd	s6,16(t3)
ffffffffc0205c92:	00ae3423          	sd	a0,8(t3)
ffffffffc0205c96:	010c2b03          	lw	s6,16(s8)
ffffffffc0205c9a:	e119                	bnez	a0,ffffffffc0205ca0 <stride_dequeue+0xcac>
ffffffffc0205c9c:	0270106f          	j	ffffffffc02074c2 <stride_dequeue+0x24ce>
ffffffffc0205ca0:	01c53023          	sd	t3,0(a0)
ffffffffc0205ca4:	88f2                	mv	a7,t3
ffffffffc0205ca6:	7782                	ld	a5,32(sp)
ffffffffc0205ca8:	0119b423          	sd	a7,8(s3)
ffffffffc0205cac:	00f9b823          	sd	a5,16(s3)
ffffffffc0205cb0:	0138b023          	sd	s3,0(a7)
ffffffffc0205cb4:	67e2                	ld	a5,24(sp)
ffffffffc0205cb6:	013db423          	sd	s3,8(s11)
ffffffffc0205cba:	00fdb823          	sd	a5,16(s11)
ffffffffc0205cbe:	01b9b023          	sd	s11,0(s3)
ffffffffc0205cc2:	89da                	mv	s3,s6
ffffffffc0205cc4:	67c2                	ld	a5,16(sp)
ffffffffc0205cc6:	01bcb423          	sd	s11,8(s9)
ffffffffc0205cca:	00fcb823          	sd	a5,16(s9)
ffffffffc0205cce:	019db023          	sd	s9,0(s11)
ffffffffc0205cd2:	8de6                	mv	s11,s9
ffffffffc0205cd4:	b9bd                	j	ffffffffc0205952 <stride_dequeue+0x95e>
ffffffffc0205cd6:	00893783          	ld	a5,8(s2)
ffffffffc0205cda:	01093883          	ld	a7,16(s2)
ffffffffc0205cde:	f02a                	sd	a0,32(sp)
ffffffffc0205ce0:	ec3e                	sd	a5,24(sp)
ffffffffc0205ce2:	06088c63          	beqz	a7,ffffffffc0205d5a <stride_dequeue+0xd66>
ffffffffc0205ce6:	85c2                	mv	a1,a6
ffffffffc0205ce8:	8546                	mv	a0,a7
ffffffffc0205cea:	f842                	sd	a6,48(sp)
ffffffffc0205cec:	f446                	sd	a7,40(sp)
ffffffffc0205cee:	8caff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205cf2:	7302                	ld	t1,32(sp)
ffffffffc0205cf4:	78a2                	ld	a7,40(sp)
ffffffffc0205cf6:	7842                	ld	a6,48(sp)
ffffffffc0205cf8:	2e650ee3          	beq	a0,t1,ffffffffc02067f4 <stride_dequeue+0x1800>
ffffffffc0205cfc:	00883783          	ld	a5,8(a6)
ffffffffc0205d00:	01083983          	ld	s3,16(a6)
ffffffffc0205d04:	f41a                	sd	t1,40(sp)
ffffffffc0205d06:	f03e                	sd	a5,32(sp)
ffffffffc0205d08:	64098ee3          	beqz	s3,ffffffffc0206b64 <stride_dequeue+0x1b70>
ffffffffc0205d0c:	8546                	mv	a0,a7
ffffffffc0205d0e:	85ce                	mv	a1,s3
ffffffffc0205d10:	fc42                	sd	a6,56(sp)
ffffffffc0205d12:	f846                	sd	a7,48(sp)
ffffffffc0205d14:	8a4ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205d18:	7322                	ld	t1,40(sp)
ffffffffc0205d1a:	78c2                	ld	a7,48(sp)
ffffffffc0205d1c:	7862                	ld	a6,56(sp)
ffffffffc0205d1e:	00651463          	bne	a0,t1,ffffffffc0205d26 <stride_dequeue+0xd32>
ffffffffc0205d22:	1e80106f          	j	ffffffffc0206f0a <stride_dequeue+0x1f16>
ffffffffc0205d26:	0109b583          	ld	a1,16(s3)
ffffffffc0205d2a:	0089bb03          	ld	s6,8(s3)
ffffffffc0205d2e:	8546                	mv	a0,a7
ffffffffc0205d30:	f442                	sd	a6,40(sp)
ffffffffc0205d32:	8e2ff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205d36:	00a9b423          	sd	a0,8(s3)
ffffffffc0205d3a:	0169b823          	sd	s6,16(s3)
ffffffffc0205d3e:	7822                	ld	a6,40(sp)
ffffffffc0205d40:	010c2b03          	lw	s6,16(s8)
ffffffffc0205d44:	c119                	beqz	a0,ffffffffc0205d4a <stride_dequeue+0xd56>
ffffffffc0205d46:	01353023          	sd	s3,0(a0)
ffffffffc0205d4a:	7782                	ld	a5,32(sp)
ffffffffc0205d4c:	01383423          	sd	s3,8(a6)
ffffffffc0205d50:	00f83823          	sd	a5,16(a6)
ffffffffc0205d54:	0109b023          	sd	a6,0(s3)
ffffffffc0205d58:	89da                	mv	s3,s6
ffffffffc0205d5a:	67e2                	ld	a5,24(sp)
ffffffffc0205d5c:	01093423          	sd	a6,8(s2)
ffffffffc0205d60:	00f93823          	sd	a5,16(s2)
ffffffffc0205d64:	01283023          	sd	s2,0(a6)
ffffffffc0205d68:	bf0ff06f          	j	ffffffffc0205158 <stride_dequeue+0x164>
ffffffffc0205d6c:	008cb783          	ld	a5,8(s9)
ffffffffc0205d70:	010cb983          	ld	s3,16(s9)
ffffffffc0205d74:	ec2a                	sd	a0,24(sp)
ffffffffc0205d76:	e83e                	sd	a5,16(sp)
ffffffffc0205d78:	0a098763          	beqz	s3,ffffffffc0205e26 <stride_dequeue+0xe32>
ffffffffc0205d7c:	85d2                	mv	a1,s4
ffffffffc0205d7e:	854e                	mv	a0,s3
ffffffffc0205d80:	838ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205d84:	6862                	ld	a6,24(sp)
ffffffffc0205d86:	3b050fe3          	beq	a0,a6,ffffffffc0206944 <stride_dequeue+0x1950>
ffffffffc0205d8a:	008a3783          	ld	a5,8(s4)
ffffffffc0205d8e:	010a3303          	ld	t1,16(s4)
ffffffffc0205d92:	f042                	sd	a6,32(sp)
ffffffffc0205d94:	ec3e                	sd	a5,24(sp)
ffffffffc0205d96:	08030163          	beqz	t1,ffffffffc0205e18 <stride_dequeue+0xe24>
ffffffffc0205d9a:	859a                	mv	a1,t1
ffffffffc0205d9c:	854e                	mv	a0,s3
ffffffffc0205d9e:	f41a                	sd	t1,40(sp)
ffffffffc0205da0:	818ff0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205da4:	7802                	ld	a6,32(sp)
ffffffffc0205da6:	7322                	ld	t1,40(sp)
ffffffffc0205da8:	01051463          	bne	a0,a6,ffffffffc0205db0 <stride_dequeue+0xdbc>
ffffffffc0205dac:	3da0106f          	j	ffffffffc0207186 <stride_dequeue+0x2192>
ffffffffc0205db0:	00833783          	ld	a5,8(t1)
ffffffffc0205db4:	01033e03          	ld	t3,16(t1)
ffffffffc0205db8:	fc42                	sd	a6,56(sp)
ffffffffc0205dba:	f03e                	sd	a5,32(sp)
ffffffffc0205dbc:	040e0663          	beqz	t3,ffffffffc0205e08 <stride_dequeue+0xe14>
ffffffffc0205dc0:	85f2                	mv	a1,t3
ffffffffc0205dc2:	854e                	mv	a0,s3
ffffffffc0205dc4:	f81a                	sd	t1,48(sp)
ffffffffc0205dc6:	f472                	sd	t3,40(sp)
ffffffffc0205dc8:	ff1fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205dcc:	7862                	ld	a6,56(sp)
ffffffffc0205dce:	7e22                	ld	t3,40(sp)
ffffffffc0205dd0:	7342                	ld	t1,48(sp)
ffffffffc0205dd2:	01051463          	bne	a0,a6,ffffffffc0205dda <stride_dequeue+0xde6>
ffffffffc0205dd6:	0c90106f          	j	ffffffffc020769e <stride_dequeue+0x26aa>
ffffffffc0205dda:	010e3583          	ld	a1,16(t3)
ffffffffc0205dde:	854e                	mv	a0,s3
ffffffffc0205de0:	008e3b03          	ld	s6,8(t3)
ffffffffc0205de4:	f81a                	sd	t1,48(sp)
ffffffffc0205de6:	f472                	sd	t3,40(sp)
ffffffffc0205de8:	82cff0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205dec:	7e22                	ld	t3,40(sp)
ffffffffc0205dee:	7342                	ld	t1,48(sp)
ffffffffc0205df0:	016e3823          	sd	s6,16(t3)
ffffffffc0205df4:	00ae3423          	sd	a0,8(t3)
ffffffffc0205df8:	010c2b03          	lw	s6,16(s8)
ffffffffc0205dfc:	e119                	bnez	a0,ffffffffc0205e02 <stride_dequeue+0xe0e>
ffffffffc0205dfe:	32d0106f          	j	ffffffffc020792a <stride_dequeue+0x2936>
ffffffffc0205e02:	01c53023          	sd	t3,0(a0)
ffffffffc0205e06:	89f2                	mv	s3,t3
ffffffffc0205e08:	7782                	ld	a5,32(sp)
ffffffffc0205e0a:	01333423          	sd	s3,8(t1)
ffffffffc0205e0e:	00f33823          	sd	a5,16(t1)
ffffffffc0205e12:	0069b023          	sd	t1,0(s3)
ffffffffc0205e16:	899a                	mv	s3,t1
ffffffffc0205e18:	67e2                	ld	a5,24(sp)
ffffffffc0205e1a:	013a3423          	sd	s3,8(s4)
ffffffffc0205e1e:	00fa3823          	sd	a5,16(s4)
ffffffffc0205e22:	0149b023          	sd	s4,0(s3)
ffffffffc0205e26:	67c2                	ld	a5,16(sp)
ffffffffc0205e28:	014cb423          	sd	s4,8(s9)
ffffffffc0205e2c:	89da                	mv	s3,s6
ffffffffc0205e2e:	00fcb823          	sd	a5,16(s9)
ffffffffc0205e32:	019a3023          	sd	s9,0(s4)
ffffffffc0205e36:	f42ff06f          	j	ffffffffc0205578 <stride_dequeue+0x584>
ffffffffc0205e3a:	661c                	ld	a5,8(a2)
ffffffffc0205e3c:	01063983          	ld	s3,16(a2)
ffffffffc0205e40:	e82a                	sd	a0,16(sp)
ffffffffc0205e42:	e43e                	sd	a5,8(sp)
ffffffffc0205e44:	0a098f63          	beqz	s3,ffffffffc0205f02 <stride_dequeue+0xf0e>
ffffffffc0205e48:	85d2                	mv	a1,s4
ffffffffc0205e4a:	854e                	mv	a0,s3
ffffffffc0205e4c:	ec32                	sd	a2,24(sp)
ffffffffc0205e4e:	f6bfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205e52:	6842                	ld	a6,16(sp)
ffffffffc0205e54:	6662                	ld	a2,24(sp)
ffffffffc0205e56:	39050de3          	beq	a0,a6,ffffffffc02069f0 <stride_dequeue+0x19fc>
ffffffffc0205e5a:	008a3783          	ld	a5,8(s4)
ffffffffc0205e5e:	010a3303          	ld	t1,16(s4)
ffffffffc0205e62:	ec42                	sd	a6,24(sp)
ffffffffc0205e64:	e83e                	sd	a5,16(sp)
ffffffffc0205e66:	08030763          	beqz	t1,ffffffffc0205ef4 <stride_dequeue+0xf00>
ffffffffc0205e6a:	859a                	mv	a1,t1
ffffffffc0205e6c:	854e                	mv	a0,s3
ffffffffc0205e6e:	f432                	sd	a2,40(sp)
ffffffffc0205e70:	f01a                	sd	t1,32(sp)
ffffffffc0205e72:	f47fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205e76:	6862                	ld	a6,24(sp)
ffffffffc0205e78:	7302                	ld	t1,32(sp)
ffffffffc0205e7a:	7622                	ld	a2,40(sp)
ffffffffc0205e7c:	01051463          	bne	a0,a6,ffffffffc0205e84 <stride_dequeue+0xe90>
ffffffffc0205e80:	5060106f          	j	ffffffffc0207386 <stride_dequeue+0x2392>
ffffffffc0205e84:	00833783          	ld	a5,8(t1)
ffffffffc0205e88:	01033e03          	ld	t3,16(t1)
ffffffffc0205e8c:	fc42                	sd	a6,56(sp)
ffffffffc0205e8e:	ec3e                	sd	a5,24(sp)
ffffffffc0205e90:	040e0a63          	beqz	t3,ffffffffc0205ee4 <stride_dequeue+0xef0>
ffffffffc0205e94:	85f2                	mv	a1,t3
ffffffffc0205e96:	854e                	mv	a0,s3
ffffffffc0205e98:	f81a                	sd	t1,48(sp)
ffffffffc0205e9a:	f432                	sd	a2,40(sp)
ffffffffc0205e9c:	f072                	sd	t3,32(sp)
ffffffffc0205e9e:	f1bfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205ea2:	7862                	ld	a6,56(sp)
ffffffffc0205ea4:	7e02                	ld	t3,32(sp)
ffffffffc0205ea6:	7622                	ld	a2,40(sp)
ffffffffc0205ea8:	7342                	ld	t1,48(sp)
ffffffffc0205eaa:	01051463          	bne	a0,a6,ffffffffc0205eb2 <stride_dequeue+0xebe>
ffffffffc0205eae:	1e10106f          	j	ffffffffc020788e <stride_dequeue+0x289a>
ffffffffc0205eb2:	010e3583          	ld	a1,16(t3)
ffffffffc0205eb6:	854e                	mv	a0,s3
ffffffffc0205eb8:	008e3b03          	ld	s6,8(t3)
ffffffffc0205ebc:	f81a                	sd	t1,48(sp)
ffffffffc0205ebe:	f432                	sd	a2,40(sp)
ffffffffc0205ec0:	f072                	sd	t3,32(sp)
ffffffffc0205ec2:	f53fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205ec6:	7e02                	ld	t3,32(sp)
ffffffffc0205ec8:	7622                	ld	a2,40(sp)
ffffffffc0205eca:	7342                	ld	t1,48(sp)
ffffffffc0205ecc:	016e3823          	sd	s6,16(t3)
ffffffffc0205ed0:	00ae3423          	sd	a0,8(t3)
ffffffffc0205ed4:	010c2b03          	lw	s6,16(s8)
ffffffffc0205ed8:	e119                	bnez	a0,ffffffffc0205ede <stride_dequeue+0xeea>
ffffffffc0205eda:	22d0106f          	j	ffffffffc0207906 <stride_dequeue+0x2912>
ffffffffc0205ede:	01c53023          	sd	t3,0(a0)
ffffffffc0205ee2:	89f2                	mv	s3,t3
ffffffffc0205ee4:	67e2                	ld	a5,24(sp)
ffffffffc0205ee6:	01333423          	sd	s3,8(t1)
ffffffffc0205eea:	00f33823          	sd	a5,16(t1)
ffffffffc0205eee:	0069b023          	sd	t1,0(s3)
ffffffffc0205ef2:	899a                	mv	s3,t1
ffffffffc0205ef4:	67c2                	ld	a5,16(sp)
ffffffffc0205ef6:	013a3423          	sd	s3,8(s4)
ffffffffc0205efa:	00fa3823          	sd	a5,16(s4)
ffffffffc0205efe:	0149b023          	sd	s4,0(s3)
ffffffffc0205f02:	67a2                	ld	a5,8(sp)
ffffffffc0205f04:	01463423          	sd	s4,8(a2)
ffffffffc0205f08:	89da                	mv	s3,s6
ffffffffc0205f0a:	ea1c                	sd	a5,16(a2)
ffffffffc0205f0c:	00ca3023          	sd	a2,0(s4)
ffffffffc0205f10:	8a32                	mv	s4,a2
ffffffffc0205f12:	f80ff06f          	j	ffffffffc0205692 <stride_dequeue+0x69e>
ffffffffc0205f16:	008a3783          	ld	a5,8(s4)
ffffffffc0205f1a:	010a3983          	ld	s3,16(s4)
ffffffffc0205f1e:	ec2a                	sd	a0,24(sp)
ffffffffc0205f20:	e83e                	sd	a5,16(sp)
ffffffffc0205f22:	0a098763          	beqz	s3,ffffffffc0205fd0 <stride_dequeue+0xfdc>
ffffffffc0205f26:	85e6                	mv	a1,s9
ffffffffc0205f28:	854e                	mv	a0,s3
ffffffffc0205f2a:	e8ffe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205f2e:	6862                	ld	a6,24(sp)
ffffffffc0205f30:	270505e3          	beq	a0,a6,ffffffffc020699a <stride_dequeue+0x19a6>
ffffffffc0205f34:	008cb783          	ld	a5,8(s9)
ffffffffc0205f38:	010cb303          	ld	t1,16(s9)
ffffffffc0205f3c:	f042                	sd	a6,32(sp)
ffffffffc0205f3e:	ec3e                	sd	a5,24(sp)
ffffffffc0205f40:	08030163          	beqz	t1,ffffffffc0205fc2 <stride_dequeue+0xfce>
ffffffffc0205f44:	859a                	mv	a1,t1
ffffffffc0205f46:	854e                	mv	a0,s3
ffffffffc0205f48:	f41a                	sd	t1,40(sp)
ffffffffc0205f4a:	e6ffe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205f4e:	7802                	ld	a6,32(sp)
ffffffffc0205f50:	7322                	ld	t1,40(sp)
ffffffffc0205f52:	01051463          	bne	a0,a6,ffffffffc0205f5a <stride_dequeue+0xf66>
ffffffffc0205f56:	4080106f          	j	ffffffffc020735e <stride_dequeue+0x236a>
ffffffffc0205f5a:	00833783          	ld	a5,8(t1)
ffffffffc0205f5e:	01033e03          	ld	t3,16(t1)
ffffffffc0205f62:	fc42                	sd	a6,56(sp)
ffffffffc0205f64:	f03e                	sd	a5,32(sp)
ffffffffc0205f66:	040e0663          	beqz	t3,ffffffffc0205fb2 <stride_dequeue+0xfbe>
ffffffffc0205f6a:	85f2                	mv	a1,t3
ffffffffc0205f6c:	854e                	mv	a0,s3
ffffffffc0205f6e:	f81a                	sd	t1,48(sp)
ffffffffc0205f70:	f472                	sd	t3,40(sp)
ffffffffc0205f72:	e47fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0205f76:	7862                	ld	a6,56(sp)
ffffffffc0205f78:	7e22                	ld	t3,40(sp)
ffffffffc0205f7a:	7342                	ld	t1,48(sp)
ffffffffc0205f7c:	01051463          	bne	a0,a6,ffffffffc0205f84 <stride_dequeue+0xf90>
ffffffffc0205f80:	6160106f          	j	ffffffffc0207596 <stride_dequeue+0x25a2>
ffffffffc0205f84:	010e3583          	ld	a1,16(t3)
ffffffffc0205f88:	854e                	mv	a0,s3
ffffffffc0205f8a:	008e3b03          	ld	s6,8(t3)
ffffffffc0205f8e:	f81a                	sd	t1,48(sp)
ffffffffc0205f90:	f472                	sd	t3,40(sp)
ffffffffc0205f92:	e83fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0205f96:	7e22                	ld	t3,40(sp)
ffffffffc0205f98:	7342                	ld	t1,48(sp)
ffffffffc0205f9a:	016e3823          	sd	s6,16(t3)
ffffffffc0205f9e:	00ae3423          	sd	a0,8(t3)
ffffffffc0205fa2:	010c2b03          	lw	s6,16(s8)
ffffffffc0205fa6:	e119                	bnez	a0,ffffffffc0205fac <stride_dequeue+0xfb8>
ffffffffc0205fa8:	1b30106f          	j	ffffffffc020795a <stride_dequeue+0x2966>
ffffffffc0205fac:	01c53023          	sd	t3,0(a0)
ffffffffc0205fb0:	89f2                	mv	s3,t3
ffffffffc0205fb2:	7782                	ld	a5,32(sp)
ffffffffc0205fb4:	01333423          	sd	s3,8(t1)
ffffffffc0205fb8:	00f33823          	sd	a5,16(t1)
ffffffffc0205fbc:	0069b023          	sd	t1,0(s3)
ffffffffc0205fc0:	899a                	mv	s3,t1
ffffffffc0205fc2:	67e2                	ld	a5,24(sp)
ffffffffc0205fc4:	013cb423          	sd	s3,8(s9)
ffffffffc0205fc8:	00fcb823          	sd	a5,16(s9)
ffffffffc0205fcc:	0199b023          	sd	s9,0(s3)
ffffffffc0205fd0:	67c2                	ld	a5,16(sp)
ffffffffc0205fd2:	019a3423          	sd	s9,8(s4)
ffffffffc0205fd6:	89da                	mv	s3,s6
ffffffffc0205fd8:	00fa3823          	sd	a5,16(s4)
ffffffffc0205fdc:	014cb023          	sd	s4,0(s9)
ffffffffc0205fe0:	8cd2                	mv	s9,s4
ffffffffc0205fe2:	faeff06f          	j	ffffffffc0205790 <stride_dequeue+0x79c>
ffffffffc0205fe6:	0088b783          	ld	a5,8(a7)
ffffffffc0205fea:	0108b983          	ld	s3,16(a7)
ffffffffc0205fee:	f02a                	sd	a0,32(sp)
ffffffffc0205ff0:	ec3e                	sd	a5,24(sp)
ffffffffc0205ff2:	06098e63          	beqz	s3,ffffffffc020606e <stride_dequeue+0x107a>
ffffffffc0205ff6:	85e6                	mv	a1,s9
ffffffffc0205ff8:	854e                	mv	a0,s3
ffffffffc0205ffa:	f446                	sd	a7,40(sp)
ffffffffc0205ffc:	dbdfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206000:	7302                	ld	t1,32(sp)
ffffffffc0206002:	78a2                	ld	a7,40(sp)
ffffffffc0206004:	486503e3          	beq	a0,t1,ffffffffc0206c8a <stride_dequeue+0x1c96>
ffffffffc0206008:	008cb783          	ld	a5,8(s9)
ffffffffc020600c:	010cbe03          	ld	t3,16(s9)
ffffffffc0206010:	f41a                	sd	t1,40(sp)
ffffffffc0206012:	f03e                	sd	a5,32(sp)
ffffffffc0206014:	040e0663          	beqz	t3,ffffffffc0206060 <stride_dequeue+0x106c>
ffffffffc0206018:	85f2                	mv	a1,t3
ffffffffc020601a:	854e                	mv	a0,s3
ffffffffc020601c:	fc46                	sd	a7,56(sp)
ffffffffc020601e:	f872                	sd	t3,48(sp)
ffffffffc0206020:	d99fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206024:	7322                	ld	t1,40(sp)
ffffffffc0206026:	7e42                	ld	t3,48(sp)
ffffffffc0206028:	78e2                	ld	a7,56(sp)
ffffffffc020602a:	00651463          	bne	a0,t1,ffffffffc0206032 <stride_dequeue+0x103e>
ffffffffc020602e:	3040106f          	j	ffffffffc0207332 <stride_dequeue+0x233e>
ffffffffc0206032:	010e3583          	ld	a1,16(t3)
ffffffffc0206036:	854e                	mv	a0,s3
ffffffffc0206038:	008e3b03          	ld	s6,8(t3)
ffffffffc020603c:	f846                	sd	a7,48(sp)
ffffffffc020603e:	f472                	sd	t3,40(sp)
ffffffffc0206040:	dd5fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206044:	7e22                	ld	t3,40(sp)
ffffffffc0206046:	78c2                	ld	a7,48(sp)
ffffffffc0206048:	016e3823          	sd	s6,16(t3)
ffffffffc020604c:	00ae3423          	sd	a0,8(t3)
ffffffffc0206050:	010c2b03          	lw	s6,16(s8)
ffffffffc0206054:	e119                	bnez	a0,ffffffffc020605a <stride_dequeue+0x1066>
ffffffffc0206056:	4540106f          	j	ffffffffc02074aa <stride_dequeue+0x24b6>
ffffffffc020605a:	01c53023          	sd	t3,0(a0)
ffffffffc020605e:	89f2                	mv	s3,t3
ffffffffc0206060:	7782                	ld	a5,32(sp)
ffffffffc0206062:	013cb423          	sd	s3,8(s9)
ffffffffc0206066:	00fcb823          	sd	a5,16(s9)
ffffffffc020606a:	0199b023          	sd	s9,0(s3)
ffffffffc020606e:	67e2                	ld	a5,24(sp)
ffffffffc0206070:	0198b423          	sd	s9,8(a7)
ffffffffc0206074:	89da                	mv	s3,s6
ffffffffc0206076:	00f8b823          	sd	a5,16(a7)
ffffffffc020607a:	011cb023          	sd	a7,0(s9)
ffffffffc020607e:	8cc6                	mv	s9,a7
ffffffffc0206080:	fdeff06f          	j	ffffffffc020585e <stride_dequeue+0x86a>
ffffffffc0206084:	008cb783          	ld	a5,8(s9)
ffffffffc0206088:	010cb983          	ld	s3,16(s9)
ffffffffc020608c:	f02a                	sd	a0,32(sp)
ffffffffc020608e:	ec3e                	sd	a5,24(sp)
ffffffffc0206090:	06098e63          	beqz	s3,ffffffffc020610c <stride_dequeue+0x1118>
ffffffffc0206094:	85c2                	mv	a1,a6
ffffffffc0206096:	854e                	mv	a0,s3
ffffffffc0206098:	f442                	sd	a6,40(sp)
ffffffffc020609a:	d1ffe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020609e:	7302                	ld	t1,32(sp)
ffffffffc02060a0:	7822                	ld	a6,40(sp)
ffffffffc02060a2:	446506e3          	beq	a0,t1,ffffffffc0206cee <stride_dequeue+0x1cfa>
ffffffffc02060a6:	00883783          	ld	a5,8(a6)
ffffffffc02060aa:	01083e03          	ld	t3,16(a6)
ffffffffc02060ae:	f41a                	sd	t1,40(sp)
ffffffffc02060b0:	f03e                	sd	a5,32(sp)
ffffffffc02060b2:	040e0663          	beqz	t3,ffffffffc02060fe <stride_dequeue+0x110a>
ffffffffc02060b6:	85f2                	mv	a1,t3
ffffffffc02060b8:	854e                	mv	a0,s3
ffffffffc02060ba:	fc42                	sd	a6,56(sp)
ffffffffc02060bc:	f872                	sd	t3,48(sp)
ffffffffc02060be:	cfbfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02060c2:	7322                	ld	t1,40(sp)
ffffffffc02060c4:	7e42                	ld	t3,48(sp)
ffffffffc02060c6:	7862                	ld	a6,56(sp)
ffffffffc02060c8:	00651463          	bne	a0,t1,ffffffffc02060d0 <stride_dequeue+0x10dc>
ffffffffc02060cc:	20e0106f          	j	ffffffffc02072da <stride_dequeue+0x22e6>
ffffffffc02060d0:	010e3583          	ld	a1,16(t3)
ffffffffc02060d4:	854e                	mv	a0,s3
ffffffffc02060d6:	008e3b03          	ld	s6,8(t3)
ffffffffc02060da:	f842                	sd	a6,48(sp)
ffffffffc02060dc:	f472                	sd	t3,40(sp)
ffffffffc02060de:	d37fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02060e2:	7e22                	ld	t3,40(sp)
ffffffffc02060e4:	7842                	ld	a6,48(sp)
ffffffffc02060e6:	016e3823          	sd	s6,16(t3)
ffffffffc02060ea:	00ae3423          	sd	a0,8(t3)
ffffffffc02060ee:	010c2b03          	lw	s6,16(s8)
ffffffffc02060f2:	e119                	bnez	a0,ffffffffc02060f8 <stride_dequeue+0x1104>
ffffffffc02060f4:	3c80106f          	j	ffffffffc02074bc <stride_dequeue+0x24c8>
ffffffffc02060f8:	01c53023          	sd	t3,0(a0)
ffffffffc02060fc:	89f2                	mv	s3,t3
ffffffffc02060fe:	7782                	ld	a5,32(sp)
ffffffffc0206100:	01383423          	sd	s3,8(a6)
ffffffffc0206104:	00f83823          	sd	a5,16(a6)
ffffffffc0206108:	0109b023          	sd	a6,0(s3)
ffffffffc020610c:	67e2                	ld	a5,24(sp)
ffffffffc020610e:	010cb423          	sd	a6,8(s9)
ffffffffc0206112:	89da                	mv	s3,s6
ffffffffc0206114:	00fcb823          	sd	a5,16(s9)
ffffffffc0206118:	01983023          	sd	s9,0(a6)
ffffffffc020611c:	829ff06f          	j	ffffffffc0205944 <stride_dequeue+0x950>
ffffffffc0206120:	008db783          	ld	a5,8(s11)
ffffffffc0206124:	010db983          	ld	s3,16(s11)
ffffffffc0206128:	f02a                	sd	a0,32(sp)
ffffffffc020612a:	ec3e                	sd	a5,24(sp)
ffffffffc020612c:	06098e63          	beqz	s3,ffffffffc02061a8 <stride_dequeue+0x11b4>
ffffffffc0206130:	85c2                	mv	a1,a6
ffffffffc0206132:	854e                	mv	a0,s3
ffffffffc0206134:	f442                	sd	a6,40(sp)
ffffffffc0206136:	c83fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020613a:	7302                	ld	t1,32(sp)
ffffffffc020613c:	7822                	ld	a6,40(sp)
ffffffffc020613e:	466506e3          	beq	a0,t1,ffffffffc0206daa <stride_dequeue+0x1db6>
ffffffffc0206142:	00883783          	ld	a5,8(a6)
ffffffffc0206146:	01083e03          	ld	t3,16(a6)
ffffffffc020614a:	f41a                	sd	t1,40(sp)
ffffffffc020614c:	f03e                	sd	a5,32(sp)
ffffffffc020614e:	040e0663          	beqz	t3,ffffffffc020619a <stride_dequeue+0x11a6>
ffffffffc0206152:	85f2                	mv	a1,t3
ffffffffc0206154:	854e                	mv	a0,s3
ffffffffc0206156:	fc42                	sd	a6,56(sp)
ffffffffc0206158:	f872                	sd	t3,48(sp)
ffffffffc020615a:	c5ffe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020615e:	7322                	ld	t1,40(sp)
ffffffffc0206160:	7e42                	ld	t3,48(sp)
ffffffffc0206162:	7862                	ld	a6,56(sp)
ffffffffc0206164:	00651463          	bne	a0,t1,ffffffffc020616c <stride_dequeue+0x1178>
ffffffffc0206168:	7490006f          	j	ffffffffc02070b0 <stride_dequeue+0x20bc>
ffffffffc020616c:	010e3583          	ld	a1,16(t3)
ffffffffc0206170:	854e                	mv	a0,s3
ffffffffc0206172:	008e3b03          	ld	s6,8(t3)
ffffffffc0206176:	f842                	sd	a6,48(sp)
ffffffffc0206178:	f472                	sd	t3,40(sp)
ffffffffc020617a:	c9bfe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020617e:	7e22                	ld	t3,40(sp)
ffffffffc0206180:	7842                	ld	a6,48(sp)
ffffffffc0206182:	016e3823          	sd	s6,16(t3)
ffffffffc0206186:	00ae3423          	sd	a0,8(t3)
ffffffffc020618a:	010c2b03          	lw	s6,16(s8)
ffffffffc020618e:	e119                	bnez	a0,ffffffffc0206194 <stride_dequeue+0x11a0>
ffffffffc0206190:	3260106f          	j	ffffffffc02074b6 <stride_dequeue+0x24c2>
ffffffffc0206194:	01c53023          	sd	t3,0(a0)
ffffffffc0206198:	89f2                	mv	s3,t3
ffffffffc020619a:	7782                	ld	a5,32(sp)
ffffffffc020619c:	01383423          	sd	s3,8(a6)
ffffffffc02061a0:	00f83823          	sd	a5,16(a6)
ffffffffc02061a4:	0109b023          	sd	a6,0(s3)
ffffffffc02061a8:	67e2                	ld	a5,24(sp)
ffffffffc02061aa:	010db423          	sd	a6,8(s11)
ffffffffc02061ae:	89da                	mv	s3,s6
ffffffffc02061b0:	00fdb823          	sd	a5,16(s11)
ffffffffc02061b4:	01b83023          	sd	s11,0(a6)
ffffffffc02061b8:	92aff06f          	j	ffffffffc02052e2 <stride_dequeue+0x2ee>
ffffffffc02061bc:	008db783          	ld	a5,8(s11)
ffffffffc02061c0:	010db983          	ld	s3,16(s11)
ffffffffc02061c4:	ec2a                	sd	a0,24(sp)
ffffffffc02061c6:	e83e                	sd	a5,16(sp)
ffffffffc02061c8:	08098263          	beqz	s3,ffffffffc020624c <stride_dequeue+0x1258>
ffffffffc02061cc:	85c2                	mv	a1,a6
ffffffffc02061ce:	854e                	mv	a0,s3
ffffffffc02061d0:	f432                	sd	a2,40(sp)
ffffffffc02061d2:	f042                	sd	a6,32(sp)
ffffffffc02061d4:	be5fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02061d8:	6362                	ld	t1,24(sp)
ffffffffc02061da:	7802                	ld	a6,32(sp)
ffffffffc02061dc:	7622                	ld	a2,40(sp)
ffffffffc02061de:	426505e3          	beq	a0,t1,ffffffffc0206e08 <stride_dequeue+0x1e14>
ffffffffc02061e2:	00883783          	ld	a5,8(a6)
ffffffffc02061e6:	01083e03          	ld	t3,16(a6)
ffffffffc02061ea:	f01a                	sd	t1,32(sp)
ffffffffc02061ec:	ec3e                	sd	a5,24(sp)
ffffffffc02061ee:	040e0863          	beqz	t3,ffffffffc020623e <stride_dequeue+0x124a>
ffffffffc02061f2:	85f2                	mv	a1,t3
ffffffffc02061f4:	854e                	mv	a0,s3
ffffffffc02061f6:	fc42                	sd	a6,56(sp)
ffffffffc02061f8:	f832                	sd	a2,48(sp)
ffffffffc02061fa:	f472                	sd	t3,40(sp)
ffffffffc02061fc:	bbdfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206200:	7302                	ld	t1,32(sp)
ffffffffc0206202:	7e22                	ld	t3,40(sp)
ffffffffc0206204:	7642                	ld	a2,48(sp)
ffffffffc0206206:	7862                	ld	a6,56(sp)
ffffffffc0206208:	60650fe3          	beq	a0,t1,ffffffffc0207026 <stride_dequeue+0x2032>
ffffffffc020620c:	010e3583          	ld	a1,16(t3)
ffffffffc0206210:	854e                	mv	a0,s3
ffffffffc0206212:	008e3b03          	ld	s6,8(t3)
ffffffffc0206216:	f842                	sd	a6,48(sp)
ffffffffc0206218:	f432                	sd	a2,40(sp)
ffffffffc020621a:	f072                	sd	t3,32(sp)
ffffffffc020621c:	bf9fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206220:	7e02                	ld	t3,32(sp)
ffffffffc0206222:	7622                	ld	a2,40(sp)
ffffffffc0206224:	7842                	ld	a6,48(sp)
ffffffffc0206226:	016e3823          	sd	s6,16(t3)
ffffffffc020622a:	00ae3423          	sd	a0,8(t3)
ffffffffc020622e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206232:	e119                	bnez	a0,ffffffffc0206238 <stride_dequeue+0x1244>
ffffffffc0206234:	2d60106f          	j	ffffffffc020750a <stride_dequeue+0x2516>
ffffffffc0206238:	01c53023          	sd	t3,0(a0)
ffffffffc020623c:	89f2                	mv	s3,t3
ffffffffc020623e:	67e2                	ld	a5,24(sp)
ffffffffc0206240:	01383423          	sd	s3,8(a6)
ffffffffc0206244:	00f83823          	sd	a5,16(a6)
ffffffffc0206248:	0109b023          	sd	a6,0(s3)
ffffffffc020624c:	67c2                	ld	a5,16(sp)
ffffffffc020624e:	010db423          	sd	a6,8(s11)
ffffffffc0206252:	89da                	mv	s3,s6
ffffffffc0206254:	00fdb823          	sd	a5,16(s11)
ffffffffc0206258:	01b83023          	sd	s11,0(a6)
ffffffffc020625c:	9e0ff06f          	j	ffffffffc020543c <stride_dequeue+0x448>
ffffffffc0206260:	00893703          	ld	a4,8(s2)
ffffffffc0206264:	01093983          	ld	s3,16(s2)
ffffffffc0206268:	f42a                	sd	a0,40(sp)
ffffffffc020626a:	f03a                	sd	a4,32(sp)
ffffffffc020626c:	02098e63          	beqz	s3,ffffffffc02062a8 <stride_dequeue+0x12b4>
ffffffffc0206270:	85be                	mv	a1,a5
ffffffffc0206272:	854e                	mv	a0,s3
ffffffffc0206274:	fc42                	sd	a6,56(sp)
ffffffffc0206276:	f83e                	sd	a5,48(sp)
ffffffffc0206278:	b41fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020627c:	7e22                	ld	t3,40(sp)
ffffffffc020627e:	77c2                	ld	a5,48(sp)
ffffffffc0206280:	7862                	ld	a6,56(sp)
ffffffffc0206282:	43c509e3          	beq	a0,t3,ffffffffc0206eb4 <stride_dequeue+0x1ec0>
ffffffffc0206286:	6b8c                	ld	a1,16(a5)
ffffffffc0206288:	854e                	mv	a0,s3
ffffffffc020628a:	0087bb03          	ld	s6,8(a5)
ffffffffc020628e:	f842                	sd	a6,48(sp)
ffffffffc0206290:	f43e                	sd	a5,40(sp)
ffffffffc0206292:	b83fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206296:	77a2                	ld	a5,40(sp)
ffffffffc0206298:	7842                	ld	a6,48(sp)
ffffffffc020629a:	0167b823          	sd	s6,16(a5)
ffffffffc020629e:	e788                	sd	a0,8(a5)
ffffffffc02062a0:	010c2b03          	lw	s6,16(s8)
ffffffffc02062a4:	c111                	beqz	a0,ffffffffc02062a8 <stride_dequeue+0x12b4>
ffffffffc02062a6:	e11c                	sd	a5,0(a0)
ffffffffc02062a8:	7702                	ld	a4,32(sp)
ffffffffc02062aa:	00f93423          	sd	a5,8(s2)
ffffffffc02062ae:	89da                	mv	s3,s6
ffffffffc02062b0:	00e93823          	sd	a4,16(s2)
ffffffffc02062b4:	0127b023          	sd	s2,0(a5)
ffffffffc02062b8:	e91fe06f          	j	ffffffffc0205148 <stride_dequeue+0x154>
ffffffffc02062bc:	008a3783          	ld	a5,8(s4)
ffffffffc02062c0:	010a3983          	ld	s3,16(s4)
ffffffffc02062c4:	ec2a                	sd	a0,24(sp)
ffffffffc02062c6:	e83e                	sd	a5,16(sp)
ffffffffc02062c8:	5a098ce3          	beqz	s3,ffffffffc0207080 <stride_dequeue+0x208c>
ffffffffc02062cc:	85a6                	mv	a1,s1
ffffffffc02062ce:	854e                	mv	a0,s3
ffffffffc02062d0:	ae9fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02062d4:	67e2                	ld	a5,24(sp)
ffffffffc02062d6:	50f500e3          	beq	a0,a5,ffffffffc0206fd6 <stride_dequeue+0x1fe2>
ffffffffc02062da:	f43e                	sd	a5,40(sp)
ffffffffc02062dc:	649c                	ld	a5,8(s1)
ffffffffc02062de:	0104b883          	ld	a7,16(s1)
ffffffffc02062e2:	ec3e                	sd	a5,24(sp)
ffffffffc02062e4:	04088263          	beqz	a7,ffffffffc0206328 <stride_dequeue+0x1334>
ffffffffc02062e8:	85c6                	mv	a1,a7
ffffffffc02062ea:	854e                	mv	a0,s3
ffffffffc02062ec:	f046                	sd	a7,32(sp)
ffffffffc02062ee:	acbfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02062f2:	77a2                	ld	a5,40(sp)
ffffffffc02062f4:	7882                	ld	a7,32(sp)
ffffffffc02062f6:	00f51463          	bne	a0,a5,ffffffffc02062fe <stride_dequeue+0x130a>
ffffffffc02062fa:	2160106f          	j	ffffffffc0207510 <stride_dequeue+0x251c>
ffffffffc02062fe:	0108b583          	ld	a1,16(a7)
ffffffffc0206302:	854e                	mv	a0,s3
ffffffffc0206304:	0088bb03          	ld	s6,8(a7)
ffffffffc0206308:	f046                	sd	a7,32(sp)
ffffffffc020630a:	b0bfe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020630e:	7882                	ld	a7,32(sp)
ffffffffc0206310:	0168b823          	sd	s6,16(a7)
ffffffffc0206314:	00a8b423          	sd	a0,8(a7)
ffffffffc0206318:	010c2b03          	lw	s6,16(s8)
ffffffffc020631c:	e119                	bnez	a0,ffffffffc0206322 <stride_dequeue+0x132e>
ffffffffc020631e:	56a0106f          	j	ffffffffc0207888 <stride_dequeue+0x2894>
ffffffffc0206322:	01153023          	sd	a7,0(a0)
ffffffffc0206326:	89c6                	mv	s3,a7
ffffffffc0206328:	67e2                	ld	a5,24(sp)
ffffffffc020632a:	0134b423          	sd	s3,8(s1)
ffffffffc020632e:	e89c                	sd	a5,16(s1)
ffffffffc0206330:	0099b023          	sd	s1,0(s3)
ffffffffc0206334:	89a6                	mv	s3,s1
ffffffffc0206336:	67c2                	ld	a5,16(sp)
ffffffffc0206338:	013a3423          	sd	s3,8(s4)
ffffffffc020633c:	84d2                	mv	s1,s4
ffffffffc020633e:	00fa3823          	sd	a5,16(s4)
ffffffffc0206342:	0149b023          	sd	s4,0(s3)
ffffffffc0206346:	89da                	mv	s3,s6
ffffffffc0206348:	f00ff06f          	j	ffffffffc0205a48 <stride_dequeue+0xa54>
ffffffffc020634c:	0088b783          	ld	a5,8(a7)
ffffffffc0206350:	0108b983          	ld	s3,16(a7)
ffffffffc0206354:	f02a                	sd	a0,32(sp)
ffffffffc0206356:	ec3e                	sd	a5,24(sp)
ffffffffc0206358:	00099463          	bnez	s3,ffffffffc0206360 <stride_dequeue+0x136c>
ffffffffc020635c:	0d40106f          	j	ffffffffc0207430 <stride_dequeue+0x243c>
ffffffffc0206360:	85d2                	mv	a1,s4
ffffffffc0206362:	854e                	mv	a0,s3
ffffffffc0206364:	f446                	sd	a7,40(sp)
ffffffffc0206366:	a53fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020636a:	7302                	ld	t1,32(sp)
ffffffffc020636c:	78a2                	ld	a7,40(sp)
ffffffffc020636e:	00651463          	bne	a0,t1,ffffffffc0206376 <stride_dequeue+0x1382>
ffffffffc0206372:	06c0106f          	j	ffffffffc02073de <stride_dequeue+0x23ea>
ffffffffc0206376:	008a3783          	ld	a5,8(s4)
ffffffffc020637a:	010a3e03          	ld	t3,16(s4)
ffffffffc020637e:	fc1a                	sd	t1,56(sp)
ffffffffc0206380:	f03e                	sd	a5,32(sp)
ffffffffc0206382:	040e0663          	beqz	t3,ffffffffc02063ce <stride_dequeue+0x13da>
ffffffffc0206386:	85f2                	mv	a1,t3
ffffffffc0206388:	854e                	mv	a0,s3
ffffffffc020638a:	f846                	sd	a7,48(sp)
ffffffffc020638c:	f472                	sd	t3,40(sp)
ffffffffc020638e:	a2bfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206392:	7362                	ld	t1,56(sp)
ffffffffc0206394:	7e22                	ld	t3,40(sp)
ffffffffc0206396:	78c2                	ld	a7,48(sp)
ffffffffc0206398:	00651463          	bne	a0,t1,ffffffffc02063a0 <stride_dequeue+0x13ac>
ffffffffc020639c:	32e0106f          	j	ffffffffc02076ca <stride_dequeue+0x26d6>
ffffffffc02063a0:	010e3583          	ld	a1,16(t3)
ffffffffc02063a4:	854e                	mv	a0,s3
ffffffffc02063a6:	008e3b03          	ld	s6,8(t3)
ffffffffc02063aa:	f846                	sd	a7,48(sp)
ffffffffc02063ac:	f472                	sd	t3,40(sp)
ffffffffc02063ae:	a67fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02063b2:	7e22                	ld	t3,40(sp)
ffffffffc02063b4:	78c2                	ld	a7,48(sp)
ffffffffc02063b6:	016e3823          	sd	s6,16(t3)
ffffffffc02063ba:	00ae3423          	sd	a0,8(t3)
ffffffffc02063be:	010c2b03          	lw	s6,16(s8)
ffffffffc02063c2:	e119                	bnez	a0,ffffffffc02063c8 <stride_dequeue+0x13d4>
ffffffffc02063c4:	58a0106f          	j	ffffffffc020794e <stride_dequeue+0x295a>
ffffffffc02063c8:	01c53023          	sd	t3,0(a0)
ffffffffc02063cc:	89f2                	mv	s3,t3
ffffffffc02063ce:	7782                	ld	a5,32(sp)
ffffffffc02063d0:	013a3423          	sd	s3,8(s4)
ffffffffc02063d4:	00fa3823          	sd	a5,16(s4)
ffffffffc02063d8:	0149b023          	sd	s4,0(s3)
ffffffffc02063dc:	89d2                	mv	s3,s4
ffffffffc02063de:	67e2                	ld	a5,24(sp)
ffffffffc02063e0:	0138b423          	sd	s3,8(a7)
ffffffffc02063e4:	8a46                	mv	s4,a7
ffffffffc02063e6:	00f8b823          	sd	a5,16(a7)
ffffffffc02063ea:	0119b023          	sd	a7,0(s3)
ffffffffc02063ee:	89da                	mv	s3,s6
ffffffffc02063f0:	f28ff06f          	j	ffffffffc0205b18 <stride_dequeue+0xb24>
ffffffffc02063f4:	0088b783          	ld	a5,8(a7)
ffffffffc02063f8:	0108b983          	ld	s3,16(a7)
ffffffffc02063fc:	f02a                	sd	a0,32(sp)
ffffffffc02063fe:	ec3e                	sd	a5,24(sp)
ffffffffc0206400:	00099463          	bnez	s3,ffffffffc0206408 <stride_dequeue+0x1414>
ffffffffc0206404:	0320106f          	j	ffffffffc0207436 <stride_dequeue+0x2442>
ffffffffc0206408:	85ee                	mv	a1,s11
ffffffffc020640a:	854e                	mv	a0,s3
ffffffffc020640c:	f446                	sd	a7,40(sp)
ffffffffc020640e:	9abfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206412:	7302                	ld	t1,32(sp)
ffffffffc0206414:	78a2                	ld	a7,40(sp)
ffffffffc0206416:	466508e3          	beq	a0,t1,ffffffffc0207086 <stride_dequeue+0x2092>
ffffffffc020641a:	008db783          	ld	a5,8(s11)
ffffffffc020641e:	010dbe03          	ld	t3,16(s11)
ffffffffc0206422:	fc1a                	sd	t1,56(sp)
ffffffffc0206424:	f03e                	sd	a5,32(sp)
ffffffffc0206426:	040e0663          	beqz	t3,ffffffffc0206472 <stride_dequeue+0x147e>
ffffffffc020642a:	85f2                	mv	a1,t3
ffffffffc020642c:	854e                	mv	a0,s3
ffffffffc020642e:	f846                	sd	a7,48(sp)
ffffffffc0206430:	f472                	sd	t3,40(sp)
ffffffffc0206432:	987fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206436:	7362                	ld	t1,56(sp)
ffffffffc0206438:	7e22                	ld	t3,40(sp)
ffffffffc020643a:	78c2                	ld	a7,48(sp)
ffffffffc020643c:	00651463          	bne	a0,t1,ffffffffc0206444 <stride_dequeue+0x1450>
ffffffffc0206440:	3120106f          	j	ffffffffc0207752 <stride_dequeue+0x275e>
ffffffffc0206444:	010e3583          	ld	a1,16(t3)
ffffffffc0206448:	854e                	mv	a0,s3
ffffffffc020644a:	008e3b03          	ld	s6,8(t3)
ffffffffc020644e:	f846                	sd	a7,48(sp)
ffffffffc0206450:	f472                	sd	t3,40(sp)
ffffffffc0206452:	9c3fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206456:	7e22                	ld	t3,40(sp)
ffffffffc0206458:	78c2                	ld	a7,48(sp)
ffffffffc020645a:	016e3823          	sd	s6,16(t3)
ffffffffc020645e:	00ae3423          	sd	a0,8(t3)
ffffffffc0206462:	010c2b03          	lw	s6,16(s8)
ffffffffc0206466:	e119                	bnez	a0,ffffffffc020646c <stride_dequeue+0x1478>
ffffffffc0206468:	51c0106f          	j	ffffffffc0207984 <stride_dequeue+0x2990>
ffffffffc020646c:	01c53023          	sd	t3,0(a0)
ffffffffc0206470:	89f2                	mv	s3,t3
ffffffffc0206472:	7782                	ld	a5,32(sp)
ffffffffc0206474:	013db423          	sd	s3,8(s11)
ffffffffc0206478:	00fdb823          	sd	a5,16(s11)
ffffffffc020647c:	01b9b023          	sd	s11,0(s3)
ffffffffc0206480:	89ee                	mv	s3,s11
ffffffffc0206482:	67e2                	ld	a5,24(sp)
ffffffffc0206484:	0138b423          	sd	s3,8(a7)
ffffffffc0206488:	8dc6                	mv	s11,a7
ffffffffc020648a:	00f8b823          	sd	a5,16(a7)
ffffffffc020648e:	0119b023          	sd	a7,0(s3)
ffffffffc0206492:	89da                	mv	s3,s6
ffffffffc0206494:	831ff06f          	j	ffffffffc0205cc4 <stride_dequeue+0xcd0>
ffffffffc0206498:	0088b783          	ld	a5,8(a7)
ffffffffc020649c:	0108b983          	ld	s3,16(a7)
ffffffffc02064a0:	ec2a                	sd	a0,24(sp)
ffffffffc02064a2:	e83e                	sd	a5,16(sp)
ffffffffc02064a4:	00099463          	bnez	s3,ffffffffc02064ac <stride_dequeue+0x14b8>
ffffffffc02064a8:	7a10006f          	j	ffffffffc0207448 <stride_dequeue+0x2454>
ffffffffc02064ac:	85b2                	mv	a1,a2
ffffffffc02064ae:	854e                	mv	a0,s3
ffffffffc02064b0:	f446                	sd	a7,40(sp)
ffffffffc02064b2:	907fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02064b6:	6362                	ld	t1,24(sp)
ffffffffc02064b8:	7602                	ld	a2,32(sp)
ffffffffc02064ba:	78a2                	ld	a7,40(sp)
ffffffffc02064bc:	426500e3          	beq	a0,t1,ffffffffc02070dc <stride_dequeue+0x20e8>
ffffffffc02064c0:	661c                	ld	a5,8(a2)
ffffffffc02064c2:	01063e03          	ld	t3,16(a2)
ffffffffc02064c6:	fc1a                	sd	t1,56(sp)
ffffffffc02064c8:	ec3e                	sd	a5,24(sp)
ffffffffc02064ca:	040e0a63          	beqz	t3,ffffffffc020651e <stride_dequeue+0x152a>
ffffffffc02064ce:	85f2                	mv	a1,t3
ffffffffc02064d0:	854e                	mv	a0,s3
ffffffffc02064d2:	f846                	sd	a7,48(sp)
ffffffffc02064d4:	f432                	sd	a2,40(sp)
ffffffffc02064d6:	f072                	sd	t3,32(sp)
ffffffffc02064d8:	8e1fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02064dc:	7362                	ld	t1,56(sp)
ffffffffc02064de:	7e02                	ld	t3,32(sp)
ffffffffc02064e0:	7622                	ld	a2,40(sp)
ffffffffc02064e2:	78c2                	ld	a7,48(sp)
ffffffffc02064e4:	00651463          	bne	a0,t1,ffffffffc02064ec <stride_dequeue+0x14f8>
ffffffffc02064e8:	20e0106f          	j	ffffffffc02076f6 <stride_dequeue+0x2702>
ffffffffc02064ec:	010e3583          	ld	a1,16(t3)
ffffffffc02064f0:	854e                	mv	a0,s3
ffffffffc02064f2:	008e3b03          	ld	s6,8(t3)
ffffffffc02064f6:	f846                	sd	a7,48(sp)
ffffffffc02064f8:	f432                	sd	a2,40(sp)
ffffffffc02064fa:	f072                	sd	t3,32(sp)
ffffffffc02064fc:	919fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206500:	7e02                	ld	t3,32(sp)
ffffffffc0206502:	7622                	ld	a2,40(sp)
ffffffffc0206504:	78c2                	ld	a7,48(sp)
ffffffffc0206506:	016e3823          	sd	s6,16(t3)
ffffffffc020650a:	00ae3423          	sd	a0,8(t3)
ffffffffc020650e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206512:	e119                	bnez	a0,ffffffffc0206518 <stride_dequeue+0x1524>
ffffffffc0206514:	4400106f          	j	ffffffffc0207954 <stride_dequeue+0x2960>
ffffffffc0206518:	01c53023          	sd	t3,0(a0)
ffffffffc020651c:	89f2                	mv	s3,t3
ffffffffc020651e:	67e2                	ld	a5,24(sp)
ffffffffc0206520:	01363423          	sd	s3,8(a2)
ffffffffc0206524:	ea1c                	sd	a5,16(a2)
ffffffffc0206526:	00c9b023          	sd	a2,0(s3)
ffffffffc020652a:	89b2                	mv	s3,a2
ffffffffc020652c:	67c2                	ld	a5,16(sp)
ffffffffc020652e:	0138b423          	sd	s3,8(a7)
ffffffffc0206532:	8646                	mv	a2,a7
ffffffffc0206534:	00f8b823          	sd	a5,16(a7)
ffffffffc0206538:	0119b023          	sd	a7,0(s3)
ffffffffc020653c:	89da                	mv	s3,s6
ffffffffc020653e:	eb6ff06f          	j	ffffffffc0205bf4 <stride_dequeue+0xc00>
ffffffffc0206542:	008cb783          	ld	a5,8(s9)
ffffffffc0206546:	010cb983          	ld	s3,16(s9)
ffffffffc020654a:	f02a                	sd	a0,32(sp)
ffffffffc020654c:	ec3e                	sd	a5,24(sp)
ffffffffc020654e:	00099463          	bnez	s3,ffffffffc0206556 <stride_dequeue+0x1562>
ffffffffc0206552:	6eb0006f          	j	ffffffffc020743c <stride_dequeue+0x2448>
ffffffffc0206556:	85c2                	mv	a1,a6
ffffffffc0206558:	854e                	mv	a0,s3
ffffffffc020655a:	f442                	sd	a6,40(sp)
ffffffffc020655c:	85dfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206560:	7302                	ld	t1,32(sp)
ffffffffc0206562:	7822                	ld	a6,40(sp)
ffffffffc0206564:	3e650ee3          	beq	a0,t1,ffffffffc0207160 <stride_dequeue+0x216c>
ffffffffc0206568:	00883783          	ld	a5,8(a6)
ffffffffc020656c:	01083e03          	ld	t3,16(a6)
ffffffffc0206570:	fc1a                	sd	t1,56(sp)
ffffffffc0206572:	f03e                	sd	a5,32(sp)
ffffffffc0206574:	040e0663          	beqz	t3,ffffffffc02065c0 <stride_dequeue+0x15cc>
ffffffffc0206578:	85f2                	mv	a1,t3
ffffffffc020657a:	854e                	mv	a0,s3
ffffffffc020657c:	f842                	sd	a6,48(sp)
ffffffffc020657e:	f472                	sd	t3,40(sp)
ffffffffc0206580:	839fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206584:	7362                	ld	t1,56(sp)
ffffffffc0206586:	7e22                	ld	t3,40(sp)
ffffffffc0206588:	7842                	ld	a6,48(sp)
ffffffffc020658a:	00651463          	bne	a0,t1,ffffffffc0206592 <stride_dequeue+0x159e>
ffffffffc020658e:	2a20106f          	j	ffffffffc0207830 <stride_dequeue+0x283c>
ffffffffc0206592:	010e3583          	ld	a1,16(t3)
ffffffffc0206596:	854e                	mv	a0,s3
ffffffffc0206598:	008e3b03          	ld	s6,8(t3)
ffffffffc020659c:	f842                	sd	a6,48(sp)
ffffffffc020659e:	f472                	sd	t3,40(sp)
ffffffffc02065a0:	875fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02065a4:	7e22                	ld	t3,40(sp)
ffffffffc02065a6:	7842                	ld	a6,48(sp)
ffffffffc02065a8:	016e3823          	sd	s6,16(t3)
ffffffffc02065ac:	00ae3423          	sd	a0,8(t3)
ffffffffc02065b0:	010c2b03          	lw	s6,16(s8)
ffffffffc02065b4:	e119                	bnez	a0,ffffffffc02065ba <stride_dequeue+0x15c6>
ffffffffc02065b6:	35c0106f          	j	ffffffffc0207912 <stride_dequeue+0x291e>
ffffffffc02065ba:	01c53023          	sd	t3,0(a0)
ffffffffc02065be:	89f2                	mv	s3,t3
ffffffffc02065c0:	7782                	ld	a5,32(sp)
ffffffffc02065c2:	01383423          	sd	s3,8(a6)
ffffffffc02065c6:	00f83823          	sd	a5,16(a6)
ffffffffc02065ca:	0109b023          	sd	a6,0(s3)
ffffffffc02065ce:	89c2                	mv	s3,a6
ffffffffc02065d0:	67e2                	ld	a5,24(sp)
ffffffffc02065d2:	013cb423          	sd	s3,8(s9)
ffffffffc02065d6:	00fcb823          	sd	a5,16(s9)
ffffffffc02065da:	0199b023          	sd	s9,0(s3)
ffffffffc02065de:	89da                	mv	s3,s6
ffffffffc02065e0:	f89fe06f          	j	ffffffffc0205568 <stride_dequeue+0x574>
ffffffffc02065e4:	661c                	ld	a5,8(a2)
ffffffffc02065e6:	01063983          	ld	s3,16(a2)
ffffffffc02065ea:	ec2a                	sd	a0,24(sp)
ffffffffc02065ec:	e83e                	sd	a5,16(sp)
ffffffffc02065ee:	64098ae3          	beqz	s3,ffffffffc0207442 <stride_dequeue+0x244e>
ffffffffc02065f2:	85c2                	mv	a1,a6
ffffffffc02065f4:	854e                	mv	a0,s3
ffffffffc02065f6:	f432                	sd	a2,40(sp)
ffffffffc02065f8:	f042                	sd	a6,32(sp)
ffffffffc02065fa:	fbefe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02065fe:	6362                	ld	t1,24(sp)
ffffffffc0206600:	7802                	ld	a6,32(sp)
ffffffffc0206602:	7622                	ld	a2,40(sp)
ffffffffc0206604:	326509e3          	beq	a0,t1,ffffffffc0207136 <stride_dequeue+0x2142>
ffffffffc0206608:	00883783          	ld	a5,8(a6)
ffffffffc020660c:	01083e03          	ld	t3,16(a6)
ffffffffc0206610:	fc1a                	sd	t1,56(sp)
ffffffffc0206612:	ec3e                	sd	a5,24(sp)
ffffffffc0206614:	040e0a63          	beqz	t3,ffffffffc0206668 <stride_dequeue+0x1674>
ffffffffc0206618:	85f2                	mv	a1,t3
ffffffffc020661a:	854e                	mv	a0,s3
ffffffffc020661c:	f842                	sd	a6,48(sp)
ffffffffc020661e:	f432                	sd	a2,40(sp)
ffffffffc0206620:	f072                	sd	t3,32(sp)
ffffffffc0206622:	f96fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206626:	7362                	ld	t1,56(sp)
ffffffffc0206628:	7e02                	ld	t3,32(sp)
ffffffffc020662a:	7622                	ld	a2,40(sp)
ffffffffc020662c:	7842                	ld	a6,48(sp)
ffffffffc020662e:	00651463          	bne	a0,t1,ffffffffc0206636 <stride_dequeue+0x1642>
ffffffffc0206632:	1760106f          	j	ffffffffc02077a8 <stride_dequeue+0x27b4>
ffffffffc0206636:	010e3583          	ld	a1,16(t3)
ffffffffc020663a:	854e                	mv	a0,s3
ffffffffc020663c:	008e3b03          	ld	s6,8(t3)
ffffffffc0206640:	f842                	sd	a6,48(sp)
ffffffffc0206642:	f432                	sd	a2,40(sp)
ffffffffc0206644:	f072                	sd	t3,32(sp)
ffffffffc0206646:	fcefe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020664a:	7e02                	ld	t3,32(sp)
ffffffffc020664c:	7622                	ld	a2,40(sp)
ffffffffc020664e:	7842                	ld	a6,48(sp)
ffffffffc0206650:	016e3823          	sd	s6,16(t3)
ffffffffc0206654:	00ae3423          	sd	a0,8(t3)
ffffffffc0206658:	010c2b03          	lw	s6,16(s8)
ffffffffc020665c:	e119                	bnez	a0,ffffffffc0206662 <stride_dequeue+0x166e>
ffffffffc020665e:	32c0106f          	j	ffffffffc020798a <stride_dequeue+0x2996>
ffffffffc0206662:	01c53023          	sd	t3,0(a0)
ffffffffc0206666:	89f2                	mv	s3,t3
ffffffffc0206668:	67e2                	ld	a5,24(sp)
ffffffffc020666a:	01383423          	sd	s3,8(a6)
ffffffffc020666e:	00f83823          	sd	a5,16(a6)
ffffffffc0206672:	0109b023          	sd	a6,0(s3)
ffffffffc0206676:	89c2                	mv	s3,a6
ffffffffc0206678:	67c2                	ld	a5,16(sp)
ffffffffc020667a:	01363423          	sd	s3,8(a2)
ffffffffc020667e:	ea1c                	sd	a5,16(a2)
ffffffffc0206680:	00c9b023          	sd	a2,0(s3)
ffffffffc0206684:	89da                	mv	s3,s6
ffffffffc0206686:	ffffe06f          	j	ffffffffc0205684 <stride_dequeue+0x690>
ffffffffc020668a:	008a3783          	ld	a5,8(s4)
ffffffffc020668e:	010a3983          	ld	s3,16(s4)
ffffffffc0206692:	f02a                	sd	a0,32(sp)
ffffffffc0206694:	ec3e                	sd	a5,24(sp)
ffffffffc0206696:	5a098ce3          	beqz	s3,ffffffffc020744e <stride_dequeue+0x245a>
ffffffffc020669a:	85c2                	mv	a1,a6
ffffffffc020669c:	854e                	mv	a0,s3
ffffffffc020669e:	f442                	sd	a6,40(sp)
ffffffffc02066a0:	f18fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02066a4:	7302                	ld	t1,32(sp)
ffffffffc02066a6:	7822                	ld	a6,40(sp)
ffffffffc02066a8:	566501e3          	beq	a0,t1,ffffffffc020740a <stride_dequeue+0x2416>
ffffffffc02066ac:	00883783          	ld	a5,8(a6)
ffffffffc02066b0:	01083e03          	ld	t3,16(a6)
ffffffffc02066b4:	fc1a                	sd	t1,56(sp)
ffffffffc02066b6:	f03e                	sd	a5,32(sp)
ffffffffc02066b8:	040e0663          	beqz	t3,ffffffffc0206704 <stride_dequeue+0x1710>
ffffffffc02066bc:	85f2                	mv	a1,t3
ffffffffc02066be:	854e                	mv	a0,s3
ffffffffc02066c0:	f842                	sd	a6,48(sp)
ffffffffc02066c2:	f472                	sd	t3,40(sp)
ffffffffc02066c4:	ef4fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02066c8:	7362                	ld	t1,56(sp)
ffffffffc02066ca:	7e22                	ld	t3,40(sp)
ffffffffc02066cc:	7842                	ld	a6,48(sp)
ffffffffc02066ce:	00651463          	bne	a0,t1,ffffffffc02066d6 <stride_dequeue+0x16e2>
ffffffffc02066d2:	18a0106f          	j	ffffffffc020785c <stride_dequeue+0x2868>
ffffffffc02066d6:	010e3583          	ld	a1,16(t3)
ffffffffc02066da:	854e                	mv	a0,s3
ffffffffc02066dc:	008e3b03          	ld	s6,8(t3)
ffffffffc02066e0:	f842                	sd	a6,48(sp)
ffffffffc02066e2:	f472                	sd	t3,40(sp)
ffffffffc02066e4:	f30fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02066e8:	7e22                	ld	t3,40(sp)
ffffffffc02066ea:	7842                	ld	a6,48(sp)
ffffffffc02066ec:	016e3823          	sd	s6,16(t3)
ffffffffc02066f0:	00ae3423          	sd	a0,8(t3)
ffffffffc02066f4:	010c2b03          	lw	s6,16(s8)
ffffffffc02066f8:	e119                	bnez	a0,ffffffffc02066fe <stride_dequeue+0x170a>
ffffffffc02066fa:	1ee0106f          	j	ffffffffc02078e8 <stride_dequeue+0x28f4>
ffffffffc02066fe:	01c53023          	sd	t3,0(a0)
ffffffffc0206702:	89f2                	mv	s3,t3
ffffffffc0206704:	7782                	ld	a5,32(sp)
ffffffffc0206706:	01383423          	sd	s3,8(a6)
ffffffffc020670a:	00f83823          	sd	a5,16(a6)
ffffffffc020670e:	0109b023          	sd	a6,0(s3)
ffffffffc0206712:	89c2                	mv	s3,a6
ffffffffc0206714:	67e2                	ld	a5,24(sp)
ffffffffc0206716:	013a3423          	sd	s3,8(s4)
ffffffffc020671a:	00fa3823          	sd	a5,16(s4)
ffffffffc020671e:	0149b023          	sd	s4,0(s3)
ffffffffc0206722:	89da                	mv	s3,s6
ffffffffc0206724:	85eff06f          	j	ffffffffc0205782 <stride_dequeue+0x78e>
ffffffffc0206728:	008cb783          	ld	a5,8(s9)
ffffffffc020672c:	010cb983          	ld	s3,16(s9)
ffffffffc0206730:	f42a                	sd	a0,40(sp)
ffffffffc0206732:	f03e                	sd	a5,32(sp)
ffffffffc0206734:	04098163          	beqz	s3,ffffffffc0206776 <stride_dequeue+0x1782>
ffffffffc0206738:	859a                	mv	a1,t1
ffffffffc020673a:	854e                	mv	a0,s3
ffffffffc020673c:	fc42                	sd	a6,56(sp)
ffffffffc020673e:	f81a                	sd	t1,48(sp)
ffffffffc0206740:	e78fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206744:	7e22                	ld	t3,40(sp)
ffffffffc0206746:	7342                	ld	t1,48(sp)
ffffffffc0206748:	7862                	ld	a6,56(sp)
ffffffffc020674a:	11c505e3          	beq	a0,t3,ffffffffc0207054 <stride_dequeue+0x2060>
ffffffffc020674e:	01033583          	ld	a1,16(t1)
ffffffffc0206752:	854e                	mv	a0,s3
ffffffffc0206754:	00833b03          	ld	s6,8(t1)
ffffffffc0206758:	f842                	sd	a6,48(sp)
ffffffffc020675a:	f41a                	sd	t1,40(sp)
ffffffffc020675c:	eb8fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206760:	7322                	ld	t1,40(sp)
ffffffffc0206762:	7842                	ld	a6,48(sp)
ffffffffc0206764:	01633823          	sd	s6,16(t1)
ffffffffc0206768:	00a33423          	sd	a0,8(t1)
ffffffffc020676c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206770:	c119                	beqz	a0,ffffffffc0206776 <stride_dequeue+0x1782>
ffffffffc0206772:	00653023          	sd	t1,0(a0)
ffffffffc0206776:	7782                	ld	a5,32(sp)
ffffffffc0206778:	006cb423          	sd	t1,8(s9)
ffffffffc020677c:	89da                	mv	s3,s6
ffffffffc020677e:	00fcb823          	sd	a5,16(s9)
ffffffffc0206782:	01933023          	sd	s9,0(t1)
ffffffffc0206786:	9aeff06f          	j	ffffffffc0205934 <stride_dequeue+0x940>
ffffffffc020678a:	008db783          	ld	a5,8(s11)
ffffffffc020678e:	010db983          	ld	s3,16(s11)
ffffffffc0206792:	f02a                	sd	a0,32(sp)
ffffffffc0206794:	ec3e                	sd	a5,24(sp)
ffffffffc0206796:	04098563          	beqz	s3,ffffffffc02067e0 <stride_dequeue+0x17ec>
ffffffffc020679a:	859a                	mv	a1,t1
ffffffffc020679c:	854e                	mv	a0,s3
ffffffffc020679e:	fc42                	sd	a6,56(sp)
ffffffffc02067a0:	f832                	sd	a2,48(sp)
ffffffffc02067a2:	f41a                	sd	t1,40(sp)
ffffffffc02067a4:	e14fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02067a8:	7e02                	ld	t3,32(sp)
ffffffffc02067aa:	7322                	ld	t1,40(sp)
ffffffffc02067ac:	7642                	ld	a2,48(sp)
ffffffffc02067ae:	7862                	ld	a6,56(sp)
ffffffffc02067b0:	15c50be3          	beq	a0,t3,ffffffffc0207106 <stride_dequeue+0x2112>
ffffffffc02067b4:	01033583          	ld	a1,16(t1)
ffffffffc02067b8:	854e                	mv	a0,s3
ffffffffc02067ba:	00833b03          	ld	s6,8(t1)
ffffffffc02067be:	f842                	sd	a6,48(sp)
ffffffffc02067c0:	f432                	sd	a2,40(sp)
ffffffffc02067c2:	f01a                	sd	t1,32(sp)
ffffffffc02067c4:	e50fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02067c8:	7302                	ld	t1,32(sp)
ffffffffc02067ca:	7622                	ld	a2,40(sp)
ffffffffc02067cc:	7842                	ld	a6,48(sp)
ffffffffc02067ce:	01633823          	sd	s6,16(t1)
ffffffffc02067d2:	00a33423          	sd	a0,8(t1)
ffffffffc02067d6:	010c2b03          	lw	s6,16(s8)
ffffffffc02067da:	c119                	beqz	a0,ffffffffc02067e0 <stride_dequeue+0x17ec>
ffffffffc02067dc:	00653023          	sd	t1,0(a0)
ffffffffc02067e0:	67e2                	ld	a5,24(sp)
ffffffffc02067e2:	006db423          	sd	t1,8(s11)
ffffffffc02067e6:	89da                	mv	s3,s6
ffffffffc02067e8:	00fdb823          	sd	a5,16(s11)
ffffffffc02067ec:	01b33023          	sd	s11,0(t1)
ffffffffc02067f0:	c3dfe06f          	j	ffffffffc020542c <stride_dequeue+0x438>
ffffffffc02067f4:	0088b783          	ld	a5,8(a7)
ffffffffc02067f8:	0108b983          	ld	s3,16(a7)
ffffffffc02067fc:	f42a                	sd	a0,40(sp)
ffffffffc02067fe:	f03e                	sd	a5,32(sp)
ffffffffc0206800:	04098063          	beqz	s3,ffffffffc0206840 <stride_dequeue+0x184c>
ffffffffc0206804:	85c2                	mv	a1,a6
ffffffffc0206806:	854e                	mv	a0,s3
ffffffffc0206808:	fc46                	sd	a7,56(sp)
ffffffffc020680a:	daefe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020680e:	7e22                	ld	t3,40(sp)
ffffffffc0206810:	7842                	ld	a6,48(sp)
ffffffffc0206812:	78e2                	ld	a7,56(sp)
ffffffffc0206814:	29c50de3          	beq	a0,t3,ffffffffc02072ae <stride_dequeue+0x22ba>
ffffffffc0206818:	01083583          	ld	a1,16(a6)
ffffffffc020681c:	854e                	mv	a0,s3
ffffffffc020681e:	00883b03          	ld	s6,8(a6)
ffffffffc0206822:	f846                	sd	a7,48(sp)
ffffffffc0206824:	f442                	sd	a6,40(sp)
ffffffffc0206826:	deefe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020682a:	7822                	ld	a6,40(sp)
ffffffffc020682c:	78c2                	ld	a7,48(sp)
ffffffffc020682e:	01683823          	sd	s6,16(a6)
ffffffffc0206832:	00a83423          	sd	a0,8(a6)
ffffffffc0206836:	010c2b03          	lw	s6,16(s8)
ffffffffc020683a:	c119                	beqz	a0,ffffffffc0206840 <stride_dequeue+0x184c>
ffffffffc020683c:	01053023          	sd	a6,0(a0)
ffffffffc0206840:	7782                	ld	a5,32(sp)
ffffffffc0206842:	0108b423          	sd	a6,8(a7)
ffffffffc0206846:	89da                	mv	s3,s6
ffffffffc0206848:	00f8b823          	sd	a5,16(a7)
ffffffffc020684c:	01183023          	sd	a7,0(a6)
ffffffffc0206850:	8846                	mv	a6,a7
ffffffffc0206852:	d08ff06f          	j	ffffffffc0205d5a <stride_dequeue+0xd66>
ffffffffc0206856:	008db783          	ld	a5,8(s11)
ffffffffc020685a:	010db983          	ld	s3,16(s11)
ffffffffc020685e:	f42a                	sd	a0,40(sp)
ffffffffc0206860:	f03e                	sd	a5,32(sp)
ffffffffc0206862:	04098163          	beqz	s3,ffffffffc02068a4 <stride_dequeue+0x18b0>
ffffffffc0206866:	859a                	mv	a1,t1
ffffffffc0206868:	854e                	mv	a0,s3
ffffffffc020686a:	fc42                	sd	a6,56(sp)
ffffffffc020686c:	f81a                	sd	t1,48(sp)
ffffffffc020686e:	d4afe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206872:	7e22                	ld	t3,40(sp)
ffffffffc0206874:	7342                	ld	t1,48(sp)
ffffffffc0206876:	7862                	ld	a6,56(sp)
ffffffffc0206878:	29c507e3          	beq	a0,t3,ffffffffc0207306 <stride_dequeue+0x2312>
ffffffffc020687c:	01033583          	ld	a1,16(t1)
ffffffffc0206880:	854e                	mv	a0,s3
ffffffffc0206882:	00833b03          	ld	s6,8(t1)
ffffffffc0206886:	f842                	sd	a6,48(sp)
ffffffffc0206888:	f41a                	sd	t1,40(sp)
ffffffffc020688a:	d8afe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020688e:	7322                	ld	t1,40(sp)
ffffffffc0206890:	7842                	ld	a6,48(sp)
ffffffffc0206892:	01633823          	sd	s6,16(t1)
ffffffffc0206896:	00a33423          	sd	a0,8(t1)
ffffffffc020689a:	010c2b03          	lw	s6,16(s8)
ffffffffc020689e:	c119                	beqz	a0,ffffffffc02068a4 <stride_dequeue+0x18b0>
ffffffffc02068a0:	00653023          	sd	t1,0(a0)
ffffffffc02068a4:	7782                	ld	a5,32(sp)
ffffffffc02068a6:	006db423          	sd	t1,8(s11)
ffffffffc02068aa:	89da                	mv	s3,s6
ffffffffc02068ac:	00fdb823          	sd	a5,16(s11)
ffffffffc02068b0:	01b33023          	sd	s11,0(t1)
ffffffffc02068b4:	a1ffe06f          	j	ffffffffc02052d2 <stride_dequeue+0x2de>
ffffffffc02068b8:	0088b783          	ld	a5,8(a7)
ffffffffc02068bc:	0108b983          	ld	s3,16(a7)
ffffffffc02068c0:	f42a                	sd	a0,40(sp)
ffffffffc02068c2:	f03e                	sd	a5,32(sp)
ffffffffc02068c4:	04098063          	beqz	s3,ffffffffc0206904 <stride_dequeue+0x1910>
ffffffffc02068c8:	859a                	mv	a1,t1
ffffffffc02068ca:	854e                	mv	a0,s3
ffffffffc02068cc:	fc46                	sd	a7,56(sp)
ffffffffc02068ce:	ceafe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02068d2:	7e22                	ld	t3,40(sp)
ffffffffc02068d4:	7342                	ld	t1,48(sp)
ffffffffc02068d6:	78e2                	ld	a7,56(sp)
ffffffffc02068d8:	73c50263          	beq	a0,t3,ffffffffc0206ffc <stride_dequeue+0x2008>
ffffffffc02068dc:	01033583          	ld	a1,16(t1)
ffffffffc02068e0:	854e                	mv	a0,s3
ffffffffc02068e2:	00833b03          	ld	s6,8(t1)
ffffffffc02068e6:	f846                	sd	a7,48(sp)
ffffffffc02068e8:	f41a                	sd	t1,40(sp)
ffffffffc02068ea:	d2afe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02068ee:	7322                	ld	t1,40(sp)
ffffffffc02068f0:	78c2                	ld	a7,48(sp)
ffffffffc02068f2:	01633823          	sd	s6,16(t1)
ffffffffc02068f6:	00a33423          	sd	a0,8(t1)
ffffffffc02068fa:	010c2b03          	lw	s6,16(s8)
ffffffffc02068fe:	c119                	beqz	a0,ffffffffc0206904 <stride_dequeue+0x1910>
ffffffffc0206900:	00653023          	sd	t1,0(a0)
ffffffffc0206904:	7782                	ld	a5,32(sp)
ffffffffc0206906:	0068b423          	sd	t1,8(a7)
ffffffffc020690a:	89da                	mv	s3,s6
ffffffffc020690c:	00f8b823          	sd	a5,16(a7)
ffffffffc0206910:	01133023          	sd	a7,0(t1)
ffffffffc0206914:	f3dfe06f          	j	ffffffffc0205850 <stride_dequeue+0x85c>
ffffffffc0206918:	01093503          	ld	a0,16(s2)
ffffffffc020691c:	00893983          	ld	s3,8(s2)
ffffffffc0206920:	85da                	mv	a1,s6
ffffffffc0206922:	cf2fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206926:	00a93423          	sd	a0,8(s2)
ffffffffc020692a:	01393823          	sd	s3,16(s2)
ffffffffc020692e:	7822                	ld	a6,40(sp)
ffffffffc0206930:	77c2                	ld	a5,48(sp)
ffffffffc0206932:	010c2983          	lw	s3,16(s8)
ffffffffc0206936:	e119                	bnez	a0,ffffffffc020693c <stride_dequeue+0x1948>
ffffffffc0206938:	803fe06f          	j	ffffffffc020513a <stride_dequeue+0x146>
ffffffffc020693c:	01253023          	sd	s2,0(a0)
ffffffffc0206940:	ffafe06f          	j	ffffffffc020513a <stride_dequeue+0x146>
ffffffffc0206944:	0089b783          	ld	a5,8(s3)
ffffffffc0206948:	0109b803          	ld	a6,16(s3)
ffffffffc020694c:	f42a                	sd	a0,40(sp)
ffffffffc020694e:	ec3e                	sd	a5,24(sp)
ffffffffc0206950:	02080b63          	beqz	a6,ffffffffc0206986 <stride_dequeue+0x1992>
ffffffffc0206954:	8542                	mv	a0,a6
ffffffffc0206956:	85d2                	mv	a1,s4
ffffffffc0206958:	f042                	sd	a6,32(sp)
ffffffffc020695a:	c5efe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc020695e:	77a2                	ld	a5,40(sp)
ffffffffc0206960:	7802                	ld	a6,32(sp)
ffffffffc0206962:	3cf50be3          	beq	a0,a5,ffffffffc0207538 <stride_dequeue+0x2544>
ffffffffc0206966:	010a3583          	ld	a1,16(s4)
ffffffffc020696a:	008a3b03          	ld	s6,8(s4)
ffffffffc020696e:	8542                	mv	a0,a6
ffffffffc0206970:	ca4fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206974:	00aa3423          	sd	a0,8(s4)
ffffffffc0206978:	016a3823          	sd	s6,16(s4)
ffffffffc020697c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206980:	c119                	beqz	a0,ffffffffc0206986 <stride_dequeue+0x1992>
ffffffffc0206982:	01453023          	sd	s4,0(a0)
ffffffffc0206986:	67e2                	ld	a5,24(sp)
ffffffffc0206988:	0149b423          	sd	s4,8(s3)
ffffffffc020698c:	00f9b823          	sd	a5,16(s3)
ffffffffc0206990:	013a3023          	sd	s3,0(s4)
ffffffffc0206994:	8a4e                	mv	s4,s3
ffffffffc0206996:	c90ff06f          	j	ffffffffc0205e26 <stride_dequeue+0xe32>
ffffffffc020699a:	0089b783          	ld	a5,8(s3)
ffffffffc020699e:	0109b803          	ld	a6,16(s3)
ffffffffc02069a2:	f42a                	sd	a0,40(sp)
ffffffffc02069a4:	ec3e                	sd	a5,24(sp)
ffffffffc02069a6:	02080b63          	beqz	a6,ffffffffc02069dc <stride_dequeue+0x19e8>
ffffffffc02069aa:	8542                	mv	a0,a6
ffffffffc02069ac:	85e6                	mv	a1,s9
ffffffffc02069ae:	f042                	sd	a6,32(sp)
ffffffffc02069b0:	c08fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc02069b4:	77a2                	ld	a5,40(sp)
ffffffffc02069b6:	7802                	ld	a6,32(sp)
ffffffffc02069b8:	28f50ee3          	beq	a0,a5,ffffffffc0207454 <stride_dequeue+0x2460>
ffffffffc02069bc:	010cb583          	ld	a1,16(s9)
ffffffffc02069c0:	008cbb03          	ld	s6,8(s9)
ffffffffc02069c4:	8542                	mv	a0,a6
ffffffffc02069c6:	c4efe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02069ca:	00acb423          	sd	a0,8(s9)
ffffffffc02069ce:	016cb823          	sd	s6,16(s9)
ffffffffc02069d2:	010c2b03          	lw	s6,16(s8)
ffffffffc02069d6:	c119                	beqz	a0,ffffffffc02069dc <stride_dequeue+0x19e8>
ffffffffc02069d8:	01953023          	sd	s9,0(a0)
ffffffffc02069dc:	67e2                	ld	a5,24(sp)
ffffffffc02069de:	0199b423          	sd	s9,8(s3)
ffffffffc02069e2:	00f9b823          	sd	a5,16(s3)
ffffffffc02069e6:	013cb023          	sd	s3,0(s9)
ffffffffc02069ea:	8cce                	mv	s9,s3
ffffffffc02069ec:	de4ff06f          	j	ffffffffc0205fd0 <stride_dequeue+0xfdc>
ffffffffc02069f0:	0089b783          	ld	a5,8(s3)
ffffffffc02069f4:	0109b803          	ld	a6,16(s3)
ffffffffc02069f8:	f42a                	sd	a0,40(sp)
ffffffffc02069fa:	e83e                	sd	a5,16(sp)
ffffffffc02069fc:	02080f63          	beqz	a6,ffffffffc0206a3a <stride_dequeue+0x1a46>
ffffffffc0206a00:	8542                	mv	a0,a6
ffffffffc0206a02:	85d2                	mv	a1,s4
ffffffffc0206a04:	f032                	sd	a2,32(sp)
ffffffffc0206a06:	ec42                	sd	a6,24(sp)
ffffffffc0206a08:	bb0fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206a0c:	77a2                	ld	a5,40(sp)
ffffffffc0206a0e:	6862                	ld	a6,24(sp)
ffffffffc0206a10:	7602                	ld	a2,32(sp)
ffffffffc0206a12:	26f506e3          	beq	a0,a5,ffffffffc020747e <stride_dequeue+0x248a>
ffffffffc0206a16:	010a3583          	ld	a1,16(s4)
ffffffffc0206a1a:	008a3b03          	ld	s6,8(s4)
ffffffffc0206a1e:	8542                	mv	a0,a6
ffffffffc0206a20:	ec32                	sd	a2,24(sp)
ffffffffc0206a22:	bf2fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206a26:	00aa3423          	sd	a0,8(s4)
ffffffffc0206a2a:	016a3823          	sd	s6,16(s4)
ffffffffc0206a2e:	6662                	ld	a2,24(sp)
ffffffffc0206a30:	010c2b03          	lw	s6,16(s8)
ffffffffc0206a34:	c119                	beqz	a0,ffffffffc0206a3a <stride_dequeue+0x1a46>
ffffffffc0206a36:	01453023          	sd	s4,0(a0)
ffffffffc0206a3a:	67c2                	ld	a5,16(sp)
ffffffffc0206a3c:	0149b423          	sd	s4,8(s3)
ffffffffc0206a40:	00f9b823          	sd	a5,16(s3)
ffffffffc0206a44:	013a3023          	sd	s3,0(s4)
ffffffffc0206a48:	8a4e                	mv	s4,s3
ffffffffc0206a4a:	cb8ff06f          	j	ffffffffc0205f02 <stride_dequeue+0xf0e>
ffffffffc0206a4e:	008a3783          	ld	a5,8(s4)
ffffffffc0206a52:	010a3883          	ld	a7,16(s4)
ffffffffc0206a56:	f42a                	sd	a0,40(sp)
ffffffffc0206a58:	ec3e                	sd	a5,24(sp)
ffffffffc0206a5a:	02088b63          	beqz	a7,ffffffffc0206a90 <stride_dequeue+0x1a9c>
ffffffffc0206a5e:	8546                	mv	a0,a7
ffffffffc0206a60:	85ce                	mv	a1,s3
ffffffffc0206a62:	f046                	sd	a7,32(sp)
ffffffffc0206a64:	b54fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206a68:	77a2                	ld	a5,40(sp)
ffffffffc0206a6a:	7882                	ld	a7,32(sp)
ffffffffc0206a6c:	26f501e3          	beq	a0,a5,ffffffffc02074ce <stride_dequeue+0x24da>
ffffffffc0206a70:	0109b583          	ld	a1,16(s3)
ffffffffc0206a74:	0089bb03          	ld	s6,8(s3)
ffffffffc0206a78:	8546                	mv	a0,a7
ffffffffc0206a7a:	b9afe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206a7e:	00a9b423          	sd	a0,8(s3)
ffffffffc0206a82:	0169b823          	sd	s6,16(s3)
ffffffffc0206a86:	010c2b03          	lw	s6,16(s8)
ffffffffc0206a8a:	c119                	beqz	a0,ffffffffc0206a90 <stride_dequeue+0x1a9c>
ffffffffc0206a8c:	01353023          	sd	s3,0(a0)
ffffffffc0206a90:	67e2                	ld	a5,24(sp)
ffffffffc0206a92:	013a3423          	sd	s3,8(s4)
ffffffffc0206a96:	00fa3823          	sd	a5,16(s4)
ffffffffc0206a9a:	0149b023          	sd	s4,0(s3)
ffffffffc0206a9e:	89d2                	mv	s3,s4
ffffffffc0206aa0:	f9bfe06f          	j	ffffffffc0205a3a <stride_dequeue+0xa46>
ffffffffc0206aa4:	008a3783          	ld	a5,8(s4)
ffffffffc0206aa8:	010a3883          	ld	a7,16(s4)
ffffffffc0206aac:	fc2a                	sd	a0,56(sp)
ffffffffc0206aae:	f03e                	sd	a5,32(sp)
ffffffffc0206ab0:	02088f63          	beqz	a7,ffffffffc0206aee <stride_dequeue+0x1afa>
ffffffffc0206ab4:	8546                	mv	a0,a7
ffffffffc0206ab6:	85ce                	mv	a1,s3
ffffffffc0206ab8:	f842                	sd	a6,48(sp)
ffffffffc0206aba:	f446                	sd	a7,40(sp)
ffffffffc0206abc:	afcfe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206ac0:	7e62                	ld	t3,56(sp)
ffffffffc0206ac2:	78a2                	ld	a7,40(sp)
ffffffffc0206ac4:	7842                	ld	a6,48(sp)
ffffffffc0206ac6:	35c509e3          	beq	a0,t3,ffffffffc0207618 <stride_dequeue+0x2624>
ffffffffc0206aca:	0109b583          	ld	a1,16(s3)
ffffffffc0206ace:	0089bb03          	ld	s6,8(s3)
ffffffffc0206ad2:	8546                	mv	a0,a7
ffffffffc0206ad4:	f442                	sd	a6,40(sp)
ffffffffc0206ad6:	b3efe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206ada:	00a9b423          	sd	a0,8(s3)
ffffffffc0206ade:	0169b823          	sd	s6,16(s3)
ffffffffc0206ae2:	7822                	ld	a6,40(sp)
ffffffffc0206ae4:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ae8:	c119                	beqz	a0,ffffffffc0206aee <stride_dequeue+0x1afa>
ffffffffc0206aea:	01353023          	sd	s3,0(a0)
ffffffffc0206aee:	7782                	ld	a5,32(sp)
ffffffffc0206af0:	013a3423          	sd	s3,8(s4)
ffffffffc0206af4:	00fa3823          	sd	a5,16(s4)
ffffffffc0206af8:	0149b023          	sd	s4,0(s3)
ffffffffc0206afc:	89d2                	mv	s3,s4
ffffffffc0206afe:	c73fe06f          	j	ffffffffc0205770 <stride_dequeue+0x77c>
ffffffffc0206b02:	661c                	ld	a5,8(a2)
ffffffffc0206b04:	01063883          	ld	a7,16(a2)
ffffffffc0206b08:	fc2a                	sd	a0,56(sp)
ffffffffc0206b0a:	ec3e                	sd	a5,24(sp)
ffffffffc0206b0c:	04088363          	beqz	a7,ffffffffc0206b52 <stride_dequeue+0x1b5e>
ffffffffc0206b10:	8546                	mv	a0,a7
ffffffffc0206b12:	85ce                	mv	a1,s3
ffffffffc0206b14:	f842                	sd	a6,48(sp)
ffffffffc0206b16:	f432                	sd	a2,40(sp)
ffffffffc0206b18:	f046                	sd	a7,32(sp)
ffffffffc0206b1a:	a9efe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206b1e:	7e62                	ld	t3,56(sp)
ffffffffc0206b20:	7882                	ld	a7,32(sp)
ffffffffc0206b22:	7622                	ld	a2,40(sp)
ffffffffc0206b24:	7842                	ld	a6,48(sp)
ffffffffc0206b26:	25c501e3          	beq	a0,t3,ffffffffc0207568 <stride_dequeue+0x2574>
ffffffffc0206b2a:	0109b583          	ld	a1,16(s3)
ffffffffc0206b2e:	0089bb03          	ld	s6,8(s3)
ffffffffc0206b32:	8546                	mv	a0,a7
ffffffffc0206b34:	f442                	sd	a6,40(sp)
ffffffffc0206b36:	f032                	sd	a2,32(sp)
ffffffffc0206b38:	adcfe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206b3c:	00a9b423          	sd	a0,8(s3)
ffffffffc0206b40:	0169b823          	sd	s6,16(s3)
ffffffffc0206b44:	7602                	ld	a2,32(sp)
ffffffffc0206b46:	7822                	ld	a6,40(sp)
ffffffffc0206b48:	010c2b03          	lw	s6,16(s8)
ffffffffc0206b4c:	c119                	beqz	a0,ffffffffc0206b52 <stride_dequeue+0x1b5e>
ffffffffc0206b4e:	01353023          	sd	s3,0(a0)
ffffffffc0206b52:	67e2                	ld	a5,24(sp)
ffffffffc0206b54:	01363423          	sd	s3,8(a2)
ffffffffc0206b58:	ea1c                	sd	a5,16(a2)
ffffffffc0206b5a:	00c9b023          	sd	a2,0(s3)
ffffffffc0206b5e:	89b2                	mv	s3,a2
ffffffffc0206b60:	b13fe06f          	j	ffffffffc0205672 <stride_dequeue+0x67e>
ffffffffc0206b64:	89c6                	mv	s3,a7
ffffffffc0206b66:	9e4ff06f          	j	ffffffffc0205d4a <stride_dequeue+0xd56>
ffffffffc0206b6a:	0088b783          	ld	a5,8(a7)
ffffffffc0206b6e:	0108b803          	ld	a6,16(a7)
ffffffffc0206b72:	fc2a                	sd	a0,56(sp)
ffffffffc0206b74:	f03e                	sd	a5,32(sp)
ffffffffc0206b76:	02080f63          	beqz	a6,ffffffffc0206bb4 <stride_dequeue+0x1bc0>
ffffffffc0206b7a:	8542                	mv	a0,a6
ffffffffc0206b7c:	85ce                	mv	a1,s3
ffffffffc0206b7e:	f846                	sd	a7,48(sp)
ffffffffc0206b80:	f442                	sd	a6,40(sp)
ffffffffc0206b82:	a36fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206b86:	7e62                	ld	t3,56(sp)
ffffffffc0206b88:	7822                	ld	a6,40(sp)
ffffffffc0206b8a:	78c2                	ld	a7,48(sp)
ffffffffc0206b8c:	47c50ce3          	beq	a0,t3,ffffffffc0207804 <stride_dequeue+0x2810>
ffffffffc0206b90:	0109b583          	ld	a1,16(s3)
ffffffffc0206b94:	0089bb03          	ld	s6,8(s3)
ffffffffc0206b98:	8542                	mv	a0,a6
ffffffffc0206b9a:	f446                	sd	a7,40(sp)
ffffffffc0206b9c:	a78fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206ba0:	00a9b423          	sd	a0,8(s3)
ffffffffc0206ba4:	0169b823          	sd	s6,16(s3)
ffffffffc0206ba8:	78a2                	ld	a7,40(sp)
ffffffffc0206baa:	010c2b03          	lw	s6,16(s8)
ffffffffc0206bae:	c119                	beqz	a0,ffffffffc0206bb4 <stride_dequeue+0x1bc0>
ffffffffc0206bb0:	01353023          	sd	s3,0(a0)
ffffffffc0206bb4:	7782                	ld	a5,32(sp)
ffffffffc0206bb6:	0138b423          	sd	s3,8(a7)
ffffffffc0206bba:	00f8b823          	sd	a5,16(a7)
ffffffffc0206bbe:	0119b023          	sd	a7,0(s3)
ffffffffc0206bc2:	89c6                	mv	s3,a7
ffffffffc0206bc4:	8f0ff06f          	j	ffffffffc0205cb4 <stride_dequeue+0xcc0>
ffffffffc0206bc8:	0088b783          	ld	a5,8(a7)
ffffffffc0206bcc:	0108b803          	ld	a6,16(a7)
ffffffffc0206bd0:	fc2a                	sd	a0,56(sp)
ffffffffc0206bd2:	f03e                	sd	a5,32(sp)
ffffffffc0206bd4:	02080f63          	beqz	a6,ffffffffc0206c12 <stride_dequeue+0x1c1e>
ffffffffc0206bd8:	8542                	mv	a0,a6
ffffffffc0206bda:	85ce                	mv	a1,s3
ffffffffc0206bdc:	f846                	sd	a7,48(sp)
ffffffffc0206bde:	f442                	sd	a6,40(sp)
ffffffffc0206be0:	9d8fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206be4:	7e62                	ld	t3,56(sp)
ffffffffc0206be6:	7822                	ld	a6,40(sp)
ffffffffc0206be8:	78c2                	ld	a7,48(sp)
ffffffffc0206bea:	25c50de3          	beq	a0,t3,ffffffffc0207644 <stride_dequeue+0x2650>
ffffffffc0206bee:	0109b583          	ld	a1,16(s3)
ffffffffc0206bf2:	0089bb03          	ld	s6,8(s3)
ffffffffc0206bf6:	8542                	mv	a0,a6
ffffffffc0206bf8:	f446                	sd	a7,40(sp)
ffffffffc0206bfa:	a1afe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206bfe:	00a9b423          	sd	a0,8(s3)
ffffffffc0206c02:	0169b823          	sd	s6,16(s3)
ffffffffc0206c06:	78a2                	ld	a7,40(sp)
ffffffffc0206c08:	010c2b03          	lw	s6,16(s8)
ffffffffc0206c0c:	c119                	beqz	a0,ffffffffc0206c12 <stride_dequeue+0x1c1e>
ffffffffc0206c0e:	01353023          	sd	s3,0(a0)
ffffffffc0206c12:	7782                	ld	a5,32(sp)
ffffffffc0206c14:	0138b423          	sd	s3,8(a7)
ffffffffc0206c18:	00f8b823          	sd	a5,16(a7)
ffffffffc0206c1c:	0119b023          	sd	a7,0(s3)
ffffffffc0206c20:	89c6                	mv	s3,a7
ffffffffc0206c22:	ee7fe06f          	j	ffffffffc0205b08 <stride_dequeue+0xb14>
ffffffffc0206c26:	0088b783          	ld	a5,8(a7)
ffffffffc0206c2a:	0108b803          	ld	a6,16(a7)
ffffffffc0206c2e:	fc2a                	sd	a0,56(sp)
ffffffffc0206c30:	ec3e                	sd	a5,24(sp)
ffffffffc0206c32:	04080263          	beqz	a6,ffffffffc0206c76 <stride_dequeue+0x1c82>
ffffffffc0206c36:	8542                	mv	a0,a6
ffffffffc0206c38:	85ce                	mv	a1,s3
ffffffffc0206c3a:	f846                	sd	a7,48(sp)
ffffffffc0206c3c:	f042                	sd	a6,32(sp)
ffffffffc0206c3e:	97afe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206c42:	7e62                	ld	t3,56(sp)
ffffffffc0206c44:	7802                	ld	a6,32(sp)
ffffffffc0206c46:	7622                	ld	a2,40(sp)
ffffffffc0206c48:	78c2                	ld	a7,48(sp)
ffffffffc0206c4a:	23c503e3          	beq	a0,t3,ffffffffc0207670 <stride_dequeue+0x267c>
ffffffffc0206c4e:	0109b583          	ld	a1,16(s3)
ffffffffc0206c52:	0089bb03          	ld	s6,8(s3)
ffffffffc0206c56:	8542                	mv	a0,a6
ffffffffc0206c58:	f446                	sd	a7,40(sp)
ffffffffc0206c5a:	f032                	sd	a2,32(sp)
ffffffffc0206c5c:	9b8fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206c60:	00a9b423          	sd	a0,8(s3)
ffffffffc0206c64:	0169b823          	sd	s6,16(s3)
ffffffffc0206c68:	7602                	ld	a2,32(sp)
ffffffffc0206c6a:	78a2                	ld	a7,40(sp)
ffffffffc0206c6c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206c70:	c119                	beqz	a0,ffffffffc0206c76 <stride_dequeue+0x1c82>
ffffffffc0206c72:	01353023          	sd	s3,0(a0)
ffffffffc0206c76:	67e2                	ld	a5,24(sp)
ffffffffc0206c78:	0138b423          	sd	s3,8(a7)
ffffffffc0206c7c:	00f8b823          	sd	a5,16(a7)
ffffffffc0206c80:	0119b023          	sd	a7,0(s3)
ffffffffc0206c84:	89c6                	mv	s3,a7
ffffffffc0206c86:	f61fe06f          	j	ffffffffc0205be6 <stride_dequeue+0xbf2>
ffffffffc0206c8a:	0089b783          	ld	a5,8(s3)
ffffffffc0206c8e:	0109b303          	ld	t1,16(s3)
ffffffffc0206c92:	fc2a                	sd	a0,56(sp)
ffffffffc0206c94:	f03e                	sd	a5,32(sp)
ffffffffc0206c96:	02030f63          	beqz	t1,ffffffffc0206cd4 <stride_dequeue+0x1ce0>
ffffffffc0206c9a:	851a                	mv	a0,t1
ffffffffc0206c9c:	85e6                	mv	a1,s9
ffffffffc0206c9e:	f846                	sd	a7,48(sp)
ffffffffc0206ca0:	f41a                	sd	t1,40(sp)
ffffffffc0206ca2:	916fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206ca6:	7e62                	ld	t3,56(sp)
ffffffffc0206ca8:	7322                	ld	t1,40(sp)
ffffffffc0206caa:	78c2                	ld	a7,48(sp)
ffffffffc0206cac:	11c50be3          	beq	a0,t3,ffffffffc02075c2 <stride_dequeue+0x25ce>
ffffffffc0206cb0:	010cb583          	ld	a1,16(s9)
ffffffffc0206cb4:	008cbb03          	ld	s6,8(s9)
ffffffffc0206cb8:	851a                	mv	a0,t1
ffffffffc0206cba:	f446                	sd	a7,40(sp)
ffffffffc0206cbc:	958fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206cc0:	00acb423          	sd	a0,8(s9)
ffffffffc0206cc4:	016cb823          	sd	s6,16(s9)
ffffffffc0206cc8:	78a2                	ld	a7,40(sp)
ffffffffc0206cca:	010c2b03          	lw	s6,16(s8)
ffffffffc0206cce:	c119                	beqz	a0,ffffffffc0206cd4 <stride_dequeue+0x1ce0>
ffffffffc0206cd0:	01953023          	sd	s9,0(a0)
ffffffffc0206cd4:	7782                	ld	a5,32(sp)
ffffffffc0206cd6:	0199b423          	sd	s9,8(s3)
ffffffffc0206cda:	00f9b823          	sd	a5,16(s3)
ffffffffc0206cde:	013cb023          	sd	s3,0(s9)
ffffffffc0206ce2:	8cce                	mv	s9,s3
ffffffffc0206ce4:	b8aff06f          	j	ffffffffc020606e <stride_dequeue+0x107a>
ffffffffc0206ce8:	89ee                	mv	s3,s11
ffffffffc0206cea:	dd6fe06f          	j	ffffffffc02052c0 <stride_dequeue+0x2cc>
ffffffffc0206cee:	0089b783          	ld	a5,8(s3)
ffffffffc0206cf2:	0109b303          	ld	t1,16(s3)
ffffffffc0206cf6:	fc2a                	sd	a0,56(sp)
ffffffffc0206cf8:	f03e                	sd	a5,32(sp)
ffffffffc0206cfa:	02030f63          	beqz	t1,ffffffffc0206d38 <stride_dequeue+0x1d44>
ffffffffc0206cfe:	85c2                	mv	a1,a6
ffffffffc0206d00:	851a                	mv	a0,t1
ffffffffc0206d02:	f842                	sd	a6,48(sp)
ffffffffc0206d04:	f41a                	sd	t1,40(sp)
ffffffffc0206d06:	8b2fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206d0a:	7e62                	ld	t3,56(sp)
ffffffffc0206d0c:	7322                	ld	t1,40(sp)
ffffffffc0206d0e:	7842                	ld	a6,48(sp)
ffffffffc0206d10:	0dc50fe3          	beq	a0,t3,ffffffffc02075ee <stride_dequeue+0x25fa>
ffffffffc0206d14:	01083583          	ld	a1,16(a6)
ffffffffc0206d18:	851a                	mv	a0,t1
ffffffffc0206d1a:	00883b03          	ld	s6,8(a6)
ffffffffc0206d1e:	f442                	sd	a6,40(sp)
ffffffffc0206d20:	8f4fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206d24:	7822                	ld	a6,40(sp)
ffffffffc0206d26:	01683823          	sd	s6,16(a6)
ffffffffc0206d2a:	00a83423          	sd	a0,8(a6)
ffffffffc0206d2e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206d32:	c119                	beqz	a0,ffffffffc0206d38 <stride_dequeue+0x1d44>
ffffffffc0206d34:	01053023          	sd	a6,0(a0)
ffffffffc0206d38:	7782                	ld	a5,32(sp)
ffffffffc0206d3a:	0109b423          	sd	a6,8(s3)
ffffffffc0206d3e:	00f9b823          	sd	a5,16(s3)
ffffffffc0206d42:	01383023          	sd	s3,0(a6)
ffffffffc0206d46:	884e                	mv	a6,s3
ffffffffc0206d48:	bc4ff06f          	j	ffffffffc020610c <stride_dequeue+0x1118>
ffffffffc0206d4c:	008cb783          	ld	a5,8(s9)
ffffffffc0206d50:	010cb883          	ld	a7,16(s9)
ffffffffc0206d54:	fc2a                	sd	a0,56(sp)
ffffffffc0206d56:	f03e                	sd	a5,32(sp)
ffffffffc0206d58:	02088f63          	beqz	a7,ffffffffc0206d96 <stride_dequeue+0x1da2>
ffffffffc0206d5c:	8546                	mv	a0,a7
ffffffffc0206d5e:	85ce                	mv	a1,s3
ffffffffc0206d60:	f842                	sd	a6,48(sp)
ffffffffc0206d62:	f446                	sd	a7,40(sp)
ffffffffc0206d64:	854fe0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206d68:	7e62                	ld	t3,56(sp)
ffffffffc0206d6a:	78a2                	ld	a7,40(sp)
ffffffffc0206d6c:	7842                	ld	a6,48(sp)
ffffffffc0206d6e:	27c505e3          	beq	a0,t3,ffffffffc02077d8 <stride_dequeue+0x27e4>
ffffffffc0206d72:	0109b583          	ld	a1,16(s3)
ffffffffc0206d76:	0089bb03          	ld	s6,8(s3)
ffffffffc0206d7a:	8546                	mv	a0,a7
ffffffffc0206d7c:	f442                	sd	a6,40(sp)
ffffffffc0206d7e:	896fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206d82:	00a9b423          	sd	a0,8(s3)
ffffffffc0206d86:	0169b823          	sd	s6,16(s3)
ffffffffc0206d8a:	7822                	ld	a6,40(sp)
ffffffffc0206d8c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206d90:	c119                	beqz	a0,ffffffffc0206d96 <stride_dequeue+0x1da2>
ffffffffc0206d92:	01353023          	sd	s3,0(a0)
ffffffffc0206d96:	7782                	ld	a5,32(sp)
ffffffffc0206d98:	013cb423          	sd	s3,8(s9)
ffffffffc0206d9c:	00fcb823          	sd	a5,16(s9)
ffffffffc0206da0:	0199b023          	sd	s9,0(s3)
ffffffffc0206da4:	89e6                	mv	s3,s9
ffffffffc0206da6:	fb0fe06f          	j	ffffffffc0205556 <stride_dequeue+0x562>
ffffffffc0206daa:	0089b783          	ld	a5,8(s3)
ffffffffc0206dae:	0109b303          	ld	t1,16(s3)
ffffffffc0206db2:	fc2a                	sd	a0,56(sp)
ffffffffc0206db4:	f03e                	sd	a5,32(sp)
ffffffffc0206db6:	02030f63          	beqz	t1,ffffffffc0206df4 <stride_dequeue+0x1e00>
ffffffffc0206dba:	85c2                	mv	a1,a6
ffffffffc0206dbc:	851a                	mv	a0,t1
ffffffffc0206dbe:	f842                	sd	a6,48(sp)
ffffffffc0206dc0:	f41a                	sd	t1,40(sp)
ffffffffc0206dc2:	ff7fd0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206dc6:	7e62                	ld	t3,56(sp)
ffffffffc0206dc8:	7322                	ld	t1,40(sp)
ffffffffc0206dca:	7842                	ld	a6,48(sp)
ffffffffc0206dcc:	1bc509e3          	beq	a0,t3,ffffffffc020777e <stride_dequeue+0x278a>
ffffffffc0206dd0:	01083583          	ld	a1,16(a6)
ffffffffc0206dd4:	851a                	mv	a0,t1
ffffffffc0206dd6:	00883b03          	ld	s6,8(a6)
ffffffffc0206dda:	f442                	sd	a6,40(sp)
ffffffffc0206ddc:	838fe0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206de0:	7822                	ld	a6,40(sp)
ffffffffc0206de2:	01683823          	sd	s6,16(a6)
ffffffffc0206de6:	00a83423          	sd	a0,8(a6)
ffffffffc0206dea:	010c2b03          	lw	s6,16(s8)
ffffffffc0206dee:	c119                	beqz	a0,ffffffffc0206df4 <stride_dequeue+0x1e00>
ffffffffc0206df0:	01053023          	sd	a6,0(a0)
ffffffffc0206df4:	7782                	ld	a5,32(sp)
ffffffffc0206df6:	0109b423          	sd	a6,8(s3)
ffffffffc0206dfa:	00f9b823          	sd	a5,16(s3)
ffffffffc0206dfe:	01383023          	sd	s3,0(a6)
ffffffffc0206e02:	884e                	mv	a6,s3
ffffffffc0206e04:	ba4ff06f          	j	ffffffffc02061a8 <stride_dequeue+0x11b4>
ffffffffc0206e08:	0089b783          	ld	a5,8(s3)
ffffffffc0206e0c:	0109b303          	ld	t1,16(s3)
ffffffffc0206e10:	fc2a                	sd	a0,56(sp)
ffffffffc0206e12:	ec3e                	sd	a5,24(sp)
ffffffffc0206e14:	04030363          	beqz	t1,ffffffffc0206e5a <stride_dequeue+0x1e66>
ffffffffc0206e18:	85c2                	mv	a1,a6
ffffffffc0206e1a:	851a                	mv	a0,t1
ffffffffc0206e1c:	f832                	sd	a2,48(sp)
ffffffffc0206e1e:	f442                	sd	a6,40(sp)
ffffffffc0206e20:	f01a                	sd	t1,32(sp)
ffffffffc0206e22:	f97fd0ef          	jal	ra,ffffffffc0204db8 <proc_stride_comp_f>
ffffffffc0206e26:	7642                	ld	a2,48(sp)
ffffffffc0206e28:	7e62                	ld	t3,56(sp)
ffffffffc0206e2a:	7822                	ld	a6,40(sp)
ffffffffc0206e2c:	f432                	sd	a2,40(sp)
ffffffffc0206e2e:	7302                	ld	t1,32(sp)
ffffffffc0206e30:	29c507e3          	beq	a0,t3,ffffffffc02078be <stride_dequeue+0x28ca>
ffffffffc0206e34:	01083583          	ld	a1,16(a6)
ffffffffc0206e38:	851a                	mv	a0,t1
ffffffffc0206e3a:	00883b03          	ld	s6,8(a6)
ffffffffc0206e3e:	f042                	sd	a6,32(sp)
ffffffffc0206e40:	fd5fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206e44:	7802                	ld	a6,32(sp)
ffffffffc0206e46:	7622                	ld	a2,40(sp)
ffffffffc0206e48:	01683823          	sd	s6,16(a6)
ffffffffc0206e4c:	00a83423          	sd	a0,8(a6)
ffffffffc0206e50:	010c2b03          	lw	s6,16(s8)
ffffffffc0206e54:	c119                	beqz	a0,ffffffffc0206e5a <stride_dequeue+0x1e66>
ffffffffc0206e56:	01053023          	sd	a6,0(a0)
ffffffffc0206e5a:	67e2                	ld	a5,24(sp)
ffffffffc0206e5c:	0109b423          	sd	a6,8(s3)
ffffffffc0206e60:	00f9b823          	sd	a5,16(s3)
ffffffffc0206e64:	01383023          	sd	s3,0(a6)
ffffffffc0206e68:	884e                	mv	a6,s3
ffffffffc0206e6a:	be2ff06f          	j	ffffffffc020624c <stride_dequeue+0x1258>
ffffffffc0206e6e:	89c6                	mv	s3,a7
ffffffffc0206e70:	9cffe06f          	j	ffffffffc020583e <stride_dequeue+0x84a>
ffffffffc0206e74:	89e6                	mv	s3,s9
ffffffffc0206e76:	aadfe06f          	j	ffffffffc0205922 <stride_dequeue+0x92e>
ffffffffc0206e7a:	89ee                	mv	s3,s11
ffffffffc0206e7c:	d9efe06f          	j	ffffffffc020541a <stride_dequeue+0x426>
ffffffffc0206e80:	89d2                	mv	s3,s4
ffffffffc0206e82:	bb9fe06f          	j	ffffffffc0205a3a <stride_dequeue+0xa46>
ffffffffc0206e86:	0108b503          	ld	a0,16(a7)
ffffffffc0206e8a:	85ce                	mv	a1,s3
ffffffffc0206e8c:	0088bb03          	ld	s6,8(a7)
ffffffffc0206e90:	f81a                	sd	t1,48(sp)
ffffffffc0206e92:	f446                	sd	a7,40(sp)
ffffffffc0206e94:	f81fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206e98:	78a2                	ld	a7,40(sp)
ffffffffc0206e9a:	7342                	ld	t1,48(sp)
ffffffffc0206e9c:	0168b823          	sd	s6,16(a7)
ffffffffc0206ea0:	00a8b423          	sd	a0,8(a7)
ffffffffc0206ea4:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ea8:	d179                	beqz	a0,ffffffffc0206e6e <stride_dequeue+0x1e7a>
ffffffffc0206eaa:	01153023          	sd	a7,0(a0)
ffffffffc0206eae:	89c6                	mv	s3,a7
ffffffffc0206eb0:	98ffe06f          	j	ffffffffc020583e <stride_dequeue+0x84a>
ffffffffc0206eb4:	0109b503          	ld	a0,16(s3)
ffffffffc0206eb8:	0089bb03          	ld	s6,8(s3)
ffffffffc0206ebc:	85be                	mv	a1,a5
ffffffffc0206ebe:	f442                	sd	a6,40(sp)
ffffffffc0206ec0:	f55fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206ec4:	00a9b423          	sd	a0,8(s3)
ffffffffc0206ec8:	0169b823          	sd	s6,16(s3)
ffffffffc0206ecc:	7822                	ld	a6,40(sp)
ffffffffc0206ece:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ed2:	5e050b63          	beqz	a0,ffffffffc02074c8 <stride_dequeue+0x24d4>
ffffffffc0206ed6:	01353023          	sd	s3,0(a0)
ffffffffc0206eda:	87ce                	mv	a5,s3
ffffffffc0206edc:	bccff06f          	j	ffffffffc02062a8 <stride_dequeue+0x12b4>
ffffffffc0206ee0:	010cb503          	ld	a0,16(s9)
ffffffffc0206ee4:	008cbb03          	ld	s6,8(s9)
ffffffffc0206ee8:	85ce                	mv	a1,s3
ffffffffc0206eea:	f2bfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206eee:	00acb423          	sd	a0,8(s9)
ffffffffc0206ef2:	016cb823          	sd	s6,16(s9)
ffffffffc0206ef6:	7822                	ld	a6,40(sp)
ffffffffc0206ef8:	7342                	ld	t1,48(sp)
ffffffffc0206efa:	010c2b03          	lw	s6,16(s8)
ffffffffc0206efe:	d93d                	beqz	a0,ffffffffc0206e74 <stride_dequeue+0x1e80>
ffffffffc0206f00:	01953023          	sd	s9,0(a0)
ffffffffc0206f04:	89e6                	mv	s3,s9
ffffffffc0206f06:	a1dfe06f          	j	ffffffffc0205922 <stride_dequeue+0x92e>
ffffffffc0206f0a:	0108b503          	ld	a0,16(a7)
ffffffffc0206f0e:	85ce                	mv	a1,s3
ffffffffc0206f10:	0088bb03          	ld	s6,8(a7)
ffffffffc0206f14:	f842                	sd	a6,48(sp)
ffffffffc0206f16:	f446                	sd	a7,40(sp)
ffffffffc0206f18:	efdfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206f1c:	78a2                	ld	a7,40(sp)
ffffffffc0206f1e:	7842                	ld	a6,48(sp)
ffffffffc0206f20:	0168b823          	sd	s6,16(a7)
ffffffffc0206f24:	00a8b423          	sd	a0,8(a7)
ffffffffc0206f28:	010c2b03          	lw	s6,16(s8)
ffffffffc0206f2c:	c2050ce3          	beqz	a0,ffffffffc0206b64 <stride_dequeue+0x1b70>
ffffffffc0206f30:	01153023          	sd	a7,0(a0)
ffffffffc0206f34:	89c6                	mv	s3,a7
ffffffffc0206f36:	e15fe06f          	j	ffffffffc0205d4a <stride_dequeue+0xd56>
ffffffffc0206f3a:	010db503          	ld	a0,16(s11)
ffffffffc0206f3e:	008dbb03          	ld	s6,8(s11)
ffffffffc0206f42:	85ce                	mv	a1,s3
ffffffffc0206f44:	ed1fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206f48:	00adb423          	sd	a0,8(s11)
ffffffffc0206f4c:	016db823          	sd	s6,16(s11)
ffffffffc0206f50:	7602                	ld	a2,32(sp)
ffffffffc0206f52:	7822                	ld	a6,40(sp)
ffffffffc0206f54:	7342                	ld	t1,48(sp)
ffffffffc0206f56:	010c2b03          	lw	s6,16(s8)
ffffffffc0206f5a:	d105                	beqz	a0,ffffffffc0206e7a <stride_dequeue+0x1e86>
ffffffffc0206f5c:	01b53023          	sd	s11,0(a0)
ffffffffc0206f60:	89ee                	mv	s3,s11
ffffffffc0206f62:	cb8fe06f          	j	ffffffffc020541a <stride_dequeue+0x426>
ffffffffc0206f66:	010db503          	ld	a0,16(s11)
ffffffffc0206f6a:	008dbb03          	ld	s6,8(s11)
ffffffffc0206f6e:	85ce                	mv	a1,s3
ffffffffc0206f70:	ea5fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206f74:	00adb423          	sd	a0,8(s11)
ffffffffc0206f78:	016db823          	sd	s6,16(s11)
ffffffffc0206f7c:	7322                	ld	t1,40(sp)
ffffffffc0206f7e:	7842                	ld	a6,48(sp)
ffffffffc0206f80:	010c2b03          	lw	s6,16(s8)
ffffffffc0206f84:	d60502e3          	beqz	a0,ffffffffc0206ce8 <stride_dequeue+0x1cf4>
ffffffffc0206f88:	01b53023          	sd	s11,0(a0)
ffffffffc0206f8c:	89ee                	mv	s3,s11
ffffffffc0206f8e:	b32fe06f          	j	ffffffffc02052c0 <stride_dequeue+0x2cc>
ffffffffc0206f92:	89e6                	mv	s3,s9
ffffffffc0206f94:	dc2fe06f          	j	ffffffffc0205556 <stride_dequeue+0x562>
ffffffffc0206f98:	89c6                	mv	s3,a7
ffffffffc0206f9a:	d1bfe06f          	j	ffffffffc0205cb4 <stride_dequeue+0xcc0>
ffffffffc0206f9e:	00003697          	auipc	a3,0x3
ffffffffc0206fa2:	aba68693          	addi	a3,a3,-1350 # ffffffffc0209a58 <default_pmm_manager+0x868>
ffffffffc0206fa6:	00001617          	auipc	a2,0x1
ffffffffc0206faa:	62a60613          	addi	a2,a2,1578 # ffffffffc02085d0 <commands+0x410>
ffffffffc0206fae:	06300593          	li	a1,99
ffffffffc0206fb2:	00003517          	auipc	a0,0x3
ffffffffc0206fb6:	ace50513          	addi	a0,a0,-1330 # ffffffffc0209a80 <default_pmm_manager+0x890>
ffffffffc0206fba:	a4ef90ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0206fbe:	89d2                	mv	s3,s4
ffffffffc0206fc0:	fb0fe06f          	j	ffffffffc0205770 <stride_dequeue+0x77c>
ffffffffc0206fc4:	89c6                	mv	s3,a7
ffffffffc0206fc6:	c21fe06f          	j	ffffffffc0205be6 <stride_dequeue+0xbf2>
ffffffffc0206fca:	89c6                	mv	s3,a7
ffffffffc0206fcc:	b3dfe06f          	j	ffffffffc0205b08 <stride_dequeue+0xb14>
ffffffffc0206fd0:	89b2                	mv	s3,a2
ffffffffc0206fd2:	ea0fe06f          	j	ffffffffc0205672 <stride_dequeue+0x67e>
ffffffffc0206fd6:	0109b503          	ld	a0,16(s3)
ffffffffc0206fda:	0089bb03          	ld	s6,8(s3)
ffffffffc0206fde:	85a6                	mv	a1,s1
ffffffffc0206fe0:	e35fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0206fe4:	00a9b423          	sd	a0,8(s3)
ffffffffc0206fe8:	0169b823          	sd	s6,16(s3)
ffffffffc0206fec:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ff0:	b4050363          	beqz	a0,ffffffffc0206336 <stride_dequeue+0x1342>
ffffffffc0206ff4:	01353023          	sd	s3,0(a0)
ffffffffc0206ff8:	b3eff06f          	j	ffffffffc0206336 <stride_dequeue+0x1342>
ffffffffc0206ffc:	0109b503          	ld	a0,16(s3)
ffffffffc0207000:	0089bb03          	ld	s6,8(s3)
ffffffffc0207004:	859a                	mv	a1,t1
ffffffffc0207006:	f446                	sd	a7,40(sp)
ffffffffc0207008:	e0dfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020700c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207010:	0169b823          	sd	s6,16(s3)
ffffffffc0207014:	78a2                	ld	a7,40(sp)
ffffffffc0207016:	010c2b03          	lw	s6,16(s8)
ffffffffc020701a:	100505e3          	beqz	a0,ffffffffc0207924 <stride_dequeue+0x2930>
ffffffffc020701e:	01353023          	sd	s3,0(a0)
ffffffffc0207022:	834e                	mv	t1,s3
ffffffffc0207024:	b0c5                	j	ffffffffc0206904 <stride_dequeue+0x1910>
ffffffffc0207026:	0109b503          	ld	a0,16(s3)
ffffffffc020702a:	0089bb03          	ld	s6,8(s3)
ffffffffc020702e:	85f2                	mv	a1,t3
ffffffffc0207030:	f442                	sd	a6,40(sp)
ffffffffc0207032:	f032                	sd	a2,32(sp)
ffffffffc0207034:	de1fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207038:	00a9b423          	sd	a0,8(s3)
ffffffffc020703c:	0169b823          	sd	s6,16(s3)
ffffffffc0207040:	7602                	ld	a2,32(sp)
ffffffffc0207042:	7822                	ld	a6,40(sp)
ffffffffc0207044:	010c2b03          	lw	s6,16(s8)
ffffffffc0207048:	9e050b63          	beqz	a0,ffffffffc020623e <stride_dequeue+0x124a>
ffffffffc020704c:	01353023          	sd	s3,0(a0)
ffffffffc0207050:	9eeff06f          	j	ffffffffc020623e <stride_dequeue+0x124a>
ffffffffc0207054:	0109b503          	ld	a0,16(s3)
ffffffffc0207058:	0089bb03          	ld	s6,8(s3)
ffffffffc020705c:	859a                	mv	a1,t1
ffffffffc020705e:	f442                	sd	a6,40(sp)
ffffffffc0207060:	db5fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207064:	00a9b423          	sd	a0,8(s3)
ffffffffc0207068:	0169b823          	sd	s6,16(s3)
ffffffffc020706c:	7822                	ld	a6,40(sp)
ffffffffc020706e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207072:	08050de3          	beqz	a0,ffffffffc020790c <stride_dequeue+0x2918>
ffffffffc0207076:	01353023          	sd	s3,0(a0)
ffffffffc020707a:	834e                	mv	t1,s3
ffffffffc020707c:	efaff06f          	j	ffffffffc0206776 <stride_dequeue+0x1782>
ffffffffc0207080:	89a6                	mv	s3,s1
ffffffffc0207082:	ab4ff06f          	j	ffffffffc0206336 <stride_dequeue+0x1342>
ffffffffc0207086:	0109b503          	ld	a0,16(s3)
ffffffffc020708a:	0089bb03          	ld	s6,8(s3)
ffffffffc020708e:	85ee                	mv	a1,s11
ffffffffc0207090:	f046                	sd	a7,32(sp)
ffffffffc0207092:	d83fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207096:	00a9b423          	sd	a0,8(s3)
ffffffffc020709a:	0169b823          	sd	s6,16(s3)
ffffffffc020709e:	7882                	ld	a7,32(sp)
ffffffffc02070a0:	010c2b03          	lw	s6,16(s8)
ffffffffc02070a4:	bc050f63          	beqz	a0,ffffffffc0206482 <stride_dequeue+0x148e>
ffffffffc02070a8:	01353023          	sd	s3,0(a0)
ffffffffc02070ac:	bd6ff06f          	j	ffffffffc0206482 <stride_dequeue+0x148e>
ffffffffc02070b0:	0109b503          	ld	a0,16(s3)
ffffffffc02070b4:	0089bb03          	ld	s6,8(s3)
ffffffffc02070b8:	85f2                	mv	a1,t3
ffffffffc02070ba:	f442                	sd	a6,40(sp)
ffffffffc02070bc:	d59fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02070c0:	00a9b423          	sd	a0,8(s3)
ffffffffc02070c4:	0169b823          	sd	s6,16(s3)
ffffffffc02070c8:	7822                	ld	a6,40(sp)
ffffffffc02070ca:	010c2b03          	lw	s6,16(s8)
ffffffffc02070ce:	e119                	bnez	a0,ffffffffc02070d4 <stride_dequeue+0x20e0>
ffffffffc02070d0:	8caff06f          	j	ffffffffc020619a <stride_dequeue+0x11a6>
ffffffffc02070d4:	01353023          	sd	s3,0(a0)
ffffffffc02070d8:	8c2ff06f          	j	ffffffffc020619a <stride_dequeue+0x11a6>
ffffffffc02070dc:	0109b503          	ld	a0,16(s3)
ffffffffc02070e0:	0089bb03          	ld	s6,8(s3)
ffffffffc02070e4:	85b2                	mv	a1,a2
ffffffffc02070e6:	ec46                	sd	a7,24(sp)
ffffffffc02070e8:	d2dfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02070ec:	00a9b423          	sd	a0,8(s3)
ffffffffc02070f0:	0169b823          	sd	s6,16(s3)
ffffffffc02070f4:	68e2                	ld	a7,24(sp)
ffffffffc02070f6:	010c2b03          	lw	s6,16(s8)
ffffffffc02070fa:	c2050963          	beqz	a0,ffffffffc020652c <stride_dequeue+0x1538>
ffffffffc02070fe:	01353023          	sd	s3,0(a0)
ffffffffc0207102:	c2aff06f          	j	ffffffffc020652c <stride_dequeue+0x1538>
ffffffffc0207106:	0109b503          	ld	a0,16(s3)
ffffffffc020710a:	0089bb03          	ld	s6,8(s3)
ffffffffc020710e:	859a                	mv	a1,t1
ffffffffc0207110:	f442                	sd	a6,40(sp)
ffffffffc0207112:	f032                	sd	a2,32(sp)
ffffffffc0207114:	d01fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207118:	00a9b423          	sd	a0,8(s3)
ffffffffc020711c:	0169b823          	sd	s6,16(s3)
ffffffffc0207120:	7602                	ld	a2,32(sp)
ffffffffc0207122:	7822                	ld	a6,40(sp)
ffffffffc0207124:	010c2b03          	lw	s6,16(s8)
ffffffffc0207128:	7c050363          	beqz	a0,ffffffffc02078ee <stride_dequeue+0x28fa>
ffffffffc020712c:	01353023          	sd	s3,0(a0)
ffffffffc0207130:	834e                	mv	t1,s3
ffffffffc0207132:	eaeff06f          	j	ffffffffc02067e0 <stride_dequeue+0x17ec>
ffffffffc0207136:	0109b503          	ld	a0,16(s3)
ffffffffc020713a:	0089bb03          	ld	s6,8(s3)
ffffffffc020713e:	85c2                	mv	a1,a6
ffffffffc0207140:	ec32                	sd	a2,24(sp)
ffffffffc0207142:	cd3fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207146:	00a9b423          	sd	a0,8(s3)
ffffffffc020714a:	0169b823          	sd	s6,16(s3)
ffffffffc020714e:	6662                	ld	a2,24(sp)
ffffffffc0207150:	010c2b03          	lw	s6,16(s8)
ffffffffc0207154:	d2050263          	beqz	a0,ffffffffc0206678 <stride_dequeue+0x1684>
ffffffffc0207158:	01353023          	sd	s3,0(a0)
ffffffffc020715c:	d1cff06f          	j	ffffffffc0206678 <stride_dequeue+0x1684>
ffffffffc0207160:	0109b503          	ld	a0,16(s3)
ffffffffc0207164:	0089bb03          	ld	s6,8(s3)
ffffffffc0207168:	85c2                	mv	a1,a6
ffffffffc020716a:	cabfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020716e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207172:	0169b823          	sd	s6,16(s3)
ffffffffc0207176:	010c2b03          	lw	s6,16(s8)
ffffffffc020717a:	c4050b63          	beqz	a0,ffffffffc02065d0 <stride_dequeue+0x15dc>
ffffffffc020717e:	01353023          	sd	s3,0(a0)
ffffffffc0207182:	c4eff06f          	j	ffffffffc02065d0 <stride_dequeue+0x15dc>
ffffffffc0207186:	0109b503          	ld	a0,16(s3)
ffffffffc020718a:	0089bb03          	ld	s6,8(s3)
ffffffffc020718e:	859a                	mv	a1,t1
ffffffffc0207190:	c85fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207194:	00a9b423          	sd	a0,8(s3)
ffffffffc0207198:	0169b823          	sd	s6,16(s3)
ffffffffc020719c:	010c2b03          	lw	s6,16(s8)
ffffffffc02071a0:	e119                	bnez	a0,ffffffffc02071a6 <stride_dequeue+0x21b2>
ffffffffc02071a2:	c77fe06f          	j	ffffffffc0205e18 <stride_dequeue+0xe24>
ffffffffc02071a6:	01353023          	sd	s3,0(a0)
ffffffffc02071aa:	c6ffe06f          	j	ffffffffc0205e18 <stride_dequeue+0xe24>
ffffffffc02071ae:	6a08                	ld	a0,16(a2)
ffffffffc02071b0:	85f2                	mv	a1,t3
ffffffffc02071b2:	00863b03          	ld	s6,8(a2)
ffffffffc02071b6:	c5ffd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02071ba:	7602                	ld	a2,32(sp)
ffffffffc02071bc:	7822                	ld	a6,40(sp)
ffffffffc02071be:	01663823          	sd	s6,16(a2)
ffffffffc02071c2:	e608                	sd	a0,8(a2)
ffffffffc02071c4:	010c2b03          	lw	s6,16(s8)
ffffffffc02071c8:	e119                	bnez	a0,ffffffffc02071ce <stride_dequeue+0x21da>
ffffffffc02071ca:	c9afe06f          	j	ffffffffc0205664 <stride_dequeue+0x670>
ffffffffc02071ce:	e110                	sd	a2,0(a0)
ffffffffc02071d0:	c94fe06f          	j	ffffffffc0205664 <stride_dequeue+0x670>
ffffffffc02071d4:	010a3503          	ld	a0,16(s4)
ffffffffc02071d8:	008a3b03          	ld	s6,8(s4)
ffffffffc02071dc:	859a                	mv	a1,t1
ffffffffc02071de:	c37fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02071e2:	00aa3423          	sd	a0,8(s4)
ffffffffc02071e6:	016a3823          	sd	s6,16(s4)
ffffffffc02071ea:	010c2b03          	lw	s6,16(s8)
ffffffffc02071ee:	e119                	bnez	a0,ffffffffc02071f4 <stride_dequeue+0x2200>
ffffffffc02071f0:	83dfe06f          	j	ffffffffc0205a2c <stride_dequeue+0xa38>
ffffffffc02071f4:	01453023          	sd	s4,0(a0)
ffffffffc02071f8:	835fe06f          	j	ffffffffc0205a2c <stride_dequeue+0xa38>
ffffffffc02071fc:	010cb503          	ld	a0,16(s9)
ffffffffc0207200:	008cbb03          	ld	s6,8(s9)
ffffffffc0207204:	85f2                	mv	a1,t3
ffffffffc0207206:	f442                	sd	a6,40(sp)
ffffffffc0207208:	c0dfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020720c:	00acb423          	sd	a0,8(s9)
ffffffffc0207210:	016cb823          	sd	s6,16(s9)
ffffffffc0207214:	7822                	ld	a6,40(sp)
ffffffffc0207216:	010c2b03          	lw	s6,16(s8)
ffffffffc020721a:	e119                	bnez	a0,ffffffffc0207220 <stride_dequeue+0x222c>
ffffffffc020721c:	b2cfe06f          	j	ffffffffc0205548 <stride_dequeue+0x554>
ffffffffc0207220:	01953023          	sd	s9,0(a0)
ffffffffc0207224:	b24fe06f          	j	ffffffffc0205548 <stride_dequeue+0x554>
ffffffffc0207228:	010a3503          	ld	a0,16(s4)
ffffffffc020722c:	008a3b03          	ld	s6,8(s4)
ffffffffc0207230:	85f2                	mv	a1,t3
ffffffffc0207232:	f442                	sd	a6,40(sp)
ffffffffc0207234:	be1fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207238:	00aa3423          	sd	a0,8(s4)
ffffffffc020723c:	016a3823          	sd	s6,16(s4)
ffffffffc0207240:	7822                	ld	a6,40(sp)
ffffffffc0207242:	010c2b03          	lw	s6,16(s8)
ffffffffc0207246:	e119                	bnez	a0,ffffffffc020724c <stride_dequeue+0x2258>
ffffffffc0207248:	d1afe06f          	j	ffffffffc0205762 <stride_dequeue+0x76e>
ffffffffc020724c:	01453023          	sd	s4,0(a0)
ffffffffc0207250:	d12fe06f          	j	ffffffffc0205762 <stride_dequeue+0x76e>
ffffffffc0207254:	0108b503          	ld	a0,16(a7)
ffffffffc0207258:	85f2                	mv	a1,t3
ffffffffc020725a:	0088bb03          	ld	s6,8(a7)
ffffffffc020725e:	f046                	sd	a7,32(sp)
ffffffffc0207260:	bb5fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207264:	7882                	ld	a7,32(sp)
ffffffffc0207266:	7622                	ld	a2,40(sp)
ffffffffc0207268:	0168b823          	sd	s6,16(a7)
ffffffffc020726c:	00a8b423          	sd	a0,8(a7)
ffffffffc0207270:	010c2b03          	lw	s6,16(s8)
ffffffffc0207274:	e119                	bnez	a0,ffffffffc020727a <stride_dequeue+0x2286>
ffffffffc0207276:	963fe06f          	j	ffffffffc0205bd8 <stride_dequeue+0xbe4>
ffffffffc020727a:	01153023          	sd	a7,0(a0)
ffffffffc020727e:	95bfe06f          	j	ffffffffc0205bd8 <stride_dequeue+0xbe4>
ffffffffc0207282:	0108b503          	ld	a0,16(a7)
ffffffffc0207286:	85f2                	mv	a1,t3
ffffffffc0207288:	0088bb03          	ld	s6,8(a7)
ffffffffc020728c:	f446                	sd	a7,40(sp)
ffffffffc020728e:	b87fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207292:	78a2                	ld	a7,40(sp)
ffffffffc0207294:	0168b823          	sd	s6,16(a7)
ffffffffc0207298:	00a8b423          	sd	a0,8(a7)
ffffffffc020729c:	010c2b03          	lw	s6,16(s8)
ffffffffc02072a0:	e119                	bnez	a0,ffffffffc02072a6 <stride_dequeue+0x22b2>
ffffffffc02072a2:	a05fe06f          	j	ffffffffc0205ca6 <stride_dequeue+0xcb2>
ffffffffc02072a6:	01153023          	sd	a7,0(a0)
ffffffffc02072aa:	9fdfe06f          	j	ffffffffc0205ca6 <stride_dequeue+0xcb2>
ffffffffc02072ae:	0109b503          	ld	a0,16(s3)
ffffffffc02072b2:	0089bb03          	ld	s6,8(s3)
ffffffffc02072b6:	85c2                	mv	a1,a6
ffffffffc02072b8:	f446                	sd	a7,40(sp)
ffffffffc02072ba:	b5bfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02072be:	00a9b423          	sd	a0,8(s3)
ffffffffc02072c2:	0169b823          	sd	s6,16(s3)
ffffffffc02072c6:	78a2                	ld	a7,40(sp)
ffffffffc02072c8:	010c2b03          	lw	s6,16(s8)
ffffffffc02072cc:	66050563          	beqz	a0,ffffffffc0207936 <stride_dequeue+0x2942>
ffffffffc02072d0:	01353023          	sd	s3,0(a0)
ffffffffc02072d4:	884e                	mv	a6,s3
ffffffffc02072d6:	d6aff06f          	j	ffffffffc0206840 <stride_dequeue+0x184c>
ffffffffc02072da:	0109b503          	ld	a0,16(s3)
ffffffffc02072de:	0089bb03          	ld	s6,8(s3)
ffffffffc02072e2:	85f2                	mv	a1,t3
ffffffffc02072e4:	f442                	sd	a6,40(sp)
ffffffffc02072e6:	b2ffd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02072ea:	00a9b423          	sd	a0,8(s3)
ffffffffc02072ee:	0169b823          	sd	s6,16(s3)
ffffffffc02072f2:	7822                	ld	a6,40(sp)
ffffffffc02072f4:	010c2b03          	lw	s6,16(s8)
ffffffffc02072f8:	e119                	bnez	a0,ffffffffc02072fe <stride_dequeue+0x230a>
ffffffffc02072fa:	e05fe06f          	j	ffffffffc02060fe <stride_dequeue+0x110a>
ffffffffc02072fe:	01353023          	sd	s3,0(a0)
ffffffffc0207302:	dfdfe06f          	j	ffffffffc02060fe <stride_dequeue+0x110a>
ffffffffc0207306:	0109b503          	ld	a0,16(s3)
ffffffffc020730a:	0089bb03          	ld	s6,8(s3)
ffffffffc020730e:	859a                	mv	a1,t1
ffffffffc0207310:	f442                	sd	a6,40(sp)
ffffffffc0207312:	b03fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207316:	00a9b423          	sd	a0,8(s3)
ffffffffc020731a:	0169b823          	sd	s6,16(s3)
ffffffffc020731e:	7822                	ld	a6,40(sp)
ffffffffc0207320:	010c2b03          	lw	s6,16(s8)
ffffffffc0207324:	64050163          	beqz	a0,ffffffffc0207966 <stride_dequeue+0x2972>
ffffffffc0207328:	01353023          	sd	s3,0(a0)
ffffffffc020732c:	834e                	mv	t1,s3
ffffffffc020732e:	d76ff06f          	j	ffffffffc02068a4 <stride_dequeue+0x18b0>
ffffffffc0207332:	0109b503          	ld	a0,16(s3)
ffffffffc0207336:	0089bb03          	ld	s6,8(s3)
ffffffffc020733a:	85f2                	mv	a1,t3
ffffffffc020733c:	f446                	sd	a7,40(sp)
ffffffffc020733e:	ad7fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207342:	00a9b423          	sd	a0,8(s3)
ffffffffc0207346:	0169b823          	sd	s6,16(s3)
ffffffffc020734a:	78a2                	ld	a7,40(sp)
ffffffffc020734c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207350:	e119                	bnez	a0,ffffffffc0207356 <stride_dequeue+0x2362>
ffffffffc0207352:	d0ffe06f          	j	ffffffffc0206060 <stride_dequeue+0x106c>
ffffffffc0207356:	01353023          	sd	s3,0(a0)
ffffffffc020735a:	d07fe06f          	j	ffffffffc0206060 <stride_dequeue+0x106c>
ffffffffc020735e:	0109b503          	ld	a0,16(s3)
ffffffffc0207362:	0089bb03          	ld	s6,8(s3)
ffffffffc0207366:	859a                	mv	a1,t1
ffffffffc0207368:	aadfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020736c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207370:	0169b823          	sd	s6,16(s3)
ffffffffc0207374:	010c2b03          	lw	s6,16(s8)
ffffffffc0207378:	e119                	bnez	a0,ffffffffc020737e <stride_dequeue+0x238a>
ffffffffc020737a:	c49fe06f          	j	ffffffffc0205fc2 <stride_dequeue+0xfce>
ffffffffc020737e:	01353023          	sd	s3,0(a0)
ffffffffc0207382:	c41fe06f          	j	ffffffffc0205fc2 <stride_dequeue+0xfce>
ffffffffc0207386:	0109b503          	ld	a0,16(s3)
ffffffffc020738a:	0089bb03          	ld	s6,8(s3)
ffffffffc020738e:	859a                	mv	a1,t1
ffffffffc0207390:	ec32                	sd	a2,24(sp)
ffffffffc0207392:	a83fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207396:	00a9b423          	sd	a0,8(s3)
ffffffffc020739a:	0169b823          	sd	s6,16(s3)
ffffffffc020739e:	6662                	ld	a2,24(sp)
ffffffffc02073a0:	010c2b03          	lw	s6,16(s8)
ffffffffc02073a4:	e119                	bnez	a0,ffffffffc02073aa <stride_dequeue+0x23b6>
ffffffffc02073a6:	b4ffe06f          	j	ffffffffc0205ef4 <stride_dequeue+0xf00>
ffffffffc02073aa:	01353023          	sd	s3,0(a0)
ffffffffc02073ae:	b47fe06f          	j	ffffffffc0205ef4 <stride_dequeue+0xf00>
ffffffffc02073b2:	0108b503          	ld	a0,16(a7)
ffffffffc02073b6:	85f2                	mv	a1,t3
ffffffffc02073b8:	0088bb03          	ld	s6,8(a7)
ffffffffc02073bc:	f446                	sd	a7,40(sp)
ffffffffc02073be:	a57fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02073c2:	78a2                	ld	a7,40(sp)
ffffffffc02073c4:	0168b823          	sd	s6,16(a7)
ffffffffc02073c8:	00a8b423          	sd	a0,8(a7)
ffffffffc02073cc:	010c2b03          	lw	s6,16(s8)
ffffffffc02073d0:	e119                	bnez	a0,ffffffffc02073d6 <stride_dequeue+0x23e2>
ffffffffc02073d2:	f28fe06f          	j	ffffffffc0205afa <stride_dequeue+0xb06>
ffffffffc02073d6:	01153023          	sd	a7,0(a0)
ffffffffc02073da:	f20fe06f          	j	ffffffffc0205afa <stride_dequeue+0xb06>
ffffffffc02073de:	0109b503          	ld	a0,16(s3)
ffffffffc02073e2:	0089bb03          	ld	s6,8(s3)
ffffffffc02073e6:	85d2                	mv	a1,s4
ffffffffc02073e8:	f046                	sd	a7,32(sp)
ffffffffc02073ea:	a2bfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02073ee:	00a9b423          	sd	a0,8(s3)
ffffffffc02073f2:	0169b823          	sd	s6,16(s3)
ffffffffc02073f6:	7882                	ld	a7,32(sp)
ffffffffc02073f8:	010c2b03          	lw	s6,16(s8)
ffffffffc02073fc:	e119                	bnez	a0,ffffffffc0207402 <stride_dequeue+0x240e>
ffffffffc02073fe:	fe1fe06f          	j	ffffffffc02063de <stride_dequeue+0x13ea>
ffffffffc0207402:	01353023          	sd	s3,0(a0)
ffffffffc0207406:	fd9fe06f          	j	ffffffffc02063de <stride_dequeue+0x13ea>
ffffffffc020740a:	0109b503          	ld	a0,16(s3)
ffffffffc020740e:	0089bb03          	ld	s6,8(s3)
ffffffffc0207412:	85c2                	mv	a1,a6
ffffffffc0207414:	a01fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207418:	00a9b423          	sd	a0,8(s3)
ffffffffc020741c:	0169b823          	sd	s6,16(s3)
ffffffffc0207420:	010c2b03          	lw	s6,16(s8)
ffffffffc0207424:	ae050863          	beqz	a0,ffffffffc0206714 <stride_dequeue+0x1720>
ffffffffc0207428:	01353023          	sd	s3,0(a0)
ffffffffc020742c:	ae8ff06f          	j	ffffffffc0206714 <stride_dequeue+0x1720>
ffffffffc0207430:	89d2                	mv	s3,s4
ffffffffc0207432:	fadfe06f          	j	ffffffffc02063de <stride_dequeue+0x13ea>
ffffffffc0207436:	89ee                	mv	s3,s11
ffffffffc0207438:	84aff06f          	j	ffffffffc0206482 <stride_dequeue+0x148e>
ffffffffc020743c:	89c2                	mv	s3,a6
ffffffffc020743e:	992ff06f          	j	ffffffffc02065d0 <stride_dequeue+0x15dc>
ffffffffc0207442:	89c2                	mv	s3,a6
ffffffffc0207444:	a34ff06f          	j	ffffffffc0206678 <stride_dequeue+0x1684>
ffffffffc0207448:	89b2                	mv	s3,a2
ffffffffc020744a:	8e2ff06f          	j	ffffffffc020652c <stride_dequeue+0x1538>
ffffffffc020744e:	89c2                	mv	s3,a6
ffffffffc0207450:	ac4ff06f          	j	ffffffffc0206714 <stride_dequeue+0x1720>
ffffffffc0207454:	01083503          	ld	a0,16(a6)
ffffffffc0207458:	85e6                	mv	a1,s9
ffffffffc020745a:	00883b03          	ld	s6,8(a6)
ffffffffc020745e:	9b7fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207462:	7802                	ld	a6,32(sp)
ffffffffc0207464:	01683823          	sd	s6,16(a6)
ffffffffc0207468:	00a83423          	sd	a0,8(a6)
ffffffffc020746c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207470:	50050163          	beqz	a0,ffffffffc0207972 <stride_dequeue+0x297e>
ffffffffc0207474:	01053023          	sd	a6,0(a0)
ffffffffc0207478:	8cc2                	mv	s9,a6
ffffffffc020747a:	d62ff06f          	j	ffffffffc02069dc <stride_dequeue+0x19e8>
ffffffffc020747e:	01083503          	ld	a0,16(a6)
ffffffffc0207482:	85d2                	mv	a1,s4
ffffffffc0207484:	00883b03          	ld	s6,8(a6)
ffffffffc0207488:	98dfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020748c:	6862                	ld	a6,24(sp)
ffffffffc020748e:	7602                	ld	a2,32(sp)
ffffffffc0207490:	01683823          	sd	s6,16(a6)
ffffffffc0207494:	00a83423          	sd	a0,8(a6)
ffffffffc0207498:	010c2b03          	lw	s6,16(s8)
ffffffffc020749c:	4c050863          	beqz	a0,ffffffffc020796c <stride_dequeue+0x2978>
ffffffffc02074a0:	01053023          	sd	a6,0(a0)
ffffffffc02074a4:	8a42                	mv	s4,a6
ffffffffc02074a6:	d94ff06f          	j	ffffffffc0206a3a <stride_dequeue+0x1a46>
ffffffffc02074aa:	89f2                	mv	s3,t3
ffffffffc02074ac:	bb5fe06f          	j	ffffffffc0206060 <stride_dequeue+0x106c>
ffffffffc02074b0:	88f2                	mv	a7,t3
ffffffffc02074b2:	e48fe06f          	j	ffffffffc0205afa <stride_dequeue+0xb06>
ffffffffc02074b6:	89f2                	mv	s3,t3
ffffffffc02074b8:	ce3fe06f          	j	ffffffffc020619a <stride_dequeue+0x11a6>
ffffffffc02074bc:	89f2                	mv	s3,t3
ffffffffc02074be:	c41fe06f          	j	ffffffffc02060fe <stride_dequeue+0x110a>
ffffffffc02074c2:	88f2                	mv	a7,t3
ffffffffc02074c4:	fe2fe06f          	j	ffffffffc0205ca6 <stride_dequeue+0xcb2>
ffffffffc02074c8:	87ce                	mv	a5,s3
ffffffffc02074ca:	ddffe06f          	j	ffffffffc02062a8 <stride_dequeue+0x12b4>
ffffffffc02074ce:	0108b503          	ld	a0,16(a7)
ffffffffc02074d2:	85ce                	mv	a1,s3
ffffffffc02074d4:	0088bb03          	ld	s6,8(a7)
ffffffffc02074d8:	93dfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02074dc:	7882                	ld	a7,32(sp)
ffffffffc02074de:	0168b823          	sd	s6,16(a7)
ffffffffc02074e2:	00a8b423          	sd	a0,8(a7)
ffffffffc02074e6:	010c2b03          	lw	s6,16(s8)
ffffffffc02074ea:	42050a63          	beqz	a0,ffffffffc020791e <stride_dequeue+0x292a>
ffffffffc02074ee:	01153023          	sd	a7,0(a0)
ffffffffc02074f2:	89c6                	mv	s3,a7
ffffffffc02074f4:	d9cff06f          	j	ffffffffc0206a90 <stride_dequeue+0x1a9c>
ffffffffc02074f8:	8cf2                	mv	s9,t3
ffffffffc02074fa:	84efe06f          	j	ffffffffc0205548 <stride_dequeue+0x554>
ffffffffc02074fe:	8a72                	mv	s4,t3
ffffffffc0207500:	a62fe06f          	j	ffffffffc0205762 <stride_dequeue+0x76e>
ffffffffc0207504:	88f2                	mv	a7,t3
ffffffffc0207506:	ed2fe06f          	j	ffffffffc0205bd8 <stride_dequeue+0xbe4>
ffffffffc020750a:	89f2                	mv	s3,t3
ffffffffc020750c:	d33fe06f          	j	ffffffffc020623e <stride_dequeue+0x124a>
ffffffffc0207510:	0109b503          	ld	a0,16(s3)
ffffffffc0207514:	0089bb03          	ld	s6,8(s3)
ffffffffc0207518:	85c6                	mv	a1,a7
ffffffffc020751a:	8fbfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020751e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207522:	0169b823          	sd	s6,16(s3)
ffffffffc0207526:	010c2b03          	lw	s6,16(s8)
ffffffffc020752a:	e119                	bnez	a0,ffffffffc0207530 <stride_dequeue+0x253c>
ffffffffc020752c:	dfdfe06f          	j	ffffffffc0206328 <stride_dequeue+0x1334>
ffffffffc0207530:	01353023          	sd	s3,0(a0)
ffffffffc0207534:	df5fe06f          	j	ffffffffc0206328 <stride_dequeue+0x1334>
ffffffffc0207538:	01083503          	ld	a0,16(a6)
ffffffffc020753c:	85d2                	mv	a1,s4
ffffffffc020753e:	00883b03          	ld	s6,8(a6)
ffffffffc0207542:	8d3fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207546:	7802                	ld	a6,32(sp)
ffffffffc0207548:	01683823          	sd	s6,16(a6)
ffffffffc020754c:	00a83423          	sd	a0,8(a6)
ffffffffc0207550:	010c2b03          	lw	s6,16(s8)
ffffffffc0207554:	3a050363          	beqz	a0,ffffffffc02078fa <stride_dequeue+0x2906>
ffffffffc0207558:	01053023          	sd	a6,0(a0)
ffffffffc020755c:	8a42                	mv	s4,a6
ffffffffc020755e:	c28ff06f          	j	ffffffffc0206986 <stride_dequeue+0x1992>
ffffffffc0207562:	8672                	mv	a2,t3
ffffffffc0207564:	900fe06f          	j	ffffffffc0205664 <stride_dequeue+0x670>
ffffffffc0207568:	0108b503          	ld	a0,16(a7)
ffffffffc020756c:	85ce                	mv	a1,s3
ffffffffc020756e:	0088bb03          	ld	s6,8(a7)
ffffffffc0207572:	8a3fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207576:	7882                	ld	a7,32(sp)
ffffffffc0207578:	7622                	ld	a2,40(sp)
ffffffffc020757a:	7842                	ld	a6,48(sp)
ffffffffc020757c:	0168b823          	sd	s6,16(a7)
ffffffffc0207580:	00a8b423          	sd	a0,8(a7)
ffffffffc0207584:	010c2b03          	lw	s6,16(s8)
ffffffffc0207588:	3c050c63          	beqz	a0,ffffffffc0207960 <stride_dequeue+0x296c>
ffffffffc020758c:	01153023          	sd	a7,0(a0)
ffffffffc0207590:	89c6                	mv	s3,a7
ffffffffc0207592:	dc0ff06f          	j	ffffffffc0206b52 <stride_dequeue+0x1b5e>
ffffffffc0207596:	0109b503          	ld	a0,16(s3)
ffffffffc020759a:	0089bb03          	ld	s6,8(s3)
ffffffffc020759e:	85f2                	mv	a1,t3
ffffffffc02075a0:	f41a                	sd	t1,40(sp)
ffffffffc02075a2:	873fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02075a6:	00a9b423          	sd	a0,8(s3)
ffffffffc02075aa:	0169b823          	sd	s6,16(s3)
ffffffffc02075ae:	7322                	ld	t1,40(sp)
ffffffffc02075b0:	010c2b03          	lw	s6,16(s8)
ffffffffc02075b4:	e119                	bnez	a0,ffffffffc02075ba <stride_dequeue+0x25c6>
ffffffffc02075b6:	9fdfe06f          	j	ffffffffc0205fb2 <stride_dequeue+0xfbe>
ffffffffc02075ba:	01353023          	sd	s3,0(a0)
ffffffffc02075be:	9f5fe06f          	j	ffffffffc0205fb2 <stride_dequeue+0xfbe>
ffffffffc02075c2:	01033503          	ld	a0,16(t1)
ffffffffc02075c6:	85e6                	mv	a1,s9
ffffffffc02075c8:	00833b03          	ld	s6,8(t1)
ffffffffc02075cc:	849fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02075d0:	7322                	ld	t1,40(sp)
ffffffffc02075d2:	78c2                	ld	a7,48(sp)
ffffffffc02075d4:	01633823          	sd	s6,16(t1)
ffffffffc02075d8:	00a33423          	sd	a0,8(t1)
ffffffffc02075dc:	010c2b03          	lw	s6,16(s8)
ffffffffc02075e0:	34050e63          	beqz	a0,ffffffffc020793c <stride_dequeue+0x2948>
ffffffffc02075e4:	00653023          	sd	t1,0(a0)
ffffffffc02075e8:	8c9a                	mv	s9,t1
ffffffffc02075ea:	eeaff06f          	j	ffffffffc0206cd4 <stride_dequeue+0x1ce0>
ffffffffc02075ee:	01033503          	ld	a0,16(t1)
ffffffffc02075f2:	85c2                	mv	a1,a6
ffffffffc02075f4:	00833b03          	ld	s6,8(t1)
ffffffffc02075f8:	81dfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02075fc:	7322                	ld	t1,40(sp)
ffffffffc02075fe:	01633823          	sd	s6,16(t1)
ffffffffc0207602:	00a33423          	sd	a0,8(t1)
ffffffffc0207606:	010c2b03          	lw	s6,16(s8)
ffffffffc020760a:	32050c63          	beqz	a0,ffffffffc0207942 <stride_dequeue+0x294e>
ffffffffc020760e:	00653023          	sd	t1,0(a0)
ffffffffc0207612:	881a                	mv	a6,t1
ffffffffc0207614:	f24ff06f          	j	ffffffffc0206d38 <stride_dequeue+0x1d44>
ffffffffc0207618:	0108b503          	ld	a0,16(a7)
ffffffffc020761c:	85ce                	mv	a1,s3
ffffffffc020761e:	0088bb03          	ld	s6,8(a7)
ffffffffc0207622:	ff2fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207626:	78a2                	ld	a7,40(sp)
ffffffffc0207628:	7842                	ld	a6,48(sp)
ffffffffc020762a:	0168b823          	sd	s6,16(a7)
ffffffffc020762e:	00a8b423          	sd	a0,8(a7)
ffffffffc0207632:	010c2b03          	lw	s6,16(s8)
ffffffffc0207636:	30050963          	beqz	a0,ffffffffc0207948 <stride_dequeue+0x2954>
ffffffffc020763a:	01153023          	sd	a7,0(a0)
ffffffffc020763e:	89c6                	mv	s3,a7
ffffffffc0207640:	caeff06f          	j	ffffffffc0206aee <stride_dequeue+0x1afa>
ffffffffc0207644:	01083503          	ld	a0,16(a6)
ffffffffc0207648:	85ce                	mv	a1,s3
ffffffffc020764a:	00883b03          	ld	s6,8(a6)
ffffffffc020764e:	fc6fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207652:	7822                	ld	a6,40(sp)
ffffffffc0207654:	78c2                	ld	a7,48(sp)
ffffffffc0207656:	01683823          	sd	s6,16(a6)
ffffffffc020765a:	00a83423          	sd	a0,8(a6)
ffffffffc020765e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207662:	30050b63          	beqz	a0,ffffffffc0207978 <stride_dequeue+0x2984>
ffffffffc0207666:	01053023          	sd	a6,0(a0)
ffffffffc020766a:	89c2                	mv	s3,a6
ffffffffc020766c:	da6ff06f          	j	ffffffffc0206c12 <stride_dequeue+0x1c1e>
ffffffffc0207670:	01083503          	ld	a0,16(a6)
ffffffffc0207674:	85ce                	mv	a1,s3
ffffffffc0207676:	00883b03          	ld	s6,8(a6)
ffffffffc020767a:	f9afd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020767e:	7802                	ld	a6,32(sp)
ffffffffc0207680:	7622                	ld	a2,40(sp)
ffffffffc0207682:	78c2                	ld	a7,48(sp)
ffffffffc0207684:	01683823          	sd	s6,16(a6)
ffffffffc0207688:	00a83423          	sd	a0,8(a6)
ffffffffc020768c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207690:	2a050063          	beqz	a0,ffffffffc0207930 <stride_dequeue+0x293c>
ffffffffc0207694:	01053023          	sd	a6,0(a0)
ffffffffc0207698:	89c2                	mv	s3,a6
ffffffffc020769a:	ddcff06f          	j	ffffffffc0206c76 <stride_dequeue+0x1c82>
ffffffffc020769e:	0109b503          	ld	a0,16(s3)
ffffffffc02076a2:	0089bb03          	ld	s6,8(s3)
ffffffffc02076a6:	85f2                	mv	a1,t3
ffffffffc02076a8:	f41a                	sd	t1,40(sp)
ffffffffc02076aa:	f6afd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02076ae:	00a9b423          	sd	a0,8(s3)
ffffffffc02076b2:	0169b823          	sd	s6,16(s3)
ffffffffc02076b6:	7322                	ld	t1,40(sp)
ffffffffc02076b8:	010c2b03          	lw	s6,16(s8)
ffffffffc02076bc:	e119                	bnez	a0,ffffffffc02076c2 <stride_dequeue+0x26ce>
ffffffffc02076be:	f4afe06f          	j	ffffffffc0205e08 <stride_dequeue+0xe14>
ffffffffc02076c2:	01353023          	sd	s3,0(a0)
ffffffffc02076c6:	f42fe06f          	j	ffffffffc0205e08 <stride_dequeue+0xe14>
ffffffffc02076ca:	0109b503          	ld	a0,16(s3)
ffffffffc02076ce:	0089bb03          	ld	s6,8(s3)
ffffffffc02076d2:	85f2                	mv	a1,t3
ffffffffc02076d4:	f446                	sd	a7,40(sp)
ffffffffc02076d6:	f3efd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02076da:	00a9b423          	sd	a0,8(s3)
ffffffffc02076de:	0169b823          	sd	s6,16(s3)
ffffffffc02076e2:	78a2                	ld	a7,40(sp)
ffffffffc02076e4:	010c2b03          	lw	s6,16(s8)
ffffffffc02076e8:	e119                	bnez	a0,ffffffffc02076ee <stride_dequeue+0x26fa>
ffffffffc02076ea:	ce5fe06f          	j	ffffffffc02063ce <stride_dequeue+0x13da>
ffffffffc02076ee:	01353023          	sd	s3,0(a0)
ffffffffc02076f2:	cddfe06f          	j	ffffffffc02063ce <stride_dequeue+0x13da>
ffffffffc02076f6:	0109b503          	ld	a0,16(s3)
ffffffffc02076fa:	0089bb03          	ld	s6,8(s3)
ffffffffc02076fe:	85f2                	mv	a1,t3
ffffffffc0207700:	f446                	sd	a7,40(sp)
ffffffffc0207702:	f032                	sd	a2,32(sp)
ffffffffc0207704:	f10fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207708:	00a9b423          	sd	a0,8(s3)
ffffffffc020770c:	0169b823          	sd	s6,16(s3)
ffffffffc0207710:	7602                	ld	a2,32(sp)
ffffffffc0207712:	78a2                	ld	a7,40(sp)
ffffffffc0207714:	010c2b03          	lw	s6,16(s8)
ffffffffc0207718:	e119                	bnez	a0,ffffffffc020771e <stride_dequeue+0x272a>
ffffffffc020771a:	e05fe06f          	j	ffffffffc020651e <stride_dequeue+0x152a>
ffffffffc020771e:	01353023          	sd	s3,0(a0)
ffffffffc0207722:	dfdfe06f          	j	ffffffffc020651e <stride_dequeue+0x152a>
ffffffffc0207726:	010a3503          	ld	a0,16(s4)
ffffffffc020772a:	008a3b03          	ld	s6,8(s4)
ffffffffc020772e:	85f2                	mv	a1,t3
ffffffffc0207730:	f41a                	sd	t1,40(sp)
ffffffffc0207732:	ee2fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207736:	00aa3423          	sd	a0,8(s4)
ffffffffc020773a:	016a3823          	sd	s6,16(s4)
ffffffffc020773e:	7322                	ld	t1,40(sp)
ffffffffc0207740:	010c2b03          	lw	s6,16(s8)
ffffffffc0207744:	e119                	bnez	a0,ffffffffc020774a <stride_dequeue+0x2756>
ffffffffc0207746:	ad6fe06f          	j	ffffffffc0205a1c <stride_dequeue+0xa28>
ffffffffc020774a:	01453023          	sd	s4,0(a0)
ffffffffc020774e:	acefe06f          	j	ffffffffc0205a1c <stride_dequeue+0xa28>
ffffffffc0207752:	0109b503          	ld	a0,16(s3)
ffffffffc0207756:	0089bb03          	ld	s6,8(s3)
ffffffffc020775a:	85f2                	mv	a1,t3
ffffffffc020775c:	f446                	sd	a7,40(sp)
ffffffffc020775e:	eb6fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207762:	00a9b423          	sd	a0,8(s3)
ffffffffc0207766:	0169b823          	sd	s6,16(s3)
ffffffffc020776a:	78a2                	ld	a7,40(sp)
ffffffffc020776c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207770:	e119                	bnez	a0,ffffffffc0207776 <stride_dequeue+0x2782>
ffffffffc0207772:	d01fe06f          	j	ffffffffc0206472 <stride_dequeue+0x147e>
ffffffffc0207776:	01353023          	sd	s3,0(a0)
ffffffffc020777a:	cf9fe06f          	j	ffffffffc0206472 <stride_dequeue+0x147e>
ffffffffc020777e:	01033503          	ld	a0,16(t1)
ffffffffc0207782:	85c2                	mv	a1,a6
ffffffffc0207784:	00833b03          	ld	s6,8(t1)
ffffffffc0207788:	e8cfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020778c:	7322                	ld	t1,40(sp)
ffffffffc020778e:	01633823          	sd	s6,16(t1)
ffffffffc0207792:	00a33423          	sd	a0,8(t1)
ffffffffc0207796:	010c2b03          	lw	s6,16(s8)
ffffffffc020779a:	1e050b63          	beqz	a0,ffffffffc0207990 <stride_dequeue+0x299c>
ffffffffc020779e:	00653023          	sd	t1,0(a0)
ffffffffc02077a2:	881a                	mv	a6,t1
ffffffffc02077a4:	e50ff06f          	j	ffffffffc0206df4 <stride_dequeue+0x1e00>
ffffffffc02077a8:	0109b503          	ld	a0,16(s3)
ffffffffc02077ac:	0089bb03          	ld	s6,8(s3)
ffffffffc02077b0:	85f2                	mv	a1,t3
ffffffffc02077b2:	f442                	sd	a6,40(sp)
ffffffffc02077b4:	f032                	sd	a2,32(sp)
ffffffffc02077b6:	e5efd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02077ba:	00a9b423          	sd	a0,8(s3)
ffffffffc02077be:	0169b823          	sd	s6,16(s3)
ffffffffc02077c2:	7602                	ld	a2,32(sp)
ffffffffc02077c4:	7822                	ld	a6,40(sp)
ffffffffc02077c6:	010c2b03          	lw	s6,16(s8)
ffffffffc02077ca:	e119                	bnez	a0,ffffffffc02077d0 <stride_dequeue+0x27dc>
ffffffffc02077cc:	e9dfe06f          	j	ffffffffc0206668 <stride_dequeue+0x1674>
ffffffffc02077d0:	01353023          	sd	s3,0(a0)
ffffffffc02077d4:	e95fe06f          	j	ffffffffc0206668 <stride_dequeue+0x1674>
ffffffffc02077d8:	0108b503          	ld	a0,16(a7)
ffffffffc02077dc:	85ce                	mv	a1,s3
ffffffffc02077de:	0088bb03          	ld	s6,8(a7)
ffffffffc02077e2:	e32fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02077e6:	78a2                	ld	a7,40(sp)
ffffffffc02077e8:	7842                	ld	a6,48(sp)
ffffffffc02077ea:	0168b823          	sd	s6,16(a7)
ffffffffc02077ee:	00a8b423          	sd	a0,8(a7)
ffffffffc02077f2:	010c2b03          	lw	s6,16(s8)
ffffffffc02077f6:	0e050f63          	beqz	a0,ffffffffc02078f4 <stride_dequeue+0x2900>
ffffffffc02077fa:	01153023          	sd	a7,0(a0)
ffffffffc02077fe:	89c6                	mv	s3,a7
ffffffffc0207800:	d96ff06f          	j	ffffffffc0206d96 <stride_dequeue+0x1da2>
ffffffffc0207804:	01083503          	ld	a0,16(a6)
ffffffffc0207808:	85ce                	mv	a1,s3
ffffffffc020780a:	00883b03          	ld	s6,8(a6)
ffffffffc020780e:	e06fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207812:	7822                	ld	a6,40(sp)
ffffffffc0207814:	78c2                	ld	a7,48(sp)
ffffffffc0207816:	01683823          	sd	s6,16(a6)
ffffffffc020781a:	00a83423          	sd	a0,8(a6)
ffffffffc020781e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207822:	0e050b63          	beqz	a0,ffffffffc0207918 <stride_dequeue+0x2924>
ffffffffc0207826:	01053023          	sd	a6,0(a0)
ffffffffc020782a:	89c2                	mv	s3,a6
ffffffffc020782c:	b88ff06f          	j	ffffffffc0206bb4 <stride_dequeue+0x1bc0>
ffffffffc0207830:	0109b503          	ld	a0,16(s3)
ffffffffc0207834:	0089bb03          	ld	s6,8(s3)
ffffffffc0207838:	85f2                	mv	a1,t3
ffffffffc020783a:	f442                	sd	a6,40(sp)
ffffffffc020783c:	dd8fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc0207840:	00a9b423          	sd	a0,8(s3)
ffffffffc0207844:	0169b823          	sd	s6,16(s3)
ffffffffc0207848:	7822                	ld	a6,40(sp)
ffffffffc020784a:	010c2b03          	lw	s6,16(s8)
ffffffffc020784e:	e119                	bnez	a0,ffffffffc0207854 <stride_dequeue+0x2860>
ffffffffc0207850:	d71fe06f          	j	ffffffffc02065c0 <stride_dequeue+0x15cc>
ffffffffc0207854:	01353023          	sd	s3,0(a0)
ffffffffc0207858:	d69fe06f          	j	ffffffffc02065c0 <stride_dequeue+0x15cc>
ffffffffc020785c:	0109b503          	ld	a0,16(s3)
ffffffffc0207860:	0089bb03          	ld	s6,8(s3)
ffffffffc0207864:	85f2                	mv	a1,t3
ffffffffc0207866:	f442                	sd	a6,40(sp)
ffffffffc0207868:	dacfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc020786c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207870:	0169b823          	sd	s6,16(s3)
ffffffffc0207874:	7822                	ld	a6,40(sp)
ffffffffc0207876:	010c2b03          	lw	s6,16(s8)
ffffffffc020787a:	e119                	bnez	a0,ffffffffc0207880 <stride_dequeue+0x288c>
ffffffffc020787c:	e89fe06f          	j	ffffffffc0206704 <stride_dequeue+0x1710>
ffffffffc0207880:	01353023          	sd	s3,0(a0)
ffffffffc0207884:	e81fe06f          	j	ffffffffc0206704 <stride_dequeue+0x1710>
ffffffffc0207888:	89c6                	mv	s3,a7
ffffffffc020788a:	a9ffe06f          	j	ffffffffc0206328 <stride_dequeue+0x1334>
ffffffffc020788e:	0109b503          	ld	a0,16(s3)
ffffffffc0207892:	0089bb03          	ld	s6,8(s3)
ffffffffc0207896:	85f2                	mv	a1,t3
ffffffffc0207898:	f41a                	sd	t1,40(sp)
ffffffffc020789a:	f032                	sd	a2,32(sp)
ffffffffc020789c:	d78fd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02078a0:	00a9b423          	sd	a0,8(s3)
ffffffffc02078a4:	0169b823          	sd	s6,16(s3)
ffffffffc02078a8:	7602                	ld	a2,32(sp)
ffffffffc02078aa:	7322                	ld	t1,40(sp)
ffffffffc02078ac:	010c2b03          	lw	s6,16(s8)
ffffffffc02078b0:	e119                	bnez	a0,ffffffffc02078b6 <stride_dequeue+0x28c2>
ffffffffc02078b2:	e32fe06f          	j	ffffffffc0205ee4 <stride_dequeue+0xef0>
ffffffffc02078b6:	01353023          	sd	s3,0(a0)
ffffffffc02078ba:	e2afe06f          	j	ffffffffc0205ee4 <stride_dequeue+0xef0>
ffffffffc02078be:	01033503          	ld	a0,16(t1)
ffffffffc02078c2:	85c2                	mv	a1,a6
ffffffffc02078c4:	00833b03          	ld	s6,8(t1)
ffffffffc02078c8:	d4cfd0ef          	jal	ra,ffffffffc0204e14 <skew_heap_merge.constprop.0>
ffffffffc02078cc:	7302                	ld	t1,32(sp)
ffffffffc02078ce:	7622                	ld	a2,40(sp)
ffffffffc02078d0:	01633823          	sd	s6,16(t1)
ffffffffc02078d4:	00a33423          	sd	a0,8(t1)
ffffffffc02078d8:	010c2b03          	lw	s6,16(s8)
ffffffffc02078dc:	c115                	beqz	a0,ffffffffc0207900 <stride_dequeue+0x290c>
ffffffffc02078de:	00653023          	sd	t1,0(a0)
ffffffffc02078e2:	881a                	mv	a6,t1
ffffffffc02078e4:	d76ff06f          	j	ffffffffc0206e5a <stride_dequeue+0x1e66>
ffffffffc02078e8:	89f2                	mv	s3,t3
ffffffffc02078ea:	e1bfe06f          	j	ffffffffc0206704 <stride_dequeue+0x1710>
ffffffffc02078ee:	834e                	mv	t1,s3
ffffffffc02078f0:	ef1fe06f          	j	ffffffffc02067e0 <stride_dequeue+0x17ec>
ffffffffc02078f4:	89c6                	mv	s3,a7
ffffffffc02078f6:	ca0ff06f          	j	ffffffffc0206d96 <stride_dequeue+0x1da2>
ffffffffc02078fa:	8a42                	mv	s4,a6
ffffffffc02078fc:	88aff06f          	j	ffffffffc0206986 <stride_dequeue+0x1992>
ffffffffc0207900:	881a                	mv	a6,t1
ffffffffc0207902:	d58ff06f          	j	ffffffffc0206e5a <stride_dequeue+0x1e66>
ffffffffc0207906:	89f2                	mv	s3,t3
ffffffffc0207908:	ddcfe06f          	j	ffffffffc0205ee4 <stride_dequeue+0xef0>
ffffffffc020790c:	834e                	mv	t1,s3
ffffffffc020790e:	e69fe06f          	j	ffffffffc0206776 <stride_dequeue+0x1782>
ffffffffc0207912:	89f2                	mv	s3,t3
ffffffffc0207914:	cadfe06f          	j	ffffffffc02065c0 <stride_dequeue+0x15cc>
ffffffffc0207918:	89c2                	mv	s3,a6
ffffffffc020791a:	a9aff06f          	j	ffffffffc0206bb4 <stride_dequeue+0x1bc0>
ffffffffc020791e:	89c6                	mv	s3,a7
ffffffffc0207920:	970ff06f          	j	ffffffffc0206a90 <stride_dequeue+0x1a9c>
ffffffffc0207924:	834e                	mv	t1,s3
ffffffffc0207926:	fdffe06f          	j	ffffffffc0206904 <stride_dequeue+0x1910>
ffffffffc020792a:	89f2                	mv	s3,t3
ffffffffc020792c:	cdcfe06f          	j	ffffffffc0205e08 <stride_dequeue+0xe14>
ffffffffc0207930:	89c2                	mv	s3,a6
ffffffffc0207932:	b44ff06f          	j	ffffffffc0206c76 <stride_dequeue+0x1c82>
ffffffffc0207936:	884e                	mv	a6,s3
ffffffffc0207938:	f09fe06f          	j	ffffffffc0206840 <stride_dequeue+0x184c>
ffffffffc020793c:	8c9a                	mv	s9,t1
ffffffffc020793e:	b96ff06f          	j	ffffffffc0206cd4 <stride_dequeue+0x1ce0>
ffffffffc0207942:	881a                	mv	a6,t1
ffffffffc0207944:	bf4ff06f          	j	ffffffffc0206d38 <stride_dequeue+0x1d44>
ffffffffc0207948:	89c6                	mv	s3,a7
ffffffffc020794a:	9a4ff06f          	j	ffffffffc0206aee <stride_dequeue+0x1afa>
ffffffffc020794e:	89f2                	mv	s3,t3
ffffffffc0207950:	a7ffe06f          	j	ffffffffc02063ce <stride_dequeue+0x13da>
ffffffffc0207954:	89f2                	mv	s3,t3
ffffffffc0207956:	bc9fe06f          	j	ffffffffc020651e <stride_dequeue+0x152a>
ffffffffc020795a:	89f2                	mv	s3,t3
ffffffffc020795c:	e56fe06f          	j	ffffffffc0205fb2 <stride_dequeue+0xfbe>
ffffffffc0207960:	89c6                	mv	s3,a7
ffffffffc0207962:	9f0ff06f          	j	ffffffffc0206b52 <stride_dequeue+0x1b5e>
ffffffffc0207966:	834e                	mv	t1,s3
ffffffffc0207968:	f3dfe06f          	j	ffffffffc02068a4 <stride_dequeue+0x18b0>
ffffffffc020796c:	8a42                	mv	s4,a6
ffffffffc020796e:	8ccff06f          	j	ffffffffc0206a3a <stride_dequeue+0x1a46>
ffffffffc0207972:	8cc2                	mv	s9,a6
ffffffffc0207974:	868ff06f          	j	ffffffffc02069dc <stride_dequeue+0x19e8>
ffffffffc0207978:	89c2                	mv	s3,a6
ffffffffc020797a:	a98ff06f          	j	ffffffffc0206c12 <stride_dequeue+0x1c1e>
ffffffffc020797e:	8a72                	mv	s4,t3
ffffffffc0207980:	89cfe06f          	j	ffffffffc0205a1c <stride_dequeue+0xa28>
ffffffffc0207984:	89f2                	mv	s3,t3
ffffffffc0207986:	aedfe06f          	j	ffffffffc0206472 <stride_dequeue+0x147e>
ffffffffc020798a:	89f2                	mv	s3,t3
ffffffffc020798c:	cddfe06f          	j	ffffffffc0206668 <stride_dequeue+0x1674>
ffffffffc0207990:	881a                	mv	a6,t1
ffffffffc0207992:	c62ff06f          	j	ffffffffc0206df4 <stride_dequeue+0x1e00>

ffffffffc0207996 <sys_getpid>:
ffffffffc0207996:	00012797          	auipc	a5,0x12
ffffffffc020799a:	b627b783          	ld	a5,-1182(a5) # ffffffffc02194f8 <current>
ffffffffc020799e:	43c8                	lw	a0,4(a5)
ffffffffc02079a0:	8082                	ret

ffffffffc02079a2 <sys_pgdir>:
ffffffffc02079a2:	4501                	li	a0,0
ffffffffc02079a4:	8082                	ret

ffffffffc02079a6 <sys_gettime>:
ffffffffc02079a6:	00012797          	auipc	a5,0x12
ffffffffc02079aa:	b827b783          	ld	a5,-1150(a5) # ffffffffc0219528 <ticks>
ffffffffc02079ae:	0027951b          	slliw	a0,a5,0x2
ffffffffc02079b2:	9d3d                	addw	a0,a0,a5
ffffffffc02079b4:	0015151b          	slliw	a0,a0,0x1
ffffffffc02079b8:	8082                	ret

ffffffffc02079ba <sys_lab6_set_priority>:
ffffffffc02079ba:	4108                	lw	a0,0(a0)
ffffffffc02079bc:	1141                	addi	sp,sp,-16
ffffffffc02079be:	e406                	sd	ra,8(sp)
ffffffffc02079c0:	ee5fc0ef          	jal	ra,ffffffffc02048a4 <lab6_set_priority>
ffffffffc02079c4:	60a2                	ld	ra,8(sp)
ffffffffc02079c6:	4501                	li	a0,0
ffffffffc02079c8:	0141                	addi	sp,sp,16
ffffffffc02079ca:	8082                	ret

ffffffffc02079cc <sys_putc>:
ffffffffc02079cc:	4108                	lw	a0,0(a0)
ffffffffc02079ce:	1141                	addi	sp,sp,-16
ffffffffc02079d0:	e406                	sd	ra,8(sp)
ffffffffc02079d2:	f30f80ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc02079d6:	60a2                	ld	ra,8(sp)
ffffffffc02079d8:	4501                	li	a0,0
ffffffffc02079da:	0141                	addi	sp,sp,16
ffffffffc02079dc:	8082                	ret

ffffffffc02079de <sys_kill>:
ffffffffc02079de:	4108                	lw	a0,0(a0)
ffffffffc02079e0:	d2dfc06f          	j	ffffffffc020470c <do_kill>

ffffffffc02079e4 <sys_sleep>:
ffffffffc02079e4:	4108                	lw	a0,0(a0)
ffffffffc02079e6:	ef9fc06f          	j	ffffffffc02048de <do_sleep>

ffffffffc02079ea <sys_yield>:
ffffffffc02079ea:	cd5fc06f          	j	ffffffffc02046be <do_yield>

ffffffffc02079ee <sys_exec>:
ffffffffc02079ee:	6d14                	ld	a3,24(a0)
ffffffffc02079f0:	6910                	ld	a2,16(a0)
ffffffffc02079f2:	650c                	ld	a1,8(a0)
ffffffffc02079f4:	6108                	ld	a0,0(a0)
ffffffffc02079f6:	f3efc06f          	j	ffffffffc0204134 <do_execve>

ffffffffc02079fa <sys_wait>:
ffffffffc02079fa:	650c                	ld	a1,8(a0)
ffffffffc02079fc:	4108                	lw	a0,0(a0)
ffffffffc02079fe:	cd1fc06f          	j	ffffffffc02046ce <do_wait>

ffffffffc0207a02 <sys_fork>:
ffffffffc0207a02:	00012797          	auipc	a5,0x12
ffffffffc0207a06:	af67b783          	ld	a5,-1290(a5) # ffffffffc02194f8 <current>
ffffffffc0207a0a:	73d0                	ld	a2,160(a5)
ffffffffc0207a0c:	4501                	li	a0,0
ffffffffc0207a0e:	6a0c                	ld	a1,16(a2)
ffffffffc0207a10:	ebbfb06f          	j	ffffffffc02038ca <do_fork>

ffffffffc0207a14 <sys_exit>:
ffffffffc0207a14:	4108                	lw	a0,0(a0)
ffffffffc0207a16:	ad6fc06f          	j	ffffffffc0203cec <do_exit>

ffffffffc0207a1a <syscall>:
ffffffffc0207a1a:	715d                	addi	sp,sp,-80
ffffffffc0207a1c:	fc26                	sd	s1,56(sp)
ffffffffc0207a1e:	00012497          	auipc	s1,0x12
ffffffffc0207a22:	ada48493          	addi	s1,s1,-1318 # ffffffffc02194f8 <current>
ffffffffc0207a26:	6098                	ld	a4,0(s1)
ffffffffc0207a28:	e0a2                	sd	s0,64(sp)
ffffffffc0207a2a:	f84a                	sd	s2,48(sp)
ffffffffc0207a2c:	7340                	ld	s0,160(a4)
ffffffffc0207a2e:	e486                	sd	ra,72(sp)
ffffffffc0207a30:	0ff00793          	li	a5,255
ffffffffc0207a34:	05042903          	lw	s2,80(s0)
ffffffffc0207a38:	0327ee63          	bltu	a5,s2,ffffffffc0207a74 <syscall+0x5a>
ffffffffc0207a3c:	00391713          	slli	a4,s2,0x3
ffffffffc0207a40:	00002797          	auipc	a5,0x2
ffffffffc0207a44:	0c878793          	addi	a5,a5,200 # ffffffffc0209b08 <syscalls>
ffffffffc0207a48:	97ba                	add	a5,a5,a4
ffffffffc0207a4a:	639c                	ld	a5,0(a5)
ffffffffc0207a4c:	c785                	beqz	a5,ffffffffc0207a74 <syscall+0x5a>
ffffffffc0207a4e:	6c28                	ld	a0,88(s0)
ffffffffc0207a50:	702c                	ld	a1,96(s0)
ffffffffc0207a52:	7430                	ld	a2,104(s0)
ffffffffc0207a54:	7834                	ld	a3,112(s0)
ffffffffc0207a56:	7c38                	ld	a4,120(s0)
ffffffffc0207a58:	e42a                	sd	a0,8(sp)
ffffffffc0207a5a:	e82e                	sd	a1,16(sp)
ffffffffc0207a5c:	ec32                	sd	a2,24(sp)
ffffffffc0207a5e:	f036                	sd	a3,32(sp)
ffffffffc0207a60:	f43a                	sd	a4,40(sp)
ffffffffc0207a62:	0028                	addi	a0,sp,8
ffffffffc0207a64:	9782                	jalr	a5
ffffffffc0207a66:	60a6                	ld	ra,72(sp)
ffffffffc0207a68:	e828                	sd	a0,80(s0)
ffffffffc0207a6a:	6406                	ld	s0,64(sp)
ffffffffc0207a6c:	74e2                	ld	s1,56(sp)
ffffffffc0207a6e:	7942                	ld	s2,48(sp)
ffffffffc0207a70:	6161                	addi	sp,sp,80
ffffffffc0207a72:	8082                	ret
ffffffffc0207a74:	8522                	mv	a0,s0
ffffffffc0207a76:	db1f80ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0207a7a:	609c                	ld	a5,0(s1)
ffffffffc0207a7c:	86ca                	mv	a3,s2
ffffffffc0207a7e:	00002617          	auipc	a2,0x2
ffffffffc0207a82:	04260613          	addi	a2,a2,66 # ffffffffc0209ac0 <default_pmm_manager+0x8d0>
ffffffffc0207a86:	43d8                	lw	a4,4(a5)
ffffffffc0207a88:	07300593          	li	a1,115
ffffffffc0207a8c:	0b478793          	addi	a5,a5,180
ffffffffc0207a90:	00002517          	auipc	a0,0x2
ffffffffc0207a94:	06050513          	addi	a0,a0,96 # ffffffffc0209af0 <default_pmm_manager+0x900>
ffffffffc0207a98:	f70f80ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0207a9c <strnlen>:
ffffffffc0207a9c:	872a                	mv	a4,a0
ffffffffc0207a9e:	4501                	li	a0,0
ffffffffc0207aa0:	e589                	bnez	a1,ffffffffc0207aaa <strnlen+0xe>
ffffffffc0207aa2:	a811                	j	ffffffffc0207ab6 <strnlen+0x1a>
ffffffffc0207aa4:	0505                	addi	a0,a0,1
ffffffffc0207aa6:	00a58763          	beq	a1,a0,ffffffffc0207ab4 <strnlen+0x18>
ffffffffc0207aaa:	00a707b3          	add	a5,a4,a0
ffffffffc0207aae:	0007c783          	lbu	a5,0(a5)
ffffffffc0207ab2:	fbed                	bnez	a5,ffffffffc0207aa4 <strnlen+0x8>
ffffffffc0207ab4:	8082                	ret
ffffffffc0207ab6:	8082                	ret

ffffffffc0207ab8 <strcmp>:
ffffffffc0207ab8:	00054783          	lbu	a5,0(a0)
ffffffffc0207abc:	0005c703          	lbu	a4,0(a1)
ffffffffc0207ac0:	cb89                	beqz	a5,ffffffffc0207ad2 <strcmp+0x1a>
ffffffffc0207ac2:	0505                	addi	a0,a0,1
ffffffffc0207ac4:	0585                	addi	a1,a1,1
ffffffffc0207ac6:	fee789e3          	beq	a5,a4,ffffffffc0207ab8 <strcmp>
ffffffffc0207aca:	0007851b          	sext.w	a0,a5
ffffffffc0207ace:	9d19                	subw	a0,a0,a4
ffffffffc0207ad0:	8082                	ret
ffffffffc0207ad2:	4501                	li	a0,0
ffffffffc0207ad4:	bfed                	j	ffffffffc0207ace <strcmp+0x16>

ffffffffc0207ad6 <strchr>:
ffffffffc0207ad6:	00054783          	lbu	a5,0(a0)
ffffffffc0207ada:	c799                	beqz	a5,ffffffffc0207ae8 <strchr+0x12>
ffffffffc0207adc:	00f58763          	beq	a1,a5,ffffffffc0207aea <strchr+0x14>
ffffffffc0207ae0:	00154783          	lbu	a5,1(a0)
ffffffffc0207ae4:	0505                	addi	a0,a0,1
ffffffffc0207ae6:	fbfd                	bnez	a5,ffffffffc0207adc <strchr+0x6>
ffffffffc0207ae8:	4501                	li	a0,0
ffffffffc0207aea:	8082                	ret

ffffffffc0207aec <memset>:
ffffffffc0207aec:	ca01                	beqz	a2,ffffffffc0207afc <memset+0x10>
ffffffffc0207aee:	962a                	add	a2,a2,a0
ffffffffc0207af0:	87aa                	mv	a5,a0
ffffffffc0207af2:	0785                	addi	a5,a5,1
ffffffffc0207af4:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0207af8:	fec79de3          	bne	a5,a2,ffffffffc0207af2 <memset+0x6>
ffffffffc0207afc:	8082                	ret

ffffffffc0207afe <memcpy>:
ffffffffc0207afe:	ca19                	beqz	a2,ffffffffc0207b14 <memcpy+0x16>
ffffffffc0207b00:	962e                	add	a2,a2,a1
ffffffffc0207b02:	87aa                	mv	a5,a0
ffffffffc0207b04:	0005c703          	lbu	a4,0(a1)
ffffffffc0207b08:	0585                	addi	a1,a1,1
ffffffffc0207b0a:	0785                	addi	a5,a5,1
ffffffffc0207b0c:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0207b10:	fec59ae3          	bne	a1,a2,ffffffffc0207b04 <memcpy+0x6>
ffffffffc0207b14:	8082                	ret

ffffffffc0207b16 <printnum>:
ffffffffc0207b16:	02069813          	slli	a6,a3,0x20
ffffffffc0207b1a:	7179                	addi	sp,sp,-48
ffffffffc0207b1c:	02085813          	srli	a6,a6,0x20
ffffffffc0207b20:	e052                	sd	s4,0(sp)
ffffffffc0207b22:	03067a33          	remu	s4,a2,a6
ffffffffc0207b26:	f022                	sd	s0,32(sp)
ffffffffc0207b28:	ec26                	sd	s1,24(sp)
ffffffffc0207b2a:	e84a                	sd	s2,16(sp)
ffffffffc0207b2c:	f406                	sd	ra,40(sp)
ffffffffc0207b2e:	e44e                	sd	s3,8(sp)
ffffffffc0207b30:	84aa                	mv	s1,a0
ffffffffc0207b32:	892e                	mv	s2,a1
ffffffffc0207b34:	fff7041b          	addiw	s0,a4,-1
ffffffffc0207b38:	2a01                	sext.w	s4,s4
ffffffffc0207b3a:	03067e63          	bgeu	a2,a6,ffffffffc0207b76 <printnum+0x60>
ffffffffc0207b3e:	89be                	mv	s3,a5
ffffffffc0207b40:	00805763          	blez	s0,ffffffffc0207b4e <printnum+0x38>
ffffffffc0207b44:	347d                	addiw	s0,s0,-1
ffffffffc0207b46:	85ca                	mv	a1,s2
ffffffffc0207b48:	854e                	mv	a0,s3
ffffffffc0207b4a:	9482                	jalr	s1
ffffffffc0207b4c:	fc65                	bnez	s0,ffffffffc0207b44 <printnum+0x2e>
ffffffffc0207b4e:	1a02                	slli	s4,s4,0x20
ffffffffc0207b50:	020a5a13          	srli	s4,s4,0x20
ffffffffc0207b54:	00002797          	auipc	a5,0x2
ffffffffc0207b58:	7b478793          	addi	a5,a5,1972 # ffffffffc020a308 <syscalls+0x800>
ffffffffc0207b5c:	7402                	ld	s0,32(sp)
ffffffffc0207b5e:	9a3e                	add	s4,s4,a5
ffffffffc0207b60:	000a4503          	lbu	a0,0(s4)
ffffffffc0207b64:	70a2                	ld	ra,40(sp)
ffffffffc0207b66:	69a2                	ld	s3,8(sp)
ffffffffc0207b68:	6a02                	ld	s4,0(sp)
ffffffffc0207b6a:	85ca                	mv	a1,s2
ffffffffc0207b6c:	8326                	mv	t1,s1
ffffffffc0207b6e:	6942                	ld	s2,16(sp)
ffffffffc0207b70:	64e2                	ld	s1,24(sp)
ffffffffc0207b72:	6145                	addi	sp,sp,48
ffffffffc0207b74:	8302                	jr	t1
ffffffffc0207b76:	03065633          	divu	a2,a2,a6
ffffffffc0207b7a:	8722                	mv	a4,s0
ffffffffc0207b7c:	f9bff0ef          	jal	ra,ffffffffc0207b16 <printnum>
ffffffffc0207b80:	b7f9                	j	ffffffffc0207b4e <printnum+0x38>

ffffffffc0207b82 <vprintfmt>:
ffffffffc0207b82:	7119                	addi	sp,sp,-128
ffffffffc0207b84:	f4a6                	sd	s1,104(sp)
ffffffffc0207b86:	f0ca                	sd	s2,96(sp)
ffffffffc0207b88:	ecce                	sd	s3,88(sp)
ffffffffc0207b8a:	e8d2                	sd	s4,80(sp)
ffffffffc0207b8c:	e4d6                	sd	s5,72(sp)
ffffffffc0207b8e:	e0da                	sd	s6,64(sp)
ffffffffc0207b90:	fc5e                	sd	s7,56(sp)
ffffffffc0207b92:	f06a                	sd	s10,32(sp)
ffffffffc0207b94:	fc86                	sd	ra,120(sp)
ffffffffc0207b96:	f8a2                	sd	s0,112(sp)
ffffffffc0207b98:	f862                	sd	s8,48(sp)
ffffffffc0207b9a:	f466                	sd	s9,40(sp)
ffffffffc0207b9c:	ec6e                	sd	s11,24(sp)
ffffffffc0207b9e:	892a                	mv	s2,a0
ffffffffc0207ba0:	84ae                	mv	s1,a1
ffffffffc0207ba2:	8d32                	mv	s10,a2
ffffffffc0207ba4:	8a36                	mv	s4,a3
ffffffffc0207ba6:	02500993          	li	s3,37
ffffffffc0207baa:	5b7d                	li	s6,-1
ffffffffc0207bac:	00002a97          	auipc	s5,0x2
ffffffffc0207bb0:	788a8a93          	addi	s5,s5,1928 # ffffffffc020a334 <syscalls+0x82c>
ffffffffc0207bb4:	00003b97          	auipc	s7,0x3
ffffffffc0207bb8:	99cb8b93          	addi	s7,s7,-1636 # ffffffffc020a550 <error_string>
ffffffffc0207bbc:	000d4503          	lbu	a0,0(s10)
ffffffffc0207bc0:	001d0413          	addi	s0,s10,1
ffffffffc0207bc4:	01350a63          	beq	a0,s3,ffffffffc0207bd8 <vprintfmt+0x56>
ffffffffc0207bc8:	c121                	beqz	a0,ffffffffc0207c08 <vprintfmt+0x86>
ffffffffc0207bca:	85a6                	mv	a1,s1
ffffffffc0207bcc:	0405                	addi	s0,s0,1
ffffffffc0207bce:	9902                	jalr	s2
ffffffffc0207bd0:	fff44503          	lbu	a0,-1(s0)
ffffffffc0207bd4:	ff351ae3          	bne	a0,s3,ffffffffc0207bc8 <vprintfmt+0x46>
ffffffffc0207bd8:	00044603          	lbu	a2,0(s0)
ffffffffc0207bdc:	02000793          	li	a5,32
ffffffffc0207be0:	4c81                	li	s9,0
ffffffffc0207be2:	4881                	li	a7,0
ffffffffc0207be4:	5c7d                	li	s8,-1
ffffffffc0207be6:	5dfd                	li	s11,-1
ffffffffc0207be8:	05500513          	li	a0,85
ffffffffc0207bec:	4825                	li	a6,9
ffffffffc0207bee:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0207bf2:	0ff5f593          	andi	a1,a1,255
ffffffffc0207bf6:	00140d13          	addi	s10,s0,1
ffffffffc0207bfa:	04b56263          	bltu	a0,a1,ffffffffc0207c3e <vprintfmt+0xbc>
ffffffffc0207bfe:	058a                	slli	a1,a1,0x2
ffffffffc0207c00:	95d6                	add	a1,a1,s5
ffffffffc0207c02:	4194                	lw	a3,0(a1)
ffffffffc0207c04:	96d6                	add	a3,a3,s5
ffffffffc0207c06:	8682                	jr	a3
ffffffffc0207c08:	70e6                	ld	ra,120(sp)
ffffffffc0207c0a:	7446                	ld	s0,112(sp)
ffffffffc0207c0c:	74a6                	ld	s1,104(sp)
ffffffffc0207c0e:	7906                	ld	s2,96(sp)
ffffffffc0207c10:	69e6                	ld	s3,88(sp)
ffffffffc0207c12:	6a46                	ld	s4,80(sp)
ffffffffc0207c14:	6aa6                	ld	s5,72(sp)
ffffffffc0207c16:	6b06                	ld	s6,64(sp)
ffffffffc0207c18:	7be2                	ld	s7,56(sp)
ffffffffc0207c1a:	7c42                	ld	s8,48(sp)
ffffffffc0207c1c:	7ca2                	ld	s9,40(sp)
ffffffffc0207c1e:	7d02                	ld	s10,32(sp)
ffffffffc0207c20:	6de2                	ld	s11,24(sp)
ffffffffc0207c22:	6109                	addi	sp,sp,128
ffffffffc0207c24:	8082                	ret
ffffffffc0207c26:	87b2                	mv	a5,a2
ffffffffc0207c28:	00144603          	lbu	a2,1(s0)
ffffffffc0207c2c:	846a                	mv	s0,s10
ffffffffc0207c2e:	00140d13          	addi	s10,s0,1
ffffffffc0207c32:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0207c36:	0ff5f593          	andi	a1,a1,255
ffffffffc0207c3a:	fcb572e3          	bgeu	a0,a1,ffffffffc0207bfe <vprintfmt+0x7c>
ffffffffc0207c3e:	85a6                	mv	a1,s1
ffffffffc0207c40:	02500513          	li	a0,37
ffffffffc0207c44:	9902                	jalr	s2
ffffffffc0207c46:	fff44783          	lbu	a5,-1(s0)
ffffffffc0207c4a:	8d22                	mv	s10,s0
ffffffffc0207c4c:	f73788e3          	beq	a5,s3,ffffffffc0207bbc <vprintfmt+0x3a>
ffffffffc0207c50:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0207c54:	1d7d                	addi	s10,s10,-1
ffffffffc0207c56:	ff379de3          	bne	a5,s3,ffffffffc0207c50 <vprintfmt+0xce>
ffffffffc0207c5a:	b78d                	j	ffffffffc0207bbc <vprintfmt+0x3a>
ffffffffc0207c5c:	fd060c1b          	addiw	s8,a2,-48
ffffffffc0207c60:	00144603          	lbu	a2,1(s0)
ffffffffc0207c64:	846a                	mv	s0,s10
ffffffffc0207c66:	fd06069b          	addiw	a3,a2,-48
ffffffffc0207c6a:	0006059b          	sext.w	a1,a2
ffffffffc0207c6e:	02d86463          	bltu	a6,a3,ffffffffc0207c96 <vprintfmt+0x114>
ffffffffc0207c72:	00144603          	lbu	a2,1(s0)
ffffffffc0207c76:	002c169b          	slliw	a3,s8,0x2
ffffffffc0207c7a:	0186873b          	addw	a4,a3,s8
ffffffffc0207c7e:	0017171b          	slliw	a4,a4,0x1
ffffffffc0207c82:	9f2d                	addw	a4,a4,a1
ffffffffc0207c84:	fd06069b          	addiw	a3,a2,-48
ffffffffc0207c88:	0405                	addi	s0,s0,1
ffffffffc0207c8a:	fd070c1b          	addiw	s8,a4,-48
ffffffffc0207c8e:	0006059b          	sext.w	a1,a2
ffffffffc0207c92:	fed870e3          	bgeu	a6,a3,ffffffffc0207c72 <vprintfmt+0xf0>
ffffffffc0207c96:	f40ddce3          	bgez	s11,ffffffffc0207bee <vprintfmt+0x6c>
ffffffffc0207c9a:	8de2                	mv	s11,s8
ffffffffc0207c9c:	5c7d                	li	s8,-1
ffffffffc0207c9e:	bf81                	j	ffffffffc0207bee <vprintfmt+0x6c>
ffffffffc0207ca0:	fffdc693          	not	a3,s11
ffffffffc0207ca4:	96fd                	srai	a3,a3,0x3f
ffffffffc0207ca6:	00ddfdb3          	and	s11,s11,a3
ffffffffc0207caa:	00144603          	lbu	a2,1(s0)
ffffffffc0207cae:	2d81                	sext.w	s11,s11
ffffffffc0207cb0:	846a                	mv	s0,s10
ffffffffc0207cb2:	bf35                	j	ffffffffc0207bee <vprintfmt+0x6c>
ffffffffc0207cb4:	000a2c03          	lw	s8,0(s4)
ffffffffc0207cb8:	00144603          	lbu	a2,1(s0)
ffffffffc0207cbc:	0a21                	addi	s4,s4,8
ffffffffc0207cbe:	846a                	mv	s0,s10
ffffffffc0207cc0:	bfd9                	j	ffffffffc0207c96 <vprintfmt+0x114>
ffffffffc0207cc2:	4705                	li	a4,1
ffffffffc0207cc4:	008a0593          	addi	a1,s4,8
ffffffffc0207cc8:	01174463          	blt	a4,a7,ffffffffc0207cd0 <vprintfmt+0x14e>
ffffffffc0207ccc:	1a088e63          	beqz	a7,ffffffffc0207e88 <vprintfmt+0x306>
ffffffffc0207cd0:	000a3603          	ld	a2,0(s4)
ffffffffc0207cd4:	46c1                	li	a3,16
ffffffffc0207cd6:	8a2e                	mv	s4,a1
ffffffffc0207cd8:	2781                	sext.w	a5,a5
ffffffffc0207cda:	876e                	mv	a4,s11
ffffffffc0207cdc:	85a6                	mv	a1,s1
ffffffffc0207cde:	854a                	mv	a0,s2
ffffffffc0207ce0:	e37ff0ef          	jal	ra,ffffffffc0207b16 <printnum>
ffffffffc0207ce4:	bde1                	j	ffffffffc0207bbc <vprintfmt+0x3a>
ffffffffc0207ce6:	000a2503          	lw	a0,0(s4)
ffffffffc0207cea:	85a6                	mv	a1,s1
ffffffffc0207cec:	0a21                	addi	s4,s4,8
ffffffffc0207cee:	9902                	jalr	s2
ffffffffc0207cf0:	b5f1                	j	ffffffffc0207bbc <vprintfmt+0x3a>
ffffffffc0207cf2:	4705                	li	a4,1
ffffffffc0207cf4:	008a0593          	addi	a1,s4,8
ffffffffc0207cf8:	01174463          	blt	a4,a7,ffffffffc0207d00 <vprintfmt+0x17e>
ffffffffc0207cfc:	18088163          	beqz	a7,ffffffffc0207e7e <vprintfmt+0x2fc>
ffffffffc0207d00:	000a3603          	ld	a2,0(s4)
ffffffffc0207d04:	46a9                	li	a3,10
ffffffffc0207d06:	8a2e                	mv	s4,a1
ffffffffc0207d08:	bfc1                	j	ffffffffc0207cd8 <vprintfmt+0x156>
ffffffffc0207d0a:	00144603          	lbu	a2,1(s0)
ffffffffc0207d0e:	4c85                	li	s9,1
ffffffffc0207d10:	846a                	mv	s0,s10
ffffffffc0207d12:	bdf1                	j	ffffffffc0207bee <vprintfmt+0x6c>
ffffffffc0207d14:	85a6                	mv	a1,s1
ffffffffc0207d16:	02500513          	li	a0,37
ffffffffc0207d1a:	9902                	jalr	s2
ffffffffc0207d1c:	b545                	j	ffffffffc0207bbc <vprintfmt+0x3a>
ffffffffc0207d1e:	00144603          	lbu	a2,1(s0)
ffffffffc0207d22:	2885                	addiw	a7,a7,1
ffffffffc0207d24:	846a                	mv	s0,s10
ffffffffc0207d26:	b5e1                	j	ffffffffc0207bee <vprintfmt+0x6c>
ffffffffc0207d28:	4705                	li	a4,1
ffffffffc0207d2a:	008a0593          	addi	a1,s4,8
ffffffffc0207d2e:	01174463          	blt	a4,a7,ffffffffc0207d36 <vprintfmt+0x1b4>
ffffffffc0207d32:	14088163          	beqz	a7,ffffffffc0207e74 <vprintfmt+0x2f2>
ffffffffc0207d36:	000a3603          	ld	a2,0(s4)
ffffffffc0207d3a:	46a1                	li	a3,8
ffffffffc0207d3c:	8a2e                	mv	s4,a1
ffffffffc0207d3e:	bf69                	j	ffffffffc0207cd8 <vprintfmt+0x156>
ffffffffc0207d40:	03000513          	li	a0,48
ffffffffc0207d44:	85a6                	mv	a1,s1
ffffffffc0207d46:	e03e                	sd	a5,0(sp)
ffffffffc0207d48:	9902                	jalr	s2
ffffffffc0207d4a:	85a6                	mv	a1,s1
ffffffffc0207d4c:	07800513          	li	a0,120
ffffffffc0207d50:	9902                	jalr	s2
ffffffffc0207d52:	0a21                	addi	s4,s4,8
ffffffffc0207d54:	6782                	ld	a5,0(sp)
ffffffffc0207d56:	46c1                	li	a3,16
ffffffffc0207d58:	ff8a3603          	ld	a2,-8(s4)
ffffffffc0207d5c:	bfb5                	j	ffffffffc0207cd8 <vprintfmt+0x156>
ffffffffc0207d5e:	000a3403          	ld	s0,0(s4)
ffffffffc0207d62:	008a0713          	addi	a4,s4,8
ffffffffc0207d66:	e03a                	sd	a4,0(sp)
ffffffffc0207d68:	14040263          	beqz	s0,ffffffffc0207eac <vprintfmt+0x32a>
ffffffffc0207d6c:	0fb05763          	blez	s11,ffffffffc0207e5a <vprintfmt+0x2d8>
ffffffffc0207d70:	02d00693          	li	a3,45
ffffffffc0207d74:	0cd79163          	bne	a5,a3,ffffffffc0207e36 <vprintfmt+0x2b4>
ffffffffc0207d78:	00044783          	lbu	a5,0(s0)
ffffffffc0207d7c:	0007851b          	sext.w	a0,a5
ffffffffc0207d80:	cf85                	beqz	a5,ffffffffc0207db8 <vprintfmt+0x236>
ffffffffc0207d82:	00140a13          	addi	s4,s0,1
ffffffffc0207d86:	05e00413          	li	s0,94
ffffffffc0207d8a:	000c4563          	bltz	s8,ffffffffc0207d94 <vprintfmt+0x212>
ffffffffc0207d8e:	3c7d                	addiw	s8,s8,-1
ffffffffc0207d90:	036c0263          	beq	s8,s6,ffffffffc0207db4 <vprintfmt+0x232>
ffffffffc0207d94:	85a6                	mv	a1,s1
ffffffffc0207d96:	0e0c8e63          	beqz	s9,ffffffffc0207e92 <vprintfmt+0x310>
ffffffffc0207d9a:	3781                	addiw	a5,a5,-32
ffffffffc0207d9c:	0ef47b63          	bgeu	s0,a5,ffffffffc0207e92 <vprintfmt+0x310>
ffffffffc0207da0:	03f00513          	li	a0,63
ffffffffc0207da4:	9902                	jalr	s2
ffffffffc0207da6:	000a4783          	lbu	a5,0(s4)
ffffffffc0207daa:	3dfd                	addiw	s11,s11,-1
ffffffffc0207dac:	0a05                	addi	s4,s4,1
ffffffffc0207dae:	0007851b          	sext.w	a0,a5
ffffffffc0207db2:	ffe1                	bnez	a5,ffffffffc0207d8a <vprintfmt+0x208>
ffffffffc0207db4:	01b05963          	blez	s11,ffffffffc0207dc6 <vprintfmt+0x244>
ffffffffc0207db8:	3dfd                	addiw	s11,s11,-1
ffffffffc0207dba:	85a6                	mv	a1,s1
ffffffffc0207dbc:	02000513          	li	a0,32
ffffffffc0207dc0:	9902                	jalr	s2
ffffffffc0207dc2:	fe0d9be3          	bnez	s11,ffffffffc0207db8 <vprintfmt+0x236>
ffffffffc0207dc6:	6a02                	ld	s4,0(sp)
ffffffffc0207dc8:	bbd5                	j	ffffffffc0207bbc <vprintfmt+0x3a>
ffffffffc0207dca:	4705                	li	a4,1
ffffffffc0207dcc:	008a0c93          	addi	s9,s4,8
ffffffffc0207dd0:	01174463          	blt	a4,a7,ffffffffc0207dd8 <vprintfmt+0x256>
ffffffffc0207dd4:	08088d63          	beqz	a7,ffffffffc0207e6e <vprintfmt+0x2ec>
ffffffffc0207dd8:	000a3403          	ld	s0,0(s4)
ffffffffc0207ddc:	0a044d63          	bltz	s0,ffffffffc0207e96 <vprintfmt+0x314>
ffffffffc0207de0:	8622                	mv	a2,s0
ffffffffc0207de2:	8a66                	mv	s4,s9
ffffffffc0207de4:	46a9                	li	a3,10
ffffffffc0207de6:	bdcd                	j	ffffffffc0207cd8 <vprintfmt+0x156>
ffffffffc0207de8:	000a2783          	lw	a5,0(s4)
ffffffffc0207dec:	4761                	li	a4,24
ffffffffc0207dee:	0a21                	addi	s4,s4,8
ffffffffc0207df0:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0207df4:	8fb5                	xor	a5,a5,a3
ffffffffc0207df6:	40d786bb          	subw	a3,a5,a3
ffffffffc0207dfa:	02d74163          	blt	a4,a3,ffffffffc0207e1c <vprintfmt+0x29a>
ffffffffc0207dfe:	00369793          	slli	a5,a3,0x3
ffffffffc0207e02:	97de                	add	a5,a5,s7
ffffffffc0207e04:	639c                	ld	a5,0(a5)
ffffffffc0207e06:	cb99                	beqz	a5,ffffffffc0207e1c <vprintfmt+0x29a>
ffffffffc0207e08:	86be                	mv	a3,a5
ffffffffc0207e0a:	00000617          	auipc	a2,0x0
ffffffffc0207e0e:	13660613          	addi	a2,a2,310 # ffffffffc0207f40 <etext+0x26>
ffffffffc0207e12:	85a6                	mv	a1,s1
ffffffffc0207e14:	854a                	mv	a0,s2
ffffffffc0207e16:	0ce000ef          	jal	ra,ffffffffc0207ee4 <printfmt>
ffffffffc0207e1a:	b34d                	j	ffffffffc0207bbc <vprintfmt+0x3a>
ffffffffc0207e1c:	00002617          	auipc	a2,0x2
ffffffffc0207e20:	50c60613          	addi	a2,a2,1292 # ffffffffc020a328 <syscalls+0x820>
ffffffffc0207e24:	85a6                	mv	a1,s1
ffffffffc0207e26:	854a                	mv	a0,s2
ffffffffc0207e28:	0bc000ef          	jal	ra,ffffffffc0207ee4 <printfmt>
ffffffffc0207e2c:	bb41                	j	ffffffffc0207bbc <vprintfmt+0x3a>
ffffffffc0207e2e:	00002417          	auipc	s0,0x2
ffffffffc0207e32:	4f240413          	addi	s0,s0,1266 # ffffffffc020a320 <syscalls+0x818>
ffffffffc0207e36:	85e2                	mv	a1,s8
ffffffffc0207e38:	8522                	mv	a0,s0
ffffffffc0207e3a:	e43e                	sd	a5,8(sp)
ffffffffc0207e3c:	c61ff0ef          	jal	ra,ffffffffc0207a9c <strnlen>
ffffffffc0207e40:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0207e44:	01b05b63          	blez	s11,ffffffffc0207e5a <vprintfmt+0x2d8>
ffffffffc0207e48:	67a2                	ld	a5,8(sp)
ffffffffc0207e4a:	00078a1b          	sext.w	s4,a5
ffffffffc0207e4e:	3dfd                	addiw	s11,s11,-1
ffffffffc0207e50:	85a6                	mv	a1,s1
ffffffffc0207e52:	8552                	mv	a0,s4
ffffffffc0207e54:	9902                	jalr	s2
ffffffffc0207e56:	fe0d9ce3          	bnez	s11,ffffffffc0207e4e <vprintfmt+0x2cc>
ffffffffc0207e5a:	00044783          	lbu	a5,0(s0)
ffffffffc0207e5e:	00140a13          	addi	s4,s0,1
ffffffffc0207e62:	0007851b          	sext.w	a0,a5
ffffffffc0207e66:	d3a5                	beqz	a5,ffffffffc0207dc6 <vprintfmt+0x244>
ffffffffc0207e68:	05e00413          	li	s0,94
ffffffffc0207e6c:	bf39                	j	ffffffffc0207d8a <vprintfmt+0x208>
ffffffffc0207e6e:	000a2403          	lw	s0,0(s4)
ffffffffc0207e72:	b7ad                	j	ffffffffc0207ddc <vprintfmt+0x25a>
ffffffffc0207e74:	000a6603          	lwu	a2,0(s4)
ffffffffc0207e78:	46a1                	li	a3,8
ffffffffc0207e7a:	8a2e                	mv	s4,a1
ffffffffc0207e7c:	bdb1                	j	ffffffffc0207cd8 <vprintfmt+0x156>
ffffffffc0207e7e:	000a6603          	lwu	a2,0(s4)
ffffffffc0207e82:	46a9                	li	a3,10
ffffffffc0207e84:	8a2e                	mv	s4,a1
ffffffffc0207e86:	bd89                	j	ffffffffc0207cd8 <vprintfmt+0x156>
ffffffffc0207e88:	000a6603          	lwu	a2,0(s4)
ffffffffc0207e8c:	46c1                	li	a3,16
ffffffffc0207e8e:	8a2e                	mv	s4,a1
ffffffffc0207e90:	b5a1                	j	ffffffffc0207cd8 <vprintfmt+0x156>
ffffffffc0207e92:	9902                	jalr	s2
ffffffffc0207e94:	bf09                	j	ffffffffc0207da6 <vprintfmt+0x224>
ffffffffc0207e96:	85a6                	mv	a1,s1
ffffffffc0207e98:	02d00513          	li	a0,45
ffffffffc0207e9c:	e03e                	sd	a5,0(sp)
ffffffffc0207e9e:	9902                	jalr	s2
ffffffffc0207ea0:	6782                	ld	a5,0(sp)
ffffffffc0207ea2:	8a66                	mv	s4,s9
ffffffffc0207ea4:	40800633          	neg	a2,s0
ffffffffc0207ea8:	46a9                	li	a3,10
ffffffffc0207eaa:	b53d                	j	ffffffffc0207cd8 <vprintfmt+0x156>
ffffffffc0207eac:	03b05163          	blez	s11,ffffffffc0207ece <vprintfmt+0x34c>
ffffffffc0207eb0:	02d00693          	li	a3,45
ffffffffc0207eb4:	f6d79de3          	bne	a5,a3,ffffffffc0207e2e <vprintfmt+0x2ac>
ffffffffc0207eb8:	00002417          	auipc	s0,0x2
ffffffffc0207ebc:	46840413          	addi	s0,s0,1128 # ffffffffc020a320 <syscalls+0x818>
ffffffffc0207ec0:	02800793          	li	a5,40
ffffffffc0207ec4:	02800513          	li	a0,40
ffffffffc0207ec8:	00140a13          	addi	s4,s0,1
ffffffffc0207ecc:	bd6d                	j	ffffffffc0207d86 <vprintfmt+0x204>
ffffffffc0207ece:	00002a17          	auipc	s4,0x2
ffffffffc0207ed2:	453a0a13          	addi	s4,s4,1107 # ffffffffc020a321 <syscalls+0x819>
ffffffffc0207ed6:	02800513          	li	a0,40
ffffffffc0207eda:	02800793          	li	a5,40
ffffffffc0207ede:	05e00413          	li	s0,94
ffffffffc0207ee2:	b565                	j	ffffffffc0207d8a <vprintfmt+0x208>

ffffffffc0207ee4 <printfmt>:
ffffffffc0207ee4:	715d                	addi	sp,sp,-80
ffffffffc0207ee6:	02810313          	addi	t1,sp,40
ffffffffc0207eea:	f436                	sd	a3,40(sp)
ffffffffc0207eec:	869a                	mv	a3,t1
ffffffffc0207eee:	ec06                	sd	ra,24(sp)
ffffffffc0207ef0:	f83a                	sd	a4,48(sp)
ffffffffc0207ef2:	fc3e                	sd	a5,56(sp)
ffffffffc0207ef4:	e0c2                	sd	a6,64(sp)
ffffffffc0207ef6:	e4c6                	sd	a7,72(sp)
ffffffffc0207ef8:	e41a                	sd	t1,8(sp)
ffffffffc0207efa:	c89ff0ef          	jal	ra,ffffffffc0207b82 <vprintfmt>
ffffffffc0207efe:	60e2                	ld	ra,24(sp)
ffffffffc0207f00:	6161                	addi	sp,sp,80
ffffffffc0207f02:	8082                	ret

ffffffffc0207f04 <hash32>:
ffffffffc0207f04:	9e3707b7          	lui	a5,0x9e370
ffffffffc0207f08:	2785                	addiw	a5,a5,1
ffffffffc0207f0a:	02a7853b          	mulw	a0,a5,a0
ffffffffc0207f0e:	02000793          	li	a5,32
ffffffffc0207f12:	9f8d                	subw	a5,a5,a1
ffffffffc0207f14:	00f5553b          	srlw	a0,a0,a5
ffffffffc0207f18:	8082                	ret
