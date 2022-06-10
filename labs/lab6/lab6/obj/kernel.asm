
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <kern_entry>:
    80200000:	00005117          	auipc	sp,0x5
    80200004:	00010113          	mv	sp,sp
    80200008:	a009                	j	8020000a <kern_init>

000000008020000a <kern_init>:
    8020000a:	00005517          	auipc	a0,0x5
    8020000e:	ffe50513          	addi	a0,a0,-2 # 80205008 <is_panic>
    80200012:	00005617          	auipc	a2,0x5
    80200016:	04e60613          	addi	a2,a2,78 # 80205060 <end>
    8020001a:	1141                	addi	sp,sp,-16
    8020001c:	8e09                	sub	a2,a2,a0
    8020001e:	4581                	li	a1,0
    80200020:	e406                	sd	ra,8(sp)
    80200022:	102010ef          	jal	ra,80201124 <memset>
    80200026:	138000ef          	jal	ra,8020015e <cons_init>
    8020002a:	00001517          	auipc	a0,0x1
    8020002e:	52e50513          	addi	a0,a0,1326 # 80201558 <etext>
    80200032:	086000ef          	jal	ra,802000b8 <cputs>
    80200036:	13e000ef          	jal	ra,80200174 <idt_init>
    8020003a:	594000ef          	jal	ra,802005ce <pmm_init>
    8020003e:	136000ef          	jal	ra,80200174 <idt_init>
    80200042:	126000ef          	jal	ra,80200168 <intr_enable>
    80200046:	a001                	j	80200046 <kern_init+0x3c>

0000000080200048 <cputch>:
    80200048:	1141                	addi	sp,sp,-16
    8020004a:	e022                	sd	s0,0(sp)
    8020004c:	e406                	sd	ra,8(sp)
    8020004e:	842e                	mv	s0,a1
    80200050:	110000ef          	jal	ra,80200160 <cons_putc>
    80200054:	401c                	lw	a5,0(s0)
    80200056:	60a2                	ld	ra,8(sp)
    80200058:	2785                	addiw	a5,a5,1
    8020005a:	c01c                	sw	a5,0(s0)
    8020005c:	6402                	ld	s0,0(sp)
    8020005e:	0141                	addi	sp,sp,16
    80200060:	8082                	ret

0000000080200062 <vcprintf>:
    80200062:	1101                	addi	sp,sp,-32
    80200064:	862a                	mv	a2,a0
    80200066:	86ae                	mv	a3,a1
    80200068:	00000517          	auipc	a0,0x0
    8020006c:	fe050513          	addi	a0,a0,-32 # 80200048 <cputch>
    80200070:	006c                	addi	a1,sp,12
    80200072:	ec06                	sd	ra,24(sp)
    80200074:	c602                	sw	zero,12(sp)
    80200076:	12c010ef          	jal	ra,802011a2 <vprintfmt>
    8020007a:	60e2                	ld	ra,24(sp)
    8020007c:	4532                	lw	a0,12(sp)
    8020007e:	6105                	addi	sp,sp,32
    80200080:	8082                	ret

0000000080200082 <cprintf>:
    80200082:	711d                	addi	sp,sp,-96
    80200084:	02810313          	addi	t1,sp,40 # 80205028 <satp_physical>
    80200088:	8e2a                	mv	t3,a0
    8020008a:	f42e                	sd	a1,40(sp)
    8020008c:	f832                	sd	a2,48(sp)
    8020008e:	fc36                	sd	a3,56(sp)
    80200090:	00000517          	auipc	a0,0x0
    80200094:	fb850513          	addi	a0,a0,-72 # 80200048 <cputch>
    80200098:	004c                	addi	a1,sp,4
    8020009a:	869a                	mv	a3,t1
    8020009c:	8672                	mv	a2,t3
    8020009e:	ec06                	sd	ra,24(sp)
    802000a0:	e0ba                	sd	a4,64(sp)
    802000a2:	e4be                	sd	a5,72(sp)
    802000a4:	e8c2                	sd	a6,80(sp)
    802000a6:	ecc6                	sd	a7,88(sp)
    802000a8:	e41a                	sd	t1,8(sp)
    802000aa:	c202                	sw	zero,4(sp)
    802000ac:	0f6010ef          	jal	ra,802011a2 <vprintfmt>
    802000b0:	60e2                	ld	ra,24(sp)
    802000b2:	4512                	lw	a0,4(sp)
    802000b4:	6125                	addi	sp,sp,96
    802000b6:	8082                	ret

00000000802000b8 <cputs>:
    802000b8:	1101                	addi	sp,sp,-32
    802000ba:	e822                	sd	s0,16(sp)
    802000bc:	ec06                	sd	ra,24(sp)
    802000be:	e426                	sd	s1,8(sp)
    802000c0:	842a                	mv	s0,a0
    802000c2:	00054503          	lbu	a0,0(a0)
    802000c6:	c51d                	beqz	a0,802000f4 <cputs+0x3c>
    802000c8:	0405                	addi	s0,s0,1
    802000ca:	4485                	li	s1,1
    802000cc:	9c81                	subw	s1,s1,s0
    802000ce:	092000ef          	jal	ra,80200160 <cons_putc>
    802000d2:	00044503          	lbu	a0,0(s0)
    802000d6:	008487bb          	addw	a5,s1,s0
    802000da:	0405                	addi	s0,s0,1
    802000dc:	f96d                	bnez	a0,802000ce <cputs+0x16>
    802000de:	0017841b          	addiw	s0,a5,1
    802000e2:	4529                	li	a0,10
    802000e4:	07c000ef          	jal	ra,80200160 <cons_putc>
    802000e8:	60e2                	ld	ra,24(sp)
    802000ea:	8522                	mv	a0,s0
    802000ec:	6442                	ld	s0,16(sp)
    802000ee:	64a2                	ld	s1,8(sp)
    802000f0:	6105                	addi	sp,sp,32
    802000f2:	8082                	ret
    802000f4:	4405                	li	s0,1
    802000f6:	b7f5                	j	802000e2 <cputs+0x2a>

00000000802000f8 <__panic>:
    802000f8:	00005317          	auipc	t1,0x5
    802000fc:	f1030313          	addi	t1,t1,-240 # 80205008 <is_panic>
    80200100:	00032e03          	lw	t3,0(t1)
    80200104:	715d                	addi	sp,sp,-80
    80200106:	ec06                	sd	ra,24(sp)
    80200108:	e822                	sd	s0,16(sp)
    8020010a:	f436                	sd	a3,40(sp)
    8020010c:	f83a                	sd	a4,48(sp)
    8020010e:	fc3e                	sd	a5,56(sp)
    80200110:	e0c2                	sd	a6,64(sp)
    80200112:	e4c6                	sd	a7,72(sp)
    80200114:	020e1a63          	bnez	t3,80200148 <__panic+0x50>
    80200118:	4785                	li	a5,1
    8020011a:	00f32023          	sw	a5,0(t1)
    8020011e:	8432                	mv	s0,a2
    80200120:	103c                	addi	a5,sp,40
    80200122:	862e                	mv	a2,a1
    80200124:	85aa                	mv	a1,a0
    80200126:	00001517          	auipc	a0,0x1
    8020012a:	44a50513          	addi	a0,a0,1098 # 80201570 <etext+0x18>
    8020012e:	e43e                	sd	a5,8(sp)
    80200130:	f53ff0ef          	jal	ra,80200082 <cprintf>
    80200134:	65a2                	ld	a1,8(sp)
    80200136:	8522                	mv	a0,s0
    80200138:	f2bff0ef          	jal	ra,80200062 <vcprintf>
    8020013c:	00002517          	auipc	a0,0x2
    80200140:	86c50513          	addi	a0,a0,-1940 # 802019a8 <etext+0x450>
    80200144:	f3fff0ef          	jal	ra,80200082 <cprintf>
    80200148:	026000ef          	jal	ra,8020016e <intr_disable>
    8020014c:	a001                	j	8020014c <__panic+0x54>

000000008020014e <clock_set_next_event>:
    8020014e:	c0102573          	rdtime	a0
    80200152:	67e1                	lui	a5,0x18
    80200154:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0x801e7960>
    80200158:	953e                	add	a0,a0,a5
    8020015a:	3e40106f          	j	8020153e <sbi_set_timer>

000000008020015e <cons_init>:
    8020015e:	8082                	ret

0000000080200160 <cons_putc>:
    80200160:	0ff57513          	andi	a0,a0,255
    80200164:	3c00106f          	j	80201524 <sbi_console_putchar>

0000000080200168 <intr_enable>:
    80200168:	100167f3          	csrrsi	a5,sstatus,2
    8020016c:	8082                	ret

000000008020016e <intr_disable>:
    8020016e:	100177f3          	csrrci	a5,sstatus,2
    80200172:	8082                	ret

0000000080200174 <idt_init>:
    80200174:	14005073          	csrwi	sscratch,0
    80200178:	00000797          	auipc	a5,0x0
    8020017c:	2e478793          	addi	a5,a5,740 # 8020045c <__alltraps>
    80200180:	10579073          	csrw	stvec,a5
    80200184:	8082                	ret

0000000080200186 <print_regs>:
    80200186:	610c                	ld	a1,0(a0)
    80200188:	1141                	addi	sp,sp,-16
    8020018a:	e022                	sd	s0,0(sp)
    8020018c:	842a                	mv	s0,a0
    8020018e:	00001517          	auipc	a0,0x1
    80200192:	40250513          	addi	a0,a0,1026 # 80201590 <etext+0x38>
    80200196:	e406                	sd	ra,8(sp)
    80200198:	eebff0ef          	jal	ra,80200082 <cprintf>
    8020019c:	640c                	ld	a1,8(s0)
    8020019e:	00001517          	auipc	a0,0x1
    802001a2:	40a50513          	addi	a0,a0,1034 # 802015a8 <etext+0x50>
    802001a6:	eddff0ef          	jal	ra,80200082 <cprintf>
    802001aa:	680c                	ld	a1,16(s0)
    802001ac:	00001517          	auipc	a0,0x1
    802001b0:	41450513          	addi	a0,a0,1044 # 802015c0 <etext+0x68>
    802001b4:	ecfff0ef          	jal	ra,80200082 <cprintf>
    802001b8:	6c0c                	ld	a1,24(s0)
    802001ba:	00001517          	auipc	a0,0x1
    802001be:	41e50513          	addi	a0,a0,1054 # 802015d8 <etext+0x80>
    802001c2:	ec1ff0ef          	jal	ra,80200082 <cprintf>
    802001c6:	700c                	ld	a1,32(s0)
    802001c8:	00001517          	auipc	a0,0x1
    802001cc:	42850513          	addi	a0,a0,1064 # 802015f0 <etext+0x98>
    802001d0:	eb3ff0ef          	jal	ra,80200082 <cprintf>
    802001d4:	740c                	ld	a1,40(s0)
    802001d6:	00001517          	auipc	a0,0x1
    802001da:	43250513          	addi	a0,a0,1074 # 80201608 <etext+0xb0>
    802001de:	ea5ff0ef          	jal	ra,80200082 <cprintf>
    802001e2:	780c                	ld	a1,48(s0)
    802001e4:	00001517          	auipc	a0,0x1
    802001e8:	43c50513          	addi	a0,a0,1084 # 80201620 <etext+0xc8>
    802001ec:	e97ff0ef          	jal	ra,80200082 <cprintf>
    802001f0:	7c0c                	ld	a1,56(s0)
    802001f2:	00001517          	auipc	a0,0x1
    802001f6:	44650513          	addi	a0,a0,1094 # 80201638 <etext+0xe0>
    802001fa:	e89ff0ef          	jal	ra,80200082 <cprintf>
    802001fe:	602c                	ld	a1,64(s0)
    80200200:	00001517          	auipc	a0,0x1
    80200204:	45050513          	addi	a0,a0,1104 # 80201650 <etext+0xf8>
    80200208:	e7bff0ef          	jal	ra,80200082 <cprintf>
    8020020c:	642c                	ld	a1,72(s0)
    8020020e:	00001517          	auipc	a0,0x1
    80200212:	45a50513          	addi	a0,a0,1114 # 80201668 <etext+0x110>
    80200216:	e6dff0ef          	jal	ra,80200082 <cprintf>
    8020021a:	682c                	ld	a1,80(s0)
    8020021c:	00001517          	auipc	a0,0x1
    80200220:	46450513          	addi	a0,a0,1124 # 80201680 <etext+0x128>
    80200224:	e5fff0ef          	jal	ra,80200082 <cprintf>
    80200228:	6c2c                	ld	a1,88(s0)
    8020022a:	00001517          	auipc	a0,0x1
    8020022e:	46e50513          	addi	a0,a0,1134 # 80201698 <etext+0x140>
    80200232:	e51ff0ef          	jal	ra,80200082 <cprintf>
    80200236:	702c                	ld	a1,96(s0)
    80200238:	00001517          	auipc	a0,0x1
    8020023c:	47850513          	addi	a0,a0,1144 # 802016b0 <etext+0x158>
    80200240:	e43ff0ef          	jal	ra,80200082 <cprintf>
    80200244:	742c                	ld	a1,104(s0)
    80200246:	00001517          	auipc	a0,0x1
    8020024a:	48250513          	addi	a0,a0,1154 # 802016c8 <etext+0x170>
    8020024e:	e35ff0ef          	jal	ra,80200082 <cprintf>
    80200252:	782c                	ld	a1,112(s0)
    80200254:	00001517          	auipc	a0,0x1
    80200258:	48c50513          	addi	a0,a0,1164 # 802016e0 <etext+0x188>
    8020025c:	e27ff0ef          	jal	ra,80200082 <cprintf>
    80200260:	7c2c                	ld	a1,120(s0)
    80200262:	00001517          	auipc	a0,0x1
    80200266:	49650513          	addi	a0,a0,1174 # 802016f8 <etext+0x1a0>
    8020026a:	e19ff0ef          	jal	ra,80200082 <cprintf>
    8020026e:	604c                	ld	a1,128(s0)
    80200270:	00001517          	auipc	a0,0x1
    80200274:	4a050513          	addi	a0,a0,1184 # 80201710 <etext+0x1b8>
    80200278:	e0bff0ef          	jal	ra,80200082 <cprintf>
    8020027c:	644c                	ld	a1,136(s0)
    8020027e:	00001517          	auipc	a0,0x1
    80200282:	4aa50513          	addi	a0,a0,1194 # 80201728 <etext+0x1d0>
    80200286:	dfdff0ef          	jal	ra,80200082 <cprintf>
    8020028a:	684c                	ld	a1,144(s0)
    8020028c:	00001517          	auipc	a0,0x1
    80200290:	4b450513          	addi	a0,a0,1204 # 80201740 <etext+0x1e8>
    80200294:	defff0ef          	jal	ra,80200082 <cprintf>
    80200298:	6c4c                	ld	a1,152(s0)
    8020029a:	00001517          	auipc	a0,0x1
    8020029e:	4be50513          	addi	a0,a0,1214 # 80201758 <etext+0x200>
    802002a2:	de1ff0ef          	jal	ra,80200082 <cprintf>
    802002a6:	704c                	ld	a1,160(s0)
    802002a8:	00001517          	auipc	a0,0x1
    802002ac:	4c850513          	addi	a0,a0,1224 # 80201770 <etext+0x218>
    802002b0:	dd3ff0ef          	jal	ra,80200082 <cprintf>
    802002b4:	744c                	ld	a1,168(s0)
    802002b6:	00001517          	auipc	a0,0x1
    802002ba:	4d250513          	addi	a0,a0,1234 # 80201788 <etext+0x230>
    802002be:	dc5ff0ef          	jal	ra,80200082 <cprintf>
    802002c2:	784c                	ld	a1,176(s0)
    802002c4:	00001517          	auipc	a0,0x1
    802002c8:	4dc50513          	addi	a0,a0,1244 # 802017a0 <etext+0x248>
    802002cc:	db7ff0ef          	jal	ra,80200082 <cprintf>
    802002d0:	7c4c                	ld	a1,184(s0)
    802002d2:	00001517          	auipc	a0,0x1
    802002d6:	4e650513          	addi	a0,a0,1254 # 802017b8 <etext+0x260>
    802002da:	da9ff0ef          	jal	ra,80200082 <cprintf>
    802002de:	606c                	ld	a1,192(s0)
    802002e0:	00001517          	auipc	a0,0x1
    802002e4:	4f050513          	addi	a0,a0,1264 # 802017d0 <etext+0x278>
    802002e8:	d9bff0ef          	jal	ra,80200082 <cprintf>
    802002ec:	646c                	ld	a1,200(s0)
    802002ee:	00001517          	auipc	a0,0x1
    802002f2:	4fa50513          	addi	a0,a0,1274 # 802017e8 <etext+0x290>
    802002f6:	d8dff0ef          	jal	ra,80200082 <cprintf>
    802002fa:	686c                	ld	a1,208(s0)
    802002fc:	00001517          	auipc	a0,0x1
    80200300:	50450513          	addi	a0,a0,1284 # 80201800 <etext+0x2a8>
    80200304:	d7fff0ef          	jal	ra,80200082 <cprintf>
    80200308:	6c6c                	ld	a1,216(s0)
    8020030a:	00001517          	auipc	a0,0x1
    8020030e:	50e50513          	addi	a0,a0,1294 # 80201818 <etext+0x2c0>
    80200312:	d71ff0ef          	jal	ra,80200082 <cprintf>
    80200316:	706c                	ld	a1,224(s0)
    80200318:	00001517          	auipc	a0,0x1
    8020031c:	51850513          	addi	a0,a0,1304 # 80201830 <etext+0x2d8>
    80200320:	d63ff0ef          	jal	ra,80200082 <cprintf>
    80200324:	746c                	ld	a1,232(s0)
    80200326:	00001517          	auipc	a0,0x1
    8020032a:	52250513          	addi	a0,a0,1314 # 80201848 <etext+0x2f0>
    8020032e:	d55ff0ef          	jal	ra,80200082 <cprintf>
    80200332:	786c                	ld	a1,240(s0)
    80200334:	00001517          	auipc	a0,0x1
    80200338:	52c50513          	addi	a0,a0,1324 # 80201860 <etext+0x308>
    8020033c:	d47ff0ef          	jal	ra,80200082 <cprintf>
    80200340:	7c6c                	ld	a1,248(s0)
    80200342:	6402                	ld	s0,0(sp)
    80200344:	60a2                	ld	ra,8(sp)
    80200346:	00001517          	auipc	a0,0x1
    8020034a:	53250513          	addi	a0,a0,1330 # 80201878 <etext+0x320>
    8020034e:	0141                	addi	sp,sp,16
    80200350:	bb0d                	j	80200082 <cprintf>

