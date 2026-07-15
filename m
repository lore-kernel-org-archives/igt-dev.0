Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E81FC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 09:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2125610E14F;
	Wed, 15 Jul 2026 09:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpqdC5aG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FF510E14F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784106500; x=1815642500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qi8JJjaPcN9oQJJPYr/0HsbGpaMsM8prehcRdhBtezQ=;
 b=QpqdC5aGQMkUYFR1A/XL1wCjnQE4RRhOZdHpSfRzClP3qqc9iqZIeed4
 mI9hvBMBFi4Mg7Gilsam8eQv4LeTfoOr3KKo/zubsYZHY0jddgRkGi6D8
 bLi6hyVK9cB7PXdM+4HTma7E5oLMULhT7VwhL+20WlqrsM22viRwi/06m
 g/fGl28T2BvbO8hDBuuLLGiVZB9Kw2um1QsL7ovFHEGs/qpYgDEZcVNxU
 IHdoQFGidOcvHE3tF1oinS53lu+PLzBD4sS6vw3m5lkmoGspQEW6O9d5i
 97FVZV5HvmXYqJhHilBeuWYiyRGkBIgKCs8GbTJuzdtxWCLBvuG+FCAsl w==;
X-CSE-ConnectionGUID: T4J3gmPSSrC4aRJ4R3lk+g==
X-CSE-MsgGUID: o8+IcxjYSjK+q59fCipP2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84763270"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84763270"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 02:08:19 -0700
X-CSE-ConnectionGUID: /rR4My0wRxyYWgbWAZtZOg==
X-CSE-MsgGUID: hHrTe1YfQBWIy46zcsJInQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="260424265"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:08:16 -0700
Date: Wed, 15 Jul 2026 11:08:14 +0200
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
Subject: Re: [PATCH i-g-t v4 2/2] tests/kms_setmode: Add basic-no-cpu-idle
 subtest
Message-ID: <20260715090814.nlllqebxegyy3sp7@kamilkon-DESK.igk.intel.com>
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
References: <20260715030534.1209206-1-jason-jh.lin@mediatek.com>
 <20260715030534.1209206-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715030534.1209206-3-jason-jh.lin@mediatek.com>
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
On 2026-07-15 at 11:04:29 +0800, Jason-JH Lin wrote:
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
>  tests/kms_setmode.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index ef0082dbf70b..a65ea8b232fc 100644
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
> @@ -1034,6 +1042,11 @@ static void run_test(const struct test_config *tconf)
>  		test_combinations(tconf, connector_num);
>  }
>  
> +static void restore_cpu_deep_sleep_at_exit(int sig)
> +{
> +	igt_pm_enable_cpu_deep_sleep();
> +}
> +
>  static int opt_handler(int opt, int opt_index, void *data)
>  {
>  	switch (opt) {
> @@ -1105,6 +1118,30 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
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
> +		igt_install_exit_handler(restore_cpu_deep_sleep_at_exit);
> +		run_test(&tconf);
> +	}
> +
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	igt_fixture() {
>  		drmModeFreeResources(drm_resources);
>  		drm_close_driver(drm_fd);
> -- 
> 2.43.0
> 
