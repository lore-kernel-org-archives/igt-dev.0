Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2C606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Aay6nk2e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B227810E307;
	Wed, 21 Oct 2026 15:59:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7D2F810E1DF
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:58:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF35815A1
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 08:58:55 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 A71823F7D8
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1792598339; bh=9vT9ihIBZ5qAoPO3Zpgh0qd/qZzs9OMx9tk0wS2VWto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Aay6nk2e93fKn1se0Q5Z4v2n8HgZ+lzSleaj7VZjE1dWhimSuPG5izUW5pbuF9MWp
 q68e5vhI08q1g6ACwRtW32YY9V+qA9kXhzoXcUsb3rWcbMhqZlwvhOV/Y8jg4v8vvl
 kJjIDPjNLbxILVdmb/EKYKQ9tWfLGAM60RZU0YS0=
Date: Wed, 21 Oct 2026 16:58:56 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com
Subject: Re: [PATCH 4/4] panthor: Add simple compute-shader test
Message-ID: <atjhQDV4nZJY3J5y@e142607>
References: <20261015130837.710795-1-daniels@collabora.com>
 <20261015130837.710795-5-daniels@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015130837.710795-5-daniels@collabora.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 02:05:49PM +0100, Daniel Stone wrote:
> This test launches a compute shader which performs RMW on a memory
> array, to check that we can actually launch jobs and see the results.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> ---
>  lib/igt_panthor.h             | 204 +++++++++++++++++++++++++++++
>  tests/panthor/panthor_group.c | 240 ++++++++++++++++++++++++++++++++++
>  2 files changed, 444 insertions(+)
> 
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index dfeb0ac60..35882fad7 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -363,4 +363,208 @@ cs_error_barrier(void)
>  	return instr.raw;
>  }
>  
> +struct gpu_src_reg {
> +	uint8_t reg;
> +	bool last;
> +	uint8_t rep;
> +};
> +
> +struct gpu_dst_reg {
> +	uint8_t reg;
> +};
> +
> +enum gpu_flow_ctrl {
> +	FLOW_NONE = 0,
> +	FLOW_WAIT0 = 0x1,
> +	FLOW_WAIT1 = 0x2,
> +	FLOW_WAIT01 = 0x3,
> +	FLOW_WAIT2 = 0x4,
> +	FLOW_WAIT02 = 0x5,
> +	FLOW_WAIT12 = 0x6,
> +	FLOW_WAIT012 = 0x7,
> +	FLOW_WAIT0126 = 0x8,
> +	FLOW_WAIT = 0x9,
> +	FLOW_RECONVERGE = 0xa,
> +	FLOW_WAIT_RESOURCE = 0xc,
> +	FLOW_DISCARD = 0xd,
> +	FLOW_END = 0xf,
> +};
> +
> +enum gpu_reg_width {
> +	REG_WIDTH_LO16 = 0x1,
> +	REG_WIDTH_HI16 = 0x2,
> +	REG_WIDTH_32 = 0x3,
> +};
> +
> +static inline struct gpu_dst_reg
> +gpu_dst_reg(uint8_t reg)
> +{
> +	struct gpu_dst_reg ret = {
> +		.reg = reg
> +	};
> +	return ret;
> +}
> +
> +static inline struct gpu_src_reg
> +gpu_src_zero(void)
> +{
> +	struct gpu_src_reg ret = {
> +		.reg = 255, /* architecturally invalid */
> +		.last = false,
> +		.rep = (0x3 << 6),
> +	};
> +	return ret;
> +}
> +
> +static inline struct gpu_src_reg
> +gpu_src_reg(uint8_t reg)
> +{
> +	struct gpu_src_reg ret = {
> +		.reg = reg,
> +		.last = false,
> +		.rep = reg,
> +	};
> +	return ret;
> +}
> +
> +static inline struct gpu_src_reg
> +gpu_src_reg_last(uint8_t reg)
> +{
> +	struct gpu_src_reg ret = {
> +		.reg = reg,
> +		.last = true,
> +		.rep = (reg | (1 << 6)),
> +	};
> +	return ret;
> +}
> +
> +#define ins(x, v, s) x |= ((uint64_t) v << s)