0000000080200352 <print_trapframe>:
    80200352:	1141                	addi	sp,sp,-16
    80200354:	e022                	sd	s0,0(sp)
    80200356:	85aa                	mv	a1,a0
    80200358:	842a                	mv	s0,a0
    8020035a:	00001517          	auipc	a0,0x1
    8020035e:	53650513          	addi	a0,a0,1334 # 80201890 <etext+0x338>
    80200362:	e406                	sd	ra,8(sp)
    80200364:	d1fff0ef          	jal	ra,80200082 <cprintf>
    80200368:	8522                	mv	a0,s0
    8020036a:	e1dff0ef          	jal	ra,80200186 <print_regs>
    8020036e:	10043583          	ld	a1,256(s0)
    80200372:	00001517          	auipc	a0,0x1
    80200376:	53650513          	addi	a0,a0,1334 # 802018a8 <etext+0x350>
    8020037a:	d09ff0ef          	jal	ra,80200082 <cprintf>
    8020037e:	10843583          	ld	a1,264(s0)
    80200382:	00001517          	auipc	a0,0x1
    80200386:	53e50513          	addi	a0,a0,1342 # 802018c0 <etext+0x368>
    8020038a:	cf9ff0ef          	jal	ra,80200082 <cprintf>
    8020038e:	11043583          	ld	a1,272(s0)
    80200392:	00001517          	auipc	a0,0x1
    80200396:	54650513          	addi	a0,a0,1350 # 802018d8 <etext+0x380>
    8020039a:	ce9ff0ef          	jal	ra,80200082 <cprintf>
    8020039e:	11843583          	ld	a1,280(s0)
    802003a2:	6402                	ld	s0,0(sp)
    802003a4:	60a2                	ld	ra,8(sp)
    802003a6:	00001517          	auipc	a0,0x1
    802003aa:	54a50513          	addi	a0,a0,1354 # 802018f0 <etext+0x398>
    802003ae:	0141                	addi	sp,sp,16
    802003b0:	b9c9                	j	80200082 <cprintf>

00000000802003b2 <interrupt_handler>:
    802003b2:	11853783          	ld	a5,280(a0)
    802003b6:	472d                	li	a4,11
    802003b8:	0786                	slli	a5,a5,0x1
    802003ba:	8385                	srli	a5,a5,0x1
    802003bc:	06f76c63          	bltu	a4,a5,80200434 <interrupt_handler+0x82>
    802003c0:	00001717          	auipc	a4,0x1
    802003c4:	61070713          	addi	a4,a4,1552 # 802019d0 <etext+0x478>
    802003c8:	078a                	slli	a5,a5,0x2
    802003ca:	97ba                	add	a5,a5,a4
    802003cc:	439c                	lw	a5,0(a5)
    802003ce:	97ba                	add	a5,a5,a4
    802003d0:	8782                	jr	a5
    802003d2:	00001517          	auipc	a0,0x1
    802003d6:	59650513          	addi	a0,a0,1430 # 80201968 <etext+0x410>
    802003da:	b165                	j	80200082 <cprintf>
    802003dc:	00001517          	auipc	a0,0x1
    802003e0:	56c50513          	addi	a0,a0,1388 # 80201948 <etext+0x3f0>
    802003e4:	b979                	j	80200082 <cprintf>
    802003e6:	00001517          	auipc	a0,0x1
    802003ea:	52250513          	addi	a0,a0,1314 # 80201908 <etext+0x3b0>
    802003ee:	b951                	j	80200082 <cprintf>
    802003f0:	00001517          	auipc	a0,0x1
    802003f4:	59850513          	addi	a0,a0,1432 # 80201988 <etext+0x430>
    802003f8:	b169                	j	80200082 <cprintf>
    802003fa:	1141                	addi	sp,sp,-16
    802003fc:	e406                	sd	ra,8(sp)
    802003fe:	d51ff0ef          	jal	ra,8020014e <clock_set_next_event>
    80200402:	00005697          	auipc	a3,0x5
    80200406:	c1e68693          	addi	a3,a3,-994 # 80205020 <ticks>
    8020040a:	629c                	ld	a5,0(a3)
    8020040c:	06400713          	li	a4,100
    80200410:	0785                	addi	a5,a5,1
    80200412:	02e7f733          	remu	a4,a5,a4
    80200416:	e29c                	sd	a5,0(a3)
    80200418:	cf19                	beqz	a4,80200436 <interrupt_handler+0x84>
    8020041a:	60a2                	ld	ra,8(sp)
    8020041c:	0141                	addi	sp,sp,16
    8020041e:	8082                	ret
    80200420:	00001517          	auipc	a0,0x1
    80200424:	59050513          	addi	a0,a0,1424 # 802019b0 <etext+0x458>
    80200428:	b9a9                	j	80200082 <cprintf>
    8020042a:	00001517          	auipc	a0,0x1
    8020042e:	4fe50513          	addi	a0,a0,1278 # 80201928 <etext+0x3d0>
    80200432:	b981                	j	80200082 <cprintf>
    80200434:	bf39                	j	80200352 <print_trapframe>
    80200436:	60a2                	ld	ra,8(sp)
    80200438:	06400593          	li	a1,100
    8020043c:	00001517          	auipc	a0,0x1
    80200440:	56450513          	addi	a0,a0,1380 # 802019a0 <etext+0x448>
    80200444:	0141                	addi	sp,sp,16
    80200446:	b935                	j	80200082 <cprintf>

0000000080200448 <trap>:
    80200448:	11853783          	ld	a5,280(a0)
    8020044c:	0007c763          	bltz	a5,8020045a <trap+0x12>
    80200450:	472d                	li	a4,11
    80200452:	00f76363          	bltu	a4,a5,80200458 <trap+0x10>
    80200456:	8082                	ret
    80200458:	bded                	j	80200352 <print_trapframe>
    8020045a:	bfa1                	j	802003b2 <interrupt_handler>

000000008020045c <__alltraps>:
    8020045c:	14011073          	csrw	sscratch,sp
    80200460:	712d                	addi	sp,sp,-288
    80200462:	e002                	sd	zero,0(sp)
    80200464:	e406                	sd	ra,8(sp)
    80200466:	ec0e                	sd	gp,24(sp)
    80200468:	f012                	sd	tp,32(sp)
    8020046a:	f416                	sd	t0,40(sp)
    8020046c:	f81a                	sd	t1,48(sp)
    8020046e:	fc1e                	sd	t2,56(sp)
    80200470:	e0a2                	sd	s0,64(sp)
    80200472:	e4a6                	sd	s1,72(sp)
    80200474:	e8aa                	sd	a0,80(sp)
    80200476:	ecae                	sd	a1,88(sp)
    80200478:	f0b2                	sd	a2,96(sp)
    8020047a:	f4b6                	sd	a3,104(sp)
    8020047c:	f8ba                	sd	a4,112(sp)
    8020047e:	fcbe                	sd	a5,120(sp)
    80200480:	e142                	sd	a6,128(sp)
    80200482:	e546                	sd	a7,136(sp)
    80200484:	e94a                	sd	s2,144(sp)
    80200486:	ed4e                	sd	s3,152(sp)
    80200488:	f152                	sd	s4,160(sp)
    8020048a:	f556                	sd	s5,168(sp)
    8020048c:	f95a                	sd	s6,176(sp)
    8020048e:	fd5e                	sd	s7,184(sp)
    80200490:	e1e2                	sd	s8,192(sp)
    80200492:	e5e6                	sd	s9,200(sp)
    80200494:	e9ea                	sd	s10,208(sp)
    80200496:	edee                	sd	s11,216(sp)
    80200498:	f1f2                	sd	t3,224(sp)
    8020049a:	f5f6                	sd	t4,232(sp)
    8020049c:	f9fa                	sd	t5,240(sp)
    8020049e:	fdfe                	sd	t6,248(sp)
    802004a0:	14001473          	csrrw	s0,sscratch,zero
    802004a4:	100024f3          	csrr	s1,sstatus
    802004a8:	14102973          	csrr	s2,sepc
    802004ac:	143029f3          	csrr	s3,stval
    802004b0:	14202a73          	csrr	s4,scause
    802004b4:	e822                	sd	s0,16(sp)
    802004b6:	e226                	sd	s1,256(sp)
    802004b8:	e64a                	sd	s2,264(sp)
    802004ba:	ea4e                	sd	s3,272(sp)
    802004bc:	ee52                	sd	s4,280(sp)
    802004be:	850a                	mv	a0,sp
    802004c0:	f89ff0ef          	jal	ra,80200448 <trap>

00000000802004c4 <__trapret>:
    802004c4:	6492                	ld	s1,256(sp)
    802004c6:	6932                	ld	s2,264(sp)
    802004c8:	10049073          	csrw	sstatus,s1
    802004cc:	14191073          	csrw	sepc,s2
    802004d0:	60a2                	ld	ra,8(sp)
    802004d2:	61e2                	ld	gp,24(sp)
    802004d4:	7202                	ld	tp,32(sp)
    802004d6:	72a2                	ld	t0,40(sp)
    802004d8:	7342                	ld	t1,48(sp)
    802004da:	73e2                	ld	t2,56(sp)
    802004dc:	6406                	ld	s0,64(sp)
    802004de:	64a6                	ld	s1,72(sp)
    802004e0:	6546                	ld	a0,80(sp)
    802004e2:	65e6                	ld	a1,88(sp)
    802004e4:	7606                	ld	a2,96(sp)
    802004e6:	76a6                	ld	a3,104(sp)
    802004e8:	7746                	ld	a4,112(sp)
    802004ea:	77e6                	ld	a5,120(sp)
    802004ec:	680a                	ld	a6,128(sp)
    802004ee:	68aa                	ld	a7,136(sp)
    802004f0:	694a                	ld	s2,144(sp)
    802004f2:	69ea                	ld	s3,152(sp)
    802004f4:	7a0a                	ld	s4,160(sp)
    802004f6:	7aaa                	ld	s5,168(sp)
    802004f8:	7b4a                	ld	s6,176(sp)
    802004fa:	7bea                	ld	s7,184(sp)
    802004fc:	6c0e                	ld	s8,192(sp)
    802004fe:	6cae                	ld	s9,200(sp)
    80200500:	6d4e                	ld	s10,208(sp)
    80200502:	6dee                	ld	s11,216(sp)
    80200504:	7e0e                	ld	t3,224(sp)
    80200506:	7eae                	ld	t4,232(sp)
    80200508:	7f4e                	ld	t5,240(sp)
    8020050a:	7fee                	ld	t6,248(sp)
    8020050c:	6142                	ld	sp,16(sp)
    8020050e:	10200073          	sret

