Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B8EC71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 08:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A311B10E79E;
	Wed, 18 Jun 2025 08:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gML0Td0X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE31910E79E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750236097; x=1781772097;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=50wd9xedaPTjoX1o1aV7dCNN7pjurtSdHET6jNOtJ7k=;
 b=gML0Td0XVL4Fss1o/XVG9IsV5tCi+1VX7ICmNYvc5eIR1e2N+XcRhEJG
 wLDHsCubpT7WGUsVGbPCrI63oH1CYODEA9SReSRiiCOPZ1n6tDfJW0xKp
 GI01DiNn8O7GP4dWEJg5c+HTSnmo7hObMijMjT/jaoLGplt5K84mOyVls
 4EPLFpJV2ZSPiSpvkIqaRelcwY+6aEkMZtXWga4oeEqtL50RD1+ZgpmRA
 JxF8P9MRiui86W0GOPQantQFdef34a99sRtYGCoAcBkxdYGKBSmfw07KD
 xz/MLbzDa4RzvsbaDTBvD4yFezDI7j1P4Oeo82xVAXvrdP6/wcxA6URa2 w==;
X-CSE-ConnectionGUID: Y3lhGXxCTRGAy8cWbo+FKA==
X-CSE-MsgGUID: wVrieNQUTmqII48z9pGIsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63866596"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="63866596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 01:41:36 -0700
X-CSE-ConnectionGUID: w1HFtnfASdKXCSBXLZlOBg==
X-CSE-MsgGUID: zz8PkC+bRDCG8m4lwGsiyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149163101"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.55])
 ([10.245.244.55])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 01:41:35 -0700
Message-ID: <fbf7e135-b882-4210-82bc-bbe2c2895d82@intel.com>
Date: Wed, 18 Jun 2025 09:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM
 flag where it's missing
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com
References: <20250616142259.19124-1-lukasz.laguna@intel.com>
 <20250616142259.19124-2-lukasz.laguna@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250616142259.19124-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 16/06/2025 15:22, Lukasz Laguna wrote:
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_ccs.c                      |  6 +++---
>   tests/intel/xe_copy_basic.c               | 10 ++++++----
>   tests/intel/xe_exercise_blt.c             |  4 ++--
>   tests/intel/xe_pat.c                      |  3 ++-
>   tests/intel/xe_spin_batch.c               |  3 ++-
>   tests/intel/xe_sysfs_timeslice_duration.c |  6 ++++--
>   tests/intel/xe_vm.c                       |  6 ++++--
>   7 files changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index bff5b5772..61cf97d52 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -362,7 +362,7 @@ static void block_copy(int xe,
>   	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>   	int result;
>   
> -	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
>   	if (!blt_uses_extended_block_copy(xe))
>   		pext = NULL;
> @@ -497,7 +497,7 @@ static void block_multicopy(int xe,
>   	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>   	int result;
>   
> -	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
>   	if (!blt_uses_extended_block_copy(xe))
>   		pext3 = NULL;
> @@ -593,7 +593,7 @@ static void block_copy_large(int xe,
>   	bool result = true;
>   	int i;
>   
> -	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
>   	if (!blt_uses_extended_block_copy(xe))
>   		pext = NULL;
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index ecd942ad0..5a050b82c 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -98,7 +98,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>   	igt_debug("size: %u, pitch: %u, width: %u, height: %u (type: %d, mode: %d)\n",
>   		  size, pitch, width, height, type, mode);
>   
> -	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> +	bb = xe_bo_create(fd, 0, bb_size, region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
>   	blt_mem_copy_init(fd, &mem, mode, type);
>   	mem.print_bb = param.print_bb;
> @@ -185,7 +185,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>   	uint32_t bb;
>   	uint8_t *result;
>   
> -	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> +	bb = xe_bo_create(fd, 0, bb_size, region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   	blt_mem_set_init(fd, &mem, TYPE_LINEAR);
>   	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
>   			   dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
> @@ -217,8 +217,10 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
>   	uint32_t bo_size = ALIGN(blocksize * rect->height, xe_get_default_alignment(fd));
>   	intel_ctx_t *ctx;
>   
> -	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> -	dst_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> +	src_handle = xe_bo_create(fd, 0, bo_size, region,
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	dst_handle = xe_bo_create(fd, 0, bo_size, region,
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   	vm = xe_vm_create(fd, 0, 0);
>   	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
>   	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index 4ce97044e..a545654d3 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -133,7 +133,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
>   	uint32_t bb;
>   	int result;
>   
> -	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
>   	blt_copy_init(xe, &bltinit);
>   	src = blt_create_object(&bltinit, region1, width, height, bpp, 0,
> @@ -192,7 +192,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
>   	uint32_t bb;
>   	int result;
>   
> -	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
> +	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
>   	blt_copy_init(xe, &blt);
>   	src = blt_create_object(&blt, region1, width, height, bpp, 0,
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 88d8de9dd..8bb0ac167 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -582,7 +582,8 @@ static void prime_self_import_coh(void)
>   	fd1 = drm_open_driver(DRIVER_XE);
>   	fd2 = drm_open_driver(DRIVER_XE);
>   
> -	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1), 0,
> +	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1),
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>   					  DRM_XE_GEM_CPU_CACHING_WC);
>   
>   	dma_buf_fd = prime_handle_to_fd(fd1, dst_handle);
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 21b08ba06..48a888e35 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -442,7 +442,8 @@ static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
>   	vm = xe_vm_create(fd, 0, 0);
>   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>   	bb_size = xe_bb_size(fd, sizeof(*data));
> -	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
> +	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
>   						      ALLOC_STRATEGY_LOW_TO_HIGH);
>   	data = xe_bo_map(fd, bb, bb_size);
> diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
> index 752672691..456cb9a72 100644
> --- a/tests/intel/xe_sysfs_timeslice_duration.c
> +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> @@ -76,7 +76,8 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
>   	exec_queues[0] = xe_exec_queue_create(fd, vm[0], hwe, 0);
>   	exec_queues[1] = xe_exec_queue_create(fd, vm[1], hwe, 0);
>   	bo_size = xe_bb_size(fd, sizeof(*spin));
> -	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0), 0);
> +	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0),
> +			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   	spin[0] = xe_bo_map(fd, bo[0], bo_size);
>   	xe_vm_bind_async(fd, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
>   	xe_spin_init_opts(spin[0], .addr = addr1, .preempt = false);
> @@ -85,7 +86,8 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
>   	xe_exec(fd, &exec);
>   	xe_spin_wait_started(spin[0]);
>   
> -	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0), 0);
> +	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0),
> +			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   	spin[1] = xe_bo_map(fd, bo[1], bo_size);
>   	xe_vm_bind_sync(fd, vm[1], bo[1], 0, addr2, bo_size);
>   	xe_spin_init_opts(spin[1], .addr = addr2);
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 94cca13ba..c1abb08bb 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1997,9 +1997,11 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>   		igt_assert(map0 != MAP_FAILED);
>   		igt_assert(map1 != MAP_FAILED);
>   	} else {
> -		bo0 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
> +		bo0 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   		map0 = xe_bo_map(fd, bo0, bo_size);
> -		bo1 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
> +		bo1 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   		map1 = xe_bo_map(fd, bo1, bo_size);
>   	}
>   	memset(map0, 0, bo_size);

