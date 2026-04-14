Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC34ED7BBA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 10:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B863B10E34F;
	Tue, 14 Apr 2026 10:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5iKVUIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6959010E34F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776163500; x=1807699500;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yaLU8+q1aPYIxbFv3zhnXBV3q8AdLuYJGbwWIwrhsNU=;
 b=X5iKVUIide5e2zMdf2lqArdXeZirDykw7JiMvkK4wIPcgUanDG9SIhHi
 bYRWaOOoP07AE6P4qAGDYP3T0pLrLMRuOK694oTOKY/DtrXgNnzbafsS3
 1rlgAGQ6z0aabwP8BAAJITycRiLneI9XuO5A6BBrRi95ymWaniyEybrEJ
 fSMx+ZhxkGh/VyLZVSOiF9NRY5dAwFX8xcv9BsyHoHp9Frj0Scs/blWKf
 f+y9sF1a5GgdGA0cKY3HX/LpVqFhQX9jFl/qTCs8W7H4J1pCsJZQ12e0f
 YitFrW6osD8HSlBvacCms0QNe/F7id793da3ArB4Sh/pr3LiDfM3nOKl1 A==;
X-CSE-ConnectionGUID: KSEDt/lpTJWzIMoe7ZVXZg==
X-CSE-MsgGUID: DMh2ShDIRnO3E+exitOtcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77188062"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77188062"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 03:45:00 -0700
X-CSE-ConnectionGUID: ltk5vDM4Qqii7RsB1+ZH8w==
X-CSE-MsgGUID: olYVubjqTHm3VGmwLNSD+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253282875"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 03:44:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t] tests/kms_invalid_mode: Allow clock-too-high test
 on non-Intel platforms
In-Reply-To: <20260414101108.1920755-1-jason-jh.lin@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260414101108.1920755-1-jason-jh.lin@mediatek.com>
Date: Tue, 14 Apr 2026 13:44:52 +0300
Message-ID: <0399eabf55ed7aefb133376cfe307e468d646f91@intel.com>
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

On Tue, 14 Apr 2026, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
> The clock-too-high subtest was being skipped on non-Intel platforms
> because igt_get_max_dotclock() returns 0 when reading from
> Intel-specific debugfs fails.
>
> This change allows the test to run on all platforms by:
> - Using a clearly invalid clock value (10 GHz) when max_dotclock is
>   unavailable, which any reasonable driver should reject
> - Restricting bigjoiner/ultrajoiner logic to Intel devices only
>
> This prevents the test from being marked as IGNORED/SKIP on non-Intel
> platforms while maintaining the original test intent of verifying that
> drivers properly reject modes with excessively high clock rates.
>
> Tested on MTK platforms where the test now properly executes and
> verifies invalid clock validation.

I think overall we'll need a framework to ask platform/device specific
things instead of portraying the services as generic, like
igt_get_max_dotclock().

>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_invalid_mode.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 5edffb649ef4..18d79e59c736 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -126,7 +126,13 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
>  {
>  	int max_dotclock = data->max_dotclock;
>  
> -	igt_require(max_dotclock != 0);
> +	/*
> +	 * If max_dotclock is unavailable (e.g., non-Intel platforms),
> +	 * use an obviously invalid value that any driver should reject.
> +	 * 10 GHz is well beyond any reasonable hardware capability.
> +	 */
> +	if (max_dotclock == 0)
> +		max_dotclock = 10000000;  /* 10 GHz in kHz */

Not a fan of using magic numbers like this.

Perhaps

	if (!max_dotclock) {
		mode->clock = -1;
		return;
	}

would be less magic?

>  
>  	/*
>  	 * FIXME When we have a fixed mode, the kernel will ignore
> @@ -139,21 +145,23 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
>  	if (has_scaling_mode_prop(data))
>  		return false;
>  
> -	/*
> -	 * Newer platforms can support modes higher than the maximum dot clock
> -	 * by using pipe joiner, so set the mode clock twice that of maximum
> -	 * dot clock;
> -	 */
> -	if (can_bigjoiner(data)) {
> -		igt_info("Platform supports bigjoiner with %s\n",
> -			 data->output->name);
> -		max_dotclock *= 2;
> -	}
> +	if (is_intel_device(data->drm_fd)) {
> +		/*
> +		 * Newer platforms can support modes higher than the maximum dot clock
> +		 * by using pipe joiner, so set the mode clock twice that of maximum
> +		 * dot clock;
> +		 */
> +		if (can_bigjoiner(data)) {
> +			igt_info("Platform supports bigjoiner with %s\n",
> +				 data->output->name);
> +			max_dotclock *= 2;
> +		}
>  
> -	if (can_ultrajoiner(data)) {
> -		igt_info("Platform supports ultrajoiner with %s\n",
> -			 data->output->name);
> -		max_dotclock *= 4;
> +		if (can_ultrajoiner(data)) {
> +			igt_info("Platform supports ultrajoiner with %s\n",
> +				 data->output->name);
> +			max_dotclock *= 4;
> +		}
>  	}
>  
>  	mode->clock = max_dotclock + 1;

-- 
Jani Nikula, Intel
