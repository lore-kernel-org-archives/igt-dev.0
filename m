Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF39CD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD24C10E321;
	Mon, 15 Jun 2026 09:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RExqzqkO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18AD10E33B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781514857; x=1813050857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4fHTVpgBo4MWm3nENHoJgopGkhy/0MnmPhkcxrNUrxY=;
 b=RExqzqkOZf6cxH6CzQXYzIuwWqKLzR4LIbupZSGOwR4uOWf3qwHbMka5
 4rlJfeSAxM2V/2Mele6ddrPTcnGLJMy+vsbAiUcpLYzjljV8gG3mKOT9l
 9EWLEZg2kklJdvJNidm15XyW3IOJ1aZ9T07n+XyZ5gISWMLe2w0IxNqhl
 w1hqGsMJlpyhDozQUDKVdlEBskugN6Ilc/ACv0hWh9vT9rIsHh2jyIUIK
 qLvjVBQ46f8C0ABLutoANpn9aFQ41X3rrSdRBpb9APNPpOvYLxHtwh7QG
 DHS05qD2Cr/g+1h1XO0Fgcpm3eLi49o07UK5I6R76OFPBOuiFxukamCCh w==;
X-CSE-ConnectionGUID: oF5L+D3QSouVq41mwuaEdg==
X-CSE-MsgGUID: c5PUh2mTQG63BHWxVDFEHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82262330"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82262330"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:14:17 -0700
X-CSE-ConnectionGUID: JADKpJnuQ9GGPIDycTeoNA==
X-CSE-MsgGUID: y7PBIDC9SZ+q6C5720dX5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="244511067"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 02:14:16 -0700
Date: Mon, 15 Jun 2026 11:14:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix tap filter
 test failures
Message-ID: <20260615091400.dotdvrgwfzo4rm2f@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260612093518.2657433-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612093518.2657433-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-06-12 at 15:05:18 +0530, Swati Sharma wrote:
> Fix two issues in the filter-tap subtest:
> 
> 1. get_modes_for_filter_taps() could select modes requiring bigjoiner
> (e.g. 7680x2160@60) for tap filter testing, but joiner + CASF is
> currently unsupported. Filter out such modes using
> igt_bigjoiner_possible() against the platform's max dotclock.
> 
> 2. After each tap iteration, cleanup() calls igt_display_reset() which
> clears the output's pending_crtc binding. Subsequent tap iterations
> (e.g. tap-5 after tap-3) then fail with EIO during pipe CRC
> collection because the output has no CRTC assigned. Fix by
> conditionally restoring the CRTC binding via igt_output_set_crtc()
> when pending_crtc is NULL.

Could you split this into two separate patches? Unless they
share same code, then it could stay as is.

Regards,
Kamil

> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_sharpness_filter.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index 353a9a292..63848dd49 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -358,9 +358,11 @@ static void cleanup(data_t *data)
>  	cleanup_fbs(data);
>  }
>  
> -static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mode[3])
> +static void get_modes_for_filter_taps(int drm_fd, igt_output_t *output,
> +				      drmModeModeInfo *mode[3])
>  {
>  	drmModeConnector *connector = output->config.connector;
> +	int max_dotclock = igt_get_max_dotclock(drm_fd);
>  	int total_pixels = 0;
>  
>  	/*
> @@ -368,8 +370,14 @@ static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mod
>  	 * TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
>  	 * 	  (mode->vdisplay > 1080 && mode->vdisplay < 2160)
>  	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
> +	 *
> +	 * Skip modes requiring joiner since joiner + CASF is unsupported.
>  	 */
>  	for (int i = 0; i < connector->count_modes; i++) {
> +		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i],
> +					   max_dotclock))
> +			continue;
> +
>  		total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
>  
>  		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> @@ -663,11 +671,15 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>  			if (type == TEST_FILTER_TAP) {
>  				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
>  
> -				get_modes_for_filter_taps(output, modes);
> +				get_modes_for_filter_taps(data->drm_fd, output, modes);
>  				for (int i = 0; i < 3; i++) {
>  					data->filter_tap = filter_tap_list[i];
> -					if (!modes[i])
> +					if (!modes[i]) {
> +						igt_info("No valid non-joiner mode for tap-%d on %s\n",
> +							 data->filter_tap,
> +							 igt_output_name(data->output));
>  						continue;
> +					}
>  					data->mode = modes[i];
>  					igt_info("Mode %dx%d@%d on output %s\n",
>  						 data->mode->hdisplay,
> @@ -676,6 +688,9 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>  						 igt_output_name(data->output));
>  					igt_output_override_mode(data->output,
>  								 data->mode);
> +					if (!data->output->pending_crtc)
> +						igt_output_set_crtc(data->output,
> +								    data->crtc);
>  
>  					snprintf(name, sizeof(name), "-tap-%d",
>  						 data->filter_tap);
> -- 
> 2.25.1
> 