0000000080200512 <alloc_pages>:
    80200512:	100027f3          	csrr	a5,sstatus
    80200516:	8b89                	andi	a5,a5,2
    80200518:	eb81                	bnez	a5,80200528 <alloc_pages+0x16>
    8020051a:	00005797          	auipc	a5,0x5
    8020051e:	b167b783          	ld	a5,-1258(a5) # 80205030 <pmm_manager>
    80200522:	0187b303          	ld	t1,24(a5)
    80200526:	8302                	jr	t1
    80200528:	1141                	addi	sp,sp,-16
    8020052a:	e406                	sd	ra,8(sp)
    8020052c:	e022                	sd	s0,0(sp)
    8020052e:	842a                	mv	s0,a0
    80200530:	c3fff0ef          	jal	ra,8020016e <intr_disable>
    80200534:	00005797          	auipc	a5,0x5
    80200538:	afc7b783          	ld	a5,-1284(a5) # 80205030 <pmm_manager>
    8020053c:	6f9c                	ld	a5,24(a5)
    8020053e:	8522                	mv	a0,s0
    80200540:	9782                	jalr	a5
    80200542:	842a                	mv	s0,a0
    80200544:	c25ff0ef          	jal	ra,80200168 <intr_enable>
    80200548:	60a2                	ld	ra,8(sp)
    8020054a:	8522                	mv	a0,s0
    8020054c:	6402                	ld	s0,0(sp)
    8020054e:	0141                	addi	sp,sp,16
    80200550:	8082                	ret

0000000080200552 <free_pages>:
    80200552:	100027f3          	csrr	a5,sstatus
    80200556:	8b89                	andi	a5,a5,2
    80200558:	eb81                	bnez	a5,80200568 <free_pages+0x16>
    8020055a:	00005797          	auipc	a5,0x5
    8020055e:	ad67b783          	ld	a5,-1322(a5) # 80205030 <pmm_manager>
    80200562:	0207b303          	ld	t1,32(a5)
    80200566:	8302                	jr	t1
    80200568:	1101                	addi	sp,sp,-32
    8020056a:	ec06                	sd	ra,24(sp)
    8020056c:	e822                	sd	s0,16(sp)
    8020056e:	e426                	sd	s1,8(sp)
    80200570:	842a                	mv	s0,a0
    80200572:	84ae                	mv	s1,a1
    80200574:	bfbff0ef          	jal	ra,8020016e <intr_disable>
    80200578:	00005797          	auipc	a5,0x5
    8020057c:	ab87b783          	ld	a5,-1352(a5) # 80205030 <pmm_manager>
    80200580:	739c                	ld	a5,32(a5)
    80200582:	85a6                	mv	a1,s1
    80200584:	8522                	mv	a0,s0
    80200586:	9782                	jalr	a5
    80200588:	6442                	ld	s0,16(sp)
    8020058a:	60e2                	ld	ra,24(sp)
    8020058c:	64a2                	ld	s1,8(sp)
    8020058e:	6105                	addi	sp,sp,32
    80200590:	bee1                	j	80200168 <intr_enable>

0000000080200592 <nr_free_pages>:
    80200592:	100027f3          	csrr	a5,sstatus
    80200596:	8b89                	andi	a5,a5,2
    80200598:	eb81                	bnez	a5,802005a8 <nr_free_pages+0x16>
    8020059a:	00005797          	auipc	a5,0x5
    8020059e:	a967b783          	ld	a5,-1386(a5) # 80205030 <pmm_manager>
    802005a2:	0287b303          	ld	t1,40(a5)
    802005a6:	8302                	jr	t1
    802005a8:	1141                	addi	sp,sp,-16
    802005aa:	e406                	sd	ra,8(sp)
    802005ac:	e022                	sd	s0,0(sp)
    802005ae:	bc1ff0ef          	jal	ra,8020016e <intr_disable>
    802005b2:	00005797          	auipc	a5,0x5
    802005b6:	a7e7b783          	ld	a5,-1410(a5) # 80205030 <pmm_manager>
    802005ba:	779c                	ld	a5,40(a5)
    802005bc:	9782                	jalr	a5
    802005be:	842a                	mv	s0,a0
    802005c0:	ba9ff0ef          	jal	ra,80200168 <intr_enable>
    802005c4:	60a2                	ld	ra,8(sp)
    802005c6:	8522                	mv	a0,s0
    802005c8:	6402                	ld	s0,0(sp)
    802005ca:	0141                	addi	sp,sp,16
    802005cc:	8082                	ret

00000000802005ce <pmm_init>:
    802005ce:	00002797          	auipc	a5,0x2
    802005d2:	86278793          	addi	a5,a5,-1950 # 80201e30 <best_fit_pmm_manager>
    802005d6:	638c                	ld	a1,0(a5)
    802005d8:	1141                	addi	sp,sp,-16
    802005da:	e022                	sd	s0,0(sp)
    802005dc:	00001517          	auipc	a0,0x1
    802005e0:	42450513          	addi	a0,a0,1060 # 80201a00 <etext+0x4a8>
    802005e4:	00005417          	auipc	s0,0x5
    802005e8:	a4c40413          	addi	s0,s0,-1460 # 80205030 <pmm_manager>
    802005ec:	e406                	sd	ra,8(sp)
    802005ee:	e01c                	sd	a5,0(s0)
    802005f0:	a93ff0ef          	jal	ra,80200082 <cprintf>
    802005f4:	601c                	ld	a5,0(s0)
    802005f6:	679c                	ld	a5,8(a5)
    802005f8:	9782                	jalr	a5
    802005fa:	00001517          	auipc	a0,0x1
    802005fe:	41e50513          	addi	a0,a0,1054 # 80201a18 <etext+0x4c0>
    80200602:	00005797          	auipc	a5,0x5
    80200606:	a207bb23          	sd	zero,-1482(a5) # 80205038 <va_pa_offset>
    8020060a:	a79ff0ef          	jal	ra,80200082 <cprintf>
    8020060e:	46c5                	li	a3,17
    80200610:	06ee                	slli	a3,a3,0x1b
    80200612:	40100613          	li	a2,1025
    80200616:	16fd                	addi	a3,a3,-1
    80200618:	0656                	slli	a2,a2,0x15
    8020061a:	07e005b7          	lui	a1,0x7e00
    8020061e:	00001517          	auipc	a0,0x1
    80200622:	41250513          	addi	a0,a0,1042 # 80201a30 <etext+0x4d8>
    80200626:	a5dff0ef          	jal	ra,80200082 <cprintf>
    8020062a:	777d                	lui	a4,0xfffff
    8020062c:	00006797          	auipc	a5,0x6
    80200630:	a3378793          	addi	a5,a5,-1485 # 8020605f <end+0xfff>
    80200634:	8ff9                	and	a5,a5,a4
    80200636:	00005517          	auipc	a0,0x5
    8020063a:	9da50513          	addi	a0,a0,-1574 # 80205010 <npage>
    8020063e:	00005697          	auipc	a3,0x5
    80200642:	a0268693          	addi	a3,a3,-1534 # 80205040 <pages>
    80200646:	00088737          	lui	a4,0x88
    8020064a:	e118                	sd	a4,0(a0)
    8020064c:	e29c                	sd	a5,0(a3)
    8020064e:	4581                	li	a1,0
    80200650:	4601                	li	a2,0
    80200652:	4885                	li	a7,1
    80200654:	fff80837          	lui	a6,0xfff80
    80200658:	a011                	j	8020065c <pmm_init+0x8e>
    8020065a:	629c                	ld	a5,0(a3)
    8020065c:	97ae                	add	a5,a5,a1
    8020065e:	07a1                	addi	a5,a5,8
    80200660:	4117b02f          	amoor.d	zero,a7,(a5)
    80200664:	6118                	ld	a4,0(a0)
    80200666:	0605                	addi	a2,a2,1
    80200668:	02858593          	addi	a1,a1,40 # 7e00028 <kern_entry-0x783fffd8>
    8020066c:	010707b3          	add	a5,a4,a6
    80200670:	fef665e3          	bltu	a2,a5,8020065a <pmm_init+0x8c>
    80200674:	6290                	ld	a2,0(a3)
    80200676:	00271793          	slli	a5,a4,0x2
    8020067a:	97ba                	add	a5,a5,a4
    8020067c:	fec006b7          	lui	a3,0xfec00
    80200680:	078e                	slli	a5,a5,0x3
    80200682:	96b2                	add	a3,a3,a2
    80200684:	96be                	add	a3,a3,a5
    80200686:	40100793          	li	a5,1025
    8020068a:	07d6                	slli	a5,a5,0x15
    8020068c:	04f6eb63          	bltu	a3,a5,802006e2 <pmm_init+0x114>
    80200690:	00005597          	auipc	a1,0x5
    80200694:	9a85b583          	ld	a1,-1624(a1) # 80205038 <va_pa_offset>
    80200698:	8e8d                	sub	a3,a3,a1
    8020069a:	45c5                	li	a1,17
    8020069c:	05ee                	slli	a1,a1,0x1b
    8020069e:	00b6ed63          	bltu	a3,a1,802006b8 <pmm_init+0xea>
    802006a2:	601c                	ld	a5,0(s0)
    802006a4:	7b9c                	ld	a5,48(a5)
    802006a6:	9782                	jalr	a5
    802006a8:	6402                	ld	s0,0(sp)
    802006aa:	60a2                	ld	ra,8(sp)
    802006ac:	00001517          	auipc	a0,0x1
    802006b0:	41c50513          	addi	a0,a0,1052 # 80201ac8 <etext+0x570>
    802006b4:	0141                	addi	sp,sp,16
    802006b6:	b2f1                	j	80200082 <cprintf>
    802006b8:	6785                	lui	a5,0x1
    802006ba:	17fd                	addi	a5,a5,-1
    802006bc:	96be                	add	a3,a3,a5
    802006be:	77fd                	lui	a5,0xfffff
    802006c0:	8efd                	and	a3,a3,a5
    802006c2:	00c6d513          	srli	a0,a3,0xc
    802006c6:	02e57a63          	bgeu	a0,a4,802006fa <pmm_init+0x12c>
    802006ca:	601c                	ld	a5,0(s0)
    802006cc:	982a                	add	a6,a6,a0
    802006ce:	00281513          	slli	a0,a6,0x2
    802006d2:	9542                	add	a0,a0,a6
    802006d4:	6b9c                	ld	a5,16(a5)
    802006d6:	8d95                	sub	a1,a1,a3
    802006d8:	050e                	slli	a0,a0,0x3
    802006da:	81b1                	srli	a1,a1,0xc
    802006dc:	9532                	add	a0,a0,a2
    802006de:	9782                	jalr	a5
    802006e0:	b7c9                	j	802006a2 <pmm_init+0xd4>
    802006e2:	00001617          	auipc	a2,0x1
    802006e6:	37e60613          	addi	a2,a2,894 # 80201a60 <etext+0x508>
    802006ea:	06f00593          	li	a1,111
    802006ee:	00001517          	auipc	a0,0x1
    802006f2:	39a50513          	addi	a0,a0,922 # 80201a88 <etext+0x530>
    802006f6:	a03ff0ef          	jal	ra,802000f8 <__panic>
    802006fa:	00001617          	auipc	a2,0x1
    802006fe:	39e60613          	addi	a2,a2,926 # 80201a98 <etext+0x540>
    80200702:	06f00593          	li	a1,111
    80200706:	00001517          	auipc	a0,0x1
    8020070a:	3b250513          	addi	a0,a0,946 # 80201ab8 <etext+0x560>
    8020070e:	9ebff0ef          	jal	ra,802000f8 <__panic>

0000000080200712 <best_fit_init>:
    80200712:	00005797          	auipc	a5,0x5
    80200716:	93678793          	addi	a5,a5,-1738 # 80205048 <free_area>
    8020071a:	e79c                	sd	a5,8(a5)
    8020071c:	e39c                	sd	a5,0(a5)
    8020071e:	0007a823          	sw	zero,16(a5)
    80200722:	8082                	ret

0000000080200724 <best_fit_nr_free_pages>:
    80200724:	00005517          	auipc	a0,0x5
    80200728:	93456503          	lwu	a0,-1740(a0) # 80205058 <free_area+0x10>
    8020072c:	8082                	ret

