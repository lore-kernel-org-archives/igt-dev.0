Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8593C61DC4
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 15:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B9010E513;
	Thu, 27 Aug 2026 15:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEMPY/Fw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8905E10F0E6
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787844993; x=1819380993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sTM1T+ANoX9Ek0zTDtEU6EUKiBScOifRtXUIc7yOpZk=;
 b=jEMPY/FwRL3hI6dv6NVW4glzVLPlOVJg4El6dvyZLDnM9YZ/x8q5T3jv
 5hbTIHtyUOAujBpJHHLlPzm+jlTu/3HuXKKxOMyyRsmVPzFcOlT9EN75v
 giT+VQbds1jB1VH/KVc+Um3lwfaOtTSBVBlyOJWiT7uFm/OydkyIvkSoE
 bK4SC9e+2tfi7clYngrxr0NA+DjxHNEwpQc3f//CdCdFXA+RQH93wpkev
 WlEBUlj4NSqUFEUR1OVWDtqrXaKhjQcyiA3ey65GzIUWMchLIo5Nd5EZT
 KOZczPiYdasaoyTqLmoOqHt6wQkP8yu8rWKg4/GVIqtY1JscPVYt4Q8Rt w==;
X-CSE-ConnectionGUID: Gn7CbPR4QEqHNAqZGPUVyA==
X-CSE-MsgGUID: sUWZqR+lQTO/elk3MJHMgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105722603"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="105722603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 08:36:32 -0700
X-CSE-ConnectionGUID: AcOV4YEwQlO8LFdnpm5wgQ==
X-CSE-MsgGUID: mahFMG/NRTeOiPuvB/V31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="271705903"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 08:36:30 -0700
Date: Thu, 27 Aug 2026 17:36:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
Message-ID: <20260827153627.cn5ou4ornidks227@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Alex Hung <alex.hung@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
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

Hi Chaitanya,
On 2026-08-03 at 13:33:40 +0530, Chaitanya Kumar Borah wrote:

small nit about subject, please do not use "C code to english",
rather describe what you try to achive, here better:

[i-g-t] tests/kms_colorop: Get cap color pipeline only once

Regards,
Kamil

> Following the pattern in kms_color_pipeline, set
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
> local variable, then propagate it to display->has_plane_color_pipeline
> after the final igt_display_require() (which reinitializes the display
> state). This avoids calling drmSetClientCap() twice.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  tests/kms_colorop.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 16db0b8ad..d573d2ceb 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  
>  	igt_display_t display;
>  	int i, j, ret;
> +	int has_plane_color_pipeline = 0;
>  
>  	igt_fixture() {
>  		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  
>  		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>  
> -		igt_display_require(&display, display.drm_fd);
>  		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> -			display.has_plane_color_pipeline = 1;
> +			has_plane_color_pipeline = 1;
> +
> +		igt_display_require(&display, display.drm_fd);
>  
>  		kmstest_set_vt_graphics_mode();
>  
>  		igt_display_require(&display, display.drm_fd);
> -		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> -			display.has_plane_color_pipeline = 1;
> +		display.has_plane_color_pipeline = has_plane_color_pipeline;
>  
>  		igt_require(display.is_atomic);
>  	}
> -- 
> 2.50.1
> 
