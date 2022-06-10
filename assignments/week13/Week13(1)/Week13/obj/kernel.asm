
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
ffffffffc020003e:	67e60613          	addi	a2,a2,1662 # ffffffffc02196b8 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	275070ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc020004e:	570000ef          	jal	ra,ffffffffc02005be <cons_init>
ffffffffc0200052:	00008597          	auipc	a1,0x8
ffffffffc0200056:	e9e58593          	addi	a1,a1,-354 # ffffffffc0207ef0 <etext+0x4>
ffffffffc020005a:	00008517          	auipc	a0,0x8
ffffffffc020005e:	eae50513          	addi	a0,a0,-338 # ffffffffc0207f08 <etext+0x1c>
ffffffffc0200062:	06a000ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200066:	788020ef          	jal	ra,ffffffffc02027ee <pmm_init>
ffffffffc020006a:	5c6000ef          	jal	ra,ffffffffc0200630 <pic_init>
ffffffffc020006e:	5d0000ef          	jal	ra,ffffffffc020063e <idt_init>
ffffffffc0200072:	050010ef          	jal	ra,ffffffffc02010c2 <vmm_init>
ffffffffc0200076:	0bf040ef          	jal	ra,ffffffffc0204934 <sched_init>
ffffffffc020007a:	6ac040ef          	jal	ra,ffffffffc0204726 <proc_init>
ffffffffc020007e:	4a2000ef          	jal	ra,ffffffffc0200520 <ide_init>
ffffffffc0200082:	1d8010ef          	jal	ra,ffffffffc020125a <swap_init>
ffffffffc0200086:	4f0000ef          	jal	ra,ffffffffc0200576 <clock_init>
ffffffffc020008a:	5a8000ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020008e:	7ce040ef          	jal	ra,ffffffffc020485c <cpu_idle>

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
ffffffffc02000c0:	295070ef          	jal	ra,ffffffffc0207b54 <vprintfmt>
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
ffffffffc02000f6:	25f070ef          	jal	ra,ffffffffc0207b54 <vprintfmt>
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
ffffffffc020016e:	da650513          	addi	a0,a0,-602 # ffffffffc0207f10 <etext+0x24>
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
ffffffffc020023a:	ce250513          	addi	a0,a0,-798 # ffffffffc0207f18 <etext+0x2c>
ffffffffc020023e:	e43e                	sd	a5,8(sp)
ffffffffc0200240:	e8dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200244:	65a2                	ld	a1,8(sp)
ffffffffc0200246:	8522                	mv	a0,s0
ffffffffc0200248:	e65ff0ef          	jal	ra,ffffffffc02000ac <vcprintf>
ffffffffc020024c:	00009517          	auipc	a0,0x9
ffffffffc0200250:	59450513          	addi	a0,a0,1428 # ffffffffc02097e0 <default_pmm_manager+0x620>
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
ffffffffc0200284:	cb850513          	addi	a0,a0,-840 # ffffffffc0207f38 <etext+0x4c>
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
ffffffffc02002a4:	54050513          	addi	a0,a0,1344 # ffffffffc02097e0 <default_pmm_manager+0x620>
ffffffffc02002a8:	e25ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002ac:	60e2                	ld	ra,24(sp)
ffffffffc02002ae:	6442                	ld	s0,16(sp)
ffffffffc02002b0:	6161                	addi	sp,sp,80
ffffffffc02002b2:	8082                	ret

ffffffffc02002b4 <print_kerninfo>:
ffffffffc02002b4:	1141                	addi	sp,sp,-16
ffffffffc02002b6:	00008517          	auipc	a0,0x8
ffffffffc02002ba:	ca250513          	addi	a0,a0,-862 # ffffffffc0207f58 <etext+0x6c>
ffffffffc02002be:	e406                	sd	ra,8(sp)
ffffffffc02002c0:	e0dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002c4:	00000597          	auipc	a1,0x0
ffffffffc02002c8:	d6e58593          	addi	a1,a1,-658 # ffffffffc0200032 <kern_init>
ffffffffc02002cc:	00008517          	auipc	a0,0x8
ffffffffc02002d0:	cac50513          	addi	a0,a0,-852 # ffffffffc0207f78 <etext+0x8c>
ffffffffc02002d4:	df9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002d8:	00008597          	auipc	a1,0x8
ffffffffc02002dc:	c1458593          	addi	a1,a1,-1004 # ffffffffc0207eec <etext>
ffffffffc02002e0:	00008517          	auipc	a0,0x8
ffffffffc02002e4:	cb850513          	addi	a0,a0,-840 # ffffffffc0207f98 <etext+0xac>
ffffffffc02002e8:	de5ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002ec:	0000e597          	auipc	a1,0xe
ffffffffc02002f0:	da458593          	addi	a1,a1,-604 # ffffffffc020e090 <buf>
ffffffffc02002f4:	00008517          	auipc	a0,0x8
ffffffffc02002f8:	cc450513          	addi	a0,a0,-828 # ffffffffc0207fb8 <etext+0xcc>
ffffffffc02002fc:	dd1ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200300:	00019597          	auipc	a1,0x19
ffffffffc0200304:	3b858593          	addi	a1,a1,952 # ffffffffc02196b8 <end>
ffffffffc0200308:	00008517          	auipc	a0,0x8
ffffffffc020030c:	cd050513          	addi	a0,a0,-816 # ffffffffc0207fd8 <etext+0xec>
ffffffffc0200310:	dbdff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200314:	00019597          	auipc	a1,0x19
ffffffffc0200318:	7a358593          	addi	a1,a1,1955 # ffffffffc0219ab7 <end+0x3ff>
ffffffffc020031c:	00000797          	auipc	a5,0x0
ffffffffc0200320:	d1678793          	addi	a5,a5,-746 # ffffffffc0200032 <kern_init>
ffffffffc0200324:	40f587b3          	sub	a5,a1,a5
ffffffffc0200328:	43f7d593          	srai	a1,a5,0x3f
ffffffffc020032c:	60a2                	ld	ra,8(sp)
ffffffffc020032e:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200332:	95be                	add	a1,a1,a5
ffffffffc0200334:	85a9                	srai	a1,a1,0xa
ffffffffc0200336:	00008517          	auipc	a0,0x8
ffffffffc020033a:	cc250513          	addi	a0,a0,-830 # ffffffffc0207ff8 <etext+0x10c>
ffffffffc020033e:	0141                	addi	sp,sp,16
ffffffffc0200340:	b371                	j	ffffffffc02000cc <cprintf>

ffffffffc0200342 <print_stackframe>:
ffffffffc0200342:	1141                	addi	sp,sp,-16
ffffffffc0200344:	00008617          	auipc	a2,0x8
ffffffffc0200348:	ce460613          	addi	a2,a2,-796 # ffffffffc0208028 <etext+0x13c>
ffffffffc020034c:	05b00593          	li	a1,91
ffffffffc0200350:	00008517          	auipc	a0,0x8
ffffffffc0200354:	cf050513          	addi	a0,a0,-784 # ffffffffc0208040 <etext+0x154>
ffffffffc0200358:	e406                	sd	ra,8(sp)
ffffffffc020035a:	eafff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020035e <mon_help>:
ffffffffc020035e:	1141                	addi	sp,sp,-16
ffffffffc0200360:	00008617          	auipc	a2,0x8
ffffffffc0200364:	cf860613          	addi	a2,a2,-776 # ffffffffc0208058 <etext+0x16c>
ffffffffc0200368:	00008597          	auipc	a1,0x8
ffffffffc020036c:	d1058593          	addi	a1,a1,-752 # ffffffffc0208078 <etext+0x18c>
ffffffffc0200370:	00008517          	auipc	a0,0x8
ffffffffc0200374:	d1050513          	addi	a0,a0,-752 # ffffffffc0208080 <etext+0x194>
ffffffffc0200378:	e406                	sd	ra,8(sp)
ffffffffc020037a:	d53ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020037e:	00008617          	auipc	a2,0x8
ffffffffc0200382:	d1260613          	addi	a2,a2,-750 # ffffffffc0208090 <etext+0x1a4>
ffffffffc0200386:	00008597          	auipc	a1,0x8
ffffffffc020038a:	d3258593          	addi	a1,a1,-718 # ffffffffc02080b8 <etext+0x1cc>
ffffffffc020038e:	00008517          	auipc	a0,0x8
ffffffffc0200392:	cf250513          	addi	a0,a0,-782 # ffffffffc0208080 <etext+0x194>
ffffffffc0200396:	d37ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020039a:	00008617          	auipc	a2,0x8
ffffffffc020039e:	d2e60613          	addi	a2,a2,-722 # ffffffffc02080c8 <etext+0x1dc>
ffffffffc02003a2:	00008597          	auipc	a1,0x8
ffffffffc02003a6:	d4658593          	addi	a1,a1,-698 # ffffffffc02080e8 <etext+0x1fc>
ffffffffc02003aa:	00008517          	auipc	a0,0x8
ffffffffc02003ae:	cd650513          	addi	a0,a0,-810 # ffffffffc0208080 <etext+0x194>
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
ffffffffc02003e8:	d1450513          	addi	a0,a0,-748 # ffffffffc02080f8 <etext+0x20c>
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
ffffffffc020040a:	d1a50513          	addi	a0,a0,-742 # ffffffffc0208120 <etext+0x234>
ffffffffc020040e:	cbfff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200412:	000c0563          	beqz	s8,ffffffffc020041c <kmonitor+0x3e>
ffffffffc0200416:	8562                	mv	a0,s8
ffffffffc0200418:	40e000ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc020041c:	00008c97          	auipc	s9,0x8
ffffffffc0200420:	d74c8c93          	addi	s9,s9,-652 # ffffffffc0208190 <commands>
ffffffffc0200424:	00008997          	auipc	s3,0x8
ffffffffc0200428:	d2498993          	addi	s3,s3,-732 # ffffffffc0208148 <etext+0x25c>
ffffffffc020042c:	00008917          	auipc	s2,0x8
ffffffffc0200430:	d2490913          	addi	s2,s2,-732 # ffffffffc0208150 <etext+0x264>
ffffffffc0200434:	4a3d                	li	s4,15
ffffffffc0200436:	00008b17          	auipc	s6,0x8
ffffffffc020043a:	d22b0b13          	addi	s6,s6,-734 # ffffffffc0208158 <etext+0x26c>
ffffffffc020043e:	00008a97          	auipc	s5,0x8
ffffffffc0200442:	c3aa8a93          	addi	s5,s5,-966 # ffffffffc0208078 <etext+0x18c>
ffffffffc0200446:	4b8d                	li	s7,3
ffffffffc0200448:	854e                	mv	a0,s3
ffffffffc020044a:	d0bff0ef          	jal	ra,ffffffffc0200154 <readline>
ffffffffc020044e:	842a                	mv	s0,a0
ffffffffc0200450:	dd65                	beqz	a0,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc0200452:	00054583          	lbu	a1,0(a0)
ffffffffc0200456:	4481                	li	s1,0
ffffffffc0200458:	c999                	beqz	a1,ffffffffc020046e <kmonitor+0x90>
ffffffffc020045a:	854a                	mv	a0,s2
ffffffffc020045c:	64c070ef          	jal	ra,ffffffffc0207aa8 <strchr>
ffffffffc0200460:	c925                	beqz	a0,ffffffffc02004d0 <kmonitor+0xf2>
ffffffffc0200462:	00144583          	lbu	a1,1(s0)
ffffffffc0200466:	00040023          	sb	zero,0(s0)
ffffffffc020046a:	0405                	addi	s0,s0,1
ffffffffc020046c:	f5fd                	bnez	a1,ffffffffc020045a <kmonitor+0x7c>
ffffffffc020046e:	dce9                	beqz	s1,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc0200470:	6582                	ld	a1,0(sp)
ffffffffc0200472:	00008d17          	auipc	s10,0x8
ffffffffc0200476:	d1ed0d13          	addi	s10,s10,-738 # ffffffffc0208190 <commands>
ffffffffc020047a:	8556                	mv	a0,s5
ffffffffc020047c:	4401                	li	s0,0
ffffffffc020047e:	0d61                	addi	s10,s10,24
ffffffffc0200480:	60a070ef          	jal	ra,ffffffffc0207a8a <strcmp>
ffffffffc0200484:	c919                	beqz	a0,ffffffffc020049a <kmonitor+0xbc>
ffffffffc0200486:	2405                	addiw	s0,s0,1
ffffffffc0200488:	09740463          	beq	s0,s7,ffffffffc0200510 <kmonitor+0x132>
ffffffffc020048c:	000d3503          	ld	a0,0(s10)
ffffffffc0200490:	6582                	ld	a1,0(sp)
ffffffffc0200492:	0d61                	addi	s10,s10,24
ffffffffc0200494:	5f6070ef          	jal	ra,ffffffffc0207a8a <strcmp>
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
ffffffffc02004fa:	5ae070ef          	jal	ra,ffffffffc0207aa8 <strchr>
ffffffffc02004fe:	d96d                	beqz	a0,ffffffffc02004f0 <kmonitor+0x112>
ffffffffc0200500:	00044583          	lbu	a1,0(s0)
ffffffffc0200504:	bf91                	j	ffffffffc0200458 <kmonitor+0x7a>
ffffffffc0200506:	45c1                	li	a1,16
ffffffffc0200508:	855a                	mv	a0,s6
ffffffffc020050a:	bc3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020050e:	b7f1                	j	ffffffffc02004da <kmonitor+0xfc>
ffffffffc0200510:	6582                	ld	a1,0(sp)
ffffffffc0200512:	00008517          	auipc	a0,0x8
ffffffffc0200516:	c6650513          	addi	a0,a0,-922 # ffffffffc0208178 <etext+0x28c>
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
ffffffffc0200546:	58a070ef          	jal	ra,ffffffffc0207ad0 <memcpy>
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
ffffffffc020056a:	566070ef          	jal	ra,ffffffffc0207ad0 <memcpy>
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
ffffffffc0200598:	c4450513          	addi	a0,a0,-956 # ffffffffc02081d8 <commands+0x48>
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
ffffffffc0200664:	b9850513          	addi	a0,a0,-1128 # ffffffffc02081f8 <commands+0x68>
ffffffffc0200668:	e406                	sd	ra,8(sp)
ffffffffc020066a:	a63ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020066e:	640c                	ld	a1,8(s0)
ffffffffc0200670:	00008517          	auipc	a0,0x8
ffffffffc0200674:	ba050513          	addi	a0,a0,-1120 # ffffffffc0208210 <commands+0x80>
ffffffffc0200678:	a55ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020067c:	680c                	ld	a1,16(s0)
ffffffffc020067e:	00008517          	auipc	a0,0x8
ffffffffc0200682:	baa50513          	addi	a0,a0,-1110 # ffffffffc0208228 <commands+0x98>
ffffffffc0200686:	a47ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020068a:	6c0c                	ld	a1,24(s0)
ffffffffc020068c:	00008517          	auipc	a0,0x8
ffffffffc0200690:	bb450513          	addi	a0,a0,-1100 # ffffffffc0208240 <commands+0xb0>
ffffffffc0200694:	a39ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200698:	700c                	ld	a1,32(s0)
ffffffffc020069a:	00008517          	auipc	a0,0x8
ffffffffc020069e:	bbe50513          	addi	a0,a0,-1090 # ffffffffc0208258 <commands+0xc8>
ffffffffc02006a2:	a2bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006a6:	740c                	ld	a1,40(s0)
ffffffffc02006a8:	00008517          	auipc	a0,0x8
ffffffffc02006ac:	bc850513          	addi	a0,a0,-1080 # ffffffffc0208270 <commands+0xe0>
ffffffffc02006b0:	a1dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006b4:	780c                	ld	a1,48(s0)
ffffffffc02006b6:	00008517          	auipc	a0,0x8
ffffffffc02006ba:	bd250513          	addi	a0,a0,-1070 # ffffffffc0208288 <commands+0xf8>
ffffffffc02006be:	a0fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006c2:	7c0c                	ld	a1,56(s0)
ffffffffc02006c4:	00008517          	auipc	a0,0x8
ffffffffc02006c8:	bdc50513          	addi	a0,a0,-1060 # ffffffffc02082a0 <commands+0x110>
ffffffffc02006cc:	a01ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006d0:	602c                	ld	a1,64(s0)
ffffffffc02006d2:	00008517          	auipc	a0,0x8
ffffffffc02006d6:	be650513          	addi	a0,a0,-1050 # ffffffffc02082b8 <commands+0x128>
ffffffffc02006da:	9f3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006de:	642c                	ld	a1,72(s0)
ffffffffc02006e0:	00008517          	auipc	a0,0x8
ffffffffc02006e4:	bf050513          	addi	a0,a0,-1040 # ffffffffc02082d0 <commands+0x140>
ffffffffc02006e8:	9e5ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006ec:	682c                	ld	a1,80(s0)
ffffffffc02006ee:	00008517          	auipc	a0,0x8
ffffffffc02006f2:	bfa50513          	addi	a0,a0,-1030 # ffffffffc02082e8 <commands+0x158>
ffffffffc02006f6:	9d7ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006fa:	6c2c                	ld	a1,88(s0)
ffffffffc02006fc:	00008517          	auipc	a0,0x8
ffffffffc0200700:	c0450513          	addi	a0,a0,-1020 # ffffffffc0208300 <commands+0x170>
ffffffffc0200704:	9c9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200708:	702c                	ld	a1,96(s0)
ffffffffc020070a:	00008517          	auipc	a0,0x8
ffffffffc020070e:	c0e50513          	addi	a0,a0,-1010 # ffffffffc0208318 <commands+0x188>
ffffffffc0200712:	9bbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200716:	742c                	ld	a1,104(s0)
ffffffffc0200718:	00008517          	auipc	a0,0x8
ffffffffc020071c:	c1850513          	addi	a0,a0,-1000 # ffffffffc0208330 <commands+0x1a0>
ffffffffc0200720:	9adff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200724:	782c                	ld	a1,112(s0)
ffffffffc0200726:	00008517          	auipc	a0,0x8
ffffffffc020072a:	c2250513          	addi	a0,a0,-990 # ffffffffc0208348 <commands+0x1b8>
ffffffffc020072e:	99fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200732:	7c2c                	ld	a1,120(s0)
ffffffffc0200734:	00008517          	auipc	a0,0x8
ffffffffc0200738:	c2c50513          	addi	a0,a0,-980 # ffffffffc0208360 <commands+0x1d0>
ffffffffc020073c:	991ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200740:	604c                	ld	a1,128(s0)
ffffffffc0200742:	00008517          	auipc	a0,0x8
ffffffffc0200746:	c3650513          	addi	a0,a0,-970 # ffffffffc0208378 <commands+0x1e8>
ffffffffc020074a:	983ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020074e:	644c                	ld	a1,136(s0)
ffffffffc0200750:	00008517          	auipc	a0,0x8
ffffffffc0200754:	c4050513          	addi	a0,a0,-960 # ffffffffc0208390 <commands+0x200>
ffffffffc0200758:	975ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020075c:	684c                	ld	a1,144(s0)
ffffffffc020075e:	00008517          	auipc	a0,0x8
ffffffffc0200762:	c4a50513          	addi	a0,a0,-950 # ffffffffc02083a8 <commands+0x218>
ffffffffc0200766:	967ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020076a:	6c4c                	ld	a1,152(s0)
ffffffffc020076c:	00008517          	auipc	a0,0x8
ffffffffc0200770:	c5450513          	addi	a0,a0,-940 # ffffffffc02083c0 <commands+0x230>
ffffffffc0200774:	959ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200778:	704c                	ld	a1,160(s0)
ffffffffc020077a:	00008517          	auipc	a0,0x8
ffffffffc020077e:	c5e50513          	addi	a0,a0,-930 # ffffffffc02083d8 <commands+0x248>
ffffffffc0200782:	94bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200786:	744c                	ld	a1,168(s0)
ffffffffc0200788:	00008517          	auipc	a0,0x8
ffffffffc020078c:	c6850513          	addi	a0,a0,-920 # ffffffffc02083f0 <commands+0x260>
ffffffffc0200790:	93dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200794:	784c                	ld	a1,176(s0)
ffffffffc0200796:	00008517          	auipc	a0,0x8
ffffffffc020079a:	c7250513          	addi	a0,a0,-910 # ffffffffc0208408 <commands+0x278>
ffffffffc020079e:	92fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007a2:	7c4c                	ld	a1,184(s0)
ffffffffc02007a4:	00008517          	auipc	a0,0x8
ffffffffc02007a8:	c7c50513          	addi	a0,a0,-900 # ffffffffc0208420 <commands+0x290>
ffffffffc02007ac:	921ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007b0:	606c                	ld	a1,192(s0)
ffffffffc02007b2:	00008517          	auipc	a0,0x8
ffffffffc02007b6:	c8650513          	addi	a0,a0,-890 # ffffffffc0208438 <commands+0x2a8>
ffffffffc02007ba:	913ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007be:	646c                	ld	a1,200(s0)
ffffffffc02007c0:	00008517          	auipc	a0,0x8
ffffffffc02007c4:	c9050513          	addi	a0,a0,-880 # ffffffffc0208450 <commands+0x2c0>
ffffffffc02007c8:	905ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007cc:	686c                	ld	a1,208(s0)
ffffffffc02007ce:	00008517          	auipc	a0,0x8
ffffffffc02007d2:	c9a50513          	addi	a0,a0,-870 # ffffffffc0208468 <commands+0x2d8>
ffffffffc02007d6:	8f7ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007da:	6c6c                	ld	a1,216(s0)
ffffffffc02007dc:	00008517          	auipc	a0,0x8
ffffffffc02007e0:	ca450513          	addi	a0,a0,-860 # ffffffffc0208480 <commands+0x2f0>
ffffffffc02007e4:	8e9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007e8:	706c                	ld	a1,224(s0)
ffffffffc02007ea:	00008517          	auipc	a0,0x8
ffffffffc02007ee:	cae50513          	addi	a0,a0,-850 # ffffffffc0208498 <commands+0x308>
ffffffffc02007f2:	8dbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007f6:	746c                	ld	a1,232(s0)
ffffffffc02007f8:	00008517          	auipc	a0,0x8
ffffffffc02007fc:	cb850513          	addi	a0,a0,-840 # ffffffffc02084b0 <commands+0x320>
ffffffffc0200800:	8cdff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200804:	786c                	ld	a1,240(s0)
ffffffffc0200806:	00008517          	auipc	a0,0x8
ffffffffc020080a:	cc250513          	addi	a0,a0,-830 # ffffffffc02084c8 <commands+0x338>
ffffffffc020080e:	8bfff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200812:	7c6c                	ld	a1,248(s0)
ffffffffc0200814:	6402                	ld	s0,0(sp)
ffffffffc0200816:	60a2                	ld	ra,8(sp)
ffffffffc0200818:	00008517          	auipc	a0,0x8
ffffffffc020081c:	cc850513          	addi	a0,a0,-824 # ffffffffc02084e0 <commands+0x350>
ffffffffc0200820:	0141                	addi	sp,sp,16
ffffffffc0200822:	8abff06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0200826 <print_trapframe>:
ffffffffc0200826:	1141                	addi	sp,sp,-16
ffffffffc0200828:	e022                	sd	s0,0(sp)
ffffffffc020082a:	85aa                	mv	a1,a0
ffffffffc020082c:	842a                	mv	s0,a0
ffffffffc020082e:	00008517          	auipc	a0,0x8
ffffffffc0200832:	cca50513          	addi	a0,a0,-822 # ffffffffc02084f8 <commands+0x368>
ffffffffc0200836:	e406                	sd	ra,8(sp)
ffffffffc0200838:	895ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020083c:	8522                	mv	a0,s0
ffffffffc020083e:	e1bff0ef          	jal	ra,ffffffffc0200658 <print_regs>
ffffffffc0200842:	10043583          	ld	a1,256(s0)
ffffffffc0200846:	00008517          	auipc	a0,0x8
ffffffffc020084a:	cca50513          	addi	a0,a0,-822 # ffffffffc0208510 <commands+0x380>
ffffffffc020084e:	87fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200852:	10843583          	ld	a1,264(s0)
ffffffffc0200856:	00008517          	auipc	a0,0x8
ffffffffc020085a:	cd250513          	addi	a0,a0,-814 # ffffffffc0208528 <commands+0x398>
ffffffffc020085e:	86fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200862:	11043583          	ld	a1,272(s0)
ffffffffc0200866:	00008517          	auipc	a0,0x8
ffffffffc020086a:	cda50513          	addi	a0,a0,-806 # ffffffffc0208540 <commands+0x3b0>
ffffffffc020086e:	85fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200872:	11843583          	ld	a1,280(s0)
ffffffffc0200876:	6402                	ld	s0,0(sp)
ffffffffc0200878:	60a2                	ld	ra,8(sp)
ffffffffc020087a:	00008517          	auipc	a0,0x8
ffffffffc020087e:	cd650513          	addi	a0,a0,-810 # ffffffffc0208550 <commands+0x3c0>
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
ffffffffc02008c6:	ca650513          	addi	a0,a0,-858 # ffffffffc0208568 <commands+0x3d8>
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
ffffffffc0200932:	c5a68693          	addi	a3,a3,-934 # ffffffffc0208588 <commands+0x3f8>
ffffffffc0200936:	00008617          	auipc	a2,0x8
ffffffffc020093a:	c6a60613          	addi	a2,a2,-918 # ffffffffc02085a0 <commands+0x410>
ffffffffc020093e:	06c00593          	li	a1,108
ffffffffc0200942:	00008517          	auipc	a0,0x8
ffffffffc0200946:	c7650513          	addi	a0,a0,-906 # ffffffffc02085b8 <commands+0x428>
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
ffffffffc020097c:	bf050513          	addi	a0,a0,-1040 # ffffffffc0208568 <commands+0x3d8>
ffffffffc0200980:	f4cff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200984:	00008617          	auipc	a2,0x8
ffffffffc0200988:	c4c60613          	addi	a2,a2,-948 # ffffffffc02085d0 <commands+0x440>
ffffffffc020098c:	07300593          	li	a1,115
ffffffffc0200990:	00008517          	auipc	a0,0x8
ffffffffc0200994:	c2850513          	addi	a0,a0,-984 # ffffffffc02085b8 <commands+0x428>
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
ffffffffc02009b4:	cd870713          	addi	a4,a4,-808 # ffffffffc0208688 <commands+0x4f8>
ffffffffc02009b8:	078a                	slli	a5,a5,0x2
ffffffffc02009ba:	97ba                	add	a5,a5,a4
ffffffffc02009bc:	439c                	lw	a5,0(a5)
ffffffffc02009be:	97ba                	add	a5,a5,a4
ffffffffc02009c0:	8782                	jr	a5
ffffffffc02009c2:	00008517          	auipc	a0,0x8
ffffffffc02009c6:	c8650513          	addi	a0,a0,-890 # ffffffffc0208648 <commands+0x4b8>
ffffffffc02009ca:	f02ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009ce:	00008517          	auipc	a0,0x8
ffffffffc02009d2:	c5a50513          	addi	a0,a0,-934 # ffffffffc0208628 <commands+0x498>
ffffffffc02009d6:	ef6ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009da:	00008517          	auipc	a0,0x8
ffffffffc02009de:	c0e50513          	addi	a0,a0,-1010 # ffffffffc02085e8 <commands+0x458>
ffffffffc02009e2:	eeaff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009e6:	00008517          	auipc	a0,0x8
ffffffffc02009ea:	c2250513          	addi	a0,a0,-990 # ffffffffc0208608 <commands+0x478>
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
ffffffffc0200a0c:	23e0406f          	j	ffffffffc0204c4a <run_timer_list>
ffffffffc0200a10:	00008517          	auipc	a0,0x8
ffffffffc0200a14:	c5850513          	addi	a0,a0,-936 # ffffffffc0208668 <commands+0x4d8>
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
ffffffffc0200a36:	e1e70713          	addi	a4,a4,-482 # ffffffffc0208850 <commands+0x6c0>
ffffffffc0200a3a:	078a                	slli	a5,a5,0x2
ffffffffc0200a3c:	97ba                	add	a5,a5,a4
ffffffffc0200a3e:	439c                	lw	a5,0(a5)
ffffffffc0200a40:	97ba                	add	a5,a5,a4
ffffffffc0200a42:	8782                	jr	a5
ffffffffc0200a44:	00008517          	auipc	a0,0x8
ffffffffc0200a48:	d6450513          	addi	a0,a0,-668 # ffffffffc02087a8 <commands+0x618>
ffffffffc0200a4c:	e80ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200a50:	10843783          	ld	a5,264(s0)
ffffffffc0200a54:	60e2                	ld	ra,24(sp)
ffffffffc0200a56:	64a2                	ld	s1,8(sp)
ffffffffc0200a58:	0791                	addi	a5,a5,4
ffffffffc0200a5a:	10f43423          	sd	a5,264(s0)
ffffffffc0200a5e:	6442                	ld	s0,16(sp)
ffffffffc0200a60:	6105                	addi	sp,sp,32
ffffffffc0200a62:	78b0606f          	j	ffffffffc02079ec <syscall>
ffffffffc0200a66:	00008517          	auipc	a0,0x8
ffffffffc0200a6a:	d6250513          	addi	a0,a0,-670 # ffffffffc02087c8 <commands+0x638>
ffffffffc0200a6e:	6442                	ld	s0,16(sp)
ffffffffc0200a70:	60e2                	ld	ra,24(sp)
ffffffffc0200a72:	64a2                	ld	s1,8(sp)
ffffffffc0200a74:	6105                	addi	sp,sp,32
ffffffffc0200a76:	e56ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc0200a7a:	00008517          	auipc	a0,0x8
ffffffffc0200a7e:	d6e50513          	addi	a0,a0,-658 # ffffffffc02087e8 <commands+0x658>
ffffffffc0200a82:	b7f5                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200a84:	00008517          	auipc	a0,0x8
ffffffffc0200a88:	d8450513          	addi	a0,a0,-636 # ffffffffc0208808 <commands+0x678>
ffffffffc0200a8c:	b7cd                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200a8e:	00008517          	auipc	a0,0x8
ffffffffc0200a92:	d9250513          	addi	a0,a0,-622 # ffffffffc0208820 <commands+0x690>
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
ffffffffc0200ab4:	d8850513          	addi	a0,a0,-632 # ffffffffc0208838 <commands+0x6a8>
ffffffffc0200ab8:	e14ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200abc:	8522                	mv	a0,s0
ffffffffc0200abe:	dcbff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200ac2:	84aa                	mv	s1,a0
ffffffffc0200ac4:	d16d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200ac6:	8522                	mv	a0,s0
ffffffffc0200ac8:	d5fff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200acc:	86a6                	mv	a3,s1
ffffffffc0200ace:	00008617          	auipc	a2,0x8
ffffffffc0200ad2:	c8a60613          	addi	a2,a2,-886 # ffffffffc0208758 <commands+0x5c8>
ffffffffc0200ad6:	0f600593          	li	a1,246
ffffffffc0200ada:	00008517          	auipc	a0,0x8
ffffffffc0200ade:	ade50513          	addi	a0,a0,-1314 # ffffffffc02085b8 <commands+0x428>
ffffffffc0200ae2:	f26ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200ae6:	00008517          	auipc	a0,0x8
ffffffffc0200aea:	bd250513          	addi	a0,a0,-1070 # ffffffffc02086b8 <commands+0x528>
ffffffffc0200aee:	b741                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200af0:	00008517          	auipc	a0,0x8
ffffffffc0200af4:	be850513          	addi	a0,a0,-1048 # ffffffffc02086d8 <commands+0x548>
ffffffffc0200af8:	bf9d                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200afa:	00008517          	auipc	a0,0x8
ffffffffc0200afe:	bfe50513          	addi	a0,a0,-1026 # ffffffffc02086f8 <commands+0x568>
ffffffffc0200b02:	b7b5                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200b04:	00008517          	auipc	a0,0x8
ffffffffc0200b08:	c0c50513          	addi	a0,a0,-1012 # ffffffffc0208710 <commands+0x580>
ffffffffc0200b0c:	dc0ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b10:	6458                	ld	a4,136(s0)
ffffffffc0200b12:	47a9                	li	a5,10
ffffffffc0200b14:	f8f719e3          	bne	a4,a5,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b18:	bf25                	j	ffffffffc0200a50 <exception_handler+0x32>
ffffffffc0200b1a:	00008517          	auipc	a0,0x8
ffffffffc0200b1e:	c0650513          	addi	a0,a0,-1018 # ffffffffc0208720 <commands+0x590>
ffffffffc0200b22:	b7b1                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200b24:	00008517          	auipc	a0,0x8
ffffffffc0200b28:	c1c50513          	addi	a0,a0,-996 # ffffffffc0208740 <commands+0x5b0>
ffffffffc0200b2c:	da0ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b30:	8522                	mv	a0,s0
ffffffffc0200b32:	d57ff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200b36:	84aa                	mv	s1,a0
ffffffffc0200b38:	d53d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b3a:	8522                	mv	a0,s0
ffffffffc0200b3c:	cebff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200b40:	86a6                	mv	a3,s1
ffffffffc0200b42:	00008617          	auipc	a2,0x8
ffffffffc0200b46:	c1660613          	addi	a2,a2,-1002 # ffffffffc0208758 <commands+0x5c8>
ffffffffc0200b4a:	0cb00593          	li	a1,203
ffffffffc0200b4e:	00008517          	auipc	a0,0x8
ffffffffc0200b52:	a6a50513          	addi	a0,a0,-1430 # ffffffffc02085b8 <commands+0x428>
ffffffffc0200b56:	eb2ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200b5a:	00008517          	auipc	a0,0x8
ffffffffc0200b5e:	c3650513          	addi	a0,a0,-970 # ffffffffc0208790 <commands+0x600>
ffffffffc0200b62:	d6aff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b66:	8522                	mv	a0,s0
ffffffffc0200b68:	d21ff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200b6c:	84aa                	mv	s1,a0
ffffffffc0200b6e:	dd05                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b70:	8522                	mv	a0,s0
ffffffffc0200b72:	cb5ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200b76:	86a6                	mv	a3,s1
ffffffffc0200b78:	00008617          	auipc	a2,0x8
ffffffffc0200b7c:	be060613          	addi	a2,a2,-1056 # ffffffffc0208758 <commands+0x5c8>
ffffffffc0200b80:	0d500593          	li	a1,213
ffffffffc0200b84:	00008517          	auipc	a0,0x8
ffffffffc0200b88:	a3450513          	addi	a0,a0,-1484 # ffffffffc02085b8 <commands+0x428>
ffffffffc0200b8c:	e7cff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200b90:	8522                	mv	a0,s0
ffffffffc0200b92:	6442                	ld	s0,16(sp)
ffffffffc0200b94:	60e2                	ld	ra,24(sp)
ffffffffc0200b96:	64a2                	ld	s1,8(sp)
ffffffffc0200b98:	6105                	addi	sp,sp,32
ffffffffc0200b9a:	b171                	j	ffffffffc0200826 <print_trapframe>
ffffffffc0200b9c:	00008617          	auipc	a2,0x8
ffffffffc0200ba0:	bdc60613          	addi	a2,a2,-1060 # ffffffffc0208778 <commands+0x5e8>
ffffffffc0200ba4:	0cf00593          	li	a1,207
ffffffffc0200ba8:	00008517          	auipc	a0,0x8
ffffffffc0200bac:	a1050513          	addi	a0,a0,-1520 # ffffffffc02085b8 <commands+0x428>
ffffffffc0200bb0:	e58ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200bb4:	8522                	mv	a0,s0
ffffffffc0200bb6:	c71ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200bba:	86a6                	mv	a3,s1
ffffffffc0200bbc:	00008617          	auipc	a2,0x8
ffffffffc0200bc0:	b9c60613          	addi	a2,a2,-1124 # ffffffffc0208758 <commands+0x5c8>
ffffffffc0200bc4:	0ef00593          	li	a1,239
ffffffffc0200bc8:	00008517          	auipc	a0,0x8
ffffffffc0200bcc:	9f050513          	addi	a0,a0,-1552 # ffffffffc02085b8 <commands+0x428>
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
ffffffffc0200c50:	5e90306f          	j	ffffffffc0204a38 <schedule>
ffffffffc0200c54:	555d                	li	a0,-9
ffffffffc0200c56:	068030ef          	jal	ra,ffffffffc0203cbe <do_exit>
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
ffffffffc0200d34:	b6068693          	addi	a3,a3,-1184 # ffffffffc0208890 <commands+0x700>
ffffffffc0200d38:	00008617          	auipc	a2,0x8
ffffffffc0200d3c:	86860613          	addi	a2,a2,-1944 # ffffffffc02085a0 <commands+0x410>
ffffffffc0200d40:	06d00593          	li	a1,109
ffffffffc0200d44:	00008517          	auipc	a0,0x8
ffffffffc0200d48:	b6c50513          	addi	a0,a0,-1172 # ffffffffc02088b0 <commands+0x720>
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
ffffffffc0200d8c:	54c020ef          	jal	ra,ffffffffc02032d8 <sem_init>
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
ffffffffc0200e54:	a7068693          	addi	a3,a3,-1424 # ffffffffc02088c0 <commands+0x730>
ffffffffc0200e58:	00007617          	auipc	a2,0x7
ffffffffc0200e5c:	74860613          	addi	a2,a2,1864 # ffffffffc02085a0 <commands+0x410>
ffffffffc0200e60:	07400593          	li	a1,116
ffffffffc0200e64:	00008517          	auipc	a0,0x8
ffffffffc0200e68:	a4c50513          	addi	a0,a0,-1460 # ffffffffc02088b0 <commands+0x720>
ffffffffc0200e6c:	b9cff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200e70:	00008697          	auipc	a3,0x8
ffffffffc0200e74:	a9068693          	addi	a3,a3,-1392 # ffffffffc0208900 <commands+0x770>
ffffffffc0200e78:	00007617          	auipc	a2,0x7
ffffffffc0200e7c:	72860613          	addi	a2,a2,1832 # ffffffffc02085a0 <commands+0x410>
ffffffffc0200e80:	06c00593          	li	a1,108
ffffffffc0200e84:	00008517          	auipc	a0,0x8
ffffffffc0200e88:	a2c50513          	addi	a0,a0,-1492 # ffffffffc02088b0 <commands+0x720>
ffffffffc0200e8c:	b7cff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200e90:	00008697          	auipc	a3,0x8
ffffffffc0200e94:	a5068693          	addi	a3,a3,-1456 # ffffffffc02088e0 <commands+0x750>
ffffffffc0200e98:	00007617          	auipc	a2,0x7
ffffffffc0200e9c:	70860613          	addi	a2,a2,1800 # ffffffffc02085a0 <commands+0x410>
ffffffffc0200ea0:	06b00593          	li	a1,107
ffffffffc0200ea4:	00008517          	auipc	a0,0x8
ffffffffc0200ea8:	a0c50513          	addi	a0,a0,-1524 # ffffffffc02088b0 <commands+0x720>
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
ffffffffc0200ee6:	a3e68693          	addi	a3,a3,-1474 # ffffffffc0208920 <commands+0x790>
ffffffffc0200eea:	00007617          	auipc	a2,0x7
ffffffffc0200eee:	6b660613          	addi	a2,a2,1718 # ffffffffc02085a0 <commands+0x410>
ffffffffc0200ef2:	09400593          	li	a1,148
ffffffffc0200ef6:	00008517          	auipc	a0,0x8
ffffffffc0200efa:	9ba50513          	addi	a0,a0,-1606 # ffffffffc02088b0 <commands+0x720>
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
ffffffffc0200f96:	9a668693          	addi	a3,a3,-1626 # ffffffffc0208938 <commands+0x7a8>
ffffffffc0200f9a:	00007617          	auipc	a2,0x7
ffffffffc0200f9e:	60660613          	addi	a2,a2,1542 # ffffffffc02085a0 <commands+0x410>
ffffffffc0200fa2:	0a700593          	li	a1,167
ffffffffc0200fa6:	00008517          	auipc	a0,0x8
ffffffffc0200faa:	90a50513          	addi	a0,a0,-1782 # ffffffffc02088b0 <commands+0x720>
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
ffffffffc0201030:	91c68693          	addi	a3,a3,-1764 # ffffffffc0208948 <commands+0x7b8>
ffffffffc0201034:	00007617          	auipc	a2,0x7
ffffffffc0201038:	56c60613          	addi	a2,a2,1388 # ffffffffc02085a0 <commands+0x410>
ffffffffc020103c:	0c000593          	li	a1,192
ffffffffc0201040:	00008517          	auipc	a0,0x8
ffffffffc0201044:	87050513          	addi	a0,a0,-1936 # ffffffffc02088b0 <commands+0x720>
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
ffffffffc02010a6:	8c668693          	addi	a3,a3,-1850 # ffffffffc0208968 <commands+0x7d8>
ffffffffc02010aa:	00007617          	auipc	a2,0x7
ffffffffc02010ae:	4f660613          	addi	a2,a2,1270 # ffffffffc02085a0 <commands+0x410>
ffffffffc02010b2:	0d600593          	li	a1,214
ffffffffc02010b6:	00007517          	auipc	a0,0x7
ffffffffc02010ba:	7fa50513          	addi	a0,a0,2042 # ffffffffc02088b0 <commands+0x720>
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
ffffffffc020115e:	8a650513          	addi	a0,a0,-1882 # ffffffffc0208a00 <commands+0x870>
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
ffffffffc0201188:	85450513          	addi	a0,a0,-1964 # ffffffffc02089d8 <commands+0x848>
ffffffffc020118c:	f41fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201190:	5971                	li	s2,-4
ffffffffc0201192:	bf55                	j	ffffffffc0201146 <do_pgfault+0x82>
ffffffffc0201194:	85a2                	mv	a1,s0
ffffffffc0201196:	00007517          	auipc	a0,0x7
ffffffffc020119a:	7f250513          	addi	a0,a0,2034 # ffffffffc0208988 <commands+0x7f8>
ffffffffc020119e:	f2ffe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02011a2:	5975                	li	s2,-3
ffffffffc02011a4:	b74d                	j	ffffffffc0201146 <do_pgfault+0x82>
ffffffffc02011a6:	00008517          	auipc	a0,0x8
ffffffffc02011aa:	87a50513          	addi	a0,a0,-1926 # ffffffffc0208a20 <commands+0x890>
ffffffffc02011ae:	f1ffe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02011b2:	5971                	li	s2,-4
ffffffffc02011b4:	bf49                	j	ffffffffc0201146 <do_pgfault+0x82>
ffffffffc02011b6:	00008517          	auipc	a0,0x8
ffffffffc02011ba:	80250513          	addi	a0,a0,-2046 # ffffffffc02089b8 <commands+0x828>
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
ffffffffc0201262:	284020ef          	jal	ra,ffffffffc02034e6 <swapfs_init>
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
ffffffffc02012a4:	00007517          	auipc	a0,0x7
ffffffffc02012a8:	7d450513          	addi	a0,a0,2004 # ffffffffc0208a78 <commands+0x8e8>
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
ffffffffc02012cc:	78060613          	addi	a2,a2,1920 # ffffffffc0208a48 <commands+0x8b8>
ffffffffc02012d0:	02800593          	li	a1,40
ffffffffc02012d4:	00007517          	auipc	a0,0x7
ffffffffc02012d8:	79450513          	addi	a0,a0,1940 # ffffffffc0208a68 <commands+0x8d8>
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
ffffffffc0201328:	7ccb0b13          	addi	s6,s6,1996 # ffffffffc0208af0 <commands+0x960>
ffffffffc020132c:	00007b97          	auipc	s7,0x7
ffffffffc0201330:	7acb8b93          	addi	s7,s7,1964 # ffffffffc0208ad8 <commands+0x948>
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
ffffffffc02013a0:	20c020ef          	jal	ra,ffffffffc02035ac <swapfs_write>
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
ffffffffc02013e2:	6b250513          	addi	a0,a0,1714 # ffffffffc0208a90 <commands+0x900>
ffffffffc02013e6:	ce7fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02013ea:	bfe1                	j	ffffffffc02013c2 <swap_out+0xc6>
ffffffffc02013ec:	4401                	li	s0,0
ffffffffc02013ee:	bfd1                	j	ffffffffc02013c2 <swap_out+0xc6>
ffffffffc02013f0:	00007697          	auipc	a3,0x7
ffffffffc02013f4:	6d068693          	addi	a3,a3,1744 # ffffffffc0208ac0 <commands+0x930>
ffffffffc02013f8:	00007617          	auipc	a2,0x7
ffffffffc02013fc:	1a860613          	addi	a2,a2,424 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201400:	06800593          	li	a1,104
ffffffffc0201404:	00007517          	auipc	a0,0x7
ffffffffc0201408:	66450513          	addi	a0,a0,1636 # ffffffffc0208a68 <commands+0x8d8>
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
ffffffffc020143e:	0e0020ef          	jal	ra,ffffffffc020351e <swapfs_read>
ffffffffc0201442:	00093583          	ld	a1,0(s2)
ffffffffc0201446:	8626                	mv	a2,s1
ffffffffc0201448:	00007517          	auipc	a0,0x7
ffffffffc020144c:	6f850513          	addi	a0,a0,1784 # ffffffffc0208b40 <commands+0x9b0>
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
ffffffffc020146e:	6c668693          	addi	a3,a3,1734 # ffffffffc0208b30 <commands+0x9a0>
ffffffffc0201472:	00007617          	auipc	a2,0x7
ffffffffc0201476:	12e60613          	addi	a2,a2,302 # ffffffffc02085a0 <commands+0x410>
ffffffffc020147a:	07e00593          	li	a1,126
ffffffffc020147e:	00007517          	auipc	a0,0x7
ffffffffc0201482:	5ea50513          	addi	a0,a0,1514 # ffffffffc0208a68 <commands+0x8d8>
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
ffffffffc020154c:	ff86b683          	ld	a3,-8(a3) # ffffffffc020a540 <nbase>
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
ffffffffc020157c:	60860613          	addi	a2,a2,1544 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc0201580:	06900593          	li	a1,105
ffffffffc0201584:	00007517          	auipc	a0,0x7
ffffffffc0201588:	62450513          	addi	a0,a0,1572 # ffffffffc0208ba8 <commands+0xa18>
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
ffffffffc020166a:	55268693          	addi	a3,a3,1362 # ffffffffc0208bb8 <commands+0xa28>
ffffffffc020166e:	00007617          	auipc	a2,0x7
ffffffffc0201672:	f3260613          	addi	a2,a2,-206 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201676:	06400593          	li	a1,100
ffffffffc020167a:	00007517          	auipc	a0,0x7
ffffffffc020167e:	55e50513          	addi	a0,a0,1374 # ffffffffc0208bd8 <commands+0xa48>
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
ffffffffc02017a4:	da053503          	ld	a0,-608(a0) # ffffffffc020a540 <nbase>
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
ffffffffc0201802:	41a60613          	addi	a2,a2,1050 # ffffffffc0208c18 <commands+0xa88>
ffffffffc0201806:	06200593          	li	a1,98
ffffffffc020180a:	00007517          	auipc	a0,0x7
ffffffffc020180e:	39e50513          	addi	a0,a0,926 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0201812:	9f7fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201816:	86a2                	mv	a3,s0
ffffffffc0201818:	00007617          	auipc	a2,0x7
ffffffffc020181c:	3d860613          	addi	a2,a2,984 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc0201820:	06e00593          	li	a1,110
ffffffffc0201824:	00007517          	auipc	a0,0x7
ffffffffc0201828:	38450513          	addi	a0,a0,900 # ffffffffc0208ba8 <commands+0xa18>
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
ffffffffc0201858:	3e450513          	addi	a0,a0,996 # ffffffffc0208c38 <commands+0xaa8>
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
ffffffffc020188e:	3fe50513          	addi	a0,a0,1022 # ffffffffc0208c88 <commands+0xaf8>
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
ffffffffc02018b2:	40250513          	addi	a0,a0,1026 # ffffffffc0208cb0 <commands+0xb20>
ffffffffc02018b6:	6b91                	lui	s7,0x4
ffffffffc02018b8:	4c35                	li	s8,13
ffffffffc02018ba:	813fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02018be:	018b8023          	sb	s8,0(s7) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc02018c2:	00042903          	lw	s2,0(s0)
ffffffffc02018c6:	2901                	sext.w	s2,s2
ffffffffc02018c8:	26991d63          	bne	s2,s1,ffffffffc0201b42 <_fifo_check_swap+0x2f4>
ffffffffc02018cc:	00007517          	auipc	a0,0x7
ffffffffc02018d0:	40c50513          	addi	a0,a0,1036 # ffffffffc0208cd8 <commands+0xb48>
ffffffffc02018d4:	6c89                	lui	s9,0x2
ffffffffc02018d6:	4d2d                	li	s10,11
ffffffffc02018d8:	ff4fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02018dc:	01ac8023          	sb	s10,0(s9) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc02018e0:	401c                	lw	a5,0(s0)
ffffffffc02018e2:	2781                	sext.w	a5,a5
ffffffffc02018e4:	23279f63          	bne	a5,s2,ffffffffc0201b22 <_fifo_check_swap+0x2d4>
ffffffffc02018e8:	00007517          	auipc	a0,0x7
ffffffffc02018ec:	41850513          	addi	a0,a0,1048 # ffffffffc0208d00 <commands+0xb70>
ffffffffc02018f0:	fdcfe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02018f4:	6795                	lui	a5,0x5
ffffffffc02018f6:	4739                	li	a4,14
ffffffffc02018f8:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc02018fc:	4004                	lw	s1,0(s0)
ffffffffc02018fe:	4795                	li	a5,5
ffffffffc0201900:	2481                	sext.w	s1,s1
ffffffffc0201902:	20f49063          	bne	s1,a5,ffffffffc0201b02 <_fifo_check_swap+0x2b4>
ffffffffc0201906:	00007517          	auipc	a0,0x7
ffffffffc020190a:	3d250513          	addi	a0,a0,978 # ffffffffc0208cd8 <commands+0xb48>
ffffffffc020190e:	fbefe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201912:	01ac8023          	sb	s10,0(s9)
ffffffffc0201916:	401c                	lw	a5,0(s0)
ffffffffc0201918:	2781                	sext.w	a5,a5
ffffffffc020191a:	1c979463          	bne	a5,s1,ffffffffc0201ae2 <_fifo_check_swap+0x294>
ffffffffc020191e:	00007517          	auipc	a0,0x7
ffffffffc0201922:	36a50513          	addi	a0,a0,874 # ffffffffc0208c88 <commands+0xaf8>
ffffffffc0201926:	fa6fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020192a:	016a8023          	sb	s6,0(s5)
ffffffffc020192e:	401c                	lw	a5,0(s0)
ffffffffc0201930:	4719                	li	a4,6
ffffffffc0201932:	2781                	sext.w	a5,a5
ffffffffc0201934:	18e79763          	bne	a5,a4,ffffffffc0201ac2 <_fifo_check_swap+0x274>
ffffffffc0201938:	00007517          	auipc	a0,0x7
ffffffffc020193c:	3a050513          	addi	a0,a0,928 # ffffffffc0208cd8 <commands+0xb48>
ffffffffc0201940:	f8cfe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201944:	01ac8023          	sb	s10,0(s9)
ffffffffc0201948:	401c                	lw	a5,0(s0)
ffffffffc020194a:	471d                	li	a4,7
ffffffffc020194c:	2781                	sext.w	a5,a5
ffffffffc020194e:	14e79a63          	bne	a5,a4,ffffffffc0201aa2 <_fifo_check_swap+0x254>
ffffffffc0201952:	00007517          	auipc	a0,0x7
ffffffffc0201956:	2e650513          	addi	a0,a0,742 # ffffffffc0208c38 <commands+0xaa8>
ffffffffc020195a:	f72fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020195e:	01498023          	sb	s4,0(s3)
ffffffffc0201962:	401c                	lw	a5,0(s0)
ffffffffc0201964:	4721                	li	a4,8
ffffffffc0201966:	2781                	sext.w	a5,a5
ffffffffc0201968:	10e79d63          	bne	a5,a4,ffffffffc0201a82 <_fifo_check_swap+0x234>
ffffffffc020196c:	00007517          	auipc	a0,0x7
ffffffffc0201970:	34450513          	addi	a0,a0,836 # ffffffffc0208cb0 <commands+0xb20>
ffffffffc0201974:	f58fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201978:	018b8023          	sb	s8,0(s7)
ffffffffc020197c:	401c                	lw	a5,0(s0)
ffffffffc020197e:	4725                	li	a4,9
ffffffffc0201980:	2781                	sext.w	a5,a5
ffffffffc0201982:	0ee79063          	bne	a5,a4,ffffffffc0201a62 <_fifo_check_swap+0x214>
ffffffffc0201986:	00007517          	auipc	a0,0x7
ffffffffc020198a:	37a50513          	addi	a0,a0,890 # ffffffffc0208d00 <commands+0xb70>
ffffffffc020198e:	f3efe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201992:	6795                	lui	a5,0x5
ffffffffc0201994:	4739                	li	a4,14
ffffffffc0201996:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc020199a:	4004                	lw	s1,0(s0)
ffffffffc020199c:	47a9                	li	a5,10
ffffffffc020199e:	2481                	sext.w	s1,s1
ffffffffc02019a0:	0af49163          	bne	s1,a5,ffffffffc0201a42 <_fifo_check_swap+0x1f4>
ffffffffc02019a4:	00007517          	auipc	a0,0x7
ffffffffc02019a8:	2e450513          	addi	a0,a0,740 # ffffffffc0208c88 <commands+0xaf8>
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
ffffffffc02019e6:	27e68693          	addi	a3,a3,638 # ffffffffc0208c60 <commands+0xad0>
ffffffffc02019ea:	00007617          	auipc	a2,0x7
ffffffffc02019ee:	bb660613          	addi	a2,a2,-1098 # ffffffffc02085a0 <commands+0x410>
ffffffffc02019f2:	05100593          	li	a1,81
ffffffffc02019f6:	00007517          	auipc	a0,0x7
ffffffffc02019fa:	27a50513          	addi	a0,a0,634 # ffffffffc0208c70 <commands+0xae0>
ffffffffc02019fe:	80bfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a02:	00007697          	auipc	a3,0x7
ffffffffc0201a06:	3ae68693          	addi	a3,a3,942 # ffffffffc0208db0 <commands+0xc20>
ffffffffc0201a0a:	00007617          	auipc	a2,0x7
ffffffffc0201a0e:	b9660613          	addi	a2,a2,-1130 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201a12:	07300593          	li	a1,115
ffffffffc0201a16:	00007517          	auipc	a0,0x7
ffffffffc0201a1a:	25a50513          	addi	a0,a0,602 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201a1e:	feafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a22:	00007697          	auipc	a3,0x7
ffffffffc0201a26:	36668693          	addi	a3,a3,870 # ffffffffc0208d88 <commands+0xbf8>
ffffffffc0201a2a:	00007617          	auipc	a2,0x7
ffffffffc0201a2e:	b7660613          	addi	a2,a2,-1162 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201a32:	07100593          	li	a1,113
ffffffffc0201a36:	00007517          	auipc	a0,0x7
ffffffffc0201a3a:	23a50513          	addi	a0,a0,570 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201a3e:	fcafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a42:	00007697          	auipc	a3,0x7
ffffffffc0201a46:	33668693          	addi	a3,a3,822 # ffffffffc0208d78 <commands+0xbe8>
ffffffffc0201a4a:	00007617          	auipc	a2,0x7
ffffffffc0201a4e:	b5660613          	addi	a2,a2,-1194 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201a52:	06f00593          	li	a1,111
ffffffffc0201a56:	00007517          	auipc	a0,0x7
ffffffffc0201a5a:	21a50513          	addi	a0,a0,538 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201a5e:	faafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a62:	00007697          	auipc	a3,0x7
ffffffffc0201a66:	30668693          	addi	a3,a3,774 # ffffffffc0208d68 <commands+0xbd8>
ffffffffc0201a6a:	00007617          	auipc	a2,0x7
ffffffffc0201a6e:	b3660613          	addi	a2,a2,-1226 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201a72:	06c00593          	li	a1,108
ffffffffc0201a76:	00007517          	auipc	a0,0x7
ffffffffc0201a7a:	1fa50513          	addi	a0,a0,506 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201a7e:	f8afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201a82:	00007697          	auipc	a3,0x7
ffffffffc0201a86:	2d668693          	addi	a3,a3,726 # ffffffffc0208d58 <commands+0xbc8>
ffffffffc0201a8a:	00007617          	auipc	a2,0x7
ffffffffc0201a8e:	b1660613          	addi	a2,a2,-1258 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201a92:	06900593          	li	a1,105
ffffffffc0201a96:	00007517          	auipc	a0,0x7
ffffffffc0201a9a:	1da50513          	addi	a0,a0,474 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201a9e:	f6afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201aa2:	00007697          	auipc	a3,0x7
ffffffffc0201aa6:	2a668693          	addi	a3,a3,678 # ffffffffc0208d48 <commands+0xbb8>
ffffffffc0201aaa:	00007617          	auipc	a2,0x7
ffffffffc0201aae:	af660613          	addi	a2,a2,-1290 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201ab2:	06600593          	li	a1,102
ffffffffc0201ab6:	00007517          	auipc	a0,0x7
ffffffffc0201aba:	1ba50513          	addi	a0,a0,442 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201abe:	f4afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201ac2:	00007697          	auipc	a3,0x7
ffffffffc0201ac6:	27668693          	addi	a3,a3,630 # ffffffffc0208d38 <commands+0xba8>
ffffffffc0201aca:	00007617          	auipc	a2,0x7
ffffffffc0201ace:	ad660613          	addi	a2,a2,-1322 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201ad2:	06300593          	li	a1,99
ffffffffc0201ad6:	00007517          	auipc	a0,0x7
ffffffffc0201ada:	19a50513          	addi	a0,a0,410 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201ade:	f2afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201ae2:	00007697          	auipc	a3,0x7
ffffffffc0201ae6:	24668693          	addi	a3,a3,582 # ffffffffc0208d28 <commands+0xb98>
ffffffffc0201aea:	00007617          	auipc	a2,0x7
ffffffffc0201aee:	ab660613          	addi	a2,a2,-1354 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201af2:	06000593          	li	a1,96
ffffffffc0201af6:	00007517          	auipc	a0,0x7
ffffffffc0201afa:	17a50513          	addi	a0,a0,378 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201afe:	f0afe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201b02:	00007697          	auipc	a3,0x7
ffffffffc0201b06:	22668693          	addi	a3,a3,550 # ffffffffc0208d28 <commands+0xb98>
ffffffffc0201b0a:	00007617          	auipc	a2,0x7
ffffffffc0201b0e:	a9660613          	addi	a2,a2,-1386 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201b12:	05d00593          	li	a1,93
ffffffffc0201b16:	00007517          	auipc	a0,0x7
ffffffffc0201b1a:	15a50513          	addi	a0,a0,346 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201b1e:	eeafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201b22:	00007697          	auipc	a3,0x7
ffffffffc0201b26:	13e68693          	addi	a3,a3,318 # ffffffffc0208c60 <commands+0xad0>
ffffffffc0201b2a:	00007617          	auipc	a2,0x7
ffffffffc0201b2e:	a7660613          	addi	a2,a2,-1418 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201b32:	05a00593          	li	a1,90
ffffffffc0201b36:	00007517          	auipc	a0,0x7
ffffffffc0201b3a:	13a50513          	addi	a0,a0,314 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201b3e:	ecafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201b42:	00007697          	auipc	a3,0x7
ffffffffc0201b46:	11e68693          	addi	a3,a3,286 # ffffffffc0208c60 <commands+0xad0>
ffffffffc0201b4a:	00007617          	auipc	a2,0x7
ffffffffc0201b4e:	a5660613          	addi	a2,a2,-1450 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201b52:	05700593          	li	a1,87
ffffffffc0201b56:	00007517          	auipc	a0,0x7
ffffffffc0201b5a:	11a50513          	addi	a0,a0,282 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201b5e:	eaafe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201b62:	00007697          	auipc	a3,0x7
ffffffffc0201b66:	0fe68693          	addi	a3,a3,254 # ffffffffc0208c60 <commands+0xad0>
ffffffffc0201b6a:	00007617          	auipc	a2,0x7
ffffffffc0201b6e:	a3660613          	addi	a2,a2,-1482 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201b72:	05400593          	li	a1,84
ffffffffc0201b76:	00007517          	auipc	a0,0x7
ffffffffc0201b7a:	0fa50513          	addi	a0,a0,250 # ffffffffc0208c70 <commands+0xae0>
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
ffffffffc0201ba8:	21c68693          	addi	a3,a3,540 # ffffffffc0208dc0 <commands+0xc30>
ffffffffc0201bac:	00007617          	auipc	a2,0x7
ffffffffc0201bb0:	9f460613          	addi	a2,a2,-1548 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201bb4:	04100593          	li	a1,65
ffffffffc0201bb8:	00007517          	auipc	a0,0x7
ffffffffc0201bbc:	0b850513          	addi	a0,a0,184 # ffffffffc0208c70 <commands+0xae0>
ffffffffc0201bc0:	e48fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201bc4:	00007697          	auipc	a3,0x7
ffffffffc0201bc8:	20c68693          	addi	a3,a3,524 # ffffffffc0208dd0 <commands+0xc40>
ffffffffc0201bcc:	00007617          	auipc	a2,0x7
ffffffffc0201bd0:	9d460613          	addi	a2,a2,-1580 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201bd4:	04200593          	li	a1,66
ffffffffc0201bd8:	00007517          	auipc	a0,0x7
ffffffffc0201bdc:	09850513          	addi	a0,a0,152 # ffffffffc0208c70 <commands+0xae0>
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
ffffffffc0201c00:	1e468693          	addi	a3,a3,484 # ffffffffc0208de0 <commands+0xc50>
ffffffffc0201c04:	00007617          	auipc	a2,0x7
ffffffffc0201c08:	99c60613          	addi	a2,a2,-1636 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201c0c:	03200593          	li	a1,50
ffffffffc0201c10:	00007517          	auipc	a0,0x7
ffffffffc0201c14:	06050513          	addi	a0,a0,96 # ffffffffc0208c70 <commands+0xae0>
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
ffffffffc0201cda:	86a63603          	ld	a2,-1942(a2) # ffffffffc020a540 <nbase>
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
ffffffffc0201f20:	efc68693          	addi	a3,a3,-260 # ffffffffc0208e18 <commands+0xc88>
ffffffffc0201f24:	00006617          	auipc	a2,0x6
ffffffffc0201f28:	67c60613          	addi	a2,a2,1660 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201f2c:	0f000593          	li	a1,240
ffffffffc0201f30:	00007517          	auipc	a0,0x7
ffffffffc0201f34:	ef850513          	addi	a0,a0,-264 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0201f38:	ad0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201f3c:	00007697          	auipc	a3,0x7
ffffffffc0201f40:	f8468693          	addi	a3,a3,-124 # ffffffffc0208ec0 <commands+0xd30>
ffffffffc0201f44:	00006617          	auipc	a2,0x6
ffffffffc0201f48:	65c60613          	addi	a2,a2,1628 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201f4c:	0bd00593          	li	a1,189
ffffffffc0201f50:	00007517          	auipc	a0,0x7
ffffffffc0201f54:	ed850513          	addi	a0,a0,-296 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0201f58:	ab0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201f5c:	00007697          	auipc	a3,0x7
ffffffffc0201f60:	f8c68693          	addi	a3,a3,-116 # ffffffffc0208ee8 <commands+0xd58>
ffffffffc0201f64:	00006617          	auipc	a2,0x6
ffffffffc0201f68:	63c60613          	addi	a2,a2,1596 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201f6c:	0be00593          	li	a1,190
ffffffffc0201f70:	00007517          	auipc	a0,0x7
ffffffffc0201f74:	eb850513          	addi	a0,a0,-328 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0201f78:	a90fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201f7c:	00007697          	auipc	a3,0x7
ffffffffc0201f80:	fac68693          	addi	a3,a3,-84 # ffffffffc0208f28 <commands+0xd98>
ffffffffc0201f84:	00006617          	auipc	a2,0x6
ffffffffc0201f88:	61c60613          	addi	a2,a2,1564 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201f8c:	0c000593          	li	a1,192
ffffffffc0201f90:	00007517          	auipc	a0,0x7
ffffffffc0201f94:	e9850513          	addi	a0,a0,-360 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0201f98:	a70fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201f9c:	00007697          	auipc	a3,0x7
ffffffffc0201fa0:	01468693          	addi	a3,a3,20 # ffffffffc0208fb0 <commands+0xe20>
ffffffffc0201fa4:	00006617          	auipc	a2,0x6
ffffffffc0201fa8:	5fc60613          	addi	a2,a2,1532 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201fac:	0d900593          	li	a1,217
ffffffffc0201fb0:	00007517          	auipc	a0,0x7
ffffffffc0201fb4:	e7850513          	addi	a0,a0,-392 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0201fb8:	a50fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201fbc:	00007697          	auipc	a3,0x7
ffffffffc0201fc0:	ea468693          	addi	a3,a3,-348 # ffffffffc0208e60 <commands+0xcd0>
ffffffffc0201fc4:	00006617          	auipc	a2,0x6
ffffffffc0201fc8:	5dc60613          	addi	a2,a2,1500 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201fcc:	0d200593          	li	a1,210
ffffffffc0201fd0:	00007517          	auipc	a0,0x7
ffffffffc0201fd4:	e5850513          	addi	a0,a0,-424 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0201fd8:	a30fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201fdc:	00007697          	auipc	a3,0x7
ffffffffc0201fe0:	fc468693          	addi	a3,a3,-60 # ffffffffc0208fa0 <commands+0xe10>
ffffffffc0201fe4:	00006617          	auipc	a2,0x6
ffffffffc0201fe8:	5bc60613          	addi	a2,a2,1468 # ffffffffc02085a0 <commands+0x410>
ffffffffc0201fec:	0d000593          	li	a1,208
ffffffffc0201ff0:	00007517          	auipc	a0,0x7
ffffffffc0201ff4:	e3850513          	addi	a0,a0,-456 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0201ff8:	a10fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201ffc:	00007697          	auipc	a3,0x7
ffffffffc0202000:	f8c68693          	addi	a3,a3,-116 # ffffffffc0208f88 <commands+0xdf8>
ffffffffc0202004:	00006617          	auipc	a2,0x6
ffffffffc0202008:	59c60613          	addi	a2,a2,1436 # ffffffffc02085a0 <commands+0x410>
ffffffffc020200c:	0cb00593          	li	a1,203
ffffffffc0202010:	00007517          	auipc	a0,0x7
ffffffffc0202014:	e1850513          	addi	a0,a0,-488 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202018:	9f0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020201c:	00007697          	auipc	a3,0x7
ffffffffc0202020:	f4c68693          	addi	a3,a3,-180 # ffffffffc0208f68 <commands+0xdd8>
ffffffffc0202024:	00006617          	auipc	a2,0x6
ffffffffc0202028:	57c60613          	addi	a2,a2,1404 # ffffffffc02085a0 <commands+0x410>
ffffffffc020202c:	0c200593          	li	a1,194
ffffffffc0202030:	00007517          	auipc	a0,0x7
ffffffffc0202034:	df850513          	addi	a0,a0,-520 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202038:	9d0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020203c:	00007697          	auipc	a3,0x7
ffffffffc0202040:	fbc68693          	addi	a3,a3,-68 # ffffffffc0208ff8 <commands+0xe68>
ffffffffc0202044:	00006617          	auipc	a2,0x6
ffffffffc0202048:	55c60613          	addi	a2,a2,1372 # ffffffffc02085a0 <commands+0x410>
ffffffffc020204c:	0f800593          	li	a1,248
ffffffffc0202050:	00007517          	auipc	a0,0x7
ffffffffc0202054:	dd850513          	addi	a0,a0,-552 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202058:	9b0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020205c:	00007697          	auipc	a3,0x7
ffffffffc0202060:	f8c68693          	addi	a3,a3,-116 # ffffffffc0208fe8 <commands+0xe58>
ffffffffc0202064:	00006617          	auipc	a2,0x6
ffffffffc0202068:	53c60613          	addi	a2,a2,1340 # ffffffffc02085a0 <commands+0x410>
ffffffffc020206c:	0df00593          	li	a1,223
ffffffffc0202070:	00007517          	auipc	a0,0x7
ffffffffc0202074:	db850513          	addi	a0,a0,-584 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202078:	990fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020207c:	00007697          	auipc	a3,0x7
ffffffffc0202080:	f0c68693          	addi	a3,a3,-244 # ffffffffc0208f88 <commands+0xdf8>
ffffffffc0202084:	00006617          	auipc	a2,0x6
ffffffffc0202088:	51c60613          	addi	a2,a2,1308 # ffffffffc02085a0 <commands+0x410>
ffffffffc020208c:	0dd00593          	li	a1,221
ffffffffc0202090:	00007517          	auipc	a0,0x7
ffffffffc0202094:	d9850513          	addi	a0,a0,-616 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202098:	970fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020209c:	00007697          	auipc	a3,0x7
ffffffffc02020a0:	f2c68693          	addi	a3,a3,-212 # ffffffffc0208fc8 <commands+0xe38>
ffffffffc02020a4:	00006617          	auipc	a2,0x6
ffffffffc02020a8:	4fc60613          	addi	a2,a2,1276 # ffffffffc02085a0 <commands+0x410>
ffffffffc02020ac:	0dc00593          	li	a1,220
ffffffffc02020b0:	00007517          	auipc	a0,0x7
ffffffffc02020b4:	d7850513          	addi	a0,a0,-648 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02020b8:	950fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02020bc:	00007697          	auipc	a3,0x7
ffffffffc02020c0:	da468693          	addi	a3,a3,-604 # ffffffffc0208e60 <commands+0xcd0>
ffffffffc02020c4:	00006617          	auipc	a2,0x6
ffffffffc02020c8:	4dc60613          	addi	a2,a2,1244 # ffffffffc02085a0 <commands+0x410>
ffffffffc02020cc:	0b900593          	li	a1,185
ffffffffc02020d0:	00007517          	auipc	a0,0x7
ffffffffc02020d4:	d5850513          	addi	a0,a0,-680 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02020d8:	930fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02020dc:	00007697          	auipc	a3,0x7
ffffffffc02020e0:	eac68693          	addi	a3,a3,-340 # ffffffffc0208f88 <commands+0xdf8>
ffffffffc02020e4:	00006617          	auipc	a2,0x6
ffffffffc02020e8:	4bc60613          	addi	a2,a2,1212 # ffffffffc02085a0 <commands+0x410>
ffffffffc02020ec:	0d600593          	li	a1,214
ffffffffc02020f0:	00007517          	auipc	a0,0x7
ffffffffc02020f4:	d3850513          	addi	a0,a0,-712 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02020f8:	910fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02020fc:	00007697          	auipc	a3,0x7
ffffffffc0202100:	da468693          	addi	a3,a3,-604 # ffffffffc0208ea0 <commands+0xd10>
ffffffffc0202104:	00006617          	auipc	a2,0x6
ffffffffc0202108:	49c60613          	addi	a2,a2,1180 # ffffffffc02085a0 <commands+0x410>
ffffffffc020210c:	0d400593          	li	a1,212
ffffffffc0202110:	00007517          	auipc	a0,0x7
ffffffffc0202114:	d1850513          	addi	a0,a0,-744 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202118:	8f0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020211c:	00007697          	auipc	a3,0x7
ffffffffc0202120:	d6468693          	addi	a3,a3,-668 # ffffffffc0208e80 <commands+0xcf0>
ffffffffc0202124:	00006617          	auipc	a2,0x6
ffffffffc0202128:	47c60613          	addi	a2,a2,1148 # ffffffffc02085a0 <commands+0x410>
ffffffffc020212c:	0d300593          	li	a1,211
ffffffffc0202130:	00007517          	auipc	a0,0x7
ffffffffc0202134:	cf850513          	addi	a0,a0,-776 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202138:	8d0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020213c:	00007697          	auipc	a3,0x7
ffffffffc0202140:	d6468693          	addi	a3,a3,-668 # ffffffffc0208ea0 <commands+0xd10>
ffffffffc0202144:	00006617          	auipc	a2,0x6
ffffffffc0202148:	45c60613          	addi	a2,a2,1116 # ffffffffc02085a0 <commands+0x410>
ffffffffc020214c:	0bb00593          	li	a1,187
ffffffffc0202150:	00007517          	auipc	a0,0x7
ffffffffc0202154:	cd850513          	addi	a0,a0,-808 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202158:	8b0fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020215c:	00007697          	auipc	a3,0x7
ffffffffc0202160:	fec68693          	addi	a3,a3,-20 # ffffffffc0209148 <commands+0xfb8>
ffffffffc0202164:	00006617          	auipc	a2,0x6
ffffffffc0202168:	43c60613          	addi	a2,a2,1084 # ffffffffc02085a0 <commands+0x410>
ffffffffc020216c:	12500593          	li	a1,293
ffffffffc0202170:	00007517          	auipc	a0,0x7
ffffffffc0202174:	cb850513          	addi	a0,a0,-840 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202178:	890fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020217c:	00007697          	auipc	a3,0x7
ffffffffc0202180:	e6c68693          	addi	a3,a3,-404 # ffffffffc0208fe8 <commands+0xe58>
ffffffffc0202184:	00006617          	auipc	a2,0x6
ffffffffc0202188:	41c60613          	addi	a2,a2,1052 # ffffffffc02085a0 <commands+0x410>
ffffffffc020218c:	11a00593          	li	a1,282
ffffffffc0202190:	00007517          	auipc	a0,0x7
ffffffffc0202194:	c9850513          	addi	a0,a0,-872 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202198:	870fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020219c:	00007697          	auipc	a3,0x7
ffffffffc02021a0:	dec68693          	addi	a3,a3,-532 # ffffffffc0208f88 <commands+0xdf8>
ffffffffc02021a4:	00006617          	auipc	a2,0x6
ffffffffc02021a8:	3fc60613          	addi	a2,a2,1020 # ffffffffc02085a0 <commands+0x410>
ffffffffc02021ac:	11800593          	li	a1,280
ffffffffc02021b0:	00007517          	auipc	a0,0x7
ffffffffc02021b4:	c7850513          	addi	a0,a0,-904 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02021b8:	850fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02021bc:	00007697          	auipc	a3,0x7
ffffffffc02021c0:	d8c68693          	addi	a3,a3,-628 # ffffffffc0208f48 <commands+0xdb8>
ffffffffc02021c4:	00006617          	auipc	a2,0x6
ffffffffc02021c8:	3dc60613          	addi	a2,a2,988 # ffffffffc02085a0 <commands+0x410>
ffffffffc02021cc:	0c100593          	li	a1,193
ffffffffc02021d0:	00007517          	auipc	a0,0x7
ffffffffc02021d4:	c5850513          	addi	a0,a0,-936 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02021d8:	830fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02021dc:	00007697          	auipc	a3,0x7
ffffffffc02021e0:	f2c68693          	addi	a3,a3,-212 # ffffffffc0209108 <commands+0xf78>
ffffffffc02021e4:	00006617          	auipc	a2,0x6
ffffffffc02021e8:	3bc60613          	addi	a2,a2,956 # ffffffffc02085a0 <commands+0x410>
ffffffffc02021ec:	11200593          	li	a1,274
ffffffffc02021f0:	00007517          	auipc	a0,0x7
ffffffffc02021f4:	c3850513          	addi	a0,a0,-968 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02021f8:	810fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02021fc:	00007697          	auipc	a3,0x7
ffffffffc0202200:	eec68693          	addi	a3,a3,-276 # ffffffffc02090e8 <commands+0xf58>
ffffffffc0202204:	00006617          	auipc	a2,0x6
ffffffffc0202208:	39c60613          	addi	a2,a2,924 # ffffffffc02085a0 <commands+0x410>
ffffffffc020220c:	11000593          	li	a1,272
ffffffffc0202210:	00007517          	auipc	a0,0x7
ffffffffc0202214:	c1850513          	addi	a0,a0,-1000 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202218:	ff1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020221c:	00007697          	auipc	a3,0x7
ffffffffc0202220:	ea468693          	addi	a3,a3,-348 # ffffffffc02090c0 <commands+0xf30>
ffffffffc0202224:	00006617          	auipc	a2,0x6
ffffffffc0202228:	37c60613          	addi	a2,a2,892 # ffffffffc02085a0 <commands+0x410>
ffffffffc020222c:	10e00593          	li	a1,270
ffffffffc0202230:	00007517          	auipc	a0,0x7
ffffffffc0202234:	bf850513          	addi	a0,a0,-1032 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202238:	fd1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020223c:	00007697          	auipc	a3,0x7
ffffffffc0202240:	e5c68693          	addi	a3,a3,-420 # ffffffffc0209098 <commands+0xf08>
ffffffffc0202244:	00006617          	auipc	a2,0x6
ffffffffc0202248:	35c60613          	addi	a2,a2,860 # ffffffffc02085a0 <commands+0x410>
ffffffffc020224c:	10d00593          	li	a1,269
ffffffffc0202250:	00007517          	auipc	a0,0x7
ffffffffc0202254:	bd850513          	addi	a0,a0,-1064 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202258:	fb1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020225c:	00007697          	auipc	a3,0x7
ffffffffc0202260:	e2c68693          	addi	a3,a3,-468 # ffffffffc0209088 <commands+0xef8>
ffffffffc0202264:	00006617          	auipc	a2,0x6
ffffffffc0202268:	33c60613          	addi	a2,a2,828 # ffffffffc02085a0 <commands+0x410>
ffffffffc020226c:	10800593          	li	a1,264
ffffffffc0202270:	00007517          	auipc	a0,0x7
ffffffffc0202274:	bb850513          	addi	a0,a0,-1096 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202278:	f91fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020227c:	00007697          	auipc	a3,0x7
ffffffffc0202280:	d0c68693          	addi	a3,a3,-756 # ffffffffc0208f88 <commands+0xdf8>
ffffffffc0202284:	00006617          	auipc	a2,0x6
ffffffffc0202288:	31c60613          	addi	a2,a2,796 # ffffffffc02085a0 <commands+0x410>
ffffffffc020228c:	10700593          	li	a1,263
ffffffffc0202290:	00007517          	auipc	a0,0x7
ffffffffc0202294:	b9850513          	addi	a0,a0,-1128 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202298:	f71fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020229c:	00007697          	auipc	a3,0x7
ffffffffc02022a0:	dcc68693          	addi	a3,a3,-564 # ffffffffc0209068 <commands+0xed8>
ffffffffc02022a4:	00006617          	auipc	a2,0x6
ffffffffc02022a8:	2fc60613          	addi	a2,a2,764 # ffffffffc02085a0 <commands+0x410>
ffffffffc02022ac:	10600593          	li	a1,262
ffffffffc02022b0:	00007517          	auipc	a0,0x7
ffffffffc02022b4:	b7850513          	addi	a0,a0,-1160 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02022b8:	f51fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02022bc:	00007697          	auipc	a3,0x7
ffffffffc02022c0:	d7c68693          	addi	a3,a3,-644 # ffffffffc0209038 <commands+0xea8>
ffffffffc02022c4:	00006617          	auipc	a2,0x6
ffffffffc02022c8:	2dc60613          	addi	a2,a2,732 # ffffffffc02085a0 <commands+0x410>
ffffffffc02022cc:	10500593          	li	a1,261
ffffffffc02022d0:	00007517          	auipc	a0,0x7
ffffffffc02022d4:	b5850513          	addi	a0,a0,-1192 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02022d8:	f31fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02022dc:	00007697          	auipc	a3,0x7
ffffffffc02022e0:	d4468693          	addi	a3,a3,-700 # ffffffffc0209020 <commands+0xe90>
ffffffffc02022e4:	00006617          	auipc	a2,0x6
ffffffffc02022e8:	2bc60613          	addi	a2,a2,700 # ffffffffc02085a0 <commands+0x410>
ffffffffc02022ec:	10400593          	li	a1,260
ffffffffc02022f0:	00007517          	auipc	a0,0x7
ffffffffc02022f4:	b3850513          	addi	a0,a0,-1224 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02022f8:	f11fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02022fc:	00007697          	auipc	a3,0x7
ffffffffc0202300:	c8c68693          	addi	a3,a3,-884 # ffffffffc0208f88 <commands+0xdf8>
ffffffffc0202304:	00006617          	auipc	a2,0x6
ffffffffc0202308:	29c60613          	addi	a2,a2,668 # ffffffffc02085a0 <commands+0x410>
ffffffffc020230c:	0fe00593          	li	a1,254
ffffffffc0202310:	00007517          	auipc	a0,0x7
ffffffffc0202314:	b1850513          	addi	a0,a0,-1256 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202318:	ef1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020231c:	00007697          	auipc	a3,0x7
ffffffffc0202320:	cec68693          	addi	a3,a3,-788 # ffffffffc0209008 <commands+0xe78>
ffffffffc0202324:	00006617          	auipc	a2,0x6
ffffffffc0202328:	27c60613          	addi	a2,a2,636 # ffffffffc02085a0 <commands+0x410>
ffffffffc020232c:	0f900593          	li	a1,249
ffffffffc0202330:	00007517          	auipc	a0,0x7
ffffffffc0202334:	af850513          	addi	a0,a0,-1288 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202338:	ed1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020233c:	00007697          	auipc	a3,0x7
ffffffffc0202340:	dec68693          	addi	a3,a3,-532 # ffffffffc0209128 <commands+0xf98>
ffffffffc0202344:	00006617          	auipc	a2,0x6
ffffffffc0202348:	25c60613          	addi	a2,a2,604 # ffffffffc02085a0 <commands+0x410>
ffffffffc020234c:	11700593          	li	a1,279
ffffffffc0202350:	00007517          	auipc	a0,0x7
ffffffffc0202354:	ad850513          	addi	a0,a0,-1320 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202358:	eb1fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020235c:	00007697          	auipc	a3,0x7
ffffffffc0202360:	dfc68693          	addi	a3,a3,-516 # ffffffffc0209158 <commands+0xfc8>
ffffffffc0202364:	00006617          	auipc	a2,0x6
ffffffffc0202368:	23c60613          	addi	a2,a2,572 # ffffffffc02085a0 <commands+0x410>
ffffffffc020236c:	12600593          	li	a1,294
ffffffffc0202370:	00007517          	auipc	a0,0x7
ffffffffc0202374:	ab850513          	addi	a0,a0,-1352 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202378:	e91fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020237c:	00007697          	auipc	a3,0x7
ffffffffc0202380:	ac468693          	addi	a3,a3,-1340 # ffffffffc0208e40 <commands+0xcb0>
ffffffffc0202384:	00006617          	auipc	a2,0x6
ffffffffc0202388:	21c60613          	addi	a2,a2,540 # ffffffffc02085a0 <commands+0x410>
ffffffffc020238c:	0f300593          	li	a1,243
ffffffffc0202390:	00007517          	auipc	a0,0x7
ffffffffc0202394:	a9850513          	addi	a0,a0,-1384 # ffffffffc0208e28 <commands+0xc98>
ffffffffc0202398:	e71fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020239c:	00007697          	auipc	a3,0x7
ffffffffc02023a0:	ae468693          	addi	a3,a3,-1308 # ffffffffc0208e80 <commands+0xcf0>
ffffffffc02023a4:	00006617          	auipc	a2,0x6
ffffffffc02023a8:	1fc60613          	addi	a2,a2,508 # ffffffffc02085a0 <commands+0x410>
ffffffffc02023ac:	0ba00593          	li	a1,186
ffffffffc02023b0:	00007517          	auipc	a0,0x7
ffffffffc02023b4:	a7850513          	addi	a0,a0,-1416 # ffffffffc0208e28 <commands+0xc98>
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
ffffffffc02024e2:	c9268693          	addi	a3,a3,-878 # ffffffffc0209170 <commands+0xfe0>
ffffffffc02024e6:	00006617          	auipc	a2,0x6
ffffffffc02024ea:	0ba60613          	addi	a2,a2,186 # ffffffffc02085a0 <commands+0x410>
ffffffffc02024ee:	08300593          	li	a1,131
ffffffffc02024f2:	00007517          	auipc	a0,0x7
ffffffffc02024f6:	93650513          	addi	a0,a0,-1738 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02024fa:	d0ffd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02024fe:	00007697          	auipc	a3,0x7
ffffffffc0202502:	c6a68693          	addi	a3,a3,-918 # ffffffffc0209168 <commands+0xfd8>
ffffffffc0202506:	00006617          	auipc	a2,0x6
ffffffffc020250a:	09a60613          	addi	a2,a2,154 # ffffffffc02085a0 <commands+0x410>
ffffffffc020250e:	08000593          	li	a1,128
ffffffffc0202512:	00007517          	auipc	a0,0x7
ffffffffc0202516:	91650513          	addi	a0,a0,-1770 # ffffffffc0208e28 <commands+0xc98>
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
ffffffffc02025b4:	bb868693          	addi	a3,a3,-1096 # ffffffffc0209168 <commands+0xfd8>
ffffffffc02025b8:	00006617          	auipc	a2,0x6
ffffffffc02025bc:	fe860613          	addi	a2,a2,-24 # ffffffffc02085a0 <commands+0x410>
ffffffffc02025c0:	06200593          	li	a1,98
ffffffffc02025c4:	00007517          	auipc	a0,0x7
ffffffffc02025c8:	86450513          	addi	a0,a0,-1948 # ffffffffc0208e28 <commands+0xc98>
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
ffffffffc0202686:	b1668693          	addi	a3,a3,-1258 # ffffffffc0209198 <commands+0x1008>
ffffffffc020268a:	00006617          	auipc	a2,0x6
ffffffffc020268e:	f1660613          	addi	a2,a2,-234 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202692:	04900593          	li	a1,73
ffffffffc0202696:	00006517          	auipc	a0,0x6
ffffffffc020269a:	79250513          	addi	a0,a0,1938 # ffffffffc0208e28 <commands+0xc98>
ffffffffc020269e:	b6bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02026a2:	00007697          	auipc	a3,0x7
ffffffffc02026a6:	ac668693          	addi	a3,a3,-1338 # ffffffffc0209168 <commands+0xfd8>
ffffffffc02026aa:	00006617          	auipc	a2,0x6
ffffffffc02026ae:	ef660613          	addi	a2,a2,-266 # ffffffffc02085a0 <commands+0x410>
ffffffffc02026b2:	04600593          	li	a1,70
ffffffffc02026b6:	00006517          	auipc	a0,0x6
ffffffffc02026ba:	77250513          	addi	a0,a0,1906 # ffffffffc0208e28 <commands+0xc98>
ffffffffc02026be:	b4bfd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02026c2 <pa2page.part.0>:
ffffffffc02026c2:	1141                	addi	sp,sp,-16
ffffffffc02026c4:	00006617          	auipc	a2,0x6
ffffffffc02026c8:	55460613          	addi	a2,a2,1364 # ffffffffc0208c18 <commands+0xa88>
ffffffffc02026cc:	06200593          	li	a1,98
ffffffffc02026d0:	00006517          	auipc	a0,0x6
ffffffffc02026d4:	4d850513          	addi	a0,a0,1240 # ffffffffc0208ba8 <commands+0xa18>
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
ffffffffc02027f2:	9d278793          	addi	a5,a5,-1582 # ffffffffc02091c0 <default_pmm_manager>
ffffffffc02027f6:	638c                	ld	a1,0(a5)
ffffffffc02027f8:	1101                	addi	sp,sp,-32
ffffffffc02027fa:	e426                	sd	s1,8(sp)
ffffffffc02027fc:	00007517          	auipc	a0,0x7
ffffffffc0202800:	9fc50513          	addi	a0,a0,-1540 # ffffffffc02091f8 <default_pmm_manager+0x38>
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
ffffffffc020282c:	9e850513          	addi	a0,a0,-1560 # ffffffffc0209210 <default_pmm_manager+0x50>
ffffffffc0202830:	e01c                	sd	a5,0(s0)
ffffffffc0202832:	89bfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202836:	44300693          	li	a3,1091
ffffffffc020283a:	06d6                	slli	a3,a3,0x15
ffffffffc020283c:	40100613          	li	a2,1025
ffffffffc0202840:	0656                	slli	a2,a2,0x15
ffffffffc0202842:	088005b7          	lui	a1,0x8800
ffffffffc0202846:	16fd                	addi	a3,a3,-1
ffffffffc0202848:	00007517          	auipc	a0,0x7
ffffffffc020284c:	9e050513          	addi	a0,a0,-1568 # ffffffffc0209228 <default_pmm_manager+0x68>
ffffffffc0202850:	87dfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202854:	777d                	lui	a4,0xfffff
ffffffffc0202856:	00018797          	auipc	a5,0x18
ffffffffc020285a:	e6178793          	addi	a5,a5,-415 # ffffffffc021a6b7 <end+0xfff>
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
ffffffffc0202912:	2e260613          	addi	a2,a2,738 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc0202916:	07f00593          	li	a1,127
ffffffffc020291a:	00007517          	auipc	a0,0x7
ffffffffc020291e:	93650513          	addi	a0,a0,-1738 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202922:	8e7fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202926:	00006617          	auipc	a2,0x6
ffffffffc020292a:	2ca60613          	addi	a2,a2,714 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc020292e:	0c100593          	li	a1,193
ffffffffc0202932:	00007517          	auipc	a0,0x7
ffffffffc0202936:	91e50513          	addi	a0,a0,-1762 # ffffffffc0209250 <default_pmm_manager+0x90>
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
ffffffffc02029c8:	0f6050ef          	jal	ra,ffffffffc0207abe <memset>
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
ffffffffc0202a5a:	064050ef          	jal	ra,ffffffffc0207abe <memset>
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
ffffffffc0202ab4:	0d060613          	addi	a2,a2,208 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc0202ab8:	0fe00593          	li	a1,254
ffffffffc0202abc:	00006517          	auipc	a0,0x6
ffffffffc0202ac0:	79450513          	addi	a0,a0,1940 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202ac4:	f44fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ac8:	00006617          	auipc	a2,0x6
ffffffffc0202acc:	0b860613          	addi	a2,a2,184 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc0202ad0:	10900593          	li	a1,265
ffffffffc0202ad4:	00006517          	auipc	a0,0x6
ffffffffc0202ad8:	77c50513          	addi	a0,a0,1916 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202adc:	f2cfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ae0:	86aa                	mv	a3,a0
ffffffffc0202ae2:	00006617          	auipc	a2,0x6
ffffffffc0202ae6:	09e60613          	addi	a2,a2,158 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc0202aea:	10600593          	li	a1,262
ffffffffc0202aee:	00006517          	auipc	a0,0x6
ffffffffc0202af2:	76250513          	addi	a0,a0,1890 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202af6:	f12fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202afa:	86aa                	mv	a3,a0
ffffffffc0202afc:	00006617          	auipc	a2,0x6
ffffffffc0202b00:	08460613          	addi	a2,a2,132 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc0202b04:	0fa00593          	li	a1,250
ffffffffc0202b08:	00006517          	auipc	a0,0x6
ffffffffc0202b0c:	74850513          	addi	a0,a0,1864 # ffffffffc0209250 <default_pmm_manager+0x90>
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
ffffffffc0202bea:	6aa68693          	addi	a3,a3,1706 # ffffffffc0209290 <default_pmm_manager+0xd0>
ffffffffc0202bee:	00006617          	auipc	a2,0x6
ffffffffc0202bf2:	9b260613          	addi	a2,a2,-1614 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202bf6:	14100593          	li	a1,321
ffffffffc0202bfa:	00006517          	auipc	a0,0x6
ffffffffc0202bfe:	65650513          	addi	a0,a0,1622 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202c02:	e06fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c06:	00006697          	auipc	a3,0x6
ffffffffc0202c0a:	65a68693          	addi	a3,a3,1626 # ffffffffc0209260 <default_pmm_manager+0xa0>
ffffffffc0202c0e:	00006617          	auipc	a2,0x6
ffffffffc0202c12:	99260613          	addi	a2,a2,-1646 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202c16:	14000593          	li	a1,320
ffffffffc0202c1a:	00006517          	auipc	a0,0x6
ffffffffc0202c1e:	63650513          	addi	a0,a0,1590 # ffffffffc0209250 <default_pmm_manager+0x90>
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
ffffffffc0202cd4:	f4860613          	addi	a2,a2,-184 # ffffffffc0208c18 <commands+0xa88>
ffffffffc0202cd8:	06200593          	li	a1,98
ffffffffc0202cdc:	00006517          	auipc	a0,0x6
ffffffffc0202ce0:	ecc50513          	addi	a0,a0,-308 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0202ce4:	d24fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ce8:	00006697          	auipc	a3,0x6
ffffffffc0202cec:	5a868693          	addi	a3,a3,1448 # ffffffffc0209290 <default_pmm_manager+0xd0>
ffffffffc0202cf0:	00006617          	auipc	a2,0x6
ffffffffc0202cf4:	8b060613          	addi	a2,a2,-1872 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202cf8:	15200593          	li	a1,338
ffffffffc0202cfc:	00006517          	auipc	a0,0x6
ffffffffc0202d00:	55450513          	addi	a0,a0,1364 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202d04:	d04fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d08:	00006697          	auipc	a3,0x6
ffffffffc0202d0c:	55868693          	addi	a3,a3,1368 # ffffffffc0209260 <default_pmm_manager+0xa0>
ffffffffc0202d10:	00006617          	auipc	a2,0x6
ffffffffc0202d14:	89060613          	addi	a2,a2,-1904 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202d18:	15100593          	li	a1,337
ffffffffc0202d1c:	00006517          	auipc	a0,0x6
ffffffffc0202d20:	53450513          	addi	a0,a0,1332 # ffffffffc0209250 <default_pmm_manager+0x90>
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
ffffffffc0202d72:	00893023          	sd	s0,0(s2) # fffffffffff80000 <end+0x3fd66948>
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
ffffffffc0202f00:	3d1040ef          	jal	ra,ffffffffc0207ad0 <memcpy>
ffffffffc0202f04:	86a6                	mv	a3,s1
ffffffffc0202f06:	8622                	mv	a2,s0
ffffffffc0202f08:	85ea                	mv	a1,s10
ffffffffc0202f0a:	8556                	mv	a0,s5
ffffffffc0202f0c:	e1dff0ef          	jal	ra,ffffffffc0202d28 <page_insert>
ffffffffc0202f10:	d139                	beqz	a0,ffffffffc0202e56 <copy_range+0x72>
ffffffffc0202f12:	00006697          	auipc	a3,0x6
ffffffffc0202f16:	3de68693          	addi	a3,a3,990 # ffffffffc02092f0 <default_pmm_manager+0x130>
ffffffffc0202f1a:	00005617          	auipc	a2,0x5
ffffffffc0202f1e:	68660613          	addi	a2,a2,1670 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202f22:	19900593          	li	a1,409
ffffffffc0202f26:	00006517          	auipc	a0,0x6
ffffffffc0202f2a:	32a50513          	addi	a0,a0,810 # ffffffffc0209250 <default_pmm_manager+0x90>
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
ffffffffc0202f50:	c3460613          	addi	a2,a2,-972 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc0202f54:	06900593          	li	a1,105
ffffffffc0202f58:	00006517          	auipc	a0,0x6
ffffffffc0202f5c:	c5050513          	addi	a0,a0,-944 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0202f60:	aa8fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202f64:	00006697          	auipc	a3,0x6
ffffffffc0202f68:	36c68693          	addi	a3,a3,876 # ffffffffc02092d0 <default_pmm_manager+0x110>
ffffffffc0202f6c:	00005617          	auipc	a2,0x5
ffffffffc0202f70:	63460613          	addi	a2,a2,1588 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202f74:	17e00593          	li	a1,382
ffffffffc0202f78:	00006517          	auipc	a0,0x6
ffffffffc0202f7c:	2d850513          	addi	a0,a0,728 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202f80:	a88fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202f84:	00006697          	auipc	a3,0x6
ffffffffc0202f88:	30c68693          	addi	a3,a3,780 # ffffffffc0209290 <default_pmm_manager+0xd0>
ffffffffc0202f8c:	00005617          	auipc	a2,0x5
ffffffffc0202f90:	61460613          	addi	a2,a2,1556 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202f94:	16a00593          	li	a1,362
ffffffffc0202f98:	00006517          	auipc	a0,0x6
ffffffffc0202f9c:	2b850513          	addi	a0,a0,696 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202fa0:	a68fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202fa4:	00006697          	auipc	a3,0x6
ffffffffc0202fa8:	33c68693          	addi	a3,a3,828 # ffffffffc02092e0 <default_pmm_manager+0x120>
ffffffffc0202fac:	00005617          	auipc	a2,0x5
ffffffffc0202fb0:	5f460613          	addi	a2,a2,1524 # ffffffffc02085a0 <commands+0x410>
ffffffffc0202fb4:	17f00593          	li	a1,383
ffffffffc0202fb8:	00006517          	auipc	a0,0x6
ffffffffc0202fbc:	29850513          	addi	a0,a0,664 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc0202fc0:	a48fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202fc4:	00006617          	auipc	a2,0x6
ffffffffc0202fc8:	c5460613          	addi	a2,a2,-940 # ffffffffc0208c18 <commands+0xa88>
ffffffffc0202fcc:	06200593          	li	a1,98
ffffffffc0202fd0:	00006517          	auipc	a0,0x6
ffffffffc0202fd4:	bd850513          	addi	a0,a0,-1064 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0202fd8:	a30fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202fdc:	00006617          	auipc	a2,0x6
ffffffffc0202fe0:	2cc60613          	addi	a2,a2,716 # ffffffffc02092a8 <default_pmm_manager+0xe8>
ffffffffc0202fe4:	07400593          	li	a1,116
ffffffffc0202fe8:	00006517          	auipc	a0,0x6
ffffffffc0202fec:	bc050513          	addi	a0,a0,-1088 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0202ff0:	a18fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ff4:	00006697          	auipc	a3,0x6
ffffffffc0202ff8:	26c68693          	addi	a3,a3,620 # ffffffffc0209260 <default_pmm_manager+0xa0>
ffffffffc0202ffc:	00005617          	auipc	a2,0x5
ffffffffc0203000:	5a460613          	addi	a2,a2,1444 # ffffffffc02085a0 <commands+0x410>
ffffffffc0203004:	16900593          	li	a1,361
ffffffffc0203008:	00006517          	auipc	a0,0x6
ffffffffc020300c:	24850513          	addi	a0,a0,584 # ffffffffc0209250 <default_pmm_manager+0x90>
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
ffffffffc020308c:	27868693          	addi	a3,a3,632 # ffffffffc0209300 <default_pmm_manager+0x140>
ffffffffc0203090:	00005617          	auipc	a2,0x5
ffffffffc0203094:	51060613          	addi	a2,a2,1296 # ffffffffc02085a0 <commands+0x410>
ffffffffc0203098:	1d800593          	li	a1,472
ffffffffc020309c:	00006517          	auipc	a0,0x6
ffffffffc02030a0:	1b450513          	addi	a0,a0,436 # ffffffffc0209250 <default_pmm_manager+0x90>
ffffffffc02030a4:	964fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02030a8 <wait_queue_del.part.0>:
ffffffffc02030a8:	1141                	addi	sp,sp,-16
ffffffffc02030aa:	00006697          	auipc	a3,0x6
ffffffffc02030ae:	26e68693          	addi	a3,a3,622 # ffffffffc0209318 <default_pmm_manager+0x158>
ffffffffc02030b2:	00005617          	auipc	a2,0x5
ffffffffc02030b6:	4ee60613          	addi	a2,a2,1262 # ffffffffc02085a0 <commands+0x410>
ffffffffc02030ba:	45f1                	li	a1,28
ffffffffc02030bc:	00006517          	auipc	a0,0x6
ffffffffc02030c0:	29c50513          	addi	a0,a0,668 # ffffffffc0209358 <default_pmm_manager+0x198>
ffffffffc02030c4:	e406                	sd	ra,8(sp)
ffffffffc02030c6:	942fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02030ca <wait_queue_init>:
ffffffffc02030ca:	e508                	sd	a0,8(a0)
ffffffffc02030cc:	e108                	sd	a0,0(a0)
ffffffffc02030ce:	8082                	ret

ffffffffc02030d0 <wait_queue_del>:
ffffffffc02030d0:	7198                	ld	a4,32(a1)
ffffffffc02030d2:	01858793          	addi	a5,a1,24
ffffffffc02030d6:	00e78b63          	beq	a5,a4,ffffffffc02030ec <wait_queue_del+0x1c>
ffffffffc02030da:	6994                	ld	a3,16(a1)
ffffffffc02030dc:	00a69863          	bne	a3,a0,ffffffffc02030ec <wait_queue_del+0x1c>
ffffffffc02030e0:	6d94                	ld	a3,24(a1)
ffffffffc02030e2:	e698                	sd	a4,8(a3)
ffffffffc02030e4:	e314                	sd	a3,0(a4)
ffffffffc02030e6:	f19c                	sd	a5,32(a1)
ffffffffc02030e8:	ed9c                	sd	a5,24(a1)
ffffffffc02030ea:	8082                	ret
ffffffffc02030ec:	1141                	addi	sp,sp,-16
ffffffffc02030ee:	e406                	sd	ra,8(sp)
ffffffffc02030f0:	fb9ff0ef          	jal	ra,ffffffffc02030a8 <wait_queue_del.part.0>

ffffffffc02030f4 <wait_queue_first>:
ffffffffc02030f4:	651c                	ld	a5,8(a0)
ffffffffc02030f6:	00f50563          	beq	a0,a5,ffffffffc0203100 <wait_queue_first+0xc>
ffffffffc02030fa:	fe878513          	addi	a0,a5,-24
ffffffffc02030fe:	8082                	ret
ffffffffc0203100:	4501                	li	a0,0
ffffffffc0203102:	8082                	ret

ffffffffc0203104 <wait_in_queue>:
ffffffffc0203104:	711c                	ld	a5,32(a0)
ffffffffc0203106:	0561                	addi	a0,a0,24
ffffffffc0203108:	40a78533          	sub	a0,a5,a0
ffffffffc020310c:	00a03533          	snez	a0,a0
ffffffffc0203110:	8082                	ret

ffffffffc0203112 <wakeup_wait>:
ffffffffc0203112:	ce91                	beqz	a3,ffffffffc020312e <wakeup_wait+0x1c>
ffffffffc0203114:	7198                	ld	a4,32(a1)
ffffffffc0203116:	01858793          	addi	a5,a1,24
ffffffffc020311a:	00e78e63          	beq	a5,a4,ffffffffc0203136 <wakeup_wait+0x24>
ffffffffc020311e:	6994                	ld	a3,16(a1)
ffffffffc0203120:	00d51b63          	bne	a0,a3,ffffffffc0203136 <wakeup_wait+0x24>
ffffffffc0203124:	6d94                	ld	a3,24(a1)
ffffffffc0203126:	e698                	sd	a4,8(a3)
ffffffffc0203128:	e314                	sd	a3,0(a4)
ffffffffc020312a:	f19c                	sd	a5,32(a1)
ffffffffc020312c:	ed9c                	sd	a5,24(a1)
ffffffffc020312e:	6188                	ld	a0,0(a1)
ffffffffc0203130:	c590                	sw	a2,8(a1)
ffffffffc0203132:	0550106f          	j	ffffffffc0204986 <wakeup_proc>
ffffffffc0203136:	1141                	addi	sp,sp,-16
ffffffffc0203138:	e406                	sd	ra,8(sp)
ffffffffc020313a:	f6fff0ef          	jal	ra,ffffffffc02030a8 <wait_queue_del.part.0>

ffffffffc020313e <wait_current_set>:
ffffffffc020313e:	00016797          	auipc	a5,0x16
ffffffffc0203142:	3ba7b783          	ld	a5,954(a5) # ffffffffc02194f8 <current>
ffffffffc0203146:	c39d                	beqz	a5,ffffffffc020316c <wait_current_set+0x2e>
ffffffffc0203148:	01858713          	addi	a4,a1,24
ffffffffc020314c:	800006b7          	lui	a3,0x80000
ffffffffc0203150:	ed98                	sd	a4,24(a1)
ffffffffc0203152:	e19c                	sd	a5,0(a1)
ffffffffc0203154:	c594                	sw	a3,8(a1)
ffffffffc0203156:	4685                	li	a3,1
ffffffffc0203158:	c394                	sw	a3,0(a5)
ffffffffc020315a:	0ec7a623          	sw	a2,236(a5)
ffffffffc020315e:	611c                	ld	a5,0(a0)
ffffffffc0203160:	e988                	sd	a0,16(a1)
ffffffffc0203162:	e118                	sd	a4,0(a0)
ffffffffc0203164:	e798                	sd	a4,8(a5)
ffffffffc0203166:	f188                	sd	a0,32(a1)
ffffffffc0203168:	ed9c                	sd	a5,24(a1)
ffffffffc020316a:	8082                	ret
ffffffffc020316c:	1141                	addi	sp,sp,-16
ffffffffc020316e:	00006697          	auipc	a3,0x6
ffffffffc0203172:	20268693          	addi	a3,a3,514 # ffffffffc0209370 <default_pmm_manager+0x1b0>
ffffffffc0203176:	00005617          	auipc	a2,0x5
ffffffffc020317a:	42a60613          	addi	a2,a2,1066 # ffffffffc02085a0 <commands+0x410>
ffffffffc020317e:	07400593          	li	a1,116
ffffffffc0203182:	00006517          	auipc	a0,0x6
ffffffffc0203186:	1d650513          	addi	a0,a0,470 # ffffffffc0209358 <default_pmm_manager+0x198>
ffffffffc020318a:	e406                	sd	ra,8(sp)
ffffffffc020318c:	87cfd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203190 <__down.constprop.0>:
ffffffffc0203190:	715d                	addi	sp,sp,-80
ffffffffc0203192:	e0a2                	sd	s0,64(sp)
ffffffffc0203194:	e486                	sd	ra,72(sp)
ffffffffc0203196:	fc26                	sd	s1,56(sp)
ffffffffc0203198:	842a                	mv	s0,a0
ffffffffc020319a:	100027f3          	csrr	a5,sstatus
ffffffffc020319e:	8b89                	andi	a5,a5,2
ffffffffc02031a0:	ebb1                	bnez	a5,ffffffffc02031f4 <__down.constprop.0+0x64>
ffffffffc02031a2:	411c                	lw	a5,0(a0)
ffffffffc02031a4:	00f05a63          	blez	a5,ffffffffc02031b8 <__down.constprop.0+0x28>
ffffffffc02031a8:	37fd                	addiw	a5,a5,-1
ffffffffc02031aa:	c11c                	sw	a5,0(a0)
ffffffffc02031ac:	4501                	li	a0,0
ffffffffc02031ae:	60a6                	ld	ra,72(sp)
ffffffffc02031b0:	6406                	ld	s0,64(sp)
ffffffffc02031b2:	74e2                	ld	s1,56(sp)
ffffffffc02031b4:	6161                	addi	sp,sp,80
ffffffffc02031b6:	8082                	ret
ffffffffc02031b8:	00850413          	addi	s0,a0,8
ffffffffc02031bc:	0024                	addi	s1,sp,8
ffffffffc02031be:	10000613          	li	a2,256
ffffffffc02031c2:	85a6                	mv	a1,s1
ffffffffc02031c4:	8522                	mv	a0,s0
ffffffffc02031c6:	f79ff0ef          	jal	ra,ffffffffc020313e <wait_current_set>
ffffffffc02031ca:	06f010ef          	jal	ra,ffffffffc0204a38 <schedule>
ffffffffc02031ce:	100027f3          	csrr	a5,sstatus
ffffffffc02031d2:	8b89                	andi	a5,a5,2
ffffffffc02031d4:	efb9                	bnez	a5,ffffffffc0203232 <__down.constprop.0+0xa2>
ffffffffc02031d6:	8526                	mv	a0,s1
ffffffffc02031d8:	f2dff0ef          	jal	ra,ffffffffc0203104 <wait_in_queue>
ffffffffc02031dc:	e531                	bnez	a0,ffffffffc0203228 <__down.constprop.0+0x98>
ffffffffc02031de:	4542                	lw	a0,16(sp)
ffffffffc02031e0:	10000793          	li	a5,256
ffffffffc02031e4:	fcf515e3          	bne	a0,a5,ffffffffc02031ae <__down.constprop.0+0x1e>
ffffffffc02031e8:	60a6                	ld	ra,72(sp)
ffffffffc02031ea:	6406                	ld	s0,64(sp)
ffffffffc02031ec:	74e2                	ld	s1,56(sp)
ffffffffc02031ee:	4501                	li	a0,0
ffffffffc02031f0:	6161                	addi	sp,sp,80
ffffffffc02031f2:	8082                	ret
ffffffffc02031f4:	c44fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02031f8:	401c                	lw	a5,0(s0)
ffffffffc02031fa:	00f05c63          	blez	a5,ffffffffc0203212 <__down.constprop.0+0x82>
ffffffffc02031fe:	37fd                	addiw	a5,a5,-1
ffffffffc0203200:	c01c                	sw	a5,0(s0)
ffffffffc0203202:	c30fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203206:	60a6                	ld	ra,72(sp)
ffffffffc0203208:	6406                	ld	s0,64(sp)
ffffffffc020320a:	74e2                	ld	s1,56(sp)
ffffffffc020320c:	4501                	li	a0,0
ffffffffc020320e:	6161                	addi	sp,sp,80
ffffffffc0203210:	8082                	ret
ffffffffc0203212:	0421                	addi	s0,s0,8
ffffffffc0203214:	0024                	addi	s1,sp,8
ffffffffc0203216:	10000613          	li	a2,256
ffffffffc020321a:	85a6                	mv	a1,s1
ffffffffc020321c:	8522                	mv	a0,s0
ffffffffc020321e:	f21ff0ef          	jal	ra,ffffffffc020313e <wait_current_set>
ffffffffc0203222:	c10fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203226:	b755                	j	ffffffffc02031ca <__down.constprop.0+0x3a>
ffffffffc0203228:	85a6                	mv	a1,s1
ffffffffc020322a:	8522                	mv	a0,s0
ffffffffc020322c:	ea5ff0ef          	jal	ra,ffffffffc02030d0 <wait_queue_del>
ffffffffc0203230:	b77d                	j	ffffffffc02031de <__down.constprop.0+0x4e>
ffffffffc0203232:	c06fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203236:	8526                	mv	a0,s1
ffffffffc0203238:	ecdff0ef          	jal	ra,ffffffffc0203104 <wait_in_queue>
ffffffffc020323c:	e501                	bnez	a0,ffffffffc0203244 <__down.constprop.0+0xb4>
ffffffffc020323e:	bf4fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203242:	bf71                	j	ffffffffc02031de <__down.constprop.0+0x4e>
ffffffffc0203244:	85a6                	mv	a1,s1
ffffffffc0203246:	8522                	mv	a0,s0
ffffffffc0203248:	e89ff0ef          	jal	ra,ffffffffc02030d0 <wait_queue_del>
ffffffffc020324c:	bfcd                	j	ffffffffc020323e <__down.constprop.0+0xae>

ffffffffc020324e <__up.constprop.0>:
ffffffffc020324e:	1101                	addi	sp,sp,-32
ffffffffc0203250:	e822                	sd	s0,16(sp)
ffffffffc0203252:	ec06                	sd	ra,24(sp)
ffffffffc0203254:	e426                	sd	s1,8(sp)
ffffffffc0203256:	e04a                	sd	s2,0(sp)
ffffffffc0203258:	842a                	mv	s0,a0
ffffffffc020325a:	100027f3          	csrr	a5,sstatus
ffffffffc020325e:	8b89                	andi	a5,a5,2
ffffffffc0203260:	4901                	li	s2,0
ffffffffc0203262:	eba1                	bnez	a5,ffffffffc02032b2 <__up.constprop.0+0x64>
ffffffffc0203264:	00840493          	addi	s1,s0,8
ffffffffc0203268:	8526                	mv	a0,s1
ffffffffc020326a:	e8bff0ef          	jal	ra,ffffffffc02030f4 <wait_queue_first>
ffffffffc020326e:	85aa                	mv	a1,a0
ffffffffc0203270:	cd0d                	beqz	a0,ffffffffc02032aa <__up.constprop.0+0x5c>
ffffffffc0203272:	6118                	ld	a4,0(a0)
ffffffffc0203274:	10000793          	li	a5,256
ffffffffc0203278:	0ec72703          	lw	a4,236(a4)
ffffffffc020327c:	02f71f63          	bne	a4,a5,ffffffffc02032ba <__up.constprop.0+0x6c>
ffffffffc0203280:	4685                	li	a3,1
ffffffffc0203282:	10000613          	li	a2,256
ffffffffc0203286:	8526                	mv	a0,s1
ffffffffc0203288:	e8bff0ef          	jal	ra,ffffffffc0203112 <wakeup_wait>
ffffffffc020328c:	00091863          	bnez	s2,ffffffffc020329c <__up.constprop.0+0x4e>
ffffffffc0203290:	60e2                	ld	ra,24(sp)
ffffffffc0203292:	6442                	ld	s0,16(sp)
ffffffffc0203294:	64a2                	ld	s1,8(sp)
ffffffffc0203296:	6902                	ld	s2,0(sp)
ffffffffc0203298:	6105                	addi	sp,sp,32
ffffffffc020329a:	8082                	ret
ffffffffc020329c:	6442                	ld	s0,16(sp)
ffffffffc020329e:	60e2                	ld	ra,24(sp)
ffffffffc02032a0:	64a2                	ld	s1,8(sp)
ffffffffc02032a2:	6902                	ld	s2,0(sp)
ffffffffc02032a4:	6105                	addi	sp,sp,32
ffffffffc02032a6:	b8cfd06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc02032aa:	401c                	lw	a5,0(s0)
ffffffffc02032ac:	2785                	addiw	a5,a5,1
ffffffffc02032ae:	c01c                	sw	a5,0(s0)
ffffffffc02032b0:	bff1                	j	ffffffffc020328c <__up.constprop.0+0x3e>
ffffffffc02032b2:	b86fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02032b6:	4905                	li	s2,1
ffffffffc02032b8:	b775                	j	ffffffffc0203264 <__up.constprop.0+0x16>
ffffffffc02032ba:	00006697          	auipc	a3,0x6
ffffffffc02032be:	0c668693          	addi	a3,a3,198 # ffffffffc0209380 <default_pmm_manager+0x1c0>
ffffffffc02032c2:	00005617          	auipc	a2,0x5
ffffffffc02032c6:	2de60613          	addi	a2,a2,734 # ffffffffc02085a0 <commands+0x410>
ffffffffc02032ca:	45e5                	li	a1,25
ffffffffc02032cc:	00006517          	auipc	a0,0x6
ffffffffc02032d0:	0dc50513          	addi	a0,a0,220 # ffffffffc02093a8 <default_pmm_manager+0x1e8>
ffffffffc02032d4:	f35fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02032d8 <sem_init>:
ffffffffc02032d8:	c10c                	sw	a1,0(a0)
ffffffffc02032da:	0521                	addi	a0,a0,8
ffffffffc02032dc:	defff06f          	j	ffffffffc02030ca <wait_queue_init>

ffffffffc02032e0 <up>:
ffffffffc02032e0:	b7bd                	j	ffffffffc020324e <__up.constprop.0>

ffffffffc02032e2 <down>:
ffffffffc02032e2:	1141                	addi	sp,sp,-16
ffffffffc02032e4:	e406                	sd	ra,8(sp)
ffffffffc02032e6:	eabff0ef          	jal	ra,ffffffffc0203190 <__down.constprop.0>
ffffffffc02032ea:	2501                	sext.w	a0,a0
ffffffffc02032ec:	e501                	bnez	a0,ffffffffc02032f4 <down+0x12>
ffffffffc02032ee:	60a2                	ld	ra,8(sp)
ffffffffc02032f0:	0141                	addi	sp,sp,16
ffffffffc02032f2:	8082                	ret
ffffffffc02032f4:	00006697          	auipc	a3,0x6
ffffffffc02032f8:	0c468693          	addi	a3,a3,196 # ffffffffc02093b8 <default_pmm_manager+0x1f8>
ffffffffc02032fc:	00005617          	auipc	a2,0x5
ffffffffc0203300:	2a460613          	addi	a2,a2,676 # ffffffffc02085a0 <commands+0x410>
ffffffffc0203304:	04000593          	li	a1,64
ffffffffc0203308:	00006517          	auipc	a0,0x6
ffffffffc020330c:	0a050513          	addi	a0,a0,160 # ffffffffc02093a8 <default_pmm_manager+0x1e8>
ffffffffc0203310:	ef9fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203314 <worker1>:
ffffffffc0203314:	1101                	addi	sp,sp,-32
ffffffffc0203316:	e822                	sd	s0,16(sp)
ffffffffc0203318:	e426                	sd	s1,8(sp)
ffffffffc020331a:	e04a                	sd	s2,0(sp)
ffffffffc020331c:	ec06                	sd	ra,24(sp)
ffffffffc020331e:	00016417          	auipc	s0,0x16
ffffffffc0203322:	33a40413          	addi	s0,s0,826 # ffffffffc0219658 <mutex>
ffffffffc0203326:	00006917          	auipc	s2,0x6
ffffffffc020332a:	0a290913          	addi	s2,s2,162 # ffffffffc02093c8 <default_pmm_manager+0x208>
ffffffffc020332e:	00016497          	auipc	s1,0x16
ffffffffc0203332:	37248493          	addi	s1,s1,882 # ffffffffc02196a0 <cvp>
ffffffffc0203336:	8522                	mv	a0,s0
ffffffffc0203338:	fabff0ef          	jal	ra,ffffffffc02032e2 <down>
ffffffffc020333c:	854a                	mv	a0,s2
ffffffffc020333e:	d8ffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203342:	8526                	mv	a0,s1
ffffffffc0203344:	16c000ef          	jal	ra,ffffffffc02034b0 <cond_signal>
ffffffffc0203348:	8522                	mv	a0,s0
ffffffffc020334a:	f97ff0ef          	jal	ra,ffffffffc02032e0 <up>
ffffffffc020334e:	4529                	li	a0,10
ffffffffc0203350:	560010ef          	jal	ra,ffffffffc02048b0 <do_sleep>
ffffffffc0203354:	b7cd                	j	ffffffffc0203336 <worker1+0x22>

ffffffffc0203356 <worker2>:
ffffffffc0203356:	7179                	addi	sp,sp,-48
ffffffffc0203358:	f022                	sd	s0,32(sp)
ffffffffc020335a:	ec26                	sd	s1,24(sp)
ffffffffc020335c:	e84a                	sd	s2,16(sp)
ffffffffc020335e:	e44e                	sd	s3,8(sp)
ffffffffc0203360:	f406                	sd	ra,40(sp)
ffffffffc0203362:	00016417          	auipc	s0,0x16
ffffffffc0203366:	2f640413          	addi	s0,s0,758 # ffffffffc0219658 <mutex>
ffffffffc020336a:	00016997          	auipc	s3,0x16
ffffffffc020336e:	33698993          	addi	s3,s3,822 # ffffffffc02196a0 <cvp>
ffffffffc0203372:	00006917          	auipc	s2,0x6
ffffffffc0203376:	06e90913          	addi	s2,s2,110 # ffffffffc02093e0 <default_pmm_manager+0x220>
ffffffffc020337a:	00016497          	auipc	s1,0x16
ffffffffc020337e:	32a48493          	addi	s1,s1,810 # ffffffffc02196a4 <cvp+0x4>
ffffffffc0203382:	8522                	mv	a0,s0
ffffffffc0203384:	f5fff0ef          	jal	ra,ffffffffc02032e2 <down>
ffffffffc0203388:	85a2                	mv	a1,s0
ffffffffc020338a:	854e                	mv	a0,s3
ffffffffc020338c:	12a000ef          	jal	ra,ffffffffc02034b6 <cond_wait>
ffffffffc0203390:	854a                	mv	a0,s2
ffffffffc0203392:	d3bfc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203396:	8526                	mv	a0,s1
ffffffffc0203398:	118000ef          	jal	ra,ffffffffc02034b0 <cond_signal>
ffffffffc020339c:	8522                	mv	a0,s0
ffffffffc020339e:	f43ff0ef          	jal	ra,ffffffffc02032e0 <up>
ffffffffc02033a2:	4529                	li	a0,10
ffffffffc02033a4:	50c010ef          	jal	ra,ffffffffc02048b0 <do_sleep>
ffffffffc02033a8:	bfe9                	j	ffffffffc0203382 <worker2+0x2c>

ffffffffc02033aa <worker3>:
ffffffffc02033aa:	1101                	addi	sp,sp,-32
ffffffffc02033ac:	e822                	sd	s0,16(sp)
ffffffffc02033ae:	e426                	sd	s1,8(sp)
ffffffffc02033b0:	e04a                	sd	s2,0(sp)
ffffffffc02033b2:	ec06                	sd	ra,24(sp)
ffffffffc02033b4:	00016417          	auipc	s0,0x16
ffffffffc02033b8:	2a440413          	addi	s0,s0,676 # ffffffffc0219658 <mutex>
ffffffffc02033bc:	00016917          	auipc	s2,0x16
ffffffffc02033c0:	2e890913          	addi	s2,s2,744 # ffffffffc02196a4 <cvp+0x4>
ffffffffc02033c4:	00006497          	auipc	s1,0x6
ffffffffc02033c8:	03448493          	addi	s1,s1,52 # ffffffffc02093f8 <default_pmm_manager+0x238>
ffffffffc02033cc:	8522                	mv	a0,s0
ffffffffc02033ce:	f15ff0ef          	jal	ra,ffffffffc02032e2 <down>
ffffffffc02033d2:	85a2                	mv	a1,s0
ffffffffc02033d4:	854a                	mv	a0,s2
ffffffffc02033d6:	0e0000ef          	jal	ra,ffffffffc02034b6 <cond_wait>
ffffffffc02033da:	8526                	mv	a0,s1
ffffffffc02033dc:	cf1fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02033e0:	8522                	mv	a0,s0
ffffffffc02033e2:	effff0ef          	jal	ra,ffffffffc02032e0 <up>
ffffffffc02033e6:	4529                	li	a0,10
ffffffffc02033e8:	4c8010ef          	jal	ra,ffffffffc02048b0 <do_sleep>
ffffffffc02033ec:	b7c5                	j	ffffffffc02033cc <worker3+0x22>

ffffffffc02033ee <check_exercise>:
ffffffffc02033ee:	1101                	addi	sp,sp,-32
ffffffffc02033f0:	00016517          	auipc	a0,0x16
ffffffffc02033f4:	2b050513          	addi	a0,a0,688 # ffffffffc02196a0 <cvp>
ffffffffc02033f8:	ec06                	sd	ra,24(sp)
ffffffffc02033fa:	e822                	sd	s0,16(sp)
ffffffffc02033fc:	e426                	sd	s1,8(sp)
ffffffffc02033fe:	e04a                	sd	s2,0(sp)
ffffffffc0203400:	0aa000ef          	jal	ra,ffffffffc02034aa <cond_init>
ffffffffc0203404:	00016517          	auipc	a0,0x16
ffffffffc0203408:	2a050513          	addi	a0,a0,672 # ffffffffc02196a4 <cvp+0x4>
ffffffffc020340c:	09e000ef          	jal	ra,ffffffffc02034aa <cond_init>
ffffffffc0203410:	4585                	li	a1,1
ffffffffc0203412:	00016517          	auipc	a0,0x16
ffffffffc0203416:	24650513          	addi	a0,a0,582 # ffffffffc0219658 <mutex>
ffffffffc020341a:	ebfff0ef          	jal	ra,ffffffffc02032d8 <sem_init>
ffffffffc020341e:	4601                	li	a2,0
ffffffffc0203420:	4581                	li	a1,0
ffffffffc0203422:	00000517          	auipc	a0,0x0
ffffffffc0203426:	ef250513          	addi	a0,a0,-270 # ffffffffc0203314 <worker1>
ffffffffc020342a:	045000ef          	jal	ra,ffffffffc0203c6e <kernel_thread>
ffffffffc020342e:	892a                	mv	s2,a0
ffffffffc0203430:	4601                	li	a2,0
ffffffffc0203432:	4581                	li	a1,0
ffffffffc0203434:	00000517          	auipc	a0,0x0
ffffffffc0203438:	f2250513          	addi	a0,a0,-222 # ffffffffc0203356 <worker2>
ffffffffc020343c:	033000ef          	jal	ra,ffffffffc0203c6e <kernel_thread>
ffffffffc0203440:	4601                	li	a2,0
ffffffffc0203442:	84aa                	mv	s1,a0
ffffffffc0203444:	4581                	li	a1,0
ffffffffc0203446:	00000517          	auipc	a0,0x0
ffffffffc020344a:	f6450513          	addi	a0,a0,-156 # ffffffffc02033aa <worker3>
ffffffffc020344e:	021000ef          	jal	ra,ffffffffc0203c6e <kernel_thread>
ffffffffc0203452:	842a                	mv	s0,a0
ffffffffc0203454:	854a                	mv	a0,s2
ffffffffc0203456:	3ee000ef          	jal	ra,ffffffffc0203844 <find_proc>
ffffffffc020345a:	00006597          	auipc	a1,0x6
ffffffffc020345e:	fb658593          	addi	a1,a1,-74 # ffffffffc0209410 <default_pmm_manager+0x250>
ffffffffc0203462:	00016797          	auipc	a5,0x16
ffffffffc0203466:	22a7b323          	sd	a0,550(a5) # ffffffffc0219688 <pworker1>
ffffffffc020346a:	344000ef          	jal	ra,ffffffffc02037ae <set_proc_name>
ffffffffc020346e:	8526                	mv	a0,s1
ffffffffc0203470:	3d4000ef          	jal	ra,ffffffffc0203844 <find_proc>
ffffffffc0203474:	00006597          	auipc	a1,0x6
ffffffffc0203478:	fa458593          	addi	a1,a1,-92 # ffffffffc0209418 <default_pmm_manager+0x258>
ffffffffc020347c:	00016797          	auipc	a5,0x16
ffffffffc0203480:	20a7ba23          	sd	a0,532(a5) # ffffffffc0219690 <pworker2>
ffffffffc0203484:	32a000ef          	jal	ra,ffffffffc02037ae <set_proc_name>
ffffffffc0203488:	8522                	mv	a0,s0
ffffffffc020348a:	3ba000ef          	jal	ra,ffffffffc0203844 <find_proc>
ffffffffc020348e:	6442                	ld	s0,16(sp)
ffffffffc0203490:	60e2                	ld	ra,24(sp)
ffffffffc0203492:	64a2                	ld	s1,8(sp)
ffffffffc0203494:	6902                	ld	s2,0(sp)
ffffffffc0203496:	00016797          	auipc	a5,0x16
ffffffffc020349a:	20a7b123          	sd	a0,514(a5) # ffffffffc0219698 <pworker3>
ffffffffc020349e:	00006597          	auipc	a1,0x6
ffffffffc02034a2:	f8258593          	addi	a1,a1,-126 # ffffffffc0209420 <default_pmm_manager+0x260>
ffffffffc02034a6:	6105                	addi	sp,sp,32
ffffffffc02034a8:	a619                	j	ffffffffc02037ae <set_proc_name>

ffffffffc02034aa <cond_init>:
ffffffffc02034aa:	00052023          	sw	zero,0(a0)
ffffffffc02034ae:	8082                	ret

ffffffffc02034b0 <cond_signal>:
ffffffffc02034b0:	4785                	li	a5,1
ffffffffc02034b2:	c11c                	sw	a5,0(a0)
ffffffffc02034b4:	8082                	ret

ffffffffc02034b6 <cond_wait>:
ffffffffc02034b6:	1101                	addi	sp,sp,-32
ffffffffc02034b8:	e822                	sd	s0,16(sp)
ffffffffc02034ba:	842a                	mv	s0,a0
ffffffffc02034bc:	852e                	mv	a0,a1
ffffffffc02034be:	e426                	sd	s1,8(sp)
ffffffffc02034c0:	ec06                	sd	ra,24(sp)
ffffffffc02034c2:	84ae                	mv	s1,a1
ffffffffc02034c4:	e1dff0ef          	jal	ra,ffffffffc02032e0 <up>
ffffffffc02034c8:	401c                	lw	a5,0(s0)
ffffffffc02034ca:	e789                	bnez	a5,ffffffffc02034d4 <cond_wait+0x1e>
ffffffffc02034cc:	56c010ef          	jal	ra,ffffffffc0204a38 <schedule>
ffffffffc02034d0:	401c                	lw	a5,0(s0)
ffffffffc02034d2:	dfed                	beqz	a5,ffffffffc02034cc <cond_wait+0x16>
ffffffffc02034d4:	37fd                	addiw	a5,a5,-1
ffffffffc02034d6:	c01c                	sw	a5,0(s0)
ffffffffc02034d8:	6442                	ld	s0,16(sp)
ffffffffc02034da:	60e2                	ld	ra,24(sp)
ffffffffc02034dc:	8526                	mv	a0,s1
ffffffffc02034de:	64a2                	ld	s1,8(sp)
ffffffffc02034e0:	6105                	addi	sp,sp,32
ffffffffc02034e2:	e01ff06f          	j	ffffffffc02032e2 <down>

ffffffffc02034e6 <swapfs_init>:
ffffffffc02034e6:	1141                	addi	sp,sp,-16
ffffffffc02034e8:	4505                	li	a0,1
ffffffffc02034ea:	e406                	sd	ra,8(sp)
ffffffffc02034ec:	836fd0ef          	jal	ra,ffffffffc0200522 <ide_device_valid>
ffffffffc02034f0:	cd01                	beqz	a0,ffffffffc0203508 <swapfs_init+0x22>
ffffffffc02034f2:	4505                	li	a0,1
ffffffffc02034f4:	834fd0ef          	jal	ra,ffffffffc0200528 <ide_device_size>
ffffffffc02034f8:	60a2                	ld	ra,8(sp)
ffffffffc02034fa:	810d                	srli	a0,a0,0x3
ffffffffc02034fc:	00016797          	auipc	a5,0x16
ffffffffc0203500:	0ca7b223          	sd	a0,196(a5) # ffffffffc02195c0 <max_swap_offset>
ffffffffc0203504:	0141                	addi	sp,sp,16
ffffffffc0203506:	8082                	ret
ffffffffc0203508:	00006617          	auipc	a2,0x6
ffffffffc020350c:	f2060613          	addi	a2,a2,-224 # ffffffffc0209428 <default_pmm_manager+0x268>
ffffffffc0203510:	45b5                	li	a1,13
ffffffffc0203512:	00006517          	auipc	a0,0x6
ffffffffc0203516:	f3650513          	addi	a0,a0,-202 # ffffffffc0209448 <default_pmm_manager+0x288>
ffffffffc020351a:	ceffc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020351e <swapfs_read>:
ffffffffc020351e:	1141                	addi	sp,sp,-16
ffffffffc0203520:	e406                	sd	ra,8(sp)
ffffffffc0203522:	00855793          	srli	a5,a0,0x8
ffffffffc0203526:	cbb1                	beqz	a5,ffffffffc020357a <swapfs_read+0x5c>
ffffffffc0203528:	00016717          	auipc	a4,0x16
ffffffffc020352c:	09873703          	ld	a4,152(a4) # ffffffffc02195c0 <max_swap_offset>
ffffffffc0203530:	04e7f563          	bgeu	a5,a4,ffffffffc020357a <swapfs_read+0x5c>
ffffffffc0203534:	00016617          	auipc	a2,0x16
ffffffffc0203538:	10c63603          	ld	a2,268(a2) # ffffffffc0219640 <pages>
ffffffffc020353c:	8d91                	sub	a1,a1,a2
ffffffffc020353e:	4065d613          	srai	a2,a1,0x6
ffffffffc0203542:	00007717          	auipc	a4,0x7
ffffffffc0203546:	ffe73703          	ld	a4,-2(a4) # ffffffffc020a540 <nbase>
ffffffffc020354a:	963a                	add	a2,a2,a4
ffffffffc020354c:	00c61713          	slli	a4,a2,0xc
ffffffffc0203550:	8331                	srli	a4,a4,0xc
ffffffffc0203552:	00016697          	auipc	a3,0x16
ffffffffc0203556:	f9e6b683          	ld	a3,-98(a3) # ffffffffc02194f0 <npage>
ffffffffc020355a:	0037959b          	slliw	a1,a5,0x3
ffffffffc020355e:	0632                	slli	a2,a2,0xc
ffffffffc0203560:	02d77963          	bgeu	a4,a3,ffffffffc0203592 <swapfs_read+0x74>
ffffffffc0203564:	60a2                	ld	ra,8(sp)
ffffffffc0203566:	00016797          	auipc	a5,0x16
ffffffffc020356a:	0ca7b783          	ld	a5,202(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc020356e:	46a1                	li	a3,8
ffffffffc0203570:	963e                	add	a2,a2,a5
ffffffffc0203572:	4505                	li	a0,1
ffffffffc0203574:	0141                	addi	sp,sp,16
ffffffffc0203576:	fb9fc06f          	j	ffffffffc020052e <ide_read_secs>
ffffffffc020357a:	86aa                	mv	a3,a0
ffffffffc020357c:	00006617          	auipc	a2,0x6
ffffffffc0203580:	ee460613          	addi	a2,a2,-284 # ffffffffc0209460 <default_pmm_manager+0x2a0>
ffffffffc0203584:	45d1                	li	a1,20
ffffffffc0203586:	00006517          	auipc	a0,0x6
ffffffffc020358a:	ec250513          	addi	a0,a0,-318 # ffffffffc0209448 <default_pmm_manager+0x288>
ffffffffc020358e:	c7bfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203592:	86b2                	mv	a3,a2
ffffffffc0203594:	06900593          	li	a1,105
ffffffffc0203598:	00005617          	auipc	a2,0x5
ffffffffc020359c:	5e860613          	addi	a2,a2,1512 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc02035a0:	00005517          	auipc	a0,0x5
ffffffffc02035a4:	60850513          	addi	a0,a0,1544 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc02035a8:	c61fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02035ac <swapfs_write>:
ffffffffc02035ac:	1141                	addi	sp,sp,-16
ffffffffc02035ae:	e406                	sd	ra,8(sp)
ffffffffc02035b0:	00855793          	srli	a5,a0,0x8
ffffffffc02035b4:	cbb1                	beqz	a5,ffffffffc0203608 <swapfs_write+0x5c>
ffffffffc02035b6:	00016717          	auipc	a4,0x16
ffffffffc02035ba:	00a73703          	ld	a4,10(a4) # ffffffffc02195c0 <max_swap_offset>
ffffffffc02035be:	04e7f563          	bgeu	a5,a4,ffffffffc0203608 <swapfs_write+0x5c>
ffffffffc02035c2:	00016617          	auipc	a2,0x16
ffffffffc02035c6:	07e63603          	ld	a2,126(a2) # ffffffffc0219640 <pages>
ffffffffc02035ca:	8d91                	sub	a1,a1,a2
ffffffffc02035cc:	4065d613          	srai	a2,a1,0x6
ffffffffc02035d0:	00007717          	auipc	a4,0x7
ffffffffc02035d4:	f7073703          	ld	a4,-144(a4) # ffffffffc020a540 <nbase>
ffffffffc02035d8:	963a                	add	a2,a2,a4
ffffffffc02035da:	00c61713          	slli	a4,a2,0xc
ffffffffc02035de:	8331                	srli	a4,a4,0xc
ffffffffc02035e0:	00016697          	auipc	a3,0x16
ffffffffc02035e4:	f106b683          	ld	a3,-240(a3) # ffffffffc02194f0 <npage>
ffffffffc02035e8:	0037959b          	slliw	a1,a5,0x3
ffffffffc02035ec:	0632                	slli	a2,a2,0xc
ffffffffc02035ee:	02d77963          	bgeu	a4,a3,ffffffffc0203620 <swapfs_write+0x74>
ffffffffc02035f2:	60a2                	ld	ra,8(sp)
ffffffffc02035f4:	00016797          	auipc	a5,0x16
ffffffffc02035f8:	03c7b783          	ld	a5,60(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc02035fc:	46a1                	li	a3,8
ffffffffc02035fe:	963e                	add	a2,a2,a5
ffffffffc0203600:	4505                	li	a0,1
ffffffffc0203602:	0141                	addi	sp,sp,16
ffffffffc0203604:	f4ffc06f          	j	ffffffffc0200552 <ide_write_secs>
ffffffffc0203608:	86aa                	mv	a3,a0
ffffffffc020360a:	00006617          	auipc	a2,0x6
ffffffffc020360e:	e5660613          	addi	a2,a2,-426 # ffffffffc0209460 <default_pmm_manager+0x2a0>
ffffffffc0203612:	45e5                	li	a1,25
ffffffffc0203614:	00006517          	auipc	a0,0x6
ffffffffc0203618:	e3450513          	addi	a0,a0,-460 # ffffffffc0209448 <default_pmm_manager+0x288>
ffffffffc020361c:	bedfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203620:	86b2                	mv	a3,a2
ffffffffc0203622:	06900593          	li	a1,105
ffffffffc0203626:	00005617          	auipc	a2,0x5
ffffffffc020362a:	55a60613          	addi	a2,a2,1370 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc020362e:	00005517          	auipc	a0,0x5
ffffffffc0203632:	57a50513          	addi	a0,a0,1402 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0203636:	bd3fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020363a <switch_to>:
ffffffffc020363a:	00153023          	sd	ra,0(a0)
ffffffffc020363e:	00253423          	sd	sp,8(a0)
ffffffffc0203642:	e900                	sd	s0,16(a0)
ffffffffc0203644:	ed04                	sd	s1,24(a0)
ffffffffc0203646:	03253023          	sd	s2,32(a0)
ffffffffc020364a:	03353423          	sd	s3,40(a0)
ffffffffc020364e:	03453823          	sd	s4,48(a0)
ffffffffc0203652:	03553c23          	sd	s5,56(a0)
ffffffffc0203656:	05653023          	sd	s6,64(a0)
ffffffffc020365a:	05753423          	sd	s7,72(a0)
ffffffffc020365e:	05853823          	sd	s8,80(a0)
ffffffffc0203662:	05953c23          	sd	s9,88(a0)
ffffffffc0203666:	07a53023          	sd	s10,96(a0)
ffffffffc020366a:	07b53423          	sd	s11,104(a0)
ffffffffc020366e:	0005b083          	ld	ra,0(a1)
ffffffffc0203672:	0085b103          	ld	sp,8(a1)
ffffffffc0203676:	6980                	ld	s0,16(a1)
ffffffffc0203678:	6d84                	ld	s1,24(a1)
ffffffffc020367a:	0205b903          	ld	s2,32(a1)
ffffffffc020367e:	0285b983          	ld	s3,40(a1)
ffffffffc0203682:	0305ba03          	ld	s4,48(a1)
ffffffffc0203686:	0385ba83          	ld	s5,56(a1)
ffffffffc020368a:	0405bb03          	ld	s6,64(a1)
ffffffffc020368e:	0485bb83          	ld	s7,72(a1)
ffffffffc0203692:	0505bc03          	ld	s8,80(a1)
ffffffffc0203696:	0585bc83          	ld	s9,88(a1)
ffffffffc020369a:	0605bd03          	ld	s10,96(a1)
ffffffffc020369e:	0685bd83          	ld	s11,104(a1)
ffffffffc02036a2:	8082                	ret

ffffffffc02036a4 <kernel_thread_entry>:
ffffffffc02036a4:	8526                	mv	a0,s1
ffffffffc02036a6:	9402                	jalr	s0
ffffffffc02036a8:	616000ef          	jal	ra,ffffffffc0203cbe <do_exit>

ffffffffc02036ac <alloc_proc>:
ffffffffc02036ac:	1141                	addi	sp,sp,-16
ffffffffc02036ae:	14800513          	li	a0,328
ffffffffc02036b2:	e022                	sd	s0,0(sp)
ffffffffc02036b4:	e406                	sd	ra,8(sp)
ffffffffc02036b6:	fd5fd0ef          	jal	ra,ffffffffc020168a <kmalloc>
ffffffffc02036ba:	842a                	mv	s0,a0
ffffffffc02036bc:	cd21                	beqz	a0,ffffffffc0203714 <alloc_proc+0x68>
ffffffffc02036be:	57fd                	li	a5,-1
ffffffffc02036c0:	1782                	slli	a5,a5,0x20
ffffffffc02036c2:	e11c                	sd	a5,0(a0)
ffffffffc02036c4:	07000613          	li	a2,112
ffffffffc02036c8:	4581                	li	a1,0
ffffffffc02036ca:	00052423          	sw	zero,8(a0)
ffffffffc02036ce:	00053823          	sd	zero,16(a0)
ffffffffc02036d2:	00053c23          	sd	zero,24(a0)
ffffffffc02036d6:	02053023          	sd	zero,32(a0)
ffffffffc02036da:	02053423          	sd	zero,40(a0)
ffffffffc02036de:	03050513          	addi	a0,a0,48
ffffffffc02036e2:	3dc040ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc02036e6:	00016797          	auipc	a5,0x16
ffffffffc02036ea:	f527b783          	ld	a5,-174(a5) # ffffffffc0219638 <boot_cr3>
ffffffffc02036ee:	0a043023          	sd	zero,160(s0)
ffffffffc02036f2:	f45c                	sd	a5,168(s0)
ffffffffc02036f4:	0a042823          	sw	zero,176(s0)
ffffffffc02036f8:	463d                	li	a2,15
ffffffffc02036fa:	4581                	li	a1,0
ffffffffc02036fc:	0b440513          	addi	a0,s0,180
ffffffffc0203700:	3be040ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc0203704:	0e042623          	sw	zero,236(s0)
ffffffffc0203708:	0e043c23          	sd	zero,248(s0)
ffffffffc020370c:	10043023          	sd	zero,256(s0)
ffffffffc0203710:	0e043823          	sd	zero,240(s0)
ffffffffc0203714:	60a2                	ld	ra,8(sp)
ffffffffc0203716:	8522                	mv	a0,s0
ffffffffc0203718:	6402                	ld	s0,0(sp)
ffffffffc020371a:	0141                	addi	sp,sp,16
ffffffffc020371c:	8082                	ret

ffffffffc020371e <forkret>:
ffffffffc020371e:	00016797          	auipc	a5,0x16
ffffffffc0203722:	dda7b783          	ld	a5,-550(a5) # ffffffffc02194f8 <current>
ffffffffc0203726:	73c8                	ld	a0,160(a5)
ffffffffc0203728:	e02fd06f          	j	ffffffffc0200d2a <forkrets>

ffffffffc020372c <setup_pgdir.isra.0>:
ffffffffc020372c:	1101                	addi	sp,sp,-32
ffffffffc020372e:	e426                	sd	s1,8(sp)
ffffffffc0203730:	84aa                	mv	s1,a0
ffffffffc0203732:	4505                	li	a0,1
ffffffffc0203734:	ec06                	sd	ra,24(sp)
ffffffffc0203736:	e822                	sd	s0,16(sp)
ffffffffc0203738:	fa7fe0ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc020373c:	c939                	beqz	a0,ffffffffc0203792 <setup_pgdir.isra.0+0x66>
ffffffffc020373e:	00016697          	auipc	a3,0x16
ffffffffc0203742:	f026b683          	ld	a3,-254(a3) # ffffffffc0219640 <pages>
ffffffffc0203746:	40d506b3          	sub	a3,a0,a3
ffffffffc020374a:	8699                	srai	a3,a3,0x6
ffffffffc020374c:	00007417          	auipc	s0,0x7
ffffffffc0203750:	df443403          	ld	s0,-524(s0) # ffffffffc020a540 <nbase>
ffffffffc0203754:	96a2                	add	a3,a3,s0
ffffffffc0203756:	00c69793          	slli	a5,a3,0xc
ffffffffc020375a:	83b1                	srli	a5,a5,0xc
ffffffffc020375c:	00016717          	auipc	a4,0x16
ffffffffc0203760:	d9473703          	ld	a4,-620(a4) # ffffffffc02194f0 <npage>
ffffffffc0203764:	06b2                	slli	a3,a3,0xc
ffffffffc0203766:	02e7f863          	bgeu	a5,a4,ffffffffc0203796 <setup_pgdir.isra.0+0x6a>
ffffffffc020376a:	00016417          	auipc	s0,0x16
ffffffffc020376e:	ec643403          	ld	s0,-314(s0) # ffffffffc0219630 <va_pa_offset>
ffffffffc0203772:	9436                	add	s0,s0,a3
ffffffffc0203774:	6605                	lui	a2,0x1
ffffffffc0203776:	00016597          	auipc	a1,0x16
ffffffffc020377a:	d725b583          	ld	a1,-654(a1) # ffffffffc02194e8 <boot_pgdir>
ffffffffc020377e:	8522                	mv	a0,s0
ffffffffc0203780:	350040ef          	jal	ra,ffffffffc0207ad0 <memcpy>
ffffffffc0203784:	4501                	li	a0,0
ffffffffc0203786:	e080                	sd	s0,0(s1)
ffffffffc0203788:	60e2                	ld	ra,24(sp)
ffffffffc020378a:	6442                	ld	s0,16(sp)
ffffffffc020378c:	64a2                	ld	s1,8(sp)
ffffffffc020378e:	6105                	addi	sp,sp,32
ffffffffc0203790:	8082                	ret
ffffffffc0203792:	5571                	li	a0,-4
ffffffffc0203794:	bfd5                	j	ffffffffc0203788 <setup_pgdir.isra.0+0x5c>
ffffffffc0203796:	00005617          	auipc	a2,0x5
ffffffffc020379a:	3ea60613          	addi	a2,a2,1002 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc020379e:	06900593          	li	a1,105
ffffffffc02037a2:	00005517          	auipc	a0,0x5
ffffffffc02037a6:	40650513          	addi	a0,a0,1030 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc02037aa:	a5ffc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02037ae <set_proc_name>:
ffffffffc02037ae:	1101                	addi	sp,sp,-32
ffffffffc02037b0:	e822                	sd	s0,16(sp)
ffffffffc02037b2:	0b450413          	addi	s0,a0,180
ffffffffc02037b6:	e426                	sd	s1,8(sp)
ffffffffc02037b8:	4641                	li	a2,16
ffffffffc02037ba:	84ae                	mv	s1,a1
ffffffffc02037bc:	8522                	mv	a0,s0
ffffffffc02037be:	4581                	li	a1,0
ffffffffc02037c0:	ec06                	sd	ra,24(sp)
ffffffffc02037c2:	2fc040ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc02037c6:	8522                	mv	a0,s0
ffffffffc02037c8:	6442                	ld	s0,16(sp)
ffffffffc02037ca:	60e2                	ld	ra,24(sp)
ffffffffc02037cc:	85a6                	mv	a1,s1
ffffffffc02037ce:	64a2                	ld	s1,8(sp)
ffffffffc02037d0:	463d                	li	a2,15
ffffffffc02037d2:	6105                	addi	sp,sp,32
ffffffffc02037d4:	2fc0406f          	j	ffffffffc0207ad0 <memcpy>

ffffffffc02037d8 <proc_run>:
ffffffffc02037d8:	7179                	addi	sp,sp,-48
ffffffffc02037da:	ec4a                	sd	s2,24(sp)
ffffffffc02037dc:	00016917          	auipc	s2,0x16
ffffffffc02037e0:	d1c90913          	addi	s2,s2,-740 # ffffffffc02194f8 <current>
ffffffffc02037e4:	f026                	sd	s1,32(sp)
ffffffffc02037e6:	00093483          	ld	s1,0(s2)
ffffffffc02037ea:	f406                	sd	ra,40(sp)
ffffffffc02037ec:	e84e                	sd	s3,16(sp)
ffffffffc02037ee:	02a48863          	beq	s1,a0,ffffffffc020381e <proc_run+0x46>
ffffffffc02037f2:	100027f3          	csrr	a5,sstatus
ffffffffc02037f6:	8b89                	andi	a5,a5,2
ffffffffc02037f8:	4981                	li	s3,0
ffffffffc02037fa:	ef9d                	bnez	a5,ffffffffc0203838 <proc_run+0x60>
ffffffffc02037fc:	755c                	ld	a5,168(a0)
ffffffffc02037fe:	577d                	li	a4,-1
ffffffffc0203800:	177e                	slli	a4,a4,0x3f
ffffffffc0203802:	83b1                	srli	a5,a5,0xc
ffffffffc0203804:	00a93023          	sd	a0,0(s2)
ffffffffc0203808:	8fd9                	or	a5,a5,a4
ffffffffc020380a:	18079073          	csrw	satp,a5
ffffffffc020380e:	03050593          	addi	a1,a0,48
ffffffffc0203812:	03048513          	addi	a0,s1,48
ffffffffc0203816:	e25ff0ef          	jal	ra,ffffffffc020363a <switch_to>
ffffffffc020381a:	00099863          	bnez	s3,ffffffffc020382a <proc_run+0x52>
ffffffffc020381e:	70a2                	ld	ra,40(sp)
ffffffffc0203820:	7482                	ld	s1,32(sp)
ffffffffc0203822:	6962                	ld	s2,24(sp)
ffffffffc0203824:	69c2                	ld	s3,16(sp)
ffffffffc0203826:	6145                	addi	sp,sp,48
ffffffffc0203828:	8082                	ret
ffffffffc020382a:	70a2                	ld	ra,40(sp)
ffffffffc020382c:	7482                	ld	s1,32(sp)
ffffffffc020382e:	6962                	ld	s2,24(sp)
ffffffffc0203830:	69c2                	ld	s3,16(sp)
ffffffffc0203832:	6145                	addi	sp,sp,48
ffffffffc0203834:	dfffc06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0203838:	e42a                	sd	a0,8(sp)
ffffffffc020383a:	dfffc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc020383e:	6522                	ld	a0,8(sp)
ffffffffc0203840:	4985                	li	s3,1
ffffffffc0203842:	bf6d                	j	ffffffffc02037fc <proc_run+0x24>

ffffffffc0203844 <find_proc>:
ffffffffc0203844:	6789                	lui	a5,0x2
ffffffffc0203846:	fff5071b          	addiw	a4,a0,-1
ffffffffc020384a:	17f9                	addi	a5,a5,-2
ffffffffc020384c:	04e7e063          	bltu	a5,a4,ffffffffc020388c <find_proc+0x48>
ffffffffc0203850:	1141                	addi	sp,sp,-16
ffffffffc0203852:	e022                	sd	s0,0(sp)
ffffffffc0203854:	45a9                	li	a1,10
ffffffffc0203856:	842a                	mv	s0,a0
ffffffffc0203858:	2501                	sext.w	a0,a0
ffffffffc020385a:	e406                	sd	ra,8(sp)
ffffffffc020385c:	67a040ef          	jal	ra,ffffffffc0207ed6 <hash32>
ffffffffc0203860:	02051693          	slli	a3,a0,0x20
ffffffffc0203864:	00012797          	auipc	a5,0x12
ffffffffc0203868:	c2c78793          	addi	a5,a5,-980 # ffffffffc0215490 <hash_list>
ffffffffc020386c:	82f1                	srli	a3,a3,0x1c
ffffffffc020386e:	96be                	add	a3,a3,a5
ffffffffc0203870:	87b6                	mv	a5,a3
ffffffffc0203872:	a029                	j	ffffffffc020387c <find_proc+0x38>
ffffffffc0203874:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0203878:	00870c63          	beq	a4,s0,ffffffffc0203890 <find_proc+0x4c>
ffffffffc020387c:	679c                	ld	a5,8(a5)
ffffffffc020387e:	fef69be3          	bne	a3,a5,ffffffffc0203874 <find_proc+0x30>
ffffffffc0203882:	60a2                	ld	ra,8(sp)
ffffffffc0203884:	6402                	ld	s0,0(sp)
ffffffffc0203886:	4501                	li	a0,0
ffffffffc0203888:	0141                	addi	sp,sp,16
ffffffffc020388a:	8082                	ret
ffffffffc020388c:	4501                	li	a0,0
ffffffffc020388e:	8082                	ret
ffffffffc0203890:	60a2                	ld	ra,8(sp)
ffffffffc0203892:	6402                	ld	s0,0(sp)
ffffffffc0203894:	f2878513          	addi	a0,a5,-216
ffffffffc0203898:	0141                	addi	sp,sp,16
ffffffffc020389a:	8082                	ret

ffffffffc020389c <do_fork>:
ffffffffc020389c:	7159                	addi	sp,sp,-112
ffffffffc020389e:	e4ce                	sd	s3,72(sp)
ffffffffc02038a0:	00016997          	auipc	s3,0x16
ffffffffc02038a4:	c7098993          	addi	s3,s3,-912 # ffffffffc0219510 <nr_process>
ffffffffc02038a8:	0009a703          	lw	a4,0(s3)
ffffffffc02038ac:	f486                	sd	ra,104(sp)
ffffffffc02038ae:	f0a2                	sd	s0,96(sp)
ffffffffc02038b0:	eca6                	sd	s1,88(sp)
ffffffffc02038b2:	e8ca                	sd	s2,80(sp)
ffffffffc02038b4:	e0d2                	sd	s4,64(sp)
ffffffffc02038b6:	fc56                	sd	s5,56(sp)
ffffffffc02038b8:	f85a                	sd	s6,48(sp)
ffffffffc02038ba:	f45e                	sd	s7,40(sp)
ffffffffc02038bc:	f062                	sd	s8,32(sp)
ffffffffc02038be:	ec66                	sd	s9,24(sp)
ffffffffc02038c0:	e86a                	sd	s10,16(sp)
ffffffffc02038c2:	e46e                	sd	s11,8(sp)
ffffffffc02038c4:	6785                	lui	a5,0x1
ffffffffc02038c6:	30f75f63          	bge	a4,a5,ffffffffc0203be4 <do_fork+0x348>
ffffffffc02038ca:	8a2a                	mv	s4,a0
ffffffffc02038cc:	892e                	mv	s2,a1
ffffffffc02038ce:	84b2                	mv	s1,a2
ffffffffc02038d0:	dddff0ef          	jal	ra,ffffffffc02036ac <alloc_proc>
ffffffffc02038d4:	842a                	mv	s0,a0
ffffffffc02038d6:	28050263          	beqz	a0,ffffffffc0203b5a <do_fork+0x2be>
ffffffffc02038da:	00016b97          	auipc	s7,0x16
ffffffffc02038de:	c1eb8b93          	addi	s7,s7,-994 # ffffffffc02194f8 <current>
ffffffffc02038e2:	000bb783          	ld	a5,0(s7)
ffffffffc02038e6:	0ec7a703          	lw	a4,236(a5) # 10ec <kern_entry-0xffffffffc01fef14>
ffffffffc02038ea:	f11c                	sd	a5,32(a0)
ffffffffc02038ec:	30071c63          	bnez	a4,ffffffffc0203c04 <do_fork+0x368>
ffffffffc02038f0:	4509                	li	a0,2
ffffffffc02038f2:	dedfe0ef          	jal	ra,ffffffffc02026de <alloc_pages>
ffffffffc02038f6:	24050f63          	beqz	a0,ffffffffc0203b54 <do_fork+0x2b8>
ffffffffc02038fa:	00016c17          	auipc	s8,0x16
ffffffffc02038fe:	d46c0c13          	addi	s8,s8,-698 # ffffffffc0219640 <pages>
ffffffffc0203902:	000c3683          	ld	a3,0(s8)
ffffffffc0203906:	00007a97          	auipc	s5,0x7
ffffffffc020390a:	c3aaba83          	ld	s5,-966(s5) # ffffffffc020a540 <nbase>
ffffffffc020390e:	00016c97          	auipc	s9,0x16
ffffffffc0203912:	be2c8c93          	addi	s9,s9,-1054 # ffffffffc02194f0 <npage>
ffffffffc0203916:	40d506b3          	sub	a3,a0,a3
ffffffffc020391a:	8699                	srai	a3,a3,0x6
ffffffffc020391c:	96d6                	add	a3,a3,s5
ffffffffc020391e:	000cb703          	ld	a4,0(s9)
ffffffffc0203922:	00c69793          	slli	a5,a3,0xc
ffffffffc0203926:	83b1                	srli	a5,a5,0xc
ffffffffc0203928:	06b2                	slli	a3,a3,0xc
ffffffffc020392a:	2ce7f163          	bgeu	a5,a4,ffffffffc0203bec <do_fork+0x350>
ffffffffc020392e:	000bb703          	ld	a4,0(s7)
ffffffffc0203932:	00016d17          	auipc	s10,0x16
ffffffffc0203936:	cfed0d13          	addi	s10,s10,-770 # ffffffffc0219630 <va_pa_offset>
ffffffffc020393a:	000d3783          	ld	a5,0(s10)
ffffffffc020393e:	02873b03          	ld	s6,40(a4)
ffffffffc0203942:	96be                	add	a3,a3,a5
ffffffffc0203944:	e814                	sd	a3,16(s0)
ffffffffc0203946:	020b0863          	beqz	s6,ffffffffc0203976 <do_fork+0xda>
ffffffffc020394a:	100a7a13          	andi	s4,s4,256
ffffffffc020394e:	1c0a0163          	beqz	s4,ffffffffc0203b10 <do_fork+0x274>
ffffffffc0203952:	030b2703          	lw	a4,48(s6)
ffffffffc0203956:	018b3783          	ld	a5,24(s6)
ffffffffc020395a:	c02006b7          	lui	a3,0xc0200
ffffffffc020395e:	2705                	addiw	a4,a4,1
ffffffffc0203960:	02eb2823          	sw	a4,48(s6)
ffffffffc0203964:	03643423          	sd	s6,40(s0)
ffffffffc0203968:	2ad7ee63          	bltu	a5,a3,ffffffffc0203c24 <do_fork+0x388>
ffffffffc020396c:	000d3703          	ld	a4,0(s10)
ffffffffc0203970:	6814                	ld	a3,16(s0)
ffffffffc0203972:	8f99                	sub	a5,a5,a4
ffffffffc0203974:	f45c                	sd	a5,168(s0)
ffffffffc0203976:	6789                	lui	a5,0x2
ffffffffc0203978:	ee078793          	addi	a5,a5,-288 # 1ee0 <kern_entry-0xffffffffc01fe120>
ffffffffc020397c:	97b6                	add	a5,a5,a3
ffffffffc020397e:	8626                	mv	a2,s1
ffffffffc0203980:	f05c                	sd	a5,160(s0)
ffffffffc0203982:	873e                	mv	a4,a5
ffffffffc0203984:	12048313          	addi	t1,s1,288
ffffffffc0203988:	00063883          	ld	a7,0(a2)
ffffffffc020398c:	00863803          	ld	a6,8(a2)
ffffffffc0203990:	6a08                	ld	a0,16(a2)
ffffffffc0203992:	6e0c                	ld	a1,24(a2)
ffffffffc0203994:	01173023          	sd	a7,0(a4)
ffffffffc0203998:	01073423          	sd	a6,8(a4)
ffffffffc020399c:	eb08                	sd	a0,16(a4)
ffffffffc020399e:	ef0c                	sd	a1,24(a4)
ffffffffc02039a0:	02060613          	addi	a2,a2,32
ffffffffc02039a4:	02070713          	addi	a4,a4,32
ffffffffc02039a8:	fe6610e3          	bne	a2,t1,ffffffffc0203988 <do_fork+0xec>
ffffffffc02039ac:	0407b823          	sd	zero,80(a5)
ffffffffc02039b0:	12090a63          	beqz	s2,ffffffffc0203ae4 <do_fork+0x248>
ffffffffc02039b4:	0127b823          	sd	s2,16(a5)
ffffffffc02039b8:	00000717          	auipc	a4,0x0
ffffffffc02039bc:	d6670713          	addi	a4,a4,-666 # ffffffffc020371e <forkret>
ffffffffc02039c0:	f818                	sd	a4,48(s0)
ffffffffc02039c2:	fc1c                	sd	a5,56(s0)
ffffffffc02039c4:	100027f3          	csrr	a5,sstatus
ffffffffc02039c8:	8b89                	andi	a5,a5,2
ffffffffc02039ca:	4901                	li	s2,0
ffffffffc02039cc:	12079e63          	bnez	a5,ffffffffc0203b08 <do_fork+0x26c>
ffffffffc02039d0:	0000a597          	auipc	a1,0xa
ffffffffc02039d4:	6b858593          	addi	a1,a1,1720 # ffffffffc020e088 <last_pid.1812>
ffffffffc02039d8:	419c                	lw	a5,0(a1)
ffffffffc02039da:	6709                	lui	a4,0x2
ffffffffc02039dc:	0017851b          	addiw	a0,a5,1
ffffffffc02039e0:	c188                	sw	a0,0(a1)
ffffffffc02039e2:	08e55b63          	bge	a0,a4,ffffffffc0203a78 <do_fork+0x1dc>
ffffffffc02039e6:	0000a897          	auipc	a7,0xa
ffffffffc02039ea:	6a688893          	addi	a7,a7,1702 # ffffffffc020e08c <next_safe.1811>
ffffffffc02039ee:	0008a783          	lw	a5,0(a7)
ffffffffc02039f2:	00016497          	auipc	s1,0x16
ffffffffc02039f6:	cb648493          	addi	s1,s1,-842 # ffffffffc02196a8 <proc_list>
ffffffffc02039fa:	08f55663          	bge	a0,a5,ffffffffc0203a86 <do_fork+0x1ea>
ffffffffc02039fe:	c048                	sw	a0,4(s0)
ffffffffc0203a00:	45a9                	li	a1,10
ffffffffc0203a02:	2501                	sext.w	a0,a0
ffffffffc0203a04:	4d2040ef          	jal	ra,ffffffffc0207ed6 <hash32>
ffffffffc0203a08:	1502                	slli	a0,a0,0x20
ffffffffc0203a0a:	00012797          	auipc	a5,0x12
ffffffffc0203a0e:	a8678793          	addi	a5,a5,-1402 # ffffffffc0215490 <hash_list>
ffffffffc0203a12:	8171                	srli	a0,a0,0x1c
ffffffffc0203a14:	953e                	add	a0,a0,a5
ffffffffc0203a16:	650c                	ld	a1,8(a0)
ffffffffc0203a18:	7014                	ld	a3,32(s0)
ffffffffc0203a1a:	0d840793          	addi	a5,s0,216
ffffffffc0203a1e:	e19c                	sd	a5,0(a1)
ffffffffc0203a20:	6490                	ld	a2,8(s1)
ffffffffc0203a22:	e51c                	sd	a5,8(a0)
ffffffffc0203a24:	7af8                	ld	a4,240(a3)
ffffffffc0203a26:	0c840793          	addi	a5,s0,200
ffffffffc0203a2a:	f06c                	sd	a1,224(s0)
ffffffffc0203a2c:	ec68                	sd	a0,216(s0)
ffffffffc0203a2e:	e21c                	sd	a5,0(a2)
ffffffffc0203a30:	e49c                	sd	a5,8(s1)
ffffffffc0203a32:	e870                	sd	a2,208(s0)
ffffffffc0203a34:	e464                	sd	s1,200(s0)
ffffffffc0203a36:	0e043c23          	sd	zero,248(s0)
ffffffffc0203a3a:	10e43023          	sd	a4,256(s0)
ffffffffc0203a3e:	c311                	beqz	a4,ffffffffc0203a42 <do_fork+0x1a6>
ffffffffc0203a40:	ff60                	sd	s0,248(a4)
ffffffffc0203a42:	0009a783          	lw	a5,0(s3)
ffffffffc0203a46:	fae0                	sd	s0,240(a3)
ffffffffc0203a48:	2785                	addiw	a5,a5,1
ffffffffc0203a4a:	00f9a023          	sw	a5,0(s3)
ffffffffc0203a4e:	10091863          	bnez	s2,ffffffffc0203b5e <do_fork+0x2c2>
ffffffffc0203a52:	8522                	mv	a0,s0
ffffffffc0203a54:	733000ef          	jal	ra,ffffffffc0204986 <wakeup_proc>
ffffffffc0203a58:	4048                	lw	a0,4(s0)
ffffffffc0203a5a:	70a6                	ld	ra,104(sp)
ffffffffc0203a5c:	7406                	ld	s0,96(sp)
ffffffffc0203a5e:	64e6                	ld	s1,88(sp)
ffffffffc0203a60:	6946                	ld	s2,80(sp)
ffffffffc0203a62:	69a6                	ld	s3,72(sp)
ffffffffc0203a64:	6a06                	ld	s4,64(sp)
ffffffffc0203a66:	7ae2                	ld	s5,56(sp)
ffffffffc0203a68:	7b42                	ld	s6,48(sp)
ffffffffc0203a6a:	7ba2                	ld	s7,40(sp)
ffffffffc0203a6c:	7c02                	ld	s8,32(sp)
ffffffffc0203a6e:	6ce2                	ld	s9,24(sp)
ffffffffc0203a70:	6d42                	ld	s10,16(sp)
ffffffffc0203a72:	6da2                	ld	s11,8(sp)
ffffffffc0203a74:	6165                	addi	sp,sp,112
ffffffffc0203a76:	8082                	ret
ffffffffc0203a78:	4785                	li	a5,1
ffffffffc0203a7a:	c19c                	sw	a5,0(a1)
ffffffffc0203a7c:	4505                	li	a0,1
ffffffffc0203a7e:	0000a897          	auipc	a7,0xa
ffffffffc0203a82:	60e88893          	addi	a7,a7,1550 # ffffffffc020e08c <next_safe.1811>
ffffffffc0203a86:	00016497          	auipc	s1,0x16
ffffffffc0203a8a:	c2248493          	addi	s1,s1,-990 # ffffffffc02196a8 <proc_list>
ffffffffc0203a8e:	0084b303          	ld	t1,8(s1)
ffffffffc0203a92:	6789                	lui	a5,0x2
ffffffffc0203a94:	00f8a023          	sw	a5,0(a7)
ffffffffc0203a98:	4801                	li	a6,0
ffffffffc0203a9a:	87aa                	mv	a5,a0
ffffffffc0203a9c:	6e89                	lui	t4,0x2
ffffffffc0203a9e:	12930e63          	beq	t1,s1,ffffffffc0203bda <do_fork+0x33e>
ffffffffc0203aa2:	8e42                	mv	t3,a6
ffffffffc0203aa4:	869a                	mv	a3,t1
ffffffffc0203aa6:	6609                	lui	a2,0x2
ffffffffc0203aa8:	a811                	j	ffffffffc0203abc <do_fork+0x220>
ffffffffc0203aaa:	00e7d663          	bge	a5,a4,ffffffffc0203ab6 <do_fork+0x21a>
ffffffffc0203aae:	00c75463          	bge	a4,a2,ffffffffc0203ab6 <do_fork+0x21a>
ffffffffc0203ab2:	863a                	mv	a2,a4
ffffffffc0203ab4:	4e05                	li	t3,1
ffffffffc0203ab6:	6694                	ld	a3,8(a3)
ffffffffc0203ab8:	00968d63          	beq	a3,s1,ffffffffc0203ad2 <do_fork+0x236>
ffffffffc0203abc:	f3c6a703          	lw	a4,-196(a3) # ffffffffc01fff3c <kern_entry-0xc4>
ffffffffc0203ac0:	fef715e3          	bne	a4,a5,ffffffffc0203aaa <do_fork+0x20e>
ffffffffc0203ac4:	2785                	addiw	a5,a5,1
ffffffffc0203ac6:	08c7df63          	bge	a5,a2,ffffffffc0203b64 <do_fork+0x2c8>
ffffffffc0203aca:	6694                	ld	a3,8(a3)
ffffffffc0203acc:	4805                	li	a6,1
ffffffffc0203ace:	fe9697e3          	bne	a3,s1,ffffffffc0203abc <do_fork+0x220>
ffffffffc0203ad2:	00080463          	beqz	a6,ffffffffc0203ada <do_fork+0x23e>
ffffffffc0203ad6:	c19c                	sw	a5,0(a1)
ffffffffc0203ad8:	853e                	mv	a0,a5
ffffffffc0203ada:	f20e02e3          	beqz	t3,ffffffffc02039fe <do_fork+0x162>
ffffffffc0203ade:	00c8a023          	sw	a2,0(a7)
ffffffffc0203ae2:	bf31                	j	ffffffffc02039fe <do_fork+0x162>
ffffffffc0203ae4:	6909                	lui	s2,0x2
ffffffffc0203ae6:	edc90913          	addi	s2,s2,-292 # 1edc <kern_entry-0xffffffffc01fe124>
ffffffffc0203aea:	9936                	add	s2,s2,a3
ffffffffc0203aec:	0127b823          	sd	s2,16(a5) # 2010 <kern_entry-0xffffffffc01fdff0>
ffffffffc0203af0:	00000717          	auipc	a4,0x0
ffffffffc0203af4:	c2e70713          	addi	a4,a4,-978 # ffffffffc020371e <forkret>
ffffffffc0203af8:	f818                	sd	a4,48(s0)
ffffffffc0203afa:	fc1c                	sd	a5,56(s0)
ffffffffc0203afc:	100027f3          	csrr	a5,sstatus
ffffffffc0203b00:	8b89                	andi	a5,a5,2
ffffffffc0203b02:	4901                	li	s2,0
ffffffffc0203b04:	ec0786e3          	beqz	a5,ffffffffc02039d0 <do_fork+0x134>
ffffffffc0203b08:	b31fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203b0c:	4905                	li	s2,1
ffffffffc0203b0e:	b5c9                	j	ffffffffc02039d0 <do_fork+0x134>
ffffffffc0203b10:	a42fd0ef          	jal	ra,ffffffffc0200d52 <mm_create>
ffffffffc0203b14:	8a2a                	mv	s4,a0
ffffffffc0203b16:	c901                	beqz	a0,ffffffffc0203b26 <do_fork+0x28a>
ffffffffc0203b18:	0561                	addi	a0,a0,24
ffffffffc0203b1a:	c13ff0ef          	jal	ra,ffffffffc020372c <setup_pgdir.isra.0>
ffffffffc0203b1e:	c921                	beqz	a0,ffffffffc0203b6e <do_fork+0x2d2>
ffffffffc0203b20:	8552                	mv	a0,s4
ffffffffc0203b22:	b8efd0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0203b26:	6814                	ld	a3,16(s0)
ffffffffc0203b28:	c02007b7          	lui	a5,0xc0200
ffffffffc0203b2c:	12f6e563          	bltu	a3,a5,ffffffffc0203c56 <do_fork+0x3ba>
ffffffffc0203b30:	000d3783          	ld	a5,0(s10)
ffffffffc0203b34:	000cb703          	ld	a4,0(s9)
ffffffffc0203b38:	40f687b3          	sub	a5,a3,a5
ffffffffc0203b3c:	83b1                	srli	a5,a5,0xc
ffffffffc0203b3e:	10e7f063          	bgeu	a5,a4,ffffffffc0203c3e <do_fork+0x3a2>
ffffffffc0203b42:	000c3503          	ld	a0,0(s8)
ffffffffc0203b46:	415787b3          	sub	a5,a5,s5
ffffffffc0203b4a:	079a                	slli	a5,a5,0x6
ffffffffc0203b4c:	4589                	li	a1,2
ffffffffc0203b4e:	953e                	add	a0,a0,a5
ffffffffc0203b50:	c21fe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203b54:	8522                	mv	a0,s0
ffffffffc0203b56:	be5fd0ef          	jal	ra,ffffffffc020173a <kfree>
ffffffffc0203b5a:	5571                	li	a0,-4
ffffffffc0203b5c:	bdfd                	j	ffffffffc0203a5a <do_fork+0x1be>
ffffffffc0203b5e:	ad5fc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203b62:	bdc5                	j	ffffffffc0203a52 <do_fork+0x1b6>
ffffffffc0203b64:	01d7c363          	blt	a5,t4,ffffffffc0203b6a <do_fork+0x2ce>
ffffffffc0203b68:	4785                	li	a5,1
ffffffffc0203b6a:	4805                	li	a6,1
ffffffffc0203b6c:	bf0d                	j	ffffffffc0203a9e <do_fork+0x202>
ffffffffc0203b6e:	038b0d93          	addi	s11,s6,56
ffffffffc0203b72:	856e                	mv	a0,s11
ffffffffc0203b74:	f6eff0ef          	jal	ra,ffffffffc02032e2 <down>
ffffffffc0203b78:	000bb783          	ld	a5,0(s7)
ffffffffc0203b7c:	c781                	beqz	a5,ffffffffc0203b84 <do_fork+0x2e8>
ffffffffc0203b7e:	43dc                	lw	a5,4(a5)
ffffffffc0203b80:	04fb2823          	sw	a5,80(s6)
ffffffffc0203b84:	85da                	mv	a1,s6
ffffffffc0203b86:	8552                	mv	a0,s4
ffffffffc0203b88:	c2afd0ef          	jal	ra,ffffffffc0200fb2 <dup_mmap>
ffffffffc0203b8c:	8baa                	mv	s7,a0
ffffffffc0203b8e:	856e                	mv	a0,s11
ffffffffc0203b90:	f50ff0ef          	jal	ra,ffffffffc02032e0 <up>
ffffffffc0203b94:	040b2823          	sw	zero,80(s6)
ffffffffc0203b98:	8b52                	mv	s6,s4
ffffffffc0203b9a:	da0b8ce3          	beqz	s7,ffffffffc0203952 <do_fork+0xb6>
ffffffffc0203b9e:	8552                	mv	a0,s4
ffffffffc0203ba0:	cacfd0ef          	jal	ra,ffffffffc020104c <exit_mmap>
ffffffffc0203ba4:	018a3683          	ld	a3,24(s4) # 1018 <kern_entry-0xffffffffc01fefe8>
ffffffffc0203ba8:	c02007b7          	lui	a5,0xc0200
ffffffffc0203bac:	0af6e563          	bltu	a3,a5,ffffffffc0203c56 <do_fork+0x3ba>
ffffffffc0203bb0:	000d3703          	ld	a4,0(s10)
ffffffffc0203bb4:	000cb783          	ld	a5,0(s9)
ffffffffc0203bb8:	8e99                	sub	a3,a3,a4
ffffffffc0203bba:	82b1                	srli	a3,a3,0xc
ffffffffc0203bbc:	08f6f163          	bgeu	a3,a5,ffffffffc0203c3e <do_fork+0x3a2>
ffffffffc0203bc0:	000c3503          	ld	a0,0(s8)
ffffffffc0203bc4:	415686b3          	sub	a3,a3,s5
ffffffffc0203bc8:	069a                	slli	a3,a3,0x6
ffffffffc0203bca:	9536                	add	a0,a0,a3
ffffffffc0203bcc:	4585                	li	a1,1
ffffffffc0203bce:	ba3fe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203bd2:	8552                	mv	a0,s4
ffffffffc0203bd4:	adcfd0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0203bd8:	b7b9                	j	ffffffffc0203b26 <do_fork+0x28a>
ffffffffc0203bda:	00080763          	beqz	a6,ffffffffc0203be8 <do_fork+0x34c>
ffffffffc0203bde:	c19c                	sw	a5,0(a1)
ffffffffc0203be0:	853e                	mv	a0,a5
ffffffffc0203be2:	bd31                	j	ffffffffc02039fe <do_fork+0x162>
ffffffffc0203be4:	556d                	li	a0,-5
ffffffffc0203be6:	bd95                	j	ffffffffc0203a5a <do_fork+0x1be>
ffffffffc0203be8:	4188                	lw	a0,0(a1)
ffffffffc0203bea:	bd11                	j	ffffffffc02039fe <do_fork+0x162>
ffffffffc0203bec:	00005617          	auipc	a2,0x5
ffffffffc0203bf0:	f9460613          	addi	a2,a2,-108 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc0203bf4:	06900593          	li	a1,105
ffffffffc0203bf8:	00005517          	auipc	a0,0x5
ffffffffc0203bfc:	fb050513          	addi	a0,a0,-80 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0203c00:	e08fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203c04:	00006697          	auipc	a3,0x6
ffffffffc0203c08:	87c68693          	addi	a3,a3,-1924 # ffffffffc0209480 <default_pmm_manager+0x2c0>
ffffffffc0203c0c:	00005617          	auipc	a2,0x5
ffffffffc0203c10:	99460613          	addi	a2,a2,-1644 # ffffffffc02085a0 <commands+0x410>
ffffffffc0203c14:	1a600593          	li	a1,422
ffffffffc0203c18:	00006517          	auipc	a0,0x6
ffffffffc0203c1c:	88850513          	addi	a0,a0,-1912 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0203c20:	de8fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203c24:	86be                	mv	a3,a5
ffffffffc0203c26:	00005617          	auipc	a2,0x5
ffffffffc0203c2a:	fca60613          	addi	a2,a2,-54 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc0203c2e:	15900593          	li	a1,345
ffffffffc0203c32:	00006517          	auipc	a0,0x6
ffffffffc0203c36:	86e50513          	addi	a0,a0,-1938 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0203c3a:	dcefc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203c3e:	00005617          	auipc	a2,0x5
ffffffffc0203c42:	fda60613          	addi	a2,a2,-38 # ffffffffc0208c18 <commands+0xa88>
ffffffffc0203c46:	06200593          	li	a1,98
ffffffffc0203c4a:	00005517          	auipc	a0,0x5
ffffffffc0203c4e:	f5e50513          	addi	a0,a0,-162 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0203c52:	db6fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203c56:	00005617          	auipc	a2,0x5
ffffffffc0203c5a:	f9a60613          	addi	a2,a2,-102 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc0203c5e:	06e00593          	li	a1,110
ffffffffc0203c62:	00005517          	auipc	a0,0x5
ffffffffc0203c66:	f4650513          	addi	a0,a0,-186 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0203c6a:	d9efc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203c6e <kernel_thread>:
ffffffffc0203c6e:	7129                	addi	sp,sp,-320
ffffffffc0203c70:	fa22                	sd	s0,304(sp)
ffffffffc0203c72:	f626                	sd	s1,296(sp)
ffffffffc0203c74:	f24a                	sd	s2,288(sp)
ffffffffc0203c76:	84ae                	mv	s1,a1
ffffffffc0203c78:	892a                	mv	s2,a0
ffffffffc0203c7a:	8432                	mv	s0,a2
ffffffffc0203c7c:	4581                	li	a1,0
ffffffffc0203c7e:	12000613          	li	a2,288
ffffffffc0203c82:	850a                	mv	a0,sp
ffffffffc0203c84:	fe06                	sd	ra,312(sp)
ffffffffc0203c86:	639030ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc0203c8a:	e0ca                	sd	s2,64(sp)
ffffffffc0203c8c:	e4a6                	sd	s1,72(sp)
ffffffffc0203c8e:	100027f3          	csrr	a5,sstatus
ffffffffc0203c92:	edd7f793          	andi	a5,a5,-291
ffffffffc0203c96:	1207e793          	ori	a5,a5,288
ffffffffc0203c9a:	e23e                	sd	a5,256(sp)
ffffffffc0203c9c:	860a                	mv	a2,sp
ffffffffc0203c9e:	10046513          	ori	a0,s0,256
ffffffffc0203ca2:	00000797          	auipc	a5,0x0
ffffffffc0203ca6:	a0278793          	addi	a5,a5,-1534 # ffffffffc02036a4 <kernel_thread_entry>
ffffffffc0203caa:	4581                	li	a1,0
ffffffffc0203cac:	e63e                	sd	a5,264(sp)
ffffffffc0203cae:	befff0ef          	jal	ra,ffffffffc020389c <do_fork>
ffffffffc0203cb2:	70f2                	ld	ra,312(sp)
ffffffffc0203cb4:	7452                	ld	s0,304(sp)
ffffffffc0203cb6:	74b2                	ld	s1,296(sp)
ffffffffc0203cb8:	7912                	ld	s2,288(sp)
ffffffffc0203cba:	6131                	addi	sp,sp,320
ffffffffc0203cbc:	8082                	ret

ffffffffc0203cbe <do_exit>:
ffffffffc0203cbe:	7179                	addi	sp,sp,-48
ffffffffc0203cc0:	f022                	sd	s0,32(sp)
ffffffffc0203cc2:	00016417          	auipc	s0,0x16
ffffffffc0203cc6:	83640413          	addi	s0,s0,-1994 # ffffffffc02194f8 <current>
ffffffffc0203cca:	601c                	ld	a5,0(s0)
ffffffffc0203ccc:	f406                	sd	ra,40(sp)
ffffffffc0203cce:	ec26                	sd	s1,24(sp)
ffffffffc0203cd0:	e84a                	sd	s2,16(sp)
ffffffffc0203cd2:	e44e                	sd	s3,8(sp)
ffffffffc0203cd4:	e052                	sd	s4,0(sp)
ffffffffc0203cd6:	00016717          	auipc	a4,0x16
ffffffffc0203cda:	82a73703          	ld	a4,-2006(a4) # ffffffffc0219500 <idleproc>
ffffffffc0203cde:	0ce78d63          	beq	a5,a4,ffffffffc0203db8 <do_exit+0xfa>
ffffffffc0203ce2:	00016497          	auipc	s1,0x16
ffffffffc0203ce6:	82648493          	addi	s1,s1,-2010 # ffffffffc0219508 <initproc>
ffffffffc0203cea:	6098                	ld	a4,0(s1)
ffffffffc0203cec:	12e78963          	beq	a5,a4,ffffffffc0203e1e <do_exit+0x160>
ffffffffc0203cf0:	0287b903          	ld	s2,40(a5)
ffffffffc0203cf4:	89aa                	mv	s3,a0
ffffffffc0203cf6:	02090663          	beqz	s2,ffffffffc0203d22 <do_exit+0x64>
ffffffffc0203cfa:	00016797          	auipc	a5,0x16
ffffffffc0203cfe:	93e7b783          	ld	a5,-1730(a5) # ffffffffc0219638 <boot_cr3>
ffffffffc0203d02:	577d                	li	a4,-1
ffffffffc0203d04:	177e                	slli	a4,a4,0x3f
ffffffffc0203d06:	83b1                	srli	a5,a5,0xc
ffffffffc0203d08:	8fd9                	or	a5,a5,a4
ffffffffc0203d0a:	18079073          	csrw	satp,a5
ffffffffc0203d0e:	03092783          	lw	a5,48(s2)
ffffffffc0203d12:	fff7871b          	addiw	a4,a5,-1
ffffffffc0203d16:	02e92823          	sw	a4,48(s2)
ffffffffc0203d1a:	cb5d                	beqz	a4,ffffffffc0203dd0 <do_exit+0x112>
ffffffffc0203d1c:	601c                	ld	a5,0(s0)
ffffffffc0203d1e:	0207b423          	sd	zero,40(a5)
ffffffffc0203d22:	601c                	ld	a5,0(s0)
ffffffffc0203d24:	470d                	li	a4,3
ffffffffc0203d26:	c398                	sw	a4,0(a5)
ffffffffc0203d28:	0f37a423          	sw	s3,232(a5)
ffffffffc0203d2c:	100027f3          	csrr	a5,sstatus
ffffffffc0203d30:	8b89                	andi	a5,a5,2
ffffffffc0203d32:	4a01                	li	s4,0
ffffffffc0203d34:	10079163          	bnez	a5,ffffffffc0203e36 <do_exit+0x178>
ffffffffc0203d38:	6018                	ld	a4,0(s0)
ffffffffc0203d3a:	800007b7          	lui	a5,0x80000
ffffffffc0203d3e:	0785                	addi	a5,a5,1
ffffffffc0203d40:	7308                	ld	a0,32(a4)
ffffffffc0203d42:	0ec52703          	lw	a4,236(a0)
ffffffffc0203d46:	0ef70c63          	beq	a4,a5,ffffffffc0203e3e <do_exit+0x180>
ffffffffc0203d4a:	6018                	ld	a4,0(s0)
ffffffffc0203d4c:	7b7c                	ld	a5,240(a4)
ffffffffc0203d4e:	c3a1                	beqz	a5,ffffffffc0203d8e <do_exit+0xd0>
ffffffffc0203d50:	800009b7          	lui	s3,0x80000
ffffffffc0203d54:	490d                	li	s2,3
ffffffffc0203d56:	0985                	addi	s3,s3,1
ffffffffc0203d58:	a021                	j	ffffffffc0203d60 <do_exit+0xa2>
ffffffffc0203d5a:	6018                	ld	a4,0(s0)
ffffffffc0203d5c:	7b7c                	ld	a5,240(a4)
ffffffffc0203d5e:	cb85                	beqz	a5,ffffffffc0203d8e <do_exit+0xd0>
ffffffffc0203d60:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <kern_entry-0x401fff00>
ffffffffc0203d64:	6088                	ld	a0,0(s1)
ffffffffc0203d66:	fb74                	sd	a3,240(a4)
ffffffffc0203d68:	7978                	ld	a4,240(a0)
ffffffffc0203d6a:	0e07bc23          	sd	zero,248(a5)
ffffffffc0203d6e:	10e7b023          	sd	a4,256(a5)
ffffffffc0203d72:	c311                	beqz	a4,ffffffffc0203d76 <do_exit+0xb8>
ffffffffc0203d74:	ff7c                	sd	a5,248(a4)
ffffffffc0203d76:	4398                	lw	a4,0(a5)
ffffffffc0203d78:	f388                	sd	a0,32(a5)
ffffffffc0203d7a:	f97c                	sd	a5,240(a0)
ffffffffc0203d7c:	fd271fe3          	bne	a4,s2,ffffffffc0203d5a <do_exit+0x9c>
ffffffffc0203d80:	0ec52783          	lw	a5,236(a0)
ffffffffc0203d84:	fd379be3          	bne	a5,s3,ffffffffc0203d5a <do_exit+0x9c>
ffffffffc0203d88:	3ff000ef          	jal	ra,ffffffffc0204986 <wakeup_proc>
ffffffffc0203d8c:	b7f9                	j	ffffffffc0203d5a <do_exit+0x9c>
ffffffffc0203d8e:	020a1263          	bnez	s4,ffffffffc0203db2 <do_exit+0xf4>
ffffffffc0203d92:	4a7000ef          	jal	ra,ffffffffc0204a38 <schedule>
ffffffffc0203d96:	601c                	ld	a5,0(s0)
ffffffffc0203d98:	00005617          	auipc	a2,0x5
ffffffffc0203d9c:	74060613          	addi	a2,a2,1856 # ffffffffc02094d8 <default_pmm_manager+0x318>
ffffffffc0203da0:	1f900593          	li	a1,505
ffffffffc0203da4:	43d4                	lw	a3,4(a5)
ffffffffc0203da6:	00005517          	auipc	a0,0x5
ffffffffc0203daa:	6fa50513          	addi	a0,a0,1786 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0203dae:	c5afc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203db2:	881fc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203db6:	bff1                	j	ffffffffc0203d92 <do_exit+0xd4>
ffffffffc0203db8:	00005617          	auipc	a2,0x5
ffffffffc0203dbc:	70060613          	addi	a2,a2,1792 # ffffffffc02094b8 <default_pmm_manager+0x2f8>
ffffffffc0203dc0:	1cd00593          	li	a1,461
ffffffffc0203dc4:	00005517          	auipc	a0,0x5
ffffffffc0203dc8:	6dc50513          	addi	a0,a0,1756 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0203dcc:	c3cfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203dd0:	854a                	mv	a0,s2
ffffffffc0203dd2:	a7afd0ef          	jal	ra,ffffffffc020104c <exit_mmap>
ffffffffc0203dd6:	01893683          	ld	a3,24(s2)
ffffffffc0203dda:	c02007b7          	lui	a5,0xc0200
ffffffffc0203dde:	06f6e363          	bltu	a3,a5,ffffffffc0203e44 <do_exit+0x186>
ffffffffc0203de2:	00016797          	auipc	a5,0x16
ffffffffc0203de6:	84e7b783          	ld	a5,-1970(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc0203dea:	8e9d                	sub	a3,a3,a5
ffffffffc0203dec:	82b1                	srli	a3,a3,0xc
ffffffffc0203dee:	00015797          	auipc	a5,0x15
ffffffffc0203df2:	7027b783          	ld	a5,1794(a5) # ffffffffc02194f0 <npage>
ffffffffc0203df6:	06f6f363          	bgeu	a3,a5,ffffffffc0203e5c <do_exit+0x19e>
ffffffffc0203dfa:	00006517          	auipc	a0,0x6
ffffffffc0203dfe:	74653503          	ld	a0,1862(a0) # ffffffffc020a540 <nbase>
ffffffffc0203e02:	8e89                	sub	a3,a3,a0
ffffffffc0203e04:	069a                	slli	a3,a3,0x6
ffffffffc0203e06:	00016517          	auipc	a0,0x16
ffffffffc0203e0a:	83a53503          	ld	a0,-1990(a0) # ffffffffc0219640 <pages>
ffffffffc0203e0e:	9536                	add	a0,a0,a3
ffffffffc0203e10:	4585                	li	a1,1
ffffffffc0203e12:	95ffe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203e16:	854a                	mv	a0,s2
ffffffffc0203e18:	898fd0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0203e1c:	b701                	j	ffffffffc0203d1c <do_exit+0x5e>
ffffffffc0203e1e:	00005617          	auipc	a2,0x5
ffffffffc0203e22:	6aa60613          	addi	a2,a2,1706 # ffffffffc02094c8 <default_pmm_manager+0x308>
ffffffffc0203e26:	1d000593          	li	a1,464
ffffffffc0203e2a:	00005517          	auipc	a0,0x5
ffffffffc0203e2e:	67650513          	addi	a0,a0,1654 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0203e32:	bd6fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203e36:	803fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203e3a:	4a05                	li	s4,1
ffffffffc0203e3c:	bdf5                	j	ffffffffc0203d38 <do_exit+0x7a>
ffffffffc0203e3e:	349000ef          	jal	ra,ffffffffc0204986 <wakeup_proc>
ffffffffc0203e42:	b721                	j	ffffffffc0203d4a <do_exit+0x8c>
ffffffffc0203e44:	00005617          	auipc	a2,0x5
ffffffffc0203e48:	dac60613          	addi	a2,a2,-596 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc0203e4c:	06e00593          	li	a1,110
ffffffffc0203e50:	00005517          	auipc	a0,0x5
ffffffffc0203e54:	d5850513          	addi	a0,a0,-680 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0203e58:	bb0fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203e5c:	00005617          	auipc	a2,0x5
ffffffffc0203e60:	dbc60613          	addi	a2,a2,-580 # ffffffffc0208c18 <commands+0xa88>
ffffffffc0203e64:	06200593          	li	a1,98
ffffffffc0203e68:	00005517          	auipc	a0,0x5
ffffffffc0203e6c:	d4050513          	addi	a0,a0,-704 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0203e70:	b98fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203e74 <do_wait.part.0>:
ffffffffc0203e74:	7139                	addi	sp,sp,-64
ffffffffc0203e76:	e852                	sd	s4,16(sp)
ffffffffc0203e78:	80000a37          	lui	s4,0x80000
ffffffffc0203e7c:	f426                	sd	s1,40(sp)
ffffffffc0203e7e:	f04a                	sd	s2,32(sp)
ffffffffc0203e80:	ec4e                	sd	s3,24(sp)
ffffffffc0203e82:	e456                	sd	s5,8(sp)
ffffffffc0203e84:	e05a                	sd	s6,0(sp)
ffffffffc0203e86:	fc06                	sd	ra,56(sp)
ffffffffc0203e88:	f822                	sd	s0,48(sp)
ffffffffc0203e8a:	892a                	mv	s2,a0
ffffffffc0203e8c:	8aae                	mv	s5,a1
ffffffffc0203e8e:	00015997          	auipc	s3,0x15
ffffffffc0203e92:	66a98993          	addi	s3,s3,1642 # ffffffffc02194f8 <current>
ffffffffc0203e96:	448d                	li	s1,3
ffffffffc0203e98:	4b05                	li	s6,1
ffffffffc0203e9a:	2a05                	addiw	s4,s4,1
ffffffffc0203e9c:	02090f63          	beqz	s2,ffffffffc0203eda <do_wait.part.0+0x66>
ffffffffc0203ea0:	854a                	mv	a0,s2
ffffffffc0203ea2:	9a3ff0ef          	jal	ra,ffffffffc0203844 <find_proc>
ffffffffc0203ea6:	842a                	mv	s0,a0
ffffffffc0203ea8:	10050763          	beqz	a0,ffffffffc0203fb6 <do_wait.part.0+0x142>
ffffffffc0203eac:	0009b703          	ld	a4,0(s3)
ffffffffc0203eb0:	711c                	ld	a5,32(a0)
ffffffffc0203eb2:	10e79263          	bne	a5,a4,ffffffffc0203fb6 <do_wait.part.0+0x142>
ffffffffc0203eb6:	411c                	lw	a5,0(a0)
ffffffffc0203eb8:	02978c63          	beq	a5,s1,ffffffffc0203ef0 <do_wait.part.0+0x7c>
ffffffffc0203ebc:	01672023          	sw	s6,0(a4)
ffffffffc0203ec0:	0f472623          	sw	s4,236(a4)
ffffffffc0203ec4:	375000ef          	jal	ra,ffffffffc0204a38 <schedule>
ffffffffc0203ec8:	0009b783          	ld	a5,0(s3)
ffffffffc0203ecc:	0b07a783          	lw	a5,176(a5)
ffffffffc0203ed0:	8b85                	andi	a5,a5,1
ffffffffc0203ed2:	d7e9                	beqz	a5,ffffffffc0203e9c <do_wait.part.0+0x28>
ffffffffc0203ed4:	555d                	li	a0,-9
ffffffffc0203ed6:	de9ff0ef          	jal	ra,ffffffffc0203cbe <do_exit>
ffffffffc0203eda:	0009b703          	ld	a4,0(s3)
ffffffffc0203ede:	7b60                	ld	s0,240(a4)
ffffffffc0203ee0:	e409                	bnez	s0,ffffffffc0203eea <do_wait.part.0+0x76>
ffffffffc0203ee2:	a8d1                	j	ffffffffc0203fb6 <do_wait.part.0+0x142>
ffffffffc0203ee4:	10043403          	ld	s0,256(s0)
ffffffffc0203ee8:	d871                	beqz	s0,ffffffffc0203ebc <do_wait.part.0+0x48>
ffffffffc0203eea:	401c                	lw	a5,0(s0)
ffffffffc0203eec:	fe979ce3          	bne	a5,s1,ffffffffc0203ee4 <do_wait.part.0+0x70>
ffffffffc0203ef0:	00015797          	auipc	a5,0x15
ffffffffc0203ef4:	6107b783          	ld	a5,1552(a5) # ffffffffc0219500 <idleproc>
ffffffffc0203ef8:	0c878563          	beq	a5,s0,ffffffffc0203fc2 <do_wait.part.0+0x14e>
ffffffffc0203efc:	00015797          	auipc	a5,0x15
ffffffffc0203f00:	60c7b783          	ld	a5,1548(a5) # ffffffffc0219508 <initproc>
ffffffffc0203f04:	0af40f63          	beq	s0,a5,ffffffffc0203fc2 <do_wait.part.0+0x14e>
ffffffffc0203f08:	000a8663          	beqz	s5,ffffffffc0203f14 <do_wait.part.0+0xa0>
ffffffffc0203f0c:	0e842783          	lw	a5,232(s0)
ffffffffc0203f10:	00faa023          	sw	a5,0(s5)
ffffffffc0203f14:	100027f3          	csrr	a5,sstatus
ffffffffc0203f18:	8b89                	andi	a5,a5,2
ffffffffc0203f1a:	4581                	li	a1,0
ffffffffc0203f1c:	efd9                	bnez	a5,ffffffffc0203fba <do_wait.part.0+0x146>
ffffffffc0203f1e:	6c70                	ld	a2,216(s0)
ffffffffc0203f20:	7074                	ld	a3,224(s0)
ffffffffc0203f22:	10043703          	ld	a4,256(s0)
ffffffffc0203f26:	7c7c                	ld	a5,248(s0)
ffffffffc0203f28:	e614                	sd	a3,8(a2)
ffffffffc0203f2a:	e290                	sd	a2,0(a3)
ffffffffc0203f2c:	6470                	ld	a2,200(s0)
ffffffffc0203f2e:	6874                	ld	a3,208(s0)
ffffffffc0203f30:	e614                	sd	a3,8(a2)
ffffffffc0203f32:	e290                	sd	a2,0(a3)
ffffffffc0203f34:	c319                	beqz	a4,ffffffffc0203f3a <do_wait.part.0+0xc6>
ffffffffc0203f36:	ff7c                	sd	a5,248(a4)
ffffffffc0203f38:	7c7c                	ld	a5,248(s0)
ffffffffc0203f3a:	cbbd                	beqz	a5,ffffffffc0203fb0 <do_wait.part.0+0x13c>
ffffffffc0203f3c:	10e7b023          	sd	a4,256(a5)
ffffffffc0203f40:	00015717          	auipc	a4,0x15
ffffffffc0203f44:	5d070713          	addi	a4,a4,1488 # ffffffffc0219510 <nr_process>
ffffffffc0203f48:	431c                	lw	a5,0(a4)
ffffffffc0203f4a:	37fd                	addiw	a5,a5,-1
ffffffffc0203f4c:	c31c                	sw	a5,0(a4)
ffffffffc0203f4e:	edb1                	bnez	a1,ffffffffc0203faa <do_wait.part.0+0x136>
ffffffffc0203f50:	6814                	ld	a3,16(s0)
ffffffffc0203f52:	c02007b7          	lui	a5,0xc0200
ffffffffc0203f56:	08f6ee63          	bltu	a3,a5,ffffffffc0203ff2 <do_wait.part.0+0x17e>
ffffffffc0203f5a:	00015797          	auipc	a5,0x15
ffffffffc0203f5e:	6d67b783          	ld	a5,1750(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc0203f62:	8e9d                	sub	a3,a3,a5
ffffffffc0203f64:	82b1                	srli	a3,a3,0xc
ffffffffc0203f66:	00015797          	auipc	a5,0x15
ffffffffc0203f6a:	58a7b783          	ld	a5,1418(a5) # ffffffffc02194f0 <npage>
ffffffffc0203f6e:	06f6f663          	bgeu	a3,a5,ffffffffc0203fda <do_wait.part.0+0x166>
ffffffffc0203f72:	00006517          	auipc	a0,0x6
ffffffffc0203f76:	5ce53503          	ld	a0,1486(a0) # ffffffffc020a540 <nbase>
ffffffffc0203f7a:	8e89                	sub	a3,a3,a0
ffffffffc0203f7c:	069a                	slli	a3,a3,0x6
ffffffffc0203f7e:	00015517          	auipc	a0,0x15
ffffffffc0203f82:	6c253503          	ld	a0,1730(a0) # ffffffffc0219640 <pages>
ffffffffc0203f86:	9536                	add	a0,a0,a3
ffffffffc0203f88:	4589                	li	a1,2
ffffffffc0203f8a:	fe6fe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc0203f8e:	8522                	mv	a0,s0
ffffffffc0203f90:	faafd0ef          	jal	ra,ffffffffc020173a <kfree>
ffffffffc0203f94:	4501                	li	a0,0
ffffffffc0203f96:	70e2                	ld	ra,56(sp)
ffffffffc0203f98:	7442                	ld	s0,48(sp)
ffffffffc0203f9a:	74a2                	ld	s1,40(sp)
ffffffffc0203f9c:	7902                	ld	s2,32(sp)
ffffffffc0203f9e:	69e2                	ld	s3,24(sp)
ffffffffc0203fa0:	6a42                	ld	s4,16(sp)
ffffffffc0203fa2:	6aa2                	ld	s5,8(sp)
ffffffffc0203fa4:	6b02                	ld	s6,0(sp)
ffffffffc0203fa6:	6121                	addi	sp,sp,64
ffffffffc0203fa8:	8082                	ret
ffffffffc0203faa:	e88fc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203fae:	b74d                	j	ffffffffc0203f50 <do_wait.part.0+0xdc>
ffffffffc0203fb0:	701c                	ld	a5,32(s0)
ffffffffc0203fb2:	fbf8                	sd	a4,240(a5)
ffffffffc0203fb4:	b771                	j	ffffffffc0203f40 <do_wait.part.0+0xcc>
ffffffffc0203fb6:	5579                	li	a0,-2
ffffffffc0203fb8:	bff9                	j	ffffffffc0203f96 <do_wait.part.0+0x122>
ffffffffc0203fba:	e7efc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203fbe:	4585                	li	a1,1
ffffffffc0203fc0:	bfb9                	j	ffffffffc0203f1e <do_wait.part.0+0xaa>
ffffffffc0203fc2:	00005617          	auipc	a2,0x5
ffffffffc0203fc6:	53660613          	addi	a2,a2,1334 # ffffffffc02094f8 <default_pmm_manager+0x338>
ffffffffc0203fca:	2f600593          	li	a1,758
ffffffffc0203fce:	00005517          	auipc	a0,0x5
ffffffffc0203fd2:	4d250513          	addi	a0,a0,1234 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0203fd6:	a32fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203fda:	00005617          	auipc	a2,0x5
ffffffffc0203fde:	c3e60613          	addi	a2,a2,-962 # ffffffffc0208c18 <commands+0xa88>
ffffffffc0203fe2:	06200593          	li	a1,98
ffffffffc0203fe6:	00005517          	auipc	a0,0x5
ffffffffc0203fea:	bc250513          	addi	a0,a0,-1086 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0203fee:	a1afc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203ff2:	00005617          	auipc	a2,0x5
ffffffffc0203ff6:	bfe60613          	addi	a2,a2,-1026 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc0203ffa:	06e00593          	li	a1,110
ffffffffc0203ffe:	00005517          	auipc	a0,0x5
ffffffffc0204002:	baa50513          	addi	a0,a0,-1110 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc0204006:	a02fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020400a <init_main>:
ffffffffc020400a:	1141                	addi	sp,sp,-16
ffffffffc020400c:	e406                	sd	ra,8(sp)
ffffffffc020400e:	fa4fe0ef          	jal	ra,ffffffffc02027b2 <nr_free_pages>
ffffffffc0204012:	e74fd0ef          	jal	ra,ffffffffc0201686 <kallocated>
ffffffffc0204016:	bd8ff0ef          	jal	ra,ffffffffc02033ee <check_exercise>
ffffffffc020401a:	a019                	j	ffffffffc0204020 <init_main+0x16>
ffffffffc020401c:	21d000ef          	jal	ra,ffffffffc0204a38 <schedule>
ffffffffc0204020:	4581                	li	a1,0
ffffffffc0204022:	4501                	li	a0,0
ffffffffc0204024:	e51ff0ef          	jal	ra,ffffffffc0203e74 <do_wait.part.0>
ffffffffc0204028:	d975                	beqz	a0,ffffffffc020401c <init_main+0x12>
ffffffffc020402a:	00005517          	auipc	a0,0x5
ffffffffc020402e:	4ee50513          	addi	a0,a0,1262 # ffffffffc0209518 <default_pmm_manager+0x358>
ffffffffc0204032:	89afc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0204036:	00015797          	auipc	a5,0x15
ffffffffc020403a:	4d27b783          	ld	a5,1234(a5) # ffffffffc0219508 <initproc>
ffffffffc020403e:	7bf8                	ld	a4,240(a5)
ffffffffc0204040:	e339                	bnez	a4,ffffffffc0204086 <init_main+0x7c>
ffffffffc0204042:	7ff8                	ld	a4,248(a5)
ffffffffc0204044:	e329                	bnez	a4,ffffffffc0204086 <init_main+0x7c>
ffffffffc0204046:	1007b703          	ld	a4,256(a5)
ffffffffc020404a:	ef15                	bnez	a4,ffffffffc0204086 <init_main+0x7c>
ffffffffc020404c:	00015697          	auipc	a3,0x15
ffffffffc0204050:	4c46a683          	lw	a3,1220(a3) # ffffffffc0219510 <nr_process>
ffffffffc0204054:	4709                	li	a4,2
ffffffffc0204056:	08e69863          	bne	a3,a4,ffffffffc02040e6 <init_main+0xdc>
ffffffffc020405a:	00015717          	auipc	a4,0x15
ffffffffc020405e:	64e70713          	addi	a4,a4,1614 # ffffffffc02196a8 <proc_list>
ffffffffc0204062:	6714                	ld	a3,8(a4)
ffffffffc0204064:	0c878793          	addi	a5,a5,200
ffffffffc0204068:	04d79f63          	bne	a5,a3,ffffffffc02040c6 <init_main+0xbc>
ffffffffc020406c:	6318                	ld	a4,0(a4)
ffffffffc020406e:	02e79c63          	bne	a5,a4,ffffffffc02040a6 <init_main+0x9c>
ffffffffc0204072:	00005517          	auipc	a0,0x5
ffffffffc0204076:	58e50513          	addi	a0,a0,1422 # ffffffffc0209600 <default_pmm_manager+0x440>
ffffffffc020407a:	852fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020407e:	60a2                	ld	ra,8(sp)
ffffffffc0204080:	4501                	li	a0,0
ffffffffc0204082:	0141                	addi	sp,sp,16
ffffffffc0204084:	8082                	ret
ffffffffc0204086:	00005697          	auipc	a3,0x5
ffffffffc020408a:	4ba68693          	addi	a3,a3,1210 # ffffffffc0209540 <default_pmm_manager+0x380>
ffffffffc020408e:	00004617          	auipc	a2,0x4
ffffffffc0204092:	51260613          	addi	a2,a2,1298 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204096:	36200593          	li	a1,866
ffffffffc020409a:	00005517          	auipc	a0,0x5
ffffffffc020409e:	40650513          	addi	a0,a0,1030 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc02040a2:	966fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02040a6:	00005697          	auipc	a3,0x5
ffffffffc02040aa:	52a68693          	addi	a3,a3,1322 # ffffffffc02095d0 <default_pmm_manager+0x410>
ffffffffc02040ae:	00004617          	auipc	a2,0x4
ffffffffc02040b2:	4f260613          	addi	a2,a2,1266 # ffffffffc02085a0 <commands+0x410>
ffffffffc02040b6:	36500593          	li	a1,869
ffffffffc02040ba:	00005517          	auipc	a0,0x5
ffffffffc02040be:	3e650513          	addi	a0,a0,998 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc02040c2:	946fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02040c6:	00005697          	auipc	a3,0x5
ffffffffc02040ca:	4da68693          	addi	a3,a3,1242 # ffffffffc02095a0 <default_pmm_manager+0x3e0>
ffffffffc02040ce:	00004617          	auipc	a2,0x4
ffffffffc02040d2:	4d260613          	addi	a2,a2,1234 # ffffffffc02085a0 <commands+0x410>
ffffffffc02040d6:	36400593          	li	a1,868
ffffffffc02040da:	00005517          	auipc	a0,0x5
ffffffffc02040de:	3c650513          	addi	a0,a0,966 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc02040e2:	926fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02040e6:	00005697          	auipc	a3,0x5
ffffffffc02040ea:	4aa68693          	addi	a3,a3,1194 # ffffffffc0209590 <default_pmm_manager+0x3d0>
ffffffffc02040ee:	00004617          	auipc	a2,0x4
ffffffffc02040f2:	4b260613          	addi	a2,a2,1202 # ffffffffc02085a0 <commands+0x410>
ffffffffc02040f6:	36300593          	li	a1,867
ffffffffc02040fa:	00005517          	auipc	a0,0x5
ffffffffc02040fe:	3a650513          	addi	a0,a0,934 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0204102:	906fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204106 <do_execve>:
ffffffffc0204106:	7135                	addi	sp,sp,-160
ffffffffc0204108:	f4d6                	sd	s5,104(sp)
ffffffffc020410a:	00015a97          	auipc	s5,0x15
ffffffffc020410e:	3eea8a93          	addi	s5,s5,1006 # ffffffffc02194f8 <current>
ffffffffc0204112:	000ab783          	ld	a5,0(s5)
ffffffffc0204116:	f8d2                	sd	s4,112(sp)
ffffffffc0204118:	e526                	sd	s1,136(sp)
ffffffffc020411a:	0287ba03          	ld	s4,40(a5)
ffffffffc020411e:	e14a                	sd	s2,128(sp)
ffffffffc0204120:	fcce                	sd	s3,120(sp)
ffffffffc0204122:	892a                	mv	s2,a0
ffffffffc0204124:	84ae                	mv	s1,a1
ffffffffc0204126:	89b2                	mv	s3,a2
ffffffffc0204128:	4681                	li	a3,0
ffffffffc020412a:	862e                	mv	a2,a1
ffffffffc020412c:	85aa                	mv	a1,a0
ffffffffc020412e:	8552                	mv	a0,s4
ffffffffc0204130:	ed06                	sd	ra,152(sp)
ffffffffc0204132:	e922                	sd	s0,144(sp)
ffffffffc0204134:	f0da                	sd	s6,96(sp)
ffffffffc0204136:	ecde                	sd	s7,88(sp)
ffffffffc0204138:	e8e2                	sd	s8,80(sp)
ffffffffc020413a:	e4e6                	sd	s9,72(sp)
ffffffffc020413c:	e0ea                	sd	s10,64(sp)
ffffffffc020413e:	fc6e                	sd	s11,56(sp)
ffffffffc0204140:	886fd0ef          	jal	ra,ffffffffc02011c6 <user_mem_check>
ffffffffc0204144:	46050063          	beqz	a0,ffffffffc02045a4 <do_execve+0x49e>
ffffffffc0204148:	4641                	li	a2,16
ffffffffc020414a:	4581                	li	a1,0
ffffffffc020414c:	1008                	addi	a0,sp,32
ffffffffc020414e:	171030ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc0204152:	47bd                	li	a5,15
ffffffffc0204154:	8626                	mv	a2,s1
ffffffffc0204156:	1897ea63          	bltu	a5,s1,ffffffffc02042ea <do_execve+0x1e4>
ffffffffc020415a:	85ca                	mv	a1,s2
ffffffffc020415c:	1008                	addi	a0,sp,32
ffffffffc020415e:	173030ef          	jal	ra,ffffffffc0207ad0 <memcpy>
ffffffffc0204162:	180a0b63          	beqz	s4,ffffffffc02042f8 <do_execve+0x1f2>
ffffffffc0204166:	00004517          	auipc	a0,0x4
ffffffffc020416a:	7d250513          	addi	a0,a0,2002 # ffffffffc0208938 <commands+0x7a8>
ffffffffc020416e:	f97fb0ef          	jal	ra,ffffffffc0200104 <cputs>
ffffffffc0204172:	00015797          	auipc	a5,0x15
ffffffffc0204176:	4c67b783          	ld	a5,1222(a5) # ffffffffc0219638 <boot_cr3>
ffffffffc020417a:	577d                	li	a4,-1
ffffffffc020417c:	177e                	slli	a4,a4,0x3f
ffffffffc020417e:	83b1                	srli	a5,a5,0xc
ffffffffc0204180:	8fd9                	or	a5,a5,a4
ffffffffc0204182:	18079073          	csrw	satp,a5
ffffffffc0204186:	030a2783          	lw	a5,48(s4) # ffffffff80000030 <kern_entry-0x401fffd0>
ffffffffc020418a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020418e:	02ea2823          	sw	a4,48(s4)
ffffffffc0204192:	2c070163          	beqz	a4,ffffffffc0204454 <do_execve+0x34e>
ffffffffc0204196:	000ab783          	ld	a5,0(s5)
ffffffffc020419a:	0207b423          	sd	zero,40(a5)
ffffffffc020419e:	bb5fc0ef          	jal	ra,ffffffffc0200d52 <mm_create>
ffffffffc02041a2:	84aa                	mv	s1,a0
ffffffffc02041a4:	18050263          	beqz	a0,ffffffffc0204328 <do_execve+0x222>
ffffffffc02041a8:	0561                	addi	a0,a0,24
ffffffffc02041aa:	d82ff0ef          	jal	ra,ffffffffc020372c <setup_pgdir.isra.0>
ffffffffc02041ae:	16051663          	bnez	a0,ffffffffc020431a <do_execve+0x214>
ffffffffc02041b2:	0009a703          	lw	a4,0(s3)
ffffffffc02041b6:	464c47b7          	lui	a5,0x464c4
ffffffffc02041ba:	57f78793          	addi	a5,a5,1407 # 464c457f <kern_entry-0xffffffff79d3ba81>
ffffffffc02041be:	24f71763          	bne	a4,a5,ffffffffc020440c <do_execve+0x306>
ffffffffc02041c2:	0389d703          	lhu	a4,56(s3)
ffffffffc02041c6:	0209b903          	ld	s2,32(s3)
ffffffffc02041ca:	00371793          	slli	a5,a4,0x3
ffffffffc02041ce:	8f99                	sub	a5,a5,a4
ffffffffc02041d0:	994e                	add	s2,s2,s3
ffffffffc02041d2:	078e                	slli	a5,a5,0x3
ffffffffc02041d4:	97ca                	add	a5,a5,s2
ffffffffc02041d6:	ec3e                	sd	a5,24(sp)
ffffffffc02041d8:	02f97c63          	bgeu	s2,a5,ffffffffc0204210 <do_execve+0x10a>
ffffffffc02041dc:	5bfd                	li	s7,-1
ffffffffc02041de:	00cbd793          	srli	a5,s7,0xc
ffffffffc02041e2:	00015d97          	auipc	s11,0x15
ffffffffc02041e6:	45ed8d93          	addi	s11,s11,1118 # ffffffffc0219640 <pages>
ffffffffc02041ea:	00006d17          	auipc	s10,0x6
ffffffffc02041ee:	356d0d13          	addi	s10,s10,854 # ffffffffc020a540 <nbase>
ffffffffc02041f2:	e43e                	sd	a5,8(sp)
ffffffffc02041f4:	00015c97          	auipc	s9,0x15
ffffffffc02041f8:	2fcc8c93          	addi	s9,s9,764 # ffffffffc02194f0 <npage>
ffffffffc02041fc:	00092703          	lw	a4,0(s2)
ffffffffc0204200:	4785                	li	a5,1
ffffffffc0204202:	12f70563          	beq	a4,a5,ffffffffc020432c <do_execve+0x226>
ffffffffc0204206:	67e2                	ld	a5,24(sp)
ffffffffc0204208:	03890913          	addi	s2,s2,56
ffffffffc020420c:	fef968e3          	bltu	s2,a5,ffffffffc02041fc <do_execve+0xf6>
ffffffffc0204210:	4701                	li	a4,0
ffffffffc0204212:	46ad                	li	a3,11
ffffffffc0204214:	00100637          	lui	a2,0x100
ffffffffc0204218:	7ff005b7          	lui	a1,0x7ff00
ffffffffc020421c:	8526                	mv	a0,s1
ffffffffc020421e:	ce5fc0ef          	jal	ra,ffffffffc0200f02 <mm_map>
ffffffffc0204222:	8a2a                	mv	s4,a0
ffffffffc0204224:	1e051063          	bnez	a0,ffffffffc0204404 <do_execve+0x2fe>
ffffffffc0204228:	6c88                	ld	a0,24(s1)
ffffffffc020422a:	467d                	li	a2,31
ffffffffc020422c:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc0204230:	debfe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204234:	42050e63          	beqz	a0,ffffffffc0204670 <do_execve+0x56a>
ffffffffc0204238:	6c88                	ld	a0,24(s1)
ffffffffc020423a:	467d                	li	a2,31
ffffffffc020423c:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc0204240:	ddbfe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204244:	40050663          	beqz	a0,ffffffffc0204650 <do_execve+0x54a>
ffffffffc0204248:	6c88                	ld	a0,24(s1)
ffffffffc020424a:	467d                	li	a2,31
ffffffffc020424c:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0204250:	dcbfe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204254:	3c050e63          	beqz	a0,ffffffffc0204630 <do_execve+0x52a>
ffffffffc0204258:	6c88                	ld	a0,24(s1)
ffffffffc020425a:	467d                	li	a2,31
ffffffffc020425c:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0204260:	dbbfe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204264:	3a050663          	beqz	a0,ffffffffc0204610 <do_execve+0x50a>
ffffffffc0204268:	589c                	lw	a5,48(s1)
ffffffffc020426a:	000ab603          	ld	a2,0(s5)
ffffffffc020426e:	6c94                	ld	a3,24(s1)
ffffffffc0204270:	2785                	addiw	a5,a5,1
ffffffffc0204272:	d89c                	sw	a5,48(s1)
ffffffffc0204274:	f604                	sd	s1,40(a2)
ffffffffc0204276:	c02007b7          	lui	a5,0xc0200
ffffffffc020427a:	36f6ef63          	bltu	a3,a5,ffffffffc02045f8 <do_execve+0x4f2>
ffffffffc020427e:	00015797          	auipc	a5,0x15
ffffffffc0204282:	3b27b783          	ld	a5,946(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc0204286:	8e9d                	sub	a3,a3,a5
ffffffffc0204288:	577d                	li	a4,-1
ffffffffc020428a:	00c6d793          	srli	a5,a3,0xc
ffffffffc020428e:	177e                	slli	a4,a4,0x3f
ffffffffc0204290:	f654                	sd	a3,168(a2)
ffffffffc0204292:	8fd9                	or	a5,a5,a4
ffffffffc0204294:	18079073          	csrw	satp,a5
ffffffffc0204298:	7240                	ld	s0,160(a2)
ffffffffc020429a:	4581                	li	a1,0
ffffffffc020429c:	12000613          	li	a2,288
ffffffffc02042a0:	8522                	mv	a0,s0
ffffffffc02042a2:	10043483          	ld	s1,256(s0)
ffffffffc02042a6:	019030ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc02042aa:	0189b703          	ld	a4,24(s3)
ffffffffc02042ae:	4785                	li	a5,1
ffffffffc02042b0:	000ab503          	ld	a0,0(s5)
ffffffffc02042b4:	edf4f493          	andi	s1,s1,-289
ffffffffc02042b8:	07fe                	slli	a5,a5,0x1f
ffffffffc02042ba:	e81c                	sd	a5,16(s0)
ffffffffc02042bc:	10e43423          	sd	a4,264(s0)
ffffffffc02042c0:	10943023          	sd	s1,256(s0)
ffffffffc02042c4:	100c                	addi	a1,sp,32
ffffffffc02042c6:	ce8ff0ef          	jal	ra,ffffffffc02037ae <set_proc_name>
ffffffffc02042ca:	60ea                	ld	ra,152(sp)
ffffffffc02042cc:	644a                	ld	s0,144(sp)
ffffffffc02042ce:	64aa                	ld	s1,136(sp)
ffffffffc02042d0:	690a                	ld	s2,128(sp)
ffffffffc02042d2:	79e6                	ld	s3,120(sp)
ffffffffc02042d4:	7aa6                	ld	s5,104(sp)
ffffffffc02042d6:	7b06                	ld	s6,96(sp)
ffffffffc02042d8:	6be6                	ld	s7,88(sp)
ffffffffc02042da:	6c46                	ld	s8,80(sp)
ffffffffc02042dc:	6ca6                	ld	s9,72(sp)
ffffffffc02042de:	6d06                	ld	s10,64(sp)
ffffffffc02042e0:	7de2                	ld	s11,56(sp)
ffffffffc02042e2:	8552                	mv	a0,s4
ffffffffc02042e4:	7a46                	ld	s4,112(sp)
ffffffffc02042e6:	610d                	addi	sp,sp,160
ffffffffc02042e8:	8082                	ret
ffffffffc02042ea:	463d                	li	a2,15
ffffffffc02042ec:	85ca                	mv	a1,s2
ffffffffc02042ee:	1008                	addi	a0,sp,32
ffffffffc02042f0:	7e0030ef          	jal	ra,ffffffffc0207ad0 <memcpy>
ffffffffc02042f4:	e60a19e3          	bnez	s4,ffffffffc0204166 <do_execve+0x60>
ffffffffc02042f8:	000ab783          	ld	a5,0(s5)
ffffffffc02042fc:	779c                	ld	a5,40(a5)
ffffffffc02042fe:	ea0780e3          	beqz	a5,ffffffffc020419e <do_execve+0x98>
ffffffffc0204302:	00005617          	auipc	a2,0x5
ffffffffc0204306:	31e60613          	addi	a2,a2,798 # ffffffffc0209620 <default_pmm_manager+0x460>
ffffffffc020430a:	20300593          	li	a1,515
ffffffffc020430e:	00005517          	auipc	a0,0x5
ffffffffc0204312:	19250513          	addi	a0,a0,402 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0204316:	ef3fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020431a:	8526                	mv	a0,s1
ffffffffc020431c:	b95fc0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0204320:	5a71                	li	s4,-4
ffffffffc0204322:	8552                	mv	a0,s4
ffffffffc0204324:	99bff0ef          	jal	ra,ffffffffc0203cbe <do_exit>
ffffffffc0204328:	5a71                	li	s4,-4
ffffffffc020432a:	bfe5                	j	ffffffffc0204322 <do_execve+0x21c>
ffffffffc020432c:	02893603          	ld	a2,40(s2)
ffffffffc0204330:	02093783          	ld	a5,32(s2)
ffffffffc0204334:	26f66c63          	bltu	a2,a5,ffffffffc02045ac <do_execve+0x4a6>
ffffffffc0204338:	00492783          	lw	a5,4(s2)
ffffffffc020433c:	0017f693          	andi	a3,a5,1
ffffffffc0204340:	c291                	beqz	a3,ffffffffc0204344 <do_execve+0x23e>
ffffffffc0204342:	4691                	li	a3,4
ffffffffc0204344:	0027f713          	andi	a4,a5,2
ffffffffc0204348:	8b91                	andi	a5,a5,4
ffffffffc020434a:	14071c63          	bnez	a4,ffffffffc02044a2 <do_execve+0x39c>
ffffffffc020434e:	4745                	li	a4,17
ffffffffc0204350:	e03a                	sd	a4,0(sp)
ffffffffc0204352:	c789                	beqz	a5,ffffffffc020435c <do_execve+0x256>
ffffffffc0204354:	47cd                	li	a5,19
ffffffffc0204356:	0016e693          	ori	a3,a3,1
ffffffffc020435a:	e03e                	sd	a5,0(sp)
ffffffffc020435c:	0026f793          	andi	a5,a3,2
ffffffffc0204360:	14079563          	bnez	a5,ffffffffc02044aa <do_execve+0x3a4>
ffffffffc0204364:	0046f793          	andi	a5,a3,4
ffffffffc0204368:	c789                	beqz	a5,ffffffffc0204372 <do_execve+0x26c>
ffffffffc020436a:	6782                	ld	a5,0(sp)
ffffffffc020436c:	0087e793          	ori	a5,a5,8
ffffffffc0204370:	e03e                	sd	a5,0(sp)
ffffffffc0204372:	01093583          	ld	a1,16(s2)
ffffffffc0204376:	4701                	li	a4,0
ffffffffc0204378:	8526                	mv	a0,s1
ffffffffc020437a:	b89fc0ef          	jal	ra,ffffffffc0200f02 <mm_map>
ffffffffc020437e:	8a2a                	mv	s4,a0
ffffffffc0204380:	e151                	bnez	a0,ffffffffc0204404 <do_execve+0x2fe>
ffffffffc0204382:	01093c03          	ld	s8,16(s2)
ffffffffc0204386:	02093a03          	ld	s4,32(s2)
ffffffffc020438a:	00893b03          	ld	s6,8(s2)
ffffffffc020438e:	77fd                	lui	a5,0xfffff
ffffffffc0204390:	9a62                	add	s4,s4,s8
ffffffffc0204392:	9b4e                	add	s6,s6,s3
ffffffffc0204394:	00fc7bb3          	and	s7,s8,a5
ffffffffc0204398:	054c6e63          	bltu	s8,s4,ffffffffc02043f4 <do_execve+0x2ee>
ffffffffc020439c:	a431                	j	ffffffffc02045a8 <do_execve+0x4a2>
ffffffffc020439e:	6785                	lui	a5,0x1
ffffffffc02043a0:	417c0533          	sub	a0,s8,s7
ffffffffc02043a4:	9bbe                	add	s7,s7,a5
ffffffffc02043a6:	418b8633          	sub	a2,s7,s8
ffffffffc02043aa:	017a7463          	bgeu	s4,s7,ffffffffc02043b2 <do_execve+0x2ac>
ffffffffc02043ae:	418a0633          	sub	a2,s4,s8
ffffffffc02043b2:	000db683          	ld	a3,0(s11)
ffffffffc02043b6:	000d3803          	ld	a6,0(s10)
ffffffffc02043ba:	67a2                	ld	a5,8(sp)
ffffffffc02043bc:	40d406b3          	sub	a3,s0,a3
ffffffffc02043c0:	8699                	srai	a3,a3,0x6
ffffffffc02043c2:	000cb583          	ld	a1,0(s9)
ffffffffc02043c6:	96c2                	add	a3,a3,a6
ffffffffc02043c8:	00f6f833          	and	a6,a3,a5
ffffffffc02043cc:	06b2                	slli	a3,a3,0xc
ffffffffc02043ce:	1eb87163          	bgeu	a6,a1,ffffffffc02045b0 <do_execve+0x4aa>
ffffffffc02043d2:	00015797          	auipc	a5,0x15
ffffffffc02043d6:	25e78793          	addi	a5,a5,606 # ffffffffc0219630 <va_pa_offset>
ffffffffc02043da:	0007b803          	ld	a6,0(a5)
ffffffffc02043de:	85da                	mv	a1,s6
ffffffffc02043e0:	9c32                	add	s8,s8,a2
ffffffffc02043e2:	96c2                	add	a3,a3,a6
ffffffffc02043e4:	9536                	add	a0,a0,a3
ffffffffc02043e6:	e832                	sd	a2,16(sp)
ffffffffc02043e8:	6e8030ef          	jal	ra,ffffffffc0207ad0 <memcpy>
ffffffffc02043ec:	6642                	ld	a2,16(sp)
ffffffffc02043ee:	9b32                	add	s6,s6,a2
ffffffffc02043f0:	0d4c7063          	bgeu	s8,s4,ffffffffc02044b0 <do_execve+0x3aa>
ffffffffc02043f4:	6c88                	ld	a0,24(s1)
ffffffffc02043f6:	6602                	ld	a2,0(sp)
ffffffffc02043f8:	85de                	mv	a1,s7
ffffffffc02043fa:	c21fe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc02043fe:	842a                	mv	s0,a0
ffffffffc0204400:	fd59                	bnez	a0,ffffffffc020439e <do_execve+0x298>
ffffffffc0204402:	5a71                	li	s4,-4
ffffffffc0204404:	8526                	mv	a0,s1
ffffffffc0204406:	c47fc0ef          	jal	ra,ffffffffc020104c <exit_mmap>
ffffffffc020440a:	a011                	j	ffffffffc020440e <do_execve+0x308>
ffffffffc020440c:	5a61                	li	s4,-8
ffffffffc020440e:	6c94                	ld	a3,24(s1)
ffffffffc0204410:	c02007b7          	lui	a5,0xc0200
ffffffffc0204414:	1af6ea63          	bltu	a3,a5,ffffffffc02045c8 <do_execve+0x4c2>
ffffffffc0204418:	00015517          	auipc	a0,0x15
ffffffffc020441c:	21853503          	ld	a0,536(a0) # ffffffffc0219630 <va_pa_offset>
ffffffffc0204420:	8e89                	sub	a3,a3,a0
ffffffffc0204422:	82b1                	srli	a3,a3,0xc
ffffffffc0204424:	00015797          	auipc	a5,0x15
ffffffffc0204428:	0cc7b783          	ld	a5,204(a5) # ffffffffc02194f0 <npage>
ffffffffc020442c:	1af6fa63          	bgeu	a3,a5,ffffffffc02045e0 <do_execve+0x4da>
ffffffffc0204430:	00006517          	auipc	a0,0x6
ffffffffc0204434:	11053503          	ld	a0,272(a0) # ffffffffc020a540 <nbase>
ffffffffc0204438:	8e89                	sub	a3,a3,a0
ffffffffc020443a:	069a                	slli	a3,a3,0x6
ffffffffc020443c:	00015517          	auipc	a0,0x15
ffffffffc0204440:	20453503          	ld	a0,516(a0) # ffffffffc0219640 <pages>
ffffffffc0204444:	9536                	add	a0,a0,a3
ffffffffc0204446:	4585                	li	a1,1
ffffffffc0204448:	b28fe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc020444c:	8526                	mv	a0,s1
ffffffffc020444e:	a63fc0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc0204452:	bdc1                	j	ffffffffc0204322 <do_execve+0x21c>
ffffffffc0204454:	8552                	mv	a0,s4
ffffffffc0204456:	bf7fc0ef          	jal	ra,ffffffffc020104c <exit_mmap>
ffffffffc020445a:	018a3683          	ld	a3,24(s4)
ffffffffc020445e:	c02007b7          	lui	a5,0xc0200
ffffffffc0204462:	16f6e363          	bltu	a3,a5,ffffffffc02045c8 <do_execve+0x4c2>
ffffffffc0204466:	00015797          	auipc	a5,0x15
ffffffffc020446a:	1ca7b783          	ld	a5,458(a5) # ffffffffc0219630 <va_pa_offset>
ffffffffc020446e:	8e9d                	sub	a3,a3,a5
ffffffffc0204470:	82b1                	srli	a3,a3,0xc
ffffffffc0204472:	00015797          	auipc	a5,0x15
ffffffffc0204476:	07e7b783          	ld	a5,126(a5) # ffffffffc02194f0 <npage>
ffffffffc020447a:	16f6f363          	bgeu	a3,a5,ffffffffc02045e0 <do_execve+0x4da>
ffffffffc020447e:	00006517          	auipc	a0,0x6
ffffffffc0204482:	0c253503          	ld	a0,194(a0) # ffffffffc020a540 <nbase>
ffffffffc0204486:	8e89                	sub	a3,a3,a0
ffffffffc0204488:	069a                	slli	a3,a3,0x6
ffffffffc020448a:	00015517          	auipc	a0,0x15
ffffffffc020448e:	1b653503          	ld	a0,438(a0) # ffffffffc0219640 <pages>
ffffffffc0204492:	9536                	add	a0,a0,a3
ffffffffc0204494:	4585                	li	a1,1
ffffffffc0204496:	adafe0ef          	jal	ra,ffffffffc0202770 <free_pages>
ffffffffc020449a:	8552                	mv	a0,s4
ffffffffc020449c:	a15fc0ef          	jal	ra,ffffffffc0200eb0 <mm_destroy>
ffffffffc02044a0:	b9dd                	j	ffffffffc0204196 <do_execve+0x90>
ffffffffc02044a2:	0026e693          	ori	a3,a3,2
ffffffffc02044a6:	ea0797e3          	bnez	a5,ffffffffc0204354 <do_execve+0x24e>
ffffffffc02044aa:	47dd                	li	a5,23
ffffffffc02044ac:	e03e                	sd	a5,0(sp)
ffffffffc02044ae:	bd5d                	j	ffffffffc0204364 <do_execve+0x25e>
ffffffffc02044b0:	01093a03          	ld	s4,16(s2)
ffffffffc02044b4:	02893683          	ld	a3,40(s2)
ffffffffc02044b8:	9a36                	add	s4,s4,a3
ffffffffc02044ba:	077c7f63          	bgeu	s8,s7,ffffffffc0204538 <do_execve+0x432>
ffffffffc02044be:	d58a04e3          	beq	s4,s8,ffffffffc0204206 <do_execve+0x100>
ffffffffc02044c2:	6505                	lui	a0,0x1
ffffffffc02044c4:	9562                	add	a0,a0,s8
ffffffffc02044c6:	41750533          	sub	a0,a0,s7
ffffffffc02044ca:	418a0b33          	sub	s6,s4,s8
ffffffffc02044ce:	0d7a7863          	bgeu	s4,s7,ffffffffc020459e <do_execve+0x498>
ffffffffc02044d2:	000db683          	ld	a3,0(s11)
ffffffffc02044d6:	000d3583          	ld	a1,0(s10)
ffffffffc02044da:	67a2                	ld	a5,8(sp)
ffffffffc02044dc:	40d406b3          	sub	a3,s0,a3
ffffffffc02044e0:	8699                	srai	a3,a3,0x6
ffffffffc02044e2:	000cb603          	ld	a2,0(s9)
ffffffffc02044e6:	96ae                	add	a3,a3,a1
ffffffffc02044e8:	00f6f5b3          	and	a1,a3,a5
ffffffffc02044ec:	06b2                	slli	a3,a3,0xc
ffffffffc02044ee:	0cc5f163          	bgeu	a1,a2,ffffffffc02045b0 <do_execve+0x4aa>
ffffffffc02044f2:	00015617          	auipc	a2,0x15
ffffffffc02044f6:	13e63603          	ld	a2,318(a2) # ffffffffc0219630 <va_pa_offset>
ffffffffc02044fa:	96b2                	add	a3,a3,a2
ffffffffc02044fc:	4581                	li	a1,0
ffffffffc02044fe:	865a                	mv	a2,s6
ffffffffc0204500:	9536                	add	a0,a0,a3
ffffffffc0204502:	5bc030ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc0204506:	018b0733          	add	a4,s6,s8
ffffffffc020450a:	037a7463          	bgeu	s4,s7,ffffffffc0204532 <do_execve+0x42c>
ffffffffc020450e:	ceea0ce3          	beq	s4,a4,ffffffffc0204206 <do_execve+0x100>
ffffffffc0204512:	00005697          	auipc	a3,0x5
ffffffffc0204516:	13668693          	addi	a3,a3,310 # ffffffffc0209648 <default_pmm_manager+0x488>
ffffffffc020451a:	00004617          	auipc	a2,0x4
ffffffffc020451e:	08660613          	addi	a2,a2,134 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204522:	25800593          	li	a1,600
ffffffffc0204526:	00005517          	auipc	a0,0x5
ffffffffc020452a:	f7a50513          	addi	a0,a0,-134 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc020452e:	cdbfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204532:	ff7710e3          	bne	a4,s7,ffffffffc0204512 <do_execve+0x40c>
ffffffffc0204536:	8c5e                	mv	s8,s7
ffffffffc0204538:	00015b17          	auipc	s6,0x15
ffffffffc020453c:	0f8b0b13          	addi	s6,s6,248 # ffffffffc0219630 <va_pa_offset>
ffffffffc0204540:	054c6763          	bltu	s8,s4,ffffffffc020458e <do_execve+0x488>
ffffffffc0204544:	b1c9                	j	ffffffffc0204206 <do_execve+0x100>
ffffffffc0204546:	6785                	lui	a5,0x1
ffffffffc0204548:	417c0533          	sub	a0,s8,s7
ffffffffc020454c:	9bbe                	add	s7,s7,a5
ffffffffc020454e:	418b8633          	sub	a2,s7,s8
ffffffffc0204552:	017a7463          	bgeu	s4,s7,ffffffffc020455a <do_execve+0x454>
ffffffffc0204556:	418a0633          	sub	a2,s4,s8
ffffffffc020455a:	000db683          	ld	a3,0(s11)
ffffffffc020455e:	000d3803          	ld	a6,0(s10)
ffffffffc0204562:	67a2                	ld	a5,8(sp)
ffffffffc0204564:	40d406b3          	sub	a3,s0,a3
ffffffffc0204568:	8699                	srai	a3,a3,0x6
ffffffffc020456a:	000cb583          	ld	a1,0(s9)
ffffffffc020456e:	96c2                	add	a3,a3,a6
ffffffffc0204570:	00f6f833          	and	a6,a3,a5
ffffffffc0204574:	06b2                	slli	a3,a3,0xc
ffffffffc0204576:	02b87d63          	bgeu	a6,a1,ffffffffc02045b0 <do_execve+0x4aa>
ffffffffc020457a:	000b3803          	ld	a6,0(s6)
ffffffffc020457e:	9c32                	add	s8,s8,a2
ffffffffc0204580:	4581                	li	a1,0
ffffffffc0204582:	96c2                	add	a3,a3,a6
ffffffffc0204584:	9536                	add	a0,a0,a3
ffffffffc0204586:	538030ef          	jal	ra,ffffffffc0207abe <memset>
ffffffffc020458a:	c74c7ee3          	bgeu	s8,s4,ffffffffc0204206 <do_execve+0x100>
ffffffffc020458e:	6c88                	ld	a0,24(s1)
ffffffffc0204590:	6602                	ld	a2,0(sp)
ffffffffc0204592:	85de                	mv	a1,s7
ffffffffc0204594:	a87fe0ef          	jal	ra,ffffffffc020301a <pgdir_alloc_page>
ffffffffc0204598:	842a                	mv	s0,a0
ffffffffc020459a:	f555                	bnez	a0,ffffffffc0204546 <do_execve+0x440>
ffffffffc020459c:	b59d                	j	ffffffffc0204402 <do_execve+0x2fc>
ffffffffc020459e:	418b8b33          	sub	s6,s7,s8
ffffffffc02045a2:	bf05                	j	ffffffffc02044d2 <do_execve+0x3cc>
ffffffffc02045a4:	5a75                	li	s4,-3
ffffffffc02045a6:	b315                	j	ffffffffc02042ca <do_execve+0x1c4>
ffffffffc02045a8:	8a62                	mv	s4,s8
ffffffffc02045aa:	b729                	j	ffffffffc02044b4 <do_execve+0x3ae>
ffffffffc02045ac:	5a61                	li	s4,-8
ffffffffc02045ae:	bd99                	j	ffffffffc0204404 <do_execve+0x2fe>
ffffffffc02045b0:	00004617          	auipc	a2,0x4
ffffffffc02045b4:	5d060613          	addi	a2,a2,1488 # ffffffffc0208b80 <commands+0x9f0>
ffffffffc02045b8:	06900593          	li	a1,105
ffffffffc02045bc:	00004517          	auipc	a0,0x4
ffffffffc02045c0:	5ec50513          	addi	a0,a0,1516 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc02045c4:	c45fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02045c8:	00004617          	auipc	a2,0x4
ffffffffc02045cc:	62860613          	addi	a2,a2,1576 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc02045d0:	06e00593          	li	a1,110
ffffffffc02045d4:	00004517          	auipc	a0,0x4
ffffffffc02045d8:	5d450513          	addi	a0,a0,1492 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc02045dc:	c2dfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02045e0:	00004617          	auipc	a2,0x4
ffffffffc02045e4:	63860613          	addi	a2,a2,1592 # ffffffffc0208c18 <commands+0xa88>
ffffffffc02045e8:	06200593          	li	a1,98
ffffffffc02045ec:	00004517          	auipc	a0,0x4
ffffffffc02045f0:	5bc50513          	addi	a0,a0,1468 # ffffffffc0208ba8 <commands+0xa18>
ffffffffc02045f4:	c15fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02045f8:	00004617          	auipc	a2,0x4
ffffffffc02045fc:	5f860613          	addi	a2,a2,1528 # ffffffffc0208bf0 <commands+0xa60>
ffffffffc0204600:	27300593          	li	a1,627
ffffffffc0204604:	00005517          	auipc	a0,0x5
ffffffffc0204608:	e9c50513          	addi	a0,a0,-356 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc020460c:	bfdfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204610:	00005697          	auipc	a3,0x5
ffffffffc0204614:	15068693          	addi	a3,a3,336 # ffffffffc0209760 <default_pmm_manager+0x5a0>
ffffffffc0204618:	00004617          	auipc	a2,0x4
ffffffffc020461c:	f8860613          	addi	a2,a2,-120 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204620:	26e00593          	li	a1,622
ffffffffc0204624:	00005517          	auipc	a0,0x5
ffffffffc0204628:	e7c50513          	addi	a0,a0,-388 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc020462c:	bddfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204630:	00005697          	auipc	a3,0x5
ffffffffc0204634:	0e868693          	addi	a3,a3,232 # ffffffffc0209718 <default_pmm_manager+0x558>
ffffffffc0204638:	00004617          	auipc	a2,0x4
ffffffffc020463c:	f6860613          	addi	a2,a2,-152 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204640:	26d00593          	li	a1,621
ffffffffc0204644:	00005517          	auipc	a0,0x5
ffffffffc0204648:	e5c50513          	addi	a0,a0,-420 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc020464c:	bbdfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204650:	00005697          	auipc	a3,0x5
ffffffffc0204654:	08068693          	addi	a3,a3,128 # ffffffffc02096d0 <default_pmm_manager+0x510>
ffffffffc0204658:	00004617          	auipc	a2,0x4
ffffffffc020465c:	f4860613          	addi	a2,a2,-184 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204660:	26c00593          	li	a1,620
ffffffffc0204664:	00005517          	auipc	a0,0x5
ffffffffc0204668:	e3c50513          	addi	a0,a0,-452 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc020466c:	b9dfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204670:	00005697          	auipc	a3,0x5
ffffffffc0204674:	01868693          	addi	a3,a3,24 # ffffffffc0209688 <default_pmm_manager+0x4c8>
ffffffffc0204678:	00004617          	auipc	a2,0x4
ffffffffc020467c:	f2860613          	addi	a2,a2,-216 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204680:	26b00593          	li	a1,619
ffffffffc0204684:	00005517          	auipc	a0,0x5
ffffffffc0204688:	e1c50513          	addi	a0,a0,-484 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc020468c:	b7dfb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204690 <do_yield>:
ffffffffc0204690:	00015797          	auipc	a5,0x15
ffffffffc0204694:	e687b783          	ld	a5,-408(a5) # ffffffffc02194f8 <current>
ffffffffc0204698:	4705                	li	a4,1
ffffffffc020469a:	ef98                	sd	a4,24(a5)
ffffffffc020469c:	4501                	li	a0,0
ffffffffc020469e:	8082                	ret

ffffffffc02046a0 <do_wait>:
ffffffffc02046a0:	1101                	addi	sp,sp,-32
ffffffffc02046a2:	e822                	sd	s0,16(sp)
ffffffffc02046a4:	e426                	sd	s1,8(sp)
ffffffffc02046a6:	ec06                	sd	ra,24(sp)
ffffffffc02046a8:	842e                	mv	s0,a1
ffffffffc02046aa:	84aa                	mv	s1,a0
ffffffffc02046ac:	c999                	beqz	a1,ffffffffc02046c2 <do_wait+0x22>
ffffffffc02046ae:	00015797          	auipc	a5,0x15
ffffffffc02046b2:	e4a7b783          	ld	a5,-438(a5) # ffffffffc02194f8 <current>
ffffffffc02046b6:	7788                	ld	a0,40(a5)
ffffffffc02046b8:	4685                	li	a3,1
ffffffffc02046ba:	4611                	li	a2,4
ffffffffc02046bc:	b0bfc0ef          	jal	ra,ffffffffc02011c6 <user_mem_check>
ffffffffc02046c0:	c909                	beqz	a0,ffffffffc02046d2 <do_wait+0x32>
ffffffffc02046c2:	85a2                	mv	a1,s0
ffffffffc02046c4:	6442                	ld	s0,16(sp)
ffffffffc02046c6:	60e2                	ld	ra,24(sp)
ffffffffc02046c8:	8526                	mv	a0,s1
ffffffffc02046ca:	64a2                	ld	s1,8(sp)
ffffffffc02046cc:	6105                	addi	sp,sp,32
ffffffffc02046ce:	fa6ff06f          	j	ffffffffc0203e74 <do_wait.part.0>
ffffffffc02046d2:	60e2                	ld	ra,24(sp)
ffffffffc02046d4:	6442                	ld	s0,16(sp)
ffffffffc02046d6:	64a2                	ld	s1,8(sp)
ffffffffc02046d8:	5575                	li	a0,-3
ffffffffc02046da:	6105                	addi	sp,sp,32
ffffffffc02046dc:	8082                	ret

ffffffffc02046de <do_kill>:
ffffffffc02046de:	1141                	addi	sp,sp,-16
ffffffffc02046e0:	e406                	sd	ra,8(sp)
ffffffffc02046e2:	e022                	sd	s0,0(sp)
ffffffffc02046e4:	960ff0ef          	jal	ra,ffffffffc0203844 <find_proc>
ffffffffc02046e8:	cd0d                	beqz	a0,ffffffffc0204722 <do_kill+0x44>
ffffffffc02046ea:	0b052703          	lw	a4,176(a0)
ffffffffc02046ee:	00177693          	andi	a3,a4,1
ffffffffc02046f2:	e695                	bnez	a3,ffffffffc020471e <do_kill+0x40>
ffffffffc02046f4:	0ec52683          	lw	a3,236(a0)
ffffffffc02046f8:	00176713          	ori	a4,a4,1
ffffffffc02046fc:	0ae52823          	sw	a4,176(a0)
ffffffffc0204700:	4401                	li	s0,0
ffffffffc0204702:	0006c763          	bltz	a3,ffffffffc0204710 <do_kill+0x32>
ffffffffc0204706:	60a2                	ld	ra,8(sp)
ffffffffc0204708:	8522                	mv	a0,s0
ffffffffc020470a:	6402                	ld	s0,0(sp)
ffffffffc020470c:	0141                	addi	sp,sp,16
ffffffffc020470e:	8082                	ret
ffffffffc0204710:	276000ef          	jal	ra,ffffffffc0204986 <wakeup_proc>
ffffffffc0204714:	60a2                	ld	ra,8(sp)
ffffffffc0204716:	8522                	mv	a0,s0
ffffffffc0204718:	6402                	ld	s0,0(sp)
ffffffffc020471a:	0141                	addi	sp,sp,16
ffffffffc020471c:	8082                	ret
ffffffffc020471e:	545d                	li	s0,-9
ffffffffc0204720:	b7dd                	j	ffffffffc0204706 <do_kill+0x28>
ffffffffc0204722:	5475                	li	s0,-3
ffffffffc0204724:	b7cd                	j	ffffffffc0204706 <do_kill+0x28>

ffffffffc0204726 <proc_init>:
ffffffffc0204726:	1101                	addi	sp,sp,-32
ffffffffc0204728:	00015797          	auipc	a5,0x15
ffffffffc020472c:	f8078793          	addi	a5,a5,-128 # ffffffffc02196a8 <proc_list>
ffffffffc0204730:	ec06                	sd	ra,24(sp)
ffffffffc0204732:	e822                	sd	s0,16(sp)
ffffffffc0204734:	e426                	sd	s1,8(sp)
ffffffffc0204736:	e04a                	sd	s2,0(sp)
ffffffffc0204738:	e79c                	sd	a5,8(a5)
ffffffffc020473a:	e39c                	sd	a5,0(a5)
ffffffffc020473c:	00015717          	auipc	a4,0x15
ffffffffc0204740:	d5470713          	addi	a4,a4,-684 # ffffffffc0219490 <__rq>
ffffffffc0204744:	00011797          	auipc	a5,0x11
ffffffffc0204748:	d4c78793          	addi	a5,a5,-692 # ffffffffc0215490 <hash_list>
ffffffffc020474c:	e79c                	sd	a5,8(a5)
ffffffffc020474e:	e39c                	sd	a5,0(a5)
ffffffffc0204750:	07c1                	addi	a5,a5,16
ffffffffc0204752:	fef71de3          	bne	a4,a5,ffffffffc020474c <proc_init+0x26>
ffffffffc0204756:	f57fe0ef          	jal	ra,ffffffffc02036ac <alloc_proc>
ffffffffc020475a:	00015417          	auipc	s0,0x15
ffffffffc020475e:	da640413          	addi	s0,s0,-602 # ffffffffc0219500 <idleproc>
ffffffffc0204762:	e008                	sd	a0,0(s0)
ffffffffc0204764:	c541                	beqz	a0,ffffffffc02047ec <proc_init+0xc6>
ffffffffc0204766:	4709                	li	a4,2
ffffffffc0204768:	e118                	sd	a4,0(a0)
ffffffffc020476a:	4485                	li	s1,1
ffffffffc020476c:	00007717          	auipc	a4,0x7
ffffffffc0204770:	89470713          	addi	a4,a4,-1900 # ffffffffc020b000 <bootstack>
ffffffffc0204774:	00005597          	auipc	a1,0x5
ffffffffc0204778:	04c58593          	addi	a1,a1,76 # ffffffffc02097c0 <default_pmm_manager+0x600>
ffffffffc020477c:	e918                	sd	a4,16(a0)
ffffffffc020477e:	ed04                	sd	s1,24(a0)
ffffffffc0204780:	82eff0ef          	jal	ra,ffffffffc02037ae <set_proc_name>
ffffffffc0204784:	00015717          	auipc	a4,0x15
ffffffffc0204788:	d8c70713          	addi	a4,a4,-628 # ffffffffc0219510 <nr_process>
ffffffffc020478c:	431c                	lw	a5,0(a4)
ffffffffc020478e:	6014                	ld	a3,0(s0)
ffffffffc0204790:	4601                	li	a2,0
ffffffffc0204792:	2785                	addiw	a5,a5,1
ffffffffc0204794:	4581                	li	a1,0
ffffffffc0204796:	00000517          	auipc	a0,0x0
ffffffffc020479a:	87450513          	addi	a0,a0,-1932 # ffffffffc020400a <init_main>
ffffffffc020479e:	c31c                	sw	a5,0(a4)
ffffffffc02047a0:	00015797          	auipc	a5,0x15
ffffffffc02047a4:	d4d7bc23          	sd	a3,-680(a5) # ffffffffc02194f8 <current>
ffffffffc02047a8:	cc6ff0ef          	jal	ra,ffffffffc0203c6e <kernel_thread>
ffffffffc02047ac:	08a05c63          	blez	a0,ffffffffc0204844 <proc_init+0x11e>
ffffffffc02047b0:	894ff0ef          	jal	ra,ffffffffc0203844 <find_proc>
ffffffffc02047b4:	00015917          	auipc	s2,0x15
ffffffffc02047b8:	d5490913          	addi	s2,s2,-684 # ffffffffc0219508 <initproc>
ffffffffc02047bc:	00005597          	auipc	a1,0x5
ffffffffc02047c0:	02c58593          	addi	a1,a1,44 # ffffffffc02097e8 <default_pmm_manager+0x628>
ffffffffc02047c4:	00a93023          	sd	a0,0(s2)
ffffffffc02047c8:	fe7fe0ef          	jal	ra,ffffffffc02037ae <set_proc_name>
ffffffffc02047cc:	601c                	ld	a5,0(s0)
ffffffffc02047ce:	cbb9                	beqz	a5,ffffffffc0204824 <proc_init+0xfe>
ffffffffc02047d0:	43dc                	lw	a5,4(a5)
ffffffffc02047d2:	eba9                	bnez	a5,ffffffffc0204824 <proc_init+0xfe>
ffffffffc02047d4:	00093783          	ld	a5,0(s2)
ffffffffc02047d8:	c795                	beqz	a5,ffffffffc0204804 <proc_init+0xde>
ffffffffc02047da:	43dc                	lw	a5,4(a5)
ffffffffc02047dc:	02979463          	bne	a5,s1,ffffffffc0204804 <proc_init+0xde>
ffffffffc02047e0:	60e2                	ld	ra,24(sp)
ffffffffc02047e2:	6442                	ld	s0,16(sp)
ffffffffc02047e4:	64a2                	ld	s1,8(sp)
ffffffffc02047e6:	6902                	ld	s2,0(sp)
ffffffffc02047e8:	6105                	addi	sp,sp,32
ffffffffc02047ea:	8082                	ret
ffffffffc02047ec:	00005617          	auipc	a2,0x5
ffffffffc02047f0:	fbc60613          	addi	a2,a2,-68 # ffffffffc02097a8 <default_pmm_manager+0x5e8>
ffffffffc02047f4:	37700593          	li	a1,887
ffffffffc02047f8:	00005517          	auipc	a0,0x5
ffffffffc02047fc:	ca850513          	addi	a0,a0,-856 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0204800:	a09fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204804:	00005697          	auipc	a3,0x5
ffffffffc0204808:	01468693          	addi	a3,a3,20 # ffffffffc0209818 <default_pmm_manager+0x658>
ffffffffc020480c:	00004617          	auipc	a2,0x4
ffffffffc0204810:	d9460613          	addi	a2,a2,-620 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204814:	38c00593          	li	a1,908
ffffffffc0204818:	00005517          	auipc	a0,0x5
ffffffffc020481c:	c8850513          	addi	a0,a0,-888 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0204820:	9e9fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204824:	00005697          	auipc	a3,0x5
ffffffffc0204828:	fcc68693          	addi	a3,a3,-52 # ffffffffc02097f0 <default_pmm_manager+0x630>
ffffffffc020482c:	00004617          	auipc	a2,0x4
ffffffffc0204830:	d7460613          	addi	a2,a2,-652 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204834:	38b00593          	li	a1,907
ffffffffc0204838:	00005517          	auipc	a0,0x5
ffffffffc020483c:	c6850513          	addi	a0,a0,-920 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0204840:	9c9fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204844:	00005617          	auipc	a2,0x5
ffffffffc0204848:	f8460613          	addi	a2,a2,-124 # ffffffffc02097c8 <default_pmm_manager+0x608>
ffffffffc020484c:	38500593          	li	a1,901
ffffffffc0204850:	00005517          	auipc	a0,0x5
ffffffffc0204854:	c5050513          	addi	a0,a0,-944 # ffffffffc02094a0 <default_pmm_manager+0x2e0>
ffffffffc0204858:	9b1fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020485c <cpu_idle>:
ffffffffc020485c:	1141                	addi	sp,sp,-16
ffffffffc020485e:	e022                	sd	s0,0(sp)
ffffffffc0204860:	e406                	sd	ra,8(sp)
ffffffffc0204862:	00015417          	auipc	s0,0x15
ffffffffc0204866:	c9640413          	addi	s0,s0,-874 # ffffffffc02194f8 <current>
ffffffffc020486a:	6018                	ld	a4,0(s0)
ffffffffc020486c:	6f1c                	ld	a5,24(a4)
ffffffffc020486e:	dffd                	beqz	a5,ffffffffc020486c <cpu_idle+0x10>
ffffffffc0204870:	1c8000ef          	jal	ra,ffffffffc0204a38 <schedule>
ffffffffc0204874:	bfdd                	j	ffffffffc020486a <cpu_idle+0xe>

ffffffffc0204876 <lab6_set_priority>:
ffffffffc0204876:	1141                	addi	sp,sp,-16
ffffffffc0204878:	e022                	sd	s0,0(sp)
ffffffffc020487a:	85aa                	mv	a1,a0
ffffffffc020487c:	842a                	mv	s0,a0
ffffffffc020487e:	00005517          	auipc	a0,0x5
ffffffffc0204882:	fc250513          	addi	a0,a0,-62 # ffffffffc0209840 <default_pmm_manager+0x680>
ffffffffc0204886:	e406                	sd	ra,8(sp)
ffffffffc0204888:	845fb0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020488c:	00015797          	auipc	a5,0x15
ffffffffc0204890:	c6c7b783          	ld	a5,-916(a5) # ffffffffc02194f8 <current>
ffffffffc0204894:	e801                	bnez	s0,ffffffffc02048a4 <lab6_set_priority+0x2e>
ffffffffc0204896:	60a2                	ld	ra,8(sp)
ffffffffc0204898:	6402                	ld	s0,0(sp)
ffffffffc020489a:	4705                	li	a4,1
ffffffffc020489c:	14e7a223          	sw	a4,324(a5)
ffffffffc02048a0:	0141                	addi	sp,sp,16
ffffffffc02048a2:	8082                	ret
ffffffffc02048a4:	60a2                	ld	ra,8(sp)
ffffffffc02048a6:	1487a223          	sw	s0,324(a5)
ffffffffc02048aa:	6402                	ld	s0,0(sp)
ffffffffc02048ac:	0141                	addi	sp,sp,16
ffffffffc02048ae:	8082                	ret

ffffffffc02048b0 <do_sleep>:
ffffffffc02048b0:	c539                	beqz	a0,ffffffffc02048fe <do_sleep+0x4e>
ffffffffc02048b2:	7179                	addi	sp,sp,-48
ffffffffc02048b4:	f022                	sd	s0,32(sp)
ffffffffc02048b6:	f406                	sd	ra,40(sp)
ffffffffc02048b8:	842a                	mv	s0,a0
ffffffffc02048ba:	100027f3          	csrr	a5,sstatus
ffffffffc02048be:	8b89                	andi	a5,a5,2
ffffffffc02048c0:	e3a9                	bnez	a5,ffffffffc0204902 <do_sleep+0x52>
ffffffffc02048c2:	00015797          	auipc	a5,0x15
ffffffffc02048c6:	c367b783          	ld	a5,-970(a5) # ffffffffc02194f8 <current>
ffffffffc02048ca:	0818                	addi	a4,sp,16
ffffffffc02048cc:	c02a                	sw	a0,0(sp)
ffffffffc02048ce:	ec3a                	sd	a4,24(sp)
ffffffffc02048d0:	e83a                	sd	a4,16(sp)
ffffffffc02048d2:	e43e                	sd	a5,8(sp)
ffffffffc02048d4:	4705                	li	a4,1
ffffffffc02048d6:	c398                	sw	a4,0(a5)
ffffffffc02048d8:	80000737          	lui	a4,0x80000
ffffffffc02048dc:	840a                	mv	s0,sp
ffffffffc02048de:	2709                	addiw	a4,a4,2
ffffffffc02048e0:	0ee7a623          	sw	a4,236(a5)
ffffffffc02048e4:	8522                	mv	a0,s0
ffffffffc02048e6:	218000ef          	jal	ra,ffffffffc0204afe <add_timer>
ffffffffc02048ea:	14e000ef          	jal	ra,ffffffffc0204a38 <schedule>
ffffffffc02048ee:	8522                	mv	a0,s0
ffffffffc02048f0:	2d6000ef          	jal	ra,ffffffffc0204bc6 <del_timer>
ffffffffc02048f4:	70a2                	ld	ra,40(sp)
ffffffffc02048f6:	7402                	ld	s0,32(sp)
ffffffffc02048f8:	4501                	li	a0,0
ffffffffc02048fa:	6145                	addi	sp,sp,48
ffffffffc02048fc:	8082                	ret
ffffffffc02048fe:	4501                	li	a0,0
ffffffffc0204900:	8082                	ret
ffffffffc0204902:	d37fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204906:	00015797          	auipc	a5,0x15
ffffffffc020490a:	bf27b783          	ld	a5,-1038(a5) # ffffffffc02194f8 <current>
ffffffffc020490e:	0818                	addi	a4,sp,16
ffffffffc0204910:	c022                	sw	s0,0(sp)
ffffffffc0204912:	e43e                	sd	a5,8(sp)
ffffffffc0204914:	ec3a                	sd	a4,24(sp)
ffffffffc0204916:	e83a                	sd	a4,16(sp)
ffffffffc0204918:	4705                	li	a4,1
ffffffffc020491a:	c398                	sw	a4,0(a5)
ffffffffc020491c:	80000737          	lui	a4,0x80000
ffffffffc0204920:	2709                	addiw	a4,a4,2
ffffffffc0204922:	840a                	mv	s0,sp
ffffffffc0204924:	8522                	mv	a0,s0
ffffffffc0204926:	0ee7a623          	sw	a4,236(a5)
ffffffffc020492a:	1d4000ef          	jal	ra,ffffffffc0204afe <add_timer>
ffffffffc020492e:	d05fb0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0204932:	bf65                	j	ffffffffc02048ea <do_sleep+0x3a>

ffffffffc0204934 <sched_init>:
ffffffffc0204934:	1141                	addi	sp,sp,-16
ffffffffc0204936:	00009717          	auipc	a4,0x9
ffffffffc020493a:	71a70713          	addi	a4,a4,1818 # ffffffffc020e050 <default_sched_class>
ffffffffc020493e:	e022                	sd	s0,0(sp)
ffffffffc0204940:	e406                	sd	ra,8(sp)
ffffffffc0204942:	00015797          	auipc	a5,0x15
ffffffffc0204946:	b6e78793          	addi	a5,a5,-1170 # ffffffffc02194b0 <timer_list>
ffffffffc020494a:	6714                	ld	a3,8(a4)
ffffffffc020494c:	00015517          	auipc	a0,0x15
ffffffffc0204950:	b4450513          	addi	a0,a0,-1212 # ffffffffc0219490 <__rq>
ffffffffc0204954:	e79c                	sd	a5,8(a5)
ffffffffc0204956:	e39c                	sd	a5,0(a5)
ffffffffc0204958:	4795                	li	a5,5
ffffffffc020495a:	c95c                	sw	a5,20(a0)
ffffffffc020495c:	00015417          	auipc	s0,0x15
ffffffffc0204960:	bc440413          	addi	s0,s0,-1084 # ffffffffc0219520 <sched_class>
ffffffffc0204964:	00015797          	auipc	a5,0x15
ffffffffc0204968:	baa7ba23          	sd	a0,-1100(a5) # ffffffffc0219518 <rq>
ffffffffc020496c:	e018                	sd	a4,0(s0)
ffffffffc020496e:	9682                	jalr	a3
ffffffffc0204970:	601c                	ld	a5,0(s0)
ffffffffc0204972:	6402                	ld	s0,0(sp)
ffffffffc0204974:	60a2                	ld	ra,8(sp)
ffffffffc0204976:	638c                	ld	a1,0(a5)
ffffffffc0204978:	00005517          	auipc	a0,0x5
ffffffffc020497c:	ee050513          	addi	a0,a0,-288 # ffffffffc0209858 <default_pmm_manager+0x698>
ffffffffc0204980:	0141                	addi	sp,sp,16
ffffffffc0204982:	f4afb06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0204986 <wakeup_proc>:
ffffffffc0204986:	4118                	lw	a4,0(a0)
ffffffffc0204988:	1101                	addi	sp,sp,-32
ffffffffc020498a:	ec06                	sd	ra,24(sp)
ffffffffc020498c:	e822                	sd	s0,16(sp)
ffffffffc020498e:	e426                	sd	s1,8(sp)
ffffffffc0204990:	478d                	li	a5,3
ffffffffc0204992:	08f70363          	beq	a4,a5,ffffffffc0204a18 <wakeup_proc+0x92>
ffffffffc0204996:	842a                	mv	s0,a0
ffffffffc0204998:	100027f3          	csrr	a5,sstatus
ffffffffc020499c:	8b89                	andi	a5,a5,2
ffffffffc020499e:	4481                	li	s1,0
ffffffffc02049a0:	e7bd                	bnez	a5,ffffffffc0204a0e <wakeup_proc+0x88>
ffffffffc02049a2:	4789                	li	a5,2
ffffffffc02049a4:	04f70863          	beq	a4,a5,ffffffffc02049f4 <wakeup_proc+0x6e>
ffffffffc02049a8:	c01c                	sw	a5,0(s0)
ffffffffc02049aa:	0e042623          	sw	zero,236(s0)
ffffffffc02049ae:	00015797          	auipc	a5,0x15
ffffffffc02049b2:	b4a7b783          	ld	a5,-1206(a5) # ffffffffc02194f8 <current>
ffffffffc02049b6:	02878363          	beq	a5,s0,ffffffffc02049dc <wakeup_proc+0x56>
ffffffffc02049ba:	00015797          	auipc	a5,0x15
ffffffffc02049be:	b467b783          	ld	a5,-1210(a5) # ffffffffc0219500 <idleproc>
ffffffffc02049c2:	00f40d63          	beq	s0,a5,ffffffffc02049dc <wakeup_proc+0x56>
ffffffffc02049c6:	00015797          	auipc	a5,0x15
ffffffffc02049ca:	b5a7b783          	ld	a5,-1190(a5) # ffffffffc0219520 <sched_class>
ffffffffc02049ce:	6b9c                	ld	a5,16(a5)
ffffffffc02049d0:	85a2                	mv	a1,s0
ffffffffc02049d2:	00015517          	auipc	a0,0x15
ffffffffc02049d6:	b4653503          	ld	a0,-1210(a0) # ffffffffc0219518 <rq>
ffffffffc02049da:	9782                	jalr	a5
ffffffffc02049dc:	e491                	bnez	s1,ffffffffc02049e8 <wakeup_proc+0x62>
ffffffffc02049de:	60e2                	ld	ra,24(sp)
ffffffffc02049e0:	6442                	ld	s0,16(sp)
ffffffffc02049e2:	64a2                	ld	s1,8(sp)
ffffffffc02049e4:	6105                	addi	sp,sp,32
ffffffffc02049e6:	8082                	ret
ffffffffc02049e8:	6442                	ld	s0,16(sp)
ffffffffc02049ea:	60e2                	ld	ra,24(sp)
ffffffffc02049ec:	64a2                	ld	s1,8(sp)
ffffffffc02049ee:	6105                	addi	sp,sp,32
ffffffffc02049f0:	c43fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc02049f4:	00005617          	auipc	a2,0x5
ffffffffc02049f8:	eb460613          	addi	a2,a2,-332 # ffffffffc02098a8 <default_pmm_manager+0x6e8>
ffffffffc02049fc:	04800593          	li	a1,72
ffffffffc0204a00:	00005517          	auipc	a0,0x5
ffffffffc0204a04:	e9050513          	addi	a0,a0,-368 # ffffffffc0209890 <default_pmm_manager+0x6d0>
ffffffffc0204a08:	869fb0ef          	jal	ra,ffffffffc0200270 <__warn>
ffffffffc0204a0c:	bfc1                	j	ffffffffc02049dc <wakeup_proc+0x56>
ffffffffc0204a0e:	c2bfb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204a12:	4018                	lw	a4,0(s0)
ffffffffc0204a14:	4485                	li	s1,1
ffffffffc0204a16:	b771                	j	ffffffffc02049a2 <wakeup_proc+0x1c>
ffffffffc0204a18:	00005697          	auipc	a3,0x5
ffffffffc0204a1c:	e5868693          	addi	a3,a3,-424 # ffffffffc0209870 <default_pmm_manager+0x6b0>
ffffffffc0204a20:	00004617          	auipc	a2,0x4
ffffffffc0204a24:	b8060613          	addi	a2,a2,-1152 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204a28:	03c00593          	li	a1,60
ffffffffc0204a2c:	00005517          	auipc	a0,0x5
ffffffffc0204a30:	e6450513          	addi	a0,a0,-412 # ffffffffc0209890 <default_pmm_manager+0x6d0>
ffffffffc0204a34:	fd4fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204a38 <schedule>:
ffffffffc0204a38:	7179                	addi	sp,sp,-48
ffffffffc0204a3a:	f406                	sd	ra,40(sp)
ffffffffc0204a3c:	f022                	sd	s0,32(sp)
ffffffffc0204a3e:	ec26                	sd	s1,24(sp)
ffffffffc0204a40:	e84a                	sd	s2,16(sp)
ffffffffc0204a42:	e44e                	sd	s3,8(sp)
ffffffffc0204a44:	e052                	sd	s4,0(sp)
ffffffffc0204a46:	100027f3          	csrr	a5,sstatus
ffffffffc0204a4a:	8b89                	andi	a5,a5,2
ffffffffc0204a4c:	4a01                	li	s4,0
ffffffffc0204a4e:	e7c5                	bnez	a5,ffffffffc0204af6 <schedule+0xbe>
ffffffffc0204a50:	00015497          	auipc	s1,0x15
ffffffffc0204a54:	aa848493          	addi	s1,s1,-1368 # ffffffffc02194f8 <current>
ffffffffc0204a58:	608c                	ld	a1,0(s1)
ffffffffc0204a5a:	00015997          	auipc	s3,0x15
ffffffffc0204a5e:	ac698993          	addi	s3,s3,-1338 # ffffffffc0219520 <sched_class>
ffffffffc0204a62:	00015917          	auipc	s2,0x15
ffffffffc0204a66:	ab690913          	addi	s2,s2,-1354 # ffffffffc0219518 <rq>
ffffffffc0204a6a:	4194                	lw	a3,0(a1)
ffffffffc0204a6c:	0005bc23          	sd	zero,24(a1)
ffffffffc0204a70:	4709                	li	a4,2
ffffffffc0204a72:	0009b783          	ld	a5,0(s3)
ffffffffc0204a76:	00093503          	ld	a0,0(s2)
ffffffffc0204a7a:	04e68063          	beq	a3,a4,ffffffffc0204aba <schedule+0x82>
ffffffffc0204a7e:	739c                	ld	a5,32(a5)
ffffffffc0204a80:	9782                	jalr	a5
ffffffffc0204a82:	842a                	mv	s0,a0
ffffffffc0204a84:	c939                	beqz	a0,ffffffffc0204ada <schedule+0xa2>
ffffffffc0204a86:	0009b783          	ld	a5,0(s3)
ffffffffc0204a8a:	00093503          	ld	a0,0(s2)
ffffffffc0204a8e:	85a2                	mv	a1,s0
ffffffffc0204a90:	6f9c                	ld	a5,24(a5)
ffffffffc0204a92:	9782                	jalr	a5
ffffffffc0204a94:	441c                	lw	a5,8(s0)
ffffffffc0204a96:	6098                	ld	a4,0(s1)
ffffffffc0204a98:	2785                	addiw	a5,a5,1
ffffffffc0204a9a:	c41c                	sw	a5,8(s0)
ffffffffc0204a9c:	00870563          	beq	a4,s0,ffffffffc0204aa6 <schedule+0x6e>
ffffffffc0204aa0:	8522                	mv	a0,s0
ffffffffc0204aa2:	d37fe0ef          	jal	ra,ffffffffc02037d8 <proc_run>
ffffffffc0204aa6:	020a1f63          	bnez	s4,ffffffffc0204ae4 <schedule+0xac>
ffffffffc0204aaa:	70a2                	ld	ra,40(sp)
ffffffffc0204aac:	7402                	ld	s0,32(sp)
ffffffffc0204aae:	64e2                	ld	s1,24(sp)
ffffffffc0204ab0:	6942                	ld	s2,16(sp)
ffffffffc0204ab2:	69a2                	ld	s3,8(sp)
ffffffffc0204ab4:	6a02                	ld	s4,0(sp)
ffffffffc0204ab6:	6145                	addi	sp,sp,48
ffffffffc0204ab8:	8082                	ret
ffffffffc0204aba:	00015717          	auipc	a4,0x15
ffffffffc0204abe:	a4673703          	ld	a4,-1466(a4) # ffffffffc0219500 <idleproc>
ffffffffc0204ac2:	fae58ee3          	beq	a1,a4,ffffffffc0204a7e <schedule+0x46>
ffffffffc0204ac6:	6b9c                	ld	a5,16(a5)
ffffffffc0204ac8:	9782                	jalr	a5
ffffffffc0204aca:	0009b783          	ld	a5,0(s3)
ffffffffc0204ace:	00093503          	ld	a0,0(s2)
ffffffffc0204ad2:	739c                	ld	a5,32(a5)
ffffffffc0204ad4:	9782                	jalr	a5
ffffffffc0204ad6:	842a                	mv	s0,a0
ffffffffc0204ad8:	f55d                	bnez	a0,ffffffffc0204a86 <schedule+0x4e>
ffffffffc0204ada:	00015417          	auipc	s0,0x15
ffffffffc0204ade:	a2643403          	ld	s0,-1498(s0) # ffffffffc0219500 <idleproc>
ffffffffc0204ae2:	bf4d                	j	ffffffffc0204a94 <schedule+0x5c>
ffffffffc0204ae4:	7402                	ld	s0,32(sp)
ffffffffc0204ae6:	70a2                	ld	ra,40(sp)
ffffffffc0204ae8:	64e2                	ld	s1,24(sp)
ffffffffc0204aea:	6942                	ld	s2,16(sp)
ffffffffc0204aec:	69a2                	ld	s3,8(sp)
ffffffffc0204aee:	6a02                	ld	s4,0(sp)
ffffffffc0204af0:	6145                	addi	sp,sp,48
ffffffffc0204af2:	b41fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204af6:	b43fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204afa:	4a05                	li	s4,1
ffffffffc0204afc:	bf91                	j	ffffffffc0204a50 <schedule+0x18>

ffffffffc0204afe <add_timer>:
ffffffffc0204afe:	1141                	addi	sp,sp,-16
ffffffffc0204b00:	e022                	sd	s0,0(sp)
ffffffffc0204b02:	e406                	sd	ra,8(sp)
ffffffffc0204b04:	842a                	mv	s0,a0
ffffffffc0204b06:	100027f3          	csrr	a5,sstatus
ffffffffc0204b0a:	8b89                	andi	a5,a5,2
ffffffffc0204b0c:	4501                	li	a0,0
ffffffffc0204b0e:	eba5                	bnez	a5,ffffffffc0204b7e <add_timer+0x80>
ffffffffc0204b10:	401c                	lw	a5,0(s0)
ffffffffc0204b12:	cbb5                	beqz	a5,ffffffffc0204b86 <add_timer+0x88>
ffffffffc0204b14:	6418                	ld	a4,8(s0)
ffffffffc0204b16:	cb25                	beqz	a4,ffffffffc0204b86 <add_timer+0x88>
ffffffffc0204b18:	6c18                	ld	a4,24(s0)
ffffffffc0204b1a:	01040593          	addi	a1,s0,16
ffffffffc0204b1e:	08e59463          	bne	a1,a4,ffffffffc0204ba6 <add_timer+0xa8>
ffffffffc0204b22:	00015617          	auipc	a2,0x15
ffffffffc0204b26:	98e60613          	addi	a2,a2,-1650 # ffffffffc02194b0 <timer_list>
ffffffffc0204b2a:	6618                	ld	a4,8(a2)
ffffffffc0204b2c:	00c71863          	bne	a4,a2,ffffffffc0204b3c <add_timer+0x3e>
ffffffffc0204b30:	a80d                	j	ffffffffc0204b62 <add_timer+0x64>
ffffffffc0204b32:	6718                	ld	a4,8(a4)
ffffffffc0204b34:	9f95                	subw	a5,a5,a3
ffffffffc0204b36:	c01c                	sw	a5,0(s0)
ffffffffc0204b38:	02c70563          	beq	a4,a2,ffffffffc0204b62 <add_timer+0x64>
ffffffffc0204b3c:	ff072683          	lw	a3,-16(a4)
ffffffffc0204b40:	fed7f9e3          	bgeu	a5,a3,ffffffffc0204b32 <add_timer+0x34>
ffffffffc0204b44:	40f687bb          	subw	a5,a3,a5
ffffffffc0204b48:	fef72823          	sw	a5,-16(a4)
ffffffffc0204b4c:	631c                	ld	a5,0(a4)
ffffffffc0204b4e:	e30c                	sd	a1,0(a4)
ffffffffc0204b50:	e78c                	sd	a1,8(a5)
ffffffffc0204b52:	ec18                	sd	a4,24(s0)
ffffffffc0204b54:	e81c                	sd	a5,16(s0)
ffffffffc0204b56:	c105                	beqz	a0,ffffffffc0204b76 <add_timer+0x78>
ffffffffc0204b58:	6402                	ld	s0,0(sp)
ffffffffc0204b5a:	60a2                	ld	ra,8(sp)
ffffffffc0204b5c:	0141                	addi	sp,sp,16
ffffffffc0204b5e:	ad5fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204b62:	00015717          	auipc	a4,0x15
ffffffffc0204b66:	94e70713          	addi	a4,a4,-1714 # ffffffffc02194b0 <timer_list>
ffffffffc0204b6a:	631c                	ld	a5,0(a4)
ffffffffc0204b6c:	e30c                	sd	a1,0(a4)
ffffffffc0204b6e:	e78c                	sd	a1,8(a5)
ffffffffc0204b70:	ec18                	sd	a4,24(s0)
ffffffffc0204b72:	e81c                	sd	a5,16(s0)
ffffffffc0204b74:	f175                	bnez	a0,ffffffffc0204b58 <add_timer+0x5a>
ffffffffc0204b76:	60a2                	ld	ra,8(sp)
ffffffffc0204b78:	6402                	ld	s0,0(sp)
ffffffffc0204b7a:	0141                	addi	sp,sp,16
ffffffffc0204b7c:	8082                	ret
ffffffffc0204b7e:	abbfb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204b82:	4505                	li	a0,1
ffffffffc0204b84:	b771                	j	ffffffffc0204b10 <add_timer+0x12>
ffffffffc0204b86:	00005697          	auipc	a3,0x5
ffffffffc0204b8a:	d4268693          	addi	a3,a3,-702 # ffffffffc02098c8 <default_pmm_manager+0x708>
ffffffffc0204b8e:	00004617          	auipc	a2,0x4
ffffffffc0204b92:	a1260613          	addi	a2,a2,-1518 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204b96:	06c00593          	li	a1,108
ffffffffc0204b9a:	00005517          	auipc	a0,0x5
ffffffffc0204b9e:	cf650513          	addi	a0,a0,-778 # ffffffffc0209890 <default_pmm_manager+0x6d0>
ffffffffc0204ba2:	e66fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204ba6:	00005697          	auipc	a3,0x5
ffffffffc0204baa:	d5268693          	addi	a3,a3,-686 # ffffffffc02098f8 <default_pmm_manager+0x738>
ffffffffc0204bae:	00004617          	auipc	a2,0x4
ffffffffc0204bb2:	9f260613          	addi	a2,a2,-1550 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204bb6:	06d00593          	li	a1,109
ffffffffc0204bba:	00005517          	auipc	a0,0x5
ffffffffc0204bbe:	cd650513          	addi	a0,a0,-810 # ffffffffc0209890 <default_pmm_manager+0x6d0>
ffffffffc0204bc2:	e46fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204bc6 <del_timer>:
ffffffffc0204bc6:	1101                	addi	sp,sp,-32
ffffffffc0204bc8:	e822                	sd	s0,16(sp)
ffffffffc0204bca:	ec06                	sd	ra,24(sp)
ffffffffc0204bcc:	e426                	sd	s1,8(sp)
ffffffffc0204bce:	842a                	mv	s0,a0
ffffffffc0204bd0:	100027f3          	csrr	a5,sstatus
ffffffffc0204bd4:	8b89                	andi	a5,a5,2
ffffffffc0204bd6:	01050493          	addi	s1,a0,16
ffffffffc0204bda:	eb9d                	bnez	a5,ffffffffc0204c10 <del_timer+0x4a>
ffffffffc0204bdc:	6d1c                	ld	a5,24(a0)
ffffffffc0204bde:	02978463          	beq	a5,s1,ffffffffc0204c06 <del_timer+0x40>
ffffffffc0204be2:	4114                	lw	a3,0(a0)
ffffffffc0204be4:	6918                	ld	a4,16(a0)
ffffffffc0204be6:	ce81                	beqz	a3,ffffffffc0204bfe <del_timer+0x38>
ffffffffc0204be8:	00015617          	auipc	a2,0x15
ffffffffc0204bec:	8c860613          	addi	a2,a2,-1848 # ffffffffc02194b0 <timer_list>
ffffffffc0204bf0:	00c78763          	beq	a5,a2,ffffffffc0204bfe <del_timer+0x38>
ffffffffc0204bf4:	ff07a603          	lw	a2,-16(a5)
ffffffffc0204bf8:	9eb1                	addw	a3,a3,a2
ffffffffc0204bfa:	fed7a823          	sw	a3,-16(a5)
ffffffffc0204bfe:	e71c                	sd	a5,8(a4)
ffffffffc0204c00:	e398                	sd	a4,0(a5)
ffffffffc0204c02:	ec04                	sd	s1,24(s0)
ffffffffc0204c04:	e804                	sd	s1,16(s0)
ffffffffc0204c06:	60e2                	ld	ra,24(sp)
ffffffffc0204c08:	6442                	ld	s0,16(sp)
ffffffffc0204c0a:	64a2                	ld	s1,8(sp)
ffffffffc0204c0c:	6105                	addi	sp,sp,32
ffffffffc0204c0e:	8082                	ret
ffffffffc0204c10:	a29fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204c14:	6c1c                	ld	a5,24(s0)
ffffffffc0204c16:	02978463          	beq	a5,s1,ffffffffc0204c3e <del_timer+0x78>
ffffffffc0204c1a:	4014                	lw	a3,0(s0)
ffffffffc0204c1c:	6818                	ld	a4,16(s0)
ffffffffc0204c1e:	ce81                	beqz	a3,ffffffffc0204c36 <del_timer+0x70>
ffffffffc0204c20:	00015617          	auipc	a2,0x15
ffffffffc0204c24:	89060613          	addi	a2,a2,-1904 # ffffffffc02194b0 <timer_list>
ffffffffc0204c28:	00c78763          	beq	a5,a2,ffffffffc0204c36 <del_timer+0x70>
ffffffffc0204c2c:	ff07a603          	lw	a2,-16(a5)
ffffffffc0204c30:	9eb1                	addw	a3,a3,a2
ffffffffc0204c32:	fed7a823          	sw	a3,-16(a5)
ffffffffc0204c36:	e71c                	sd	a5,8(a4)
ffffffffc0204c38:	e398                	sd	a4,0(a5)
ffffffffc0204c3a:	ec04                	sd	s1,24(s0)
ffffffffc0204c3c:	e804                	sd	s1,16(s0)
ffffffffc0204c3e:	6442                	ld	s0,16(sp)
ffffffffc0204c40:	60e2                	ld	ra,24(sp)
ffffffffc0204c42:	64a2                	ld	s1,8(sp)
ffffffffc0204c44:	6105                	addi	sp,sp,32
ffffffffc0204c46:	9edfb06f          	j	ffffffffc0200632 <intr_enable>

ffffffffc0204c4a <run_timer_list>:
ffffffffc0204c4a:	7139                	addi	sp,sp,-64
ffffffffc0204c4c:	fc06                	sd	ra,56(sp)
ffffffffc0204c4e:	f822                	sd	s0,48(sp)
ffffffffc0204c50:	f426                	sd	s1,40(sp)
ffffffffc0204c52:	f04a                	sd	s2,32(sp)
ffffffffc0204c54:	ec4e                	sd	s3,24(sp)
ffffffffc0204c56:	e852                	sd	s4,16(sp)
ffffffffc0204c58:	e456                	sd	s5,8(sp)
ffffffffc0204c5a:	e05a                	sd	s6,0(sp)
ffffffffc0204c5c:	100027f3          	csrr	a5,sstatus
ffffffffc0204c60:	8b89                	andi	a5,a5,2
ffffffffc0204c62:	4b01                	li	s6,0
ffffffffc0204c64:	eff9                	bnez	a5,ffffffffc0204d42 <run_timer_list+0xf8>
ffffffffc0204c66:	00015997          	auipc	s3,0x15
ffffffffc0204c6a:	84a98993          	addi	s3,s3,-1974 # ffffffffc02194b0 <timer_list>
ffffffffc0204c6e:	0089b403          	ld	s0,8(s3)
ffffffffc0204c72:	07340a63          	beq	s0,s3,ffffffffc0204ce6 <run_timer_list+0x9c>
ffffffffc0204c76:	ff042783          	lw	a5,-16(s0)
ffffffffc0204c7a:	ff040913          	addi	s2,s0,-16
ffffffffc0204c7e:	0e078663          	beqz	a5,ffffffffc0204d6a <run_timer_list+0x120>
ffffffffc0204c82:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204c86:	fee42823          	sw	a4,-16(s0)
ffffffffc0204c8a:	ef31                	bnez	a4,ffffffffc0204ce6 <run_timer_list+0x9c>
ffffffffc0204c8c:	00005a97          	auipc	s5,0x5
ffffffffc0204c90:	cd4a8a93          	addi	s5,s5,-812 # ffffffffc0209960 <default_pmm_manager+0x7a0>
ffffffffc0204c94:	00005a17          	auipc	s4,0x5
ffffffffc0204c98:	bfca0a13          	addi	s4,s4,-1028 # ffffffffc0209890 <default_pmm_manager+0x6d0>
ffffffffc0204c9c:	a005                	j	ffffffffc0204cbc <run_timer_list+0x72>
ffffffffc0204c9e:	0a07d663          	bgez	a5,ffffffffc0204d4a <run_timer_list+0x100>
ffffffffc0204ca2:	8526                	mv	a0,s1
ffffffffc0204ca4:	ce3ff0ef          	jal	ra,ffffffffc0204986 <wakeup_proc>
ffffffffc0204ca8:	854a                	mv	a0,s2
ffffffffc0204caa:	f1dff0ef          	jal	ra,ffffffffc0204bc6 <del_timer>
ffffffffc0204cae:	03340c63          	beq	s0,s3,ffffffffc0204ce6 <run_timer_list+0x9c>
ffffffffc0204cb2:	ff042783          	lw	a5,-16(s0)
ffffffffc0204cb6:	ff040913          	addi	s2,s0,-16
ffffffffc0204cba:	e795                	bnez	a5,ffffffffc0204ce6 <run_timer_list+0x9c>
ffffffffc0204cbc:	00893483          	ld	s1,8(s2)
ffffffffc0204cc0:	6400                	ld	s0,8(s0)
ffffffffc0204cc2:	0ec4a783          	lw	a5,236(s1)
ffffffffc0204cc6:	ffe1                	bnez	a5,ffffffffc0204c9e <run_timer_list+0x54>
ffffffffc0204cc8:	40d4                	lw	a3,4(s1)
ffffffffc0204cca:	8656                	mv	a2,s5
ffffffffc0204ccc:	0a300593          	li	a1,163
ffffffffc0204cd0:	8552                	mv	a0,s4
ffffffffc0204cd2:	d9efb0ef          	jal	ra,ffffffffc0200270 <__warn>
ffffffffc0204cd6:	8526                	mv	a0,s1
ffffffffc0204cd8:	cafff0ef          	jal	ra,ffffffffc0204986 <wakeup_proc>
ffffffffc0204cdc:	854a                	mv	a0,s2
ffffffffc0204cde:	ee9ff0ef          	jal	ra,ffffffffc0204bc6 <del_timer>
ffffffffc0204ce2:	fd3418e3          	bne	s0,s3,ffffffffc0204cb2 <run_timer_list+0x68>
ffffffffc0204ce6:	00015597          	auipc	a1,0x15
ffffffffc0204cea:	8125b583          	ld	a1,-2030(a1) # ffffffffc02194f8 <current>
ffffffffc0204cee:	00015797          	auipc	a5,0x15
ffffffffc0204cf2:	8127b783          	ld	a5,-2030(a5) # ffffffffc0219500 <idleproc>
ffffffffc0204cf6:	04f58363          	beq	a1,a5,ffffffffc0204d3c <run_timer_list+0xf2>
ffffffffc0204cfa:	00015797          	auipc	a5,0x15
ffffffffc0204cfe:	8267b783          	ld	a5,-2010(a5) # ffffffffc0219520 <sched_class>
ffffffffc0204d02:	779c                	ld	a5,40(a5)
ffffffffc0204d04:	00015517          	auipc	a0,0x15
ffffffffc0204d08:	81453503          	ld	a0,-2028(a0) # ffffffffc0219518 <rq>
ffffffffc0204d0c:	9782                	jalr	a5
ffffffffc0204d0e:	000b1c63          	bnez	s6,ffffffffc0204d26 <run_timer_list+0xdc>
ffffffffc0204d12:	70e2                	ld	ra,56(sp)
ffffffffc0204d14:	7442                	ld	s0,48(sp)
ffffffffc0204d16:	74a2                	ld	s1,40(sp)
ffffffffc0204d18:	7902                	ld	s2,32(sp)
ffffffffc0204d1a:	69e2                	ld	s3,24(sp)
ffffffffc0204d1c:	6a42                	ld	s4,16(sp)
ffffffffc0204d1e:	6aa2                	ld	s5,8(sp)
ffffffffc0204d20:	6b02                	ld	s6,0(sp)
ffffffffc0204d22:	6121                	addi	sp,sp,64
ffffffffc0204d24:	8082                	ret
ffffffffc0204d26:	7442                	ld	s0,48(sp)
ffffffffc0204d28:	70e2                	ld	ra,56(sp)
ffffffffc0204d2a:	74a2                	ld	s1,40(sp)
ffffffffc0204d2c:	7902                	ld	s2,32(sp)
ffffffffc0204d2e:	69e2                	ld	s3,24(sp)
ffffffffc0204d30:	6a42                	ld	s4,16(sp)
ffffffffc0204d32:	6aa2                	ld	s5,8(sp)
ffffffffc0204d34:	6b02                	ld	s6,0(sp)
ffffffffc0204d36:	6121                	addi	sp,sp,64
ffffffffc0204d38:	8fbfb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204d3c:	4785                	li	a5,1
ffffffffc0204d3e:	ed9c                	sd	a5,24(a1)
ffffffffc0204d40:	b7f9                	j	ffffffffc0204d0e <run_timer_list+0xc4>
ffffffffc0204d42:	8f7fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204d46:	4b05                	li	s6,1
ffffffffc0204d48:	bf39                	j	ffffffffc0204c66 <run_timer_list+0x1c>
ffffffffc0204d4a:	00005697          	auipc	a3,0x5
ffffffffc0204d4e:	bee68693          	addi	a3,a3,-1042 # ffffffffc0209938 <default_pmm_manager+0x778>
ffffffffc0204d52:	00004617          	auipc	a2,0x4
ffffffffc0204d56:	84e60613          	addi	a2,a2,-1970 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204d5a:	0a000593          	li	a1,160
ffffffffc0204d5e:	00005517          	auipc	a0,0x5
ffffffffc0204d62:	b3250513          	addi	a0,a0,-1230 # ffffffffc0209890 <default_pmm_manager+0x6d0>
ffffffffc0204d66:	ca2fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204d6a:	00005697          	auipc	a3,0x5
ffffffffc0204d6e:	bb668693          	addi	a3,a3,-1098 # ffffffffc0209920 <default_pmm_manager+0x760>
ffffffffc0204d72:	00004617          	auipc	a2,0x4
ffffffffc0204d76:	82e60613          	addi	a2,a2,-2002 # ffffffffc02085a0 <commands+0x410>
ffffffffc0204d7a:	09a00593          	li	a1,154
ffffffffc0204d7e:	00005517          	auipc	a0,0x5
ffffffffc0204d82:	b1250513          	addi	a0,a0,-1262 # ffffffffc0209890 <default_pmm_manager+0x6d0>
ffffffffc0204d86:	c82fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204d8a <proc_stride_comp_f>:
ffffffffc0204d8a:	4d08                	lw	a0,24(a0)
ffffffffc0204d8c:	4d9c                	lw	a5,24(a1)
ffffffffc0204d8e:	9d1d                	subw	a0,a0,a5
ffffffffc0204d90:	00a04763          	bgtz	a0,ffffffffc0204d9e <proc_stride_comp_f+0x14>
ffffffffc0204d94:	00a03533          	snez	a0,a0
ffffffffc0204d98:	40a00533          	neg	a0,a0
ffffffffc0204d9c:	8082                	ret
ffffffffc0204d9e:	4505                	li	a0,1
ffffffffc0204da0:	8082                	ret

ffffffffc0204da2 <stride_init>:
ffffffffc0204da2:	e508                	sd	a0,8(a0)
ffffffffc0204da4:	e108                	sd	a0,0(a0)
ffffffffc0204da6:	00053c23          	sd	zero,24(a0)
ffffffffc0204daa:	00052823          	sw	zero,16(a0)
ffffffffc0204dae:	8082                	ret

ffffffffc0204db0 <stride_pick_next>:
ffffffffc0204db0:	6d1c                	ld	a5,24(a0)
ffffffffc0204db2:	cf89                	beqz	a5,ffffffffc0204dcc <stride_pick_next+0x1c>
ffffffffc0204db4:	4fd0                	lw	a2,28(a5)
ffffffffc0204db6:	4f98                	lw	a4,24(a5)
ffffffffc0204db8:	ed878513          	addi	a0,a5,-296
ffffffffc0204dbc:	400006b7          	lui	a3,0x40000
ffffffffc0204dc0:	c219                	beqz	a2,ffffffffc0204dc6 <stride_pick_next+0x16>
ffffffffc0204dc2:	02c6d6bb          	divuw	a3,a3,a2
ffffffffc0204dc6:	9f35                	addw	a4,a4,a3
ffffffffc0204dc8:	cf98                	sw	a4,24(a5)
ffffffffc0204dca:	8082                	ret
ffffffffc0204dcc:	4501                	li	a0,0
ffffffffc0204dce:	8082                	ret

ffffffffc0204dd0 <stride_proc_tick>:
ffffffffc0204dd0:	1205a783          	lw	a5,288(a1)
ffffffffc0204dd4:	00f05563          	blez	a5,ffffffffc0204dde <stride_proc_tick+0xe>
ffffffffc0204dd8:	37fd                	addiw	a5,a5,-1
ffffffffc0204dda:	12f5a023          	sw	a5,288(a1)
ffffffffc0204dde:	e399                	bnez	a5,ffffffffc0204de4 <stride_proc_tick+0x14>
ffffffffc0204de0:	4785                	li	a5,1
ffffffffc0204de2:	ed9c                	sd	a5,24(a1)
ffffffffc0204de4:	8082                	ret

ffffffffc0204de6 <skew_heap_merge.constprop.0>:
ffffffffc0204de6:	1101                	addi	sp,sp,-32
ffffffffc0204de8:	e822                	sd	s0,16(sp)
ffffffffc0204dea:	ec06                	sd	ra,24(sp)
ffffffffc0204dec:	e426                	sd	s1,8(sp)
ffffffffc0204dee:	e04a                	sd	s2,0(sp)
ffffffffc0204df0:	842e                	mv	s0,a1
ffffffffc0204df2:	c11d                	beqz	a0,ffffffffc0204e18 <skew_heap_merge.constprop.0+0x32>
ffffffffc0204df4:	84aa                	mv	s1,a0
ffffffffc0204df6:	c1b9                	beqz	a1,ffffffffc0204e3c <skew_heap_merge.constprop.0+0x56>
ffffffffc0204df8:	f93ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0204dfc:	57fd                	li	a5,-1
ffffffffc0204dfe:	02f50463          	beq	a0,a5,ffffffffc0204e26 <skew_heap_merge.constprop.0+0x40>
ffffffffc0204e02:	680c                	ld	a1,16(s0)
ffffffffc0204e04:	00843903          	ld	s2,8(s0)
ffffffffc0204e08:	8526                	mv	a0,s1
ffffffffc0204e0a:	fddff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0204e0e:	e408                	sd	a0,8(s0)
ffffffffc0204e10:	01243823          	sd	s2,16(s0)
ffffffffc0204e14:	c111                	beqz	a0,ffffffffc0204e18 <skew_heap_merge.constprop.0+0x32>
ffffffffc0204e16:	e100                	sd	s0,0(a0)
ffffffffc0204e18:	60e2                	ld	ra,24(sp)
ffffffffc0204e1a:	8522                	mv	a0,s0
ffffffffc0204e1c:	6442                	ld	s0,16(sp)
ffffffffc0204e1e:	64a2                	ld	s1,8(sp)
ffffffffc0204e20:	6902                	ld	s2,0(sp)
ffffffffc0204e22:	6105                	addi	sp,sp,32
ffffffffc0204e24:	8082                	ret
ffffffffc0204e26:	6888                	ld	a0,16(s1)
ffffffffc0204e28:	0084b903          	ld	s2,8(s1)
ffffffffc0204e2c:	85a2                	mv	a1,s0
ffffffffc0204e2e:	fb9ff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0204e32:	e488                	sd	a0,8(s1)
ffffffffc0204e34:	0124b823          	sd	s2,16(s1)
ffffffffc0204e38:	c111                	beqz	a0,ffffffffc0204e3c <skew_heap_merge.constprop.0+0x56>
ffffffffc0204e3a:	e104                	sd	s1,0(a0)
ffffffffc0204e3c:	60e2                	ld	ra,24(sp)
ffffffffc0204e3e:	6442                	ld	s0,16(sp)
ffffffffc0204e40:	6902                	ld	s2,0(sp)
ffffffffc0204e42:	8526                	mv	a0,s1
ffffffffc0204e44:	64a2                	ld	s1,8(sp)
ffffffffc0204e46:	6105                	addi	sp,sp,32
ffffffffc0204e48:	8082                	ret

ffffffffc0204e4a <stride_enqueue>:
ffffffffc0204e4a:	7119                	addi	sp,sp,-128
ffffffffc0204e4c:	f4a6                	sd	s1,104(sp)
ffffffffc0204e4e:	6d04                	ld	s1,24(a0)
ffffffffc0204e50:	f8a2                	sd	s0,112(sp)
ffffffffc0204e52:	f0ca                	sd	s2,96(sp)
ffffffffc0204e54:	e8d2                	sd	s4,80(sp)
ffffffffc0204e56:	fc86                	sd	ra,120(sp)
ffffffffc0204e58:	ecce                	sd	s3,88(sp)
ffffffffc0204e5a:	e4d6                	sd	s5,72(sp)
ffffffffc0204e5c:	e0da                	sd	s6,64(sp)
ffffffffc0204e5e:	fc5e                	sd	s7,56(sp)
ffffffffc0204e60:	f862                	sd	s8,48(sp)
ffffffffc0204e62:	f466                	sd	s9,40(sp)
ffffffffc0204e64:	f06a                	sd	s10,32(sp)
ffffffffc0204e66:	ec6e                	sd	s11,24(sp)
ffffffffc0204e68:	1205b423          	sd	zero,296(a1)
ffffffffc0204e6c:	1205bc23          	sd	zero,312(a1)
ffffffffc0204e70:	1205b823          	sd	zero,304(a1)
ffffffffc0204e74:	8a2a                	mv	s4,a0
ffffffffc0204e76:	842e                	mv	s0,a1
ffffffffc0204e78:	12858913          	addi	s2,a1,296
ffffffffc0204e7c:	cc89                	beqz	s1,ffffffffc0204e96 <stride_enqueue+0x4c>
ffffffffc0204e7e:	85ca                	mv	a1,s2
ffffffffc0204e80:	8526                	mv	a0,s1
ffffffffc0204e82:	f09ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0204e86:	57fd                	li	a5,-1
ffffffffc0204e88:	89aa                	mv	s3,a0
ffffffffc0204e8a:	04f50763          	beq	a0,a5,ffffffffc0204ed8 <stride_enqueue+0x8e>
ffffffffc0204e8e:	12943823          	sd	s1,304(s0)
ffffffffc0204e92:	0124b023          	sd	s2,0(s1)
ffffffffc0204e96:	12042783          	lw	a5,288(s0)
ffffffffc0204e9a:	012a3c23          	sd	s2,24(s4)
ffffffffc0204e9e:	014a2703          	lw	a4,20(s4)
ffffffffc0204ea2:	c399                	beqz	a5,ffffffffc0204ea8 <stride_enqueue+0x5e>
ffffffffc0204ea4:	00f75463          	bge	a4,a5,ffffffffc0204eac <stride_enqueue+0x62>
ffffffffc0204ea8:	12e42023          	sw	a4,288(s0)
ffffffffc0204eac:	010a2783          	lw	a5,16(s4)
ffffffffc0204eb0:	70e6                	ld	ra,120(sp)
ffffffffc0204eb2:	11443423          	sd	s4,264(s0)
ffffffffc0204eb6:	7446                	ld	s0,112(sp)
ffffffffc0204eb8:	2785                	addiw	a5,a5,1
ffffffffc0204eba:	00fa2823          	sw	a5,16(s4)
ffffffffc0204ebe:	74a6                	ld	s1,104(sp)
ffffffffc0204ec0:	7906                	ld	s2,96(sp)
ffffffffc0204ec2:	69e6                	ld	s3,88(sp)
ffffffffc0204ec4:	6a46                	ld	s4,80(sp)
ffffffffc0204ec6:	6aa6                	ld	s5,72(sp)
ffffffffc0204ec8:	6b06                	ld	s6,64(sp)
ffffffffc0204eca:	7be2                	ld	s7,56(sp)
ffffffffc0204ecc:	7c42                	ld	s8,48(sp)
ffffffffc0204ece:	7ca2                	ld	s9,40(sp)
ffffffffc0204ed0:	7d02                	ld	s10,32(sp)
ffffffffc0204ed2:	6de2                	ld	s11,24(sp)
ffffffffc0204ed4:	6109                	addi	sp,sp,128
ffffffffc0204ed6:	8082                	ret
ffffffffc0204ed8:	0104ba83          	ld	s5,16(s1)
ffffffffc0204edc:	0084bb83          	ld	s7,8(s1)
ffffffffc0204ee0:	000a8d63          	beqz	s5,ffffffffc0204efa <stride_enqueue+0xb0>
ffffffffc0204ee4:	85ca                	mv	a1,s2
ffffffffc0204ee6:	8556                	mv	a0,s5
ffffffffc0204ee8:	ea3ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0204eec:	8b2a                	mv	s6,a0
ffffffffc0204eee:	01350e63          	beq	a0,s3,ffffffffc0204f0a <stride_enqueue+0xc0>
ffffffffc0204ef2:	13543823          	sd	s5,304(s0)
ffffffffc0204ef6:	012ab023          	sd	s2,0(s5)
ffffffffc0204efa:	0124b423          	sd	s2,8(s1)
ffffffffc0204efe:	0174b823          	sd	s7,16(s1)
ffffffffc0204f02:	00993023          	sd	s1,0(s2)
ffffffffc0204f06:	8926                	mv	s2,s1
ffffffffc0204f08:	b779                	j	ffffffffc0204e96 <stride_enqueue+0x4c>
ffffffffc0204f0a:	010ab983          	ld	s3,16(s5)
ffffffffc0204f0e:	008abc83          	ld	s9,8(s5)
ffffffffc0204f12:	00098d63          	beqz	s3,ffffffffc0204f2c <stride_enqueue+0xe2>
ffffffffc0204f16:	85ca                	mv	a1,s2
ffffffffc0204f18:	854e                	mv	a0,s3
ffffffffc0204f1a:	e71ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0204f1e:	8c2a                	mv	s8,a0
ffffffffc0204f20:	01650e63          	beq	a0,s6,ffffffffc0204f3c <stride_enqueue+0xf2>
ffffffffc0204f24:	13343823          	sd	s3,304(s0)
ffffffffc0204f28:	0129b023          	sd	s2,0(s3)
ffffffffc0204f2c:	012ab423          	sd	s2,8(s5)
ffffffffc0204f30:	019ab823          	sd	s9,16(s5)
ffffffffc0204f34:	01593023          	sd	s5,0(s2)
ffffffffc0204f38:	8956                	mv	s2,s5
ffffffffc0204f3a:	b7c1                	j	ffffffffc0204efa <stride_enqueue+0xb0>
ffffffffc0204f3c:	0109bb03          	ld	s6,16(s3)
ffffffffc0204f40:	0089bd83          	ld	s11,8(s3)
ffffffffc0204f44:	000b0d63          	beqz	s6,ffffffffc0204f5e <stride_enqueue+0x114>
ffffffffc0204f48:	85ca                	mv	a1,s2
ffffffffc0204f4a:	855a                	mv	a0,s6
ffffffffc0204f4c:	e3fff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0204f50:	8d2a                	mv	s10,a0
ffffffffc0204f52:	01850e63          	beq	a0,s8,ffffffffc0204f6e <stride_enqueue+0x124>
ffffffffc0204f56:	13643823          	sd	s6,304(s0)
ffffffffc0204f5a:	012b3023          	sd	s2,0(s6)
ffffffffc0204f5e:	0129b423          	sd	s2,8(s3)
ffffffffc0204f62:	01b9b823          	sd	s11,16(s3)
ffffffffc0204f66:	01393023          	sd	s3,0(s2)
ffffffffc0204f6a:	894e                	mv	s2,s3
ffffffffc0204f6c:	b7c1                	j	ffffffffc0204f2c <stride_enqueue+0xe2>
ffffffffc0204f6e:	008b3783          	ld	a5,8(s6)
ffffffffc0204f72:	010b3c03          	ld	s8,16(s6)
ffffffffc0204f76:	e43e                	sd	a5,8(sp)
ffffffffc0204f78:	000c0c63          	beqz	s8,ffffffffc0204f90 <stride_enqueue+0x146>
ffffffffc0204f7c:	85ca                	mv	a1,s2
ffffffffc0204f7e:	8562                	mv	a0,s8
ffffffffc0204f80:	e0bff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0204f84:	01a50f63          	beq	a0,s10,ffffffffc0204fa2 <stride_enqueue+0x158>
ffffffffc0204f88:	13843823          	sd	s8,304(s0)
ffffffffc0204f8c:	012c3023          	sd	s2,0(s8)
ffffffffc0204f90:	67a2                	ld	a5,8(sp)
ffffffffc0204f92:	012b3423          	sd	s2,8(s6)
ffffffffc0204f96:	00fb3823          	sd	a5,16(s6)
ffffffffc0204f9a:	01693023          	sd	s6,0(s2)
ffffffffc0204f9e:	895a                	mv	s2,s6
ffffffffc0204fa0:	bf7d                	j	ffffffffc0204f5e <stride_enqueue+0x114>
ffffffffc0204fa2:	010c3503          	ld	a0,16(s8)
ffffffffc0204fa6:	008c3d03          	ld	s10,8(s8)
ffffffffc0204faa:	85ca                	mv	a1,s2
ffffffffc0204fac:	e3bff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0204fb0:	00ac3423          	sd	a0,8(s8)
ffffffffc0204fb4:	01ac3823          	sd	s10,16(s8)
ffffffffc0204fb8:	c509                	beqz	a0,ffffffffc0204fc2 <stride_enqueue+0x178>
ffffffffc0204fba:	01853023          	sd	s8,0(a0)
ffffffffc0204fbe:	8962                	mv	s2,s8
ffffffffc0204fc0:	bfc1                	j	ffffffffc0204f90 <stride_enqueue+0x146>
ffffffffc0204fc2:	8962                	mv	s2,s8
ffffffffc0204fc4:	b7f1                	j	ffffffffc0204f90 <stride_enqueue+0x146>

ffffffffc0204fc6 <stride_dequeue>:
ffffffffc0204fc6:	1085b783          	ld	a5,264(a1)
ffffffffc0204fca:	7171                	addi	sp,sp,-176
ffffffffc0204fcc:	f506                	sd	ra,168(sp)
ffffffffc0204fce:	f122                	sd	s0,160(sp)
ffffffffc0204fd0:	ed26                	sd	s1,152(sp)
ffffffffc0204fd2:	e94a                	sd	s2,144(sp)
ffffffffc0204fd4:	e54e                	sd	s3,136(sp)
ffffffffc0204fd6:	e152                	sd	s4,128(sp)
ffffffffc0204fd8:	fcd6                	sd	s5,120(sp)
ffffffffc0204fda:	f8da                	sd	s6,112(sp)
ffffffffc0204fdc:	f4de                	sd	s7,104(sp)
ffffffffc0204fde:	f0e2                	sd	s8,96(sp)
ffffffffc0204fe0:	ece6                	sd	s9,88(sp)
ffffffffc0204fe2:	e8ea                	sd	s10,80(sp)
ffffffffc0204fe4:	e4ee                	sd	s11,72(sp)
ffffffffc0204fe6:	00a78463          	beq	a5,a0,ffffffffc0204fee <stride_dequeue+0x28>
ffffffffc0204fea:	7870106f          	j	ffffffffc0206f70 <stride_dequeue+0x1faa>
ffffffffc0204fee:	01052983          	lw	s3,16(a0)
ffffffffc0204ff2:	8c2a                	mv	s8,a0
ffffffffc0204ff4:	8b4e                	mv	s6,s3
ffffffffc0204ff6:	00099463          	bnez	s3,ffffffffc0204ffe <stride_dequeue+0x38>
ffffffffc0204ffa:	7770106f          	j	ffffffffc0206f70 <stride_dequeue+0x1faa>
ffffffffc0204ffe:	1305b903          	ld	s2,304(a1)
ffffffffc0205002:	01853a83          	ld	s5,24(a0)
ffffffffc0205006:	1285bd03          	ld	s10,296(a1)
ffffffffc020500a:	1385b483          	ld	s1,312(a1)
ffffffffc020500e:	842e                	mv	s0,a1
ffffffffc0205010:	2e090263          	beqz	s2,ffffffffc02052f4 <stride_dequeue+0x32e>
ffffffffc0205014:	42048263          	beqz	s1,ffffffffc0205438 <stride_dequeue+0x472>
ffffffffc0205018:	85a6                	mv	a1,s1
ffffffffc020501a:	854a                	mv	a0,s2
ffffffffc020501c:	d6fff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205020:	5cfd                	li	s9,-1
ffffffffc0205022:	8a2a                	mv	s4,a0
ffffffffc0205024:	19950163          	beq	a0,s9,ffffffffc02051a6 <stride_dequeue+0x1e0>
ffffffffc0205028:	0104ba03          	ld	s4,16(s1)
ffffffffc020502c:	0084bb83          	ld	s7,8(s1)
ffffffffc0205030:	120a0563          	beqz	s4,ffffffffc020515a <stride_dequeue+0x194>
ffffffffc0205034:	85d2                	mv	a1,s4
ffffffffc0205036:	854a                	mv	a0,s2
ffffffffc0205038:	d53ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020503c:	2d950563          	beq	a0,s9,ffffffffc0205306 <stride_dequeue+0x340>
ffffffffc0205040:	008a3783          	ld	a5,8(s4)
ffffffffc0205044:	010a3d83          	ld	s11,16(s4)
ffffffffc0205048:	e03e                	sd	a5,0(sp)
ffffffffc020504a:	100d8063          	beqz	s11,ffffffffc020514a <stride_dequeue+0x184>
ffffffffc020504e:	85ee                	mv	a1,s11
ffffffffc0205050:	854a                	mv	a0,s2
ffffffffc0205052:	d39ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205056:	7f950563          	beq	a0,s9,ffffffffc0205840 <stride_dequeue+0x87a>
ffffffffc020505a:	008db783          	ld	a5,8(s11)
ffffffffc020505e:	010dbc83          	ld	s9,16(s11)
ffffffffc0205062:	e43e                	sd	a5,8(sp)
ffffffffc0205064:	0c0c8b63          	beqz	s9,ffffffffc020513a <stride_dequeue+0x174>
ffffffffc0205068:	85e6                	mv	a1,s9
ffffffffc020506a:	854a                	mv	a0,s2
ffffffffc020506c:	d1fff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205070:	58fd                	li	a7,-1
ffffffffc0205072:	71150063          	beq	a0,a7,ffffffffc0205772 <stride_dequeue+0x7ac>
ffffffffc0205076:	008cb783          	ld	a5,8(s9)
ffffffffc020507a:	010cb803          	ld	a6,16(s9)
ffffffffc020507e:	e83e                	sd	a5,16(sp)
ffffffffc0205080:	0a080563          	beqz	a6,ffffffffc020512a <stride_dequeue+0x164>
ffffffffc0205084:	85c2                	mv	a1,a6
ffffffffc0205086:	854a                	mv	a0,s2
ffffffffc0205088:	ec42                	sd	a6,24(sp)
ffffffffc020508a:	d01ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020508e:	58fd                	li	a7,-1
ffffffffc0205090:	6862                	ld	a6,24(sp)
ffffffffc0205092:	41150be3          	beq	a0,a7,ffffffffc0205ca8 <stride_dequeue+0xce2>
ffffffffc0205096:	00883703          	ld	a4,8(a6) # fffffffffff80008 <end+0x3fd66950>
ffffffffc020509a:	01083783          	ld	a5,16(a6)
ffffffffc020509e:	ec3a                	sd	a4,24(sp)
ffffffffc02050a0:	cfad                	beqz	a5,ffffffffc020511a <stride_dequeue+0x154>
ffffffffc02050a2:	85be                	mv	a1,a5
ffffffffc02050a4:	854a                	mv	a0,s2
ffffffffc02050a6:	f442                	sd	a6,40(sp)
ffffffffc02050a8:	f03e                	sd	a5,32(sp)
ffffffffc02050aa:	ce1ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02050ae:	58fd                	li	a7,-1
ffffffffc02050b0:	7782                	ld	a5,32(sp)
ffffffffc02050b2:	7822                	ld	a6,40(sp)
ffffffffc02050b4:	01151463          	bne	a0,a7,ffffffffc02050bc <stride_dequeue+0xf6>
ffffffffc02050b8:	17a0106f          	j	ffffffffc0206232 <stride_dequeue+0x126c>
ffffffffc02050bc:	6798                	ld	a4,8(a5)
ffffffffc02050be:	0107bb03          	ld	s6,16(a5)
ffffffffc02050c2:	f03a                	sd	a4,32(sp)
ffffffffc02050c4:	040b0463          	beqz	s6,ffffffffc020510c <stride_dequeue+0x146>
ffffffffc02050c8:	85da                	mv	a1,s6
ffffffffc02050ca:	854a                	mv	a0,s2
ffffffffc02050cc:	f83e                	sd	a5,48(sp)
ffffffffc02050ce:	f442                	sd	a6,40(sp)
ffffffffc02050d0:	cbbff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02050d4:	58fd                	li	a7,-1
ffffffffc02050d6:	7822                	ld	a6,40(sp)
ffffffffc02050d8:	77c2                	ld	a5,48(sp)
ffffffffc02050da:	01151463          	bne	a0,a7,ffffffffc02050e2 <stride_dequeue+0x11c>
ffffffffc02050de:	00d0106f          	j	ffffffffc02068ea <stride_dequeue+0x1924>
ffffffffc02050e2:	010b3583          	ld	a1,16(s6)
ffffffffc02050e6:	008b3983          	ld	s3,8(s6)
ffffffffc02050ea:	854a                	mv	a0,s2
ffffffffc02050ec:	f83e                	sd	a5,48(sp)
ffffffffc02050ee:	f442                	sd	a6,40(sp)
ffffffffc02050f0:	cf7ff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02050f4:	00ab3423          	sd	a0,8(s6)
ffffffffc02050f8:	013b3823          	sd	s3,16(s6)
ffffffffc02050fc:	7822                	ld	a6,40(sp)
ffffffffc02050fe:	77c2                	ld	a5,48(sp)
ffffffffc0205100:	010c2983          	lw	s3,16(s8)
ffffffffc0205104:	c119                	beqz	a0,ffffffffc020510a <stride_dequeue+0x144>
ffffffffc0205106:	01653023          	sd	s6,0(a0)
ffffffffc020510a:	895a                	mv	s2,s6
ffffffffc020510c:	7702                	ld	a4,32(sp)
ffffffffc020510e:	0127b423          	sd	s2,8(a5)
ffffffffc0205112:	eb98                	sd	a4,16(a5)
ffffffffc0205114:	00f93023          	sd	a5,0(s2)
ffffffffc0205118:	893e                	mv	s2,a5
ffffffffc020511a:	67e2                	ld	a5,24(sp)
ffffffffc020511c:	01283423          	sd	s2,8(a6)
ffffffffc0205120:	00f83823          	sd	a5,16(a6)
ffffffffc0205124:	01093023          	sd	a6,0(s2)
ffffffffc0205128:	8942                	mv	s2,a6
ffffffffc020512a:	67c2                	ld	a5,16(sp)
ffffffffc020512c:	012cb423          	sd	s2,8(s9)
ffffffffc0205130:	00fcb823          	sd	a5,16(s9)
ffffffffc0205134:	01993023          	sd	s9,0(s2)
ffffffffc0205138:	8966                	mv	s2,s9
ffffffffc020513a:	67a2                	ld	a5,8(sp)
ffffffffc020513c:	012db423          	sd	s2,8(s11)
ffffffffc0205140:	00fdb823          	sd	a5,16(s11)
ffffffffc0205144:	01b93023          	sd	s11,0(s2)
ffffffffc0205148:	896e                	mv	s2,s11
ffffffffc020514a:	6782                	ld	a5,0(sp)
ffffffffc020514c:	012a3423          	sd	s2,8(s4)
ffffffffc0205150:	00fa3823          	sd	a5,16(s4)
ffffffffc0205154:	01493023          	sd	s4,0(s2)
ffffffffc0205158:	8952                	mv	s2,s4
ffffffffc020515a:	0124b423          	sd	s2,8(s1)
ffffffffc020515e:	0174b823          	sd	s7,16(s1)
ffffffffc0205162:	00993023          	sd	s1,0(s2)
ffffffffc0205166:	01a4b023          	sd	s10,0(s1)
ffffffffc020516a:	180d0963          	beqz	s10,ffffffffc02052fc <stride_dequeue+0x336>
ffffffffc020516e:	008d3683          	ld	a3,8(s10)
ffffffffc0205172:	12840413          	addi	s0,s0,296
ffffffffc0205176:	18868563          	beq	a3,s0,ffffffffc0205300 <stride_dequeue+0x33a>
ffffffffc020517a:	009d3823          	sd	s1,16(s10)
ffffffffc020517e:	70aa                	ld	ra,168(sp)
ffffffffc0205180:	740a                	ld	s0,160(sp)
ffffffffc0205182:	39fd                	addiw	s3,s3,-1
ffffffffc0205184:	015c3c23          	sd	s5,24(s8)
ffffffffc0205188:	013c2823          	sw	s3,16(s8)
ffffffffc020518c:	64ea                	ld	s1,152(sp)
ffffffffc020518e:	694a                	ld	s2,144(sp)
ffffffffc0205190:	69aa                	ld	s3,136(sp)
ffffffffc0205192:	6a0a                	ld	s4,128(sp)
ffffffffc0205194:	7ae6                	ld	s5,120(sp)
ffffffffc0205196:	7b46                	ld	s6,112(sp)
ffffffffc0205198:	7ba6                	ld	s7,104(sp)
ffffffffc020519a:	7c06                	ld	s8,96(sp)
ffffffffc020519c:	6ce6                	ld	s9,88(sp)
ffffffffc020519e:	6d46                	ld	s10,80(sp)
ffffffffc02051a0:	6da6                	ld	s11,72(sp)
ffffffffc02051a2:	614d                	addi	sp,sp,176
ffffffffc02051a4:	8082                	ret
ffffffffc02051a6:	01093d83          	ld	s11,16(s2)
ffffffffc02051aa:	00893b83          	ld	s7,8(s2)
ffffffffc02051ae:	120d8963          	beqz	s11,ffffffffc02052e0 <stride_dequeue+0x31a>
ffffffffc02051b2:	85a6                	mv	a1,s1
ffffffffc02051b4:	856e                	mv	a0,s11
ffffffffc02051b6:	bd5ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02051ba:	29450363          	beq	a0,s4,ffffffffc0205440 <stride_dequeue+0x47a>
ffffffffc02051be:	649c                	ld	a5,8(s1)
ffffffffc02051c0:	0104bc83          	ld	s9,16(s1)
ffffffffc02051c4:	e03e                	sd	a5,0(sp)
ffffffffc02051c6:	100c8763          	beqz	s9,ffffffffc02052d4 <stride_dequeue+0x30e>
ffffffffc02051ca:	85e6                	mv	a1,s9
ffffffffc02051cc:	856e                	mv	a0,s11
ffffffffc02051ce:	bbdff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02051d2:	4b450263          	beq	a0,s4,ffffffffc0205676 <stride_dequeue+0x6b0>
ffffffffc02051d6:	008cb783          	ld	a5,8(s9)
ffffffffc02051da:	010cba03          	ld	s4,16(s9)
ffffffffc02051de:	e43e                	sd	a5,8(sp)
ffffffffc02051e0:	0e0a0263          	beqz	s4,ffffffffc02052c4 <stride_dequeue+0x2fe>
ffffffffc02051e4:	85d2                	mv	a1,s4
ffffffffc02051e6:	856e                	mv	a0,s11
ffffffffc02051e8:	ba3ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02051ec:	58fd                	li	a7,-1
ffffffffc02051ee:	03150fe3          	beq	a0,a7,ffffffffc0205a2c <stride_dequeue+0xa66>
ffffffffc02051f2:	008a3783          	ld	a5,8(s4)
ffffffffc02051f6:	010a3803          	ld	a6,16(s4)
ffffffffc02051fa:	e83e                	sd	a5,16(sp)
ffffffffc02051fc:	0a080c63          	beqz	a6,ffffffffc02052b4 <stride_dequeue+0x2ee>
ffffffffc0205200:	85c2                	mv	a1,a6
ffffffffc0205202:	856e                	mv	a0,s11
ffffffffc0205204:	ec42                	sd	a6,24(sp)
ffffffffc0205206:	b85ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020520a:	58fd                	li	a7,-1
ffffffffc020520c:	6862                	ld	a6,24(sp)
ffffffffc020520e:	01151463          	bne	a0,a7,ffffffffc0205216 <stride_dequeue+0x250>
ffffffffc0205212:	6e10006f          	j	ffffffffc02060f2 <stride_dequeue+0x112c>
ffffffffc0205216:	00883783          	ld	a5,8(a6)
ffffffffc020521a:	01083303          	ld	t1,16(a6)
ffffffffc020521e:	ec3e                	sd	a5,24(sp)
ffffffffc0205220:	08030263          	beqz	t1,ffffffffc02052a4 <stride_dequeue+0x2de>
ffffffffc0205224:	859a                	mv	a1,t1
ffffffffc0205226:	856e                	mv	a0,s11
ffffffffc0205228:	f442                	sd	a6,40(sp)
ffffffffc020522a:	f01a                	sd	t1,32(sp)
ffffffffc020522c:	b5fff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205230:	58fd                	li	a7,-1
ffffffffc0205232:	7302                	ld	t1,32(sp)
ffffffffc0205234:	7822                	ld	a6,40(sp)
ffffffffc0205236:	01151463          	bne	a0,a7,ffffffffc020523e <stride_dequeue+0x278>
ffffffffc020523a:	5ee0106f          	j	ffffffffc0206828 <stride_dequeue+0x1862>
ffffffffc020523e:	00833783          	ld	a5,8(t1)
ffffffffc0205242:	01033983          	ld	s3,16(t1)
ffffffffc0205246:	f03e                	sd	a5,32(sp)
ffffffffc0205248:	00099463          	bnez	s3,ffffffffc0205250 <stride_dequeue+0x28a>
ffffffffc020524c:	26f0106f          	j	ffffffffc0206cba <stride_dequeue+0x1cf4>
ffffffffc0205250:	85ce                	mv	a1,s3
ffffffffc0205252:	856e                	mv	a0,s11
ffffffffc0205254:	f842                	sd	a6,48(sp)
ffffffffc0205256:	f41a                	sd	t1,40(sp)
ffffffffc0205258:	b33ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020525c:	58fd                	li	a7,-1
ffffffffc020525e:	7322                	ld	t1,40(sp)
ffffffffc0205260:	7842                	ld	a6,48(sp)
ffffffffc0205262:	01151463          	bne	a0,a7,ffffffffc020526a <stride_dequeue+0x2a4>
ffffffffc0205266:	4d30106f          	j	ffffffffc0206f38 <stride_dequeue+0x1f72>
ffffffffc020526a:	0109b583          	ld	a1,16(s3)
ffffffffc020526e:	0089bb03          	ld	s6,8(s3)
ffffffffc0205272:	856e                	mv	a0,s11
ffffffffc0205274:	f842                	sd	a6,48(sp)
ffffffffc0205276:	f41a                	sd	t1,40(sp)
ffffffffc0205278:	b6fff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020527c:	00a9b423          	sd	a0,8(s3)
ffffffffc0205280:	0169b823          	sd	s6,16(s3)
ffffffffc0205284:	7322                	ld	t1,40(sp)
ffffffffc0205286:	7842                	ld	a6,48(sp)
ffffffffc0205288:	010c2b03          	lw	s6,16(s8)
ffffffffc020528c:	c119                	beqz	a0,ffffffffc0205292 <stride_dequeue+0x2cc>
ffffffffc020528e:	01353023          	sd	s3,0(a0)
ffffffffc0205292:	7782                	ld	a5,32(sp)
ffffffffc0205294:	01333423          	sd	s3,8(t1)
ffffffffc0205298:	8d9a                	mv	s11,t1
ffffffffc020529a:	00f33823          	sd	a5,16(t1)
ffffffffc020529e:	0069b023          	sd	t1,0(s3)
ffffffffc02052a2:	89da                	mv	s3,s6
ffffffffc02052a4:	67e2                	ld	a5,24(sp)
ffffffffc02052a6:	01b83423          	sd	s11,8(a6)
ffffffffc02052aa:	00f83823          	sd	a5,16(a6)
ffffffffc02052ae:	010db023          	sd	a6,0(s11)
ffffffffc02052b2:	8dc2                	mv	s11,a6
ffffffffc02052b4:	67c2                	ld	a5,16(sp)
ffffffffc02052b6:	01ba3423          	sd	s11,8(s4)
ffffffffc02052ba:	00fa3823          	sd	a5,16(s4)
ffffffffc02052be:	014db023          	sd	s4,0(s11)
ffffffffc02052c2:	8dd2                	mv	s11,s4
ffffffffc02052c4:	67a2                	ld	a5,8(sp)
ffffffffc02052c6:	01bcb423          	sd	s11,8(s9)
ffffffffc02052ca:	00fcb823          	sd	a5,16(s9)
ffffffffc02052ce:	019db023          	sd	s9,0(s11)
ffffffffc02052d2:	8de6                	mv	s11,s9
ffffffffc02052d4:	6782                	ld	a5,0(sp)
ffffffffc02052d6:	01b4b423          	sd	s11,8(s1)
ffffffffc02052da:	e89c                	sd	a5,16(s1)
ffffffffc02052dc:	009db023          	sd	s1,0(s11)
ffffffffc02052e0:	00993423          	sd	s1,8(s2)
ffffffffc02052e4:	01793823          	sd	s7,16(s2)
ffffffffc02052e8:	0124b023          	sd	s2,0(s1)
ffffffffc02052ec:	84ca                	mv	s1,s2
ffffffffc02052ee:	01a4b023          	sd	s10,0(s1)
ffffffffc02052f2:	bda5                	j	ffffffffc020516a <stride_dequeue+0x1a4>
ffffffffc02052f4:	e60499e3          	bnez	s1,ffffffffc0205166 <stride_dequeue+0x1a0>
ffffffffc02052f8:	e60d1be3          	bnez	s10,ffffffffc020516e <stride_dequeue+0x1a8>
ffffffffc02052fc:	8aa6                	mv	s5,s1
ffffffffc02052fe:	b541                	j	ffffffffc020517e <stride_dequeue+0x1b8>
ffffffffc0205300:	009d3423          	sd	s1,8(s10)
ffffffffc0205304:	bdad                	j	ffffffffc020517e <stride_dequeue+0x1b8>
ffffffffc0205306:	01093d83          	ld	s11,16(s2)
ffffffffc020530a:	e02a                	sd	a0,0(sp)
ffffffffc020530c:	00893c83          	ld	s9,8(s2)
ffffffffc0205310:	100d8d63          	beqz	s11,ffffffffc020542a <stride_dequeue+0x464>
ffffffffc0205314:	85d2                	mv	a1,s4
ffffffffc0205316:	856e                	mv	a0,s11
ffffffffc0205318:	a73ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020531c:	6782                	ld	a5,0(sp)
ffffffffc020531e:	24f50563          	beq	a0,a5,ffffffffc0205568 <stride_dequeue+0x5a2>
ffffffffc0205322:	008a3783          	ld	a5,8(s4)
ffffffffc0205326:	010a3603          	ld	a2,16(s4)
ffffffffc020532a:	e03e                	sd	a5,0(sp)
ffffffffc020532c:	0e060863          	beqz	a2,ffffffffc020541c <stride_dequeue+0x456>
ffffffffc0205330:	85b2                	mv	a1,a2
ffffffffc0205332:	856e                	mv	a0,s11
ffffffffc0205334:	e432                	sd	a2,8(sp)
ffffffffc0205336:	a55ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020533a:	58fd                	li	a7,-1
ffffffffc020533c:	6622                	ld	a2,8(sp)
ffffffffc020533e:	7b150f63          	beq	a0,a7,ffffffffc0205afc <stride_dequeue+0xb36>
ffffffffc0205342:	661c                	ld	a5,8(a2)
ffffffffc0205344:	01063803          	ld	a6,16(a2)
ffffffffc0205348:	e43e                	sd	a5,8(sp)
ffffffffc020534a:	0c080263          	beqz	a6,ffffffffc020540e <stride_dequeue+0x448>
ffffffffc020534e:	85c2                	mv	a1,a6
ffffffffc0205350:	856e                	mv	a0,s11
ffffffffc0205352:	ec32                	sd	a2,24(sp)
ffffffffc0205354:	e842                	sd	a6,16(sp)
ffffffffc0205356:	a35ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020535a:	58fd                	li	a7,-1
ffffffffc020535c:	6842                	ld	a6,16(sp)
ffffffffc020535e:	6662                	ld	a2,24(sp)
ffffffffc0205360:	631507e3          	beq	a0,a7,ffffffffc020618e <stride_dequeue+0x11c8>
ffffffffc0205364:	00883783          	ld	a5,8(a6)
ffffffffc0205368:	01083303          	ld	t1,16(a6)
ffffffffc020536c:	e83e                	sd	a5,16(sp)
ffffffffc020536e:	08030863          	beqz	t1,ffffffffc02053fe <stride_dequeue+0x438>
ffffffffc0205372:	859a                	mv	a1,t1
ffffffffc0205374:	856e                	mv	a0,s11
ffffffffc0205376:	f442                	sd	a6,40(sp)
ffffffffc0205378:	f032                	sd	a2,32(sp)
ffffffffc020537a:	ec1a                	sd	t1,24(sp)
ffffffffc020537c:	a0fff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205380:	58fd                	li	a7,-1
ffffffffc0205382:	6362                	ld	t1,24(sp)
ffffffffc0205384:	7602                	ld	a2,32(sp)
ffffffffc0205386:	7822                	ld	a6,40(sp)
ffffffffc0205388:	01151463          	bne	a0,a7,ffffffffc0205390 <stride_dequeue+0x3ca>
ffffffffc020538c:	3d00106f          	j	ffffffffc020675c <stride_dequeue+0x1796>
ffffffffc0205390:	00833783          	ld	a5,8(t1)
ffffffffc0205394:	01033983          	ld	s3,16(t1)
ffffffffc0205398:	ec3e                	sd	a5,24(sp)
ffffffffc020539a:	00099463          	bnez	s3,ffffffffc02053a2 <stride_dequeue+0x3dc>
ffffffffc020539e:	2af0106f          	j	ffffffffc0206e4c <stride_dequeue+0x1e86>
ffffffffc02053a2:	85ce                	mv	a1,s3
ffffffffc02053a4:	856e                	mv	a0,s11
ffffffffc02053a6:	f81a                	sd	t1,48(sp)
ffffffffc02053a8:	f442                	sd	a6,40(sp)
ffffffffc02053aa:	f032                	sd	a2,32(sp)
ffffffffc02053ac:	9dfff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02053b0:	58fd                	li	a7,-1
ffffffffc02053b2:	7602                	ld	a2,32(sp)
ffffffffc02053b4:	7822                	ld	a6,40(sp)
ffffffffc02053b6:	7342                	ld	t1,48(sp)
ffffffffc02053b8:	01151463          	bne	a0,a7,ffffffffc02053c0 <stride_dequeue+0x3fa>
ffffffffc02053bc:	3510106f          	j	ffffffffc0206f0c <stride_dequeue+0x1f46>
ffffffffc02053c0:	0109b583          	ld	a1,16(s3)
ffffffffc02053c4:	0089bb03          	ld	s6,8(s3)
ffffffffc02053c8:	856e                	mv	a0,s11
ffffffffc02053ca:	f81a                	sd	t1,48(sp)
ffffffffc02053cc:	f442                	sd	a6,40(sp)
ffffffffc02053ce:	f032                	sd	a2,32(sp)
ffffffffc02053d0:	a17ff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02053d4:	00a9b423          	sd	a0,8(s3)
ffffffffc02053d8:	0169b823          	sd	s6,16(s3)
ffffffffc02053dc:	7602                	ld	a2,32(sp)
ffffffffc02053de:	7822                	ld	a6,40(sp)
ffffffffc02053e0:	7342                	ld	t1,48(sp)
ffffffffc02053e2:	010c2b03          	lw	s6,16(s8)
ffffffffc02053e6:	c119                	beqz	a0,ffffffffc02053ec <stride_dequeue+0x426>
ffffffffc02053e8:	01353023          	sd	s3,0(a0)
ffffffffc02053ec:	67e2                	ld	a5,24(sp)
ffffffffc02053ee:	01333423          	sd	s3,8(t1)
ffffffffc02053f2:	8d9a                	mv	s11,t1
ffffffffc02053f4:	00f33823          	sd	a5,16(t1)
ffffffffc02053f8:	0069b023          	sd	t1,0(s3)
ffffffffc02053fc:	89da                	mv	s3,s6
ffffffffc02053fe:	67c2                	ld	a5,16(sp)
ffffffffc0205400:	01b83423          	sd	s11,8(a6)
ffffffffc0205404:	00f83823          	sd	a5,16(a6)
ffffffffc0205408:	010db023          	sd	a6,0(s11)
ffffffffc020540c:	8dc2                	mv	s11,a6
ffffffffc020540e:	67a2                	ld	a5,8(sp)
ffffffffc0205410:	01b63423          	sd	s11,8(a2)
ffffffffc0205414:	ea1c                	sd	a5,16(a2)
ffffffffc0205416:	00cdb023          	sd	a2,0(s11)
ffffffffc020541a:	8db2                	mv	s11,a2
ffffffffc020541c:	6782                	ld	a5,0(sp)
ffffffffc020541e:	01ba3423          	sd	s11,8(s4)
ffffffffc0205422:	00fa3823          	sd	a5,16(s4)
ffffffffc0205426:	014db023          	sd	s4,0(s11)
ffffffffc020542a:	01493423          	sd	s4,8(s2)
ffffffffc020542e:	01993823          	sd	s9,16(s2)
ffffffffc0205432:	012a3023          	sd	s2,0(s4)
ffffffffc0205436:	b315                	j	ffffffffc020515a <stride_dequeue+0x194>
ffffffffc0205438:	84ca                	mv	s1,s2
ffffffffc020543a:	01a4b023          	sd	s10,0(s1)
ffffffffc020543e:	b335                	j	ffffffffc020516a <stride_dequeue+0x1a4>
ffffffffc0205440:	008db783          	ld	a5,8(s11)
ffffffffc0205444:	010dbc83          	ld	s9,16(s11)
ffffffffc0205448:	e42a                	sd	a0,8(sp)
ffffffffc020544a:	e03e                	sd	a5,0(sp)
ffffffffc020544c:	100c8563          	beqz	s9,ffffffffc0205556 <stride_dequeue+0x590>
ffffffffc0205450:	85a6                	mv	a1,s1
ffffffffc0205452:	8566                	mv	a0,s9
ffffffffc0205454:	937ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205458:	67a2                	ld	a5,8(sp)
ffffffffc020545a:	4cf50e63          	beq	a0,a5,ffffffffc0205936 <stride_dequeue+0x970>
ffffffffc020545e:	649c                	ld	a5,8(s1)
ffffffffc0205460:	0104ba03          	ld	s4,16(s1)
ffffffffc0205464:	e43e                	sd	a5,8(sp)
ffffffffc0205466:	0e0a0263          	beqz	s4,ffffffffc020554a <stride_dequeue+0x584>
ffffffffc020546a:	85d2                	mv	a1,s4
ffffffffc020546c:	8566                	mv	a0,s9
ffffffffc020546e:	91dff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205472:	58fd                	li	a7,-1
ffffffffc0205474:	0d1505e3          	beq	a0,a7,ffffffffc0205d3e <stride_dequeue+0xd78>
ffffffffc0205478:	008a3783          	ld	a5,8(s4)
ffffffffc020547c:	010a3803          	ld	a6,16(s4)
ffffffffc0205480:	e83e                	sd	a5,16(sp)
ffffffffc0205482:	0a080c63          	beqz	a6,ffffffffc020553a <stride_dequeue+0x574>
ffffffffc0205486:	85c2                	mv	a1,a6
ffffffffc0205488:	8566                	mv	a0,s9
ffffffffc020548a:	ec42                	sd	a6,24(sp)
ffffffffc020548c:	8ffff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205490:	58fd                	li	a7,-1
ffffffffc0205492:	6862                	ld	a6,24(sp)
ffffffffc0205494:	01151463          	bne	a0,a7,ffffffffc020549c <stride_dequeue+0x4d6>
ffffffffc0205498:	07c0106f          	j	ffffffffc0206514 <stride_dequeue+0x154e>
ffffffffc020549c:	00883783          	ld	a5,8(a6)
ffffffffc02054a0:	01083983          	ld	s3,16(a6)
ffffffffc02054a4:	ec3e                	sd	a5,24(sp)
ffffffffc02054a6:	00099463          	bnez	s3,ffffffffc02054ae <stride_dequeue+0x4e8>
ffffffffc02054aa:	2bb0106f          	j	ffffffffc0206f64 <stride_dequeue+0x1f9e>
ffffffffc02054ae:	85ce                	mv	a1,s3
ffffffffc02054b0:	8566                	mv	a0,s9
ffffffffc02054b2:	f042                	sd	a6,32(sp)
ffffffffc02054b4:	8d7ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02054b8:	58fd                	li	a7,-1
ffffffffc02054ba:	7802                	ld	a6,32(sp)
ffffffffc02054bc:	01151463          	bne	a0,a7,ffffffffc02054c4 <stride_dequeue+0x4fe>
ffffffffc02054c0:	05f0106f          	j	ffffffffc0206d1e <stride_dequeue+0x1d58>
ffffffffc02054c4:	0089b783          	ld	a5,8(s3)
ffffffffc02054c8:	0109be03          	ld	t3,16(s3)
ffffffffc02054cc:	f03e                	sd	a5,32(sp)
ffffffffc02054ce:	040e0663          	beqz	t3,ffffffffc020551a <stride_dequeue+0x554>
ffffffffc02054d2:	85f2                	mv	a1,t3
ffffffffc02054d4:	8566                	mv	a0,s9
ffffffffc02054d6:	f842                	sd	a6,48(sp)
ffffffffc02054d8:	f472                	sd	t3,40(sp)
ffffffffc02054da:	8b1ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02054de:	58fd                	li	a7,-1
ffffffffc02054e0:	7e22                	ld	t3,40(sp)
ffffffffc02054e2:	7842                	ld	a6,48(sp)
ffffffffc02054e4:	01151463          	bne	a0,a7,ffffffffc02054ec <stride_dequeue+0x526>
ffffffffc02054e8:	4e70106f          	j	ffffffffc02071ce <stride_dequeue+0x2208>
ffffffffc02054ec:	010e3583          	ld	a1,16(t3)
ffffffffc02054f0:	8566                	mv	a0,s9
ffffffffc02054f2:	008e3b03          	ld	s6,8(t3)
ffffffffc02054f6:	f842                	sd	a6,48(sp)
ffffffffc02054f8:	f472                	sd	t3,40(sp)
ffffffffc02054fa:	8edff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02054fe:	7e22                	ld	t3,40(sp)
ffffffffc0205500:	7842                	ld	a6,48(sp)
ffffffffc0205502:	016e3823          	sd	s6,16(t3)
ffffffffc0205506:	00ae3423          	sd	a0,8(t3)
ffffffffc020550a:	010c2b03          	lw	s6,16(s8)
ffffffffc020550e:	e119                	bnez	a0,ffffffffc0205514 <stride_dequeue+0x54e>
ffffffffc0205510:	7bb0106f          	j	ffffffffc02074ca <stride_dequeue+0x2504>
ffffffffc0205514:	01c53023          	sd	t3,0(a0)
ffffffffc0205518:	8cf2                	mv	s9,t3
ffffffffc020551a:	7782                	ld	a5,32(sp)
ffffffffc020551c:	0199b423          	sd	s9,8(s3)
ffffffffc0205520:	00f9b823          	sd	a5,16(s3)
ffffffffc0205524:	013cb023          	sd	s3,0(s9)
ffffffffc0205528:	67e2                	ld	a5,24(sp)
ffffffffc020552a:	01383423          	sd	s3,8(a6)
ffffffffc020552e:	8cc2                	mv	s9,a6
ffffffffc0205530:	00f83823          	sd	a5,16(a6)
ffffffffc0205534:	0109b023          	sd	a6,0(s3)
ffffffffc0205538:	89da                	mv	s3,s6
ffffffffc020553a:	67c2                	ld	a5,16(sp)
ffffffffc020553c:	019a3423          	sd	s9,8(s4)
ffffffffc0205540:	00fa3823          	sd	a5,16(s4)
ffffffffc0205544:	014cb023          	sd	s4,0(s9)
ffffffffc0205548:	8cd2                	mv	s9,s4
ffffffffc020554a:	67a2                	ld	a5,8(sp)
ffffffffc020554c:	0194b423          	sd	s9,8(s1)
ffffffffc0205550:	e89c                	sd	a5,16(s1)
ffffffffc0205552:	009cb023          	sd	s1,0(s9)
ffffffffc0205556:	6782                	ld	a5,0(sp)
ffffffffc0205558:	009db423          	sd	s1,8(s11)
ffffffffc020555c:	00fdb823          	sd	a5,16(s11)
ffffffffc0205560:	01b4b023          	sd	s11,0(s1)
ffffffffc0205564:	84ee                	mv	s1,s11
ffffffffc0205566:	bbad                	j	ffffffffc02052e0 <stride_dequeue+0x31a>
ffffffffc0205568:	008db783          	ld	a5,8(s11)
ffffffffc020556c:	010db603          	ld	a2,16(s11)
ffffffffc0205570:	e03e                	sd	a5,0(sp)
ffffffffc0205572:	0e060963          	beqz	a2,ffffffffc0205664 <stride_dequeue+0x69e>
ffffffffc0205576:	8532                	mv	a0,a2
ffffffffc0205578:	85d2                	mv	a1,s4
ffffffffc020557a:	e432                	sd	a2,8(sp)
ffffffffc020557c:	80fff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205580:	58fd                	li	a7,-1
ffffffffc0205582:	6622                	ld	a2,8(sp)
ffffffffc0205584:	091504e3          	beq	a0,a7,ffffffffc0205e0c <stride_dequeue+0xe46>
ffffffffc0205588:	008a3783          	ld	a5,8(s4)
ffffffffc020558c:	010a3803          	ld	a6,16(s4)
ffffffffc0205590:	e43e                	sd	a5,8(sp)
ffffffffc0205592:	0c080263          	beqz	a6,ffffffffc0205656 <stride_dequeue+0x690>
ffffffffc0205596:	85c2                	mv	a1,a6
ffffffffc0205598:	8532                	mv	a0,a2
ffffffffc020559a:	ec42                	sd	a6,24(sp)
ffffffffc020559c:	e832                	sd	a2,16(sp)
ffffffffc020559e:	fecff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02055a2:	58fd                	li	a7,-1
ffffffffc02055a4:	6642                	ld	a2,16(sp)
ffffffffc02055a6:	6862                	ld	a6,24(sp)
ffffffffc02055a8:	01151463          	bne	a0,a7,ffffffffc02055b0 <stride_dequeue+0x5ea>
ffffffffc02055ac:	00a0106f          	j	ffffffffc02065b6 <stride_dequeue+0x15f0>
ffffffffc02055b0:	00883783          	ld	a5,8(a6)
ffffffffc02055b4:	01083983          	ld	s3,16(a6)
ffffffffc02055b8:	e83e                	sd	a5,16(sp)
ffffffffc02055ba:	00099463          	bnez	s3,ffffffffc02055c2 <stride_dequeue+0x5fc>
ffffffffc02055be:	1e50106f          	j	ffffffffc0206fa2 <stride_dequeue+0x1fdc>
ffffffffc02055c2:	8532                	mv	a0,a2
ffffffffc02055c4:	85ce                	mv	a1,s3
ffffffffc02055c6:	f042                	sd	a6,32(sp)
ffffffffc02055c8:	ec32                	sd	a2,24(sp)
ffffffffc02055ca:	fc0ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02055ce:	58fd                	li	a7,-1
ffffffffc02055d0:	6662                	ld	a2,24(sp)
ffffffffc02055d2:	7802                	ld	a6,32(sp)
ffffffffc02055d4:	01151463          	bne	a0,a7,ffffffffc02055dc <stride_dequeue+0x616>
ffffffffc02055d8:	4fc0106f          	j	ffffffffc0206ad4 <stride_dequeue+0x1b0e>
ffffffffc02055dc:	0089b783          	ld	a5,8(s3)
ffffffffc02055e0:	0109be03          	ld	t3,16(s3)
ffffffffc02055e4:	ec3e                	sd	a5,24(sp)
ffffffffc02055e6:	040e0863          	beqz	t3,ffffffffc0205636 <stride_dequeue+0x670>
ffffffffc02055ea:	85f2                	mv	a1,t3
ffffffffc02055ec:	8532                	mv	a0,a2
ffffffffc02055ee:	f842                	sd	a6,48(sp)
ffffffffc02055f0:	f472                	sd	t3,40(sp)
ffffffffc02055f2:	f032                	sd	a2,32(sp)
ffffffffc02055f4:	f96ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02055f8:	7842                	ld	a6,48(sp)
ffffffffc02055fa:	7e22                	ld	t3,40(sp)
ffffffffc02055fc:	58fd                	li	a7,-1
ffffffffc02055fe:	f442                	sd	a6,40(sp)
ffffffffc0205600:	7602                	ld	a2,32(sp)
ffffffffc0205602:	01151463          	bne	a0,a7,ffffffffc020560a <stride_dequeue+0x644>
ffffffffc0205606:	37b0106f          	j	ffffffffc0207180 <stride_dequeue+0x21ba>
ffffffffc020560a:	010e3583          	ld	a1,16(t3)
ffffffffc020560e:	8532                	mv	a0,a2
ffffffffc0205610:	008e3b03          	ld	s6,8(t3)
ffffffffc0205614:	f072                	sd	t3,32(sp)
ffffffffc0205616:	fd0ff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020561a:	7e02                	ld	t3,32(sp)
ffffffffc020561c:	7822                	ld	a6,40(sp)
ffffffffc020561e:	016e3823          	sd	s6,16(t3)
ffffffffc0205622:	00ae3423          	sd	a0,8(t3)
ffffffffc0205626:	010c2b03          	lw	s6,16(s8)
ffffffffc020562a:	e119                	bnez	a0,ffffffffc0205630 <stride_dequeue+0x66a>
ffffffffc020562c:	7090106f          	j	ffffffffc0207534 <stride_dequeue+0x256e>
ffffffffc0205630:	01c53023          	sd	t3,0(a0)
ffffffffc0205634:	8672                	mv	a2,t3
ffffffffc0205636:	67e2                	ld	a5,24(sp)
ffffffffc0205638:	00c9b423          	sd	a2,8(s3)
ffffffffc020563c:	00f9b823          	sd	a5,16(s3)
ffffffffc0205640:	01363023          	sd	s3,0(a2)
ffffffffc0205644:	67c2                	ld	a5,16(sp)
ffffffffc0205646:	01383423          	sd	s3,8(a6)
ffffffffc020564a:	8642                	mv	a2,a6
ffffffffc020564c:	00f83823          	sd	a5,16(a6)
ffffffffc0205650:	0109b023          	sd	a6,0(s3)
ffffffffc0205654:	89da                	mv	s3,s6
ffffffffc0205656:	67a2                	ld	a5,8(sp)
ffffffffc0205658:	00ca3423          	sd	a2,8(s4)
ffffffffc020565c:	00fa3823          	sd	a5,16(s4)
ffffffffc0205660:	01463023          	sd	s4,0(a2)
ffffffffc0205664:	6782                	ld	a5,0(sp)
ffffffffc0205666:	014db423          	sd	s4,8(s11)
ffffffffc020566a:	00fdb823          	sd	a5,16(s11)
ffffffffc020566e:	01ba3023          	sd	s11,0(s4)
ffffffffc0205672:	8a6e                	mv	s4,s11
ffffffffc0205674:	bb5d                	j	ffffffffc020542a <stride_dequeue+0x464>
ffffffffc0205676:	008db783          	ld	a5,8(s11)
ffffffffc020567a:	010dba03          	ld	s4,16(s11)
ffffffffc020567e:	e43e                	sd	a5,8(sp)
ffffffffc0205680:	0e0a0163          	beqz	s4,ffffffffc0205762 <stride_dequeue+0x79c>
ffffffffc0205684:	85e6                	mv	a1,s9
ffffffffc0205686:	8552                	mv	a0,s4
ffffffffc0205688:	f02ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020568c:	58fd                	li	a7,-1
ffffffffc020568e:	05150de3          	beq	a0,a7,ffffffffc0205ee8 <stride_dequeue+0xf22>
ffffffffc0205692:	008cb783          	ld	a5,8(s9)
ffffffffc0205696:	010cb803          	ld	a6,16(s9)
ffffffffc020569a:	e83e                	sd	a5,16(sp)
ffffffffc020569c:	0a080c63          	beqz	a6,ffffffffc0205754 <stride_dequeue+0x78e>
ffffffffc02056a0:	85c2                	mv	a1,a6
ffffffffc02056a2:	8552                	mv	a0,s4
ffffffffc02056a4:	ec42                	sd	a6,24(sp)
ffffffffc02056a6:	ee4ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02056aa:	58fd                	li	a7,-1
ffffffffc02056ac:	6862                	ld	a6,24(sp)
ffffffffc02056ae:	01151463          	bne	a0,a7,ffffffffc02056b6 <stride_dequeue+0x6f0>
ffffffffc02056b2:	7ab0006f          	j	ffffffffc020665c <stride_dequeue+0x1696>
ffffffffc02056b6:	00883783          	ld	a5,8(a6)
ffffffffc02056ba:	01083983          	ld	s3,16(a6)
ffffffffc02056be:	ec3e                	sd	a5,24(sp)
ffffffffc02056c0:	00099463          	bnez	s3,ffffffffc02056c8 <stride_dequeue+0x702>
ffffffffc02056c4:	0cd0106f          	j	ffffffffc0206f90 <stride_dequeue+0x1fca>
ffffffffc02056c8:	85ce                	mv	a1,s3
ffffffffc02056ca:	8552                	mv	a0,s4
ffffffffc02056cc:	f042                	sd	a6,32(sp)
ffffffffc02056ce:	ebcff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02056d2:	58fd                	li	a7,-1
ffffffffc02056d4:	7802                	ld	a6,32(sp)
ffffffffc02056d6:	01151463          	bne	a0,a7,ffffffffc02056de <stride_dequeue+0x718>
ffffffffc02056da:	39c0106f          	j	ffffffffc0206a76 <stride_dequeue+0x1ab0>
ffffffffc02056de:	0089b783          	ld	a5,8(s3)
ffffffffc02056e2:	0109be03          	ld	t3,16(s3)
ffffffffc02056e6:	f03e                	sd	a5,32(sp)
ffffffffc02056e8:	040e0663          	beqz	t3,ffffffffc0205734 <stride_dequeue+0x76e>
ffffffffc02056ec:	85f2                	mv	a1,t3
ffffffffc02056ee:	8552                	mv	a0,s4
ffffffffc02056f0:	f842                	sd	a6,48(sp)
ffffffffc02056f2:	f472                	sd	t3,40(sp)
ffffffffc02056f4:	e96ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02056f8:	58fd                	li	a7,-1
ffffffffc02056fa:	7e22                	ld	t3,40(sp)
ffffffffc02056fc:	7842                	ld	a6,48(sp)
ffffffffc02056fe:	01151463          	bne	a0,a7,ffffffffc0205706 <stride_dequeue+0x740>
ffffffffc0205702:	2f90106f          	j	ffffffffc02071fa <stride_dequeue+0x2234>
ffffffffc0205706:	010e3583          	ld	a1,16(t3)
ffffffffc020570a:	8552                	mv	a0,s4
ffffffffc020570c:	008e3b03          	ld	s6,8(t3)
ffffffffc0205710:	f842                	sd	a6,48(sp)
ffffffffc0205712:	f472                	sd	t3,40(sp)
ffffffffc0205714:	ed2ff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0205718:	7e22                	ld	t3,40(sp)
ffffffffc020571a:	7842                	ld	a6,48(sp)
ffffffffc020571c:	016e3823          	sd	s6,16(t3)
ffffffffc0205720:	00ae3423          	sd	a0,8(t3)
ffffffffc0205724:	010c2b03          	lw	s6,16(s8)
ffffffffc0205728:	e119                	bnez	a0,ffffffffc020572e <stride_dequeue+0x768>
ffffffffc020572a:	5a70106f          	j	ffffffffc02074d0 <stride_dequeue+0x250a>
ffffffffc020572e:	01c53023          	sd	t3,0(a0)
ffffffffc0205732:	8a72                	mv	s4,t3
ffffffffc0205734:	7782                	ld	a5,32(sp)
ffffffffc0205736:	0149b423          	sd	s4,8(s3)
ffffffffc020573a:	00f9b823          	sd	a5,16(s3)
ffffffffc020573e:	013a3023          	sd	s3,0(s4)
ffffffffc0205742:	67e2                	ld	a5,24(sp)
ffffffffc0205744:	01383423          	sd	s3,8(a6)
ffffffffc0205748:	8a42                	mv	s4,a6
ffffffffc020574a:	00f83823          	sd	a5,16(a6)
ffffffffc020574e:	0109b023          	sd	a6,0(s3)
ffffffffc0205752:	89da                	mv	s3,s6
ffffffffc0205754:	67c2                	ld	a5,16(sp)
ffffffffc0205756:	014cb423          	sd	s4,8(s9)
ffffffffc020575a:	00fcb823          	sd	a5,16(s9)
ffffffffc020575e:	019a3023          	sd	s9,0(s4)
ffffffffc0205762:	67a2                	ld	a5,8(sp)
ffffffffc0205764:	019db423          	sd	s9,8(s11)
ffffffffc0205768:	00fdb823          	sd	a5,16(s11)
ffffffffc020576c:	01bcb023          	sd	s11,0(s9)
ffffffffc0205770:	b695                	j	ffffffffc02052d4 <stride_dequeue+0x30e>
ffffffffc0205772:	00893783          	ld	a5,8(s2)
ffffffffc0205776:	01093883          	ld	a7,16(s2)
ffffffffc020577a:	ec2a                	sd	a0,24(sp)
ffffffffc020577c:	e83e                	sd	a5,16(sp)
ffffffffc020577e:	0a088963          	beqz	a7,ffffffffc0205830 <stride_dequeue+0x86a>
ffffffffc0205782:	8546                	mv	a0,a7
ffffffffc0205784:	85e6                	mv	a1,s9
ffffffffc0205786:	f046                	sd	a7,32(sp)
ffffffffc0205788:	e02ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020578c:	6862                	ld	a6,24(sp)
ffffffffc020578e:	7882                	ld	a7,32(sp)
ffffffffc0205790:	030504e3          	beq	a0,a6,ffffffffc0205fb8 <stride_dequeue+0xff2>
ffffffffc0205794:	008cb783          	ld	a5,8(s9)
ffffffffc0205798:	010cb303          	ld	t1,16(s9)
ffffffffc020579c:	f042                	sd	a6,32(sp)
ffffffffc020579e:	ec3e                	sd	a5,24(sp)
ffffffffc02057a0:	08030163          	beqz	t1,ffffffffc0205822 <stride_dequeue+0x85c>
ffffffffc02057a4:	859a                	mv	a1,t1
ffffffffc02057a6:	8546                	mv	a0,a7
ffffffffc02057a8:	f81a                	sd	t1,48(sp)
ffffffffc02057aa:	f446                	sd	a7,40(sp)
ffffffffc02057ac:	ddeff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02057b0:	7802                	ld	a6,32(sp)
ffffffffc02057b2:	78a2                	ld	a7,40(sp)
ffffffffc02057b4:	7342                	ld	t1,48(sp)
ffffffffc02057b6:	01051463          	bne	a0,a6,ffffffffc02057be <stride_dequeue+0x7f8>
ffffffffc02057ba:	0d00106f          	j	ffffffffc020688a <stride_dequeue+0x18c4>
ffffffffc02057be:	00833783          	ld	a5,8(t1)
ffffffffc02057c2:	01033983          	ld	s3,16(t1)
ffffffffc02057c6:	f442                	sd	a6,40(sp)
ffffffffc02057c8:	f03e                	sd	a5,32(sp)
ffffffffc02057ca:	00099463          	bnez	s3,ffffffffc02057d2 <stride_dequeue+0x80c>
ffffffffc02057ce:	6720106f          	j	ffffffffc0206e40 <stride_dequeue+0x1e7a>
ffffffffc02057d2:	8546                	mv	a0,a7
ffffffffc02057d4:	85ce                	mv	a1,s3
ffffffffc02057d6:	fc1a                	sd	t1,56(sp)
ffffffffc02057d8:	f846                	sd	a7,48(sp)
ffffffffc02057da:	db0ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02057de:	7822                	ld	a6,40(sp)
ffffffffc02057e0:	78c2                	ld	a7,48(sp)
ffffffffc02057e2:	7362                	ld	t1,56(sp)
ffffffffc02057e4:	01051463          	bne	a0,a6,ffffffffc02057ec <stride_dequeue+0x826>
ffffffffc02057e8:	6700106f          	j	ffffffffc0206e58 <stride_dequeue+0x1e92>
ffffffffc02057ec:	0109b583          	ld	a1,16(s3)
ffffffffc02057f0:	0089bb03          	ld	s6,8(s3)
ffffffffc02057f4:	8546                	mv	a0,a7
ffffffffc02057f6:	f41a                	sd	t1,40(sp)
ffffffffc02057f8:	deeff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02057fc:	00a9b423          	sd	a0,8(s3)
ffffffffc0205800:	0169b823          	sd	s6,16(s3)
ffffffffc0205804:	7322                	ld	t1,40(sp)
ffffffffc0205806:	010c2b03          	lw	s6,16(s8)
ffffffffc020580a:	c119                	beqz	a0,ffffffffc0205810 <stride_dequeue+0x84a>
ffffffffc020580c:	01353023          	sd	s3,0(a0)
ffffffffc0205810:	7782                	ld	a5,32(sp)
ffffffffc0205812:	01333423          	sd	s3,8(t1)
ffffffffc0205816:	889a                	mv	a7,t1
ffffffffc0205818:	00f33823          	sd	a5,16(t1)
ffffffffc020581c:	0069b023          	sd	t1,0(s3)
ffffffffc0205820:	89da                	mv	s3,s6
ffffffffc0205822:	67e2                	ld	a5,24(sp)
ffffffffc0205824:	011cb423          	sd	a7,8(s9)
ffffffffc0205828:	00fcb823          	sd	a5,16(s9)
ffffffffc020582c:	0198b023          	sd	s9,0(a7)
ffffffffc0205830:	67c2                	ld	a5,16(sp)
ffffffffc0205832:	01993423          	sd	s9,8(s2)
ffffffffc0205836:	00f93823          	sd	a5,16(s2)
ffffffffc020583a:	012cb023          	sd	s2,0(s9)
ffffffffc020583e:	b8f5                	j	ffffffffc020513a <stride_dequeue+0x174>
ffffffffc0205840:	00893783          	ld	a5,8(s2)
ffffffffc0205844:	01093c83          	ld	s9,16(s2)
ffffffffc0205848:	e43e                	sd	a5,8(sp)
ffffffffc020584a:	0c0c8d63          	beqz	s9,ffffffffc0205924 <stride_dequeue+0x95e>
ffffffffc020584e:	85ee                	mv	a1,s11
ffffffffc0205850:	8566                	mv	a0,s9
ffffffffc0205852:	d38ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205856:	58fd                	li	a7,-1
ffffffffc0205858:	39150063          	beq	a0,a7,ffffffffc0205bd8 <stride_dequeue+0xc12>
ffffffffc020585c:	008db783          	ld	a5,8(s11)
ffffffffc0205860:	010db803          	ld	a6,16(s11)
ffffffffc0205864:	e83e                	sd	a5,16(sp)
ffffffffc0205866:	0a080863          	beqz	a6,ffffffffc0205916 <stride_dequeue+0x950>
ffffffffc020586a:	85c2                	mv	a1,a6
ffffffffc020586c:	8566                	mv	a0,s9
ffffffffc020586e:	ec42                	sd	a6,24(sp)
ffffffffc0205870:	d1aff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205874:	58fd                	li	a7,-1
ffffffffc0205876:	6862                	ld	a6,24(sp)
ffffffffc0205878:	7d150f63          	beq	a0,a7,ffffffffc0206056 <stride_dequeue+0x1090>
ffffffffc020587c:	00883783          	ld	a5,8(a6)
ffffffffc0205880:	01083303          	ld	t1,16(a6)
ffffffffc0205884:	ec3e                	sd	a5,24(sp)
ffffffffc0205886:	08030063          	beqz	t1,ffffffffc0205906 <stride_dequeue+0x940>
ffffffffc020588a:	859a                	mv	a1,t1
ffffffffc020588c:	8566                	mv	a0,s9
ffffffffc020588e:	f442                	sd	a6,40(sp)
ffffffffc0205890:	f01a                	sd	t1,32(sp)
ffffffffc0205892:	cf8ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205896:	58fd                	li	a7,-1
ffffffffc0205898:	7302                	ld	t1,32(sp)
ffffffffc020589a:	7822                	ld	a6,40(sp)
ffffffffc020589c:	65150fe3          	beq	a0,a7,ffffffffc02066fa <stride_dequeue+0x1734>
ffffffffc02058a0:	00833783          	ld	a5,8(t1)
ffffffffc02058a4:	01033983          	ld	s3,16(t1)
ffffffffc02058a8:	f03e                	sd	a5,32(sp)
ffffffffc02058aa:	00099463          	bnez	s3,ffffffffc02058b2 <stride_dequeue+0x8ec>
ffffffffc02058ae:	5980106f          	j	ffffffffc0206e46 <stride_dequeue+0x1e80>
ffffffffc02058b2:	85ce                	mv	a1,s3
ffffffffc02058b4:	8566                	mv	a0,s9
ffffffffc02058b6:	f81a                	sd	t1,48(sp)
ffffffffc02058b8:	f442                	sd	a6,40(sp)
ffffffffc02058ba:	cd0ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02058be:	58fd                	li	a7,-1
ffffffffc02058c0:	7822                	ld	a6,40(sp)
ffffffffc02058c2:	7342                	ld	t1,48(sp)
ffffffffc02058c4:	01151463          	bne	a0,a7,ffffffffc02058cc <stride_dequeue+0x906>
ffffffffc02058c8:	5ea0106f          	j	ffffffffc0206eb2 <stride_dequeue+0x1eec>
ffffffffc02058cc:	0109b583          	ld	a1,16(s3)
ffffffffc02058d0:	0089bb03          	ld	s6,8(s3)
ffffffffc02058d4:	8566                	mv	a0,s9
ffffffffc02058d6:	f81a                	sd	t1,48(sp)
ffffffffc02058d8:	f442                	sd	a6,40(sp)
ffffffffc02058da:	d0cff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02058de:	00a9b423          	sd	a0,8(s3)
ffffffffc02058e2:	0169b823          	sd	s6,16(s3)
ffffffffc02058e6:	7822                	ld	a6,40(sp)
ffffffffc02058e8:	7342                	ld	t1,48(sp)
ffffffffc02058ea:	010c2b03          	lw	s6,16(s8)
ffffffffc02058ee:	c119                	beqz	a0,ffffffffc02058f4 <stride_dequeue+0x92e>
ffffffffc02058f0:	01353023          	sd	s3,0(a0)
ffffffffc02058f4:	7782                	ld	a5,32(sp)
ffffffffc02058f6:	01333423          	sd	s3,8(t1)
ffffffffc02058fa:	8c9a                	mv	s9,t1
ffffffffc02058fc:	00f33823          	sd	a5,16(t1)
ffffffffc0205900:	0069b023          	sd	t1,0(s3)
ffffffffc0205904:	89da                	mv	s3,s6
ffffffffc0205906:	67e2                	ld	a5,24(sp)
ffffffffc0205908:	01983423          	sd	s9,8(a6)
ffffffffc020590c:	00f83823          	sd	a5,16(a6)
ffffffffc0205910:	010cb023          	sd	a6,0(s9)
ffffffffc0205914:	8cc2                	mv	s9,a6
ffffffffc0205916:	67c2                	ld	a5,16(sp)
ffffffffc0205918:	019db423          	sd	s9,8(s11)
ffffffffc020591c:	00fdb823          	sd	a5,16(s11)
ffffffffc0205920:	01bcb023          	sd	s11,0(s9)
ffffffffc0205924:	67a2                	ld	a5,8(sp)
ffffffffc0205926:	01b93423          	sd	s11,8(s2)
ffffffffc020592a:	00f93823          	sd	a5,16(s2)
ffffffffc020592e:	012db023          	sd	s2,0(s11)
ffffffffc0205932:	819ff06f          	j	ffffffffc020514a <stride_dequeue+0x184>
ffffffffc0205936:	008cb783          	ld	a5,8(s9)
ffffffffc020593a:	010cba03          	ld	s4,16(s9)
ffffffffc020593e:	e43e                	sd	a5,8(sp)
ffffffffc0205940:	0c0a0d63          	beqz	s4,ffffffffc0205a1a <stride_dequeue+0xa54>
ffffffffc0205944:	85a6                	mv	a1,s1
ffffffffc0205946:	8552                	mv	a0,s4
ffffffffc0205948:	c42ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020594c:	58fd                	li	a7,-1
ffffffffc020594e:	151500e3          	beq	a0,a7,ffffffffc020628e <stride_dequeue+0x12c8>
ffffffffc0205952:	649c                	ld	a5,8(s1)
ffffffffc0205954:	0104b983          	ld	s3,16(s1)
ffffffffc0205958:	e83e                	sd	a5,16(sp)
ffffffffc020595a:	00099463          	bnez	s3,ffffffffc0205962 <stride_dequeue+0x99c>
ffffffffc020595e:	4f40106f          	j	ffffffffc0206e52 <stride_dequeue+0x1e8c>
ffffffffc0205962:	85ce                	mv	a1,s3
ffffffffc0205964:	8552                	mv	a0,s4
ffffffffc0205966:	c24ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020596a:	58fd                	li	a7,-1
ffffffffc020596c:	01151463          	bne	a0,a7,ffffffffc0205974 <stride_dequeue+0x9ae>
ffffffffc0205970:	0b00106f          	j	ffffffffc0206a20 <stride_dequeue+0x1a5a>
ffffffffc0205974:	0089b783          	ld	a5,8(s3)
ffffffffc0205978:	0109b303          	ld	t1,16(s3)
ffffffffc020597c:	ec3e                	sd	a5,24(sp)
ffffffffc020597e:	08030063          	beqz	t1,ffffffffc02059fe <stride_dequeue+0xa38>
ffffffffc0205982:	859a                	mv	a1,t1
ffffffffc0205984:	8552                	mv	a0,s4
ffffffffc0205986:	f01a                	sd	t1,32(sp)
ffffffffc0205988:	c02ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020598c:	58fd                	li	a7,-1
ffffffffc020598e:	7302                	ld	t1,32(sp)
ffffffffc0205990:	01151463          	bne	a0,a7,ffffffffc0205998 <stride_dequeue+0x9d2>
ffffffffc0205994:	0130106f          	j	ffffffffc02071a6 <stride_dequeue+0x21e0>
ffffffffc0205998:	00833783          	ld	a5,8(t1)
ffffffffc020599c:	01033e03          	ld	t3,16(t1)
ffffffffc02059a0:	f03e                	sd	a5,32(sp)
ffffffffc02059a2:	040e0663          	beqz	t3,ffffffffc02059ee <stride_dequeue+0xa28>
ffffffffc02059a6:	85f2                	mv	a1,t3
ffffffffc02059a8:	8552                	mv	a0,s4
ffffffffc02059aa:	f81a                	sd	t1,48(sp)
ffffffffc02059ac:	f472                	sd	t3,40(sp)
ffffffffc02059ae:	bdcff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02059b2:	58fd                	li	a7,-1
ffffffffc02059b4:	7e22                	ld	t3,40(sp)
ffffffffc02059b6:	7342                	ld	t1,48(sp)
ffffffffc02059b8:	01151463          	bne	a0,a7,ffffffffc02059c0 <stride_dequeue+0x9fa>
ffffffffc02059bc:	53d0106f          	j	ffffffffc02076f8 <stride_dequeue+0x2732>
ffffffffc02059c0:	010e3583          	ld	a1,16(t3)
ffffffffc02059c4:	8552                	mv	a0,s4
ffffffffc02059c6:	008e3b03          	ld	s6,8(t3)
ffffffffc02059ca:	f81a                	sd	t1,48(sp)
ffffffffc02059cc:	f472                	sd	t3,40(sp)
ffffffffc02059ce:	c18ff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02059d2:	7e22                	ld	t3,40(sp)
ffffffffc02059d4:	7342                	ld	t1,48(sp)
ffffffffc02059d6:	016e3823          	sd	s6,16(t3)
ffffffffc02059da:	00ae3423          	sd	a0,8(t3)
ffffffffc02059de:	010c2b03          	lw	s6,16(s8)
ffffffffc02059e2:	e119                	bnez	a0,ffffffffc02059e8 <stride_dequeue+0xa22>
ffffffffc02059e4:	76d0106f          	j	ffffffffc0207950 <stride_dequeue+0x298a>
ffffffffc02059e8:	01c53023          	sd	t3,0(a0)
ffffffffc02059ec:	8a72                	mv	s4,t3
ffffffffc02059ee:	7782                	ld	a5,32(sp)
ffffffffc02059f0:	01433423          	sd	s4,8(t1)
ffffffffc02059f4:	00f33823          	sd	a5,16(t1)
ffffffffc02059f8:	006a3023          	sd	t1,0(s4)
ffffffffc02059fc:	8a1a                	mv	s4,t1
ffffffffc02059fe:	67e2                	ld	a5,24(sp)
ffffffffc0205a00:	0149b423          	sd	s4,8(s3)
ffffffffc0205a04:	00f9b823          	sd	a5,16(s3)
ffffffffc0205a08:	013a3023          	sd	s3,0(s4)
ffffffffc0205a0c:	67c2                	ld	a5,16(sp)
ffffffffc0205a0e:	0134b423          	sd	s3,8(s1)
ffffffffc0205a12:	e89c                	sd	a5,16(s1)
ffffffffc0205a14:	0099b023          	sd	s1,0(s3)
ffffffffc0205a18:	89da                	mv	s3,s6
ffffffffc0205a1a:	67a2                	ld	a5,8(sp)
ffffffffc0205a1c:	009cb423          	sd	s1,8(s9)
ffffffffc0205a20:	00fcb823          	sd	a5,16(s9)
ffffffffc0205a24:	0194b023          	sd	s9,0(s1)
ffffffffc0205a28:	84e6                	mv	s1,s9
ffffffffc0205a2a:	b635                	j	ffffffffc0205556 <stride_dequeue+0x590>
ffffffffc0205a2c:	008db783          	ld	a5,8(s11)
ffffffffc0205a30:	010db883          	ld	a7,16(s11)
ffffffffc0205a34:	ec2a                	sd	a0,24(sp)
ffffffffc0205a36:	e83e                	sd	a5,16(sp)
ffffffffc0205a38:	0a088963          	beqz	a7,ffffffffc0205aea <stride_dequeue+0xb24>
ffffffffc0205a3c:	8546                	mv	a0,a7
ffffffffc0205a3e:	85d2                	mv	a1,s4
ffffffffc0205a40:	f046                	sd	a7,32(sp)
ffffffffc0205a42:	b48ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205a46:	6862                	ld	a6,24(sp)
ffffffffc0205a48:	7882                	ld	a7,32(sp)
ffffffffc0205a4a:	0d050ae3          	beq	a0,a6,ffffffffc020631e <stride_dequeue+0x1358>
ffffffffc0205a4e:	008a3783          	ld	a5,8(s4)
ffffffffc0205a52:	010a3983          	ld	s3,16(s4)
ffffffffc0205a56:	f042                	sd	a6,32(sp)
ffffffffc0205a58:	ec3e                	sd	a5,24(sp)
ffffffffc0205a5a:	00099463          	bnez	s3,ffffffffc0205a62 <stride_dequeue+0xa9c>
ffffffffc0205a5e:	53e0106f          	j	ffffffffc0206f9c <stride_dequeue+0x1fd6>
ffffffffc0205a62:	8546                	mv	a0,a7
ffffffffc0205a64:	85ce                	mv	a1,s3
ffffffffc0205a66:	f446                	sd	a7,40(sp)
ffffffffc0205a68:	b22ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205a6c:	7802                	ld	a6,32(sp)
ffffffffc0205a6e:	78a2                	ld	a7,40(sp)
ffffffffc0205a70:	01051463          	bne	a0,a6,ffffffffc0205a78 <stride_dequeue+0xab2>
ffffffffc0205a74:	1260106f          	j	ffffffffc0206b9a <stride_dequeue+0x1bd4>
ffffffffc0205a78:	0089b783          	ld	a5,8(s3)
ffffffffc0205a7c:	0109be03          	ld	t3,16(s3)
ffffffffc0205a80:	f442                	sd	a6,40(sp)
ffffffffc0205a82:	f03e                	sd	a5,32(sp)
ffffffffc0205a84:	040e0463          	beqz	t3,ffffffffc0205acc <stride_dequeue+0xb06>
ffffffffc0205a88:	85f2                	mv	a1,t3
ffffffffc0205a8a:	8546                	mv	a0,a7
ffffffffc0205a8c:	fc72                	sd	t3,56(sp)
ffffffffc0205a8e:	f846                	sd	a7,48(sp)
ffffffffc0205a90:	afaff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205a94:	7822                	ld	a6,40(sp)
ffffffffc0205a96:	78c2                	ld	a7,48(sp)
ffffffffc0205a98:	7e62                	ld	t3,56(sp)
ffffffffc0205a9a:	01051463          	bne	a0,a6,ffffffffc0205aa2 <stride_dequeue+0xadc>
ffffffffc0205a9e:	0e70106f          	j	ffffffffc0207384 <stride_dequeue+0x23be>
ffffffffc0205aa2:	010e3583          	ld	a1,16(t3)
ffffffffc0205aa6:	8546                	mv	a0,a7
ffffffffc0205aa8:	008e3b03          	ld	s6,8(t3)
ffffffffc0205aac:	f472                	sd	t3,40(sp)
ffffffffc0205aae:	b38ff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0205ab2:	7e22                	ld	t3,40(sp)
ffffffffc0205ab4:	016e3823          	sd	s6,16(t3)
ffffffffc0205ab8:	00ae3423          	sd	a0,8(t3)
ffffffffc0205abc:	010c2b03          	lw	s6,16(s8)
ffffffffc0205ac0:	e119                	bnez	a0,ffffffffc0205ac6 <stride_dequeue+0xb00>
ffffffffc0205ac2:	1c10106f          	j	ffffffffc0207482 <stride_dequeue+0x24bc>
ffffffffc0205ac6:	01c53023          	sd	t3,0(a0)
ffffffffc0205aca:	88f2                	mv	a7,t3
ffffffffc0205acc:	7782                	ld	a5,32(sp)
ffffffffc0205ace:	0119b423          	sd	a7,8(s3)
ffffffffc0205ad2:	00f9b823          	sd	a5,16(s3)
ffffffffc0205ad6:	0138b023          	sd	s3,0(a7)
ffffffffc0205ada:	67e2                	ld	a5,24(sp)
ffffffffc0205adc:	013a3423          	sd	s3,8(s4)
ffffffffc0205ae0:	00fa3823          	sd	a5,16(s4)
ffffffffc0205ae4:	0149b023          	sd	s4,0(s3)
ffffffffc0205ae8:	89da                	mv	s3,s6
ffffffffc0205aea:	67c2                	ld	a5,16(sp)
ffffffffc0205aec:	014db423          	sd	s4,8(s11)
ffffffffc0205af0:	00fdb823          	sd	a5,16(s11)
ffffffffc0205af4:	01ba3023          	sd	s11,0(s4)
ffffffffc0205af8:	fccff06f          	j	ffffffffc02052c4 <stride_dequeue+0x2fe>
ffffffffc0205afc:	008db783          	ld	a5,8(s11)
ffffffffc0205b00:	010db883          	ld	a7,16(s11)
ffffffffc0205b04:	e82a                	sd	a0,16(sp)
ffffffffc0205b06:	e43e                	sd	a5,8(sp)
ffffffffc0205b08:	0a088f63          	beqz	a7,ffffffffc0205bc6 <stride_dequeue+0xc00>
ffffffffc0205b0c:	85b2                	mv	a1,a2
ffffffffc0205b0e:	8546                	mv	a0,a7
ffffffffc0205b10:	f032                	sd	a2,32(sp)
ffffffffc0205b12:	ec46                	sd	a7,24(sp)
ffffffffc0205b14:	a76ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205b18:	6842                	ld	a6,16(sp)
ffffffffc0205b1a:	68e2                	ld	a7,24(sp)
ffffffffc0205b1c:	7602                	ld	a2,32(sp)
ffffffffc0205b1e:	150506e3          	beq	a0,a6,ffffffffc020646a <stride_dequeue+0x14a4>
ffffffffc0205b22:	661c                	ld	a5,8(a2)
ffffffffc0205b24:	01063983          	ld	s3,16(a2)
ffffffffc0205b28:	ec42                	sd	a6,24(sp)
ffffffffc0205b2a:	e83e                	sd	a5,16(sp)
ffffffffc0205b2c:	00099463          	bnez	s3,ffffffffc0205b34 <stride_dequeue+0xb6e>
ffffffffc0205b30:	4660106f          	j	ffffffffc0206f96 <stride_dequeue+0x1fd0>
ffffffffc0205b34:	8546                	mv	a0,a7
ffffffffc0205b36:	85ce                	mv	a1,s3
ffffffffc0205b38:	f432                	sd	a2,40(sp)
ffffffffc0205b3a:	f046                	sd	a7,32(sp)
ffffffffc0205b3c:	a4eff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205b40:	6862                	ld	a6,24(sp)
ffffffffc0205b42:	7882                	ld	a7,32(sp)
ffffffffc0205b44:	7622                	ld	a2,40(sp)
ffffffffc0205b46:	01051463          	bne	a0,a6,ffffffffc0205b4e <stride_dequeue+0xb88>
ffffffffc0205b4a:	0ae0106f          	j	ffffffffc0206bf8 <stride_dequeue+0x1c32>
ffffffffc0205b4e:	0089b783          	ld	a5,8(s3)
ffffffffc0205b52:	0109be03          	ld	t3,16(s3)
ffffffffc0205b56:	f042                	sd	a6,32(sp)
ffffffffc0205b58:	ec3e                	sd	a5,24(sp)
ffffffffc0205b5a:	040e0863          	beqz	t3,ffffffffc0205baa <stride_dequeue+0xbe4>
ffffffffc0205b5e:	85f2                	mv	a1,t3
ffffffffc0205b60:	8546                	mv	a0,a7
ffffffffc0205b62:	fc32                	sd	a2,56(sp)
ffffffffc0205b64:	f872                	sd	t3,48(sp)
ffffffffc0205b66:	f446                	sd	a7,40(sp)
ffffffffc0205b68:	a22ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205b6c:	7662                	ld	a2,56(sp)
ffffffffc0205b6e:	7802                	ld	a6,32(sp)
ffffffffc0205b70:	78a2                	ld	a7,40(sp)
ffffffffc0205b72:	f432                	sd	a2,40(sp)
ffffffffc0205b74:	7e42                	ld	t3,48(sp)
ffffffffc0205b76:	01051463          	bne	a0,a6,ffffffffc0205b7e <stride_dequeue+0xbb8>
ffffffffc0205b7a:	6ac0106f          	j	ffffffffc0207226 <stride_dequeue+0x2260>
ffffffffc0205b7e:	010e3583          	ld	a1,16(t3)
ffffffffc0205b82:	8546                	mv	a0,a7
ffffffffc0205b84:	008e3b03          	ld	s6,8(t3)
ffffffffc0205b88:	f072                	sd	t3,32(sp)
ffffffffc0205b8a:	a5cff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0205b8e:	7e02                	ld	t3,32(sp)
ffffffffc0205b90:	7622                	ld	a2,40(sp)
ffffffffc0205b92:	016e3823          	sd	s6,16(t3)
ffffffffc0205b96:	00ae3423          	sd	a0,8(t3)
ffffffffc0205b9a:	010c2b03          	lw	s6,16(s8)
ffffffffc0205b9e:	e119                	bnez	a0,ffffffffc0205ba4 <stride_dequeue+0xbde>
ffffffffc0205ba0:	1370106f          	j	ffffffffc02074d6 <stride_dequeue+0x2510>
ffffffffc0205ba4:	01c53023          	sd	t3,0(a0)
ffffffffc0205ba8:	88f2                	mv	a7,t3
ffffffffc0205baa:	67e2                	ld	a5,24(sp)
ffffffffc0205bac:	0119b423          	sd	a7,8(s3)
ffffffffc0205bb0:	00f9b823          	sd	a5,16(s3)
ffffffffc0205bb4:	0138b023          	sd	s3,0(a7)
ffffffffc0205bb8:	67c2                	ld	a5,16(sp)
ffffffffc0205bba:	01363423          	sd	s3,8(a2)
ffffffffc0205bbe:	ea1c                	sd	a5,16(a2)
ffffffffc0205bc0:	00c9b023          	sd	a2,0(s3)
ffffffffc0205bc4:	89da                	mv	s3,s6
ffffffffc0205bc6:	67a2                	ld	a5,8(sp)
ffffffffc0205bc8:	00cdb423          	sd	a2,8(s11)
ffffffffc0205bcc:	00fdb823          	sd	a5,16(s11)
ffffffffc0205bd0:	01b63023          	sd	s11,0(a2)
ffffffffc0205bd4:	849ff06f          	j	ffffffffc020541c <stride_dequeue+0x456>
ffffffffc0205bd8:	008cb783          	ld	a5,8(s9)
ffffffffc0205bdc:	010cb883          	ld	a7,16(s9)
ffffffffc0205be0:	ec2a                	sd	a0,24(sp)
ffffffffc0205be2:	e83e                	sd	a5,16(sp)
ffffffffc0205be4:	0a088963          	beqz	a7,ffffffffc0205c96 <stride_dequeue+0xcd0>
ffffffffc0205be8:	8546                	mv	a0,a7
ffffffffc0205bea:	85ee                	mv	a1,s11
ffffffffc0205bec:	f046                	sd	a7,32(sp)
ffffffffc0205bee:	99cff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205bf2:	6862                	ld	a6,24(sp)
ffffffffc0205bf4:	7882                	ld	a7,32(sp)
ffffffffc0205bf6:	7d050863          	beq	a0,a6,ffffffffc02063c6 <stride_dequeue+0x1400>
ffffffffc0205bfa:	008db783          	ld	a5,8(s11)
ffffffffc0205bfe:	010db983          	ld	s3,16(s11)
ffffffffc0205c02:	f042                	sd	a6,32(sp)
ffffffffc0205c04:	ec3e                	sd	a5,24(sp)
ffffffffc0205c06:	00099463          	bnez	s3,ffffffffc0205c0e <stride_dequeue+0xc48>
ffffffffc0205c0a:	3600106f          	j	ffffffffc0206f6a <stride_dequeue+0x1fa4>
ffffffffc0205c0e:	8546                	mv	a0,a7
ffffffffc0205c10:	85ce                	mv	a1,s3
ffffffffc0205c12:	f446                	sd	a7,40(sp)
ffffffffc0205c14:	976ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205c18:	7802                	ld	a6,32(sp)
ffffffffc0205c1a:	78a2                	ld	a7,40(sp)
ffffffffc0205c1c:	01051463          	bne	a0,a6,ffffffffc0205c24 <stride_dequeue+0xc5e>
ffffffffc0205c20:	71d0006f          	j	ffffffffc0206b3c <stride_dequeue+0x1b76>
ffffffffc0205c24:	0089b783          	ld	a5,8(s3)
ffffffffc0205c28:	0109be03          	ld	t3,16(s3)
ffffffffc0205c2c:	f442                	sd	a6,40(sp)
ffffffffc0205c2e:	f03e                	sd	a5,32(sp)
ffffffffc0205c30:	040e0463          	beqz	t3,ffffffffc0205c78 <stride_dequeue+0xcb2>
ffffffffc0205c34:	85f2                	mv	a1,t3
ffffffffc0205c36:	8546                	mv	a0,a7
ffffffffc0205c38:	fc72                	sd	t3,56(sp)
ffffffffc0205c3a:	f846                	sd	a7,48(sp)
ffffffffc0205c3c:	94eff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205c40:	7822                	ld	a6,40(sp)
ffffffffc0205c42:	78c2                	ld	a7,48(sp)
ffffffffc0205c44:	7e62                	ld	t3,56(sp)
ffffffffc0205c46:	01051463          	bne	a0,a6,ffffffffc0205c4e <stride_dequeue+0xc88>
ffffffffc0205c4a:	60a0106f          	j	ffffffffc0207254 <stride_dequeue+0x228e>
ffffffffc0205c4e:	010e3583          	ld	a1,16(t3)
ffffffffc0205c52:	8546                	mv	a0,a7
ffffffffc0205c54:	008e3b03          	ld	s6,8(t3)
ffffffffc0205c58:	f472                	sd	t3,40(sp)
ffffffffc0205c5a:	98cff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0205c5e:	7e22                	ld	t3,40(sp)
ffffffffc0205c60:	016e3823          	sd	s6,16(t3)
ffffffffc0205c64:	00ae3423          	sd	a0,8(t3)
ffffffffc0205c68:	010c2b03          	lw	s6,16(s8)
ffffffffc0205c6c:	e119                	bnez	a0,ffffffffc0205c72 <stride_dequeue+0xcac>
ffffffffc0205c6e:	0270106f          	j	ffffffffc0207494 <stride_dequeue+0x24ce>
ffffffffc0205c72:	01c53023          	sd	t3,0(a0)
ffffffffc0205c76:	88f2                	mv	a7,t3
ffffffffc0205c78:	7782                	ld	a5,32(sp)
ffffffffc0205c7a:	0119b423          	sd	a7,8(s3)
ffffffffc0205c7e:	00f9b823          	sd	a5,16(s3)
ffffffffc0205c82:	0138b023          	sd	s3,0(a7)
ffffffffc0205c86:	67e2                	ld	a5,24(sp)
ffffffffc0205c88:	013db423          	sd	s3,8(s11)
ffffffffc0205c8c:	00fdb823          	sd	a5,16(s11)
ffffffffc0205c90:	01b9b023          	sd	s11,0(s3)
ffffffffc0205c94:	89da                	mv	s3,s6
ffffffffc0205c96:	67c2                	ld	a5,16(sp)
ffffffffc0205c98:	01bcb423          	sd	s11,8(s9)
ffffffffc0205c9c:	00fcb823          	sd	a5,16(s9)
ffffffffc0205ca0:	019db023          	sd	s9,0(s11)
ffffffffc0205ca4:	8de6                	mv	s11,s9
ffffffffc0205ca6:	b9bd                	j	ffffffffc0205924 <stride_dequeue+0x95e>
ffffffffc0205ca8:	00893783          	ld	a5,8(s2)
ffffffffc0205cac:	01093883          	ld	a7,16(s2)
ffffffffc0205cb0:	f02a                	sd	a0,32(sp)
ffffffffc0205cb2:	ec3e                	sd	a5,24(sp)
ffffffffc0205cb4:	06088c63          	beqz	a7,ffffffffc0205d2c <stride_dequeue+0xd66>
ffffffffc0205cb8:	85c2                	mv	a1,a6
ffffffffc0205cba:	8546                	mv	a0,a7
ffffffffc0205cbc:	f842                	sd	a6,48(sp)
ffffffffc0205cbe:	f446                	sd	a7,40(sp)
ffffffffc0205cc0:	8caff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205cc4:	7302                	ld	t1,32(sp)
ffffffffc0205cc6:	78a2                	ld	a7,40(sp)
ffffffffc0205cc8:	7842                	ld	a6,48(sp)
ffffffffc0205cca:	2e650ee3          	beq	a0,t1,ffffffffc02067c6 <stride_dequeue+0x1800>
ffffffffc0205cce:	00883783          	ld	a5,8(a6)
ffffffffc0205cd2:	01083983          	ld	s3,16(a6)
ffffffffc0205cd6:	f41a                	sd	t1,40(sp)
ffffffffc0205cd8:	f03e                	sd	a5,32(sp)
ffffffffc0205cda:	64098ee3          	beqz	s3,ffffffffc0206b36 <stride_dequeue+0x1b70>
ffffffffc0205cde:	8546                	mv	a0,a7
ffffffffc0205ce0:	85ce                	mv	a1,s3
ffffffffc0205ce2:	fc42                	sd	a6,56(sp)
ffffffffc0205ce4:	f846                	sd	a7,48(sp)
ffffffffc0205ce6:	8a4ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205cea:	7322                	ld	t1,40(sp)
ffffffffc0205cec:	78c2                	ld	a7,48(sp)
ffffffffc0205cee:	7862                	ld	a6,56(sp)
ffffffffc0205cf0:	00651463          	bne	a0,t1,ffffffffc0205cf8 <stride_dequeue+0xd32>
ffffffffc0205cf4:	1e80106f          	j	ffffffffc0206edc <stride_dequeue+0x1f16>
ffffffffc0205cf8:	0109b583          	ld	a1,16(s3)
ffffffffc0205cfc:	0089bb03          	ld	s6,8(s3)
ffffffffc0205d00:	8546                	mv	a0,a7
ffffffffc0205d02:	f442                	sd	a6,40(sp)
ffffffffc0205d04:	8e2ff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0205d08:	00a9b423          	sd	a0,8(s3)
ffffffffc0205d0c:	0169b823          	sd	s6,16(s3)
ffffffffc0205d10:	7822                	ld	a6,40(sp)
ffffffffc0205d12:	010c2b03          	lw	s6,16(s8)
ffffffffc0205d16:	c119                	beqz	a0,ffffffffc0205d1c <stride_dequeue+0xd56>
ffffffffc0205d18:	01353023          	sd	s3,0(a0)
ffffffffc0205d1c:	7782                	ld	a5,32(sp)
ffffffffc0205d1e:	01383423          	sd	s3,8(a6)
ffffffffc0205d22:	00f83823          	sd	a5,16(a6)
ffffffffc0205d26:	0109b023          	sd	a6,0(s3)
ffffffffc0205d2a:	89da                	mv	s3,s6
ffffffffc0205d2c:	67e2                	ld	a5,24(sp)
ffffffffc0205d2e:	01093423          	sd	a6,8(s2)
ffffffffc0205d32:	00f93823          	sd	a5,16(s2)
ffffffffc0205d36:	01283023          	sd	s2,0(a6)
ffffffffc0205d3a:	bf0ff06f          	j	ffffffffc020512a <stride_dequeue+0x164>
ffffffffc0205d3e:	008cb783          	ld	a5,8(s9)
ffffffffc0205d42:	010cb983          	ld	s3,16(s9)
ffffffffc0205d46:	ec2a                	sd	a0,24(sp)
ffffffffc0205d48:	e83e                	sd	a5,16(sp)
ffffffffc0205d4a:	0a098763          	beqz	s3,ffffffffc0205df8 <stride_dequeue+0xe32>
ffffffffc0205d4e:	85d2                	mv	a1,s4
ffffffffc0205d50:	854e                	mv	a0,s3
ffffffffc0205d52:	838ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205d56:	6862                	ld	a6,24(sp)
ffffffffc0205d58:	3b050fe3          	beq	a0,a6,ffffffffc0206916 <stride_dequeue+0x1950>
ffffffffc0205d5c:	008a3783          	ld	a5,8(s4)
ffffffffc0205d60:	010a3303          	ld	t1,16(s4)
ffffffffc0205d64:	f042                	sd	a6,32(sp)
ffffffffc0205d66:	ec3e                	sd	a5,24(sp)
ffffffffc0205d68:	08030163          	beqz	t1,ffffffffc0205dea <stride_dequeue+0xe24>
ffffffffc0205d6c:	859a                	mv	a1,t1
ffffffffc0205d6e:	854e                	mv	a0,s3
ffffffffc0205d70:	f41a                	sd	t1,40(sp)
ffffffffc0205d72:	818ff0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205d76:	7802                	ld	a6,32(sp)
ffffffffc0205d78:	7322                	ld	t1,40(sp)
ffffffffc0205d7a:	01051463          	bne	a0,a6,ffffffffc0205d82 <stride_dequeue+0xdbc>
ffffffffc0205d7e:	3da0106f          	j	ffffffffc0207158 <stride_dequeue+0x2192>
ffffffffc0205d82:	00833783          	ld	a5,8(t1)
ffffffffc0205d86:	01033e03          	ld	t3,16(t1)
ffffffffc0205d8a:	fc42                	sd	a6,56(sp)
ffffffffc0205d8c:	f03e                	sd	a5,32(sp)
ffffffffc0205d8e:	040e0663          	beqz	t3,ffffffffc0205dda <stride_dequeue+0xe14>
ffffffffc0205d92:	85f2                	mv	a1,t3
ffffffffc0205d94:	854e                	mv	a0,s3
ffffffffc0205d96:	f81a                	sd	t1,48(sp)
ffffffffc0205d98:	f472                	sd	t3,40(sp)
ffffffffc0205d9a:	ff1fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205d9e:	7862                	ld	a6,56(sp)
ffffffffc0205da0:	7e22                	ld	t3,40(sp)
ffffffffc0205da2:	7342                	ld	t1,48(sp)
ffffffffc0205da4:	01051463          	bne	a0,a6,ffffffffc0205dac <stride_dequeue+0xde6>
ffffffffc0205da8:	0c90106f          	j	ffffffffc0207670 <stride_dequeue+0x26aa>
ffffffffc0205dac:	010e3583          	ld	a1,16(t3)
ffffffffc0205db0:	854e                	mv	a0,s3
ffffffffc0205db2:	008e3b03          	ld	s6,8(t3)
ffffffffc0205db6:	f81a                	sd	t1,48(sp)
ffffffffc0205db8:	f472                	sd	t3,40(sp)
ffffffffc0205dba:	82cff0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0205dbe:	7e22                	ld	t3,40(sp)
ffffffffc0205dc0:	7342                	ld	t1,48(sp)
ffffffffc0205dc2:	016e3823          	sd	s6,16(t3)
ffffffffc0205dc6:	00ae3423          	sd	a0,8(t3)
ffffffffc0205dca:	010c2b03          	lw	s6,16(s8)
ffffffffc0205dce:	e119                	bnez	a0,ffffffffc0205dd4 <stride_dequeue+0xe0e>
ffffffffc0205dd0:	32d0106f          	j	ffffffffc02078fc <stride_dequeue+0x2936>
ffffffffc0205dd4:	01c53023          	sd	t3,0(a0)
ffffffffc0205dd8:	89f2                	mv	s3,t3
ffffffffc0205dda:	7782                	ld	a5,32(sp)
ffffffffc0205ddc:	01333423          	sd	s3,8(t1)
ffffffffc0205de0:	00f33823          	sd	a5,16(t1)
ffffffffc0205de4:	0069b023          	sd	t1,0(s3)
ffffffffc0205de8:	899a                	mv	s3,t1
ffffffffc0205dea:	67e2                	ld	a5,24(sp)
ffffffffc0205dec:	013a3423          	sd	s3,8(s4)
ffffffffc0205df0:	00fa3823          	sd	a5,16(s4)
ffffffffc0205df4:	0149b023          	sd	s4,0(s3)
ffffffffc0205df8:	67c2                	ld	a5,16(sp)
ffffffffc0205dfa:	014cb423          	sd	s4,8(s9)
ffffffffc0205dfe:	89da                	mv	s3,s6
ffffffffc0205e00:	00fcb823          	sd	a5,16(s9)
ffffffffc0205e04:	019a3023          	sd	s9,0(s4)
ffffffffc0205e08:	f42ff06f          	j	ffffffffc020554a <stride_dequeue+0x584>
ffffffffc0205e0c:	661c                	ld	a5,8(a2)
ffffffffc0205e0e:	01063983          	ld	s3,16(a2)
ffffffffc0205e12:	e82a                	sd	a0,16(sp)
ffffffffc0205e14:	e43e                	sd	a5,8(sp)
ffffffffc0205e16:	0a098f63          	beqz	s3,ffffffffc0205ed4 <stride_dequeue+0xf0e>
ffffffffc0205e1a:	85d2                	mv	a1,s4
ffffffffc0205e1c:	854e                	mv	a0,s3
ffffffffc0205e1e:	ec32                	sd	a2,24(sp)
ffffffffc0205e20:	f6bfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205e24:	6842                	ld	a6,16(sp)
ffffffffc0205e26:	6662                	ld	a2,24(sp)
ffffffffc0205e28:	39050de3          	beq	a0,a6,ffffffffc02069c2 <stride_dequeue+0x19fc>
ffffffffc0205e2c:	008a3783          	ld	a5,8(s4)
ffffffffc0205e30:	010a3303          	ld	t1,16(s4)
ffffffffc0205e34:	ec42                	sd	a6,24(sp)
ffffffffc0205e36:	e83e                	sd	a5,16(sp)
ffffffffc0205e38:	08030763          	beqz	t1,ffffffffc0205ec6 <stride_dequeue+0xf00>
ffffffffc0205e3c:	859a                	mv	a1,t1
ffffffffc0205e3e:	854e                	mv	a0,s3
ffffffffc0205e40:	f432                	sd	a2,40(sp)
ffffffffc0205e42:	f01a                	sd	t1,32(sp)
ffffffffc0205e44:	f47fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205e48:	6862                	ld	a6,24(sp)
ffffffffc0205e4a:	7302                	ld	t1,32(sp)
ffffffffc0205e4c:	7622                	ld	a2,40(sp)
ffffffffc0205e4e:	01051463          	bne	a0,a6,ffffffffc0205e56 <stride_dequeue+0xe90>
ffffffffc0205e52:	5060106f          	j	ffffffffc0207358 <stride_dequeue+0x2392>
ffffffffc0205e56:	00833783          	ld	a5,8(t1)
ffffffffc0205e5a:	01033e03          	ld	t3,16(t1)
ffffffffc0205e5e:	fc42                	sd	a6,56(sp)
ffffffffc0205e60:	ec3e                	sd	a5,24(sp)
ffffffffc0205e62:	040e0a63          	beqz	t3,ffffffffc0205eb6 <stride_dequeue+0xef0>
ffffffffc0205e66:	85f2                	mv	a1,t3
ffffffffc0205e68:	854e                	mv	a0,s3
ffffffffc0205e6a:	f81a                	sd	t1,48(sp)
ffffffffc0205e6c:	f432                	sd	a2,40(sp)
ffffffffc0205e6e:	f072                	sd	t3,32(sp)
ffffffffc0205e70:	f1bfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205e74:	7862                	ld	a6,56(sp)
ffffffffc0205e76:	7e02                	ld	t3,32(sp)
ffffffffc0205e78:	7622                	ld	a2,40(sp)
ffffffffc0205e7a:	7342                	ld	t1,48(sp)
ffffffffc0205e7c:	01051463          	bne	a0,a6,ffffffffc0205e84 <stride_dequeue+0xebe>
ffffffffc0205e80:	1e10106f          	j	ffffffffc0207860 <stride_dequeue+0x289a>
ffffffffc0205e84:	010e3583          	ld	a1,16(t3)
ffffffffc0205e88:	854e                	mv	a0,s3
ffffffffc0205e8a:	008e3b03          	ld	s6,8(t3)
ffffffffc0205e8e:	f81a                	sd	t1,48(sp)
ffffffffc0205e90:	f432                	sd	a2,40(sp)
ffffffffc0205e92:	f072                	sd	t3,32(sp)
ffffffffc0205e94:	f53fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0205e98:	7e02                	ld	t3,32(sp)
ffffffffc0205e9a:	7622                	ld	a2,40(sp)
ffffffffc0205e9c:	7342                	ld	t1,48(sp)
ffffffffc0205e9e:	016e3823          	sd	s6,16(t3)
ffffffffc0205ea2:	00ae3423          	sd	a0,8(t3)
ffffffffc0205ea6:	010c2b03          	lw	s6,16(s8)
ffffffffc0205eaa:	e119                	bnez	a0,ffffffffc0205eb0 <stride_dequeue+0xeea>
ffffffffc0205eac:	22d0106f          	j	ffffffffc02078d8 <stride_dequeue+0x2912>
ffffffffc0205eb0:	01c53023          	sd	t3,0(a0)
ffffffffc0205eb4:	89f2                	mv	s3,t3
ffffffffc0205eb6:	67e2                	ld	a5,24(sp)
ffffffffc0205eb8:	01333423          	sd	s3,8(t1)
ffffffffc0205ebc:	00f33823          	sd	a5,16(t1)
ffffffffc0205ec0:	0069b023          	sd	t1,0(s3)
ffffffffc0205ec4:	899a                	mv	s3,t1
ffffffffc0205ec6:	67c2                	ld	a5,16(sp)
ffffffffc0205ec8:	013a3423          	sd	s3,8(s4)
ffffffffc0205ecc:	00fa3823          	sd	a5,16(s4)
ffffffffc0205ed0:	0149b023          	sd	s4,0(s3)
ffffffffc0205ed4:	67a2                	ld	a5,8(sp)
ffffffffc0205ed6:	01463423          	sd	s4,8(a2)
ffffffffc0205eda:	89da                	mv	s3,s6
ffffffffc0205edc:	ea1c                	sd	a5,16(a2)
ffffffffc0205ede:	00ca3023          	sd	a2,0(s4)
ffffffffc0205ee2:	8a32                	mv	s4,a2
ffffffffc0205ee4:	f80ff06f          	j	ffffffffc0205664 <stride_dequeue+0x69e>
ffffffffc0205ee8:	008a3783          	ld	a5,8(s4)
ffffffffc0205eec:	010a3983          	ld	s3,16(s4)
ffffffffc0205ef0:	ec2a                	sd	a0,24(sp)
ffffffffc0205ef2:	e83e                	sd	a5,16(sp)
ffffffffc0205ef4:	0a098763          	beqz	s3,ffffffffc0205fa2 <stride_dequeue+0xfdc>
ffffffffc0205ef8:	85e6                	mv	a1,s9
ffffffffc0205efa:	854e                	mv	a0,s3
ffffffffc0205efc:	e8ffe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205f00:	6862                	ld	a6,24(sp)
ffffffffc0205f02:	270505e3          	beq	a0,a6,ffffffffc020696c <stride_dequeue+0x19a6>
ffffffffc0205f06:	008cb783          	ld	a5,8(s9)
ffffffffc0205f0a:	010cb303          	ld	t1,16(s9)
ffffffffc0205f0e:	f042                	sd	a6,32(sp)
ffffffffc0205f10:	ec3e                	sd	a5,24(sp)
ffffffffc0205f12:	08030163          	beqz	t1,ffffffffc0205f94 <stride_dequeue+0xfce>
ffffffffc0205f16:	859a                	mv	a1,t1
ffffffffc0205f18:	854e                	mv	a0,s3
ffffffffc0205f1a:	f41a                	sd	t1,40(sp)
ffffffffc0205f1c:	e6ffe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205f20:	7802                	ld	a6,32(sp)
ffffffffc0205f22:	7322                	ld	t1,40(sp)
ffffffffc0205f24:	01051463          	bne	a0,a6,ffffffffc0205f2c <stride_dequeue+0xf66>
ffffffffc0205f28:	4080106f          	j	ffffffffc0207330 <stride_dequeue+0x236a>
ffffffffc0205f2c:	00833783          	ld	a5,8(t1)
ffffffffc0205f30:	01033e03          	ld	t3,16(t1)
ffffffffc0205f34:	fc42                	sd	a6,56(sp)
ffffffffc0205f36:	f03e                	sd	a5,32(sp)
ffffffffc0205f38:	040e0663          	beqz	t3,ffffffffc0205f84 <stride_dequeue+0xfbe>
ffffffffc0205f3c:	85f2                	mv	a1,t3
ffffffffc0205f3e:	854e                	mv	a0,s3
ffffffffc0205f40:	f81a                	sd	t1,48(sp)
ffffffffc0205f42:	f472                	sd	t3,40(sp)
ffffffffc0205f44:	e47fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205f48:	7862                	ld	a6,56(sp)
ffffffffc0205f4a:	7e22                	ld	t3,40(sp)
ffffffffc0205f4c:	7342                	ld	t1,48(sp)
ffffffffc0205f4e:	01051463          	bne	a0,a6,ffffffffc0205f56 <stride_dequeue+0xf90>
ffffffffc0205f52:	6160106f          	j	ffffffffc0207568 <stride_dequeue+0x25a2>
ffffffffc0205f56:	010e3583          	ld	a1,16(t3)
ffffffffc0205f5a:	854e                	mv	a0,s3
ffffffffc0205f5c:	008e3b03          	ld	s6,8(t3)
ffffffffc0205f60:	f81a                	sd	t1,48(sp)
ffffffffc0205f62:	f472                	sd	t3,40(sp)
ffffffffc0205f64:	e83fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0205f68:	7e22                	ld	t3,40(sp)
ffffffffc0205f6a:	7342                	ld	t1,48(sp)
ffffffffc0205f6c:	016e3823          	sd	s6,16(t3)
ffffffffc0205f70:	00ae3423          	sd	a0,8(t3)
ffffffffc0205f74:	010c2b03          	lw	s6,16(s8)
ffffffffc0205f78:	e119                	bnez	a0,ffffffffc0205f7e <stride_dequeue+0xfb8>
ffffffffc0205f7a:	1b30106f          	j	ffffffffc020792c <stride_dequeue+0x2966>
ffffffffc0205f7e:	01c53023          	sd	t3,0(a0)
ffffffffc0205f82:	89f2                	mv	s3,t3
ffffffffc0205f84:	7782                	ld	a5,32(sp)
ffffffffc0205f86:	01333423          	sd	s3,8(t1)
ffffffffc0205f8a:	00f33823          	sd	a5,16(t1)
ffffffffc0205f8e:	0069b023          	sd	t1,0(s3)
ffffffffc0205f92:	899a                	mv	s3,t1
ffffffffc0205f94:	67e2                	ld	a5,24(sp)
ffffffffc0205f96:	013cb423          	sd	s3,8(s9)
ffffffffc0205f9a:	00fcb823          	sd	a5,16(s9)
ffffffffc0205f9e:	0199b023          	sd	s9,0(s3)
ffffffffc0205fa2:	67c2                	ld	a5,16(sp)
ffffffffc0205fa4:	019a3423          	sd	s9,8(s4)
ffffffffc0205fa8:	89da                	mv	s3,s6
ffffffffc0205faa:	00fa3823          	sd	a5,16(s4)
ffffffffc0205fae:	014cb023          	sd	s4,0(s9)
ffffffffc0205fb2:	8cd2                	mv	s9,s4
ffffffffc0205fb4:	faeff06f          	j	ffffffffc0205762 <stride_dequeue+0x79c>
ffffffffc0205fb8:	0088b783          	ld	a5,8(a7)
ffffffffc0205fbc:	0108b983          	ld	s3,16(a7)
ffffffffc0205fc0:	f02a                	sd	a0,32(sp)
ffffffffc0205fc2:	ec3e                	sd	a5,24(sp)
ffffffffc0205fc4:	06098e63          	beqz	s3,ffffffffc0206040 <stride_dequeue+0x107a>
ffffffffc0205fc8:	85e6                	mv	a1,s9
ffffffffc0205fca:	854e                	mv	a0,s3
ffffffffc0205fcc:	f446                	sd	a7,40(sp)
ffffffffc0205fce:	dbdfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205fd2:	7302                	ld	t1,32(sp)
ffffffffc0205fd4:	78a2                	ld	a7,40(sp)
ffffffffc0205fd6:	486503e3          	beq	a0,t1,ffffffffc0206c5c <stride_dequeue+0x1c96>
ffffffffc0205fda:	008cb783          	ld	a5,8(s9)
ffffffffc0205fde:	010cbe03          	ld	t3,16(s9)
ffffffffc0205fe2:	f41a                	sd	t1,40(sp)
ffffffffc0205fe4:	f03e                	sd	a5,32(sp)
ffffffffc0205fe6:	040e0663          	beqz	t3,ffffffffc0206032 <stride_dequeue+0x106c>
ffffffffc0205fea:	85f2                	mv	a1,t3
ffffffffc0205fec:	854e                	mv	a0,s3
ffffffffc0205fee:	fc46                	sd	a7,56(sp)
ffffffffc0205ff0:	f872                	sd	t3,48(sp)
ffffffffc0205ff2:	d99fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0205ff6:	7322                	ld	t1,40(sp)
ffffffffc0205ff8:	7e42                	ld	t3,48(sp)
ffffffffc0205ffa:	78e2                	ld	a7,56(sp)
ffffffffc0205ffc:	00651463          	bne	a0,t1,ffffffffc0206004 <stride_dequeue+0x103e>
ffffffffc0206000:	3040106f          	j	ffffffffc0207304 <stride_dequeue+0x233e>
ffffffffc0206004:	010e3583          	ld	a1,16(t3)
ffffffffc0206008:	854e                	mv	a0,s3
ffffffffc020600a:	008e3b03          	ld	s6,8(t3)
ffffffffc020600e:	f846                	sd	a7,48(sp)
ffffffffc0206010:	f472                	sd	t3,40(sp)
ffffffffc0206012:	dd5fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206016:	7e22                	ld	t3,40(sp)
ffffffffc0206018:	78c2                	ld	a7,48(sp)
ffffffffc020601a:	016e3823          	sd	s6,16(t3)
ffffffffc020601e:	00ae3423          	sd	a0,8(t3)
ffffffffc0206022:	010c2b03          	lw	s6,16(s8)
ffffffffc0206026:	e119                	bnez	a0,ffffffffc020602c <stride_dequeue+0x1066>
ffffffffc0206028:	4540106f          	j	ffffffffc020747c <stride_dequeue+0x24b6>
ffffffffc020602c:	01c53023          	sd	t3,0(a0)
ffffffffc0206030:	89f2                	mv	s3,t3
ffffffffc0206032:	7782                	ld	a5,32(sp)
ffffffffc0206034:	013cb423          	sd	s3,8(s9)
ffffffffc0206038:	00fcb823          	sd	a5,16(s9)
ffffffffc020603c:	0199b023          	sd	s9,0(s3)
ffffffffc0206040:	67e2                	ld	a5,24(sp)
ffffffffc0206042:	0198b423          	sd	s9,8(a7)
ffffffffc0206046:	89da                	mv	s3,s6
ffffffffc0206048:	00f8b823          	sd	a5,16(a7)
ffffffffc020604c:	011cb023          	sd	a7,0(s9)
ffffffffc0206050:	8cc6                	mv	s9,a7
ffffffffc0206052:	fdeff06f          	j	ffffffffc0205830 <stride_dequeue+0x86a>
ffffffffc0206056:	008cb783          	ld	a5,8(s9)
ffffffffc020605a:	010cb983          	ld	s3,16(s9)
ffffffffc020605e:	f02a                	sd	a0,32(sp)
ffffffffc0206060:	ec3e                	sd	a5,24(sp)
ffffffffc0206062:	06098e63          	beqz	s3,ffffffffc02060de <stride_dequeue+0x1118>
ffffffffc0206066:	85c2                	mv	a1,a6
ffffffffc0206068:	854e                	mv	a0,s3
ffffffffc020606a:	f442                	sd	a6,40(sp)
ffffffffc020606c:	d1ffe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206070:	7302                	ld	t1,32(sp)
ffffffffc0206072:	7822                	ld	a6,40(sp)
ffffffffc0206074:	446506e3          	beq	a0,t1,ffffffffc0206cc0 <stride_dequeue+0x1cfa>
ffffffffc0206078:	00883783          	ld	a5,8(a6)
ffffffffc020607c:	01083e03          	ld	t3,16(a6)
ffffffffc0206080:	f41a                	sd	t1,40(sp)
ffffffffc0206082:	f03e                	sd	a5,32(sp)
ffffffffc0206084:	040e0663          	beqz	t3,ffffffffc02060d0 <stride_dequeue+0x110a>
ffffffffc0206088:	85f2                	mv	a1,t3
ffffffffc020608a:	854e                	mv	a0,s3
ffffffffc020608c:	fc42                	sd	a6,56(sp)
ffffffffc020608e:	f872                	sd	t3,48(sp)
ffffffffc0206090:	cfbfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206094:	7322                	ld	t1,40(sp)
ffffffffc0206096:	7e42                	ld	t3,48(sp)
ffffffffc0206098:	7862                	ld	a6,56(sp)
ffffffffc020609a:	00651463          	bne	a0,t1,ffffffffc02060a2 <stride_dequeue+0x10dc>
ffffffffc020609e:	20e0106f          	j	ffffffffc02072ac <stride_dequeue+0x22e6>
ffffffffc02060a2:	010e3583          	ld	a1,16(t3)
ffffffffc02060a6:	854e                	mv	a0,s3
ffffffffc02060a8:	008e3b03          	ld	s6,8(t3)
ffffffffc02060ac:	f842                	sd	a6,48(sp)
ffffffffc02060ae:	f472                	sd	t3,40(sp)
ffffffffc02060b0:	d37fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02060b4:	7e22                	ld	t3,40(sp)
ffffffffc02060b6:	7842                	ld	a6,48(sp)
ffffffffc02060b8:	016e3823          	sd	s6,16(t3)
ffffffffc02060bc:	00ae3423          	sd	a0,8(t3)
ffffffffc02060c0:	010c2b03          	lw	s6,16(s8)
ffffffffc02060c4:	e119                	bnez	a0,ffffffffc02060ca <stride_dequeue+0x1104>
ffffffffc02060c6:	3c80106f          	j	ffffffffc020748e <stride_dequeue+0x24c8>
ffffffffc02060ca:	01c53023          	sd	t3,0(a0)
ffffffffc02060ce:	89f2                	mv	s3,t3
ffffffffc02060d0:	7782                	ld	a5,32(sp)
ffffffffc02060d2:	01383423          	sd	s3,8(a6)
ffffffffc02060d6:	00f83823          	sd	a5,16(a6)
ffffffffc02060da:	0109b023          	sd	a6,0(s3)
ffffffffc02060de:	67e2                	ld	a5,24(sp)
ffffffffc02060e0:	010cb423          	sd	a6,8(s9)
ffffffffc02060e4:	89da                	mv	s3,s6
ffffffffc02060e6:	00fcb823          	sd	a5,16(s9)
ffffffffc02060ea:	01983023          	sd	s9,0(a6)
ffffffffc02060ee:	829ff06f          	j	ffffffffc0205916 <stride_dequeue+0x950>
ffffffffc02060f2:	008db783          	ld	a5,8(s11)
ffffffffc02060f6:	010db983          	ld	s3,16(s11)
ffffffffc02060fa:	f02a                	sd	a0,32(sp)
ffffffffc02060fc:	ec3e                	sd	a5,24(sp)
ffffffffc02060fe:	06098e63          	beqz	s3,ffffffffc020617a <stride_dequeue+0x11b4>
ffffffffc0206102:	85c2                	mv	a1,a6
ffffffffc0206104:	854e                	mv	a0,s3
ffffffffc0206106:	f442                	sd	a6,40(sp)
ffffffffc0206108:	c83fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020610c:	7302                	ld	t1,32(sp)
ffffffffc020610e:	7822                	ld	a6,40(sp)
ffffffffc0206110:	466506e3          	beq	a0,t1,ffffffffc0206d7c <stride_dequeue+0x1db6>
ffffffffc0206114:	00883783          	ld	a5,8(a6)
ffffffffc0206118:	01083e03          	ld	t3,16(a6)
ffffffffc020611c:	f41a                	sd	t1,40(sp)
ffffffffc020611e:	f03e                	sd	a5,32(sp)
ffffffffc0206120:	040e0663          	beqz	t3,ffffffffc020616c <stride_dequeue+0x11a6>
ffffffffc0206124:	85f2                	mv	a1,t3
ffffffffc0206126:	854e                	mv	a0,s3
ffffffffc0206128:	fc42                	sd	a6,56(sp)
ffffffffc020612a:	f872                	sd	t3,48(sp)
ffffffffc020612c:	c5ffe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206130:	7322                	ld	t1,40(sp)
ffffffffc0206132:	7e42                	ld	t3,48(sp)
ffffffffc0206134:	7862                	ld	a6,56(sp)
ffffffffc0206136:	00651463          	bne	a0,t1,ffffffffc020613e <stride_dequeue+0x1178>
ffffffffc020613a:	7490006f          	j	ffffffffc0207082 <stride_dequeue+0x20bc>
ffffffffc020613e:	010e3583          	ld	a1,16(t3)
ffffffffc0206142:	854e                	mv	a0,s3
ffffffffc0206144:	008e3b03          	ld	s6,8(t3)
ffffffffc0206148:	f842                	sd	a6,48(sp)
ffffffffc020614a:	f472                	sd	t3,40(sp)
ffffffffc020614c:	c9bfe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206150:	7e22                	ld	t3,40(sp)
ffffffffc0206152:	7842                	ld	a6,48(sp)
ffffffffc0206154:	016e3823          	sd	s6,16(t3)
ffffffffc0206158:	00ae3423          	sd	a0,8(t3)
ffffffffc020615c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206160:	e119                	bnez	a0,ffffffffc0206166 <stride_dequeue+0x11a0>
ffffffffc0206162:	3260106f          	j	ffffffffc0207488 <stride_dequeue+0x24c2>
ffffffffc0206166:	01c53023          	sd	t3,0(a0)
ffffffffc020616a:	89f2                	mv	s3,t3
ffffffffc020616c:	7782                	ld	a5,32(sp)
ffffffffc020616e:	01383423          	sd	s3,8(a6)
ffffffffc0206172:	00f83823          	sd	a5,16(a6)
ffffffffc0206176:	0109b023          	sd	a6,0(s3)
ffffffffc020617a:	67e2                	ld	a5,24(sp)
ffffffffc020617c:	010db423          	sd	a6,8(s11)
ffffffffc0206180:	89da                	mv	s3,s6
ffffffffc0206182:	00fdb823          	sd	a5,16(s11)
ffffffffc0206186:	01b83023          	sd	s11,0(a6)
ffffffffc020618a:	92aff06f          	j	ffffffffc02052b4 <stride_dequeue+0x2ee>
ffffffffc020618e:	008db783          	ld	a5,8(s11)
ffffffffc0206192:	010db983          	ld	s3,16(s11)
ffffffffc0206196:	ec2a                	sd	a0,24(sp)
ffffffffc0206198:	e83e                	sd	a5,16(sp)
ffffffffc020619a:	08098263          	beqz	s3,ffffffffc020621e <stride_dequeue+0x1258>
ffffffffc020619e:	85c2                	mv	a1,a6
ffffffffc02061a0:	854e                	mv	a0,s3
ffffffffc02061a2:	f432                	sd	a2,40(sp)
ffffffffc02061a4:	f042                	sd	a6,32(sp)
ffffffffc02061a6:	be5fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02061aa:	6362                	ld	t1,24(sp)
ffffffffc02061ac:	7802                	ld	a6,32(sp)
ffffffffc02061ae:	7622                	ld	a2,40(sp)
ffffffffc02061b0:	426505e3          	beq	a0,t1,ffffffffc0206dda <stride_dequeue+0x1e14>
ffffffffc02061b4:	00883783          	ld	a5,8(a6)
ffffffffc02061b8:	01083e03          	ld	t3,16(a6)
ffffffffc02061bc:	f01a                	sd	t1,32(sp)
ffffffffc02061be:	ec3e                	sd	a5,24(sp)
ffffffffc02061c0:	040e0863          	beqz	t3,ffffffffc0206210 <stride_dequeue+0x124a>
ffffffffc02061c4:	85f2                	mv	a1,t3
ffffffffc02061c6:	854e                	mv	a0,s3
ffffffffc02061c8:	fc42                	sd	a6,56(sp)
ffffffffc02061ca:	f832                	sd	a2,48(sp)
ffffffffc02061cc:	f472                	sd	t3,40(sp)
ffffffffc02061ce:	bbdfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02061d2:	7302                	ld	t1,32(sp)
ffffffffc02061d4:	7e22                	ld	t3,40(sp)
ffffffffc02061d6:	7642                	ld	a2,48(sp)
ffffffffc02061d8:	7862                	ld	a6,56(sp)
ffffffffc02061da:	60650fe3          	beq	a0,t1,ffffffffc0206ff8 <stride_dequeue+0x2032>
ffffffffc02061de:	010e3583          	ld	a1,16(t3)
ffffffffc02061e2:	854e                	mv	a0,s3
ffffffffc02061e4:	008e3b03          	ld	s6,8(t3)
ffffffffc02061e8:	f842                	sd	a6,48(sp)
ffffffffc02061ea:	f432                	sd	a2,40(sp)
ffffffffc02061ec:	f072                	sd	t3,32(sp)
ffffffffc02061ee:	bf9fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02061f2:	7e02                	ld	t3,32(sp)
ffffffffc02061f4:	7622                	ld	a2,40(sp)
ffffffffc02061f6:	7842                	ld	a6,48(sp)
ffffffffc02061f8:	016e3823          	sd	s6,16(t3)
ffffffffc02061fc:	00ae3423          	sd	a0,8(t3)
ffffffffc0206200:	010c2b03          	lw	s6,16(s8)
ffffffffc0206204:	e119                	bnez	a0,ffffffffc020620a <stride_dequeue+0x1244>
ffffffffc0206206:	2d60106f          	j	ffffffffc02074dc <stride_dequeue+0x2516>
ffffffffc020620a:	01c53023          	sd	t3,0(a0)
ffffffffc020620e:	89f2                	mv	s3,t3
ffffffffc0206210:	67e2                	ld	a5,24(sp)
ffffffffc0206212:	01383423          	sd	s3,8(a6)
ffffffffc0206216:	00f83823          	sd	a5,16(a6)
ffffffffc020621a:	0109b023          	sd	a6,0(s3)
ffffffffc020621e:	67c2                	ld	a5,16(sp)
ffffffffc0206220:	010db423          	sd	a6,8(s11)
ffffffffc0206224:	89da                	mv	s3,s6
ffffffffc0206226:	00fdb823          	sd	a5,16(s11)
ffffffffc020622a:	01b83023          	sd	s11,0(a6)
ffffffffc020622e:	9e0ff06f          	j	ffffffffc020540e <stride_dequeue+0x448>
ffffffffc0206232:	00893703          	ld	a4,8(s2)
ffffffffc0206236:	01093983          	ld	s3,16(s2)
ffffffffc020623a:	f42a                	sd	a0,40(sp)
ffffffffc020623c:	f03a                	sd	a4,32(sp)
ffffffffc020623e:	02098e63          	beqz	s3,ffffffffc020627a <stride_dequeue+0x12b4>
ffffffffc0206242:	85be                	mv	a1,a5
ffffffffc0206244:	854e                	mv	a0,s3
ffffffffc0206246:	fc42                	sd	a6,56(sp)
ffffffffc0206248:	f83e                	sd	a5,48(sp)
ffffffffc020624a:	b41fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020624e:	7e22                	ld	t3,40(sp)
ffffffffc0206250:	77c2                	ld	a5,48(sp)
ffffffffc0206252:	7862                	ld	a6,56(sp)
ffffffffc0206254:	43c509e3          	beq	a0,t3,ffffffffc0206e86 <stride_dequeue+0x1ec0>
ffffffffc0206258:	6b8c                	ld	a1,16(a5)
ffffffffc020625a:	854e                	mv	a0,s3
ffffffffc020625c:	0087bb03          	ld	s6,8(a5)
ffffffffc0206260:	f842                	sd	a6,48(sp)
ffffffffc0206262:	f43e                	sd	a5,40(sp)
ffffffffc0206264:	b83fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206268:	77a2                	ld	a5,40(sp)
ffffffffc020626a:	7842                	ld	a6,48(sp)
ffffffffc020626c:	0167b823          	sd	s6,16(a5)
ffffffffc0206270:	e788                	sd	a0,8(a5)
ffffffffc0206272:	010c2b03          	lw	s6,16(s8)
ffffffffc0206276:	c111                	beqz	a0,ffffffffc020627a <stride_dequeue+0x12b4>
ffffffffc0206278:	e11c                	sd	a5,0(a0)
ffffffffc020627a:	7702                	ld	a4,32(sp)
ffffffffc020627c:	00f93423          	sd	a5,8(s2)
ffffffffc0206280:	89da                	mv	s3,s6
ffffffffc0206282:	00e93823          	sd	a4,16(s2)
ffffffffc0206286:	0127b023          	sd	s2,0(a5)
ffffffffc020628a:	e91fe06f          	j	ffffffffc020511a <stride_dequeue+0x154>
ffffffffc020628e:	008a3783          	ld	a5,8(s4)
ffffffffc0206292:	010a3983          	ld	s3,16(s4)
ffffffffc0206296:	ec2a                	sd	a0,24(sp)
ffffffffc0206298:	e83e                	sd	a5,16(sp)
ffffffffc020629a:	5a098ce3          	beqz	s3,ffffffffc0207052 <stride_dequeue+0x208c>
ffffffffc020629e:	85a6                	mv	a1,s1
ffffffffc02062a0:	854e                	mv	a0,s3
ffffffffc02062a2:	ae9fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02062a6:	67e2                	ld	a5,24(sp)
ffffffffc02062a8:	50f500e3          	beq	a0,a5,ffffffffc0206fa8 <stride_dequeue+0x1fe2>
ffffffffc02062ac:	f43e                	sd	a5,40(sp)
ffffffffc02062ae:	649c                	ld	a5,8(s1)
ffffffffc02062b0:	0104b883          	ld	a7,16(s1)
ffffffffc02062b4:	ec3e                	sd	a5,24(sp)
ffffffffc02062b6:	04088263          	beqz	a7,ffffffffc02062fa <stride_dequeue+0x1334>
ffffffffc02062ba:	85c6                	mv	a1,a7
ffffffffc02062bc:	854e                	mv	a0,s3
ffffffffc02062be:	f046                	sd	a7,32(sp)
ffffffffc02062c0:	acbfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02062c4:	77a2                	ld	a5,40(sp)
ffffffffc02062c6:	7882                	ld	a7,32(sp)
ffffffffc02062c8:	00f51463          	bne	a0,a5,ffffffffc02062d0 <stride_dequeue+0x130a>
ffffffffc02062cc:	2160106f          	j	ffffffffc02074e2 <stride_dequeue+0x251c>
ffffffffc02062d0:	0108b583          	ld	a1,16(a7)
ffffffffc02062d4:	854e                	mv	a0,s3
ffffffffc02062d6:	0088bb03          	ld	s6,8(a7)
ffffffffc02062da:	f046                	sd	a7,32(sp)
ffffffffc02062dc:	b0bfe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02062e0:	7882                	ld	a7,32(sp)
ffffffffc02062e2:	0168b823          	sd	s6,16(a7)
ffffffffc02062e6:	00a8b423          	sd	a0,8(a7)
ffffffffc02062ea:	010c2b03          	lw	s6,16(s8)
ffffffffc02062ee:	e119                	bnez	a0,ffffffffc02062f4 <stride_dequeue+0x132e>
ffffffffc02062f0:	56a0106f          	j	ffffffffc020785a <stride_dequeue+0x2894>
ffffffffc02062f4:	01153023          	sd	a7,0(a0)
ffffffffc02062f8:	89c6                	mv	s3,a7
ffffffffc02062fa:	67e2                	ld	a5,24(sp)
ffffffffc02062fc:	0134b423          	sd	s3,8(s1)
ffffffffc0206300:	e89c                	sd	a5,16(s1)
ffffffffc0206302:	0099b023          	sd	s1,0(s3)
ffffffffc0206306:	89a6                	mv	s3,s1
ffffffffc0206308:	67c2                	ld	a5,16(sp)
ffffffffc020630a:	013a3423          	sd	s3,8(s4)
ffffffffc020630e:	84d2                	mv	s1,s4
ffffffffc0206310:	00fa3823          	sd	a5,16(s4)
ffffffffc0206314:	0149b023          	sd	s4,0(s3)
ffffffffc0206318:	89da                	mv	s3,s6
ffffffffc020631a:	f00ff06f          	j	ffffffffc0205a1a <stride_dequeue+0xa54>
ffffffffc020631e:	0088b783          	ld	a5,8(a7)
ffffffffc0206322:	0108b983          	ld	s3,16(a7)
ffffffffc0206326:	f02a                	sd	a0,32(sp)
ffffffffc0206328:	ec3e                	sd	a5,24(sp)
ffffffffc020632a:	00099463          	bnez	s3,ffffffffc0206332 <stride_dequeue+0x136c>
ffffffffc020632e:	0d40106f          	j	ffffffffc0207402 <stride_dequeue+0x243c>
ffffffffc0206332:	85d2                	mv	a1,s4
ffffffffc0206334:	854e                	mv	a0,s3
ffffffffc0206336:	f446                	sd	a7,40(sp)
ffffffffc0206338:	a53fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020633c:	7302                	ld	t1,32(sp)
ffffffffc020633e:	78a2                	ld	a7,40(sp)
ffffffffc0206340:	00651463          	bne	a0,t1,ffffffffc0206348 <stride_dequeue+0x1382>
ffffffffc0206344:	06c0106f          	j	ffffffffc02073b0 <stride_dequeue+0x23ea>
ffffffffc0206348:	008a3783          	ld	a5,8(s4)
ffffffffc020634c:	010a3e03          	ld	t3,16(s4)
ffffffffc0206350:	fc1a                	sd	t1,56(sp)
ffffffffc0206352:	f03e                	sd	a5,32(sp)
ffffffffc0206354:	040e0663          	beqz	t3,ffffffffc02063a0 <stride_dequeue+0x13da>
ffffffffc0206358:	85f2                	mv	a1,t3
ffffffffc020635a:	854e                	mv	a0,s3
ffffffffc020635c:	f846                	sd	a7,48(sp)
ffffffffc020635e:	f472                	sd	t3,40(sp)
ffffffffc0206360:	a2bfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206364:	7362                	ld	t1,56(sp)
ffffffffc0206366:	7e22                	ld	t3,40(sp)
ffffffffc0206368:	78c2                	ld	a7,48(sp)
ffffffffc020636a:	00651463          	bne	a0,t1,ffffffffc0206372 <stride_dequeue+0x13ac>
ffffffffc020636e:	32e0106f          	j	ffffffffc020769c <stride_dequeue+0x26d6>
ffffffffc0206372:	010e3583          	ld	a1,16(t3)
ffffffffc0206376:	854e                	mv	a0,s3
ffffffffc0206378:	008e3b03          	ld	s6,8(t3)
ffffffffc020637c:	f846                	sd	a7,48(sp)
ffffffffc020637e:	f472                	sd	t3,40(sp)
ffffffffc0206380:	a67fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206384:	7e22                	ld	t3,40(sp)
ffffffffc0206386:	78c2                	ld	a7,48(sp)
ffffffffc0206388:	016e3823          	sd	s6,16(t3)
ffffffffc020638c:	00ae3423          	sd	a0,8(t3)
ffffffffc0206390:	010c2b03          	lw	s6,16(s8)
ffffffffc0206394:	e119                	bnez	a0,ffffffffc020639a <stride_dequeue+0x13d4>
ffffffffc0206396:	58a0106f          	j	ffffffffc0207920 <stride_dequeue+0x295a>
ffffffffc020639a:	01c53023          	sd	t3,0(a0)
ffffffffc020639e:	89f2                	mv	s3,t3
ffffffffc02063a0:	7782                	ld	a5,32(sp)
ffffffffc02063a2:	013a3423          	sd	s3,8(s4)
ffffffffc02063a6:	00fa3823          	sd	a5,16(s4)
ffffffffc02063aa:	0149b023          	sd	s4,0(s3)
ffffffffc02063ae:	89d2                	mv	s3,s4
ffffffffc02063b0:	67e2                	ld	a5,24(sp)
ffffffffc02063b2:	0138b423          	sd	s3,8(a7)
ffffffffc02063b6:	8a46                	mv	s4,a7
ffffffffc02063b8:	00f8b823          	sd	a5,16(a7)
ffffffffc02063bc:	0119b023          	sd	a7,0(s3)
ffffffffc02063c0:	89da                	mv	s3,s6
ffffffffc02063c2:	f28ff06f          	j	ffffffffc0205aea <stride_dequeue+0xb24>
ffffffffc02063c6:	0088b783          	ld	a5,8(a7)
ffffffffc02063ca:	0108b983          	ld	s3,16(a7)
ffffffffc02063ce:	f02a                	sd	a0,32(sp)
ffffffffc02063d0:	ec3e                	sd	a5,24(sp)
ffffffffc02063d2:	00099463          	bnez	s3,ffffffffc02063da <stride_dequeue+0x1414>
ffffffffc02063d6:	0320106f          	j	ffffffffc0207408 <stride_dequeue+0x2442>
ffffffffc02063da:	85ee                	mv	a1,s11
ffffffffc02063dc:	854e                	mv	a0,s3
ffffffffc02063de:	f446                	sd	a7,40(sp)
ffffffffc02063e0:	9abfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02063e4:	7302                	ld	t1,32(sp)
ffffffffc02063e6:	78a2                	ld	a7,40(sp)
ffffffffc02063e8:	466508e3          	beq	a0,t1,ffffffffc0207058 <stride_dequeue+0x2092>
ffffffffc02063ec:	008db783          	ld	a5,8(s11)
ffffffffc02063f0:	010dbe03          	ld	t3,16(s11)
ffffffffc02063f4:	fc1a                	sd	t1,56(sp)
ffffffffc02063f6:	f03e                	sd	a5,32(sp)
ffffffffc02063f8:	040e0663          	beqz	t3,ffffffffc0206444 <stride_dequeue+0x147e>
ffffffffc02063fc:	85f2                	mv	a1,t3
ffffffffc02063fe:	854e                	mv	a0,s3
ffffffffc0206400:	f846                	sd	a7,48(sp)
ffffffffc0206402:	f472                	sd	t3,40(sp)
ffffffffc0206404:	987fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206408:	7362                	ld	t1,56(sp)
ffffffffc020640a:	7e22                	ld	t3,40(sp)
ffffffffc020640c:	78c2                	ld	a7,48(sp)
ffffffffc020640e:	00651463          	bne	a0,t1,ffffffffc0206416 <stride_dequeue+0x1450>
ffffffffc0206412:	3120106f          	j	ffffffffc0207724 <stride_dequeue+0x275e>
ffffffffc0206416:	010e3583          	ld	a1,16(t3)
ffffffffc020641a:	854e                	mv	a0,s3
ffffffffc020641c:	008e3b03          	ld	s6,8(t3)
ffffffffc0206420:	f846                	sd	a7,48(sp)
ffffffffc0206422:	f472                	sd	t3,40(sp)
ffffffffc0206424:	9c3fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206428:	7e22                	ld	t3,40(sp)
ffffffffc020642a:	78c2                	ld	a7,48(sp)
ffffffffc020642c:	016e3823          	sd	s6,16(t3)
ffffffffc0206430:	00ae3423          	sd	a0,8(t3)
ffffffffc0206434:	010c2b03          	lw	s6,16(s8)
ffffffffc0206438:	e119                	bnez	a0,ffffffffc020643e <stride_dequeue+0x1478>
ffffffffc020643a:	51c0106f          	j	ffffffffc0207956 <stride_dequeue+0x2990>
ffffffffc020643e:	01c53023          	sd	t3,0(a0)
ffffffffc0206442:	89f2                	mv	s3,t3
ffffffffc0206444:	7782                	ld	a5,32(sp)
ffffffffc0206446:	013db423          	sd	s3,8(s11)
ffffffffc020644a:	00fdb823          	sd	a5,16(s11)
ffffffffc020644e:	01b9b023          	sd	s11,0(s3)
ffffffffc0206452:	89ee                	mv	s3,s11
ffffffffc0206454:	67e2                	ld	a5,24(sp)
ffffffffc0206456:	0138b423          	sd	s3,8(a7)
ffffffffc020645a:	8dc6                	mv	s11,a7
ffffffffc020645c:	00f8b823          	sd	a5,16(a7)
ffffffffc0206460:	0119b023          	sd	a7,0(s3)
ffffffffc0206464:	89da                	mv	s3,s6
ffffffffc0206466:	831ff06f          	j	ffffffffc0205c96 <stride_dequeue+0xcd0>
ffffffffc020646a:	0088b783          	ld	a5,8(a7)
ffffffffc020646e:	0108b983          	ld	s3,16(a7)
ffffffffc0206472:	ec2a                	sd	a0,24(sp)
ffffffffc0206474:	e83e                	sd	a5,16(sp)
ffffffffc0206476:	00099463          	bnez	s3,ffffffffc020647e <stride_dequeue+0x14b8>
ffffffffc020647a:	7a10006f          	j	ffffffffc020741a <stride_dequeue+0x2454>
ffffffffc020647e:	85b2                	mv	a1,a2
ffffffffc0206480:	854e                	mv	a0,s3
ffffffffc0206482:	f446                	sd	a7,40(sp)
ffffffffc0206484:	907fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206488:	6362                	ld	t1,24(sp)
ffffffffc020648a:	7602                	ld	a2,32(sp)
ffffffffc020648c:	78a2                	ld	a7,40(sp)
ffffffffc020648e:	426500e3          	beq	a0,t1,ffffffffc02070ae <stride_dequeue+0x20e8>
ffffffffc0206492:	661c                	ld	a5,8(a2)
ffffffffc0206494:	01063e03          	ld	t3,16(a2)
ffffffffc0206498:	fc1a                	sd	t1,56(sp)
ffffffffc020649a:	ec3e                	sd	a5,24(sp)
ffffffffc020649c:	040e0a63          	beqz	t3,ffffffffc02064f0 <stride_dequeue+0x152a>
ffffffffc02064a0:	85f2                	mv	a1,t3
ffffffffc02064a2:	854e                	mv	a0,s3
ffffffffc02064a4:	f846                	sd	a7,48(sp)
ffffffffc02064a6:	f432                	sd	a2,40(sp)
ffffffffc02064a8:	f072                	sd	t3,32(sp)
ffffffffc02064aa:	8e1fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02064ae:	7362                	ld	t1,56(sp)
ffffffffc02064b0:	7e02                	ld	t3,32(sp)
ffffffffc02064b2:	7622                	ld	a2,40(sp)
ffffffffc02064b4:	78c2                	ld	a7,48(sp)
ffffffffc02064b6:	00651463          	bne	a0,t1,ffffffffc02064be <stride_dequeue+0x14f8>
ffffffffc02064ba:	20e0106f          	j	ffffffffc02076c8 <stride_dequeue+0x2702>
ffffffffc02064be:	010e3583          	ld	a1,16(t3)
ffffffffc02064c2:	854e                	mv	a0,s3
ffffffffc02064c4:	008e3b03          	ld	s6,8(t3)
ffffffffc02064c8:	f846                	sd	a7,48(sp)
ffffffffc02064ca:	f432                	sd	a2,40(sp)
ffffffffc02064cc:	f072                	sd	t3,32(sp)
ffffffffc02064ce:	919fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02064d2:	7e02                	ld	t3,32(sp)
ffffffffc02064d4:	7622                	ld	a2,40(sp)
ffffffffc02064d6:	78c2                	ld	a7,48(sp)
ffffffffc02064d8:	016e3823          	sd	s6,16(t3)
ffffffffc02064dc:	00ae3423          	sd	a0,8(t3)
ffffffffc02064e0:	010c2b03          	lw	s6,16(s8)
ffffffffc02064e4:	e119                	bnez	a0,ffffffffc02064ea <stride_dequeue+0x1524>
ffffffffc02064e6:	4400106f          	j	ffffffffc0207926 <stride_dequeue+0x2960>
ffffffffc02064ea:	01c53023          	sd	t3,0(a0)
ffffffffc02064ee:	89f2                	mv	s3,t3
ffffffffc02064f0:	67e2                	ld	a5,24(sp)
ffffffffc02064f2:	01363423          	sd	s3,8(a2)
ffffffffc02064f6:	ea1c                	sd	a5,16(a2)
ffffffffc02064f8:	00c9b023          	sd	a2,0(s3)
ffffffffc02064fc:	89b2                	mv	s3,a2
ffffffffc02064fe:	67c2                	ld	a5,16(sp)
ffffffffc0206500:	0138b423          	sd	s3,8(a7)
ffffffffc0206504:	8646                	mv	a2,a7
ffffffffc0206506:	00f8b823          	sd	a5,16(a7)
ffffffffc020650a:	0119b023          	sd	a7,0(s3)
ffffffffc020650e:	89da                	mv	s3,s6
ffffffffc0206510:	eb6ff06f          	j	ffffffffc0205bc6 <stride_dequeue+0xc00>
ffffffffc0206514:	008cb783          	ld	a5,8(s9)
ffffffffc0206518:	010cb983          	ld	s3,16(s9)
ffffffffc020651c:	f02a                	sd	a0,32(sp)
ffffffffc020651e:	ec3e                	sd	a5,24(sp)
ffffffffc0206520:	00099463          	bnez	s3,ffffffffc0206528 <stride_dequeue+0x1562>
ffffffffc0206524:	6eb0006f          	j	ffffffffc020740e <stride_dequeue+0x2448>
ffffffffc0206528:	85c2                	mv	a1,a6
ffffffffc020652a:	854e                	mv	a0,s3
ffffffffc020652c:	f442                	sd	a6,40(sp)
ffffffffc020652e:	85dfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206532:	7302                	ld	t1,32(sp)
ffffffffc0206534:	7822                	ld	a6,40(sp)
ffffffffc0206536:	3e650ee3          	beq	a0,t1,ffffffffc0207132 <stride_dequeue+0x216c>
ffffffffc020653a:	00883783          	ld	a5,8(a6)
ffffffffc020653e:	01083e03          	ld	t3,16(a6)
ffffffffc0206542:	fc1a                	sd	t1,56(sp)
ffffffffc0206544:	f03e                	sd	a5,32(sp)
ffffffffc0206546:	040e0663          	beqz	t3,ffffffffc0206592 <stride_dequeue+0x15cc>
ffffffffc020654a:	85f2                	mv	a1,t3
ffffffffc020654c:	854e                	mv	a0,s3
ffffffffc020654e:	f842                	sd	a6,48(sp)
ffffffffc0206550:	f472                	sd	t3,40(sp)
ffffffffc0206552:	839fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206556:	7362                	ld	t1,56(sp)
ffffffffc0206558:	7e22                	ld	t3,40(sp)
ffffffffc020655a:	7842                	ld	a6,48(sp)
ffffffffc020655c:	00651463          	bne	a0,t1,ffffffffc0206564 <stride_dequeue+0x159e>
ffffffffc0206560:	2a20106f          	j	ffffffffc0207802 <stride_dequeue+0x283c>
ffffffffc0206564:	010e3583          	ld	a1,16(t3)
ffffffffc0206568:	854e                	mv	a0,s3
ffffffffc020656a:	008e3b03          	ld	s6,8(t3)
ffffffffc020656e:	f842                	sd	a6,48(sp)
ffffffffc0206570:	f472                	sd	t3,40(sp)
ffffffffc0206572:	875fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206576:	7e22                	ld	t3,40(sp)
ffffffffc0206578:	7842                	ld	a6,48(sp)
ffffffffc020657a:	016e3823          	sd	s6,16(t3)
ffffffffc020657e:	00ae3423          	sd	a0,8(t3)
ffffffffc0206582:	010c2b03          	lw	s6,16(s8)
ffffffffc0206586:	e119                	bnez	a0,ffffffffc020658c <stride_dequeue+0x15c6>
ffffffffc0206588:	35c0106f          	j	ffffffffc02078e4 <stride_dequeue+0x291e>
ffffffffc020658c:	01c53023          	sd	t3,0(a0)
ffffffffc0206590:	89f2                	mv	s3,t3
ffffffffc0206592:	7782                	ld	a5,32(sp)
ffffffffc0206594:	01383423          	sd	s3,8(a6)
ffffffffc0206598:	00f83823          	sd	a5,16(a6)
ffffffffc020659c:	0109b023          	sd	a6,0(s3)
ffffffffc02065a0:	89c2                	mv	s3,a6
ffffffffc02065a2:	67e2                	ld	a5,24(sp)
ffffffffc02065a4:	013cb423          	sd	s3,8(s9)
ffffffffc02065a8:	00fcb823          	sd	a5,16(s9)
ffffffffc02065ac:	0199b023          	sd	s9,0(s3)
ffffffffc02065b0:	89da                	mv	s3,s6
ffffffffc02065b2:	f89fe06f          	j	ffffffffc020553a <stride_dequeue+0x574>
ffffffffc02065b6:	661c                	ld	a5,8(a2)
ffffffffc02065b8:	01063983          	ld	s3,16(a2)
ffffffffc02065bc:	ec2a                	sd	a0,24(sp)
ffffffffc02065be:	e83e                	sd	a5,16(sp)
ffffffffc02065c0:	64098ae3          	beqz	s3,ffffffffc0207414 <stride_dequeue+0x244e>
ffffffffc02065c4:	85c2                	mv	a1,a6
ffffffffc02065c6:	854e                	mv	a0,s3
ffffffffc02065c8:	f432                	sd	a2,40(sp)
ffffffffc02065ca:	f042                	sd	a6,32(sp)
ffffffffc02065cc:	fbefe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02065d0:	6362                	ld	t1,24(sp)
ffffffffc02065d2:	7802                	ld	a6,32(sp)
ffffffffc02065d4:	7622                	ld	a2,40(sp)
ffffffffc02065d6:	326509e3          	beq	a0,t1,ffffffffc0207108 <stride_dequeue+0x2142>
ffffffffc02065da:	00883783          	ld	a5,8(a6)
ffffffffc02065de:	01083e03          	ld	t3,16(a6)
ffffffffc02065e2:	fc1a                	sd	t1,56(sp)
ffffffffc02065e4:	ec3e                	sd	a5,24(sp)
ffffffffc02065e6:	040e0a63          	beqz	t3,ffffffffc020663a <stride_dequeue+0x1674>
ffffffffc02065ea:	85f2                	mv	a1,t3
ffffffffc02065ec:	854e                	mv	a0,s3
ffffffffc02065ee:	f842                	sd	a6,48(sp)
ffffffffc02065f0:	f432                	sd	a2,40(sp)
ffffffffc02065f2:	f072                	sd	t3,32(sp)
ffffffffc02065f4:	f96fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02065f8:	7362                	ld	t1,56(sp)
ffffffffc02065fa:	7e02                	ld	t3,32(sp)
ffffffffc02065fc:	7622                	ld	a2,40(sp)
ffffffffc02065fe:	7842                	ld	a6,48(sp)
ffffffffc0206600:	00651463          	bne	a0,t1,ffffffffc0206608 <stride_dequeue+0x1642>
ffffffffc0206604:	1760106f          	j	ffffffffc020777a <stride_dequeue+0x27b4>
ffffffffc0206608:	010e3583          	ld	a1,16(t3)
ffffffffc020660c:	854e                	mv	a0,s3
ffffffffc020660e:	008e3b03          	ld	s6,8(t3)
ffffffffc0206612:	f842                	sd	a6,48(sp)
ffffffffc0206614:	f432                	sd	a2,40(sp)
ffffffffc0206616:	f072                	sd	t3,32(sp)
ffffffffc0206618:	fcefe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020661c:	7e02                	ld	t3,32(sp)
ffffffffc020661e:	7622                	ld	a2,40(sp)
ffffffffc0206620:	7842                	ld	a6,48(sp)
ffffffffc0206622:	016e3823          	sd	s6,16(t3)
ffffffffc0206626:	00ae3423          	sd	a0,8(t3)
ffffffffc020662a:	010c2b03          	lw	s6,16(s8)
ffffffffc020662e:	e119                	bnez	a0,ffffffffc0206634 <stride_dequeue+0x166e>
ffffffffc0206630:	32c0106f          	j	ffffffffc020795c <stride_dequeue+0x2996>
ffffffffc0206634:	01c53023          	sd	t3,0(a0)
ffffffffc0206638:	89f2                	mv	s3,t3
ffffffffc020663a:	67e2                	ld	a5,24(sp)
ffffffffc020663c:	01383423          	sd	s3,8(a6)
ffffffffc0206640:	00f83823          	sd	a5,16(a6)
ffffffffc0206644:	0109b023          	sd	a6,0(s3)
ffffffffc0206648:	89c2                	mv	s3,a6
ffffffffc020664a:	67c2                	ld	a5,16(sp)
ffffffffc020664c:	01363423          	sd	s3,8(a2)
ffffffffc0206650:	ea1c                	sd	a5,16(a2)
ffffffffc0206652:	00c9b023          	sd	a2,0(s3)
ffffffffc0206656:	89da                	mv	s3,s6
ffffffffc0206658:	ffffe06f          	j	ffffffffc0205656 <stride_dequeue+0x690>
ffffffffc020665c:	008a3783          	ld	a5,8(s4)
ffffffffc0206660:	010a3983          	ld	s3,16(s4)
ffffffffc0206664:	f02a                	sd	a0,32(sp)
ffffffffc0206666:	ec3e                	sd	a5,24(sp)
ffffffffc0206668:	5a098ce3          	beqz	s3,ffffffffc0207420 <stride_dequeue+0x245a>
ffffffffc020666c:	85c2                	mv	a1,a6
ffffffffc020666e:	854e                	mv	a0,s3
ffffffffc0206670:	f442                	sd	a6,40(sp)
ffffffffc0206672:	f18fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206676:	7302                	ld	t1,32(sp)
ffffffffc0206678:	7822                	ld	a6,40(sp)
ffffffffc020667a:	566501e3          	beq	a0,t1,ffffffffc02073dc <stride_dequeue+0x2416>
ffffffffc020667e:	00883783          	ld	a5,8(a6)
ffffffffc0206682:	01083e03          	ld	t3,16(a6)
ffffffffc0206686:	fc1a                	sd	t1,56(sp)
ffffffffc0206688:	f03e                	sd	a5,32(sp)
ffffffffc020668a:	040e0663          	beqz	t3,ffffffffc02066d6 <stride_dequeue+0x1710>
ffffffffc020668e:	85f2                	mv	a1,t3
ffffffffc0206690:	854e                	mv	a0,s3
ffffffffc0206692:	f842                	sd	a6,48(sp)
ffffffffc0206694:	f472                	sd	t3,40(sp)
ffffffffc0206696:	ef4fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020669a:	7362                	ld	t1,56(sp)
ffffffffc020669c:	7e22                	ld	t3,40(sp)
ffffffffc020669e:	7842                	ld	a6,48(sp)
ffffffffc02066a0:	00651463          	bne	a0,t1,ffffffffc02066a8 <stride_dequeue+0x16e2>
ffffffffc02066a4:	18a0106f          	j	ffffffffc020782e <stride_dequeue+0x2868>
ffffffffc02066a8:	010e3583          	ld	a1,16(t3)
ffffffffc02066ac:	854e                	mv	a0,s3
ffffffffc02066ae:	008e3b03          	ld	s6,8(t3)
ffffffffc02066b2:	f842                	sd	a6,48(sp)
ffffffffc02066b4:	f472                	sd	t3,40(sp)
ffffffffc02066b6:	f30fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02066ba:	7e22                	ld	t3,40(sp)
ffffffffc02066bc:	7842                	ld	a6,48(sp)
ffffffffc02066be:	016e3823          	sd	s6,16(t3)
ffffffffc02066c2:	00ae3423          	sd	a0,8(t3)
ffffffffc02066c6:	010c2b03          	lw	s6,16(s8)
ffffffffc02066ca:	e119                	bnez	a0,ffffffffc02066d0 <stride_dequeue+0x170a>
ffffffffc02066cc:	1ee0106f          	j	ffffffffc02078ba <stride_dequeue+0x28f4>
ffffffffc02066d0:	01c53023          	sd	t3,0(a0)
ffffffffc02066d4:	89f2                	mv	s3,t3
ffffffffc02066d6:	7782                	ld	a5,32(sp)
ffffffffc02066d8:	01383423          	sd	s3,8(a6)
ffffffffc02066dc:	00f83823          	sd	a5,16(a6)
ffffffffc02066e0:	0109b023          	sd	a6,0(s3)
ffffffffc02066e4:	89c2                	mv	s3,a6
ffffffffc02066e6:	67e2                	ld	a5,24(sp)
ffffffffc02066e8:	013a3423          	sd	s3,8(s4)
ffffffffc02066ec:	00fa3823          	sd	a5,16(s4)
ffffffffc02066f0:	0149b023          	sd	s4,0(s3)
ffffffffc02066f4:	89da                	mv	s3,s6
ffffffffc02066f6:	85eff06f          	j	ffffffffc0205754 <stride_dequeue+0x78e>
ffffffffc02066fa:	008cb783          	ld	a5,8(s9)
ffffffffc02066fe:	010cb983          	ld	s3,16(s9)
ffffffffc0206702:	f42a                	sd	a0,40(sp)
ffffffffc0206704:	f03e                	sd	a5,32(sp)
ffffffffc0206706:	04098163          	beqz	s3,ffffffffc0206748 <stride_dequeue+0x1782>
ffffffffc020670a:	859a                	mv	a1,t1
ffffffffc020670c:	854e                	mv	a0,s3
ffffffffc020670e:	fc42                	sd	a6,56(sp)
ffffffffc0206710:	f81a                	sd	t1,48(sp)
ffffffffc0206712:	e78fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206716:	7e22                	ld	t3,40(sp)
ffffffffc0206718:	7342                	ld	t1,48(sp)
ffffffffc020671a:	7862                	ld	a6,56(sp)
ffffffffc020671c:	11c505e3          	beq	a0,t3,ffffffffc0207026 <stride_dequeue+0x2060>
ffffffffc0206720:	01033583          	ld	a1,16(t1)
ffffffffc0206724:	854e                	mv	a0,s3
ffffffffc0206726:	00833b03          	ld	s6,8(t1)
ffffffffc020672a:	f842                	sd	a6,48(sp)
ffffffffc020672c:	f41a                	sd	t1,40(sp)
ffffffffc020672e:	eb8fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206732:	7322                	ld	t1,40(sp)
ffffffffc0206734:	7842                	ld	a6,48(sp)
ffffffffc0206736:	01633823          	sd	s6,16(t1)
ffffffffc020673a:	00a33423          	sd	a0,8(t1)
ffffffffc020673e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206742:	c119                	beqz	a0,ffffffffc0206748 <stride_dequeue+0x1782>
ffffffffc0206744:	00653023          	sd	t1,0(a0)
ffffffffc0206748:	7782                	ld	a5,32(sp)
ffffffffc020674a:	006cb423          	sd	t1,8(s9)
ffffffffc020674e:	89da                	mv	s3,s6
ffffffffc0206750:	00fcb823          	sd	a5,16(s9)
ffffffffc0206754:	01933023          	sd	s9,0(t1)
ffffffffc0206758:	9aeff06f          	j	ffffffffc0205906 <stride_dequeue+0x940>
ffffffffc020675c:	008db783          	ld	a5,8(s11)
ffffffffc0206760:	010db983          	ld	s3,16(s11)
ffffffffc0206764:	f02a                	sd	a0,32(sp)
ffffffffc0206766:	ec3e                	sd	a5,24(sp)
ffffffffc0206768:	04098563          	beqz	s3,ffffffffc02067b2 <stride_dequeue+0x17ec>
ffffffffc020676c:	859a                	mv	a1,t1
ffffffffc020676e:	854e                	mv	a0,s3
ffffffffc0206770:	fc42                	sd	a6,56(sp)
ffffffffc0206772:	f832                	sd	a2,48(sp)
ffffffffc0206774:	f41a                	sd	t1,40(sp)
ffffffffc0206776:	e14fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc020677a:	7e02                	ld	t3,32(sp)
ffffffffc020677c:	7322                	ld	t1,40(sp)
ffffffffc020677e:	7642                	ld	a2,48(sp)
ffffffffc0206780:	7862                	ld	a6,56(sp)
ffffffffc0206782:	15c50be3          	beq	a0,t3,ffffffffc02070d8 <stride_dequeue+0x2112>
ffffffffc0206786:	01033583          	ld	a1,16(t1)
ffffffffc020678a:	854e                	mv	a0,s3
ffffffffc020678c:	00833b03          	ld	s6,8(t1)
ffffffffc0206790:	f842                	sd	a6,48(sp)
ffffffffc0206792:	f432                	sd	a2,40(sp)
ffffffffc0206794:	f01a                	sd	t1,32(sp)
ffffffffc0206796:	e50fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020679a:	7302                	ld	t1,32(sp)
ffffffffc020679c:	7622                	ld	a2,40(sp)
ffffffffc020679e:	7842                	ld	a6,48(sp)
ffffffffc02067a0:	01633823          	sd	s6,16(t1)
ffffffffc02067a4:	00a33423          	sd	a0,8(t1)
ffffffffc02067a8:	010c2b03          	lw	s6,16(s8)
ffffffffc02067ac:	c119                	beqz	a0,ffffffffc02067b2 <stride_dequeue+0x17ec>
ffffffffc02067ae:	00653023          	sd	t1,0(a0)
ffffffffc02067b2:	67e2                	ld	a5,24(sp)
ffffffffc02067b4:	006db423          	sd	t1,8(s11)
ffffffffc02067b8:	89da                	mv	s3,s6
ffffffffc02067ba:	00fdb823          	sd	a5,16(s11)
ffffffffc02067be:	01b33023          	sd	s11,0(t1)
ffffffffc02067c2:	c3dfe06f          	j	ffffffffc02053fe <stride_dequeue+0x438>
ffffffffc02067c6:	0088b783          	ld	a5,8(a7)
ffffffffc02067ca:	0108b983          	ld	s3,16(a7)
ffffffffc02067ce:	f42a                	sd	a0,40(sp)
ffffffffc02067d0:	f03e                	sd	a5,32(sp)
ffffffffc02067d2:	04098063          	beqz	s3,ffffffffc0206812 <stride_dequeue+0x184c>
ffffffffc02067d6:	85c2                	mv	a1,a6
ffffffffc02067d8:	854e                	mv	a0,s3
ffffffffc02067da:	fc46                	sd	a7,56(sp)
ffffffffc02067dc:	daefe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02067e0:	7e22                	ld	t3,40(sp)
ffffffffc02067e2:	7842                	ld	a6,48(sp)
ffffffffc02067e4:	78e2                	ld	a7,56(sp)
ffffffffc02067e6:	29c50de3          	beq	a0,t3,ffffffffc0207280 <stride_dequeue+0x22ba>
ffffffffc02067ea:	01083583          	ld	a1,16(a6)
ffffffffc02067ee:	854e                	mv	a0,s3
ffffffffc02067f0:	00883b03          	ld	s6,8(a6)
ffffffffc02067f4:	f846                	sd	a7,48(sp)
ffffffffc02067f6:	f442                	sd	a6,40(sp)
ffffffffc02067f8:	deefe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02067fc:	7822                	ld	a6,40(sp)
ffffffffc02067fe:	78c2                	ld	a7,48(sp)
ffffffffc0206800:	01683823          	sd	s6,16(a6)
ffffffffc0206804:	00a83423          	sd	a0,8(a6)
ffffffffc0206808:	010c2b03          	lw	s6,16(s8)
ffffffffc020680c:	c119                	beqz	a0,ffffffffc0206812 <stride_dequeue+0x184c>
ffffffffc020680e:	01053023          	sd	a6,0(a0)
ffffffffc0206812:	7782                	ld	a5,32(sp)
ffffffffc0206814:	0108b423          	sd	a6,8(a7)
ffffffffc0206818:	89da                	mv	s3,s6
ffffffffc020681a:	00f8b823          	sd	a5,16(a7)
ffffffffc020681e:	01183023          	sd	a7,0(a6)
ffffffffc0206822:	8846                	mv	a6,a7
ffffffffc0206824:	d08ff06f          	j	ffffffffc0205d2c <stride_dequeue+0xd66>
ffffffffc0206828:	008db783          	ld	a5,8(s11)
ffffffffc020682c:	010db983          	ld	s3,16(s11)
ffffffffc0206830:	f42a                	sd	a0,40(sp)
ffffffffc0206832:	f03e                	sd	a5,32(sp)
ffffffffc0206834:	04098163          	beqz	s3,ffffffffc0206876 <stride_dequeue+0x18b0>
ffffffffc0206838:	859a                	mv	a1,t1
ffffffffc020683a:	854e                	mv	a0,s3
ffffffffc020683c:	fc42                	sd	a6,56(sp)
ffffffffc020683e:	f81a                	sd	t1,48(sp)
ffffffffc0206840:	d4afe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206844:	7e22                	ld	t3,40(sp)
ffffffffc0206846:	7342                	ld	t1,48(sp)
ffffffffc0206848:	7862                	ld	a6,56(sp)
ffffffffc020684a:	29c507e3          	beq	a0,t3,ffffffffc02072d8 <stride_dequeue+0x2312>
ffffffffc020684e:	01033583          	ld	a1,16(t1)
ffffffffc0206852:	854e                	mv	a0,s3
ffffffffc0206854:	00833b03          	ld	s6,8(t1)
ffffffffc0206858:	f842                	sd	a6,48(sp)
ffffffffc020685a:	f41a                	sd	t1,40(sp)
ffffffffc020685c:	d8afe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206860:	7322                	ld	t1,40(sp)
ffffffffc0206862:	7842                	ld	a6,48(sp)
ffffffffc0206864:	01633823          	sd	s6,16(t1)
ffffffffc0206868:	00a33423          	sd	a0,8(t1)
ffffffffc020686c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206870:	c119                	beqz	a0,ffffffffc0206876 <stride_dequeue+0x18b0>
ffffffffc0206872:	00653023          	sd	t1,0(a0)
ffffffffc0206876:	7782                	ld	a5,32(sp)
ffffffffc0206878:	006db423          	sd	t1,8(s11)
ffffffffc020687c:	89da                	mv	s3,s6
ffffffffc020687e:	00fdb823          	sd	a5,16(s11)
ffffffffc0206882:	01b33023          	sd	s11,0(t1)
ffffffffc0206886:	a1ffe06f          	j	ffffffffc02052a4 <stride_dequeue+0x2de>
ffffffffc020688a:	0088b783          	ld	a5,8(a7)
ffffffffc020688e:	0108b983          	ld	s3,16(a7)
ffffffffc0206892:	f42a                	sd	a0,40(sp)
ffffffffc0206894:	f03e                	sd	a5,32(sp)
ffffffffc0206896:	04098063          	beqz	s3,ffffffffc02068d6 <stride_dequeue+0x1910>
ffffffffc020689a:	859a                	mv	a1,t1
ffffffffc020689c:	854e                	mv	a0,s3
ffffffffc020689e:	fc46                	sd	a7,56(sp)
ffffffffc02068a0:	ceafe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02068a4:	7e22                	ld	t3,40(sp)
ffffffffc02068a6:	7342                	ld	t1,48(sp)
ffffffffc02068a8:	78e2                	ld	a7,56(sp)
ffffffffc02068aa:	73c50263          	beq	a0,t3,ffffffffc0206fce <stride_dequeue+0x2008>
ffffffffc02068ae:	01033583          	ld	a1,16(t1)
ffffffffc02068b2:	854e                	mv	a0,s3
ffffffffc02068b4:	00833b03          	ld	s6,8(t1)
ffffffffc02068b8:	f846                	sd	a7,48(sp)
ffffffffc02068ba:	f41a                	sd	t1,40(sp)
ffffffffc02068bc:	d2afe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02068c0:	7322                	ld	t1,40(sp)
ffffffffc02068c2:	78c2                	ld	a7,48(sp)
ffffffffc02068c4:	01633823          	sd	s6,16(t1)
ffffffffc02068c8:	00a33423          	sd	a0,8(t1)
ffffffffc02068cc:	010c2b03          	lw	s6,16(s8)
ffffffffc02068d0:	c119                	beqz	a0,ffffffffc02068d6 <stride_dequeue+0x1910>
ffffffffc02068d2:	00653023          	sd	t1,0(a0)
ffffffffc02068d6:	7782                	ld	a5,32(sp)
ffffffffc02068d8:	0068b423          	sd	t1,8(a7)
ffffffffc02068dc:	89da                	mv	s3,s6
ffffffffc02068de:	00f8b823          	sd	a5,16(a7)
ffffffffc02068e2:	01133023          	sd	a7,0(t1)
ffffffffc02068e6:	f3dfe06f          	j	ffffffffc0205822 <stride_dequeue+0x85c>
ffffffffc02068ea:	01093503          	ld	a0,16(s2)
ffffffffc02068ee:	00893983          	ld	s3,8(s2)
ffffffffc02068f2:	85da                	mv	a1,s6
ffffffffc02068f4:	cf2fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02068f8:	00a93423          	sd	a0,8(s2)
ffffffffc02068fc:	01393823          	sd	s3,16(s2)
ffffffffc0206900:	7822                	ld	a6,40(sp)
ffffffffc0206902:	77c2                	ld	a5,48(sp)
ffffffffc0206904:	010c2983          	lw	s3,16(s8)
ffffffffc0206908:	e119                	bnez	a0,ffffffffc020690e <stride_dequeue+0x1948>
ffffffffc020690a:	803fe06f          	j	ffffffffc020510c <stride_dequeue+0x146>
ffffffffc020690e:	01253023          	sd	s2,0(a0)
ffffffffc0206912:	ffafe06f          	j	ffffffffc020510c <stride_dequeue+0x146>
ffffffffc0206916:	0089b783          	ld	a5,8(s3)
ffffffffc020691a:	0109b803          	ld	a6,16(s3)
ffffffffc020691e:	f42a                	sd	a0,40(sp)
ffffffffc0206920:	ec3e                	sd	a5,24(sp)
ffffffffc0206922:	02080b63          	beqz	a6,ffffffffc0206958 <stride_dequeue+0x1992>
ffffffffc0206926:	8542                	mv	a0,a6
ffffffffc0206928:	85d2                	mv	a1,s4
ffffffffc020692a:	f042                	sd	a6,32(sp)
ffffffffc020692c:	c5efe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206930:	77a2                	ld	a5,40(sp)
ffffffffc0206932:	7802                	ld	a6,32(sp)
ffffffffc0206934:	3cf50be3          	beq	a0,a5,ffffffffc020750a <stride_dequeue+0x2544>
ffffffffc0206938:	010a3583          	ld	a1,16(s4)
ffffffffc020693c:	008a3b03          	ld	s6,8(s4)
ffffffffc0206940:	8542                	mv	a0,a6
ffffffffc0206942:	ca4fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206946:	00aa3423          	sd	a0,8(s4)
ffffffffc020694a:	016a3823          	sd	s6,16(s4)
ffffffffc020694e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206952:	c119                	beqz	a0,ffffffffc0206958 <stride_dequeue+0x1992>
ffffffffc0206954:	01453023          	sd	s4,0(a0)
ffffffffc0206958:	67e2                	ld	a5,24(sp)
ffffffffc020695a:	0149b423          	sd	s4,8(s3)
ffffffffc020695e:	00f9b823          	sd	a5,16(s3)
ffffffffc0206962:	013a3023          	sd	s3,0(s4)
ffffffffc0206966:	8a4e                	mv	s4,s3
ffffffffc0206968:	c90ff06f          	j	ffffffffc0205df8 <stride_dequeue+0xe32>
ffffffffc020696c:	0089b783          	ld	a5,8(s3)
ffffffffc0206970:	0109b803          	ld	a6,16(s3)
ffffffffc0206974:	f42a                	sd	a0,40(sp)
ffffffffc0206976:	ec3e                	sd	a5,24(sp)
ffffffffc0206978:	02080b63          	beqz	a6,ffffffffc02069ae <stride_dequeue+0x19e8>
ffffffffc020697c:	8542                	mv	a0,a6
ffffffffc020697e:	85e6                	mv	a1,s9
ffffffffc0206980:	f042                	sd	a6,32(sp)
ffffffffc0206982:	c08fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206986:	77a2                	ld	a5,40(sp)
ffffffffc0206988:	7802                	ld	a6,32(sp)
ffffffffc020698a:	28f50ee3          	beq	a0,a5,ffffffffc0207426 <stride_dequeue+0x2460>
ffffffffc020698e:	010cb583          	ld	a1,16(s9)
ffffffffc0206992:	008cbb03          	ld	s6,8(s9)
ffffffffc0206996:	8542                	mv	a0,a6
ffffffffc0206998:	c4efe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020699c:	00acb423          	sd	a0,8(s9)
ffffffffc02069a0:	016cb823          	sd	s6,16(s9)
ffffffffc02069a4:	010c2b03          	lw	s6,16(s8)
ffffffffc02069a8:	c119                	beqz	a0,ffffffffc02069ae <stride_dequeue+0x19e8>
ffffffffc02069aa:	01953023          	sd	s9,0(a0)
ffffffffc02069ae:	67e2                	ld	a5,24(sp)
ffffffffc02069b0:	0199b423          	sd	s9,8(s3)
ffffffffc02069b4:	00f9b823          	sd	a5,16(s3)
ffffffffc02069b8:	013cb023          	sd	s3,0(s9)
ffffffffc02069bc:	8cce                	mv	s9,s3
ffffffffc02069be:	de4ff06f          	j	ffffffffc0205fa2 <stride_dequeue+0xfdc>
ffffffffc02069c2:	0089b783          	ld	a5,8(s3)
ffffffffc02069c6:	0109b803          	ld	a6,16(s3)
ffffffffc02069ca:	f42a                	sd	a0,40(sp)
ffffffffc02069cc:	e83e                	sd	a5,16(sp)
ffffffffc02069ce:	02080f63          	beqz	a6,ffffffffc0206a0c <stride_dequeue+0x1a46>
ffffffffc02069d2:	8542                	mv	a0,a6
ffffffffc02069d4:	85d2                	mv	a1,s4
ffffffffc02069d6:	f032                	sd	a2,32(sp)
ffffffffc02069d8:	ec42                	sd	a6,24(sp)
ffffffffc02069da:	bb0fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc02069de:	77a2                	ld	a5,40(sp)
ffffffffc02069e0:	6862                	ld	a6,24(sp)
ffffffffc02069e2:	7602                	ld	a2,32(sp)
ffffffffc02069e4:	26f506e3          	beq	a0,a5,ffffffffc0207450 <stride_dequeue+0x248a>
ffffffffc02069e8:	010a3583          	ld	a1,16(s4)
ffffffffc02069ec:	008a3b03          	ld	s6,8(s4)
ffffffffc02069f0:	8542                	mv	a0,a6
ffffffffc02069f2:	ec32                	sd	a2,24(sp)
ffffffffc02069f4:	bf2fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02069f8:	00aa3423          	sd	a0,8(s4)
ffffffffc02069fc:	016a3823          	sd	s6,16(s4)
ffffffffc0206a00:	6662                	ld	a2,24(sp)
ffffffffc0206a02:	010c2b03          	lw	s6,16(s8)
ffffffffc0206a06:	c119                	beqz	a0,ffffffffc0206a0c <stride_dequeue+0x1a46>
ffffffffc0206a08:	01453023          	sd	s4,0(a0)
ffffffffc0206a0c:	67c2                	ld	a5,16(sp)
ffffffffc0206a0e:	0149b423          	sd	s4,8(s3)
ffffffffc0206a12:	00f9b823          	sd	a5,16(s3)
ffffffffc0206a16:	013a3023          	sd	s3,0(s4)
ffffffffc0206a1a:	8a4e                	mv	s4,s3
ffffffffc0206a1c:	cb8ff06f          	j	ffffffffc0205ed4 <stride_dequeue+0xf0e>
ffffffffc0206a20:	008a3783          	ld	a5,8(s4)
ffffffffc0206a24:	010a3883          	ld	a7,16(s4)
ffffffffc0206a28:	f42a                	sd	a0,40(sp)
ffffffffc0206a2a:	ec3e                	sd	a5,24(sp)
ffffffffc0206a2c:	02088b63          	beqz	a7,ffffffffc0206a62 <stride_dequeue+0x1a9c>
ffffffffc0206a30:	8546                	mv	a0,a7
ffffffffc0206a32:	85ce                	mv	a1,s3
ffffffffc0206a34:	f046                	sd	a7,32(sp)
ffffffffc0206a36:	b54fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206a3a:	77a2                	ld	a5,40(sp)
ffffffffc0206a3c:	7882                	ld	a7,32(sp)
ffffffffc0206a3e:	26f501e3          	beq	a0,a5,ffffffffc02074a0 <stride_dequeue+0x24da>
ffffffffc0206a42:	0109b583          	ld	a1,16(s3)
ffffffffc0206a46:	0089bb03          	ld	s6,8(s3)
ffffffffc0206a4a:	8546                	mv	a0,a7
ffffffffc0206a4c:	b9afe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206a50:	00a9b423          	sd	a0,8(s3)
ffffffffc0206a54:	0169b823          	sd	s6,16(s3)
ffffffffc0206a58:	010c2b03          	lw	s6,16(s8)
ffffffffc0206a5c:	c119                	beqz	a0,ffffffffc0206a62 <stride_dequeue+0x1a9c>
ffffffffc0206a5e:	01353023          	sd	s3,0(a0)
ffffffffc0206a62:	67e2                	ld	a5,24(sp)
ffffffffc0206a64:	013a3423          	sd	s3,8(s4)
ffffffffc0206a68:	00fa3823          	sd	a5,16(s4)
ffffffffc0206a6c:	0149b023          	sd	s4,0(s3)
ffffffffc0206a70:	89d2                	mv	s3,s4
ffffffffc0206a72:	f9bfe06f          	j	ffffffffc0205a0c <stride_dequeue+0xa46>
ffffffffc0206a76:	008a3783          	ld	a5,8(s4)
ffffffffc0206a7a:	010a3883          	ld	a7,16(s4)
ffffffffc0206a7e:	fc2a                	sd	a0,56(sp)
ffffffffc0206a80:	f03e                	sd	a5,32(sp)
ffffffffc0206a82:	02088f63          	beqz	a7,ffffffffc0206ac0 <stride_dequeue+0x1afa>
ffffffffc0206a86:	8546                	mv	a0,a7
ffffffffc0206a88:	85ce                	mv	a1,s3
ffffffffc0206a8a:	f842                	sd	a6,48(sp)
ffffffffc0206a8c:	f446                	sd	a7,40(sp)
ffffffffc0206a8e:	afcfe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206a92:	7e62                	ld	t3,56(sp)
ffffffffc0206a94:	78a2                	ld	a7,40(sp)
ffffffffc0206a96:	7842                	ld	a6,48(sp)
ffffffffc0206a98:	35c509e3          	beq	a0,t3,ffffffffc02075ea <stride_dequeue+0x2624>
ffffffffc0206a9c:	0109b583          	ld	a1,16(s3)
ffffffffc0206aa0:	0089bb03          	ld	s6,8(s3)
ffffffffc0206aa4:	8546                	mv	a0,a7
ffffffffc0206aa6:	f442                	sd	a6,40(sp)
ffffffffc0206aa8:	b3efe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206aac:	00a9b423          	sd	a0,8(s3)
ffffffffc0206ab0:	0169b823          	sd	s6,16(s3)
ffffffffc0206ab4:	7822                	ld	a6,40(sp)
ffffffffc0206ab6:	010c2b03          	lw	s6,16(s8)
ffffffffc0206aba:	c119                	beqz	a0,ffffffffc0206ac0 <stride_dequeue+0x1afa>
ffffffffc0206abc:	01353023          	sd	s3,0(a0)
ffffffffc0206ac0:	7782                	ld	a5,32(sp)
ffffffffc0206ac2:	013a3423          	sd	s3,8(s4)
ffffffffc0206ac6:	00fa3823          	sd	a5,16(s4)
ffffffffc0206aca:	0149b023          	sd	s4,0(s3)
ffffffffc0206ace:	89d2                	mv	s3,s4
ffffffffc0206ad0:	c73fe06f          	j	ffffffffc0205742 <stride_dequeue+0x77c>
ffffffffc0206ad4:	661c                	ld	a5,8(a2)
ffffffffc0206ad6:	01063883          	ld	a7,16(a2)
ffffffffc0206ada:	fc2a                	sd	a0,56(sp)
ffffffffc0206adc:	ec3e                	sd	a5,24(sp)
ffffffffc0206ade:	04088363          	beqz	a7,ffffffffc0206b24 <stride_dequeue+0x1b5e>
ffffffffc0206ae2:	8546                	mv	a0,a7
ffffffffc0206ae4:	85ce                	mv	a1,s3
ffffffffc0206ae6:	f842                	sd	a6,48(sp)
ffffffffc0206ae8:	f432                	sd	a2,40(sp)
ffffffffc0206aea:	f046                	sd	a7,32(sp)
ffffffffc0206aec:	a9efe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206af0:	7e62                	ld	t3,56(sp)
ffffffffc0206af2:	7882                	ld	a7,32(sp)
ffffffffc0206af4:	7622                	ld	a2,40(sp)
ffffffffc0206af6:	7842                	ld	a6,48(sp)
ffffffffc0206af8:	25c501e3          	beq	a0,t3,ffffffffc020753a <stride_dequeue+0x2574>
ffffffffc0206afc:	0109b583          	ld	a1,16(s3)
ffffffffc0206b00:	0089bb03          	ld	s6,8(s3)
ffffffffc0206b04:	8546                	mv	a0,a7
ffffffffc0206b06:	f442                	sd	a6,40(sp)
ffffffffc0206b08:	f032                	sd	a2,32(sp)
ffffffffc0206b0a:	adcfe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206b0e:	00a9b423          	sd	a0,8(s3)
ffffffffc0206b12:	0169b823          	sd	s6,16(s3)
ffffffffc0206b16:	7602                	ld	a2,32(sp)
ffffffffc0206b18:	7822                	ld	a6,40(sp)
ffffffffc0206b1a:	010c2b03          	lw	s6,16(s8)
ffffffffc0206b1e:	c119                	beqz	a0,ffffffffc0206b24 <stride_dequeue+0x1b5e>
ffffffffc0206b20:	01353023          	sd	s3,0(a0)
ffffffffc0206b24:	67e2                	ld	a5,24(sp)
ffffffffc0206b26:	01363423          	sd	s3,8(a2)
ffffffffc0206b2a:	ea1c                	sd	a5,16(a2)
ffffffffc0206b2c:	00c9b023          	sd	a2,0(s3)
ffffffffc0206b30:	89b2                	mv	s3,a2
ffffffffc0206b32:	b13fe06f          	j	ffffffffc0205644 <stride_dequeue+0x67e>
ffffffffc0206b36:	89c6                	mv	s3,a7
ffffffffc0206b38:	9e4ff06f          	j	ffffffffc0205d1c <stride_dequeue+0xd56>
ffffffffc0206b3c:	0088b783          	ld	a5,8(a7)
ffffffffc0206b40:	0108b803          	ld	a6,16(a7)
ffffffffc0206b44:	fc2a                	sd	a0,56(sp)
ffffffffc0206b46:	f03e                	sd	a5,32(sp)
ffffffffc0206b48:	02080f63          	beqz	a6,ffffffffc0206b86 <stride_dequeue+0x1bc0>
ffffffffc0206b4c:	8542                	mv	a0,a6
ffffffffc0206b4e:	85ce                	mv	a1,s3
ffffffffc0206b50:	f846                	sd	a7,48(sp)
ffffffffc0206b52:	f442                	sd	a6,40(sp)
ffffffffc0206b54:	a36fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206b58:	7e62                	ld	t3,56(sp)
ffffffffc0206b5a:	7822                	ld	a6,40(sp)
ffffffffc0206b5c:	78c2                	ld	a7,48(sp)
ffffffffc0206b5e:	47c50ce3          	beq	a0,t3,ffffffffc02077d6 <stride_dequeue+0x2810>
ffffffffc0206b62:	0109b583          	ld	a1,16(s3)
ffffffffc0206b66:	0089bb03          	ld	s6,8(s3)
ffffffffc0206b6a:	8542                	mv	a0,a6
ffffffffc0206b6c:	f446                	sd	a7,40(sp)
ffffffffc0206b6e:	a78fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206b72:	00a9b423          	sd	a0,8(s3)
ffffffffc0206b76:	0169b823          	sd	s6,16(s3)
ffffffffc0206b7a:	78a2                	ld	a7,40(sp)
ffffffffc0206b7c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206b80:	c119                	beqz	a0,ffffffffc0206b86 <stride_dequeue+0x1bc0>
ffffffffc0206b82:	01353023          	sd	s3,0(a0)
ffffffffc0206b86:	7782                	ld	a5,32(sp)
ffffffffc0206b88:	0138b423          	sd	s3,8(a7)
ffffffffc0206b8c:	00f8b823          	sd	a5,16(a7)
ffffffffc0206b90:	0119b023          	sd	a7,0(s3)
ffffffffc0206b94:	89c6                	mv	s3,a7
ffffffffc0206b96:	8f0ff06f          	j	ffffffffc0205c86 <stride_dequeue+0xcc0>
ffffffffc0206b9a:	0088b783          	ld	a5,8(a7)
ffffffffc0206b9e:	0108b803          	ld	a6,16(a7)
ffffffffc0206ba2:	fc2a                	sd	a0,56(sp)
ffffffffc0206ba4:	f03e                	sd	a5,32(sp)
ffffffffc0206ba6:	02080f63          	beqz	a6,ffffffffc0206be4 <stride_dequeue+0x1c1e>
ffffffffc0206baa:	8542                	mv	a0,a6
ffffffffc0206bac:	85ce                	mv	a1,s3
ffffffffc0206bae:	f846                	sd	a7,48(sp)
ffffffffc0206bb0:	f442                	sd	a6,40(sp)
ffffffffc0206bb2:	9d8fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206bb6:	7e62                	ld	t3,56(sp)
ffffffffc0206bb8:	7822                	ld	a6,40(sp)
ffffffffc0206bba:	78c2                	ld	a7,48(sp)
ffffffffc0206bbc:	25c50de3          	beq	a0,t3,ffffffffc0207616 <stride_dequeue+0x2650>
ffffffffc0206bc0:	0109b583          	ld	a1,16(s3)
ffffffffc0206bc4:	0089bb03          	ld	s6,8(s3)
ffffffffc0206bc8:	8542                	mv	a0,a6
ffffffffc0206bca:	f446                	sd	a7,40(sp)
ffffffffc0206bcc:	a1afe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206bd0:	00a9b423          	sd	a0,8(s3)
ffffffffc0206bd4:	0169b823          	sd	s6,16(s3)
ffffffffc0206bd8:	78a2                	ld	a7,40(sp)
ffffffffc0206bda:	010c2b03          	lw	s6,16(s8)
ffffffffc0206bde:	c119                	beqz	a0,ffffffffc0206be4 <stride_dequeue+0x1c1e>
ffffffffc0206be0:	01353023          	sd	s3,0(a0)
ffffffffc0206be4:	7782                	ld	a5,32(sp)
ffffffffc0206be6:	0138b423          	sd	s3,8(a7)
ffffffffc0206bea:	00f8b823          	sd	a5,16(a7)
ffffffffc0206bee:	0119b023          	sd	a7,0(s3)
ffffffffc0206bf2:	89c6                	mv	s3,a7
ffffffffc0206bf4:	ee7fe06f          	j	ffffffffc0205ada <stride_dequeue+0xb14>
ffffffffc0206bf8:	0088b783          	ld	a5,8(a7)
ffffffffc0206bfc:	0108b803          	ld	a6,16(a7)
ffffffffc0206c00:	fc2a                	sd	a0,56(sp)
ffffffffc0206c02:	ec3e                	sd	a5,24(sp)
ffffffffc0206c04:	04080263          	beqz	a6,ffffffffc0206c48 <stride_dequeue+0x1c82>
ffffffffc0206c08:	8542                	mv	a0,a6
ffffffffc0206c0a:	85ce                	mv	a1,s3
ffffffffc0206c0c:	f846                	sd	a7,48(sp)
ffffffffc0206c0e:	f042                	sd	a6,32(sp)
ffffffffc0206c10:	97afe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206c14:	7e62                	ld	t3,56(sp)
ffffffffc0206c16:	7802                	ld	a6,32(sp)
ffffffffc0206c18:	7622                	ld	a2,40(sp)
ffffffffc0206c1a:	78c2                	ld	a7,48(sp)
ffffffffc0206c1c:	23c503e3          	beq	a0,t3,ffffffffc0207642 <stride_dequeue+0x267c>
ffffffffc0206c20:	0109b583          	ld	a1,16(s3)
ffffffffc0206c24:	0089bb03          	ld	s6,8(s3)
ffffffffc0206c28:	8542                	mv	a0,a6
ffffffffc0206c2a:	f446                	sd	a7,40(sp)
ffffffffc0206c2c:	f032                	sd	a2,32(sp)
ffffffffc0206c2e:	9b8fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206c32:	00a9b423          	sd	a0,8(s3)
ffffffffc0206c36:	0169b823          	sd	s6,16(s3)
ffffffffc0206c3a:	7602                	ld	a2,32(sp)
ffffffffc0206c3c:	78a2                	ld	a7,40(sp)
ffffffffc0206c3e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206c42:	c119                	beqz	a0,ffffffffc0206c48 <stride_dequeue+0x1c82>
ffffffffc0206c44:	01353023          	sd	s3,0(a0)
ffffffffc0206c48:	67e2                	ld	a5,24(sp)
ffffffffc0206c4a:	0138b423          	sd	s3,8(a7)
ffffffffc0206c4e:	00f8b823          	sd	a5,16(a7)
ffffffffc0206c52:	0119b023          	sd	a7,0(s3)
ffffffffc0206c56:	89c6                	mv	s3,a7
ffffffffc0206c58:	f61fe06f          	j	ffffffffc0205bb8 <stride_dequeue+0xbf2>
ffffffffc0206c5c:	0089b783          	ld	a5,8(s3)
ffffffffc0206c60:	0109b303          	ld	t1,16(s3)
ffffffffc0206c64:	fc2a                	sd	a0,56(sp)
ffffffffc0206c66:	f03e                	sd	a5,32(sp)
ffffffffc0206c68:	02030f63          	beqz	t1,ffffffffc0206ca6 <stride_dequeue+0x1ce0>
ffffffffc0206c6c:	851a                	mv	a0,t1
ffffffffc0206c6e:	85e6                	mv	a1,s9
ffffffffc0206c70:	f846                	sd	a7,48(sp)
ffffffffc0206c72:	f41a                	sd	t1,40(sp)
ffffffffc0206c74:	916fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206c78:	7e62                	ld	t3,56(sp)
ffffffffc0206c7a:	7322                	ld	t1,40(sp)
ffffffffc0206c7c:	78c2                	ld	a7,48(sp)
ffffffffc0206c7e:	11c50be3          	beq	a0,t3,ffffffffc0207594 <stride_dequeue+0x25ce>
ffffffffc0206c82:	010cb583          	ld	a1,16(s9)
ffffffffc0206c86:	008cbb03          	ld	s6,8(s9)
ffffffffc0206c8a:	851a                	mv	a0,t1
ffffffffc0206c8c:	f446                	sd	a7,40(sp)
ffffffffc0206c8e:	958fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206c92:	00acb423          	sd	a0,8(s9)
ffffffffc0206c96:	016cb823          	sd	s6,16(s9)
ffffffffc0206c9a:	78a2                	ld	a7,40(sp)
ffffffffc0206c9c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ca0:	c119                	beqz	a0,ffffffffc0206ca6 <stride_dequeue+0x1ce0>
ffffffffc0206ca2:	01953023          	sd	s9,0(a0)
ffffffffc0206ca6:	7782                	ld	a5,32(sp)
ffffffffc0206ca8:	0199b423          	sd	s9,8(s3)
ffffffffc0206cac:	00f9b823          	sd	a5,16(s3)
ffffffffc0206cb0:	013cb023          	sd	s3,0(s9)
ffffffffc0206cb4:	8cce                	mv	s9,s3
ffffffffc0206cb6:	b8aff06f          	j	ffffffffc0206040 <stride_dequeue+0x107a>
ffffffffc0206cba:	89ee                	mv	s3,s11
ffffffffc0206cbc:	dd6fe06f          	j	ffffffffc0205292 <stride_dequeue+0x2cc>
ffffffffc0206cc0:	0089b783          	ld	a5,8(s3)
ffffffffc0206cc4:	0109b303          	ld	t1,16(s3)
ffffffffc0206cc8:	fc2a                	sd	a0,56(sp)
ffffffffc0206cca:	f03e                	sd	a5,32(sp)
ffffffffc0206ccc:	02030f63          	beqz	t1,ffffffffc0206d0a <stride_dequeue+0x1d44>
ffffffffc0206cd0:	85c2                	mv	a1,a6
ffffffffc0206cd2:	851a                	mv	a0,t1
ffffffffc0206cd4:	f842                	sd	a6,48(sp)
ffffffffc0206cd6:	f41a                	sd	t1,40(sp)
ffffffffc0206cd8:	8b2fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206cdc:	7e62                	ld	t3,56(sp)
ffffffffc0206cde:	7322                	ld	t1,40(sp)
ffffffffc0206ce0:	7842                	ld	a6,48(sp)
ffffffffc0206ce2:	0dc50fe3          	beq	a0,t3,ffffffffc02075c0 <stride_dequeue+0x25fa>
ffffffffc0206ce6:	01083583          	ld	a1,16(a6)
ffffffffc0206cea:	851a                	mv	a0,t1
ffffffffc0206cec:	00883b03          	ld	s6,8(a6)
ffffffffc0206cf0:	f442                	sd	a6,40(sp)
ffffffffc0206cf2:	8f4fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206cf6:	7822                	ld	a6,40(sp)
ffffffffc0206cf8:	01683823          	sd	s6,16(a6)
ffffffffc0206cfc:	00a83423          	sd	a0,8(a6)
ffffffffc0206d00:	010c2b03          	lw	s6,16(s8)
ffffffffc0206d04:	c119                	beqz	a0,ffffffffc0206d0a <stride_dequeue+0x1d44>
ffffffffc0206d06:	01053023          	sd	a6,0(a0)
ffffffffc0206d0a:	7782                	ld	a5,32(sp)
ffffffffc0206d0c:	0109b423          	sd	a6,8(s3)
ffffffffc0206d10:	00f9b823          	sd	a5,16(s3)
ffffffffc0206d14:	01383023          	sd	s3,0(a6)
ffffffffc0206d18:	884e                	mv	a6,s3
ffffffffc0206d1a:	bc4ff06f          	j	ffffffffc02060de <stride_dequeue+0x1118>
ffffffffc0206d1e:	008cb783          	ld	a5,8(s9)
ffffffffc0206d22:	010cb883          	ld	a7,16(s9)
ffffffffc0206d26:	fc2a                	sd	a0,56(sp)
ffffffffc0206d28:	f03e                	sd	a5,32(sp)
ffffffffc0206d2a:	02088f63          	beqz	a7,ffffffffc0206d68 <stride_dequeue+0x1da2>
ffffffffc0206d2e:	8546                	mv	a0,a7
ffffffffc0206d30:	85ce                	mv	a1,s3
ffffffffc0206d32:	f842                	sd	a6,48(sp)
ffffffffc0206d34:	f446                	sd	a7,40(sp)
ffffffffc0206d36:	854fe0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206d3a:	7e62                	ld	t3,56(sp)
ffffffffc0206d3c:	78a2                	ld	a7,40(sp)
ffffffffc0206d3e:	7842                	ld	a6,48(sp)
ffffffffc0206d40:	27c505e3          	beq	a0,t3,ffffffffc02077aa <stride_dequeue+0x27e4>
ffffffffc0206d44:	0109b583          	ld	a1,16(s3)
ffffffffc0206d48:	0089bb03          	ld	s6,8(s3)
ffffffffc0206d4c:	8546                	mv	a0,a7
ffffffffc0206d4e:	f442                	sd	a6,40(sp)
ffffffffc0206d50:	896fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206d54:	00a9b423          	sd	a0,8(s3)
ffffffffc0206d58:	0169b823          	sd	s6,16(s3)
ffffffffc0206d5c:	7822                	ld	a6,40(sp)
ffffffffc0206d5e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206d62:	c119                	beqz	a0,ffffffffc0206d68 <stride_dequeue+0x1da2>
ffffffffc0206d64:	01353023          	sd	s3,0(a0)
ffffffffc0206d68:	7782                	ld	a5,32(sp)
ffffffffc0206d6a:	013cb423          	sd	s3,8(s9)
ffffffffc0206d6e:	00fcb823          	sd	a5,16(s9)
ffffffffc0206d72:	0199b023          	sd	s9,0(s3)
ffffffffc0206d76:	89e6                	mv	s3,s9
ffffffffc0206d78:	fb0fe06f          	j	ffffffffc0205528 <stride_dequeue+0x562>
ffffffffc0206d7c:	0089b783          	ld	a5,8(s3)
ffffffffc0206d80:	0109b303          	ld	t1,16(s3)
ffffffffc0206d84:	fc2a                	sd	a0,56(sp)
ffffffffc0206d86:	f03e                	sd	a5,32(sp)
ffffffffc0206d88:	02030f63          	beqz	t1,ffffffffc0206dc6 <stride_dequeue+0x1e00>
ffffffffc0206d8c:	85c2                	mv	a1,a6
ffffffffc0206d8e:	851a                	mv	a0,t1
ffffffffc0206d90:	f842                	sd	a6,48(sp)
ffffffffc0206d92:	f41a                	sd	t1,40(sp)
ffffffffc0206d94:	ff7fd0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206d98:	7e62                	ld	t3,56(sp)
ffffffffc0206d9a:	7322                	ld	t1,40(sp)
ffffffffc0206d9c:	7842                	ld	a6,48(sp)
ffffffffc0206d9e:	1bc509e3          	beq	a0,t3,ffffffffc0207750 <stride_dequeue+0x278a>
ffffffffc0206da2:	01083583          	ld	a1,16(a6)
ffffffffc0206da6:	851a                	mv	a0,t1
ffffffffc0206da8:	00883b03          	ld	s6,8(a6)
ffffffffc0206dac:	f442                	sd	a6,40(sp)
ffffffffc0206dae:	838fe0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206db2:	7822                	ld	a6,40(sp)
ffffffffc0206db4:	01683823          	sd	s6,16(a6)
ffffffffc0206db8:	00a83423          	sd	a0,8(a6)
ffffffffc0206dbc:	010c2b03          	lw	s6,16(s8)
ffffffffc0206dc0:	c119                	beqz	a0,ffffffffc0206dc6 <stride_dequeue+0x1e00>
ffffffffc0206dc2:	01053023          	sd	a6,0(a0)
ffffffffc0206dc6:	7782                	ld	a5,32(sp)
ffffffffc0206dc8:	0109b423          	sd	a6,8(s3)
ffffffffc0206dcc:	00f9b823          	sd	a5,16(s3)
ffffffffc0206dd0:	01383023          	sd	s3,0(a6)
ffffffffc0206dd4:	884e                	mv	a6,s3
ffffffffc0206dd6:	ba4ff06f          	j	ffffffffc020617a <stride_dequeue+0x11b4>
ffffffffc0206dda:	0089b783          	ld	a5,8(s3)
ffffffffc0206dde:	0109b303          	ld	t1,16(s3)
ffffffffc0206de2:	fc2a                	sd	a0,56(sp)
ffffffffc0206de4:	ec3e                	sd	a5,24(sp)
ffffffffc0206de6:	04030363          	beqz	t1,ffffffffc0206e2c <stride_dequeue+0x1e66>
ffffffffc0206dea:	85c2                	mv	a1,a6
ffffffffc0206dec:	851a                	mv	a0,t1
ffffffffc0206dee:	f832                	sd	a2,48(sp)
ffffffffc0206df0:	f442                	sd	a6,40(sp)
ffffffffc0206df2:	f01a                	sd	t1,32(sp)
ffffffffc0206df4:	f97fd0ef          	jal	ra,ffffffffc0204d8a <proc_stride_comp_f>
ffffffffc0206df8:	7642                	ld	a2,48(sp)
ffffffffc0206dfa:	7e62                	ld	t3,56(sp)
ffffffffc0206dfc:	7822                	ld	a6,40(sp)
ffffffffc0206dfe:	f432                	sd	a2,40(sp)
ffffffffc0206e00:	7302                	ld	t1,32(sp)
ffffffffc0206e02:	29c507e3          	beq	a0,t3,ffffffffc0207890 <stride_dequeue+0x28ca>
ffffffffc0206e06:	01083583          	ld	a1,16(a6)
ffffffffc0206e0a:	851a                	mv	a0,t1
ffffffffc0206e0c:	00883b03          	ld	s6,8(a6)
ffffffffc0206e10:	f042                	sd	a6,32(sp)
ffffffffc0206e12:	fd5fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206e16:	7802                	ld	a6,32(sp)
ffffffffc0206e18:	7622                	ld	a2,40(sp)
ffffffffc0206e1a:	01683823          	sd	s6,16(a6)
ffffffffc0206e1e:	00a83423          	sd	a0,8(a6)
ffffffffc0206e22:	010c2b03          	lw	s6,16(s8)
ffffffffc0206e26:	c119                	beqz	a0,ffffffffc0206e2c <stride_dequeue+0x1e66>
ffffffffc0206e28:	01053023          	sd	a6,0(a0)
ffffffffc0206e2c:	67e2                	ld	a5,24(sp)
ffffffffc0206e2e:	0109b423          	sd	a6,8(s3)
ffffffffc0206e32:	00f9b823          	sd	a5,16(s3)
ffffffffc0206e36:	01383023          	sd	s3,0(a6)
ffffffffc0206e3a:	884e                	mv	a6,s3
ffffffffc0206e3c:	be2ff06f          	j	ffffffffc020621e <stride_dequeue+0x1258>
ffffffffc0206e40:	89c6                	mv	s3,a7
ffffffffc0206e42:	9cffe06f          	j	ffffffffc0205810 <stride_dequeue+0x84a>
ffffffffc0206e46:	89e6                	mv	s3,s9
ffffffffc0206e48:	aadfe06f          	j	ffffffffc02058f4 <stride_dequeue+0x92e>
ffffffffc0206e4c:	89ee                	mv	s3,s11
ffffffffc0206e4e:	d9efe06f          	j	ffffffffc02053ec <stride_dequeue+0x426>
ffffffffc0206e52:	89d2                	mv	s3,s4
ffffffffc0206e54:	bb9fe06f          	j	ffffffffc0205a0c <stride_dequeue+0xa46>
ffffffffc0206e58:	0108b503          	ld	a0,16(a7)
ffffffffc0206e5c:	85ce                	mv	a1,s3
ffffffffc0206e5e:	0088bb03          	ld	s6,8(a7)
ffffffffc0206e62:	f81a                	sd	t1,48(sp)
ffffffffc0206e64:	f446                	sd	a7,40(sp)
ffffffffc0206e66:	f81fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206e6a:	78a2                	ld	a7,40(sp)
ffffffffc0206e6c:	7342                	ld	t1,48(sp)
ffffffffc0206e6e:	0168b823          	sd	s6,16(a7)
ffffffffc0206e72:	00a8b423          	sd	a0,8(a7)
ffffffffc0206e76:	010c2b03          	lw	s6,16(s8)
ffffffffc0206e7a:	d179                	beqz	a0,ffffffffc0206e40 <stride_dequeue+0x1e7a>
ffffffffc0206e7c:	01153023          	sd	a7,0(a0)
ffffffffc0206e80:	89c6                	mv	s3,a7
ffffffffc0206e82:	98ffe06f          	j	ffffffffc0205810 <stride_dequeue+0x84a>
ffffffffc0206e86:	0109b503          	ld	a0,16(s3)
ffffffffc0206e8a:	0089bb03          	ld	s6,8(s3)
ffffffffc0206e8e:	85be                	mv	a1,a5
ffffffffc0206e90:	f442                	sd	a6,40(sp)
ffffffffc0206e92:	f55fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206e96:	00a9b423          	sd	a0,8(s3)
ffffffffc0206e9a:	0169b823          	sd	s6,16(s3)
ffffffffc0206e9e:	7822                	ld	a6,40(sp)
ffffffffc0206ea0:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ea4:	5e050b63          	beqz	a0,ffffffffc020749a <stride_dequeue+0x24d4>
ffffffffc0206ea8:	01353023          	sd	s3,0(a0)
ffffffffc0206eac:	87ce                	mv	a5,s3
ffffffffc0206eae:	bccff06f          	j	ffffffffc020627a <stride_dequeue+0x12b4>
ffffffffc0206eb2:	010cb503          	ld	a0,16(s9)
ffffffffc0206eb6:	008cbb03          	ld	s6,8(s9)
ffffffffc0206eba:	85ce                	mv	a1,s3
ffffffffc0206ebc:	f2bfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206ec0:	00acb423          	sd	a0,8(s9)
ffffffffc0206ec4:	016cb823          	sd	s6,16(s9)
ffffffffc0206ec8:	7822                	ld	a6,40(sp)
ffffffffc0206eca:	7342                	ld	t1,48(sp)
ffffffffc0206ecc:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ed0:	d93d                	beqz	a0,ffffffffc0206e46 <stride_dequeue+0x1e80>
ffffffffc0206ed2:	01953023          	sd	s9,0(a0)
ffffffffc0206ed6:	89e6                	mv	s3,s9
ffffffffc0206ed8:	a1dfe06f          	j	ffffffffc02058f4 <stride_dequeue+0x92e>
ffffffffc0206edc:	0108b503          	ld	a0,16(a7)
ffffffffc0206ee0:	85ce                	mv	a1,s3
ffffffffc0206ee2:	0088bb03          	ld	s6,8(a7)
ffffffffc0206ee6:	f842                	sd	a6,48(sp)
ffffffffc0206ee8:	f446                	sd	a7,40(sp)
ffffffffc0206eea:	efdfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206eee:	78a2                	ld	a7,40(sp)
ffffffffc0206ef0:	7842                	ld	a6,48(sp)
ffffffffc0206ef2:	0168b823          	sd	s6,16(a7)
ffffffffc0206ef6:	00a8b423          	sd	a0,8(a7)
ffffffffc0206efa:	010c2b03          	lw	s6,16(s8)
ffffffffc0206efe:	c2050ce3          	beqz	a0,ffffffffc0206b36 <stride_dequeue+0x1b70>
ffffffffc0206f02:	01153023          	sd	a7,0(a0)
ffffffffc0206f06:	89c6                	mv	s3,a7
ffffffffc0206f08:	e15fe06f          	j	ffffffffc0205d1c <stride_dequeue+0xd56>
ffffffffc0206f0c:	010db503          	ld	a0,16(s11)
ffffffffc0206f10:	008dbb03          	ld	s6,8(s11)
ffffffffc0206f14:	85ce                	mv	a1,s3
ffffffffc0206f16:	ed1fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206f1a:	00adb423          	sd	a0,8(s11)
ffffffffc0206f1e:	016db823          	sd	s6,16(s11)
ffffffffc0206f22:	7602                	ld	a2,32(sp)
ffffffffc0206f24:	7822                	ld	a6,40(sp)
ffffffffc0206f26:	7342                	ld	t1,48(sp)
ffffffffc0206f28:	010c2b03          	lw	s6,16(s8)
ffffffffc0206f2c:	d105                	beqz	a0,ffffffffc0206e4c <stride_dequeue+0x1e86>
ffffffffc0206f2e:	01b53023          	sd	s11,0(a0)
ffffffffc0206f32:	89ee                	mv	s3,s11
ffffffffc0206f34:	cb8fe06f          	j	ffffffffc02053ec <stride_dequeue+0x426>
ffffffffc0206f38:	010db503          	ld	a0,16(s11)
ffffffffc0206f3c:	008dbb03          	ld	s6,8(s11)
ffffffffc0206f40:	85ce                	mv	a1,s3
ffffffffc0206f42:	ea5fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206f46:	00adb423          	sd	a0,8(s11)
ffffffffc0206f4a:	016db823          	sd	s6,16(s11)
ffffffffc0206f4e:	7322                	ld	t1,40(sp)
ffffffffc0206f50:	7842                	ld	a6,48(sp)
ffffffffc0206f52:	010c2b03          	lw	s6,16(s8)
ffffffffc0206f56:	d60502e3          	beqz	a0,ffffffffc0206cba <stride_dequeue+0x1cf4>
ffffffffc0206f5a:	01b53023          	sd	s11,0(a0)
ffffffffc0206f5e:	89ee                	mv	s3,s11
ffffffffc0206f60:	b32fe06f          	j	ffffffffc0205292 <stride_dequeue+0x2cc>
ffffffffc0206f64:	89e6                	mv	s3,s9
ffffffffc0206f66:	dc2fe06f          	j	ffffffffc0205528 <stride_dequeue+0x562>
ffffffffc0206f6a:	89c6                	mv	s3,a7
ffffffffc0206f6c:	d1bfe06f          	j	ffffffffc0205c86 <stride_dequeue+0xcc0>
ffffffffc0206f70:	00003697          	auipc	a3,0x3
ffffffffc0206f74:	a1068693          	addi	a3,a3,-1520 # ffffffffc0209980 <default_pmm_manager+0x7c0>
ffffffffc0206f78:	00001617          	auipc	a2,0x1
ffffffffc0206f7c:	62860613          	addi	a2,a2,1576 # ffffffffc02085a0 <commands+0x410>
ffffffffc0206f80:	06300593          	li	a1,99
ffffffffc0206f84:	00003517          	auipc	a0,0x3
ffffffffc0206f88:	a2450513          	addi	a0,a0,-1500 # ffffffffc02099a8 <default_pmm_manager+0x7e8>
ffffffffc0206f8c:	a7cf90ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0206f90:	89d2                	mv	s3,s4
ffffffffc0206f92:	fb0fe06f          	j	ffffffffc0205742 <stride_dequeue+0x77c>
ffffffffc0206f96:	89c6                	mv	s3,a7
ffffffffc0206f98:	c21fe06f          	j	ffffffffc0205bb8 <stride_dequeue+0xbf2>
ffffffffc0206f9c:	89c6                	mv	s3,a7
ffffffffc0206f9e:	b3dfe06f          	j	ffffffffc0205ada <stride_dequeue+0xb14>
ffffffffc0206fa2:	89b2                	mv	s3,a2
ffffffffc0206fa4:	ea0fe06f          	j	ffffffffc0205644 <stride_dequeue+0x67e>
ffffffffc0206fa8:	0109b503          	ld	a0,16(s3)
ffffffffc0206fac:	0089bb03          	ld	s6,8(s3)
ffffffffc0206fb0:	85a6                	mv	a1,s1
ffffffffc0206fb2:	e35fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206fb6:	00a9b423          	sd	a0,8(s3)
ffffffffc0206fba:	0169b823          	sd	s6,16(s3)
ffffffffc0206fbe:	010c2b03          	lw	s6,16(s8)
ffffffffc0206fc2:	b4050363          	beqz	a0,ffffffffc0206308 <stride_dequeue+0x1342>
ffffffffc0206fc6:	01353023          	sd	s3,0(a0)
ffffffffc0206fca:	b3eff06f          	j	ffffffffc0206308 <stride_dequeue+0x1342>
ffffffffc0206fce:	0109b503          	ld	a0,16(s3)
ffffffffc0206fd2:	0089bb03          	ld	s6,8(s3)
ffffffffc0206fd6:	859a                	mv	a1,t1
ffffffffc0206fd8:	f446                	sd	a7,40(sp)
ffffffffc0206fda:	e0dfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0206fde:	00a9b423          	sd	a0,8(s3)
ffffffffc0206fe2:	0169b823          	sd	s6,16(s3)
ffffffffc0206fe6:	78a2                	ld	a7,40(sp)
ffffffffc0206fe8:	010c2b03          	lw	s6,16(s8)
ffffffffc0206fec:	100505e3          	beqz	a0,ffffffffc02078f6 <stride_dequeue+0x2930>
ffffffffc0206ff0:	01353023          	sd	s3,0(a0)
ffffffffc0206ff4:	834e                	mv	t1,s3
ffffffffc0206ff6:	b0c5                	j	ffffffffc02068d6 <stride_dequeue+0x1910>
ffffffffc0206ff8:	0109b503          	ld	a0,16(s3)
ffffffffc0206ffc:	0089bb03          	ld	s6,8(s3)
ffffffffc0207000:	85f2                	mv	a1,t3
ffffffffc0207002:	f442                	sd	a6,40(sp)
ffffffffc0207004:	f032                	sd	a2,32(sp)
ffffffffc0207006:	de1fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020700a:	00a9b423          	sd	a0,8(s3)
ffffffffc020700e:	0169b823          	sd	s6,16(s3)
ffffffffc0207012:	7602                	ld	a2,32(sp)
ffffffffc0207014:	7822                	ld	a6,40(sp)
ffffffffc0207016:	010c2b03          	lw	s6,16(s8)
ffffffffc020701a:	9e050b63          	beqz	a0,ffffffffc0206210 <stride_dequeue+0x124a>
ffffffffc020701e:	01353023          	sd	s3,0(a0)
ffffffffc0207022:	9eeff06f          	j	ffffffffc0206210 <stride_dequeue+0x124a>
ffffffffc0207026:	0109b503          	ld	a0,16(s3)
ffffffffc020702a:	0089bb03          	ld	s6,8(s3)
ffffffffc020702e:	859a                	mv	a1,t1
ffffffffc0207030:	f442                	sd	a6,40(sp)
ffffffffc0207032:	db5fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207036:	00a9b423          	sd	a0,8(s3)
ffffffffc020703a:	0169b823          	sd	s6,16(s3)
ffffffffc020703e:	7822                	ld	a6,40(sp)
ffffffffc0207040:	010c2b03          	lw	s6,16(s8)
ffffffffc0207044:	08050de3          	beqz	a0,ffffffffc02078de <stride_dequeue+0x2918>
ffffffffc0207048:	01353023          	sd	s3,0(a0)
ffffffffc020704c:	834e                	mv	t1,s3
ffffffffc020704e:	efaff06f          	j	ffffffffc0206748 <stride_dequeue+0x1782>
ffffffffc0207052:	89a6                	mv	s3,s1
ffffffffc0207054:	ab4ff06f          	j	ffffffffc0206308 <stride_dequeue+0x1342>
ffffffffc0207058:	0109b503          	ld	a0,16(s3)
ffffffffc020705c:	0089bb03          	ld	s6,8(s3)
ffffffffc0207060:	85ee                	mv	a1,s11
ffffffffc0207062:	f046                	sd	a7,32(sp)
ffffffffc0207064:	d83fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207068:	00a9b423          	sd	a0,8(s3)
ffffffffc020706c:	0169b823          	sd	s6,16(s3)
ffffffffc0207070:	7882                	ld	a7,32(sp)
ffffffffc0207072:	010c2b03          	lw	s6,16(s8)
ffffffffc0207076:	bc050f63          	beqz	a0,ffffffffc0206454 <stride_dequeue+0x148e>
ffffffffc020707a:	01353023          	sd	s3,0(a0)
ffffffffc020707e:	bd6ff06f          	j	ffffffffc0206454 <stride_dequeue+0x148e>
ffffffffc0207082:	0109b503          	ld	a0,16(s3)
ffffffffc0207086:	0089bb03          	ld	s6,8(s3)
ffffffffc020708a:	85f2                	mv	a1,t3
ffffffffc020708c:	f442                	sd	a6,40(sp)
ffffffffc020708e:	d59fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207092:	00a9b423          	sd	a0,8(s3)
ffffffffc0207096:	0169b823          	sd	s6,16(s3)
ffffffffc020709a:	7822                	ld	a6,40(sp)
ffffffffc020709c:	010c2b03          	lw	s6,16(s8)
ffffffffc02070a0:	e119                	bnez	a0,ffffffffc02070a6 <stride_dequeue+0x20e0>
ffffffffc02070a2:	8caff06f          	j	ffffffffc020616c <stride_dequeue+0x11a6>
ffffffffc02070a6:	01353023          	sd	s3,0(a0)
ffffffffc02070aa:	8c2ff06f          	j	ffffffffc020616c <stride_dequeue+0x11a6>
ffffffffc02070ae:	0109b503          	ld	a0,16(s3)
ffffffffc02070b2:	0089bb03          	ld	s6,8(s3)
ffffffffc02070b6:	85b2                	mv	a1,a2
ffffffffc02070b8:	ec46                	sd	a7,24(sp)
ffffffffc02070ba:	d2dfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02070be:	00a9b423          	sd	a0,8(s3)
ffffffffc02070c2:	0169b823          	sd	s6,16(s3)
ffffffffc02070c6:	68e2                	ld	a7,24(sp)
ffffffffc02070c8:	010c2b03          	lw	s6,16(s8)
ffffffffc02070cc:	c2050963          	beqz	a0,ffffffffc02064fe <stride_dequeue+0x1538>
ffffffffc02070d0:	01353023          	sd	s3,0(a0)
ffffffffc02070d4:	c2aff06f          	j	ffffffffc02064fe <stride_dequeue+0x1538>
ffffffffc02070d8:	0109b503          	ld	a0,16(s3)
ffffffffc02070dc:	0089bb03          	ld	s6,8(s3)
ffffffffc02070e0:	859a                	mv	a1,t1
ffffffffc02070e2:	f442                	sd	a6,40(sp)
ffffffffc02070e4:	f032                	sd	a2,32(sp)
ffffffffc02070e6:	d01fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02070ea:	00a9b423          	sd	a0,8(s3)
ffffffffc02070ee:	0169b823          	sd	s6,16(s3)
ffffffffc02070f2:	7602                	ld	a2,32(sp)
ffffffffc02070f4:	7822                	ld	a6,40(sp)
ffffffffc02070f6:	010c2b03          	lw	s6,16(s8)
ffffffffc02070fa:	7c050363          	beqz	a0,ffffffffc02078c0 <stride_dequeue+0x28fa>
ffffffffc02070fe:	01353023          	sd	s3,0(a0)
ffffffffc0207102:	834e                	mv	t1,s3
ffffffffc0207104:	eaeff06f          	j	ffffffffc02067b2 <stride_dequeue+0x17ec>
ffffffffc0207108:	0109b503          	ld	a0,16(s3)
ffffffffc020710c:	0089bb03          	ld	s6,8(s3)
ffffffffc0207110:	85c2                	mv	a1,a6
ffffffffc0207112:	ec32                	sd	a2,24(sp)
ffffffffc0207114:	cd3fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207118:	00a9b423          	sd	a0,8(s3)
ffffffffc020711c:	0169b823          	sd	s6,16(s3)
ffffffffc0207120:	6662                	ld	a2,24(sp)
ffffffffc0207122:	010c2b03          	lw	s6,16(s8)
ffffffffc0207126:	d2050263          	beqz	a0,ffffffffc020664a <stride_dequeue+0x1684>
ffffffffc020712a:	01353023          	sd	s3,0(a0)
ffffffffc020712e:	d1cff06f          	j	ffffffffc020664a <stride_dequeue+0x1684>
ffffffffc0207132:	0109b503          	ld	a0,16(s3)
ffffffffc0207136:	0089bb03          	ld	s6,8(s3)
ffffffffc020713a:	85c2                	mv	a1,a6
ffffffffc020713c:	cabfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207140:	00a9b423          	sd	a0,8(s3)
ffffffffc0207144:	0169b823          	sd	s6,16(s3)
ffffffffc0207148:	010c2b03          	lw	s6,16(s8)
ffffffffc020714c:	c4050b63          	beqz	a0,ffffffffc02065a2 <stride_dequeue+0x15dc>
ffffffffc0207150:	01353023          	sd	s3,0(a0)
ffffffffc0207154:	c4eff06f          	j	ffffffffc02065a2 <stride_dequeue+0x15dc>
ffffffffc0207158:	0109b503          	ld	a0,16(s3)
ffffffffc020715c:	0089bb03          	ld	s6,8(s3)
ffffffffc0207160:	859a                	mv	a1,t1
ffffffffc0207162:	c85fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207166:	00a9b423          	sd	a0,8(s3)
ffffffffc020716a:	0169b823          	sd	s6,16(s3)
ffffffffc020716e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207172:	e119                	bnez	a0,ffffffffc0207178 <stride_dequeue+0x21b2>
ffffffffc0207174:	c77fe06f          	j	ffffffffc0205dea <stride_dequeue+0xe24>
ffffffffc0207178:	01353023          	sd	s3,0(a0)
ffffffffc020717c:	c6ffe06f          	j	ffffffffc0205dea <stride_dequeue+0xe24>
ffffffffc0207180:	6a08                	ld	a0,16(a2)
ffffffffc0207182:	85f2                	mv	a1,t3
ffffffffc0207184:	00863b03          	ld	s6,8(a2)
ffffffffc0207188:	c5ffd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020718c:	7602                	ld	a2,32(sp)
ffffffffc020718e:	7822                	ld	a6,40(sp)
ffffffffc0207190:	01663823          	sd	s6,16(a2)
ffffffffc0207194:	e608                	sd	a0,8(a2)
ffffffffc0207196:	010c2b03          	lw	s6,16(s8)
ffffffffc020719a:	e119                	bnez	a0,ffffffffc02071a0 <stride_dequeue+0x21da>
ffffffffc020719c:	c9afe06f          	j	ffffffffc0205636 <stride_dequeue+0x670>
ffffffffc02071a0:	e110                	sd	a2,0(a0)
ffffffffc02071a2:	c94fe06f          	j	ffffffffc0205636 <stride_dequeue+0x670>
ffffffffc02071a6:	010a3503          	ld	a0,16(s4)
ffffffffc02071aa:	008a3b03          	ld	s6,8(s4)
ffffffffc02071ae:	859a                	mv	a1,t1
ffffffffc02071b0:	c37fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02071b4:	00aa3423          	sd	a0,8(s4)
ffffffffc02071b8:	016a3823          	sd	s6,16(s4)
ffffffffc02071bc:	010c2b03          	lw	s6,16(s8)
ffffffffc02071c0:	e119                	bnez	a0,ffffffffc02071c6 <stride_dequeue+0x2200>
ffffffffc02071c2:	83dfe06f          	j	ffffffffc02059fe <stride_dequeue+0xa38>
ffffffffc02071c6:	01453023          	sd	s4,0(a0)
ffffffffc02071ca:	835fe06f          	j	ffffffffc02059fe <stride_dequeue+0xa38>
ffffffffc02071ce:	010cb503          	ld	a0,16(s9)
ffffffffc02071d2:	008cbb03          	ld	s6,8(s9)
ffffffffc02071d6:	85f2                	mv	a1,t3
ffffffffc02071d8:	f442                	sd	a6,40(sp)
ffffffffc02071da:	c0dfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02071de:	00acb423          	sd	a0,8(s9)
ffffffffc02071e2:	016cb823          	sd	s6,16(s9)
ffffffffc02071e6:	7822                	ld	a6,40(sp)
ffffffffc02071e8:	010c2b03          	lw	s6,16(s8)
ffffffffc02071ec:	e119                	bnez	a0,ffffffffc02071f2 <stride_dequeue+0x222c>
ffffffffc02071ee:	b2cfe06f          	j	ffffffffc020551a <stride_dequeue+0x554>
ffffffffc02071f2:	01953023          	sd	s9,0(a0)
ffffffffc02071f6:	b24fe06f          	j	ffffffffc020551a <stride_dequeue+0x554>
ffffffffc02071fa:	010a3503          	ld	a0,16(s4)
ffffffffc02071fe:	008a3b03          	ld	s6,8(s4)
ffffffffc0207202:	85f2                	mv	a1,t3
ffffffffc0207204:	f442                	sd	a6,40(sp)
ffffffffc0207206:	be1fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020720a:	00aa3423          	sd	a0,8(s4)
ffffffffc020720e:	016a3823          	sd	s6,16(s4)
ffffffffc0207212:	7822                	ld	a6,40(sp)
ffffffffc0207214:	010c2b03          	lw	s6,16(s8)
ffffffffc0207218:	e119                	bnez	a0,ffffffffc020721e <stride_dequeue+0x2258>
ffffffffc020721a:	d1afe06f          	j	ffffffffc0205734 <stride_dequeue+0x76e>
ffffffffc020721e:	01453023          	sd	s4,0(a0)
ffffffffc0207222:	d12fe06f          	j	ffffffffc0205734 <stride_dequeue+0x76e>
ffffffffc0207226:	0108b503          	ld	a0,16(a7)
ffffffffc020722a:	85f2                	mv	a1,t3
ffffffffc020722c:	0088bb03          	ld	s6,8(a7)
ffffffffc0207230:	f046                	sd	a7,32(sp)
ffffffffc0207232:	bb5fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207236:	7882                	ld	a7,32(sp)
ffffffffc0207238:	7622                	ld	a2,40(sp)
ffffffffc020723a:	0168b823          	sd	s6,16(a7)
ffffffffc020723e:	00a8b423          	sd	a0,8(a7)
ffffffffc0207242:	010c2b03          	lw	s6,16(s8)
ffffffffc0207246:	e119                	bnez	a0,ffffffffc020724c <stride_dequeue+0x2286>
ffffffffc0207248:	963fe06f          	j	ffffffffc0205baa <stride_dequeue+0xbe4>
ffffffffc020724c:	01153023          	sd	a7,0(a0)
ffffffffc0207250:	95bfe06f          	j	ffffffffc0205baa <stride_dequeue+0xbe4>
ffffffffc0207254:	0108b503          	ld	a0,16(a7)
ffffffffc0207258:	85f2                	mv	a1,t3
ffffffffc020725a:	0088bb03          	ld	s6,8(a7)
ffffffffc020725e:	f446                	sd	a7,40(sp)
ffffffffc0207260:	b87fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207264:	78a2                	ld	a7,40(sp)
ffffffffc0207266:	0168b823          	sd	s6,16(a7)
ffffffffc020726a:	00a8b423          	sd	a0,8(a7)
ffffffffc020726e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207272:	e119                	bnez	a0,ffffffffc0207278 <stride_dequeue+0x22b2>
ffffffffc0207274:	a05fe06f          	j	ffffffffc0205c78 <stride_dequeue+0xcb2>
ffffffffc0207278:	01153023          	sd	a7,0(a0)
ffffffffc020727c:	9fdfe06f          	j	ffffffffc0205c78 <stride_dequeue+0xcb2>
ffffffffc0207280:	0109b503          	ld	a0,16(s3)
ffffffffc0207284:	0089bb03          	ld	s6,8(s3)
ffffffffc0207288:	85c2                	mv	a1,a6
ffffffffc020728a:	f446                	sd	a7,40(sp)
ffffffffc020728c:	b5bfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207290:	00a9b423          	sd	a0,8(s3)
ffffffffc0207294:	0169b823          	sd	s6,16(s3)
ffffffffc0207298:	78a2                	ld	a7,40(sp)
ffffffffc020729a:	010c2b03          	lw	s6,16(s8)
ffffffffc020729e:	66050563          	beqz	a0,ffffffffc0207908 <stride_dequeue+0x2942>
ffffffffc02072a2:	01353023          	sd	s3,0(a0)
ffffffffc02072a6:	884e                	mv	a6,s3
ffffffffc02072a8:	d6aff06f          	j	ffffffffc0206812 <stride_dequeue+0x184c>
ffffffffc02072ac:	0109b503          	ld	a0,16(s3)
ffffffffc02072b0:	0089bb03          	ld	s6,8(s3)
ffffffffc02072b4:	85f2                	mv	a1,t3
ffffffffc02072b6:	f442                	sd	a6,40(sp)
ffffffffc02072b8:	b2ffd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02072bc:	00a9b423          	sd	a0,8(s3)
ffffffffc02072c0:	0169b823          	sd	s6,16(s3)
ffffffffc02072c4:	7822                	ld	a6,40(sp)
ffffffffc02072c6:	010c2b03          	lw	s6,16(s8)
ffffffffc02072ca:	e119                	bnez	a0,ffffffffc02072d0 <stride_dequeue+0x230a>
ffffffffc02072cc:	e05fe06f          	j	ffffffffc02060d0 <stride_dequeue+0x110a>
ffffffffc02072d0:	01353023          	sd	s3,0(a0)
ffffffffc02072d4:	dfdfe06f          	j	ffffffffc02060d0 <stride_dequeue+0x110a>
ffffffffc02072d8:	0109b503          	ld	a0,16(s3)
ffffffffc02072dc:	0089bb03          	ld	s6,8(s3)
ffffffffc02072e0:	859a                	mv	a1,t1
ffffffffc02072e2:	f442                	sd	a6,40(sp)
ffffffffc02072e4:	b03fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02072e8:	00a9b423          	sd	a0,8(s3)
ffffffffc02072ec:	0169b823          	sd	s6,16(s3)
ffffffffc02072f0:	7822                	ld	a6,40(sp)
ffffffffc02072f2:	010c2b03          	lw	s6,16(s8)
ffffffffc02072f6:	64050163          	beqz	a0,ffffffffc0207938 <stride_dequeue+0x2972>
ffffffffc02072fa:	01353023          	sd	s3,0(a0)
ffffffffc02072fe:	834e                	mv	t1,s3
ffffffffc0207300:	d76ff06f          	j	ffffffffc0206876 <stride_dequeue+0x18b0>
ffffffffc0207304:	0109b503          	ld	a0,16(s3)
ffffffffc0207308:	0089bb03          	ld	s6,8(s3)
ffffffffc020730c:	85f2                	mv	a1,t3
ffffffffc020730e:	f446                	sd	a7,40(sp)
ffffffffc0207310:	ad7fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207314:	00a9b423          	sd	a0,8(s3)
ffffffffc0207318:	0169b823          	sd	s6,16(s3)
ffffffffc020731c:	78a2                	ld	a7,40(sp)
ffffffffc020731e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207322:	e119                	bnez	a0,ffffffffc0207328 <stride_dequeue+0x2362>
ffffffffc0207324:	d0ffe06f          	j	ffffffffc0206032 <stride_dequeue+0x106c>
ffffffffc0207328:	01353023          	sd	s3,0(a0)
ffffffffc020732c:	d07fe06f          	j	ffffffffc0206032 <stride_dequeue+0x106c>
ffffffffc0207330:	0109b503          	ld	a0,16(s3)
ffffffffc0207334:	0089bb03          	ld	s6,8(s3)
ffffffffc0207338:	859a                	mv	a1,t1
ffffffffc020733a:	aadfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020733e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207342:	0169b823          	sd	s6,16(s3)
ffffffffc0207346:	010c2b03          	lw	s6,16(s8)
ffffffffc020734a:	e119                	bnez	a0,ffffffffc0207350 <stride_dequeue+0x238a>
ffffffffc020734c:	c49fe06f          	j	ffffffffc0205f94 <stride_dequeue+0xfce>
ffffffffc0207350:	01353023          	sd	s3,0(a0)
ffffffffc0207354:	c41fe06f          	j	ffffffffc0205f94 <stride_dequeue+0xfce>
ffffffffc0207358:	0109b503          	ld	a0,16(s3)
ffffffffc020735c:	0089bb03          	ld	s6,8(s3)
ffffffffc0207360:	859a                	mv	a1,t1
ffffffffc0207362:	ec32                	sd	a2,24(sp)
ffffffffc0207364:	a83fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207368:	00a9b423          	sd	a0,8(s3)
ffffffffc020736c:	0169b823          	sd	s6,16(s3)
ffffffffc0207370:	6662                	ld	a2,24(sp)
ffffffffc0207372:	010c2b03          	lw	s6,16(s8)
ffffffffc0207376:	e119                	bnez	a0,ffffffffc020737c <stride_dequeue+0x23b6>
ffffffffc0207378:	b4ffe06f          	j	ffffffffc0205ec6 <stride_dequeue+0xf00>
ffffffffc020737c:	01353023          	sd	s3,0(a0)
ffffffffc0207380:	b47fe06f          	j	ffffffffc0205ec6 <stride_dequeue+0xf00>
ffffffffc0207384:	0108b503          	ld	a0,16(a7)
ffffffffc0207388:	85f2                	mv	a1,t3
ffffffffc020738a:	0088bb03          	ld	s6,8(a7)
ffffffffc020738e:	f446                	sd	a7,40(sp)
ffffffffc0207390:	a57fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207394:	78a2                	ld	a7,40(sp)
ffffffffc0207396:	0168b823          	sd	s6,16(a7)
ffffffffc020739a:	00a8b423          	sd	a0,8(a7)
ffffffffc020739e:	010c2b03          	lw	s6,16(s8)
ffffffffc02073a2:	e119                	bnez	a0,ffffffffc02073a8 <stride_dequeue+0x23e2>
ffffffffc02073a4:	f28fe06f          	j	ffffffffc0205acc <stride_dequeue+0xb06>
ffffffffc02073a8:	01153023          	sd	a7,0(a0)
ffffffffc02073ac:	f20fe06f          	j	ffffffffc0205acc <stride_dequeue+0xb06>
ffffffffc02073b0:	0109b503          	ld	a0,16(s3)
ffffffffc02073b4:	0089bb03          	ld	s6,8(s3)
ffffffffc02073b8:	85d2                	mv	a1,s4
ffffffffc02073ba:	f046                	sd	a7,32(sp)
ffffffffc02073bc:	a2bfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02073c0:	00a9b423          	sd	a0,8(s3)
ffffffffc02073c4:	0169b823          	sd	s6,16(s3)
ffffffffc02073c8:	7882                	ld	a7,32(sp)
ffffffffc02073ca:	010c2b03          	lw	s6,16(s8)
ffffffffc02073ce:	e119                	bnez	a0,ffffffffc02073d4 <stride_dequeue+0x240e>
ffffffffc02073d0:	fe1fe06f          	j	ffffffffc02063b0 <stride_dequeue+0x13ea>
ffffffffc02073d4:	01353023          	sd	s3,0(a0)
ffffffffc02073d8:	fd9fe06f          	j	ffffffffc02063b0 <stride_dequeue+0x13ea>
ffffffffc02073dc:	0109b503          	ld	a0,16(s3)
ffffffffc02073e0:	0089bb03          	ld	s6,8(s3)
ffffffffc02073e4:	85c2                	mv	a1,a6
ffffffffc02073e6:	a01fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02073ea:	00a9b423          	sd	a0,8(s3)
ffffffffc02073ee:	0169b823          	sd	s6,16(s3)
ffffffffc02073f2:	010c2b03          	lw	s6,16(s8)
ffffffffc02073f6:	ae050863          	beqz	a0,ffffffffc02066e6 <stride_dequeue+0x1720>
ffffffffc02073fa:	01353023          	sd	s3,0(a0)
ffffffffc02073fe:	ae8ff06f          	j	ffffffffc02066e6 <stride_dequeue+0x1720>
ffffffffc0207402:	89d2                	mv	s3,s4
ffffffffc0207404:	fadfe06f          	j	ffffffffc02063b0 <stride_dequeue+0x13ea>
ffffffffc0207408:	89ee                	mv	s3,s11
ffffffffc020740a:	84aff06f          	j	ffffffffc0206454 <stride_dequeue+0x148e>
ffffffffc020740e:	89c2                	mv	s3,a6
ffffffffc0207410:	992ff06f          	j	ffffffffc02065a2 <stride_dequeue+0x15dc>
ffffffffc0207414:	89c2                	mv	s3,a6
ffffffffc0207416:	a34ff06f          	j	ffffffffc020664a <stride_dequeue+0x1684>
ffffffffc020741a:	89b2                	mv	s3,a2
ffffffffc020741c:	8e2ff06f          	j	ffffffffc02064fe <stride_dequeue+0x1538>
ffffffffc0207420:	89c2                	mv	s3,a6
ffffffffc0207422:	ac4ff06f          	j	ffffffffc02066e6 <stride_dequeue+0x1720>
ffffffffc0207426:	01083503          	ld	a0,16(a6)
ffffffffc020742a:	85e6                	mv	a1,s9
ffffffffc020742c:	00883b03          	ld	s6,8(a6)
ffffffffc0207430:	9b7fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207434:	7802                	ld	a6,32(sp)
ffffffffc0207436:	01683823          	sd	s6,16(a6)
ffffffffc020743a:	00a83423          	sd	a0,8(a6)
ffffffffc020743e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207442:	50050163          	beqz	a0,ffffffffc0207944 <stride_dequeue+0x297e>
ffffffffc0207446:	01053023          	sd	a6,0(a0)
ffffffffc020744a:	8cc2                	mv	s9,a6
ffffffffc020744c:	d62ff06f          	j	ffffffffc02069ae <stride_dequeue+0x19e8>
ffffffffc0207450:	01083503          	ld	a0,16(a6)
ffffffffc0207454:	85d2                	mv	a1,s4
ffffffffc0207456:	00883b03          	ld	s6,8(a6)
ffffffffc020745a:	98dfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020745e:	6862                	ld	a6,24(sp)
ffffffffc0207460:	7602                	ld	a2,32(sp)
ffffffffc0207462:	01683823          	sd	s6,16(a6)
ffffffffc0207466:	00a83423          	sd	a0,8(a6)
ffffffffc020746a:	010c2b03          	lw	s6,16(s8)
ffffffffc020746e:	4c050863          	beqz	a0,ffffffffc020793e <stride_dequeue+0x2978>
ffffffffc0207472:	01053023          	sd	a6,0(a0)
ffffffffc0207476:	8a42                	mv	s4,a6
ffffffffc0207478:	d94ff06f          	j	ffffffffc0206a0c <stride_dequeue+0x1a46>
ffffffffc020747c:	89f2                	mv	s3,t3
ffffffffc020747e:	bb5fe06f          	j	ffffffffc0206032 <stride_dequeue+0x106c>
ffffffffc0207482:	88f2                	mv	a7,t3
ffffffffc0207484:	e48fe06f          	j	ffffffffc0205acc <stride_dequeue+0xb06>
ffffffffc0207488:	89f2                	mv	s3,t3
ffffffffc020748a:	ce3fe06f          	j	ffffffffc020616c <stride_dequeue+0x11a6>
ffffffffc020748e:	89f2                	mv	s3,t3
ffffffffc0207490:	c41fe06f          	j	ffffffffc02060d0 <stride_dequeue+0x110a>
ffffffffc0207494:	88f2                	mv	a7,t3
ffffffffc0207496:	fe2fe06f          	j	ffffffffc0205c78 <stride_dequeue+0xcb2>
ffffffffc020749a:	87ce                	mv	a5,s3
ffffffffc020749c:	ddffe06f          	j	ffffffffc020627a <stride_dequeue+0x12b4>
ffffffffc02074a0:	0108b503          	ld	a0,16(a7)
ffffffffc02074a4:	85ce                	mv	a1,s3
ffffffffc02074a6:	0088bb03          	ld	s6,8(a7)
ffffffffc02074aa:	93dfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02074ae:	7882                	ld	a7,32(sp)
ffffffffc02074b0:	0168b823          	sd	s6,16(a7)
ffffffffc02074b4:	00a8b423          	sd	a0,8(a7)
ffffffffc02074b8:	010c2b03          	lw	s6,16(s8)
ffffffffc02074bc:	42050a63          	beqz	a0,ffffffffc02078f0 <stride_dequeue+0x292a>
ffffffffc02074c0:	01153023          	sd	a7,0(a0)
ffffffffc02074c4:	89c6                	mv	s3,a7
ffffffffc02074c6:	d9cff06f          	j	ffffffffc0206a62 <stride_dequeue+0x1a9c>
ffffffffc02074ca:	8cf2                	mv	s9,t3
ffffffffc02074cc:	84efe06f          	j	ffffffffc020551a <stride_dequeue+0x554>
ffffffffc02074d0:	8a72                	mv	s4,t3
ffffffffc02074d2:	a62fe06f          	j	ffffffffc0205734 <stride_dequeue+0x76e>
ffffffffc02074d6:	88f2                	mv	a7,t3
ffffffffc02074d8:	ed2fe06f          	j	ffffffffc0205baa <stride_dequeue+0xbe4>
ffffffffc02074dc:	89f2                	mv	s3,t3
ffffffffc02074de:	d33fe06f          	j	ffffffffc0206210 <stride_dequeue+0x124a>
ffffffffc02074e2:	0109b503          	ld	a0,16(s3)
ffffffffc02074e6:	0089bb03          	ld	s6,8(s3)
ffffffffc02074ea:	85c6                	mv	a1,a7
ffffffffc02074ec:	8fbfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02074f0:	00a9b423          	sd	a0,8(s3)
ffffffffc02074f4:	0169b823          	sd	s6,16(s3)
ffffffffc02074f8:	010c2b03          	lw	s6,16(s8)
ffffffffc02074fc:	e119                	bnez	a0,ffffffffc0207502 <stride_dequeue+0x253c>
ffffffffc02074fe:	dfdfe06f          	j	ffffffffc02062fa <stride_dequeue+0x1334>
ffffffffc0207502:	01353023          	sd	s3,0(a0)
ffffffffc0207506:	df5fe06f          	j	ffffffffc02062fa <stride_dequeue+0x1334>
ffffffffc020750a:	01083503          	ld	a0,16(a6)
ffffffffc020750e:	85d2                	mv	a1,s4
ffffffffc0207510:	00883b03          	ld	s6,8(a6)
ffffffffc0207514:	8d3fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207518:	7802                	ld	a6,32(sp)
ffffffffc020751a:	01683823          	sd	s6,16(a6)
ffffffffc020751e:	00a83423          	sd	a0,8(a6)
ffffffffc0207522:	010c2b03          	lw	s6,16(s8)
ffffffffc0207526:	3a050363          	beqz	a0,ffffffffc02078cc <stride_dequeue+0x2906>
ffffffffc020752a:	01053023          	sd	a6,0(a0)
ffffffffc020752e:	8a42                	mv	s4,a6
ffffffffc0207530:	c28ff06f          	j	ffffffffc0206958 <stride_dequeue+0x1992>
ffffffffc0207534:	8672                	mv	a2,t3
ffffffffc0207536:	900fe06f          	j	ffffffffc0205636 <stride_dequeue+0x670>
ffffffffc020753a:	0108b503          	ld	a0,16(a7)
ffffffffc020753e:	85ce                	mv	a1,s3
ffffffffc0207540:	0088bb03          	ld	s6,8(a7)
ffffffffc0207544:	8a3fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207548:	7882                	ld	a7,32(sp)
ffffffffc020754a:	7622                	ld	a2,40(sp)
ffffffffc020754c:	7842                	ld	a6,48(sp)
ffffffffc020754e:	0168b823          	sd	s6,16(a7)
ffffffffc0207552:	00a8b423          	sd	a0,8(a7)
ffffffffc0207556:	010c2b03          	lw	s6,16(s8)
ffffffffc020755a:	3c050c63          	beqz	a0,ffffffffc0207932 <stride_dequeue+0x296c>
ffffffffc020755e:	01153023          	sd	a7,0(a0)
ffffffffc0207562:	89c6                	mv	s3,a7
ffffffffc0207564:	dc0ff06f          	j	ffffffffc0206b24 <stride_dequeue+0x1b5e>
ffffffffc0207568:	0109b503          	ld	a0,16(s3)
ffffffffc020756c:	0089bb03          	ld	s6,8(s3)
ffffffffc0207570:	85f2                	mv	a1,t3
ffffffffc0207572:	f41a                	sd	t1,40(sp)
ffffffffc0207574:	873fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207578:	00a9b423          	sd	a0,8(s3)
ffffffffc020757c:	0169b823          	sd	s6,16(s3)
ffffffffc0207580:	7322                	ld	t1,40(sp)
ffffffffc0207582:	010c2b03          	lw	s6,16(s8)
ffffffffc0207586:	e119                	bnez	a0,ffffffffc020758c <stride_dequeue+0x25c6>
ffffffffc0207588:	9fdfe06f          	j	ffffffffc0205f84 <stride_dequeue+0xfbe>
ffffffffc020758c:	01353023          	sd	s3,0(a0)
ffffffffc0207590:	9f5fe06f          	j	ffffffffc0205f84 <stride_dequeue+0xfbe>
ffffffffc0207594:	01033503          	ld	a0,16(t1)
ffffffffc0207598:	85e6                	mv	a1,s9
ffffffffc020759a:	00833b03          	ld	s6,8(t1)
ffffffffc020759e:	849fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02075a2:	7322                	ld	t1,40(sp)
ffffffffc02075a4:	78c2                	ld	a7,48(sp)
ffffffffc02075a6:	01633823          	sd	s6,16(t1)
ffffffffc02075aa:	00a33423          	sd	a0,8(t1)
ffffffffc02075ae:	010c2b03          	lw	s6,16(s8)
ffffffffc02075b2:	34050e63          	beqz	a0,ffffffffc020790e <stride_dequeue+0x2948>
ffffffffc02075b6:	00653023          	sd	t1,0(a0)
ffffffffc02075ba:	8c9a                	mv	s9,t1
ffffffffc02075bc:	eeaff06f          	j	ffffffffc0206ca6 <stride_dequeue+0x1ce0>
ffffffffc02075c0:	01033503          	ld	a0,16(t1)
ffffffffc02075c4:	85c2                	mv	a1,a6
ffffffffc02075c6:	00833b03          	ld	s6,8(t1)
ffffffffc02075ca:	81dfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02075ce:	7322                	ld	t1,40(sp)
ffffffffc02075d0:	01633823          	sd	s6,16(t1)
ffffffffc02075d4:	00a33423          	sd	a0,8(t1)
ffffffffc02075d8:	010c2b03          	lw	s6,16(s8)
ffffffffc02075dc:	32050c63          	beqz	a0,ffffffffc0207914 <stride_dequeue+0x294e>
ffffffffc02075e0:	00653023          	sd	t1,0(a0)
ffffffffc02075e4:	881a                	mv	a6,t1
ffffffffc02075e6:	f24ff06f          	j	ffffffffc0206d0a <stride_dequeue+0x1d44>
ffffffffc02075ea:	0108b503          	ld	a0,16(a7)
ffffffffc02075ee:	85ce                	mv	a1,s3
ffffffffc02075f0:	0088bb03          	ld	s6,8(a7)
ffffffffc02075f4:	ff2fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02075f8:	78a2                	ld	a7,40(sp)
ffffffffc02075fa:	7842                	ld	a6,48(sp)
ffffffffc02075fc:	0168b823          	sd	s6,16(a7)
ffffffffc0207600:	00a8b423          	sd	a0,8(a7)
ffffffffc0207604:	010c2b03          	lw	s6,16(s8)
ffffffffc0207608:	30050963          	beqz	a0,ffffffffc020791a <stride_dequeue+0x2954>
ffffffffc020760c:	01153023          	sd	a7,0(a0)
ffffffffc0207610:	89c6                	mv	s3,a7
ffffffffc0207612:	caeff06f          	j	ffffffffc0206ac0 <stride_dequeue+0x1afa>
ffffffffc0207616:	01083503          	ld	a0,16(a6)
ffffffffc020761a:	85ce                	mv	a1,s3
ffffffffc020761c:	00883b03          	ld	s6,8(a6)
ffffffffc0207620:	fc6fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207624:	7822                	ld	a6,40(sp)
ffffffffc0207626:	78c2                	ld	a7,48(sp)
ffffffffc0207628:	01683823          	sd	s6,16(a6)
ffffffffc020762c:	00a83423          	sd	a0,8(a6)
ffffffffc0207630:	010c2b03          	lw	s6,16(s8)
ffffffffc0207634:	30050b63          	beqz	a0,ffffffffc020794a <stride_dequeue+0x2984>
ffffffffc0207638:	01053023          	sd	a6,0(a0)
ffffffffc020763c:	89c2                	mv	s3,a6
ffffffffc020763e:	da6ff06f          	j	ffffffffc0206be4 <stride_dequeue+0x1c1e>
ffffffffc0207642:	01083503          	ld	a0,16(a6)
ffffffffc0207646:	85ce                	mv	a1,s3
ffffffffc0207648:	00883b03          	ld	s6,8(a6)
ffffffffc020764c:	f9afd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207650:	7802                	ld	a6,32(sp)
ffffffffc0207652:	7622                	ld	a2,40(sp)
ffffffffc0207654:	78c2                	ld	a7,48(sp)
ffffffffc0207656:	01683823          	sd	s6,16(a6)
ffffffffc020765a:	00a83423          	sd	a0,8(a6)
ffffffffc020765e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207662:	2a050063          	beqz	a0,ffffffffc0207902 <stride_dequeue+0x293c>
ffffffffc0207666:	01053023          	sd	a6,0(a0)
ffffffffc020766a:	89c2                	mv	s3,a6
ffffffffc020766c:	ddcff06f          	j	ffffffffc0206c48 <stride_dequeue+0x1c82>
ffffffffc0207670:	0109b503          	ld	a0,16(s3)
ffffffffc0207674:	0089bb03          	ld	s6,8(s3)
ffffffffc0207678:	85f2                	mv	a1,t3
ffffffffc020767a:	f41a                	sd	t1,40(sp)
ffffffffc020767c:	f6afd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207680:	00a9b423          	sd	a0,8(s3)
ffffffffc0207684:	0169b823          	sd	s6,16(s3)
ffffffffc0207688:	7322                	ld	t1,40(sp)
ffffffffc020768a:	010c2b03          	lw	s6,16(s8)
ffffffffc020768e:	e119                	bnez	a0,ffffffffc0207694 <stride_dequeue+0x26ce>
ffffffffc0207690:	f4afe06f          	j	ffffffffc0205dda <stride_dequeue+0xe14>
ffffffffc0207694:	01353023          	sd	s3,0(a0)
ffffffffc0207698:	f42fe06f          	j	ffffffffc0205dda <stride_dequeue+0xe14>
ffffffffc020769c:	0109b503          	ld	a0,16(s3)
ffffffffc02076a0:	0089bb03          	ld	s6,8(s3)
ffffffffc02076a4:	85f2                	mv	a1,t3
ffffffffc02076a6:	f446                	sd	a7,40(sp)
ffffffffc02076a8:	f3efd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02076ac:	00a9b423          	sd	a0,8(s3)
ffffffffc02076b0:	0169b823          	sd	s6,16(s3)
ffffffffc02076b4:	78a2                	ld	a7,40(sp)
ffffffffc02076b6:	010c2b03          	lw	s6,16(s8)
ffffffffc02076ba:	e119                	bnez	a0,ffffffffc02076c0 <stride_dequeue+0x26fa>
ffffffffc02076bc:	ce5fe06f          	j	ffffffffc02063a0 <stride_dequeue+0x13da>
ffffffffc02076c0:	01353023          	sd	s3,0(a0)
ffffffffc02076c4:	cddfe06f          	j	ffffffffc02063a0 <stride_dequeue+0x13da>
ffffffffc02076c8:	0109b503          	ld	a0,16(s3)
ffffffffc02076cc:	0089bb03          	ld	s6,8(s3)
ffffffffc02076d0:	85f2                	mv	a1,t3
ffffffffc02076d2:	f446                	sd	a7,40(sp)
ffffffffc02076d4:	f032                	sd	a2,32(sp)
ffffffffc02076d6:	f10fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02076da:	00a9b423          	sd	a0,8(s3)
ffffffffc02076de:	0169b823          	sd	s6,16(s3)
ffffffffc02076e2:	7602                	ld	a2,32(sp)
ffffffffc02076e4:	78a2                	ld	a7,40(sp)
ffffffffc02076e6:	010c2b03          	lw	s6,16(s8)
ffffffffc02076ea:	e119                	bnez	a0,ffffffffc02076f0 <stride_dequeue+0x272a>
ffffffffc02076ec:	e05fe06f          	j	ffffffffc02064f0 <stride_dequeue+0x152a>
ffffffffc02076f0:	01353023          	sd	s3,0(a0)
ffffffffc02076f4:	dfdfe06f          	j	ffffffffc02064f0 <stride_dequeue+0x152a>
ffffffffc02076f8:	010a3503          	ld	a0,16(s4)
ffffffffc02076fc:	008a3b03          	ld	s6,8(s4)
ffffffffc0207700:	85f2                	mv	a1,t3
ffffffffc0207702:	f41a                	sd	t1,40(sp)
ffffffffc0207704:	ee2fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207708:	00aa3423          	sd	a0,8(s4)
ffffffffc020770c:	016a3823          	sd	s6,16(s4)
ffffffffc0207710:	7322                	ld	t1,40(sp)
ffffffffc0207712:	010c2b03          	lw	s6,16(s8)
ffffffffc0207716:	e119                	bnez	a0,ffffffffc020771c <stride_dequeue+0x2756>
ffffffffc0207718:	ad6fe06f          	j	ffffffffc02059ee <stride_dequeue+0xa28>
ffffffffc020771c:	01453023          	sd	s4,0(a0)
ffffffffc0207720:	acefe06f          	j	ffffffffc02059ee <stride_dequeue+0xa28>
ffffffffc0207724:	0109b503          	ld	a0,16(s3)
ffffffffc0207728:	0089bb03          	ld	s6,8(s3)
ffffffffc020772c:	85f2                	mv	a1,t3
ffffffffc020772e:	f446                	sd	a7,40(sp)
ffffffffc0207730:	eb6fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207734:	00a9b423          	sd	a0,8(s3)
ffffffffc0207738:	0169b823          	sd	s6,16(s3)
ffffffffc020773c:	78a2                	ld	a7,40(sp)
ffffffffc020773e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207742:	e119                	bnez	a0,ffffffffc0207748 <stride_dequeue+0x2782>
ffffffffc0207744:	d01fe06f          	j	ffffffffc0206444 <stride_dequeue+0x147e>
ffffffffc0207748:	01353023          	sd	s3,0(a0)
ffffffffc020774c:	cf9fe06f          	j	ffffffffc0206444 <stride_dequeue+0x147e>
ffffffffc0207750:	01033503          	ld	a0,16(t1)
ffffffffc0207754:	85c2                	mv	a1,a6
ffffffffc0207756:	00833b03          	ld	s6,8(t1)
ffffffffc020775a:	e8cfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020775e:	7322                	ld	t1,40(sp)
ffffffffc0207760:	01633823          	sd	s6,16(t1)
ffffffffc0207764:	00a33423          	sd	a0,8(t1)
ffffffffc0207768:	010c2b03          	lw	s6,16(s8)
ffffffffc020776c:	1e050b63          	beqz	a0,ffffffffc0207962 <stride_dequeue+0x299c>
ffffffffc0207770:	00653023          	sd	t1,0(a0)
ffffffffc0207774:	881a                	mv	a6,t1
ffffffffc0207776:	e50ff06f          	j	ffffffffc0206dc6 <stride_dequeue+0x1e00>
ffffffffc020777a:	0109b503          	ld	a0,16(s3)
ffffffffc020777e:	0089bb03          	ld	s6,8(s3)
ffffffffc0207782:	85f2                	mv	a1,t3
ffffffffc0207784:	f442                	sd	a6,40(sp)
ffffffffc0207786:	f032                	sd	a2,32(sp)
ffffffffc0207788:	e5efd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020778c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207790:	0169b823          	sd	s6,16(s3)
ffffffffc0207794:	7602                	ld	a2,32(sp)
ffffffffc0207796:	7822                	ld	a6,40(sp)
ffffffffc0207798:	010c2b03          	lw	s6,16(s8)
ffffffffc020779c:	e119                	bnez	a0,ffffffffc02077a2 <stride_dequeue+0x27dc>
ffffffffc020779e:	e9dfe06f          	j	ffffffffc020663a <stride_dequeue+0x1674>
ffffffffc02077a2:	01353023          	sd	s3,0(a0)
ffffffffc02077a6:	e95fe06f          	j	ffffffffc020663a <stride_dequeue+0x1674>
ffffffffc02077aa:	0108b503          	ld	a0,16(a7)
ffffffffc02077ae:	85ce                	mv	a1,s3
ffffffffc02077b0:	0088bb03          	ld	s6,8(a7)
ffffffffc02077b4:	e32fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02077b8:	78a2                	ld	a7,40(sp)
ffffffffc02077ba:	7842                	ld	a6,48(sp)
ffffffffc02077bc:	0168b823          	sd	s6,16(a7)
ffffffffc02077c0:	00a8b423          	sd	a0,8(a7)
ffffffffc02077c4:	010c2b03          	lw	s6,16(s8)
ffffffffc02077c8:	0e050f63          	beqz	a0,ffffffffc02078c6 <stride_dequeue+0x2900>
ffffffffc02077cc:	01153023          	sd	a7,0(a0)
ffffffffc02077d0:	89c6                	mv	s3,a7
ffffffffc02077d2:	d96ff06f          	j	ffffffffc0206d68 <stride_dequeue+0x1da2>
ffffffffc02077d6:	01083503          	ld	a0,16(a6)
ffffffffc02077da:	85ce                	mv	a1,s3
ffffffffc02077dc:	00883b03          	ld	s6,8(a6)
ffffffffc02077e0:	e06fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc02077e4:	7822                	ld	a6,40(sp)
ffffffffc02077e6:	78c2                	ld	a7,48(sp)
ffffffffc02077e8:	01683823          	sd	s6,16(a6)
ffffffffc02077ec:	00a83423          	sd	a0,8(a6)
ffffffffc02077f0:	010c2b03          	lw	s6,16(s8)
ffffffffc02077f4:	0e050b63          	beqz	a0,ffffffffc02078ea <stride_dequeue+0x2924>
ffffffffc02077f8:	01053023          	sd	a6,0(a0)
ffffffffc02077fc:	89c2                	mv	s3,a6
ffffffffc02077fe:	b88ff06f          	j	ffffffffc0206b86 <stride_dequeue+0x1bc0>
ffffffffc0207802:	0109b503          	ld	a0,16(s3)
ffffffffc0207806:	0089bb03          	ld	s6,8(s3)
ffffffffc020780a:	85f2                	mv	a1,t3
ffffffffc020780c:	f442                	sd	a6,40(sp)
ffffffffc020780e:	dd8fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207812:	00a9b423          	sd	a0,8(s3)
ffffffffc0207816:	0169b823          	sd	s6,16(s3)
ffffffffc020781a:	7822                	ld	a6,40(sp)
ffffffffc020781c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207820:	e119                	bnez	a0,ffffffffc0207826 <stride_dequeue+0x2860>
ffffffffc0207822:	d71fe06f          	j	ffffffffc0206592 <stride_dequeue+0x15cc>
ffffffffc0207826:	01353023          	sd	s3,0(a0)
ffffffffc020782a:	d69fe06f          	j	ffffffffc0206592 <stride_dequeue+0x15cc>
ffffffffc020782e:	0109b503          	ld	a0,16(s3)
ffffffffc0207832:	0089bb03          	ld	s6,8(s3)
ffffffffc0207836:	85f2                	mv	a1,t3
ffffffffc0207838:	f442                	sd	a6,40(sp)
ffffffffc020783a:	dacfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020783e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207842:	0169b823          	sd	s6,16(s3)
ffffffffc0207846:	7822                	ld	a6,40(sp)
ffffffffc0207848:	010c2b03          	lw	s6,16(s8)
ffffffffc020784c:	e119                	bnez	a0,ffffffffc0207852 <stride_dequeue+0x288c>
ffffffffc020784e:	e89fe06f          	j	ffffffffc02066d6 <stride_dequeue+0x1710>
ffffffffc0207852:	01353023          	sd	s3,0(a0)
ffffffffc0207856:	e81fe06f          	j	ffffffffc02066d6 <stride_dequeue+0x1710>
ffffffffc020785a:	89c6                	mv	s3,a7
ffffffffc020785c:	a9ffe06f          	j	ffffffffc02062fa <stride_dequeue+0x1334>
ffffffffc0207860:	0109b503          	ld	a0,16(s3)
ffffffffc0207864:	0089bb03          	ld	s6,8(s3)
ffffffffc0207868:	85f2                	mv	a1,t3
ffffffffc020786a:	f41a                	sd	t1,40(sp)
ffffffffc020786c:	f032                	sd	a2,32(sp)
ffffffffc020786e:	d78fd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc0207872:	00a9b423          	sd	a0,8(s3)
ffffffffc0207876:	0169b823          	sd	s6,16(s3)
ffffffffc020787a:	7602                	ld	a2,32(sp)
ffffffffc020787c:	7322                	ld	t1,40(sp)
ffffffffc020787e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207882:	e119                	bnez	a0,ffffffffc0207888 <stride_dequeue+0x28c2>
ffffffffc0207884:	e32fe06f          	j	ffffffffc0205eb6 <stride_dequeue+0xef0>
ffffffffc0207888:	01353023          	sd	s3,0(a0)
ffffffffc020788c:	e2afe06f          	j	ffffffffc0205eb6 <stride_dequeue+0xef0>
ffffffffc0207890:	01033503          	ld	a0,16(t1)
ffffffffc0207894:	85c2                	mv	a1,a6
ffffffffc0207896:	00833b03          	ld	s6,8(t1)
ffffffffc020789a:	d4cfd0ef          	jal	ra,ffffffffc0204de6 <skew_heap_merge.constprop.0>
ffffffffc020789e:	7302                	ld	t1,32(sp)
ffffffffc02078a0:	7622                	ld	a2,40(sp)
ffffffffc02078a2:	01633823          	sd	s6,16(t1)
ffffffffc02078a6:	00a33423          	sd	a0,8(t1)
ffffffffc02078aa:	010c2b03          	lw	s6,16(s8)
ffffffffc02078ae:	c115                	beqz	a0,ffffffffc02078d2 <stride_dequeue+0x290c>
ffffffffc02078b0:	00653023          	sd	t1,0(a0)
ffffffffc02078b4:	881a                	mv	a6,t1
ffffffffc02078b6:	d76ff06f          	j	ffffffffc0206e2c <stride_dequeue+0x1e66>
ffffffffc02078ba:	89f2                	mv	s3,t3
ffffffffc02078bc:	e1bfe06f          	j	ffffffffc02066d6 <stride_dequeue+0x1710>
ffffffffc02078c0:	834e                	mv	t1,s3
ffffffffc02078c2:	ef1fe06f          	j	ffffffffc02067b2 <stride_dequeue+0x17ec>
ffffffffc02078c6:	89c6                	mv	s3,a7
ffffffffc02078c8:	ca0ff06f          	j	ffffffffc0206d68 <stride_dequeue+0x1da2>
ffffffffc02078cc:	8a42                	mv	s4,a6
ffffffffc02078ce:	88aff06f          	j	ffffffffc0206958 <stride_dequeue+0x1992>
ffffffffc02078d2:	881a                	mv	a6,t1
ffffffffc02078d4:	d58ff06f          	j	ffffffffc0206e2c <stride_dequeue+0x1e66>
ffffffffc02078d8:	89f2                	mv	s3,t3
ffffffffc02078da:	ddcfe06f          	j	ffffffffc0205eb6 <stride_dequeue+0xef0>
ffffffffc02078de:	834e                	mv	t1,s3
ffffffffc02078e0:	e69fe06f          	j	ffffffffc0206748 <stride_dequeue+0x1782>
ffffffffc02078e4:	89f2                	mv	s3,t3
ffffffffc02078e6:	cadfe06f          	j	ffffffffc0206592 <stride_dequeue+0x15cc>
ffffffffc02078ea:	89c2                	mv	s3,a6
ffffffffc02078ec:	a9aff06f          	j	ffffffffc0206b86 <stride_dequeue+0x1bc0>
ffffffffc02078f0:	89c6                	mv	s3,a7
ffffffffc02078f2:	970ff06f          	j	ffffffffc0206a62 <stride_dequeue+0x1a9c>
ffffffffc02078f6:	834e                	mv	t1,s3
ffffffffc02078f8:	fdffe06f          	j	ffffffffc02068d6 <stride_dequeue+0x1910>
ffffffffc02078fc:	89f2                	mv	s3,t3
ffffffffc02078fe:	cdcfe06f          	j	ffffffffc0205dda <stride_dequeue+0xe14>
ffffffffc0207902:	89c2                	mv	s3,a6
ffffffffc0207904:	b44ff06f          	j	ffffffffc0206c48 <stride_dequeue+0x1c82>
ffffffffc0207908:	884e                	mv	a6,s3
ffffffffc020790a:	f09fe06f          	j	ffffffffc0206812 <stride_dequeue+0x184c>
ffffffffc020790e:	8c9a                	mv	s9,t1
ffffffffc0207910:	b96ff06f          	j	ffffffffc0206ca6 <stride_dequeue+0x1ce0>
ffffffffc0207914:	881a                	mv	a6,t1
ffffffffc0207916:	bf4ff06f          	j	ffffffffc0206d0a <stride_dequeue+0x1d44>
ffffffffc020791a:	89c6                	mv	s3,a7
ffffffffc020791c:	9a4ff06f          	j	ffffffffc0206ac0 <stride_dequeue+0x1afa>
ffffffffc0207920:	89f2                	mv	s3,t3
ffffffffc0207922:	a7ffe06f          	j	ffffffffc02063a0 <stride_dequeue+0x13da>
ffffffffc0207926:	89f2                	mv	s3,t3
ffffffffc0207928:	bc9fe06f          	j	ffffffffc02064f0 <stride_dequeue+0x152a>
ffffffffc020792c:	89f2                	mv	s3,t3
ffffffffc020792e:	e56fe06f          	j	ffffffffc0205f84 <stride_dequeue+0xfbe>
ffffffffc0207932:	89c6                	mv	s3,a7
ffffffffc0207934:	9f0ff06f          	j	ffffffffc0206b24 <stride_dequeue+0x1b5e>
ffffffffc0207938:	834e                	mv	t1,s3
ffffffffc020793a:	f3dfe06f          	j	ffffffffc0206876 <stride_dequeue+0x18b0>
ffffffffc020793e:	8a42                	mv	s4,a6
ffffffffc0207940:	8ccff06f          	j	ffffffffc0206a0c <stride_dequeue+0x1a46>
ffffffffc0207944:	8cc2                	mv	s9,a6
ffffffffc0207946:	868ff06f          	j	ffffffffc02069ae <stride_dequeue+0x19e8>
ffffffffc020794a:	89c2                	mv	s3,a6
ffffffffc020794c:	a98ff06f          	j	ffffffffc0206be4 <stride_dequeue+0x1c1e>
ffffffffc0207950:	8a72                	mv	s4,t3
ffffffffc0207952:	89cfe06f          	j	ffffffffc02059ee <stride_dequeue+0xa28>
ffffffffc0207956:	89f2                	mv	s3,t3
ffffffffc0207958:	aedfe06f          	j	ffffffffc0206444 <stride_dequeue+0x147e>
ffffffffc020795c:	89f2                	mv	s3,t3
ffffffffc020795e:	cddfe06f          	j	ffffffffc020663a <stride_dequeue+0x1674>
ffffffffc0207962:	881a                	mv	a6,t1
ffffffffc0207964:	c62ff06f          	j	ffffffffc0206dc6 <stride_dequeue+0x1e00>

ffffffffc0207968 <sys_getpid>:
ffffffffc0207968:	00012797          	auipc	a5,0x12
ffffffffc020796c:	b907b783          	ld	a5,-1136(a5) # ffffffffc02194f8 <current>
ffffffffc0207970:	43c8                	lw	a0,4(a5)
ffffffffc0207972:	8082                	ret

ffffffffc0207974 <sys_pgdir>:
ffffffffc0207974:	4501                	li	a0,0
ffffffffc0207976:	8082                	ret

ffffffffc0207978 <sys_gettime>:
ffffffffc0207978:	00012797          	auipc	a5,0x12
ffffffffc020797c:	bb07b783          	ld	a5,-1104(a5) # ffffffffc0219528 <ticks>
ffffffffc0207980:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207984:	9d3d                	addw	a0,a0,a5
ffffffffc0207986:	0015151b          	slliw	a0,a0,0x1
ffffffffc020798a:	8082                	ret

ffffffffc020798c <sys_lab6_set_priority>:
ffffffffc020798c:	4108                	lw	a0,0(a0)
ffffffffc020798e:	1141                	addi	sp,sp,-16
ffffffffc0207990:	e406                	sd	ra,8(sp)
ffffffffc0207992:	ee5fc0ef          	jal	ra,ffffffffc0204876 <lab6_set_priority>
ffffffffc0207996:	60a2                	ld	ra,8(sp)
ffffffffc0207998:	4501                	li	a0,0
ffffffffc020799a:	0141                	addi	sp,sp,16
ffffffffc020799c:	8082                	ret

ffffffffc020799e <sys_putc>:
ffffffffc020799e:	4108                	lw	a0,0(a0)
ffffffffc02079a0:	1141                	addi	sp,sp,-16
ffffffffc02079a2:	e406                	sd	ra,8(sp)
ffffffffc02079a4:	f5ef80ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc02079a8:	60a2                	ld	ra,8(sp)
ffffffffc02079aa:	4501                	li	a0,0
ffffffffc02079ac:	0141                	addi	sp,sp,16
ffffffffc02079ae:	8082                	ret

ffffffffc02079b0 <sys_kill>:
ffffffffc02079b0:	4108                	lw	a0,0(a0)
ffffffffc02079b2:	d2dfc06f          	j	ffffffffc02046de <do_kill>

ffffffffc02079b6 <sys_sleep>:
ffffffffc02079b6:	4108                	lw	a0,0(a0)
ffffffffc02079b8:	ef9fc06f          	j	ffffffffc02048b0 <do_sleep>

ffffffffc02079bc <sys_yield>:
ffffffffc02079bc:	cd5fc06f          	j	ffffffffc0204690 <do_yield>

ffffffffc02079c0 <sys_exec>:
ffffffffc02079c0:	6d14                	ld	a3,24(a0)
ffffffffc02079c2:	6910                	ld	a2,16(a0)
ffffffffc02079c4:	650c                	ld	a1,8(a0)
ffffffffc02079c6:	6108                	ld	a0,0(a0)
ffffffffc02079c8:	f3efc06f          	j	ffffffffc0204106 <do_execve>

ffffffffc02079cc <sys_wait>:
ffffffffc02079cc:	650c                	ld	a1,8(a0)
ffffffffc02079ce:	4108                	lw	a0,0(a0)
ffffffffc02079d0:	cd1fc06f          	j	ffffffffc02046a0 <do_wait>

ffffffffc02079d4 <sys_fork>:
ffffffffc02079d4:	00012797          	auipc	a5,0x12
ffffffffc02079d8:	b247b783          	ld	a5,-1244(a5) # ffffffffc02194f8 <current>
ffffffffc02079dc:	73d0                	ld	a2,160(a5)
ffffffffc02079de:	4501                	li	a0,0
ffffffffc02079e0:	6a0c                	ld	a1,16(a2)
ffffffffc02079e2:	ebbfb06f          	j	ffffffffc020389c <do_fork>

ffffffffc02079e6 <sys_exit>:
ffffffffc02079e6:	4108                	lw	a0,0(a0)
ffffffffc02079e8:	ad6fc06f          	j	ffffffffc0203cbe <do_exit>

ffffffffc02079ec <syscall>:
ffffffffc02079ec:	715d                	addi	sp,sp,-80
ffffffffc02079ee:	fc26                	sd	s1,56(sp)
ffffffffc02079f0:	00012497          	auipc	s1,0x12
ffffffffc02079f4:	b0848493          	addi	s1,s1,-1272 # ffffffffc02194f8 <current>
ffffffffc02079f8:	6098                	ld	a4,0(s1)
ffffffffc02079fa:	e0a2                	sd	s0,64(sp)
ffffffffc02079fc:	f84a                	sd	s2,48(sp)
ffffffffc02079fe:	7340                	ld	s0,160(a4)
ffffffffc0207a00:	e486                	sd	ra,72(sp)
ffffffffc0207a02:	0ff00793          	li	a5,255
ffffffffc0207a06:	05042903          	lw	s2,80(s0)
ffffffffc0207a0a:	0327ee63          	bltu	a5,s2,ffffffffc0207a46 <syscall+0x5a>
ffffffffc0207a0e:	00391713          	slli	a4,s2,0x3
ffffffffc0207a12:	00002797          	auipc	a5,0x2
ffffffffc0207a16:	01e78793          	addi	a5,a5,30 # ffffffffc0209a30 <syscalls>
ffffffffc0207a1a:	97ba                	add	a5,a5,a4
ffffffffc0207a1c:	639c                	ld	a5,0(a5)
ffffffffc0207a1e:	c785                	beqz	a5,ffffffffc0207a46 <syscall+0x5a>
ffffffffc0207a20:	6c28                	ld	a0,88(s0)
ffffffffc0207a22:	702c                	ld	a1,96(s0)
ffffffffc0207a24:	7430                	ld	a2,104(s0)
ffffffffc0207a26:	7834                	ld	a3,112(s0)
ffffffffc0207a28:	7c38                	ld	a4,120(s0)
ffffffffc0207a2a:	e42a                	sd	a0,8(sp)
ffffffffc0207a2c:	e82e                	sd	a1,16(sp)
ffffffffc0207a2e:	ec32                	sd	a2,24(sp)
ffffffffc0207a30:	f036                	sd	a3,32(sp)
ffffffffc0207a32:	f43a                	sd	a4,40(sp)
ffffffffc0207a34:	0028                	addi	a0,sp,8
ffffffffc0207a36:	9782                	jalr	a5
ffffffffc0207a38:	60a6                	ld	ra,72(sp)
ffffffffc0207a3a:	e828                	sd	a0,80(s0)
ffffffffc0207a3c:	6406                	ld	s0,64(sp)
ffffffffc0207a3e:	74e2                	ld	s1,56(sp)
ffffffffc0207a40:	7942                	ld	s2,48(sp)
ffffffffc0207a42:	6161                	addi	sp,sp,80
ffffffffc0207a44:	8082                	ret
ffffffffc0207a46:	8522                	mv	a0,s0
ffffffffc0207a48:	ddff80ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0207a4c:	609c                	ld	a5,0(s1)
ffffffffc0207a4e:	86ca                	mv	a3,s2
ffffffffc0207a50:	00002617          	auipc	a2,0x2
ffffffffc0207a54:	f9860613          	addi	a2,a2,-104 # ffffffffc02099e8 <default_pmm_manager+0x828>
ffffffffc0207a58:	43d8                	lw	a4,4(a5)
ffffffffc0207a5a:	07300593          	li	a1,115
ffffffffc0207a5e:	0b478793          	addi	a5,a5,180
ffffffffc0207a62:	00002517          	auipc	a0,0x2
ffffffffc0207a66:	fb650513          	addi	a0,a0,-74 # ffffffffc0209a18 <default_pmm_manager+0x858>
ffffffffc0207a6a:	f9ef80ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0207a6e <strnlen>:
ffffffffc0207a6e:	872a                	mv	a4,a0
ffffffffc0207a70:	4501                	li	a0,0
ffffffffc0207a72:	e589                	bnez	a1,ffffffffc0207a7c <strnlen+0xe>
ffffffffc0207a74:	a811                	j	ffffffffc0207a88 <strnlen+0x1a>
ffffffffc0207a76:	0505                	addi	a0,a0,1
ffffffffc0207a78:	00a58763          	beq	a1,a0,ffffffffc0207a86 <strnlen+0x18>
ffffffffc0207a7c:	00a707b3          	add	a5,a4,a0
ffffffffc0207a80:	0007c783          	lbu	a5,0(a5)
ffffffffc0207a84:	fbed                	bnez	a5,ffffffffc0207a76 <strnlen+0x8>
ffffffffc0207a86:	8082                	ret
ffffffffc0207a88:	8082                	ret

ffffffffc0207a8a <strcmp>:
ffffffffc0207a8a:	00054783          	lbu	a5,0(a0)
ffffffffc0207a8e:	0005c703          	lbu	a4,0(a1)
ffffffffc0207a92:	cb89                	beqz	a5,ffffffffc0207aa4 <strcmp+0x1a>
ffffffffc0207a94:	0505                	addi	a0,a0,1
ffffffffc0207a96:	0585                	addi	a1,a1,1
ffffffffc0207a98:	fee789e3          	beq	a5,a4,ffffffffc0207a8a <strcmp>
ffffffffc0207a9c:	0007851b          	sext.w	a0,a5
ffffffffc0207aa0:	9d19                	subw	a0,a0,a4
ffffffffc0207aa2:	8082                	ret
ffffffffc0207aa4:	4501                	li	a0,0
ffffffffc0207aa6:	bfed                	j	ffffffffc0207aa0 <strcmp+0x16>

ffffffffc0207aa8 <strchr>:
ffffffffc0207aa8:	00054783          	lbu	a5,0(a0)
ffffffffc0207aac:	c799                	beqz	a5,ffffffffc0207aba <strchr+0x12>
ffffffffc0207aae:	00f58763          	beq	a1,a5,ffffffffc0207abc <strchr+0x14>
ffffffffc0207ab2:	00154783          	lbu	a5,1(a0)
ffffffffc0207ab6:	0505                	addi	a0,a0,1
ffffffffc0207ab8:	fbfd                	bnez	a5,ffffffffc0207aae <strchr+0x6>
ffffffffc0207aba:	4501                	li	a0,0
ffffffffc0207abc:	8082                	ret

ffffffffc0207abe <memset>:
ffffffffc0207abe:	ca01                	beqz	a2,ffffffffc0207ace <memset+0x10>
ffffffffc0207ac0:	962a                	add	a2,a2,a0
ffffffffc0207ac2:	87aa                	mv	a5,a0
ffffffffc0207ac4:	0785                	addi	a5,a5,1
ffffffffc0207ac6:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0207aca:	fec79de3          	bne	a5,a2,ffffffffc0207ac4 <memset+0x6>
ffffffffc0207ace:	8082                	ret

ffffffffc0207ad0 <memcpy>:
ffffffffc0207ad0:	ca19                	beqz	a2,ffffffffc0207ae6 <memcpy+0x16>
ffffffffc0207ad2:	962e                	add	a2,a2,a1
ffffffffc0207ad4:	87aa                	mv	a5,a0
ffffffffc0207ad6:	0005c703          	lbu	a4,0(a1)
ffffffffc0207ada:	0585                	addi	a1,a1,1
ffffffffc0207adc:	0785                	addi	a5,a5,1
ffffffffc0207ade:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0207ae2:	fec59ae3          	bne	a1,a2,ffffffffc0207ad6 <memcpy+0x6>
ffffffffc0207ae6:	8082                	ret

ffffffffc0207ae8 <printnum>:
ffffffffc0207ae8:	02069813          	slli	a6,a3,0x20
ffffffffc0207aec:	7179                	addi	sp,sp,-48
ffffffffc0207aee:	02085813          	srli	a6,a6,0x20
ffffffffc0207af2:	e052                	sd	s4,0(sp)
ffffffffc0207af4:	03067a33          	remu	s4,a2,a6
ffffffffc0207af8:	f022                	sd	s0,32(sp)
ffffffffc0207afa:	ec26                	sd	s1,24(sp)
ffffffffc0207afc:	e84a                	sd	s2,16(sp)
ffffffffc0207afe:	f406                	sd	ra,40(sp)
ffffffffc0207b00:	e44e                	sd	s3,8(sp)
ffffffffc0207b02:	84aa                	mv	s1,a0
ffffffffc0207b04:	892e                	mv	s2,a1
ffffffffc0207b06:	fff7041b          	addiw	s0,a4,-1
ffffffffc0207b0a:	2a01                	sext.w	s4,s4
ffffffffc0207b0c:	03067e63          	bgeu	a2,a6,ffffffffc0207b48 <printnum+0x60>
ffffffffc0207b10:	89be                	mv	s3,a5
ffffffffc0207b12:	00805763          	blez	s0,ffffffffc0207b20 <printnum+0x38>
ffffffffc0207b16:	347d                	addiw	s0,s0,-1
ffffffffc0207b18:	85ca                	mv	a1,s2
ffffffffc0207b1a:	854e                	mv	a0,s3
ffffffffc0207b1c:	9482                	jalr	s1
ffffffffc0207b1e:	fc65                	bnez	s0,ffffffffc0207b16 <printnum+0x2e>
ffffffffc0207b20:	1a02                	slli	s4,s4,0x20
ffffffffc0207b22:	020a5a13          	srli	s4,s4,0x20
ffffffffc0207b26:	00002797          	auipc	a5,0x2
ffffffffc0207b2a:	70a78793          	addi	a5,a5,1802 # ffffffffc020a230 <syscalls+0x800>
ffffffffc0207b2e:	7402                	ld	s0,32(sp)
ffffffffc0207b30:	9a3e                	add	s4,s4,a5
ffffffffc0207b32:	000a4503          	lbu	a0,0(s4)
ffffffffc0207b36:	70a2                	ld	ra,40(sp)
ffffffffc0207b38:	69a2                	ld	s3,8(sp)
ffffffffc0207b3a:	6a02                	ld	s4,0(sp)
ffffffffc0207b3c:	85ca                	mv	a1,s2
ffffffffc0207b3e:	8326                	mv	t1,s1
ffffffffc0207b40:	6942                	ld	s2,16(sp)
ffffffffc0207b42:	64e2                	ld	s1,24(sp)
ffffffffc0207b44:	6145                	addi	sp,sp,48
ffffffffc0207b46:	8302                	jr	t1
ffffffffc0207b48:	03065633          	divu	a2,a2,a6
ffffffffc0207b4c:	8722                	mv	a4,s0
ffffffffc0207b4e:	f9bff0ef          	jal	ra,ffffffffc0207ae8 <printnum>
ffffffffc0207b52:	b7f9                	j	ffffffffc0207b20 <printnum+0x38>

ffffffffc0207b54 <vprintfmt>:
ffffffffc0207b54:	7119                	addi	sp,sp,-128
ffffffffc0207b56:	f4a6                	sd	s1,104(sp)
ffffffffc0207b58:	f0ca                	sd	s2,96(sp)
ffffffffc0207b5a:	ecce                	sd	s3,88(sp)
ffffffffc0207b5c:	e8d2                	sd	s4,80(sp)
ffffffffc0207b5e:	e4d6                	sd	s5,72(sp)
ffffffffc0207b60:	e0da                	sd	s6,64(sp)
ffffffffc0207b62:	fc5e                	sd	s7,56(sp)
ffffffffc0207b64:	f06a                	sd	s10,32(sp)
ffffffffc0207b66:	fc86                	sd	ra,120(sp)
ffffffffc0207b68:	f8a2                	sd	s0,112(sp)
ffffffffc0207b6a:	f862                	sd	s8,48(sp)
ffffffffc0207b6c:	f466                	sd	s9,40(sp)
ffffffffc0207b6e:	ec6e                	sd	s11,24(sp)
ffffffffc0207b70:	892a                	mv	s2,a0
ffffffffc0207b72:	84ae                	mv	s1,a1
ffffffffc0207b74:	8d32                	mv	s10,a2
ffffffffc0207b76:	8a36                	mv	s4,a3
ffffffffc0207b78:	02500993          	li	s3,37
ffffffffc0207b7c:	5b7d                	li	s6,-1
ffffffffc0207b7e:	00002a97          	auipc	s5,0x2
ffffffffc0207b82:	6dea8a93          	addi	s5,s5,1758 # ffffffffc020a25c <syscalls+0x82c>
ffffffffc0207b86:	00003b97          	auipc	s7,0x3
ffffffffc0207b8a:	8f2b8b93          	addi	s7,s7,-1806 # ffffffffc020a478 <error_string>
ffffffffc0207b8e:	000d4503          	lbu	a0,0(s10)
ffffffffc0207b92:	001d0413          	addi	s0,s10,1
ffffffffc0207b96:	01350a63          	beq	a0,s3,ffffffffc0207baa <vprintfmt+0x56>
ffffffffc0207b9a:	c121                	beqz	a0,ffffffffc0207bda <vprintfmt+0x86>
ffffffffc0207b9c:	85a6                	mv	a1,s1
ffffffffc0207b9e:	0405                	addi	s0,s0,1
ffffffffc0207ba0:	9902                	jalr	s2
ffffffffc0207ba2:	fff44503          	lbu	a0,-1(s0)
ffffffffc0207ba6:	ff351ae3          	bne	a0,s3,ffffffffc0207b9a <vprintfmt+0x46>
ffffffffc0207baa:	00044603          	lbu	a2,0(s0)
ffffffffc0207bae:	02000793          	li	a5,32
ffffffffc0207bb2:	4c81                	li	s9,0
ffffffffc0207bb4:	4881                	li	a7,0
ffffffffc0207bb6:	5c7d                	li	s8,-1
ffffffffc0207bb8:	5dfd                	li	s11,-1
ffffffffc0207bba:	05500513          	li	a0,85
ffffffffc0207bbe:	4825                	li	a6,9
ffffffffc0207bc0:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0207bc4:	0ff5f593          	andi	a1,a1,255
ffffffffc0207bc8:	00140d13          	addi	s10,s0,1
ffffffffc0207bcc:	04b56263          	bltu	a0,a1,ffffffffc0207c10 <vprintfmt+0xbc>
ffffffffc0207bd0:	058a                	slli	a1,a1,0x2
ffffffffc0207bd2:	95d6                	add	a1,a1,s5
ffffffffc0207bd4:	4194                	lw	a3,0(a1)
ffffffffc0207bd6:	96d6                	add	a3,a3,s5
ffffffffc0207bd8:	8682                	jr	a3
ffffffffc0207bda:	70e6                	ld	ra,120(sp)
ffffffffc0207bdc:	7446                	ld	s0,112(sp)
ffffffffc0207bde:	74a6                	ld	s1,104(sp)
ffffffffc0207be0:	7906                	ld	s2,96(sp)
ffffffffc0207be2:	69e6                	ld	s3,88(sp)
ffffffffc0207be4:	6a46                	ld	s4,80(sp)
ffffffffc0207be6:	6aa6                	ld	s5,72(sp)
ffffffffc0207be8:	6b06                	ld	s6,64(sp)
ffffffffc0207bea:	7be2                	ld	s7,56(sp)
ffffffffc0207bec:	7c42                	ld	s8,48(sp)
ffffffffc0207bee:	7ca2                	ld	s9,40(sp)
ffffffffc0207bf0:	7d02                	ld	s10,32(sp)
ffffffffc0207bf2:	6de2                	ld	s11,24(sp)
ffffffffc0207bf4:	6109                	addi	sp,sp,128
ffffffffc0207bf6:	8082                	ret
ffffffffc0207bf8:	87b2                	mv	a5,a2
ffffffffc0207bfa:	00144603          	lbu	a2,1(s0)
ffffffffc0207bfe:	846a                	mv	s0,s10
ffffffffc0207c00:	00140d13          	addi	s10,s0,1
ffffffffc0207c04:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0207c08:	0ff5f593          	andi	a1,a1,255
ffffffffc0207c0c:	fcb572e3          	bgeu	a0,a1,ffffffffc0207bd0 <vprintfmt+0x7c>
ffffffffc0207c10:	85a6                	mv	a1,s1
ffffffffc0207c12:	02500513          	li	a0,37
ffffffffc0207c16:	9902                	jalr	s2
ffffffffc0207c18:	fff44783          	lbu	a5,-1(s0)
ffffffffc0207c1c:	8d22                	mv	s10,s0
ffffffffc0207c1e:	f73788e3          	beq	a5,s3,ffffffffc0207b8e <vprintfmt+0x3a>
ffffffffc0207c22:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0207c26:	1d7d                	addi	s10,s10,-1
ffffffffc0207c28:	ff379de3          	bne	a5,s3,ffffffffc0207c22 <vprintfmt+0xce>
ffffffffc0207c2c:	b78d                	j	ffffffffc0207b8e <vprintfmt+0x3a>
ffffffffc0207c2e:	fd060c1b          	addiw	s8,a2,-48
ffffffffc0207c32:	00144603          	lbu	a2,1(s0)
ffffffffc0207c36:	846a                	mv	s0,s10
ffffffffc0207c38:	fd06069b          	addiw	a3,a2,-48
ffffffffc0207c3c:	0006059b          	sext.w	a1,a2
ffffffffc0207c40:	02d86463          	bltu	a6,a3,ffffffffc0207c68 <vprintfmt+0x114>
ffffffffc0207c44:	00144603          	lbu	a2,1(s0)
ffffffffc0207c48:	002c169b          	slliw	a3,s8,0x2
ffffffffc0207c4c:	0186873b          	addw	a4,a3,s8
ffffffffc0207c50:	0017171b          	slliw	a4,a4,0x1
ffffffffc0207c54:	9f2d                	addw	a4,a4,a1
ffffffffc0207c56:	fd06069b          	addiw	a3,a2,-48
ffffffffc0207c5a:	0405                	addi	s0,s0,1
ffffffffc0207c5c:	fd070c1b          	addiw	s8,a4,-48
ffffffffc0207c60:	0006059b          	sext.w	a1,a2
ffffffffc0207c64:	fed870e3          	bgeu	a6,a3,ffffffffc0207c44 <vprintfmt+0xf0>
ffffffffc0207c68:	f40ddce3          	bgez	s11,ffffffffc0207bc0 <vprintfmt+0x6c>
ffffffffc0207c6c:	8de2                	mv	s11,s8
ffffffffc0207c6e:	5c7d                	li	s8,-1
ffffffffc0207c70:	bf81                	j	ffffffffc0207bc0 <vprintfmt+0x6c>
ffffffffc0207c72:	fffdc693          	not	a3,s11
ffffffffc0207c76:	96fd                	srai	a3,a3,0x3f
ffffffffc0207c78:	00ddfdb3          	and	s11,s11,a3
ffffffffc0207c7c:	00144603          	lbu	a2,1(s0)
ffffffffc0207c80:	2d81                	sext.w	s11,s11
ffffffffc0207c82:	846a                	mv	s0,s10
ffffffffc0207c84:	bf35                	j	ffffffffc0207bc0 <vprintfmt+0x6c>
ffffffffc0207c86:	000a2c03          	lw	s8,0(s4)
ffffffffc0207c8a:	00144603          	lbu	a2,1(s0)
ffffffffc0207c8e:	0a21                	addi	s4,s4,8
ffffffffc0207c90:	846a                	mv	s0,s10
ffffffffc0207c92:	bfd9                	j	ffffffffc0207c68 <vprintfmt+0x114>
ffffffffc0207c94:	4705                	li	a4,1
ffffffffc0207c96:	008a0593          	addi	a1,s4,8
ffffffffc0207c9a:	01174463          	blt	a4,a7,ffffffffc0207ca2 <vprintfmt+0x14e>
ffffffffc0207c9e:	1a088e63          	beqz	a7,ffffffffc0207e5a <vprintfmt+0x306>
ffffffffc0207ca2:	000a3603          	ld	a2,0(s4)
ffffffffc0207ca6:	46c1                	li	a3,16
ffffffffc0207ca8:	8a2e                	mv	s4,a1
ffffffffc0207caa:	2781                	sext.w	a5,a5
ffffffffc0207cac:	876e                	mv	a4,s11
ffffffffc0207cae:	85a6                	mv	a1,s1
ffffffffc0207cb0:	854a                	mv	a0,s2
ffffffffc0207cb2:	e37ff0ef          	jal	ra,ffffffffc0207ae8 <printnum>
ffffffffc0207cb6:	bde1                	j	ffffffffc0207b8e <vprintfmt+0x3a>
ffffffffc0207cb8:	000a2503          	lw	a0,0(s4)
ffffffffc0207cbc:	85a6                	mv	a1,s1
ffffffffc0207cbe:	0a21                	addi	s4,s4,8
ffffffffc0207cc0:	9902                	jalr	s2
ffffffffc0207cc2:	b5f1                	j	ffffffffc0207b8e <vprintfmt+0x3a>
ffffffffc0207cc4:	4705                	li	a4,1
ffffffffc0207cc6:	008a0593          	addi	a1,s4,8
ffffffffc0207cca:	01174463          	blt	a4,a7,ffffffffc0207cd2 <vprintfmt+0x17e>
ffffffffc0207cce:	18088163          	beqz	a7,ffffffffc0207e50 <vprintfmt+0x2fc>
ffffffffc0207cd2:	000a3603          	ld	a2,0(s4)
ffffffffc0207cd6:	46a9                	li	a3,10
ffffffffc0207cd8:	8a2e                	mv	s4,a1
ffffffffc0207cda:	bfc1                	j	ffffffffc0207caa <vprintfmt+0x156>
ffffffffc0207cdc:	00144603          	lbu	a2,1(s0)
ffffffffc0207ce0:	4c85                	li	s9,1
ffffffffc0207ce2:	846a                	mv	s0,s10
ffffffffc0207ce4:	bdf1                	j	ffffffffc0207bc0 <vprintfmt+0x6c>
ffffffffc0207ce6:	85a6                	mv	a1,s1
ffffffffc0207ce8:	02500513          	li	a0,37
ffffffffc0207cec:	9902                	jalr	s2
ffffffffc0207cee:	b545                	j	ffffffffc0207b8e <vprintfmt+0x3a>
ffffffffc0207cf0:	00144603          	lbu	a2,1(s0)
ffffffffc0207cf4:	2885                	addiw	a7,a7,1
ffffffffc0207cf6:	846a                	mv	s0,s10
ffffffffc0207cf8:	b5e1                	j	ffffffffc0207bc0 <vprintfmt+0x6c>
ffffffffc0207cfa:	4705                	li	a4,1
ffffffffc0207cfc:	008a0593          	addi	a1,s4,8
ffffffffc0207d00:	01174463          	blt	a4,a7,ffffffffc0207d08 <vprintfmt+0x1b4>
ffffffffc0207d04:	14088163          	beqz	a7,ffffffffc0207e46 <vprintfmt+0x2f2>
ffffffffc0207d08:	000a3603          	ld	a2,0(s4)
ffffffffc0207d0c:	46a1                	li	a3,8
ffffffffc0207d0e:	8a2e                	mv	s4,a1
ffffffffc0207d10:	bf69                	j	ffffffffc0207caa <vprintfmt+0x156>
ffffffffc0207d12:	03000513          	li	a0,48
ffffffffc0207d16:	85a6                	mv	a1,s1
ffffffffc0207d18:	e03e                	sd	a5,0(sp)
ffffffffc0207d1a:	9902                	jalr	s2
ffffffffc0207d1c:	85a6                	mv	a1,s1
ffffffffc0207d1e:	07800513          	li	a0,120
ffffffffc0207d22:	9902                	jalr	s2
ffffffffc0207d24:	0a21                	addi	s4,s4,8
ffffffffc0207d26:	6782                	ld	a5,0(sp)
ffffffffc0207d28:	46c1                	li	a3,16
ffffffffc0207d2a:	ff8a3603          	ld	a2,-8(s4)
ffffffffc0207d2e:	bfb5                	j	ffffffffc0207caa <vprintfmt+0x156>
ffffffffc0207d30:	000a3403          	ld	s0,0(s4)
ffffffffc0207d34:	008a0713          	addi	a4,s4,8
ffffffffc0207d38:	e03a                	sd	a4,0(sp)
ffffffffc0207d3a:	14040263          	beqz	s0,ffffffffc0207e7e <vprintfmt+0x32a>
ffffffffc0207d3e:	0fb05763          	blez	s11,ffffffffc0207e2c <vprintfmt+0x2d8>
ffffffffc0207d42:	02d00693          	li	a3,45
ffffffffc0207d46:	0cd79163          	bne	a5,a3,ffffffffc0207e08 <vprintfmt+0x2b4>
ffffffffc0207d4a:	00044783          	lbu	a5,0(s0)
ffffffffc0207d4e:	0007851b          	sext.w	a0,a5
ffffffffc0207d52:	cf85                	beqz	a5,ffffffffc0207d8a <vprintfmt+0x236>
ffffffffc0207d54:	00140a13          	addi	s4,s0,1
ffffffffc0207d58:	05e00413          	li	s0,94
ffffffffc0207d5c:	000c4563          	bltz	s8,ffffffffc0207d66 <vprintfmt+0x212>
ffffffffc0207d60:	3c7d                	addiw	s8,s8,-1
ffffffffc0207d62:	036c0263          	beq	s8,s6,ffffffffc0207d86 <vprintfmt+0x232>
ffffffffc0207d66:	85a6                	mv	a1,s1
ffffffffc0207d68:	0e0c8e63          	beqz	s9,ffffffffc0207e64 <vprintfmt+0x310>
ffffffffc0207d6c:	3781                	addiw	a5,a5,-32
ffffffffc0207d6e:	0ef47b63          	bgeu	s0,a5,ffffffffc0207e64 <vprintfmt+0x310>
ffffffffc0207d72:	03f00513          	li	a0,63
ffffffffc0207d76:	9902                	jalr	s2
ffffffffc0207d78:	000a4783          	lbu	a5,0(s4)
ffffffffc0207d7c:	3dfd                	addiw	s11,s11,-1
ffffffffc0207d7e:	0a05                	addi	s4,s4,1
ffffffffc0207d80:	0007851b          	sext.w	a0,a5
ffffffffc0207d84:	ffe1                	bnez	a5,ffffffffc0207d5c <vprintfmt+0x208>
ffffffffc0207d86:	01b05963          	blez	s11,ffffffffc0207d98 <vprintfmt+0x244>
ffffffffc0207d8a:	3dfd                	addiw	s11,s11,-1
ffffffffc0207d8c:	85a6                	mv	a1,s1
ffffffffc0207d8e:	02000513          	li	a0,32
ffffffffc0207d92:	9902                	jalr	s2
ffffffffc0207d94:	fe0d9be3          	bnez	s11,ffffffffc0207d8a <vprintfmt+0x236>
ffffffffc0207d98:	6a02                	ld	s4,0(sp)
ffffffffc0207d9a:	bbd5                	j	ffffffffc0207b8e <vprintfmt+0x3a>
ffffffffc0207d9c:	4705                	li	a4,1
ffffffffc0207d9e:	008a0c93          	addi	s9,s4,8
ffffffffc0207da2:	01174463          	blt	a4,a7,ffffffffc0207daa <vprintfmt+0x256>
ffffffffc0207da6:	08088d63          	beqz	a7,ffffffffc0207e40 <vprintfmt+0x2ec>
ffffffffc0207daa:	000a3403          	ld	s0,0(s4)
ffffffffc0207dae:	0a044d63          	bltz	s0,ffffffffc0207e68 <vprintfmt+0x314>
ffffffffc0207db2:	8622                	mv	a2,s0
ffffffffc0207db4:	8a66                	mv	s4,s9
ffffffffc0207db6:	46a9                	li	a3,10
ffffffffc0207db8:	bdcd                	j	ffffffffc0207caa <vprintfmt+0x156>
ffffffffc0207dba:	000a2783          	lw	a5,0(s4)
ffffffffc0207dbe:	4761                	li	a4,24
ffffffffc0207dc0:	0a21                	addi	s4,s4,8
ffffffffc0207dc2:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0207dc6:	8fb5                	xor	a5,a5,a3
ffffffffc0207dc8:	40d786bb          	subw	a3,a5,a3
ffffffffc0207dcc:	02d74163          	blt	a4,a3,ffffffffc0207dee <vprintfmt+0x29a>
ffffffffc0207dd0:	00369793          	slli	a5,a3,0x3
ffffffffc0207dd4:	97de                	add	a5,a5,s7
ffffffffc0207dd6:	639c                	ld	a5,0(a5)
ffffffffc0207dd8:	cb99                	beqz	a5,ffffffffc0207dee <vprintfmt+0x29a>
ffffffffc0207dda:	86be                	mv	a3,a5
ffffffffc0207ddc:	00000617          	auipc	a2,0x0
ffffffffc0207de0:	13460613          	addi	a2,a2,308 # ffffffffc0207f10 <etext+0x24>
ffffffffc0207de4:	85a6                	mv	a1,s1
ffffffffc0207de6:	854a                	mv	a0,s2
ffffffffc0207de8:	0ce000ef          	jal	ra,ffffffffc0207eb6 <printfmt>
ffffffffc0207dec:	b34d                	j	ffffffffc0207b8e <vprintfmt+0x3a>
ffffffffc0207dee:	00002617          	auipc	a2,0x2
ffffffffc0207df2:	46260613          	addi	a2,a2,1122 # ffffffffc020a250 <syscalls+0x820>
ffffffffc0207df6:	85a6                	mv	a1,s1
ffffffffc0207df8:	854a                	mv	a0,s2
ffffffffc0207dfa:	0bc000ef          	jal	ra,ffffffffc0207eb6 <printfmt>
ffffffffc0207dfe:	bb41                	j	ffffffffc0207b8e <vprintfmt+0x3a>
ffffffffc0207e00:	00002417          	auipc	s0,0x2
ffffffffc0207e04:	44840413          	addi	s0,s0,1096 # ffffffffc020a248 <syscalls+0x818>
ffffffffc0207e08:	85e2                	mv	a1,s8
ffffffffc0207e0a:	8522                	mv	a0,s0
ffffffffc0207e0c:	e43e                	sd	a5,8(sp)
ffffffffc0207e0e:	c61ff0ef          	jal	ra,ffffffffc0207a6e <strnlen>
ffffffffc0207e12:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0207e16:	01b05b63          	blez	s11,ffffffffc0207e2c <vprintfmt+0x2d8>
ffffffffc0207e1a:	67a2                	ld	a5,8(sp)
ffffffffc0207e1c:	00078a1b          	sext.w	s4,a5
ffffffffc0207e20:	3dfd                	addiw	s11,s11,-1
ffffffffc0207e22:	85a6                	mv	a1,s1
ffffffffc0207e24:	8552                	mv	a0,s4
ffffffffc0207e26:	9902                	jalr	s2
ffffffffc0207e28:	fe0d9ce3          	bnez	s11,ffffffffc0207e20 <vprintfmt+0x2cc>
ffffffffc0207e2c:	00044783          	lbu	a5,0(s0)
ffffffffc0207e30:	00140a13          	addi	s4,s0,1
ffffffffc0207e34:	0007851b          	sext.w	a0,a5
ffffffffc0207e38:	d3a5                	beqz	a5,ffffffffc0207d98 <vprintfmt+0x244>
ffffffffc0207e3a:	05e00413          	li	s0,94
ffffffffc0207e3e:	bf39                	j	ffffffffc0207d5c <vprintfmt+0x208>
ffffffffc0207e40:	000a2403          	lw	s0,0(s4)
ffffffffc0207e44:	b7ad                	j	ffffffffc0207dae <vprintfmt+0x25a>
ffffffffc0207e46:	000a6603          	lwu	a2,0(s4)
ffffffffc0207e4a:	46a1                	li	a3,8
ffffffffc0207e4c:	8a2e                	mv	s4,a1
ffffffffc0207e4e:	bdb1                	j	ffffffffc0207caa <vprintfmt+0x156>
ffffffffc0207e50:	000a6603          	lwu	a2,0(s4)
ffffffffc0207e54:	46a9                	li	a3,10
ffffffffc0207e56:	8a2e                	mv	s4,a1
ffffffffc0207e58:	bd89                	j	ffffffffc0207caa <vprintfmt+0x156>
ffffffffc0207e5a:	000a6603          	lwu	a2,0(s4)
ffffffffc0207e5e:	46c1                	li	a3,16
ffffffffc0207e60:	8a2e                	mv	s4,a1
ffffffffc0207e62:	b5a1                	j	ffffffffc0207caa <vprintfmt+0x156>
ffffffffc0207e64:	9902                	jalr	s2
ffffffffc0207e66:	bf09                	j	ffffffffc0207d78 <vprintfmt+0x224>
ffffffffc0207e68:	85a6                	mv	a1,s1
ffffffffc0207e6a:	02d00513          	li	a0,45
ffffffffc0207e6e:	e03e                	sd	a5,0(sp)
ffffffffc0207e70:	9902                	jalr	s2
ffffffffc0207e72:	6782                	ld	a5,0(sp)
ffffffffc0207e74:	8a66                	mv	s4,s9
ffffffffc0207e76:	40800633          	neg	a2,s0
ffffffffc0207e7a:	46a9                	li	a3,10
ffffffffc0207e7c:	b53d                	j	ffffffffc0207caa <vprintfmt+0x156>
ffffffffc0207e7e:	03b05163          	blez	s11,ffffffffc0207ea0 <vprintfmt+0x34c>
ffffffffc0207e82:	02d00693          	li	a3,45
ffffffffc0207e86:	f6d79de3          	bne	a5,a3,ffffffffc0207e00 <vprintfmt+0x2ac>
ffffffffc0207e8a:	00002417          	auipc	s0,0x2
ffffffffc0207e8e:	3be40413          	addi	s0,s0,958 # ffffffffc020a248 <syscalls+0x818>
ffffffffc0207e92:	02800793          	li	a5,40
ffffffffc0207e96:	02800513          	li	a0,40
ffffffffc0207e9a:	00140a13          	addi	s4,s0,1
ffffffffc0207e9e:	bd6d                	j	ffffffffc0207d58 <vprintfmt+0x204>
ffffffffc0207ea0:	00002a17          	auipc	s4,0x2
ffffffffc0207ea4:	3a9a0a13          	addi	s4,s4,937 # ffffffffc020a249 <syscalls+0x819>
ffffffffc0207ea8:	02800513          	li	a0,40
ffffffffc0207eac:	02800793          	li	a5,40
ffffffffc0207eb0:	05e00413          	li	s0,94
ffffffffc0207eb4:	b565                	j	ffffffffc0207d5c <vprintfmt+0x208>

ffffffffc0207eb6 <printfmt>:
ffffffffc0207eb6:	715d                	addi	sp,sp,-80
ffffffffc0207eb8:	02810313          	addi	t1,sp,40
ffffffffc0207ebc:	f436                	sd	a3,40(sp)
ffffffffc0207ebe:	869a                	mv	a3,t1
ffffffffc0207ec0:	ec06                	sd	ra,24(sp)
ffffffffc0207ec2:	f83a                	sd	a4,48(sp)
ffffffffc0207ec4:	fc3e                	sd	a5,56(sp)
ffffffffc0207ec6:	e0c2                	sd	a6,64(sp)
ffffffffc0207ec8:	e4c6                	sd	a7,72(sp)
ffffffffc0207eca:	e41a                	sd	t1,8(sp)
ffffffffc0207ecc:	c89ff0ef          	jal	ra,ffffffffc0207b54 <vprintfmt>
ffffffffc0207ed0:	60e2                	ld	ra,24(sp)
ffffffffc0207ed2:	6161                	addi	sp,sp,80
ffffffffc0207ed4:	8082                	ret

ffffffffc0207ed6 <hash32>:
ffffffffc0207ed6:	9e3707b7          	lui	a5,0x9e370
ffffffffc0207eda:	2785                	addiw	a5,a5,1
ffffffffc0207edc:	02a7853b          	mulw	a0,a5,a0
ffffffffc0207ee0:	02000793          	li	a5,32
ffffffffc0207ee4:	9f8d                	subw	a5,a5,a1
ffffffffc0207ee6:	00f5553b          	srlw	a0,a0,a5
ffffffffc0207eea:	8082                	ret
