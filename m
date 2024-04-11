Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A46C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F182410EC7E;
	Thu, 11 Apr 2024 14:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/7pO679";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F80610EC7E
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712844826; x=1744380826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6bGq8jDnGg2FxcquF1852FFwwSPjpbWz2nAVkdAUgVo=;
 b=M/7pO679zg8bjDPDToHAylmpOfKanTAJp+/DnSA+dAzFsltpwjzWAzi0
 mfitU6qx+XGh/KiMfGdYCEuljZRcOEMIB+6P70/F/iuC/RxvNC5CBX2mp
 ifV3mEJAi5LooiYW8yI72fUfwQimyfPLF9lImibvRZhgOIxrjA9gwNLc6
 clYrpBOzFfOms7vjUkyL8IuRtFzyBuuG4ANUDezRiWjRmWPkBast06FFC
 LUi4U9FyKAXcz6lBL90xDbCjRFmVeyGkpFwPZZcfhfugunBrwv+t67fNl
 V5R8eB12I+isXUNOo30zXVK3/uS0jhCzWofGSKyjEvrdwoUdUoY8D4hFa w==;
X-CSE-ConnectionGUID: 6VhjqHPpTf2ZS4kzweu9YQ==
X-CSE-MsgGUID: I35+yBmVSyir9IXn0hS4uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18860394"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18860394"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:13:45 -0700
X-CSE-ConnectionGUID: 5nbmjnBXTrWC71luPct2HQ==
X-CSE-MsgGUID: pGD7J3IrSgyvfnjSLLnbjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="58332106"
Received: from unknown (HELO localhost) ([10.245.246.159])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:13:44 -0700
Date: Thu, 11 Apr 2024 16:13:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [i-g-t,v3,5/5] tests: Remove collisions with Subcategory and
 Functionality
Message-ID: <20240411141341.p22aqnjyi4fct4pf@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240411131554.2999053-6-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240411131554.2999053-6-katarzyna.piecielska@intel.com>
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
On 2024-04-11 at 13:15:54 +0000, Katarzyna Piecielska wrote:
> Let's remove Sub-category/Functionality name collisions:
> - changes in Functionality:
> 	s/DRM/drm_mm/
> 	s/dmabuf/dmabuf test/
> 	s/compute/compute test/
> 	s/synchronization/fences/
> 	s/vma/virtual address/
> 	s/kunit/kunit test/
> 	s/mocs/mocs configuration/
> 	s/intel-nouveau/intel-nouveau uapi/
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

