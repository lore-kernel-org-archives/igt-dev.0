Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87187C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AEB10E062;
	Thu, 11 Apr 2024 14:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmEBgvvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8610E062
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712844223; x=1744380223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qe3ZuD1Y0snNarrzIxff0I6C9v7tWE9tnYJquVrLe+Q=;
 b=YmEBgvvFFuVoLCdmGauNrzy5xmxIAxiaDzdN18hZVfk9ty0M1xD4A5c6
 YwaHGkL6CxqLavfxVaORmvHdSOFyMyOgu+c4fxgTOT5AQeXQkBcz1ep2K
 3lprJ4HFCffljcdXZzwC3xo6aHu82Xhzod0Q6oMMvutBUAu+3G4HkT2/0
 NPQWJJq2AoUOvtET3o9fqdw8GSg0T9VtC6u8zse2kLczCG9X7HTuOlEec
 lJYv576My+1gMhlvus13bhLk13bZkrNVmNaZZnP1ipiAzE3eZJikXsr1A
 YIjZ0uw9G4xMeFXAqAYpadYUBFeEIsAuFw02rNr5shpuejoufZwlc6MDo A==;
X-CSE-ConnectionGUID: 6A6NanoPRh+WZc3M1iyoKg==
X-CSE-MsgGUID: v5k0wcVrTGuao0hg6+Mxpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8129830"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8129830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:03:32 -0700
X-CSE-ConnectionGUID: jON3d1tsShexw7VfkziAUg==
X-CSE-MsgGUID: wfhpYmTeQWavgEdQf/2VRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25376618"
Received: from unknown (HELO localhost) ([10.245.246.159])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:03:30 -0700
Date: Thu, 11 Apr 2024 16:03:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [i-g-t,v3,3/5] tests/intel: Remove documentation collision for
 Obsolete category