000000008020072e <best_fit_check>:
    8020072e:	715d                	addi	sp,sp,-80
    80200730:	e0a2                	sd	s0,64(sp)
    80200732:	00005417          	auipc	s0,0x5
    80200736:	91640413          	addi	s0,s0,-1770 # 80205048 <free_area>
    8020073a:	641c                	ld	a5,8(s0)
    8020073c:	e486                	sd	ra,72(sp)
    8020073e:	fc26                	sd	s1,56(sp)
    80200740:	f84a                	sd	s2,48(sp)
    80200742:	f44e                	sd	s3,40(sp)
    80200744:	f052                	sd	s4,32(sp)
    80200746:	ec56                	sd	s5,24(sp)
    80200748:	e85a                	sd	s6,16(sp)
    8020074a:	e45e                	sd	s7,8(sp)
    8020074c:	e062                	sd	s8,0(sp)
    8020074e:	26878b63          	beq	a5,s0,802009c4 <best_fit_check+0x296>
    80200752:	4481                	li	s1,0
    80200754:	4901                	li	s2,0
    80200756:	ff07b703          	ld	a4,-16(a5)
    8020075a:	8b09                	andi	a4,a4,2
    8020075c:	26070863          	beqz	a4,802009cc <best_fit_check+0x29e>
    80200760:	ff87a703          	lw	a4,-8(a5)
    80200764:	679c                	ld	a5,8(a5)
    80200766:	2905                	addiw	s2,s2,1
    80200768:	9cb9                	addw	s1,s1,a4
    8020076a:	fe8796e3          	bne	a5,s0,80200756 <best_fit_check+0x28>
    8020076e:	89a6                	mv	s3,s1
    80200770:	e23ff0ef          	jal	ra,80200592 <nr_free_pages>
    80200774:	33351c63          	bne	a0,s3,80200aac <best_fit_check+0x37e>
    80200778:	4505                	li	a0,1
    8020077a:	d99ff0ef          	jal	ra,80200512 <alloc_pages>
    8020077e:	8a2a                	mv	s4,a0
    80200780:	36050663          	beqz	a0,80200aec <best_fit_check+0x3be>
    80200784:	4505                	li	a0,1
    80200786:	d8dff0ef          	jal	ra,80200512 <alloc_pages>
    8020078a:	89aa                	mv	s3,a0
    8020078c:	34050063          	beqz	a0,80200acc <best_fit_check+0x39e>
    80200790:	4505                	li	a0,1
    80200792:	d81ff0ef          	jal	ra,80200512 <alloc_pages>
    80200796:	8aaa                	mv	s5,a0
    80200798:	2c050a63          	beqz	a0,80200a6c <best_fit_check+0x33e>
    8020079c:	253a0863          	beq	s4,s3,802009ec <best_fit_check+0x2be>
    802007a0:	24aa0663          	beq	s4,a0,802009ec <best_fit_check+0x2be>
    802007a4:	24a98463          	beq	s3,a0,802009ec <best_fit_check+0x2be>
    802007a8:	000a2783          	lw	a5,0(s4)
    802007ac:	26079063          	bnez	a5,80200a0c <best_fit_check+0x2de>
    802007b0:	0009a783          	lw	a5,0(s3)
    802007b4:	24079c63          	bnez	a5,80200a0c <best_fit_check+0x2de>
    802007b8:	411c                	lw	a5,0(a0)
    802007ba:	24079963          	bnez	a5,80200a0c <best_fit_check+0x2de>
    802007be:	00005797          	auipc	a5,0x5
    802007c2:	8827b783          	ld	a5,-1918(a5) # 80205040 <pages>
    802007c6:	40fa0733          	sub	a4,s4,a5
    802007ca:	870d                	srai	a4,a4,0x3
    802007cc:	00002597          	auipc	a1,0x2
    802007d0:	8ec5b583          	ld	a1,-1812(a1) # 802020b8 <nbase+0x8>
    802007d4:	02b70733          	mul	a4,a4,a1
    802007d8:	00002617          	auipc	a2,0x2
    802007dc:	8d863603          	ld	a2,-1832(a2) # 802020b0 <nbase>
    802007e0:	00005697          	auipc	a3,0x5
    802007e4:	8306b683          	ld	a3,-2000(a3) # 80205010 <npage>
    802007e8:	06b2                	slli	a3,a3,0xc
    802007ea:	9732                	add	a4,a4,a2
    802007ec:	0732                	slli	a4,a4,0xc
    802007ee:	22d77f63          	bgeu	a4,a3,80200a2c <best_fit_check+0x2fe>
    802007f2:	40f98733          	sub	a4,s3,a5
    802007f6:	870d                	srai	a4,a4,0x3
    802007f8:	02b70733          	mul	a4,a4,a1
    802007fc:	9732                	add	a4,a4,a2
    802007fe:	0732                	slli	a4,a4,0xc
    80200800:	3ed77663          	bgeu	a4,a3,80200bec <best_fit_check+0x4be>
    80200804:	40f507b3          	sub	a5,a0,a5
    80200808:	878d                	srai	a5,a5,0x3
    8020080a:	02b787b3          	mul	a5,a5,a1
    8020080e:	97b2                	add	a5,a5,a2
    80200810:	07b2                	slli	a5,a5,0xc
    80200812:	3ad7fd63          	bgeu	a5,a3,80200bcc <best_fit_check+0x49e>
    80200816:	4505                	li	a0,1
    80200818:	00043c03          	ld	s8,0(s0)
    8020081c:	00843b83          	ld	s7,8(s0)
    80200820:	01042b03          	lw	s6,16(s0)
    80200824:	e400                	sd	s0,8(s0)
    80200826:	e000                	sd	s0,0(s0)
    80200828:	00005797          	auipc	a5,0x5
    8020082c:	8207a823          	sw	zero,-2000(a5) # 80205058 <free_area+0x10>
    80200830:	ce3ff0ef          	jal	ra,80200512 <alloc_pages>
    80200834:	36051c63          	bnez	a0,80200bac <best_fit_check+0x47e>
    80200838:	4585                	li	a1,1
    8020083a:	8552                	mv	a0,s4
    8020083c:	d17ff0ef          	jal	ra,80200552 <free_pages>
    80200840:	4585                	li	a1,1
    80200842:	854e                	mv	a0,s3
    80200844:	d0fff0ef          	jal	ra,80200552 <free_pages>
    80200848:	4585                	li	a1,1
    8020084a:	8556                	mv	a0,s5
    8020084c:	d07ff0ef          	jal	ra,80200552 <free_pages>
    80200850:	4818                	lw	a4,16(s0)
    80200852:	478d                	li	a5,3
    80200854:	32f71c63          	bne	a4,a5,80200b8c <best_fit_check+0x45e>
    80200858:	4505                	li	a0,1
    8020085a:	cb9ff0ef          	jal	ra,80200512 <alloc_pages>
    8020085e:	89aa                	mv	s3,a0
    80200860:	30050663          	beqz	a0,80200b6c <best_fit_check+0x43e>
    80200864:	4505                	li	a0,1
    80200866:	cadff0ef          	jal	ra,80200512 <alloc_pages>
    8020086a:	8aaa                	mv	s5,a0
    8020086c:	2e050063          	beqz	a0,80200b4c <best_fit_check+0x41e>
    80200870:	4505                	li	a0,1
    80200872:	ca1ff0ef          	jal	ra,80200512 <alloc_pages>
    80200876:	8a2a                	mv	s4,a0
    80200878:	2a050a63          	beqz	a0,80200b2c <best_fit_check+0x3fe>
    8020087c:	4505                	li	a0,1
    8020087e:	c95ff0ef          	jal	ra,80200512 <alloc_pages>
    80200882:	28051563          	bnez	a0,80200b0c <best_fit_check+0x3de>
    80200886:	4585                	li	a1,1
    80200888:	854e                	mv	a0,s3
    8020088a:	cc9ff0ef          	jal	ra,80200552 <free_pages>
    8020088e:	641c                	ld	a5,8(s0)
    80200890:	1a878e63          	beq	a5,s0,80200a4c <best_fit_check+0x31e>
    80200894:	4505                	li	a0,1
    80200896:	c7dff0ef          	jal	ra,80200512 <alloc_pages>
    8020089a:	52a99963          	bne	s3,a0,80200dcc <best_fit_check+0x69e>
    8020089e:	4505                	li	a0,1
    802008a0:	c73ff0ef          	jal	ra,80200512 <alloc_pages>
    802008a4:	50051463          	bnez	a0,80200dac <best_fit_check+0x67e>
    802008a8:	481c                	lw	a5,16(s0)
    802008aa:	4e079163          	bnez	a5,80200d8c <best_fit_check+0x65e>
    802008ae:	854e                	mv	a0,s3
    802008b0:	4585                	li	a1,1
    802008b2:	01843023          	sd	s8,0(s0)
    802008b6:	01743423          	sd	s7,8(s0)
    802008ba:	01642823          	sw	s6,16(s0)
    802008be:	c95ff0ef          	jal	ra,80200552 <free_pages>
    802008c2:	4585                	li	a1,1
    802008c4:	8556                	mv	a0,s5
    802008c6:	c8dff0ef          	jal	ra,80200552 <free_pages>
    802008ca:	4585                	li	a1,1
    802008cc:	8552                	mv	a0,s4
    802008ce:	c85ff0ef          	jal	ra,80200552 <free_pages>
    802008d2:	4515                	li	a0,5
    802008d4:	c3fff0ef          	jal	ra,80200512 <alloc_pages>
    802008d8:	89aa                	mv	s3,a0
    802008da:	48050963          	beqz	a0,80200d6c <best_fit_check+0x63e>
    802008de:	651c                	ld	a5,8(a0)
    802008e0:	8385                	srli	a5,a5,0x1
    802008e2:	8b85                	andi	a5,a5,1
    802008e4:	46079463          	bnez	a5,80200d4c <best_fit_check+0x61e>
    802008e8:	4505                	li	a0,1
    802008ea:	00043a83          	ld	s5,0(s0)
    802008ee:	00843a03          	ld	s4,8(s0)
    802008f2:	e000                	sd	s0,0(s0)
    802008f4:	e400                	sd	s0,8(s0)
    802008f6:	c1dff0ef          	jal	ra,80200512 <alloc_pages>
    802008fa:	42051963          	bnez	a0,80200d2c <best_fit_check+0x5fe>
    802008fe:	4589                	li	a1,2
    80200900:	02898513          	addi	a0,s3,40
    80200904:	01042b03          	lw	s6,16(s0)
    80200908:	0a098c13          	addi	s8,s3,160
    8020090c:	00004797          	auipc	a5,0x4
    80200910:	7407a623          	sw	zero,1868(a5) # 80205058 <free_area+0x10>
    80200914:	c3fff0ef          	jal	ra,80200552 <free_pages>
    80200918:	8562                	mv	a0,s8
    8020091a:	4585                	li	a1,1
    8020091c:	c37ff0ef          	jal	ra,80200552 <free_pages>
    80200920:	4511                	li	a0,4
    80200922:	bf1ff0ef          	jal	ra,80200512 <alloc_pages>
    80200926:	3e051363          	bnez	a0,80200d0c <best_fit_check+0x5de>
    8020092a:	0309b783          	ld	a5,48(s3)
    8020092e:	8385                	srli	a5,a5,0x1
    80200930:	8b85                	andi	a5,a5,1
    80200932:	3a078d63          	beqz	a5,80200cec <best_fit_check+0x5be>
    80200936:	0389a703          	lw	a4,56(s3)
    8020093a:	4789                	li	a5,2
    8020093c:	3af71863          	bne	a4,a5,80200cec <best_fit_check+0x5be>
    80200940:	4505                	li	a0,1
    80200942:	bd1ff0ef          	jal	ra,80200512 <alloc_pages>
    80200946:	8baa                	mv	s7,a0
    80200948:	38050263          	beqz	a0,80200ccc <best_fit_check+0x59e>
    8020094c:	4509                	li	a0,2
    8020094e:	bc5ff0ef          	jal	ra,80200512 <alloc_pages>
    80200952:	34050d63          	beqz	a0,80200cac <best_fit_check+0x57e>
    80200956:	337c1b63          	bne	s8,s7,80200c8c <best_fit_check+0x55e>
    8020095a:	854e                	mv	a0,s3
    8020095c:	4595                	li	a1,5
    8020095e:	bf5ff0ef          	jal	ra,80200552 <free_pages>
    80200962:	4515                	li	a0,5
    80200964:	bafff0ef          	jal	ra,80200512 <alloc_pages>
    80200968:	89aa                	mv	s3,a0
    8020096a:	30050163          	beqz	a0,80200c6c <best_fit_check+0x53e>
    8020096e:	4505                	li	a0,1
    80200970:	ba3ff0ef          	jal	ra,80200512 <alloc_pages>
    80200974:	2c051c63          	bnez	a0,80200c4c <best_fit_check+0x51e>
    80200978:	481c                	lw	a5,16(s0)
    8020097a:	2a079963          	bnez	a5,80200c2c <best_fit_check+0x4fe>
    8020097e:	4595                	li	a1,5
    80200980:	854e                	mv	a0,s3
    80200982:	01642823          	sw	s6,16(s0)
    80200986:	01543023          	sd	s5,0(s0)
    8020098a:	01443423          	sd	s4,8(s0)
    8020098e:	bc5ff0ef          	jal	ra,80200552 <free_pages>
    80200992:	641c                	ld	a5,8(s0)
    80200994:	00878963          	beq	a5,s0,802009a6 <best_fit_check+0x278>
    80200998:	ff87a703          	lw	a4,-8(a5)
    8020099c:	679c                	ld	a5,8(a5)
    8020099e:	397d                	addiw	s2,s2,-1
    802009a0:	9c99                	subw	s1,s1,a4
    802009a2:	fe879be3          	bne	a5,s0,80200998 <best_fit_check+0x26a>
    802009a6:	26091363          	bnez	s2,80200c0c <best_fit_check+0x4de>
    802009aa:	e0ed                	bnez	s1,80200a8c <best_fit_check+0x35e>
    802009ac:	60a6                	ld	ra,72(sp)
    802009ae:	6406                	ld	s0,64(sp)
    802009b0:	74e2                	ld	s1,56(sp)
    802009b2:	7942                	ld	s2,48(sp)
    802009b4:	79a2                	ld	s3,40(sp)
    802009b6:	7a02                	ld	s4,32(sp)
    802009b8:	6ae2                	ld	s5,24(sp)
    802009ba:	6b42                	ld	s6,16(sp)
    802009bc:	6ba2                	ld	s7,8(sp)
    802009be:	6c02                	ld	s8,0(sp)
    802009c0:	6161                	addi	sp,sp,80
    802009c2:	8082                	ret
    802009c4:	4981                	li	s3,0
    802009c6:	4481                	li	s1,0
    802009c8:	4901                	li	s2,0
    802009ca:	b35d                	j	80200770 <best_fit_check+0x42>
    802009cc:	00001697          	auipc	a3,0x1
    802009d0:	11c68693          	addi	a3,a3,284 # 80201ae8 <etext+0x590>
    802009d4:	00001617          	auipc	a2,0x1
    802009d8:	12460613          	addi	a2,a2,292 # 80201af8 <etext+0x5a0>
    802009dc:	0df00593          	li	a1,223
    802009e0:	00001517          	auipc	a0,0x1
    802009e4:	13050513          	addi	a0,a0,304 # 80201b10 <etext+0x5b8>
    802009e8:	f10ff0ef          	jal	ra,802000f8 <__panic>
    802009ec:	00001697          	auipc	a3,0x1
    802009f0:	1bc68693          	addi	a3,a3,444 # 80201ba8 <etext+0x650>
    802009f4:	00001617          	auipc	a2,0x1
    802009f8:	10460613          	addi	a2,a2,260 # 80201af8 <etext+0x5a0>
    802009fc:	0a900593          	li	a1,169
    80200a00:	00001517          	auipc	a0,0x1
    80200a04:	11050513          	addi	a0,a0,272 # 80201b10 <etext+0x5b8>
    80200a08:	ef0ff0ef          	jal	ra,802000f8 <__panic>
    80200a0c:	00001697          	auipc	a3,0x1
    80200a10:	1c468693          	addi	a3,a3,452 # 80201bd0 <etext+0x678>
    80200a14:	00001617          	auipc	a2,0x1
    80200a18:	0e460613          	addi	a2,a2,228 # 80201af8 <etext+0x5a0>
    80200a1c:	0aa00593          	li	a1,170
    80200a20:	00001517          	auipc	a0,0x1
    80200a24:	0f050513          	addi	a0,a0,240 # 80201b10 <etext+0x5b8>
    80200a28:	ed0ff0ef          	jal	ra,802000f8 <__panic>
    80200a2c:	00001697          	auipc	a3,0x1
    80200a30:	1e468693          	addi	a3,a3,484 # 80201c10 <etext+0x6b8>
    80200a34:	00001617          	auipc	a2,0x1
    80200a38:	0c460613          	addi	a2,a2,196 # 80201af8 <etext+0x5a0>
    80200a3c:	0ac00593          	li	a1,172
    80200a40:	00001517          	auipc	a0,0x1
    80200a44:	0d050513          	addi	a0,a0,208 # 80201b10 <etext+0x5b8>
    80200a48:	eb0ff0ef          	jal	ra,802000f8 <__panic>
    80200a4c:	00001697          	auipc	a3,0x1
    80200a50:	24c68693          	addi	a3,a3,588 # 80201c98 <etext+0x740>
    80200a54:	00001617          	auipc	a2,0x1
    80200a58:	0a460613          	addi	a2,a2,164 # 80201af8 <etext+0x5a0>
    80200a5c:	0c500593          	li	a1,197
    80200a60:	00001517          	auipc	a0,0x1
    80200a64:	0b050513          	addi	a0,a0,176 # 80201b10 <etext+0x5b8>
    80200a68:	e90ff0ef          	jal	ra,802000f8 <__panic>
    80200a6c:	00001697          	auipc	a3,0x1
    80200a70:	11c68693          	addi	a3,a3,284 # 80201b88 <etext+0x630>
    80200a74:	00001617          	auipc	a2,0x1
    80200a78:	08460613          	addi	a2,a2,132 # 80201af8 <etext+0x5a0>
    80200a7c:	0a700593          	li	a1,167
    80200a80:	00001517          	auipc	a0,0x1
    80200a84:	09050513          	addi	a0,a0,144 # 80201b10 <etext+0x5b8>
    80200a88:	e70ff0ef          	jal	ra,802000f8 <__panic>
    80200a8c:	00001697          	auipc	a3,0x1
    80200a90:	33c68693          	addi	a3,a3,828 # 80201dc8 <etext+0x870>
    80200a94:	00001617          	auipc	a2,0x1
    80200a98:	06460613          	addi	a2,a2,100 # 80201af8 <etext+0x5a0>
    80200a9c:	12200593          	li	a1,290
    80200aa0:	00001517          	auipc	a0,0x1
    80200aa4:	07050513          	addi	a0,a0,112 # 80201b10 <etext+0x5b8>
    80200aa8:	e50ff0ef          	jal	ra,802000f8 <__panic>
    80200aac:	00001697          	auipc	a3,0x1
    80200ab0:	07c68693          	addi	a3,a3,124 # 80201b28 <etext+0x5d0>
    80200ab4:	00001617          	auipc	a2,0x1
    80200ab8:	04460613          	addi	a2,a2,68 # 80201af8 <etext+0x5a0>
    80200abc:	0e200593          	li	a1,226
    80200ac0:	00001517          	auipc	a0,0x1
    80200ac4:	05050513          	addi	a0,a0,80 # 80201b10 <etext+0x5b8>
    80200ac8:	e30ff0ef          	jal	ra,802000f8 <__panic>
    80200acc:	00001697          	auipc	a3,0x1
    80200ad0:	09c68693          	addi	a3,a3,156 # 80201b68 <etext+0x610>
    80200ad4:	00001617          	auipc	a2,0x1
    80200ad8:	02460613          	addi	a2,a2,36 # 80201af8 <etext+0x5a0>
    80200adc:	0a600593          	li	a1,166
    80200ae0:	00001517          	auipc	a0,0x1
    80200ae4:	03050513          	addi	a0,a0,48 # 80201b10 <etext+0x5b8>
    80200ae8:	e10ff0ef          	jal	ra,802000f8 <__panic>
    80200aec:	00001697          	auipc	a3,0x1
    80200af0:	05c68693          	addi	a3,a3,92 # 80201b48 <etext+0x5f0>
    80200af4:	00001617          	auipc	a2,0x1
    80200af8:	00460613          	addi	a2,a2,4 # 80201af8 <etext+0x5a0>
    80200afc:	0a500593          	li	a1,165
    80200b00:	00001517          	auipc	a0,0x1
    80200b04:	01050513          	addi	a0,a0,16 # 80201b10 <etext+0x5b8>
    80200b08:	df0ff0ef          	jal	ra,802000f8 <__panic>
    80200b0c:	00001697          	auipc	a3,0x1
    80200b10:	16468693          	addi	a3,a3,356 # 80201c70 <etext+0x718>
    80200b14:	00001617          	auipc	a2,0x1
    80200b18:	fe460613          	addi	a2,a2,-28 # 80201af8 <etext+0x5a0>
    80200b1c:	0c200593          	li	a1,194
    80200b20:	00001517          	auipc	a0,0x1
    80200b24:	ff050513          	addi	a0,a0,-16 # 80201b10 <etext+0x5b8>
    80200b28:	dd0ff0ef          	jal	ra,802000f8 <__panic>
    80200b2c:	00001697          	auipc	a3,0x1
    80200b30:	05c68693          	addi	a3,a3,92 # 80201b88 <etext+0x630>
    80200b34:	00001617          	auipc	a2,0x1
    80200b38:	fc460613          	addi	a2,a2,-60 # 80201af8 <etext+0x5a0>
    80200b3c:	0c000593          	li	a1,192
    80200b40:	00001517          	auipc	a0,0x1
    80200b44:	fd050513          	addi	a0,a0,-48 # 80201b10 <etext+0x5b8>
    80200b48:	db0ff0ef          	jal	ra,802000f8 <__panic>
    80200b4c:	00001697          	auipc	a3,0x1
    80200b50:	01c68693          	addi	a3,a3,28 # 80201b68 <etext+0x610>
    80200b54:	00001617          	auipc	a2,0x1
    80200b58:	fa460613          	addi	a2,a2,-92 # 80201af8 <etext+0x5a0>
    80200b5c:	0bf00593          	li	a1,191
    80200b60:	00001517          	auipc	a0,0x1
    80200b64:	fb050513          	addi	a0,a0,-80 # 80201b10 <etext+0x5b8>
    80200b68:	d90ff0ef          	jal	ra,802000f8 <__panic>
    80200b6c:	00001697          	auipc	a3,0x1
    80200b70:	fdc68693          	addi	a3,a3,-36 # 80201b48 <etext+0x5f0>
    80200b74:	00001617          	auipc	a2,0x1
    80200b78:	f8460613          	addi	a2,a2,-124 # 80201af8 <etext+0x5a0>
    80200b7c:	0be00593          	li	a1,190
    80200b80:	00001517          	auipc	a0,0x1
    80200b84:	f9050513          	addi	a0,a0,-112 # 80201b10 <etext+0x5b8>
    80200b88:	d70ff0ef          	jal	ra,802000f8 <__panic>
    80200b8c:	00001697          	auipc	a3,0x1
    80200b90:	0fc68693          	addi	a3,a3,252 # 80201c88 <etext+0x730>
    80200b94:	00001617          	auipc	a2,0x1
    80200b98:	f6460613          	addi	a2,a2,-156 # 80201af8 <etext+0x5a0>
    80200b9c:	0bc00593          	li	a1,188
    80200ba0:	00001517          	auipc	a0,0x1
    80200ba4:	f7050513          	addi	a0,a0,-144 # 80201b10 <etext+0x5b8>
    80200ba8:	d50ff0ef          	jal	ra,802000f8 <__panic>
    80200bac:	00001697          	auipc	a3,0x1
    80200bb0:	0c468693          	addi	a3,a3,196 # 80201c70 <etext+0x718>
    80200bb4:	00001617          	auipc	a2,0x1
    80200bb8:	f4460613          	addi	a2,a2,-188 # 80201af8 <etext+0x5a0>
    80200bbc:	0b700593          	li	a1,183
    80200bc0:	00001517          	auipc	a0,0x1
    80200bc4:	f5050513          	addi	a0,a0,-176 # 80201b10 <etext+0x5b8>
    80200bc8:	d30ff0ef          	jal	ra,802000f8 <__panic>
    80200bcc:	00001697          	auipc	a3,0x1
    80200bd0:	08468693          	addi	a3,a3,132 # 80201c50 <etext+0x6f8>
    80200bd4:	00001617          	auipc	a2,0x1
    80200bd8:	f2460613          	addi	a2,a2,-220 # 80201af8 <etext+0x5a0>
    80200bdc:	0ae00593          	li	a1,174
    80200be0:	00001517          	auipc	a0,0x1
    80200be4:	f3050513          	addi	a0,a0,-208 # 80201b10 <etext+0x5b8>
    80200be8:	d10ff0ef          	jal	ra,802000f8 <__panic>
    80200bec:	00001697          	auipc	a3,0x1
    80200bf0:	04468693          	addi	a3,a3,68 # 80201c30 <etext+0x6d8>
    80200bf4:	00001617          	auipc	a2,0x1
    80200bf8:	f0460613          	addi	a2,a2,-252 # 80201af8 <etext+0x5a0>
    80200bfc:	0ad00593          	li	a1,173
    80200c00:	00001517          	auipc	a0,0x1
    80200c04:	f1050513          	addi	a0,a0,-240 # 80201b10 <etext+0x5b8>
    80200c08:	cf0ff0ef          	jal	ra,802000f8 <__panic>
    80200c0c:	00001697          	auipc	a3,0x1
    80200c10:	1ac68693          	addi	a3,a3,428 # 80201db8 <etext+0x860>
    80200c14:	00001617          	auipc	a2,0x1
    80200c18:	ee460613          	addi	a2,a2,-284 # 80201af8 <etext+0x5a0>
    80200c1c:	12100593          	li	a1,289
    80200c20:	00001517          	auipc	a0,0x1
    80200c24:	ef050513          	addi	a0,a0,-272 # 80201b10 <etext+0x5b8>
    80200c28:	cd0ff0ef          	jal	ra,802000f8 <__panic>
    80200c2c:	00001697          	auipc	a3,0x1
    80200c30:	0a468693          	addi	a3,a3,164 # 80201cd0 <etext+0x778>
    80200c34:	00001617          	auipc	a2,0x1
    80200c38:	ec460613          	addi	a2,a2,-316 # 80201af8 <etext+0x5a0>
    80200c3c:	11500593          	li	a1,277
    80200c40:	00001517          	auipc	a0,0x1
    80200c44:	ed050513          	addi	a0,a0,-304 # 80201b10 <etext+0x5b8>
    80200c48:	cb0ff0ef          	jal	ra,802000f8 <__panic>
    80200c4c:	00001697          	auipc	a3,0x1
    80200c50:	02468693          	addi	a3,a3,36 # 80201c70 <etext+0x718>
    80200c54:	00001617          	auipc	a2,0x1
    80200c58:	ea460613          	addi	a2,a2,-348 # 80201af8 <etext+0x5a0>
    80200c5c:	10f00593          	li	a1,271
    80200c60:	00001517          	auipc	a0,0x1
    80200c64:	eb050513          	addi	a0,a0,-336 # 80201b10 <etext+0x5b8>
    80200c68:	c90ff0ef          	jal	ra,802000f8 <__panic>
    80200c6c:	00001697          	auipc	a3,0x1
    80200c70:	12c68693          	addi	a3,a3,300 # 80201d98 <etext+0x840>
    80200c74:	00001617          	auipc	a2,0x1
    80200c78:	e8460613          	addi	a2,a2,-380 # 80201af8 <etext+0x5a0>
    80200c7c:	10e00593          	li	a1,270
    80200c80:	00001517          	auipc	a0,0x1
    80200c84:	e9050513          	addi	a0,a0,-368 # 80201b10 <etext+0x5b8>
    80200c88:	c70ff0ef          	jal	ra,802000f8 <__panic>
    80200c8c:	00001697          	auipc	a3,0x1
    80200c90:	0fc68693          	addi	a3,a3,252 # 80201d88 <etext+0x830>
    80200c94:	00001617          	auipc	a2,0x1
    80200c98:	e6460613          	addi	a2,a2,-412 # 80201af8 <etext+0x5a0>
    80200c9c:	10600593          	li	a1,262
    80200ca0:	00001517          	auipc	a0,0x1
    80200ca4:	e7050513          	addi	a0,a0,-400 # 80201b10 <etext+0x5b8>
    80200ca8:	c50ff0ef          	jal	ra,802000f8 <__panic>
    80200cac:	00001697          	auipc	a3,0x1
    80200cb0:	0c468693          	addi	a3,a3,196 # 80201d70 <etext+0x818>
    80200cb4:	00001617          	auipc	a2,0x1
    80200cb8:	e4460613          	addi	a2,a2,-444 # 80201af8 <etext+0x5a0>
    80200cbc:	10500593          	li	a1,261
    80200cc0:	00001517          	auipc	a0,0x1
    80200cc4:	e5050513          	addi	a0,a0,-432 # 80201b10 <etext+0x5b8>
    80200cc8:	c30ff0ef          	jal	ra,802000f8 <__panic>
    80200ccc:	00001697          	auipc	a3,0x1
    80200cd0:	08468693          	addi	a3,a3,132 # 80201d50 <etext+0x7f8>
    80200cd4:	00001617          	auipc	a2,0x1
    80200cd8:	e2460613          	addi	a2,a2,-476 # 80201af8 <etext+0x5a0>
    80200cdc:	10400593          	li	a1,260
    80200ce0:	00001517          	auipc	a0,0x1
    80200ce4:	e3050513          	addi	a0,a0,-464 # 80201b10 <etext+0x5b8>
    80200ce8:	c10ff0ef          	jal	ra,802000f8 <__panic>
    80200cec:	00001697          	auipc	a3,0x1
    80200cf0:	03468693          	addi	a3,a3,52 # 80201d20 <etext+0x7c8>
    80200cf4:	00001617          	auipc	a2,0x1
    80200cf8:	e0460613          	addi	a2,a2,-508 # 80201af8 <etext+0x5a0>
    80200cfc:	10200593          	li	a1,258
    80200d00:	00001517          	auipc	a0,0x1
    80200d04:	e1050513          	addi	a0,a0,-496 # 80201b10 <etext+0x5b8>
    80200d08:	bf0ff0ef          	jal	ra,802000f8 <__panic>
    80200d0c:	00001697          	auipc	a3,0x1
    80200d10:	ffc68693          	addi	a3,a3,-4 # 80201d08 <etext+0x7b0>
    80200d14:	00001617          	auipc	a2,0x1
    80200d18:	de460613          	addi	a2,a2,-540 # 80201af8 <etext+0x5a0>
    80200d1c:	10100593          	li	a1,257
    80200d20:	00001517          	auipc	a0,0x1
    80200d24:	df050513          	addi	a0,a0,-528 # 80201b10 <etext+0x5b8>
    80200d28:	bd0ff0ef          	jal	ra,802000f8 <__panic>
    80200d2c:	00001697          	auipc	a3,0x1
    80200d30:	f4468693          	addi	a3,a3,-188 # 80201c70 <etext+0x718>
    80200d34:	00001617          	auipc	a2,0x1
    80200d38:	dc460613          	addi	a2,a2,-572 # 80201af8 <etext+0x5a0>
    80200d3c:	0f500593          	li	a1,245
    80200d40:	00001517          	auipc	a0,0x1
    80200d44:	dd050513          	addi	a0,a0,-560 # 80201b10 <etext+0x5b8>
    80200d48:	bb0ff0ef          	jal	ra,802000f8 <__panic>
    80200d4c:	00001697          	auipc	a3,0x1
    80200d50:	fa468693          	addi	a3,a3,-92 # 80201cf0 <etext+0x798>
    80200d54:	00001617          	auipc	a2,0x1
    80200d58:	da460613          	addi	a2,a2,-604 # 80201af8 <etext+0x5a0>
    80200d5c:	0ec00593          	li	a1,236
    80200d60:	00001517          	auipc	a0,0x1
    80200d64:	db050513          	addi	a0,a0,-592 # 80201b10 <etext+0x5b8>
    80200d68:	b90ff0ef          	jal	ra,802000f8 <__panic>
    80200d6c:	00001697          	auipc	a3,0x1
    80200d70:	f7468693          	addi	a3,a3,-140 # 80201ce0 <etext+0x788>
    80200d74:	00001617          	auipc	a2,0x1
    80200d78:	d8460613          	addi	a2,a2,-636 # 80201af8 <etext+0x5a0>
    80200d7c:	0eb00593          	li	a1,235
    80200d80:	00001517          	auipc	a0,0x1
    80200d84:	d9050513          	addi	a0,a0,-624 # 80201b10 <etext+0x5b8>
    80200d88:	b70ff0ef          	jal	ra,802000f8 <__panic>
    80200d8c:	00001697          	auipc	a3,0x1
    80200d90:	f4468693          	addi	a3,a3,-188 # 80201cd0 <etext+0x778>
    80200d94:	00001617          	auipc	a2,0x1
    80200d98:	d6460613          	addi	a2,a2,-668 # 80201af8 <etext+0x5a0>
    80200d9c:	0cb00593          	li	a1,203
    80200da0:	00001517          	auipc	a0,0x1
    80200da4:	d7050513          	addi	a0,a0,-656 # 80201b10 <etext+0x5b8>
    80200da8:	b50ff0ef          	jal	ra,802000f8 <__panic>
    80200dac:	00001697          	auipc	a3,0x1
    80200db0:	ec468693          	addi	a3,a3,-316 # 80201c70 <etext+0x718>
    80200db4:	00001617          	auipc	a2,0x1
    80200db8:	d4460613          	addi	a2,a2,-700 # 80201af8 <etext+0x5a0>
    80200dbc:	0c900593          	li	a1,201
    80200dc0:	00001517          	auipc	a0,0x1
    80200dc4:	d5050513          	addi	a0,a0,-688 # 80201b10 <etext+0x5b8>
    80200dc8:	b30ff0ef          	jal	ra,802000f8 <__panic>
    80200dcc:	00001697          	auipc	a3,0x1
    80200dd0:	ee468693          	addi	a3,a3,-284 # 80201cb0 <etext+0x758>
    80200dd4:	00001617          	auipc	a2,0x1
    80200dd8:	d2460613          	addi	a2,a2,-732 # 80201af8 <etext+0x5a0>
    80200ddc:	0c800593          	li	a1,200
    80200de0:	00001517          	auipc	a0,0x1
    80200de4:	d3050513          	addi	a0,a0,-720 # 80201b10 <etext+0x5b8>
    80200de8:	b10ff0ef          	jal	ra,802000f8 <__panic>

