Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3573BEFCD7C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 10:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29F810E4CD;
	Mon,  9 Mar 2026 10:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6MQJj4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E6B10E4CD
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773051412; x=1804587412;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SeNrlYEUgzQhr0pMKwXv7OpbO6k7dOfjDcctwiKXYOM=;
 b=K6MQJj4kjeKcGUDQyxmzzaLl7XZkJ2n8dHI9r9bzUh6lURT3spRl6Vry
 H8iwN6uRVKRqImLWfc7H1kWgS0ktTQAQconHxpreBEU41TH3Fwb0da1CU
 iNiesik4RMN5hQBSgOC6Mkk9xdW5VA2tqjBxdcqs2bwW7N9gStYvoJx/Y
 MdxmbiT4oEdKLsGa+1WOkNrZ3JX3M09irSWlXkGBScsI/lCtV6Fpq1v8a
 9nSe1cQ5NghRftXWVyQMETe0BDnFfdFCC+c/42kDT4YNl+6Lcvk1AnB3u
 T1DSYU2L3ktEsAFlEJfMkUAz+tbDjY46JwyZKpOog0qH8f7oeITF2kqzs w==;
X-CSE-ConnectionGUID: /5SNLiS7RQe7lTcFnr3mqg==
X-CSE-MsgGUID: U5WTzrUTRkeeaMSfN0ZlIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73091045"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73091045"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:16:52 -0700
X-CSE-ConnectionGUID: 04q2pacrQJyGSVEeziPR3g==
X-CSE-MsgGUID: sTRsAtxpTlyAHft4f2/4WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224410048"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:16:51 -0700
Date: Mon, 9 Mar 2026 11:16:50 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 3/5] lib/gpgpu_shader: Add support for xe3p
 efficient 64bit addressing
Message-ID: <i7i5qfw2j2ccztibfdkrjpzltqc2supuv2gj3h7o37ufvynbwb@cfusgwvv5zpd>
References: <20260305053413.1734922-7-priyanka.dandamudi@intel.com>
 <20260305053413.1734922-10-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305053413.1734922-10-priyanka.dandamudi@intel.com>
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

On Thu, Mar 05, 2026 at 11:04:17AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> xe3p with new type of addressing requires following changes in shaders:
> - new interface descriptor, state base address, COMPUTE_WALKER_2
> - new instructions for load/store messages.
> 
> v2: xe_canonical_va() instead of CANONICAL_57B.(Zbigniew)
> 
> v3: Revert tab->space conversion.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/gpgpu_shader.c | 63 +++++++++++++++++++++++++++++++++++++++++++++-
>  lib/iga64_macros.h |  5 +++-
>  2 files changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index abccb4808f..03dc4da666 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -12,6 +12,7 @@
>  #include "gpgpu_shader.h"
>  #include "gpu_cmds.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_util.h"
>  
>  struct label_entry {
>  	uint32_t id;
> @@ -218,6 +219,63 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>  		      engine | I915_EXEC_NO_RELOC, false);
>  }
>  
> +static void
> +__xe3p_gpgpu_execfunc(struct intel_bb *ibb,
> +		      struct intel_buf *target,
> +		      unsigned int x_dim, unsigned int y_dim,
> +		      struct gpgpu_shader *shdr,
> +		      struct gpgpu_shader *sip,
> +		      uint64_t ring, bool explicit_engine)
> +{
> +	struct xe3p_interface_descriptor_data idd;
> +	uint32_t sip_offset, *inline_data;
> +	uint64_t engine;
> +
> +	intel_bb_add_intel_buf(ibb, target, true);
> +	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
> +	xe3p_fill_interface_descriptor(ibb, target, shdr->instr,
> +				       4 * shdr->size, &idd);
> +	idd.dw02.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
> +	if (sip && sip->size)
> +		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
> +	else
> +		sip_offset = 0;
> +
> +	intel_bb_ptr_set(ibb, 0);
> +
> +	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
> +		     PIPELINE_SELECT_GPGPU);
> +	xe3p_emit_state_base_address(ibb);
> +	xehp_emit_state_compute_mode(ibb, shdr->vrt != VRT_DISABLED);
> +
> +	if (sip_offset) {
> +		struct drm_i915_gem_exec_object2 *object =
> +			intel_bb_find_object(ibb, ibb->handle);
> +		uint64_t ppgtt_bb_addr, sip_addr;
> +
> +		igt_assert(object);
> +
> +		/* get base batch buffer address. */
> +		ppgtt_bb_addr = object->offset;
> +
> +		sip_addr = xe_canonical_va(ibb->fd, ppgtt_bb_addr + sip_offset);
> +		emit_sip(ibb, sip_addr);
> +	}
> +
> +	/* Inline data is at 32th dword of COMPUTE_WALKER_2 */
> +	inline_data = intel_bb_ptr(ibb) + 4 * 32;
> +	/* Pass a value of "SIMD_SIZE(16) * x_dim" as the argument for width */
> +	xe3p_emit_compute_walk2(ibb, 0, 0, x_dim * 16, y_dim, &idd, x_dim * y_dim);
> +	fill_inline_data(inline_data, xe_canonical_va(ibb->fd, target->addr.offset), target, x_dim);

I wondered shouldn't we pass additional struct with inline data instead
of storing pointer and patching but this may be subject of some rework
in the future, so for this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
> +	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
> +	intel_bb_ptr_align(ibb, 32);
> +
> +	engine = explicit_engine ? ring : I915_EXEC_DEFAULT;
> +
> +	intel_bb_exec(ibb, engine | I915_EXEC_NO_RELOC, false, true);
> +}
> +
>  static void gpgpu_alloc_gpu_addr(struct intel_bb *ibb, struct intel_buf *target)
>  {
>  	uint64_t ahnd;
> @@ -257,7 +315,10 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>  	if (target->addr.offset == INTEL_BUF_INVALID_ADDRESS)
>  		gpgpu_alloc_gpu_addr(ibb, target);
>  
> -	if (shdr->gen_ver >= 1250)
> +	if (shdr->gen_ver >= 3500)
> +		__xe3p_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
> +				      ring, explicit_engine);
> +	else if (shdr->gen_ver >= 1250)
>  		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
>  				      ring, explicit_engine);
>  	else
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> index 76a330ab50..5b943bc277 100644
> --- a/lib/iga64_macros.h
> +++ b/lib/iga64_macros.h
> @@ -78,9 +78,12 @@
>  #if GEN_VER < 3000
>  #define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
>  #define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
> -#else
> +#elif GEN_VER < 3500
>  #define LOAD_SPACE_DW(dst, src) send.ugm (1)	dst	src	null:0	0x0	0x2120003
>  #define STORE_SPACE_DW(dst, src) send.ugm (1)	null	dst	src:1	0x0	0x2020007
> +#else
> +#define LOAD_SPACE_DW(dst, src) sendg.ugm (1)	dst	src:1	null:0	0x28003
> +#define STORE_SPACE_DW(dst, src) sendg.ugm (1)	null	dst:1	src:1	0x28007
>  #endif
>  #endif
>  
> -- 
> 2.43.0
> 
