Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2760810E02D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 13:13:52 +0000 (UTC)
Date: Fri, 3 Jun 2022 16:11:41 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YpoIjextVFVixg5W@platvala-desk.ger.corp.intel.com>
References: <20220603130502.47049-1-zbigniew.kempczynski@intel.com>
 <20220603130502.47049-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220603130502.47049-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915_crc: Introduce crc32 on
 gpu for DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 03, 2022 at 03:05:01PM +0200, Zbigniew Kempczyński wrote:
> Adding crc32 calculation on gpu gives us new possibility to verify data
> integrity without relying on trust cpu mapping is correct.
> 
> Patch introduces calculating crc32 on DG2 only. On older gens ALU
> (MI_MATH) doesn't support bit-shifting instructions as well as multiply
> or divide. Emulating n-bit shifts cost hundred of instructions with
> predicated SRM (works on render engine only). Another limitation is lack
> of indexed load / store. On DG2 we can use WPARID and CS_MI_ADDRESS_OFFSET
> to achieve indexed operation on memory.
> 
> Due to performance reasons (cpu crc32 calculation even on WC memory is
> still much faster than on gpu, also depends on calculated object memory
> region) calculation will complete in reasonable of time only for few MiB.
> 
> v2: - use registers relative to engine to allow run on all engines (Chris)
>     - use predication instead of memory access to get better performance
>       (Chris)
>     - add location where crc32 implementation comes from (Petri)
> 
> v3: - extract crc32 table + cpu_crc32() to separate i915_crc_table.c
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/i915/i915_crc.c         | 311 ++++++++++++++++++++++++++++++++++++
>  lib/i915/i915_crc.h         |  17 ++
>  lib/i915/i915_crc32_table.c | 105 ++++++++++++
>  lib/intel_reg.h             |   7 +
>  lib/meson.build             |   1 +
>  5 files changed, 441 insertions(+)
>  create mode 100644 lib/i915/i915_crc.c
>  create mode 100644 lib/i915/i915_crc.h
>  create mode 100644 lib/i915/i915_crc32_table.c
> 
> diff --git a/lib/i915/i915_crc.c b/lib/i915/i915_crc.c
> new file mode 100644
> index 0000000000..c26a8e05b9
> --- /dev/null
> +++ b/lib/i915/i915_crc.c
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <stddef.h>
> +#include <stdint.h>
> +#include "drmtest.h"
> +#include "gem_create.h"
> +#include "gem_engine_topology.h"
> +#include "gem_mman.h"
> +#include "i830_reg.h"
> +#include "i915_drm.h"
> +#include "intel_reg.h"
> +#include "intel_chipset.h"
> +#include "ioctl_wrappers.h"
> +#include "intel_allocator.h"
> +#include "i915/i915_crc.h"
> +
> +/* Include crc32 table + cpu_crc32() */
> +#include "i915_crc32_table.c"

#including .c files is ugly. Can that be a header file with
statics/inlines instead?

That said, it also isn't i915-specific anymore but that's not a
blocker for merging the code at this time.


-- 
Petri Latvala


