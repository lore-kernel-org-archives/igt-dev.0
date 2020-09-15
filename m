Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17316E22E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 07:55:24 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:37:53 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200915073753.GU7444@platvala-desk.ger.corp.intel.com>
References: <20200904005439.17146-1-abhinavk@codeaurora.org>
 <20200904005439.17146-4-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904005439.17146-4-abhinavk@codeaurora.org>
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] lib/igt_fb: move the CTS fill
 framebuffer to igt_fb lib
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: khsieh@codeaurora.org, tanmay@codeaurora.org, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 05:54:37PM -0700, Abhinav Kumar wrote:
> The function to fill the framebuffer with the CTS pattern
> is generic. Move it to the igt_fb layer so that it can be used by
> other modules.
> =

> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_fb.c                | 65 ++++++++++++++++++++++++++++++++++
>  lib/igt_fb.h                |  3 ++
>  tools/intel_dp_compliance.c | 70 ++++++-------------------------------
>  3 files changed, 78 insertions(+), 60 deletions(-)
> =

> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 3864b7a1..d6f0b9ed 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   * Copyright =A9 2013,2014 Intel Corporation
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
> @@ -1280,6 +1281,70 @@ void igt_paint_color(cairo_t *cr, int x, int y, in=
t w, int h,
>  	cairo_fill(cr);
>  }
>  =

> +/**
> + * igt_fill_cts_framebuffer:
> + * @pixmap: handle to the mapped buffer
> + * @video_width: required width for the CTS pattern
> + * @video_height: required height for the CTS pattern
> + * @bitdepth: required bitdepth for the CTS pattern
> + * @alpha: required alpha for the CTS pattern
> + * This functions draws the CTS test pattern for a given width, height.
> + */
> +int igt_fill_cts_framebuffer(uint32_t *pixmap, uint32_t video_width,
> +		uint32_t video_height, uint32_t bitdepth, int alpha)
> +{
> +	uint32_t tile_height, tile_width;
> +	uint32_t *red_ptr, *green_ptr, *blue_ptr;
> +	uint32_t *white_ptr, *src_ptr, *dst_ptr;
> +	int x, y;
> +	int32_t pixel_val;
> +
> +	tile_height =3D 64;
> +	tile_width =3D 1 << bitdepth;
> +
> +	red_ptr =3D pixmap;
> +	green_ptr =3D red_ptr + (video_width * tile_height);
> +	blue_ptr =3D green_ptr + (video_width * tile_height);
> +	white_ptr =3D blue_ptr + (video_width * tile_height);
> +	x =3D 0;
> +
> +	/* Fill the frame buffer with video pattern from CTS 3.1.5 */
> +	while (x < video_width) {
> +		for (pixel_val =3D 0; pixel_val < 256;
> +		     pixel_val =3D pixel_val + (256 / tile_width)) {
> +			red_ptr[x] =3D alpha << 24 | pixel_val << 16;
> +			green_ptr[x] =3D alpha << 24 | pixel_val << 8;
> +			blue_ptr[x] =3D alpha << 24 | pixel_val << 0;
> +			white_ptr[x] =3D alpha << 24 | red_ptr[x] | green_ptr[x] |
> +				       blue_ptr[x];
> +			if (++x >=3D video_width)
> +				break;
> +		}
> +	}
> +	for (y =3D 0; y < video_height; y++) {
> +		if (y =3D=3D 0 || y =3D=3D 64 || y =3D=3D 128 || y =3D=3D 192)
> +			continue;
> +		switch ((y / tile_height) % 4) {
> +		case 0:
> +			src_ptr =3D red_ptr;
> +			break;
> +		case 1:
> +			src_ptr =3D green_ptr;
> +			break;
> +		case 2:
> +			src_ptr =3D blue_ptr;
> +			break;
> +		case 3:
> +			src_ptr =3D white_ptr;
> +			break;
> +		}
> +		dst_ptr =3D pixmap + (y * video_width);
> +		memcpy(dst_ptr, src_ptr, (video_width * 4));
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * igt_paint_color_alpha:
>   * @cr: cairo drawing context
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 5ec906b7..a1f94503 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   * Copyright =A9 2013,2014 Intel Corporation
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
> @@ -206,6 +207,8 @@ bool igt_format_is_fp16(uint32_t drm_format);
>  int igt_format_plane_bpp(uint32_t drm_format, int plane);
>  void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
>  			   bool allow_yuv);
> +int igt_fill_cts_framebuffer(uint32_t *pixmap, uint32_t video_width,
> +		uint32_t video_height, uint32_t bitdepth, int alpha);
>  =

>  #endif /* __IGT_FB_H__ */
>  =

> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index fc512711..c8c5c841 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -448,70 +448,12 @@ static int setup_video_pattern_framebuffer(struct c=
onnector *dp_conn)
>  =

>  }
>  =

