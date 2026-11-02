Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57739606A326
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZVkIhO4E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0132410E5B6;
	Mon,  2 Nov 2026 10:32:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AD610ECCF
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793615489; x=1825151489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZuePrOYC6uQvOi0iiqNbm+McyMMiKQYfexRA9rXjKdw=;
 b=ZVkIhO4ETsXdDOgYr/ZupmTFHGzgyHTFYVVHloDM8xmbPIKdPOihJs/E
 ACEekW0uPK2sRasm4fHBVIwNjZh+zYfzd33QABqg3BGM3rgsnrk5oGvUP
 G1y3p95l7Wf2ckyGf1n0Pg9Wv3E+RZR2ySjcKNljuaNpffKq7n0yTkqOW
 Gwc8+6ALzCJqc9ubDBD+/SZCUfH0pJaQZ4v7u27i7mHqUC+GOL/Lcjh19
 teQ4gDQzVf1a09kkhQI/23T1PTC/z7CY7533AOOJYSLt6RIIKM2oSpZ7a
 wIG3C1FlXJrPop6F9BhvEWjsSKl52klNtigB4VNcz9JrwaycIW+GA+If0 g==;
X-CSE-ConnectionGUID: Ghh7AdvxSj+gYZx3qtlIPA==
X-CSE-MsgGUID: fid5wYrBSOuxEuQUdOELdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2308964"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2308964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:31:28 -0800
X-CSE-ConnectionGUID: fRvNadweQGWhFwI/k/sUNQ==
X-CSE-MsgGUID: v1M2JZrqRhiFOYvSBN8VOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6408115"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:31:26 -0800
Date: Mon, 2 Nov 2026 11:31:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jia Yao <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] tests/intel: Add per-client async strided-copy repro
Message-ID: <20261102103109.462nv2ubxmivul4g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jia Yao <jia.yao@intel.com>, igt-dev@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20261030212158.1394329-1-jia.yao@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030212158.1394329-1-jia.yao@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jia,
On 2026-10-30 at 21:21:58 +0000, Jia Yao wrote:
> Add a focused native DG2 int16-stride1 IGT case using the embedded
> NEO kernel.
> 
> Set and verify Wa_22013059131 userspace ownership through the per-client
> context-creation UAPI before submitting work. Document the only subtest
> in the generated i915 testplan.
> 
> Signed-off-by: Jia Yao <jia.yao@intel.com>

I didn't do review, only few nits.

> ---
>  tests/intel/gem_async_strided_copy.c          | 459 ++++++++++++++++++
>  .../intel/gem_async_strided_copy_neo_kernel.h | 215 ++++++++
>  tests/meson.build                             |   1 +
>  3 files changed, 675 insertions(+)
>  create mode 100644 tests/intel/gem_async_strided_copy.c
>  create mode 100644 tests/intel/gem_async_strided_copy_neo_kernel.h
> 
> diff --git a/tests/intel/gem_async_strided_copy.c b/tests/intel/gem_async_strided_copy.c
> new file mode 100644
> index 000000000..a7d635b46
> --- /dev/null
> +++ b/tests/intel/gem_async_strided_copy.c
> @@ -0,0 +1,459 @@
> +// SPDX-License-Identifier: MIT

Missing copyright.

> +/*
> + * Native DG2 reproduction of the CTS int16/stride=1 case using the embedded
> + * NEO-generated kernel.  The batch is emitted by IGT; no OpenCL API or
> + * runtime-compiled program is used.
> + */
> +
> +/**
> + * TEST: Native async strided-copy reproduction with configurable WA ownership
> + * Category: Core
> + * Mega feature: Compute
> + * Sub-category: Async strided copy
> + * Functionality: SLM and global-memory data movement
> + * Description: Reproduce the CTS int16 stride-one global-to-local copy with
> + *              an embedded NEO kernel. Set IGT_ASYNC_STRIDED_COPY_KEEP_WA=1
> + *              to leave Wa_22013059131 kernel-owned for the legacy path.
> + *
> + * SUBTEST: int16-stride1
> + * Description: Dispatch the full 579-workgroup int16 stride-one workload and
> + *              validate the copied output.
> + * Test category: functionality test
> + * GPU requirement: DG2-G11; default mode requires the per-client WA UAPI
> + */
> +
> +#include <stddef.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "i915/gem.h"
> +#include "i915/gem_context.h"
> +#include "i915/gem_engine_topology.h"
> +#include "gpu_cmds.h"

Move up before igt.h, keep it alphabetical.

> +#include "intel_ctx.h"
> +#include "intel_bufops.h"
> +#include "i915/intel_memory_region.h"
> +#include "gem_async_strided_copy_neo_kernel.h"

Same here, this one before gpu_cmds.h

