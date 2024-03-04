Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48897C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 14:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DBF11223F;
	Mon,  4 Mar 2024 14:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpW9uL9c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562C111223E
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709564263; x=1741100263;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s40sRTkXOj65ski50BpaGXwlI5RvJ/b0YseyHt7KlPs=;
 b=LpW9uL9czU/Nw1QdYl1WpOBL4EGQQqqUYRJWhfa4z1UjHrDqba+iQcvg
 iIHso+h96s2g5d8E4QhRMrGSxXDXHu/ZTlX54kty09KU5rq6drYB6qbQ1
 9QEiB8B3C/0US8X/KUwFQkmas0kfGayWzhW7OlOXbfXudsjGbWvv+N0Ld
 RgGLwHPLQZp9mykkZ4RZbvOp1gjJ0cwjttT6T9pbY4+2/iwp2XGTL4q0Y
 RIZnktr6yL1EKfpQyHm22Iv3uaOAsBFFYCY2Pgs0qYJb8IiHsjkfHSe36
 eul0YTxP5wm35guyVVYg7DwRhaYsvTlHvu//XCVF2fJjrP3XD3BbsbylD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14634696"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14634696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9195928"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:57:31 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id ED4EA580960;
 Mon,  4 Mar 2024 06:57:29 -0800 (PST)
Date: Mon, 4 Mar 2024 15:57:26 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 01/24] tests: Introduce uapi subcategory
Message-ID: <20240304155726.6c9c4233@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-2-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  4 Mar 2024 11:15:54 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's introduce uapi subcategory to explictly show where we are testing
> the basics.
> Also fix already set values:
> - fix subcategory for create-ext-set-pat subtest
> - fix functionality for gem_ctx_sseu: s/Sub-slice programming/sseu
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

For this series, it sounds ok to keep the description empty, but the better
would be to add descriptions for each subtest later on.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

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
