Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A891BC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 17:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B2D11A680;
	Thu, 25 Apr 2024 17:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8U/hQzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A7311A67F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714065108; x=1745601108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7hEkpmtoyzKqK5ijXJQdo3F00yj/Qm8o4Gj8MqaKq64=;
 b=L8U/hQzbwnyfdPbW1IZaP86tFjdWU0S25gUAPZ8Bx+7dQ+i2cbe7Wgyq
 gg1/2HEAR/h4o91G+hqfSW9Aj/+IJlNMS8rak8SI2HiyeILN3wa9LaFbF
 0ENzlD9YZmkqyZhD7kRvPEObni36aoF75H9QZcV1CFbLE3yr7oTI4vF7H
 XYpBmoTUj+XjvVq5zdGj4VLA/0oWKeSwrSEYgRhlKzszGwmgHJVGWlZaY
 nSpRXS6IgPVd+fPA0vAiFRmhxthkGbvKoF3adoCZGbRsf+qhtcW3tfZ/s
 MLHjAyxMa5m8aFa7ynYj9Ksxx9sOmZTRbj5b2nfzIj9psyi21td70MpIv w==;
X-CSE-ConnectionGUID: hsUqWr34T8yOirpJGtI/Zw==
X-CSE-MsgGUID: tjjZ7RIVRpGw8qGCKyJyDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13554887"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="13554887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 10:11:47 -0700
X-CSE-ConnectionGUID: 9nQdafmERleL4lTsw/95+g==
X-CSE-MsgGUID: vNIZnFJjStelwvkeNPaO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="29597018"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 10:11:46 -0700
Date: Thu, 25 Apr 2024 19:11:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: Re: [PATCH i-g-t v2 04/16] tests/intel: Introduce Power management
 Mega feature
Message-ID: <20240425171143.dt5f33yqjs24ez2q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
 <20240423104913.3559587-5-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240423104913.3559587-5-katarzyna.piecielska@intel.com>
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
On 2024-04-23 at 10:49:01 +0000, Katarzyna Piecielska wrote:
> Add mega feature to Power Management tests.
> Group:
> 	SUBTEST
>  	Description
>  	Category
>  	Mega feature
>  	Sub-category
>  	Functionality
> 
> v2: move gem_pxp to General Mega feature
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
> ---
>  tests/intel/gem_ctx_freq.c          |  5 ++--
>  tests/intel/i915_pm_freq_mult.c     |  7 +++---

grep -E -i ':.*firmware' n.*
n.Category:../tests/intel/i915_pm_freq_mult.c: * Category: Firmware
n.Category:../tests/intel/xe_huc_copy.c: * Category: Firmware building block

n.Sub-category:../tests/intel/gem_huc_copy.c: * Sub-category: Firmware
n.Sub-category:../tests/intel/i915_selftest.c: * Sub-category: Firmware
n.Sub-category:../tests/intel/xe_huc_copy.c: * Sub-category: Firmware

so there is conflict where 'Firmware' is both in Category
and Sub-category.

Regards,
Kamil

