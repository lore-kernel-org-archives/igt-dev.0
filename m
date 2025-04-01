Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA672C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 19:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A50010E0F0;
	Tue,  1 Apr 2025 19:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTEn2Npc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD94210E0F0
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 19:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743534703; x=1775070703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=X/pEXJ2ktnGt0jzi6R7DrJbGGeem1/p38MWq1rM9fpg=;
 b=cTEn2NpcKNfZ2JboRnvydXwVzZYFClk9pgDJwUY/rWZx4zBDtJaBc1SD
 +6ygkVtoE9OWTgTjGC7KXblD3WxnuVuOhLpgEwAqP7m2MDY8x1WPIpltg
 GGCrixaPkPQY8xrucaLAi20N0fAHmmE2sw1TBYc79+zF71ppYbRsNFtbB
 sE4roneZuTlrqMuIbvt93LM3fcOA8ngzhBuQ8gyoDABOg+150lvxVcyF9
 +n2oCMQLDrl76f6FlcJYiFbqgZ05mpNY3c4VUnPBujybFOuOupcq0n69V
 Y9PjpFmHsYeWA+5Ty2nE3AzGQ+Tbm3uMRqPdpHI+GX/6fnq3YeDZVfP/C g==;
X-CSE-ConnectionGUID: CPVy5Gy1TW2Cc2fndbGeUw==
X-CSE-MsgGUID: moL/E6keTq6IeFFd7fZt5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67348624"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="67348624"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:11:42 -0700
X-CSE-ConnectionGUID: 2f9Ovuf+QoyY8FtAyCmyBg==
X-CSE-MsgGUID: tuvhWeplTsW/qEUnnVyzxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="126304893"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.192])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:11:41 -0700
Date: Tue, 1 Apr 2025 21:11:38 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v4 3/5] tests/intel/xe_spin_batch: Add basic test
 for mem copy from spinner
Message-ID: <20250401191138.ax4t5yy6q2ecbqov@zkempczy-mobl2>
References: <20250401140510.38142-1-francois.dugast@intel.com>
 <20250401140510.38142-4-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401140510.38142-4-francois.dugast@intel.com>
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

On Tue, Apr 01, 2025 at 04:00:58PM +0200, Francois Dugast wrote:
> Add a basic test to demonstrate this new spinner capability.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_spin_batch.c | 109 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 108 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 7c0305d17..903af50d9 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -1,10 +1,13 @@
>  #include "igt.h"
>  #include "igt_syncobj.h"
> +#include "lib/intel_mocs.h"
> +#include "lib/intel_pat.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> +#include "xe/xe_util.h"
>  
>  /**
>   * TEST: Tests for spin batch submissons.
> @@ -312,6 +315,101 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  	put_ahnd(ahnd);
>  }
>  
> +static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance *hwe,
> +				    uint32_t region)
> +{
> +	uint32_t copy_size = SZ_4M;
> +	uint64_t duration_ns = NSEC_PER_SEC / 10;

I've also tested without / 10 and it is quite precise (1.005s). LGTM

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +	intel_ctx_t *ctx;
> +	uint32_t vm, exec_queue;
> +	uint64_t ahnd;
> +	uint32_t width = copy_size;
> +	uint32_t height = 1;
> +	uint32_t bo_size = ALIGN(SZ_4K, xe_get_default_alignment(fd));
> +	uint32_t bo;
> +	struct xe_spin *spin;
> +	uint64_t spin_addr;
> +	int32_t src_handle, dst_handle;
> +	struct blt_mem_object src, dst;
> +	struct xe_spin_mem_copy mem_copy = {
> +		.src = &src,
> +		.dst = &dst,
> +	};
> +
> +	igt_debug("Using spinner to copy %u kB in region %u with engine %s\n",
> +		  copy_size / 1024, region, xe_engine_class_string(hwe->engine_class));
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> +	ahnd = intel_allocator_open_full(fd, vm, 0, 0,
> +					 INTEL_ALLOCATOR_SIMPLE,
> +					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +
> +	/* Create source and destination objects used for the copy */
> +	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> +	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> +	blt_set_mem_object(mem_copy.src, src_handle, copy_size, 0, width, height, region,
> +			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> +			   M_LINEAR, COMPRESSION_DISABLED);
> +	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, 0, width, height, region,
> +			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> +			   M_LINEAR, COMPRESSION_DISABLED);
> +	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> +	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
> +	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> +						   mem_copy.src->size, 0, mem_copy.src->pat_index);
> +	mem_copy.dst_offset = get_offset_pat_index(ahnd, mem_copy.dst->handle,
> +						   mem_copy.dst->size, 0, mem_copy.dst->pat_index);
> +
> +	/* Create spinner */
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> +	spin = xe_bo_map(fd, bo, bo_size);
> +	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
> +							ALLOC_STRATEGY_LOW_TO_HIGH);
> +	xe_vm_bind_sync(fd, vm, bo, 0, spin_addr, bo_size);
> +	xe_spin_init_opts(spin, .addr = spin_addr,
> +			  .preempt = true,
> +			  .ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, duration_ns),
> +			  .mem_copy = &mem_copy);
> +
> +	/* Run spinner with mem copy and fixed duration */
> +	src.ptr[0] = 0xdeadbeaf;
> +	intel_ctx_xe_exec(ctx, ahnd, spin_addr);
> +	xe_spin_wait_started(spin);
> +	igt_assert_f(!memcmp(mem_copy.src->ptr, mem_copy.dst->ptr, mem_copy.src->size),
> +		     "source and destination differ\n");
> +
> +	/* Cleanup */
> +	xe_vm_unbind_sync(fd, vm, 0, spin_addr, bo_size);
> +	gem_munmap(spin, bo_size);
> +	gem_close(fd, bo);
> +	gem_munmap(mem_copy.dst->ptr, copy_size);
> +	gem_munmap(mem_copy.src->ptr, copy_size);
> +	gem_close(fd, dst_handle);
> +	gem_close(fd, src_handle);
> +	put_ahnd(ahnd);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: spin-mem-copy
> + * Description: Basic test which validates the functionality of xe_spin with
> + *		fixed duration while performing a copy for each provided region
> + */
> +static void xe_spin_mem_copy(int fd, struct drm_xe_engine_class_instance *hwe,
> +			     struct igt_collection *set)
> +{
> +	struct igt_collection *regions;
> +
> +	for_each_variation_r(regions, 1, set) {
> +		uint32_t region = igt_collection_get_value(regions, 0);
> +
> +		xe_spin_mem_copy_region(fd, hwe, region);
> +	}
> +}
> +
>  #define HANG 1
>  static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
>  		       bool flags)
> @@ -430,9 +528,13 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
>  	int gt, class;
> +	struct igt_collection *regions;
>  
> -	igt_fixture
> +	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> +		regions = xe_get_memory_region_set(fd, DRM_XE_MEM_REGION_CLASS_SYSMEM,
> +						   DRM_XE_MEM_REGION_CLASS_VRAM);
> +	}
>  
>  	igt_subtest("spin-basic")
>  		spin_basic(fd);
> @@ -464,6 +566,11 @@ igt_main
>  			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
>  				xe_spin_timestamp_check(fd, hwe);
>  
> +	igt_subtest("spin-mem-copy")
> +		xe_for_each_engine(fd, hwe)
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COPY)
> +				xe_spin_mem_copy(fd, hwe, regions);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> -- 
> 2.43.0
> 
