SECTIONS
{
	. = 0x80000;
	PROVIDE(_code = .);
	.text.boot : { KEEP(*(.text.boot)) }
	.text : { *(.text) }
	.data : { *(.data) }
	. = ALIGN(16);
	.bss (NOLOAD) : 
	{ 
		bss_begin = .;
		*(.bss)
		bss_end = .;
	}
	_end = .;
}

bss_size = (bss_end - bss_begin)>>3;