0000000080200dec <best_fit_free_pages>:
    80200dec:	1141                	addi	sp,sp,-16
    80200dee:	e406                	sd	ra,8(sp)
    80200df0:	12058e63          	beqz	a1,80200f2c <best_fit_free_pages+0x140>
    80200df4:	00259693          	slli	a3,a1,0x2
    80200df8:	96ae                	add	a3,a3,a1
    80200dfa:	068e                	slli	a3,a3,0x3
    80200dfc:	96aa                	add	a3,a3,a0
    80200dfe:	87aa                	mv	a5,a0
    80200e00:	02d50163          	beq	a0,a3,80200e22 <best_fit_free_pages+0x36>
    80200e04:	6798                	ld	a4,8(a5)
    80200e06:	8b05                	andi	a4,a4,1
    80200e08:	10071263          	bnez	a4,80200f0c <best_fit_free_pages+0x120>
    80200e0c:	6798                	ld	a4,8(a5)
    80200e0e:	8b09                	andi	a4,a4,2
    80200e10:	ef75                	bnez	a4,80200f0c <best_fit_free_pages+0x120>
    80200e12:	0007b423          	sd	zero,8(a5)
    80200e16:	0007a023          	sw	zero,0(a5)
    80200e1a:	02878793          	addi	a5,a5,40
    80200e1e:	fed793e3          	bne	a5,a3,80200e04 <best_fit_free_pages+0x18>
    80200e22:	2581                	sext.w	a1,a1
    80200e24:	c90c                	sw	a1,16(a0)
    80200e26:	4789                	li	a5,2
    80200e28:	00850713          	addi	a4,a0,8
    80200e2c:	40f7302f          	amoor.d	zero,a5,(a4)
    80200e30:	00004617          	auipc	a2,0x4
    80200e34:	21860613          	addi	a2,a2,536 # 80205048 <free_area>
    80200e38:	4a18                	lw	a4,16(a2)
    80200e3a:	661c                	ld	a5,8(a2)
    80200e3c:	9f2d                	addw	a4,a4,a1
    80200e3e:	ca18                	sw	a4,16(a2)
    80200e40:	08c78a63          	beq	a5,a2,80200ed4 <best_fit_free_pages+0xe8>
    80200e44:	00063303          	ld	t1,0(a2)
    80200e48:	4e01                	li	t3,0
    80200e4a:	4801                	li	a6,0
    80200e4c:	01850893          	addi	a7,a0,24
    80200e50:	a019                	j	80200e56 <best_fit_free_pages+0x6a>
    80200e52:	8836                	mv	a6,a3
    80200e54:	87ba                	mv	a5,a4
    80200e56:	fe878693          	addi	a3,a5,-24
    80200e5a:	00d56f63          	bltu	a0,a3,80200e78 <best_fit_free_pages+0x8c>
    80200e5e:	6798                	ld	a4,8(a5)
    80200e60:	fec719e3          	bne	a4,a2,80200e52 <best_fit_free_pages+0x66>
    80200e64:	0117b423          	sd	a7,8(a5)
    80200e68:	f110                	sd	a2,32(a0)
    80200e6a:	6798                	ld	a4,8(a5)
    80200e6c:	ed1c                	sd	a5,24(a0)
    80200e6e:	8346                	mv	t1,a7
    80200e70:	04c70d63          	beq	a4,a2,80200eca <best_fit_free_pages+0xde>
    80200e74:	4e05                	li	t3,1
    80200e76:	bff1                	j	80200e52 <best_fit_free_pages+0x66>
    80200e78:	000e0463          	beqz	t3,80200e80 <best_fit_free_pages+0x94>
    80200e7c:	00663023          	sd	t1,0(a2)
    80200e80:	01082883          	lw	a7,16(a6) # fffffffffff80010 <end+0xffffffff7fd7afb0>
    80200e84:	02089713          	slli	a4,a7,0x20
    80200e88:	9301                	srli	a4,a4,0x20
    80200e8a:	00170613          	addi	a2,a4,1 # 88001 <kern_entry-0x80177fff>
    80200e8e:	00261713          	slli	a4,a2,0x2
    80200e92:	9732                	add	a4,a4,a2
    80200e94:	070e                	slli	a4,a4,0x3
    80200e96:	9742                	add	a4,a4,a6
    80200e98:	04e50763          	beq	a0,a4,80200ee6 <best_fit_free_pages+0xfa>
    80200e9c:	6398                	ld	a4,0(a5)
    80200e9e:	01850613          	addi	a2,a0,24
    80200ea2:	e390                	sd	a2,0(a5)
    80200ea4:	e710                	sd	a2,8(a4)
    80200ea6:	f11c                	sd	a5,32(a0)
    80200ea8:	ed18                	sd	a4,24(a0)
    80200eaa:	490c                	lw	a1,16(a0)
    80200eac:	02059713          	slli	a4,a1,0x20
    80200eb0:	9301                	srli	a4,a4,0x20
    80200eb2:	00170613          	addi	a2,a4,1
    80200eb6:	00261713          	slli	a4,a2,0x2
    80200eba:	9732                	add	a4,a4,a2
    80200ebc:	070e                	slli	a4,a4,0x3
    80200ebe:	972a                	add	a4,a4,a0
    80200ec0:	02e68b63          	beq	a3,a4,80200ef6 <best_fit_free_pages+0x10a>
    80200ec4:	60a2                	ld	ra,8(sp)
    80200ec6:	0141                	addi	sp,sp,16
    80200ec8:	8082                	ret
    80200eca:	60a2                	ld	ra,8(sp)
    80200ecc:	01163023          	sd	a7,0(a2)
    80200ed0:	0141                	addi	sp,sp,16
    80200ed2:	8082                	ret
    80200ed4:	60a2                	ld	ra,8(sp)
    80200ed6:	01850713          	addi	a4,a0,24
    80200eda:	e398                	sd	a4,0(a5)
    80200edc:	e798                	sd	a4,8(a5)
    80200ede:	f11c                	sd	a5,32(a0)
    80200ee0:	ed1c                	sd	a5,24(a0)
    80200ee2:	0141                	addi	sp,sp,16
    80200ee4:	8082                	ret
    80200ee6:	011585bb          	addw	a1,a1,a7
    80200eea:	00b82823          	sw	a1,16(a6)
    80200eee:	00052823          	sw	zero,16(a0)
    80200ef2:	8542                	mv	a0,a6
    80200ef4:	bf5d                	j	80200eaa <best_fit_free_pages+0xbe>
    80200ef6:	ff87a703          	lw	a4,-8(a5)
    80200efa:	6390                	ld	a2,0(a5)
    80200efc:	6794                	ld	a3,8(a5)
    80200efe:	9db9                	addw	a1,a1,a4
    80200f00:	c90c                	sw	a1,16(a0)
    80200f02:	fe07ac23          	sw	zero,-8(a5)
    80200f06:	e614                	sd	a3,8(a2)
    80200f08:	e290                	sd	a2,0(a3)
    80200f0a:	bf6d                	j	80200ec4 <best_fit_free_pages+0xd8>
    80200f0c:	00001697          	auipc	a3,0x1
    80200f10:	ed468693          	addi	a3,a3,-300 # 80201de0 <etext+0x888>
    80200f14:	00001617          	auipc	a2,0x1
    80200f18:	be460613          	addi	a2,a2,-1052 # 80201af8 <etext+0x5a0>
    80200f1c:	06a00593          	li	a1,106
    80200f20:	00001517          	auipc	a0,0x1
    80200f24:	bf050513          	addi	a0,a0,-1040 # 80201b10 <etext+0x5b8>
    80200f28:	9d0ff0ef          	jal	ra,802000f8 <__panic>
    80200f2c:	00001697          	auipc	a3,0x1
    80200f30:	eac68693          	addi	a3,a3,-340 # 80201dd8 <etext+0x880>
    80200f34:	00001617          	auipc	a2,0x1
    80200f38:	bc460613          	addi	a2,a2,-1084 # 80201af8 <etext+0x5a0>
    80200f3c:	06600593          	li	a1,102
    80200f40:	00001517          	auipc	a0,0x1
    80200f44:	bd050513          	addi	a0,a0,-1072 # 80201b10 <etext+0x5b8>
    80200f48:	9b0ff0ef          	jal	ra,802000f8 <__panic>

