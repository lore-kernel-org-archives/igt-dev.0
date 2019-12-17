Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF7C6E9F8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 14:26:02 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Tue, 17 Dec 2019 14:25:59 +0000
Message-ID: <507a9687789d7c4014f6489be3782d3dfd9201cb.camel@intel.com>
References: <20191217000033.24913-1-imre.deak@intel.com>
 <20191217020237.27522-1-imre.deak@intel.com>
In-Reply-To: <20191217020237.27522-1-imre.deak@intel.com>
Content-Language: en-US
Content-ID: <B656274BFD0E95468E7ADBD6935D7867@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3] lib/igt_fb: Add support for the gen12
 media compressed modifier
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 2019-12-17 at 04:02 +0200, Imre Deak wrote:
> Media compressed framebuffers don't have a CCS CC plane. Add helpers
> to
> select the different types of CCS planes and make sure we setup the
> planes correctly for MC framebuffers too.
> =

> Note that the order of MC framebuffer planes this change assumes is
> =

> plane 0: Y plane
> plane 1: UV plane
> plane 2: CCS plane for plane 0
> plane 3: CCS plane for plane 1
> =

> unlike the order defined in the latest decompression kernel patchset.
> The above order is the logical one that allows us to keep the
> existing
> way of handling the Y/UV planes.
> =

> v2:
> - Fix is_ccs_plane() adding the missing is_ccs_modifier() check.
> v3:
> - Simplify is_ccs_plane(). (DK)
> =

> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  lib/igt_fb.c | 92 ++++++++++++++++++++++++++++++++++++------------
> ----
>  1 file changed, 64 insertions(+), 28 deletions(-)
> =

> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 3b141b93..e6eb39ac 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -487,18 +487,50 @@ static bool is_ccs_modifier(uint64_t modifier)
>  		modifier =3D=3D I915_FORMAT_MOD_Yf_TILED_CCS;
>  }
>  =

