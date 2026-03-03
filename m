Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35E1E67A8D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 08:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4149D10E65B;
	Tue,  3 Mar 2026 08:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGEOQK5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302210E65B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772526350; x=1804062350;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pTrC3QUe4B90DNXWFWctTFy9onigAcDbDClsvwMRwzI=;
 b=kGEOQK5kvTPF3o/BjnxMqCsuawroXYUDam50eq7JE1NSeI7dhqT95JmI
 S8JM2IYrHtNcxp940kVZpXbhgfSlaiEQhAa6skUs76ryB6QGg5y0iCUQN
 R/VdI7i70ql3Nk4y9AqjRE8EVe2zxZzHs01VfbTuys4wm4DO7RCMYbhKp
 CTcXUB902MHrzgDQ645kI7EP+dx1yPIFK2+NNxLDvjtsr73fmq5Rk7DSi
 McOg/eEBoKuLFzWXmTqHYPP8rydvYd3aFbwt8RfS63450R3izQP9aYp3m
 8MkTEn8fHHbCLP8RX54g0Mm8hRCCGXiRF4pK1FCtFvmR9GvAbv3HWWCIf A==;
X-CSE-ConnectionGUID: VsQSq1KdT+eairPNL33wEQ==
X-CSE-MsgGUID: R0Sm3QRJSgyYh/GYn3vPbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77421001"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="77421001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:25:49 -0800
X-CSE-ConnectionGUID: t11lVIWJTu2WotxSLyHy+A==
X-CSE-MsgGUID: lEyV+uw4Sx+4Jap5H09/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="215039269"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:25:47 -0800
Date: Tue, 3 Mar 2026 09:25:43 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, andrzej.hajda@intel.com
Subject: Re: [PATCH i-g-t v2 2/5] lib/[gpu_cmds|xehp_media]: Introduce gpu
 execution commands for an efficient 64bit mode.
Message-ID: <hjvs7labsrdbpsmtak37r7khdq4kixacgzti3bqtu6rwciyhh5@u346iohfyw5l>
References: <20260303053104.1674811-1-priyanka.dandamudi@intel.com>
 <20260303053104.1674811-3-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303053104.1674811-3-priyanka.dandamudi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2026 at 11:01:01AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> 
> The efficient 64-bit mode introduced with XE3p and it makes manage all
> heaps by SW. In order to use efficient 64bit mode, the batchbuffer command
> have to use new introduced instructuctions (COMPUTE_WALKER2, etc) and
> new interface_descriptor for compute pipeline configuration and execution.
> 
> v2: Use xe_canonical_va in xe3p_fill_interface_descriptor for kernel_offset.
> Define BASEADDR_DIS and use it instead of hardcoding, also make some
> minute changes.(Andrzej)

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew

> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  include/intel_gpu_commands.h |   1 +
>  lib/gpu_cmds.c               | 208 +++++++++++++++++++++++++++++++++++
>  lib/gpu_cmds.h               |  17 +++
>  lib/xehp_media.h             |  65 +++++++++++
>  4 files changed, 291 insertions(+)
> 
> diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> index 5158bb0ea0..1998db4794 100644
> --- a/include/intel_gpu_commands.h
> +++ b/include/intel_gpu_commands.h
> @@ -400,6 +400,7 @@
>  #define MI_CONDITIONAL_BATCH_BUFFER_END MI_INSTR(0x36, 0)
>  #define  MI_DO_COMPARE		REG_BIT(21)
>  
> +#define BASEADDR_DIS (1 << 30)
>  #define STATE_BASE_ADDRESS \
>  	((0x3 << 29) | (0x0 << 27) | (0x1 << 24) | (0x1 << 16))
>  #define BASE_ADDRESS_MODIFY		REG_BIT(0)
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index a6a9247dce..cd912eb2ac 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -24,6 +24,7 @@
>  
>  #include "gpu_cmds.h"
>  #include "intel_mocs.h"
> +#include "xe/xe_util.h"
>  
>  static uint32_t
>  xehp_fill_surface_state(struct intel_bb *ibb,
> @@ -934,6 +935,36 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>  	idd->desc5.num_threads_in_tg = 1;
>  }
>  
> +void
> +xe3p_fill_interface_descriptor(struct intel_bb *ibb,
> +			       struct intel_buf *dst,
> +			       const uint32_t kernel[][4],
> +			       size_t size,
> +			       struct xe3p_interface_descriptor_data *idd)
> +{
> +	uint64_t kernel_offset;
> +
> +	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
> +	kernel_offset += ibb->batch_offset;
> +	kernel_offset = xe_canonical_va(ibb->fd, kernel_offset);
> +
> +	memset(idd, 0, sizeof(*idd));
> +
> +	/* 64-bit canonical format setting is needed. */
> +	idd->dw00.kernel_start_pointer = (((uint32_t)kernel_offset) >> 6);
> +	idd->dw01.kernel_start_pointer_high = kernel_offset >> 32;
> +
> +	/* Single program flow has no SIMD-specific branching in SIMD exec in EU threads */
> +	idd->dw02.single_program_flow = 1;
> +	idd->dw02.floating_point_mode = GEN8_FLOATING_POINT_IEEE_754;
> +
> +	/*
> +	* For testing purposes, use only one thread per thread group.
> +	* This makes it possible to identify threads by thread group id.
> +	*/
> +	idd->dw05.number_of_threads_in_gpgpu_thread_group = 1;
> +}
> +
>  static uint32_t
>  xehp_fill_surface_state(struct intel_bb *ibb,
>  			struct intel_buf *buf,
> @@ -1086,6 +1117,66 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>  	intel_bb_out(ibb, 0);                                       //dw21
>  }
>  
> +void
> +xe3p_emit_state_base_address(struct intel_bb *ibb)
> +{
> +	intel_bb_out(ibb, GEN8_STATE_BASE_ADDRESS | 0x14);            //dw0
> +
> +	/* general state */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw1-dw2
> +	intel_bb_out(ibb, 0);
> +
> +	/*
> +	 * For full 64b Mode, set BASEADDR_DIS.
> +	 * In Full 64b Mode, all heaps are managed by SW.
> +	 * STATE_BASE_ADDRESS base addresses are ignored by HW
> +	 * stateless data port moc not set, so EU threads have to access
> +	 * only uncached without moc when load/store
> +	 */
> +	intel_bb_out(ibb, BASEADDR_DIS);                                   //dw3
> +
> +	/* surface state */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw4-dw5
> +	intel_bb_out(ibb, 0);
> +
> +	/* dynamic state */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw6-dw7
> +	intel_bb_out(ibb, 0);
> +
> +	intel_bb_out(ibb, 0);                                         //dw8-dw9
> +	intel_bb_out(ibb, 0);
> +
> +	/* instruction */
> +	intel_bb_emit_reloc(ibb, ibb->handle,
> +			    I915_GEM_DOMAIN_INSTRUCTION,              //dw10-dw11
> +			    0, BASE_ADDRESS_MODIFY, 0x0);
> +
> +	/* general state buffer size */
> +	intel_bb_out(ibb, 0xfffff000 | 1);                            //dw12
> +
> +	/* dynamic state buffer size */
> +	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);             //dw13
> +
> +	intel_bb_out(ibb, 0);                          	              //dw14
> +
> +	/* intruction buffer size */
> +	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);             //dw15
> +
> +	/* Bindless surface state base address */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw16-17
> +	intel_bb_out(ibb, 0);
> +
> +	/* Bindless surface state size */
> +	/* number of surface state entries in the Bindless Surface State buffer */
> +	intel_bb_out(ibb, 0xfffff000);                                //dw18
> +
> +	/* Bindless sampler state */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw19-20
> +	intel_bb_out(ibb, 0);
> +	/*  Bindless sampler state size */
> +	intel_bb_out(ibb, 0);                                         //dw21
> +}
> +
>  void
>  xehp_emit_compute_walk(struct intel_bb *ibb,
>  		       unsigned int x, unsigned int y,
> @@ -1175,3 +1266,120 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>  		intel_bb_out(ibb, 0x0);
>  	}
>  }
> +
> +void
> +xe3p_emit_compute_walk2(struct intel_bb *ibb,
> +			unsigned int x, unsigned int y,
> +			unsigned int width, unsigned int height,
> +			struct xe3p_interface_descriptor_data *pidd,
> +			uint32_t max_threads)
> +{
> +	/*
> +	 * Max Threads represent range: [1, 2^16-1],
> +	 * Max Threads limit range: [64, number of subslices * number of EUs per SubSlice * number of threads per EU]
> +	 */
> +	const uint32_t MAX_THREADS = (1 << 16) - 1;
> +	uint32_t x_dim, y_dim, mask, max;
> +
> +	/*
> +	 * Simply do SIMD16 based dispatch, so every thread uses
> +	 * SIMD16 channels.
> +	 *
> +	 * Define our own thread group size, e.g 16x1 for every group, then
> +	 * will have 1 thread each group in SIMD16 dispatch. So thread
> +	 * width/height/depth are all 1.
> +	 *
> +	 * Then thread group X = width / 16 (aligned to 16)
> +	 * thread group Y = height;
> +	 */
> +	x_dim = (x + width + 15) / 16;
> +	y_dim = y + height;
> +
> +	mask = (x + width) & 15;
> +	if (mask == 0)
> +		mask = (1 << 16) - 1;
> +	else
> +		mask = (1 << mask) - 1;
> +
> +	intel_bb_out(ibb, XE3P_COMPUTE_WALKER2 | 0x3e);			//dw0, 0x32 => dw length: 62
> +
> +	intel_bb_out(ibb, 0); /* debug object id */			//dw0
> +	intel_bb_out(ibb, 0);						//dw1
> +
> +	/* Maximum Number of Threads */
> +	max = min_t(max_threads, max_t(max_threads, max_threads, 64), MAX_THREADS);
> +	intel_bb_out(ibb, max << 16);					//dw2
> +
> +	/* SIMD size, size: SIMT16 | enable inline Parameter | Message SIMT16 */
> +	intel_bb_out(ibb, 1 << 30 | 1 << 25 | 1 << 17);			//dw3
> +
> +	/* Execution mask: masking the use of some SIMD lanes by the last thread in a thread group */
> +	intel_bb_out(ibb, mask);					//dw4
> +
> +	/*
> +	 * LWS =(Local_X_Max+1)*(Local_Y_Max+1)*(Local_Z_Max+1).
> +	 */
> +	intel_bb_out(ibb, (x_dim << 20) | (y_dim << 10) | 1);		//dw5
> +
> +	/* Thread Group ID X Dimension */
> +	intel_bb_out(ibb, x_dim);					//dw6
> +
> +	/* Thread Group ID Y Dimension */
> +	intel_bb_out(ibb, y_dim);					//dw7
> +
> +	/* Thread Group ID Z Dimension */
> +	intel_bb_out(ibb, 1);						//dw8
> +
> +	/* Thread Group ID Starting X, Y, Z */
> +	intel_bb_out(ibb, x / 16);					//dw9
> +	intel_bb_out(ibb, y);						//dw10
> +	intel_bb_out(ibb, 0);						//dw11
> +
> +	/* partition type / id / size */
> +	intel_bb_out(ibb, 0);						//dw12-13
> +	intel_bb_out(ibb, 0);
> +
> +	/* Preempt X / Y / Z */
> +	intel_bb_out(ibb, 0);						//dw14
> +	intel_bb_out(ibb, 0);						//dw15
> +	intel_bb_out(ibb, 0);						//dw16
> +
> +	/* APQID, PostSync ID, Over dispatch TG count, Walker ID for preemption restore */
> +	intel_bb_out(ibb, 0);						//dw17
> +
> +	/* Interface descriptor data */
> +	for (int i = 0; i < 8; i++) {					//dw18-25
> +		intel_bb_out(ibb, ((uint32_t *) pidd)[i]);
> +	}
> +
> +	/* Post Sync command payload 0 */
> +	for (int i = 0; i < 5; i++) {					//dw26-30
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Inline data */
> +	/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
> +	/* The rest of DW33 through DW46 will be copied to the following GRFs. */
> +	intel_bb_out(ibb, x_dim);					//dw31
> +	for (int i = 0; i < 15; i++) {					//dw32-46
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 1 */
> +	for (int i = 0; i < 5; i++) {					//dw47-51
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 2 */
> +	for (int i = 0; i < 5; i++) {					//dw52-56
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 3 */
> +	for (int i = 0; i < 5; i++) {					//dw57-61
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Preempt CS Interrupt Vector: Saved by HW on a TG preemption */
> +	intel_bb_out(ibb, 0);						//dw62
> +}
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index 846d2122ac..c38eaad865 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -126,6 +126,13 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>  void
>  xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt);
>  
> +void
> +xe3p_fill_interface_descriptor(struct intel_bb *ibb,
> +			       struct intel_buf *dst,
> +			       const uint32_t kernel[][4],
> +			       size_t size,
> +			       struct xe3p_interface_descriptor_data *idd);
> +
>  void
>  xehp_emit_state_binding_table_pool_alloc(struct intel_bb *ibb);
>  
> @@ -137,6 +144,9 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads);
>  void
>  xehp_emit_state_base_address(struct intel_bb *ibb);
>  
> +void
> +xe3p_emit_state_base_address(struct intel_bb *ibb);
> +
>  void
>  xehp_emit_compute_walk(struct intel_bb *ibb,
>  		       unsigned int x, unsigned int y,
> @@ -144,4 +154,11 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>  		       struct xehp_interface_descriptor_data *pidd,
>  		       uint8_t color);
>  
> +void
> +xe3p_emit_compute_walk2(struct intel_bb *ibb,
> +			unsigned int x, unsigned int y,
> +			unsigned int width, unsigned int height,
> +			struct xe3p_interface_descriptor_data *pidd,
> +			uint32_t max_threads);
> +
>  #endif /* GPU_CMDS_H */
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index 20227bd3a6..c88e0dfb62 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -83,6 +83,71 @@ struct xehp_interface_descriptor_data {
>  	} desc7;
>  };
>  
> +struct xe3p_interface_descriptor_data {
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 5);
> +		uint32_t kernel_start_pointer:			BITRANGE(6, 31);
> +	} dw00;
> +
> +	struct {
> +		uint32_t kernel_start_pointer_high:		BITRANGE(0, 31);
> +	} dw01;
> +
> +	struct {
> +		uint32_t eu_thread_scheduling_mode_override:	BITRANGE(0, 1);
> +		uint32_t rsvd5:					BITRANGE(2, 6);
> +		uint32_t software_exception_enable:		BITRANGE(7, 7);
> +		uint32_t rsvd4:					BITRANGE(8, 12);
> +		uint32_t illegal_opcode_exception_enable:	BITRANGE(13, 13);
> +		uint32_t rsvd3:					BITRANGE(14, 15);
> +		uint32_t floating_point_mode:			BITRANGE(16, 16);
> +		uint32_t rsvd2:					BITRANGE(17, 17);
> +		uint32_t single_program_flow:			BITRANGE(18, 18);
> +		uint32_t denorm_mode:				BITRANGE(19, 19);
> +		uint32_t thread_preemption:			BITRANGE(20, 20);
> +		uint32_t rsvd1:					BITRANGE(21, 25);
> +		uint32_t registers_per_thread:			BITRANGE(26, 30);
> +		uint32_t rsvd0:					BITRANGE(31, 31);
> +	} dw02;
> +
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 31);
> +	} dw03;
> +
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 31);
> +	} dw04;
> +
> +	struct {
> +		uint32_t number_of_threads_in_gpgpu_thread_group: BITRANGE(0, 7);
> +		uint32_t rsvd3:					BITRANGE(8, 12);
> +		uint32_t thread_group_forward_progress_guarantee: BITRANGE(13, 13);
> +		uint32_t rsvd2:					BITRANGE(14, 14);
> +		uint32_t btd_mode:				BITRANGE(15, 15);
> +		uint32_t shared_local_memory_size:		BITRANGE(16, 20);
> +		uint32_t rsvd1:					BITRANGE(21, 21);
> +		uint32_t rounding_mode:				BITRANGE(22, 23);
> +		uint32_t rsvd0:					BITRANGE(24, 24);
> +		uint32_t thread_group_dispatch_size:		BITRANGE(25, 27);
> +		uint32_t number_of_barriers:			BITRANGE(28, 31);
> +	} dw05;
> +
> +	struct {
> +		uint32_t rsvd3:					BITRANGE(0, 7);
> +		uint32_t z_pass_async_compute_thread_limit:	BITRANGE(8, 10);
> +		uint32_t rsvd2:					BITRANGE(11, 11);
> +		uint32_t np_z_async_throttle_settings:		BITRANGE(12, 13);
> +		uint32_t rsvd1:					BITRANGE(14, 15);
> +		uint32_t ps_async_thread_limit:			BITRANGE(16, 18);
> +		uint32_t rsvd0:					BITRANGE(19, 31);
> +	} dw06;
> +
> +	struct {
> +		uint32_t preferred_slm_allocation_size:		BITRANGE(0, 3);
> +		uint32_t rsvd0:					BITRANGE(4, 31);
> +	} dw07;
> +};
> +
>  struct xehp_surface_state {
>  	struct {
>  		uint32_t cube_pos_z: BITRANGE(0, 0);
> -- 
> 2.43.0
> 