With this I do not see any collisions, so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/dmabuf.c                       | 2 +-
>  tests/dmabuf_sync_file.c             | 2 +-
>  tests/drm_mm.c                       | 2 +-
>  tests/drm_read.c                     | 2 +-
>  tests/intel/gem_exec_endless.c       | 4 ++--
>  tests/intel/gem_fence_thrash.c       | 2 +-
>  tests/intel/gem_fence_upload.c       | 2 +-
>  tests/intel/gem_fenced_exec_thrash.c | 6 +++---
>  tests/intel/i915_selftest.c          | 4 ++--
>  tests/intel/kms_fence_pin_leak.c     | 2 +-
>  tests/intel/xe_exec_compute_mode.c   | 2 +-
>  tests/intel/xe_live_ktest.c          | 6 +++---
>  tests/prime_nv_api.c                 | 2 +-
>  13 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/dmabuf.c b/tests/dmabuf.c
> index 549cfa27e..71285ff0b 100644
> --- a/tests/dmabuf.c
> +++ b/tests/dmabuf.c
> @@ -29,7 +29,7 @@
>   * Feature: mapping, prime
>   * Category: Infrastructure
>   * Description: drm_mm range manager SW validation
> - * Functionality: DRM
> + * Functionality: drm_mm
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
> index f4eb2e63f..402816afc 100644
> --- a/tests/dmabuf_sync_file.c
> +++ b/tests/dmabuf_sync_file.c
> @@ -14,7 +14,7 @@ IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
>   * TEST: dmabuf_sync_file
>   * Category: Infrastructure
>   * Description: Tests for sync_file support in dma-buf
> - * Functionality: dmabuf
> + * Functionality: dmabuf test
>   * Sub-category: Core
>   *
>   * SUBTEST: export-basic
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index b8b72635b..dcd4c7676 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -28,7 +28,7 @@
>   * Description: Basic sanity check of DRM's range manager (struct drm_mm)
>   * Feature: mapping
>   * Category: Infrastructure
> - * Functionality: DRM
> + * Functionality: drm_mm
>   * Sub-category: Memory management
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index a976a59a2..94c53fded 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -54,7 +54,7 @@ IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
>   * TEST: drm read
>   * Description: boundary testing of read(drm_fd)
>   * Category: Infrastructure
> - * Functionality: DRM memory managemnt
> + * Functionality: drm_mm
>   * Sub-category: uapi
>   *
>   * SUBTEST: invalid-buffer
> diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
> index 5bec7adee..f0bf82b54 100644
> --- a/tests/intel/gem_exec_endless.c
> +++ b/tests/intel/gem_exec_endless.c
> @@ -33,10 +33,10 @@
>  /**
>   * TEST: gem exec endless
>   * Category: Server
> - * Feature: cmd_submission
> - * Functionality: compute
>   * Sub-category: CMD submission
> + * Functionality: compute test
>   * Test category: Compute
> + * Feature: cmd_submission
>   *
>   * SUBTEST: dispatch
>   */
> diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
> index e01e5a8a7..c7c9460c6 100644
> --- a/tests/intel/gem_fence_thrash.c
> +++ b/tests/intel/gem_fence_thrash.c
> @@ -48,7 +48,7 @@
>   * Feature: gtt, synchronization feature
>   * Sub-category: CMD submission
>   * Category: Desktop client
> - * Functionality: synchronization
> + * Functionality: fences
>   *
>   * SUBTEST: bo-copy
>   *
> diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
> index b80d53a25..8b92d3976 100644
> --- a/tests/intel/gem_fence_upload.c
> +++ b/tests/intel/gem_fence_upload.c
> @@ -45,7 +45,7 @@
>   * TEST: gem fence upload
>   * Sub-category: CMD submission
>   * Category: Desktop client
> - * Functionality: synchronization
> + * Functionality: fences
>   *
>   * SUBTEST: performance
>   *
> diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
> index d0055dfb5..614967615 100644
> --- a/tests/intel/gem_fenced_exec_thrash.c
> +++ b/tests/intel/gem_fenced_exec_thrash.c
> @@ -36,10 +36,10 @@
>  /**
>   * TEST: gem fenced exec thrash
>   * Description: Test execbuf fence accounting.
> - * Feature: gtt, synchronization feature
> - * Sub-category: CMD submission
>   * Category: Desktop client
> - * Functionality: synchronization
> + * Sub-category: CMD submission
> + * Functionality: fences
> + * Feature: gtt, synchronization feature
>   *
>   * SUBTEST: 2-spare-fences
>   *
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index a466a9009..046c4004e 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -349,7 +349,7 @@
>   * SUBTEST: live@vma
>   * Category: Selftest
>   * Description: Per-object virtual address management
> - * Functionality: vma
> + * Functionality: virtual address
>   * Test category: i915
>   * Sub-category: Memory management
>   *
> @@ -516,7 +516,7 @@
>   * SUBTEST: mock@vma
>   * Category: Selftest
>   * Description: API checks for virtual address management
> - * Functionality: vma
> + * Functionality: virtual address
>   * Test category: i915
>   * Sub-category: uapi
>   *
> diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
> index 0771799ba..5d25d9ee3 100644
> --- a/tests/intel/kms_fence_pin_leak.c
> +++ b/tests/intel/kms_fence_pin_leak.c
> @@ -41,7 +41,7 @@
>   * SUBTEST:
>   * Description: Along with the modeset, validate fence pin_count leakage.
>   * Driver requirement: i915
> - * Functionality: kms_core, synchronization
> + * Functionality: kms_core, fences
>   * Mega feature: General Display Features
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 3ec848164..a73a7343c 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -7,7 +7,7 @@
>   * TEST: Basic tests for execbuf compute machine functionality
>   * Category: Hardware building block
>   * Sub-category: CMD submission
> - * Functionality: compute
> + * Functionality: compute test
>   */
>  
>  #include <fcntl.h>
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index c50aefea8..a894c6257 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -6,7 +6,7 @@
>   * Description: Xe driver live dmabuf unit tests
>   * Category: Software building block
>   * Sub-category: kunit
> - * Functionality: kunit
> + * Functionality: kunit test
>   * Test category: functionality test
>   *
>   * SUBTEST: xe_bo
> @@ -17,7 +17,7 @@
>   *
>   * SUBTEST: xe_dma_buf
>   * Description: Kernel dynamic selftests for dmabuf functionality.
> - * Functionality: dmabuf
> + * Functionality: dmabuf test
>   *
>   * SUBTEST: xe_migrate
>   * Description:
> @@ -28,7 +28,7 @@
>   * SUBTEST: xe_mocs
>   * Description:
>   *	Kernel dynamic selftests to check mocs configuration.
> - * Functionality: mocs
> + * Functionality: mocs configuration
>   */
>  
>  static const char *live_tests[] = {
> diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
> index 29cc9a8a7..d9c1849cf 100644
> --- a/tests/prime_nv_api.c
> +++ b/tests/prime_nv_api.c
> @@ -12,7 +12,7 @@
>   * TEST: prime_nv_api
>   * Description: Basic api tests between intel and nouveau
>   * Sub-category: uapi
> - * Functionality: intel-nouveau
> + * Functionality: intel-nouveau uapi
>   *
>   * SUBTEST: i915_nv_import_twice
>   * SUBTEST: i915_nv_import_twice_check_flink_name