> +
> +#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
> +
> +#define MI_MATH(x)                      MI_INSTR(0x1a, (x) - 1)
> +#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
> +/* Opcodes for MI_MATH_INSTR */
> +#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
> +#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
> +#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
> +#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
> +#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
> +#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
> +#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
> +#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
> +#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
> +#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
> +#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
> +#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
> +/* DG2+ */
> +#define   MI_MATH_SHL                   MI_MATH_INSTR(0x105, 0x0, 0x0)
> +#define   MI_MATH_SHR                   MI_MATH_INSTR(0x106, 0x0, 0x0)
> +#define   MI_MATH_SAR                   MI_MATH_INSTR(0x107, 0x0, 0x0)
> +
> +/* Registers used as operands in MI_MATH_INSTR */
> +#define   MI_MATH_REG(x)                (x)
> +#define   MI_MATH_REG_SRCA              0x20
> +#define   MI_MATH_REG_SRCB              0x21
> +#define   MI_MATH_REG_ACCU              0x31
> +#define   MI_MATH_REG_ZF                0x32
> +#define   MI_MATH_REG_CF                0x33
> +
> +#define MI_SET_PREDICATE                MI_INSTR(0x01, 0)
> +#define MI_ARB_CHECK                    MI_INSTR(0x5, 0)
> +#define MI_LOAD_REGISTER_REG            MI_INSTR(0x2A, 1)
> +#define CS_GPR(x)                       (0x600 + 8 * (x))
> +#define GPR(x)                          CS_GPR(x)
> +#define R(x)                            (x)
> +#define USERDATA(offset, idx)	        ((offset) + (0x100 + (idx)) * 4)
> +#define OFFSET(obj_offset, current, start) \
> +	((obj_offset) + (current - start) * 4)
> +
> +#define MI_PREDICATE_RESULT             0x3B8
> +#define WPARID                          0x21C
> +#define CS_MI_ADDRESS_OFFSET            0x3B4
> +
> +#define LOAD_REGISTER_REG(__reg_src, __reg_dst) do { \
> +		*bb++ = MI_LOAD_REGISTER_REG | BIT(19) | BIT(18); \
> +		*bb++ = (__reg_src); \
> +		*bb++ = (__reg_dst); \
> +	} while (0)
> +
> +#define LOAD_REGISTER_IMM32(__reg, __imm1) do { \
> +		*bb++ = MI_LOAD_REGISTER_IMM | BIT(19); \
> +		*bb++ = (__reg); \
> +		*bb++ = (__imm1); \
> +	} while (0)
> +
> +#define LOAD_REGISTER_IMM64(__reg, __imm1, __imm2) do { \
> +		*bb++ = (MI_LOAD_REGISTER_IMM + 2) | BIT(19); \
> +		*bb++ = (__reg); \
> +		*bb++ = (__imm1); \
> +		*bb++ = (__reg) + 4; \
> +		*bb++ = (__imm2); \
> +	} while (0)
> +
> +#define LOAD_REGISTER_MEM(__reg, __offset) do { \
> +		*bb++ = MI_LOAD_REGISTER_MEM_GEN8 | BIT(19); \
> +		*bb++ = (__reg); \
> +		*bb++ = (__offset); \
> +		*bb++ = (__offset) >> 32; \
> +	} while (0)
> +
> +#define LOAD_REGISTER_MEM_WPARID(__reg, __offset) do { \
> +		*bb++ = MI_LOAD_REGISTER_MEM_GEN8 | BIT(19) | BIT(16); \
> +		*bb++ = (__reg); \
> +		*bb++ = (__offset); \
> +		*bb++ = (__offset) >> 32; \
> +	} while (0)
> +
> +#define STORE_REGISTER_MEM(__reg, __offset) do { \
> +		*bb++ = MI_STORE_REGISTER_MEM_GEN8 | BIT(19); \
> +		*bb++ = (__reg); \
> +		*bb++ = (__offset); \
> +		*bb++ = (__offset) >> 32; \
> +	} while (0)
> +
> +#define STORE_REGISTER_MEM_PREDICATED(__reg, __offset) do { \
> +		*bb++ = MI_STORE_REGISTER_MEM_GEN8 | BIT(19) | (BIT(21); \
> +		*bb++ = (__reg); \
> +		*bb++ = (__offset); \
> +		*bb++ = (__offset) >> 32; \
> +	} while (0)
> +
> +#define COND_BBE(__value, __offset, __condition) do { \
> +		*bb++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | (__condition) | 2; \
> +		*bb++ = (__value); \
> +		*bb++ = (__offset); \
> +		*bb++ = (__offset) >> 32; \
> +	} while (0)
> +
> +#define MATH_4_STORE(__r1, __r2, __op, __r3) do { \
> +		*bb++ = MI_MATH(4); \
> +		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(__r1)); \
> +		*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(__r2)); \
> +		*bb++ = (__op); \
> +		*bb++ = MI_MATH_STORE(MI_MATH_REG(__r3), MI_MATH_REG_ACCU); \
> +	} while (0)
> +
> +#define BBSIZE 4096
> +
> +/* Aliasing for easier refactoring */
> +#define GPR_SIZE	GPR(0)
> +#define R_SIZE		R(0)
> +
> +#define GPR_CRC		GPR(1)
> +#define R_CRC		R(1)
> +
> +#define GPR_INDATA_IDX  GPR(2)
> +#define R_INDATA_IDX	R(2)
> +
> +#define GPR_TABLE_IDX   GPR(3)
> +#define R_TABLE_IDX	R(3)
> +
> +#define GPR_CURR_DW	GPR(4)
> +#define R_CURR_DW	R(4)
> +
> +#define GPR_CONST_2	GPR(5)
> +#define R_CONST_2	R(5)
> +
> +#define GPR_CONST_4	GPR(6)
> +#define R_CONST_4	R(6)
> +
> +#define GPR_CONST_8	GPR(7)
> +#define R_CONST_8	R(7)
> +
> +#define GPR_CONST_ff	GPR(8)
> +#define R_CONST_ff	R(8)
> +
> +#define GPR_ffffffff    GPR(9)
> +#define R_ffffffff	R(9)
> +
> +#define GPR_TMP_1	GPR(10)
> +#define R_TMP_1		R(10)
> +
> +#define GPR_TMP_2	GPR(11)
> +#define R_TMP_2		R(11)
> +
> +static void fill_batch(int i915, uint32_t bb_handle, uint64_t bb_offset,
> +		       uint64_t table_offset, uint64_t data_offset, uint32_t data_size)
> +{
> +	uint32_t *bb, *batch, *jmp;
> +	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
> +	const int use_64b = gen >= 8;
> +	uint64_t offset;
> +	uint64_t crc = USERDATA(table_offset, 0);
> +
> +	igt_assert(data_size % 4 == 0);
> +
> +	batch = gem_mmap__device_coherent(i915, bb_handle, 0, BBSIZE,
> +					  PROT_READ | PROT_WRITE);
> +	memset(batch, 0, BBSIZE);
> +
> +	bb = batch;
> +
> +	LOAD_REGISTER_IMM64(GPR_SIZE, data_size, 0);
> +	LOAD_REGISTER_IMM64(GPR_CRC, ~0U, 0);		/* crc start - 0xffffffff */
> +	LOAD_REGISTER_IMM64(GPR_INDATA_IDX, 0, 0);	/* data_offset index (0) */
> +	LOAD_REGISTER_IMM64(GPR_CONST_2, 2, 0);		/* const value 2 */
> +	LOAD_REGISTER_IMM64(GPR_CONST_4, 4, 0);		/* const value 4 */
> +	LOAD_REGISTER_IMM64(GPR_CONST_8, 8, 0);		/* const value 8 */
> +	LOAD_REGISTER_IMM64(GPR_CONST_ff, 0xff, 0);	/* const value 0xff */
> +	LOAD_REGISTER_IMM64(GPR_ffffffff, ~0U, 0);	/* const value 0xffffffff */
> +
> +	/* for indexed reads from memory */
> +	LOAD_REGISTER_IMM32(WPARID, 1);
> +
> +	jmp = bb;
> +
> +	*bb++ = MI_SET_PREDICATE;
> +	*bb++ = MI_ARB_CHECK;
> +
> +	LOAD_REGISTER_REG(GPR_INDATA_IDX, CS_MI_ADDRESS_OFFSET);
> +	LOAD_REGISTER_MEM_WPARID(GPR_CURR_DW, data_offset);
> +
> +	for (int byte = 0; byte < 4; byte++) {
> +		if (byte != 0)
> +			MATH_4_STORE(R_CURR_DW, R_CONST_8,
> +				     MI_MATH_SHR, R_CURR_DW); /* dw >> 8 */
> +
> +		/* crc = crc32_tab[(crc ^ *p++) & 0xFF] ^ (crc >> 8); */
> +		MATH_4_STORE(R_CURR_DW, R_CONST_ff,
> +			     MI_MATH_AND, R_TMP_1); /* dw & 0xff */
> +		MATH_4_STORE(R_CRC, R_TMP_1,
> +			     MI_MATH_XOR, R_TMP_1); /* crc ^ tmp */
> +		MATH_4_STORE(R_TMP_1, R_CONST_ff,
> +			     MI_MATH_AND, R_TMP_1); /* tmp & 0xff */
> +		MATH_4_STORE(R_TMP_1, R_CONST_2,
> +			     MI_MATH_SHL, R_TABLE_IDX); /* tmp << 2 (crc idx) */
> +
> +		LOAD_REGISTER_REG(GPR_TABLE_IDX, CS_MI_ADDRESS_OFFSET);
> +		LOAD_REGISTER_MEM_WPARID(GPR_TMP_1, table_offset);
> +
> +		MATH_4_STORE(R_CRC, R_CONST_8,
> +			     MI_MATH_SHR, R_TMP_2); /* crc >> 8 (shift) */
> +		MATH_4_STORE(R_TMP_2, R_TMP_1,
> +			     MI_MATH_XOR, R_CRC); /* crc = tab[v] ^ shift */
> +	}
> +
> +	/* increment data index */
> +	MATH_4_STORE(R_INDATA_IDX, R_CONST_4, MI_MATH_ADD, R_INDATA_IDX);
> +
> +	/* loop until R_SIZE == 0, R_SIZE = R_SIZE - R_CONST_4 */
> +
> +	*bb++ = MI_MATH(5);
> +	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(R_SIZE));
> +	*bb++ = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(R_CONST_4));
> +	*bb++ = MI_MATH_SUB;
> +	*bb++ = MI_MATH_STORE(MI_MATH_REG(R_SIZE), MI_MATH_REG_ACCU);
> +	*bb++ = MI_MATH_STORE(MI_MATH_REG(R_TMP_2), MI_MATH_REG_ZF);
> +	LOAD_REGISTER_REG(GPR_TMP_2, MI_PREDICATE_RESULT);
> +
> +	*bb++ = MI_BATCH_BUFFER_START | BIT(15) | BIT(8) | use_64b;
> +	offset = OFFSET(bb_offset, jmp, batch);
> +	*bb++ = offset;
> +	*bb++ = offset >> 32;
> +
> +	*bb++ = MI_SET_PREDICATE;
> +
> +	MATH_4_STORE(R_CRC, R_ffffffff, MI_MATH_XOR, R_TMP_1);
> +	STORE_REGISTER_MEM(GPR_TMP_1, crc);
> +
> +	*bb++ = MI_BATCH_BUFFER_END;
> +
> +	gem_munmap(batch, BBSIZE);
> +}
> +
> +uint32_t i915_crc32(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
> +		    const struct intel_execution_engine2 *e,
> +		    uint32_t data_handle, uint32_t data_size)
> +{
> +	struct drm_i915_gem_execbuffer2 execbuf = {};
> +	struct drm_i915_gem_exec_object2 obj[3] = {};
> +	uint64_t bb_offset, table_offset, data_offset;
> +	uint32_t bb, table, crc, table_size = 4096;
> +	uint32_t *ptr;
> +
> +	igt_assert(data_size % 4 == 0);
> +
> +	table = gem_create_in_memory_regions(i915, table_size, REGION_LMEM(0));
> +	gem_write(i915, table, 0, crc32_tab, sizeof(crc32_tab));
> +
> +	table_offset = get_offset(ahnd, table, table_size, 0);
> +	data_offset = get_offset(ahnd, data_handle, data_size, 0);
> +
> +	obj[0].offset = table_offset;
> +	obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> +	obj[0].handle = table;
> +
> +	obj[1].offset = data_offset;
> +	obj[1].flags = EXEC_OBJECT_PINNED;
> +	obj[1].handle = data_handle;
> +
> +	bb = gem_create_in_memory_regions(i915, BBSIZE, REGION_LMEM(0));
> +	bb_offset = get_offset(ahnd, bb, BBSIZE, 0);
> +	fill_batch(i915, bb, bb_offset, table_offset, data_offset, data_size);
> +	obj[2].offset = bb_offset;
> +	obj[2].flags = EXEC_OBJECT_PINNED;
> +	obj[2].handle = bb;
> +	execbuf.buffer_count = 3;
> +	execbuf.buffers_ptr = to_user_pointer(obj);
> +	execbuf.flags = e->flags;
> +	execbuf.rsvd1 = ctx->id;
> +	gem_execbuf(i915, &execbuf);
> +	gem_sync(i915, table);
> +
> +	ptr = gem_mmap__device_coherent(i915, table, 0, table_size, PROT_READ);
> +	crc = ptr[0x100];
> +	gem_munmap(ptr, table_size);
> +	gem_close(i915, table);
> +	gem_close(i915, bb);
> +
> +	return crc;
> +}
> +
> +bool supports_gpu_crc32(int i915)
> +{
> +	uint16_t devid = intel_get_drm_devid(i915);
> +
> +	return IS_DG2(devid);
> +}
> diff --git a/lib/i915/i915_crc.h b/lib/i915/i915_crc.h
> new file mode 100644
> index 0000000000..bb0195e2a8
> --- /dev/null
> +++ b/lib/i915/i915_crc.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +#ifndef _I915_CRC_H_
> +#define _I915_CRC_H_
> +
> +#include <stdint.h>
> +#include "intel_ctx.h"
> +
> +uint32_t cpu_crc32(const void *buf, size_t size);
> +uint32_t i915_crc32(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
> +		    const struct intel_execution_engine2 *e,
> +		    uint32_t data_handle, uint32_t data_size);
> +bool supports_gpu_crc32(int i915);
> +
> +#endif /* _I915_CRC_ */
> diff --git a/lib/i915/i915_crc32_table.c b/lib/i915/i915_crc32_table.c
> new file mode 100644
> index 0000000000..eca5e43218
> --- /dev/null
> +++ b/lib/i915/i915_crc32_table.c
> @@ -0,0 +1,105 @@
> +/*-
> + *  COPYRIGHT (C) 1986 Gary S. Brown.  You may use this program, or
> + *  code or tables extracted from it, as desired without restriction.
> + */
> +
> +/*
> + *  First, the polynomial itself and its table of feedback terms.  The
> + *  polynomial is
> + *  X^32+X^26+X^23+X^22+X^16+X^12+X^11+X^10+X^8+X^7+X^5+X^4+X^2+X^1+X^0
> + *
> + *  Note that we take it "backwards" and put the highest-order term in
> + *  the lowest-order bit.  The X^32 term is "implied"; the LSB is the
> + *  X^31 term, etc.  The X^0 term (usually shown as "+1") results in
> + *  the MSB being 1
> + *
> + *  Note that the usual hardware shift register implementation, which
> + *  is what we're using (we're merely optimizing it by doing eight-bit
> + *  chunks at a time) shifts bits into the lowest-order term.  In our
> + *  implementation, that means shifting towards the right.  Why do we
> + *  do it this way?  Because the calculated CRC must be transmitted in
> + *  order from highest-order term to lowest-order term.  UARTs transmit
> + *  characters in order from LSB to MSB.  By storing the CRC this way
> + *  we hand it to the UART in the order low-byte to high-byte; the UART
> + *  sends each low-bit to hight-bit; and the result is transmission bit
> + *  by bit from highest- to lowest-order term without requiring any bit
> + *  shuffling on our part.  Reception works similarly
> + *
> + *  The feedback terms table consists of 256, 32-bit entries.  Notes
> + *
> + *      The table can be generated at runtime if desired; code to do so
> + *      is shown later.  It might not be obvious, but the feedback
> + *      terms simply represent the results of eight shift/xor opera
> + *      tions for all combinations of data and CRC register values
> + *
> + *      The values must be right-shifted by eight bits by the "updcrc
> + *      logic; the shift must be unsigned (bring in zeroes).  On some
> + *      hardware you could probably optimize the shift in assembler by
> + *      using byte-swap instructions
> + *      polynomial $edb88320
> + *
> + *
> + * CRC32 code derived from work by Gary S. Brown.
> + */
> +
> +#include <stdint.h>
> +
> +const uint32_t crc32_tab[] = {
> +	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
> +	0xe963a535, 0x9e6495a3,	0x0edb8832, 0x79dcb8a4, 0xe0d5e91e, 0x97d2d988,
> +	0x09b64c2b, 0x7eb17cbd, 0xe7b82d07, 0x90bf1d91, 0x1db71064, 0x6ab020f2,
> +	0xf3b97148, 0x84be41de,	0x1adad47d, 0x6ddde4eb, 0xf4d4b551, 0x83d385c7,
> +	0x136c9856, 0x646ba8c0, 0xfd62f97a, 0x8a65c9ec,	0x14015c4f, 0x63066cd9,
> +	0xfa0f3d63, 0x8d080df5,	0x3b6e20c8, 0x4c69105e, 0xd56041e4, 0xa2677172,
> +	0x3c03e4d1, 0x4b04d447, 0xd20d85fd, 0xa50ab56b,	0x35b5a8fa, 0x42b2986c,
> +	0xdbbbc9d6, 0xacbcf940,	0x32d86ce3, 0x45df5c75, 0xdcd60dcf, 0xabd13d59,
> +	0x26d930ac, 0x51de003a, 0xc8d75180, 0xbfd06116, 0x21b4f4b5, 0x56b3c423,
> +	0xcfba9599, 0xb8bda50f, 0x2802b89e, 0x5f058808, 0xc60cd9b2, 0xb10be924,
> +	0x2f6f7c87, 0x58684c11, 0xc1611dab, 0xb6662d3d,	0x76dc4190, 0x01db7106,
> +	0x98d220bc, 0xefd5102a, 0x71b18589, 0x06b6b51f, 0x9fbfe4a5, 0xe8b8d433,
> +	0x7807c9a2, 0x0f00f934, 0x9609a88e, 0xe10e9818, 0x7f6a0dbb, 0x086d3d2d,
> +	0x91646c97, 0xe6635c01, 0x6b6b51f4, 0x1c6c6162, 0x856530d8, 0xf262004e,
> +	0x6c0695ed, 0x1b01a57b, 0x8208f4c1, 0xf50fc457, 0x65b0d9c6, 0x12b7e950,
> +	0x8bbeb8ea, 0xfcb9887c, 0x62dd1ddf, 0x15da2d49, 0x8cd37cf3, 0xfbd44c65,
> +	0x4db26158, 0x3ab551ce, 0xa3bc0074, 0xd4bb30e2, 0x4adfa541, 0x3dd895d7,
> +	0xa4d1c46d, 0xd3d6f4fb, 0x4369e96a, 0x346ed9fc, 0xad678846, 0xda60b8d0,
> +	0x44042d73, 0x33031de5, 0xaa0a4c5f, 0xdd0d7cc9, 0x5005713c, 0x270241aa,
> +	0xbe0b1010, 0xc90c2086, 0x5768b525, 0x206f85b3, 0xb966d409, 0xce61e49f,
> +	0x5edef90e, 0x29d9c998, 0xb0d09822, 0xc7d7a8b4, 0x59b33d17, 0x2eb40d81,
> +	0xb7bd5c3b, 0xc0ba6cad, 0xedb88320, 0x9abfb3b6, 0x03b6e20c, 0x74b1d29a,
> +	0xead54739, 0x9dd277af, 0x04db2615, 0x73dc1683, 0xe3630b12, 0x94643b84,
> +	0x0d6d6a3e, 0x7a6a5aa8, 0xe40ecf0b, 0x9309ff9d, 0x0a00ae27, 0x7d079eb1,
> +	0xf00f9344, 0x8708a3d2, 0x1e01f268, 0x6906c2fe, 0xf762575d, 0x806567cb,
> +	0x196c3671, 0x6e6b06e7, 0xfed41b76, 0x89d32be0, 0x10da7a5a, 0x67dd4acc,
> +	0xf9b9df6f, 0x8ebeeff9, 0x17b7be43, 0x60b08ed5, 0xd6d6a3e8, 0xa1d1937e,
> +	0x38d8c2c4, 0x4fdff252, 0xd1bb67f1, 0xa6bc5767, 0x3fb506dd, 0x48b2364b,
> +	0xd80d2bda, 0xaf0a1b4c, 0x36034af6, 0x41047a60, 0xdf60efc3, 0xa867df55,
> +	0x316e8eef, 0x4669be79, 0xcb61b38c, 0xbc66831a, 0x256fd2a0, 0x5268e236,
> +	0xcc0c7795, 0xbb0b4703, 0x220216b9, 0x5505262f, 0xc5ba3bbe, 0xb2bd0b28,
> +	0x2bb45a92, 0x5cb36a04, 0xc2d7ffa7, 0xb5d0cf31, 0x2cd99e8b, 0x5bdeae1d,
> +	0x9b64c2b0, 0xec63f226, 0x756aa39c, 0x026d930a, 0x9c0906a9, 0xeb0e363f,
> +	0x72076785, 0x05005713, 0x95bf4a82, 0xe2b87a14, 0x7bb12bae, 0x0cb61b38,
> +	0x92d28e9b, 0xe5d5be0d, 0x7cdcefb7, 0x0bdbdf21, 0x86d3d2d4, 0xf1d4e242,
> +	0x68ddb3f8, 0x1fda836e, 0x81be16cd, 0xf6b9265b, 0x6fb077e1, 0x18b74777,
> +	0x88085ae6, 0xff0f6a70, 0x66063bca, 0x11010b5c, 0x8f659eff, 0xf862ae69,
> +	0x616bffd3, 0x166ccf45, 0xa00ae278, 0xd70dd2ee, 0x4e048354, 0x3903b3c2,
> +	0xa7672661, 0xd06016f7, 0x4969474d, 0x3e6e77db, 0xaed16a4a, 0xd9d65adc,
> +	0x40df0b66, 0x37d83bf0, 0xa9bcae53, 0xdebb9ec5, 0x47b2cf7f, 0x30b5ffe9,
> +	0xbdbdf21c, 0xcabac28a, 0x53b39330, 0x24b4a3a6, 0xbad03605, 0xcdd70693,
> +	0x54de5729, 0x23d967bf, 0xb3667a2e, 0xc4614ab8, 0x5d681b02, 0x2a6f2b94,
> +	0xb40bbe37, 0xc30c8ea1, 0x5a05df1b, 0x2d02ef8d
> +};
> +
> +uint32_t cpu_crc32(const void *buf, size_t size)
> +{
> +
> +	const uint8_t *p = buf;
> +	uint32_t crc;
> +
> +	crc = ~0U;
> +
> +	while (size--)
> +		crc = crc32_tab[(crc ^ *p++) & 0xFF] ^ (crc >> 8);
> +
> +	return crc ^ ~0U;
> +}
> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index cb62728896..fff32e1816 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2625,6 +2625,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  #define MI_LOAD_REGISTER_IMM		((0x22 << 23) | 1)
>  #define MI_LOAD_REGISTER_MEM_GEN8	((0x29 << 23) | (4 - 2))
>  #define   MI_MMIO_REMAP_ENABLE_GEN12	(1 << 17)
> +#define MI_STORE_REGISTER_MEM_GEN8	((0x24 << 23) | (4 - 2))
>  
>  /* Flush */
>  #define MI_FLUSH			(0x04<<23)
> @@ -2657,6 +2658,12 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  #define MI_BATCH_BUFFER_END	(0xA << 23)
>  #define MI_COND_BATCH_BUFFER_END	(0x36 << 23)
>  #define MI_DO_COMPARE                   (1 << 21)
> +#define MAD_GT_IDD			(0 << 12)
> +#define MAD_GT_OR_EQ_IDD		(1 << 12)
> +#define MAD_LT_IDD			(2 << 12)
> +#define MAD_LT_OR_EQ_IDD		(3 << 12)
> +#define MAD_EQ_IDD			(4 << 12)
> +#define MAD_NEQ_IDD			(5 << 12)
>  
>  #define MI_BATCH_NON_SECURE		(1)
>  #define MI_BATCH_NON_SECURE_I965	(1 << 8)
> diff --git a/lib/meson.build b/lib/meson.build
> index 0a173c1fc6..b05198ecc9 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -10,6 +10,7 @@ lib_sources = [
>  	'i915/gem_ring.c',
>  	'i915/gem_mman.c',
>  	'i915/gem_vm.c',
> +	'i915/i915_crc.c',
>  	'i915/intel_memory_region.c',
>  	'i915/intel_mocs.c',
>  	'i915/i915_blt.c',
> -- 
> 2.32.0
> 
