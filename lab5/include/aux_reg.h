#ifndef	AUX_REG_H

#define	AUX_REG_H
#include "base.h"

#define AUX_ENABLES     (unsigned int*)(BASE+0x00215004)
#define AUX_MU_IO_REG   (unsigned int*)(BASE+0x00215040)
#define AUX_MU_IER_REG  (unsigned int*)(BASE+0x00215044)
#define AUX_MU_IIR_REG  (unsigned int*)(BASE+0x00215048)
#define AUX_MU_LCR_REG  (unsigned int*)(BASE+0x0021504C)
#define AUX_MU_MCR_REG  (unsigned int*)(BASE+0x00215050)
#define AUX_MU_LSR_REG  (unsigned int*)(BASE+0x00215054)
#define AUX_MU_MSR_REG  (unsigned int*)(BASE+0x00215058)
#define AUX_MU_SCRATCH  (unsigned int*)(BASE+0x0021505C)
#define AUX_MU_CNTL_REG (unsigned int*)(BASE+0x00215060)
#define AUX_MU_STAT_REG (unsigned int*)(BASE+0x00215064)
#define AUX_MU_BAUD_REG (unsigned int*)(BASE+0x00215068)
#define IRQS1           (unsigned int*)(BASE+0x0000B210)
#define CORE0_INTERRUPT_SOURCE  (unsigned int*)(0x40000060)
#define GPU_PENDING1_REGISTER   (unsigned int*)(BASE+0x0000B204)

#endif