0000000080200f4c <best_fit_alloc_pages>:
    80200f4c:	c545                	beqz	a0,80200ff4 <best_fit_alloc_pages+0xa8>
    80200f4e:	00004597          	auipc	a1,0x4
    80200f52:	0fa58593          	addi	a1,a1,250 # 80205048 <free_area>
    80200f56:	0105a883          	lw	a7,16(a1)
    80200f5a:	86aa                	mv	a3,a0
    80200f5c:	02089793          	slli	a5,a7,0x20
    80200f60:	9381                	srli	a5,a5,0x20
    80200f62:	08a7e763          	bltu	a5,a0,80200ff0 <best_fit_alloc_pages+0xa4>
    80200f66:	659c                	ld	a5,8(a1)
    80200f68:	4501                	li	a0,0
    80200f6a:	08b78263          	beq	a5,a1,80200fee <best_fit_alloc_pages+0xa2>
    80200f6e:	6861                	lui	a6,0x18
    80200f70:	6a080813          	addi	a6,a6,1696 # 186a0 <kern_entry-0x801e7960>
    80200f74:	ff87a703          	lw	a4,-8(a5)
    80200f78:	02071613          	slli	a2,a4,0x20
    80200f7c:	9201                	srli	a2,a2,0x20
    80200f7e:	00d66863          	bltu	a2,a3,80200f8e <best_fit_alloc_pages+0x42>
    80200f82:	01077663          	bgeu	a4,a6,80200f8e <best_fit_alloc_pages+0x42>
    80200f86:	fe878513          	addi	a0,a5,-24
    80200f8a:	0007081b          	sext.w	a6,a4
    80200f8e:	679c                	ld	a5,8(a5)
    80200f90:	feb792e3          	bne	a5,a1,80200f74 <best_fit_alloc_pages+0x28>
    80200f94:	cd29                	beqz	a0,80200fee <best_fit_alloc_pages+0xa2>
    80200f96:	711c                	ld	a5,32(a0)
    80200f98:	6d18                	ld	a4,24(a0)
    80200f9a:	4910                	lw	a2,16(a0)
    80200f9c:	0006881b          	sext.w	a6,a3
    80200fa0:	e71c                	sd	a5,8(a4)
    80200fa2:	e398                	sd	a4,0(a5)
    80200fa4:	02061793          	slli	a5,a2,0x20
    80200fa8:	9381                	srli	a5,a5,0x20
    80200faa:	02f6f863          	bgeu	a3,a5,80200fda <best_fit_alloc_pages+0x8e>
    80200fae:	00269793          	slli	a5,a3,0x2
    80200fb2:	97b6                	add	a5,a5,a3
    80200fb4:	078e                	slli	a5,a5,0x3
    80200fb6:	97aa                	add	a5,a5,a0
    80200fb8:	4106063b          	subw	a2,a2,a6
    80200fbc:	cb90                	sw	a2,16(a5)
    80200fbe:	4689                	li	a3,2
    80200fc0:	00878613          	addi	a2,a5,8
    80200fc4:	40d6302f          	amoor.d	zero,a3,(a2)
    80200fc8:	6714                	ld	a3,8(a4)
    80200fca:	01878613          	addi	a2,a5,24
    80200fce:	0105a883          	lw	a7,16(a1)
    80200fd2:	e290                	sd	a2,0(a3)
    80200fd4:	e710                	sd	a2,8(a4)
    80200fd6:	f394                	sd	a3,32(a5)
    80200fd8:	ef98                	sd	a4,24(a5)
    80200fda:	410888bb          	subw	a7,a7,a6
    80200fde:	0115a823          	sw	a7,16(a1)
    80200fe2:	57f5                	li	a5,-3
    80200fe4:	00850713          	addi	a4,a0,8
    80200fe8:	60f7302f          	amoand.d	zero,a5,(a4)
    80200fec:	8082                	ret
    80200fee:	8082                	ret
    80200ff0:	4501                	li	a0,0
    80200ff2:	8082                	ret
    80200ff4:	1141                	addi	sp,sp,-16
    80200ff6:	00001697          	auipc	a3,0x1
    80200ffa:	de268693          	addi	a3,a3,-542 # 80201dd8 <etext+0x880>
    80200ffe:	00001617          	auipc	a2,0x1
    80201002:	afa60613          	addi	a2,a2,-1286 # 80201af8 <etext+0x5a0>
    80201006:	03d00593          	li	a1,61
    8020100a:	00001517          	auipc	a0,0x1
    8020100e:	b0650513          	addi	a0,a0,-1274 # 80201b10 <etext+0x5b8>
    80201012:	e406                	sd	ra,8(sp)
    80201014:	8e4ff0ef          	jal	ra,802000f8 <__panic>

