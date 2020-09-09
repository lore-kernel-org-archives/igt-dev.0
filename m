Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8148C89FC5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2020 06:51:17 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Wed, 9 Sep 2020 06:51:13 +0000
Message-ID: <2c5152b0d78740d790754e878db075e3@intel.com>
References: <20200908090436.1344-1-sowmyax.kaparthi@intel.com>
In-Reply-To: <20200908090436.1344-1-sowmyax.kaparthi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_scaling: set minimum height
 and width to 20
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
To: "Kaparthi, SowmyaX" <sowmyax.kaparthi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ausmus,
 James" <james.ausmus@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Kaparthi, SowmyaX <sowmyax.kaparthi@intel.com>
> Sent: Tuesday, September 8, 2020 12:05 PM
> To: igt-dev@lists.freedesktop.org; Ausmus, James
> <james.ausmus@intel.com>; Kahola, Mika <mika.kahola@intel.com>;
> Kaparthi, SowmyaX <sowmyax.kaparthi@intel.com>
> Subject: [i-g-t] tests/kms_plane_scaling: set minimum height and width to 20
> 
> Depending on pixel format minimum width and height can be as high as 20.
> Set width and height to 20. Remove is_planar_yuv_format, no longer used.
> 
> Cc: Ausmus, James <james.ausmus@intel.com>
> Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>

The patch look ok to me. The width and height can be divided by 4 and there's no need to have separate width and height for yuv and planar formats.

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  tests/kms_plane_scaling.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c index
> 19087286..ecd2c2e3 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -62,19 +62,6 @@ static int get_num_scalers(data_t* d, enum pipe pipe)
>  		return 1;
>  }
> 
> -static bool is_planar_yuv_format(uint32_t pixelformat) -{
> -	switch (pixelformat) {
> -	case DRM_FORMAT_NV12:
> -	case DRM_FORMAT_P010:
> -	case DRM_FORMAT_P012:
> -	case DRM_FORMAT_P016:
> -		return true;
> -	default:
> -		return false;
> -	}
> -}
> -
>  static void cleanup_fbs(data_t *data)
>  {
>  	int i;
> @@ -147,9 +134,7 @@ static void check_scaling_pipe_plane_rot(data_t *d,
> igt_plane_t *plane,
>  	mode = igt_output_get_mode(output);
> 
>  	/* create buffer in the range of  min and max source side limit.*/
> -	width = height = 8;
> -	if (is_i915_device(d->drm_fd) &&
> is_planar_yuv_format(pixel_format))
> -		width = height = 16;
> +	width = height = 20;
>  	igt_create_color_fb(display->drm_fd, width, height,
>  		       pixel_format, tiling, 0.0, 1.0, 0.0, &d->fb[0]);
>  	igt_plane_set_fb(plane, &d->fb[0]);
> --
> 2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