Minor nit to add to Kamil's comments: can you also indent the content of the define a bit more?

Otherwise,

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu


> +
> +static inline uint64_t
> +gpu_mov_imm_i32(struct gpu_dst_reg dst, int32_t imm, enum gpu_flow_ctrl flow)
> +{
> +	uint64_t ret = 0;
> +	ins(ret, gpu_src_zero().rep, 0);
> +	ins(ret, imm, 8);
> +	ins(ret, dst.reg, 40);
> +	ins(ret, REG_WIDTH_32, 46);
> +	ins(ret, 0x0, 48); /* opcode */
> +	ins(ret, 0x11, 52); /* class */
> +	ins(ret, 0x0, 57); /* FAU */
> +	ins(ret, flow, 59);
> +	return ret;
> +}
> +
> +static inline uint64_t
> +gpu_lshift_or_i32(struct gpu_dst_reg dst, struct gpu_src_reg src,
> +		  struct gpu_src_reg shift, struct gpu_src_reg or,
> +		  enum gpu_flow_ctrl flow)
> +{
> +	uint64_t ret = 0;
> +	ins(ret, src.rep, 0);
> +	ins(ret, shift.rep, 8);
> +	ins(ret, or.rep, 16);
> +	ins(ret, 0x1, 24); /* logicop = or */
> +	ins(ret, 0x4, 26); /* lanes = b0 */
> +	ins(ret, 0x0, 30); /* dst.not = false */
> +	ins(ret, 0x1, 32); /* shift = left */
> +	ins(ret, 0x0, 35); /* src2.not = false */
> +	ins(ret, 0x0, 36); /* widen = false */
> +	ins(ret, dst.reg, 40);
> +	ins(ret, REG_WIDTH_32, 46);
> +	ins(ret, 0x4, 48); /* opcode */
> +	ins(ret, 0xb, 52); /* class */
> +	ins(ret, 0x0, 57); /* FAU */
> +	ins(ret, flow, 59);
> +	return ret;
> +}
> +
> +static inline uint64_t
> +gpu_iadd_u32(struct gpu_dst_reg dst, struct gpu_src_reg left,
> +	     struct gpu_src_reg right, enum gpu_flow_ctrl flow)
> +{
> +	uint64_t ret = 0;
> +	ins(ret, left.rep, 0);
> +	ins(ret, right.rep, 8);
> +	ins(ret, 0x0, 16); /* opcode */
> +	ins(ret, 0x0, 26); /* widen1 */
> +	ins(ret, 0x0, 30); /* saturate */
> +	ins(ret, 0x0, 36); /* widen0 */
> +	ins(ret, dst.reg, 40);
> +	ins(ret, REG_WIDTH_32, 46);
> +	ins(ret, 0x0, 48); /* data type */
> +	ins(ret, 0xa, 52); /* class */
> +	ins(ret, 0x0, 57); /* FAU */
> +	ins(ret, flow, 59);
> +	return ret;
> +}
> +
> +static inline uint64_t
> +gpu_imul_u32(struct gpu_dst_reg dst, struct gpu_src_reg left,
> +	     struct gpu_src_reg right, enum gpu_flow_ctrl flow)
> +{
> +	uint64_t ret = 0;
> +	ins(ret, left.rep, 0);
> +	ins(ret, right.rep, 8);
> +	ins(ret, 0xa, 16); /* opcode */
> +	ins(ret, 0x0, 26); /* widen1 */
> +	ins(ret, 0x0, 30); /* saturate */
> +	ins(ret, 0x0, 36); /* widen0 */
> +	ins(ret, dst.reg, 40);
> +	ins(ret, REG_WIDTH_32, 46);
> +	ins(ret, 0x0, 48); /* data type */
> +	ins(ret, 0xa, 52); /* class */
> +	ins(ret, 0x0, 57); /* FAU */
> +	ins(ret, flow, 59);
> +	return ret;
> +}
> +
> +static inline uint64_t
> +gpu_load_i32(struct gpu_dst_reg dst, struct gpu_src_reg addr_lo,
> +	     struct gpu_src_reg addr_hi, uint16_t offset,
> +	     uint8_t sb_slot, enum gpu_flow_ctrl flow)
> +{
> +	uint64_t ret = 0;
> +	igt_assert_eq(addr_hi.reg, addr_lo.reg + 1);
> +	ins(ret, addr_lo.rep, 0);
> +	ins(ret, offset, 8);
> +	ins(ret, 0x0, 24); /* access mode */
> +	ins(ret, REG_WIDTH_32, 27);
> +	ins(ret, sb_slot, 30);
> +	ins(ret, 0x1, 33); /* staging register count */
> +	ins(ret, 0x0, 36); /* load 32 */
> +	ins(ret, 0x1, 39); /* no sign extension */
> +	ins(ret, dst.reg, 40); /* base staging register */
> +	ins(ret, 0x2, 46); /* write staging registers */
> +	ins(ret, 0x0, 48); /* opcode */
> +	ins(ret, 0x6, 52); /* class */
> +	ins(ret, 0x0, 57); /* FAU */
> +	ins(ret, flow, 59);
> +	return ret;
> +}
> +
> +static inline uint64_t
> +gpu_store_i32(struct gpu_src_reg addr_lo, struct gpu_src_reg addr_hi,
> +	      struct gpu_src_reg val, uint16_t offset,
> +	      uint8_t sb_slot, enum gpu_flow_ctrl flow)
> +{
> +	uint64_t ret = 0;
> +	igt_assert_eq(addr_hi.reg, addr_lo.reg + 1);
> +	ins(ret, addr_lo.rep, 0);
> +	ins(ret, offset, 8);
> +	ins(ret, 0x0, 24); /* access mode */
> +	ins(ret, REG_WIDTH_32, 27);
> +	ins(ret, sb_slot, 30);
> +	ins(ret, 0x1, 33); /* staging register count */
> +	ins(ret, val.reg, 40); /* base staging register */
> +	ins(ret, 0x1, 46); /* read staging registers */
> +	ins(ret, 0x1, 48); /* opcode */
> +	ins(ret, 0x6, 52); /* class */
> +	ins(ret, 0x0, 57); /* FAU */
> +	ins(ret, flow, 59);
> +	return ret;
> +}
> +
> +#undef ins
> +
>  #endif /* IGT_PANTHOR_H */
> diff --git a/tests/panthor/panthor_group.c b/tests/panthor/panthor_group.c
> index c79f8d629..feca42482 100644
> --- a/tests/panthor/panthor_group.c
> +++ b/tests/panthor/panthor_group.c
> @@ -10,6 +10,133 @@
>  #include "igt_syncobj.h"
>  #include "panthor_drm.h"
>  
> +/*
> + * Record a simple compute program:
> + * {
> + *     extern uint32_t shared_buf[num_invocations];
> + *     extern const uint32_t my_invocation_id;
> + *     shared_buf[my_invocation_id] *= my_invocation_id;
> + * }
> + */
> +static void
> +record_compute_prog(uint8_t *csf_cmdbuf, unsigned int *csf_cmdbuf_size,
> +		    uint8_t *gpu_cmdbuf, unsigned int *gpu_cmdbuf_size,
> +		    uint32_t srt_gpuva, uint32_t fau_gpuva, uint32_t spd_gpuva,
> +		    uint32_t tsd_gpuva, uint32_t data_gpuva)
> +{
> +	const uint8_t reg_id_global_x = 60; /* preloaded */
> +	const uint8_t reg_addr_lo = 0;
> +	const uint8_t reg_addr_hi = 1;
> +	const uint8_t reg_val = 2;
> +	const uint8_t reg_offset = 3;
> +	const uint8_t reg_shift = 4;
> +	const uint8_t compute_sr_base = 0;
> +	const uint8_t zero_reg = 40;
> +
> +	uint64_t gpu_instrs[] = {
> +		/* MOV_IMM.i32 rADDRLO, 0x10000 */
> +		gpu_mov_imm_i32(gpu_dst_reg(reg_addr_lo), data_gpuva, FLOW_NONE),
> +		/* MOV_IMM.i32 rADDRHI, 0x0 */
> +		gpu_mov_imm_i32(gpu_dst_reg(reg_addr_hi), 0x0, FLOW_NONE),
> +		/* MOV_IMM.i32 rSHIFT, 0x2 */
> +		gpu_mov_imm_i32(gpu_dst_reg(reg_shift), 0x2, FLOW_NONE),
> +		/* LSHIFT_OR.i32 rOFFSET, rGLOBALID, rSHIFT^, 0x0 */
> +		gpu_lshift_or_i32(gpu_dst_reg(reg_offset),
> +				  gpu_src_reg(reg_id_global_x),
> +				  gpu_src_reg_last(reg_shift),
> +				  gpu_src_zero(),
> +				  FLOW_NONE),
> +		/* IADD.u32 rADDRLO, rADDRLO^, rOFFSET^ */
> +		gpu_iadd_u32(gpu_dst_reg(reg_addr_lo),
> +			     gpu_src_reg_last(reg_addr_lo),
> +			     gpu_src_reg_last(reg_offset),
> +			     FLOW_NONE),
> +		/* LOAD.i32.slot0.wait0 @rVAL, [rADDRLO:rADDRHI], offset:0 */
> +		gpu_load_i32(gpu_dst_reg(reg_val),
> +			     gpu_src_reg(reg_addr_lo),
> +			     gpu_src_reg(reg_addr_hi),
> +			     0x0,
> +			     0, FLOW_WAIT0),
> +		/* IMUL_u32 rVAL, rVAL^, rGLOBALID^ */
> +		gpu_imul_u32(gpu_dst_reg(reg_val),
> +			     gpu_src_reg_last(reg_val),
> +			     gpu_src_reg_last(reg_id_global_x),
> +			     FLOW_NONE),
> +		/* STORE.i32.slot1.end @rVAL, [rADDRLO^:rADDRHI^], offset:0 */
> +		gpu_store_i32(gpu_src_reg_last(reg_addr_lo),
> +			      gpu_src_reg_last(reg_addr_hi),
> +			      gpu_src_reg(reg_val),
> +			      0x0,
> +			      1, FLOW_END),
> +	};
> +
> +	uint64_t csf_instrs[] = {
> +		/* REQ_RESOURCE.compute */
> +		cs_req_resource(true, false, false, false),
> +		/* MOV32 r40, 0 (always force cache flush/invalidate) */
> +		cs_mov32(zero_reg, 0),
> +		/* FLUSH_CACHE.clean_invalidate_l2.clean_invalidate_lsc.invalidate_other.sb0 */
> +		cs_flush(CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
> +			 CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
> +			 CS_FLUSH_MODE_INVALIDATE,
> +			 0, zero_reg, 1),
> +		/* WAIT (flush) */
> +		cs_wait(0xff, false),
> +		/* ShaderResourceTable 0-3 pointers */
> +		cs_mov48(compute_sr_base +  0, srt_gpuva),
> +		cs_mov48(compute_sr_base +  2, 0x222222222222),
> +		cs_mov48(compute_sr_base +  4, 0x333333333333),
> +		cs_mov48(compute_sr_base +  6, 0x444444444444),
> +		/* FastAccessUniform table 0-3 pointers */
> +		cs_mov48(compute_sr_base +  8, fau_gpuva),
> +		cs_mov48(compute_sr_base + 10, 0x666666666666),
> +		cs_mov48(compute_sr_base + 12, 0x777777777777),
> +		cs_mov48(compute_sr_base + 14, 0x888888888888),
> +		/* ShaderProgramDescriptor 0-3 pointers */
> +		cs_mov48(compute_sr_base + 16, spd_gpuva),
> +		cs_mov48(compute_sr_base + 18, 0x999999999999),
> +		cs_mov48(compute_sr_base + 20, 0xaaaaaaaaaaaa),
> +		cs_mov48(compute_sr_base + 22, 0xbbbbbbbbbbbb),
> +		/* ThreadStorageDescriptor 0-3 pointers */
> +		cs_mov48(compute_sr_base + 24, tsd_gpuva),
> +		cs_mov48(compute_sr_base + 26, 0xdddddddddddd),
> +		cs_mov48(compute_sr_base + 28, 0xeeeeeeeeeeee),
> +		cs_mov48(compute_sr_base + 30, 0xffffffffffff),
> +		/* global ID offset = 0 */
> +		cs_mov32(compute_sr_base + 32, 0),
> +		/* workgroup size 64x1x1, allow merge */
> +		cs_mov32(compute_sr_base + 33, (63 << 0) | (0 << 10) | (0 << 20) | (1 << 31)),
> +		/* job offset (x/y/z) = { 0, 0, 0 } */
> +		cs_mov32(compute_sr_base + 34, 0),
> +		cs_mov32(compute_sr_base + 35, 0),
> +		cs_mov32(compute_sr_base + 36, 0),
> +		/* job size (x/y/z) = { 64, 1, 1 } */
> +		cs_mov32(compute_sr_base + 37, 64),
> +		cs_mov32(compute_sr_base + 38, 1),
> +		cs_mov32(compute_sr_base + 39, 1),
> +		/* SET_SB_ENTRY.async_ep1.other1 */
> +		cs_set_sb_entry(1, 1),
> +		/* RUN_COMPUTE.increment64.x_axis.no_increment.srt0.spd0.tsd0.fau0 */
> +		cs_run_compute(64, CS_TASK_AXIS_X, 0, 0, 0, 0, 0),
> +		/* WAIT (RUN_COMPUTE) */
> +		cs_wait(0xff, false),
> +		/* FLUSH_CACHE.clean_invalidate_l2.clean_invalidate_lsc.invalidate_other.sb0 */
> +		cs_flush(CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
> +			 CS_FLUSH_MODE_CLEAN_AND_INVALIDATE,
> +			 CS_FLUSH_MODE_INVALIDATE,
> +			 0, zero_reg, 1),
> +		/* WAIT (flush) */
> +		cs_wait(0xff, false),
> +		/* ERROR_BARRIER */
> +		cs_error_barrier(),
> +	};
> +
> +	memcpy(gpu_cmdbuf, gpu_instrs, sizeof(gpu_instrs));
> +	*gpu_cmdbuf_size = sizeof(gpu_instrs);
> +	memcpy(csf_cmdbuf, csf_instrs, sizeof(csf_instrs));
> +	*csf_cmdbuf_size = sizeof(csf_instrs);
> +}
> +
>  static size_t
>  issue_store_multiple(uint8_t *cs, uint64_t kernel_va, uint32_t constant)
>  {
> @@ -118,6 +245,119 @@ int igt_main() {
>  		igt_panthor_free_bo(fd, &result_bo);
>  	}
>  
> +	igt_describe("Submit a simple compute job with memory access.");
> +	igt_subtest("simple_compute") {
> +		uint32_t vm_id;
> +		uint32_t group_handle;
> +		struct panthor_bo csf_cmdbuf_bo = {};
> +		struct panthor_bo gpu_cmdbuf_bo = {};
> +		struct panthor_bo resource_table_bo = {};
> +		struct panthor_bo data_bo = {};
> +		uint64_t csf_cmdbuf_gpuva;
> +		uint32_t csf_cmdbuf_size;
> +		uint64_t gpu_cmdbuf_gpuva;
> +		uint32_t gpu_cmdbuf_size;
> +		uint32_t resource_table_gpuva;
> +		uint32_t data_gpuva;
> +		uint32_t syncobj_handle;
> +		uint32_t srt_offset;
> +		uint32_t fau_offset;
> +		uint32_t spd_offset;
> +		uint32_t *spd_ptr;
> +		uint32_t spd_gpuva;
> +		uint32_t tsd_offset;
> +		uint32_t *tsd_ptr;
> +		int arch = igt_panthor_get_arch(fd);
> +
> +		igt_require(arch < 15);
> +
> +		igt_panthor_vm_create(fd, &vm_id, 0);
> +
> +		/* CSF ISA command stream */
> +		csf_cmdbuf_gpuva = 0x1000000;
> +		igt_panthor_bo_create_mapped(fd, &csf_cmdbuf_bo, 4096, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, csf_cmdbuf_bo.handle, csf_cmdbuf_gpuva,
> +				    csf_cmdbuf_bo.size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +		memset(csf_cmdbuf_bo.map, 0, csf_cmdbuf_bo.size);
> +
> +		/* GPU ISA command stream */
> +		gpu_cmdbuf_gpuva = 0x2000000;
> +		igt_panthor_bo_create_mapped(fd, &gpu_cmdbuf_bo, 4096, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, gpu_cmdbuf_bo.handle, gpu_cmdbuf_gpuva,
> +				    gpu_cmdbuf_bo.size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +		memset(gpu_cmdbuf_bo.map, 0, gpu_cmdbuf_bo.size);
> +
> +		/* resource tables passed to RUN_COMPUTE */
> +		resource_table_gpuva = 0x3000000;
> +		igt_panthor_bo_create_mapped(fd, &resource_table_bo, 4096, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, resource_table_bo.handle, resource_table_gpuva,
> +				    resource_table_bo.size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +		memset(resource_table_bo.map, 0, resource_table_bo.size);
> +		/* ShaderResourceTable descriptor (zeroed) */
> +		srt_offset = 0;
> +		/* FastAccessUniform descriptor (zeroed) */
> +		fau_offset = 128;
> +		/* ShaderProgramDescriptor */
> +		spd_offset = 256;
> +		spd_gpuva = resource_table_gpuva + spd_offset;
> +		if (arch == 14)
> +			spd_gpuva |= 2; /* register allocation propagated into ptr */
> +		spd_ptr = (uint32_t *) ((unsigned char *) resource_table_bo.map + spd_offset);
> +		spd_ptr[0] = 0x8 | (0x1 << 4); /* compute shader */
> +		spd_ptr[0] |= (0 << 16) | (0 << 17) | (0 << 19); /* no NaN suppress, FTZ, inf suppress */
> +		spd_ptr[0] |= (0 << 29) | (2 << 30); /* no JUMP_EX, max 32 registers */
> +		spd_ptr[1] |= (1 << 12); /* preload GlobalInvocationID.x into r60 */
> +		spd_ptr[2] = gpu_cmdbuf_gpuva; /* initial PC */
> +		/* ThreadStorageDescriptor */
> +		tsd_offset = 512;
> +		tsd_ptr = (uint32_t *) ((unsigned char *) resource_table_bo.map + tsd_offset);
> +		tsd_ptr[1] = 0x1f; /* max wls_instances */
> +
> +		/* CPU<->GPU shared data */
> +		data_gpuva = 0x4000000;
> +		igt_panthor_bo_create_mapped(fd, &data_bo, 16384, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, data_bo.handle, data_gpuva,
> +				    data_bo.size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, 0);
> +		for (unsigned int i = 0; i < 64 * 64; i++) {
> +			uint32_t *x = data_bo.map + (i * sizeof(uint32_t));
> +			*x = i;
> +		}
> +
> +		record_compute_prog(csf_cmdbuf_bo.map, &csf_cmdbuf_size,
> +				    gpu_cmdbuf_bo.map, &gpu_cmdbuf_size,
> +				    resource_table_gpuva + srt_offset,
> +				    resource_table_gpuva + fau_offset,
> +				    spd_gpuva,
> +				    resource_table_gpuva + tsd_offset,
> +				    data_gpuva);
> +
> +		group_handle = igt_panthor_group_create_simple(fd, vm_id, 0);
> +		igt_assert_neq(group_handle, 0);
> +
> +		syncobj_handle = syncobj_create(fd, 0);
> +
> +		igt_panthor_group_submit_simple(fd, group_handle, 0,
> +						csf_cmdbuf_gpuva, csf_cmdbuf_size,
> +						syncobj_handle, 0);
> +		igt_assert(syncobj_wait(fd, &syncobj_handle, 1, INT64_MAX, 0, NULL));
> +
> +		for (unsigned int i = 0; i < 64 * 64; i++) {
> +			uint32_t *x = data_bo.map + (i * sizeof(uint32_t));
> +			igt_assert_eq(*x, i * i);
> +		}
> +
> +		syncobj_destroy(fd, syncobj_handle);
> +
> +		igt_panthor_group_destroy(fd, group_handle, 0);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +
> +		igt_panthor_free_bo(fd, &data_bo);
> +		igt_panthor_free_bo(fd, &resource_table_bo);
> +		igt_panthor_free_bo(fd, &gpu_cmdbuf_bo);
> +		igt_panthor_free_bo(fd, &csf_cmdbuf_bo);
> +	}
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.47.3
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
