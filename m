Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB46C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 07:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB2C10E12D;
	Fri, 22 Mar 2024 07:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwMKTb61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7794F10F001
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711093135; x=1742629135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6ksRO9X+Wuar1hKJvmaTMhYIYGtFtP0CIYtGH7wvq0w=;
 b=MwMKTb6139K9grHacfT0op3/cz+59UN0AavxUhVqrjpwvdrXmMfJl9z4
 zBlRQYKT/VQUBfEi9MjQIW8/P4MoXVnCx3TzLn2t8DeoIYUoUUMsYn9ih
 sT1i4BMAKIAylWWR9z41PYHQiKJLdb8vVAYj3Bzliz7k4a3y/y5cV0xYY
 kW/NIxc9xcm8HKWiG4p8CKnyV2KZ66ChOHuBwma92lYDiPPeqxuXElUSe
 MPNUreefr8LSKkPu+03+5V8wAbbcp+0tkBTKWXV7T8TlOzqZdRM3DUmwa
 eH7OibKSXL6sv/l4lWZTVkqMK4fe/BYschIES4OZ/Ucz+JiiTxQ9W5VgN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9078759"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9078759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 00:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="15449578"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 00:38:53 -0700
Date: Fri, 22 Mar 2024 08:38:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 02/24] tests/intel: Introduce Memory management
 subcategory
Message-ID: <20240322073831.7xzfcmdzjo7p6m2q@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
 <20240321153847.1787625-3-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240321153847.1787625-3-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-21 at 15:38:25 +0000, Katarzyna Piecielska wrote:
