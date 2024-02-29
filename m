Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6084DC54E41
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 17:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0672410E1B9;
	Thu, 29 Feb 2024 17:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAxDEd46";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D2010E1B9
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 17:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709226452; x=1740762452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fxq5sB+k6pEVt6tKY9guQSaU5tiCNhpNA9u0okRoiqc=;
 b=SAxDEd46sd8cm0PDozU/BM99S15ClEePKoOK44AIa4MhAttcwRpF+Yke
 orzHEVv/E4W6/UQkia3PYeBsKHZevZXRjEQu5OyDCrffuUjR+GpsKqQul
 /6M/zDemuzxiZUsPs5RC/vZoW1XyL7IBJ2zEG9OgfYljRPTRf3Tcvtg1S
 FXGEeDBq5a1/Ifr2R0HIbyH5/9jm//kzzT13J1pVTehcHbrLwuSl/qTyS
 TVT+ScodSkcSww00i+kWy5qpeBNcMPcFhWZW7AKpgcM4rwuw5Rs9D/1Ln
 6GrQwmlAto2M6i6nQ8zZKMHhMQcCkVCTBAM2BvjYNUdewnyxSIpYrKmhz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3831353"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3831353"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7838125"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:07:27 -0800
Date: Thu, 29 Feb 2024 18:07:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 5/5] Documentation refactoring part 5
Message-ID: <20240229170707.saagrhecwwbot66q@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240229111909.588400-1-katarzyna.piecielska@intel.com>
 <20240229111909.588400-6-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229111909.588400-6-katarzyna.piecielska@intel.com>
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
On 2024-02-29 at 11:19:09 +0000, Katarzyna Piecielska wrote:
> Unify documentation for Intel i915 tests that we have by  moving
> common parts to be available for all tests.
> 
> This is part 5 to make review easier.

