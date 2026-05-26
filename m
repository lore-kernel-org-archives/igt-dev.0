Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8ABCD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 12:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D6F10E47A;
	Tue, 26 May 2026 12:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0bmTzPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D686610E47A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779797776; x=1811333776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ukU38BqAtK/p6Gf5obJRM8fjtxmt63RYp7/9BcUxYcQ=;
 b=n0bmTzPMOEoKXt1wYXpv0sdtSPR4aVRAPHWrXaRX1l06BC7NnJzp0/mq
 ay7Lc73rWNfMbZI7Rt6SnN6W+DP9AsBDSQ96nRoRqVh2WypJoYOPC0KNu
 slHuu6LHeE5PP+9Z7iIgZG2qRdkxVn9fcJb9G1zr1eFwrGTfPMx4IN7O4
 K8g0HXcURA9cmd4Ehc+Iqtz/hqLd5p5dM6B9fP5oWt2QJm2y8sjwT4iUa
 8pT32vRqG9inRzKUAVIX/dabFvDyFUIsGXNxONB0VpgySvadPgLcH+oNF
 Twx9AJlzp5/gkAjmwQKNL/S7Z/GsnrVFj96tniduiPHE7NKlPfAcJY9b7 g==;
X-CSE-ConnectionGUID: OPKiLAf2RTa7E9HXBq4PRg==
X-CSE-MsgGUID: mwkk5y3vQYy7igBt1b2eHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79641889"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="79641889"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:16:16 -0700
X-CSE-ConnectionGUID: WNR3NhBqTzCQBkVdlFft0w==
X-CSE-MsgGUID: coCVxBfZTqqMiOfNsTqBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246990619"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 05:16:14 -0700
Date: Tue, 26 May 2026 14:15:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/8] lib/intel_batchbuffer: make __intel_bb_create
 gt aware
Message-ID: <20260526121556.c6p647ummkfpwlv5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
 <20260323162911.1912755-3-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323162911.1912755-3-juhapekka.heikkila@gmail.com>
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

Hi Juha-Pekka,
On 2026-03-23 at 18:29:05 +0200, Juha-Pekka Heikkila wrote:
> add possibility to use gt id in __intel_bb_create
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/intel_batchbuffer.c | 20 +++++++++++---------
>  lib/intel_batchbuffer.h |  1 +
>  2 files changed, 12 insertions(+), 9 deletions(-)

There is a build conflict, see CI report:
CONFLICT (content): Merge conflict in lib/intel_batchbuffer.c
Patch failed at 0002 lib/intel_batchbuffer: make __intel_bb_create gt aware

Regards,
Kamil

> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index b09506574..802e771a4 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -905,7 +905,8 @@ static struct intel_bb *
>  __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  		  uint32_t size, bool do_relocs,
>  		  uint64_t start, uint64_t end, uint64_t alignment,
> -		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
> +		  uint8_t allocator_type, enum allocator_strategy strategy,
> +		  uint64_t region, uint16_t gt_id)
>  {
>  	struct drm_i915_gem_exec_object2 *object;
>  	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
> @@ -915,6 +916,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  	ibb->devid = intel_get_drm_devid(fd);
>  	ibb->gen = intel_gen(ibb->devid);
>  	ibb->ctx = ctx;
> +	ibb->gt_id = gt_id;
>  
>  	ibb->fd = fd;
>  	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
> @@ -1059,7 +1061,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
>  				      enum allocator_strategy strategy, uint64_t region)
>  {
>  	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
> -				 alignment, allocator_type, strategy, region);
> +				 alignment, allocator_type, strategy, region, 0);
>  }
>  
>  /**
> @@ -1086,7 +1088,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
>  {
>  	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
>  				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>  }
>  
>  static bool aux_needs_softpin(int fd)
> @@ -1128,7 +1130,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
>  				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
>  				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>  }
>  
>  /**
> @@ -1157,7 +1159,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>  				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
>  				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>  }
>  
>  /**
> @@ -1184,7 +1186,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
>  	return __intel_bb_create(fd, ctx, vm, cfg, size,
>  				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
> -				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
> +				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
>  }
>  
>  /**
> @@ -1205,7 +1207,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
>  
>  	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
>  				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> -				 REGION_SMEM);
> +				 REGION_SMEM, 0);
>  }
>  
>  /**
> @@ -1231,7 +1233,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
>  
>  	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
>  				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
> -				 REGION_SMEM);
> +				 REGION_SMEM, 0);
>  }
>  
>  /**
> @@ -1256,7 +1258,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
>  	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
>  				 INTEL_ALLOCATOR_SIMPLE,
>  				 ALLOC_STRATEGY_HIGH_TO_LOW,
> -				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>  }
>  
>  static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index d0a7c8dc7..7049dd2d0 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -269,6 +269,7 @@ struct intel_bb {
>  	struct igt_pxp pxp;
>  	uint32_t ctx;
>  	uint32_t vm_id;
> +	uint16_t gt_id;
>  
>  	bool xe_bound;
>  	uint32_t engine_syncobj;
> -- 
> 2.43.0
> 