> +
> +#ifndef I915_CONTEXT_PARAM_WA_22013059131
> +#define I915_CONTEXT_PARAM_WA_22013059131 0x10
> +#endif
> +
> +#define WORK_ITEMS_PER_GROUP 170
> +#define GROUP_COUNT 579
> +#define ITEM_BYTES (3 * 16 * sizeof(uint32_t))
> +#define GROUP_BYTES (WORK_ITEMS_PER_GROUP * ITEM_BYTES)
> +#define INPUT_BYTES ((uint64_t)GROUP_COUNT * GROUP_BYTES)
> +/* One group's 32640-byte SLM payload fits in the 32 KiB userspace WA cap. */
> +#define SLM_SIZE_ENCODING_32K 6
> +#define PREFERRED_SLM_SIZE_96K 0xc
> +#define SIMD_WIDTH 8
> +#define PAGE_SIZE 4096
> +#define BATCH_STATE_SPLIT 2048
> +#define RAW_SURFACE_TYPE_FORMAT 0x87fdc000
> +#define CTS_CROSS_THREAD_BYTES 96
> +#define CTS_INLINE_BYTES 32
> +#define CTS_LOCAL_ID_BYTES_PER_THREAD 96
> +#define DG2_MAX_FRONTEND_THREADS 1024
> +#define IDD_DISPATCH_SIZE_4 (1u << 26)
> +#define IDD_ONE_BARRIER (1u << 28)
> +
> +/* Byte layout of the captured kernel's cross-thread payload, not a C API. */
> +struct neo_cross_thread {
> +	uint32_t global_offset[3];
> +	uint32_t enqueued_local_size[3];
> +	uint64_t slm_offset;
> +	uint64_t src_address;
> +	uint64_t dst_address;
> +	uint32_t copies_per_group;
> +	uint32_t copies_per_item;
> +	uint32_t stride;
> +	uint32_t reserved0[2];
> +	uint32_t local_size[3];
> +	uint32_t reserved1[4];
> +};
> +
> +_Static_assert(sizeof(struct neo_cross_thread) == CTS_CROSS_THREAD_BYTES, "payload size");
> +_Static_assert(offsetof(struct neo_cross_thread, enqueued_local_size) == 12, "enqueued size");
> +_Static_assert(offsetof(struct neo_cross_thread, slm_offset) == 24, "SLM offset");
> +_Static_assert(offsetof(struct neo_cross_thread, src_address) == CTS_INLINE_BYTES, "inline end");
> +_Static_assert(offsetof(struct neo_cross_thread, dst_address) == 40, "destination address");
> +_Static_assert(offsetof(struct neo_cross_thread, copies_per_group) == 48, "group copy count");
> +_Static_assert(offsetof(struct neo_cross_thread, copies_per_item) == 52, "item copy count");
> +_Static_assert(offsetof(struct neo_cross_thread, stride) == 56, "copy stride");
> +_Static_assert(offsetof(struct neo_cross_thread, local_size) == 68, "local size");
> +
> +static uint32_t add_raw_buffer_surface(struct intel_bb *ibb,
> +				       struct intel_buf *buf,
> +				       uint64_t size,
> +				       bool writable)
> +{
> +	uint32_t *surface;
> +	uint32_t offset;
> +	uint64_t size_minus_one = size - 1;
> +	uint64_t address;
> +	uint32_t width_minus_one, height_minus_one, depth_minus_one;
> +
> +	igt_assert_eq(size & 3, 0);
> +	igt_assert(size_minus_one < (1ull << 32));
> +	width_minus_one = size_minus_one & 0x7f;
> +	height_minus_one = (size_minus_one >> 7) & 0x3fff;
> +	depth_minus_one = (size_minus_one >> 21) & 0x7ff;
> +	intel_bb_ptr_align(ibb, 64);
> +	offset = intel_bb_offset(ibb);
> +	surface = intel_bb_ptr(ibb);
> +	memset(surface, 0, 64);
> +	intel_bb_ptr_add(ibb, 64);
> +
> +	/* DG2 RENDER_SURFACE_STATE: linear SURFTYPE_BUFFER + RAW format. */
> +	surface[0] = RAW_SURFACE_TYPE_FORMAT;
> +	surface[1] = 0x06000000; /* Same MOCS setting as the existing Gen12 compute path. */
> +	surface[2] = width_minus_one | (height_minus_one << 16);
> +	surface[3] = depth_minus_one << 21;
> +	surface[5] = 2u << 16; /* DG2 NEO buffer-surface L1 policy: WB. */
> +	address = intel_bb_offset_reloc(ibb, buf->handle,
> +					I915_GEM_DOMAIN_RENDER,
> +					writable ? I915_GEM_DOMAIN_RENDER : 0,
> +					offset + 8 * sizeof(uint32_t),
> +					buf->addr.offset);
> +	surface[8] = address;
> +	surface[9] = address >> 32;
> +
> +	return offset;
> +}
> +
> +static void configure_neo_idd(struct xehp_interface_descriptor_data *idd,
> +			      unsigned int threads_in_group)
> +{
> +	uint32_t *dw = (uint32_t *)idd;
> +
> +	idd->desc2.single_program_flow = 0;
> +	/* gen125.xml: DW5[27:26] = dispatch size, DW5[30:28] = barrier count.
> +	 * xehp_media.h does not fully describe these fields on DG2.
> +	 */
> +	dw[5] = threads_in_group |
> +		(SLM_SIZE_ENCODING_32K << 16) |
> +		IDD_DISPATCH_SIZE_4 | IDD_ONE_BARRIER;
> +	dw[6] = PREFERRED_SLM_SIZE_96K;
> +}
> +
> +static void opt_out_of_wa_22013059131(int fd)
> +{
> +	struct drm_i915_gem_context_create_ext_setparam setparam = {
> +		.base = {
> +			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> +		},
> +		.param = {
> +			.ctx_id = 0,
> +			.size = 0,
> +			.param = I915_CONTEXT_PARAM_WA_22013059131,
> +			.value = 1,
> +		},
> +	};
> +	struct drm_i915_gem_context_param getparam = {
> +		.ctx_id = 0,
> +		.size = 0,
> +		.param = I915_CONTEXT_PARAM_WA_22013059131,
> +	};
> +	uint32_t probe_ctx;
> +
> +	/*
> +	 * The UAPI is per DRM client and must be latched before any context on
> +	 * this fd is submitted.  This parameter is creation-time-only, so use a
> +	 * temporary context to opt the whole client out before creating the CCS
> +	 * context used by the test.  Value 1 assigns bit15 handling to userspace.
> +	 */
> +	gem_context_require_param(fd, setparam.param.param);
> +	probe_ctx = gem_context_create_ext(fd,
> +					   I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> +					   to_user_pointer(&setparam));
> +	gem_context_destroy(fd, probe_ctx);
> +	gem_context_get_param(fd, &getparam);
> +	igt_assert_eq_u64(getparam.value, 1);
> +	igt_info("Wa_22013059131 ownership: userspace (per DRM client)\n");
> +}
> +
> +static uint32_t copy_pattern(uint32_t index)
> +{
> +	/* Odd multiplication is bijective modulo 2^32: every dword is unique. */
> +	return (index * 0x9e3779b1u) ^ 0xa5a5a5a5u;
> +}
> +
> +static void init_buffer(struct intel_buf *buf, bool poison)
> +{
> +	uint32_t *map = intel_buf_device_map(buf, true);
> +
> +	igt_assert(map != MAP_FAILED);
> +	for (uint32_t i = 0; i < INPUT_BYTES / sizeof(*map); i++)
> +		map[i] = poison ? ~copy_pattern(i) : copy_pattern(i);
> +	/* WC stores must reach memory before submission. */
> +	asm volatile("sfence" ::: "memory");
> +	intel_buf_unmap(buf);
> +}
> +
> +static void check_output(struct intel_buf *buf)
> +{
> +	uint32_t *map = intel_buf_device_map(buf, false);
> +	uint32_t i, actual = 0;
> +
> +	igt_assert(map != MAP_FAILED);
> +	for (i = 0; i < INPUT_BYTES / sizeof(*map); i++) {
> +		actual = map[i];
> +		if (actual != copy_pattern(i))
> +			break;
> +	}
> +	intel_buf_unmap(buf);
> +	igt_assert_f(i == INPUT_BYTES / sizeof(*map),
> +		     "Output mismatch at byte %u: expected 0x%08x, got 0x%08x\n",
> +		     i * (unsigned int)sizeof(*map), copy_pattern(i), actual);
> +}
> +
> +static void fill_cross_thread_data(struct neo_cross_thread *data,
> +				   const struct intel_buf *src,
> +				   const struct intel_buf *dst)
> +{
> +	memset(data, 0, sizeof(*data));
> +	data->local_size[0] = WORK_ITEMS_PER_GROUP;
> +	data->local_size[1] = 1;
> +	data->local_size[2] = 1;
> +	memcpy(data->enqueued_local_size, data->local_size, sizeof(data->local_size));
> +	data->src_address = src->addr.offset;
> +	data->dst_address = dst->addr.offset;
> +	data->copies_per_group = WORK_ITEMS_PER_GROUP * 3;
> +	data->copies_per_item = 3;
> +	data->stride = 1;
> +}
> +
> +static void populate_neo_local_ids(uint8_t *payload,
> +				   unsigned int thread_count,
> +				   unsigned int work_items)
> +{
> +	unsigned int thread, lane;
> +
> +	memset(payload, 0, thread_count * CTS_LOCAL_ID_BYTES_PER_THREAD);
> +	for (thread = 0; thread < thread_count; thread++) {
> +		uint8_t *record = payload + thread * CTS_LOCAL_ID_BYTES_PER_THREAD;
> +
> +		for (lane = 0; lane < SIMD_WIDTH; lane++) {
> +			uint16_t local_x = (thread * SIMD_WIDTH + lane) % work_items;
> +
> +			memcpy(record + lane * sizeof(local_x), &local_x,
> +			       sizeof(local_x));
> +		}
> +	}
> +}
> +
> +static void emit_neo_cfe_state(struct intel_bb *ibb)
> +{
> +	/* NEO XeHPG preamble: one walker, normal overdispatch, no scratch. */
> +	intel_bb_out(ibb, XEHP_CFE_STATE | 4);
> +	intel_bb_out(ibb, 0);
> +	intel_bb_out(ibb, 0);
> +	intel_bb_out(ibb, (DG2_MAX_FRONTEND_THREADS << 16) | (2u << 14));
> +	intel_bb_out(ibb, 0);
> +	intel_bb_out(ibb, 0);
> +}
> +
> +static void emit_neo_compute_mode_state(struct intel_bb *ibb)
> +{
> +	/* NEO DG2 dispatch sets requiresCoherency=false and programs only the
> +	 * ForceNonCoherent mask, selecting FORCE_GPU_NON_COHERENT (2).
> +	 */
> +	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE);
> +	intel_bb_out(ibb, 0x00180010);
> +}
> +
> +static void emit_sba_with_indirect_base(struct intel_bb *ibb)
> +{
> +	uint32_t sba_offset = intel_bb_offset(ibb);
> +	uint64_t ibb_vma = intel_bb_get_object_offset(ibb, ibb->handle);
> +	uint32_t *sba;
> +
> +	igt_assert_neq_u64(ibb_vma, INTEL_BUF_INVALID_ADDRESS);
> +	igt_assert_eq(ibb_vma & 0xfff, 0);
> +	xehp_emit_state_base_address(ibb);
> +
> +	/* XeHPG resolves ComputeWalker indirect-data offsets from General State
> +	 * Base Address. Match NEO's internal-heap MOCS; SBA DW8/9 are reserved
> +	 * on this platform.
> +	 */
> +	sba = intel_bb_ptr_get(ibb, sba_offset);
> +	sba[1] = lower_32_bits(ibb_vma) | BASE_ADDRESS_MODIFY | (2u << 4);
> +	sba[2] = upper_32_bits(ibb_vma);
> +}
> +
> +static void emit_neo_cts_walker(struct intel_bb *ibb,
> +				struct xehp_interface_descriptor_data *idd,
> +				uint32_t indirect_offset,
> +				uint32_t indirect_bytes,
> +				uint32_t group_count,
> +				uint32_t work_items,
> +				const struct neo_cross_thread *data)
> +{
> +	uint32_t *walker = ibb->ptr;
> +	unsigned int tail_lanes = work_items % SIMD_WIDTH;
> +
> +	/* The NEO kernel binary has its own EOT; only the walker/batch is emitted. */
> +	xehp_emit_compute_walk(ibb, 0, 0, work_items, 1, idd, 0);
> +
> +	/* COMPUTE_WALKER_BODY dword numbering is offset by the command header:
> +	 * DW1 is the reserved debug object, DW2/3 carry the indirect payload,
> +	 * DW4 has SIMD/inline controls, and DW5 is the execution mask.
> +	 */
> +	walker[1] = 0; /* Debug object. */
> +	walker[2] = indirect_bytes;
> +	walker[3] = indirect_offset;
> +	walker[4] = 1u << 25; /* Emit the 32-byte cross-thread inline prefix. */
> +	walker[5] = tail_lanes ? (1u << tail_lanes) - 1 : 0xff;
> +	walker[6] = 0; /* No hardware local-ID maxima: IDs are in indirect data. */
> +	walker[7] = group_count;
> +	walker[8] = 1;
> +	walker[9] = 1;
> +	walker[10] = 0;
> +	walker[11] = 0;
> +	walker[12] = 0;
> +
> +	memcpy(&walker[31], data, CTS_INLINE_BYTES);
> +}
> +
> +static void build_dispatch(struct intel_bb *ibb, struct intel_buf *src,
> +			   struct intel_buf *dst)
> +{
> +	const uint32_t group_count = GROUP_COUNT;
> +	const uint32_t work_items = WORK_ITEMS_PER_GROUP;
> +	struct xehp_interface_descriptor_data idd;
> +	struct neo_cross_thread cross_thread;
> +	uint8_t *map;
> +	uint32_t indirect_offset;
> +	uint32_t *binding_table;
> +	uint32_t input_surface, output_surface;
> +	uint32_t thread_count = (work_items + SIMD_WIDTH - 1) / SIMD_WIDTH;
> +	uint32_t local_id_bytes = thread_count * CTS_LOCAL_ID_BYTES_PER_THREAD;
> +	uint32_t indirect_bytes = CTS_CROSS_THREAD_BYTES - CTS_INLINE_BYTES +
> +				   local_id_bytes;
> +	uint32_t indirect_storage_bytes = (indirect_bytes + 63) & ~63u;
> +
> +	intel_bb_add_intel_buf(ibb, src, false);
> +	intel_bb_add_intel_buf(ibb, dst, true);
> +	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
> +
> +	/* The helper takes 16-byte instruction slots but only copies the kernel
> +	 * bytes. Replace its one surface with NEO's two bindful BTIs (src, dst).
> +	 */
> +	xehp_fill_interface_descriptor(ibb, dst,
> +				       (const uint32_t (*)[4])neo_cts_test_fn_kernel,
> +				       sizeof(neo_cts_test_fn_kernel), &idd);
> +	binding_table = intel_bb_ptr_get(ibb,
> +					 idd.desc4.binding_table_pointer << 5);
> +	input_surface = add_raw_buffer_surface(ibb, src, INPUT_BYTES, false);
> +	output_surface = add_raw_buffer_surface(ibb, dst, INPUT_BYTES, true);
> +	binding_table[0] = input_surface;
> +	binding_table[1] = output_surface;
> +	configure_neo_idd(&idd, thread_count);
> +	fill_cross_thread_data(&cross_thread, src, dst);
> +
> +	/* The walker inlines bytes 0..31; indirect data begins with bytes
> +	 * 32..95, followed by SIMD8 local ID records.
> +	 */
> +	intel_bb_ptr_align(ibb, 64);
> +	indirect_offset = intel_bb_offset(ibb);
> +	map = intel_bb_ptr(ibb);
> +	intel_bb_ptr_add(ibb, indirect_storage_bytes);
> +	memset(map, 0, indirect_storage_bytes);
> +	memcpy(map, (uint8_t *)&cross_thread + CTS_INLINE_BYTES,
> +	       CTS_CROSS_THREAD_BYTES - CTS_INLINE_BYTES);
> +	populate_neo_local_ids(map + CTS_CROSS_THREAD_BYTES - CTS_INLINE_BYTES,
> +			       thread_count, work_items);
> +
> +	intel_bb_ptr_set(ibb, 0);
> +	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
> +		     PIPELINE_SELECT_GPGPU);
> +	emit_sba_with_indirect_base(ibb);
> +	emit_neo_compute_mode_state(ibb);
> +	xehp_emit_state_binding_table_pool_alloc(ibb);
> +	/* NEO CFE preamble: 1024 threads, one walker, normal overdispatch. */
> +	emit_neo_cfe_state(ibb);
> +	emit_neo_cts_walker(ibb, &idd, indirect_offset, indirect_bytes,
> +			    group_count, work_items, &cross_thread);
> +	/* Match the post-walker DC flush used by IGT's Gen12 compute batch. */
> +	intel_bb_out(ibb, 0x7a000004); /* Gen125 PIPE_CONTROL, 6 dwords. */
> +	intel_bb_out(ibb, 0x00100120); /* CS stall + DC flush + notify. */
> +	intel_bb_out(ibb, 0);
> +	intel_bb_out(ibb, 0);
> +	intel_bb_out(ibb, 0);
> +	intel_bb_out(ibb, 0);
> +	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
> +	intel_bb_ptr_align(ibb, 32);
> +	igt_assert_lte(intel_bb_offset(ibb), BATCH_STATE_SPLIT);
> +
> +	igt_info("native NEO CTS: CCS, %u groups x %u items, %u threads/group, "
> +		 "%u-byte SLM, %u-byte indirect payload\n",
> +		 group_count, work_items, thread_count, (unsigned int)GROUP_BYTES,
> +		 indirect_bytes);
> +}
> +
> +static void run_neo_cts_copy(void)
> +{
> +	struct intel_buf src = {}, dst = {};
> +	struct i915_engine_class_instance *engines;
> +	const intel_ctx_t *ctx;
> +	struct buf_ops *bops;
> +	struct intel_bb *ibb;
> +	unsigned int engine_count;
> +	int fd;
> +
> +	fd = drm_open_driver_render(DRIVER_INTEL);
> +	igt_require_gem(fd);
> +	igt_require(IS_DG2(intel_get_drm_devid(fd)));
> +	if (getenv("IGT_ASYNC_STRIDED_COPY_KEEP_WA"))
> +		igt_info("Wa_22013059131 ownership: kernel (default)\n");
> +	else
> +		opt_out_of_wa_22013059131(fd);
> +	igt_require_f(gem_get_lmem_region_count(fd) > 0,
> +		      "DG2 local-memory region is required for CTS buffer placement\n");
> +	engines = gem_list_engines(fd, 1, 1u << I915_ENGINE_CLASS_COMPUTE,
> +				   &engine_count);
> +	igt_require_f(engines && engine_count,
> +		      "DG2 compute engine (CCS) is required for this kernel\n");
> +	ctx = intel_ctx_create_for_engine(fd, I915_ENGINE_CLASS_COMPUTE,
> +					  engines[0].engine_instance);
> +	free(engines);
> +	bops = buf_ops_create(fd);
> +
> +	/* Preserve NEO's device-local placement for the reproducer. */
> +	intel_buf_init_in_region(bops, &src, INPUT_BYTES / 4, 1, 32, 0,
> +				 I915_TILING_NONE, 0, REGION_LMEM(0));
> +	intel_buf_init_in_region(bops, &dst, INPUT_BYTES / 4, 1, 32, 0,
> +				 I915_TILING_NONE, 0, REGION_LMEM(0));
> +	igt_assert_eq(src.surface[0].size, INPUT_BYTES);
> +	igt_assert_eq(dst.surface[0].size, INPUT_BYTES);
> +	init_buffer(&src, false);
> +	init_buffer(&dst, true);
> +
> +	ibb = intel_bb_create_with_context(fd, ctx->id, 0, &ctx->cfg, 16 * PAGE_SIZE);
> +	build_dispatch(ibb, &src, &dst);
> +	if (getenv("IGT_DUMP_BB"))
> +		intel_bb_dump(ibb, getenv("IGT_DUMP_BB"), true);
> +	intel_bb_exec(ibb, intel_bb_offset(ibb),
> +		      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC, true);
> +	intel_bb_destroy(ibb);
> +
> +	check_output(&dst);
> +
> +	intel_buf_close(bops, &src);
> +	intel_buf_close(bops, &dst);
> +	buf_ops_destroy(bops);
> +	intel_ctx_destroy(fd, ctx);
> +	close(fd);
> +}
> +
> +int igt_main()
> +{

Add old-style igt desciption.

> +	igt_subtest("int16-stride1")
> +		run_neo_cts_copy();
> +}
> diff --git a/tests/intel/gem_async_strided_copy_neo_kernel.h b/tests/intel/gem_async_strided_copy_neo_kernel.h
> new file mode 100644
> index 000000000..f5ceac115
> --- /dev/null
> +++ b/tests/intel/gem_async_strided_copy_neo_kernel.h
> @@ -0,0 +1,215 @@
> +/* SPDX-License-Identifier: Apache-2.0 */

