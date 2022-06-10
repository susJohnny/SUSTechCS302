
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <kern_entry>:
    80200000:	00003117          	auipc	sp,0x3
    80200004:	00010113          	mv	sp,sp
    80200008:	a009                	j	8020000a <kern_init>

000000008020000a <kern_init>:
    8020000a:	00003517          	auipc	a0,0x3
    8020000e:	00650513          	addi	a0,a0,6 # 80203010 <edata>
    80200012:	00003617          	auipc	a2,0x3
    80200016:	ffe60613          	addi	a2,a2,-2 # 80203010 <edata>
    8020001a:	1141                	addi	sp,sp,-16
    8020001c:	8e09                	sub	a2,a2,a0
    8020001e:	4581                	li	a1,0
    80200020:	e406                	sd	ra,8(sp)
    80200022:	06c000ef          	jal	ra,8020008e <memset>
    80200026:	00000517          	auipc	a0,0x0
    8020002a:	0b250513          	addi	a0,a0,178 # 802000d8 <sbi_shutdown+0x1e>
    8020002e:	016000ef          	jal	ra,80200044 <cputs>
    80200032:	00000517          	auipc	a0,0x0
    80200036:	0be50513          	addi	a0,a0,190 # 802000f0 <sbi_shutdown+0x36>
    8020003a:	00a000ef          	jal	ra,80200044 <cputs>
    8020003e:	046000ef          	jal	ra,80200084 <shutdown>
    80200042:	a001                	j	80200042 <kern_init+0x38>

0000000080200044 <cputs>:
    80200044:	1101                	addi	sp,sp,-32
    80200046:	e822                	sd	s0,16(sp)
    80200048:	ec06                	sd	ra,24(sp)
    8020004a:	e426                	sd	s1,8(sp)
    8020004c:	842a                	mv	s0,a0
    8020004e:	00054503          	lbu	a0,0(a0)
    80200052:	c51d                	beqz	a0,80200080 <cputs+0x3c>
    80200054:	0405                	addi	s0,s0,1
    80200056:	4485                	li	s1,1
    80200058:	9c81                	subw	s1,s1,s0
    8020005a:	02c000ef          	jal	ra,80200086 <cons_putc>
    8020005e:	00044503          	lbu	a0,0(s0)
    80200062:	008487bb          	addw	a5,s1,s0
    80200066:	0405                	addi	s0,s0,1
    80200068:	f96d                	bnez	a0,8020005a <cputs+0x16>
    8020006a:	0017841b          	addiw	s0,a5,1
    8020006e:	4529                	li	a0,10
    80200070:	016000ef          	jal	ra,80200086 <cons_putc>
    80200074:	60e2                	ld	ra,24(sp)
    80200076:	8522                	mv	a0,s0
    80200078:	6442                	ld	s0,16(sp)
    8020007a:	64a2                	ld	s1,8(sp)
    8020007c:	6105                	addi	sp,sp,32
    8020007e:	8082                	ret
    80200080:	4405                	li	s0,1
    80200082:	b7f5                	j	8020006e <cputs+0x2a>

0000000080200084 <shutdown>:
    80200084:	a021                	j	8020008c <cons_shutdown>

0000000080200086 <cons_putc>:
    80200086:	0ff57513          	andi	a0,a0,255
    8020008a:	a819                	j	802000a0 <sbi_console_putchar>

000000008020008c <cons_shutdown>:
    8020008c:	a03d                	j	802000ba <sbi_shutdown>

000000008020008e <memset>:
    8020008e:	ca01                	beqz	a2,8020009e <memset+0x10>
    80200090:	962a                	add	a2,a2,a0
    80200092:	87aa                	mv	a5,a0
    80200094:	0785                	addi	a5,a5,1
    80200096:	feb78fa3          	sb	a1,-1(a5)
    8020009a:	fec79de3          	bne	a5,a2,80200094 <memset+0x6>
    8020009e:	8082                	ret

00000000802000a0 <sbi_console_putchar>:
    802000a0:	4781                	li	a5,0
    802000a2:	00003717          	auipc	a4,0x3
    802000a6:	f5e73703          	ld	a4,-162(a4) # 80203000 <SBI_CONSOLE_PUTCHAR>
    802000aa:	88ba                	mv	a7,a4
    802000ac:	852a                	mv	a0,a0
    802000ae:	85be                	mv	a1,a5
    802000b0:	863e                	mv	a2,a5
    802000b2:	00000073          	ecall
    802000b6:	87aa                	mv	a5,a0
    802000b8:	8082                	ret

00000000802000ba <sbi_shutdown>:
    802000ba:	4781                	li	a5,0
    802000bc:	00003717          	auipc	a4,0x3
    802000c0:	f4c73703          	ld	a4,-180(a4) # 80203008 <SBI_SHUTDOWN>
    802000c4:	88ba                	mv	a7,a4
    802000c6:	853e                	mv	a0,a5
    802000c8:	85be                	mv	a1,a5
    802000ca:	863e                	mv	a2,a5
    802000cc:	00000073          	ecall
    802000d0:	87aa                	mv	a5,a0
    802000d2:	8082                	ret
