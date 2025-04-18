Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C331DC369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 14:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FBA10EBAB;
	Fri, 18 Apr 2025 14:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjU1GwK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4949910EBAB
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 14:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744986626; x=1776522626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pWATxfBWFrz8dBRtYg1Hwl2kFR2cqNkRq6tvrrPiNXk=;
 b=hjU1GwK6gFtmV3gyHphkISthdEe6iUnJWgqljtFnkirlD5FEoODnsoB5
 zd0WSG1zciOFwg9WehrlrErKvp1B/hMZcMfcOF/b16YAQEMUrEcOD3fHh
 mF1n3zaR0iYv0tF63Vzc8ZZ7K3ZZb12xSCfKM5dFD/O6oqQf8q3YoZtgx
 OGhDas1e1wTlY5Y4HTuukBcCV9MfjvcAe8w2JPS8vdnKHXe0/6+5pS34W
 XszncaV1DNHrANCB/VzGj2G4gofJg8pHEtf6jIjLRjZxxc/O7dYfOeoha
 wM/bjC7Jzhl6lXhWVWvG3lz2BlEuslgtjeHNc9cz/U+OYHFprH69oSswd A==;
X-CSE-ConnectionGUID: 3ZQDYt+JQryxLrtvb8Xzvg==
X-CSE-MsgGUID: 9bj5OluuQJexscMguAma9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46779042"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="46779042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 07:30:26 -0700
X-CSE-ConnectionGUID: +hD4nElcQaqFj0eWvZe2Ew==
X-CSE-MsgGUID: zUP6uXtHQTGBkIPQlfijtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="131073085"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 07:30:25 -0700
Date: Fri, 18 Apr 2025 16:30:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xm_vm: add coverage for userptr
 transparent huge pages
Message-ID: <20250418143021.oy3zjw2ukfpg3guv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 igt-dev@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250328181937.293014-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328181937.293014-1-matthew.auld@intel.com>
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

Hi Matthew,
On 2025-03-28 at 18:19:37 +0000, Matthew Auld wrote:

small nit in subjetc:

[PATCH i-g-t v2] tests/intel/xm_vm: add coverage for userptr transparent huge pages

s/xm_vm:/xe_vm:/

so it will read:

[PATCH i-g-t v2] tests/intel/xe_vm: add coverage for userptr transparent huge pages

> In particular we are missing something to test partially mapping a
> huge-page, including being misaligned, such that the mm start and end
> address don't sit on the huge-page boundary.
> 
> v2:
>   - Fully expand thp term (Kamil)
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_vm.c | 55 +++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index fdf74c114..af4013f5e 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1281,6 +1281,7 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
>  #define LARGE_BIND_FLAG_MISALIGNED	(0x1 << 0)
>  #define LARGE_BIND_FLAG_SPLIT		(0x1 << 1)
>  #define LARGE_BIND_FLAG_USERPTR		(0x1 << 2)
> +#define LARGE_BIND_FLAG_USERPTR_THP	(0x1 << 3)
>  
>  /**
>   * SUBTEST: %s-%ld
> @@ -1312,6 +1313,9 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
>   * @large-userptr-split-binds: large-userptr-split-binds
>   * @large-userptr-misaligned-binds: large-userptr-misaligned-binds
>   * @large-userptr-split-misaligned-binds: large-userptr-split-misaligned-binds
> + * @large-userptr-thp-split-binds: large-userptr-split-binds with transparent-huge-page
> + * @large-userptr-thp-misaligned-binds: large-userptr-misaligned-binds with transparent-huge-page
> + * @large-userptr-thp-split-misaligned-binds: large-userptr-split-misaligned-binds with transparent-huge-page
>   *
>   * arg[2].values: 2097152, 4194304, 8388608, 16777216, 33554432
>   * arg[2].values: 67108864, 134217728, 268435456, 536870912, 1073741824
> @@ -1363,7 +1367,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  		.num_syncs = 2,
>  		.syncs = to_user_pointer(sync),
>  	};
> -	size_t bo_size_prefetch, padding;
> +	size_t bo_size_prefetch, padding, map_padding = 0;
>  	uint64_t addr = 0x1ull << 30, base_addr = 0x1ull << 30;
>  	uint32_t vm;
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> @@ -1387,8 +1391,23 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  	if (flags & LARGE_BIND_FLAG_USERPTR) {
>  		bo_size_prefetch = xe_bb_size(fd, bo_size);
> -		map = aligned_alloc(xe_get_default_alignment(fd), bo_size_prefetch);
> -		igt_assert(map);
> +
> +		if (flags & LARGE_BIND_FLAG_USERPTR_THP) {
> +			/* Ensure we try to partially map a transparent-huge-page */
> +			if (flags & LARGE_BIND_FLAG_MISALIGNED)
> +				map_padding = xe_get_default_alignment(fd);
> +
> +			map = aligned_alloc(xe_get_default_alignment(fd),
> +					    bo_size_prefetch + map_padding * 2);

