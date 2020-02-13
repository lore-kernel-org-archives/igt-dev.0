Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B046E15F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2020 11:31:53 +0000 (UTC)
Date: Thu, 13 Feb 2020 13:31:26 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200213113126.GA6331@ideak-desk.fi.intel.com>
References: <20200213093041.10120-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213093041.10120-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_ccs: Use correct CCS plane
 for semiplanar formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 11:30:41AM +0200, Mika Kahola wrote:
> In case with semiplanar formats, we should use correct CCS plane
> when these formats are under a test.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  lib/igt_fb.c    |  2 +-
>  lib/igt_fb.h    |  1 +
>  tests/kms_ccs.c | 27 ++++++++++++++++++++-------
>  3 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 8bdb0a09..0f8435a5 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -359,7 +359,7 @@ static const struct format_desc_struct *lookup_drm_format(uint32_t drm_format)
>  	return NULL;
>  }
>  
> -static bool igt_format_is_yuv_semiplanar(uint32_t format)
> +bool igt_format_is_yuv_semiplanar(uint32_t format)
>  {
>  	const struct format_desc_struct *f = lookup_drm_format(format);
>  
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 5ed9e35a..587f7a44 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -201,6 +201,7 @@ uint32_t igt_drm_format_to_bpp(uint32_t drm_format);
>  const char *igt_format_str(uint32_t drm_format);
>  bool igt_fb_supported_format(uint32_t drm_format);
>  bool igt_format_is_yuv(uint32_t drm_format);
> +bool igt_format_is_yuv_semiplanar(uint32_t format);
>  bool igt_format_is_fp16(uint32_t drm_format);
>  int igt_format_plane_bpp(uint32_t drm_format, int plane);
>  void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index 35c4ceee..284cbbc8 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -163,6 +163,16 @@ static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb)
>  	}
>  }
>  
> +static int get_ccs_plane_index(uint32_t format)
> +{
> +	int index = 1;
> +
> +	if (igt_format_is_yuv_semiplanar(format))
> +		return 2;
> +
> +	return index;
> +}
> +
>  static void generate_fb(data_t *data, struct igt_fb *fb,
>  			int width, int height,
>  			enum test_fb_flags fb_flags)
> @@ -172,6 +182,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  	uint64_t modifier;
>  	cairo_t *cr;
>  	int unit;
> +	int index;
>  	int ret;
>  
>  	if (intel_gen(intel_get_drm_devid(data->drm_fd)) >= 12)
> @@ -196,6 +207,8 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  	else
>  		format = data->format;
>  
> +	index = get_ccs_plane_index(format);
> +
>  	igt_create_bo_for_fb(data->drm_fd, width, height, format, modifier, fb);
>  	igt_assert(fb->gem_handle > 0);
>  
> @@ -205,27 +218,27 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  		if (fb_flags & FB_MISALIGN_AUX_STRIDE) {
>  			igt_skip_on_f(width <= 1024,
>  				      "FB already has the smallest possible stride\n");
> -			f.pitches[1] -= (unit/2);
> +			f.pitches[index] -= (unit/2);
>  		}
>  
>  		if (fb_flags & FB_SMALL_AUX_STRIDE) {
>  			igt_skip_on_f(width <= 1024,
>  				      "FB already has the smallest possible stride\n");
> -			f.pitches[1] = ALIGN(f.pitches[1]/2, unit);
> +			f.pitches[index] = ALIGN(f.pitches[1]/2, unit);
>  		}
>  
>  		if (fb_flags & FB_ZERO_AUX_STRIDE)
> -			f.pitches[1] = 0;
> +			f.pitches[index] = 0;
>  
>  		/* Put the CCS buffer on a different BO. */
>  		if (data->flags & TEST_BAD_CCS_HANDLE)
>  			f.handles[1] = gem_create(data->drm_fd, fb->size);

The above needs to be updated as well.

Looks ok for the Y CCS plane. We should also check the UV CCS plane, but
that can be added later. With the above fixed:

Reviewed-by: Imre Deak <imre.deak@intel.com>

>  
>  		if (data->flags & TEST_NO_AUX_BUFFER) {
> -			f.handles[1] = 0;
> -			f.modifier[1] = 0;
> -			f.pitches[1] = 0;
> -			f.offsets[1] = 0;
> +			f.handles[index] = 0;
> +			f.modifier[index] = 0;
> +			f.pitches[index] = 0;
> +			f.offsets[index] = 0;
>  		}
>  	}
>  
> -- 
> 2.17.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
