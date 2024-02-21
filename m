Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B66C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 12:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2A210E45D;
	Wed, 21 Feb 2024 12:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld1AECwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C69510E619
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708519687; x=1740055687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8gy8eKW1IKEBVEKejIQm/OPuPcY0kGjxtKUc5CdC7Ds=;
 b=Ld1AECwWwEYT7h6RwIiZ4ZpOZzVQTB3JV662muC6vWIYNkVRIJVH77lN
 sY+cu831Jm9BY/+K9tWJP91kQaQP1/09wHmEDoxOmwRboFOZkpTGi3t1l
 URPB8KcrZOqsIQf47TxlamBWnifSoslwAdaeFlLqLxzsW9jT2x16c2eOf
 +bOVyfWw/U2TSXaZ9TuGqqPwZinK8tQUnXklwvDwUcvlLq/7XQFZ6Ae2X
 jCv4UTipjNUA/7y/Iuk4hX3uGevnmwH4/zBWYPH9QnEXWe8AzE0r1K6Sc
 6itDA3ZWbJxDP/v0wiFQC7EaWnldeZoflEVc5HpGsOaUEjFBN+g5Jx1hc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2825119"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2825119"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 04:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="913299180"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="913299180"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 04:48:05 -0800
Date: Wed, 21 Feb 2024 13:47:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_universal_plane: Re-work expectations
 for non-intel hw
Message-ID: <20240221124737.fvmitaily2mury7y@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240215222034.327548-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240215222034.327548-1-robdclark@gmail.com>
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

Hi Rob,
On 2024-02-15 at 14:20:34 -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The expectation assumptions do not fit for non-intel hw.  So re-work the
> expectations and add msm support.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  tests/kms_universal_plane.c | 58 +++++++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 6a39f93cc5aa..a6e11777d04e 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -402,7 +402,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  	sanity_test_t test = { .data = data };
>  	igt_plane_t *primary;
>  	drmModeModeInfo *mode;
> -	int i;
> +	int i, ret;
>  	int expect = 0;
>  
>  	igt_output_set_pipe(output, pipe);
> @@ -432,29 +432,43 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  
>  	igt_plane_set_position(primary, 0, 0);
>  
> -	/* Try to use universal plane API to scale down (should fail on pre-gen9) */
> +	/* Try to use universal plane API to scale down */
>  	if (is_intel_device(data->drm_fd))
>  		expect = (data->display_ver < 9) ? -ERANGE : 0;
> -	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> -				   output->config.crtc->crtc_id,
> -				   test.oversized_fb.fb_id, 0,
> -				   0, 0,
> -				   mode->hdisplay + 100,
> -				   mode->vdisplay + 100,
> -				   IGT_FIXED(0,0), IGT_FIXED(0,0),
> -				   IGT_FIXED(mode->hdisplay,0),
> -				   IGT_FIXED(mode->vdisplay,0)) == expect);
> -
> -	/* Try to use universal plane API to scale up (should fail on pre-gen9) */
> -	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> -				   output->config.crtc->crtc_id,
> -				   test.oversized_fb.fb_id, 0,
> -				   0, 0,
> -				   mode->hdisplay,
> -				   mode->vdisplay,
> -				   IGT_FIXED(0,0), IGT_FIXED(0,0),
> -				   IGT_FIXED(mode->hdisplay - 100,0),
> -				   IGT_FIXED(mode->vdisplay - 100,0)) == expect);
> +	ret = drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> +			      output->config.crtc->crtc_id,
> +			      test.oversized_fb.fb_id, 0,
> +			      0, 0,
> +			      mode->hdisplay + 100,
> +			      mode->vdisplay + 100,
> +			      IGT_FIXED(0,0), IGT_FIXED(0,0),
> +			      IGT_FIXED(mode->hdisplay,0),
> +			      IGT_FIXED(mode->vdisplay,0));
> +	if (is_intel_device(data->drm_fd)) {
> +		/* should fail on pre-gen9 */
> +		igt_assert_eq(ret, (data->display_ver < 9) ? -ERANGE : 0);
> +	} else {
> +		/* Could succeed or fail with -ERANGE depending on hw limits: */
> +		igt_assert((ret == 0) || (ret == -ERANGE));
> +	}
> +
> +	/* Try to use universal plane API to scale up */
> +	ret = drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
> +			      output->config.crtc->crtc_id,
> +			      test.oversized_fb.fb_id, 0,
> +			      0, 0,
> +			      mode->hdisplay,
> +			      mode->vdisplay,
> +			      IGT_FIXED(0,0), IGT_FIXED(0,0),
> +			      IGT_FIXED(mode->hdisplay - 100,0),
> +			      IGT_FIXED(mode->vdisplay - 100,0));
> +	if (is_intel_device(data->drm_fd)) {
> +		/* should fail on pre-gen9 */
> +		igt_assert_eq(ret, (data->display_ver < 9) ? -ERANGE : 0);
> +	} else {
> +		/* Could succeed or fail with -ERANGE depending on hw limits: */
> +		igt_assert((ret == 0) || (ret == -ERANGE));
> +	}

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  	/* Find other crtcs and try to program our primary plane on them */
>  	for (i = 0; i < test.moderes->count_crtcs; i++)
> -- 
> 2.43.0
> 
