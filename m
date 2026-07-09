Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A4CC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 14:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A902110E050;
	Thu,  9 Jul 2026 14:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnlX1ACA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A66010F521
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783605924; x=1815141924;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PXzYw2nE8WXeDrl+9xtCUxAcIBwSNIdZW5HPySqvzdA=;
 b=BnlX1ACAyAqAgEyBGMFGaHPlJ/KDT/9EQr8rvXntMRPbu6F/37KHhzdC
 lgxTWpsADsGx29IvXHlCfgKmGz9vQrYDPrhE44jVMrYxVBKNLfQN7AkmE
 tcNodE4+hipLvbBtHPqD35pR7uhAKyeJDxclz/kTNKPtNhjSG2eI6HjCZ
 uKWyeRbrG19ijIwiMPDLP0uvp8LCtGeT0inkkDz/FgHvswlMjWGHXzbN/
 LzyzhW91JcdKxFgECig5dQP5n1L5nGVccEdZFcGo46/on6eBrpPTe0MTg
 HJwHCbaq8Ku6QSaMec70LJWNZK2R7naoN7p9Vjt5XXy2I4c7OGBzoerTS g==;
X-CSE-ConnectionGUID: RRmKfgTYR0uP0VskdkdX3A==
X-CSE-MsgGUID: V0aXUZSWRrGoymByN6zwqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84305029"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84305029"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 07:05:15 -0700
X-CSE-ConnectionGUID: pciUbqYwQCONUIqqwItlvQ==
X-CSE-MsgGUID: DzEFlVKHSVi7+Loqv3adDw==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 07:05:11 -0700
Date: Thu, 9 Jul 2026 16:05:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
Message-ID: <20260709140509.4utfunjpn4uaejup@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
 <20260621084445.614024-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260621084445.614024-3-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,
On 2026-06-21 at 16:43:28 +0800, Jason-JH Lin wrote:
> Add a new subtest that disables CPU deep sleep to eliminate wakeup
> latency interference during vblank timestamp verification.
> 
> This allows platforms without get_scanout_position() to verify their
> timestamp accuracy is correct, separate from CPU idle interference.
> 
> The original "basic" test remains unchanged to detect any timestamp
> issues including CPU idle interference, while "basic-no-cpu-idle"
> specifically tests timestamp accuracy without external interference.
> 
> Once get_scanout_position() is implemented, the vblank timestamp
> will be accurately compensated regardless of CPU idle states.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_setmode.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 3adc4534ce88..e5f2c4fee141 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -42,6 +42,7 @@
>  #include <math.h>
>  
>  #include "i915/intel_drrs.h"
> +#include "igt_pm.h"
>  #include "xe/xe_query.h"
>  
>  /**
> @@ -49,6 +50,13 @@
>   * Description: Tests the vblank timing by iterating through all valid crtc/connector
>   *              combinations
>   *
> + * SUBTEST: basic-no-cpu-idle
> + * Description: Tests vblank timing with CPU deep sleep disabled to verify
> + *              timestamp accuracy without CPU idle interference. This test
> + *              is for platforms lacking HW/SW get_scanout_position() support,
> + *              allowing them to verify vblank timestamp correctness without
> + *              external CPU wakeup latency interference.
> + *
>   * SUBTEST: basic-clone-single-crtc
>   * Description: Test allows the use of a single CRTC for two connectors, such as VGA/HDMI,
>   *		VGA/DP, and HDMI/HDMI
> @@ -1106,6 +1114,30 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>  
> +	/*
> +	 * This subtest disables CPU deep sleep to eliminate wakeup latency
> +	 * interference during vblank timestamp verification.
> +	 *
> +	 * NOTE: This is for platforms that have not yet implemented
> +	 * get_scanout_position(). Once get_scanout_position() is properly
> +	 * implemented, the vblank timestamp will be accurately compensated
> +	 * regardless of CPU idle states, and this test becomes redundant
> +	 * with the standard "basic" test.
> +	 */
> +	igt_describe("Tests vblank timing with CPU deep sleep disabled");
> +	igt_subtest_with_dynamic("basic-no-cpu-idle") {
> +		struct test_config tconf = {
> +			.flags		= TEST_TIMINGS,
> +			.name		= "basic-no-cpu-idle",
> +			.resources	= drm_resources,
> +		};
> +
> +		igt_require_f(igt_pm_disable_cpu_deep_sleep(),
> +			      "Platform does not support CPU idle control\n");
> +		run_test(&tconf);
> +		igt_pm_enable_cpu_deep_sleep();

Seems ok but this enable will be skipped in case of test fail.
imho you should add enabling to at_exit path.

Regards,
Kamil

> +	}
> +
>  	igt_fixture() {
>  		drmModeFreeResources(drm_resources);
>  		drm_close_driver(drm_fd);
> -- 
> 2.43.0
> 