> -static int fill_framebuffer(struct connector *dp_conn)
> -{
> -	uint32_t tile_height, tile_width, video_width, video_height;
> -	uint32_t *red_ptr, *green_ptr, *blue_ptr, *white_ptr, *src_ptr, *dst_pt=
r;
> -	int x, y;
> -	int32_t pixel_val;
> -	uint8_t alpha;
> -
> -	video_width =3D dp_conn->test_pattern.hdisplay;
> -	video_height =3D dp_conn->test_pattern.vdisplay;
> -
> -	tile_height =3D 64;
> -	tile_width =3D 1 <<  (dp_conn->test_pattern.bitdepth);
> -
> -	red_ptr =3D dp_conn->test_pattern.pixmap;
> -	green_ptr =3D red_ptr + (video_width * tile_height);
> -	blue_ptr =3D green_ptr + (video_width * tile_height);
> -	white_ptr =3D blue_ptr + (video_width * tile_height);
> -	x =3D 0;
> -
> -	/* Fill the frame buffer with video pattern from CTS 3.1.5 */
> -	while (x < video_width) {
> -		for (pixel_val =3D 0; pixel_val < 256;
> -		     pixel_val =3D pixel_val + (256 / tile_width)) {
> -			alpha =3D gen =3D=3D 10 ? 0xff : 0;
> -			red_ptr[x] =3D alpha << 24 | pixel_val << 16;
> -			green_ptr[x] =3D alpha << 24 | pixel_val << 8;
> -			blue_ptr[x] =3D alpha << 24 | pixel_val << 0;
> -			white_ptr[x] =3D alpha << 24 | red_ptr[x] | green_ptr[x] |
> -				       blue_ptr[x];
> -			if (++x >=3D video_width)
> -				break;
> -		}
> -	}
> -	for (y =3D 0; y < video_height; y++) {
> -		if (y =3D=3D 0 || y =3D=3D 64 || y =3D=3D 128 || y =3D=3D 192)
> -			continue;
> -		switch ((y / tile_height) % 4) {
> -		case 0:
> -			src_ptr =3D red_ptr;
> -			break;
> -		case 1:
> -			src_ptr =3D green_ptr;
> -			break;
> -		case 2:
> -			src_ptr =3D blue_ptr;
> -			break;
> -		case 3:
> -			src_ptr =3D white_ptr;
> -			break;
> -		}
> -		dst_ptr =3D dp_conn->test_pattern.pixmap + (y * video_width);
> -		memcpy(dst_ptr, src_ptr, (video_width * 4));
> -	}
> -	munmap(dp_conn->test_pattern.pixmap,
> -	       dp_conn->test_pattern.size);
> -	return 0;
> -}
> -
>  static int set_test_mode(struct connector *dp_conn)
>  {
>  	int ret =3D 0;
>  	int i;
>  	bool found_std =3D false, found_fs =3D false;
> +	uint32_t alpha;
>  	drmModeConnector *c =3D dp_conn->connector;
>  =

>  	/* Ignore any disconnected devices */
> @@ -584,6 +526,7 @@ static int set_test_mode(struct connector *dp_conn)
>  		dp_conn->test_pattern.hdisplay =3D hdisplay;
>  		dp_conn->test_pattern.vdisplay =3D vdisplay;
>  		dp_conn->test_pattern.bitdepth =3D bitdepth;
> +		alpha =3D gen =3D=3D 10 ? 0xff : 0;
>  =

>  		ret =3D setup_video_pattern_framebuffer(dp_conn);
>  		if (ret) {
> @@ -592,12 +535,19 @@ static int set_test_mode(struct connector *dp_conn)
>  			return ret;
>  		}
>  =

> -		ret =3D fill_framebuffer(dp_conn);
> +		ret =3D igt_fill_cts_framebuffer(dp_conn->test_pattern.pixmap,
> +				dp_conn->test_pattern.hdisplay,
> +				dp_conn->test_pattern.vdisplay,
> +				dp_conn->test_pattern.bitdepth,
> +				alpha);
>  		if (ret) {
>  			igt_warn("Filling framebuffer for connector %u failed (%d)\n",
>  				 c->connector_id, ret);
>  			return ret;
>  		}
> +		/* unmapping the buffer previously mapped during setup */
> +		munmap(dp_conn->test_pattern.pixmap,
> +				dp_conn->test_pattern.size);
>  	}
>  =

>  	return ret;
> -- =

> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
