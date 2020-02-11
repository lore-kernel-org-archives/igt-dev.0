Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361AA6EE8B
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 15:34:20 +0000 (UTC)
Date: Tue, 11 Feb 2020 07:34:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200211153419.GB1588865@mdroper-desk1.amr.corp.intel.com>
References: <20200211023108.25369-1-imre.deak@intel.com>
 <20200211023108.25369-5-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211023108.25369-5-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH v2 5/8] tests/kms_draw_crc: Fix generating
 reference CRCs on platforms w/o aperture
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

On Tue, Feb 11, 2020 at 04:31:05AM +0200, Imre Deak wrote:
> Generate reference CRCs by drawing through a CPU mapping, which is also
> available on platforms w/o a GTT aperture.
> 
> v2:
> - Fix code comment in draw_method_subtest(). (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/kms_draw_crc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
> index 6de9feae..0e762ad1 100644
> --- a/tests/kms_draw_crc.c
> +++ b/tests/kms_draw_crc.c
> @@ -183,11 +183,11 @@ static void draw_method_subtest(enum igt_draw_method method,
>  
>  	igt_require(format_is_supported(formats[format_index], tiling));
>  
> -	/* Use IGT_DRAW_MMAP_GTT on an untiled buffer as the parameter for
> +	/* Use IGT_DRAW_MMAP_CPU on an untiled buffer as the parameter for
>  	 * comparison. Cache the value so we don't recompute it for every single
>  	 * subtest. */
>  	if (!base_crcs[format_index].set) {
> -		get_method_crc(IGT_DRAW_MMAP_GTT, formats[format_index],
> +		get_method_crc(IGT_DRAW_MMAP_CPU, formats[format_index],
>  			       LOCAL_DRM_FORMAT_MOD_NONE,
>  			       &base_crcs[format_index].crc);
>  		base_crcs[format_index].set = true;
> @@ -225,7 +225,7 @@ static void fill_fb_subtest(void)
>  	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
>  		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
>  
> -	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_GTT,
> +	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_CPU,
>  			 0, 0, fb.width, fb.height, 0xFF);
>  
>  	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
> -- 
> 2.23.1
> 

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
