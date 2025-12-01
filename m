Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4494ED116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 17:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE46D10E437;
	Mon,  1 Dec 2025 17:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dze6TpD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEF610E434
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 17:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764609366; x=1796145366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6KtwV36z1eOpB+Kxn5gsQbPTxTvNh0br6VuCUMxyECc=;
 b=dze6TpD9uPbsD2FMKAYyG7r2a/JUA6Fw/eY2foS9kveFHKsn+ee5R/tS
 G66xEVR9uZvVFLEs+4T8FfKmNGC3eEg8CVjyiww633tnsa8Djvgv28keW
 /oGWdgqx4RAmjblnBDnLgUzn4XYnzy34rN8c4ZD/8wuYwxeWTfgZM2hFL
 BJO4ewsraq5OTEyWeT2KY/RlIvpAne2YESznI7gAnFh/IvoMLLnEqJ1+z
 XwUU6mVrjpWzHTZYSIcNq77hgom7xuDWeRZGoqh2fUpT/eGGZJnPX3tUK
 BhMw9CKLGGM/L3zImerVdQX8s7jwDMPAyOB4qVuzO+PmJY4gPQne7IKzi A==;
X-CSE-ConnectionGUID: eJWPdkaCQ2yAFFtTOCmWWA==
X-CSE-MsgGUID: O5XY3TLjRFmdL3TzLqB7zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76875746"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="76875746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:16:06 -0800
X-CSE-ConnectionGUID: IXbldvy5S9GDlrMkdrC+6w==
X-CSE-MsgGUID: M5fO1ZP8RPCGneUypki/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194556992"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:16:05 -0800
Date: Mon, 1 Dec 2025 18:16:02 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] intel/i915: Allocate batch buffers from system
 RAM
Message-ID: <xrwgg6ihstx3h67swchic7apfzjczybedmnslmrtegjf5sthy6@xf4qzvqnlk4e>
References: <20251128010251.18988-1-ville.syrjala@linux.intel.com>
 <20251128010251.18988-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128010251.18988-4-ville.syrjala@linux.intel.com>
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

On Fri, Nov 28, 2025 at 03:02:51AM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I have no idea why we're allocating batch buffers from VRAM.
> Just stick them into system memory like a normal person and
> let the GPU DMA them in.

"normal person", I feel touched ;)

But code is correct and:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_fb.c                   | 2 +-
>  tests/intel/gem_ccs.c          | 6 +++---
>  tests/intel/gem_exercise_blt.c | 4 ++--
>  tools/intel_tiling_detect.c    | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 78d49aed8283..f7743d05f62a 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -3017,7 +3017,7 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
>  		igt_assert(__gem_create_in_memory_regions(fb->fd,
>  							  bb,
>  							  bb_size,
> -							  *mem_region) == 0);
> +							  REGION_SMEM) == 0);
>  	} else if (is_xe_device(fb->fd)) {
>  		*vm = xe_vm_create(fb->fd, 0, 0);
>  		*exec_queue = xe_exec_queue_create(fb->fd, *vm, &inst, 0);
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index 68632372d8f5..885e043540c1 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -341,7 +341,7 @@ static void block_copy(int i915,
>  	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>  	int result;
>  
> -	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> +	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
>  
>  	if (!blt_uses_extended_block_copy(i915))
>  		pext = NULL;
> @@ -464,7 +464,7 @@ static void block_multicopy(int i915,
>  	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>  	int result;
>  
> -	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> +	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
>  
>  	if (!blt_uses_extended_block_copy(i915))
>  		pext3 = NULL;
> @@ -551,7 +551,7 @@ static void block_copy_large(int i915,
>  	bool result = true;
>  	int i;
>  
> -	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> +	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
>  
>  	if (!blt_uses_extended_block_copy(i915))
>  		pext = NULL;
> diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
> index 74388f7f05cf..7cacb5b7a6d9 100644
> --- a/tests/intel/gem_exercise_blt.c
> +++ b/tests/intel/gem_exercise_blt.c
> @@ -151,7 +151,7 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
>  	uint32_t bb, width = param.width, height = param.height;
>  	int result;
>  
> -	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> +	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
>  
>  	blt_copy_init(i915, &bltinit);
>  	src = blt_create_object(&bltinit, region1, width, height, bpp, 0,
> @@ -212,7 +212,7 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
>  	uint32_t width = param.width, height = param.height;
>  	int result;
>  
> -	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> +	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
>  
>  	blt_copy_init(i915, &blt);
>  	src = blt_create_object(&blt, region1, width, height, bpp, 0,
> diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
> index a72999057088..fac8a2f590c5 100644
> --- a/tools/intel_tiling_detect.c
> +++ b/tools/intel_tiling_detect.c
> @@ -117,7 +117,7 @@ static void blt_copy(int fd,
>  		bb_size = SZ_4K;
>  		src_region = REGION_SMEM;
>  		dst_region = gem_has_lmem(fd) ? REGION_LMEM(0) : REGION_SMEM;
> -		igt_assert(__gem_create_in_memory_regions(fd, &bb, &bb_size, src_region) == 0);
> +		igt_assert(__gem_create_in_memory_regions(fd, &bb, &bb_size, REGION_SMEM) == 0);
>  	}
>  
>  	if (!blt_uses_extended_block_copy(fd))
> -- 
> 2.51.2
> 
