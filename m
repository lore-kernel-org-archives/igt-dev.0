Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4B510E164
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jan 2024 15:09:20 +0000 (UTC)
Date: Wed, 3 Jan 2024 16:08:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib: Add non-subsampled YUV formats
Message-ID: <20240103150856.xzddwlvcy4qykgnk@kamilkon-desk.igk.intel.com>
References: <20231228-non-ssampled-yuv-v1-1-06f8e877b566@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231228-non-ssampled-yuv-v1-1-06f8e877b566@riseup.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Arthur,
On 2023-12-28 at 16:10:04 -0300, Arthur Grillo wrote:
> Add support to NV24, NV42, YUV444 and YVU444 non-subsampled YUV formats

Put dot "." at end of sentence above.

One small nit below.

> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  lib/igt_color_encoding.c |  4 ++++
>  lib/igt_fb.c             | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index a7bd2b22f73b..286784f10bbf 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -139,11 +139,15 @@ static const struct color_encoding_format {
>  	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_NV21, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_NV24, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_NV42, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_NV61, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUV420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUV422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUV444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVU420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVU422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVU444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 683eb176b7a4..6e83f817f89c 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -257,6 +257,16 @@ static const struct format_desc_struct {
>  	  .num_planes = 2, .plane_bpp = { 8, 16, },
>  	  .hsub = 2, .vsub = 2,
>  	},
> +	{ .name = "NV24", .depth = -1, .drm_id = DRM_FORMAT_NV24,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 2, .plane_bpp = { 8, 16, },
> +	  .hsub = 1, .vsub = 1,
> +	},
> +	{ .name = "NV42", .depth = -1, .drm_id = DRM_FORMAT_NV42,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 2, .plane_bpp = { 8, 16, },
> +	  .hsub = 1, .vsub = 1,
> +	},
>  	{ .name = "NV61", .depth = -1, .drm_id = DRM_FORMAT_NV61,
>  	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
>  	  .num_planes = 2, .plane_bpp = { 8, 16, },
> @@ -292,6 +302,11 @@ static const struct format_desc_struct {
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
>  	  .hsub = 2, .vsub = 1,
>  	},
> +	{ .name = "YU24", .depth = -1, .drm_id = DRM_FORMAT_YUV444,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 1, .vsub = 1,
> +	},
>  	{ .name = "YV12", .depth = -1, .drm_id = DRM_FORMAT_YVU420,
>  	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> @@ -302,6 +317,11 @@ static const struct format_desc_struct {
>  	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
>  	  .hsub = 2, .vsub = 1,
>  	},
> +	{ .name = "YV24", .depth = -1, .drm_id = DRM_FORMAT_YVU444,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 1, .vsub = 1,
> +	},
>  	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
>  	  .cairo_id = CAIRO_FORMAT_RGBA128F, .convert = true,
>  	  .num_planes = 1, .plane_bpp = { 32, },
> @@ -3395,6 +3415,8 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
> @@ -3405,8 +3427,10 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  		params->ay_inc = 1;
>  		params->uv_inc = 1;
>  		break;
> @@ -3436,11 +3460,15 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
>  	case DRM_FORMAT_P016:
> @@ -3467,6 +3495,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	switch (fb->drm_format) {
>  	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV24:
--------------------- ^^

imho this should be below NV16.

Regards,
Kamil

>  	case DRM_FORMAT_NV16:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[1];
> @@ -3474,6 +3503,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  		break;
>  
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[1] + 1;
> @@ -3482,6 +3512,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[1];
>  		params->v_offset = fb->offsets[2];
> @@ -3489,6 +3520,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>  
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  		params->y_offset = fb->offsets[0];
>  		params->u_offset = fb->offsets[2];
>  		params->v_offset = fb->offsets[1];
> @@ -4222,14 +4254,18 @@ static void fb_convert(struct fb_convert *cvt)
>  		case DRM_FORMAT_NV12:
>  		case DRM_FORMAT_NV16:
>  		case DRM_FORMAT_NV21:
> +		case DRM_FORMAT_NV24:
> +		case DRM_FORMAT_NV42:
>  		case DRM_FORMAT_NV61:
>  		case DRM_FORMAT_UYVY:
>  		case DRM_FORMAT_VYUY:
>  		case DRM_FORMAT_YUV420:
>  		case DRM_FORMAT_YUV422:
> +		case DRM_FORMAT_YUV444:
>  		case DRM_FORMAT_YUYV:
>  		case DRM_FORMAT_YVU420:
>  		case DRM_FORMAT_YVU422:
> +		case DRM_FORMAT_YVU444:
>  		case DRM_FORMAT_YVYU:
>  			convert_yuv_to_rgb24(cvt);
>  			return;
> @@ -4240,14 +4276,18 @@ static void fb_convert(struct fb_convert *cvt)
>  		case DRM_FORMAT_NV12:
>  		case DRM_FORMAT_NV16:
>  		case DRM_FORMAT_NV21:
> +		case DRM_FORMAT_NV24:
> +		case DRM_FORMAT_NV42:
>  		case DRM_FORMAT_NV61:
>  		case DRM_FORMAT_UYVY:
>  		case DRM_FORMAT_VYUY:
>  		case DRM_FORMAT_YUV420:
>  		case DRM_FORMAT_YUV422:
> +		case DRM_FORMAT_YUV444:
>  		case DRM_FORMAT_YUYV:
>  		case DRM_FORMAT_YVU420:
>  		case DRM_FORMAT_YVU422:
> +		case DRM_FORMAT_YVU444:
>  		case DRM_FORMAT_YVYU:
>  			convert_rgb24_to_yuv(cvt);
>  			return;
> @@ -4820,11 +4860,15 @@ bool igt_format_is_yuv(uint32_t drm_format)
>  	case DRM_FORMAT_NV12:
>  	case DRM_FORMAT_NV16:
>  	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV24:
> +	case DRM_FORMAT_NV42:
>  	case DRM_FORMAT_NV61:
>  	case DRM_FORMAT_YUV420:
>  	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>  	case DRM_FORMAT_YVU420:
>  	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
>  	case DRM_FORMAT_P016:
> 
> ---
> base-commit: 0340f23b38ce0fdab61fd0fbe5bc94cd91bcaa0d
> change-id: 20231228-non-ssampled-yuv-e50c1269e225
> 
> Best regards,
> -- 
> Arthur Grillo <arthurgrillo@riseup.net>
> 
