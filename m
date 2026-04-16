Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FB5F8D755
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19B410E211;
	Thu, 16 Apr 2026 15:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+JOOVSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BE110E211
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776351667; x=1807887667;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4kxOty+iiDIxLeuHmlz8hje4GRhOYQ2d3nVxZvEYnI4=;
 b=Q+JOOVSXpc6tIFYgksf2dTelT3EtdRv0+X6SbWNwWuKLThWK7LAqU36C
 VRCJZSUI73RJOdNjQ75rW84ro9FCwM3NU3e/bIB/U7i8YWVQ6sekm6w4r
 1vIVgE48qWEwc8mzBMAQtG4IfLjOOMw+1l5Y6TVS1sPB8bmgw8xGyXQXl
 6Tda85cuZKWuSzoRZkfZtlIxfW6mumtj3BNvCoGC5vH37W2zK0STKCoML
 UFssJv1koRv7bewz7zUW1J3PbLw++MF5WZyBgf6uKQLH85C+vb4zo4V4O
 pHgoYNgGlkCc3Vum6prxkLqVVx0RPkOO3PKbShBDxZ4AJ7dv2JjH4TcLh w==;
X-CSE-ConnectionGUID: c2TFc1SgTpWI3obJ3NIsuA==
X-CSE-MsgGUID: yg+gB2ziQziadZ+xoyRWSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88431270"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88431270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:01:06 -0700
X-CSE-ConnectionGUID: 8qKQqngeRViFOAZAbYa/Pw==
X-CSE-MsgGUID: HBwUSEX+S/OZs6HqVBz1bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="261169719"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:01:01 -0700
Date: Thu, 16 Apr 2026 18:00:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jani <jani.nikula@intel.com>, Jeevan <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Fei Shao <fshao@chromium.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v2] tests/kms_setmode: Relax vblank timing
 tolerance from 1 scanline to 1%
Message-ID: <aeD5qtEo0h4KKDu4@intel.com>
References: <20260416144536.3263173-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416144536.3263173-1-jason-jh.lin@mediatek.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Apr 16, 2026 at 10:45:28PM +0800, Jason-JH Lin wrote:
> The original check_timings() validation required vblank intervals to be
> within 1 scanline (~15us for 1080p60) which is overly strict and causes
> false failures due to userspace measurement overhead.
> 
> Changes:
> - Keep original strict checks (1 scanline, 1.718 sigma) as warnings only
> - Add relaxed validation with 1% relative tolerance for pass/fail
> - Use 3 sigma threshold (99.7% confidence) instead of 1.718 sigma (90%)
> 
> Rationale:
> Hardware specs (VESA/HDMI/DP) allow ±0.5% pixel clock tolerance, which
> translates to ±0.5% frame time due to inverse relationship. However,
> userspace measurement via read() syscall adds ~0.3-0.5% overhead from:

read() overhead is irrelevant here. This is measuring the accuracy
of the kernel generated vblank event timestamps. If you are having
problems with this then that would indicate your kernel driver isn't
generating particularly good timestamps, or it's using a dotclock that
doesn't quite match what userspace specified originally.

