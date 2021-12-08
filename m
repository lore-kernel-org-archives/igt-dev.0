Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54336E506
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 13:41:18 +0000 (UTC)
References: <20211204034919.14779-1-quic_jesszhan@quicinc.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <328f76bc-1e61-f5f3-160c-7fdedb6db574@amd.com>
Date: Wed, 8 Dec 2021 08:41:13 -0500
In-Reply-To: <20211204034919.14779-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Increase
 buffer size if driver doesn't support larger scale factors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@chromium.org>
Cc: petri.latvala@intel.com, quic_khsieh@quicinc.com, swboyd@chromium.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-12-03 10:49 p.m., Jessica Zhang wrote:
> Catch edge cases where driver doesn't support larger scale factors or
> pipe doesn't support scaling.
> 
> Currently, a 20x20 framebuffer is passed in to be upscaled. However,
> this will cause issues with other drivers as they may not support larger
> scale factors or may not support scaling at all for certain planes.
> 
> This avoids failures due to invalid scale factor by trying
> the original 20x20 framebuffer commit, then trying to commit larger
> framebuffers up to and including unity scale.
> 
> Tested-on: Qualcomm RB5 (sdm845)
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   tests/kms_plane_scaling.c | 52 ++++++++++++++++++++++++++++++---------
>   1 file changed, 41 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 85db11ee..1f0143fc 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1,5 +1,6 @@
>   /*
>    * Copyright © 2013,2014 Intel Corporation
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a
>    * copy of this software and associated documentation files (the "Software"),
> @@ -118,6 +119,30 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> +static int try_commit_with_fb_size(int width, int height, igt_rotation_t rot, igt_display_t *display, data_t *d, igt_plane_t *plane, drmModeModeInfo *mode)
> +{
> +	int ret;
> +
> +	cleanup_crtc(d);
> +
> +	/* Check min to full resolution upscaling */
> +	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> +	igt_fb_set_size(&d->fb[0], plane, width, height);
> +	igt_plane_set_position(plane, 0, 0);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_rotation(plane, rot);
> +
> +	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +
> +	if (!ret) {
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +		igt_plane_set_fb(plane, NULL);
> +		igt_plane_set_position(plane, 0, 0);
> +	}
> +
> +	return ret;
> +}
> +
>   static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   					 uint32_t pixel_format,
>   					 uint64_t modifier, enum pipe pipe,
> @@ -126,10 +151,9 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   {
>   	igt_display_t *display = &d->display;
>   	int width, height;
> +	int commit_ret;
>   	drmModeModeInfo *mode;
>   
> -	cleanup_crtc(d);
> -
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
>   
> @@ -139,16 +163,22 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
>   	igt_plane_set_fb(plane, &d->fb[0]);
>   
> -	/* Check min to full resolution upscaling */
> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> -	igt_fb_set_size(&d->fb[0], plane, width, height);
> -	igt_plane_set_position(plane, 0, 0);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_rotation(plane, rot);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	commit_ret = try_commit_with_fb_size(width, height, rot, display, d, plane, mode);
>   
> -	igt_plane_set_fb(plane, NULL);
> -	igt_plane_set_position(plane, 0, 0);
> +	if(commit_ret == -ERANGE) {
> +		igt_debug("Scaling for %dx%d plane not supported, trying scale factor of 4x\n", width, height);
> +		width = height = mode->vdisplay / 4;
> +		commit_ret = try_commit_with_fb_size(width, height, rot, display, d, plane, mode);
> +	}
> +
> +	if (commit_ret == -ERANGE) {
> +		igt_debug("Scale factor of 4x (or scaling in general) not supported, trying unity scale\n");
> +		width = mode->hdisplay;
> +		height = mode->vdisplay;
> +		commit_ret = try_commit_with_fb_size(width, height, rot, display, d, plane, mode);
> +	}
> +
> +	igt_assert_eq(commit_ret, 0);
>   }
>   
>   static const igt_rotation_t rotations[] = {
> 

Hi Jessica,

I tested this patch on the following AMD ASICs:

1. 5700 XT
2. Raven system
3. WX7100

All failures were fixed after applying your patch (now it skip or pass). 
For this reason:

Tested-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Thanks a lot, that's a very nice improvement.

Best Regard
Siqueira


