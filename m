Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EDC6E25D
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 23:34:47 +0000 (UTC)
Date: Mon, 10 Feb 2020 15:34:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200210233446.GU232048@mdroper-desk1.amr.corp.intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
 <20200207191524.19362-8-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207191524.19362-8-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] lib/igt_fb: Make sure tiled YUV
 framebuffers are fully cleared
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 09:15:24PM +0200, Imre Deak wrote:
> For tiled FBs that are mapped in an other way than a GTT map we need to
> clear all tile-rows. Clearing only the first stride*height bytes may
> leave tiles at the end of the FB uncleared.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  lib/igt_fb.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index af3291a2..a4db0749 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -841,10 +841,20 @@ static void memset64(uint64_t *s, uint64_t c, size_t n)
>  static void clear_yuv_buffer(struct igt_fb *fb)
>  {
>  	bool full_range = fb->color_range == IGT_COLOR_YCBCR_FULL_RANGE;
> +	size_t plane_size[2];
>  	void *ptr;
>  
>  	igt_assert(igt_format_is_yuv(fb->drm_format));
>  
> +	for (int i = 0; i < min(ARRAY_SIZE(plane_size), fb->num_planes); i++) {

This will still calculate a plane_size[1] for packed YUV + CCS I think,
but I guess that doesn't hurt anything since it just never gets used
below.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +		unsigned int tile_width, tile_height;
> +
> +		igt_get_fb_tile_size(fb->fd, fb->modifier, fb->plane_bpp[i],
> +				     &tile_width, &tile_height);
> +		plane_size[i] = fb->strides[i] *
> +			ALIGN(fb->plane_height[i], tile_height);
> +	}
> +
>  	/* Ensure the framebuffer is preallocated */
>  	ptr = igt_fb_map_buffer(fb->fd, fb);
>  	igt_assert(*(uint32_t *)ptr == 0);
> @@ -853,48 +863,48 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>  	case DRM_FORMAT_NV12:
>  		memset(ptr + fb->offsets[0],
>  		       full_range ? 0x00 : 0x10,
> -		       fb->strides[0] * fb->plane_height[0]);
> +		       plane_size[0]);
>  		memset(ptr + fb->offsets[1],
>  		       0x80,
> -		       fb->strides[1] * fb->plane_height[1]);
> +		       plane_size[1]);
>  		break;
>  	case DRM_FORMAT_XYUV8888:
>  		wmemset(ptr + fb->offsets[0], full_range ? 0x00008080 : 0x00108080,
> -			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
> +			plane_size[0] / sizeof(wchar_t));
>  		break;
>  	case DRM_FORMAT_YUYV:
>  	case DRM_FORMAT_YVYU:
>  		wmemset(ptr + fb->offsets[0],
>  			full_range ? 0x80008000 : 0x80108010,
> -			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
> +			plane_size[0] / sizeof(wchar_t));
>  		break;
>  	case DRM_FORMAT_UYVY:
>  	case DRM_FORMAT_VYUY:
>  		wmemset(ptr + fb->offsets[0],
>  			full_range ? 0x00800080 : 0x10801080,
> -			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
> +			plane_size[0] / sizeof(wchar_t));
>  		break;
>  	case DRM_FORMAT_P010:
>  	case DRM_FORMAT_P012:
>  	case DRM_FORMAT_P016:
>  		wmemset(ptr, full_range ? 0 : 0x10001000,
> -			fb->offsets[1] / sizeof(wchar_t));
> +			plane_size[0] / sizeof(wchar_t));
>  		wmemset(ptr + fb->offsets[1], 0x80008000,
> -			fb->strides[1] * fb->plane_height[1] / sizeof(wchar_t));
> +			plane_size[1] / sizeof(wchar_t));
>  		break;
>  	case DRM_FORMAT_Y210:
>  	case DRM_FORMAT_Y212:
>  	case DRM_FORMAT_Y216:
>  		wmemset(ptr + fb->offsets[0],
>  			full_range ? 0x80000000 : 0x80001000,
> -			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
> +			plane_size[0] / sizeof(wchar_t));
>  		break;
>  
>  	case DRM_FORMAT_XVYU2101010:
>  	case DRM_FORMAT_Y410:
>  		wmemset(ptr + fb->offsets[0],
>  			full_range ? 0x20000200 : 0x20010200,
> -		fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
> +			plane_size[0] / sizeof(wchar_t));
>  		break;
>  
>  	case DRM_FORMAT_XVYU12_16161616:
> @@ -903,7 +913,7 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>  	case DRM_FORMAT_Y416:
>  		memset64(ptr + fb->offsets[0],
>  			 full_range ? 0x800000008000ULL : 0x800010008000ULL,
> -			 fb->strides[0] * fb->plane_height[0] / sizeof(uint64_t));
> +			 plane_size[0] / sizeof(uint64_t));
>  		break;
>  	}
>  
> -- 
> 2.23.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