> - Interrupt latency and scheduling delays (5-50 us)
> - System call overhead (1-5 us)
> - Variable delays depending on system load
> 
> Total tolerance: ±0.5% (hardware) + ~0.5% (software) = ±1.0%
> 
> This makes the test ~11x more tolerant while still detecting real timing
> issues and aligning with industry hardware specifications.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Suggested-by: Jeevain B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 71 +++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 59 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 1f2849bc26cf..b452f8a9e997 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -495,6 +495,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  	double mean;
>  	double stddev;
>  	int n;
> +	bool strict_failed = false;
>  
>  	memset(&wait, 0, sizeof(wait));
>  	wait.request.type = kmstest_get_vbl_flag(crtc_idx);
> @@ -563,10 +564,9 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  
>  	/* 99.7% samples within one scanline on each side of mean */
>  	if (accuracy >= line_time(kmode)) {
> -		igt_info("vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
> -			  accuracy, 100 * accuracy / mean, line_time(kmode));
> -
> -		return false;
> +		igt_warn("vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
> +			 accuracy, 100 * accuracy / mean, line_time(kmode));
> +		strict_failed = true;
>  	}
>  
>  	/* At least 90% of frame times fall within the one scanline on each
> @@ -591,14 +591,61 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  	 * https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distributed_data
>  	 */
>  	if (fabs(mean - expected) >= max(line_time(kmode), 1.718 * stddev)) {
> -		igt_info("vblank interval differs from modeline! expected %.1fus, "
> -			 "measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> -			  expected, mean, stddev,
> -			  fabs(mean - expected),
> -			  fabs(mean - expected) / stddev,
> -			  fabs(mean - expected) / line_time(kmode));
> -
> -		return false;
> +		igt_warn("vblank interval differs from modeline! expected %.1fus, "
> +			 "measured %1.fus +- %.3fus, difference %.1fus "
> +			 "(%.1f sigma, %.1f scanlines)\n",
> +			 expected, mean, stddev,
> +			 fabs(mean - expected),
> +			 fabs(mean - expected) / stddev,
> +			 fabs(mean - expected) / line_time(kmode));
> +		strict_failed = true;
> +	}
> +
> +	if (strict_failed) {
> +		/* Relaxed validation: 1% relative tolerance for accuracy and deviation
> +		 *
> +		 * Hardware specifications (VESA/HDMI/DP) allow ±0.5% pixel clock tolerance.
> +		 * Since frame_time = (htotal × vtotal) / pixel_clock, the relationship is
> +		 * inverse: ±0.5% pixel clock → ±0.5% frame time (in opposite direction).
> +		 *
> +		 * However, userspace measurement introduces additional overhead (~0.3-0.5%):
> +		 *   - Interrupt latency and scheduling delays (5-50 μs)
> +		 *   - System call overhead for read() (1-5 μs)
> +		 *   - Variable delays depending on system load
> +		 *
> +		 * Total tolerance: ±0.5% (hardware) + ~0.5% (software) ≈ ±1.0%
> +		 *
> +		 * For stricter validation matching hardware spec only, use 0.005 (0.5%),
> +		 * but expect potential false failures due to measurement noise.
> +		 */
> +		double tolerance_pct = 0.01;  /* 1% tolerance */
> +		double tolerance_us = expected * tolerance_pct;
> +		double relative_accuracy = accuracy / expected;
> +
> +		/* Check 1: 99.7% samples within 1% of the mean */
> +		if (accuracy >= tolerance_us) {
> +			igt_info("FAIL: vblank accuracy (%.3fus, %.2f%%) exceeds 1%% tolerance "
> +				 "(%.3fus)\n",
> +				 accuracy, 100 * relative_accuracy, tolerance_us);
> +			return false;
> +		}
> +
> +		/* Check 2: Mean within 1% of expected, or within 3 sigma (99.7% confidence) */
> +		if (fabs(mean - expected) >= max(tolerance_us, 3.0 * stddev)) {
> +			igt_info("FAIL: vblank interval differs from expected! expected %.1fus, "
> +				 "measured %.1fus +- %.3fus, difference %.1fus "
> +				 "(%.1f sigma, %.2f%%), "
> +				 "exceeds 1%% tolerance or 3-sigma threshold\n",
> +				 expected, mean, stddev,
> +				 fabs(mean - expected),
> +				 fabs(mean - expected) / stddev,
> +				 100 * fabs(mean - expected) / expected);
> +			return false;
> +		}
> +
> +		igt_info("Passed relaxed validation (strict failed)\n");
> +	} else {
> +		igt_info("Passed strict validation\n");
>  	}
>  
>  	return true;
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