> +static bool is_ccs_plane(const struct igt_fb *fb, int plane)
> +{
> +	if (!is_ccs_modifier(fb->modifier))
> +		return false;
> +
> +	return plane >=3D fb->num_planes / 2;
> +}
> +
> +static bool is_gen12_ccs_plane(const struct igt_fb *fb, int plane)
> +{
> +	return is_gen12_ccs_modifier(fb->modifier) && is_ccs_plane(fb,
> plane);
> +}
> +
> +static bool is_gen12_ccs_cc_plane(const struct igt_fb *fb, int
> plane)
> +{
> +	return fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC
> &&
> +	       plane =3D=3D 2;
> +}
> +
> +static int ccs_to_main_plane(const struct igt_fb *fb, int plane)
> +{
> +	if (is_gen12_ccs_cc_plane(fb, plane))
> +		return 0;
> +
> +	return plane - fb->num_planes / 2;
> +}
> +
>  static unsigned fb_plane_width(const struct igt_fb *fb, int plane)
>  {
>  	const struct format_desc_struct *format =3D lookup_drm_format(fb-
> >drm_format);
>  =

> -	if (is_ccs_modifier(fb->modifier) && plane =3D=3D 1) {
> -		if (is_gen12_ccs_modifier(fb->modifier))
> -			return DIV_ROUND_UP(fb->width,
> -					    512 / (fb->plane_bpp[0] /
> 8)) * 64;
> -		else
> -			return DIV_ROUND_UP(fb->width, 1024) * 128;
> -	} else if (is_gen12_ccs_modifier(fb->modifier) && plane =3D=3D 2) {
> +	if (is_gen12_ccs_cc_plane(fb, plane)) {
>  		return 64;
> +	} if (is_gen12_ccs_plane(fb, plane)) {
> +		int main_plane =3D ccs_to_main_plane(fb, plane);
> +		int width =3D fb->width;
> +
> +		if (main_plane)
> +			width =3D DIV_ROUND_UP(width, format->hsub);
> +
> +		return DIV_ROUND_UP(width,
> +				    512 / (fb->plane_bpp[main_plane] /
> 8)) * 64;
> +	} else if (is_ccs_plane(fb, plane)) {
> +		 return DIV_ROUND_UP(fb->width, 1024) * 128;
>  	}
>  =

>  	if (plane =3D=3D 0)
> @@ -511,7 +543,7 @@ static unsigned fb_plane_bpp(const struct igt_fb
> *fb, int plane)
>  {
>  	const struct format_desc_struct *format =3D lookup_drm_format(fb-
> >drm_format);
>  =

> -	if (is_ccs_modifier(fb->modifier) && (plane =3D=3D 1 || plane =3D=3D
> 2))
> +	if (is_ccs_plane(fb, plane))
>  		return 8;
>  	else
>  		return format->plane_bpp[plane];
> @@ -521,13 +553,18 @@ static unsigned fb_plane_height(const struct
> igt_fb *fb, int plane)
>  {
>  	const struct format_desc_struct *format =3D lookup_drm_format(fb-
> >drm_format);
>  =

> -	if (is_ccs_modifier(fb->modifier) && plane =3D=3D 1) {
> -		if (is_gen12_ccs_modifier(fb->modifier))
> -			return DIV_ROUND_UP(fb->height, 128) * 4;
> -		else
> -			return DIV_ROUND_UP(fb->height, 512) * 32;
> -	} else if (is_gen12_ccs_modifier(fb->modifier) && plane =3D=3D 2)
> +	if (is_gen12_ccs_cc_plane(fb, plane)) {
>  		return 1;
> +	} else if (is_gen12_ccs_plane(fb, plane)) {
> +		int height =3D fb->height;
> +
> +		if (ccs_to_main_plane(fb, plane))
> +			height =3D DIV_ROUND_UP(height, format->vsub);
> +
> +		return DIV_ROUND_UP(height, 128) * 4;
> +	} else if (is_ccs_plane(fb, plane)) {
> +		return DIV_ROUND_UP(fb->height, 512) * 32;
> +	}
>  =

>  	if (plane =3D=3D 0)
>  		return fb->height;
> @@ -537,16 +574,15 @@ static unsigned fb_plane_height(const struct
> igt_fb *fb, int plane)
>  =

>  static int fb_num_planes(const struct igt_fb *fb)
>  {
> -	const struct format_desc_struct *format =3D lookup_drm_format(fb-
> >drm_format);
> +	int num_planes =3D lookup_drm_format(fb->drm_format)->num_planes;
>  =

> -	if (is_ccs_modifier(fb->modifier)) {
> -		if (fb->modifier =3D=3D
> I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
> -			return 3;
> -		else
> -			return 2;
> -	} else {
> -		return format->num_planes;
> -	}
> +	if (is_ccs_modifier(fb->modifier))
> +		num_planes *=3D 2;
> +
> +	if (fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
> +		num_planes++;
> +
> +	return num_planes;
>  }
>  =

>  void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
> @@ -604,12 +640,12 @@ static uint32_t calc_plane_stride(struct igt_fb
> *fb, int plane)
>  		 * so the easiest way is to align the luma stride to
> 256.
>  		 */
>  		return ALIGN(min_stride, 256);
> -	} else if (is_gen12_ccs_modifier(fb->modifier) && plane =3D=3D 1) {
> -		/* A main surface using a CCS AUX surface must be 4x4
> tiles aligned. */
> -		return ALIGN(min_stride, 64);
> -	} else if (is_gen12_ccs_modifier(fb->modifier) && plane =3D=3D 2) {
> +	} else if (is_gen12_ccs_cc_plane(fb, plane)) {
>  		/* clear color always fixed to 64 bytes */
>  		return 64;
> +	} else if (is_gen12_ccs_plane(fb, plane)) {
> +		/* A main surface using a CCS AUX surface must be 4x4
> tiles aligned. */
> +		return ALIGN(min_stride, 64);
>  	} else {
>  		unsigned int tile_width, tile_height;
>  =

> @@ -644,7 +680,7 @@ static uint64_t calc_plane_size(struct igt_fb
> *fb, int plane)
>  		size =3D roundup_power_of_two(size);
>  =

>  		return size;
> -	} else if (is_gen12_ccs_modifier(fb->modifier) && (plane =3D=3D 1
> || plane =3D=3D 2)) {
> +	} else if (is_gen12_ccs_plane(fb, plane)) {
>  		/* The AUX CCS surface must be page aligned */
>  		return (uint64_t)fb->strides[plane] *
>  			ALIGN(fb->plane_height[plane], 64);
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
