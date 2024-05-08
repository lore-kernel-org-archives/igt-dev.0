Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11D6C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 15:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3605E10E541;
	Wed,  8 May 2024 15:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpqyjYhX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6987F10F07C
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715181185; x=1746717185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h+mPRGoc85XYX4hmlfyw/QnxWHLRqOgRbEwm/lLJHeQ=;
 b=RpqyjYhXDireH8u7YK5CpJJS9wr57XD6dwq4GFm2kbWkoVt//KyjoR7E
 aHePHxpKBRdqIx805Td8A5OXJHH03bHjD1U9668D7QYK+l5MMXgqjpJUy
 6TGUObNqFrm8g8uWYP0TBuokgjO0Ojmn95PHbFlRje6fYQPNRv4xzMuwP
 AOVYx2r06H6hJJTMigsQuySmnl3Dt71oD3JOiXzq+rYWbNanZCCr8jyfG
 23IkolXwBgntwi9MQHhWWvF55nBVulZt7Z/h27UPUuO1tooJsckD1KxFC
 V/rPTdtVCdxyF2YtiBuSzBQoEVDHzQHAPQKExHXp13SA3ycnY8FKy5Ukx Q==;
X-CSE-ConnectionGUID: bCQCMXTXR1WuYIvYmi156w==
X-CSE-MsgGUID: mm/5e5MhSgauYAlW907W/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21722853"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="21722853"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 08:13:04 -0700
X-CSE-ConnectionGUID: lhV/qSCgTCWb/RiLI8TyTg==
X-CSE-MsgGUID: 3bN1uCIeTy2EQsaob7yIEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29315294"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 08:13:03 -0700
Date: Wed, 8 May 2024 17:13:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 bhanuprakash.modem@intel.com, juha-pekka.heikkila@intel.com,
 jani.saarinen@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/kms_big_fb: Fix width calculation
 while creating the intel buf
Message-ID: <20240508151300.it6pnyauxeq6tyed@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 bhanuprakash.modem@intel.com, juha-pekka.heikkila@intel.com,
 jani.saarinen@intel.com
References: <20240507123026.57575-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240507123026.57575-1-vinod.govindapillai@intel.com>
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

Hi Vinod,
On 2024-05-07 at 15:30:26 +0300, Vinod Govindapillai wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 

Please add description here.

Regards,
Kamil

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  lib/igt_draw.c           | 2 +-
>  tests/intel/kms_big_fb.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 2c01d7b02..97a7e6b37 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -650,7 +650,7 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
>  	uint64_t region = driver == INTEL_DRIVER_XE ? vram_if_possible(fd, 0) : -1;
>  	uint64_t size = from->size;
>  
> -	width = from->width;
> +	width = from->stride / (from->bpp / 8);
>  	height = from->height;
>  	if (driver == INTEL_DRIVER_XE)
>  		size = ALIGN(size, xe_get_default_alignment(fd));
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index f7f303d41..1e45d8e42 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -199,7 +199,7 @@ static struct intel_buf *init_buf(data_t *data,
>  	tiling = igt_fb_mod_to_tiling(fb->modifier);
>  	bpp = fb->plane_bpp[0];
>  	size = fb->size;
> -	width = fb->width;
> +	width = fb->strides[0] / (bpp / 8);
>  	height = fb->height;
>  
>  	name = gem_flink(data->drm_fd, fb->gem_handle);
> -- 
> 2.34.1
> 
