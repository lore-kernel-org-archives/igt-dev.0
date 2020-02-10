Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E4A6E25C
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 22:47:13 +0000 (UTC)
Date: Mon, 10 Feb 2020 14:47:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200210224707.GP232048@mdroper-desk1.amr.corp.intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
 <20200207191524.19362-3-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207191524.19362-3-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/8] tests/kms_available_modes_crc:
 Don't set tiling for framebuffer
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
Cc: igt-dev@lists.freedesktop.org, Vanshidhar Konda <vanshidhar.r.konda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 09:15:19PM +0200, Imre Deak wrote:
> From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> 
> The GEM object used for the framebuffer does not need tiling to be set
> on it as the entire framebuffer is being filled with the same value -
> tiling will not impact the end value of the buffer.
> 
> Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/kms_available_modes_crc.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
> index 12761343..ed43d1fb 100644
> --- a/tests/kms_available_modes_crc.c
> +++ b/tests/kms_available_modes_crc.c
> @@ -211,17 +211,11 @@ static bool setup_fb(data_t *data, igt_output_t *output, igt_plane_t *plane,
>  	data->buf = (unsigned char *)calloc(data->size*2, 1);
>  
>  	data->gem_handle = gem_create(data->gfx_fd, gemsize);
> -	ret = __gem_set_tiling(data->gfx_fd, data->gem_handle,
> -			       igt_fb_mod_to_tiling(tiling),
> -			       data->fb.strides[0]);
> -
>  	data->fb.gem_handle = data->gem_handle;
>  	data->fb.width = w;
>  	data->fb.height = h;
>  	fill_in_fb(data, output, plane, format);
>  
> -	igt_assert_eq(ret, 0);
> -
>  	ret = __kms_addfb(data->gfx_fd, data->gem_handle, w, h,
>  			  format, tiling, data->fb.strides, data->fb.offsets,
>  			  num_planes, LOCAL_DRM_MODE_FB_MODIFIERS,
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