> Let's add Memory management subcategory for tests that are validating
> memory.
> 
> Change subcategory s/i915/Memory management/ for tests:
>  - gem_lmem_swapping.c
>  - gem_madvise.c
> 
> v2: Make Sub-category/Functionality/Feature unique (Kamil)
> v3: Put caching related tests to memory management
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/drm_mm.c                               | 2 +-
>  tests/intel/gem_caching.c                    | 6 +++---
>  tests/intel/gem_close.c                      | 2 +-
>  tests/intel/gem_cs_tlb.c                     | 4 ++--
>  tests/intel/gem_gtt_cpu_tlb.c                | 3 +++
>  tests/intel/gem_gtt_hog.c                    | 3 +++
>  tests/intel/gem_gtt_speed.c                  | 3 +++
>  tests/intel/gem_lmem_evict.c                 | 3 +++
>  tests/intel/gem_lmem_swapping.c              | 2 +-
>  tests/intel/gem_madvise.c                    | 2 +-
>  tests/intel/gem_mmap.c                       | 3 +++
>  tests/intel/gem_mmap_gtt.c                   | 3 +++
>  tests/intel/gem_mmap_offset.c                | 2 +-
>  tests/intel/gem_mmap_wc.c                    | 3 +++
>  tests/intel/gem_read_read_speed.c            | 3 +++
>  tests/intel/gem_readwrite.c                  | 3 +++
>  tests/intel/gem_set_tiling_vs_gtt.c          | 3 +++
>  tests/intel/gem_set_tiling_vs_pwrite.c       | 3 +++
>  tests/intel/gem_streaming_writes.c           | 3 +++
>  tests/intel/gem_tiled_blits.c                | 3 +++
>  tests/intel/gem_tiled_fence_blits.c          | 3 +++
>  tests/intel/gem_tiled_partial_pwrite_pread.c | 3 +++
>  tests/intel/gem_tiled_pread_basic.c          | 3 +++
>  tests/intel/gem_tiled_pread_pwrite.c         | 3 +++
>  tests/intel/gem_tiled_swapping.c             | 3 +++
>  tests/intel/gem_tiled_wb.c                   | 3 +++
>  tests/intel/gem_tiled_wc.c                   | 3 +++
>  tests/intel/gem_tiling_max_stride.c          | 3 +++
>  tests/intel/gem_unfence_active_buffers.c     | 5 ++++-
>  tests/intel/i915_fb_tiling.c                 | 3 +++
>  tests/intel/prime_busy.c                     | 2 +-
>  tests/intel/prime_mmap.c                     | 4 ++--
>  tests/intel/prime_mmap_coherency.c           | 4 ++--
>  tests/intel/prime_self_import.c              | 9 ++-------
>  34 files changed, 87 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index f2e6c6cd1..9319558db 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -28,7 +28,7 @@
>   * Description: Basic sanity check of DRM's range manager (struct drm_mm)
>   * Feature: mapping
>   * Category: Infrastructure
> - * Functionality: DRM memory mangemnt
> + * Functionality: DRM
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   * Run type: FULL
> diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
> index 4a8f69e97..c3311e9ec 100644
> --- a/tests/intel/gem_caching.c
> +++ b/tests/intel/gem_caching.c
> @@ -44,10 +44,10 @@
>   * TEST: gem caching
>   * Category: Desktop client
>   * Description: Test snoop consistency when touching partial cachelines.
> - * Feature: caching
> - * Functionality: data coherency
> + * Feature: caching feature
> + * Functionality: coherency
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: read-writes
> diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
> index 20aff600d..91cda5bdc 100644
> --- a/tests/intel/gem_close.c
> +++ b/tests/intel/gem_close.c
> @@ -31,7 +31,7 @@
>   * Feature: mapping
>   * Functionality: driver handler
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
> index 2c7781d06..f9bd86785 100644
> --- a/tests/intel/gem_cs_tlb.c
> +++ b/tests/intel/gem_cs_tlb.c
> @@ -57,9 +57,9 @@
>   * Category: Infrastructure
>   * Description: Check whether we correctly invalidate the cs tlb.
>   * Feature: mapping
> - * Functionality: command submission
> + * Functionality: tlb
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
> diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.c
> index 155aa6516..760e0a4ac 100644
> --- a/tests/intel/gem_gtt_cpu_tlb.c
> +++ b/tests/intel/gem_gtt_cpu_tlb.c
> @@ -47,6 +47,9 @@
>   * TEST: gem gtt cpu tlb
>   * Description: Check whether gtt tlbs for cpu access are correctly invalidated.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: mmap
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
> index 1227c7633..247b31da5 100644
> --- a/tests/intel/gem_gtt_hog.c
> +++ b/tests/intel/gem_gtt_hog.c
> @@ -44,6 +44,9 @@
>  #include "igt.h"
>  /**
>   * TEST: gem gtt hog
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: gtt
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c
> index c85c359a0..6cc34ce87 100644
> --- a/tests/intel/gem_gtt_speed.c
> +++ b/tests/intel/gem_gtt_speed.c
> @@ -44,6 +44,9 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem gtt speed
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: gtt
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
> index a3ca2c861..1574bbb9f 100644
> --- a/tests/intel/gem_lmem_evict.c
> +++ b/tests/intel/gem_lmem_evict.c
> @@ -11,6 +11,9 @@
>   * TEST: gem lmem evict
>   * Description: Force tiny lmem size for easily testing eviction scenarios.
>   * Feature: local_memory
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: local memory eviction
>   * Run type: FULL
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> index 451d55423..d38a04673 100644
> --- a/tests/intel/gem_lmem_swapping.c
> +++ b/tests/intel/gem_lmem_swapping.c
> @@ -30,7 +30,7 @@
>   * Description: Exercise local memory swapping.
>   * Feature: local_memory
>   * Functionality: buffer management
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
> index b443d16ae..c8aa71c1b 100644
> --- a/tests/intel/gem_madvise.c
> +++ b/tests/intel/gem_madvise.c
> @@ -44,7 +44,7 @@
>   * Description: Checks that the kernel reports EFAULT when trying to use purged bo.
>   * Feature: caching, mapping
>   * Functionality: buffer management
> - * Sub-category: i915
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
> index a7c5f0bce..c64c8f52a 100644
> --- a/tests/intel/gem_mmap.c
> +++ b/tests/intel/gem_mmap.c
> @@ -42,6 +42,9 @@
>   * TEST: gem mmap
>   * Description: Basic MMAP IOCTL tests for memory regions.
>   * Feature: mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: mmap
>   * Run type: FULL
>   *
>   * SUBTEST: bad-object
> diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
> index 9aecd08ce..8d04188f7 100644
> --- a/tests/intel/gem_mmap_gtt.c
> +++ b/tests/intel/gem_mmap_gtt.c
> @@ -50,6 +50,9 @@
>   * TEST: gem mmap gtt
>   * Description: Ensure that all operations around MMAP_GTT ioctl works.
>   * Feature: gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: map gtt
>   * Run type: FULL
>   *
>   * SUBTEST: bad-object
> diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
> index b069b80f6..b1134afb4 100644
> --- a/tests/intel/gem_mmap_offset.c
> +++ b/tests/intel/gem_mmap_offset.c
> @@ -42,7 +42,7 @@
>   * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
>   * Category: Infrastructure
>   * Feature: mapping
> - * Functionality: mapping
> + * Functionality: mmap
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   * Run type: FULL
> diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
> index a82d779f9..766ee61fc 100644
> --- a/tests/intel/gem_mmap_wc.c
> +++ b/tests/intel/gem_mmap_wc.c
> @@ -42,6 +42,9 @@
>  /**
>   * TEST: gem mmap wc
>   * Feature: caching, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: cache
>   * Run type: FULL
>   *
>   * SUBTEST: bad-object
> diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
> index 95ef47da6..dde021f22 100644
> --- a/tests/intel/gem_read_read_speed.c
> +++ b/tests/intel/gem_read_read_speed.c
> @@ -45,6 +45,9 @@
>  /**
>   * TEST: gem read read speed
>   * Description: Test speed of concurrent reads between engines.
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: read/write memory
>   * Run type: FULL
>   *
>   * SUBTEST: read-read-1024x1024
> diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
> index 864a2d8d8..545e97f17 100644
> --- a/tests/intel/gem_readwrite.c
> +++ b/tests/intel/gem_readwrite.c
> @@ -41,6 +41,9 @@
>  /**
>   * TEST: gem readwrite
>   * Feature: mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: read/write memory
>   * Run type: FULL
>   *
>   * SUBTEST: beyond-EOB
> diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/gem_set_tiling_vs_gtt.c
> index 4a7ecdc88..7e5dab1fa 100644
> --- a/tests/intel/gem_set_tiling_vs_gtt.c
> +++ b/tests/intel/gem_set_tiling_vs_gtt.c
> @@ -42,6 +42,9 @@
>   * TEST: gem set tiling vs gtt
>   * Description: Check set_tiling vs gtt mmap coherency.
>   * Feature: gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling vs gtt coherency
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/gem_set_tiling_vs_pwrite.c
> index ede0c58b6..a358ddba6 100644
> --- a/tests/intel/gem_set_tiling_vs_pwrite.c
> +++ b/tests/intel/gem_set_tiling_vs_pwrite.c
> @@ -42,6 +42,9 @@
>   * TEST: gem set tiling vs pwrite
>   * Description: Check set_tiling vs pwrite coherency.
>   * Feature: gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling vs pwrite coherency
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
> index fc2d3d89f..dd2f28331 100644
> --- a/tests/intel/gem_streaming_writes.c
> +++ b/tests/intel/gem_streaming_writes.c
> @@ -43,6 +43,9 @@
>  /**
>   * TEST: gem streaming writes
>   * Description: Test of streaming writes into active GPU sources
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: barrier
>   * Run type: FULL
>   *
>   * SUBTEST: batch-cpu
> diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
> index 27971a2b9..ec6e88477 100644
> --- a/tests/intel/gem_tiled_blits.c
> +++ b/tests/intel/gem_tiled_blits.c
> @@ -58,6 +58,9 @@
>   * TEST: gem tiled blits
>   * Description: Test doing many tiled blits, with a working set larger than the aperture size.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled blits
>   * Run type: FULL
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
> index c536c3699..920eeb42d 100644
> --- a/tests/intel/gem_tiled_fence_blits.c
> +++ b/tests/intel/gem_tiled_fence_blits.c
> @@ -51,6 +51,9 @@
>   *   Tests fence management problems related to tiled blits by performing many blits on tiled
>   *   buffer objects with fences enabled and with working set larger than the aperture size.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled blits
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality.
> diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
> index d4f66d51e..c4686739e 100644
> --- a/tests/intel/gem_tiled_partial_pwrite_pread.c
> +++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
> @@ -42,6 +42,9 @@
>   * TEST: gem tiled partial pwrite pread
>   * Description: Test pwrite/pread consistency when touching partial cachelines.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: FULL
>   *
>   * SUBTEST: reads
> diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
> index a2253b51e..13181d86c 100644
> --- a/tests/intel/gem_tiled_pread_basic.c
> +++ b/tests/intel/gem_tiled_pread_basic.c
> @@ -52,6 +52,9 @@
>   * TEST: gem tiled pread basic
>   * Description: Test pread behavior on tiled objects with respect to the reported swizzling value.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: BAT
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/gem_tiled_pread_pwrite.c
> index 2f0f6f547..f8bc79731 100644
> --- a/tests/intel/gem_tiled_pread_pwrite.c
> +++ b/tests/intel/gem_tiled_pread_pwrite.c
> @@ -62,6 +62,9 @@
>   * TEST: gem tiled pread pwrite
>   * Description: Test swizzling by testing pwrite does the inverse of pread.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiled pread/pwrite
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
> index 90ce70bdb..13f9fb41f 100644
> --- a/tests/intel/gem_tiled_swapping.c
> +++ b/tests/intel/gem_tiled_swapping.c
> @@ -62,6 +62,9 @@
>   * TEST: gem tiled swapping
>   * Description: Exercise swizzle code for swapping.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: swapping
>   * Run type: FULL
>   *
>   * SUBTEST: non-threaded
> diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
> index 6a8b79ecc..ee17b587d 100644
> --- a/tests/intel/gem_tiled_wb.c
> +++ b/tests/intel/gem_tiled_wb.c
> @@ -51,6 +51,9 @@
>   *   This is a test of write-combining mmap's behavior on tiled objects with respect to the reported
>   *   swizzling value.
>   * Feature: caching, gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: cache
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
> index 1994453b3..356b48829 100644
> --- a/tests/intel/gem_tiled_wc.c
> +++ b/tests/intel/gem_tiled_wc.c
> @@ -48,6 +48,9 @@
>  /**
>   * TEST: gem tiled wc
>   * Feature: caching, gtt
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: cache
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
> index 5943ed93f..93b89b00e 100644
> --- a/tests/intel/gem_tiling_max_stride.c
> +++ b/tests/intel/gem_tiling_max_stride.c
> @@ -43,6 +43,9 @@
>   * TEST: gem tiling max stride
>   * Description: Check that max fence stride works.
>   * Feature: gtt, mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: fences
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/gem_unfence_active_buffers.c
> index d3bc1cee6..081e4631f 100644
> --- a/tests/intel/gem_unfence_active_buffers.c
> +++ b/tests/intel/gem_unfence_active_buffers.c
> @@ -55,7 +55,10 @@
>  /**
>   * TEST: gem unfence active buffers
>   * Description: Check for use-after-free in the fence stealing code.
> - * Feature: synchronization
> + * Feature: synchronization feature
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: fences
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
> index 14c17b030..e1dc54cc5 100644
> --- a/tests/intel/i915_fb_tiling.c
> +++ b/tests/intel/i915_fb_tiling.c
> @@ -27,6 +27,9 @@
>   * TEST: i915 fb tiling
>   * Description: Object tiling must be fixed after framebuffer creation.
>   * Feature: mapping
> + * Sub-category: Memory management
> + * Category: Desktop client
> + * Functionality: tiling
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
> index 90d79864f..79f5922a9 100644
> --- a/tests/intel/prime_busy.c
> +++ b/tests/intel/prime_busy.c
> @@ -33,7 +33,7 @@
>   * Feature: prime
>   * Functionality: buffer management
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: after
> diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
> index 25b2939e9..e0735496a 100644
> --- a/tests/intel/prime_mmap.c
> +++ b/tests/intel/prime_mmap.c
> @@ -54,9 +54,9 @@
>   * TEST: prime mmap
>   * Category: Infrastructure
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime mmap
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: test_aperture_limit
> diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
> index 01eb2002d..61bc5d312 100644
> --- a/tests/intel/prime_mmap_coherency.c
> +++ b/tests/intel/prime_mmap_coherency.c
> @@ -38,9 +38,9 @@
>   *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bugs so we know for sure where
>   *   we need the sync ioctls.
>   * Feature: prime
> - * Functionality: memory management
> + * Functionality: prime mmap
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: ioctl-errors
> diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
> index 2dbf4e20f..e1dcebfd8 100644
> --- a/tests/intel/prime_self_import.c
> +++ b/tests/intel/prime_self_import.c
> @@ -51,32 +51,27 @@
>   * Description: Check whether prime import/export works on the same device... but with different fds.
>   * Feature: prime
>   * Functionality: buffer management
> - * Sub-category: DRM
> + * Sub-category: Memory management
>   * Test category: GEM_Legacy
> + * Run type: BAT
>   *
>   * SUBTEST: basic-llseek-bad
>   * Description: Check dmabuf llseek support with invalid values.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-llseek-size
>   * Description: Check dmabuf llseek support.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_fd_dup
>   * Description: Check prime export with duplicate fd.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_one_bo
>   * Description: Check prime import/export with one buffer object.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_one_bo_two_files
>   * Description: Check prime/flink with one buffer object.
> - * Run type: BAT
>   *
>   * SUBTEST: basic-with_two_bos
>   * Description: Check prime import/export with two buffer objects.
> - * Run type: BAT
>   *
>   * SUBTEST: export-vs-gem_close-race
>   * Description: Check race of gem close against prime export.
> -- 
> 2.34.1
> 
