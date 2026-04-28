Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB45FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 07:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1727710E081;
	Tue, 28 Apr 2026 07:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ndet9KKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63F410E142
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 07:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777360206; x=1808896206;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=agUCu+HTOeWfnM7hkPy/WuXnGx7wxDu+Pgabw4MsnaA=;
 b=Ndet9KKV22NlCTsCCUYHf/fOlQjCTK7mvBs3efCbmP6h9vVk+SAwdFZT
 cHhvXxeK+BfK1IM1Zj94GzbSVXu/6IVwAC6lJ1OcjkBlGuamFPQwiVFrq
 hXYe1Q37xMC4cZmX0tkEdf7tNw8hB7012URRhAQVrk0vu0WK82PGWtoHN
 ytSG3toXeu2ufO8orLfMjt3dukPPv7QnSD0xUCZZV/HBL6K4RQLsqHrOH
 LwROngGhURzTTslIThh6D/pNgSE/wJhoBjZbKfiIw6BGW47gCDtvJ2Evz
 ImSsyztLP82U/ooaeXw0If9X26PBUmlnBgC3CmL2tq7KFOVwmcr+pWs9y A==;
X-CSE-ConnectionGUID: 3NoZhS1wSye9CDwnvj2mlg==
X-CSE-MsgGUID: +qIKphZORbOs9PncHeuXag==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="95674635"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="95674635"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:10:06 -0700
X-CSE-ConnectionGUID: 2S66lok8T2GdMKZkz6dSXQ==
X-CSE-MsgGUID: clx17TIWSA+/aehfjYqvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="234150386"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:10:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>, igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [v2] tests/kms_vrr: add support for full range refresh rate
 testing
In-Reply-To: <20260428061202.3557766-1-shawn.c.lee@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260427120955.3537070-1-shawn.c.lee@intel.com>
 <20260428061202.3557766-1-shawn.c.lee@intel.com>
Date: Tue, 28 Apr 2026 10:10:01 +0300
Message-ID: <42aedef3087af5f28e192e26248ed841568d8159@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 28 Apr 2026, Lee Shawn C <shawn.c.lee@intel.com> wrote:
> Currently, kms_vrr tests fixed step increments within the VRR range.
> To better validate hardware stability and potential issues across the
> entire spectrum, this patch adds a 'full-range' testing mode.
>
> When the full-range flag is enabled, the test will:
> 1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
> 2. For standard testing, maintain the existing behavior of incrementing
>    from minimum to maximum using the defined step size.
>
> v2: Fix build failure by adding documentation for the new subtest.
>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  tests/kms_vrr.c | 32 ++++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 6043d40f1d74..b8a8c6aa79ed 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -66,6 +66,9 @@
>   * Description: Test to create a Virtual Mode in VRR range and switch to it
>   * 		without a full modeset.
>   *
> + * SUBTEST: seamless-rr-switch-virtual-full
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
> + *
>   * SUBTEST: lobf
>   * Description: Test to validate link-off between active frames in non-psr
>   *              operation
> @@ -93,9 +96,10 @@ enum {
>  	TEST_FLIPLINE = 1 << 3,
>  	TEST_SEAMLESS_VRR = 1 << 4,
>  	TEST_SEAMLESS_DRRS = 1 << 5,
> -	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> -	TEST_FASTSET = 1 << 7,
> -	TEST_MAXMIN = 1 << 8,
> +	TEST_SEAMLESS_VIRTUAL_RR_FAST = 1 << 6,
> +	TEST_SEAMLESS_VIRTUAL_RR_FULL = 1 << 7,
> +	TEST_FASTSET = 1 << 8,
> +	TEST_MAXMIN = 1 << 9,
>  	TEST_LINK_OFF = 1 << 10,
>  	TEST_NEGATIVE = 1 << 11,
>  	TEST_FORCE_RR = 1 << 12,
> @@ -754,10 +758,12 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>  			       igt_output_t *output, uint32_t flags)
>  {
>  	uint32_t result;
> -	unsigned int vrefresh;
> +	int vrefresh;
>  	uint64_t rate[] = {0};
>  	uint32_t step_size;
> +	int start, end, step;
>  	drmModeModeInfo virtual_mode;
> +	bool full_vrr_range = !!(flags & TEST_SEAMLESS_VIRTUAL_RR_FULL);

Nitpick, that !! is a thing of the past, and completely unnecessary with
stdbool.

BR,
Jani.

>  
>  	igt_info("Use HIGH_RR Mode as default\n");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> @@ -795,7 +801,17 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>  		   (((data->range.max + data->range.min) / 2) + step_size) :
>  		   data->range.min + step_size;
>  
> -	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
> +	if (full_vrr_range) {
> +		start = data->range.max;
> +		end = data->range.min;
> +		step = -1;
> +	} else {
> +		start = data->range.min;
> +		end = data->range.max;
> +		step = step_size;
> +	}
> +
> +	for (vrefresh = start; (step > 0) ? (vrefresh <= end) : (vrefresh >= end); vrefresh += step) {
>  		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
>  
>  		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> @@ -1103,7 +1119,11 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>  
>  		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
>  		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> -			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_FAST);
> +
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-full")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_FULL);
>  
>  		igt_describe("Test to validate the link-off between active frames in "
>  			     "non-PSR operation.");

-- 
Jani Nikula, Intel
