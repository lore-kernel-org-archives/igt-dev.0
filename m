Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92540C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 15:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2946B10FE22;
	Mon, 11 Mar 2024 15:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaZ4HqtB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6187112AEB
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710169529; x=1741705529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8oblspVwG+RHE8e4hBuX5uBJlRL6IbdEZH0IF2pnfQQ=;
 b=TaZ4HqtB3XM1YUaXxVinfixjDhy52u6apqLGpGJFI2FcrOU2tRthuukm
 J5HHtnIvlsvI9zLgMyM//x1fNoN1vYEoRCNR9TBfDwM+4vqY5bDXNbz+u
 jg8zuoL6sqa3eRqlc2Tp96uyiBzqxipEddLlv5tJjc0DV/6blI9CjgmgQ
 K6Ba2m13iyW5RCFCbDAIMViZcHoY0WqSK9g67mLuBjApYeDGWkGnb1SPw
 8o9dhQDJ4KsYmpo/k199YAQKmKo/M/AkE6SddU98r0oU2VmyCVBud/Oa4
 VO0KXrPT9YP3tVR8MQ0cjGhODAlELm3LjnKQSKouZoqKV3ttIjsTpKMmR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8651092"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8651092"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="48648340"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:05:27 -0700
Date: Mon, 11 Mar 2024 16:05:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 01/25] tests: Introduce uapi subcategory
Message-ID: <20240311150509.npekgjas47kag5u6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240308083657.1092049-2-katarzyna.piecielska@intel.com>
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
On 2024-03-08 at 08:36:33 +0000, Katarzyna Piecielska wrote:
> Let's introduce uapi subcategory to explicitly show where we are testing
> the basics.
> Also fix already set values:
> - fix subcategory for create-ext-set-pat subtest
> - fix functionality for gem_ctx_sseu: s/Sub-slice programming/sseu
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/core_getstats.c              |  4 ++--
>  tests/drm_read.c                   | 17 +++++++++++++++++
>  tests/dumb_buffer.c                |  6 +++---
>  tests/intel/gem_create.c           | 15 +++------------
>  tests/intel/gem_ctx_sseu.c         |  3 +++
>  tests/intel/gem_reg_read.c         |  3 +++
>  tests/intel/gem_reset_stats.c      |  3 +++
>  tests/intel/i915_getparams_basic.c |  2 +-
>  tests/intel/i915_pm_freq_api.c     |  3 +++
>  tests/intel/sysfs_defaults.c       |  6 +++---
>  10 files changed, 41 insertions(+), 21 deletions(-)
> 
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index 8b5655053..1a8ad22c7 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -37,9 +37,9 @@
>   * Category: Desktop client
>   * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
>   * Feature: core
> - * Functionality: permission management for clients
> + * Functionality: DRM memory management
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: uapi
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index 36dc623ed..f8ef324fa 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -50,6 +50,23 @@
>  
>  IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
>  
> +/**
> + * TEST: drm read
> + * Description: boundary testing of read(drm_fd)
> + * Category: Infrastructure
> + * Functionality: DRM memory managemnt
> + * Sub-category: uapi
> + * Run type: FULL
> + *
> + * SUBTEST: invalid-buffer
> + * SUBTEST: fault-buffer
> + * SUBTEST: empty-block
> + * SUBTEST: empty-nonblock
> + * SUBTEST: short-buffer-block
> + * SUBTEST: short-buffer-nonblock
> + * SUBTEST: short-buffer-wakeup
> + */
> +
>  static void sighandler(int sig, siginfo_t * info, void *context)
>  {
>  }
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index 9db857f9f..d76f0c70f 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -54,10 +54,10 @@
>   * Category: Desktop client
>   * Description: This is a test for the generic dumb buffer interface.
>   * Feature: prime
> - * Functionality: IOCTL check for buffer management
> + * Functionality: ioctl
>   * Run type: FULL
> - * Sub-category: Compositor
> - * Test category: GEM_Legacy
> + * Sub-category: uapi
> + * Test category: Compositor
>   *
>   * SUBTEST: create-clear
>   *
> diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
> index 77ffceda4..ae9575089 100644
> --- a/tests/intel/gem_create.c
> +++ b/tests/intel/gem_create.c
> @@ -98,6 +98,9 @@
>   * SUBTEST: create-ext-placement-sanity-check
>   * Description: Exercise create_ext placements extension.
>   *
> + * SUBTEST: create-ext-set-pat
> + * Description:  Create GEM object with specific PAT index
> + *
>   * SUBTEST: create-invalid-size
>   * Description: Try to create a gem object of invalid size 0 and check if
>   *		ioctl returns error.
> @@ -594,18 +597,6 @@ static void create_ext_placement_each(int fd)
>  	free(regions);
>  }
>  
> -/**
> -  * TEST: GEM create uAPI
> -  * Category: Infrastructure
> -  * Description: Tests the DRM_IOCTL_I915_GEM_CREATE_EXT ioctl.
> -  * Feature: core
> -  * Functionality: Create GEM object with specific PAT index
> -  * Run type: BAT
> -  * Sub-category: i915
> -  * Test category: GEM_Legacy
> -  *
> -  * SUBTEST: create-ext-set-pat
> -  */
>  static void create_ext_set_pat(int fd)
>  {
>  	struct drm_i915_gem_create_ext_set_pat setparam_pat = {
> diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
> index 3a01944e4..a9d400c2d 100644
> --- a/tests/intel/gem_ctx_sseu.c
> +++ b/tests/intel/gem_ctx_sseu.c
> @@ -48,6 +48,9 @@
>   * TEST: gem ctx sseu
>   * Description: Test context render powergating programming.
>   * Feature: pm_sseu
> + * Sub-category: uapi
> + * Category: Desktop client
> + * Functionality: sseu
>   * Run type: FULL
>   *
>   * SUBTEST: engines
> diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
> index de6788abe..03b12551d 100644
> --- a/tests/intel/gem_reg_read.c
> +++ b/tests/intel/gem_reg_read.c
> @@ -35,6 +35,9 @@
>  /**
>   * TEST: gem reg read
>   * Feature: gem_core
> + * Sub-category: uapi
> + * Category: Desktop client
> + * Functionality: ioctl
>   * Run type: FULL
>   *
>   * SUBTEST: bad-register
> diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
> index 5dfc1fc67..a62c4061a 100644
> --- a/tests/intel/gem_reset_stats.c
> +++ b/tests/intel/gem_reset_stats.c
> @@ -49,6 +49,9 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem reset stats
> + * Sub-category: uapi
> + * Category: Desktop client
> + * Functionality: reset
>   * Run type: FULL
>   *
>   * SUBTEST: ban-blt
> diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
> index b22ab5d93..971c35e55 100644
> --- a/tests/intel/i915_getparams_basic.c
> +++ b/tests/intel/i915_getparams_basic.c
> @@ -37,7 +37,7 @@
>   * Feature: gem_core
>   * Functionality: device topology
>   * Run type: BAT
> - * Sub-category: i915
> + * Sub-category: uapi
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-eu-total
> diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
> index 6018692a2..aa2de74c9 100644
> --- a/tests/intel/i915_pm_freq_api.c
> +++ b/tests/intel/i915_pm_freq_api.c
> @@ -11,6 +11,9 @@
>  /**
>   * TEST: i915 pm freq api
>   * Description: Test SLPC freq API
> + * Category: Infrastructure
> + * Sub-category: uapi
> + * Functionality: slpc
>   * Run type: FULL
>   *
>   * SUBTEST: freq-basic-api
> diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
> index b686c19fc..a80f7126c 100644
> --- a/tests/intel/sysfs_defaults.c
> +++ b/tests/intel/sysfs_defaults.c
> @@ -37,10 +37,10 @@
>   * TEST: sysfs defaults
>   * Category: Infrastructure
>   * Feature: gem_core
> - * Functionality: driver handler
> - * Run type: FULL
> - * Sub-category: i915
> + * Functionality: sysfs
> + * Sub-category: uapi
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: readonly
>   */
> -- 
> 2.34.1
> 