0000000080201018 <best_fit_init_memmap>:
    80201018:	1141                	addi	sp,sp,-16
    8020101a:	e406                	sd	ra,8(sp)
    8020101c:	c5f9                	beqz	a1,802010ea <best_fit_init_memmap+0xd2>
    8020101e:	00259693          	slli	a3,a1,0x2
    80201022:	96ae                	add	a3,a3,a1
    80201024:	068e                	slli	a3,a3,0x3
    80201026:	96aa                	add	a3,a3,a0
    80201028:	87aa                	mv	a5,a0
    8020102a:	00d50f63          	beq	a0,a3,80201048 <best_fit_init_memmap+0x30>
    8020102e:	6798                	ld	a4,8(a5)
    80201030:	8b05                	andi	a4,a4,1
    80201032:	cf49                	beqz	a4,802010cc <best_fit_init_memmap+0xb4>
    80201034:	0007a823          	sw	zero,16(a5)
    80201038:	0007b423          	sd	zero,8(a5)
    8020103c:	0007a023          	sw	zero,0(a5)
    80201040:	02878793          	addi	a5,a5,40
    80201044:	fed795e3          	bne	a5,a3,8020102e <best_fit_init_memmap+0x16>
    80201048:	2581                	sext.w	a1,a1
    8020104a:	c90c                	sw	a1,16(a0)
    8020104c:	4789                	li	a5,2
    8020104e:	00850713          	addi	a4,a0,8
    80201052:	40f7302f          	amoor.d	zero,a5,(a4)
    80201056:	00004697          	auipc	a3,0x4
    8020105a:	ff268693          	addi	a3,a3,-14 # 80205048 <free_area>
    8020105e:	4a98                	lw	a4,16(a3)
    80201060:	669c                	ld	a5,8(a3)
    80201062:	01850613          	addi	a2,a0,24
    80201066:	9db9                	addw	a1,a1,a4
    80201068:	ca8c                	sw	a1,16(a3)
    8020106a:	04d78a63          	beq	a5,a3,802010be <best_fit_init_memmap+0xa6>
    8020106e:	fe878713          	addi	a4,a5,-24
    80201072:	0006b803          	ld	a6,0(a3)
    80201076:	4581                	li	a1,0
    80201078:	00e56a63          	bltu	a0,a4,8020108c <best_fit_init_memmap+0x74>
    8020107c:	6798                	ld	a4,8(a5)
    8020107e:	02d70263          	beq	a4,a3,802010a2 <best_fit_init_memmap+0x8a>
    80201082:	87ba                	mv	a5,a4
    80201084:	fe878713          	addi	a4,a5,-24
    80201088:	fee57ae3          	bgeu	a0,a4,8020107c <best_fit_init_memmap+0x64>
    8020108c:	c199                	beqz	a1,80201092 <best_fit_init_memmap+0x7a>
    8020108e:	0106b023          	sd	a6,0(a3)
    80201092:	6398                	ld	a4,0(a5)
    80201094:	60a2                	ld	ra,8(sp)
    80201096:	e390                	sd	a2,0(a5)
    80201098:	e710                	sd	a2,8(a4)
    8020109a:	f11c                	sd	a5,32(a0)
    8020109c:	ed18                	sd	a4,24(a0)
    8020109e:	0141                	addi	sp,sp,16
    802010a0:	8082                	ret
    802010a2:	e790                	sd	a2,8(a5)
    802010a4:	f114                	sd	a3,32(a0)
    802010a6:	6798                	ld	a4,8(a5)
    802010a8:	ed1c                	sd	a5,24(a0)
    802010aa:	00d70663          	beq	a4,a3,802010b6 <best_fit_init_memmap+0x9e>
    802010ae:	8832                	mv	a6,a2
    802010b0:	4585                	li	a1,1
    802010b2:	87ba                	mv	a5,a4
    802010b4:	bfc1                	j	80201084 <best_fit_init_memmap+0x6c>
    802010b6:	60a2                	ld	ra,8(sp)
    802010b8:	e290                	sd	a2,0(a3)
    802010ba:	0141                	addi	sp,sp,16
    802010bc:	8082                	ret
    802010be:	60a2                	ld	ra,8(sp)
    802010c0:	e390                	sd	a2,0(a5)
    802010c2:	e790                	sd	a2,8(a5)
    802010c4:	f11c                	sd	a5,32(a0)
    802010c6:	ed1c                	sd	a5,24(a0)
    802010c8:	0141                	addi	sp,sp,16
    802010ca:	8082                	ret
    802010cc:	00001697          	auipc	a3,0x1
    802010d0:	d3c68693          	addi	a3,a3,-708 # 80201e08 <etext+0x8b0>
    802010d4:	00001617          	auipc	a2,0x1
    802010d8:	a2460613          	addi	a2,a2,-1500 # 80201af8 <etext+0x5a0>
    802010dc:	45f1                	li	a1,28
    802010de:	00001517          	auipc	a0,0x1
    802010e2:	a3250513          	addi	a0,a0,-1486 # 80201b10 <etext+0x5b8>
    802010e6:	812ff0ef          	jal	ra,802000f8 <__panic>
    802010ea:	00001697          	auipc	a3,0x1
    802010ee:	cee68693          	addi	a3,a3,-786 # 80201dd8 <etext+0x880>
    802010f2:	00001617          	auipc	a2,0x1
    802010f6:	a0660613          	addi	a2,a2,-1530 # 80201af8 <etext+0x5a0>
    802010fa:	45e1                	li	a1,24
    802010fc:	00001517          	auipc	a0,0x1
    80201100:	a1450513          	addi	a0,a0,-1516 # 80201b10 <etext+0x5b8>
    80201104:	ff5fe0ef          	jal	ra,802000f8 <__panic>

0000000080201108 <strnlen>:
    80201108:	872a                	mv	a4,a0
    8020110a:	4501                	li	a0,0
    8020110c:	e589                	bnez	a1,80201116 <strnlen+0xe>
    8020110e:	a811                	j	80201122 <strnlen+0x1a>
    80201110:	0505                	addi	a0,a0,1
    80201112:	00a58763          	beq	a1,a0,80201120 <strnlen+0x18>
    80201116:	00a707b3          	add	a5,a4,a0
    8020111a:	0007c783          	lbu	a5,0(a5)
    8020111e:	fbed                	bnez	a5,80201110 <strnlen+0x8>
    80201120:	8082                	ret
    80201122:	8082                	ret

0000000080201124 <memset>:
    80201124:	ca01                	beqz	a2,80201134 <memset+0x10>
    80201126:	962a                	add	a2,a2,a0
    80201128:	87aa                	mv	a5,a0
    8020112a:	0785                	addi	a5,a5,1
    8020112c:	feb78fa3          	sb	a1,-1(a5)
    80201130:	fec79de3          	bne	a5,a2,8020112a <memset+0x6>
    80201134:	8082                	ret

0000000080201136 <printnum>:
    80201136:	02069813          	slli	a6,a3,0x20
    8020113a:	7179                	addi	sp,sp,-48
    8020113c:	02085813          	srli	a6,a6,0x20
    80201140:	e052                	sd	s4,0(sp)
    80201142:	03067a33          	remu	s4,a2,a6
    80201146:	f022                	sd	s0,32(sp)
    80201148:	ec26                	sd	s1,24(sp)
    8020114a:	e84a                	sd	s2,16(sp)
    8020114c:	f406                	sd	ra,40(sp)
    8020114e:	e44e                	sd	s3,8(sp)
    80201150:	84aa                	mv	s1,a0
    80201152:	892e                	mv	s2,a1
    80201154:	fff7041b          	addiw	s0,a4,-1
    80201158:	2a01                	sext.w	s4,s4
    8020115a:	03067e63          	bgeu	a2,a6,80201196 <printnum+0x60>
    8020115e:	89be                	mv	s3,a5
    80201160:	00805763          	blez	s0,8020116e <printnum+0x38>
    80201164:	347d                	addiw	s0,s0,-1
    80201166:	85ca                	mv	a1,s2
    80201168:	854e                	mv	a0,s3
    8020116a:	9482                	jalr	s1
    8020116c:	fc65                	bnez	s0,80201164 <printnum+0x2e>
    8020116e:	1a02                	slli	s4,s4,0x20
    80201170:	020a5a13          	srli	s4,s4,0x20
    80201174:	00001797          	auipc	a5,0x1
    80201178:	cf478793          	addi	a5,a5,-780 # 80201e68 <best_fit_pmm_manager+0x38>
    8020117c:	7402                	ld	s0,32(sp)
    8020117e:	9a3e                	add	s4,s4,a5
    80201180:	000a4503          	lbu	a0,0(s4)
    80201184:	70a2                	ld	ra,40(sp)
    80201186:	69a2                	ld	s3,8(sp)
    80201188:	6a02                	ld	s4,0(sp)
    8020118a:	85ca                	mv	a1,s2
    8020118c:	8326                	mv	t1,s1
    8020118e:	6942                	ld	s2,16(sp)
    80201190:	64e2                	ld	s1,24(sp)
    80201192:	6145                	addi	sp,sp,48
    80201194:	8302                	jr	t1
    80201196:	03065633          	divu	a2,a2,a6
    8020119a:	8722                	mv	a4,s0
    8020119c:	f9bff0ef          	jal	ra,80201136 <printnum>
    802011a0:	b7f9                	j	8020116e <printnum+0x38>

