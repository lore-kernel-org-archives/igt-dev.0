Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856C7C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 15:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E76410E4A0;
	Thu, 29 Feb 2024 15:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7HzLr1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E40310E4AA
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709220342; x=1740756342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JANrZCBtcCw09gJATcYzXScHm4YxO21mm0YJEg73TLY=;
 b=R7HzLr1pp3s/wEb3NMUioYmz8p8TJtN2NS1HNjo8dwFgvVeVoUJg5oNw
 K7123IVscpsloJzGjlBku2EF7rFGdHICTbHmwPUEpPAzh7DdOz7Gj04Di
 LknzigFDSq15OqW2nLolaayTvxczaC1Drjiu1nMkYAzvhNFRJwkaqx/wP
 GEW/rBpDHd7oGkwZEz3UFc96KtLoPOVlKlu6Vp/ppAkGjV9Qs2K59jQN4
 kMeQ5S4+Jt/4nkN1YP8vIRuB2XiDy/fQb6g2F5pyq35U9k+/dDD8ryXph
 jPRjdGzKl7gmua76CX+jbilCoQE7/IaiKVHk9eteU4nG9xzEu73EOS3lT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3575272"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3575272"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 07:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8282109"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:25:40 -0800
Date: Thu, 29 Feb 2024 16:25:19 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t 1/5] Documentation refactoring part 1
Message-ID: <20240229152519.kffqkro73fplsfzx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240229111909.588400-1-katarzyna.piecielska@intel.com>
 <20240229111909.588400-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229111909.588400-2-katarzyna.piecielska@intel.com>
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
On 2024-02-29 at 11:19:05 +0000, Katarzyna Piecielska wrote:
> Unify documentation for Intel i915 tests that we have by  moving
> common parts to be available for all tests.

Some of the tests are core/generic ones, like core_hotunplug.c

I would like to also see some prefix in subject, like:

[PATCH i-g-t 1/5] tests: Documentation refactoring part 1

