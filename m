Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E545C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 10:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAF610E608;
	Wed, 11 Jun 2025 10:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXhZTrTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D410E60B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749637655; x=1781173655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XNZBh7yTULabx5f/TbeQeEtb5FjpHHFgJ5CtkkpOH7M=;
 b=dXhZTrTvf4NPJe0BNWGBbF3aidRXOGDeyNWksmM+dAStDOQwOmZ3zTJH
 RW/UcbMV+2cLt2Nknnqhp85ISw2aW2IdeKM3sMqqNW99L+GUISLoVZK/Q
 JdUKsjj7aX2dL+dhJRuY0V1h2Qgyu5N2QR0gIXRCKK34Ji3DPR+Y0bF/8
 lKDHtw+L/gKEOINtwrJvgMt44X5cwh+b/yWa57VNHYHYxB8Sx/aN4ZF5F
 xbPwGkl2zXvJBPuT7IKVKgVZUua8R2Rg4tpleREEW2CU0DU4s8I40NqfG
 paWutJNsMFBr/HwPfJGmDY5N9Hqx1Td7hj9ZVZ5podXN3zeF21JLLn4Aw w==;
X-CSE-ConnectionGUID: tAahO2t3ReWCwPMvAufpiw==
X-CSE-MsgGUID: juwOghtjQ3CEjqYzgBgung==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63183989"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="63183989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:27:34 -0700
X-CSE-ConnectionGUID: VlQbturEQtWQGQALzu6HRw==
X-CSE-MsgGUID: otRo0UtPSuGbM/SPURwYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="151930668"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:27:33 -0700
Date: Wed, 11 Jun 2025 12:27:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag
 where it's missing
Message-ID: <20250611102730.dopm3j4tif6k7t5l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 igt-dev@lists.freedesktop.org, matthew.auld@intel.com
References: <20250611095711.14864-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611095711.14864-1-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2025-06-11 at 11:57:11 +0200, Lukasz Laguna wrote:
> Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM flag when creating BOs
> that will be CPU-mapped, to ensure that the corresponding VRAM
> allocation will use the CPU accessible part of VRAM.
> 
> This is essential for small-bar systems, where omitting the flag may
> cause failures or SIGBUS crashes due to the CPU accessing non-visible
> VRAM.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_exec_atomic.c | 2 +-
>  tests/intel/xe_pat.c         | 3 ++-
>  tests/intel/xe_spin_batch.c  | 3 ++-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> index 825d7d190..39c739b64 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -85,7 +85,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
>  	bo_size = xe_bb_size(fd, bo_size);
>  
>  	bo = xe_bo_create(fd, vm, bo_size, placement,
> -			  I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS);
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);

Could you split this into separate patch? imho it looks like a fix.

Regards,
Kamil

>  
>  	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>  	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 88d8de9dd..8bb0ac167 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -582,7 +582,8 @@ static void prime_self_import_coh(void)
>  	fd1 = drm_open_driver(DRIVER_XE);
>  	fd2 = drm_open_driver(DRIVER_XE);
>  
> -	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1), 0,
> +	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>  					  DRM_XE_GEM_CPU_CACHING_WC);
>  
>  	dma_buf_fd = prime_handle_to_fd(fd1, dst_handle);
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 21b08ba06..48a888e35 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -442,7 +442,8 @@ static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
>  	vm = xe_vm_create(fd, 0, 0);
>  	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>  	bb_size = xe_bb_size(fd, sizeof(*data));
> -	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
> +	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
>  						      ALLOC_STRATEGY_LOW_TO_HIGH);
>  	data = xe_bo_map(fd, bb, bb_size);
> -- 
> 2.40.0
> 