00000000802011a2 <vprintfmt>:
    802011a2:	7119                	addi	sp,sp,-128
    802011a4:	f4a6                	sd	s1,104(sp)
    802011a6:	f0ca                	sd	s2,96(sp)
    802011a8:	ecce                	sd	s3,88(sp)
    802011aa:	e8d2                	sd	s4,80(sp)
    802011ac:	e4d6                	sd	s5,72(sp)
    802011ae:	e0da                	sd	s6,64(sp)
    802011b0:	fc5e                	sd	s7,56(sp)
    802011b2:	f06a                	sd	s10,32(sp)
    802011b4:	fc86                	sd	ra,120(sp)
    802011b6:	f8a2                	sd	s0,112(sp)
    802011b8:	f862                	sd	s8,48(sp)
    802011ba:	f466                	sd	s9,40(sp)
    802011bc:	ec6e                	sd	s11,24(sp)
    802011be:	892a                	mv	s2,a0
    802011c0:	84ae                	mv	s1,a1
    802011c2:	8d32                	mv	s10,a2
    802011c4:	8a36                	mv	s4,a3
    802011c6:	02500993          	li	s3,37
    802011ca:	5b7d                	li	s6,-1
    802011cc:	00001a97          	auipc	s5,0x1
    802011d0:	cd0a8a93          	addi	s5,s5,-816 # 80201e9c <best_fit_pmm_manager+0x6c>
    802011d4:	00001b97          	auipc	s7,0x1
    802011d8:	ea4b8b93          	addi	s7,s7,-348 # 80202078 <error_string>
    802011dc:	000d4503          	lbu	a0,0(s10)
    802011e0:	001d0413          	addi	s0,s10,1
    802011e4:	01350a63          	beq	a0,s3,802011f8 <vprintfmt+0x56>
    802011e8:	c121                	beqz	a0,80201228 <vprintfmt+0x86>
    802011ea:	85a6                	mv	a1,s1
    802011ec:	0405                	addi	s0,s0,1
    802011ee:	9902                	jalr	s2
    802011f0:	fff44503          	lbu	a0,-1(s0)
    802011f4:	ff351ae3          	bne	a0,s3,802011e8 <vprintfmt+0x46>
    802011f8:	00044603          	lbu	a2,0(s0)
    802011fc:	02000793          	li	a5,32
    80201200:	4c81                	li	s9,0
    80201202:	4881                	li	a7,0
    80201204:	5c7d                	li	s8,-1
    80201206:	5dfd                	li	s11,-1
    80201208:	05500513          	li	a0,85
    8020120c:	4825                	li	a6,9
    8020120e:	fdd6059b          	addiw	a1,a2,-35
    80201212:	0ff5f593          	andi	a1,a1,255
    80201216:	00140d13          	addi	s10,s0,1
    8020121a:	04b56263          	bltu	a0,a1,8020125e <vprintfmt+0xbc>
    8020121e:	058a                	slli	a1,a1,0x2
    80201220:	95d6                	add	a1,a1,s5
    80201222:	4194                	lw	a3,0(a1)
    80201224:	96d6                	add	a3,a3,s5
    80201226:	8682                	jr	a3
    80201228:	70e6                	ld	ra,120(sp)
    8020122a:	7446                	ld	s0,112(sp)
    8020122c:	74a6                	ld	s1,104(sp)
    8020122e:	7906                	ld	s2,96(sp)
    80201230:	69e6                	ld	s3,88(sp)
    80201232:	6a46                	ld	s4,80(sp)
    80201234:	6aa6                	ld	s5,72(sp)
    80201236:	6b06                	ld	s6,64(sp)
    80201238:	7be2                	ld	s7,56(sp)
    8020123a:	7c42                	ld	s8,48(sp)
    8020123c:	7ca2                	ld	s9,40(sp)
    8020123e:	7d02                	ld	s10,32(sp)
    80201240:	6de2                	ld	s11,24(sp)
    80201242:	6109                	addi	sp,sp,128
    80201244:	8082                	ret
    80201246:	87b2                	mv	a5,a2
    80201248:	00144603          	lbu	a2,1(s0)
    8020124c:	846a                	mv	s0,s10
    8020124e:	00140d13          	addi	s10,s0,1
    80201252:	fdd6059b          	addiw	a1,a2,-35
    80201256:	0ff5f593          	andi	a1,a1,255
    8020125a:	fcb572e3          	bgeu	a0,a1,8020121e <vprintfmt+0x7c>
    8020125e:	85a6                	mv	a1,s1
    80201260:	02500513          	li	a0,37
    80201264:	9902                	jalr	s2
    80201266:	fff44783          	lbu	a5,-1(s0)
    8020126a:	8d22                	mv	s10,s0
    8020126c:	f73788e3          	beq	a5,s3,802011dc <vprintfmt+0x3a>
    80201270:	ffed4783          	lbu	a5,-2(s10)
    80201274:	1d7d                	addi	s10,s10,-1
    80201276:	ff379de3          	bne	a5,s3,80201270 <vprintfmt+0xce>
    8020127a:	b78d                	j	802011dc <vprintfmt+0x3a>
    8020127c:	fd060c1b          	addiw	s8,a2,-48
    80201280:	00144603          	lbu	a2,1(s0)
    80201284:	846a                	mv	s0,s10
    80201286:	fd06069b          	addiw	a3,a2,-48
    8020128a:	0006059b          	sext.w	a1,a2
    8020128e:	02d86463          	bltu	a6,a3,802012b6 <vprintfmt+0x114>
    80201292:	00144603          	lbu	a2,1(s0)
    80201296:	002c169b          	slliw	a3,s8,0x2
    8020129a:	0186873b          	addw	a4,a3,s8
    8020129e:	0017171b          	slliw	a4,a4,0x1
    802012a2:	9f2d                	addw	a4,a4,a1
    802012a4:	fd06069b          	addiw	a3,a2,-48
    802012a8:	0405                	addi	s0,s0,1
    802012aa:	fd070c1b          	addiw	s8,a4,-48
    802012ae:	0006059b          	sext.w	a1,a2
    802012b2:	fed870e3          	bgeu	a6,a3,80201292 <vprintfmt+0xf0>
    802012b6:	f40ddce3          	bgez	s11,8020120e <vprintfmt+0x6c>
    802012ba:	8de2                	mv	s11,s8
    802012bc:	5c7d                	li	s8,-1
    802012be:	bf81                	j	8020120e <vprintfmt+0x6c>
    802012c0:	fffdc693          	not	a3,s11
    802012c4:	96fd                	srai	a3,a3,0x3f
    802012c6:	00ddfdb3          	and	s11,s11,a3
    802012ca:	00144603          	lbu	a2,1(s0)
    802012ce:	2d81                	sext.w	s11,s11
    802012d0:	846a                	mv	s0,s10
    802012d2:	bf35                	j	8020120e <vprintfmt+0x6c>
    802012d4:	000a2c03          	lw	s8,0(s4)
    802012d8:	00144603          	lbu	a2,1(s0)
    802012dc:	0a21                	addi	s4,s4,8
    802012de:	846a                	mv	s0,s10
    802012e0:	bfd9                	j	802012b6 <vprintfmt+0x114>
    802012e2:	4705                	li	a4,1
    802012e4:	008a0593          	addi	a1,s4,8
    802012e8:	01174463          	blt	a4,a7,802012f0 <vprintfmt+0x14e>
    802012ec:	1a088e63          	beqz	a7,802014a8 <vprintfmt+0x306>
    802012f0:	000a3603          	ld	a2,0(s4)
    802012f4:	46c1                	li	a3,16
    802012f6:	8a2e                	mv	s4,a1
    802012f8:	2781                	sext.w	a5,a5
    802012fa:	876e                	mv	a4,s11
    802012fc:	85a6                	mv	a1,s1
    802012fe:	854a                	mv	a0,s2
    80201300:	e37ff0ef          	jal	ra,80201136 <printnum>
    80201304:	bde1                	j	802011dc <vprintfmt+0x3a>
    80201306:	000a2503          	lw	a0,0(s4)
    8020130a:	85a6                	mv	a1,s1
    8020130c:	0a21                	addi	s4,s4,8
    8020130e:	9902                	jalr	s2
    80201310:	b5f1                	j	802011dc <vprintfmt+0x3a>
    80201312:	4705                	li	a4,1
    80201314:	008a0593          	addi	a1,s4,8
    80201318:	01174463          	blt	a4,a7,80201320 <vprintfmt+0x17e>
    8020131c:	18088163          	beqz	a7,8020149e <vprintfmt+0x2fc>
    80201320:	000a3603          	ld	a2,0(s4)
    80201324:	46a9                	li	a3,10
    80201326:	8a2e                	mv	s4,a1
    80201328:	bfc1                	j	802012f8 <vprintfmt+0x156>
    8020132a:	00144603          	lbu	a2,1(s0)
    8020132e:	4c85                	li	s9,1
    80201330:	846a                	mv	s0,s10
    80201332:	bdf1                	j	8020120e <vprintfmt+0x6c>
    80201334:	85a6                	mv	a1,s1
    80201336:	02500513          	li	a0,37
    8020133a:	9902                	jalr	s2
    8020133c:	b545                	j	802011dc <vprintfmt+0x3a>
    8020133e:	00144603          	lbu	a2,1(s0)
    80201342:	2885                	addiw	a7,a7,1
    80201344:	846a                	mv	s0,s10
    80201346:	b5e1                	j	8020120e <vprintfmt+0x6c>
    80201348:	4705                	li	a4,1
    8020134a:	008a0593          	addi	a1,s4,8
    8020134e:	01174463          	blt	a4,a7,80201356 <vprintfmt+0x1b4>
    80201352:	14088163          	beqz	a7,80201494 <vprintfmt+0x2f2>
    80201356:	000a3603          	ld	a2,0(s4)
    8020135a:	46a1                	li	a3,8
    8020135c:	8a2e                	mv	s4,a1
    8020135e:	bf69                	j	802012f8 <vprintfmt+0x156>
    80201360:	03000513          	li	a0,48
    80201364:	85a6                	mv	a1,s1
    80201366:	e03e                	sd	a5,0(sp)
    80201368:	9902                	jalr	s2
    8020136a:	85a6                	mv	a1,s1
    8020136c:	07800513          	li	a0,120
    80201370:	9902                	jalr	s2
    80201372:	0a21                	addi	s4,s4,8
    80201374:	6782                	ld	a5,0(sp)
    80201376:	46c1                	li	a3,16
    80201378:	ff8a3603          	ld	a2,-8(s4)
    8020137c:	bfb5                	j	802012f8 <vprintfmt+0x156>
    8020137e:	000a3403          	ld	s0,0(s4)
    80201382:	008a0713          	addi	a4,s4,8
    80201386:	e03a                	sd	a4,0(sp)
    80201388:	14040263          	beqz	s0,802014cc <vprintfmt+0x32a>
    8020138c:	0fb05763          	blez	s11,8020147a <vprintfmt+0x2d8>
    80201390:	02d00693          	li	a3,45
    80201394:	0cd79163          	bne	a5,a3,80201456 <vprintfmt+0x2b4>
    80201398:	00044783          	lbu	a5,0(s0)
    8020139c:	0007851b          	sext.w	a0,a5
    802013a0:	cf85                	beqz	a5,802013d8 <vprintfmt+0x236>
    802013a2:	00140a13          	addi	s4,s0,1
    802013a6:	05e00413          	li	s0,94
    802013aa:	000c4563          	bltz	s8,802013b4 <vprintfmt+0x212>
    802013ae:	3c7d                	addiw	s8,s8,-1
    802013b0:	036c0263          	beq	s8,s6,802013d4 <vprintfmt+0x232>
    802013b4:	85a6                	mv	a1,s1
    802013b6:	0e0c8e63          	beqz	s9,802014b2 <vprintfmt+0x310>
    802013ba:	3781                	addiw	a5,a5,-32
    802013bc:	0ef47b63          	bgeu	s0,a5,802014b2 <vprintfmt+0x310>
    802013c0:	03f00513          	li	a0,63
    802013c4:	9902                	jalr	s2
    802013c6:	000a4783          	lbu	a5,0(s4)
    802013ca:	3dfd                	addiw	s11,s11,-1
    802013cc:	0a05                	addi	s4,s4,1
    802013ce:	0007851b          	sext.w	a0,a5
    802013d2:	ffe1                	bnez	a5,802013aa <vprintfmt+0x208>
    802013d4:	01b05963          	blez	s11,802013e6 <vprintfmt+0x244>
    802013d8:	3dfd                	addiw	s11,s11,-1
    802013da:	85a6                	mv	a1,s1
    802013dc:	02000513          	li	a0,32
    802013e0:	9902                	jalr	s2
    802013e2:	fe0d9be3          	bnez	s11,802013d8 <vprintfmt+0x236>
    802013e6:	6a02                	ld	s4,0(sp)
    802013e8:	bbd5                	j	802011dc <vprintfmt+0x3a>
    802013ea:	4705                	li	a4,1
    802013ec:	008a0c93          	addi	s9,s4,8
    802013f0:	01174463          	blt	a4,a7,802013f8 <vprintfmt+0x256>
    802013f4:	08088d63          	beqz	a7,8020148e <vprintfmt+0x2ec>
    802013f8:	000a3403          	ld	s0,0(s4)
    802013fc:	0a044d63          	bltz	s0,802014b6 <vprintfmt+0x314>
    80201400:	8622                	mv	a2,s0
    80201402:	8a66                	mv	s4,s9
    80201404:	46a9                	li	a3,10
    80201406:	bdcd                	j	802012f8 <vprintfmt+0x156>
    80201408:	000a2783          	lw	a5,0(s4)
    8020140c:	4719                	li	a4,6
    8020140e:	0a21                	addi	s4,s4,8
    80201410:	41f7d69b          	sraiw	a3,a5,0x1f
    80201414:	8fb5                	xor	a5,a5,a3
    80201416:	40d786bb          	subw	a3,a5,a3
    8020141a:	02d74163          	blt	a4,a3,8020143c <vprintfmt+0x29a>
    8020141e:	00369793          	slli	a5,a3,0x3
    80201422:	97de                	add	a5,a5,s7
    80201424:	639c                	ld	a5,0(a5)
    80201426:	cb99                	beqz	a5,8020143c <vprintfmt+0x29a>
    80201428:	86be                	mv	a3,a5
    8020142a:	00001617          	auipc	a2,0x1
    8020142e:	a6e60613          	addi	a2,a2,-1426 # 80201e98 <best_fit_pmm_manager+0x68>
    80201432:	85a6                	mv	a1,s1
    80201434:	854a                	mv	a0,s2
    80201436:	0ce000ef          	jal	ra,80201504 <printfmt>
    8020143a:	b34d                	j	802011dc <vprintfmt+0x3a>
    8020143c:	00001617          	auipc	a2,0x1
    80201440:	a4c60613          	addi	a2,a2,-1460 # 80201e88 <best_fit_pmm_manager+0x58>
    80201444:	85a6                	mv	a1,s1
    80201446:	854a                	mv	a0,s2
    80201448:	0bc000ef          	jal	ra,80201504 <printfmt>
    8020144c:	bb41                	j	802011dc <vprintfmt+0x3a>
    8020144e:	00001417          	auipc	s0,0x1
    80201452:	a3240413          	addi	s0,s0,-1486 # 80201e80 <best_fit_pmm_manager+0x50>
    80201456:	85e2                	mv	a1,s8
    80201458:	8522                	mv	a0,s0
    8020145a:	e43e                	sd	a5,8(sp)
    8020145c:	cadff0ef          	jal	ra,80201108 <strnlen>
    80201460:	40ad8dbb          	subw	s11,s11,a0
    80201464:	01b05b63          	blez	s11,8020147a <vprintfmt+0x2d8>
    80201468:	67a2                	ld	a5,8(sp)
    8020146a:	00078a1b          	sext.w	s4,a5
    8020146e:	3dfd                	addiw	s11,s11,-1
    80201470:	85a6                	mv	a1,s1
    80201472:	8552                	mv	a0,s4
    80201474:	9902                	jalr	s2
    80201476:	fe0d9ce3          	bnez	s11,8020146e <vprintfmt+0x2cc>
    8020147a:	00044783          	lbu	a5,0(s0)
    8020147e:	00140a13          	addi	s4,s0,1
    80201482:	0007851b          	sext.w	a0,a5
    80201486:	d3a5                	beqz	a5,802013e6 <vprintfmt+0x244>
    80201488:	05e00413          	li	s0,94
    8020148c:	bf39                	j	802013aa <vprintfmt+0x208>
    8020148e:	000a2403          	lw	s0,0(s4)
    80201492:	b7ad                	j	802013fc <vprintfmt+0x25a>
    80201494:	000a6603          	lwu	a2,0(s4)
    80201498:	46a1                	li	a3,8
    8020149a:	8a2e                	mv	s4,a1
    8020149c:	bdb1                	j	802012f8 <vprintfmt+0x156>
    8020149e:	000a6603          	lwu	a2,0(s4)
    802014a2:	46a9                	li	a3,10
    802014a4:	8a2e                	mv	s4,a1
    802014a6:	bd89                	j	802012f8 <vprintfmt+0x156>
    802014a8:	000a6603          	lwu	a2,0(s4)
    802014ac:	46c1                	li	a3,16
    802014ae:	8a2e                	mv	s4,a1
    802014b0:	b5a1                	j	802012f8 <vprintfmt+0x156>
    802014b2:	9902                	jalr	s2
    802014b4:	bf09                	j	802013c6 <vprintfmt+0x224>
    802014b6:	85a6                	mv	a1,s1
    802014b8:	02d00513          	li	a0,45
    802014bc:	e03e                	sd	a5,0(sp)
    802014be:	9902                	jalr	s2
    802014c0:	6782                	ld	a5,0(sp)
    802014c2:	8a66                	mv	s4,s9
    802014c4:	40800633          	neg	a2,s0
    802014c8:	46a9                	li	a3,10
    802014ca:	b53d                	j	802012f8 <vprintfmt+0x156>
    802014cc:	03b05163          	blez	s11,802014ee <vprintfmt+0x34c>
    802014d0:	02d00693          	li	a3,45
    802014d4:	f6d79de3          	bne	a5,a3,8020144e <vprintfmt+0x2ac>
    802014d8:	00001417          	auipc	s0,0x1
    802014dc:	9a840413          	addi	s0,s0,-1624 # 80201e80 <best_fit_pmm_manager+0x50>
    802014e0:	02800793          	li	a5,40
    802014e4:	02800513          	li	a0,40
    802014e8:	00140a13          	addi	s4,s0,1
    802014ec:	bd6d                	j	802013a6 <vprintfmt+0x204>
    802014ee:	00001a17          	auipc	s4,0x1
    802014f2:	993a0a13          	addi	s4,s4,-1645 # 80201e81 <best_fit_pmm_manager+0x51>
    802014f6:	02800513          	li	a0,40
    802014fa:	02800793          	li	a5,40
    802014fe:	05e00413          	li	s0,94
    80201502:	b565                	j	802013aa <vprintfmt+0x208>

0000000080201504 <printfmt>:
    80201504:	715d                	addi	sp,sp,-80
    80201506:	02810313          	addi	t1,sp,40
    8020150a:	f436                	sd	a3,40(sp)
    8020150c:	869a                	mv	a3,t1
    8020150e:	ec06                	sd	ra,24(sp)
    80201510:	f83a                	sd	a4,48(sp)
    80201512:	fc3e                	sd	a5,56(sp)
    80201514:	e0c2                	sd	a6,64(sp)
    80201516:	e4c6                	sd	a7,72(sp)
    80201518:	e41a                	sd	t1,8(sp)
    8020151a:	c89ff0ef          	jal	ra,802011a2 <vprintfmt>
    8020151e:	60e2                	ld	ra,24(sp)
    80201520:	6161                	addi	sp,sp,80
    80201522:	8082                	ret

0000000080201524 <sbi_console_putchar>:
    80201524:	4781                	li	a5,0
    80201526:	00004717          	auipc	a4,0x4
    8020152a:	ada73703          	ld	a4,-1318(a4) # 80205000 <SBI_CONSOLE_PUTCHAR>
    8020152e:	88ba                	mv	a7,a4
    80201530:	852a                	mv	a0,a0
    80201532:	85be                	mv	a1,a5
    80201534:	863e                	mv	a2,a5
    80201536:	00000073          	ecall
    8020153a:	87aa                	mv	a5,a0
    8020153c:	8082                	ret

000000008020153e <sbi_set_timer>:
    8020153e:	4781                	li	a5,0
    80201540:	00004717          	auipc	a4,0x4
    80201544:	ad873703          	ld	a4,-1320(a4) # 80205018 <SBI_SET_TIMER>
    80201548:	88ba                	mv	a7,a4
    8020154a:	852a                	mv	a0,a0
    8020154c:	85be                	mv	a1,a5
    8020154e:	863e                	mv	a2,a5
    80201550:	00000073          	ecall
    80201554:	87aa                	mv	a5,a0
    80201556:	8082                	ret