>  tests/intel/i915_pm_rc6_residency.c |  7 +++---
>  tests/intel/i915_pm_rpm.c           |  7 +++---
>  tests/intel/i915_pm_rps.c           |  7 +++---
>  tests/intel/i915_pm_sseu.c          |  5 ++--
>  tests/intel/i915_power.c            |  7 +++---
>  tests/intel/i915_selftest.c         | 38 +++++++++++++++--------------
>  tests/intel/i915_suspend.c          |  8 +++---
>  tests/intel/xe_gt_freq.c            |  3 ++-
>  tests/intel/xe_pm.c                 |  3 ++-
>  tests/intel/xe_pm_residency.c       |  3 ++-
>  12 files changed, 56 insertions(+), 44 deletions(-)
> 
> diff --git a/tests/intel/gem_ctx_freq.c b/tests/intel/gem_ctx_freq.c
> index db67cade5..c348fe338 100644
> --- a/tests/intel/gem_ctx_freq.c
> +++ b/tests/intel/gem_ctx_freq.c
> @@ -40,9 +40,10 @@
>  /**
>   * TEST: gem ctx freq
>   * Category: Server
> - * Feature: context feature
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: frequency management
> - * Sub-category: Performance
> + * Feature: context feature
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: sysfs
> diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
> index 3c390d427..6d375c5aa 100644
> --- a/tests/intel/i915_pm_freq_mult.c
> +++ b/tests/intel/i915_pm_freq_mult.c
> @@ -14,10 +14,11 @@
>   * TEST: i915 pm freq mult
>   * Description: Tests for sysfs controls (or multipliers) for IP blocks which
>   *		run at frequencies different from the main GT frequency.
> - * Category: Firmware building block
> - * Functionality: freq multipliers
> + * Category: Firmware
> + * Mega feature: Power management
> + * Sub-category: Power management tests
> + * Functionality: freg multipliers
>   * Test category: i915
> - * Sub-category: Power management
>   *
>   * SUBTEST: media-freq
>   * Description: Tests for media frequency factor sysfs
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index be9f9117a..92dae43b3 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -43,10 +43,11 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: i915 pm rc6 residency
> - * Feature: GuCRC, pm_rc6
> - * Functionality: rc6
> - * Sub-category: Power management
>   * Category: Desktop client
> + * Mega feature: Power management
> + * Sub-category: Power management tests
> + * Functionality: rc6
> + * Feature: GuCRC, pm_rc6
>   *
>   * SUBTEST: media-rc6-accuracy
>   * Feature: pm_rc6
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 8ea3fd315..52e00489d 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -42,11 +42,12 @@
>  #include <sys/stat.h>
>  /**
>   * TEST: i915 pm rpm
> - * Feature: pm_rpm
> - * Functionality: D3 state entry-exit
> - * Sub-category: Power management
>   * Category: Desktop client
> + * Mega feature: Power management
> + * Sub-category: Power management tests
> + * Functionality: D3 state entry-exit
>   * Test category: pm_rpm
> + * Feature: pm_rpm
>   *
>   * SUBTEST: debugfs-forcewake-user
>   * SUBTEST: debugfs-read
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 648765b02..4ab137282 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -47,11 +47,12 @@
>  /**
>   * TEST: i915 pm rps
>   * Description: Render P-States tests - verify GPU frequency changes
> + * Category: Desktop client
> + * Mega feature: Power management
> + * Sub-category: Power management tests
> + * Functionality: pm_rps
>   * Feature: pm_rps
>   * Test category: pm_rps
> - * Functionality: rps
> - * Sub-category: Power management
> - * Category: Desktop client
>   *
>   * SUBTEST: basic-api
>   *
> diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
> index 11df4f06c..1fb938893 100644
> --- a/tests/intel/i915_pm_sseu.c
> +++ b/tests/intel/i915_pm_sseu.c
> @@ -38,10 +38,11 @@
>  /**
>   * TEST: i915 pm sseu
>   * Description: Tests slice/subslice/EU power gating functionality.
> - * Feature: pm_sseu
> - * Sub-category: Power management
>   * Category: Desktop client
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: sseu
> + * Feature: pm_sseu
>   *
>   * SUBTEST: full-enable
>   */
> diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
> index fe8437a0f..ef92efb6f 100644
> --- a/tests/intel/i915_power.c
> +++ b/tests/intel/i915_power.c
> @@ -10,11 +10,12 @@
>  /**
>   * TEST: i915 power
>   * Description: i915 power measurement tests
> - * Feature: hwmon
> - * Test category: GEM_Legacy
> - * Sub-category: Power management
>   * Category: Desktop client
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: hwmon
> + * Feature: hwmon
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sanity
>   * Description: Sanity check gpu power measurement
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index a673e9b03..cdaaaf635 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -174,10 +174,11 @@
>   * Sub-category: Mocs
>   *
>   * SUBTEST: live@gt_pm
> - * Category: Selftest
>   * Description: Basic i915 driver module selftests
> + * Category: Selftest
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: rps, rc6
> - * Sub-category: Power management
>   *
>   * SUBTEST: live@gt_timelines
>   * Category: Selftest
> @@ -252,11 +253,12 @@
>   * Test category: i915
>   *
>   * SUBTEST: live@late_gt_pm
> + * Description: Basic i915 driver module selftests
>   * Category: Selftest
> - * Feature: rc6 feature
> - * Functionality: Basic i915 driver module selftests
> - * Test category: rc6
> - * Sub-category: Power management
> + * Mega feature: Power management
> + * Sub-category: Power management tests
> + * Feature: rc6
> + * Functionality: rc6
>   *
>   * SUBTEST: live@lmem
>   * Description: Basic i915 driver module selftests
> @@ -353,20 +355,20 @@
>   * Sub-category: Synchronization
>   *
>   * SUBTEST: live@slpc
> - * Category: Selftest
> - * Feature: slpc feature/ pm_rps
> - * Test category: slpc / pm_rps
>   * Description: Basic i915 driver module selftests
> + * Category: Selftest
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: slpc
> - * Sub-category: Power management
> + * Feature: slpc / pm_rps
>   *
>   * SUBTEST: live@uncore
> - * Category: Selftest
>   * Description: Basic i915 driver module selftests
> - * Feature: forcewake feature
> - * Test category: forcewake
> + * Category: Selftest
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: forcewake
> - * Sub-category: Power management
> + * Feature: forcewake
>   *
>   * SUBTEST: live@vma
>   * Description: Per-object virtual address management
> @@ -532,12 +534,12 @@
>   * Test category: Memory Management
>   *
>   * SUBTEST: mock@uncore
> - * Category: Selftest
>   * Description: Basic i915 driver module selftests
> - * Feature: forcewake feature
> - * Test category: forcewake
> + * Category: Selftest
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: forcewake
> - * Sub-category: Power management
> + * Feature: forcewake
>   *
>   * SUBTEST: mock@vma
>   * Category: Selftest
> diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
> index ae4404101..1f99c2ddc 100644
> --- a/tests/intel/i915_suspend.c
> +++ b/tests/intel/i915_suspend.c
> @@ -46,12 +46,12 @@
>  #include "igt_device_scan.h"
>  /**
>   * TEST: i915 suspend
> - * Feature: suspend feature
> + * Category: Desktop client
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: s2idle w/o i915
>   * Test category: suspend
> - * Functionality: suspend
> - * Sub-category: Power management
> - * Category: Desktop client
> + * Feature: suspend
>   *
>   * SUBTEST: basic-s2idle-without-i915
>   * Description: Validate suspend-to-idle without i915 module
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index c12f6c52c..0c1acc688 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -6,7 +6,8 @@
>  /**
>   * TEST: Test Xe GT frequency request functionality
>   * Category: Infrastructure
> - * Sub-category: Power management
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: frequency request
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 51442537b..24cdeb7ed 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -6,7 +6,8 @@
>  /**
>   * TEST: Check Power Management functionality
>   * Category: Software building block
> - * Sub-category: Power management
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Test category: functionality test
>   */
>  
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index ad70e2430..d58ebe804 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -6,7 +6,8 @@
>  /**
>   * TEST: Test gtidle properties
>   * Category: Software building block
> - * Sub-category: Power management
> + * Mega feature: Power management
> + * Sub-category: Power management tests
>   * Functionality: GT C States
>   * Test category: functionality test
>   */
> -- 
> 2.34.1
> 