Message-ID: <20240411140327.humqezdwnfferb66@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240411131554.2999053-4-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240411131554.2999053-4-katarzyna.piecielska@intel.com>
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
On 2024-04-11 at 13:15:52 +0000, Katarzyna Piecielska wrote:
> Let's remove collision in Category and Feature.
> Once I am here let's order docs as in other places:
> 	SUBTEST
> 	Description
> 	Category
> 	Sub-category
> 	Funtionality
> 	Feature
> v2: s/obsolete/obsolete_test/ for 2 remaining kms tests.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_exec_params.c          | 4 ++--
>  tests/intel/gen3_mixed_blits.c         | 4 ++--
>  tests/intel/gen3_render_linear_blits.c | 4 ++--
>  tests/intel/gen3_render_mixed_blits.c  | 4 ++--
>  tests/intel/gen3_render_tiledx_blits.c | 4 ++--
>  tests/intel/gen3_render_tiledy_blits.c | 4 ++--
>  tests/intel/kms_pipe_b_c_ivb.c         | 2 +-
>  tests/intel/perf.c                     | 6 +++---
>  tests/kms_tv_load_detect.c             | 2 +-
>  9 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> index 9ce4d7653..b2f8fb247 100644
> --- a/tests/intel/gem_exec_params.c
> +++ b/tests/intel/gem_exec_params.c
> @@ -111,10 +111,10 @@
>   * SUBTEST: rsvd2-dirt
>   *
>   * SUBTEST: secure-non-master
> - * Feature: cmd_submission, obsolete
> + * Feature: cmd_submission, obsolete test
>   *
>   * SUBTEST: secure-non-root
> - * Feature: cmd_submission, obsolete
> + * Feature: cmd_submission, obsolete test
>   *
>   * SUBTEST: sol-reset-invalid
>   *
> diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
> index ea65579b2..55bbb5d45 100644
> --- a/tests/intel/gen3_mixed_blits.c
> +++ b/tests/intel/gen3_mixed_blits.c
> @@ -50,10 +50,10 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 mixed blits
> - * Feature: obsolete
> + * Category: Obsolete
>   * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> - * Category: Obsolete
> + * Feature: obsolete test
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
> index e370c4406..43a443e0a 100644
> --- a/tests/intel/gen3_render_linear_blits.c
> +++ b/tests/intel/gen3_render_linear_blits.c
> @@ -49,10 +49,10 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 render linear blits
> - * Feature: obsolete
> + * Category: Obsolete
>   * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> - * Category: Obsolete
> + * Feature: obsolete test
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
> index 14fae3e7b..c7336adfe 100644
> --- a/tests/intel/gen3_render_mixed_blits.c
> +++ b/tests/intel/gen3_render_mixed_blits.c
> @@ -50,10 +50,10 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 render mixed blits
> - * Feature: obsolete
> + * Category: Obsolete
>   * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> - * Category: Obsolete
> + * Feature: obsolete test
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
> index a2748f272..f5818135b 100644
> --- a/tests/intel/gen3_render_tiledx_blits.c
> +++ b/tests/intel/gen3_render_tiledx_blits.c
> @@ -50,10 +50,10 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 render tiledx blits
> - * Feature: obsolete
> - * Sub-category: Obsolete_gen3
>   * Category: Obsolete
> + * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> + * Feature: obsolete test
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
> index eb63aaa82..b40be62f6 100644
> --- a/tests/intel/gen3_render_tiledy_blits.c
> +++ b/tests/intel/gen3_render_tiledy_blits.c
> @@ -50,10 +50,10 @@
>  #include "igt.h"
>  /**
>   * TEST: gen3 render tiledy blits
> - * Feature: obsolete
> - * Sub-category: Obsolete_gen3
>   * Category: Obsolete
> + * Sub-category: Obsolete_gen3
>   * Functionality: obsolete_test
> + * Feature: obsolete test
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
> index 73277e970..71699e792 100644
> --- a/tests/intel/kms_pipe_b_c_ivb.c
> +++ b/tests/intel/kms_pipe_b_c_ivb.c
> @@ -30,7 +30,7 @@
>   * Description: Exercise the FDI lane bifurcation code for IVB in the kernel by
>   *              setting different combinations of modes for pipes B and C.
>   * Driver requirement: i915
> - * Functionality: kms_core, obsolete
> + * Functionality: kms_core, obsolete_test
>   * Mega feature: General Display Features
>   * Test category: functionality test
>   */
> diff --git a/tests/intel/perf.c b/tests/intel/perf.c
> index 651ea9fd8..7a63a3bdd 100644
> --- a/tests/intel/perf.c
> +++ b/tests/intel/perf.c
> @@ -99,7 +99,7 @@
>   * Feature: oa perf
>   *
>   * SUBTEST: gen8-unprivileged-single-ctx-counters
> - * Feature: oa perf, obsolete
> + * Feature: oa perf, obsolete test
>   *
>   * SUBTEST: global-sseu-config
>   * Description: Verify specifying SSEU opening parameters
> @@ -155,7 +155,7 @@
>   * Description: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: per-context-mode-unprivileged
> - * Feature: oa perf, obsolete
> + * Feature: oa perf, obsolete test
>   *
>   * SUBTEST: polling
>   * Description: Test polled read with default hrtimer frequency
> @@ -180,7 +180,7 @@
>   * Description: Test the i915 perf metrics streaming interface
>   *
>   * SUBTEST: unprivileged-single-ctx-counters
> - * Feature: oa perf, obsolete
> + * Feature: oa perf, obsolete test
>   *
>   * SUBTEST: whitelisted-registers-userspace-config
>   * Description: Test the i915 perf metrics streaming interface
> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
> index 13394f2c6..7270172a2 100644
> --- a/tests/kms_tv_load_detect.c
> +++ b/tests/kms_tv_load_detect.c
> @@ -34,7 +34,7 @@
>   * SUBTEST: load-detect
>   * Description: Check tv load detection works correctly.
>   * Driver requirement: i915, xe
> - * Functionality: obsolete
> + * Functionality: obsolete test
---------------------------- ^
This should be "obsolete_test", it can be corrected at merge.

With this fixed:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>   * Mega feature: General Display Features
>   * Test category: functionality test
>   */
