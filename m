Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC9AC4453A
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 10:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC8510E415;
	Wed, 22 Jul 2026 10:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JM99TOgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F2D10E415
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784715135; x=1816251135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VcLP+XQ8uHf2ZESXh0LTUB9FEW2qg859Y0q10V11uNY=;
 b=JM99TOgrSoPpmlgeqWStgFfPqTbyXEAoF0YVstGkPXOIFcE7xnc+I3dm
 HhQ9K0HQjxupF1gVA1qhBp0EkyPEx1gYAH6WoMJbDvw/kv9N/m9bxPL8+
 djt388xN4PoPGe0RDsRPqVb8TteuQdvG9ih7x7rrqh5xjSUJbaF4Oi6Ep
 FCc4wwUJ/MLlKBMWJW38t9Ze3Eutv3zfnTJ8/XfwW55bfJw1zibEJGz3Q
 ZV9B4o6ofSCCt9haq+yWb0+WmHuXt1R6Q1n6mPwCvCV+cTfe3/HrfNuCA
 kU6peH3neezyNTeWjFzSol1kCtdbKYtNZR6WA6ZcB3/z60UDuxoLzoIdj A==;
X-CSE-ConnectionGUID: kQoTT5d8TTSGMNFX1uH5YQ==
X-CSE-MsgGUID: nmwfn3+dSHqrPxVA/KU0FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96719112"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96719112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:12:14 -0700
X-CSE-ConnectionGUID: cSTZmjFqRC+QhHouxdqN2w==
X-CSE-MsgGUID: HRQs3AVfTWWUl0Y/QEb88A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="282571533"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:12:13 -0700
Date: Wed, 22 Jul 2026 12:12:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org, John Harrison <John.Harrison@Igalia.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_properties: set client cap for color
 pipeline
Message-ID: <20260722101210.ysyesxuzkvys7rab@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org,
 John Harrison <John.Harrison@Igalia.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Melissa Wen <mwen@igalia.com>
References: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
 <20260714144532.351294-2-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714144532.351294-2-chaitanya.kumar.borah@intel.com>
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
On 2026-07-14 at 20:15:32 +0530, Chaitanya Kumar Borah wrote:
> Set DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE for colorop subtests.
> Unset it when done.

As you change this test could you (or someone from cc list?) look
and help with review a series here:

https://patchwork.freedesktop.org/series/167775/
test/kms_colorop_helper: don't request colorop updates indefinitely

Thanks in advance!

Regards,
Kamil

PS. adding to cc Melissa Wen <mwen@igalia.com>

> 
> Cc: John Harrison <John.Harrison@Igalia.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  tests/kms_properties.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index f735839da..93bf1ea26 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -340,10 +340,18 @@ static void colorop_properties(igt_display_t *display, bool atomic)
>  	bool found_any = false, found;
>  	igt_output_t *output;
>  	igt_crtc_t *crtc;
> +	int ret;
>  
>  	/* colorops are only available with atomic */
>  	igt_skip_on(!display->is_atomic);
>  
> +	ret = drmSetClientCap(display->drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1);
> +	igt_skip_on_f(ret, "DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not supported\n");
> +
> +	igt_display_fini(display);
> +	igt_display_require(display, display->drm_fd);
> +	display->has_plane_color_pipeline = true;
> +
>  	for_each_crtc(display, crtc) {
>  		found = false;
>  
> @@ -369,6 +377,12 @@ static void colorop_properties(igt_display_t *display, bool atomic)
>  		}
>  	}
>  
> +	ret = drmSetClientCap(display->drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 0);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_display_fini(display);
> +	igt_display_require(display, display->drm_fd);
> +
>  	igt_skip_on(!found_any);
>  }
>  
> -- 
> 2.25.1
> 