Why not MIT? Make it at least MIT OR Apache-2.0
Also missing copyright.

> +/*
> + * NEO DG2 .text.test_fn for the OpenCL-CTS async_strided_global_to_local_kernel
> + * (int16, stride 1). Reference CTS source: test_conformance/basic/
> + * test_async_strided_copy.cpp at 16b197d191903abad0047e6bcb113167b589ecb4.
> + * The captured binary has its own EOT and is submitted without an OpenCL
> + * runtime. Keep its bytes unchanged when updating the IGT dispatch setup.
> + * SHA-256 of the 3072 captured bytes (little-endian dwords):
> + * 78840188d1e8681abd736a0f584d35e24d87ad37341d733f431630be63383a39
> + * The reference above identifies the workload, not a reproducible build of
> + * this capture: its NEO/IGC versions, compiler options and original metadata
> + * were not recorded here. The dispatch code documents the payload layout
> + * used by this reproducer; changing the binary requires rechecking that ABI.
> + */
> +#ifndef GEM_ASYNC_STRIDED_COPY_NEO_KERNEL_H
> +#define GEM_ASYNC_STRIDED_COPY_NEO_KERNEL_H
> +
> +#include <stdint.h>
> +
> +static const uint32_t neo_cts_test_fn_kernel[] = {
> +	0x80030061, 0x7f054220, 0x00000000, 0x00000000,
> +	0x80000065, 0x7f458220, 0x02000004, 0xffffffc0,
> +	0x80000065, 0x7f058110, 0x01000044, 0x00ff00ff,
> +	0x80001a40, 0x7f458220, 0x02007f44, 0x00000040,
> +	0x80001940, 0x7f458220, 0x02007f44, 0x00000000,
> +	0x8000195b, 0x7f448220, 0x01017f44, 0x00607f04,
> +	0x80030061, 0x04050220, 0x00100104, 0x00000000,
> +	0x80039031, 0x01140000, 0xa7fa7f0c, 0x02100000,
> +	0x80003040, 0x7f458220, 0x01007f44, 0x00400040,
> +	0x80039131, 0x030c0000, 0xa5fa7f0c, 0x02100000,
> +	0x00000060, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000060, 0x00000000, 0x00000000, 0x00000000,
> +	0x80033161, 0x7f054220, 0x00000000, 0x00000000,
> +	0x80000065, 0x7f458220, 0x02000004, 0xffffffc0,
> +	0x80001940, 0x7f458220, 0x02007f44, 0x00000000,
> +	0x80039231, 0x05140000, 0xa7fa7f0c, 0x02100000,
> +	0x80030061, 0x1c050220, 0x00100004, 0x00000000,
> +	0x80000966, 0x80018220, 0x01008000, 0x04c004c0,
> +	0xe8000901, 0x00110001, 0xe8002201, 0x00110001,
> +	0x80830970, 0x00018660, 0x350005a4, 0x00000000,
> +	0x1183002e, 0x0000c000, 0x000001a8, 0x000001a8,
> +	0x00032041, 0x1d050660, 0x010005a4, 0x00100104,
> +	0x80000061, 0x06854560, 0x00000000, 0x00000000,
> +	0x00031940, 0x20010660, 0x06101d04, 0x00000684,
> +	0x80000040, 0x06858660, 0x05000684, 0x00010001,
> +	0x80030061, 0x08054560, 0x00000000, 0x00000000,
> +	0x00033369, 0x07058660, 0x05102000, 0x00060006,
> +	0x80c31b70, 0x00010660, 0x56000684, 0x000005a4,
> +	0x61091b61, 0x00110800, 0x00030061, 0x0a050660,
> +	0x00000824, 0x00000000, 0x00030061, 0x0b050660,
> +	0x00000844, 0x00000000, 0x00030061, 0x0c050660,
> +	0x00000864, 0x00000000, 0x00030061, 0x0d050660,
> +	0x00000884, 0x00000000, 0x00030061, 0x0e050660,
> +	0x000008a4, 0x00000000, 0x00030061, 0x0f050660,
> +	0x000008c4, 0x00000000, 0x00030061, 0x10050660,
> +	0x000008e4, 0x00000000, 0x61123461, 0x00110800,
> +	0x00030061, 0x13050660, 0x00000824, 0x00000000,
> +	0x00030061, 0x14050660, 0x00000844, 0x00000000,
> +	0x00030061, 0x15050660, 0x00000864, 0x00000000,
> +	0x00030061, 0x16050660, 0x00000884, 0x00000000,
> +	0x00030061, 0x17050660, 0x000008a4, 0x00000000,
> +	0x00030061, 0x18050660, 0x000008c4, 0x00000000,
> +	0x00030061, 0x19050660, 0x000008e4, 0x00000000,
> +	0x61110040, 0x02000702, 0x0003a331, 0x00000000,
> +	0xea08070c, 0x03900944, 0x00039431, 0x00000000,
> +	0xea08110c, 0x03901244, 0x01c3002e, 0x0000c002,
> +	0xfffffe98, 0x00000010, 0x0003002f, 0x00004000,
> +	0x00000000, 0x00000010, 0xe8003301, 0x00110001,
> +	0x80004531, 0x070c0000, 0xe03e1c0c, 0x00000000,
> +	0xa2080061, 0x00010038, 0x80011161, 0x08550000,
> +	0x00001c5c, 0x00000000, 0x80032561, 0x00010220,
> +	0x00100704, 0x00000000, 0x8000a631, 0x00000000,
> +	0x3008080c, 0x00000000, 0x80000001, 0x00010000,
> +	0xe0000000, 0x00000000, 0x1183002e, 0x0000c000,
> +	0x00000158, 0x00000158, 0x80000041, 0x20010660,
> +	0x01000464, 0x00001c24, 0x80000049, 0x05050660,
> +	0x06000464, 0x00001c24, 0x00032041, 0x1f050660,
> +	0x010005a4, 0x00100104, 0x00031a52, 0x07040660,
> +	0x010e0504, 0x04040104, 0x80000061, 0x06a54560,
> +	0x00000000, 0x00000000, 0x24201a41, 0x05100736,
> +	0xa11e0049, 0x05100732, 0xa1071940, 0x06101e32,
> +	0xa11a3740, 0x06101f32, 0x24201a41, 0x0510074e,
> +	0xa1070049, 0x0510074a, 0x80000040, 0x06a58660,
> +	0x050006a4, 0x00010001, 0x61071a69, 0x00600702,
> +	0x611a0069, 0x00601a02, 0xe8003601, 0x00110001,
> +	0xa1081a40, 0x05100752, 0x00030052, 0x09048668,
> +	0x06050704, 0x002005e4, 0xe8003401, 0x00110001,
> +	0x0003a931, 0x0a440000, 0xfa00088c, 0x06100000,
> +	0xe8003801, 0x00110001, 0x00039a31, 0x12440000,
> +	0xfa00098c, 0x06100000, 0x80830070, 0x00010660,
> +	0x560006a4, 0x000005a4, 0x611b0040, 0x02001a02,
> +	0xe8002901, 0x00110001, 0x00034731, 0x00000000,
> +	0xea081a0c, 0x03900a44, 0xe8002a01, 0x00110001,
> +	0x00039831, 0x00000000, 0xea081b0c, 0x03901244,
> +	0x0183002e, 0x0000c002, 0xffffff28, 0x00000010,
> +	0x0003002f, 0x00004000, 0x00000000, 0x00000010,
> +	0x80004b31, 0x070c0000, 0xe03e1c0c, 0x00000000,
> +	0xa2083661, 0x00010038, 0x80011161, 0x08550000,
> +	0x00001c5c, 0x00000000, 0x80032b61, 0x00010220,
> +	0x00100704, 0x00000000, 0x8000ac31, 0x00000000,
> +	0x3008080c, 0x00000000, 0x80000001, 0x00010000,
> +	0xe0000000, 0x00000000, 0x80000041, 0x20010660,
> +	0x01000584, 0x000005c4, 0x00032141, 0x09050660,
> +	0x01000644, 0x00100304, 0x80003749, 0x0a050660,
> +	0x06000584, 0x000005c4, 0xe8002001, 0x00110001,
> +	0x00031a40, 0x09050660, 0x01100904, 0x00100204,
> +	0x80001a41, 0x20010220, 0x01001c24, 0x00000a04,
> +	0x220b0049, 0x0a111c23, 0x24201b41, 0x09610626,
> +	0x80c30070, 0x00018660, 0x150005c4, 0x00000000,
> +	0xa1090049, 0x09010622, 0x80000041, 0x20010660,
> +	0x01000644, 0x00000624, 0x80000049, 0x0c050660,
> +	0x06000644, 0x00000624, 0x62061e69, 0x00610ba2,
> +	0x22201a41, 0x06110c1e, 0x6220006c, 0x01f1055a,
> +	0x620d006c, 0x01f10a02, 0x00030040, 0x21050660,
> +	0x01100904, 0x00100104, 0x80001d40, 0x06e50660,
> +	0x060006c4, 0x00000604, 0xa2220049, 0x06110c1a,
> +	0x01c3002e, 0x0000c000, 0x00000278, 0x00000278,
> +	0x00431c70, 0x00010220, 0x52102104, 0x00000584,
> +	0x80000061, 0x0a054990, 0x00000000, 0x00000000,
> +	0x80001b41, 0x20010220, 0x010005c4, 0x00002204,
> +	0x80000061, 0x0b054990, 0x00000000, 0x00000000,
> +	0x01431270, 0x00010560, 0x16000a04, 0x00002004,
> +	0x8000006c, 0x20258660, 0x050005c4, 0x001f001f,
> +	0x80003c49, 0x08050222, 0x020005c4, 0x00002204,
> +	0x11431170, 0x00010120, 0x52000b04, 0x00002004,
> +	0xe2070061, 0x00112004, 0x80001c41, 0x20010260,
> +	0x01002204, 0x00002024, 0x80000049, 0x09050260,
> +	0x06002204, 0x00002024, 0x80001b61, 0x20450220,
> +	0x00000704, 0x00000000, 0xa2201a40, 0x0911089a,
> +	0x1143002e, 0x0000c000, 0x00000350, 0x000001a8,
> +	0x00030041, 0x20010220, 0x010005c4, 0x00202104,
> +	0x3e080049, 0x2101056b, 0x00030061, 0x25054560,
> +	0x00000000, 0x00000000, 0xe1070061, 0x00102004,
> +	0x80030041, 0x20010260, 0x01102104, 0x00002024,
> +	0x00030049, 0x09050260, 0x06102104, 0x00002024,
> +	0x61231b61, 0x00100700, 0xa1241940, 0x09000802,
> +	0x3e26114e, 0x2010232b, 0x61070069, 0x00602102,
> +	0x00031b52, 0x24040228, 0x020a2000, 0x20642404,
> +	0x3e27004e, 0x22102103, 0x61081b40, 0x02000702,
> +	0x00431a70, 0x00010220, 0x52102704, 0x00000584,
> +	0x00030040, 0x25050220, 0x02102000, 0x00102504,
> +	0xe8003d01, 0x00110001, 0x00034f31, 0x09440000,
> +	0xea00070c, 0x02100000, 0xe8003e01, 0x00110001,
> +	0x0003b031, 0x11440000, 0xea00080c, 0x02100000,
> +	0x01431970, 0x00010660, 0x16102504, 0x00002004,
> +	0xe8003801, 0x00110001, 0x61193469, 0x00602302,
> +	0x00031952, 0x1a040660, 0x060606c4, 0x19050604,
> +	0x11430070, 0x00010220, 0x52102504, 0x00002004,
> +	0x00030052, 0x1b048660, 0x060d06e4, 0x00201904,
> +	0xe8002f01, 0x00110001, 0x0003bd31, 0x00000000,
> +	0xfa081a8d, 0x07900944, 0xe8002001, 0x00110001,
> +	0x00039e31, 0x00000000, 0xfa081b8d, 0x07901144,
> +	0x1143002e, 0x0000c000, 0x000001e0, 0x00000038,
> +	0x61230061, 0x00102600, 0x00030061, 0x21050660,
> +	0x00102704, 0x00000000, 0x80000020, 0x00004000,
> +	0x00000000, 0xfffffed8, 0x0003002f, 0x00004000,
> +	0x00000000, 0x000001a8, 0x00031b70, 0x00010220,
> +	0x52102104, 0x00000584, 0x80000061, 0x04c54990,
> +	0x00000000, 0x00000000, 0x80000061, 0x05054990,
> +	0x00000000, 0x00000000, 0x01031270, 0x00010560,
> +	0x160004c4, 0x00002004, 0x11031170, 0x00010120,
> +	0x52000504, 0x00002004, 0x1103002e, 0x0000c000,
> +	0x00000148, 0x00000148, 0x00030061, 0x28054560,
> +	0x00000000, 0x00000000, 0x3e29004e, 0x22102103,
> +	0x61070069, 0x00602102, 0x00031a70, 0x00010220,
> +	0x52102904, 0x00000584, 0x00030040, 0x28050220,
> +	0x02102000, 0x00102804, 0xe8003c01, 0x00110001,
> +	0x61081b40, 0x02000702, 0x00000001, 0x00014200,
> +	0x20000000, 0x00002002, 0x00034331, 0x09440000,
> +	0xea00070c, 0x02100000, 0x01031a70, 0x00010660,
> +	0x16102804, 0x00002004, 0x00000001, 0x00014200,
> +	0x20000000, 0x00004004, 0x0003a531, 0x11440000,
> +	0xea00080c, 0x02100000, 0xe8003801, 0x00110001,
> +	0x00033452, 0x19040660, 0x060606c4, 0x07050604,
> +	0x00030052, 0x1a048660, 0x060d06e4, 0x00200704,
> +	0x11030070, 0x00010220, 0x52102804, 0x00002004,
> +	0xe8002301, 0x00110001, 0x0003b131, 0x00000000,
> +	0xfa08198d, 0x07900944, 0xe8002501, 0x00110001,
> +	0x0003a231, 0x00000000, 0xfa081a8d, 0x07901144,
> +	0x1103002e, 0x0000c000, 0x00000030, 0x00000030,
> +	0x00030061, 0x21050660, 0x00102904, 0x00000000,
> +	0x80000020, 0x00004000, 0x00000000, 0xfffffee8,
> +	0x0003002f, 0x00004000, 0x00000000, 0x00000010,
> +	0x80004631, 0x070c0000, 0xf83e1c0c, 0x00040000,
> +	0xa2083c61, 0x00010038, 0x80011161, 0x08550000,
> +	0x00001c5c, 0x00000000, 0x80032661, 0x00010220,
> +	0x00100704, 0x00000000, 0x8000a731, 0x00000000,
> +	0x3008080c, 0x00000000, 0x80000001, 0x00010000,
> +	0xe0000000, 0x00000000, 0x00000001, 0x00014200,
> +	0x20000000, 0x00002002, 0x80004931, 0x090c0000,
> +	0xe03e1c0c, 0x00000000, 0xa20a0061, 0x00010038,
> +	0x80011161, 0x0a550000, 0x00001c5c, 0x00000000,
> +	0x80032961, 0x00010220, 0x00100904, 0x00000000,
> +	0x8000aa31, 0x00000000, 0x30080a0c, 0x00000000,
> +	0x80000001, 0x00010000, 0xe0000000, 0x00000000,
> +	0x647f0061, 0x00101c00, 0x80000931, 0x00000004,
> +	0x30207f0c, 0x00000000, 0x00000060, 0x00000000,
> +	0x00000000, 0x00000000, 0x80040061, 0x00014220,
> +	0x00000000, 0x9ca64d43, 0x80040061, 0x00014220,
> +	0x00000000, 0x6ff697e4, 0x80040061, 0x00014220,
> +	0x00000000, 0x00000000, 0x80040061, 0x00014220,
> +	0x00000000, 0x00000001, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +	0x00000000, 0x00000000, 0x00000000, 0x00000000,
> +};
> +
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 519a9e727..1968a60c6 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -110,6 +110,7 @@ intel_i915_progs = [
>  	'gem_close',
>  	'gem_close_race',
>  	'gem_compute',
> +	'gem_async_strided_copy',

Move it above, keep alphabetical order.


Regards,
Kamil

>  	'gem_concurrent_blit',
>  	'gem_cs_tlb',
>  	'gem_ctx_bad_destroy',
> -- 
> 2.43.0
> 