With the same corrections as in previous:

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_mmap.c                 |  34 ++--
>  tests/intel/gem_partial_pwrite_pread.c |  48 ++---
>  tests/intel/gem_render_linear_blits.c  |   4 +-
>  tests/intel/gem_render_tiled_blits.c   |  17 +-
>  tests/intel/gem_tiled_blits.c          |   3 +-
>  tests/intel/gem_userptr_blits.c        | 247 +------------------------
>  tests/intel/gem_wait.c                 |  34 +---
>  tests/intel/gem_workarounds.c          |  43 +----
>  tests/intel/i915_module_load.c         |  23 +--
>  tests/intel/i915_pm_rc6_residency.c    |   6 +-
>  tests/intel/i915_pm_rpm.c              |  50 +----
>  tests/intel/i915_pm_rps.c              |  34 +---
>  tests/intel/i915_query.c               |  52 +-----
>  tests/intel/i915_suspend.c             |  31 +---
>  tests/intel/perf.c                     |  54 +-----
>  tests/intel/perf_pmu.c                 |  73 +-------
>  tests/intel/sysfs_heartbeat_interval.c |   6 +-
>  tests/intel/sysfs_preempt_timeout.c    |  15 +-
>  tests/intel/sysfs_timeslice_duration.c |  17 +-
>  tests/prime_vgem.c                     |  57 +-----
>  tests/vgem_basic.c                     |  30 +--
>  21 files changed, 123 insertions(+), 755 deletions(-)
> 
> diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
> index d4ca1eda7..a7c5f0bce 100644
> --- a/tests/intel/gem_mmap.c
> +++ b/tests/intel/gem_mmap.c
> @@ -42,58 +42,50 @@
>   * TEST: gem mmap
>   * Description: Basic MMAP IOCTL tests for memory regions.
>   * Feature: mapping
> + * Run type: FULL
>   *
>   * SUBTEST: bad-object
>   * Description: Verify mapping to invalid gem objects won't be created.
> - * Run type: FULL
>   *
>   * SUBTEST: bad-offset
>   * Description: Verify mapping to gem object with invalid offset won't be created.
> - * Run type: FULL
>   *
>   * SUBTEST: bad-size
>   * Description: Verify mapping to gem object with invalid size won't be created.
> - * Run type: FULL
>   *
>   * SUBTEST: basic
>   * Description:
> - *   Test basics of newly mapped gem object like default content, write and read coherency,
> - *   mapping existence after gem_close and unmapping.
> + *   Test basics of newly mapped gem object like default content, write and read
> + *   coherency, mapping existence after gem_close and unmapping.
>   * Run type: BAT
>   *
>   * SUBTEST: basic-small-bo
>   * Description:
> - *   Test the write read coherency and simultaneous access of different pages of a small buffer
> - *   object.
> - * Run type: FULL
> + *   Test the write read coherency and simultaneous access of different pages
> + *   of a small buffer object.
>   *
>   * SUBTEST: big-bo
>   * Description:
> - *   Test the write read coherency and simultaneous access of different pages of a big buffer
> - *   object.
> - * Run type: FULL
> + *   Test the write read coherency and simultaneous access of different pages
> + *   of a big buffer object.
>   *
>   * SUBTEST: huge-bo
>   * Description:
> - *   Test the write read coherency and simultaneous access of different pages of a huge buffer
> - *   object.
> - * Run type: FULL
> + *   Test the write read coherency and simultaneous access of different pages
> + *   of a huge buffer object.
>   *
>   * SUBTEST: pf-nonblock
>   * Description:
> - *   Verify that GTT page faults are asynchronous to GPU rendering and completes within a
> - *   specific time.
> - * Run type: FULL
> + *   Verify that GTT page faults are asynchronous to GPU rendering and completes
> + *   within a specific time.
>   *
>   * SUBTEST: short-mmap
>   * Description: Map small buffer object though direct CPU access, bypassing GPU.
> - * Run type: FULL
>   *
>   * SUBTEST: swap-bo
>   * Description:
> - *   Test the write read coherency and simultaneous access of different pages while swapping
> - *   buffer object.
> - * Run type: FULL
> + *   Test the write read coherency and simultaneous access of different pages
> + *   while swapping buffer object.
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic MMAP IOCTL tests for memory regions.");
> diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
> index 659a96b6e..9a5855752 100644
> --- a/tests/intel/gem_partial_pwrite_pread.c
> +++ b/tests/intel/gem_partial_pwrite_pread.c
> @@ -46,59 +46,63 @@
>   *
>   * SUBTEST: reads
>   * Description:
> - *   Verify if pread is consistent while accessing partial cachelines with default caching
> - *   level
> + *   Verify if pread is consistent while accessing partial cachelines with
> + *   default caching level
>   *
>   * SUBTEST: reads-display
>   * Description:
> - *   Verify if pread is consistent while accessing partial cachelines with display caching
> - *   level
> + *   Verify if pread is consistent while accessing partial cachelines with
> + *   display caching level
>   *
>   * SUBTEST: reads-snoop
> - * Description: Verify if pread is consistent while accessing partial cachelines with snoop caching level
> + * Description:
> + *   Verify if pread is consistent while accessing partial cachelines
> + *   with snoop caching level
>   *
>   * SUBTEST: reads-uncached
>   * Description:
> - *   Verify if pread is consistent while accessing partial cachelines with uncached caching
> - *   level
> + *   Verify if pread is consistent while accessing partial cachelines with
> + *   uncached caching level
>   *
>   * SUBTEST: write
>   * Description:
> - *   Verify if pwrite is consistent while accessing partial cachelines with default caching
> - *   level
> + *   Verify if pwrite is consistent while accessing partial cachelines with
> + *   default caching level
>   *
>   * SUBTEST: write-display
>   * Description:
> - *   Verify if pwrite is consistent while accessing partial cachelines with display caching
> - *   level
> + *   Verify if pwrite is consistent while accessing partial cachelines with
> + *   display caching level
>   *
>   * SUBTEST: write-snoop
> - * Description: Verify if pwrite is consistent while accessing partial cachelines with snoop caching level
> + * Description:
> + *   Verify if pwrite is consistent while accessing partial
> + *   cachelines with snoop caching level
>   *
>   * SUBTEST: write-uncached
>   * Description:
> - *   Verify if pwrite is consistent while accessing partial cachelines with uncached caching
> - *   level
> + *   Verify if pwrite is consistent while accessing partial cachelines with
> + *   uncached caching level
>   *
>   * SUBTEST: writes-after-reads
>   * Description:
> - *   Verify if both pread, pwrite are consistent while accessing partial cachelines with
> - *   default caching level
> + *   Verify if both pread, pwrite are consistent while accessing partial
> + *   cachelines with default caching level
>   *
>   * SUBTEST: writes-after-reads-display
>   * Description:
> - *   Verify if both pread, pwrite are consistent while accessing partial cachelines with
> - *   display caching level
> + *   Verify if both pread, pwrite are consistent while accessing partial
> + *   cachelines with display caching level
>   *
>   * SUBTEST: writes-after-reads-snoop
>   * Description:
> - *   Verify if both pread, pwrite are consistent while accessing partial cachelines with snoop
> - *   caching level
> + *   Verify if both pread, pwrite are consistent while accessing partial
> + *   cachelines with snoop caching level
>   *
>   * SUBTEST: writes-after-reads-uncached
>   * Description:
> - *   Verify if both pread, pwrite are consistent while accessing partial cachelines with
> - *   uncached caching level
> + *   Verify if both pread, pwrite are consistent while accessing partial
> + *   cachelines with uncached caching level
>   */
>  
>  IGT_TEST_DESCRIPTION("Test pwrite/pread consistency when touching partial"
> diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
> index 1fcfb019b..61ec1593f 100644
> --- a/tests/intel/gem_render_linear_blits.c
> +++ b/tests/intel/gem_render_linear_blits.c
> @@ -52,18 +52,16 @@
>  /**
>   * TEST: gem render linear blits
>   * Feature: mapping
> + * Run type: FULL
>   *
>   * SUBTEST: aperture-shrink
> - * Run type: FULL
>   *
>   * SUBTEST: aperture-thrash
> - * Run type: FULL
>   *
>   * SUBTEST: basic
>   * Run type: BAT
>   *
>   * SUBTEST: swap-thrash
> - * Run type: FULL
>   */
>  
>  #define WIDTH 512
> diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
> index ba9e62a25..a25ea0812 100644
> --- a/tests/intel/gem_render_tiled_blits.c
> +++ b/tests/intel/gem_render_tiled_blits.c
> @@ -51,19 +51,19 @@
>  /**
>   * TEST: gem render tiled blits
>   * Description:
> - *   Tests performs cyclic forward, backward and random blits on tiled buffer objects using render
> - *   engine with various working set sizes and compares outputs with expected ones.
> + *   Tests performs cyclic forward, backward and random blits on tiled buffer
> + *   objects using render engine with various working set sizes and compares
> + *   outputs with expected ones.
>   * Feature: mapping
> + * Run type: FULL
>   *
>   * SUBTEST: aperture-shrink
>   * Description:
> - *   Check with working set size larger than aperture size and a helper process to shrink buffer
> - *   object caches.
> - * Run type: FULL
> + *   Check with working set size larger than aperture size and a helper process
> + *   to shrink buffer object caches.
>   *
>   * SUBTEST: aperture-thrash
>   * Description: Check with working set size larger than aperture size.
> - * Run type: FULL
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality.
> @@ -71,9 +71,8 @@
>   *
>   * SUBTEST: swap-thrash
>   * Description:
> - *   Check with working set size larger than system memory size resulting in usage and thrashing
> - *   of swap space.
> - * Run type: FULL
> + *   Check with working set size larger than system memory size resulting in
> + *   usage and thrashing of swap space.
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests performs cyclic forward, backward and random blits on tiled buffer "
> diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
> index 072fef3c3..27971a2b9 100644
> --- a/tests/intel/gem_tiled_blits.c
> +++ b/tests/intel/gem_tiled_blits.c
> @@ -58,6 +58,7 @@
>   * TEST: gem tiled blits
>   * Description: Test doing many tiled blits, with a working set larger than the aperture size.
>   * Feature: gtt, mapping
> + * Run type: FULL
>   *
>   * SUBTEST: basic
>   * Description: Check basic functionality.
> @@ -65,11 +66,9 @@
>   *
>   * SUBTEST: interruptible
>   * Description: Check with interrupts in parallel execution.
> - * Run type: FULL
>   *
>   * SUBTEST: normal
>   * Description: Check with parallel execution.
> - * Run type: FULL
>   */
>  
>  IGT_TEST_DESCRIPTION("Test doing many tiled blits, with a working set larger"
> diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
> index 14f833232..3e1f48a4f 100644
> --- a/tests/intel/gem_userptr_blits.c
> +++ b/tests/intel/gem_userptr_blits.c
> @@ -69,171 +69,65 @@
>  #include "intel_blt.h"
>  /**
>   * TEST: gem userptr blits
> - * Run type: FULL
> - *
> - * SUBTEST: access-control
> - * Feature: userptr
> - *
> - * SUBTEST: coherency-sync
> - * Feature: userptr
> - *
> - * SUBTEST: coherency-unsync
> - * Feature: userptr
> - *
> - * SUBTEST: create-destroy-sync
>   * Category: Server
>   * Feature: userptr
>   * Functionality: buffer management
>   * Sub-category: Compute
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
> + * SUBTEST: access-control
> + * SUBTEST: coherency-sync
> + * SUBTEST: coherency-unsync
> + * SUBTEST: create-destroy-sync
>   * SUBTEST: create-destroy-unsync
> - * Feature: userptr
> - *
>   * SUBTEST: dmabuf-sync
> - * Feature: prime, userptr
> - *
>   * SUBTEST: dmabuf-unsync
> - * Feature: prime, userptr
> - *
>   * SUBTEST: forbidden-operations
> - * Feature: userptr
> - *
>   * SUBTEST: forked-access
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-mempressure-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-mempressure-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-multifd-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-multifd-mempressure-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-multifd-mempressure-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-multifd-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-swapping-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-swapping-mempressure-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-swapping-mempressure-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-swapping-multifd-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-swapping-multifd-mempressure-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-swapping-multifd-mempressure-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-swapping-multifd-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-sync-swapping-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-mempressure-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-mempressure-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-multifd-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-multifd-mempressure-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-multifd-mempressure-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-multifd-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-swapping-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-swapping-mempressure-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-swapping-mempressure-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-swapping-multifd-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-swapping-multifd-mempressure-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-swapping-multifd-mempressure-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-swapping-multifd-normal
> - * Feature: userptr
> - *
>   * SUBTEST: forked-unsync-swapping-normal
> - * Feature: userptr
> - *
>   * SUBTEST: huge-split
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: input-checking
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-mmap-offset-unsync
>   * Description: Verify unsynchronized userptr on mmap-offset mappings fails
> - * Feature: userptr
>   *
>   * SUBTEST: invalid-null-pointer
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: major-normal-sync
> - * Feature: userptr
> - *
>   * SUBTEST: major-sync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: major-unsync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: major-unsync-normal
> - * Feature: userptr
>   *
>   * SUBTEST: map-fixed-invalidate
>   * Description: Try to anger lockdep with MMU notifier still active after MAP_FIXED remap
> @@ -252,176 +146,45 @@
>   * Feature: gtt, userptr
>   *
>   * SUBTEST: minor-normal-sync
> - * Feature: userptr
> - *
>   * SUBTEST: minor-sync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: minor-unsync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: minor-unsync-normal
> - * Feature: userptr
> - *
>   * SUBTEST: mlocked-normal-sync
> - * Feature: userptr
> - *
>   * SUBTEST: mlocked-sync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: mlocked-unsync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: mlocked-unsync-normal
> - * Feature: userptr
>   *
>   * SUBTEST: mmap-offset-banned
> - * Category: Server
>   * Description: Verify mmap_offset to userptr is banned
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: nohangcheck
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: probe
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: process-exit
> - * Feature: userptr
> - *
>   * SUBTEST: process-exit-busy
> - * Feature: userptr
> - *
>   * SUBTEST: readonly-pwrite-unsync
> - * Feature: userptr
> - *
>   * SUBTEST: readonly-unsync
> - * Feature: userptr
> - *
>   * SUBTEST: relocations
> - * Feature: userptr
> - *
>   * SUBTEST: sd-probe
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: set-cache-level
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: stress-mm
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: stress-mm-invalidate-close
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: stress-mm-invalidate-close-overlap
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: stress-purge
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: swapping-normal-sync
> - * Feature: userptr
> - *
>   * SUBTEST: swapping-sync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: swapping-unsync-interruptible
> - * Feature: userptr
> - *
>   * SUBTEST: swapping-unsync-normal
> - * Feature: userptr
> - *
>   * SUBTEST: sync-overlap
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: sync-unmap
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: sync-unmap-after-close
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: sync-unmap-cycles
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: unsync-overlap
> - * Feature: userptr
> - *
>   * SUBTEST: unsync-unmap
> - * Feature: userptr
> - *
>   * SUBTEST: unsync-unmap-after-close
> - * Feature: userptr
> - *
>   * SUBTEST: unsync-unmap-cycles
> - * Feature: userptr
> - *
>   * SUBTEST: usage-restrictions
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: userfault
> - * Feature: userptr
> - *
>   * SUBTEST: vma-merge
> - * Category: Server
> - * Feature: userptr
> - * Functionality: buffer management
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
>   */
>  
>  #ifndef PAGE_SIZE
> diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
> index 674deb57d..e2a598c64 100644
> --- a/tests/intel/gem_wait.c
> +++ b/tests/intel/gem_wait.c
> @@ -33,26 +33,21 @@
>  #include "igt_vgem.h"
>  /**
>   * TEST: gem wait
> + * Category: Infrastructure
>   * Description: Tests the GEM_WAIT ioctl
>   * Feature: synchronization
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   * Run type: FULL
>   *
>   * SUBTEST: await
> - * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in await mode.
> - * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: busy
> - * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in busy mode.
> - * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: busy@all
> - * Functionality: semaphore
>   *
>   * SUBTEST: busy@all-engines
>   * Run type: BAT
> @@ -70,45 +65,24 @@
>   * Description: Verify GEM_WAIT functionality in wait-write mode, when hang is allowed.
>   *
>   * SUBTEST: invalid-buf
> - * Category: Infrastructure
>   * Description: Verify that GEM_WAIT called with invalid buffer object will fail.
> - * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-flags
> - * Category: Infrastructure
>   * Description: Verify that GEM_WAIT called with invalid flag will fail.
> - * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait
> - * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in wait mode.
> - * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait@all
> - * Functionality: semaphore
>   *
>   * SUBTEST: wait@all-engines
>   * Run type: BAT
>   *
>   * SUBTEST: write-busy
> - * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in write-busy mode.
> - * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: write-wait
> - * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in write-wait mode.
> - * Functionality: semaphore
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the GEM_WAIT ioctl");
> diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
> index c5ca26c08..d83c0a1db 100644
> --- a/tests/intel/gem_workarounds.c
> +++ b/tests/intel/gem_workarounds.c
> @@ -34,63 +34,28 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem workarounds
> - * Run type: FULL
> - *
> - * SUBTEST: basic-read
>   * Category: Infrastructure
>   * Feature: workarounds
> - * Functionality: context management
> - * Sub-category: HW
> + * Functionality: workarounds
> + * Sub-category: Context
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
> + * SUBTEST: basic-read
>   * SUBTEST: basic-read-context
> - * Category: Infrastructure
> - * Feature: workarounds
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: basic-read-fd
> - * Category: Infrastructure
> - * Feature: workarounds
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: hibernate-resume
>   * Feature: hibernate, workarounds
> - *
>   * SUBTEST: hibernate-resume-context
>   * Feature: hibernate, workarounds
> - *
>   * SUBTEST: hibernate-resume-fd
>   * Feature: hibernate, workarounds
> - *
>   * SUBTEST: reset
> - * Category: Infrastructure
> - * Feature: workarounds
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: reset-context
> - * Category: Infrastructure
> - * Feature: workarounds
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
> - *
>   * SUBTEST: reset-fd
> - * Category: Infrastructure
> - * Feature: workarounds
> - * Functionality: context management
> - * Sub-category: HW
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: suspend-resume
>   * Description: Test to verify gem WA registers during suspend-resume
> - * Feature: suspend, workarounds
> - * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-context
>   * Description: Test to verify gem WA registers during suspend-resume
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
> index 9fffe93d9..b02e3e005 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -25,44 +25,33 @@
>  #include <sys/utsname.h>
>  /**
>   * TEST: i915 module load
> + * Category: Infrastructure
>   * Description: Tests the i915 module loading.
> + * Feature: core
> + * Functionality: driver handler
> + * Sub-category: driver
> + * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: load
> - * Category: Infrastructure
>   * Description: Check if i915 and friends are not yet loaded, then load them.
> - * Feature: core
> - * Functionality: driver handler
>   * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: reload
> - * Category: Infrastructure
>   * Description: Verify the basic functionality of i915 driver after it's reloaded.
>   * Feature: core, sriov-core
> - * Functionality: driver handler
>   * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: reload-no-display
>   * Description: Verify that i915 driver can be successfully loaded with disabled display.
>   * Feature: core, sriov-core
> - * Run type: FULL
>   *
>   * SUBTEST: reload-with-fault-injection
> - * Category: Infrastructure
>   * Description: Verify that i915 driver can be successfully reloaded at least once with fault injection.
>   * Feature: core, sriov-core
> - * Functionality: driver handler
> - * Run type: FULL
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: resize-bar
>   * Description: Check whether lmem bar size can be resized to only supported sizes.
> - * Feature: core
> - * Run type: FULL
>   */
>  
>  #ifdef __linux__
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index e309abcfe..30f57858d 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -43,19 +43,19 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: i915 pm rc6 residency
> + * Feature: GuCRC, pm_rc6
> + * Functionality: rc6
> + * Sub-category: Power management
>   * Run type: FULL
>   *
>   * SUBTEST: media-rc6-accuracy
>   * Feature: pm_rc6
>   *
>   * SUBTEST: rc6-accuracy
> - * Feature: GuCRC, pm_rc6
>   *
>   * SUBTEST: rc6-fence
> - * Feature: GuCRC, pm_rc6
>   *
>   * SUBTEST: rc6-idle
> - * Feature: GuCRC, pm_rc6
>   */
>  
>  #define SLEEP_DURATION 3 /* in seconds */
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 7f64d1069..9fbfac744 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -42,75 +42,31 @@
>  #include <sys/stat.h>
>  /**
>   * TEST: i915 pm rpm
> - *
> - * SUBTEST: debugfs-forcewake-user
>   * Feature: pm_rpm
> + * Functionality: D3 state entry-exit
> + * Test category: pm_rpm
>   * Run type: FULL
>   *
> + * SUBTEST: debugfs-forcewake-user
>   * SUBTEST: debugfs-read
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: gem-evict-pwrite
> - * Feature: gtt, pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: gem-execbuf
> - * Feature: pm_rpm
> - * Run type: FULL
>   *
>   * SUBTEST: gem-execbuf-stress
>   * Description: Validate execbuf submission while exercising rpm suspend/resume cycles.
> - * Feature: pm_rpm
> - * Run type: FULL
>   *
>   * SUBTEST: gem-execbuf-stress-pc8
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: gem-idle
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: gem-mmap-type
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: gem-pread
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: module-reload
> - * Feature: pm_rpm
> - * Run type: BAT
> - *
>   * SUBTEST: reg-read-ioctl
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: sysfs-read
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: system-hibernate
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: system-hibernate-devices
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: system-suspend
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: system-suspend-devices
> - * Feature: pm_rpm
> - * Run type: FULL
> - *
>   * SUBTEST: system-suspend-execbuf
> - * Feature: pm_rpm
> - * Run type: FULL
>   */
>  
>  #if defined(__linux__)
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 3ef5842dd..820edd45e 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -47,58 +47,32 @@
>  /**
>   * TEST: i915 pm rps
>   * Description: Render P-States tests - verify GPU frequency changes
> + * Feature: pm_rps
> + * Test category: pm_rps
> + * Run type: FULL
>   *
>   * SUBTEST: basic-api
> - * Feature: pm_rps
>   * Run type: BAT
>   *
>   * SUBTEST: engine-order
>   * Description:
>   *   Check if context reuse does not affect waitboosting.
>   *   Render P-States tests - verify GPU frequency changes
> - * Feature: pm_rps
> - * Run type: FULL
> - * Test category: pm_rps
>   *
>   * SUBTEST: fence-order
>   * Description:
>   *   Check if the order of fences does not affect waitboosting.
>   *   Render P-States tests - verify GPU frequency changes
>   * Feature: pm_rps, synchronization
> - * Run type: FULL
> - * Test category: pm_rps
>   *
>   * SUBTEST: min-max-config-idle
> - * Feature: pm_rps
> - * Run type: FULL
> - *
>   * SUBTEST: min-max-config-loaded
> - * Feature: pm_rps
> - * Run type: FULL
> - *
>   * SUBTEST: reset
> - * Feature: pm_rps
> - * Run type: FULL
> - *
> - * SUBTEST: waitboost
> - * Feature: pm_rps
> - * Run type: FULL
> - *
>   * SUBTEST: thresholds
> - * Feature: pm_rps
> - * Run type: FULL
> - *
>   * SUBTEST: thresholds-idle
> - * Feature: pm_rps
> - * Run type: FULL
> - *
>   * SUBTEST: thresholds-idle-park
> - * Feature: pm_rps
> - * Run type: FULL
> - *
>   * SUBTEST: thresholds-park
> - * Feature: pm_rps
> - * Run type: FULL
> + * SUBTEST: waitboost
>   */
>  
>  IGT_TEST_DESCRIPTION("Render P-States tests - verify GPU frequency changes");
> diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
> index e9cc49597..557134062 100644
> --- a/tests/intel/i915_query.c
> +++ b/tests/intel/i915_query.c
> @@ -29,90 +29,51 @@
>  #include <limits.h>
>  /**
>   * TEST: i915 query
> + * Category: Infrastructure
>   * Description: Testing the i915 query uAPI.
> + * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: uapi
> + * Test category: GEM_Legacy
>   * Run type: FULL
>   *
>   * SUBTEST: engine-info
> - * Category: Infrastructure
>   * Description: Positive tests for DRM_I915_QUERY_ENGINE_INFO
> - * Feature: gem_core
> - * Functionality: device topology
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: engine-info-invalid
> - * Category: Infrastructure
>   * Description: Negative tests for DRM_I915_QUERY_ENGINE_INFO
> - * Feature: gem_core
> - * Functionality: device topology
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: hwconfig_table
> - * Category: Infrastructure
>   * Description: Test DRM_I915_QUERY_HWCONFIG_BLOB query
> - * Feature: gem_core
> - * Functionality: device topology
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-garbage
> - * Category: Infrastructure
>   * Description: Test response to an invalid query call
> - * Feature: gem_core
> - * Functionality: device topology
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-garbage-items
> - * Category: Infrastructure
>   * Description: Dodgy returned data tests for DRM_I915_QUERY_MEMORY_REGIONS
> - * Feature: gem_core
> - * Functionality: device topology
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-sanity-check
> - * Category: Infrastructure
>   * Description: Basic tests for DRM_I915_QUERY_MEMORY_REGIONS
> - * Feature: gem_core
> - * Functionality: device topology
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-unallocated
>   * Description: Sanity check the region unallocated tracking
> - * Feature: gem_core
>   *
>   * SUBTEST: query-topology-coherent-slice-mask
>   * Description: Compare new DRM_I915_QUERY_TOPOLOGY_INFO query with legacy (sub)slice getparams
> - * Feature: gem_core
>   *
>   * SUBTEST: query-topology-garbage-items
> - * Category: Infrastructure
>   * Description: Test response to invalid DRM_I915_QUERY_TOPOLOGY_INFO query
> - * Feature: gem_core
> - * Functionality: device topology
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> - *
> + * 
>   * SUBTEST: query-topology-kernel-writes
> - * Category: Infrastructure
>   * Description: Guardband test for DRM_I915_QUERY_TOPOLOGY_INFO query
> - * Feature: gem_core
> - * Functionality: device topology
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-topology-known-pci-ids
>   * Description:
>   *   Verify DRM_I915_QUERY_TOPOLOGY_INFO query against hardcoded known values for certain
>   *   platforms
> - * Feature: gem_core
>   *
>   * SUBTEST: query-topology-matches-eu-total
>   * Description: More compare new DRM_I915_QUERY_TOPOLOGY_INFO query with legacy (sub)slice getparams
> - * Feature: gem_core
>   *
>   * SUBTEST: query-topology-unsupported
>   * Description: Verify DRM_I915_QUERY_TOPOLOGY_INFO query fails when it is not supported
> @@ -120,7 +81,6 @@
>   *
>   * SUBTEST: test-query-geometry-subslices
>   * Description: Test DRM_I915_QUERY_GEOMETRY_SUBSLICES query
> - * Feature: gem_core
>   */
>  
>  IGT_TEST_DESCRIPTION("Testing the i915 query uAPI.");
> diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
> index 82cabfa41..4ee815031 100644
> --- a/tests/intel/i915_suspend.c
> +++ b/tests/intel/i915_suspend.c
> @@ -46,71 +46,48 @@
>  #include "igt_device_scan.h"
>  /**
>   * TEST: i915 suspend
> - *
> - * SUBTEST: basic-s2idle-without-i915
> - * Description: Validate suspend-to-idle without i915 module
>   * Feature: suspend
>   * Functionality: s2idle w/o i915
> - * Run type: BAT
>   * Test category: suspend
> + * Run type: FULL
> + *
> + * SUBTEST: basic-s2idle-without-i915
> + * Description: Validate suspend-to-idle without i915 module
>   *
>   * SUBTEST: basic-s3-without-i915
>   * Description:
>   *   Validate S3 without i915 module.
>   *   Validate S3 state without i915 module
> - * Feature: suspend
>   * Run type: BAT
> - * Test category: suspend
>   *
>   * SUBTEST: debugfs-reader
>   * Description: Test debugfs behavior during suspend to idle
> - * Feature: suspend
> - * Run type: FULL
> - * Test category: suspend
>   *
>   * SUBTEST: debugfs-reader-hibernate
> - * Feature: suspend
> - * Run type: FULL
>   *
>   * SUBTEST: fence-restore-tiled2untiled
>   * Feature: gtt, suspend, synchronization
> - * Run type: FULL
>   *
>   * SUBTEST: fence-restore-tiled2untiled-hibernate
>   * Feature: gtt, suspend, synchronization
> - * Run type: FULL
>   *
>   * SUBTEST: fence-restore-untiled
>   * Feature: gtt, suspend, synchronization
> - * Run type: FULL
>   *
>   * SUBTEST: fence-restore-untiled-hibernate
>   * Feature: gtt, suspend, synchronization
> - * Run type: FULL
>   *
>   * SUBTEST: forcewake
>   * Description: Test to prevent GT from suspend by opening forcewake handle
> - * Feature: suspend
> - * Run type: FULL
> - * Test category: suspend
>   *
>   * SUBTEST: forcewake-hibernate
> - * Feature: suspend
> - * Run type: FULL
>   *
>   * SUBTEST: shrink
> - * Feature: suspend
> - * Run type: FULL
>   *
>   * SUBTEST: sysfs-reader
>   * Description: Test sysfs behavior during suspend to idle
> - * Feature: suspend
> - * Run type: FULL
> - * Test category: suspend
>   *
>   * SUBTEST: sysfs-reader-hibernate
> - * Feature: suspend
> - * Run type: FULL
>   */
>  
>  #define OBJECT_SIZE (16*1024*1024)
> diff --git a/tests/intel/perf.c b/tests/intel/perf.c
> index 3565d61cc..e5d3fbd0e 100644
> --- a/tests/intel/perf.c
> +++ b/tests/intel/perf.c
> @@ -48,32 +48,26 @@
>  /**
>   * TEST: perf
>   * Description: Test the i915 perf metrics streaming interface
> + * Feature: i915 streaming interface, oa
> + * Test category: Perf
> + * Functionality: oa
> + * Sub-category: Performance
>   * Run type: FULL
>   *
>   * SUBTEST: blocking
>   * Description: Test blocking read with default hrtimer frequency
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: blocking-parameterized
>   * Description: Test blocking read with different hrtimer frequencies
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: buffer-fill
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: create-destroy-userspace-config
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: disabled-read-error
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: enable-disable
>   * Feature: oa
> @@ -92,8 +86,6 @@
>   *
>   * SUBTEST: gen12-invalid-class-instance
>   * Description: Verify invalid class instance
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: gen12-mi-rpc
>   * Description: Test MI REPORT PERF COUNT for Gen 12
> @@ -101,8 +93,6 @@
>   *
>   * SUBTEST: gen12-oa-tlb-invalidate
>   * Description: Test OA TLB invalidate
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: gen12-unprivileged-single-ctx-counters
>   * Description: Measure performance for a specific context using OAR in Gen 12
> @@ -121,98 +111,66 @@
>   *
>   * SUBTEST: i915-ref-count
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: invalid-create-userspace-config
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-exponent
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-format-id
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-metric-set-id
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: invalid-open-flags
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: invalid-remove-userspace-config
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: low-oa-exponent-permissions
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: mi-rpc
>   * Feature: oa
>   *
>   * SUBTEST: missing-sample-flags
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: non-sampling-read-error
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: non-system-wide-paranoid
>   * Feature: oa
>   *
>   * SUBTEST: non-zero-reason
>   * Description: Test that reason field in OA reports is never 0 on Gen8+
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: oa-exponents
>   * Feature: oa
>   *
>   * SUBTEST: oa-formats
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: per-context-mode-unprivileged
>   * Feature: oa, obsolete
>   *
>   * SUBTEST: polling
>   * Description: Test polled read with default hrtimer frequency
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: polling-parameterized
>   * Description: Test polled read with different hrtimer frequencies
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: polling-small-buf
>   * Description: Test polled read with buffer size smaller than available data
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: rc6-disable
>   * Feature: oa
>   *
>   * SUBTEST: short-reads
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: stress-open-close
>   * Description: Stress tests opening & closing the i915-perf stream in a busy loop
> @@ -220,16 +178,12 @@
>   *
>   * SUBTEST: sysctl-defaults
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   *
>   * SUBTEST: unprivileged-single-ctx-counters
>   * Feature: oa, obsolete
>   *
>   * SUBTEST: whitelisted-registers-userspace-config
>   * Description: Test the i915 perf metrics streaming interface
> - * Feature: i915 streaming interface, oa
> - * Test category: Perf
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 4ae2b60ae..718a3ed37 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -52,87 +52,59 @@
>  /**
>   * TEST: perf pmu
>   * Description: Test the i915 pmu perf interface
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
> + * Sub-category: Performance
> + * Functionality: pmu
>   * Run type: FULL
>   *
>   * SUBTEST: all-busy-check-all
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: all-busy-idle-check-all
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy
>   * Description: Test to ensure gpu is busy when there a workload by reading engine busyness pmu counters
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-accuracy-2
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-accuracy-50
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-accuracy-98
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-check-all
>   * Description: Test to ensure gpu all engines report busy when there is a workload by reading engine busyness pmu counters
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-double-start
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-hang
>   * Description: Test to ensure there is no hanf when all engines are busy
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-idle
>   * Description: Test to ensure gpu engine reports idle when there is no workload
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-idle-check-all
>   * Description: Test to ensure gpu all engine reports idle when there is no workload
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-idle-no-semaphores
>   * Description: Test to verify gpu idle through engine business pmu counters
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-no-semaphores
>   * Description: Test to verify gpu busyness through engine business pmu counters
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: busy-start
>   * Description: Test to verify gpu busyness through engine business pmu counters
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: cpu-hotplug
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: enable-race
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: event-wait
>   * Feature: obsolete, pmu
> @@ -142,83 +114,52 @@
>   *
>   * SUBTEST: frequency
>   * Description: Read requested freq and actual frequency via PMU within specified time interval for any given workload changes
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: gt-awake
>   * Description: Setup workload on all engines,measure gt awake time via pmu
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: idle
>   * Description: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: idle-no-semaphores
>   * Description: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: init-busy
>   * Description: Test to verify gpu busyness init through pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: init-sema
>   * Description: Test to verify gpu busyness init through pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: init-wait
>   * Description: Test to verify gpu busyness init through pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: interrupts
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: interrupts-sync
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: invalid-init
>   * Description: Tests that i915 PMU corectly errors out in invalid initialization
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: invalid-open
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: module-unload
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: most-busy-check-all
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: most-busy-idle-check-all
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: multi-client
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: pmu-read
>   * Description: Verify i915 pmu dir exists and read all events
>   * Feature: pmu
> - * Test category: Perf
>   *
>   * SUBTEST: rc6
>   * Feature: pmu
> @@ -237,18 +178,12 @@
>   *
>   * SUBTEST: semaphore-busy
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: semaphore-wait
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   *
>   * SUBTEST: semaphore-wait-idle
>   * Description: Test the i915 pmu perf interface
> - * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
> diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
> index 22c5888c6..09dbc4129 100644
> --- a/tests/intel/sysfs_heartbeat_interval.c
> +++ b/tests/intel/sysfs_heartbeat_interval.c
> @@ -44,31 +44,27 @@
>  /**
>   * TEST: sysfs heartbeat interval
>   * Feature: SMI, cmd_submission
> + * Test category: SysMan
>   * Run type: FULL
>   *
>   * SUBTEST: idempotent
>   * Description: Test to check whether the heartbeat parameter reports the values set.
> - * Test category: SysMan
>   *
>   * SUBTEST: invalid
>   * Description: Test to check if heartbeat parameter rejects any unrepresentable intervals.
> - * Test category: SysMan
>   *
>   * SUBTEST: long
>   *
>   * SUBTEST: mixed
>   * Description: Run a mixed workload with non-preemptable hogs that exceed the heartbeat, and quicker innocents. Inspect the fence status of each to verify that only the hogs are reset.
> - * Test category: SysMan
>   *
>   * SUBTEST: nopreempt
>   * Description: Test heartbeats with forced preemption disabled.
> - * Test category: SysMan
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: precise
>   * Description: Tests the heartbeats with preemption and heartbeat parameter enabled.
> - * Test category: SysMan
>   */
>  
>  #define ATTR "heartbeat_interval_ms"
> diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
> index 964b78ae8..606491c34 100644
> --- a/tests/intel/sysfs_preempt_timeout.c
> +++ b/tests/intel/sysfs_preempt_timeout.c
> @@ -43,21 +43,24 @@
>  /**
>   * TEST: sysfs preempt timeout
>   * Feature: SMI, context
> + * Test category: SysMan
>   * Run type: FULL
>   *
>   * SUBTEST: idempotent
> - * Description: Test to check whether the preempt_timeout parameter reports the values set.
> - * Test category: SysMan
> + * Description: Test to check whether the preempt_timeout parameter reports the
> + *		values set.
>   *
>   * SUBTEST: invalid
> - * Description: Test to check if preempt_timeout parameter rejects any unrepresentable intervals.
> - * Test category: SysMan
> + * Description: Test to check if preempt_timeout parameter rejects any
> + *		unrepresentable intervals.
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: timeout
> - * Description: Test to measure the delay from requestion the preemption to its completion. Send down some non-preemptable workloads and then request a switch to a higher priority context. The HW will not be able to respond, so the kernel will be forced to reset the hog.
> - * Test category: SysMan
> + * Description: Test to measure the delay from requestion the preemption to its
> + *		completion. Send down some non-preemptable workloads and then
> + *		request a switch to a higher priority context. The HW will not
> + *		be able to respond, so the kernel will be forced to reset the hog.
>   */
>  
>  #define ATTR "preempt_timeout_ms"
> diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
> index fc2b14e16..cceac94f2 100644
> --- a/tests/intel/sysfs_timeslice_duration.c
> +++ b/tests/intel/sysfs_timeslice_duration.c
> @@ -46,25 +46,28 @@
>  /**
>   * TEST: sysfs timeslice duration
>   * Feature: SMI, cmd_submission
> + * Test category: SysMan
>   * Run type: FULL
>   *
>   * SUBTEST: duration
> - * Description: Test to measure the timeslice duration by watching the xCS_TIMESTAMP and recording its value every time we switch into the context, using a couple of semaphores to busyspin for the timeslice.
> - * Test category: SysMan
> + * Description: Test to measure the timeslice duration by watching the
> + *		xCS_TIMESTAMP and recording its value every time we switch
> + *		into the context, using a couple of semaphores to busyspin for
> + *		the timeslice.
>   *
>   * SUBTEST: idempotent
>   * Description: Test to check whether timeslice parameter reports the values set.
> - * Test category: SysMan
>   *
>   * SUBTEST: invalid
> - * Description: Test to check if timeslice parameter rejects any unrepresentable intervals.
> - * Test category: SysMan
> + * Description: Test to check if timeslice parameter rejects any unrepresentable
> + *		intervals.
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: timeout
> - * Description: Couple a unpreemptable hog with a fast forced reset and measure the timeslice by how long it takes for the hog to be reset and the high priority context to complete.
> - * Test category: SysMan
> + * Description: Couple a unpreemptable hog with a fast forced reset and measure
> + *		the timeslice by how long it takes for the hog to be reset and
> + *		the high priority context to complete.
>   */
>  
>  #define ATTR "timeslice_duration_ms"
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 551a731f5..e21bedc94 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -32,29 +32,22 @@
>  #include "intel_batchbuffer.h"	/* igt_blitter_copy() */
>  /**
>   * TEST: prime vgem
> - * Description: Basic check of polling for prime/vgem fences.
> - *
> - * SUBTEST: basic-blt
>   * Category: Infrastructure
> - * Description: Examine blitter access path.
> + * Description: Basic check of polling for prime/vgem fences.
>   * Feature: prime
>   * Functionality: mock device
> - * Run type: FULL
>   * Sub-category: DRM
>   * Test category: GEM_Legacy
> + * Run type: FULL
> + *
> + * SUBTEST: basic-blt
> + * Description: Examine blitter access path.
>   *
>   * SUBTEST: basic-fence-blt
> - * Category: Infrastructure
>   * Description: Examine blitter access path fencing.
> - * Feature: prime
> - * Functionality: mock device
> - * Run type: FULL
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fence-flip
>   * Description: Examine vgem bo front/back flip fencing.
> - * Feature: prime
>   * Run type: BAT
>   *
>   * SUBTEST: basic-fence-mmap
> @@ -83,78 +76,38 @@
>   * Run type: BAT
>   *
>   * SUBTEST: busy
> - * Category: Infrastructure
>   * Description: Examine busy check of polling for vgem fence.
> - * Feature: prime
> - * Functionality: mock device
> - * Run type: FULL
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: coherency-blt
> - * Category: Infrastructure
>   * Description: Examine blitter access path WC coherency.
> - * Feature: prime
> - * Functionality: mock device
> - * Run type: FULL
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: coherency-gtt
>   * Description: Examine concurrent access of vgem bo.
>   * Feature: gtt, prime
> - * Run type: FULL
>   *
>   * SUBTEST: fence-flip-hang
>   * Description: Examine vgem bo front/back flip fencing with a pending gpu hang.
>   * Feature: blacklist, prime, synchronization
> - * Run type: FULL
>   *
>   * SUBTEST: fence-read-hang
>   * Description: Examine read access path fencing with a pending gpu hang.
>   * Feature: blacklist, prime, synchronization
> - * Run type: FULL
>   *
>   * SUBTEST: fence-wait
> - * Category: Infrastructure
>   * Description: Examine basic dma-buf fence interop.
> - * Feature: prime, synchronization
> - * Functionality: mock device
> - * Run type: FULL
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: fence-write-hang
>   * Description: Examine write access path fencing with a pending gpu hang.
>   * Feature: blacklist, prime, synchronization
> - * Run type: FULL
>   *
>   * SUBTEST: shrink
> - * Category: Infrastructure
>   * Description: Examine link establishment between shrinker and vgem bo.
> - * Feature: prime
> - * Functionality: mock device
> - * Run type: FULL
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: sync
> - * Category: Infrastructure
>   * Description: Examine sync on vgem fence.
> - * Feature: prime
> - * Functionality: mock device
> - * Run type: FULL
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait
> - * Category: Infrastructure
>   * Description: Examine wait on vgem fence.
> - * Feature: prime
> - * Functionality: mock device
> - * Run type: FULL
> - * Sub-category: DRM
> - * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic check of polling for prime/vgem fences.");
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 63c5c0971..6cfb02e82 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -37,97 +37,71 @@
>   * Description: Basic sanity check of Virtual GEM module (vGEM).
>   * Functionality: mock device
>   * Test category: GEM_Legacy
> + * Feature: vgem
> + * Run type: FULL
>   *
>   * SUBTEST: bad-fence
>   * Description: Make sure a non-existent fence cannot be signaled.
> - * Feature: vgem
> - * Run type: FULL
>   *
>   * SUBTEST: bad-flag
>   * Description: Make sure a fence cannot be attached and signaled with invalid flags.
> - * Feature: vgem
> - * Run type: FULL
>   *
>   * SUBTEST: bad-handle
>   * Description: Make sure a fence cannot be attached to a invalid handle.
> - * Feature: vgem
> - * Run type: FULL
>   *
>   * SUBTEST: bad-pad
>   * Description: Make sure a non-zero pad is rejected.
> - * Feature: vgem
> - * Run type: FULL
>   *
>   * SUBTEST: busy-fence
>   * Description: Make sure a conflicting fence cannot be attached.
> - * Feature: vgem
> - * Run type: FULL
>   *
>   * SUBTEST: create
>   * Description: Check the basic working of vgem_create ioctl.
> - * Feature: vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: debugfs
>   * Description: Check the basic access to debugfs and also try to read entries in the directory.
> - * Feature: vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-export
>   * Description: Check whether it can export/import the vgem handle using prime.
>   * Feature: prime, vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-fence
>   * Description: Check the working of dma-buf fence interop.
>   * Feature: prime, vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-fence-before
>   * Description: Attach a fence before exporting a vgem handle and check the working of fence.
>   * Feature: prime, vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-mmap
>   * Description: Export the vgem handle along with RDWR capabilities using prime and check if it can be mmaped.
>   * Feature: prime, vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: mmap
>   * Description: Create a vgem handle and check if it can be mmaped.
> - * Feature: vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: second-client
>   * Description: Check whether it can open multiple clients.
> - * Feature: vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: setversion
>   * Description: Check the working of SET_VERSION ioctl.
> - * Feature: vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: sysfs
>   * Description: Check the basic access to sysfs and also try to read entries in the directory.
> - * Feature: vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   *
>   * SUBTEST: unload
>   * Description: Basic test for handling of module unload.
> - * Feature: vgem
>   * Run type: BAT
> - * Sub-category: DRM
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of Virtual GEM module (vGEM).");
> -- 
> 2.34.1
> 
