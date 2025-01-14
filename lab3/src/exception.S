.section ".text"

.macro save_all						// save general registers to stack
    sub sp, sp, 16 * 17
    stp x0, x1, [sp ,16 * 0]		//store pair of registers to sp+16*0
    stp x2, x3, [sp ,16 * 1]
    stp x4, x5, [sp ,16 * 2]
    stp x6, x7, [sp ,16 * 3]
    stp x8, x9, [sp ,16 * 4]
    stp x10, x11, [sp ,16 * 5]
    stp x12, x13, [sp ,16 * 6]
    stp x14, x15, [sp ,16 * 7]
    stp x16, x17, [sp ,16 * 8]
    stp x18, x19, [sp ,16 * 9]
    stp x20, x21, [sp ,16 * 10]
    stp x22, x23, [sp ,16 * 11]
    stp x24, x25, [sp ,16 * 12]
    stp x26, x27, [sp ,16 * 13]
    stp x28, x29, [sp ,16 * 14]
    str x30, [sp, 16 * 15]
	mrs x28, SPSR_EL1
	mrs x29, ELR_EL1
	stp x28, x29, [sp, 16 * 16]
.endm								//end macro

.macro load_all						// load general registers from stack
	ldp x0, x1, [sp ,16 * 16]
	msr SPSR_EL1, x0
	msr ELR_EL1, x1
    ldp x0, x1, [sp ,16 * 0]		//load pair of registers from sp+16*0
    ldp x2, x3, [sp ,16 * 1]
    ldp x4, x5, [sp ,16 * 2]
    ldp x6, x7, [sp ,16 * 3]
    ldp x8, x9, [sp ,16 * 4]
    ldp x10, x11, [sp ,16 * 5]
    ldp x12, x13, [sp ,16 * 6]
    ldp x14, x15, [sp ,16 * 7]
    ldp x16, x17, [sp ,16 * 8]
    ldp x18, x19, [sp ,16 * 9]
    ldp x20, x21, [sp ,16 * 10]
    ldp x22, x23, [sp ,16 * 11]
    ldp x24, x25, [sp ,16 * 12]
    ldp x26, x27, [sp ,16 * 13]
    ldp x28, x29, [sp ,16 * 14]
    ldr x30, [sp, 16 * 15]
    add sp, sp, 16 * 17
.endm

exception_handler:
    save_all
    bl	 	exception_entry			//for now , just print register info
	bl		core_timer_enable
    load_all
    eret

/******************vector table********************/
.align 11							//0x800 : 2^11
.global	exception_vector_table
exception_vector_table:
	b 	exception_handler			// branch to a handler function.
	.align 7 						// entry size is 0x80 : 2^7
	b 	EL1_check_interrupt
	.align 7
	b 	exception_handler
	.align 7
	b 	exception_handler
	.align 7

	b 	exception_handler
	.align 7
	b 	EL1_check_interrupt
	.align 7
	b 	exception_handler
	.align 7
	b 	exception_handler
	.align 7

	b 	exception_handler
	.align 7
	b 	EL0_check_interrupt
	.align 7
	b 	exception_handler
	.align 7
	b 	exception_handler
	.align 7

	b 	exception_handler
	.align 7
	b 	exception_handler
	.align 7
	b 	exception_handler
	.align 7
	b 	exception_handler
	.align 7

.global set_exception_vector_table			//use as function
.type set_exception_vector_table, @function
set_exception_vector_table:
	ldr 	x0,=exception_vector_table
	msr 	vbar_el1,x0						//vbar_el1 : Vector Base Address Register (EL1)
	ret

EL0_check_interrupt:
	save_all
	bl		EL0_check_interrupt_source
	load_all
	eret

EL1_check_interrupt:
	save_all
	bl		EL1_check_interrupt_source
	load_all
	eret
