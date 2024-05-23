Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F94AC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 17:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9915310E5FE;
	Thu, 23 May 2024 17:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKG1n05B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68A010E5FE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716484865; x=1748020865;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bEj73oVCuPY+iNeusfK7A3VR/iI3a8wgRRG0NRpNdGE=;
 b=bKG1n05BVPxRmlMk0o17C+AraNS27u0pWS1Mcu5Jn7ODhvzZqwgSmoBr
 zFafxQ23YyHuIqzTxSo+9RYIr4onne3dMYN65LQ2DoZap/Vl2AfPVGUZh
 R2fMXpyEC3SldMFdVzM/fqaQ+y12swtoms1PY8qHRbcQ13a0jyzY7tGgx
 UpYSPvH41+9hLUXFkVixzuha9Fc6bDt7jPKty7LQp2Lp87uptwP/kmcCo
 6E5q/+fWw/YN/cNPjI8gb/CppthJnJuzvnPlCdEGmlToNQblLOHqMMqX0
 5oV+bxgaPhqLDK+5cUvu4sQUESYlhrQNe3jQkLUhjJB9s9cvvHET6SQ1u Q==;
X-CSE-ConnectionGUID: 1twTU/HQTo+uVbUN69XgAg==
X-CSE-MsgGUID: N7BadWa9QG294Vbtp7W9gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12941959"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12941959"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:19:03 -0700
X-CSE-ConnectionGUID: Y9lAqDXDRqm9bo4coN4jCg==
X-CSE-MsgGUID: X69Jj5hJQU6jKPXVCAuZgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="38315610"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 10:19:00 -0700
Date: Thu, 23 May 2024 19:18:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests: Remove Sub-category duplicates after
 introducing Category=Core
Message-ID: <20240523171858.e5m23cezekfeal2t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
References: <20240523151729.877971-1-katarzyna.piecielska@intel.com>
 <20240523151729.877971-4-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240523151729.877971-4-katarzyna.piecielska@intel.com>
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
On 2024-05-23 at 15:17:29 +0000, Katarzyna Piecielska wrote:
> We do not want to have the same name for Category and Sub-category or any
> other collision in documented fields. After I unified Category field for Core
> tests there are some duplicated names in Category and Sub-category.
> Let's remove them.
> When doing that change I find few tests that do not have Mega feature defined.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I will add 'documentation' to patch 1 and 3 at merge.
I will also change subject from:

[PATCH i-g-t v2 3/3] tests: Remove Sub-category duplicates after
 introducing Category=Core

to
[PATCH i-g-t v2 3/3] tests: Fix Sub-category duplicates in documentation

Regards,
Kamil

> ---
>  tests/dmabuf_sync_file.c    | 3 ++-
>  tests/drm_read.c            | 3 ++-
>  tests/intel/i915_pciid.c    | 2 +-
>  tests/intel/i915_selftest.c | 8 ++++----
>  tests/prime_vgem.c          | 2 +-
>  tests/syncobj_eventfd.c     | 7 ++++---
>  tests/vgem_basic.c          | 2 +-
>  tests/vgem_slow.c           | 2 +-
>  8 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
> index ba33f6a9d..ca9d7d579 100644
> --- a/tests/dmabuf_sync_file.c
> +++ b/tests/dmabuf_sync_file.c
> @@ -13,9 +13,10 @@ IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
>  /**
>   * TEST: dmabuf_sync_file
>   * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: dmabuf
>   * Description: Tests for sync_file support in dma-buf
>   * Functionality: dmabuf test
> - * Sub-category: Core
>   *
>   * SUBTEST: export-basic
>   * SUBTEST: export-before-signal
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index a7f0d8702..0a9b61cd0 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -54,8 +54,9 @@ IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
>   * TEST: drm read
>   * Description: boundary testing of read(drm_fd)
>   * Category: Core
> - * Functionality: drm_mm
> + * Mega feature: General Core features
>   * Sub-category: uapi
> + * Functionality: drm_mm
>   *
>   * SUBTEST: invalid-buffer
>   * SUBTEST: fault-buffer
> diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
> index 42ed7151d..a8c5df9d9 100644
> --- a/tests/intel/i915_pciid.c
> +++ b/tests/intel/i915_pciid.c
> @@ -33,7 +33,7 @@
>   * Description: Check that igt/i915 know about this PCI-ID
>   * Category: Core
>   * Mega feature: General Core features
> - * Sub-category: Core
> + * Sub-category: driver
>   * Functionality: device management
>   * Feature: core
>   * Test category: GEM_Legacy
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index f234ca2de..aa29eb36a 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -310,7 +310,7 @@
>   * Description: Validation of per-object locking patterns
>   * Category: Core
>   * Mega feature: General Core features
> - * Sub-category: Core
> + * Sub-category: CMD submission
>   * Functionality: per-object locking
>   * Test category: i915
>   *
> @@ -318,7 +318,7 @@
>   * Description: User object allocation and isolation checks
>   * Category: Core
>   * Mega feature: General Core features
> - * Sub-category: Core
> + * Sub-category: CMD submission
>   * Functionality: objects
>   * Test category: i915
>   *
> @@ -357,7 +357,7 @@
>   * Description: Checks the selftest infrastructure itself
>   * Category: Core
>   * Mega feature: General Core features
> - * Sub-category: Core
> + * Sub-category: driver
>   * Functionality: sanitycheck
>   * Test category: i915
>   *
> @@ -531,7 +531,7 @@
>   * Description: Selftest for the selftest
>   * Category: Core
>   * Mega feature: General Core features
> - * Sub-category: Core
> + * Sub-category: driver
>   * Functionality: sanitycheck
>   * Test category: i915
>   *
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 79ea12b5c..932058d2c 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -35,7 +35,7 @@
>   * Description: Basic check of polling for prime/vgem fences.
>   * Category: Core
>   * Mega feature: General Core features
> - * Sub-category: Core
> + * Sub-category: DRM
>   * Functionality: mock device
>   * Feature: prime
>   * Test category: GEM_Legacy
> diff --git a/tests/syncobj_eventfd.c b/tests/syncobj_eventfd.c
> index a4a73f251..f8bf17e1f 100644
> --- a/tests/syncobj_eventfd.c
> +++ b/tests/syncobj_eventfd.c
> @@ -13,11 +13,12 @@
>  
>  /**
>   * TEST: syncobj eventfd
> - * Category: Core
>   * Description: Tests for the drm sync object eventfd API
> - * Feature: synchronization
> - * Functionality: semaphore
> + * Category: Core
> + * Mega feature: General Core features
>   * Sub-category: DRM
> + * Functionality: semaphore
> + * Feature: synchronization
>   * Test category: GEM_Legacy
>   */
>  
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index f30722bbe..048ad7460 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -36,7 +36,7 @@
>   * Description: Basic sanity check of Virtual GEM module (vGEM).
>   * Category: Core
>   * Mega feature: General Core features
> - * Sub-category: Core
> + * Sub-category: DRM
>   * Functionality: mock device
>   * Test category: GEM_Legacy
>   * Feature: vgem
> diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
> index 3ce0f811e..6609989c7 100644
> --- a/tests/vgem_slow.c
> +++ b/tests/vgem_slow.c
> @@ -35,7 +35,7 @@
>   * Description: Extended sanity check of Virtual GEM module (vGEM).
>   * Category: Core
>   * Mega feature: General Core features
> - * Sub-category: Core
> + * Sub-category: DRM
>   * Functionality: mock device
>   * Feature: vgem
>   * Test category: GEM_Legacy
> -- 
> 2.34.1
> 
