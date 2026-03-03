Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56F9EC0461
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 09:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E40B10E069;
	Tue,  3 Mar 2026 09:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mw7foDT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC1310E069
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772529357; x=1804065357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NpO/O+ORTcIlVJ6/XdUkbudlwJzMGr2L55s/uVKbTXw=;
 b=Mw7foDT6Vgyx5WiL43xO7+vLq7YWyAmVYFiDMelbxycuc7M6Ku2iEJGr
 pcJXV6F/Eg2SDIj3HJJIUUbaL06qJTdS5T8ZUbF2okbNMMrBdM3Rloc5A
 iipPp5qKTO6i3TvBy9xxNMO2OlBWRhl2y8LD3LrJJjuyNoZpbiyBfFsG7
 9ZOsnZUeR9x23Gn7mz+eBgMkYdOlk1DV6LFvVvk7lE4SK2mYED8XJKgt9
 m8IUOjZ24ivbqGBAloMwJ9t7xfbbfVAT2gpxoeyZKmizj00zstVqGqUv/
 G6x20+z4bkqCq90DJqx9xWSyouqj5G+sYBMx8RVGyQ0/ELdJQAP2AxTvv Q==;
X-CSE-ConnectionGUID: IiFIHdJwTKq9ljf6RADm/g==
X-CSE-MsgGUID: KeLfpsXRTPeLlL3TuXDFPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="91128416"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="91128416"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:15:56 -0800
X-CSE-ConnectionGUID: 5r2+ExKfQn2jS1lLqQqCrg==
X-CSE-MsgGUID: 6IE2lGTORhKaquPzGgMfMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217087856"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:15:54 -0800
Date: Tue, 3 Mar 2026 10:15:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t RESEND v1 1/2] lib/gpu_cmds: Add support for
 compute walker interrupt
Message-ID: <4kheayldwwkmrbnrvznrzbgy3f43vk6nafqkber7ygwushu25m@pxpsxbf7rjs3>
References: <20260303064451.1685885-1-priyanka.dandamudi@intel.com>
 <20260303064451.1685885-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303064451.1685885-2-priyanka.dandamudi@intel.com>
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

On Tue, Mar 03, 2026 at 12:14:50PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Make some lib functions global to be used in compute walker interrupt test.
> Add support for compute walker interrupts and its post sync operations.
> Make some dependent library functions globally accessible.

LGTM, but wait for previous series to land and resubmit to allow CI
to verify there's no regression. But for this change:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/gpgpu_shader.c |  4 ++--
>  lib/gpgpu_shader.h |  2 ++
>  lib/gpu_cmds.c     | 15 ++++++++++++---
>  lib/gpu_cmds.h     |  9 ++++++++-
>  4 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 874f2c63d6..20f39aa769 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -151,7 +151,7 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>  		      engine | I915_EXEC_NO_RELOC, false);
>  }
>  
> -static void
> +void
>  fill_inline_data(uint32_t *inline_data, uint64_t target_offset, struct intel_buf *target,
>  		 uint32_t x_dim)
>  {
> @@ -265,7 +265,7 @@ __xe3p_gpgpu_execfunc(struct intel_bb *ibb,
>  	/* Inline data is at 32th dword of COMPUTE_WALKER_2 */
>  	inline_data = intel_bb_ptr(ibb) + 4 * 32;
>  	/* Pass a value of "SIMD_SIZE(16) * x_dim" as the argument for width */
> -	xe3p_emit_compute_walk2(ibb, 0, 0, x_dim * 16, y_dim, &idd, x_dim * y_dim);
> +	xe3p_emit_compute_walk2(ibb, 0, 0, x_dim * 16, y_dim, &idd, x_dim * y_dim, NULL);
>  	fill_inline_data(inline_data, xe_canonical_va(ibb->fd, target->addr.offset), target, x_dim);
>  
>  	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index fc931a72b4..7c10572bca 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -83,6 +83,8 @@ void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes
>  
>  uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr);
>  
> +void fill_inline_data(uint32_t *inline_data, uint64_t target_offset,
> +		      struct intel_buf *target, uint32_t x_dim);
>  void gpgpu_shader__wait(struct gpgpu_shader *shdr);
>  void gpgpu_shader__breakpoint_on(struct gpgpu_shader *shdr, uint32_t cmd_no);
>  void gpgpu_shader__breakpoint(struct gpgpu_shader *shdr);
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index cd912eb2ac..10c8bfb8dd 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -1272,7 +1272,8 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>  			unsigned int x, unsigned int y,
>  			unsigned int width, unsigned int height,
>  			struct xe3p_interface_descriptor_data *pidd,
> -			uint32_t max_threads)
> +			uint32_t max_threads,
> +			struct xe3p_cw2_interrupt_data *intdata)
>  {
>  	/*
>  	 * Max Threads represent range: [1, 2^16-1],
> @@ -1353,8 +1354,16 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>  	}
>  
>  	/* Post Sync command payload 0 */
> -	for (int i = 0; i < 5; i++) {					//dw26-30
> -		intel_bb_out(ibb, 0);
> +	if (intdata != NULL) {
> +		intel_bb_out(ibb, intdata->post_sync_op);
> +		intel_bb_out(ibb, intdata->post_sync_addr);
> +		intel_bb_out(ibb, intdata->post_sync_addr >> 32);
> +		intel_bb_out(ibb, intdata->post_sync_val);
> +		intel_bb_out(ibb, intdata->post_sync_val >> 32);
> +	} else {
> +		for (int i = 0; i < 5; i++) {					//dw26-30
> +			intel_bb_out(ibb, 0);
> +		}
>  	}
>  
>  	/* Inline data */
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index c38eaad865..b3bfb137b0 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -39,6 +39,12 @@
>  #include "intel_bufops.h"
>  #include <assert.h>
>  
> +struct xe3p_cw2_interrupt_data {
> +	uint32_t post_sync_op;
> +	uint64_t post_sync_addr;
> +	uint64_t post_sync_val;
> +};
> +
>  uint32_t
>  gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color);
>  
> @@ -159,6 +165,7 @@ xe3p_emit_compute_walk2(struct intel_bb *ibb,
>  			unsigned int x, unsigned int y,
>  			unsigned int width, unsigned int height,
>  			struct xe3p_interface_descriptor_data *pidd,
> -			uint32_t max_threads);
> +			uint32_t max_threads,
> +			struct xe3p_cw2_interrupt_data *intdata);
>  
>  #endif /* GPU_CMDS_H */
> -- 
> 2.43.0
> 