Please calculate this for debug printing like:

	size_t align_size = xe_get_default_alignment(fd);
	size_t mem_wanted;
	size_t alloc_size;

	if (flags & LARGE_BIND_FLAG_MISALIGNED)
		map_padding = align_size;

	mem_wanted = bo_size_prefetch + map_padding * 2;
	alloc_size = DIV_ROUND_UP(mem_wanted, align_size) * align_size;
	igt_debug("Transparent huge pages for mem size %dKB padding %dKB\n", alloc_size / 1024, map_padding / 1024);
	map = aligned_alloc(align_size, alloc_size);

Btw in this test you assume that alloc_size should be big, like 2MB?
Or at least larger then PAGE_SIZE (4KB) ?


> +			igt_assert(map);
> +			madvise(map, bo_size_prefetch + map_padding * 2,
> +				MADV_HUGEPAGE);

			ret = madvise(map, alloc_size, MADV_HUGEPAGE);
			igt_assert_eq(ret, 0);


> +			map += map_padding;
> +		} else {
> +			map = aligned_alloc(xe_get_default_alignment(fd),
> +					    bo_size_prefetch);
> +			igt_assert(map);
> +		}
>  	} else {
>  		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
>  			    xe_visible_vram_size(fd, 0));
> @@ -1500,7 +1519,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  		munmap(map, bo_size);
>  		gem_close(fd, bo);
>  	} else {
> -		free(map);
> +		free(map - map_padding);
>  	}
>  	xe_vm_destroy(fd, vm);
>  }
> @@ -2620,6 +2639,34 @@ igt_main
>  						 LARGE_BIND_FLAG_USERPTR);
>  				break;
>  			}
> +		igt_subtest_f("large-userptr-thp-split-binds-%lld",
> +			      (long long)bind_size)
> +			xe_for_each_engine(fd, hwe) {

imho check before starting each test if madvise will return error and
in that case test should skip with message, here and below at other
tests.

void require_madvise_hugepage(void) {
	int ret;

	ret = madvise(0, 0, MADV_HUGEPAGE);
	igt_require(ret == 0, "Madvise hugepage not supported, errno=%d\n", ret);
}

so in each subtest make it like:
		igt_subtest_f("large-userptr-thp-split-binds-%lld",
			      (long long)bind_size)
			{
			require_madvise_hugepage();
			xe_for_each_engine(fd, hwe) {
...

Regards,
Kamil


> +				test_large_binds(fd, hwe, 4, 16, bind_size,
> +						 LARGE_BIND_FLAG_SPLIT |
> +						 LARGE_BIND_FLAG_USERPTR |
> +						 LARGE_BIND_FLAG_USERPTR_THP);
> +				break;
> +			}
> +		igt_subtest_f("large-userptr-thp-misaligned-binds-%lld",
> +			      (long long)bind_size)
> +			xe_for_each_engine(fd, hwe) {
> +				test_large_binds(fd, hwe, 4, 16, bind_size,
> +						 LARGE_BIND_FLAG_MISALIGNED |
> +						 LARGE_BIND_FLAG_USERPTR |
> +						 LARGE_BIND_FLAG_USERPTR_THP);
> +				break;
> +			}
> +		igt_subtest_f("large-userptr-thp-split-misaligned-binds-%lld",
> +			      (long long)bind_size)
> +			xe_for_each_engine(fd, hwe) {
> +				test_large_binds(fd, hwe, 4, 16, bind_size,
> +						 LARGE_BIND_FLAG_SPLIT |
> +						 LARGE_BIND_FLAG_MISALIGNED |
> +						 LARGE_BIND_FLAG_USERPTR |
> +						 LARGE_BIND_FLAG_USERPTR_THP);
> +				break;
> +			}
>  	}
>  
>  	bind_size = (0x1ull << 21) + (0x1ull << 20);
> -- 
> 2.48.1
> 
