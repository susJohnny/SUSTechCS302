
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c02082b7          	lui	t0,0xc0208
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c0208137          	lui	sp,0xc0208
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	00009517          	auipc	a0,0x9
ffffffffc0200036:	00e50513          	addi	a0,a0,14 # ffffffffc0209040 <ide>
ffffffffc020003a:	00010617          	auipc	a2,0x10
ffffffffc020003e:	16660613          	addi	a2,a2,358 # ffffffffc02101a0 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	033030ef          	jal	ra,ffffffffc020387c <memset>
ffffffffc020004e:	00004597          	auipc	a1,0x4
ffffffffc0200052:	c4a58593          	addi	a1,a1,-950 # ffffffffc0203c98 <etext+0x4>
ffffffffc0200056:	00004517          	auipc	a0,0x4
ffffffffc020005a:	c5a50513          	addi	a0,a0,-934 # ffffffffc0203cb0 <etext+0x1c>
ffffffffc020005e:	058000ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200062:	2c7020ef          	jal	ra,ffffffffc0202b28 <pmm_init>
ffffffffc0200066:	204000ef          	jal	ra,ffffffffc020026a <idt_init>
ffffffffc020006a:	547000ef          	jal	ra,ffffffffc0200db0 <vmm_init>
ffffffffc020006e:	0dc000ef          	jal	ra,ffffffffc020014a <ide_init>
ffffffffc0200072:	17c000ef          	jal	ra,ffffffffc02001ee <intr_enable>
ffffffffc0200076:	340010ef          	jal	ra,ffffffffc02013b6 <swap_init>
ffffffffc020007a:	a001                	j	ffffffffc020007a <kern_init+0x48>

ffffffffc020007c <cputch>:
ffffffffc020007c:	1141                	addi	sp,sp,-16
ffffffffc020007e:	e022                	sd	s0,0(sp)
ffffffffc0200080:	e406                	sd	ra,8(sp)
ffffffffc0200082:	842e                	mv	s0,a1
ffffffffc0200084:	136000ef          	jal	ra,ffffffffc02001ba <cons_putc>
ffffffffc0200088:	401c                	lw	a5,0(s0)
ffffffffc020008a:	60a2                	ld	ra,8(sp)
ffffffffc020008c:	2785                	addiw	a5,a5,1
ffffffffc020008e:	c01c                	sw	a5,0(s0)
ffffffffc0200090:	6402                	ld	s0,0(sp)
ffffffffc0200092:	0141                	addi	sp,sp,16
ffffffffc0200094:	8082                	ret

ffffffffc0200096 <vcprintf>:
ffffffffc0200096:	1101                	addi	sp,sp,-32
ffffffffc0200098:	862a                	mv	a2,a0
ffffffffc020009a:	86ae                	mv	a3,a1
ffffffffc020009c:	00000517          	auipc	a0,0x0
ffffffffc02000a0:	fe050513          	addi	a0,a0,-32 # ffffffffc020007c <cputch>
ffffffffc02000a4:	006c                	addi	a1,sp,12
ffffffffc02000a6:	ec06                	sd	ra,24(sp)
ffffffffc02000a8:	c602                	sw	zero,12(sp)
ffffffffc02000aa:	069030ef          	jal	ra,ffffffffc0203912 <vprintfmt>
ffffffffc02000ae:	60e2                	ld	ra,24(sp)
ffffffffc02000b0:	4532                	lw	a0,12(sp)
ffffffffc02000b2:	6105                	addi	sp,sp,32
ffffffffc02000b4:	8082                	ret

ffffffffc02000b6 <cprintf>:
ffffffffc02000b6:	711d                	addi	sp,sp,-96
ffffffffc02000b8:	02810313          	addi	t1,sp,40 # ffffffffc0208028 <boot_page_table_sv39+0x28>
ffffffffc02000bc:	8e2a                	mv	t3,a0
ffffffffc02000be:	f42e                	sd	a1,40(sp)
ffffffffc02000c0:	f832                	sd	a2,48(sp)
ffffffffc02000c2:	fc36                	sd	a3,56(sp)
ffffffffc02000c4:	00000517          	auipc	a0,0x0
ffffffffc02000c8:	fb850513          	addi	a0,a0,-72 # ffffffffc020007c <cputch>
ffffffffc02000cc:	004c                	addi	a1,sp,4
ffffffffc02000ce:	869a                	mv	a3,t1
ffffffffc02000d0:	8672                	mv	a2,t3
ffffffffc02000d2:	ec06                	sd	ra,24(sp)
ffffffffc02000d4:	e0ba                	sd	a4,64(sp)
ffffffffc02000d6:	e4be                	sd	a5,72(sp)
ffffffffc02000d8:	e8c2                	sd	a6,80(sp)
ffffffffc02000da:	ecc6                	sd	a7,88(sp)
ffffffffc02000dc:	e41a                	sd	t1,8(sp)
ffffffffc02000de:	c202                	sw	zero,4(sp)
ffffffffc02000e0:	033030ef          	jal	ra,ffffffffc0203912 <vprintfmt>
ffffffffc02000e4:	60e2                	ld	ra,24(sp)
ffffffffc02000e6:	4512                	lw	a0,4(sp)
ffffffffc02000e8:	6125                	addi	sp,sp,96
ffffffffc02000ea:	8082                	ret

ffffffffc02000ec <__panic>:
ffffffffc02000ec:	00010317          	auipc	t1,0x10
ffffffffc02000f0:	f5430313          	addi	t1,t1,-172 # ffffffffc0210040 <is_panic>
ffffffffc02000f4:	00032e03          	lw	t3,0(t1)
ffffffffc02000f8:	715d                	addi	sp,sp,-80
ffffffffc02000fa:	ec06                	sd	ra,24(sp)
ffffffffc02000fc:	e822                	sd	s0,16(sp)
ffffffffc02000fe:	f436                	sd	a3,40(sp)
ffffffffc0200100:	f83a                	sd	a4,48(sp)
ffffffffc0200102:	fc3e                	sd	a5,56(sp)
ffffffffc0200104:	e0c2                	sd	a6,64(sp)
ffffffffc0200106:	e4c6                	sd	a7,72(sp)
ffffffffc0200108:	020e1a63          	bnez	t3,ffffffffc020013c <__panic+0x50>
ffffffffc020010c:	4785                	li	a5,1
ffffffffc020010e:	00f32023          	sw	a5,0(t1)
ffffffffc0200112:	8432                	mv	s0,a2
ffffffffc0200114:	103c                	addi	a5,sp,40
ffffffffc0200116:	862e                	mv	a2,a1
ffffffffc0200118:	85aa                	mv	a1,a0
ffffffffc020011a:	00004517          	auipc	a0,0x4
ffffffffc020011e:	b9e50513          	addi	a0,a0,-1122 # ffffffffc0203cb8 <etext+0x24>
ffffffffc0200122:	e43e                	sd	a5,8(sp)
ffffffffc0200124:	f93ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200128:	65a2                	ld	a1,8(sp)
ffffffffc020012a:	8522                	mv	a0,s0
ffffffffc020012c:	f6bff0ef          	jal	ra,ffffffffc0200096 <vcprintf>
ffffffffc0200130:	00005517          	auipc	a0,0x5
ffffffffc0200134:	31050513          	addi	a0,a0,784 # ffffffffc0205440 <default_pmm_manager+0x400>
ffffffffc0200138:	f7fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020013c:	0b8000ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc0200140:	4501                	li	a0,0
ffffffffc0200142:	006000ef          	jal	ra,ffffffffc0200148 <kmonitor>
ffffffffc0200146:	bfed                	j	ffffffffc0200140 <__panic+0x54>

ffffffffc0200148 <kmonitor>:
ffffffffc0200148:	a001                	j	ffffffffc0200148 <kmonitor>

ffffffffc020014a <ide_init>:
ffffffffc020014a:	8082                	ret

ffffffffc020014c <ide_device_valid>:
ffffffffc020014c:	00253513          	sltiu	a0,a0,2
ffffffffc0200150:	8082                	ret

ffffffffc0200152 <ide_device_size>:
ffffffffc0200152:	03800513          	li	a0,56
ffffffffc0200156:	8082                	ret

ffffffffc0200158 <ide_read_secs>:
ffffffffc0200158:	00009797          	auipc	a5,0x9
ffffffffc020015c:	ee878793          	addi	a5,a5,-280 # ffffffffc0209040 <ide>
ffffffffc0200160:	0095959b          	slliw	a1,a1,0x9
ffffffffc0200164:	1141                	addi	sp,sp,-16
ffffffffc0200166:	8532                	mv	a0,a2
ffffffffc0200168:	95be                	add	a1,a1,a5
ffffffffc020016a:	00969613          	slli	a2,a3,0x9
ffffffffc020016e:	e406                	sd	ra,8(sp)
ffffffffc0200170:	71e030ef          	jal	ra,ffffffffc020388e <memcpy>
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	4501                	li	a0,0
ffffffffc0200178:	0141                	addi	sp,sp,16
ffffffffc020017a:	8082                	ret

ffffffffc020017c <ide_write_secs>:
ffffffffc020017c:	0095979b          	slliw	a5,a1,0x9
ffffffffc0200180:	00009517          	auipc	a0,0x9
ffffffffc0200184:	ec050513          	addi	a0,a0,-320 # ffffffffc0209040 <ide>
ffffffffc0200188:	1141                	addi	sp,sp,-16
ffffffffc020018a:	85b2                	mv	a1,a2
ffffffffc020018c:	953e                	add	a0,a0,a5
ffffffffc020018e:	00969613          	slli	a2,a3,0x9
ffffffffc0200192:	e406                	sd	ra,8(sp)
ffffffffc0200194:	6fa030ef          	jal	ra,ffffffffc020388e <memcpy>
ffffffffc0200198:	60a2                	ld	ra,8(sp)
ffffffffc020019a:	4501                	li	a0,0
ffffffffc020019c:	0141                	addi	sp,sp,16
ffffffffc020019e:	8082                	ret

ffffffffc02001a0 <clock_set_next_event>:
ffffffffc02001a0:	c0102573          	rdtime	a0
ffffffffc02001a4:	00010797          	auipc	a5,0x10
ffffffffc02001a8:	ea47b783          	ld	a5,-348(a5) # ffffffffc0210048 <timebase>
ffffffffc02001ac:	953e                	add	a0,a0,a5
ffffffffc02001ae:	4581                	li	a1,0
ffffffffc02001b0:	4601                	li	a2,0
ffffffffc02001b2:	4881                	li	a7,0
ffffffffc02001b4:	00000073          	ecall
ffffffffc02001b8:	8082                	ret

ffffffffc02001ba <cons_putc>:
ffffffffc02001ba:	100027f3          	csrr	a5,sstatus
ffffffffc02001be:	8b89                	andi	a5,a5,2
ffffffffc02001c0:	0ff57513          	andi	a0,a0,255
ffffffffc02001c4:	e799                	bnez	a5,ffffffffc02001d2 <cons_putc+0x18>
ffffffffc02001c6:	4581                	li	a1,0
ffffffffc02001c8:	4601                	li	a2,0
ffffffffc02001ca:	4885                	li	a7,1
ffffffffc02001cc:	00000073          	ecall
ffffffffc02001d0:	8082                	ret
ffffffffc02001d2:	1101                	addi	sp,sp,-32
ffffffffc02001d4:	ec06                	sd	ra,24(sp)
ffffffffc02001d6:	e42a                	sd	a0,8(sp)
ffffffffc02001d8:	01c000ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc02001dc:	6522                	ld	a0,8(sp)
ffffffffc02001de:	4581                	li	a1,0
ffffffffc02001e0:	4601                	li	a2,0
ffffffffc02001e2:	4885                	li	a7,1
ffffffffc02001e4:	00000073          	ecall
ffffffffc02001e8:	60e2                	ld	ra,24(sp)
ffffffffc02001ea:	6105                	addi	sp,sp,32
ffffffffc02001ec:	a009                	j	ffffffffc02001ee <intr_enable>

ffffffffc02001ee <intr_enable>:
ffffffffc02001ee:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <intr_disable>:
ffffffffc02001f4:	100177f3          	csrrci	a5,sstatus,2
ffffffffc02001f8:	8082                	ret

ffffffffc02001fa <pgfault_handler>:
ffffffffc02001fa:	10053783          	ld	a5,256(a0)
ffffffffc02001fe:	1141                	addi	sp,sp,-16
ffffffffc0200200:	e022                	sd	s0,0(sp)
ffffffffc0200202:	e406                	sd	ra,8(sp)
ffffffffc0200204:	1007f793          	andi	a5,a5,256
ffffffffc0200208:	11053583          	ld	a1,272(a0)
ffffffffc020020c:	842a                	mv	s0,a0
ffffffffc020020e:	05500613          	li	a2,85
ffffffffc0200212:	c399                	beqz	a5,ffffffffc0200218 <pgfault_handler+0x1e>
ffffffffc0200214:	04b00613          	li	a2,75
ffffffffc0200218:	11843703          	ld	a4,280(s0)
ffffffffc020021c:	47bd                	li	a5,15
ffffffffc020021e:	05700693          	li	a3,87
ffffffffc0200222:	00f70463          	beq	a4,a5,ffffffffc020022a <pgfault_handler+0x30>
ffffffffc0200226:	05200693          	li	a3,82
ffffffffc020022a:	00004517          	auipc	a0,0x4
ffffffffc020022e:	aae50513          	addi	a0,a0,-1362 # ffffffffc0203cd8 <etext+0x44>
ffffffffc0200232:	e85ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200236:	00010517          	auipc	a0,0x10
ffffffffc020023a:	e6253503          	ld	a0,-414(a0) # ffffffffc0210098 <check_mm_struct>
ffffffffc020023e:	c911                	beqz	a0,ffffffffc0200252 <pgfault_handler+0x58>
ffffffffc0200240:	11043603          	ld	a2,272(s0)
ffffffffc0200244:	11843583          	ld	a1,280(s0)
ffffffffc0200248:	6402                	ld	s0,0(sp)
ffffffffc020024a:	60a2                	ld	ra,8(sp)
ffffffffc020024c:	0141                	addi	sp,sp,16
ffffffffc020024e:	09a0106f          	j	ffffffffc02012e8 <do_pgfault>
ffffffffc0200252:	00004617          	auipc	a2,0x4
ffffffffc0200256:	aa660613          	addi	a2,a2,-1370 # ffffffffc0203cf8 <etext+0x64>
ffffffffc020025a:	06300593          	li	a1,99
ffffffffc020025e:	00004517          	auipc	a0,0x4
ffffffffc0200262:	ab250513          	addi	a0,a0,-1358 # ffffffffc0203d10 <etext+0x7c>
ffffffffc0200266:	e87ff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc020026a <idt_init>:
ffffffffc020026a:	14005073          	csrwi	sscratch,0
ffffffffc020026e:	00000797          	auipc	a5,0x0
ffffffffc0200272:	47278793          	addi	a5,a5,1138 # ffffffffc02006e0 <__alltraps>
ffffffffc0200276:	10579073          	csrw	stvec,a5
ffffffffc020027a:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc020027e:	000407b7          	lui	a5,0x40
ffffffffc0200282:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200286:	8082                	ret

ffffffffc0200288 <print_regs>:
ffffffffc0200288:	610c                	ld	a1,0(a0)
ffffffffc020028a:	1141                	addi	sp,sp,-16
ffffffffc020028c:	e022                	sd	s0,0(sp)
ffffffffc020028e:	842a                	mv	s0,a0
ffffffffc0200290:	00004517          	auipc	a0,0x4
ffffffffc0200294:	a9850513          	addi	a0,a0,-1384 # ffffffffc0203d28 <etext+0x94>
ffffffffc0200298:	e406                	sd	ra,8(sp)
ffffffffc020029a:	e1dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020029e:	640c                	ld	a1,8(s0)
ffffffffc02002a0:	00004517          	auipc	a0,0x4
ffffffffc02002a4:	aa050513          	addi	a0,a0,-1376 # ffffffffc0203d40 <etext+0xac>
ffffffffc02002a8:	e0fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002ac:	680c                	ld	a1,16(s0)
ffffffffc02002ae:	00004517          	auipc	a0,0x4
ffffffffc02002b2:	aaa50513          	addi	a0,a0,-1366 # ffffffffc0203d58 <etext+0xc4>
ffffffffc02002b6:	e01ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002ba:	6c0c                	ld	a1,24(s0)
ffffffffc02002bc:	00004517          	auipc	a0,0x4
ffffffffc02002c0:	ab450513          	addi	a0,a0,-1356 # ffffffffc0203d70 <etext+0xdc>
ffffffffc02002c4:	df3ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002c8:	700c                	ld	a1,32(s0)
ffffffffc02002ca:	00004517          	auipc	a0,0x4
ffffffffc02002ce:	abe50513          	addi	a0,a0,-1346 # ffffffffc0203d88 <etext+0xf4>
ffffffffc02002d2:	de5ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002d6:	740c                	ld	a1,40(s0)
ffffffffc02002d8:	00004517          	auipc	a0,0x4
ffffffffc02002dc:	ac850513          	addi	a0,a0,-1336 # ffffffffc0203da0 <etext+0x10c>
ffffffffc02002e0:	dd7ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002e4:	780c                	ld	a1,48(s0)
ffffffffc02002e6:	00004517          	auipc	a0,0x4
ffffffffc02002ea:	ad250513          	addi	a0,a0,-1326 # ffffffffc0203db8 <etext+0x124>
ffffffffc02002ee:	dc9ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002f2:	7c0c                	ld	a1,56(s0)
ffffffffc02002f4:	00004517          	auipc	a0,0x4
ffffffffc02002f8:	adc50513          	addi	a0,a0,-1316 # ffffffffc0203dd0 <etext+0x13c>
ffffffffc02002fc:	dbbff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200300:	602c                	ld	a1,64(s0)
ffffffffc0200302:	00004517          	auipc	a0,0x4
ffffffffc0200306:	ae650513          	addi	a0,a0,-1306 # ffffffffc0203de8 <etext+0x154>
ffffffffc020030a:	dadff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020030e:	642c                	ld	a1,72(s0)
ffffffffc0200310:	00004517          	auipc	a0,0x4
ffffffffc0200314:	af050513          	addi	a0,a0,-1296 # ffffffffc0203e00 <etext+0x16c>
ffffffffc0200318:	d9fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020031c:	682c                	ld	a1,80(s0)
ffffffffc020031e:	00004517          	auipc	a0,0x4
ffffffffc0200322:	afa50513          	addi	a0,a0,-1286 # ffffffffc0203e18 <etext+0x184>
ffffffffc0200326:	d91ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020032a:	6c2c                	ld	a1,88(s0)
ffffffffc020032c:	00004517          	auipc	a0,0x4
ffffffffc0200330:	b0450513          	addi	a0,a0,-1276 # ffffffffc0203e30 <etext+0x19c>
ffffffffc0200334:	d83ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200338:	702c                	ld	a1,96(s0)
ffffffffc020033a:	00004517          	auipc	a0,0x4
ffffffffc020033e:	b0e50513          	addi	a0,a0,-1266 # ffffffffc0203e48 <etext+0x1b4>
ffffffffc0200342:	d75ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200346:	742c                	ld	a1,104(s0)
ffffffffc0200348:	00004517          	auipc	a0,0x4
ffffffffc020034c:	b1850513          	addi	a0,a0,-1256 # ffffffffc0203e60 <etext+0x1cc>
ffffffffc0200350:	d67ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200354:	782c                	ld	a1,112(s0)
ffffffffc0200356:	00004517          	auipc	a0,0x4
ffffffffc020035a:	b2250513          	addi	a0,a0,-1246 # ffffffffc0203e78 <etext+0x1e4>
ffffffffc020035e:	d59ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200362:	7c2c                	ld	a1,120(s0)
ffffffffc0200364:	00004517          	auipc	a0,0x4
ffffffffc0200368:	b2c50513          	addi	a0,a0,-1236 # ffffffffc0203e90 <etext+0x1fc>
ffffffffc020036c:	d4bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200370:	604c                	ld	a1,128(s0)
ffffffffc0200372:	00004517          	auipc	a0,0x4
ffffffffc0200376:	b3650513          	addi	a0,a0,-1226 # ffffffffc0203ea8 <etext+0x214>
ffffffffc020037a:	d3dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020037e:	644c                	ld	a1,136(s0)
ffffffffc0200380:	00004517          	auipc	a0,0x4
ffffffffc0200384:	b4050513          	addi	a0,a0,-1216 # ffffffffc0203ec0 <etext+0x22c>
ffffffffc0200388:	d2fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020038c:	684c                	ld	a1,144(s0)
ffffffffc020038e:	00004517          	auipc	a0,0x4
ffffffffc0200392:	b4a50513          	addi	a0,a0,-1206 # ffffffffc0203ed8 <etext+0x244>
ffffffffc0200396:	d21ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020039a:	6c4c                	ld	a1,152(s0)
ffffffffc020039c:	00004517          	auipc	a0,0x4
ffffffffc02003a0:	b5450513          	addi	a0,a0,-1196 # ffffffffc0203ef0 <etext+0x25c>
ffffffffc02003a4:	d13ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003a8:	704c                	ld	a1,160(s0)
ffffffffc02003aa:	00004517          	auipc	a0,0x4
ffffffffc02003ae:	b5e50513          	addi	a0,a0,-1186 # ffffffffc0203f08 <etext+0x274>
ffffffffc02003b2:	d05ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003b6:	744c                	ld	a1,168(s0)
ffffffffc02003b8:	00004517          	auipc	a0,0x4
ffffffffc02003bc:	b6850513          	addi	a0,a0,-1176 # ffffffffc0203f20 <etext+0x28c>
ffffffffc02003c0:	cf7ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003c4:	784c                	ld	a1,176(s0)
ffffffffc02003c6:	00004517          	auipc	a0,0x4
ffffffffc02003ca:	b7250513          	addi	a0,a0,-1166 # ffffffffc0203f38 <etext+0x2a4>
ffffffffc02003ce:	ce9ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003d2:	7c4c                	ld	a1,184(s0)
ffffffffc02003d4:	00004517          	auipc	a0,0x4
ffffffffc02003d8:	b7c50513          	addi	a0,a0,-1156 # ffffffffc0203f50 <etext+0x2bc>
ffffffffc02003dc:	cdbff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003e0:	606c                	ld	a1,192(s0)
ffffffffc02003e2:	00004517          	auipc	a0,0x4
ffffffffc02003e6:	b8650513          	addi	a0,a0,-1146 # ffffffffc0203f68 <etext+0x2d4>
ffffffffc02003ea:	ccdff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003ee:	646c                	ld	a1,200(s0)
ffffffffc02003f0:	00004517          	auipc	a0,0x4
ffffffffc02003f4:	b9050513          	addi	a0,a0,-1136 # ffffffffc0203f80 <etext+0x2ec>
ffffffffc02003f8:	cbfff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003fc:	686c                	ld	a1,208(s0)
ffffffffc02003fe:	00004517          	auipc	a0,0x4
ffffffffc0200402:	b9a50513          	addi	a0,a0,-1126 # ffffffffc0203f98 <etext+0x304>
ffffffffc0200406:	cb1ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020040a:	6c6c                	ld	a1,216(s0)
ffffffffc020040c:	00004517          	auipc	a0,0x4
ffffffffc0200410:	ba450513          	addi	a0,a0,-1116 # ffffffffc0203fb0 <etext+0x31c>
ffffffffc0200414:	ca3ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200418:	706c                	ld	a1,224(s0)
ffffffffc020041a:	00004517          	auipc	a0,0x4
ffffffffc020041e:	bae50513          	addi	a0,a0,-1106 # ffffffffc0203fc8 <etext+0x334>
ffffffffc0200422:	c95ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200426:	746c                	ld	a1,232(s0)
ffffffffc0200428:	00004517          	auipc	a0,0x4
ffffffffc020042c:	bb850513          	addi	a0,a0,-1096 # ffffffffc0203fe0 <etext+0x34c>
ffffffffc0200430:	c87ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200434:	786c                	ld	a1,240(s0)
ffffffffc0200436:	00004517          	auipc	a0,0x4
ffffffffc020043a:	bc250513          	addi	a0,a0,-1086 # ffffffffc0203ff8 <etext+0x364>
ffffffffc020043e:	c79ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200442:	7c6c                	ld	a1,248(s0)
ffffffffc0200444:	6402                	ld	s0,0(sp)
ffffffffc0200446:	60a2                	ld	ra,8(sp)
ffffffffc0200448:	00004517          	auipc	a0,0x4
ffffffffc020044c:	bc850513          	addi	a0,a0,-1080 # ffffffffc0204010 <etext+0x37c>
ffffffffc0200450:	0141                	addi	sp,sp,16
ffffffffc0200452:	b195                	j	ffffffffc02000b6 <cprintf>

ffffffffc0200454 <print_trapframe>:
ffffffffc0200454:	1141                	addi	sp,sp,-16
ffffffffc0200456:	e022                	sd	s0,0(sp)
ffffffffc0200458:	85aa                	mv	a1,a0
ffffffffc020045a:	842a                	mv	s0,a0
ffffffffc020045c:	00004517          	auipc	a0,0x4
ffffffffc0200460:	bcc50513          	addi	a0,a0,-1076 # ffffffffc0204028 <etext+0x394>
ffffffffc0200464:	e406                	sd	ra,8(sp)
ffffffffc0200466:	c51ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020046a:	8522                	mv	a0,s0
ffffffffc020046c:	e1dff0ef          	jal	ra,ffffffffc0200288 <print_regs>
ffffffffc0200470:	10043583          	ld	a1,256(s0)
ffffffffc0200474:	00004517          	auipc	a0,0x4
ffffffffc0200478:	bcc50513          	addi	a0,a0,-1076 # ffffffffc0204040 <etext+0x3ac>
ffffffffc020047c:	c3bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200480:	10843583          	ld	a1,264(s0)
ffffffffc0200484:	00004517          	auipc	a0,0x4
ffffffffc0200488:	bd450513          	addi	a0,a0,-1068 # ffffffffc0204058 <etext+0x3c4>
ffffffffc020048c:	c2bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200490:	11043583          	ld	a1,272(s0)
ffffffffc0200494:	00004517          	auipc	a0,0x4
ffffffffc0200498:	bdc50513          	addi	a0,a0,-1060 # ffffffffc0204070 <etext+0x3dc>
ffffffffc020049c:	c1bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004a0:	11843583          	ld	a1,280(s0)
ffffffffc02004a4:	6402                	ld	s0,0(sp)
ffffffffc02004a6:	60a2                	ld	ra,8(sp)
ffffffffc02004a8:	00004517          	auipc	a0,0x4
ffffffffc02004ac:	be050513          	addi	a0,a0,-1056 # ffffffffc0204088 <etext+0x3f4>
ffffffffc02004b0:	0141                	addi	sp,sp,16
ffffffffc02004b2:	b111                	j	ffffffffc02000b6 <cprintf>

ffffffffc02004b4 <interrupt_handler>:
ffffffffc02004b4:	11853783          	ld	a5,280(a0)
ffffffffc02004b8:	472d                	li	a4,11
ffffffffc02004ba:	0786                	slli	a5,a5,0x1
ffffffffc02004bc:	8385                	srli	a5,a5,0x1
ffffffffc02004be:	06f76763          	bltu	a4,a5,ffffffffc020052c <interrupt_handler+0x78>
ffffffffc02004c2:	00004717          	auipc	a4,0x4
ffffffffc02004c6:	c8e70713          	addi	a4,a4,-882 # ffffffffc0204150 <etext+0x4bc>
ffffffffc02004ca:	078a                	slli	a5,a5,0x2
ffffffffc02004cc:	97ba                	add	a5,a5,a4
ffffffffc02004ce:	439c                	lw	a5,0(a5)
ffffffffc02004d0:	97ba                	add	a5,a5,a4
ffffffffc02004d2:	8782                	jr	a5
ffffffffc02004d4:	00004517          	auipc	a0,0x4
ffffffffc02004d8:	c2c50513          	addi	a0,a0,-980 # ffffffffc0204100 <etext+0x46c>
ffffffffc02004dc:	bee9                	j	ffffffffc02000b6 <cprintf>
ffffffffc02004de:	00004517          	auipc	a0,0x4
ffffffffc02004e2:	c0250513          	addi	a0,a0,-1022 # ffffffffc02040e0 <etext+0x44c>
ffffffffc02004e6:	bec1                	j	ffffffffc02000b6 <cprintf>
ffffffffc02004e8:	00004517          	auipc	a0,0x4
ffffffffc02004ec:	bb850513          	addi	a0,a0,-1096 # ffffffffc02040a0 <etext+0x40c>
ffffffffc02004f0:	b6d9                	j	ffffffffc02000b6 <cprintf>
ffffffffc02004f2:	00004517          	auipc	a0,0x4
ffffffffc02004f6:	bce50513          	addi	a0,a0,-1074 # ffffffffc02040c0 <etext+0x42c>
ffffffffc02004fa:	be75                	j	ffffffffc02000b6 <cprintf>
ffffffffc02004fc:	1141                	addi	sp,sp,-16
ffffffffc02004fe:	e406                	sd	ra,8(sp)
ffffffffc0200500:	ca1ff0ef          	jal	ra,ffffffffc02001a0 <clock_set_next_event>
ffffffffc0200504:	00010697          	auipc	a3,0x10
ffffffffc0200508:	b7468693          	addi	a3,a3,-1164 # ffffffffc0210078 <ticks>
ffffffffc020050c:	629c                	ld	a5,0(a3)
ffffffffc020050e:	06400713          	li	a4,100
ffffffffc0200512:	0785                	addi	a5,a5,1
ffffffffc0200514:	02e7f733          	remu	a4,a5,a4
ffffffffc0200518:	e29c                	sd	a5,0(a3)
ffffffffc020051a:	cb11                	beqz	a4,ffffffffc020052e <interrupt_handler+0x7a>
ffffffffc020051c:	60a2                	ld	ra,8(sp)
ffffffffc020051e:	0141                	addi	sp,sp,16
ffffffffc0200520:	8082                	ret
ffffffffc0200522:	00004517          	auipc	a0,0x4
ffffffffc0200526:	c0e50513          	addi	a0,a0,-1010 # ffffffffc0204130 <etext+0x49c>
ffffffffc020052a:	b671                	j	ffffffffc02000b6 <cprintf>
ffffffffc020052c:	b725                	j	ffffffffc0200454 <print_trapframe>
ffffffffc020052e:	60a2                	ld	ra,8(sp)
ffffffffc0200530:	06400593          	li	a1,100
ffffffffc0200534:	00004517          	auipc	a0,0x4
ffffffffc0200538:	bec50513          	addi	a0,a0,-1044 # ffffffffc0204120 <etext+0x48c>
ffffffffc020053c:	0141                	addi	sp,sp,16
ffffffffc020053e:	bea5                	j	ffffffffc02000b6 <cprintf>

ffffffffc0200540 <exception_handler>:
ffffffffc0200540:	11853783          	ld	a5,280(a0)
ffffffffc0200544:	1101                	addi	sp,sp,-32
ffffffffc0200546:	e822                	sd	s0,16(sp)
ffffffffc0200548:	ec06                	sd	ra,24(sp)
ffffffffc020054a:	e426                	sd	s1,8(sp)
ffffffffc020054c:	473d                	li	a4,15
ffffffffc020054e:	842a                	mv	s0,a0
ffffffffc0200550:	14f76963          	bltu	a4,a5,ffffffffc02006a2 <exception_handler+0x162>
ffffffffc0200554:	00004717          	auipc	a4,0x4
ffffffffc0200558:	de470713          	addi	a4,a4,-540 # ffffffffc0204338 <etext+0x6a4>
ffffffffc020055c:	078a                	slli	a5,a5,0x2
ffffffffc020055e:	97ba                	add	a5,a5,a4
ffffffffc0200560:	439c                	lw	a5,0(a5)
ffffffffc0200562:	97ba                	add	a5,a5,a4
ffffffffc0200564:	8782                	jr	a5
ffffffffc0200566:	00004517          	auipc	a0,0x4
ffffffffc020056a:	dba50513          	addi	a0,a0,-582 # ffffffffc0204320 <etext+0x68c>
ffffffffc020056e:	b49ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200572:	8522                	mv	a0,s0
ffffffffc0200574:	c87ff0ef          	jal	ra,ffffffffc02001fa <pgfault_handler>
ffffffffc0200578:	84aa                	mv	s1,a0
ffffffffc020057a:	12051a63          	bnez	a0,ffffffffc02006ae <exception_handler+0x16e>
ffffffffc020057e:	60e2                	ld	ra,24(sp)
ffffffffc0200580:	6442                	ld	s0,16(sp)
ffffffffc0200582:	64a2                	ld	s1,8(sp)
ffffffffc0200584:	6105                	addi	sp,sp,32
ffffffffc0200586:	8082                	ret
ffffffffc0200588:	00004517          	auipc	a0,0x4
ffffffffc020058c:	bf850513          	addi	a0,a0,-1032 # ffffffffc0204180 <etext+0x4ec>
ffffffffc0200590:	6442                	ld	s0,16(sp)
ffffffffc0200592:	60e2                	ld	ra,24(sp)
ffffffffc0200594:	64a2                	ld	s1,8(sp)
ffffffffc0200596:	6105                	addi	sp,sp,32
ffffffffc0200598:	be39                	j	ffffffffc02000b6 <cprintf>
ffffffffc020059a:	00004517          	auipc	a0,0x4
ffffffffc020059e:	c0650513          	addi	a0,a0,-1018 # ffffffffc02041a0 <etext+0x50c>
ffffffffc02005a2:	b7fd                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc02005a4:	00004517          	auipc	a0,0x4
ffffffffc02005a8:	c1c50513          	addi	a0,a0,-996 # ffffffffc02041c0 <etext+0x52c>
ffffffffc02005ac:	b7d5                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc02005ae:	00004517          	auipc	a0,0x4
ffffffffc02005b2:	c2a50513          	addi	a0,a0,-982 # ffffffffc02041d8 <etext+0x544>
ffffffffc02005b6:	bfe9                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc02005b8:	00004517          	auipc	a0,0x4
ffffffffc02005bc:	c3050513          	addi	a0,a0,-976 # ffffffffc02041e8 <etext+0x554>
ffffffffc02005c0:	bfc1                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc02005c2:	00004517          	auipc	a0,0x4
ffffffffc02005c6:	c4650513          	addi	a0,a0,-954 # ffffffffc0204208 <etext+0x574>
ffffffffc02005ca:	aedff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005ce:	8522                	mv	a0,s0
ffffffffc02005d0:	c2bff0ef          	jal	ra,ffffffffc02001fa <pgfault_handler>
ffffffffc02005d4:	84aa                	mv	s1,a0
ffffffffc02005d6:	d545                	beqz	a0,ffffffffc020057e <exception_handler+0x3e>
ffffffffc02005d8:	8522                	mv	a0,s0
ffffffffc02005da:	e7bff0ef          	jal	ra,ffffffffc0200454 <print_trapframe>
ffffffffc02005de:	86a6                	mv	a3,s1
ffffffffc02005e0:	00004617          	auipc	a2,0x4
ffffffffc02005e4:	c4060613          	addi	a2,a2,-960 # ffffffffc0204220 <etext+0x58c>
ffffffffc02005e8:	0af00593          	li	a1,175
ffffffffc02005ec:	00003517          	auipc	a0,0x3
ffffffffc02005f0:	72450513          	addi	a0,a0,1828 # ffffffffc0203d10 <etext+0x7c>
ffffffffc02005f4:	af9ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02005f8:	00004517          	auipc	a0,0x4
ffffffffc02005fc:	c4850513          	addi	a0,a0,-952 # ffffffffc0204240 <etext+0x5ac>
ffffffffc0200600:	bf41                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc0200602:	00004517          	auipc	a0,0x4
ffffffffc0200606:	c5650513          	addi	a0,a0,-938 # ffffffffc0204258 <etext+0x5c4>
ffffffffc020060a:	aadff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020060e:	8522                	mv	a0,s0
ffffffffc0200610:	bebff0ef          	jal	ra,ffffffffc02001fa <pgfault_handler>
ffffffffc0200614:	84aa                	mv	s1,a0
ffffffffc0200616:	d525                	beqz	a0,ffffffffc020057e <exception_handler+0x3e>
ffffffffc0200618:	8522                	mv	a0,s0
ffffffffc020061a:	e3bff0ef          	jal	ra,ffffffffc0200454 <print_trapframe>
ffffffffc020061e:	86a6                	mv	a3,s1
ffffffffc0200620:	00004617          	auipc	a2,0x4
ffffffffc0200624:	c0060613          	addi	a2,a2,-1024 # ffffffffc0204220 <etext+0x58c>
ffffffffc0200628:	0b900593          	li	a1,185
ffffffffc020062c:	00003517          	auipc	a0,0x3
ffffffffc0200630:	6e450513          	addi	a0,a0,1764 # ffffffffc0203d10 <etext+0x7c>
ffffffffc0200634:	ab9ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200638:	00004517          	auipc	a0,0x4
ffffffffc020063c:	c3850513          	addi	a0,a0,-968 # ffffffffc0204270 <etext+0x5dc>
ffffffffc0200640:	bf81                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc0200642:	00004517          	auipc	a0,0x4
ffffffffc0200646:	c4e50513          	addi	a0,a0,-946 # ffffffffc0204290 <etext+0x5fc>
ffffffffc020064a:	b799                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc020064c:	00004517          	auipc	a0,0x4
ffffffffc0200650:	c6450513          	addi	a0,a0,-924 # ffffffffc02042b0 <etext+0x61c>
ffffffffc0200654:	bf35                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc0200656:	00004517          	auipc	a0,0x4
ffffffffc020065a:	c7a50513          	addi	a0,a0,-902 # ffffffffc02042d0 <etext+0x63c>
ffffffffc020065e:	bf0d                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc0200660:	00004517          	auipc	a0,0x4
ffffffffc0200664:	c9050513          	addi	a0,a0,-880 # ffffffffc02042f0 <etext+0x65c>
ffffffffc0200668:	b725                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc020066a:	00004517          	auipc	a0,0x4
ffffffffc020066e:	c9e50513          	addi	a0,a0,-866 # ffffffffc0204308 <etext+0x674>
ffffffffc0200672:	a45ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200676:	8522                	mv	a0,s0
ffffffffc0200678:	b83ff0ef          	jal	ra,ffffffffc02001fa <pgfault_handler>
ffffffffc020067c:	84aa                	mv	s1,a0
ffffffffc020067e:	f00500e3          	beqz	a0,ffffffffc020057e <exception_handler+0x3e>
ffffffffc0200682:	8522                	mv	a0,s0
ffffffffc0200684:	dd1ff0ef          	jal	ra,ffffffffc0200454 <print_trapframe>
ffffffffc0200688:	86a6                	mv	a3,s1
ffffffffc020068a:	00004617          	auipc	a2,0x4
ffffffffc020068e:	b9660613          	addi	a2,a2,-1130 # ffffffffc0204220 <etext+0x58c>
ffffffffc0200692:	0cf00593          	li	a1,207
ffffffffc0200696:	00003517          	auipc	a0,0x3
ffffffffc020069a:	67a50513          	addi	a0,a0,1658 # ffffffffc0203d10 <etext+0x7c>
ffffffffc020069e:	a4fff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02006a2:	8522                	mv	a0,s0
ffffffffc02006a4:	6442                	ld	s0,16(sp)
ffffffffc02006a6:	60e2                	ld	ra,24(sp)
ffffffffc02006a8:	64a2                	ld	s1,8(sp)
ffffffffc02006aa:	6105                	addi	sp,sp,32
ffffffffc02006ac:	b365                	j	ffffffffc0200454 <print_trapframe>
ffffffffc02006ae:	8522                	mv	a0,s0
ffffffffc02006b0:	da5ff0ef          	jal	ra,ffffffffc0200454 <print_trapframe>
ffffffffc02006b4:	86a6                	mv	a3,s1
ffffffffc02006b6:	00004617          	auipc	a2,0x4
ffffffffc02006ba:	b6a60613          	addi	a2,a2,-1174 # ffffffffc0204220 <etext+0x58c>
ffffffffc02006be:	0d600593          	li	a1,214
ffffffffc02006c2:	00003517          	auipc	a0,0x3
ffffffffc02006c6:	64e50513          	addi	a0,a0,1614 # ffffffffc0203d10 <etext+0x7c>
ffffffffc02006ca:	a23ff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02006ce <trap>:
ffffffffc02006ce:	11853783          	ld	a5,280(a0)
ffffffffc02006d2:	0007c363          	bltz	a5,ffffffffc02006d8 <trap+0xa>
ffffffffc02006d6:	b5ad                	j	ffffffffc0200540 <exception_handler>
ffffffffc02006d8:	bbf1                	j	ffffffffc02004b4 <interrupt_handler>
ffffffffc02006da:	0000                	unimp
ffffffffc02006dc:	0000                	unimp
	...

ffffffffc02006e0 <__alltraps>:
ffffffffc02006e0:	14011073          	csrw	sscratch,sp
ffffffffc02006e4:	712d                	addi	sp,sp,-288
ffffffffc02006e6:	e406                	sd	ra,8(sp)
ffffffffc02006e8:	ec0e                	sd	gp,24(sp)
ffffffffc02006ea:	f012                	sd	tp,32(sp)
ffffffffc02006ec:	f416                	sd	t0,40(sp)
ffffffffc02006ee:	f81a                	sd	t1,48(sp)
ffffffffc02006f0:	fc1e                	sd	t2,56(sp)
ffffffffc02006f2:	e0a2                	sd	s0,64(sp)
ffffffffc02006f4:	e4a6                	sd	s1,72(sp)
ffffffffc02006f6:	e8aa                	sd	a0,80(sp)
ffffffffc02006f8:	ecae                	sd	a1,88(sp)
ffffffffc02006fa:	f0b2                	sd	a2,96(sp)
ffffffffc02006fc:	f4b6                	sd	a3,104(sp)
ffffffffc02006fe:	f8ba                	sd	a4,112(sp)
ffffffffc0200700:	fcbe                	sd	a5,120(sp)
ffffffffc0200702:	e142                	sd	a6,128(sp)
ffffffffc0200704:	e546                	sd	a7,136(sp)
ffffffffc0200706:	e94a                	sd	s2,144(sp)
ffffffffc0200708:	ed4e                	sd	s3,152(sp)
ffffffffc020070a:	f152                	sd	s4,160(sp)
ffffffffc020070c:	f556                	sd	s5,168(sp)
ffffffffc020070e:	f95a                	sd	s6,176(sp)
ffffffffc0200710:	fd5e                	sd	s7,184(sp)
ffffffffc0200712:	e1e2                	sd	s8,192(sp)
ffffffffc0200714:	e5e6                	sd	s9,200(sp)
ffffffffc0200716:	e9ea                	sd	s10,208(sp)
ffffffffc0200718:	edee                	sd	s11,216(sp)
ffffffffc020071a:	f1f2                	sd	t3,224(sp)
ffffffffc020071c:	f5f6                	sd	t4,232(sp)
ffffffffc020071e:	f9fa                	sd	t5,240(sp)
ffffffffc0200720:	fdfe                	sd	t6,248(sp)
ffffffffc0200722:	14002473          	csrr	s0,sscratch
ffffffffc0200726:	100024f3          	csrr	s1,sstatus
ffffffffc020072a:	14102973          	csrr	s2,sepc
ffffffffc020072e:	143029f3          	csrr	s3,stval
ffffffffc0200732:	14202a73          	csrr	s4,scause
ffffffffc0200736:	e822                	sd	s0,16(sp)
ffffffffc0200738:	e226                	sd	s1,256(sp)
ffffffffc020073a:	e64a                	sd	s2,264(sp)
ffffffffc020073c:	ea4e                	sd	s3,272(sp)
ffffffffc020073e:	ee52                	sd	s4,280(sp)
ffffffffc0200740:	850a                	mv	a0,sp
ffffffffc0200742:	f8dff0ef          	jal	ra,ffffffffc02006ce <trap>

ffffffffc0200746 <__trapret>:
ffffffffc0200746:	6492                	ld	s1,256(sp)
ffffffffc0200748:	6932                	ld	s2,264(sp)
ffffffffc020074a:	10049073          	csrw	sstatus,s1
ffffffffc020074e:	14191073          	csrw	sepc,s2
ffffffffc0200752:	60a2                	ld	ra,8(sp)
ffffffffc0200754:	61e2                	ld	gp,24(sp)
ffffffffc0200756:	7202                	ld	tp,32(sp)
ffffffffc0200758:	72a2                	ld	t0,40(sp)
ffffffffc020075a:	7342                	ld	t1,48(sp)
ffffffffc020075c:	73e2                	ld	t2,56(sp)
ffffffffc020075e:	6406                	ld	s0,64(sp)
ffffffffc0200760:	64a6                	ld	s1,72(sp)
ffffffffc0200762:	6546                	ld	a0,80(sp)
ffffffffc0200764:	65e6                	ld	a1,88(sp)
ffffffffc0200766:	7606                	ld	a2,96(sp)
ffffffffc0200768:	76a6                	ld	a3,104(sp)
ffffffffc020076a:	7746                	ld	a4,112(sp)
ffffffffc020076c:	77e6                	ld	a5,120(sp)
ffffffffc020076e:	680a                	ld	a6,128(sp)
ffffffffc0200770:	68aa                	ld	a7,136(sp)
ffffffffc0200772:	694a                	ld	s2,144(sp)
ffffffffc0200774:	69ea                	ld	s3,152(sp)
ffffffffc0200776:	7a0a                	ld	s4,160(sp)
ffffffffc0200778:	7aaa                	ld	s5,168(sp)
ffffffffc020077a:	7b4a                	ld	s6,176(sp)
ffffffffc020077c:	7bea                	ld	s7,184(sp)
ffffffffc020077e:	6c0e                	ld	s8,192(sp)
ffffffffc0200780:	6cae                	ld	s9,200(sp)
ffffffffc0200782:	6d4e                	ld	s10,208(sp)
ffffffffc0200784:	6dee                	ld	s11,216(sp)
ffffffffc0200786:	7e0e                	ld	t3,224(sp)
ffffffffc0200788:	7eae                	ld	t4,232(sp)
ffffffffc020078a:	7f4e                	ld	t5,240(sp)
ffffffffc020078c:	7fee                	ld	t6,248(sp)
ffffffffc020078e:	6142                	ld	sp,16(sp)
ffffffffc0200790:	10200073          	sret
	...

ffffffffc02007a0 <_lru_init_mm>:
ffffffffc02007a0:	00010797          	auipc	a5,0x10
ffffffffc02007a4:	8e078793          	addi	a5,a5,-1824 # ffffffffc0210080 <pra_list_head>
ffffffffc02007a8:	f51c                	sd	a5,40(a0)
ffffffffc02007aa:	e79c                	sd	a5,8(a5)
ffffffffc02007ac:	e39c                	sd	a5,0(a5)
ffffffffc02007ae:	00010717          	auipc	a4,0x10
ffffffffc02007b2:	8ef73123          	sd	a5,-1822(a4) # ffffffffc0210090 <curr_ptr>
ffffffffc02007b6:	4501                	li	a0,0
ffffffffc02007b8:	8082                	ret

ffffffffc02007ba <_lru_init>:
ffffffffc02007ba:	4501                	li	a0,0
ffffffffc02007bc:	8082                	ret

ffffffffc02007be <_lru_set_unswappable>:
ffffffffc02007be:	4501                	li	a0,0
ffffffffc02007c0:	8082                	ret

ffffffffc02007c2 <_lru_tick_event>:
ffffffffc02007c2:	4501                	li	a0,0
ffffffffc02007c4:	8082                	ret

ffffffffc02007c6 <_lru_check_swap>:
ffffffffc02007c6:	7139                	addi	sp,sp,-64
ffffffffc02007c8:	00004517          	auipc	a0,0x4
ffffffffc02007cc:	bb050513          	addi	a0,a0,-1104 # ffffffffc0204378 <etext+0x6e4>
ffffffffc02007d0:	fc06                	sd	ra,56(sp)
ffffffffc02007d2:	f04a                	sd	s2,32(sp)
ffffffffc02007d4:	e05a                	sd	s6,0(sp)
ffffffffc02007d6:	f822                	sd	s0,48(sp)
ffffffffc02007d8:	f426                	sd	s1,40(sp)
ffffffffc02007da:	ec4e                	sd	s3,24(sp)
ffffffffc02007dc:	e852                	sd	s4,16(sp)
ffffffffc02007de:	e456                	sd	s5,8(sp)
ffffffffc02007e0:	8d7ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02007e4:	00004517          	auipc	a0,0x4
ffffffffc02007e8:	bbc50513          	addi	a0,a0,-1092 # ffffffffc02043a0 <etext+0x70c>
ffffffffc02007ec:	8cbff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02007f0:	47c1                	li	a5,16
ffffffffc02007f2:	6b0d                	lui	s6,0x3
ffffffffc02007f4:	00fb0023          	sb	a5,0(s6) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc02007f8:	00010917          	auipc	s2,0x10
ffffffffc02007fc:	85892903          	lw	s2,-1960(s2) # ffffffffc0210050 <pgfault_num>
ffffffffc0200800:	4791                	li	a5,4
ffffffffc0200802:	16f91463          	bne	s2,a5,ffffffffc020096a <_lru_check_swap+0x1a4>
ffffffffc0200806:	00004517          	auipc	a0,0x4
ffffffffc020080a:	c0a50513          	addi	a0,a0,-1014 # ffffffffc0204410 <etext+0x77c>
ffffffffc020080e:	8a9ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200812:	6a05                	lui	s4,0x1
ffffffffc0200814:	47c5                	li	a5,17
ffffffffc0200816:	00010417          	auipc	s0,0x10
ffffffffc020081a:	83a40413          	addi	s0,s0,-1990 # ffffffffc0210050 <pgfault_num>
ffffffffc020081e:	00fa0023          	sb	a5,0(s4) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0200822:	4004                	lw	s1,0(s0)
ffffffffc0200824:	2481                	sext.w	s1,s1
ffffffffc0200826:	2b249263          	bne	s1,s2,ffffffffc0200aca <_lru_check_swap+0x304>
ffffffffc020082a:	00004517          	auipc	a0,0x4
ffffffffc020082e:	c0e50513          	addi	a0,a0,-1010 # ffffffffc0204438 <etext+0x7a4>
ffffffffc0200832:	885ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200836:	6991                	lui	s3,0x4
ffffffffc0200838:	47c9                	li	a5,18
ffffffffc020083a:	00f98023          	sb	a5,0(s3) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc020083e:	00042903          	lw	s2,0(s0)
ffffffffc0200842:	2901                	sext.w	s2,s2
ffffffffc0200844:	26991363          	bne	s2,s1,ffffffffc0200aaa <_lru_check_swap+0x2e4>
ffffffffc0200848:	00004517          	auipc	a0,0x4
ffffffffc020084c:	c1850513          	addi	a0,a0,-1000 # ffffffffc0204460 <etext+0x7cc>
ffffffffc0200850:	867ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200854:	6789                	lui	a5,0x2
ffffffffc0200856:	474d                	li	a4,19
ffffffffc0200858:	00e78023          	sb	a4,0(a5) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc020085c:	401c                	lw	a5,0(s0)
ffffffffc020085e:	2781                	sext.w	a5,a5
ffffffffc0200860:	23279563          	bne	a5,s2,ffffffffc0200a8a <_lru_check_swap+0x2c4>
ffffffffc0200864:	00004517          	auipc	a0,0x4
ffffffffc0200868:	c2450513          	addi	a0,a0,-988 # ffffffffc0204488 <etext+0x7f4>
ffffffffc020086c:	84bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200870:	47d1                	li	a5,20
ffffffffc0200872:	6a95                	lui	s5,0x5
ffffffffc0200874:	00fa8023          	sb	a5,0(s5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc0200878:	401c                	lw	a5,0(s0)
ffffffffc020087a:	4715                	li	a4,5
ffffffffc020087c:	2781                	sext.w	a5,a5
ffffffffc020087e:	1ee79663          	bne	a5,a4,ffffffffc0200a6a <_lru_check_swap+0x2a4>
ffffffffc0200882:	00004517          	auipc	a0,0x4
ffffffffc0200886:	b1e50513          	addi	a0,a0,-1250 # ffffffffc02043a0 <etext+0x70c>
ffffffffc020088a:	82dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020088e:	47d5                	li	a5,21
ffffffffc0200890:	00fb0023          	sb	a5,0(s6)
ffffffffc0200894:	401c                	lw	a5,0(s0)
ffffffffc0200896:	4719                	li	a4,6
ffffffffc0200898:	2781                	sext.w	a5,a5
ffffffffc020089a:	1ae79863          	bne	a5,a4,ffffffffc0200a4a <_lru_check_swap+0x284>
ffffffffc020089e:	00004517          	auipc	a0,0x4
ffffffffc02008a2:	b7250513          	addi	a0,a0,-1166 # ffffffffc0204410 <etext+0x77c>
ffffffffc02008a6:	811ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02008aa:	47d9                	li	a5,22
ffffffffc02008ac:	00fa0023          	sb	a5,0(s4)
ffffffffc02008b0:	401c                	lw	a5,0(s0)
ffffffffc02008b2:	471d                	li	a4,7
ffffffffc02008b4:	2781                	sext.w	a5,a5
ffffffffc02008b6:	16e79a63          	bne	a5,a4,ffffffffc0200a2a <_lru_check_swap+0x264>
ffffffffc02008ba:	00004517          	auipc	a0,0x4
ffffffffc02008be:	b7e50513          	addi	a0,a0,-1154 # ffffffffc0204438 <etext+0x7a4>
ffffffffc02008c2:	ff4ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02008c6:	47dd                	li	a5,23
ffffffffc02008c8:	00f98023          	sb	a5,0(s3)
ffffffffc02008cc:	4004                	lw	s1,0(s0)
ffffffffc02008ce:	47a1                	li	a5,8
ffffffffc02008d0:	2481                	sext.w	s1,s1
ffffffffc02008d2:	12f49c63          	bne	s1,a5,ffffffffc0200a0a <_lru_check_swap+0x244>
ffffffffc02008d6:	00004517          	auipc	a0,0x4
ffffffffc02008da:	b6250513          	addi	a0,a0,-1182 # ffffffffc0204438 <etext+0x7a4>
ffffffffc02008de:	fd8ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02008e2:	47e1                	li	a5,24
ffffffffc02008e4:	00f98023          	sb	a5,0(s3)
ffffffffc02008e8:	00042903          	lw	s2,0(s0)
ffffffffc02008ec:	2901                	sext.w	s2,s2
ffffffffc02008ee:	0e991e63          	bne	s2,s1,ffffffffc02009ea <_lru_check_swap+0x224>
ffffffffc02008f2:	00004517          	auipc	a0,0x4
ffffffffc02008f6:	b9650513          	addi	a0,a0,-1130 # ffffffffc0204488 <etext+0x7f4>
ffffffffc02008fa:	fbcff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02008fe:	47e5                	li	a5,25
ffffffffc0200900:	00fa8023          	sb	a5,0(s5)
ffffffffc0200904:	401c                	lw	a5,0(s0)
ffffffffc0200906:	2781                	sext.w	a5,a5
ffffffffc0200908:	0d279163          	bne	a5,s2,ffffffffc02009ca <_lru_check_swap+0x204>
ffffffffc020090c:	00004517          	auipc	a0,0x4
ffffffffc0200910:	b5450513          	addi	a0,a0,-1196 # ffffffffc0204460 <etext+0x7cc>
ffffffffc0200914:	fa2ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200918:	6789                	lui	a5,0x2
ffffffffc020091a:	4769                	li	a4,26
ffffffffc020091c:	00e78023          	sb	a4,0(a5) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc0200920:	401c                	lw	a5,0(s0)
ffffffffc0200922:	4725                	li	a4,9
ffffffffc0200924:	2781                	sext.w	a5,a5
ffffffffc0200926:	08e79263          	bne	a5,a4,ffffffffc02009aa <_lru_check_swap+0x1e4>
ffffffffc020092a:	00004517          	auipc	a0,0x4
ffffffffc020092e:	a7650513          	addi	a0,a0,-1418 # ffffffffc02043a0 <etext+0x70c>
ffffffffc0200932:	f84ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200936:	678d                	lui	a5,0x3
ffffffffc0200938:	476d                	li	a4,27
ffffffffc020093a:	00e78023          	sb	a4,0(a5) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc020093e:	401c                	lw	a5,0(s0)
ffffffffc0200940:	4729                	li	a4,10
ffffffffc0200942:	2781                	sext.w	a5,a5
ffffffffc0200944:	04e79363          	bne	a5,a4,ffffffffc020098a <_lru_check_swap+0x1c4>
ffffffffc0200948:	00004517          	auipc	a0,0x4
ffffffffc020094c:	bf850513          	addi	a0,a0,-1032 # ffffffffc0204540 <etext+0x8ac>
ffffffffc0200950:	f66ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200954:	70e2                	ld	ra,56(sp)
ffffffffc0200956:	7442                	ld	s0,48(sp)
ffffffffc0200958:	74a2                	ld	s1,40(sp)
ffffffffc020095a:	7902                	ld	s2,32(sp)
ffffffffc020095c:	69e2                	ld	s3,24(sp)
ffffffffc020095e:	6a42                	ld	s4,16(sp)
ffffffffc0200960:	6aa2                	ld	s5,8(sp)
ffffffffc0200962:	6b02                	ld	s6,0(sp)
ffffffffc0200964:	4501                	li	a0,0
ffffffffc0200966:	6121                	addi	sp,sp,64
ffffffffc0200968:	8082                	ret
ffffffffc020096a:	00004697          	auipc	a3,0x4
ffffffffc020096e:	a5e68693          	addi	a3,a3,-1442 # ffffffffc02043c8 <etext+0x734>
ffffffffc0200972:	00004617          	auipc	a2,0x4
ffffffffc0200976:	a6e60613          	addi	a2,a2,-1426 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020097a:	05c00593          	li	a1,92
ffffffffc020097e:	00004517          	auipc	a0,0x4
ffffffffc0200982:	a7a50513          	addi	a0,a0,-1414 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200986:	f66ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020098a:	00004697          	auipc	a3,0x4
ffffffffc020098e:	b9e68693          	addi	a3,a3,-1122 # ffffffffc0204528 <etext+0x894>
ffffffffc0200992:	00004617          	auipc	a2,0x4
ffffffffc0200996:	a4e60613          	addi	a2,a2,-1458 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020099a:	08800593          	li	a1,136
ffffffffc020099e:	00004517          	auipc	a0,0x4
ffffffffc02009a2:	a5a50513          	addi	a0,a0,-1446 # ffffffffc02043f8 <etext+0x764>
ffffffffc02009a6:	f46ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02009aa:	00004697          	auipc	a3,0x4
ffffffffc02009ae:	b6668693          	addi	a3,a3,-1178 # ffffffffc0204510 <etext+0x87c>
ffffffffc02009b2:	00004617          	auipc	a2,0x4
ffffffffc02009b6:	a2e60613          	addi	a2,a2,-1490 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02009ba:	08400593          	li	a1,132
ffffffffc02009be:	00004517          	auipc	a0,0x4
ffffffffc02009c2:	a3a50513          	addi	a0,a0,-1478 # ffffffffc02043f8 <etext+0x764>
ffffffffc02009c6:	f26ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02009ca:	00004697          	auipc	a3,0x4
ffffffffc02009ce:	b2e68693          	addi	a3,a3,-1234 # ffffffffc02044f8 <etext+0x864>
ffffffffc02009d2:	00004617          	auipc	a2,0x4
ffffffffc02009d6:	a0e60613          	addi	a2,a2,-1522 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02009da:	08000593          	li	a1,128
ffffffffc02009de:	00004517          	auipc	a0,0x4
ffffffffc02009e2:	a1a50513          	addi	a0,a0,-1510 # ffffffffc02043f8 <etext+0x764>
ffffffffc02009e6:	f06ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02009ea:	00004697          	auipc	a3,0x4
ffffffffc02009ee:	b0e68693          	addi	a3,a3,-1266 # ffffffffc02044f8 <etext+0x864>
ffffffffc02009f2:	00004617          	auipc	a2,0x4
ffffffffc02009f6:	9ee60613          	addi	a2,a2,-1554 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02009fa:	07c00593          	li	a1,124
ffffffffc02009fe:	00004517          	auipc	a0,0x4
ffffffffc0200a02:	9fa50513          	addi	a0,a0,-1542 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200a06:	ee6ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200a0a:	00004697          	auipc	a3,0x4
ffffffffc0200a0e:	aee68693          	addi	a3,a3,-1298 # ffffffffc02044f8 <etext+0x864>
ffffffffc0200a12:	00004617          	auipc	a2,0x4
ffffffffc0200a16:	9ce60613          	addi	a2,a2,-1586 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200a1a:	07800593          	li	a1,120
ffffffffc0200a1e:	00004517          	auipc	a0,0x4
ffffffffc0200a22:	9da50513          	addi	a0,a0,-1574 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200a26:	ec6ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200a2a:	00004697          	auipc	a3,0x4
ffffffffc0200a2e:	ab668693          	addi	a3,a3,-1354 # ffffffffc02044e0 <etext+0x84c>
ffffffffc0200a32:	00004617          	auipc	a2,0x4
ffffffffc0200a36:	9ae60613          	addi	a2,a2,-1618 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200a3a:	07400593          	li	a1,116
ffffffffc0200a3e:	00004517          	auipc	a0,0x4
ffffffffc0200a42:	9ba50513          	addi	a0,a0,-1606 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200a46:	ea6ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200a4a:	00004697          	auipc	a3,0x4
ffffffffc0200a4e:	a7e68693          	addi	a3,a3,-1410 # ffffffffc02044c8 <etext+0x834>
ffffffffc0200a52:	00004617          	auipc	a2,0x4
ffffffffc0200a56:	98e60613          	addi	a2,a2,-1650 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200a5a:	07000593          	li	a1,112
ffffffffc0200a5e:	00004517          	auipc	a0,0x4
ffffffffc0200a62:	99a50513          	addi	a0,a0,-1638 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200a66:	e86ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200a6a:	00004697          	auipc	a3,0x4
ffffffffc0200a6e:	a4668693          	addi	a3,a3,-1466 # ffffffffc02044b0 <etext+0x81c>
ffffffffc0200a72:	00004617          	auipc	a2,0x4
ffffffffc0200a76:	96e60613          	addi	a2,a2,-1682 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200a7a:	06c00593          	li	a1,108
ffffffffc0200a7e:	00004517          	auipc	a0,0x4
ffffffffc0200a82:	97a50513          	addi	a0,a0,-1670 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200a86:	e66ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200a8a:	00004697          	auipc	a3,0x4
ffffffffc0200a8e:	93e68693          	addi	a3,a3,-1730 # ffffffffc02043c8 <etext+0x734>
ffffffffc0200a92:	00004617          	auipc	a2,0x4
ffffffffc0200a96:	94e60613          	addi	a2,a2,-1714 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200a9a:	06800593          	li	a1,104
ffffffffc0200a9e:	00004517          	auipc	a0,0x4
ffffffffc0200aa2:	95a50513          	addi	a0,a0,-1702 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200aa6:	e46ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200aaa:	00004697          	auipc	a3,0x4
ffffffffc0200aae:	91e68693          	addi	a3,a3,-1762 # ffffffffc02043c8 <etext+0x734>
ffffffffc0200ab2:	00004617          	auipc	a2,0x4
ffffffffc0200ab6:	92e60613          	addi	a2,a2,-1746 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200aba:	06400593          	li	a1,100
ffffffffc0200abe:	00004517          	auipc	a0,0x4
ffffffffc0200ac2:	93a50513          	addi	a0,a0,-1734 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200ac6:	e26ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200aca:	00004697          	auipc	a3,0x4
ffffffffc0200ace:	8fe68693          	addi	a3,a3,-1794 # ffffffffc02043c8 <etext+0x734>
ffffffffc0200ad2:	00004617          	auipc	a2,0x4
ffffffffc0200ad6:	90e60613          	addi	a2,a2,-1778 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200ada:	06000593          	li	a1,96
ffffffffc0200ade:	00004517          	auipc	a0,0x4
ffffffffc0200ae2:	91a50513          	addi	a0,a0,-1766 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200ae6:	e06ff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0200aea <_lru_swap_out_victim>:
ffffffffc0200aea:	7514                	ld	a3,40(a0)
ffffffffc0200aec:	1141                	addi	sp,sp,-16
ffffffffc0200aee:	e406                	sd	ra,8(sp)
ffffffffc0200af0:	c2d1                	beqz	a3,ffffffffc0200b74 <_lru_swap_out_victim+0x8a>
ffffffffc0200af2:	e22d                	bnez	a2,ffffffffc0200b54 <_lru_swap_out_victim+0x6a>
ffffffffc0200af4:	669c                	ld	a5,8(a3)
ffffffffc0200af6:	04f68963          	beq	a3,a5,ffffffffc0200b48 <_lru_swap_out_victim+0x5e>
ffffffffc0200afa:	6b98                	ld	a4,16(a5)
ffffffffc0200afc:	0000f517          	auipc	a0,0xf
ffffffffc0200b00:	59450513          	addi	a0,a0,1428 # ffffffffc0210090 <curr_ptr>
ffffffffc0200b04:	e11c                	sd	a5,0(a0)
ffffffffc0200b06:	00074603          	lbu	a2,0(a4)
ffffffffc0200b0a:	883e                	mv	a6,a5
ffffffffc0200b0c:	679c                	ld	a5,8(a5)
ffffffffc0200b0e:	e11c                	sd	a5,0(a0)
ffffffffc0200b10:	00f68d63          	beq	a3,a5,ffffffffc0200b2a <_lru_swap_out_victim+0x40>
ffffffffc0200b14:	6b98                	ld	a4,16(a5)
ffffffffc0200b16:	00074703          	lbu	a4,0(a4)
ffffffffc0200b1a:	fee649e3          	blt	a2,a4,ffffffffc0200b0c <_lru_swap_out_victim+0x22>
ffffffffc0200b1e:	883e                	mv	a6,a5
ffffffffc0200b20:	679c                	ld	a5,8(a5)
ffffffffc0200b22:	863a                	mv	a2,a4
ffffffffc0200b24:	e11c                	sd	a5,0(a0)
ffffffffc0200b26:	fef697e3          	bne	a3,a5,ffffffffc0200b14 <_lru_swap_out_victim+0x2a>
ffffffffc0200b2a:	00083783          	ld	a5,0(a6)
ffffffffc0200b2e:	00883703          	ld	a4,8(a6)
ffffffffc0200b32:	60a2                	ld	ra,8(sp)
ffffffffc0200b34:	e11c                	sd	a5,0(a0)
ffffffffc0200b36:	e798                	sd	a4,8(a5)
ffffffffc0200b38:	e31c                	sd	a5,0(a4)
ffffffffc0200b3a:	fd080813          	addi	a6,a6,-48
ffffffffc0200b3e:	0105b023          	sd	a6,0(a1)
ffffffffc0200b42:	4501                	li	a0,0
ffffffffc0200b44:	0141                	addi	sp,sp,16
ffffffffc0200b46:	8082                	ret
ffffffffc0200b48:	60a2                	ld	ra,8(sp)
ffffffffc0200b4a:	0005b023          	sd	zero,0(a1)
ffffffffc0200b4e:	4501                	li	a0,0
ffffffffc0200b50:	0141                	addi	sp,sp,16
ffffffffc0200b52:	8082                	ret
ffffffffc0200b54:	00004697          	auipc	a3,0x4
ffffffffc0200b58:	a1468693          	addi	a3,a3,-1516 # ffffffffc0204568 <etext+0x8d4>
ffffffffc0200b5c:	00004617          	auipc	a2,0x4
ffffffffc0200b60:	88460613          	addi	a2,a2,-1916 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200b64:	03000593          	li	a1,48
ffffffffc0200b68:	00004517          	auipc	a0,0x4
ffffffffc0200b6c:	89050513          	addi	a0,a0,-1904 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200b70:	d7cff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200b74:	00004697          	auipc	a3,0x4
ffffffffc0200b78:	9e468693          	addi	a3,a3,-1564 # ffffffffc0204558 <etext+0x8c4>
ffffffffc0200b7c:	00004617          	auipc	a2,0x4
ffffffffc0200b80:	86460613          	addi	a2,a2,-1948 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200b84:	02f00593          	li	a1,47
ffffffffc0200b88:	00004517          	auipc	a0,0x4
ffffffffc0200b8c:	87050513          	addi	a0,a0,-1936 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200b90:	d5cff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0200b94 <_lru_map_swappable>:
ffffffffc0200b94:	751c                	ld	a5,40(a0)
ffffffffc0200b96:	cf81                	beqz	a5,ffffffffc0200bae <_lru_map_swappable+0x1a>
ffffffffc0200b98:	6794                	ld	a3,8(a5)
ffffffffc0200b9a:	0585                	addi	a1,a1,1
ffffffffc0200b9c:	03060713          	addi	a4,a2,48
ffffffffc0200ba0:	e22c                	sd	a1,64(a2)
ffffffffc0200ba2:	e298                	sd	a4,0(a3)
ffffffffc0200ba4:	e798                	sd	a4,8(a5)
ffffffffc0200ba6:	fe14                	sd	a3,56(a2)
ffffffffc0200ba8:	fa1c                	sd	a5,48(a2)
ffffffffc0200baa:	4501                	li	a0,0
ffffffffc0200bac:	8082                	ret
ffffffffc0200bae:	1141                	addi	sp,sp,-16
ffffffffc0200bb0:	00004697          	auipc	a3,0x4
ffffffffc0200bb4:	9c868693          	addi	a3,a3,-1592 # ffffffffc0204578 <etext+0x8e4>
ffffffffc0200bb8:	00004617          	auipc	a2,0x4
ffffffffc0200bbc:	82860613          	addi	a2,a2,-2008 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200bc0:	45fd                	li	a1,31
ffffffffc0200bc2:	00004517          	auipc	a0,0x4
ffffffffc0200bc6:	83650513          	addi	a0,a0,-1994 # ffffffffc02043f8 <etext+0x764>
ffffffffc0200bca:	e406                	sd	ra,8(sp)
ffffffffc0200bcc:	d20ff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0200bd0 <check_vma_overlap.isra.0.part.0>:
ffffffffc0200bd0:	1141                	addi	sp,sp,-16
ffffffffc0200bd2:	00004697          	auipc	a3,0x4
ffffffffc0200bd6:	9de68693          	addi	a3,a3,-1570 # ffffffffc02045b0 <etext+0x91c>
ffffffffc0200bda:	00004617          	auipc	a2,0x4
ffffffffc0200bde:	80660613          	addi	a2,a2,-2042 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200be2:	07c00593          	li	a1,124
ffffffffc0200be6:	00004517          	auipc	a0,0x4
ffffffffc0200bea:	9ea50513          	addi	a0,a0,-1558 # ffffffffc02045d0 <etext+0x93c>
ffffffffc0200bee:	e406                	sd	ra,8(sp)
ffffffffc0200bf0:	cfcff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0200bf4 <mm_create>:
ffffffffc0200bf4:	1141                	addi	sp,sp,-16
ffffffffc0200bf6:	03000513          	li	a0,48
ffffffffc0200bfa:	e022                	sd	s0,0(sp)
ffffffffc0200bfc:	e406                	sd	ra,8(sp)
ffffffffc0200bfe:	13b020ef          	jal	ra,ffffffffc0203538 <kmalloc>
ffffffffc0200c02:	842a                	mv	s0,a0
ffffffffc0200c04:	c105                	beqz	a0,ffffffffc0200c24 <mm_create+0x30>
ffffffffc0200c06:	e408                	sd	a0,8(s0)
ffffffffc0200c08:	e008                	sd	a0,0(s0)
ffffffffc0200c0a:	00053823          	sd	zero,16(a0)
ffffffffc0200c0e:	00053c23          	sd	zero,24(a0)
ffffffffc0200c12:	02052023          	sw	zero,32(a0)
ffffffffc0200c16:	0000f797          	auipc	a5,0xf
ffffffffc0200c1a:	44a7a783          	lw	a5,1098(a5) # ffffffffc0210060 <swap_init_ok>
ffffffffc0200c1e:	eb81                	bnez	a5,ffffffffc0200c2e <mm_create+0x3a>
ffffffffc0200c20:	02053423          	sd	zero,40(a0)
ffffffffc0200c24:	60a2                	ld	ra,8(sp)
ffffffffc0200c26:	8522                	mv	a0,s0
ffffffffc0200c28:	6402                	ld	s0,0(sp)
ffffffffc0200c2a:	0141                	addi	sp,sp,16
ffffffffc0200c2c:	8082                	ret
ffffffffc0200c2e:	5c7000ef          	jal	ra,ffffffffc02019f4 <swap_init_mm>
ffffffffc0200c32:	60a2                	ld	ra,8(sp)
ffffffffc0200c34:	8522                	mv	a0,s0
ffffffffc0200c36:	6402                	ld	s0,0(sp)
ffffffffc0200c38:	0141                	addi	sp,sp,16
ffffffffc0200c3a:	8082                	ret

ffffffffc0200c3c <vma_create>:
ffffffffc0200c3c:	1101                	addi	sp,sp,-32
ffffffffc0200c3e:	e04a                	sd	s2,0(sp)
ffffffffc0200c40:	892a                	mv	s2,a0
ffffffffc0200c42:	03000513          	li	a0,48
ffffffffc0200c46:	e822                	sd	s0,16(sp)
ffffffffc0200c48:	e426                	sd	s1,8(sp)
ffffffffc0200c4a:	ec06                	sd	ra,24(sp)
ffffffffc0200c4c:	84ae                	mv	s1,a1
ffffffffc0200c4e:	8432                	mv	s0,a2
ffffffffc0200c50:	0e9020ef          	jal	ra,ffffffffc0203538 <kmalloc>
ffffffffc0200c54:	c509                	beqz	a0,ffffffffc0200c5e <vma_create+0x22>
ffffffffc0200c56:	01253423          	sd	s2,8(a0)
ffffffffc0200c5a:	e904                	sd	s1,16(a0)
ffffffffc0200c5c:	ed00                	sd	s0,24(a0)
ffffffffc0200c5e:	60e2                	ld	ra,24(sp)
ffffffffc0200c60:	6442                	ld	s0,16(sp)
ffffffffc0200c62:	64a2                	ld	s1,8(sp)
ffffffffc0200c64:	6902                	ld	s2,0(sp)
ffffffffc0200c66:	6105                	addi	sp,sp,32
ffffffffc0200c68:	8082                	ret

ffffffffc0200c6a <find_vma>:
ffffffffc0200c6a:	86aa                	mv	a3,a0
ffffffffc0200c6c:	c505                	beqz	a0,ffffffffc0200c94 <find_vma+0x2a>
ffffffffc0200c6e:	6908                	ld	a0,16(a0)
ffffffffc0200c70:	c501                	beqz	a0,ffffffffc0200c78 <find_vma+0xe>
ffffffffc0200c72:	651c                	ld	a5,8(a0)
ffffffffc0200c74:	02f5f263          	bgeu	a1,a5,ffffffffc0200c98 <find_vma+0x2e>
ffffffffc0200c78:	669c                	ld	a5,8(a3)
ffffffffc0200c7a:	00f68d63          	beq	a3,a5,ffffffffc0200c94 <find_vma+0x2a>
ffffffffc0200c7e:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200c82:	00e5e663          	bltu	a1,a4,ffffffffc0200c8e <find_vma+0x24>
ffffffffc0200c86:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200c8a:	00e5ec63          	bltu	a1,a4,ffffffffc0200ca2 <find_vma+0x38>
ffffffffc0200c8e:	679c                	ld	a5,8(a5)
ffffffffc0200c90:	fef697e3          	bne	a3,a5,ffffffffc0200c7e <find_vma+0x14>
ffffffffc0200c94:	4501                	li	a0,0
ffffffffc0200c96:	8082                	ret
ffffffffc0200c98:	691c                	ld	a5,16(a0)
ffffffffc0200c9a:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0200c78 <find_vma+0xe>
ffffffffc0200c9e:	ea88                	sd	a0,16(a3)
ffffffffc0200ca0:	8082                	ret
ffffffffc0200ca2:	fe078513          	addi	a0,a5,-32
ffffffffc0200ca6:	ea88                	sd	a0,16(a3)
ffffffffc0200ca8:	8082                	ret

ffffffffc0200caa <insert_vma_struct>:
ffffffffc0200caa:	6590                	ld	a2,8(a1)
ffffffffc0200cac:	0105b803          	ld	a6,16(a1)
ffffffffc0200cb0:	1141                	addi	sp,sp,-16
ffffffffc0200cb2:	e406                	sd	ra,8(sp)
ffffffffc0200cb4:	87aa                	mv	a5,a0
ffffffffc0200cb6:	01066763          	bltu	a2,a6,ffffffffc0200cc4 <insert_vma_struct+0x1a>
ffffffffc0200cba:	a085                	j	ffffffffc0200d1a <insert_vma_struct+0x70>
ffffffffc0200cbc:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200cc0:	04e66863          	bltu	a2,a4,ffffffffc0200d10 <insert_vma_struct+0x66>
ffffffffc0200cc4:	86be                	mv	a3,a5
ffffffffc0200cc6:	679c                	ld	a5,8(a5)
ffffffffc0200cc8:	fef51ae3          	bne	a0,a5,ffffffffc0200cbc <insert_vma_struct+0x12>
ffffffffc0200ccc:	02a68463          	beq	a3,a0,ffffffffc0200cf4 <insert_vma_struct+0x4a>
ffffffffc0200cd0:	ff06b703          	ld	a4,-16(a3)
ffffffffc0200cd4:	fe86b883          	ld	a7,-24(a3)
ffffffffc0200cd8:	08e8f163          	bgeu	a7,a4,ffffffffc0200d5a <insert_vma_struct+0xb0>
ffffffffc0200cdc:	04e66f63          	bltu	a2,a4,ffffffffc0200d3a <insert_vma_struct+0x90>
ffffffffc0200ce0:	00f50a63          	beq	a0,a5,ffffffffc0200cf4 <insert_vma_struct+0x4a>
ffffffffc0200ce4:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200ce8:	05076963          	bltu	a4,a6,ffffffffc0200d3a <insert_vma_struct+0x90>
ffffffffc0200cec:	ff07b603          	ld	a2,-16(a5)
ffffffffc0200cf0:	02c77363          	bgeu	a4,a2,ffffffffc0200d16 <insert_vma_struct+0x6c>
ffffffffc0200cf4:	5118                	lw	a4,32(a0)
ffffffffc0200cf6:	e188                	sd	a0,0(a1)
ffffffffc0200cf8:	02058613          	addi	a2,a1,32
ffffffffc0200cfc:	e390                	sd	a2,0(a5)
ffffffffc0200cfe:	e690                	sd	a2,8(a3)
ffffffffc0200d00:	60a2                	ld	ra,8(sp)
ffffffffc0200d02:	f59c                	sd	a5,40(a1)
ffffffffc0200d04:	f194                	sd	a3,32(a1)
ffffffffc0200d06:	0017079b          	addiw	a5,a4,1
ffffffffc0200d0a:	d11c                	sw	a5,32(a0)
ffffffffc0200d0c:	0141                	addi	sp,sp,16
ffffffffc0200d0e:	8082                	ret
ffffffffc0200d10:	fca690e3          	bne	a3,a0,ffffffffc0200cd0 <insert_vma_struct+0x26>
ffffffffc0200d14:	bfd1                	j	ffffffffc0200ce8 <insert_vma_struct+0x3e>
ffffffffc0200d16:	ebbff0ef          	jal	ra,ffffffffc0200bd0 <check_vma_overlap.isra.0.part.0>
ffffffffc0200d1a:	00004697          	auipc	a3,0x4
ffffffffc0200d1e:	8c668693          	addi	a3,a3,-1850 # ffffffffc02045e0 <etext+0x94c>
ffffffffc0200d22:	00003617          	auipc	a2,0x3
ffffffffc0200d26:	6be60613          	addi	a2,a2,1726 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200d2a:	08300593          	li	a1,131
ffffffffc0200d2e:	00004517          	auipc	a0,0x4
ffffffffc0200d32:	8a250513          	addi	a0,a0,-1886 # ffffffffc02045d0 <etext+0x93c>
ffffffffc0200d36:	bb6ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200d3a:	00004697          	auipc	a3,0x4
ffffffffc0200d3e:	8e668693          	addi	a3,a3,-1818 # ffffffffc0204620 <etext+0x98c>
ffffffffc0200d42:	00003617          	auipc	a2,0x3
ffffffffc0200d46:	69e60613          	addi	a2,a2,1694 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200d4a:	07b00593          	li	a1,123
ffffffffc0200d4e:	00004517          	auipc	a0,0x4
ffffffffc0200d52:	88250513          	addi	a0,a0,-1918 # ffffffffc02045d0 <etext+0x93c>
ffffffffc0200d56:	b96ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200d5a:	00004697          	auipc	a3,0x4
ffffffffc0200d5e:	8a668693          	addi	a3,a3,-1882 # ffffffffc0204600 <etext+0x96c>
ffffffffc0200d62:	00003617          	auipc	a2,0x3
ffffffffc0200d66:	67e60613          	addi	a2,a2,1662 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200d6a:	07a00593          	li	a1,122
ffffffffc0200d6e:	00004517          	auipc	a0,0x4
ffffffffc0200d72:	86250513          	addi	a0,a0,-1950 # ffffffffc02045d0 <etext+0x93c>
ffffffffc0200d76:	b76ff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0200d7a <mm_destroy>:
ffffffffc0200d7a:	1141                	addi	sp,sp,-16
ffffffffc0200d7c:	e022                	sd	s0,0(sp)
ffffffffc0200d7e:	842a                	mv	s0,a0
ffffffffc0200d80:	6508                	ld	a0,8(a0)
ffffffffc0200d82:	e406                	sd	ra,8(sp)
ffffffffc0200d84:	00a40e63          	beq	s0,a0,ffffffffc0200da0 <mm_destroy+0x26>
ffffffffc0200d88:	6118                	ld	a4,0(a0)
ffffffffc0200d8a:	651c                	ld	a5,8(a0)
ffffffffc0200d8c:	03000593          	li	a1,48
ffffffffc0200d90:	1501                	addi	a0,a0,-32
ffffffffc0200d92:	e71c                	sd	a5,8(a4)
ffffffffc0200d94:	e398                	sd	a4,0(a5)
ffffffffc0200d96:	05d020ef          	jal	ra,ffffffffc02035f2 <kfree>
ffffffffc0200d9a:	6408                	ld	a0,8(s0)
ffffffffc0200d9c:	fea416e3          	bne	s0,a0,ffffffffc0200d88 <mm_destroy+0xe>
ffffffffc0200da0:	8522                	mv	a0,s0
ffffffffc0200da2:	6402                	ld	s0,0(sp)
ffffffffc0200da4:	60a2                	ld	ra,8(sp)
ffffffffc0200da6:	03000593          	li	a1,48
ffffffffc0200daa:	0141                	addi	sp,sp,16
ffffffffc0200dac:	0470206f          	j	ffffffffc02035f2 <kfree>

ffffffffc0200db0 <vmm_init>:
ffffffffc0200db0:	715d                	addi	sp,sp,-80
ffffffffc0200db2:	e486                	sd	ra,72(sp)
ffffffffc0200db4:	e0a2                	sd	s0,64(sp)
ffffffffc0200db6:	fc26                	sd	s1,56(sp)
ffffffffc0200db8:	f84a                	sd	s2,48(sp)
ffffffffc0200dba:	f052                	sd	s4,32(sp)
ffffffffc0200dbc:	f44e                	sd	s3,40(sp)
ffffffffc0200dbe:	ec56                	sd	s5,24(sp)
ffffffffc0200dc0:	e85a                	sd	s6,16(sp)
ffffffffc0200dc2:	e45e                	sd	s7,8(sp)
ffffffffc0200dc4:	19f010ef          	jal	ra,ffffffffc0202762 <nr_free_pages>
ffffffffc0200dc8:	892a                	mv	s2,a0
ffffffffc0200dca:	199010ef          	jal	ra,ffffffffc0202762 <nr_free_pages>
ffffffffc0200dce:	8a2a                	mv	s4,a0
ffffffffc0200dd0:	e25ff0ef          	jal	ra,ffffffffc0200bf4 <mm_create>
ffffffffc0200dd4:	842a                	mv	s0,a0
ffffffffc0200dd6:	03200493          	li	s1,50
ffffffffc0200dda:	e919                	bnez	a0,ffffffffc0200df0 <vmm_init+0x40>
ffffffffc0200ddc:	aed5                	j	ffffffffc02011d0 <vmm_init+0x420>
ffffffffc0200dde:	e504                	sd	s1,8(a0)
ffffffffc0200de0:	e91c                	sd	a5,16(a0)
ffffffffc0200de2:	00053c23          	sd	zero,24(a0)
ffffffffc0200de6:	14ed                	addi	s1,s1,-5
ffffffffc0200de8:	8522                	mv	a0,s0
ffffffffc0200dea:	ec1ff0ef          	jal	ra,ffffffffc0200caa <insert_vma_struct>
ffffffffc0200dee:	c88d                	beqz	s1,ffffffffc0200e20 <vmm_init+0x70>
ffffffffc0200df0:	03000513          	li	a0,48
ffffffffc0200df4:	744020ef          	jal	ra,ffffffffc0203538 <kmalloc>
ffffffffc0200df8:	85aa                	mv	a1,a0
ffffffffc0200dfa:	00248793          	addi	a5,s1,2
ffffffffc0200dfe:	f165                	bnez	a0,ffffffffc0200dde <vmm_init+0x2e>
ffffffffc0200e00:	00004697          	auipc	a3,0x4
ffffffffc0200e04:	a9868693          	addi	a3,a3,-1384 # ffffffffc0204898 <etext+0xc04>
ffffffffc0200e08:	00003617          	auipc	a2,0x3
ffffffffc0200e0c:	5d860613          	addi	a2,a2,1496 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200e10:	0cd00593          	li	a1,205
ffffffffc0200e14:	00003517          	auipc	a0,0x3
ffffffffc0200e18:	7bc50513          	addi	a0,a0,1980 # ffffffffc02045d0 <etext+0x93c>
ffffffffc0200e1c:	ad0ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200e20:	03700493          	li	s1,55
ffffffffc0200e24:	1f900993          	li	s3,505
ffffffffc0200e28:	a819                	j	ffffffffc0200e3e <vmm_init+0x8e>
ffffffffc0200e2a:	e504                	sd	s1,8(a0)
ffffffffc0200e2c:	e91c                	sd	a5,16(a0)
ffffffffc0200e2e:	00053c23          	sd	zero,24(a0)
ffffffffc0200e32:	0495                	addi	s1,s1,5
ffffffffc0200e34:	8522                	mv	a0,s0
ffffffffc0200e36:	e75ff0ef          	jal	ra,ffffffffc0200caa <insert_vma_struct>
ffffffffc0200e3a:	03348a63          	beq	s1,s3,ffffffffc0200e6e <vmm_init+0xbe>
ffffffffc0200e3e:	03000513          	li	a0,48
ffffffffc0200e42:	6f6020ef          	jal	ra,ffffffffc0203538 <kmalloc>
ffffffffc0200e46:	85aa                	mv	a1,a0
ffffffffc0200e48:	00248793          	addi	a5,s1,2
ffffffffc0200e4c:	fd79                	bnez	a0,ffffffffc0200e2a <vmm_init+0x7a>
ffffffffc0200e4e:	00004697          	auipc	a3,0x4
ffffffffc0200e52:	a4a68693          	addi	a3,a3,-1462 # ffffffffc0204898 <etext+0xc04>
ffffffffc0200e56:	00003617          	auipc	a2,0x3
ffffffffc0200e5a:	58a60613          	addi	a2,a2,1418 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200e5e:	0d300593          	li	a1,211
ffffffffc0200e62:	00003517          	auipc	a0,0x3
ffffffffc0200e66:	76e50513          	addi	a0,a0,1902 # ffffffffc02045d0 <etext+0x93c>
ffffffffc0200e6a:	a82ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200e6e:	6418                	ld	a4,8(s0)
ffffffffc0200e70:	479d                	li	a5,7
ffffffffc0200e72:	1fb00593          	li	a1,507
ffffffffc0200e76:	28e40d63          	beq	s0,a4,ffffffffc0201110 <vmm_init+0x360>
ffffffffc0200e7a:	fe873683          	ld	a3,-24(a4)
ffffffffc0200e7e:	ffe78613          	addi	a2,a5,-2
ffffffffc0200e82:	20d61763          	bne	a2,a3,ffffffffc0201090 <vmm_init+0x2e0>
ffffffffc0200e86:	ff073683          	ld	a3,-16(a4)
ffffffffc0200e8a:	20d79363          	bne	a5,a3,ffffffffc0201090 <vmm_init+0x2e0>
ffffffffc0200e8e:	0795                	addi	a5,a5,5
ffffffffc0200e90:	6718                	ld	a4,8(a4)
ffffffffc0200e92:	feb792e3          	bne	a5,a1,ffffffffc0200e76 <vmm_init+0xc6>
ffffffffc0200e96:	4b1d                	li	s6,7
ffffffffc0200e98:	4495                	li	s1,5
ffffffffc0200e9a:	1f900b93          	li	s7,505
ffffffffc0200e9e:	85a6                	mv	a1,s1
ffffffffc0200ea0:	8522                	mv	a0,s0
ffffffffc0200ea2:	dc9ff0ef          	jal	ra,ffffffffc0200c6a <find_vma>
ffffffffc0200ea6:	8aaa                	mv	s5,a0
ffffffffc0200ea8:	2e050463          	beqz	a0,ffffffffc0201190 <vmm_init+0x3e0>
ffffffffc0200eac:	00148593          	addi	a1,s1,1
ffffffffc0200eb0:	8522                	mv	a0,s0
ffffffffc0200eb2:	db9ff0ef          	jal	ra,ffffffffc0200c6a <find_vma>
ffffffffc0200eb6:	89aa                	mv	s3,a0
ffffffffc0200eb8:	2a050c63          	beqz	a0,ffffffffc0201170 <vmm_init+0x3c0>
ffffffffc0200ebc:	85da                	mv	a1,s6
ffffffffc0200ebe:	8522                	mv	a0,s0
ffffffffc0200ec0:	dabff0ef          	jal	ra,ffffffffc0200c6a <find_vma>
ffffffffc0200ec4:	28051663          	bnez	a0,ffffffffc0201150 <vmm_init+0x3a0>
ffffffffc0200ec8:	00348593          	addi	a1,s1,3
ffffffffc0200ecc:	8522                	mv	a0,s0
ffffffffc0200ece:	d9dff0ef          	jal	ra,ffffffffc0200c6a <find_vma>
ffffffffc0200ed2:	24051f63          	bnez	a0,ffffffffc0201130 <vmm_init+0x380>
ffffffffc0200ed6:	00448593          	addi	a1,s1,4
ffffffffc0200eda:	8522                	mv	a0,s0
ffffffffc0200edc:	d8fff0ef          	jal	ra,ffffffffc0200c6a <find_vma>
ffffffffc0200ee0:	2c051863          	bnez	a0,ffffffffc02011b0 <vmm_init+0x400>
ffffffffc0200ee4:	008ab783          	ld	a5,8(s5)
ffffffffc0200ee8:	1c979463          	bne	a5,s1,ffffffffc02010b0 <vmm_init+0x300>
ffffffffc0200eec:	010ab783          	ld	a5,16(s5)
ffffffffc0200ef0:	1d679063          	bne	a5,s6,ffffffffc02010b0 <vmm_init+0x300>
ffffffffc0200ef4:	0089b783          	ld	a5,8(s3)
ffffffffc0200ef8:	1c979c63          	bne	a5,s1,ffffffffc02010d0 <vmm_init+0x320>
ffffffffc0200efc:	0109b783          	ld	a5,16(s3)
ffffffffc0200f00:	1d679863          	bne	a5,s6,ffffffffc02010d0 <vmm_init+0x320>
ffffffffc0200f04:	0495                	addi	s1,s1,5
ffffffffc0200f06:	0b15                	addi	s6,s6,5
ffffffffc0200f08:	f9749be3          	bne	s1,s7,ffffffffc0200e9e <vmm_init+0xee>
ffffffffc0200f0c:	4491                	li	s1,4
ffffffffc0200f0e:	59fd                	li	s3,-1
ffffffffc0200f10:	85a6                	mv	a1,s1
ffffffffc0200f12:	8522                	mv	a0,s0
ffffffffc0200f14:	d57ff0ef          	jal	ra,ffffffffc0200c6a <find_vma>
ffffffffc0200f18:	0004859b          	sext.w	a1,s1
ffffffffc0200f1c:	c90d                	beqz	a0,ffffffffc0200f4e <vmm_init+0x19e>
ffffffffc0200f1e:	6914                	ld	a3,16(a0)
ffffffffc0200f20:	6510                	ld	a2,8(a0)
ffffffffc0200f22:	00004517          	auipc	a0,0x4
ffffffffc0200f26:	82e50513          	addi	a0,a0,-2002 # ffffffffc0204750 <etext+0xabc>
ffffffffc0200f2a:	98cff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200f2e:	00004697          	auipc	a3,0x4
ffffffffc0200f32:	84a68693          	addi	a3,a3,-1974 # ffffffffc0204778 <etext+0xae4>
ffffffffc0200f36:	00003617          	auipc	a2,0x3
ffffffffc0200f3a:	4aa60613          	addi	a2,a2,1194 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0200f3e:	0f500593          	li	a1,245
ffffffffc0200f42:	00003517          	auipc	a0,0x3
ffffffffc0200f46:	68e50513          	addi	a0,a0,1678 # ffffffffc02045d0 <etext+0x93c>
ffffffffc0200f4a:	9a2ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200f4e:	14fd                	addi	s1,s1,-1
ffffffffc0200f50:	fd3490e3          	bne	s1,s3,ffffffffc0200f10 <vmm_init+0x160>
ffffffffc0200f54:	8522                	mv	a0,s0
ffffffffc0200f56:	e25ff0ef          	jal	ra,ffffffffc0200d7a <mm_destroy>
ffffffffc0200f5a:	009010ef          	jal	ra,ffffffffc0202762 <nr_free_pages>
ffffffffc0200f5e:	28aa1963          	bne	s4,a0,ffffffffc02011f0 <vmm_init+0x440>
ffffffffc0200f62:	00004517          	auipc	a0,0x4
ffffffffc0200f66:	85650513          	addi	a0,a0,-1962 # ffffffffc02047b8 <etext+0xb24>
ffffffffc0200f6a:	94cff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200f6e:	7f4010ef          	jal	ra,ffffffffc0202762 <nr_free_pages>
ffffffffc0200f72:	89aa                	mv	s3,a0
ffffffffc0200f74:	c81ff0ef          	jal	ra,ffffffffc0200bf4 <mm_create>
ffffffffc0200f78:	0000f797          	auipc	a5,0xf
ffffffffc0200f7c:	12a7b023          	sd	a0,288(a5) # ffffffffc0210098 <check_mm_struct>
ffffffffc0200f80:	842a                	mv	s0,a0
ffffffffc0200f82:	2a050763          	beqz	a0,ffffffffc0201230 <vmm_init+0x480>
ffffffffc0200f86:	0000fa17          	auipc	s4,0xf
ffffffffc0200f8a:	0e2a3a03          	ld	s4,226(s4) # ffffffffc0210068 <boot_pgdir>
ffffffffc0200f8e:	000a3783          	ld	a5,0(s4)
ffffffffc0200f92:	01453c23          	sd	s4,24(a0)
ffffffffc0200f96:	32079963          	bnez	a5,ffffffffc02012c8 <vmm_init+0x518>
ffffffffc0200f9a:	03000513          	li	a0,48
ffffffffc0200f9e:	59a020ef          	jal	ra,ffffffffc0203538 <kmalloc>
ffffffffc0200fa2:	84aa                	mv	s1,a0
ffffffffc0200fa4:	14050663          	beqz	a0,ffffffffc02010f0 <vmm_init+0x340>
ffffffffc0200fa8:	002007b7          	lui	a5,0x200
ffffffffc0200fac:	e89c                	sd	a5,16(s1)
ffffffffc0200fae:	4789                	li	a5,2
ffffffffc0200fb0:	85aa                	mv	a1,a0
ffffffffc0200fb2:	ec9c                	sd	a5,24(s1)
ffffffffc0200fb4:	8522                	mv	a0,s0
ffffffffc0200fb6:	0004b423          	sd	zero,8(s1)
ffffffffc0200fba:	cf1ff0ef          	jal	ra,ffffffffc0200caa <insert_vma_struct>
ffffffffc0200fbe:	10000593          	li	a1,256
ffffffffc0200fc2:	8522                	mv	a0,s0
ffffffffc0200fc4:	ca7ff0ef          	jal	ra,ffffffffc0200c6a <find_vma>
ffffffffc0200fc8:	10000793          	li	a5,256
ffffffffc0200fcc:	16400713          	li	a4,356
ffffffffc0200fd0:	2aa49063          	bne	s1,a0,ffffffffc0201270 <vmm_init+0x4c0>
ffffffffc0200fd4:	00f78023          	sb	a5,0(a5) # 200000 <kern_entry-0xffffffffc0000000>
ffffffffc0200fd8:	0785                	addi	a5,a5,1
ffffffffc0200fda:	fee79de3          	bne	a5,a4,ffffffffc0200fd4 <vmm_init+0x224>
ffffffffc0200fde:	6705                	lui	a4,0x1
ffffffffc0200fe0:	10000793          	li	a5,256
ffffffffc0200fe4:	35670713          	addi	a4,a4,854 # 1356 <kern_entry-0xffffffffc01fecaa>
ffffffffc0200fe8:	16400613          	li	a2,356
ffffffffc0200fec:	0007c683          	lbu	a3,0(a5)
ffffffffc0200ff0:	0785                	addi	a5,a5,1
ffffffffc0200ff2:	9f15                	subw	a4,a4,a3
ffffffffc0200ff4:	fec79ce3          	bne	a5,a2,ffffffffc0200fec <vmm_init+0x23c>
ffffffffc0200ff8:	2a071863          	bnez	a4,ffffffffc02012a8 <vmm_init+0x4f8>
ffffffffc0200ffc:	4581                	li	a1,0
ffffffffc0200ffe:	8552                	mv	a0,s4
ffffffffc0201000:	1ef010ef          	jal	ra,ffffffffc02029ee <page_remove>
ffffffffc0201004:	000a3783          	ld	a5,0(s4)
ffffffffc0201008:	0000f717          	auipc	a4,0xf
ffffffffc020100c:	06873703          	ld	a4,104(a4) # ffffffffc0210070 <npage>
ffffffffc0201010:	078a                	slli	a5,a5,0x2
ffffffffc0201012:	83b1                	srli	a5,a5,0xc
ffffffffc0201014:	26e7fe63          	bgeu	a5,a4,ffffffffc0201290 <vmm_init+0x4e0>
ffffffffc0201018:	00005517          	auipc	a0,0x5
ffffffffc020101c:	8e053503          	ld	a0,-1824(a0) # ffffffffc02058f8 <nbase>
ffffffffc0201020:	8f89                	sub	a5,a5,a0
ffffffffc0201022:	00379513          	slli	a0,a5,0x3
ffffffffc0201026:	97aa                	add	a5,a5,a0
ffffffffc0201028:	078e                	slli	a5,a5,0x3
ffffffffc020102a:	0000f517          	auipc	a0,0xf
ffffffffc020102e:	16e53503          	ld	a0,366(a0) # ffffffffc0210198 <pages>
ffffffffc0201032:	953e                	add	a0,a0,a5
ffffffffc0201034:	4585                	li	a1,1
ffffffffc0201036:	6ea010ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc020103a:	000a3023          	sd	zero,0(s4)
ffffffffc020103e:	8522                	mv	a0,s0
ffffffffc0201040:	00043c23          	sd	zero,24(s0)
ffffffffc0201044:	d37ff0ef          	jal	ra,ffffffffc0200d7a <mm_destroy>
ffffffffc0201048:	19fd                	addi	s3,s3,-1
ffffffffc020104a:	0000f797          	auipc	a5,0xf
ffffffffc020104e:	0407b723          	sd	zero,78(a5) # ffffffffc0210098 <check_mm_struct>
ffffffffc0201052:	710010ef          	jal	ra,ffffffffc0202762 <nr_free_pages>
ffffffffc0201056:	1aa99d63          	bne	s3,a0,ffffffffc0201210 <vmm_init+0x460>
ffffffffc020105a:	00004517          	auipc	a0,0x4
ffffffffc020105e:	80650513          	addi	a0,a0,-2042 # ffffffffc0204860 <etext+0xbcc>
ffffffffc0201062:	854ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201066:	6fc010ef          	jal	ra,ffffffffc0202762 <nr_free_pages>
ffffffffc020106a:	197d                	addi	s2,s2,-1
ffffffffc020106c:	1ea91263          	bne	s2,a0,ffffffffc0201250 <vmm_init+0x4a0>
ffffffffc0201070:	6406                	ld	s0,64(sp)
ffffffffc0201072:	60a6                	ld	ra,72(sp)
ffffffffc0201074:	74e2                	ld	s1,56(sp)
ffffffffc0201076:	7942                	ld	s2,48(sp)
ffffffffc0201078:	79a2                	ld	s3,40(sp)
ffffffffc020107a:	7a02                	ld	s4,32(sp)
ffffffffc020107c:	6ae2                	ld	s5,24(sp)
ffffffffc020107e:	6b42                	ld	s6,16(sp)
ffffffffc0201080:	6ba2                	ld	s7,8(sp)
ffffffffc0201082:	00003517          	auipc	a0,0x3
ffffffffc0201086:	7fe50513          	addi	a0,a0,2046 # ffffffffc0204880 <etext+0xbec>
ffffffffc020108a:	6161                	addi	sp,sp,80
ffffffffc020108c:	82aff06f          	j	ffffffffc02000b6 <cprintf>
ffffffffc0201090:	00003697          	auipc	a3,0x3
ffffffffc0201094:	5d868693          	addi	a3,a3,1496 # ffffffffc0204668 <etext+0x9d4>
ffffffffc0201098:	00003617          	auipc	a2,0x3
ffffffffc020109c:	34860613          	addi	a2,a2,840 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02010a0:	0dc00593          	li	a1,220
ffffffffc02010a4:	00003517          	auipc	a0,0x3
ffffffffc02010a8:	52c50513          	addi	a0,a0,1324 # ffffffffc02045d0 <etext+0x93c>
ffffffffc02010ac:	840ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02010b0:	00003697          	auipc	a3,0x3
ffffffffc02010b4:	64068693          	addi	a3,a3,1600 # ffffffffc02046f0 <etext+0xa5c>
ffffffffc02010b8:	00003617          	auipc	a2,0x3
ffffffffc02010bc:	32860613          	addi	a2,a2,808 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02010c0:	0ec00593          	li	a1,236
ffffffffc02010c4:	00003517          	auipc	a0,0x3
ffffffffc02010c8:	50c50513          	addi	a0,a0,1292 # ffffffffc02045d0 <etext+0x93c>
ffffffffc02010cc:	820ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02010d0:	00003697          	auipc	a3,0x3
ffffffffc02010d4:	65068693          	addi	a3,a3,1616 # ffffffffc0204720 <etext+0xa8c>
ffffffffc02010d8:	00003617          	auipc	a2,0x3
ffffffffc02010dc:	30860613          	addi	a2,a2,776 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02010e0:	0ed00593          	li	a1,237
ffffffffc02010e4:	00003517          	auipc	a0,0x3
ffffffffc02010e8:	4ec50513          	addi	a0,a0,1260 # ffffffffc02045d0 <etext+0x93c>
ffffffffc02010ec:	800ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02010f0:	00003697          	auipc	a3,0x3
ffffffffc02010f4:	7a868693          	addi	a3,a3,1960 # ffffffffc0204898 <etext+0xc04>
ffffffffc02010f8:	00003617          	auipc	a2,0x3
ffffffffc02010fc:	2e860613          	addi	a2,a2,744 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201100:	11000593          	li	a1,272
ffffffffc0201104:	00003517          	auipc	a0,0x3
ffffffffc0201108:	4cc50513          	addi	a0,a0,1228 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020110c:	fe1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201110:	00003697          	auipc	a3,0x3
ffffffffc0201114:	54068693          	addi	a3,a3,1344 # ffffffffc0204650 <etext+0x9bc>
ffffffffc0201118:	00003617          	auipc	a2,0x3
ffffffffc020111c:	2c860613          	addi	a2,a2,712 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201120:	0da00593          	li	a1,218
ffffffffc0201124:	00003517          	auipc	a0,0x3
ffffffffc0201128:	4ac50513          	addi	a0,a0,1196 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020112c:	fc1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201130:	00003697          	auipc	a3,0x3
ffffffffc0201134:	5a068693          	addi	a3,a3,1440 # ffffffffc02046d0 <etext+0xa3c>
ffffffffc0201138:	00003617          	auipc	a2,0x3
ffffffffc020113c:	2a860613          	addi	a2,a2,680 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201140:	0e800593          	li	a1,232
ffffffffc0201144:	00003517          	auipc	a0,0x3
ffffffffc0201148:	48c50513          	addi	a0,a0,1164 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020114c:	fa1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201150:	00003697          	auipc	a3,0x3
ffffffffc0201154:	57068693          	addi	a3,a3,1392 # ffffffffc02046c0 <etext+0xa2c>
ffffffffc0201158:	00003617          	auipc	a2,0x3
ffffffffc020115c:	28860613          	addi	a2,a2,648 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201160:	0e600593          	li	a1,230
ffffffffc0201164:	00003517          	auipc	a0,0x3
ffffffffc0201168:	46c50513          	addi	a0,a0,1132 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020116c:	f81fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201170:	00003697          	auipc	a3,0x3
ffffffffc0201174:	54068693          	addi	a3,a3,1344 # ffffffffc02046b0 <etext+0xa1c>
ffffffffc0201178:	00003617          	auipc	a2,0x3
ffffffffc020117c:	26860613          	addi	a2,a2,616 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201180:	0e400593          	li	a1,228
ffffffffc0201184:	00003517          	auipc	a0,0x3
ffffffffc0201188:	44c50513          	addi	a0,a0,1100 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020118c:	f61fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201190:	00003697          	auipc	a3,0x3
ffffffffc0201194:	51068693          	addi	a3,a3,1296 # ffffffffc02046a0 <etext+0xa0c>
ffffffffc0201198:	00003617          	auipc	a2,0x3
ffffffffc020119c:	24860613          	addi	a2,a2,584 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02011a0:	0e200593          	li	a1,226
ffffffffc02011a4:	00003517          	auipc	a0,0x3
ffffffffc02011a8:	42c50513          	addi	a0,a0,1068 # ffffffffc02045d0 <etext+0x93c>
ffffffffc02011ac:	f41fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02011b0:	00003697          	auipc	a3,0x3
ffffffffc02011b4:	53068693          	addi	a3,a3,1328 # ffffffffc02046e0 <etext+0xa4c>
ffffffffc02011b8:	00003617          	auipc	a2,0x3
ffffffffc02011bc:	22860613          	addi	a2,a2,552 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02011c0:	0ea00593          	li	a1,234
ffffffffc02011c4:	00003517          	auipc	a0,0x3
ffffffffc02011c8:	40c50513          	addi	a0,a0,1036 # ffffffffc02045d0 <etext+0x93c>
ffffffffc02011cc:	f21fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02011d0:	00003697          	auipc	a3,0x3
ffffffffc02011d4:	47068693          	addi	a3,a3,1136 # ffffffffc0204640 <etext+0x9ac>
ffffffffc02011d8:	00003617          	auipc	a2,0x3
ffffffffc02011dc:	20860613          	addi	a2,a2,520 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02011e0:	0c600593          	li	a1,198
ffffffffc02011e4:	00003517          	auipc	a0,0x3
ffffffffc02011e8:	3ec50513          	addi	a0,a0,1004 # ffffffffc02045d0 <etext+0x93c>
ffffffffc02011ec:	f01fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02011f0:	00003697          	auipc	a3,0x3
ffffffffc02011f4:	5a068693          	addi	a3,a3,1440 # ffffffffc0204790 <etext+0xafc>
ffffffffc02011f8:	00003617          	auipc	a2,0x3
ffffffffc02011fc:	1e860613          	addi	a2,a2,488 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201200:	0fa00593          	li	a1,250
ffffffffc0201204:	00003517          	auipc	a0,0x3
ffffffffc0201208:	3cc50513          	addi	a0,a0,972 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020120c:	ee1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201210:	00003697          	auipc	a3,0x3
ffffffffc0201214:	58068693          	addi	a3,a3,1408 # ffffffffc0204790 <etext+0xafc>
ffffffffc0201218:	00003617          	auipc	a2,0x3
ffffffffc020121c:	1c860613          	addi	a2,a2,456 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201220:	12c00593          	li	a1,300
ffffffffc0201224:	00003517          	auipc	a0,0x3
ffffffffc0201228:	3ac50513          	addi	a0,a0,940 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020122c:	ec1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201230:	00003697          	auipc	a3,0x3
ffffffffc0201234:	5a868693          	addi	a3,a3,1448 # ffffffffc02047d8 <etext+0xb44>
ffffffffc0201238:	00003617          	auipc	a2,0x3
ffffffffc020123c:	1a860613          	addi	a2,a2,424 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201240:	10900593          	li	a1,265
ffffffffc0201244:	00003517          	auipc	a0,0x3
ffffffffc0201248:	38c50513          	addi	a0,a0,908 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020124c:	ea1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201250:	00003697          	auipc	a3,0x3
ffffffffc0201254:	54068693          	addi	a3,a3,1344 # ffffffffc0204790 <etext+0xafc>
ffffffffc0201258:	00003617          	auipc	a2,0x3
ffffffffc020125c:	18860613          	addi	a2,a2,392 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201260:	0bc00593          	li	a1,188
ffffffffc0201264:	00003517          	auipc	a0,0x3
ffffffffc0201268:	36c50513          	addi	a0,a0,876 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020126c:	e81fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201270:	00003697          	auipc	a3,0x3
ffffffffc0201274:	59068693          	addi	a3,a3,1424 # ffffffffc0204800 <etext+0xb6c>
ffffffffc0201278:	00003617          	auipc	a2,0x3
ffffffffc020127c:	16860613          	addi	a2,a2,360 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201280:	11500593          	li	a1,277
ffffffffc0201284:	00003517          	auipc	a0,0x3
ffffffffc0201288:	34c50513          	addi	a0,a0,844 # ffffffffc02045d0 <etext+0x93c>
ffffffffc020128c:	e61fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201290:	00003617          	auipc	a2,0x3
ffffffffc0201294:	5a060613          	addi	a2,a2,1440 # ffffffffc0204830 <etext+0xb9c>
ffffffffc0201298:	06500593          	li	a1,101
ffffffffc020129c:	00003517          	auipc	a0,0x3
ffffffffc02012a0:	5b450513          	addi	a0,a0,1460 # ffffffffc0204850 <etext+0xbbc>
ffffffffc02012a4:	e49fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02012a8:	00003697          	auipc	a3,0x3
ffffffffc02012ac:	57868693          	addi	a3,a3,1400 # ffffffffc0204820 <etext+0xb8c>
ffffffffc02012b0:	00003617          	auipc	a2,0x3
ffffffffc02012b4:	13060613          	addi	a2,a2,304 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02012b8:	11f00593          	li	a1,287
ffffffffc02012bc:	00003517          	auipc	a0,0x3
ffffffffc02012c0:	31450513          	addi	a0,a0,788 # ffffffffc02045d0 <etext+0x93c>
ffffffffc02012c4:	e29fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02012c8:	00003697          	auipc	a3,0x3
ffffffffc02012cc:	52868693          	addi	a3,a3,1320 # ffffffffc02047f0 <etext+0xb5c>
ffffffffc02012d0:	00003617          	auipc	a2,0x3
ffffffffc02012d4:	11060613          	addi	a2,a2,272 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02012d8:	10c00593          	li	a1,268
ffffffffc02012dc:	00003517          	auipc	a0,0x3
ffffffffc02012e0:	2f450513          	addi	a0,a0,756 # ffffffffc02045d0 <etext+0x93c>
ffffffffc02012e4:	e09fe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02012e8 <do_pgfault>:
ffffffffc02012e8:	7179                	addi	sp,sp,-48
ffffffffc02012ea:	85b2                	mv	a1,a2
ffffffffc02012ec:	f022                	sd	s0,32(sp)
ffffffffc02012ee:	ec26                	sd	s1,24(sp)
ffffffffc02012f0:	f406                	sd	ra,40(sp)
ffffffffc02012f2:	e84a                	sd	s2,16(sp)
ffffffffc02012f4:	8432                	mv	s0,a2
ffffffffc02012f6:	84aa                	mv	s1,a0
ffffffffc02012f8:	973ff0ef          	jal	ra,ffffffffc0200c6a <find_vma>
ffffffffc02012fc:	0000f797          	auipc	a5,0xf
ffffffffc0201300:	d547a783          	lw	a5,-684(a5) # ffffffffc0210050 <pgfault_num>
ffffffffc0201304:	2785                	addiw	a5,a5,1
ffffffffc0201306:	0000f717          	auipc	a4,0xf
ffffffffc020130a:	d4f72523          	sw	a5,-694(a4) # ffffffffc0210050 <pgfault_num>
ffffffffc020130e:	c159                	beqz	a0,ffffffffc0201394 <do_pgfault+0xac>
ffffffffc0201310:	651c                	ld	a5,8(a0)
ffffffffc0201312:	08f46163          	bltu	s0,a5,ffffffffc0201394 <do_pgfault+0xac>
ffffffffc0201316:	6d1c                	ld	a5,24(a0)
ffffffffc0201318:	4941                	li	s2,16
ffffffffc020131a:	8b89                	andi	a5,a5,2
ffffffffc020131c:	ebb1                	bnez	a5,ffffffffc0201370 <do_pgfault+0x88>
ffffffffc020131e:	75fd                	lui	a1,0xfffff
ffffffffc0201320:	6c88                	ld	a0,24(s1)
ffffffffc0201322:	8c6d                	and	s0,s0,a1
ffffffffc0201324:	85a2                	mv	a1,s0
ffffffffc0201326:	4605                	li	a2,1
ffffffffc0201328:	476010ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc020132c:	610c                	ld	a1,0(a0)
ffffffffc020132e:	c1b9                	beqz	a1,ffffffffc0201374 <do_pgfault+0x8c>
ffffffffc0201330:	0000f797          	auipc	a5,0xf
ffffffffc0201334:	d307a783          	lw	a5,-720(a5) # ffffffffc0210060 <swap_init_ok>
ffffffffc0201338:	c7bd                	beqz	a5,ffffffffc02013a6 <do_pgfault+0xbe>
ffffffffc020133a:	85a2                	mv	a1,s0
ffffffffc020133c:	0030                	addi	a2,sp,8
ffffffffc020133e:	8526                	mv	a0,s1
ffffffffc0201340:	e402                	sd	zero,8(sp)
ffffffffc0201342:	7e2000ef          	jal	ra,ffffffffc0201b24 <swap_in>
ffffffffc0201346:	65a2                	ld	a1,8(sp)
ffffffffc0201348:	6c88                	ld	a0,24(s1)
ffffffffc020134a:	86ca                	mv	a3,s2
ffffffffc020134c:	8622                	mv	a2,s0
ffffffffc020134e:	70e010ef          	jal	ra,ffffffffc0202a5c <page_insert>
ffffffffc0201352:	6622                	ld	a2,8(sp)
ffffffffc0201354:	4685                	li	a3,1
ffffffffc0201356:	85a2                	mv	a1,s0
ffffffffc0201358:	8526                	mv	a0,s1
ffffffffc020135a:	6a8000ef          	jal	ra,ffffffffc0201a02 <swap_map_swappable>
ffffffffc020135e:	67a2                	ld	a5,8(sp)
ffffffffc0201360:	4501                	li	a0,0
ffffffffc0201362:	e3a0                	sd	s0,64(a5)
ffffffffc0201364:	70a2                	ld	ra,40(sp)
ffffffffc0201366:	7402                	ld	s0,32(sp)
ffffffffc0201368:	64e2                	ld	s1,24(sp)
ffffffffc020136a:	6942                	ld	s2,16(sp)
ffffffffc020136c:	6145                	addi	sp,sp,48
ffffffffc020136e:	8082                	ret
ffffffffc0201370:	4959                	li	s2,22
ffffffffc0201372:	b775                	j	ffffffffc020131e <do_pgfault+0x36>
ffffffffc0201374:	6c88                	ld	a0,24(s1)
ffffffffc0201376:	864a                	mv	a2,s2
ffffffffc0201378:	85a2                	mv	a1,s0
ffffffffc020137a:	132020ef          	jal	ra,ffffffffc02034ac <pgdir_alloc_page>
ffffffffc020137e:	87aa                	mv	a5,a0
ffffffffc0201380:	4501                	li	a0,0
ffffffffc0201382:	f3ed                	bnez	a5,ffffffffc0201364 <do_pgfault+0x7c>
ffffffffc0201384:	00003517          	auipc	a0,0x3
ffffffffc0201388:	55450513          	addi	a0,a0,1364 # ffffffffc02048d8 <etext+0xc44>
ffffffffc020138c:	d2bfe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201390:	5571                	li	a0,-4
ffffffffc0201392:	bfc9                	j	ffffffffc0201364 <do_pgfault+0x7c>
ffffffffc0201394:	85a2                	mv	a1,s0
ffffffffc0201396:	00003517          	auipc	a0,0x3
ffffffffc020139a:	51250513          	addi	a0,a0,1298 # ffffffffc02048a8 <etext+0xc14>
ffffffffc020139e:	d19fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02013a2:	5575                	li	a0,-3
ffffffffc02013a4:	b7c1                	j	ffffffffc0201364 <do_pgfault+0x7c>
ffffffffc02013a6:	00003517          	auipc	a0,0x3
ffffffffc02013aa:	55a50513          	addi	a0,a0,1370 # ffffffffc0204900 <etext+0xc6c>
ffffffffc02013ae:	d09fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02013b2:	5571                	li	a0,-4
ffffffffc02013b4:	bf45                	j	ffffffffc0201364 <do_pgfault+0x7c>

ffffffffc02013b6 <swap_init>:
ffffffffc02013b6:	7175                	addi	sp,sp,-144
ffffffffc02013b8:	e506                	sd	ra,136(sp)
ffffffffc02013ba:	e122                	sd	s0,128(sp)
ffffffffc02013bc:	fca6                	sd	s1,120(sp)
ffffffffc02013be:	f8ca                	sd	s2,112(sp)
ffffffffc02013c0:	f4ce                	sd	s3,104(sp)
ffffffffc02013c2:	f0d2                	sd	s4,96(sp)
ffffffffc02013c4:	ecd6                	sd	s5,88(sp)
ffffffffc02013c6:	e8da                	sd	s6,80(sp)
ffffffffc02013c8:	e4de                	sd	s7,72(sp)
ffffffffc02013ca:	e0e2                	sd	s8,64(sp)
ffffffffc02013cc:	fc66                	sd	s9,56(sp)
ffffffffc02013ce:	f86a                	sd	s10,48(sp)
ffffffffc02013d0:	f46e                	sd	s11,40(sp)
ffffffffc02013d2:	2d8020ef          	jal	ra,ffffffffc02036aa <swapfs_init>
ffffffffc02013d6:	0000f697          	auipc	a3,0xf
ffffffffc02013da:	d526b683          	ld	a3,-686(a3) # ffffffffc0210128 <max_swap_offset>
ffffffffc02013de:	010007b7          	lui	a5,0x1000
ffffffffc02013e2:	ff968713          	addi	a4,a3,-7
ffffffffc02013e6:	17e1                	addi	a5,a5,-8
ffffffffc02013e8:	3ce7ea63          	bltu	a5,a4,ffffffffc02017bc <swap_init+0x406>
ffffffffc02013ec:	00008797          	auipc	a5,0x8
ffffffffc02013f0:	c1478793          	addi	a5,a5,-1004 # ffffffffc0209000 <swap_manager_lru>
ffffffffc02013f4:	6798                	ld	a4,8(a5)
ffffffffc02013f6:	0000fa97          	auipc	s5,0xf
ffffffffc02013fa:	c62a8a93          	addi	s5,s5,-926 # ffffffffc0210058 <sm>
ffffffffc02013fe:	00fab023          	sd	a5,0(s5)
ffffffffc0201402:	9702                	jalr	a4
ffffffffc0201404:	84aa                	mv	s1,a0
ffffffffc0201406:	c10d                	beqz	a0,ffffffffc0201428 <swap_init+0x72>
ffffffffc0201408:	60aa                	ld	ra,136(sp)
ffffffffc020140a:	640a                	ld	s0,128(sp)
ffffffffc020140c:	7946                	ld	s2,112(sp)
ffffffffc020140e:	79a6                	ld	s3,104(sp)
ffffffffc0201410:	7a06                	ld	s4,96(sp)
ffffffffc0201412:	6ae6                	ld	s5,88(sp)
ffffffffc0201414:	6b46                	ld	s6,80(sp)
ffffffffc0201416:	6ba6                	ld	s7,72(sp)
ffffffffc0201418:	6c06                	ld	s8,64(sp)
ffffffffc020141a:	7ce2                	ld	s9,56(sp)
ffffffffc020141c:	7d42                	ld	s10,48(sp)
ffffffffc020141e:	7da2                	ld	s11,40(sp)
ffffffffc0201420:	8526                	mv	a0,s1
ffffffffc0201422:	74e6                	ld	s1,120(sp)
ffffffffc0201424:	6149                	addi	sp,sp,144
ffffffffc0201426:	8082                	ret
ffffffffc0201428:	000ab783          	ld	a5,0(s5)
ffffffffc020142c:	00003517          	auipc	a0,0x3
ffffffffc0201430:	52c50513          	addi	a0,a0,1324 # ffffffffc0204958 <etext+0xcc4>
ffffffffc0201434:	0000f417          	auipc	s0,0xf
ffffffffc0201438:	d3440413          	addi	s0,s0,-716 # ffffffffc0210168 <free_area>
ffffffffc020143c:	638c                	ld	a1,0(a5)
ffffffffc020143e:	4785                	li	a5,1
ffffffffc0201440:	0000f717          	auipc	a4,0xf
ffffffffc0201444:	c2f72023          	sw	a5,-992(a4) # ffffffffc0210060 <swap_init_ok>
ffffffffc0201448:	c6ffe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020144c:	641c                	ld	a5,8(s0)
ffffffffc020144e:	4901                	li	s2,0
ffffffffc0201450:	4981                	li	s3,0
ffffffffc0201452:	28878b63          	beq	a5,s0,ffffffffc02016e8 <swap_init+0x332>
ffffffffc0201456:	fe87b703          	ld	a4,-24(a5)
ffffffffc020145a:	8b09                	andi	a4,a4,2
ffffffffc020145c:	28070863          	beqz	a4,ffffffffc02016ec <swap_init+0x336>
ffffffffc0201460:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201464:	679c                	ld	a5,8(a5)
ffffffffc0201466:	2985                	addiw	s3,s3,1
ffffffffc0201468:	0127093b          	addw	s2,a4,s2
ffffffffc020146c:	fe8795e3          	bne	a5,s0,ffffffffc0201456 <swap_init+0xa0>
ffffffffc0201470:	8a4a                	mv	s4,s2
ffffffffc0201472:	2f0010ef          	jal	ra,ffffffffc0202762 <nr_free_pages>
ffffffffc0201476:	55451f63          	bne	a0,s4,ffffffffc02019d4 <swap_init+0x61e>
ffffffffc020147a:	864a                	mv	a2,s2
ffffffffc020147c:	85ce                	mv	a1,s3
ffffffffc020147e:	00003517          	auipc	a0,0x3
ffffffffc0201482:	52250513          	addi	a0,a0,1314 # ffffffffc02049a0 <etext+0xd0c>
ffffffffc0201486:	c31fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020148a:	f6aff0ef          	jal	ra,ffffffffc0200bf4 <mm_create>
ffffffffc020148e:	8a2a                	mv	s4,a0
ffffffffc0201490:	4c050263          	beqz	a0,ffffffffc0201954 <swap_init+0x59e>
ffffffffc0201494:	0000f797          	auipc	a5,0xf
ffffffffc0201498:	c0478793          	addi	a5,a5,-1020 # ffffffffc0210098 <check_mm_struct>
ffffffffc020149c:	6398                	ld	a4,0(a5)
ffffffffc020149e:	4c071b63          	bnez	a4,ffffffffc0201974 <swap_init+0x5be>
ffffffffc02014a2:	0000fb17          	auipc	s6,0xf
ffffffffc02014a6:	bc6b3b03          	ld	s6,-1082(s6) # ffffffffc0210068 <boot_pgdir>
ffffffffc02014aa:	000b3703          	ld	a4,0(s6)
ffffffffc02014ae:	e388                	sd	a0,0(a5)
ffffffffc02014b0:	01653c23          	sd	s6,24(a0)
ffffffffc02014b4:	4e071063          	bnez	a4,ffffffffc0201994 <swap_init+0x5de>
ffffffffc02014b8:	6599                	lui	a1,0x6
ffffffffc02014ba:	460d                	li	a2,3
ffffffffc02014bc:	6505                	lui	a0,0x1
ffffffffc02014be:	f7eff0ef          	jal	ra,ffffffffc0200c3c <vma_create>
ffffffffc02014c2:	85aa                	mv	a1,a0
ffffffffc02014c4:	4e050863          	beqz	a0,ffffffffc02019b4 <swap_init+0x5fe>
ffffffffc02014c8:	8552                	mv	a0,s4
ffffffffc02014ca:	fe0ff0ef          	jal	ra,ffffffffc0200caa <insert_vma_struct>
ffffffffc02014ce:	00003517          	auipc	a0,0x3
ffffffffc02014d2:	51250513          	addi	a0,a0,1298 # ffffffffc02049e0 <etext+0xd4c>
ffffffffc02014d6:	be1fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02014da:	018a3503          	ld	a0,24(s4)
ffffffffc02014de:	4605                	li	a2,1
ffffffffc02014e0:	6585                	lui	a1,0x1
ffffffffc02014e2:	2bc010ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc02014e6:	3c050763          	beqz	a0,ffffffffc02018b4 <swap_init+0x4fe>
ffffffffc02014ea:	00003517          	auipc	a0,0x3
ffffffffc02014ee:	54650513          	addi	a0,a0,1350 # ffffffffc0204a30 <etext+0xd9c>
ffffffffc02014f2:	0000f917          	auipc	s2,0xf
ffffffffc02014f6:	bae90913          	addi	s2,s2,-1106 # ffffffffc02100a0 <check_rp>
ffffffffc02014fa:	bbdfe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02014fe:	0000f997          	auipc	s3,0xf
ffffffffc0201502:	bc298993          	addi	s3,s3,-1086 # ffffffffc02100c0 <swap_in_seq_no>
ffffffffc0201506:	8bca                	mv	s7,s2
ffffffffc0201508:	4505                	li	a0,1
ffffffffc020150a:	184010ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc020150e:	00abb023          	sd	a0,0(s7)
ffffffffc0201512:	26050563          	beqz	a0,ffffffffc020177c <swap_init+0x3c6>
ffffffffc0201516:	651c                	ld	a5,8(a0)
ffffffffc0201518:	8b89                	andi	a5,a5,2
ffffffffc020151a:	24079163          	bnez	a5,ffffffffc020175c <swap_init+0x3a6>
ffffffffc020151e:	0ba1                	addi	s7,s7,8
ffffffffc0201520:	ff3b94e3          	bne	s7,s3,ffffffffc0201508 <swap_init+0x152>
ffffffffc0201524:	601c                	ld	a5,0(s0)
ffffffffc0201526:	0000fb97          	auipc	s7,0xf
ffffffffc020152a:	b7ab8b93          	addi	s7,s7,-1158 # ffffffffc02100a0 <check_rp>
ffffffffc020152e:	e000                	sd	s0,0(s0)
ffffffffc0201530:	e43e                	sd	a5,8(sp)
ffffffffc0201532:	641c                	ld	a5,8(s0)
ffffffffc0201534:	e400                	sd	s0,8(s0)
ffffffffc0201536:	e83e                	sd	a5,16(sp)
ffffffffc0201538:	481c                	lw	a5,16(s0)
ffffffffc020153a:	ec3e                	sd	a5,24(sp)
ffffffffc020153c:	0000f797          	auipc	a5,0xf
ffffffffc0201540:	c207ae23          	sw	zero,-964(a5) # ffffffffc0210178 <free_area+0x10>
ffffffffc0201544:	000bb503          	ld	a0,0(s7)
ffffffffc0201548:	4585                	li	a1,1
ffffffffc020154a:	0ba1                	addi	s7,s7,8
ffffffffc020154c:	1d4010ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201550:	ff3b9ae3          	bne	s7,s3,ffffffffc0201544 <swap_init+0x18e>
ffffffffc0201554:	01042b83          	lw	s7,16(s0)
ffffffffc0201558:	4791                	li	a5,4
ffffffffc020155a:	32fb9d63          	bne	s7,a5,ffffffffc0201894 <swap_init+0x4de>
ffffffffc020155e:	00003517          	auipc	a0,0x3
ffffffffc0201562:	55a50513          	addi	a0,a0,1370 # ffffffffc0204ab8 <etext+0xe24>
ffffffffc0201566:	b51fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020156a:	6705                	lui	a4,0x1
ffffffffc020156c:	0000f797          	auipc	a5,0xf
ffffffffc0201570:	ae07a223          	sw	zero,-1308(a5) # ffffffffc0210050 <pgfault_num>
ffffffffc0201574:	4629                	li	a2,10
ffffffffc0201576:	00c70023          	sb	a2,0(a4) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc020157a:	0000f697          	auipc	a3,0xf
ffffffffc020157e:	ad66a683          	lw	a3,-1322(a3) # ffffffffc0210050 <pgfault_num>
ffffffffc0201582:	4585                	li	a1,1
ffffffffc0201584:	0000f797          	auipc	a5,0xf
ffffffffc0201588:	acc78793          	addi	a5,a5,-1332 # ffffffffc0210050 <pgfault_num>
ffffffffc020158c:	2cb69463          	bne	a3,a1,ffffffffc0201854 <swap_init+0x49e>
ffffffffc0201590:	00c70823          	sb	a2,16(a4)
ffffffffc0201594:	4398                	lw	a4,0(a5)
ffffffffc0201596:	2701                	sext.w	a4,a4
ffffffffc0201598:	2cd71e63          	bne	a4,a3,ffffffffc0201874 <swap_init+0x4be>
ffffffffc020159c:	6689                	lui	a3,0x2
ffffffffc020159e:	462d                	li	a2,11
ffffffffc02015a0:	00c68023          	sb	a2,0(a3) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc02015a4:	4398                	lw	a4,0(a5)
ffffffffc02015a6:	4589                	li	a1,2
ffffffffc02015a8:	2701                	sext.w	a4,a4
ffffffffc02015aa:	22b71563          	bne	a4,a1,ffffffffc02017d4 <swap_init+0x41e>
ffffffffc02015ae:	00c68823          	sb	a2,16(a3)
ffffffffc02015b2:	4394                	lw	a3,0(a5)
ffffffffc02015b4:	2681                	sext.w	a3,a3
ffffffffc02015b6:	22e69f63          	bne	a3,a4,ffffffffc02017f4 <swap_init+0x43e>
ffffffffc02015ba:	668d                	lui	a3,0x3
ffffffffc02015bc:	4631                	li	a2,12
ffffffffc02015be:	00c68023          	sb	a2,0(a3) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc02015c2:	4398                	lw	a4,0(a5)
ffffffffc02015c4:	458d                	li	a1,3
ffffffffc02015c6:	2701                	sext.w	a4,a4
ffffffffc02015c8:	24b71663          	bne	a4,a1,ffffffffc0201814 <swap_init+0x45e>
ffffffffc02015cc:	00c68823          	sb	a2,16(a3)
ffffffffc02015d0:	4394                	lw	a3,0(a5)
ffffffffc02015d2:	2681                	sext.w	a3,a3
ffffffffc02015d4:	26e69063          	bne	a3,a4,ffffffffc0201834 <swap_init+0x47e>
ffffffffc02015d8:	6691                	lui	a3,0x4
ffffffffc02015da:	4635                	li	a2,13
ffffffffc02015dc:	00c68023          	sb	a2,0(a3) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc02015e0:	4398                	lw	a4,0(a5)
ffffffffc02015e2:	2701                	sext.w	a4,a4
ffffffffc02015e4:	2f771863          	bne	a4,s7,ffffffffc02018d4 <swap_init+0x51e>
ffffffffc02015e8:	00c68823          	sb	a2,16(a3)
ffffffffc02015ec:	439c                	lw	a5,0(a5)
ffffffffc02015ee:	2781                	sext.w	a5,a5
ffffffffc02015f0:	30e79263          	bne	a5,a4,ffffffffc02018f4 <swap_init+0x53e>
ffffffffc02015f4:	481c                	lw	a5,16(s0)
ffffffffc02015f6:	30079f63          	bnez	a5,ffffffffc0201914 <swap_init+0x55e>
ffffffffc02015fa:	0000f797          	auipc	a5,0xf
ffffffffc02015fe:	ac678793          	addi	a5,a5,-1338 # ffffffffc02100c0 <swap_in_seq_no>
ffffffffc0201602:	0000f717          	auipc	a4,0xf
ffffffffc0201606:	ae670713          	addi	a4,a4,-1306 # ffffffffc02100e8 <swap_out_seq_no>
ffffffffc020160a:	0000f617          	auipc	a2,0xf
ffffffffc020160e:	ade60613          	addi	a2,a2,-1314 # ffffffffc02100e8 <swap_out_seq_no>
ffffffffc0201612:	56fd                	li	a3,-1
ffffffffc0201614:	c394                	sw	a3,0(a5)
ffffffffc0201616:	c314                	sw	a3,0(a4)
ffffffffc0201618:	0791                	addi	a5,a5,4
ffffffffc020161a:	0711                	addi	a4,a4,4
ffffffffc020161c:	fef61ce3          	bne	a2,a5,ffffffffc0201614 <swap_init+0x25e>
ffffffffc0201620:	0000f697          	auipc	a3,0xf
ffffffffc0201624:	b2868693          	addi	a3,a3,-1240 # ffffffffc0210148 <check_ptep>
ffffffffc0201628:	0000fc17          	auipc	s8,0xf
ffffffffc020162c:	a78c0c13          	addi	s8,s8,-1416 # ffffffffc02100a0 <check_rp>
ffffffffc0201630:	6b85                	lui	s7,0x1
ffffffffc0201632:	0000fd97          	auipc	s11,0xf
ffffffffc0201636:	a3ed8d93          	addi	s11,s11,-1474 # ffffffffc0210070 <npage>
ffffffffc020163a:	0000fd17          	auipc	s10,0xf
ffffffffc020163e:	b5ed0d13          	addi	s10,s10,-1186 # ffffffffc0210198 <pages>
ffffffffc0201642:	00004c97          	auipc	s9,0x4
ffffffffc0201646:	2b6c8c93          	addi	s9,s9,694 # ffffffffc02058f8 <nbase>
ffffffffc020164a:	0006b023          	sd	zero,0(a3)
ffffffffc020164e:	4601                	li	a2,0
ffffffffc0201650:	85de                	mv	a1,s7
ffffffffc0201652:	855a                	mv	a0,s6
ffffffffc0201654:	e036                	sd	a3,0(sp)
ffffffffc0201656:	148010ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc020165a:	6682                	ld	a3,0(sp)
ffffffffc020165c:	e288                	sd	a0,0(a3)
ffffffffc020165e:	12050f63          	beqz	a0,ffffffffc020179c <swap_init+0x3e6>
ffffffffc0201662:	611c                	ld	a5,0(a0)
ffffffffc0201664:	0017f713          	andi	a4,a5,1
ffffffffc0201668:	c371                	beqz	a4,ffffffffc020172c <swap_init+0x376>
ffffffffc020166a:	000db703          	ld	a4,0(s11)
ffffffffc020166e:	078a                	slli	a5,a5,0x2
ffffffffc0201670:	83b1                	srli	a5,a5,0xc
ffffffffc0201672:	0ce7f963          	bgeu	a5,a4,ffffffffc0201744 <swap_init+0x38e>
ffffffffc0201676:	000cb703          	ld	a4,0(s9)
ffffffffc020167a:	000d3603          	ld	a2,0(s10)
ffffffffc020167e:	000c3503          	ld	a0,0(s8)
ffffffffc0201682:	8f99                	sub	a5,a5,a4
ffffffffc0201684:	00379713          	slli	a4,a5,0x3
ffffffffc0201688:	97ba                	add	a5,a5,a4
ffffffffc020168a:	078e                	slli	a5,a5,0x3
ffffffffc020168c:	97b2                	add	a5,a5,a2
ffffffffc020168e:	06f51f63          	bne	a0,a5,ffffffffc020170c <swap_init+0x356>
ffffffffc0201692:	6785                	lui	a5,0x1
ffffffffc0201694:	9bbe                	add	s7,s7,a5
ffffffffc0201696:	6795                	lui	a5,0x5
ffffffffc0201698:	06a1                	addi	a3,a3,8
ffffffffc020169a:	0c21                	addi	s8,s8,8
ffffffffc020169c:	fafb97e3          	bne	s7,a5,ffffffffc020164a <swap_init+0x294>
ffffffffc02016a0:	00003517          	auipc	a0,0x3
ffffffffc02016a4:	4f850513          	addi	a0,a0,1272 # ffffffffc0204b98 <etext+0xf04>
ffffffffc02016a8:	a0ffe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02016ac:	000ab783          	ld	a5,0(s5)
ffffffffc02016b0:	7f9c                	ld	a5,56(a5)
ffffffffc02016b2:	9782                	jalr	a5
ffffffffc02016b4:	28051063          	bnez	a0,ffffffffc0201934 <swap_init+0x57e>
ffffffffc02016b8:	00093503          	ld	a0,0(s2)
ffffffffc02016bc:	4585                	li	a1,1
ffffffffc02016be:	0921                	addi	s2,s2,8
ffffffffc02016c0:	060010ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc02016c4:	ff391ae3          	bne	s2,s3,ffffffffc02016b8 <swap_init+0x302>
ffffffffc02016c8:	8552                	mv	a0,s4
ffffffffc02016ca:	eb0ff0ef          	jal	ra,ffffffffc0200d7a <mm_destroy>
ffffffffc02016ce:	67e2                	ld	a5,24(sp)
ffffffffc02016d0:	00003517          	auipc	a0,0x3
ffffffffc02016d4:	4f850513          	addi	a0,a0,1272 # ffffffffc0204bc8 <etext+0xf34>
ffffffffc02016d8:	c81c                	sw	a5,16(s0)
ffffffffc02016da:	67a2                	ld	a5,8(sp)
ffffffffc02016dc:	e01c                	sd	a5,0(s0)
ffffffffc02016de:	67c2                	ld	a5,16(sp)
ffffffffc02016e0:	e41c                	sd	a5,8(s0)
ffffffffc02016e2:	9d5fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02016e6:	b30d                	j	ffffffffc0201408 <swap_init+0x52>
ffffffffc02016e8:	4a01                	li	s4,0
ffffffffc02016ea:	b361                	j	ffffffffc0201472 <swap_init+0xbc>
ffffffffc02016ec:	00003697          	auipc	a3,0x3
ffffffffc02016f0:	28468693          	addi	a3,a3,644 # ffffffffc0204970 <etext+0xcdc>
ffffffffc02016f4:	00003617          	auipc	a2,0x3
ffffffffc02016f8:	cec60613          	addi	a2,a2,-788 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02016fc:	0c500593          	li	a1,197
ffffffffc0201700:	00003517          	auipc	a0,0x3
ffffffffc0201704:	24850513          	addi	a0,a0,584 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201708:	9e5fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020170c:	00003697          	auipc	a3,0x3
ffffffffc0201710:	46468693          	addi	a3,a3,1124 # ffffffffc0204b70 <etext+0xedc>
ffffffffc0201714:	00003617          	auipc	a2,0x3
ffffffffc0201718:	ccc60613          	addi	a2,a2,-820 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020171c:	10400593          	li	a1,260
ffffffffc0201720:	00003517          	auipc	a0,0x3
ffffffffc0201724:	22850513          	addi	a0,a0,552 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201728:	9c5fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020172c:	00003617          	auipc	a2,0x3
ffffffffc0201730:	41c60613          	addi	a2,a2,1052 # ffffffffc0204b48 <etext+0xeb4>
ffffffffc0201734:	07000593          	li	a1,112
ffffffffc0201738:	00003517          	auipc	a0,0x3
ffffffffc020173c:	11850513          	addi	a0,a0,280 # ffffffffc0204850 <etext+0xbbc>
ffffffffc0201740:	9adfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201744:	00003617          	auipc	a2,0x3
ffffffffc0201748:	0ec60613          	addi	a2,a2,236 # ffffffffc0204830 <etext+0xb9c>
ffffffffc020174c:	06500593          	li	a1,101
ffffffffc0201750:	00003517          	auipc	a0,0x3
ffffffffc0201754:	10050513          	addi	a0,a0,256 # ffffffffc0204850 <etext+0xbbc>
ffffffffc0201758:	995fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020175c:	00003697          	auipc	a3,0x3
ffffffffc0201760:	31468693          	addi	a3,a3,788 # ffffffffc0204a70 <etext+0xddc>
ffffffffc0201764:	00003617          	auipc	a2,0x3
ffffffffc0201768:	c7c60613          	addi	a2,a2,-900 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020176c:	0e600593          	li	a1,230
ffffffffc0201770:	00003517          	auipc	a0,0x3
ffffffffc0201774:	1d850513          	addi	a0,a0,472 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201778:	975fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020177c:	00003697          	auipc	a3,0x3
ffffffffc0201780:	2dc68693          	addi	a3,a3,732 # ffffffffc0204a58 <etext+0xdc4>
ffffffffc0201784:	00003617          	auipc	a2,0x3
ffffffffc0201788:	c5c60613          	addi	a2,a2,-932 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020178c:	0e500593          	li	a1,229
ffffffffc0201790:	00003517          	auipc	a0,0x3
ffffffffc0201794:	1b850513          	addi	a0,a0,440 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201798:	955fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020179c:	00003697          	auipc	a3,0x3
ffffffffc02017a0:	39468693          	addi	a3,a3,916 # ffffffffc0204b30 <etext+0xe9c>
ffffffffc02017a4:	00003617          	auipc	a2,0x3
ffffffffc02017a8:	c3c60613          	addi	a2,a2,-964 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02017ac:	10300593          	li	a1,259
ffffffffc02017b0:	00003517          	auipc	a0,0x3
ffffffffc02017b4:	19850513          	addi	a0,a0,408 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02017b8:	935fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02017bc:	00003617          	auipc	a2,0x3
ffffffffc02017c0:	16c60613          	addi	a2,a2,364 # ffffffffc0204928 <etext+0xc94>
ffffffffc02017c4:	02800593          	li	a1,40
ffffffffc02017c8:	00003517          	auipc	a0,0x3
ffffffffc02017cc:	18050513          	addi	a0,a0,384 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02017d0:	91dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02017d4:	00003697          	auipc	a3,0x3
ffffffffc02017d8:	31c68693          	addi	a3,a3,796 # ffffffffc0204af0 <etext+0xe5c>
ffffffffc02017dc:	00003617          	auipc	a2,0x3
ffffffffc02017e0:	c0460613          	addi	a2,a2,-1020 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02017e4:	0a000593          	li	a1,160
ffffffffc02017e8:	00003517          	auipc	a0,0x3
ffffffffc02017ec:	16050513          	addi	a0,a0,352 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02017f0:	8fdfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02017f4:	00003697          	auipc	a3,0x3
ffffffffc02017f8:	2fc68693          	addi	a3,a3,764 # ffffffffc0204af0 <etext+0xe5c>
ffffffffc02017fc:	00003617          	auipc	a2,0x3
ffffffffc0201800:	be460613          	addi	a2,a2,-1052 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201804:	0a200593          	li	a1,162
ffffffffc0201808:	00003517          	auipc	a0,0x3
ffffffffc020180c:	14050513          	addi	a0,a0,320 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201810:	8ddfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201814:	00003697          	auipc	a3,0x3
ffffffffc0201818:	2ec68693          	addi	a3,a3,748 # ffffffffc0204b00 <etext+0xe6c>
ffffffffc020181c:	00003617          	auipc	a2,0x3
ffffffffc0201820:	bc460613          	addi	a2,a2,-1084 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201824:	0a400593          	li	a1,164
ffffffffc0201828:	00003517          	auipc	a0,0x3
ffffffffc020182c:	12050513          	addi	a0,a0,288 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201830:	8bdfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201834:	00003697          	auipc	a3,0x3
ffffffffc0201838:	2cc68693          	addi	a3,a3,716 # ffffffffc0204b00 <etext+0xe6c>
ffffffffc020183c:	00003617          	auipc	a2,0x3
ffffffffc0201840:	ba460613          	addi	a2,a2,-1116 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201844:	0a600593          	li	a1,166
ffffffffc0201848:	00003517          	auipc	a0,0x3
ffffffffc020184c:	10050513          	addi	a0,a0,256 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201850:	89dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201854:	00003697          	auipc	a3,0x3
ffffffffc0201858:	28c68693          	addi	a3,a3,652 # ffffffffc0204ae0 <etext+0xe4c>
ffffffffc020185c:	00003617          	auipc	a2,0x3
ffffffffc0201860:	b8460613          	addi	a2,a2,-1148 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201864:	09c00593          	li	a1,156
ffffffffc0201868:	00003517          	auipc	a0,0x3
ffffffffc020186c:	0e050513          	addi	a0,a0,224 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201870:	87dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201874:	00003697          	auipc	a3,0x3
ffffffffc0201878:	26c68693          	addi	a3,a3,620 # ffffffffc0204ae0 <etext+0xe4c>
ffffffffc020187c:	00003617          	auipc	a2,0x3
ffffffffc0201880:	b6460613          	addi	a2,a2,-1180 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201884:	09e00593          	li	a1,158
ffffffffc0201888:	00003517          	auipc	a0,0x3
ffffffffc020188c:	0c050513          	addi	a0,a0,192 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201890:	85dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201894:	00003697          	auipc	a3,0x3
ffffffffc0201898:	1fc68693          	addi	a3,a3,508 # ffffffffc0204a90 <etext+0xdfc>
ffffffffc020189c:	00003617          	auipc	a2,0x3
ffffffffc02018a0:	b4460613          	addi	a2,a2,-1212 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02018a4:	0f300593          	li	a1,243
ffffffffc02018a8:	00003517          	auipc	a0,0x3
ffffffffc02018ac:	0a050513          	addi	a0,a0,160 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02018b0:	83dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02018b4:	00003697          	auipc	a3,0x3
ffffffffc02018b8:	16468693          	addi	a3,a3,356 # ffffffffc0204a18 <etext+0xd84>
ffffffffc02018bc:	00003617          	auipc	a2,0x3
ffffffffc02018c0:	b2460613          	addi	a2,a2,-1244 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02018c4:	0e000593          	li	a1,224
ffffffffc02018c8:	00003517          	auipc	a0,0x3
ffffffffc02018cc:	08050513          	addi	a0,a0,128 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02018d0:	81dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02018d4:	00003697          	auipc	a3,0x3
ffffffffc02018d8:	23c68693          	addi	a3,a3,572 # ffffffffc0204b10 <etext+0xe7c>
ffffffffc02018dc:	00003617          	auipc	a2,0x3
ffffffffc02018e0:	b0460613          	addi	a2,a2,-1276 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02018e4:	0a800593          	li	a1,168
ffffffffc02018e8:	00003517          	auipc	a0,0x3
ffffffffc02018ec:	06050513          	addi	a0,a0,96 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02018f0:	ffcfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02018f4:	00003697          	auipc	a3,0x3
ffffffffc02018f8:	21c68693          	addi	a3,a3,540 # ffffffffc0204b10 <etext+0xe7c>
ffffffffc02018fc:	00003617          	auipc	a2,0x3
ffffffffc0201900:	ae460613          	addi	a2,a2,-1308 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201904:	0aa00593          	li	a1,170
ffffffffc0201908:	00003517          	auipc	a0,0x3
ffffffffc020190c:	04050513          	addi	a0,a0,64 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201910:	fdcfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201914:	00003697          	auipc	a3,0x3
ffffffffc0201918:	20c68693          	addi	a3,a3,524 # ffffffffc0204b20 <etext+0xe8c>
ffffffffc020191c:	00003617          	auipc	a2,0x3
ffffffffc0201920:	ac460613          	addi	a2,a2,-1340 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201924:	0fc00593          	li	a1,252
ffffffffc0201928:	00003517          	auipc	a0,0x3
ffffffffc020192c:	02050513          	addi	a0,a0,32 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201930:	fbcfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201934:	00003697          	auipc	a3,0x3
ffffffffc0201938:	28c68693          	addi	a3,a3,652 # ffffffffc0204bc0 <etext+0xf2c>
ffffffffc020193c:	00003617          	auipc	a2,0x3
ffffffffc0201940:	aa460613          	addi	a2,a2,-1372 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201944:	10b00593          	li	a1,267
ffffffffc0201948:	00003517          	auipc	a0,0x3
ffffffffc020194c:	00050513          	mv	a0,a0
ffffffffc0201950:	f9cfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201954:	00003697          	auipc	a3,0x3
ffffffffc0201958:	cec68693          	addi	a3,a3,-788 # ffffffffc0204640 <etext+0x9ac>
ffffffffc020195c:	00003617          	auipc	a2,0x3
ffffffffc0201960:	a8460613          	addi	a2,a2,-1404 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201964:	0cd00593          	li	a1,205
ffffffffc0201968:	00003517          	auipc	a0,0x3
ffffffffc020196c:	fe050513          	addi	a0,a0,-32 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201970:	f7cfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201974:	00003697          	auipc	a3,0x3
ffffffffc0201978:	05468693          	addi	a3,a3,84 # ffffffffc02049c8 <etext+0xd34>
ffffffffc020197c:	00003617          	auipc	a2,0x3
ffffffffc0201980:	a6460613          	addi	a2,a2,-1436 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201984:	0d000593          	li	a1,208
ffffffffc0201988:	00003517          	auipc	a0,0x3
ffffffffc020198c:	fc050513          	addi	a0,a0,-64 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201990:	f5cfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201994:	00003697          	auipc	a3,0x3
ffffffffc0201998:	e5c68693          	addi	a3,a3,-420 # ffffffffc02047f0 <etext+0xb5c>
ffffffffc020199c:	00003617          	auipc	a2,0x3
ffffffffc02019a0:	a4460613          	addi	a2,a2,-1468 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02019a4:	0d500593          	li	a1,213
ffffffffc02019a8:	00003517          	auipc	a0,0x3
ffffffffc02019ac:	fa050513          	addi	a0,a0,-96 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02019b0:	f3cfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02019b4:	00003697          	auipc	a3,0x3
ffffffffc02019b8:	ee468693          	addi	a3,a3,-284 # ffffffffc0204898 <etext+0xc04>
ffffffffc02019bc:	00003617          	auipc	a2,0x3
ffffffffc02019c0:	a2460613          	addi	a2,a2,-1500 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02019c4:	0d800593          	li	a1,216
ffffffffc02019c8:	00003517          	auipc	a0,0x3
ffffffffc02019cc:	f8050513          	addi	a0,a0,-128 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02019d0:	f1cfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02019d4:	00003697          	auipc	a3,0x3
ffffffffc02019d8:	fac68693          	addi	a3,a3,-84 # ffffffffc0204980 <etext+0xcec>
ffffffffc02019dc:	00003617          	auipc	a2,0x3
ffffffffc02019e0:	a0460613          	addi	a2,a2,-1532 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02019e4:	0c800593          	li	a1,200
ffffffffc02019e8:	00003517          	auipc	a0,0x3
ffffffffc02019ec:	f6050513          	addi	a0,a0,-160 # ffffffffc0204948 <etext+0xcb4>
ffffffffc02019f0:	efcfe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02019f4 <swap_init_mm>:
ffffffffc02019f4:	0000e797          	auipc	a5,0xe
ffffffffc02019f8:	6647b783          	ld	a5,1636(a5) # ffffffffc0210058 <sm>
ffffffffc02019fc:	0107b303          	ld	t1,16(a5)
ffffffffc0201a00:	8302                	jr	t1

ffffffffc0201a02 <swap_map_swappable>:
ffffffffc0201a02:	0000e797          	auipc	a5,0xe
ffffffffc0201a06:	6567b783          	ld	a5,1622(a5) # ffffffffc0210058 <sm>
ffffffffc0201a0a:	0207b303          	ld	t1,32(a5)
ffffffffc0201a0e:	8302                	jr	t1

ffffffffc0201a10 <swap_out>:
ffffffffc0201a10:	711d                	addi	sp,sp,-96
ffffffffc0201a12:	ec86                	sd	ra,88(sp)
ffffffffc0201a14:	e8a2                	sd	s0,80(sp)
ffffffffc0201a16:	e4a6                	sd	s1,72(sp)
ffffffffc0201a18:	e0ca                	sd	s2,64(sp)
ffffffffc0201a1a:	fc4e                	sd	s3,56(sp)
ffffffffc0201a1c:	f852                	sd	s4,48(sp)
ffffffffc0201a1e:	f456                	sd	s5,40(sp)
ffffffffc0201a20:	f05a                	sd	s6,32(sp)
ffffffffc0201a22:	ec5e                	sd	s7,24(sp)
ffffffffc0201a24:	e862                	sd	s8,16(sp)
ffffffffc0201a26:	cde9                	beqz	a1,ffffffffc0201b00 <swap_out+0xf0>
ffffffffc0201a28:	8a2e                	mv	s4,a1
ffffffffc0201a2a:	892a                	mv	s2,a0
ffffffffc0201a2c:	8ab2                	mv	s5,a2
ffffffffc0201a2e:	4401                	li	s0,0
ffffffffc0201a30:	0000e997          	auipc	s3,0xe
ffffffffc0201a34:	62898993          	addi	s3,s3,1576 # ffffffffc0210058 <sm>
ffffffffc0201a38:	00003b17          	auipc	s6,0x3
ffffffffc0201a3c:	210b0b13          	addi	s6,s6,528 # ffffffffc0204c48 <etext+0xfb4>
ffffffffc0201a40:	00003b97          	auipc	s7,0x3
ffffffffc0201a44:	1f0b8b93          	addi	s7,s7,496 # ffffffffc0204c30 <etext+0xf9c>
ffffffffc0201a48:	a825                	j	ffffffffc0201a80 <swap_out+0x70>
ffffffffc0201a4a:	67a2                	ld	a5,8(sp)
ffffffffc0201a4c:	8626                	mv	a2,s1
ffffffffc0201a4e:	85a2                	mv	a1,s0
ffffffffc0201a50:	63b4                	ld	a3,64(a5)
ffffffffc0201a52:	855a                	mv	a0,s6
ffffffffc0201a54:	2405                	addiw	s0,s0,1
ffffffffc0201a56:	82b1                	srli	a3,a3,0xc
ffffffffc0201a58:	0685                	addi	a3,a3,1
ffffffffc0201a5a:	e5cfe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201a5e:	6522                	ld	a0,8(sp)
ffffffffc0201a60:	4585                	li	a1,1
ffffffffc0201a62:	613c                	ld	a5,64(a0)
ffffffffc0201a64:	83b1                	srli	a5,a5,0xc
ffffffffc0201a66:	0785                	addi	a5,a5,1
ffffffffc0201a68:	07a2                	slli	a5,a5,0x8
ffffffffc0201a6a:	00fc3023          	sd	a5,0(s8)
ffffffffc0201a6e:	4b3000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201a72:	01893503          	ld	a0,24(s2)
ffffffffc0201a76:	85a6                	mv	a1,s1
ffffffffc0201a78:	22f010ef          	jal	ra,ffffffffc02034a6 <tlb_invalidate>
ffffffffc0201a7c:	048a0d63          	beq	s4,s0,ffffffffc0201ad6 <swap_out+0xc6>
ffffffffc0201a80:	0009b783          	ld	a5,0(s3)
ffffffffc0201a84:	8656                	mv	a2,s5
ffffffffc0201a86:	002c                	addi	a1,sp,8
ffffffffc0201a88:	7b9c                	ld	a5,48(a5)
ffffffffc0201a8a:	854a                	mv	a0,s2
ffffffffc0201a8c:	9782                	jalr	a5
ffffffffc0201a8e:	e12d                	bnez	a0,ffffffffc0201af0 <swap_out+0xe0>
ffffffffc0201a90:	67a2                	ld	a5,8(sp)
ffffffffc0201a92:	01893503          	ld	a0,24(s2)
ffffffffc0201a96:	4601                	li	a2,0
ffffffffc0201a98:	63a4                	ld	s1,64(a5)
ffffffffc0201a9a:	85a6                	mv	a1,s1
ffffffffc0201a9c:	503000ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc0201aa0:	611c                	ld	a5,0(a0)
ffffffffc0201aa2:	8c2a                	mv	s8,a0
ffffffffc0201aa4:	8b85                	andi	a5,a5,1
ffffffffc0201aa6:	cfb9                	beqz	a5,ffffffffc0201b04 <swap_out+0xf4>
ffffffffc0201aa8:	65a2                	ld	a1,8(sp)
ffffffffc0201aaa:	61bc                	ld	a5,64(a1)
ffffffffc0201aac:	83b1                	srli	a5,a5,0xc
ffffffffc0201aae:	0785                	addi	a5,a5,1
ffffffffc0201ab0:	00879513          	slli	a0,a5,0x8
ffffffffc0201ab4:	4c9010ef          	jal	ra,ffffffffc020377c <swapfs_write>
ffffffffc0201ab8:	d949                	beqz	a0,ffffffffc0201a4a <swap_out+0x3a>
ffffffffc0201aba:	855e                	mv	a0,s7
ffffffffc0201abc:	dfafe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201ac0:	0009b783          	ld	a5,0(s3)
ffffffffc0201ac4:	6622                	ld	a2,8(sp)
ffffffffc0201ac6:	4681                	li	a3,0
ffffffffc0201ac8:	739c                	ld	a5,32(a5)
ffffffffc0201aca:	85a6                	mv	a1,s1
ffffffffc0201acc:	854a                	mv	a0,s2
ffffffffc0201ace:	2405                	addiw	s0,s0,1
ffffffffc0201ad0:	9782                	jalr	a5
ffffffffc0201ad2:	fa8a17e3          	bne	s4,s0,ffffffffc0201a80 <swap_out+0x70>
ffffffffc0201ad6:	60e6                	ld	ra,88(sp)
ffffffffc0201ad8:	8522                	mv	a0,s0
ffffffffc0201ada:	6446                	ld	s0,80(sp)
ffffffffc0201adc:	64a6                	ld	s1,72(sp)
ffffffffc0201ade:	6906                	ld	s2,64(sp)
ffffffffc0201ae0:	79e2                	ld	s3,56(sp)
ffffffffc0201ae2:	7a42                	ld	s4,48(sp)
ffffffffc0201ae4:	7aa2                	ld	s5,40(sp)
ffffffffc0201ae6:	7b02                	ld	s6,32(sp)
ffffffffc0201ae8:	6be2                	ld	s7,24(sp)
ffffffffc0201aea:	6c42                	ld	s8,16(sp)
ffffffffc0201aec:	6125                	addi	sp,sp,96
ffffffffc0201aee:	8082                	ret
ffffffffc0201af0:	85a2                	mv	a1,s0
ffffffffc0201af2:	00003517          	auipc	a0,0x3
ffffffffc0201af6:	0f650513          	addi	a0,a0,246 # ffffffffc0204be8 <etext+0xf54>
ffffffffc0201afa:	dbcfe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201afe:	bfe1                	j	ffffffffc0201ad6 <swap_out+0xc6>
ffffffffc0201b00:	4401                	li	s0,0
ffffffffc0201b02:	bfd1                	j	ffffffffc0201ad6 <swap_out+0xc6>
ffffffffc0201b04:	00003697          	auipc	a3,0x3
ffffffffc0201b08:	11468693          	addi	a3,a3,276 # ffffffffc0204c18 <etext+0xf84>
ffffffffc0201b0c:	00003617          	auipc	a2,0x3
ffffffffc0201b10:	8d460613          	addi	a2,a2,-1836 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201b14:	07200593          	li	a1,114
ffffffffc0201b18:	00003517          	auipc	a0,0x3
ffffffffc0201b1c:	e3050513          	addi	a0,a0,-464 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201b20:	dccfe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0201b24 <swap_in>:
ffffffffc0201b24:	7179                	addi	sp,sp,-48
ffffffffc0201b26:	e84a                	sd	s2,16(sp)
ffffffffc0201b28:	892a                	mv	s2,a0
ffffffffc0201b2a:	4505                	li	a0,1
ffffffffc0201b2c:	ec26                	sd	s1,24(sp)
ffffffffc0201b2e:	e44e                	sd	s3,8(sp)
ffffffffc0201b30:	f406                	sd	ra,40(sp)
ffffffffc0201b32:	f022                	sd	s0,32(sp)
ffffffffc0201b34:	84ae                	mv	s1,a1
ffffffffc0201b36:	89b2                	mv	s3,a2
ffffffffc0201b38:	357000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201b3c:	c129                	beqz	a0,ffffffffc0201b7e <swap_in+0x5a>
ffffffffc0201b3e:	842a                	mv	s0,a0
ffffffffc0201b40:	01893503          	ld	a0,24(s2)
ffffffffc0201b44:	4601                	li	a2,0
ffffffffc0201b46:	85a6                	mv	a1,s1
ffffffffc0201b48:	457000ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc0201b4c:	892a                	mv	s2,a0
ffffffffc0201b4e:	6108                	ld	a0,0(a0)
ffffffffc0201b50:	85a2                	mv	a1,s0
ffffffffc0201b52:	391010ef          	jal	ra,ffffffffc02036e2 <swapfs_read>
ffffffffc0201b56:	00093583          	ld	a1,0(s2)
ffffffffc0201b5a:	8626                	mv	a2,s1
ffffffffc0201b5c:	00003517          	auipc	a0,0x3
ffffffffc0201b60:	13c50513          	addi	a0,a0,316 # ffffffffc0204c98 <etext+0x1004>
ffffffffc0201b64:	81a1                	srli	a1,a1,0x8
ffffffffc0201b66:	d50fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201b6a:	70a2                	ld	ra,40(sp)
ffffffffc0201b6c:	0089b023          	sd	s0,0(s3)
ffffffffc0201b70:	7402                	ld	s0,32(sp)
ffffffffc0201b72:	64e2                	ld	s1,24(sp)
ffffffffc0201b74:	6942                	ld	s2,16(sp)
ffffffffc0201b76:	69a2                	ld	s3,8(sp)
ffffffffc0201b78:	4501                	li	a0,0
ffffffffc0201b7a:	6145                	addi	sp,sp,48
ffffffffc0201b7c:	8082                	ret
ffffffffc0201b7e:	00003697          	auipc	a3,0x3
ffffffffc0201b82:	10a68693          	addi	a3,a3,266 # ffffffffc0204c88 <etext+0xff4>
ffffffffc0201b86:	00003617          	auipc	a2,0x3
ffffffffc0201b8a:	85a60613          	addi	a2,a2,-1958 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201b8e:	08800593          	li	a1,136
ffffffffc0201b92:	00003517          	auipc	a0,0x3
ffffffffc0201b96:	db650513          	addi	a0,a0,-586 # ffffffffc0204948 <etext+0xcb4>
ffffffffc0201b9a:	d52fe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0201b9e <default_init>:
ffffffffc0201b9e:	0000e797          	auipc	a5,0xe
ffffffffc0201ba2:	5ca78793          	addi	a5,a5,1482 # ffffffffc0210168 <free_area>
ffffffffc0201ba6:	e79c                	sd	a5,8(a5)
ffffffffc0201ba8:	e39c                	sd	a5,0(a5)
ffffffffc0201baa:	0007a823          	sw	zero,16(a5)
ffffffffc0201bae:	8082                	ret

ffffffffc0201bb0 <default_nr_free_pages>:
ffffffffc0201bb0:	0000e517          	auipc	a0,0xe
ffffffffc0201bb4:	5c856503          	lwu	a0,1480(a0) # ffffffffc0210178 <free_area+0x10>
ffffffffc0201bb8:	8082                	ret

ffffffffc0201bba <default_check>:
ffffffffc0201bba:	715d                	addi	sp,sp,-80
ffffffffc0201bbc:	e0a2                	sd	s0,64(sp)
ffffffffc0201bbe:	0000e417          	auipc	s0,0xe
ffffffffc0201bc2:	5aa40413          	addi	s0,s0,1450 # ffffffffc0210168 <free_area>
ffffffffc0201bc6:	641c                	ld	a5,8(s0)
ffffffffc0201bc8:	e486                	sd	ra,72(sp)
ffffffffc0201bca:	fc26                	sd	s1,56(sp)
ffffffffc0201bcc:	f84a                	sd	s2,48(sp)
ffffffffc0201bce:	f44e                	sd	s3,40(sp)
ffffffffc0201bd0:	f052                	sd	s4,32(sp)
ffffffffc0201bd2:	ec56                	sd	s5,24(sp)
ffffffffc0201bd4:	e85a                	sd	s6,16(sp)
ffffffffc0201bd6:	e45e                	sd	s7,8(sp)
ffffffffc0201bd8:	e062                	sd	s8,0(sp)
ffffffffc0201bda:	2c878763          	beq	a5,s0,ffffffffc0201ea8 <default_check+0x2ee>
ffffffffc0201bde:	4481                	li	s1,0
ffffffffc0201be0:	4901                	li	s2,0
ffffffffc0201be2:	fe87b703          	ld	a4,-24(a5)
ffffffffc0201be6:	8b09                	andi	a4,a4,2
ffffffffc0201be8:	2c070463          	beqz	a4,ffffffffc0201eb0 <default_check+0x2f6>
ffffffffc0201bec:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201bf0:	679c                	ld	a5,8(a5)
ffffffffc0201bf2:	2905                	addiw	s2,s2,1
ffffffffc0201bf4:	9cb9                	addw	s1,s1,a4
ffffffffc0201bf6:	fe8796e3          	bne	a5,s0,ffffffffc0201be2 <default_check+0x28>
ffffffffc0201bfa:	89a6                	mv	s3,s1
ffffffffc0201bfc:	367000ef          	jal	ra,ffffffffc0202762 <nr_free_pages>
ffffffffc0201c00:	71351863          	bne	a0,s3,ffffffffc0202310 <default_check+0x756>
ffffffffc0201c04:	4505                	li	a0,1
ffffffffc0201c06:	289000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201c0a:	8a2a                	mv	s4,a0
ffffffffc0201c0c:	44050263          	beqz	a0,ffffffffc0202050 <default_check+0x496>
ffffffffc0201c10:	4505                	li	a0,1
ffffffffc0201c12:	27d000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201c16:	89aa                	mv	s3,a0
ffffffffc0201c18:	70050c63          	beqz	a0,ffffffffc0202330 <default_check+0x776>
ffffffffc0201c1c:	4505                	li	a0,1
ffffffffc0201c1e:	271000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201c22:	8aaa                	mv	s5,a0
ffffffffc0201c24:	4a050663          	beqz	a0,ffffffffc02020d0 <default_check+0x516>
ffffffffc0201c28:	2b3a0463          	beq	s4,s3,ffffffffc0201ed0 <default_check+0x316>
ffffffffc0201c2c:	2aaa0263          	beq	s4,a0,ffffffffc0201ed0 <default_check+0x316>
ffffffffc0201c30:	2aa98063          	beq	s3,a0,ffffffffc0201ed0 <default_check+0x316>
ffffffffc0201c34:	000a2783          	lw	a5,0(s4)
ffffffffc0201c38:	2a079c63          	bnez	a5,ffffffffc0201ef0 <default_check+0x336>
ffffffffc0201c3c:	0009a783          	lw	a5,0(s3)
ffffffffc0201c40:	2a079863          	bnez	a5,ffffffffc0201ef0 <default_check+0x336>
ffffffffc0201c44:	411c                	lw	a5,0(a0)
ffffffffc0201c46:	2a079563          	bnez	a5,ffffffffc0201ef0 <default_check+0x336>
ffffffffc0201c4a:	0000e797          	auipc	a5,0xe
ffffffffc0201c4e:	54e7b783          	ld	a5,1358(a5) # ffffffffc0210198 <pages>
ffffffffc0201c52:	40fa0733          	sub	a4,s4,a5
ffffffffc0201c56:	870d                	srai	a4,a4,0x3
ffffffffc0201c58:	00004597          	auipc	a1,0x4
ffffffffc0201c5c:	c985b583          	ld	a1,-872(a1) # ffffffffc02058f0 <error_string+0x38>
ffffffffc0201c60:	02b70733          	mul	a4,a4,a1
ffffffffc0201c64:	00004617          	auipc	a2,0x4
ffffffffc0201c68:	c9463603          	ld	a2,-876(a2) # ffffffffc02058f8 <nbase>
ffffffffc0201c6c:	0000e697          	auipc	a3,0xe
ffffffffc0201c70:	4046b683          	ld	a3,1028(a3) # ffffffffc0210070 <npage>
ffffffffc0201c74:	06b2                	slli	a3,a3,0xc
ffffffffc0201c76:	9732                	add	a4,a4,a2
ffffffffc0201c78:	0732                	slli	a4,a4,0xc
ffffffffc0201c7a:	28d77b63          	bgeu	a4,a3,ffffffffc0201f10 <default_check+0x356>
ffffffffc0201c7e:	40f98733          	sub	a4,s3,a5
ffffffffc0201c82:	870d                	srai	a4,a4,0x3
ffffffffc0201c84:	02b70733          	mul	a4,a4,a1
ffffffffc0201c88:	9732                	add	a4,a4,a2
ffffffffc0201c8a:	0732                	slli	a4,a4,0xc
ffffffffc0201c8c:	4cd77263          	bgeu	a4,a3,ffffffffc0202150 <default_check+0x596>
ffffffffc0201c90:	40f507b3          	sub	a5,a0,a5
ffffffffc0201c94:	878d                	srai	a5,a5,0x3
ffffffffc0201c96:	02b787b3          	mul	a5,a5,a1
ffffffffc0201c9a:	97b2                	add	a5,a5,a2
ffffffffc0201c9c:	07b2                	slli	a5,a5,0xc
ffffffffc0201c9e:	30d7f963          	bgeu	a5,a3,ffffffffc0201fb0 <default_check+0x3f6>
ffffffffc0201ca2:	4505                	li	a0,1
ffffffffc0201ca4:	00043c03          	ld	s8,0(s0)
ffffffffc0201ca8:	00843b83          	ld	s7,8(s0)
ffffffffc0201cac:	01042b03          	lw	s6,16(s0)
ffffffffc0201cb0:	e400                	sd	s0,8(s0)
ffffffffc0201cb2:	e000                	sd	s0,0(s0)
ffffffffc0201cb4:	0000e797          	auipc	a5,0xe
ffffffffc0201cb8:	4c07a223          	sw	zero,1220(a5) # ffffffffc0210178 <free_area+0x10>
ffffffffc0201cbc:	1d3000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201cc0:	2c051863          	bnez	a0,ffffffffc0201f90 <default_check+0x3d6>
ffffffffc0201cc4:	4585                	li	a1,1
ffffffffc0201cc6:	8552                	mv	a0,s4
ffffffffc0201cc8:	259000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201ccc:	4585                	li	a1,1
ffffffffc0201cce:	854e                	mv	a0,s3
ffffffffc0201cd0:	251000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201cd4:	4585                	li	a1,1
ffffffffc0201cd6:	8556                	mv	a0,s5
ffffffffc0201cd8:	249000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201cdc:	4818                	lw	a4,16(s0)
ffffffffc0201cde:	478d                	li	a5,3
ffffffffc0201ce0:	28f71863          	bne	a4,a5,ffffffffc0201f70 <default_check+0x3b6>
ffffffffc0201ce4:	4505                	li	a0,1
ffffffffc0201ce6:	1a9000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201cea:	89aa                	mv	s3,a0
ffffffffc0201cec:	26050263          	beqz	a0,ffffffffc0201f50 <default_check+0x396>
ffffffffc0201cf0:	4505                	li	a0,1
ffffffffc0201cf2:	19d000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201cf6:	8aaa                	mv	s5,a0
ffffffffc0201cf8:	3a050c63          	beqz	a0,ffffffffc02020b0 <default_check+0x4f6>
ffffffffc0201cfc:	4505                	li	a0,1
ffffffffc0201cfe:	191000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201d02:	8a2a                	mv	s4,a0
ffffffffc0201d04:	38050663          	beqz	a0,ffffffffc0202090 <default_check+0x4d6>
ffffffffc0201d08:	4505                	li	a0,1
ffffffffc0201d0a:	185000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201d0e:	36051163          	bnez	a0,ffffffffc0202070 <default_check+0x4b6>
ffffffffc0201d12:	4585                	li	a1,1
ffffffffc0201d14:	854e                	mv	a0,s3
ffffffffc0201d16:	20b000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201d1a:	641c                	ld	a5,8(s0)
ffffffffc0201d1c:	20878a63          	beq	a5,s0,ffffffffc0201f30 <default_check+0x376>
ffffffffc0201d20:	4505                	li	a0,1
ffffffffc0201d22:	16d000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201d26:	30a99563          	bne	s3,a0,ffffffffc0202030 <default_check+0x476>
ffffffffc0201d2a:	4505                	li	a0,1
ffffffffc0201d2c:	163000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201d30:	2e051063          	bnez	a0,ffffffffc0202010 <default_check+0x456>
ffffffffc0201d34:	481c                	lw	a5,16(s0)
ffffffffc0201d36:	2a079d63          	bnez	a5,ffffffffc0201ff0 <default_check+0x436>
ffffffffc0201d3a:	854e                	mv	a0,s3
ffffffffc0201d3c:	4585                	li	a1,1
ffffffffc0201d3e:	01843023          	sd	s8,0(s0)
ffffffffc0201d42:	01743423          	sd	s7,8(s0)
ffffffffc0201d46:	01642823          	sw	s6,16(s0)
ffffffffc0201d4a:	1d7000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201d4e:	4585                	li	a1,1
ffffffffc0201d50:	8556                	mv	a0,s5
ffffffffc0201d52:	1cf000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201d56:	4585                	li	a1,1
ffffffffc0201d58:	8552                	mv	a0,s4
ffffffffc0201d5a:	1c7000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201d5e:	4515                	li	a0,5
ffffffffc0201d60:	12f000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201d64:	89aa                	mv	s3,a0
ffffffffc0201d66:	26050563          	beqz	a0,ffffffffc0201fd0 <default_check+0x416>
ffffffffc0201d6a:	651c                	ld	a5,8(a0)
ffffffffc0201d6c:	8385                	srli	a5,a5,0x1
ffffffffc0201d6e:	8b85                	andi	a5,a5,1
ffffffffc0201d70:	54079063          	bnez	a5,ffffffffc02022b0 <default_check+0x6f6>
ffffffffc0201d74:	4505                	li	a0,1
ffffffffc0201d76:	00043b03          	ld	s6,0(s0)
ffffffffc0201d7a:	00843a83          	ld	s5,8(s0)
ffffffffc0201d7e:	e000                	sd	s0,0(s0)
ffffffffc0201d80:	e400                	sd	s0,8(s0)
ffffffffc0201d82:	10d000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201d86:	50051563          	bnez	a0,ffffffffc0202290 <default_check+0x6d6>
ffffffffc0201d8a:	09098a13          	addi	s4,s3,144
ffffffffc0201d8e:	8552                	mv	a0,s4
ffffffffc0201d90:	458d                	li	a1,3
ffffffffc0201d92:	01042b83          	lw	s7,16(s0)
ffffffffc0201d96:	0000e797          	auipc	a5,0xe
ffffffffc0201d9a:	3e07a123          	sw	zero,994(a5) # ffffffffc0210178 <free_area+0x10>
ffffffffc0201d9e:	183000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201da2:	4511                	li	a0,4
ffffffffc0201da4:	0eb000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201da8:	4c051463          	bnez	a0,ffffffffc0202270 <default_check+0x6b6>
ffffffffc0201dac:	0989b783          	ld	a5,152(s3)
ffffffffc0201db0:	8385                	srli	a5,a5,0x1
ffffffffc0201db2:	8b85                	andi	a5,a5,1
ffffffffc0201db4:	48078e63          	beqz	a5,ffffffffc0202250 <default_check+0x696>
ffffffffc0201db8:	0a89a703          	lw	a4,168(s3)
ffffffffc0201dbc:	478d                	li	a5,3
ffffffffc0201dbe:	48f71963          	bne	a4,a5,ffffffffc0202250 <default_check+0x696>
ffffffffc0201dc2:	450d                	li	a0,3
ffffffffc0201dc4:	0cb000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201dc8:	8c2a                	mv	s8,a0
ffffffffc0201dca:	46050363          	beqz	a0,ffffffffc0202230 <default_check+0x676>
ffffffffc0201dce:	4505                	li	a0,1
ffffffffc0201dd0:	0bf000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201dd4:	42051e63          	bnez	a0,ffffffffc0202210 <default_check+0x656>
ffffffffc0201dd8:	418a1c63          	bne	s4,s8,ffffffffc02021f0 <default_check+0x636>
ffffffffc0201ddc:	4585                	li	a1,1
ffffffffc0201dde:	854e                	mv	a0,s3
ffffffffc0201de0:	141000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201de4:	458d                	li	a1,3
ffffffffc0201de6:	8552                	mv	a0,s4
ffffffffc0201de8:	139000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201dec:	0089b783          	ld	a5,8(s3)
ffffffffc0201df0:	04898c13          	addi	s8,s3,72
ffffffffc0201df4:	8385                	srli	a5,a5,0x1
ffffffffc0201df6:	8b85                	andi	a5,a5,1
ffffffffc0201df8:	3c078c63          	beqz	a5,ffffffffc02021d0 <default_check+0x616>
ffffffffc0201dfc:	0189a703          	lw	a4,24(s3)
ffffffffc0201e00:	4785                	li	a5,1
ffffffffc0201e02:	3cf71763          	bne	a4,a5,ffffffffc02021d0 <default_check+0x616>
ffffffffc0201e06:	008a3783          	ld	a5,8(s4)
ffffffffc0201e0a:	8385                	srli	a5,a5,0x1
ffffffffc0201e0c:	8b85                	andi	a5,a5,1
ffffffffc0201e0e:	3a078163          	beqz	a5,ffffffffc02021b0 <default_check+0x5f6>
ffffffffc0201e12:	018a2703          	lw	a4,24(s4)
ffffffffc0201e16:	478d                	li	a5,3
ffffffffc0201e18:	38f71c63          	bne	a4,a5,ffffffffc02021b0 <default_check+0x5f6>
ffffffffc0201e1c:	4505                	li	a0,1
ffffffffc0201e1e:	071000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201e22:	36a99763          	bne	s3,a0,ffffffffc0202190 <default_check+0x5d6>
ffffffffc0201e26:	4585                	li	a1,1
ffffffffc0201e28:	0f9000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201e2c:	4509                	li	a0,2
ffffffffc0201e2e:	061000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201e32:	32aa1f63          	bne	s4,a0,ffffffffc0202170 <default_check+0x5b6>
ffffffffc0201e36:	4589                	li	a1,2
ffffffffc0201e38:	0e9000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201e3c:	4585                	li	a1,1
ffffffffc0201e3e:	8562                	mv	a0,s8
ffffffffc0201e40:	0e1000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201e44:	4515                	li	a0,5
ffffffffc0201e46:	049000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201e4a:	89aa                	mv	s3,a0
ffffffffc0201e4c:	48050263          	beqz	a0,ffffffffc02022d0 <default_check+0x716>
ffffffffc0201e50:	4505                	li	a0,1
ffffffffc0201e52:	03d000ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0201e56:	2c051d63          	bnez	a0,ffffffffc0202130 <default_check+0x576>
ffffffffc0201e5a:	481c                	lw	a5,16(s0)
ffffffffc0201e5c:	2a079a63          	bnez	a5,ffffffffc0202110 <default_check+0x556>
ffffffffc0201e60:	4595                	li	a1,5
ffffffffc0201e62:	854e                	mv	a0,s3
ffffffffc0201e64:	01742823          	sw	s7,16(s0)
ffffffffc0201e68:	01643023          	sd	s6,0(s0)
ffffffffc0201e6c:	01543423          	sd	s5,8(s0)
ffffffffc0201e70:	0b1000ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0201e74:	641c                	ld	a5,8(s0)
ffffffffc0201e76:	00878963          	beq	a5,s0,ffffffffc0201e88 <default_check+0x2ce>
ffffffffc0201e7a:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201e7e:	679c                	ld	a5,8(a5)
ffffffffc0201e80:	397d                	addiw	s2,s2,-1
ffffffffc0201e82:	9c99                	subw	s1,s1,a4
ffffffffc0201e84:	fe879be3          	bne	a5,s0,ffffffffc0201e7a <default_check+0x2c0>
ffffffffc0201e88:	26091463          	bnez	s2,ffffffffc02020f0 <default_check+0x536>
ffffffffc0201e8c:	46049263          	bnez	s1,ffffffffc02022f0 <default_check+0x736>
ffffffffc0201e90:	60a6                	ld	ra,72(sp)
ffffffffc0201e92:	6406                	ld	s0,64(sp)
ffffffffc0201e94:	74e2                	ld	s1,56(sp)
ffffffffc0201e96:	7942                	ld	s2,48(sp)
ffffffffc0201e98:	79a2                	ld	s3,40(sp)
ffffffffc0201e9a:	7a02                	ld	s4,32(sp)
ffffffffc0201e9c:	6ae2                	ld	s5,24(sp)
ffffffffc0201e9e:	6b42                	ld	s6,16(sp)
ffffffffc0201ea0:	6ba2                	ld	s7,8(sp)
ffffffffc0201ea2:	6c02                	ld	s8,0(sp)
ffffffffc0201ea4:	6161                	addi	sp,sp,80
ffffffffc0201ea6:	8082                	ret
ffffffffc0201ea8:	4981                	li	s3,0
ffffffffc0201eaa:	4481                	li	s1,0
ffffffffc0201eac:	4901                	li	s2,0
ffffffffc0201eae:	b3b9                	j	ffffffffc0201bfc <default_check+0x42>
ffffffffc0201eb0:	00003697          	auipc	a3,0x3
ffffffffc0201eb4:	ac068693          	addi	a3,a3,-1344 # ffffffffc0204970 <etext+0xcdc>
ffffffffc0201eb8:	00002617          	auipc	a2,0x2
ffffffffc0201ebc:	52860613          	addi	a2,a2,1320 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201ec0:	0bd00593          	li	a1,189
ffffffffc0201ec4:	00003517          	auipc	a0,0x3
ffffffffc0201ec8:	e1450513          	addi	a0,a0,-492 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201ecc:	a20fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201ed0:	00003697          	auipc	a3,0x3
ffffffffc0201ed4:	e8068693          	addi	a3,a3,-384 # ffffffffc0204d50 <etext+0x10bc>
ffffffffc0201ed8:	00002617          	auipc	a2,0x2
ffffffffc0201edc:	50860613          	addi	a2,a2,1288 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201ee0:	08a00593          	li	a1,138
ffffffffc0201ee4:	00003517          	auipc	a0,0x3
ffffffffc0201ee8:	df450513          	addi	a0,a0,-524 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201eec:	a00fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201ef0:	00003697          	auipc	a3,0x3
ffffffffc0201ef4:	e8868693          	addi	a3,a3,-376 # ffffffffc0204d78 <etext+0x10e4>
ffffffffc0201ef8:	00002617          	auipc	a2,0x2
ffffffffc0201efc:	4e860613          	addi	a2,a2,1256 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201f00:	08b00593          	li	a1,139
ffffffffc0201f04:	00003517          	auipc	a0,0x3
ffffffffc0201f08:	dd450513          	addi	a0,a0,-556 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201f0c:	9e0fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201f10:	00003697          	auipc	a3,0x3
ffffffffc0201f14:	ea868693          	addi	a3,a3,-344 # ffffffffc0204db8 <etext+0x1124>
ffffffffc0201f18:	00002617          	auipc	a2,0x2
ffffffffc0201f1c:	4c860613          	addi	a2,a2,1224 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201f20:	08d00593          	li	a1,141
ffffffffc0201f24:	00003517          	auipc	a0,0x3
ffffffffc0201f28:	db450513          	addi	a0,a0,-588 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201f2c:	9c0fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201f30:	00003697          	auipc	a3,0x3
ffffffffc0201f34:	f1068693          	addi	a3,a3,-240 # ffffffffc0204e40 <etext+0x11ac>
ffffffffc0201f38:	00002617          	auipc	a2,0x2
ffffffffc0201f3c:	4a860613          	addi	a2,a2,1192 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201f40:	0a600593          	li	a1,166
ffffffffc0201f44:	00003517          	auipc	a0,0x3
ffffffffc0201f48:	d9450513          	addi	a0,a0,-620 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201f4c:	9a0fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201f50:	00003697          	auipc	a3,0x3
ffffffffc0201f54:	da068693          	addi	a3,a3,-608 # ffffffffc0204cf0 <etext+0x105c>
ffffffffc0201f58:	00002617          	auipc	a2,0x2
ffffffffc0201f5c:	48860613          	addi	a2,a2,1160 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201f60:	09f00593          	li	a1,159
ffffffffc0201f64:	00003517          	auipc	a0,0x3
ffffffffc0201f68:	d7450513          	addi	a0,a0,-652 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201f6c:	980fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201f70:	00003697          	auipc	a3,0x3
ffffffffc0201f74:	ec068693          	addi	a3,a3,-320 # ffffffffc0204e30 <etext+0x119c>
ffffffffc0201f78:	00002617          	auipc	a2,0x2
ffffffffc0201f7c:	46860613          	addi	a2,a2,1128 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201f80:	09d00593          	li	a1,157
ffffffffc0201f84:	00003517          	auipc	a0,0x3
ffffffffc0201f88:	d5450513          	addi	a0,a0,-684 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201f8c:	960fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201f90:	00003697          	auipc	a3,0x3
ffffffffc0201f94:	e8868693          	addi	a3,a3,-376 # ffffffffc0204e18 <etext+0x1184>
ffffffffc0201f98:	00002617          	auipc	a2,0x2
ffffffffc0201f9c:	44860613          	addi	a2,a2,1096 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201fa0:	09800593          	li	a1,152
ffffffffc0201fa4:	00003517          	auipc	a0,0x3
ffffffffc0201fa8:	d3450513          	addi	a0,a0,-716 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201fac:	940fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201fb0:	00003697          	auipc	a3,0x3
ffffffffc0201fb4:	e4868693          	addi	a3,a3,-440 # ffffffffc0204df8 <etext+0x1164>
ffffffffc0201fb8:	00002617          	auipc	a2,0x2
ffffffffc0201fbc:	42860613          	addi	a2,a2,1064 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201fc0:	08f00593          	li	a1,143
ffffffffc0201fc4:	00003517          	auipc	a0,0x3
ffffffffc0201fc8:	d1450513          	addi	a0,a0,-748 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201fcc:	920fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201fd0:	00003697          	auipc	a3,0x3
ffffffffc0201fd4:	ea868693          	addi	a3,a3,-344 # ffffffffc0204e78 <etext+0x11e4>
ffffffffc0201fd8:	00002617          	auipc	a2,0x2
ffffffffc0201fdc:	40860613          	addi	a2,a2,1032 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0201fe0:	0c500593          	li	a1,197
ffffffffc0201fe4:	00003517          	auipc	a0,0x3
ffffffffc0201fe8:	cf450513          	addi	a0,a0,-780 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0201fec:	900fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201ff0:	00003697          	auipc	a3,0x3
ffffffffc0201ff4:	b3068693          	addi	a3,a3,-1232 # ffffffffc0204b20 <etext+0xe8c>
ffffffffc0201ff8:	00002617          	auipc	a2,0x2
ffffffffc0201ffc:	3e860613          	addi	a2,a2,1000 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202000:	0ac00593          	li	a1,172
ffffffffc0202004:	00003517          	auipc	a0,0x3
ffffffffc0202008:	cd450513          	addi	a0,a0,-812 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020200c:	8e0fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202010:	00003697          	auipc	a3,0x3
ffffffffc0202014:	e0868693          	addi	a3,a3,-504 # ffffffffc0204e18 <etext+0x1184>
ffffffffc0202018:	00002617          	auipc	a2,0x2
ffffffffc020201c:	3c860613          	addi	a2,a2,968 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202020:	0aa00593          	li	a1,170
ffffffffc0202024:	00003517          	auipc	a0,0x3
ffffffffc0202028:	cb450513          	addi	a0,a0,-844 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020202c:	8c0fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202030:	00003697          	auipc	a3,0x3
ffffffffc0202034:	e2868693          	addi	a3,a3,-472 # ffffffffc0204e58 <etext+0x11c4>
ffffffffc0202038:	00002617          	auipc	a2,0x2
ffffffffc020203c:	3a860613          	addi	a2,a2,936 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202040:	0a900593          	li	a1,169
ffffffffc0202044:	00003517          	auipc	a0,0x3
ffffffffc0202048:	c9450513          	addi	a0,a0,-876 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020204c:	8a0fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202050:	00003697          	auipc	a3,0x3
ffffffffc0202054:	ca068693          	addi	a3,a3,-864 # ffffffffc0204cf0 <etext+0x105c>
ffffffffc0202058:	00002617          	auipc	a2,0x2
ffffffffc020205c:	38860613          	addi	a2,a2,904 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202060:	08600593          	li	a1,134
ffffffffc0202064:	00003517          	auipc	a0,0x3
ffffffffc0202068:	c7450513          	addi	a0,a0,-908 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020206c:	880fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202070:	00003697          	auipc	a3,0x3
ffffffffc0202074:	da868693          	addi	a3,a3,-600 # ffffffffc0204e18 <etext+0x1184>
ffffffffc0202078:	00002617          	auipc	a2,0x2
ffffffffc020207c:	36860613          	addi	a2,a2,872 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202080:	0a300593          	li	a1,163
ffffffffc0202084:	00003517          	auipc	a0,0x3
ffffffffc0202088:	c5450513          	addi	a0,a0,-940 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020208c:	860fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202090:	00003697          	auipc	a3,0x3
ffffffffc0202094:	ca068693          	addi	a3,a3,-864 # ffffffffc0204d30 <etext+0x109c>
ffffffffc0202098:	00002617          	auipc	a2,0x2
ffffffffc020209c:	34860613          	addi	a2,a2,840 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02020a0:	0a100593          	li	a1,161
ffffffffc02020a4:	00003517          	auipc	a0,0x3
ffffffffc02020a8:	c3450513          	addi	a0,a0,-972 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02020ac:	840fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02020b0:	00003697          	auipc	a3,0x3
ffffffffc02020b4:	c6068693          	addi	a3,a3,-928 # ffffffffc0204d10 <etext+0x107c>
ffffffffc02020b8:	00002617          	auipc	a2,0x2
ffffffffc02020bc:	32860613          	addi	a2,a2,808 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02020c0:	0a000593          	li	a1,160
ffffffffc02020c4:	00003517          	auipc	a0,0x3
ffffffffc02020c8:	c1450513          	addi	a0,a0,-1004 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02020cc:	820fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02020d0:	00003697          	auipc	a3,0x3
ffffffffc02020d4:	c6068693          	addi	a3,a3,-928 # ffffffffc0204d30 <etext+0x109c>
ffffffffc02020d8:	00002617          	auipc	a2,0x2
ffffffffc02020dc:	30860613          	addi	a2,a2,776 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02020e0:	08800593          	li	a1,136
ffffffffc02020e4:	00003517          	auipc	a0,0x3
ffffffffc02020e8:	bf450513          	addi	a0,a0,-1036 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02020ec:	800fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02020f0:	00003697          	auipc	a3,0x3
ffffffffc02020f4:	ed868693          	addi	a3,a3,-296 # ffffffffc0204fc8 <etext+0x1334>
ffffffffc02020f8:	00002617          	auipc	a2,0x2
ffffffffc02020fc:	2e860613          	addi	a2,a2,744 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202100:	0f200593          	li	a1,242
ffffffffc0202104:	00003517          	auipc	a0,0x3
ffffffffc0202108:	bd450513          	addi	a0,a0,-1068 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020210c:	fe1fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202110:	00003697          	auipc	a3,0x3
ffffffffc0202114:	a1068693          	addi	a3,a3,-1520 # ffffffffc0204b20 <etext+0xe8c>
ffffffffc0202118:	00002617          	auipc	a2,0x2
ffffffffc020211c:	2c860613          	addi	a2,a2,712 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202120:	0e700593          	li	a1,231
ffffffffc0202124:	00003517          	auipc	a0,0x3
ffffffffc0202128:	bb450513          	addi	a0,a0,-1100 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020212c:	fc1fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202130:	00003697          	auipc	a3,0x3
ffffffffc0202134:	ce868693          	addi	a3,a3,-792 # ffffffffc0204e18 <etext+0x1184>
ffffffffc0202138:	00002617          	auipc	a2,0x2
ffffffffc020213c:	2a860613          	addi	a2,a2,680 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202140:	0e500593          	li	a1,229
ffffffffc0202144:	00003517          	auipc	a0,0x3
ffffffffc0202148:	b9450513          	addi	a0,a0,-1132 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020214c:	fa1fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202150:	00003697          	auipc	a3,0x3
ffffffffc0202154:	c8868693          	addi	a3,a3,-888 # ffffffffc0204dd8 <etext+0x1144>
ffffffffc0202158:	00002617          	auipc	a2,0x2
ffffffffc020215c:	28860613          	addi	a2,a2,648 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202160:	08e00593          	li	a1,142
ffffffffc0202164:	00003517          	auipc	a0,0x3
ffffffffc0202168:	b7450513          	addi	a0,a0,-1164 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020216c:	f81fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202170:	00003697          	auipc	a3,0x3
ffffffffc0202174:	e1868693          	addi	a3,a3,-488 # ffffffffc0204f88 <etext+0x12f4>
ffffffffc0202178:	00002617          	auipc	a2,0x2
ffffffffc020217c:	26860613          	addi	a2,a2,616 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202180:	0df00593          	li	a1,223
ffffffffc0202184:	00003517          	auipc	a0,0x3
ffffffffc0202188:	b5450513          	addi	a0,a0,-1196 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020218c:	f61fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202190:	00003697          	auipc	a3,0x3
ffffffffc0202194:	dd868693          	addi	a3,a3,-552 # ffffffffc0204f68 <etext+0x12d4>
ffffffffc0202198:	00002617          	auipc	a2,0x2
ffffffffc020219c:	24860613          	addi	a2,a2,584 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02021a0:	0dd00593          	li	a1,221
ffffffffc02021a4:	00003517          	auipc	a0,0x3
ffffffffc02021a8:	b3450513          	addi	a0,a0,-1228 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02021ac:	f41fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02021b0:	00003697          	auipc	a3,0x3
ffffffffc02021b4:	d9068693          	addi	a3,a3,-624 # ffffffffc0204f40 <etext+0x12ac>
ffffffffc02021b8:	00002617          	auipc	a2,0x2
ffffffffc02021bc:	22860613          	addi	a2,a2,552 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02021c0:	0db00593          	li	a1,219
ffffffffc02021c4:	00003517          	auipc	a0,0x3
ffffffffc02021c8:	b1450513          	addi	a0,a0,-1260 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02021cc:	f21fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02021d0:	00003697          	auipc	a3,0x3
ffffffffc02021d4:	d4868693          	addi	a3,a3,-696 # ffffffffc0204f18 <etext+0x1284>
ffffffffc02021d8:	00002617          	auipc	a2,0x2
ffffffffc02021dc:	20860613          	addi	a2,a2,520 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02021e0:	0da00593          	li	a1,218
ffffffffc02021e4:	00003517          	auipc	a0,0x3
ffffffffc02021e8:	af450513          	addi	a0,a0,-1292 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02021ec:	f01fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02021f0:	00003697          	auipc	a3,0x3
ffffffffc02021f4:	d1868693          	addi	a3,a3,-744 # ffffffffc0204f08 <etext+0x1274>
ffffffffc02021f8:	00002617          	auipc	a2,0x2
ffffffffc02021fc:	1e860613          	addi	a2,a2,488 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202200:	0d500593          	li	a1,213
ffffffffc0202204:	00003517          	auipc	a0,0x3
ffffffffc0202208:	ad450513          	addi	a0,a0,-1324 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020220c:	ee1fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202210:	00003697          	auipc	a3,0x3
ffffffffc0202214:	c0868693          	addi	a3,a3,-1016 # ffffffffc0204e18 <etext+0x1184>
ffffffffc0202218:	00002617          	auipc	a2,0x2
ffffffffc020221c:	1c860613          	addi	a2,a2,456 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202220:	0d400593          	li	a1,212
ffffffffc0202224:	00003517          	auipc	a0,0x3
ffffffffc0202228:	ab450513          	addi	a0,a0,-1356 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020222c:	ec1fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202230:	00003697          	auipc	a3,0x3
ffffffffc0202234:	cb868693          	addi	a3,a3,-840 # ffffffffc0204ee8 <etext+0x1254>
ffffffffc0202238:	00002617          	auipc	a2,0x2
ffffffffc020223c:	1a860613          	addi	a2,a2,424 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202240:	0d300593          	li	a1,211
ffffffffc0202244:	00003517          	auipc	a0,0x3
ffffffffc0202248:	a9450513          	addi	a0,a0,-1388 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020224c:	ea1fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202250:	00003697          	auipc	a3,0x3
ffffffffc0202254:	c6868693          	addi	a3,a3,-920 # ffffffffc0204eb8 <etext+0x1224>
ffffffffc0202258:	00002617          	auipc	a2,0x2
ffffffffc020225c:	18860613          	addi	a2,a2,392 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202260:	0d200593          	li	a1,210
ffffffffc0202264:	00003517          	auipc	a0,0x3
ffffffffc0202268:	a7450513          	addi	a0,a0,-1420 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020226c:	e81fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202270:	00003697          	auipc	a3,0x3
ffffffffc0202274:	c3068693          	addi	a3,a3,-976 # ffffffffc0204ea0 <etext+0x120c>
ffffffffc0202278:	00002617          	auipc	a2,0x2
ffffffffc020227c:	16860613          	addi	a2,a2,360 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202280:	0d100593          	li	a1,209
ffffffffc0202284:	00003517          	auipc	a0,0x3
ffffffffc0202288:	a5450513          	addi	a0,a0,-1452 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020228c:	e61fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202290:	00003697          	auipc	a3,0x3
ffffffffc0202294:	b8868693          	addi	a3,a3,-1144 # ffffffffc0204e18 <etext+0x1184>
ffffffffc0202298:	00002617          	auipc	a2,0x2
ffffffffc020229c:	14860613          	addi	a2,a2,328 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02022a0:	0cb00593          	li	a1,203
ffffffffc02022a4:	00003517          	auipc	a0,0x3
ffffffffc02022a8:	a3450513          	addi	a0,a0,-1484 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02022ac:	e41fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02022b0:	00003697          	auipc	a3,0x3
ffffffffc02022b4:	bd868693          	addi	a3,a3,-1064 # ffffffffc0204e88 <etext+0x11f4>
ffffffffc02022b8:	00002617          	auipc	a2,0x2
ffffffffc02022bc:	12860613          	addi	a2,a2,296 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02022c0:	0c600593          	li	a1,198
ffffffffc02022c4:	00003517          	auipc	a0,0x3
ffffffffc02022c8:	a1450513          	addi	a0,a0,-1516 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02022cc:	e21fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02022d0:	00003697          	auipc	a3,0x3
ffffffffc02022d4:	cd868693          	addi	a3,a3,-808 # ffffffffc0204fa8 <etext+0x1314>
ffffffffc02022d8:	00002617          	auipc	a2,0x2
ffffffffc02022dc:	10860613          	addi	a2,a2,264 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02022e0:	0e400593          	li	a1,228
ffffffffc02022e4:	00003517          	auipc	a0,0x3
ffffffffc02022e8:	9f450513          	addi	a0,a0,-1548 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02022ec:	e01fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02022f0:	00003697          	auipc	a3,0x3
ffffffffc02022f4:	ce868693          	addi	a3,a3,-792 # ffffffffc0204fd8 <etext+0x1344>
ffffffffc02022f8:	00002617          	auipc	a2,0x2
ffffffffc02022fc:	0e860613          	addi	a2,a2,232 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202300:	0f300593          	li	a1,243
ffffffffc0202304:	00003517          	auipc	a0,0x3
ffffffffc0202308:	9d450513          	addi	a0,a0,-1580 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020230c:	de1fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202310:	00002697          	auipc	a3,0x2
ffffffffc0202314:	67068693          	addi	a3,a3,1648 # ffffffffc0204980 <etext+0xcec>
ffffffffc0202318:	00002617          	auipc	a2,0x2
ffffffffc020231c:	0c860613          	addi	a2,a2,200 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202320:	0c000593          	li	a1,192
ffffffffc0202324:	00003517          	auipc	a0,0x3
ffffffffc0202328:	9b450513          	addi	a0,a0,-1612 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020232c:	dc1fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202330:	00003697          	auipc	a3,0x3
ffffffffc0202334:	9e068693          	addi	a3,a3,-1568 # ffffffffc0204d10 <etext+0x107c>
ffffffffc0202338:	00002617          	auipc	a2,0x2
ffffffffc020233c:	0a860613          	addi	a2,a2,168 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202340:	08700593          	li	a1,135
ffffffffc0202344:	00003517          	auipc	a0,0x3
ffffffffc0202348:	99450513          	addi	a0,a0,-1644 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020234c:	da1fd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0202350 <default_free_pages>:
ffffffffc0202350:	1141                	addi	sp,sp,-16
ffffffffc0202352:	e406                	sd	ra,8(sp)
ffffffffc0202354:	14058a63          	beqz	a1,ffffffffc02024a8 <default_free_pages+0x158>
ffffffffc0202358:	00359693          	slli	a3,a1,0x3
ffffffffc020235c:	96ae                	add	a3,a3,a1
ffffffffc020235e:	068e                	slli	a3,a3,0x3
ffffffffc0202360:	96aa                	add	a3,a3,a0
ffffffffc0202362:	87aa                	mv	a5,a0
ffffffffc0202364:	02d50263          	beq	a0,a3,ffffffffc0202388 <default_free_pages+0x38>
ffffffffc0202368:	6798                	ld	a4,8(a5)
ffffffffc020236a:	8b05                	andi	a4,a4,1
ffffffffc020236c:	10071e63          	bnez	a4,ffffffffc0202488 <default_free_pages+0x138>
ffffffffc0202370:	6798                	ld	a4,8(a5)
ffffffffc0202372:	8b09                	andi	a4,a4,2
ffffffffc0202374:	10071a63          	bnez	a4,ffffffffc0202488 <default_free_pages+0x138>
ffffffffc0202378:	0007b423          	sd	zero,8(a5)
ffffffffc020237c:	0007a023          	sw	zero,0(a5)
ffffffffc0202380:	04878793          	addi	a5,a5,72
ffffffffc0202384:	fed792e3          	bne	a5,a3,ffffffffc0202368 <default_free_pages+0x18>
ffffffffc0202388:	2581                	sext.w	a1,a1
ffffffffc020238a:	cd0c                	sw	a1,24(a0)
ffffffffc020238c:	00850893          	addi	a7,a0,8
ffffffffc0202390:	4789                	li	a5,2
ffffffffc0202392:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0202396:	0000e697          	auipc	a3,0xe
ffffffffc020239a:	dd268693          	addi	a3,a3,-558 # ffffffffc0210168 <free_area>
ffffffffc020239e:	4a98                	lw	a4,16(a3)
ffffffffc02023a0:	669c                	ld	a5,8(a3)
ffffffffc02023a2:	02050613          	addi	a2,a0,32
ffffffffc02023a6:	9db9                	addw	a1,a1,a4
ffffffffc02023a8:	ca8c                	sw	a1,16(a3)
ffffffffc02023aa:	0ad78863          	beq	a5,a3,ffffffffc020245a <default_free_pages+0x10a>
ffffffffc02023ae:	fe078713          	addi	a4,a5,-32
ffffffffc02023b2:	0006b803          	ld	a6,0(a3)
ffffffffc02023b6:	4581                	li	a1,0
ffffffffc02023b8:	00e56a63          	bltu	a0,a4,ffffffffc02023cc <default_free_pages+0x7c>
ffffffffc02023bc:	6798                	ld	a4,8(a5)
ffffffffc02023be:	06d70263          	beq	a4,a3,ffffffffc0202422 <default_free_pages+0xd2>
ffffffffc02023c2:	87ba                	mv	a5,a4
ffffffffc02023c4:	fe078713          	addi	a4,a5,-32
ffffffffc02023c8:	fee57ae3          	bgeu	a0,a4,ffffffffc02023bc <default_free_pages+0x6c>
ffffffffc02023cc:	c199                	beqz	a1,ffffffffc02023d2 <default_free_pages+0x82>
ffffffffc02023ce:	0106b023          	sd	a6,0(a3)
ffffffffc02023d2:	6398                	ld	a4,0(a5)
ffffffffc02023d4:	e390                	sd	a2,0(a5)
ffffffffc02023d6:	e710                	sd	a2,8(a4)
ffffffffc02023d8:	f51c                	sd	a5,40(a0)
ffffffffc02023da:	f118                	sd	a4,32(a0)
ffffffffc02023dc:	02d70063          	beq	a4,a3,ffffffffc02023fc <default_free_pages+0xac>
ffffffffc02023e0:	ff872803          	lw	a6,-8(a4)
ffffffffc02023e4:	fe070593          	addi	a1,a4,-32
ffffffffc02023e8:	02081613          	slli	a2,a6,0x20
ffffffffc02023ec:	9201                	srli	a2,a2,0x20
ffffffffc02023ee:	00361793          	slli	a5,a2,0x3
ffffffffc02023f2:	97b2                	add	a5,a5,a2
ffffffffc02023f4:	078e                	slli	a5,a5,0x3
ffffffffc02023f6:	97ae                	add	a5,a5,a1
ffffffffc02023f8:	02f50f63          	beq	a0,a5,ffffffffc0202436 <default_free_pages+0xe6>
ffffffffc02023fc:	7518                	ld	a4,40(a0)
ffffffffc02023fe:	00d70f63          	beq	a4,a3,ffffffffc020241c <default_free_pages+0xcc>
ffffffffc0202402:	4d0c                	lw	a1,24(a0)
ffffffffc0202404:	fe070693          	addi	a3,a4,-32
ffffffffc0202408:	02059613          	slli	a2,a1,0x20
ffffffffc020240c:	9201                	srli	a2,a2,0x20
ffffffffc020240e:	00361793          	slli	a5,a2,0x3
ffffffffc0202412:	97b2                	add	a5,a5,a2
ffffffffc0202414:	078e                	slli	a5,a5,0x3
ffffffffc0202416:	97aa                	add	a5,a5,a0
ffffffffc0202418:	04f68863          	beq	a3,a5,ffffffffc0202468 <default_free_pages+0x118>
ffffffffc020241c:	60a2                	ld	ra,8(sp)
ffffffffc020241e:	0141                	addi	sp,sp,16
ffffffffc0202420:	8082                	ret
ffffffffc0202422:	e790                	sd	a2,8(a5)
ffffffffc0202424:	f514                	sd	a3,40(a0)
ffffffffc0202426:	6798                	ld	a4,8(a5)
ffffffffc0202428:	f11c                	sd	a5,32(a0)
ffffffffc020242a:	02d70563          	beq	a4,a3,ffffffffc0202454 <default_free_pages+0x104>
ffffffffc020242e:	8832                	mv	a6,a2
ffffffffc0202430:	4585                	li	a1,1
ffffffffc0202432:	87ba                	mv	a5,a4
ffffffffc0202434:	bf41                	j	ffffffffc02023c4 <default_free_pages+0x74>
ffffffffc0202436:	4d1c                	lw	a5,24(a0)
ffffffffc0202438:	0107883b          	addw	a6,a5,a6
ffffffffc020243c:	ff072c23          	sw	a6,-8(a4)
ffffffffc0202440:	57f5                	li	a5,-3
ffffffffc0202442:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0202446:	7110                	ld	a2,32(a0)
ffffffffc0202448:	751c                	ld	a5,40(a0)
ffffffffc020244a:	852e                	mv	a0,a1
ffffffffc020244c:	e61c                	sd	a5,8(a2)
ffffffffc020244e:	6718                	ld	a4,8(a4)
ffffffffc0202450:	e390                	sd	a2,0(a5)
ffffffffc0202452:	b775                	j	ffffffffc02023fe <default_free_pages+0xae>
ffffffffc0202454:	e290                	sd	a2,0(a3)
ffffffffc0202456:	873e                	mv	a4,a5
ffffffffc0202458:	b761                	j	ffffffffc02023e0 <default_free_pages+0x90>
ffffffffc020245a:	60a2                	ld	ra,8(sp)
ffffffffc020245c:	e390                	sd	a2,0(a5)
ffffffffc020245e:	e790                	sd	a2,8(a5)
ffffffffc0202460:	f51c                	sd	a5,40(a0)
ffffffffc0202462:	f11c                	sd	a5,32(a0)
ffffffffc0202464:	0141                	addi	sp,sp,16
ffffffffc0202466:	8082                	ret
ffffffffc0202468:	ff872783          	lw	a5,-8(a4)
ffffffffc020246c:	fe870693          	addi	a3,a4,-24
ffffffffc0202470:	9dbd                	addw	a1,a1,a5
ffffffffc0202472:	cd0c                	sw	a1,24(a0)
ffffffffc0202474:	57f5                	li	a5,-3
ffffffffc0202476:	60f6b02f          	amoand.d	zero,a5,(a3)
ffffffffc020247a:	6314                	ld	a3,0(a4)
ffffffffc020247c:	671c                	ld	a5,8(a4)
ffffffffc020247e:	60a2                	ld	ra,8(sp)
ffffffffc0202480:	e69c                	sd	a5,8(a3)
ffffffffc0202482:	e394                	sd	a3,0(a5)
ffffffffc0202484:	0141                	addi	sp,sp,16
ffffffffc0202486:	8082                	ret
ffffffffc0202488:	00003697          	auipc	a3,0x3
ffffffffc020248c:	b6868693          	addi	a3,a3,-1176 # ffffffffc0204ff0 <etext+0x135c>
ffffffffc0202490:	00002617          	auipc	a2,0x2
ffffffffc0202494:	f5060613          	addi	a2,a2,-176 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202498:	05000593          	li	a1,80
ffffffffc020249c:	00003517          	auipc	a0,0x3
ffffffffc02024a0:	83c50513          	addi	a0,a0,-1988 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02024a4:	c49fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02024a8:	00003697          	auipc	a3,0x3
ffffffffc02024ac:	b4068693          	addi	a3,a3,-1216 # ffffffffc0204fe8 <etext+0x1354>
ffffffffc02024b0:	00002617          	auipc	a2,0x2
ffffffffc02024b4:	f3060613          	addi	a2,a2,-208 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02024b8:	04d00593          	li	a1,77
ffffffffc02024bc:	00003517          	auipc	a0,0x3
ffffffffc02024c0:	81c50513          	addi	a0,a0,-2020 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc02024c4:	c29fd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02024c8 <default_alloc_pages>:
ffffffffc02024c8:	c959                	beqz	a0,ffffffffc020255e <default_alloc_pages+0x96>
ffffffffc02024ca:	0000e597          	auipc	a1,0xe
ffffffffc02024ce:	c9e58593          	addi	a1,a1,-866 # ffffffffc0210168 <free_area>
ffffffffc02024d2:	0105a803          	lw	a6,16(a1)
ffffffffc02024d6:	862a                	mv	a2,a0
ffffffffc02024d8:	02081793          	slli	a5,a6,0x20
ffffffffc02024dc:	9381                	srli	a5,a5,0x20
ffffffffc02024de:	00a7ee63          	bltu	a5,a0,ffffffffc02024fa <default_alloc_pages+0x32>
ffffffffc02024e2:	87ae                	mv	a5,a1
ffffffffc02024e4:	a801                	j	ffffffffc02024f4 <default_alloc_pages+0x2c>
ffffffffc02024e6:	ff87a703          	lw	a4,-8(a5)
ffffffffc02024ea:	02071693          	slli	a3,a4,0x20
ffffffffc02024ee:	9281                	srli	a3,a3,0x20
ffffffffc02024f0:	00c6f763          	bgeu	a3,a2,ffffffffc02024fe <default_alloc_pages+0x36>
ffffffffc02024f4:	679c                	ld	a5,8(a5)
ffffffffc02024f6:	feb798e3          	bne	a5,a1,ffffffffc02024e6 <default_alloc_pages+0x1e>
ffffffffc02024fa:	4501                	li	a0,0
ffffffffc02024fc:	8082                	ret
ffffffffc02024fe:	0007b883          	ld	a7,0(a5)
ffffffffc0202502:	0087b303          	ld	t1,8(a5)
ffffffffc0202506:	fe078513          	addi	a0,a5,-32
ffffffffc020250a:	00060e1b          	sext.w	t3,a2
ffffffffc020250e:	0068b423          	sd	t1,8(a7)
ffffffffc0202512:	01133023          	sd	a7,0(t1)
ffffffffc0202516:	02d67b63          	bgeu	a2,a3,ffffffffc020254c <default_alloc_pages+0x84>
ffffffffc020251a:	00361693          	slli	a3,a2,0x3
ffffffffc020251e:	96b2                	add	a3,a3,a2
ffffffffc0202520:	068e                	slli	a3,a3,0x3
ffffffffc0202522:	96aa                	add	a3,a3,a0
ffffffffc0202524:	41c7073b          	subw	a4,a4,t3
ffffffffc0202528:	ce98                	sw	a4,24(a3)
ffffffffc020252a:	00868613          	addi	a2,a3,8
ffffffffc020252e:	4709                	li	a4,2
ffffffffc0202530:	40e6302f          	amoor.d	zero,a4,(a2)
ffffffffc0202534:	0088b703          	ld	a4,8(a7)
ffffffffc0202538:	02068613          	addi	a2,a3,32
ffffffffc020253c:	0105a803          	lw	a6,16(a1)
ffffffffc0202540:	e310                	sd	a2,0(a4)
ffffffffc0202542:	00c8b423          	sd	a2,8(a7)
ffffffffc0202546:	f698                	sd	a4,40(a3)
ffffffffc0202548:	0316b023          	sd	a7,32(a3)
ffffffffc020254c:	41c8083b          	subw	a6,a6,t3
ffffffffc0202550:	0105a823          	sw	a6,16(a1)
ffffffffc0202554:	5775                	li	a4,-3
ffffffffc0202556:	17a1                	addi	a5,a5,-24
ffffffffc0202558:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc020255c:	8082                	ret
ffffffffc020255e:	1141                	addi	sp,sp,-16
ffffffffc0202560:	00003697          	auipc	a3,0x3
ffffffffc0202564:	a8868693          	addi	a3,a3,-1400 # ffffffffc0204fe8 <etext+0x1354>
ffffffffc0202568:	00002617          	auipc	a2,0x2
ffffffffc020256c:	e7860613          	addi	a2,a2,-392 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202570:	02f00593          	li	a1,47
ffffffffc0202574:	00002517          	auipc	a0,0x2
ffffffffc0202578:	76450513          	addi	a0,a0,1892 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020257c:	e406                	sd	ra,8(sp)
ffffffffc020257e:	b6ffd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0202582 <default_init_memmap>:
ffffffffc0202582:	1141                	addi	sp,sp,-16
ffffffffc0202584:	e406                	sd	ra,8(sp)
ffffffffc0202586:	c5f9                	beqz	a1,ffffffffc0202654 <default_init_memmap+0xd2>
ffffffffc0202588:	00359693          	slli	a3,a1,0x3
ffffffffc020258c:	96ae                	add	a3,a3,a1
ffffffffc020258e:	068e                	slli	a3,a3,0x3
ffffffffc0202590:	96aa                	add	a3,a3,a0
ffffffffc0202592:	87aa                	mv	a5,a0
ffffffffc0202594:	00d50f63          	beq	a0,a3,ffffffffc02025b2 <default_init_memmap+0x30>
ffffffffc0202598:	6798                	ld	a4,8(a5)
ffffffffc020259a:	8b05                	andi	a4,a4,1
ffffffffc020259c:	cf49                	beqz	a4,ffffffffc0202636 <default_init_memmap+0xb4>
ffffffffc020259e:	0007ac23          	sw	zero,24(a5)
ffffffffc02025a2:	0007b423          	sd	zero,8(a5)
ffffffffc02025a6:	0007a023          	sw	zero,0(a5)
ffffffffc02025aa:	04878793          	addi	a5,a5,72
ffffffffc02025ae:	fed795e3          	bne	a5,a3,ffffffffc0202598 <default_init_memmap+0x16>
ffffffffc02025b2:	2581                	sext.w	a1,a1
ffffffffc02025b4:	cd0c                	sw	a1,24(a0)
ffffffffc02025b6:	4789                	li	a5,2
ffffffffc02025b8:	00850713          	addi	a4,a0,8
ffffffffc02025bc:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc02025c0:	0000e697          	auipc	a3,0xe
ffffffffc02025c4:	ba868693          	addi	a3,a3,-1112 # ffffffffc0210168 <free_area>
ffffffffc02025c8:	4a98                	lw	a4,16(a3)
ffffffffc02025ca:	669c                	ld	a5,8(a3)
ffffffffc02025cc:	02050613          	addi	a2,a0,32
ffffffffc02025d0:	9db9                	addw	a1,a1,a4
ffffffffc02025d2:	ca8c                	sw	a1,16(a3)
ffffffffc02025d4:	04d78a63          	beq	a5,a3,ffffffffc0202628 <default_init_memmap+0xa6>
ffffffffc02025d8:	fe078713          	addi	a4,a5,-32
ffffffffc02025dc:	0006b803          	ld	a6,0(a3)
ffffffffc02025e0:	4581                	li	a1,0
ffffffffc02025e2:	00e56a63          	bltu	a0,a4,ffffffffc02025f6 <default_init_memmap+0x74>
ffffffffc02025e6:	6798                	ld	a4,8(a5)
ffffffffc02025e8:	02d70263          	beq	a4,a3,ffffffffc020260c <default_init_memmap+0x8a>
ffffffffc02025ec:	87ba                	mv	a5,a4
ffffffffc02025ee:	fe078713          	addi	a4,a5,-32
ffffffffc02025f2:	fee57ae3          	bgeu	a0,a4,ffffffffc02025e6 <default_init_memmap+0x64>
ffffffffc02025f6:	c199                	beqz	a1,ffffffffc02025fc <default_init_memmap+0x7a>
ffffffffc02025f8:	0106b023          	sd	a6,0(a3)
ffffffffc02025fc:	6398                	ld	a4,0(a5)
ffffffffc02025fe:	60a2                	ld	ra,8(sp)
ffffffffc0202600:	e390                	sd	a2,0(a5)
ffffffffc0202602:	e710                	sd	a2,8(a4)
ffffffffc0202604:	f51c                	sd	a5,40(a0)
ffffffffc0202606:	f118                	sd	a4,32(a0)
ffffffffc0202608:	0141                	addi	sp,sp,16
ffffffffc020260a:	8082                	ret
ffffffffc020260c:	e790                	sd	a2,8(a5)
ffffffffc020260e:	f514                	sd	a3,40(a0)
ffffffffc0202610:	6798                	ld	a4,8(a5)
ffffffffc0202612:	f11c                	sd	a5,32(a0)
ffffffffc0202614:	00d70663          	beq	a4,a3,ffffffffc0202620 <default_init_memmap+0x9e>
ffffffffc0202618:	8832                	mv	a6,a2
ffffffffc020261a:	4585                	li	a1,1
ffffffffc020261c:	87ba                	mv	a5,a4
ffffffffc020261e:	bfc1                	j	ffffffffc02025ee <default_init_memmap+0x6c>
ffffffffc0202620:	60a2                	ld	ra,8(sp)
ffffffffc0202622:	e290                	sd	a2,0(a3)
ffffffffc0202624:	0141                	addi	sp,sp,16
ffffffffc0202626:	8082                	ret
ffffffffc0202628:	60a2                	ld	ra,8(sp)
ffffffffc020262a:	e390                	sd	a2,0(a5)
ffffffffc020262c:	e790                	sd	a2,8(a5)
ffffffffc020262e:	f51c                	sd	a5,40(a0)
ffffffffc0202630:	f11c                	sd	a5,32(a0)
ffffffffc0202632:	0141                	addi	sp,sp,16
ffffffffc0202634:	8082                	ret
ffffffffc0202636:	00003697          	auipc	a3,0x3
ffffffffc020263a:	9e268693          	addi	a3,a3,-1566 # ffffffffc0205018 <etext+0x1384>
ffffffffc020263e:	00002617          	auipc	a2,0x2
ffffffffc0202642:	da260613          	addi	a2,a2,-606 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202646:	45d9                	li	a1,22
ffffffffc0202648:	00002517          	auipc	a0,0x2
ffffffffc020264c:	69050513          	addi	a0,a0,1680 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc0202650:	a9dfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202654:	00003697          	auipc	a3,0x3
ffffffffc0202658:	99468693          	addi	a3,a3,-1644 # ffffffffc0204fe8 <etext+0x1354>
ffffffffc020265c:	00002617          	auipc	a2,0x2
ffffffffc0202660:	d8460613          	addi	a2,a2,-636 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202664:	45cd                	li	a1,19
ffffffffc0202666:	00002517          	auipc	a0,0x2
ffffffffc020266a:	67250513          	addi	a0,a0,1650 # ffffffffc0204cd8 <etext+0x1044>
ffffffffc020266e:	a7ffd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0202672 <pa2page.part.0>:
ffffffffc0202672:	1141                	addi	sp,sp,-16
ffffffffc0202674:	00002617          	auipc	a2,0x2
ffffffffc0202678:	1bc60613          	addi	a2,a2,444 # ffffffffc0204830 <etext+0xb9c>
ffffffffc020267c:	06500593          	li	a1,101
ffffffffc0202680:	00002517          	auipc	a0,0x2
ffffffffc0202684:	1d050513          	addi	a0,a0,464 # ffffffffc0204850 <etext+0xbbc>
ffffffffc0202688:	e406                	sd	ra,8(sp)
ffffffffc020268a:	a63fd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc020268e <alloc_pages>:
ffffffffc020268e:	7139                	addi	sp,sp,-64
ffffffffc0202690:	f426                	sd	s1,40(sp)
ffffffffc0202692:	f04a                	sd	s2,32(sp)
ffffffffc0202694:	ec4e                	sd	s3,24(sp)
ffffffffc0202696:	e852                	sd	s4,16(sp)
ffffffffc0202698:	e456                	sd	s5,8(sp)
ffffffffc020269a:	e05a                	sd	s6,0(sp)
ffffffffc020269c:	fc06                	sd	ra,56(sp)
ffffffffc020269e:	f822                	sd	s0,48(sp)
ffffffffc02026a0:	84aa                	mv	s1,a0
ffffffffc02026a2:	0000e917          	auipc	s2,0xe
ffffffffc02026a6:	ade90913          	addi	s2,s2,-1314 # ffffffffc0210180 <pmm_manager>
ffffffffc02026aa:	4a05                	li	s4,1
ffffffffc02026ac:	0000ea97          	auipc	s5,0xe
ffffffffc02026b0:	9b4a8a93          	addi	s5,s5,-1612 # ffffffffc0210060 <swap_init_ok>
ffffffffc02026b4:	0005099b          	sext.w	s3,a0
ffffffffc02026b8:	0000eb17          	auipc	s6,0xe
ffffffffc02026bc:	9e0b0b13          	addi	s6,s6,-1568 # ffffffffc0210098 <check_mm_struct>
ffffffffc02026c0:	a01d                	j	ffffffffc02026e6 <alloc_pages+0x58>
ffffffffc02026c2:	00093783          	ld	a5,0(s2)
ffffffffc02026c6:	6f9c                	ld	a5,24(a5)
ffffffffc02026c8:	9782                	jalr	a5
ffffffffc02026ca:	842a                	mv	s0,a0
ffffffffc02026cc:	4601                	li	a2,0
ffffffffc02026ce:	85ce                	mv	a1,s3
ffffffffc02026d0:	ec0d                	bnez	s0,ffffffffc020270a <alloc_pages+0x7c>
ffffffffc02026d2:	029a6c63          	bltu	s4,s1,ffffffffc020270a <alloc_pages+0x7c>
ffffffffc02026d6:	000aa783          	lw	a5,0(s5)
ffffffffc02026da:	2781                	sext.w	a5,a5
ffffffffc02026dc:	c79d                	beqz	a5,ffffffffc020270a <alloc_pages+0x7c>
ffffffffc02026de:	000b3503          	ld	a0,0(s6)
ffffffffc02026e2:	b2eff0ef          	jal	ra,ffffffffc0201a10 <swap_out>
ffffffffc02026e6:	100027f3          	csrr	a5,sstatus
ffffffffc02026ea:	8b89                	andi	a5,a5,2
ffffffffc02026ec:	8526                	mv	a0,s1
ffffffffc02026ee:	dbf1                	beqz	a5,ffffffffc02026c2 <alloc_pages+0x34>
ffffffffc02026f0:	b05fd0ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc02026f4:	00093783          	ld	a5,0(s2)
ffffffffc02026f8:	8526                	mv	a0,s1
ffffffffc02026fa:	6f9c                	ld	a5,24(a5)
ffffffffc02026fc:	9782                	jalr	a5
ffffffffc02026fe:	842a                	mv	s0,a0
ffffffffc0202700:	aeffd0ef          	jal	ra,ffffffffc02001ee <intr_enable>
ffffffffc0202704:	4601                	li	a2,0
ffffffffc0202706:	85ce                	mv	a1,s3
ffffffffc0202708:	d469                	beqz	s0,ffffffffc02026d2 <alloc_pages+0x44>
ffffffffc020270a:	70e2                	ld	ra,56(sp)
ffffffffc020270c:	8522                	mv	a0,s0
ffffffffc020270e:	7442                	ld	s0,48(sp)
ffffffffc0202710:	74a2                	ld	s1,40(sp)
ffffffffc0202712:	7902                	ld	s2,32(sp)
ffffffffc0202714:	69e2                	ld	s3,24(sp)
ffffffffc0202716:	6a42                	ld	s4,16(sp)
ffffffffc0202718:	6aa2                	ld	s5,8(sp)
ffffffffc020271a:	6b02                	ld	s6,0(sp)
ffffffffc020271c:	6121                	addi	sp,sp,64
ffffffffc020271e:	8082                	ret

ffffffffc0202720 <free_pages>:
ffffffffc0202720:	100027f3          	csrr	a5,sstatus
ffffffffc0202724:	8b89                	andi	a5,a5,2
ffffffffc0202726:	eb81                	bnez	a5,ffffffffc0202736 <free_pages+0x16>
ffffffffc0202728:	0000e797          	auipc	a5,0xe
ffffffffc020272c:	a587b783          	ld	a5,-1448(a5) # ffffffffc0210180 <pmm_manager>
ffffffffc0202730:	0207b303          	ld	t1,32(a5)
ffffffffc0202734:	8302                	jr	t1
ffffffffc0202736:	1101                	addi	sp,sp,-32
ffffffffc0202738:	ec06                	sd	ra,24(sp)
ffffffffc020273a:	e822                	sd	s0,16(sp)
ffffffffc020273c:	e426                	sd	s1,8(sp)
ffffffffc020273e:	842a                	mv	s0,a0
ffffffffc0202740:	84ae                	mv	s1,a1
ffffffffc0202742:	ab3fd0ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc0202746:	0000e797          	auipc	a5,0xe
ffffffffc020274a:	a3a7b783          	ld	a5,-1478(a5) # ffffffffc0210180 <pmm_manager>
ffffffffc020274e:	739c                	ld	a5,32(a5)
ffffffffc0202750:	85a6                	mv	a1,s1
ffffffffc0202752:	8522                	mv	a0,s0
ffffffffc0202754:	9782                	jalr	a5
ffffffffc0202756:	6442                	ld	s0,16(sp)
ffffffffc0202758:	60e2                	ld	ra,24(sp)
ffffffffc020275a:	64a2                	ld	s1,8(sp)
ffffffffc020275c:	6105                	addi	sp,sp,32
ffffffffc020275e:	a91fd06f          	j	ffffffffc02001ee <intr_enable>

ffffffffc0202762 <nr_free_pages>:
ffffffffc0202762:	100027f3          	csrr	a5,sstatus
ffffffffc0202766:	8b89                	andi	a5,a5,2
ffffffffc0202768:	eb81                	bnez	a5,ffffffffc0202778 <nr_free_pages+0x16>
ffffffffc020276a:	0000e797          	auipc	a5,0xe
ffffffffc020276e:	a167b783          	ld	a5,-1514(a5) # ffffffffc0210180 <pmm_manager>
ffffffffc0202772:	0287b303          	ld	t1,40(a5)
ffffffffc0202776:	8302                	jr	t1
ffffffffc0202778:	1141                	addi	sp,sp,-16
ffffffffc020277a:	e406                	sd	ra,8(sp)
ffffffffc020277c:	e022                	sd	s0,0(sp)
ffffffffc020277e:	a77fd0ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc0202782:	0000e797          	auipc	a5,0xe
ffffffffc0202786:	9fe7b783          	ld	a5,-1538(a5) # ffffffffc0210180 <pmm_manager>
ffffffffc020278a:	779c                	ld	a5,40(a5)
ffffffffc020278c:	9782                	jalr	a5
ffffffffc020278e:	842a                	mv	s0,a0
ffffffffc0202790:	a5ffd0ef          	jal	ra,ffffffffc02001ee <intr_enable>
ffffffffc0202794:	60a2                	ld	ra,8(sp)
ffffffffc0202796:	8522                	mv	a0,s0
ffffffffc0202798:	6402                	ld	s0,0(sp)
ffffffffc020279a:	0141                	addi	sp,sp,16
ffffffffc020279c:	8082                	ret

ffffffffc020279e <get_pte>:
ffffffffc020279e:	01e5d793          	srli	a5,a1,0x1e
ffffffffc02027a2:	1ff7f793          	andi	a5,a5,511
ffffffffc02027a6:	715d                	addi	sp,sp,-80
ffffffffc02027a8:	078e                	slli	a5,a5,0x3
ffffffffc02027aa:	fc26                	sd	s1,56(sp)
ffffffffc02027ac:	00f504b3          	add	s1,a0,a5
ffffffffc02027b0:	6094                	ld	a3,0(s1)
ffffffffc02027b2:	f84a                	sd	s2,48(sp)
ffffffffc02027b4:	f44e                	sd	s3,40(sp)
ffffffffc02027b6:	f052                	sd	s4,32(sp)
ffffffffc02027b8:	e486                	sd	ra,72(sp)
ffffffffc02027ba:	e0a2                	sd	s0,64(sp)
ffffffffc02027bc:	ec56                	sd	s5,24(sp)
ffffffffc02027be:	e85a                	sd	s6,16(sp)
ffffffffc02027c0:	e45e                	sd	s7,8(sp)
ffffffffc02027c2:	0016f793          	andi	a5,a3,1
ffffffffc02027c6:	892e                	mv	s2,a1
ffffffffc02027c8:	8a32                	mv	s4,a2
ffffffffc02027ca:	0000e997          	auipc	s3,0xe
ffffffffc02027ce:	8a698993          	addi	s3,s3,-1882 # ffffffffc0210070 <npage>
ffffffffc02027d2:	efb5                	bnez	a5,ffffffffc020284e <get_pte+0xb0>
ffffffffc02027d4:	14060c63          	beqz	a2,ffffffffc020292c <get_pte+0x18e>
ffffffffc02027d8:	4505                	li	a0,1
ffffffffc02027da:	eb5ff0ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc02027de:	842a                	mv	s0,a0
ffffffffc02027e0:	14050663          	beqz	a0,ffffffffc020292c <get_pte+0x18e>
ffffffffc02027e4:	0000eb97          	auipc	s7,0xe
ffffffffc02027e8:	9b4b8b93          	addi	s7,s7,-1612 # ffffffffc0210198 <pages>
ffffffffc02027ec:	000bb503          	ld	a0,0(s7)
ffffffffc02027f0:	00003b17          	auipc	s6,0x3
ffffffffc02027f4:	100b3b03          	ld	s6,256(s6) # ffffffffc02058f0 <error_string+0x38>
ffffffffc02027f8:	00080ab7          	lui	s5,0x80
ffffffffc02027fc:	40a40533          	sub	a0,s0,a0
ffffffffc0202800:	850d                	srai	a0,a0,0x3
ffffffffc0202802:	03650533          	mul	a0,a0,s6
ffffffffc0202806:	0000e997          	auipc	s3,0xe
ffffffffc020280a:	86a98993          	addi	s3,s3,-1942 # ffffffffc0210070 <npage>
ffffffffc020280e:	4785                	li	a5,1
ffffffffc0202810:	0009b703          	ld	a4,0(s3)
ffffffffc0202814:	c01c                	sw	a5,0(s0)
ffffffffc0202816:	9556                	add	a0,a0,s5
ffffffffc0202818:	00c51793          	slli	a5,a0,0xc
ffffffffc020281c:	83b1                	srli	a5,a5,0xc
ffffffffc020281e:	0532                	slli	a0,a0,0xc
ffffffffc0202820:	14e7fd63          	bgeu	a5,a4,ffffffffc020297a <get_pte+0x1dc>
ffffffffc0202824:	0000e797          	auipc	a5,0xe
ffffffffc0202828:	96c7b783          	ld	a5,-1684(a5) # ffffffffc0210190 <va_pa_offset>
ffffffffc020282c:	6605                	lui	a2,0x1
ffffffffc020282e:	4581                	li	a1,0
ffffffffc0202830:	953e                	add	a0,a0,a5
ffffffffc0202832:	04a010ef          	jal	ra,ffffffffc020387c <memset>
ffffffffc0202836:	000bb683          	ld	a3,0(s7)
ffffffffc020283a:	40d406b3          	sub	a3,s0,a3
ffffffffc020283e:	868d                	srai	a3,a3,0x3
ffffffffc0202840:	036686b3          	mul	a3,a3,s6
ffffffffc0202844:	96d6                	add	a3,a3,s5
ffffffffc0202846:	06aa                	slli	a3,a3,0xa
ffffffffc0202848:	0116e693          	ori	a3,a3,17
ffffffffc020284c:	e094                	sd	a3,0(s1)
ffffffffc020284e:	77fd                	lui	a5,0xfffff
ffffffffc0202850:	068a                	slli	a3,a3,0x2
ffffffffc0202852:	0009b703          	ld	a4,0(s3)
ffffffffc0202856:	8efd                	and	a3,a3,a5
ffffffffc0202858:	00c6d793          	srli	a5,a3,0xc
ffffffffc020285c:	0ce7fa63          	bgeu	a5,a4,ffffffffc0202930 <get_pte+0x192>
ffffffffc0202860:	0000ea97          	auipc	s5,0xe
ffffffffc0202864:	930a8a93          	addi	s5,s5,-1744 # ffffffffc0210190 <va_pa_offset>
ffffffffc0202868:	000ab403          	ld	s0,0(s5)
ffffffffc020286c:	01595793          	srli	a5,s2,0x15
ffffffffc0202870:	1ff7f793          	andi	a5,a5,511
ffffffffc0202874:	96a2                	add	a3,a3,s0
ffffffffc0202876:	00379413          	slli	s0,a5,0x3
ffffffffc020287a:	9436                	add	s0,s0,a3
ffffffffc020287c:	6014                	ld	a3,0(s0)
ffffffffc020287e:	0016f793          	andi	a5,a3,1
ffffffffc0202882:	ebad                	bnez	a5,ffffffffc02028f4 <get_pte+0x156>
ffffffffc0202884:	0a0a0463          	beqz	s4,ffffffffc020292c <get_pte+0x18e>
ffffffffc0202888:	4505                	li	a0,1
ffffffffc020288a:	e05ff0ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc020288e:	84aa                	mv	s1,a0
ffffffffc0202890:	cd51                	beqz	a0,ffffffffc020292c <get_pte+0x18e>
ffffffffc0202892:	0000eb97          	auipc	s7,0xe
ffffffffc0202896:	906b8b93          	addi	s7,s7,-1786 # ffffffffc0210198 <pages>
ffffffffc020289a:	000bb503          	ld	a0,0(s7)
ffffffffc020289e:	00003b17          	auipc	s6,0x3
ffffffffc02028a2:	052b3b03          	ld	s6,82(s6) # ffffffffc02058f0 <error_string+0x38>
ffffffffc02028a6:	00080a37          	lui	s4,0x80
ffffffffc02028aa:	40a48533          	sub	a0,s1,a0
ffffffffc02028ae:	850d                	srai	a0,a0,0x3
ffffffffc02028b0:	03650533          	mul	a0,a0,s6
ffffffffc02028b4:	4785                	li	a5,1
ffffffffc02028b6:	0009b703          	ld	a4,0(s3)
ffffffffc02028ba:	c09c                	sw	a5,0(s1)
ffffffffc02028bc:	9552                	add	a0,a0,s4
ffffffffc02028be:	00c51793          	slli	a5,a0,0xc
ffffffffc02028c2:	83b1                	srli	a5,a5,0xc
ffffffffc02028c4:	0532                	slli	a0,a0,0xc
ffffffffc02028c6:	08e7fd63          	bgeu	a5,a4,ffffffffc0202960 <get_pte+0x1c2>
ffffffffc02028ca:	000ab783          	ld	a5,0(s5)
ffffffffc02028ce:	6605                	lui	a2,0x1
ffffffffc02028d0:	4581                	li	a1,0
ffffffffc02028d2:	953e                	add	a0,a0,a5
ffffffffc02028d4:	7a9000ef          	jal	ra,ffffffffc020387c <memset>
ffffffffc02028d8:	000bb683          	ld	a3,0(s7)
ffffffffc02028dc:	40d486b3          	sub	a3,s1,a3
ffffffffc02028e0:	868d                	srai	a3,a3,0x3
ffffffffc02028e2:	036686b3          	mul	a3,a3,s6
ffffffffc02028e6:	96d2                	add	a3,a3,s4
ffffffffc02028e8:	06aa                	slli	a3,a3,0xa
ffffffffc02028ea:	0116e693          	ori	a3,a3,17
ffffffffc02028ee:	e014                	sd	a3,0(s0)
ffffffffc02028f0:	0009b703          	ld	a4,0(s3)
ffffffffc02028f4:	068a                	slli	a3,a3,0x2
ffffffffc02028f6:	757d                	lui	a0,0xfffff
ffffffffc02028f8:	8ee9                	and	a3,a3,a0
ffffffffc02028fa:	00c6d793          	srli	a5,a3,0xc
ffffffffc02028fe:	04e7f563          	bgeu	a5,a4,ffffffffc0202948 <get_pte+0x1aa>
ffffffffc0202902:	000ab503          	ld	a0,0(s5)
ffffffffc0202906:	00c95913          	srli	s2,s2,0xc
ffffffffc020290a:	1ff97913          	andi	s2,s2,511
ffffffffc020290e:	96aa                	add	a3,a3,a0
ffffffffc0202910:	00391513          	slli	a0,s2,0x3
ffffffffc0202914:	9536                	add	a0,a0,a3
ffffffffc0202916:	60a6                	ld	ra,72(sp)
ffffffffc0202918:	6406                	ld	s0,64(sp)
ffffffffc020291a:	74e2                	ld	s1,56(sp)
ffffffffc020291c:	7942                	ld	s2,48(sp)
ffffffffc020291e:	79a2                	ld	s3,40(sp)
ffffffffc0202920:	7a02                	ld	s4,32(sp)
ffffffffc0202922:	6ae2                	ld	s5,24(sp)
ffffffffc0202924:	6b42                	ld	s6,16(sp)
ffffffffc0202926:	6ba2                	ld	s7,8(sp)
ffffffffc0202928:	6161                	addi	sp,sp,80
ffffffffc020292a:	8082                	ret
ffffffffc020292c:	4501                	li	a0,0
ffffffffc020292e:	b7e5                	j	ffffffffc0202916 <get_pte+0x178>
ffffffffc0202930:	00002617          	auipc	a2,0x2
ffffffffc0202934:	74860613          	addi	a2,a2,1864 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc0202938:	0e800593          	li	a1,232
ffffffffc020293c:	00002517          	auipc	a0,0x2
ffffffffc0202940:	76450513          	addi	a0,a0,1892 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0202944:	fa8fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202948:	00002617          	auipc	a2,0x2
ffffffffc020294c:	73060613          	addi	a2,a2,1840 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc0202950:	0f300593          	li	a1,243
ffffffffc0202954:	00002517          	auipc	a0,0x2
ffffffffc0202958:	74c50513          	addi	a0,a0,1868 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc020295c:	f90fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202960:	86aa                	mv	a3,a0
ffffffffc0202962:	00002617          	auipc	a2,0x2
ffffffffc0202966:	71660613          	addi	a2,a2,1814 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc020296a:	0f000593          	li	a1,240
ffffffffc020296e:	00002517          	auipc	a0,0x2
ffffffffc0202972:	73250513          	addi	a0,a0,1842 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0202976:	f76fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020297a:	86aa                	mv	a3,a0
ffffffffc020297c:	00002617          	auipc	a2,0x2
ffffffffc0202980:	6fc60613          	addi	a2,a2,1788 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc0202984:	0e500593          	li	a1,229
ffffffffc0202988:	00002517          	auipc	a0,0x2
ffffffffc020298c:	71850513          	addi	a0,a0,1816 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0202990:	f5cfd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0202994 <get_page>:
ffffffffc0202994:	1141                	addi	sp,sp,-16
ffffffffc0202996:	e022                	sd	s0,0(sp)
ffffffffc0202998:	8432                	mv	s0,a2
ffffffffc020299a:	4601                	li	a2,0
ffffffffc020299c:	e406                	sd	ra,8(sp)
ffffffffc020299e:	e01ff0ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc02029a2:	c011                	beqz	s0,ffffffffc02029a6 <get_page+0x12>
ffffffffc02029a4:	e008                	sd	a0,0(s0)
ffffffffc02029a6:	c511                	beqz	a0,ffffffffc02029b2 <get_page+0x1e>
ffffffffc02029a8:	611c                	ld	a5,0(a0)
ffffffffc02029aa:	4501                	li	a0,0
ffffffffc02029ac:	0017f713          	andi	a4,a5,1
ffffffffc02029b0:	e709                	bnez	a4,ffffffffc02029ba <get_page+0x26>
ffffffffc02029b2:	60a2                	ld	ra,8(sp)
ffffffffc02029b4:	6402                	ld	s0,0(sp)
ffffffffc02029b6:	0141                	addi	sp,sp,16
ffffffffc02029b8:	8082                	ret
ffffffffc02029ba:	078a                	slli	a5,a5,0x2
ffffffffc02029bc:	83b1                	srli	a5,a5,0xc
ffffffffc02029be:	0000d717          	auipc	a4,0xd
ffffffffc02029c2:	6b273703          	ld	a4,1714(a4) # ffffffffc0210070 <npage>
ffffffffc02029c6:	02e7f263          	bgeu	a5,a4,ffffffffc02029ea <get_page+0x56>
ffffffffc02029ca:	fff80537          	lui	a0,0xfff80
ffffffffc02029ce:	97aa                	add	a5,a5,a0
ffffffffc02029d0:	60a2                	ld	ra,8(sp)
ffffffffc02029d2:	6402                	ld	s0,0(sp)
ffffffffc02029d4:	00379513          	slli	a0,a5,0x3
ffffffffc02029d8:	97aa                	add	a5,a5,a0
ffffffffc02029da:	078e                	slli	a5,a5,0x3
ffffffffc02029dc:	0000d517          	auipc	a0,0xd
ffffffffc02029e0:	7bc53503          	ld	a0,1980(a0) # ffffffffc0210198 <pages>
ffffffffc02029e4:	953e                	add	a0,a0,a5
ffffffffc02029e6:	0141                	addi	sp,sp,16
ffffffffc02029e8:	8082                	ret
ffffffffc02029ea:	c89ff0ef          	jal	ra,ffffffffc0202672 <pa2page.part.0>

ffffffffc02029ee <page_remove>:
ffffffffc02029ee:	1141                	addi	sp,sp,-16
ffffffffc02029f0:	4601                	li	a2,0
ffffffffc02029f2:	e406                	sd	ra,8(sp)
ffffffffc02029f4:	e022                	sd	s0,0(sp)
ffffffffc02029f6:	da9ff0ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc02029fa:	c511                	beqz	a0,ffffffffc0202a06 <page_remove+0x18>
ffffffffc02029fc:	611c                	ld	a5,0(a0)
ffffffffc02029fe:	842a                	mv	s0,a0
ffffffffc0202a00:	0017f713          	andi	a4,a5,1
ffffffffc0202a04:	e709                	bnez	a4,ffffffffc0202a0e <page_remove+0x20>
ffffffffc0202a06:	60a2                	ld	ra,8(sp)
ffffffffc0202a08:	6402                	ld	s0,0(sp)
ffffffffc0202a0a:	0141                	addi	sp,sp,16
ffffffffc0202a0c:	8082                	ret
ffffffffc0202a0e:	078a                	slli	a5,a5,0x2
ffffffffc0202a10:	83b1                	srli	a5,a5,0xc
ffffffffc0202a12:	0000d717          	auipc	a4,0xd
ffffffffc0202a16:	65e73703          	ld	a4,1630(a4) # ffffffffc0210070 <npage>
ffffffffc0202a1a:	02e7ff63          	bgeu	a5,a4,ffffffffc0202a58 <page_remove+0x6a>
ffffffffc0202a1e:	fff80737          	lui	a4,0xfff80
ffffffffc0202a22:	97ba                	add	a5,a5,a4
ffffffffc0202a24:	00379513          	slli	a0,a5,0x3
ffffffffc0202a28:	97aa                	add	a5,a5,a0
ffffffffc0202a2a:	078e                	slli	a5,a5,0x3
ffffffffc0202a2c:	0000d517          	auipc	a0,0xd
ffffffffc0202a30:	76c53503          	ld	a0,1900(a0) # ffffffffc0210198 <pages>
ffffffffc0202a34:	953e                	add	a0,a0,a5
ffffffffc0202a36:	411c                	lw	a5,0(a0)
ffffffffc0202a38:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202a3c:	c118                	sw	a4,0(a0)
ffffffffc0202a3e:	cb09                	beqz	a4,ffffffffc0202a50 <page_remove+0x62>
ffffffffc0202a40:	00043023          	sd	zero,0(s0)
ffffffffc0202a44:	12000073          	sfence.vma
ffffffffc0202a48:	60a2                	ld	ra,8(sp)
ffffffffc0202a4a:	6402                	ld	s0,0(sp)
ffffffffc0202a4c:	0141                	addi	sp,sp,16
ffffffffc0202a4e:	8082                	ret
ffffffffc0202a50:	4585                	li	a1,1
ffffffffc0202a52:	ccfff0ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0202a56:	b7ed                	j	ffffffffc0202a40 <page_remove+0x52>
ffffffffc0202a58:	c1bff0ef          	jal	ra,ffffffffc0202672 <pa2page.part.0>

ffffffffc0202a5c <page_insert>:
ffffffffc0202a5c:	7179                	addi	sp,sp,-48
ffffffffc0202a5e:	87b2                	mv	a5,a2
ffffffffc0202a60:	f022                	sd	s0,32(sp)
ffffffffc0202a62:	4605                	li	a2,1
ffffffffc0202a64:	842e                	mv	s0,a1
ffffffffc0202a66:	85be                	mv	a1,a5
ffffffffc0202a68:	ec26                	sd	s1,24(sp)
ffffffffc0202a6a:	f406                	sd	ra,40(sp)
ffffffffc0202a6c:	e84a                	sd	s2,16(sp)
ffffffffc0202a6e:	e44e                	sd	s3,8(sp)
ffffffffc0202a70:	84b6                	mv	s1,a3
ffffffffc0202a72:	d2dff0ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc0202a76:	c54d                	beqz	a0,ffffffffc0202b20 <page_insert+0xc4>
ffffffffc0202a78:	4014                	lw	a3,0(s0)
ffffffffc0202a7a:	611c                	ld	a5,0(a0)
ffffffffc0202a7c:	892a                	mv	s2,a0
ffffffffc0202a7e:	0016871b          	addiw	a4,a3,1
ffffffffc0202a82:	c018                	sw	a4,0(s0)
ffffffffc0202a84:	0017f713          	andi	a4,a5,1
ffffffffc0202a88:	e329                	bnez	a4,ffffffffc0202aca <page_insert+0x6e>
ffffffffc0202a8a:	0000d797          	auipc	a5,0xd
ffffffffc0202a8e:	70e7b783          	ld	a5,1806(a5) # ffffffffc0210198 <pages>
ffffffffc0202a92:	40f407b3          	sub	a5,s0,a5
ffffffffc0202a96:	878d                	srai	a5,a5,0x3
ffffffffc0202a98:	00003417          	auipc	s0,0x3
ffffffffc0202a9c:	e5843403          	ld	s0,-424(s0) # ffffffffc02058f0 <error_string+0x38>
ffffffffc0202aa0:	028787b3          	mul	a5,a5,s0
ffffffffc0202aa4:	00080437          	lui	s0,0x80
ffffffffc0202aa8:	97a2                	add	a5,a5,s0
ffffffffc0202aaa:	07aa                	slli	a5,a5,0xa
ffffffffc0202aac:	8fc5                	or	a5,a5,s1
ffffffffc0202aae:	0017e793          	ori	a5,a5,1
ffffffffc0202ab2:	00f93023          	sd	a5,0(s2)
ffffffffc0202ab6:	12000073          	sfence.vma
ffffffffc0202aba:	4501                	li	a0,0
ffffffffc0202abc:	70a2                	ld	ra,40(sp)
ffffffffc0202abe:	7402                	ld	s0,32(sp)
ffffffffc0202ac0:	64e2                	ld	s1,24(sp)
ffffffffc0202ac2:	6942                	ld	s2,16(sp)
ffffffffc0202ac4:	69a2                	ld	s3,8(sp)
ffffffffc0202ac6:	6145                	addi	sp,sp,48
ffffffffc0202ac8:	8082                	ret
ffffffffc0202aca:	00279513          	slli	a0,a5,0x2
ffffffffc0202ace:	8131                	srli	a0,a0,0xc
ffffffffc0202ad0:	0000d797          	auipc	a5,0xd
ffffffffc0202ad4:	5a07b783          	ld	a5,1440(a5) # ffffffffc0210070 <npage>
ffffffffc0202ad8:	04f57663          	bgeu	a0,a5,ffffffffc0202b24 <page_insert+0xc8>
ffffffffc0202adc:	fff807b7          	lui	a5,0xfff80
ffffffffc0202ae0:	953e                	add	a0,a0,a5
ffffffffc0202ae2:	0000d997          	auipc	s3,0xd
ffffffffc0202ae6:	6b698993          	addi	s3,s3,1718 # ffffffffc0210198 <pages>
ffffffffc0202aea:	0009b783          	ld	a5,0(s3)
ffffffffc0202aee:	00351713          	slli	a4,a0,0x3
ffffffffc0202af2:	953a                	add	a0,a0,a4
ffffffffc0202af4:	050e                	slli	a0,a0,0x3
ffffffffc0202af6:	953e                	add	a0,a0,a5
ffffffffc0202af8:	00a40e63          	beq	s0,a0,ffffffffc0202b14 <page_insert+0xb8>
ffffffffc0202afc:	411c                	lw	a5,0(a0)
ffffffffc0202afe:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202b02:	c118                	sw	a4,0(a0)
ffffffffc0202b04:	cb11                	beqz	a4,ffffffffc0202b18 <page_insert+0xbc>
ffffffffc0202b06:	00093023          	sd	zero,0(s2)
ffffffffc0202b0a:	12000073          	sfence.vma
ffffffffc0202b0e:	0009b783          	ld	a5,0(s3)
ffffffffc0202b12:	b741                	j	ffffffffc0202a92 <page_insert+0x36>
ffffffffc0202b14:	c014                	sw	a3,0(s0)
ffffffffc0202b16:	bfb5                	j	ffffffffc0202a92 <page_insert+0x36>
ffffffffc0202b18:	4585                	li	a1,1
ffffffffc0202b1a:	c07ff0ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0202b1e:	b7e5                	j	ffffffffc0202b06 <page_insert+0xaa>
ffffffffc0202b20:	5571                	li	a0,-4
ffffffffc0202b22:	bf69                	j	ffffffffc0202abc <page_insert+0x60>
ffffffffc0202b24:	b4fff0ef          	jal	ra,ffffffffc0202672 <pa2page.part.0>

ffffffffc0202b28 <pmm_init>:
ffffffffc0202b28:	00002797          	auipc	a5,0x2
ffffffffc0202b2c:	51878793          	addi	a5,a5,1304 # ffffffffc0205040 <default_pmm_manager>
ffffffffc0202b30:	638c                	ld	a1,0(a5)
ffffffffc0202b32:	7139                	addi	sp,sp,-64
ffffffffc0202b34:	fc06                	sd	ra,56(sp)
ffffffffc0202b36:	f822                	sd	s0,48(sp)
ffffffffc0202b38:	f426                	sd	s1,40(sp)
ffffffffc0202b3a:	f04a                	sd	s2,32(sp)
ffffffffc0202b3c:	ec4e                	sd	s3,24(sp)
ffffffffc0202b3e:	e852                	sd	s4,16(sp)
ffffffffc0202b40:	e456                	sd	s5,8(sp)
ffffffffc0202b42:	e05a                	sd	s6,0(sp)
ffffffffc0202b44:	0000da17          	auipc	s4,0xd
ffffffffc0202b48:	63ca0a13          	addi	s4,s4,1596 # ffffffffc0210180 <pmm_manager>
ffffffffc0202b4c:	00002517          	auipc	a0,0x2
ffffffffc0202b50:	56450513          	addi	a0,a0,1380 # ffffffffc02050b0 <default_pmm_manager+0x70>
ffffffffc0202b54:	00fa3023          	sd	a5,0(s4)
ffffffffc0202b58:	d5efd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202b5c:	000a3783          	ld	a5,0(s4)
ffffffffc0202b60:	40100913          	li	s2,1025
ffffffffc0202b64:	4445                	li	s0,17
ffffffffc0202b66:	679c                	ld	a5,8(a5)
ffffffffc0202b68:	0000d997          	auipc	s3,0xd
ffffffffc0202b6c:	62898993          	addi	s3,s3,1576 # ffffffffc0210190 <va_pa_offset>
ffffffffc0202b70:	0000d497          	auipc	s1,0xd
ffffffffc0202b74:	50048493          	addi	s1,s1,1280 # ffffffffc0210070 <npage>
ffffffffc0202b78:	9782                	jalr	a5
ffffffffc0202b7a:	57f5                	li	a5,-3
ffffffffc0202b7c:	07fa                	slli	a5,a5,0x1e
ffffffffc0202b7e:	01591593          	slli	a1,s2,0x15
ffffffffc0202b82:	07e006b7          	lui	a3,0x7e00
ffffffffc0202b86:	01b41613          	slli	a2,s0,0x1b
ffffffffc0202b8a:	00002517          	auipc	a0,0x2
ffffffffc0202b8e:	53e50513          	addi	a0,a0,1342 # ffffffffc02050c8 <default_pmm_manager+0x88>
ffffffffc0202b92:	00f9b023          	sd	a5,0(s3)
ffffffffc0202b96:	d20fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202b9a:	00002517          	auipc	a0,0x2
ffffffffc0202b9e:	55e50513          	addi	a0,a0,1374 # ffffffffc02050f8 <default_pmm_manager+0xb8>
ffffffffc0202ba2:	d14fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202ba6:	01b41693          	slli	a3,s0,0x1b
ffffffffc0202baa:	01591613          	slli	a2,s2,0x15
ffffffffc0202bae:	16fd                	addi	a3,a3,-1
ffffffffc0202bb0:	07e005b7          	lui	a1,0x7e00
ffffffffc0202bb4:	00002517          	auipc	a0,0x2
ffffffffc0202bb8:	55c50513          	addi	a0,a0,1372 # ffffffffc0205110 <default_pmm_manager+0xd0>
ffffffffc0202bbc:	cfafd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202bc0:	777d                	lui	a4,0xfffff
ffffffffc0202bc2:	0000e797          	auipc	a5,0xe
ffffffffc0202bc6:	5dd78793          	addi	a5,a5,1501 # ffffffffc021119f <end+0xfff>
ffffffffc0202bca:	8ff9                	and	a5,a5,a4
ffffffffc0202bcc:	0000d917          	auipc	s2,0xd
ffffffffc0202bd0:	5cc90913          	addi	s2,s2,1484 # ffffffffc0210198 <pages>
ffffffffc0202bd4:	00088737          	lui	a4,0x88
ffffffffc0202bd8:	e098                	sd	a4,0(s1)
ffffffffc0202bda:	00f93023          	sd	a5,0(s2)
ffffffffc0202bde:	4681                	li	a3,0
ffffffffc0202be0:	4701                	li	a4,0
ffffffffc0202be2:	4585                	li	a1,1
ffffffffc0202be4:	fff80637          	lui	a2,0xfff80
ffffffffc0202be8:	a019                	j	ffffffffc0202bee <pmm_init+0xc6>
ffffffffc0202bea:	00093783          	ld	a5,0(s2)
ffffffffc0202bee:	97b6                	add	a5,a5,a3
ffffffffc0202bf0:	07a1                	addi	a5,a5,8
ffffffffc0202bf2:	40b7b02f          	amoor.d	zero,a1,(a5)
ffffffffc0202bf6:	609c                	ld	a5,0(s1)
ffffffffc0202bf8:	0705                	addi	a4,a4,1
ffffffffc0202bfa:	04868693          	addi	a3,a3,72 # 7e00048 <kern_entry-0xffffffffb83fffb8>
ffffffffc0202bfe:	00c78533          	add	a0,a5,a2
ffffffffc0202c02:	fea764e3          	bltu	a4,a0,ffffffffc0202bea <pmm_init+0xc2>
ffffffffc0202c06:	00093503          	ld	a0,0(s2)
ffffffffc0202c0a:	00379693          	slli	a3,a5,0x3
ffffffffc0202c0e:	96be                	add	a3,a3,a5
ffffffffc0202c10:	fdc00737          	lui	a4,0xfdc00
ffffffffc0202c14:	972a                	add	a4,a4,a0
ffffffffc0202c16:	068e                	slli	a3,a3,0x3
ffffffffc0202c18:	96ba                	add	a3,a3,a4
ffffffffc0202c1a:	c0200737          	lui	a4,0xc0200
ffffffffc0202c1e:	68e6ef63          	bltu	a3,a4,ffffffffc02032bc <pmm_init+0x794>
ffffffffc0202c22:	0009b703          	ld	a4,0(s3)
ffffffffc0202c26:	45c5                	li	a1,17
ffffffffc0202c28:	05ee                	slli	a1,a1,0x1b
ffffffffc0202c2a:	8e99                	sub	a3,a3,a4
ffffffffc0202c2c:	34b6ec63          	bltu	a3,a1,ffffffffc0202f84 <pmm_init+0x45c>
ffffffffc0202c30:	000a3783          	ld	a5,0(s4)
ffffffffc0202c34:	0000d417          	auipc	s0,0xd
ffffffffc0202c38:	43440413          	addi	s0,s0,1076 # ffffffffc0210068 <boot_pgdir>
ffffffffc0202c3c:	7b9c                	ld	a5,48(a5)
ffffffffc0202c3e:	9782                	jalr	a5
ffffffffc0202c40:	00002517          	auipc	a0,0x2
ffffffffc0202c44:	52050513          	addi	a0,a0,1312 # ffffffffc0205160 <default_pmm_manager+0x120>
ffffffffc0202c48:	c6efd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202c4c:	00005517          	auipc	a0,0x5
ffffffffc0202c50:	3b450513          	addi	a0,a0,948 # ffffffffc0208000 <boot_page_table_sv39>
ffffffffc0202c54:	e008                	sd	a0,0(s0)
ffffffffc0202c56:	c02007b7          	lui	a5,0xc0200
ffffffffc0202c5a:	7af56963          	bltu	a0,a5,ffffffffc020340c <pmm_init+0x8e4>
ffffffffc0202c5e:	0009b783          	ld	a5,0(s3)
ffffffffc0202c62:	6098                	ld	a4,0(s1)
ffffffffc0202c64:	40f507b3          	sub	a5,a0,a5
ffffffffc0202c68:	0000d697          	auipc	a3,0xd
ffffffffc0202c6c:	52f6b023          	sd	a5,1312(a3) # ffffffffc0210188 <boot_satp>
ffffffffc0202c70:	c80007b7          	lui	a5,0xc8000
ffffffffc0202c74:	83b1                	srli	a5,a5,0xc
ffffffffc0202c76:	76e7eb63          	bltu	a5,a4,ffffffffc02033ec <pmm_init+0x8c4>
ffffffffc0202c7a:	03451793          	slli	a5,a0,0x34
ffffffffc0202c7e:	3a079563          	bnez	a5,ffffffffc0203028 <pmm_init+0x500>
ffffffffc0202c82:	4601                	li	a2,0
ffffffffc0202c84:	4581                	li	a1,0
ffffffffc0202c86:	d0fff0ef          	jal	ra,ffffffffc0202994 <get_page>
ffffffffc0202c8a:	74051163          	bnez	a0,ffffffffc02033cc <pmm_init+0x8a4>
ffffffffc0202c8e:	4505                	li	a0,1
ffffffffc0202c90:	9ffff0ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0202c94:	8a2a                	mv	s4,a0
ffffffffc0202c96:	6008                	ld	a0,0(s0)
ffffffffc0202c98:	4681                	li	a3,0
ffffffffc0202c9a:	4601                	li	a2,0
ffffffffc0202c9c:	85d2                	mv	a1,s4
ffffffffc0202c9e:	dbfff0ef          	jal	ra,ffffffffc0202a5c <page_insert>
ffffffffc0202ca2:	3a051363          	bnez	a0,ffffffffc0203048 <pmm_init+0x520>
ffffffffc0202ca6:	6008                	ld	a0,0(s0)
ffffffffc0202ca8:	4601                	li	a2,0
ffffffffc0202caa:	4581                	li	a1,0
ffffffffc0202cac:	af3ff0ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc0202cb0:	7a050b63          	beqz	a0,ffffffffc0203466 <pmm_init+0x93e>
ffffffffc0202cb4:	611c                	ld	a5,0(a0)
ffffffffc0202cb6:	0017f713          	andi	a4,a5,1
ffffffffc0202cba:	34070b63          	beqz	a4,ffffffffc0203010 <pmm_init+0x4e8>
ffffffffc0202cbe:	6090                	ld	a2,0(s1)
ffffffffc0202cc0:	078a                	slli	a5,a5,0x2
ffffffffc0202cc2:	83b1                	srli	a5,a5,0xc
ffffffffc0202cc4:	34c7f463          	bgeu	a5,a2,ffffffffc020300c <pmm_init+0x4e4>
ffffffffc0202cc8:	fff80737          	lui	a4,0xfff80
ffffffffc0202ccc:	97ba                	add	a5,a5,a4
ffffffffc0202cce:	00093683          	ld	a3,0(s2)
ffffffffc0202cd2:	00379713          	slli	a4,a5,0x3
ffffffffc0202cd6:	97ba                	add	a5,a5,a4
ffffffffc0202cd8:	078e                	slli	a5,a5,0x3
ffffffffc0202cda:	97b6                	add	a5,a5,a3
ffffffffc0202cdc:	4cfa1063          	bne	s4,a5,ffffffffc020319c <pmm_init+0x674>
ffffffffc0202ce0:	000a2703          	lw	a4,0(s4)
ffffffffc0202ce4:	4785                	li	a5,1
ffffffffc0202ce6:	48f71b63          	bne	a4,a5,ffffffffc020317c <pmm_init+0x654>
ffffffffc0202cea:	6008                	ld	a0,0(s0)
ffffffffc0202cec:	76fd                	lui	a3,0xfffff
ffffffffc0202cee:	611c                	ld	a5,0(a0)
ffffffffc0202cf0:	078a                	slli	a5,a5,0x2
ffffffffc0202cf2:	8ff5                	and	a5,a5,a3
ffffffffc0202cf4:	00c7d713          	srli	a4,a5,0xc
ffffffffc0202cf8:	46c77563          	bgeu	a4,a2,ffffffffc0203162 <pmm_init+0x63a>
ffffffffc0202cfc:	0009bb03          	ld	s6,0(s3)
ffffffffc0202d00:	97da                	add	a5,a5,s6
ffffffffc0202d02:	0007ba83          	ld	s5,0(a5) # ffffffffc8000000 <end+0x7defe60>
ffffffffc0202d06:	0a8a                	slli	s5,s5,0x2
ffffffffc0202d08:	00dafab3          	and	s5,s5,a3
ffffffffc0202d0c:	00cad793          	srli	a5,s5,0xc
ffffffffc0202d10:	42c7fc63          	bgeu	a5,a2,ffffffffc0203148 <pmm_init+0x620>
ffffffffc0202d14:	4601                	li	a2,0
ffffffffc0202d16:	6585                	lui	a1,0x1
ffffffffc0202d18:	9ada                	add	s5,s5,s6
ffffffffc0202d1a:	a85ff0ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc0202d1e:	0aa1                	addi	s5,s5,8
ffffffffc0202d20:	41551463          	bne	a0,s5,ffffffffc0203128 <pmm_init+0x600>
ffffffffc0202d24:	4505                	li	a0,1
ffffffffc0202d26:	969ff0ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0202d2a:	8aaa                	mv	s5,a0
ffffffffc0202d2c:	6008                	ld	a0,0(s0)
ffffffffc0202d2e:	46d1                	li	a3,20
ffffffffc0202d30:	6605                	lui	a2,0x1
ffffffffc0202d32:	85d6                	mv	a1,s5
ffffffffc0202d34:	d29ff0ef          	jal	ra,ffffffffc0202a5c <page_insert>
ffffffffc0202d38:	3c051863          	bnez	a0,ffffffffc0203108 <pmm_init+0x5e0>
ffffffffc0202d3c:	6008                	ld	a0,0(s0)
ffffffffc0202d3e:	4601                	li	a2,0
ffffffffc0202d40:	6585                	lui	a1,0x1
ffffffffc0202d42:	a5dff0ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc0202d46:	3a050163          	beqz	a0,ffffffffc02030e8 <pmm_init+0x5c0>
ffffffffc0202d4a:	611c                	ld	a5,0(a0)
ffffffffc0202d4c:	0107f713          	andi	a4,a5,16
ffffffffc0202d50:	36070c63          	beqz	a4,ffffffffc02030c8 <pmm_init+0x5a0>
ffffffffc0202d54:	8b91                	andi	a5,a5,4
ffffffffc0202d56:	30078963          	beqz	a5,ffffffffc0203068 <pmm_init+0x540>
ffffffffc0202d5a:	6008                	ld	a0,0(s0)
ffffffffc0202d5c:	611c                	ld	a5,0(a0)
ffffffffc0202d5e:	8bc1                	andi	a5,a5,16
ffffffffc0202d60:	50078e63          	beqz	a5,ffffffffc020327c <pmm_init+0x754>
ffffffffc0202d64:	000aa703          	lw	a4,0(s5)
ffffffffc0202d68:	4785                	li	a5,1
ffffffffc0202d6a:	4ef71963          	bne	a4,a5,ffffffffc020325c <pmm_init+0x734>
ffffffffc0202d6e:	4681                	li	a3,0
ffffffffc0202d70:	6605                	lui	a2,0x1
ffffffffc0202d72:	85d2                	mv	a1,s4
ffffffffc0202d74:	ce9ff0ef          	jal	ra,ffffffffc0202a5c <page_insert>
ffffffffc0202d78:	4c051263          	bnez	a0,ffffffffc020323c <pmm_init+0x714>
ffffffffc0202d7c:	000a2703          	lw	a4,0(s4)
ffffffffc0202d80:	4789                	li	a5,2
ffffffffc0202d82:	48f71d63          	bne	a4,a5,ffffffffc020321c <pmm_init+0x6f4>
ffffffffc0202d86:	000aa783          	lw	a5,0(s5)
ffffffffc0202d8a:	46079963          	bnez	a5,ffffffffc02031fc <pmm_init+0x6d4>
ffffffffc0202d8e:	6008                	ld	a0,0(s0)
ffffffffc0202d90:	4601                	li	a2,0
ffffffffc0202d92:	6585                	lui	a1,0x1
ffffffffc0202d94:	a0bff0ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc0202d98:	44050263          	beqz	a0,ffffffffc02031dc <pmm_init+0x6b4>
ffffffffc0202d9c:	6114                	ld	a3,0(a0)
ffffffffc0202d9e:	0016f793          	andi	a5,a3,1
ffffffffc0202da2:	26078763          	beqz	a5,ffffffffc0203010 <pmm_init+0x4e8>
ffffffffc0202da6:	6098                	ld	a4,0(s1)
ffffffffc0202da8:	00269793          	slli	a5,a3,0x2
ffffffffc0202dac:	83b1                	srli	a5,a5,0xc
ffffffffc0202dae:	24e7ff63          	bgeu	a5,a4,ffffffffc020300c <pmm_init+0x4e4>
ffffffffc0202db2:	fff80737          	lui	a4,0xfff80
ffffffffc0202db6:	97ba                	add	a5,a5,a4
ffffffffc0202db8:	00093603          	ld	a2,0(s2)
ffffffffc0202dbc:	00379713          	slli	a4,a5,0x3
ffffffffc0202dc0:	97ba                	add	a5,a5,a4
ffffffffc0202dc2:	078e                	slli	a5,a5,0x3
ffffffffc0202dc4:	97b2                	add	a5,a5,a2
ffffffffc0202dc6:	3efa1b63          	bne	s4,a5,ffffffffc02031bc <pmm_init+0x694>
ffffffffc0202dca:	8ac1                	andi	a3,a3,16
ffffffffc0202dcc:	5c069063          	bnez	a3,ffffffffc020338c <pmm_init+0x864>
ffffffffc0202dd0:	6008                	ld	a0,0(s0)
ffffffffc0202dd2:	4581                	li	a1,0
ffffffffc0202dd4:	c1bff0ef          	jal	ra,ffffffffc02029ee <page_remove>
ffffffffc0202dd8:	000a2703          	lw	a4,0(s4)
ffffffffc0202ddc:	4785                	li	a5,1
ffffffffc0202dde:	2af71563          	bne	a4,a5,ffffffffc0203088 <pmm_init+0x560>
ffffffffc0202de2:	000aa783          	lw	a5,0(s5)
ffffffffc0202de6:	4a079b63          	bnez	a5,ffffffffc020329c <pmm_init+0x774>
ffffffffc0202dea:	6008                	ld	a0,0(s0)
ffffffffc0202dec:	6585                	lui	a1,0x1
ffffffffc0202dee:	c01ff0ef          	jal	ra,ffffffffc02029ee <page_remove>
ffffffffc0202df2:	000a2783          	lw	a5,0(s4)
ffffffffc0202df6:	2a079963          	bnez	a5,ffffffffc02030a8 <pmm_init+0x580>
ffffffffc0202dfa:	000aa783          	lw	a5,0(s5)
ffffffffc0202dfe:	64079463          	bnez	a5,ffffffffc0203446 <pmm_init+0x91e>
ffffffffc0202e02:	601c                	ld	a5,0(s0)
ffffffffc0202e04:	6098                	ld	a4,0(s1)
ffffffffc0202e06:	639c                	ld	a5,0(a5)
ffffffffc0202e08:	078a                	slli	a5,a5,0x2
ffffffffc0202e0a:	83b1                	srli	a5,a5,0xc
ffffffffc0202e0c:	20e7f063          	bgeu	a5,a4,ffffffffc020300c <pmm_init+0x4e4>
ffffffffc0202e10:	fff80537          	lui	a0,0xfff80
ffffffffc0202e14:	97aa                	add	a5,a5,a0
ffffffffc0202e16:	00379713          	slli	a4,a5,0x3
ffffffffc0202e1a:	00093503          	ld	a0,0(s2)
ffffffffc0202e1e:	97ba                	add	a5,a5,a4
ffffffffc0202e20:	078e                	slli	a5,a5,0x3
ffffffffc0202e22:	953e                	add	a0,a0,a5
ffffffffc0202e24:	4118                	lw	a4,0(a0)
ffffffffc0202e26:	4785                	li	a5,1
ffffffffc0202e28:	5ef71f63          	bne	a4,a5,ffffffffc0203426 <pmm_init+0x8fe>
ffffffffc0202e2c:	4585                	li	a1,1
ffffffffc0202e2e:	8f3ff0ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0202e32:	601c                	ld	a5,0(s0)
ffffffffc0202e34:	00002517          	auipc	a0,0x2
ffffffffc0202e38:	5f450513          	addi	a0,a0,1524 # ffffffffc0205428 <default_pmm_manager+0x3e8>
ffffffffc0202e3c:	c0200a37          	lui	s4,0xc0200
ffffffffc0202e40:	0007b023          	sd	zero,0(a5)
ffffffffc0202e44:	a72fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202e48:	609c                	ld	a5,0(s1)
ffffffffc0202e4a:	7b7d                	lui	s6,0xfffff
ffffffffc0202e4c:	6a85                	lui	s5,0x1
ffffffffc0202e4e:	00c79713          	slli	a4,a5,0xc
ffffffffc0202e52:	02ea7b63          	bgeu	s4,a4,ffffffffc0202e88 <pmm_init+0x360>
ffffffffc0202e56:	00ca5713          	srli	a4,s4,0xc
ffffffffc0202e5a:	6008                	ld	a0,0(s0)
ffffffffc0202e5c:	18f77b63          	bgeu	a4,a5,ffffffffc0202ff2 <pmm_init+0x4ca>
ffffffffc0202e60:	0009b583          	ld	a1,0(s3)
ffffffffc0202e64:	4601                	li	a2,0
ffffffffc0202e66:	95d2                	add	a1,a1,s4
ffffffffc0202e68:	937ff0ef          	jal	ra,ffffffffc020279e <get_pte>
ffffffffc0202e6c:	16050363          	beqz	a0,ffffffffc0202fd2 <pmm_init+0x4aa>
ffffffffc0202e70:	611c                	ld	a5,0(a0)
ffffffffc0202e72:	078a                	slli	a5,a5,0x2
ffffffffc0202e74:	0167f7b3          	and	a5,a5,s6
ffffffffc0202e78:	13479d63          	bne	a5,s4,ffffffffc0202fb2 <pmm_init+0x48a>
ffffffffc0202e7c:	609c                	ld	a5,0(s1)
ffffffffc0202e7e:	9a56                	add	s4,s4,s5
ffffffffc0202e80:	00c79713          	slli	a4,a5,0xc
ffffffffc0202e84:	fcea69e3          	bltu	s4,a4,ffffffffc0202e56 <pmm_init+0x32e>
ffffffffc0202e88:	601c                	ld	a5,0(s0)
ffffffffc0202e8a:	639c                	ld	a5,0(a5)
ffffffffc0202e8c:	52079063          	bnez	a5,ffffffffc02033ac <pmm_init+0x884>
ffffffffc0202e90:	4505                	li	a0,1
ffffffffc0202e92:	ffcff0ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0202e96:	8aaa                	mv	s5,a0
ffffffffc0202e98:	6008                	ld	a0,0(s0)
ffffffffc0202e9a:	4699                	li	a3,6
ffffffffc0202e9c:	10000613          	li	a2,256
ffffffffc0202ea0:	85d6                	mv	a1,s5
ffffffffc0202ea2:	bbbff0ef          	jal	ra,ffffffffc0202a5c <page_insert>
ffffffffc0202ea6:	46051763          	bnez	a0,ffffffffc0203314 <pmm_init+0x7ec>
ffffffffc0202eaa:	000aa703          	lw	a4,0(s5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0202eae:	4785                	li	a5,1
ffffffffc0202eb0:	44f71263          	bne	a4,a5,ffffffffc02032f4 <pmm_init+0x7cc>
ffffffffc0202eb4:	6008                	ld	a0,0(s0)
ffffffffc0202eb6:	6a05                	lui	s4,0x1
ffffffffc0202eb8:	4699                	li	a3,6
ffffffffc0202eba:	100a0613          	addi	a2,s4,256 # 1100 <kern_entry-0xffffffffc01fef00>
ffffffffc0202ebe:	85d6                	mv	a1,s5
ffffffffc0202ec0:	b9dff0ef          	jal	ra,ffffffffc0202a5c <page_insert>
ffffffffc0202ec4:	5c051163          	bnez	a0,ffffffffc0203486 <pmm_init+0x95e>
ffffffffc0202ec8:	000aa703          	lw	a4,0(s5)
ffffffffc0202ecc:	4789                	li	a5,2
ffffffffc0202ece:	48f71f63          	bne	a4,a5,ffffffffc020336c <pmm_init+0x844>
ffffffffc0202ed2:	00002597          	auipc	a1,0x2
ffffffffc0202ed6:	68e58593          	addi	a1,a1,1678 # ffffffffc0205560 <default_pmm_manager+0x520>
ffffffffc0202eda:	10000513          	li	a0,256
ffffffffc0202ede:	16f000ef          	jal	ra,ffffffffc020384c <strcpy>
ffffffffc0202ee2:	100a0593          	addi	a1,s4,256
ffffffffc0202ee6:	10000513          	li	a0,256
ffffffffc0202eea:	175000ef          	jal	ra,ffffffffc020385e <strcmp>
ffffffffc0202eee:	44051f63          	bnez	a0,ffffffffc020334c <pmm_init+0x824>
ffffffffc0202ef2:	00093683          	ld	a3,0(s2)
ffffffffc0202ef6:	00003797          	auipc	a5,0x3
ffffffffc0202efa:	9fa7b783          	ld	a5,-1542(a5) # ffffffffc02058f0 <error_string+0x38>
ffffffffc0202efe:	00080a37          	lui	s4,0x80
ffffffffc0202f02:	40da86b3          	sub	a3,s5,a3
ffffffffc0202f06:	868d                	srai	a3,a3,0x3
ffffffffc0202f08:	02f686b3          	mul	a3,a3,a5
ffffffffc0202f0c:	6098                	ld	a4,0(s1)
ffffffffc0202f0e:	96d2                	add	a3,a3,s4
ffffffffc0202f10:	00c69793          	slli	a5,a3,0xc
ffffffffc0202f14:	83b1                	srli	a5,a5,0xc
ffffffffc0202f16:	06b2                	slli	a3,a3,0xc
ffffffffc0202f18:	40e7fe63          	bgeu	a5,a4,ffffffffc0203334 <pmm_init+0x80c>
ffffffffc0202f1c:	0009b783          	ld	a5,0(s3)
ffffffffc0202f20:	10000513          	li	a0,256
ffffffffc0202f24:	96be                	add	a3,a3,a5
ffffffffc0202f26:	10068023          	sb	zero,256(a3) # fffffffffffff100 <end+0x3fdeef60>
ffffffffc0202f2a:	0ed000ef          	jal	ra,ffffffffc0203816 <strlen>
ffffffffc0202f2e:	3a051363          	bnez	a0,ffffffffc02032d4 <pmm_init+0x7ac>
ffffffffc0202f32:	4585                	li	a1,1
ffffffffc0202f34:	8556                	mv	a0,s5
ffffffffc0202f36:	feaff0ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0202f3a:	601c                	ld	a5,0(s0)
ffffffffc0202f3c:	6098                	ld	a4,0(s1)
ffffffffc0202f3e:	639c                	ld	a5,0(a5)
ffffffffc0202f40:	078a                	slli	a5,a5,0x2
ffffffffc0202f42:	83b1                	srli	a5,a5,0xc
ffffffffc0202f44:	0ce7f463          	bgeu	a5,a4,ffffffffc020300c <pmm_init+0x4e4>
ffffffffc0202f48:	414787b3          	sub	a5,a5,s4
ffffffffc0202f4c:	00093503          	ld	a0,0(s2)
ffffffffc0202f50:	00379713          	slli	a4,a5,0x3
ffffffffc0202f54:	97ba                	add	a5,a5,a4
ffffffffc0202f56:	078e                	slli	a5,a5,0x3
ffffffffc0202f58:	953e                	add	a0,a0,a5
ffffffffc0202f5a:	4585                	li	a1,1
ffffffffc0202f5c:	fc4ff0ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0202f60:	601c                	ld	a5,0(s0)
ffffffffc0202f62:	7442                	ld	s0,48(sp)
ffffffffc0202f64:	70e2                	ld	ra,56(sp)
ffffffffc0202f66:	74a2                	ld	s1,40(sp)
ffffffffc0202f68:	7902                	ld	s2,32(sp)
ffffffffc0202f6a:	69e2                	ld	s3,24(sp)
ffffffffc0202f6c:	6a42                	ld	s4,16(sp)
ffffffffc0202f6e:	6aa2                	ld	s5,8(sp)
ffffffffc0202f70:	6b02                	ld	s6,0(sp)
ffffffffc0202f72:	0007b023          	sd	zero,0(a5)
ffffffffc0202f76:	00002517          	auipc	a0,0x2
ffffffffc0202f7a:	66250513          	addi	a0,a0,1634 # ffffffffc02055d8 <default_pmm_manager+0x598>
ffffffffc0202f7e:	6121                	addi	sp,sp,64
ffffffffc0202f80:	936fd06f          	j	ffffffffc02000b6 <cprintf>
ffffffffc0202f84:	6705                	lui	a4,0x1
ffffffffc0202f86:	177d                	addi	a4,a4,-1
ffffffffc0202f88:	96ba                	add	a3,a3,a4
ffffffffc0202f8a:	00c6d713          	srli	a4,a3,0xc
ffffffffc0202f8e:	06f77f63          	bgeu	a4,a5,ffffffffc020300c <pmm_init+0x4e4>
ffffffffc0202f92:	000a3803          	ld	a6,0(s4) # 80000 <kern_entry-0xffffffffc0180000>
ffffffffc0202f96:	9732                	add	a4,a4,a2
ffffffffc0202f98:	00371793          	slli	a5,a4,0x3
ffffffffc0202f9c:	767d                	lui	a2,0xfffff
ffffffffc0202f9e:	8ef1                	and	a3,a3,a2
ffffffffc0202fa0:	97ba                	add	a5,a5,a4
ffffffffc0202fa2:	01083703          	ld	a4,16(a6)
ffffffffc0202fa6:	8d95                	sub	a1,a1,a3
ffffffffc0202fa8:	078e                	slli	a5,a5,0x3
ffffffffc0202faa:	81b1                	srli	a1,a1,0xc
ffffffffc0202fac:	953e                	add	a0,a0,a5
ffffffffc0202fae:	9702                	jalr	a4
ffffffffc0202fb0:	b141                	j	ffffffffc0202c30 <pmm_init+0x108>
ffffffffc0202fb2:	00002697          	auipc	a3,0x2
ffffffffc0202fb6:	4d668693          	addi	a3,a3,1238 # ffffffffc0205488 <default_pmm_manager+0x448>
ffffffffc0202fba:	00001617          	auipc	a2,0x1
ffffffffc0202fbe:	42660613          	addi	a2,a2,1062 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202fc2:	18b00593          	li	a1,395
ffffffffc0202fc6:	00002517          	auipc	a0,0x2
ffffffffc0202fca:	0da50513          	addi	a0,a0,218 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0202fce:	91efd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202fd2:	00002697          	auipc	a3,0x2
ffffffffc0202fd6:	47668693          	addi	a3,a3,1142 # ffffffffc0205448 <default_pmm_manager+0x408>
ffffffffc0202fda:	00001617          	auipc	a2,0x1
ffffffffc0202fde:	40660613          	addi	a2,a2,1030 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0202fe2:	18a00593          	li	a1,394
ffffffffc0202fe6:	00002517          	auipc	a0,0x2
ffffffffc0202fea:	0ba50513          	addi	a0,a0,186 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0202fee:	8fefd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202ff2:	86d2                	mv	a3,s4
ffffffffc0202ff4:	00002617          	auipc	a2,0x2
ffffffffc0202ff8:	08460613          	addi	a2,a2,132 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc0202ffc:	18a00593          	li	a1,394
ffffffffc0203000:	00002517          	auipc	a0,0x2
ffffffffc0203004:	0a050513          	addi	a0,a0,160 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203008:	8e4fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020300c:	e66ff0ef          	jal	ra,ffffffffc0202672 <pa2page.part.0>
ffffffffc0203010:	00002617          	auipc	a2,0x2
ffffffffc0203014:	b3860613          	addi	a2,a2,-1224 # ffffffffc0204b48 <etext+0xeb4>
ffffffffc0203018:	07000593          	li	a1,112
ffffffffc020301c:	00002517          	auipc	a0,0x2
ffffffffc0203020:	83450513          	addi	a0,a0,-1996 # ffffffffc0204850 <etext+0xbbc>
ffffffffc0203024:	8c8fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203028:	00002697          	auipc	a3,0x2
ffffffffc020302c:	17868693          	addi	a3,a3,376 # ffffffffc02051a0 <default_pmm_manager+0x160>
ffffffffc0203030:	00001617          	auipc	a2,0x1
ffffffffc0203034:	3b060613          	addi	a2,a2,944 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203038:	15900593          	li	a1,345
ffffffffc020303c:	00002517          	auipc	a0,0x2
ffffffffc0203040:	06450513          	addi	a0,a0,100 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203044:	8a8fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203048:	00002697          	auipc	a3,0x2
ffffffffc020304c:	1b868693          	addi	a3,a3,440 # ffffffffc0205200 <default_pmm_manager+0x1c0>
ffffffffc0203050:	00001617          	auipc	a2,0x1
ffffffffc0203054:	39060613          	addi	a2,a2,912 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203058:	15e00593          	li	a1,350
ffffffffc020305c:	00002517          	auipc	a0,0x2
ffffffffc0203060:	04450513          	addi	a0,a0,68 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203064:	888fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203068:	00002697          	auipc	a3,0x2
ffffffffc020306c:	2c868693          	addi	a3,a3,712 # ffffffffc0205330 <default_pmm_manager+0x2f0>
ffffffffc0203070:	00001617          	auipc	a2,0x1
ffffffffc0203074:	37060613          	addi	a2,a2,880 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203078:	16c00593          	li	a1,364
ffffffffc020307c:	00002517          	auipc	a0,0x2
ffffffffc0203080:	02450513          	addi	a0,a0,36 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203084:	868fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203088:	00002697          	auipc	a3,0x2
ffffffffc020308c:	1f068693          	addi	a3,a3,496 # ffffffffc0205278 <default_pmm_manager+0x238>
ffffffffc0203090:	00001617          	auipc	a2,0x1
ffffffffc0203094:	35060613          	addi	a2,a2,848 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203098:	17800593          	li	a1,376
ffffffffc020309c:	00002517          	auipc	a0,0x2
ffffffffc02030a0:	00450513          	addi	a0,a0,4 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02030a4:	848fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02030a8:	00002697          	auipc	a3,0x2
ffffffffc02030ac:	34068693          	addi	a3,a3,832 # ffffffffc02053e8 <default_pmm_manager+0x3a8>
ffffffffc02030b0:	00001617          	auipc	a2,0x1
ffffffffc02030b4:	33060613          	addi	a2,a2,816 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02030b8:	17c00593          	li	a1,380
ffffffffc02030bc:	00002517          	auipc	a0,0x2
ffffffffc02030c0:	fe450513          	addi	a0,a0,-28 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02030c4:	828fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02030c8:	00002697          	auipc	a3,0x2
ffffffffc02030cc:	25868693          	addi	a3,a3,600 # ffffffffc0205320 <default_pmm_manager+0x2e0>
ffffffffc02030d0:	00001617          	auipc	a2,0x1
ffffffffc02030d4:	31060613          	addi	a2,a2,784 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02030d8:	16b00593          	li	a1,363
ffffffffc02030dc:	00002517          	auipc	a0,0x2
ffffffffc02030e0:	fc450513          	addi	a0,a0,-60 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02030e4:	808fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02030e8:	00002697          	auipc	a3,0x2
ffffffffc02030ec:	20868693          	addi	a3,a3,520 # ffffffffc02052f0 <default_pmm_manager+0x2b0>
ffffffffc02030f0:	00001617          	auipc	a2,0x1
ffffffffc02030f4:	2f060613          	addi	a2,a2,752 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02030f8:	16a00593          	li	a1,362
ffffffffc02030fc:	00002517          	auipc	a0,0x2
ffffffffc0203100:	fa450513          	addi	a0,a0,-92 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203104:	fe9fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203108:	00002697          	auipc	a3,0x2
ffffffffc020310c:	1b068693          	addi	a3,a3,432 # ffffffffc02052b8 <default_pmm_manager+0x278>
ffffffffc0203110:	00001617          	auipc	a2,0x1
ffffffffc0203114:	2d060613          	addi	a2,a2,720 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203118:	16900593          	li	a1,361
ffffffffc020311c:	00002517          	auipc	a0,0x2
ffffffffc0203120:	f8450513          	addi	a0,a0,-124 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203124:	fc9fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203128:	00002697          	auipc	a3,0x2
ffffffffc020312c:	16868693          	addi	a3,a3,360 # ffffffffc0205290 <default_pmm_manager+0x250>
ffffffffc0203130:	00001617          	auipc	a2,0x1
ffffffffc0203134:	2b060613          	addi	a2,a2,688 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203138:	16600593          	li	a1,358
ffffffffc020313c:	00002517          	auipc	a0,0x2
ffffffffc0203140:	f6450513          	addi	a0,a0,-156 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203144:	fa9fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203148:	86d6                	mv	a3,s5
ffffffffc020314a:	00002617          	auipc	a2,0x2
ffffffffc020314e:	f2e60613          	addi	a2,a2,-210 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc0203152:	16500593          	li	a1,357
ffffffffc0203156:	00002517          	auipc	a0,0x2
ffffffffc020315a:	f4a50513          	addi	a0,a0,-182 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc020315e:	f8ffc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203162:	86be                	mv	a3,a5
ffffffffc0203164:	00002617          	auipc	a2,0x2
ffffffffc0203168:	f1460613          	addi	a2,a2,-236 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc020316c:	16400593          	li	a1,356
ffffffffc0203170:	00002517          	auipc	a0,0x2
ffffffffc0203174:	f3050513          	addi	a0,a0,-208 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203178:	f75fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020317c:	00002697          	auipc	a3,0x2
ffffffffc0203180:	0fc68693          	addi	a3,a3,252 # ffffffffc0205278 <default_pmm_manager+0x238>
ffffffffc0203184:	00001617          	auipc	a2,0x1
ffffffffc0203188:	25c60613          	addi	a2,a2,604 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020318c:	16200593          	li	a1,354
ffffffffc0203190:	00002517          	auipc	a0,0x2
ffffffffc0203194:	f1050513          	addi	a0,a0,-240 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203198:	f55fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020319c:	00002697          	auipc	a3,0x2
ffffffffc02031a0:	0c468693          	addi	a3,a3,196 # ffffffffc0205260 <default_pmm_manager+0x220>
ffffffffc02031a4:	00001617          	auipc	a2,0x1
ffffffffc02031a8:	23c60613          	addi	a2,a2,572 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02031ac:	16100593          	li	a1,353
ffffffffc02031b0:	00002517          	auipc	a0,0x2
ffffffffc02031b4:	ef050513          	addi	a0,a0,-272 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02031b8:	f35fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02031bc:	00002697          	auipc	a3,0x2
ffffffffc02031c0:	0a468693          	addi	a3,a3,164 # ffffffffc0205260 <default_pmm_manager+0x220>
ffffffffc02031c4:	00001617          	auipc	a2,0x1
ffffffffc02031c8:	21c60613          	addi	a2,a2,540 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02031cc:	17400593          	li	a1,372
ffffffffc02031d0:	00002517          	auipc	a0,0x2
ffffffffc02031d4:	ed050513          	addi	a0,a0,-304 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02031d8:	f15fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02031dc:	00002697          	auipc	a3,0x2
ffffffffc02031e0:	11468693          	addi	a3,a3,276 # ffffffffc02052f0 <default_pmm_manager+0x2b0>
ffffffffc02031e4:	00001617          	auipc	a2,0x1
ffffffffc02031e8:	1fc60613          	addi	a2,a2,508 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02031ec:	17300593          	li	a1,371
ffffffffc02031f0:	00002517          	auipc	a0,0x2
ffffffffc02031f4:	eb050513          	addi	a0,a0,-336 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02031f8:	ef5fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02031fc:	00002697          	auipc	a3,0x2
ffffffffc0203200:	1bc68693          	addi	a3,a3,444 # ffffffffc02053b8 <default_pmm_manager+0x378>
ffffffffc0203204:	00001617          	auipc	a2,0x1
ffffffffc0203208:	1dc60613          	addi	a2,a2,476 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020320c:	17200593          	li	a1,370
ffffffffc0203210:	00002517          	auipc	a0,0x2
ffffffffc0203214:	e9050513          	addi	a0,a0,-368 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203218:	ed5fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020321c:	00002697          	auipc	a3,0x2
ffffffffc0203220:	18468693          	addi	a3,a3,388 # ffffffffc02053a0 <default_pmm_manager+0x360>
ffffffffc0203224:	00001617          	auipc	a2,0x1
ffffffffc0203228:	1bc60613          	addi	a2,a2,444 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020322c:	17100593          	li	a1,369
ffffffffc0203230:	00002517          	auipc	a0,0x2
ffffffffc0203234:	e7050513          	addi	a0,a0,-400 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203238:	eb5fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020323c:	00002697          	auipc	a3,0x2
ffffffffc0203240:	13468693          	addi	a3,a3,308 # ffffffffc0205370 <default_pmm_manager+0x330>
ffffffffc0203244:	00001617          	auipc	a2,0x1
ffffffffc0203248:	19c60613          	addi	a2,a2,412 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020324c:	17000593          	li	a1,368
ffffffffc0203250:	00002517          	auipc	a0,0x2
ffffffffc0203254:	e5050513          	addi	a0,a0,-432 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203258:	e95fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020325c:	00002697          	auipc	a3,0x2
ffffffffc0203260:	0fc68693          	addi	a3,a3,252 # ffffffffc0205358 <default_pmm_manager+0x318>
ffffffffc0203264:	00001617          	auipc	a2,0x1
ffffffffc0203268:	17c60613          	addi	a2,a2,380 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020326c:	16e00593          	li	a1,366
ffffffffc0203270:	00002517          	auipc	a0,0x2
ffffffffc0203274:	e3050513          	addi	a0,a0,-464 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203278:	e75fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020327c:	00002697          	auipc	a3,0x2
ffffffffc0203280:	0c468693          	addi	a3,a3,196 # ffffffffc0205340 <default_pmm_manager+0x300>
ffffffffc0203284:	00001617          	auipc	a2,0x1
ffffffffc0203288:	15c60613          	addi	a2,a2,348 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020328c:	16d00593          	li	a1,365
ffffffffc0203290:	00002517          	auipc	a0,0x2
ffffffffc0203294:	e1050513          	addi	a0,a0,-496 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203298:	e55fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020329c:	00002697          	auipc	a3,0x2
ffffffffc02032a0:	11c68693          	addi	a3,a3,284 # ffffffffc02053b8 <default_pmm_manager+0x378>
ffffffffc02032a4:	00001617          	auipc	a2,0x1
ffffffffc02032a8:	13c60613          	addi	a2,a2,316 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02032ac:	17900593          	li	a1,377
ffffffffc02032b0:	00002517          	auipc	a0,0x2
ffffffffc02032b4:	df050513          	addi	a0,a0,-528 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02032b8:	e35fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02032bc:	00002617          	auipc	a2,0x2
ffffffffc02032c0:	e7c60613          	addi	a2,a2,-388 # ffffffffc0205138 <default_pmm_manager+0xf8>
ffffffffc02032c4:	07700593          	li	a1,119
ffffffffc02032c8:	00002517          	auipc	a0,0x2
ffffffffc02032cc:	dd850513          	addi	a0,a0,-552 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02032d0:	e1dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02032d4:	00002697          	auipc	a3,0x2
ffffffffc02032d8:	2dc68693          	addi	a3,a3,732 # ffffffffc02055b0 <default_pmm_manager+0x570>
ffffffffc02032dc:	00001617          	auipc	a2,0x1
ffffffffc02032e0:	10460613          	addi	a2,a2,260 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02032e4:	19d00593          	li	a1,413
ffffffffc02032e8:	00002517          	auipc	a0,0x2
ffffffffc02032ec:	db850513          	addi	a0,a0,-584 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02032f0:	dfdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02032f4:	00002697          	auipc	a3,0x2
ffffffffc02032f8:	1fc68693          	addi	a3,a3,508 # ffffffffc02054f0 <default_pmm_manager+0x4b0>
ffffffffc02032fc:	00001617          	auipc	a2,0x1
ffffffffc0203300:	0e460613          	addi	a2,a2,228 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203304:	19400593          	li	a1,404
ffffffffc0203308:	00002517          	auipc	a0,0x2
ffffffffc020330c:	d9850513          	addi	a0,a0,-616 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203310:	dddfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203314:	00002697          	auipc	a3,0x2
ffffffffc0203318:	1a468693          	addi	a3,a3,420 # ffffffffc02054b8 <default_pmm_manager+0x478>
ffffffffc020331c:	00001617          	auipc	a2,0x1
ffffffffc0203320:	0c460613          	addi	a2,a2,196 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203324:	19300593          	li	a1,403
ffffffffc0203328:	00002517          	auipc	a0,0x2
ffffffffc020332c:	d7850513          	addi	a0,a0,-648 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203330:	dbdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203334:	00002617          	auipc	a2,0x2
ffffffffc0203338:	d4460613          	addi	a2,a2,-700 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc020333c:	06a00593          	li	a1,106
ffffffffc0203340:	00001517          	auipc	a0,0x1
ffffffffc0203344:	51050513          	addi	a0,a0,1296 # ffffffffc0204850 <etext+0xbbc>
ffffffffc0203348:	da5fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020334c:	00002697          	auipc	a3,0x2
ffffffffc0203350:	22c68693          	addi	a3,a3,556 # ffffffffc0205578 <default_pmm_manager+0x538>
ffffffffc0203354:	00001617          	auipc	a2,0x1
ffffffffc0203358:	08c60613          	addi	a2,a2,140 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020335c:	19a00593          	li	a1,410
ffffffffc0203360:	00002517          	auipc	a0,0x2
ffffffffc0203364:	d4050513          	addi	a0,a0,-704 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203368:	d85fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020336c:	00002697          	auipc	a3,0x2
ffffffffc0203370:	1dc68693          	addi	a3,a3,476 # ffffffffc0205548 <default_pmm_manager+0x508>
ffffffffc0203374:	00001617          	auipc	a2,0x1
ffffffffc0203378:	06c60613          	addi	a2,a2,108 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020337c:	19600593          	li	a1,406
ffffffffc0203380:	00002517          	auipc	a0,0x2
ffffffffc0203384:	d2050513          	addi	a0,a0,-736 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203388:	d65fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020338c:	00002697          	auipc	a3,0x2
ffffffffc0203390:	04468693          	addi	a3,a3,68 # ffffffffc02053d0 <default_pmm_manager+0x390>
ffffffffc0203394:	00001617          	auipc	a2,0x1
ffffffffc0203398:	04c60613          	addi	a2,a2,76 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020339c:	17500593          	li	a1,373
ffffffffc02033a0:	00002517          	auipc	a0,0x2
ffffffffc02033a4:	d0050513          	addi	a0,a0,-768 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02033a8:	d45fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02033ac:	00002697          	auipc	a3,0x2
ffffffffc02033b0:	0f468693          	addi	a3,a3,244 # ffffffffc02054a0 <default_pmm_manager+0x460>
ffffffffc02033b4:	00001617          	auipc	a2,0x1
ffffffffc02033b8:	02c60613          	addi	a2,a2,44 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02033bc:	18f00593          	li	a1,399
ffffffffc02033c0:	00002517          	auipc	a0,0x2
ffffffffc02033c4:	ce050513          	addi	a0,a0,-800 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02033c8:	d25fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02033cc:	00002697          	auipc	a3,0x2
ffffffffc02033d0:	e0c68693          	addi	a3,a3,-500 # ffffffffc02051d8 <default_pmm_manager+0x198>
ffffffffc02033d4:	00001617          	auipc	a2,0x1
ffffffffc02033d8:	00c60613          	addi	a2,a2,12 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02033dc:	15a00593          	li	a1,346
ffffffffc02033e0:	00002517          	auipc	a0,0x2
ffffffffc02033e4:	cc050513          	addi	a0,a0,-832 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02033e8:	d05fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02033ec:	00002697          	auipc	a3,0x2
ffffffffc02033f0:	d9468693          	addi	a3,a3,-620 # ffffffffc0205180 <default_pmm_manager+0x140>
ffffffffc02033f4:	00001617          	auipc	a2,0x1
ffffffffc02033f8:	fec60613          	addi	a2,a2,-20 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02033fc:	15800593          	li	a1,344
ffffffffc0203400:	00002517          	auipc	a0,0x2
ffffffffc0203404:	ca050513          	addi	a0,a0,-864 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203408:	ce5fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020340c:	86aa                	mv	a3,a0
ffffffffc020340e:	00002617          	auipc	a2,0x2
ffffffffc0203412:	d2a60613          	addi	a2,a2,-726 # ffffffffc0205138 <default_pmm_manager+0xf8>
ffffffffc0203416:	0bd00593          	li	a1,189
ffffffffc020341a:	00002517          	auipc	a0,0x2
ffffffffc020341e:	c8650513          	addi	a0,a0,-890 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203422:	ccbfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203426:	00002697          	auipc	a3,0x2
ffffffffc020342a:	fda68693          	addi	a3,a3,-38 # ffffffffc0205400 <default_pmm_manager+0x3c0>
ffffffffc020342e:	00001617          	auipc	a2,0x1
ffffffffc0203432:	fb260613          	addi	a2,a2,-78 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203436:	17f00593          	li	a1,383
ffffffffc020343a:	00002517          	auipc	a0,0x2
ffffffffc020343e:	c6650513          	addi	a0,a0,-922 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203442:	cabfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203446:	00002697          	auipc	a3,0x2
ffffffffc020344a:	f7268693          	addi	a3,a3,-142 # ffffffffc02053b8 <default_pmm_manager+0x378>
ffffffffc020344e:	00001617          	auipc	a2,0x1
ffffffffc0203452:	f9260613          	addi	a2,a2,-110 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203456:	17d00593          	li	a1,381
ffffffffc020345a:	00002517          	auipc	a0,0x2
ffffffffc020345e:	c4650513          	addi	a0,a0,-954 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203462:	c8bfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203466:	00002697          	auipc	a3,0x2
ffffffffc020346a:	dca68693          	addi	a3,a3,-566 # ffffffffc0205230 <default_pmm_manager+0x1f0>
ffffffffc020346e:	00001617          	auipc	a2,0x1
ffffffffc0203472:	f7260613          	addi	a2,a2,-142 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203476:	16000593          	li	a1,352
ffffffffc020347a:	00002517          	auipc	a0,0x2
ffffffffc020347e:	c2650513          	addi	a0,a0,-986 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203482:	c6bfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203486:	00002697          	auipc	a3,0x2
ffffffffc020348a:	08268693          	addi	a3,a3,130 # ffffffffc0205508 <default_pmm_manager+0x4c8>
ffffffffc020348e:	00001617          	auipc	a2,0x1
ffffffffc0203492:	f5260613          	addi	a2,a2,-174 # ffffffffc02043e0 <etext+0x74c>
ffffffffc0203496:	19500593          	li	a1,405
ffffffffc020349a:	00002517          	auipc	a0,0x2
ffffffffc020349e:	c0650513          	addi	a0,a0,-1018 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02034a2:	c4bfc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02034a6 <tlb_invalidate>:
ffffffffc02034a6:	12000073          	sfence.vma
ffffffffc02034aa:	8082                	ret

ffffffffc02034ac <pgdir_alloc_page>:
ffffffffc02034ac:	7179                	addi	sp,sp,-48
ffffffffc02034ae:	e84a                	sd	s2,16(sp)
ffffffffc02034b0:	892a                	mv	s2,a0
ffffffffc02034b2:	4505                	li	a0,1
ffffffffc02034b4:	f022                	sd	s0,32(sp)
ffffffffc02034b6:	ec26                	sd	s1,24(sp)
ffffffffc02034b8:	e44e                	sd	s3,8(sp)
ffffffffc02034ba:	f406                	sd	ra,40(sp)
ffffffffc02034bc:	84ae                	mv	s1,a1
ffffffffc02034be:	89b2                	mv	s3,a2
ffffffffc02034c0:	9ceff0ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc02034c4:	842a                	mv	s0,a0
ffffffffc02034c6:	cd09                	beqz	a0,ffffffffc02034e0 <pgdir_alloc_page+0x34>
ffffffffc02034c8:	85aa                	mv	a1,a0
ffffffffc02034ca:	86ce                	mv	a3,s3
ffffffffc02034cc:	8626                	mv	a2,s1
ffffffffc02034ce:	854a                	mv	a0,s2
ffffffffc02034d0:	d8cff0ef          	jal	ra,ffffffffc0202a5c <page_insert>
ffffffffc02034d4:	ed21                	bnez	a0,ffffffffc020352c <pgdir_alloc_page+0x80>
ffffffffc02034d6:	0000d797          	auipc	a5,0xd
ffffffffc02034da:	b8a7a783          	lw	a5,-1142(a5) # ffffffffc0210060 <swap_init_ok>
ffffffffc02034de:	eb89                	bnez	a5,ffffffffc02034f0 <pgdir_alloc_page+0x44>
ffffffffc02034e0:	70a2                	ld	ra,40(sp)
ffffffffc02034e2:	8522                	mv	a0,s0
ffffffffc02034e4:	7402                	ld	s0,32(sp)
ffffffffc02034e6:	64e2                	ld	s1,24(sp)
ffffffffc02034e8:	6942                	ld	s2,16(sp)
ffffffffc02034ea:	69a2                	ld	s3,8(sp)
ffffffffc02034ec:	6145                	addi	sp,sp,48
ffffffffc02034ee:	8082                	ret
ffffffffc02034f0:	4681                	li	a3,0
ffffffffc02034f2:	8622                	mv	a2,s0
ffffffffc02034f4:	85a6                	mv	a1,s1
ffffffffc02034f6:	0000d517          	auipc	a0,0xd
ffffffffc02034fa:	ba253503          	ld	a0,-1118(a0) # ffffffffc0210098 <check_mm_struct>
ffffffffc02034fe:	d04fe0ef          	jal	ra,ffffffffc0201a02 <swap_map_swappable>
ffffffffc0203502:	4018                	lw	a4,0(s0)
ffffffffc0203504:	e024                	sd	s1,64(s0)
ffffffffc0203506:	4785                	li	a5,1
ffffffffc0203508:	fcf70ce3          	beq	a4,a5,ffffffffc02034e0 <pgdir_alloc_page+0x34>
ffffffffc020350c:	00002697          	auipc	a3,0x2
ffffffffc0203510:	0ec68693          	addi	a3,a3,236 # ffffffffc02055f8 <default_pmm_manager+0x5b8>
ffffffffc0203514:	00001617          	auipc	a2,0x1
ffffffffc0203518:	ecc60613          	addi	a2,a2,-308 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020351c:	14800593          	li	a1,328
ffffffffc0203520:	00002517          	auipc	a0,0x2
ffffffffc0203524:	b8050513          	addi	a0,a0,-1152 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203528:	bc5fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020352c:	8522                	mv	a0,s0
ffffffffc020352e:	4585                	li	a1,1
ffffffffc0203530:	9f0ff0ef          	jal	ra,ffffffffc0202720 <free_pages>
ffffffffc0203534:	4401                	li	s0,0
ffffffffc0203536:	b76d                	j	ffffffffc02034e0 <pgdir_alloc_page+0x34>

ffffffffc0203538 <kmalloc>:
ffffffffc0203538:	1141                	addi	sp,sp,-16
ffffffffc020353a:	67d5                	lui	a5,0x15
ffffffffc020353c:	e406                	sd	ra,8(sp)
ffffffffc020353e:	fff50713          	addi	a4,a0,-1
ffffffffc0203542:	17f9                	addi	a5,a5,-2
ffffffffc0203544:	04e7ea63          	bltu	a5,a4,ffffffffc0203598 <kmalloc+0x60>
ffffffffc0203548:	6785                	lui	a5,0x1
ffffffffc020354a:	17fd                	addi	a5,a5,-1
ffffffffc020354c:	953e                	add	a0,a0,a5
ffffffffc020354e:	8131                	srli	a0,a0,0xc
ffffffffc0203550:	93eff0ef          	jal	ra,ffffffffc020268e <alloc_pages>
ffffffffc0203554:	cd3d                	beqz	a0,ffffffffc02035d2 <kmalloc+0x9a>
ffffffffc0203556:	0000d797          	auipc	a5,0xd
ffffffffc020355a:	c427b783          	ld	a5,-958(a5) # ffffffffc0210198 <pages>
ffffffffc020355e:	8d1d                	sub	a0,a0,a5
ffffffffc0203560:	00002697          	auipc	a3,0x2
ffffffffc0203564:	3906b683          	ld	a3,912(a3) # ffffffffc02058f0 <error_string+0x38>
ffffffffc0203568:	850d                	srai	a0,a0,0x3
ffffffffc020356a:	02d50533          	mul	a0,a0,a3
ffffffffc020356e:	000806b7          	lui	a3,0x80
ffffffffc0203572:	0000d717          	auipc	a4,0xd
ffffffffc0203576:	afe73703          	ld	a4,-1282(a4) # ffffffffc0210070 <npage>
ffffffffc020357a:	9536                	add	a0,a0,a3
ffffffffc020357c:	00c51793          	slli	a5,a0,0xc
ffffffffc0203580:	83b1                	srli	a5,a5,0xc
ffffffffc0203582:	0532                	slli	a0,a0,0xc
ffffffffc0203584:	02e7fa63          	bgeu	a5,a4,ffffffffc02035b8 <kmalloc+0x80>
ffffffffc0203588:	60a2                	ld	ra,8(sp)
ffffffffc020358a:	0000d797          	auipc	a5,0xd
ffffffffc020358e:	c067b783          	ld	a5,-1018(a5) # ffffffffc0210190 <va_pa_offset>
ffffffffc0203592:	953e                	add	a0,a0,a5
ffffffffc0203594:	0141                	addi	sp,sp,16
ffffffffc0203596:	8082                	ret
ffffffffc0203598:	00002697          	auipc	a3,0x2
ffffffffc020359c:	07868693          	addi	a3,a3,120 # ffffffffc0205610 <default_pmm_manager+0x5d0>
ffffffffc02035a0:	00001617          	auipc	a2,0x1
ffffffffc02035a4:	e4060613          	addi	a2,a2,-448 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02035a8:	1a900593          	li	a1,425
ffffffffc02035ac:	00002517          	auipc	a0,0x2
ffffffffc02035b0:	af450513          	addi	a0,a0,-1292 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02035b4:	b39fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02035b8:	86aa                	mv	a3,a0
ffffffffc02035ba:	00002617          	auipc	a2,0x2
ffffffffc02035be:	abe60613          	addi	a2,a2,-1346 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc02035c2:	06a00593          	li	a1,106
ffffffffc02035c6:	00001517          	auipc	a0,0x1
ffffffffc02035ca:	28a50513          	addi	a0,a0,650 # ffffffffc0204850 <etext+0xbbc>
ffffffffc02035ce:	b1ffc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02035d2:	00002697          	auipc	a3,0x2
ffffffffc02035d6:	05e68693          	addi	a3,a3,94 # ffffffffc0205630 <default_pmm_manager+0x5f0>
ffffffffc02035da:	00001617          	auipc	a2,0x1
ffffffffc02035de:	e0660613          	addi	a2,a2,-506 # ffffffffc02043e0 <etext+0x74c>
ffffffffc02035e2:	1ac00593          	li	a1,428
ffffffffc02035e6:	00002517          	auipc	a0,0x2
ffffffffc02035ea:	aba50513          	addi	a0,a0,-1350 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02035ee:	afffc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02035f2 <kfree>:
ffffffffc02035f2:	1141                	addi	sp,sp,-16
ffffffffc02035f4:	67d5                	lui	a5,0x15
ffffffffc02035f6:	e406                	sd	ra,8(sp)
ffffffffc02035f8:	fff58713          	addi	a4,a1,-1
ffffffffc02035fc:	17f9                	addi	a5,a5,-2
ffffffffc02035fe:	04e7e763          	bltu	a5,a4,ffffffffc020364c <kfree+0x5a>
ffffffffc0203602:	c541                	beqz	a0,ffffffffc020368a <kfree+0x98>
ffffffffc0203604:	6785                	lui	a5,0x1
ffffffffc0203606:	17fd                	addi	a5,a5,-1
ffffffffc0203608:	95be                	add	a1,a1,a5
ffffffffc020360a:	c02007b7          	lui	a5,0xc0200
ffffffffc020360e:	81b1                	srli	a1,a1,0xc
ffffffffc0203610:	06f56063          	bltu	a0,a5,ffffffffc0203670 <kfree+0x7e>
ffffffffc0203614:	0000d697          	auipc	a3,0xd
ffffffffc0203618:	b7c6b683          	ld	a3,-1156(a3) # ffffffffc0210190 <va_pa_offset>
ffffffffc020361c:	8d15                	sub	a0,a0,a3
ffffffffc020361e:	8131                	srli	a0,a0,0xc
ffffffffc0203620:	0000d797          	auipc	a5,0xd
ffffffffc0203624:	a507b783          	ld	a5,-1456(a5) # ffffffffc0210070 <npage>
ffffffffc0203628:	04f57263          	bgeu	a0,a5,ffffffffc020366c <kfree+0x7a>
ffffffffc020362c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203630:	9536                	add	a0,a0,a3
ffffffffc0203632:	00351793          	slli	a5,a0,0x3
ffffffffc0203636:	60a2                	ld	ra,8(sp)
ffffffffc0203638:	953e                	add	a0,a0,a5
ffffffffc020363a:	050e                	slli	a0,a0,0x3
ffffffffc020363c:	0000d797          	auipc	a5,0xd
ffffffffc0203640:	b5c7b783          	ld	a5,-1188(a5) # ffffffffc0210198 <pages>
ffffffffc0203644:	953e                	add	a0,a0,a5
ffffffffc0203646:	0141                	addi	sp,sp,16
ffffffffc0203648:	8d8ff06f          	j	ffffffffc0202720 <free_pages>
ffffffffc020364c:	00002697          	auipc	a3,0x2
ffffffffc0203650:	fc468693          	addi	a3,a3,-60 # ffffffffc0205610 <default_pmm_manager+0x5d0>
ffffffffc0203654:	00001617          	auipc	a2,0x1
ffffffffc0203658:	d8c60613          	addi	a2,a2,-628 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020365c:	1b200593          	li	a1,434
ffffffffc0203660:	00002517          	auipc	a0,0x2
ffffffffc0203664:	a4050513          	addi	a0,a0,-1472 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc0203668:	a85fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020366c:	806ff0ef          	jal	ra,ffffffffc0202672 <pa2page.part.0>
ffffffffc0203670:	86aa                	mv	a3,a0
ffffffffc0203672:	00002617          	auipc	a2,0x2
ffffffffc0203676:	ac660613          	addi	a2,a2,-1338 # ffffffffc0205138 <default_pmm_manager+0xf8>
ffffffffc020367a:	06c00593          	li	a1,108
ffffffffc020367e:	00001517          	auipc	a0,0x1
ffffffffc0203682:	1d250513          	addi	a0,a0,466 # ffffffffc0204850 <etext+0xbbc>
ffffffffc0203686:	a67fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020368a:	00002697          	auipc	a3,0x2
ffffffffc020368e:	fb668693          	addi	a3,a3,-74 # ffffffffc0205640 <default_pmm_manager+0x600>
ffffffffc0203692:	00001617          	auipc	a2,0x1
ffffffffc0203696:	d4e60613          	addi	a2,a2,-690 # ffffffffc02043e0 <etext+0x74c>
ffffffffc020369a:	1b300593          	li	a1,435
ffffffffc020369e:	00002517          	auipc	a0,0x2
ffffffffc02036a2:	a0250513          	addi	a0,a0,-1534 # ffffffffc02050a0 <default_pmm_manager+0x60>
ffffffffc02036a6:	a47fc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02036aa <swapfs_init>:
ffffffffc02036aa:	1141                	addi	sp,sp,-16
ffffffffc02036ac:	4505                	li	a0,1
ffffffffc02036ae:	e406                	sd	ra,8(sp)
ffffffffc02036b0:	a9dfc0ef          	jal	ra,ffffffffc020014c <ide_device_valid>
ffffffffc02036b4:	cd01                	beqz	a0,ffffffffc02036cc <swapfs_init+0x22>
ffffffffc02036b6:	4505                	li	a0,1
ffffffffc02036b8:	a9bfc0ef          	jal	ra,ffffffffc0200152 <ide_device_size>
ffffffffc02036bc:	60a2                	ld	ra,8(sp)
ffffffffc02036be:	810d                	srli	a0,a0,0x3
ffffffffc02036c0:	0000d797          	auipc	a5,0xd
ffffffffc02036c4:	a6a7b423          	sd	a0,-1432(a5) # ffffffffc0210128 <max_swap_offset>
ffffffffc02036c8:	0141                	addi	sp,sp,16
ffffffffc02036ca:	8082                	ret
ffffffffc02036cc:	00002617          	auipc	a2,0x2
ffffffffc02036d0:	f8460613          	addi	a2,a2,-124 # ffffffffc0205650 <default_pmm_manager+0x610>
ffffffffc02036d4:	45b5                	li	a1,13
ffffffffc02036d6:	00002517          	auipc	a0,0x2
ffffffffc02036da:	f9a50513          	addi	a0,a0,-102 # ffffffffc0205670 <default_pmm_manager+0x630>
ffffffffc02036de:	a0ffc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02036e2 <swapfs_read>:
ffffffffc02036e2:	1141                	addi	sp,sp,-16
ffffffffc02036e4:	e406                	sd	ra,8(sp)
ffffffffc02036e6:	00855793          	srli	a5,a0,0x8
ffffffffc02036ea:	c3a5                	beqz	a5,ffffffffc020374a <swapfs_read+0x68>
ffffffffc02036ec:	0000d717          	auipc	a4,0xd
ffffffffc02036f0:	a3c73703          	ld	a4,-1476(a4) # ffffffffc0210128 <max_swap_offset>
ffffffffc02036f4:	04e7fb63          	bgeu	a5,a4,ffffffffc020374a <swapfs_read+0x68>
ffffffffc02036f8:	0000d617          	auipc	a2,0xd
ffffffffc02036fc:	aa063603          	ld	a2,-1376(a2) # ffffffffc0210198 <pages>
ffffffffc0203700:	8d91                	sub	a1,a1,a2
ffffffffc0203702:	4035d613          	srai	a2,a1,0x3
ffffffffc0203706:	00002597          	auipc	a1,0x2
ffffffffc020370a:	1ea5b583          	ld	a1,490(a1) # ffffffffc02058f0 <error_string+0x38>
ffffffffc020370e:	02b60633          	mul	a2,a2,a1
ffffffffc0203712:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203716:	00002797          	auipc	a5,0x2
ffffffffc020371a:	1e27b783          	ld	a5,482(a5) # ffffffffc02058f8 <nbase>
ffffffffc020371e:	0000d717          	auipc	a4,0xd
ffffffffc0203722:	95273703          	ld	a4,-1710(a4) # ffffffffc0210070 <npage>
ffffffffc0203726:	963e                	add	a2,a2,a5
ffffffffc0203728:	00c61793          	slli	a5,a2,0xc
ffffffffc020372c:	83b1                	srli	a5,a5,0xc
ffffffffc020372e:	0632                	slli	a2,a2,0xc
ffffffffc0203730:	02e7f963          	bgeu	a5,a4,ffffffffc0203762 <swapfs_read+0x80>
ffffffffc0203734:	60a2                	ld	ra,8(sp)
ffffffffc0203736:	0000d797          	auipc	a5,0xd
ffffffffc020373a:	a5a7b783          	ld	a5,-1446(a5) # ffffffffc0210190 <va_pa_offset>
ffffffffc020373e:	46a1                	li	a3,8
ffffffffc0203740:	963e                	add	a2,a2,a5
ffffffffc0203742:	4505                	li	a0,1
ffffffffc0203744:	0141                	addi	sp,sp,16
ffffffffc0203746:	a13fc06f          	j	ffffffffc0200158 <ide_read_secs>
ffffffffc020374a:	86aa                	mv	a3,a0
ffffffffc020374c:	00002617          	auipc	a2,0x2
ffffffffc0203750:	f3c60613          	addi	a2,a2,-196 # ffffffffc0205688 <default_pmm_manager+0x648>
ffffffffc0203754:	45d1                	li	a1,20
ffffffffc0203756:	00002517          	auipc	a0,0x2
ffffffffc020375a:	f1a50513          	addi	a0,a0,-230 # ffffffffc0205670 <default_pmm_manager+0x630>
ffffffffc020375e:	98ffc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203762:	86b2                	mv	a3,a2
ffffffffc0203764:	06a00593          	li	a1,106
ffffffffc0203768:	00002617          	auipc	a2,0x2
ffffffffc020376c:	91060613          	addi	a2,a2,-1776 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc0203770:	00001517          	auipc	a0,0x1
ffffffffc0203774:	0e050513          	addi	a0,a0,224 # ffffffffc0204850 <etext+0xbbc>
ffffffffc0203778:	975fc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc020377c <swapfs_write>:
ffffffffc020377c:	1141                	addi	sp,sp,-16
ffffffffc020377e:	e406                	sd	ra,8(sp)
ffffffffc0203780:	00855793          	srli	a5,a0,0x8
ffffffffc0203784:	c3a5                	beqz	a5,ffffffffc02037e4 <swapfs_write+0x68>
ffffffffc0203786:	0000d717          	auipc	a4,0xd
ffffffffc020378a:	9a273703          	ld	a4,-1630(a4) # ffffffffc0210128 <max_swap_offset>
ffffffffc020378e:	04e7fb63          	bgeu	a5,a4,ffffffffc02037e4 <swapfs_write+0x68>
ffffffffc0203792:	0000d617          	auipc	a2,0xd
ffffffffc0203796:	a0663603          	ld	a2,-1530(a2) # ffffffffc0210198 <pages>
ffffffffc020379a:	8d91                	sub	a1,a1,a2
ffffffffc020379c:	4035d613          	srai	a2,a1,0x3
ffffffffc02037a0:	00002597          	auipc	a1,0x2
ffffffffc02037a4:	1505b583          	ld	a1,336(a1) # ffffffffc02058f0 <error_string+0x38>
ffffffffc02037a8:	02b60633          	mul	a2,a2,a1
ffffffffc02037ac:	0037959b          	slliw	a1,a5,0x3
ffffffffc02037b0:	00002797          	auipc	a5,0x2
ffffffffc02037b4:	1487b783          	ld	a5,328(a5) # ffffffffc02058f8 <nbase>
ffffffffc02037b8:	0000d717          	auipc	a4,0xd
ffffffffc02037bc:	8b873703          	ld	a4,-1864(a4) # ffffffffc0210070 <npage>
ffffffffc02037c0:	963e                	add	a2,a2,a5
ffffffffc02037c2:	00c61793          	slli	a5,a2,0xc
ffffffffc02037c6:	83b1                	srli	a5,a5,0xc
ffffffffc02037c8:	0632                	slli	a2,a2,0xc
ffffffffc02037ca:	02e7f963          	bgeu	a5,a4,ffffffffc02037fc <swapfs_write+0x80>
ffffffffc02037ce:	60a2                	ld	ra,8(sp)
ffffffffc02037d0:	0000d797          	auipc	a5,0xd
ffffffffc02037d4:	9c07b783          	ld	a5,-1600(a5) # ffffffffc0210190 <va_pa_offset>
ffffffffc02037d8:	46a1                	li	a3,8
ffffffffc02037da:	963e                	add	a2,a2,a5
ffffffffc02037dc:	4505                	li	a0,1
ffffffffc02037de:	0141                	addi	sp,sp,16
ffffffffc02037e0:	99dfc06f          	j	ffffffffc020017c <ide_write_secs>
ffffffffc02037e4:	86aa                	mv	a3,a0
ffffffffc02037e6:	00002617          	auipc	a2,0x2
ffffffffc02037ea:	ea260613          	addi	a2,a2,-350 # ffffffffc0205688 <default_pmm_manager+0x648>
ffffffffc02037ee:	45e5                	li	a1,25
ffffffffc02037f0:	00002517          	auipc	a0,0x2
ffffffffc02037f4:	e8050513          	addi	a0,a0,-384 # ffffffffc0205670 <default_pmm_manager+0x630>
ffffffffc02037f8:	8f5fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02037fc:	86b2                	mv	a3,a2
ffffffffc02037fe:	06a00593          	li	a1,106
ffffffffc0203802:	00002617          	auipc	a2,0x2
ffffffffc0203806:	87660613          	addi	a2,a2,-1930 # ffffffffc0205078 <default_pmm_manager+0x38>
ffffffffc020380a:	00001517          	auipc	a0,0x1
ffffffffc020380e:	04650513          	addi	a0,a0,70 # ffffffffc0204850 <etext+0xbbc>
ffffffffc0203812:	8dbfc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0203816 <strlen>:
ffffffffc0203816:	00054783          	lbu	a5,0(a0)
ffffffffc020381a:	872a                	mv	a4,a0
ffffffffc020381c:	4501                	li	a0,0
ffffffffc020381e:	cb81                	beqz	a5,ffffffffc020382e <strlen+0x18>
ffffffffc0203820:	0505                	addi	a0,a0,1
ffffffffc0203822:	00a707b3          	add	a5,a4,a0
ffffffffc0203826:	0007c783          	lbu	a5,0(a5)
ffffffffc020382a:	fbfd                	bnez	a5,ffffffffc0203820 <strlen+0xa>
ffffffffc020382c:	8082                	ret
ffffffffc020382e:	8082                	ret

ffffffffc0203830 <strnlen>:
ffffffffc0203830:	872a                	mv	a4,a0
ffffffffc0203832:	4501                	li	a0,0
ffffffffc0203834:	e589                	bnez	a1,ffffffffc020383e <strnlen+0xe>
ffffffffc0203836:	a811                	j	ffffffffc020384a <strnlen+0x1a>
ffffffffc0203838:	0505                	addi	a0,a0,1
ffffffffc020383a:	00a58763          	beq	a1,a0,ffffffffc0203848 <strnlen+0x18>
ffffffffc020383e:	00a707b3          	add	a5,a4,a0
ffffffffc0203842:	0007c783          	lbu	a5,0(a5)
ffffffffc0203846:	fbed                	bnez	a5,ffffffffc0203838 <strnlen+0x8>
ffffffffc0203848:	8082                	ret
ffffffffc020384a:	8082                	ret

ffffffffc020384c <strcpy>:
ffffffffc020384c:	87aa                	mv	a5,a0
ffffffffc020384e:	0005c703          	lbu	a4,0(a1)
ffffffffc0203852:	0785                	addi	a5,a5,1
ffffffffc0203854:	0585                	addi	a1,a1,1
ffffffffc0203856:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020385a:	fb75                	bnez	a4,ffffffffc020384e <strcpy+0x2>
ffffffffc020385c:	8082                	ret

ffffffffc020385e <strcmp>:
ffffffffc020385e:	00054783          	lbu	a5,0(a0)
ffffffffc0203862:	0005c703          	lbu	a4,0(a1)
ffffffffc0203866:	cb89                	beqz	a5,ffffffffc0203878 <strcmp+0x1a>
ffffffffc0203868:	0505                	addi	a0,a0,1
ffffffffc020386a:	0585                	addi	a1,a1,1
ffffffffc020386c:	fee789e3          	beq	a5,a4,ffffffffc020385e <strcmp>
ffffffffc0203870:	0007851b          	sext.w	a0,a5
ffffffffc0203874:	9d19                	subw	a0,a0,a4
ffffffffc0203876:	8082                	ret
ffffffffc0203878:	4501                	li	a0,0
ffffffffc020387a:	bfed                	j	ffffffffc0203874 <strcmp+0x16>

ffffffffc020387c <memset>:
ffffffffc020387c:	ca01                	beqz	a2,ffffffffc020388c <memset+0x10>
ffffffffc020387e:	962a                	add	a2,a2,a0
ffffffffc0203880:	87aa                	mv	a5,a0
ffffffffc0203882:	0785                	addi	a5,a5,1
ffffffffc0203884:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0203888:	fec79de3          	bne	a5,a2,ffffffffc0203882 <memset+0x6>
ffffffffc020388c:	8082                	ret

ffffffffc020388e <memcpy>:
ffffffffc020388e:	ca19                	beqz	a2,ffffffffc02038a4 <memcpy+0x16>
ffffffffc0203890:	962e                	add	a2,a2,a1
ffffffffc0203892:	87aa                	mv	a5,a0
ffffffffc0203894:	0005c703          	lbu	a4,0(a1)
ffffffffc0203898:	0585                	addi	a1,a1,1
ffffffffc020389a:	0785                	addi	a5,a5,1
ffffffffc020389c:	fee78fa3          	sb	a4,-1(a5)
ffffffffc02038a0:	fec59ae3          	bne	a1,a2,ffffffffc0203894 <memcpy+0x6>
ffffffffc02038a4:	8082                	ret

ffffffffc02038a6 <printnum>:
ffffffffc02038a6:	02069813          	slli	a6,a3,0x20
ffffffffc02038aa:	7179                	addi	sp,sp,-48
ffffffffc02038ac:	02085813          	srli	a6,a6,0x20
ffffffffc02038b0:	e052                	sd	s4,0(sp)
ffffffffc02038b2:	03067a33          	remu	s4,a2,a6
ffffffffc02038b6:	f022                	sd	s0,32(sp)
ffffffffc02038b8:	ec26                	sd	s1,24(sp)
ffffffffc02038ba:	e84a                	sd	s2,16(sp)
ffffffffc02038bc:	f406                	sd	ra,40(sp)
ffffffffc02038be:	e44e                	sd	s3,8(sp)
ffffffffc02038c0:	84aa                	mv	s1,a0
ffffffffc02038c2:	892e                	mv	s2,a1
ffffffffc02038c4:	fff7041b          	addiw	s0,a4,-1
ffffffffc02038c8:	2a01                	sext.w	s4,s4
ffffffffc02038ca:	03067e63          	bgeu	a2,a6,ffffffffc0203906 <printnum+0x60>
ffffffffc02038ce:	89be                	mv	s3,a5
ffffffffc02038d0:	00805763          	blez	s0,ffffffffc02038de <printnum+0x38>
ffffffffc02038d4:	347d                	addiw	s0,s0,-1
ffffffffc02038d6:	85ca                	mv	a1,s2
ffffffffc02038d8:	854e                	mv	a0,s3
ffffffffc02038da:	9482                	jalr	s1
ffffffffc02038dc:	fc65                	bnez	s0,ffffffffc02038d4 <printnum+0x2e>
ffffffffc02038de:	1a02                	slli	s4,s4,0x20
ffffffffc02038e0:	020a5a13          	srli	s4,s4,0x20
ffffffffc02038e4:	00002797          	auipc	a5,0x2
ffffffffc02038e8:	dc478793          	addi	a5,a5,-572 # ffffffffc02056a8 <default_pmm_manager+0x668>
ffffffffc02038ec:	7402                	ld	s0,32(sp)
ffffffffc02038ee:	9a3e                	add	s4,s4,a5
ffffffffc02038f0:	000a4503          	lbu	a0,0(s4)
ffffffffc02038f4:	70a2                	ld	ra,40(sp)
ffffffffc02038f6:	69a2                	ld	s3,8(sp)
ffffffffc02038f8:	6a02                	ld	s4,0(sp)
ffffffffc02038fa:	85ca                	mv	a1,s2
ffffffffc02038fc:	8326                	mv	t1,s1
ffffffffc02038fe:	6942                	ld	s2,16(sp)
ffffffffc0203900:	64e2                	ld	s1,24(sp)
ffffffffc0203902:	6145                	addi	sp,sp,48
ffffffffc0203904:	8302                	jr	t1
ffffffffc0203906:	03065633          	divu	a2,a2,a6
ffffffffc020390a:	8722                	mv	a4,s0
ffffffffc020390c:	f9bff0ef          	jal	ra,ffffffffc02038a6 <printnum>
ffffffffc0203910:	b7f9                	j	ffffffffc02038de <printnum+0x38>

ffffffffc0203912 <vprintfmt>:
ffffffffc0203912:	7119                	addi	sp,sp,-128
ffffffffc0203914:	f4a6                	sd	s1,104(sp)
ffffffffc0203916:	f0ca                	sd	s2,96(sp)
ffffffffc0203918:	ecce                	sd	s3,88(sp)
ffffffffc020391a:	e8d2                	sd	s4,80(sp)
ffffffffc020391c:	e4d6                	sd	s5,72(sp)
ffffffffc020391e:	e0da                	sd	s6,64(sp)
ffffffffc0203920:	fc5e                	sd	s7,56(sp)
ffffffffc0203922:	f06a                	sd	s10,32(sp)
ffffffffc0203924:	fc86                	sd	ra,120(sp)
ffffffffc0203926:	f8a2                	sd	s0,112(sp)
ffffffffc0203928:	f862                	sd	s8,48(sp)
ffffffffc020392a:	f466                	sd	s9,40(sp)
ffffffffc020392c:	ec6e                	sd	s11,24(sp)
ffffffffc020392e:	892a                	mv	s2,a0
ffffffffc0203930:	84ae                	mv	s1,a1
ffffffffc0203932:	8d32                	mv	s10,a2
ffffffffc0203934:	8a36                	mv	s4,a3
ffffffffc0203936:	02500993          	li	s3,37
ffffffffc020393a:	5b7d                	li	s6,-1
ffffffffc020393c:	00002a97          	auipc	s5,0x2
ffffffffc0203940:	da0a8a93          	addi	s5,s5,-608 # ffffffffc02056dc <default_pmm_manager+0x69c>
ffffffffc0203944:	00002b97          	auipc	s7,0x2
ffffffffc0203948:	f74b8b93          	addi	s7,s7,-140 # ffffffffc02058b8 <error_string>
ffffffffc020394c:	000d4503          	lbu	a0,0(s10)
ffffffffc0203950:	001d0413          	addi	s0,s10,1
ffffffffc0203954:	01350a63          	beq	a0,s3,ffffffffc0203968 <vprintfmt+0x56>
ffffffffc0203958:	c121                	beqz	a0,ffffffffc0203998 <vprintfmt+0x86>
ffffffffc020395a:	85a6                	mv	a1,s1
ffffffffc020395c:	0405                	addi	s0,s0,1
ffffffffc020395e:	9902                	jalr	s2
ffffffffc0203960:	fff44503          	lbu	a0,-1(s0)
ffffffffc0203964:	ff351ae3          	bne	a0,s3,ffffffffc0203958 <vprintfmt+0x46>
ffffffffc0203968:	00044603          	lbu	a2,0(s0)
ffffffffc020396c:	02000793          	li	a5,32
ffffffffc0203970:	4c81                	li	s9,0
ffffffffc0203972:	4881                	li	a7,0
ffffffffc0203974:	5c7d                	li	s8,-1
ffffffffc0203976:	5dfd                	li	s11,-1
ffffffffc0203978:	05500513          	li	a0,85
ffffffffc020397c:	4825                	li	a6,9
ffffffffc020397e:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0203982:	0ff5f593          	andi	a1,a1,255
ffffffffc0203986:	00140d13          	addi	s10,s0,1
ffffffffc020398a:	04b56263          	bltu	a0,a1,ffffffffc02039ce <vprintfmt+0xbc>
ffffffffc020398e:	058a                	slli	a1,a1,0x2
ffffffffc0203990:	95d6                	add	a1,a1,s5
ffffffffc0203992:	4194                	lw	a3,0(a1)
ffffffffc0203994:	96d6                	add	a3,a3,s5
ffffffffc0203996:	8682                	jr	a3
ffffffffc0203998:	70e6                	ld	ra,120(sp)
ffffffffc020399a:	7446                	ld	s0,112(sp)
ffffffffc020399c:	74a6                	ld	s1,104(sp)
ffffffffc020399e:	7906                	ld	s2,96(sp)
ffffffffc02039a0:	69e6                	ld	s3,88(sp)
ffffffffc02039a2:	6a46                	ld	s4,80(sp)
ffffffffc02039a4:	6aa6                	ld	s5,72(sp)
ffffffffc02039a6:	6b06                	ld	s6,64(sp)
ffffffffc02039a8:	7be2                	ld	s7,56(sp)
ffffffffc02039aa:	7c42                	ld	s8,48(sp)
ffffffffc02039ac:	7ca2                	ld	s9,40(sp)
ffffffffc02039ae:	7d02                	ld	s10,32(sp)
ffffffffc02039b0:	6de2                	ld	s11,24(sp)
ffffffffc02039b2:	6109                	addi	sp,sp,128
ffffffffc02039b4:	8082                	ret
ffffffffc02039b6:	87b2                	mv	a5,a2
ffffffffc02039b8:	00144603          	lbu	a2,1(s0)
ffffffffc02039bc:	846a                	mv	s0,s10
ffffffffc02039be:	00140d13          	addi	s10,s0,1
ffffffffc02039c2:	fdd6059b          	addiw	a1,a2,-35
ffffffffc02039c6:	0ff5f593          	andi	a1,a1,255
ffffffffc02039ca:	fcb572e3          	bgeu	a0,a1,ffffffffc020398e <vprintfmt+0x7c>
ffffffffc02039ce:	85a6                	mv	a1,s1
ffffffffc02039d0:	02500513          	li	a0,37
ffffffffc02039d4:	9902                	jalr	s2
ffffffffc02039d6:	fff44783          	lbu	a5,-1(s0)
ffffffffc02039da:	8d22                	mv	s10,s0
ffffffffc02039dc:	f73788e3          	beq	a5,s3,ffffffffc020394c <vprintfmt+0x3a>
ffffffffc02039e0:	ffed4783          	lbu	a5,-2(s10)
ffffffffc02039e4:	1d7d                	addi	s10,s10,-1
ffffffffc02039e6:	ff379de3          	bne	a5,s3,ffffffffc02039e0 <vprintfmt+0xce>
ffffffffc02039ea:	b78d                	j	ffffffffc020394c <vprintfmt+0x3a>
ffffffffc02039ec:	fd060c1b          	addiw	s8,a2,-48
ffffffffc02039f0:	00144603          	lbu	a2,1(s0)
ffffffffc02039f4:	846a                	mv	s0,s10
ffffffffc02039f6:	fd06069b          	addiw	a3,a2,-48
ffffffffc02039fa:	0006059b          	sext.w	a1,a2
ffffffffc02039fe:	02d86463          	bltu	a6,a3,ffffffffc0203a26 <vprintfmt+0x114>
ffffffffc0203a02:	00144603          	lbu	a2,1(s0)
ffffffffc0203a06:	002c169b          	slliw	a3,s8,0x2
ffffffffc0203a0a:	0186873b          	addw	a4,a3,s8
ffffffffc0203a0e:	0017171b          	slliw	a4,a4,0x1
ffffffffc0203a12:	9f2d                	addw	a4,a4,a1
ffffffffc0203a14:	fd06069b          	addiw	a3,a2,-48
ffffffffc0203a18:	0405                	addi	s0,s0,1
ffffffffc0203a1a:	fd070c1b          	addiw	s8,a4,-48
ffffffffc0203a1e:	0006059b          	sext.w	a1,a2
ffffffffc0203a22:	fed870e3          	bgeu	a6,a3,ffffffffc0203a02 <vprintfmt+0xf0>
ffffffffc0203a26:	f40ddce3          	bgez	s11,ffffffffc020397e <vprintfmt+0x6c>
ffffffffc0203a2a:	8de2                	mv	s11,s8
ffffffffc0203a2c:	5c7d                	li	s8,-1
ffffffffc0203a2e:	bf81                	j	ffffffffc020397e <vprintfmt+0x6c>
ffffffffc0203a30:	fffdc693          	not	a3,s11
ffffffffc0203a34:	96fd                	srai	a3,a3,0x3f
ffffffffc0203a36:	00ddfdb3          	and	s11,s11,a3
ffffffffc0203a3a:	00144603          	lbu	a2,1(s0)
ffffffffc0203a3e:	2d81                	sext.w	s11,s11
ffffffffc0203a40:	846a                	mv	s0,s10
ffffffffc0203a42:	bf35                	j	ffffffffc020397e <vprintfmt+0x6c>
ffffffffc0203a44:	000a2c03          	lw	s8,0(s4)
ffffffffc0203a48:	00144603          	lbu	a2,1(s0)
ffffffffc0203a4c:	0a21                	addi	s4,s4,8
ffffffffc0203a4e:	846a                	mv	s0,s10
ffffffffc0203a50:	bfd9                	j	ffffffffc0203a26 <vprintfmt+0x114>
ffffffffc0203a52:	4705                	li	a4,1
ffffffffc0203a54:	008a0593          	addi	a1,s4,8
ffffffffc0203a58:	01174463          	blt	a4,a7,ffffffffc0203a60 <vprintfmt+0x14e>
ffffffffc0203a5c:	1a088e63          	beqz	a7,ffffffffc0203c18 <vprintfmt+0x306>
ffffffffc0203a60:	000a3603          	ld	a2,0(s4)
ffffffffc0203a64:	46c1                	li	a3,16
ffffffffc0203a66:	8a2e                	mv	s4,a1
ffffffffc0203a68:	2781                	sext.w	a5,a5
ffffffffc0203a6a:	876e                	mv	a4,s11
ffffffffc0203a6c:	85a6                	mv	a1,s1
ffffffffc0203a6e:	854a                	mv	a0,s2
ffffffffc0203a70:	e37ff0ef          	jal	ra,ffffffffc02038a6 <printnum>
ffffffffc0203a74:	bde1                	j	ffffffffc020394c <vprintfmt+0x3a>
ffffffffc0203a76:	000a2503          	lw	a0,0(s4)
ffffffffc0203a7a:	85a6                	mv	a1,s1
ffffffffc0203a7c:	0a21                	addi	s4,s4,8
ffffffffc0203a7e:	9902                	jalr	s2
ffffffffc0203a80:	b5f1                	j	ffffffffc020394c <vprintfmt+0x3a>
ffffffffc0203a82:	4705                	li	a4,1
ffffffffc0203a84:	008a0593          	addi	a1,s4,8
ffffffffc0203a88:	01174463          	blt	a4,a7,ffffffffc0203a90 <vprintfmt+0x17e>
ffffffffc0203a8c:	18088163          	beqz	a7,ffffffffc0203c0e <vprintfmt+0x2fc>
ffffffffc0203a90:	000a3603          	ld	a2,0(s4)
ffffffffc0203a94:	46a9                	li	a3,10
ffffffffc0203a96:	8a2e                	mv	s4,a1
ffffffffc0203a98:	bfc1                	j	ffffffffc0203a68 <vprintfmt+0x156>
ffffffffc0203a9a:	00144603          	lbu	a2,1(s0)
ffffffffc0203a9e:	4c85                	li	s9,1
ffffffffc0203aa0:	846a                	mv	s0,s10
ffffffffc0203aa2:	bdf1                	j	ffffffffc020397e <vprintfmt+0x6c>
ffffffffc0203aa4:	85a6                	mv	a1,s1
ffffffffc0203aa6:	02500513          	li	a0,37
ffffffffc0203aaa:	9902                	jalr	s2
ffffffffc0203aac:	b545                	j	ffffffffc020394c <vprintfmt+0x3a>
ffffffffc0203aae:	00144603          	lbu	a2,1(s0)
ffffffffc0203ab2:	2885                	addiw	a7,a7,1
ffffffffc0203ab4:	846a                	mv	s0,s10
ffffffffc0203ab6:	b5e1                	j	ffffffffc020397e <vprintfmt+0x6c>
ffffffffc0203ab8:	4705                	li	a4,1
ffffffffc0203aba:	008a0593          	addi	a1,s4,8
ffffffffc0203abe:	01174463          	blt	a4,a7,ffffffffc0203ac6 <vprintfmt+0x1b4>
ffffffffc0203ac2:	14088163          	beqz	a7,ffffffffc0203c04 <vprintfmt+0x2f2>
ffffffffc0203ac6:	000a3603          	ld	a2,0(s4)
ffffffffc0203aca:	46a1                	li	a3,8
ffffffffc0203acc:	8a2e                	mv	s4,a1
ffffffffc0203ace:	bf69                	j	ffffffffc0203a68 <vprintfmt+0x156>
ffffffffc0203ad0:	03000513          	li	a0,48
ffffffffc0203ad4:	85a6                	mv	a1,s1
ffffffffc0203ad6:	e03e                	sd	a5,0(sp)
ffffffffc0203ad8:	9902                	jalr	s2
ffffffffc0203ada:	85a6                	mv	a1,s1
ffffffffc0203adc:	07800513          	li	a0,120
ffffffffc0203ae0:	9902                	jalr	s2
ffffffffc0203ae2:	0a21                	addi	s4,s4,8
ffffffffc0203ae4:	6782                	ld	a5,0(sp)
ffffffffc0203ae6:	46c1                	li	a3,16
ffffffffc0203ae8:	ff8a3603          	ld	a2,-8(s4)
ffffffffc0203aec:	bfb5                	j	ffffffffc0203a68 <vprintfmt+0x156>
ffffffffc0203aee:	000a3403          	ld	s0,0(s4)
ffffffffc0203af2:	008a0713          	addi	a4,s4,8
ffffffffc0203af6:	e03a                	sd	a4,0(sp)
ffffffffc0203af8:	14040263          	beqz	s0,ffffffffc0203c3c <vprintfmt+0x32a>
ffffffffc0203afc:	0fb05763          	blez	s11,ffffffffc0203bea <vprintfmt+0x2d8>
ffffffffc0203b00:	02d00693          	li	a3,45
ffffffffc0203b04:	0cd79163          	bne	a5,a3,ffffffffc0203bc6 <vprintfmt+0x2b4>
ffffffffc0203b08:	00044783          	lbu	a5,0(s0)
ffffffffc0203b0c:	0007851b          	sext.w	a0,a5
ffffffffc0203b10:	cf85                	beqz	a5,ffffffffc0203b48 <vprintfmt+0x236>
ffffffffc0203b12:	00140a13          	addi	s4,s0,1
ffffffffc0203b16:	05e00413          	li	s0,94
ffffffffc0203b1a:	000c4563          	bltz	s8,ffffffffc0203b24 <vprintfmt+0x212>
ffffffffc0203b1e:	3c7d                	addiw	s8,s8,-1
ffffffffc0203b20:	036c0263          	beq	s8,s6,ffffffffc0203b44 <vprintfmt+0x232>
ffffffffc0203b24:	85a6                	mv	a1,s1
ffffffffc0203b26:	0e0c8e63          	beqz	s9,ffffffffc0203c22 <vprintfmt+0x310>
ffffffffc0203b2a:	3781                	addiw	a5,a5,-32
ffffffffc0203b2c:	0ef47b63          	bgeu	s0,a5,ffffffffc0203c22 <vprintfmt+0x310>
ffffffffc0203b30:	03f00513          	li	a0,63
ffffffffc0203b34:	9902                	jalr	s2
ffffffffc0203b36:	000a4783          	lbu	a5,0(s4)
ffffffffc0203b3a:	3dfd                	addiw	s11,s11,-1
ffffffffc0203b3c:	0a05                	addi	s4,s4,1
ffffffffc0203b3e:	0007851b          	sext.w	a0,a5
ffffffffc0203b42:	ffe1                	bnez	a5,ffffffffc0203b1a <vprintfmt+0x208>
ffffffffc0203b44:	01b05963          	blez	s11,ffffffffc0203b56 <vprintfmt+0x244>
ffffffffc0203b48:	3dfd                	addiw	s11,s11,-1
ffffffffc0203b4a:	85a6                	mv	a1,s1
ffffffffc0203b4c:	02000513          	li	a0,32
ffffffffc0203b50:	9902                	jalr	s2
ffffffffc0203b52:	fe0d9be3          	bnez	s11,ffffffffc0203b48 <vprintfmt+0x236>
ffffffffc0203b56:	6a02                	ld	s4,0(sp)
ffffffffc0203b58:	bbd5                	j	ffffffffc020394c <vprintfmt+0x3a>
ffffffffc0203b5a:	4705                	li	a4,1
ffffffffc0203b5c:	008a0c93          	addi	s9,s4,8
ffffffffc0203b60:	01174463          	blt	a4,a7,ffffffffc0203b68 <vprintfmt+0x256>
ffffffffc0203b64:	08088d63          	beqz	a7,ffffffffc0203bfe <vprintfmt+0x2ec>
ffffffffc0203b68:	000a3403          	ld	s0,0(s4)
ffffffffc0203b6c:	0a044d63          	bltz	s0,ffffffffc0203c26 <vprintfmt+0x314>
ffffffffc0203b70:	8622                	mv	a2,s0
ffffffffc0203b72:	8a66                	mv	s4,s9
ffffffffc0203b74:	46a9                	li	a3,10
ffffffffc0203b76:	bdcd                	j	ffffffffc0203a68 <vprintfmt+0x156>
ffffffffc0203b78:	000a2783          	lw	a5,0(s4)
ffffffffc0203b7c:	4719                	li	a4,6
ffffffffc0203b7e:	0a21                	addi	s4,s4,8
ffffffffc0203b80:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0203b84:	8fb5                	xor	a5,a5,a3
ffffffffc0203b86:	40d786bb          	subw	a3,a5,a3
ffffffffc0203b8a:	02d74163          	blt	a4,a3,ffffffffc0203bac <vprintfmt+0x29a>
ffffffffc0203b8e:	00369793          	slli	a5,a3,0x3
ffffffffc0203b92:	97de                	add	a5,a5,s7
ffffffffc0203b94:	639c                	ld	a5,0(a5)
ffffffffc0203b96:	cb99                	beqz	a5,ffffffffc0203bac <vprintfmt+0x29a>
ffffffffc0203b98:	86be                	mv	a3,a5
ffffffffc0203b9a:	00002617          	auipc	a2,0x2
ffffffffc0203b9e:	b3e60613          	addi	a2,a2,-1218 # ffffffffc02056d8 <default_pmm_manager+0x698>
ffffffffc0203ba2:	85a6                	mv	a1,s1
ffffffffc0203ba4:	854a                	mv	a0,s2
ffffffffc0203ba6:	0ce000ef          	jal	ra,ffffffffc0203c74 <printfmt>
ffffffffc0203baa:	b34d                	j	ffffffffc020394c <vprintfmt+0x3a>
ffffffffc0203bac:	00002617          	auipc	a2,0x2
ffffffffc0203bb0:	b1c60613          	addi	a2,a2,-1252 # ffffffffc02056c8 <default_pmm_manager+0x688>
ffffffffc0203bb4:	85a6                	mv	a1,s1
ffffffffc0203bb6:	854a                	mv	a0,s2
ffffffffc0203bb8:	0bc000ef          	jal	ra,ffffffffc0203c74 <printfmt>
ffffffffc0203bbc:	bb41                	j	ffffffffc020394c <vprintfmt+0x3a>
ffffffffc0203bbe:	00002417          	auipc	s0,0x2
ffffffffc0203bc2:	b0240413          	addi	s0,s0,-1278 # ffffffffc02056c0 <default_pmm_manager+0x680>
ffffffffc0203bc6:	85e2                	mv	a1,s8
ffffffffc0203bc8:	8522                	mv	a0,s0
ffffffffc0203bca:	e43e                	sd	a5,8(sp)
ffffffffc0203bcc:	c65ff0ef          	jal	ra,ffffffffc0203830 <strnlen>
ffffffffc0203bd0:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0203bd4:	01b05b63          	blez	s11,ffffffffc0203bea <vprintfmt+0x2d8>
ffffffffc0203bd8:	67a2                	ld	a5,8(sp)
ffffffffc0203bda:	00078a1b          	sext.w	s4,a5
ffffffffc0203bde:	3dfd                	addiw	s11,s11,-1
ffffffffc0203be0:	85a6                	mv	a1,s1
ffffffffc0203be2:	8552                	mv	a0,s4
ffffffffc0203be4:	9902                	jalr	s2
ffffffffc0203be6:	fe0d9ce3          	bnez	s11,ffffffffc0203bde <vprintfmt+0x2cc>
ffffffffc0203bea:	00044783          	lbu	a5,0(s0)
ffffffffc0203bee:	00140a13          	addi	s4,s0,1
ffffffffc0203bf2:	0007851b          	sext.w	a0,a5
ffffffffc0203bf6:	d3a5                	beqz	a5,ffffffffc0203b56 <vprintfmt+0x244>
ffffffffc0203bf8:	05e00413          	li	s0,94
ffffffffc0203bfc:	bf39                	j	ffffffffc0203b1a <vprintfmt+0x208>
ffffffffc0203bfe:	000a2403          	lw	s0,0(s4)
ffffffffc0203c02:	b7ad                	j	ffffffffc0203b6c <vprintfmt+0x25a>
ffffffffc0203c04:	000a6603          	lwu	a2,0(s4)
ffffffffc0203c08:	46a1                	li	a3,8
ffffffffc0203c0a:	8a2e                	mv	s4,a1
ffffffffc0203c0c:	bdb1                	j	ffffffffc0203a68 <vprintfmt+0x156>
ffffffffc0203c0e:	000a6603          	lwu	a2,0(s4)
ffffffffc0203c12:	46a9                	li	a3,10
ffffffffc0203c14:	8a2e                	mv	s4,a1
ffffffffc0203c16:	bd89                	j	ffffffffc0203a68 <vprintfmt+0x156>
ffffffffc0203c18:	000a6603          	lwu	a2,0(s4)
ffffffffc0203c1c:	46c1                	li	a3,16
ffffffffc0203c1e:	8a2e                	mv	s4,a1
ffffffffc0203c20:	b5a1                	j	ffffffffc0203a68 <vprintfmt+0x156>
ffffffffc0203c22:	9902                	jalr	s2
ffffffffc0203c24:	bf09                	j	ffffffffc0203b36 <vprintfmt+0x224>
ffffffffc0203c26:	85a6                	mv	a1,s1
ffffffffc0203c28:	02d00513          	li	a0,45
ffffffffc0203c2c:	e03e                	sd	a5,0(sp)
ffffffffc0203c2e:	9902                	jalr	s2
ffffffffc0203c30:	6782                	ld	a5,0(sp)
ffffffffc0203c32:	8a66                	mv	s4,s9
ffffffffc0203c34:	40800633          	neg	a2,s0
ffffffffc0203c38:	46a9                	li	a3,10
ffffffffc0203c3a:	b53d                	j	ffffffffc0203a68 <vprintfmt+0x156>
ffffffffc0203c3c:	03b05163          	blez	s11,ffffffffc0203c5e <vprintfmt+0x34c>
ffffffffc0203c40:	02d00693          	li	a3,45
ffffffffc0203c44:	f6d79de3          	bne	a5,a3,ffffffffc0203bbe <vprintfmt+0x2ac>
ffffffffc0203c48:	00002417          	auipc	s0,0x2
ffffffffc0203c4c:	a7840413          	addi	s0,s0,-1416 # ffffffffc02056c0 <default_pmm_manager+0x680>
ffffffffc0203c50:	02800793          	li	a5,40
ffffffffc0203c54:	02800513          	li	a0,40
ffffffffc0203c58:	00140a13          	addi	s4,s0,1
ffffffffc0203c5c:	bd6d                	j	ffffffffc0203b16 <vprintfmt+0x204>
ffffffffc0203c5e:	00002a17          	auipc	s4,0x2
ffffffffc0203c62:	a63a0a13          	addi	s4,s4,-1437 # ffffffffc02056c1 <default_pmm_manager+0x681>
ffffffffc0203c66:	02800513          	li	a0,40
ffffffffc0203c6a:	02800793          	li	a5,40
ffffffffc0203c6e:	05e00413          	li	s0,94
ffffffffc0203c72:	b565                	j	ffffffffc0203b1a <vprintfmt+0x208>

ffffffffc0203c74 <printfmt>:
ffffffffc0203c74:	715d                	addi	sp,sp,-80
ffffffffc0203c76:	02810313          	addi	t1,sp,40
ffffffffc0203c7a:	f436                	sd	a3,40(sp)
ffffffffc0203c7c:	869a                	mv	a3,t1
ffffffffc0203c7e:	ec06                	sd	ra,24(sp)
ffffffffc0203c80:	f83a                	sd	a4,48(sp)
ffffffffc0203c82:	fc3e                	sd	a5,56(sp)
ffffffffc0203c84:	e0c2                	sd	a6,64(sp)
ffffffffc0203c86:	e4c6                	sd	a7,72(sp)
ffffffffc0203c88:	e41a                	sd	t1,8(sp)
ffffffffc0203c8a:	c89ff0ef          	jal	ra,ffffffffc0203912 <vprintfmt>
ffffffffc0203c8e:	60e2                	ld	ra,24(sp)
ffffffffc0203c90:	6161                	addi	sp,sp,80
ffffffffc0203c92:	8082                	ret