> 
> This is part 1 to make review easier.
- ^^^^^^^^^^^^^^
This belongs to cover letter, not here. With that fixed:

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_hotunplug.c       |  57 +++++--------
>  tests/device_reset.c         |  17 ++--
>  tests/dmabuf.c               |  13 ++-
>  tests/drm_mm.c               |  84 +------------------
>  tests/intel/api_intel_bb.c   | 152 ++---------------------------------
>  tests/intel/debugfs_test.c   |  32 +++-----
>  tests/intel/gem_basic.c      |  22 ++---
>  tests/intel/gem_blits.c      |   2 +-
>  tests/intel/gem_ccs.c        |   9 +--
>  tests/intel/gem_close_race.c |  39 +++------
>  tests/intel/gem_create.c     |  87 ++++++--------------
>  11 files changed, 94 insertions(+), 420 deletions(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index be80d479f..f578afa4a 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -44,64 +44,43 @@
>   * Description: Examine behavior of a driver on device hot unplug
>   * Feature: SMI, core
>   * Test category: functionality test
> - *
> - * SUBTEST: hotrebind
>   * Category: Software building block
>   * Sub-category: driver
>   * Functionality: device hotplug
> - * Description:
> - *   Check if the driver can be cleanly rebound to a device with a still open hot unbound driver
> - *   instance
>   * Run type: FULL
>   *
> + * SUBTEST: hotrebind
> + * Description: Check if the driver can be cleanly rebound to a device with a
> + *		still open hot unbound driver instance
> + *
>   * SUBTEST: hotrebind-lateclose
> - * Category: Software building block
> - * Sub-category: driver
> - * Functionality: device hotplug
> - * Description: Check if a hot unbound driver instance still open after hot rebind can be cleanly released
> - * Run type: FULL
> + * Description: Check if a hot unbound driver instance still open after hot
> + *		rebind can be cleanly released
>   *
>   * SUBTEST: hotreplug
> - * Category: Software building block
> - * Sub-category: driver
> - * Functionality: device hotplug
> - * Description: Check if a hot unplugged and still open device can be cleanly restored
> - * Run type: FULL
> + * Description: Check if a hot unplugged and still open device can be cleanly
> + *		restored
>   *
>   * SUBTEST: hotreplug-lateclose
> - * Category: Software building block
> - * Sub-category: driver
> - * Functionality: device hotplug
> - * Description: Check if an instance of a still open while hot replugged device can be cleanly released
> - * Run type: FULL
> + * Description: Check if an instance of a still open while hot replugged device
> + *		can be cleanly released
>   *
>   * SUBTEST: hotunbind-rebind
> - * Category: Software building block
> - * Sub-category: driver
> - * Functionality: device hotplug
> - * Description: Check if the driver can be cleanly unbound from an open device, then released and rebound
> - * Run type: FULL
> + * Description: Check if the driver can be cleanly unbound from an open device,
> + *		then released and rebound
>   *
>   * SUBTEST: hotunplug-rescan
> - * Category: Software building block
> - * Sub-category: driver
> - * Functionality: device hotplug
> - * Description: Check if an open device can be cleanly unplugged, then released and restored
> - * Run type: FULL
> + * Description: Check if an open device can be cleanly unplugged, then released
> + *		and restored
>   *
>   * SUBTEST: unbind-rebind
> - * Category: Software building block
> - * Sub-category: driver
> - * Functionality: device hotplug
> - * Description: Check if the driver can be cleanly unbound from a device believed to be closed, then rebound
> + * Description: Check if the driver can be cleanly unbound from a device
> + *		believed to be closed, then rebound
>   * Run type: BAT
>   *
>   * SUBTEST: unplug-rescan
> - * Category: Software building block
> - * Sub-category: driver
> - * Functionality: device hotplug
> - * Description: Check if a device believed to be closed can be cleanly unplugged, then restored
> - * Run type: FULL
> + * Description: Check if a device believed to be closed can be cleanly
> + *		unplugged, then restored
>   */
>  
>  IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index ef08164aa..e1e3ac78d 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -17,29 +17,26 @@
>  /**
>   * TEST: device reset
>   * Description: Examine behavior of a driver on device sysfs reset
> + * Category: Server
> + * Feature: reset
> + * Functionality: reset
> + * Sub-category: Reset
> + * Test category: GEM_Legacy
>   * Run type: FULL
>   *
>   * SUBTEST: cold-reset-bound
>   * Description: Cold Resets device with bound driver
> - * Feature: reset
>   *
>   * SUBTEST: reset-bound
>   * Description: Resets device with bound driver
> - * Feature: reset
>   *
>   * SUBTEST: unbind-cold-reset-rebind
>   * Description: Unbinds driver from device, initiates cold reset then rebinds driver to device
> - * Feature: reset
>   *
>   * SUBTEST: unbind-reset-rebind
> - * Category: Server
> - * Description:
> - *   Unbinds driver from device, initiates reset then rebinds driver to device
> - *   validating device resets
> + * Description: Unbinds driver from device, initiates reset then rebinds driver
> + *		to device validating device resets
>   * Feature: reset, sriov-reset
> - * Functionality: reset
> - * Sub-category: sysman
> - * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Examine behavior of a driver on device sysfs reset");
> diff --git a/tests/dmabuf.c b/tests/dmabuf.c
> index 2ac105423..977b04043 100644
> --- a/tests/dmabuf.c
> +++ b/tests/dmabuf.c
> @@ -27,21 +27,18 @@
>   * TEST: dmabuf
>   * Description: Kernel selftests for the dmabuf API
>   * Feature: mapping, prime
> + * Category: Infrastructure
> + * Description: drm_mm range manager SW validation
> + * Functionality: DRM
> + * Sub-category: Memory management
> + * Test category: GEM_Legacy
>   * Run type: BAT
>   *
>   * SUBTEST: all-tests
>   *
>   * SUBTEST: all-tests@dma_fence
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: all-tests@sanitycheck
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Kernel selftests for the dmabuf API");
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index e6ba22474..f2e6c6cd1 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -27,129 +27,53 @@
>   * TEST: drm mm
>   * Description: Basic sanity check of DRM's range manager (struct drm_mm)
>   * Feature: mapping
> + * Category: Infrastructure
> + * Functionality: DRM memory mangemnt
> + * Sub-category: Memory management
> + * Test category: GEM_Legacy
>   * Run type: FULL
>   *
>   * SUBTEST: drm_mm
>   *
>   * SUBTEST: drm_mm@align
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@align32
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@align64
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@bottomup
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@color
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@color_evict
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@color_evict_range
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@debug
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@evict
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@evict_range
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@frag
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@highest
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@init
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@insert
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@insert_range
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@lowest
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@replace
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@reserve
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@sanitycheck
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: drm_mm@topdown
> - * Category: Infrastructure
> - * Description: drm_mm range manager SW validation
> - * Functionality: DRM memory mangemnt
> - * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)");
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 59ed244f0..24f96fcf5 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -43,210 +43,72 @@
>  #include "intel_blt.h"
>  /**
>   * TEST: api intel bb
> - * Description: intel_bb API check.
> - * Run type: FULL
> - *
> - * SUBTEST: add-remove-objects
>   * Category: Infrastructure
>   * Description: checking dummy buffer creation & submission
>   * Feature: igt_core
>   * Functionality: dummy buffer creation & submission
>   * Sub-category: IGT Lib
>   * Test category: GEM_Legacy
> + * Run type: FULL
> + *
> + * SUBTEST: add-remove-objects
>   *
>   * SUBTEST: bb-with-allocator
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: blit-noreloc-keep-cache
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: blit-noreloc-purge-cache
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: blit-reloc-keep-cache
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: blit-reloc-purge-cache
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: crc32
>   * Description: Compare cpu and gpu crc32 sums on input object
> - * Feature: igt_core
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: delta-check
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: destroy-bb
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-batch
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: intel-bb-blit-none
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: intel-bb-blit-x
> - * Feature: igt_core
>   *
>   * SUBTEST: intel-bb-blit-y
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: lot-of-buffers
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: misplaced-blitter
> - * Category: Infrastructure
> - * Description:
> - *   Execute intel_bb with set of engines provided by userspace
> - *   checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
> + * Description: Execute intel_bb with set of engines provided by userspace
> + *		checking dummy buffer creation & submission
>   *
>   * SUBTEST: object-noreloc-keep-cache-simple
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: object-noreloc-purge-cache-simple
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: object-reloc-keep-cache
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: object-reloc-purge-cache
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: offset-control
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: purge-bb
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: render
> - * Feature: igt_core
>   *
>   * SUBTEST: render-ccs
> - * Feature: igt_core
>   *
>   * SUBTEST: reset-bb
> - * Category: Infrastructure
> - * Description:
> - *   Ensure reset is possible on fresh bb
> - *   checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
> + * Description: Ensure reset is possible on fresh bb checking dummy buffer
> + *		creation & submission
>   *
>   * SUBTEST: reset-flags
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: simple-bb
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: simple-bb-ctx
> - * Category: Infrastructure
> - * Description: checking dummy buffer creation & submission
> - * Feature: igt_core
> - * Functionality: dummy buffer creation & submission
> - * Sub-category: IGT Lib
> - * Test category: GEM_Legacy
>   */
>  
>  #define PAGE_SIZE 4096
> diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c
> index b67bfabac..9706b81e1 100644
> --- a/tests/intel/debugfs_test.c
> +++ b/tests/intel/debugfs_test.c
> @@ -33,43 +33,29 @@
>   * TEST: debugfs test
>   * Description: Read entries from debugfs, hwmon and sysfs paths.
>   * Feature: core
> + * Category: Infrastructure
> + * Functionality: debugfs
> + * Sub-category: uapi
> + * Test category: uapi
> + * Run type: FULL
>   *
>   * SUBTEST: basic-hwmon
> - * Category: Infrastructure
> - * Description:
> - *   Read all entries from hwmon path
> - *   validating debugfs entries
> - * Functionality: debugfs entries
> + * Description: Read all entries from hwmon path validating debugfs entries
>   * Run type: BAT
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: read_all_entries
> - * Category: Infrastructure
> - * Description:
> - *   Read all entries from debugfs path.
> - *   validating debugfs entries
> - * Functionality: debugfs entries
> + * Description: Read all entries from debugfs path validating debugfs entries
>   * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: read_all_entries_display_off
>   * Description: Read all debugfs entries with display on/off.
> - * Run type: FULL
>   *
>   * SUBTEST: read_all_entries_display_on
>   * Description: Read all debugfs entries with display on/off.
> - * Run type: FULL
>   *
>   * SUBTEST: sysfs
> - * Category: Infrastructure
> - * Description:
> - *   Read all entries from sysfs path.
> - *   validating debugfs entries
> - * Functionality: debugfs entries
> - * Run type: FULL
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Read all entries from sysfs path validating debugfs entries
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Read entries from debugfs, hwmon and sysfs paths.");
> diff --git a/tests/intel/gem_basic.c b/tests/intel/gem_basic.c
> index 3485f92c8..513113cd1 100644
> --- a/tests/intel/gem_basic.c
> +++ b/tests/intel/gem_basic.c
> @@ -44,33 +44,21 @@
>  /**
>   * TEST: gem basic
>   * Description: Tests basic gem_create and gem_close IOCTLs
> - *
> - * SUBTEST: bad-close
>   * Category: Infrastructure
> - * Description: Verify that gem_close fails with bad params.
>   * Feature: gem_core
>   * Functionality: driver handler
> - * Run type: BAT
> - * Sub-category: i915
> + * Sub-category: uapi
>   * Test category: GEM_Legacy
> + * Run type: BAT
> + *
> + * SUBTEST: bad-close
> + * Description: Verify that gem_close fails with bad params.
>   *
>   * SUBTEST: create-close
> - * Category: Infrastructure
>   * Description: Verify basic functionality of gem_create and gem_close.
> - * Feature: gem_core
> - * Functionality: driver handler
> - * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-fd-close
> - * Category: Infrastructure
>   * Description: Verify that closing drm driver is possible with opened gem object.
> - * Feature: gem_core
> - * Functionality: driver handler
> - * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: multigpu-create-close
>   * Description: Verify basic functionality of gem_create and gem_close on multi-GPU.
> diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
> index e567cdf33..b9d0b5f87 100644
> --- a/tests/intel/gem_blits.c
> +++ b/tests/intel/gem_blits.c
> @@ -34,7 +34,7 @@
>   * Feature: blitter
>   * Functionality: command streamer
>   * Run type: FULL
> - * Sub-category: HW
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index e8f16d7d8..3442ecfd3 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -19,11 +19,11 @@
>  /**
>   * TEST: gem ccs
>   * Description: Exercise gen12 blitter with and without flatccs compression
> + * Feature: flat_ccs_mapping
>   * Run type: FULL
>   *
>   * SUBTEST: block-copy-compressed
>   * Description: Check block-copy flatccs compressed blit
> - * Feature: flat_ccs_mapping
>   *
>   * SUBTEST: block-copy-uncompressed
>   * Description: Check block-copy uncompressed blit
> @@ -31,19 +31,16 @@
>   *
>   * SUBTEST: block-multicopy-compressed
>   * Description: Check block-multicopy flatccs compressed blit
> - * Feature: flat_ccs_mapping
>   *
>   * SUBTEST: block-multicopy-inplace
>   * Description: Check block-multicopy flatccs inplace decompression blit
> - * Feature: flat_ccs_mapping
>   *
>   * SUBTEST: ctrl-surf-copy
>   * Description: Check flatccs data can be copied from/to surface
> - * Feature: flat_ccs_mapping
>   *
>   * SUBTEST: ctrl-surf-copy-new-ctx
> - * Description: Check flatccs data are physically tagged and visible in different contexts
> - * Feature: flat_ccs_mapping
> + * Description: Check flatccs data are physically tagged and visible i
> + *		different contexts
>   *
>   * SUBTEST: suspend-resume
>   * Description: Check flatccs data persists after suspend / resume (S0)
> diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
> index cef0ff025..9c2034ad3 100644
> --- a/tests/intel/gem_close_race.c
> +++ b/tests/intel/gem_close_race.c
> @@ -51,57 +51,42 @@
>  /**
>   * TEST: gem close race
>   * Description: Test try to race gem_close against workload submission.
> - *
> - * SUBTEST: basic-process
>   * Category: Infrastructure
> - * Description: Basic workload submission.
>   * Feature: synchronization
>   * Functionality: driver handler
> - * Run type: BAT
> - * Sub-category: i915
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> + * Run type: FULL
> + *
> + * SUBTEST: basic-process
> + * Description: Basic workload submission.
> + * Run type: BAT
>   *
>   * SUBTEST: basic-threads
> - * Category: Infrastructure
> - * Description:
> - *   Share buffer handle across different drm fd's and trying to race gem_close against
> - *   continuous workload with minimum timeout.
> - * Feature: synchronization
> - * Functionality: driver handler
> + * Description: Share buffer handle across different drm fd's and trying to
> + *		race gem_close against continuous workload with minimum timeout.
>   * Run type: BAT
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: contexts
> - * Description:
> - *   Share buffer handle across different drm fd's and trying to race gem_close against
> - *   continuous workload in other contexts.
> - * Feature: synchronization
> - * Run type: FULL
> + * Description: Share buffer handle across different drm fd's and trying to
> + *		race gem_close against continuous workload in other contexts.
>   *
>   * SUBTEST: gem-close-race
> - * Description:
> - *   Share buffer handle across different drm fd's and trying to race of gem_close against
> - *   continuous workload.
> - * Feature: synchronization
> - * Run type: FULL
> + * Description: Share buffer handle across different drm fd's and trying to
> + *		race of gem_close against continuous workload.
>   *
>   * SUBTEST: multigpu-basic-process
>   * Description: Basic workload submission on multi-GPU machine.
>   * Feature: multigpu, synchronization
> - * Run type: FULL
>   * Test category: MultiGPU
>   *
>   * SUBTEST: multigpu-basic-threads
>   * Description: Run basic-threads race on multi-GPU machine.
>   * Feature: multigpu, synchronization
> - * Run type: FULL
>   * Test category: MultiGPU
>   *
>   * SUBTEST: process-exit
>   * Description: Test try to race gem_close against submission of continuous workload.
> - * Feature: synchronization
> - * Run type: FULL
>   */
>  
>  #define OBJECT_SIZE (256 * 1024)
> diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
> index 87fde2963..77ffceda4 100644
> --- a/tests/intel/gem_create.c
> +++ b/tests/intel/gem_create.c
> @@ -64,101 +64,60 @@
>  #include "i915_drm.h"
>  /**
>   * TEST: gem create
> - * Description:
> - *   Ensure that basic gem_create and gem_create_ext works and that invalid input combinations
> - *   are rejected.
> - * Run type: FULL
> - *
> - * SUBTEST: busy-create
> + * Description: Ensure that basic gem_create and gem_create_ext works and that
> + *		invalid input combinations are rejected.
>   * Category: Infrastructure
> - * Description: Create buffer objects while GPU is busy.
>   * Feature: mapping
>   * Functionality: buffer management
> - * Sub-category: i915
> + * Sub-category: uapi
>   * Test category: GEM_Legacy
> + * Run type: FULL
> + *
> + * SUBTEST: busy-create
> + * Description: Create buffer objects while GPU is busy.
>   *
>   * SUBTEST: create-clear
> - * Category: Infrastructure
>   * Description: Verify that all new objects are clear.
> - * Feature: mapping
> - * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext-cpu-access-big
> - * Description:
> - *   Verify the extreme cases with very large objects and.
> - *   I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> - * Feature: mapping
> + * Description: Verify the extreme cases with very large objects and
> + *		I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
>   *
>   * SUBTEST: create-ext-cpu-access-sanity-check
> - * Description:
> - *   Verify the basic functionally and expected ABI contract around.
> - *   I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> - * Feature: mapping
> + * Description: Verify the basic functionally and expected ABI contract around
> + *		I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
>   *
>   * SUBTEST: create-ext-placement-all
>   * Category: Infrastructure
>   * Description: Create objects in every memory region using create_ext.
> - * Feature: mapping
> - * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext-placement-each
> - * Category: Infrastructure
> - * Description: Create one object with memory pieces in each memory region using create_ext.
> - * Feature: mapping
> - * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Create one object with memory pieces in each memory region
> + *		using create_ext.
>   *
>   * SUBTEST: create-ext-placement-sanity-check
> - * Category: Infrastructure
>   * Description: Exercise create_ext placements extension.
> - * Feature: mapping
> - * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-invalid-size
> - * Category: Infrastructure
> - * Description: Try to create a gem object of invalid size 0 and check if ioctl returns error.
> - * Feature: mapping
> - * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Try to create a gem object of invalid size 0 and check if
> + *		ioctl returns error.
>   *
>   * SUBTEST: create-massive
> - * Category: Infrastructure
> - * Description: Exercise creation of buffer object with impossible size and check for the expected error.
> - * Feature: mapping
> - * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Exercise creation of buffer object with impossible size and
> + *		check for the expected error.
>   *
>   * SUBTEST: create-size-update
> - * Category: Infrastructure
> - * Description: Try to create a gem object with size 15 and check actual created size.
> - * Feature: mapping
> - * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Try to create a gem object with size 15 and check actual
> + *		created size.
>   *
>   * SUBTEST: create-valid-nonaligned
> - * Category: Infrastructure
> - * Description:
> - *   Try to create an object with non-aligned size, check we got one with size aligned up to page
> - *   size and test we can write into the padded extra memory.
> - * Feature: mapping
> - * Functionality: buffer management
> - * Sub-category: i915
> - * Test category: GEM_Legacy
> + * Description: Try to create an object with non-aligned size, check we got one
> + *		with size aligned up to page size and test we can write into
> + *		the padded extra memory.
>   *
>   * SUBTEST: hog-create
>   * Description: Create buffer objects while GPU is busy.
> - * Feature: mapping
> - * Test category: GEM_Legacy
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext works"
> -- 
> 2.34.1
> 
