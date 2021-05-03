Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D78189F47
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 18:48:36 +0000 (UTC)
Date: Mon, 3 May 2021 21:47:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YJBFTJtnHhQx74jd@intel.com>
References: <20210503182555.12284-1-mario.kleiner.de@gmail.com>
 <20210503182555.12284-3-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503182555.12284-3-mario.kleiner.de@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: Add support for testing
 of 16 bpc fixed point formats.
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
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 03, 2021 at 08:25:55PM +0200, Mario Kleiner wrote:
> This is used to support testing the 16 bpc formats, e.g., via:
> =

> kms_plane --run-subtest pixel-format-pipe-A-planes
> =

> So far this was successfully tested on AMD RavenRidge with DCN-1
> display hw.
> =

> The new conversion routines are slightly adapted copies of the
> convert_float_to_fp16() and convert_fp16_to_float() functions,
> with the conversion math modified for float <-> uint16 instead.
> =

> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>  lib/igt_fb.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
> =

> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 954e1181..148e6c0f 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -220,6 +220,22 @@ static const struct format_desc_struct {
>  	  .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
>  	  .num_planes =3D 1, .plane_bpp =3D { 64, },
>  	},
> +	{ .name =3D "XRGB16161616", .depth =3D -1, .drm_id =3D DRM_FORMAT_XRGB1=
6161616,
> +	  .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> +	  .num_planes =3D 1, .plane_bpp =3D { 64, },
> +	},
> +	{ .name =3D "ARGB16161616", .depth =3D -1, .drm_id =3D DRM_FORMAT_ARGB1=
6161616,
> +	  .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> +	  .num_planes =3D 1, .plane_bpp =3D { 64, },
> +	},
> +	{ .name =3D "XBGR16161616", .depth =3D -1, .drm_id =3D DRM_FORMAT_XBGR1=
6161616,
> +	  .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> +	  .num_planes =3D 1, .plane_bpp =3D { 64, },
> +	},
> +	{ .name =3D "ABGR16161616", .depth =3D -1, .drm_id =3D DRM_FORMAT_ABGR1=
6161616,
> +	  .cairo_id =3D CAIRO_FORMAT_RGBA128F, .convert =3D true,
> +	  .num_planes =3D 1, .plane_bpp =3D { 64, },
> +	},
>  	{ .name =3D "NV12", .depth =3D -1, .drm_id =3D DRM_FORMAT_NV12,
>  	  .cairo_id =3D CAIRO_FORMAT_RGB24, .convert =3D true,
>  	  .num_planes =3D 2, .plane_bpp =3D { 8, 16, },
> @@ -3365,9 +3381,13 @@ static const unsigned char *rgbx_swizzle(uint32_t =
format)
>  	default:
>  	case DRM_FORMAT_XRGB16161616F:
>  	case DRM_FORMAT_ARGB16161616F:
> +	case DRM_FORMAT_XRGB16161616:
> +	case DRM_FORMAT_ARGB16161616:
>  		return swizzle_bgrx;
>  	case DRM_FORMAT_XBGR16161616F:
>  	case DRM_FORMAT_ABGR16161616F:
> +	case DRM_FORMAT_XBGR16161616:
> +	case DRM_FORMAT_ABGR16161616:
>  		return swizzle_rgbx;
>  	}
>  }
> @@ -3451,6 +3471,97 @@ static void convert_float_to_fp16(struct fb_conver=
t *cvt)
>  	}
>  }
>  =

> +static void float_to_uint16(const float *f, uint16_t *h, unsigned int nu=
m)
> +{
> +	for (int i =3D 0; i < num; i++)
> +		h[i] =3D f[i] * 65535.0f + 0.5f;
> +}
> +
> +static void uint16_to_float(const uint16_t *h, float *f, unsigned int nu=
m)
> +{
> +	for (int i =3D 0; i < num; i++)
> +		f[i] =3D ((float) h[i]) / 65535.0f;

nit: the cast shouldn't be necessary.

Looks good otherwise.
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +}
> +
> +static void convert_uint16_to_float(struct fb_convert *cvt)
> +{
> +	int i, j;
> +	uint16_t *up16;
> +	float *ptr =3D cvt->dst.ptr;
> +	unsigned int float_stride =3D cvt->dst.fb->strides[0] / sizeof(*ptr);
> +	unsigned int up16_stride =3D cvt->src.fb->strides[0] / sizeof(*up16);
> +	const unsigned char *swz =3D rgbx_swizzle(cvt->src.fb->drm_format);
> +	bool needs_reswizzle =3D swz !=3D swizzle_rgbx;
> +
> +	uint16_t *buf =3D convert_src_get(cvt);
> +	up16 =3D buf + cvt->src.fb->offsets[0] / sizeof(*buf);
> +
> +	for (i =3D 0; i < cvt->dst.fb->height; i++) {
> +		if (needs_reswizzle) {
> +			const uint16_t *u16_tmp =3D up16;
> +			float *rgb_tmp =3D ptr;
> +
> +			for (j =3D 0; j < cvt->dst.fb->width; j++) {
> +				struct igt_vec4 rgb;
> +
> +				uint16_to_float(u16_tmp, rgb.d, 4);
> +
> +				rgb_tmp[0] =3D rgb.d[swz[0]];
> +				rgb_tmp[1] =3D rgb.d[swz[1]];
> +				rgb_tmp[2] =3D rgb.d[swz[2]];
> +				rgb_tmp[3] =3D rgb.d[swz[3]];
> +
> +				rgb_tmp +=3D 4;
> +				u16_tmp +=3D 4;
> +			}
> +		} else {
> +			uint16_to_float(up16, ptr, cvt->dst.fb->width * 4);
> +		}
> +
> +		ptr +=3D float_stride;
> +		up16 +=3D up16_stride;
> +	}
> +
> +	convert_src_put(cvt, buf);
> +}
> +
> +static void convert_float_to_uint16(struct fb_convert *cvt)
> +{
> +	int i, j;
> +	uint16_t *up16 =3D cvt->dst.ptr + cvt->dst.fb->offsets[0];
> +	const float *ptr =3D cvt->src.ptr;
> +	unsigned float_stride =3D cvt->src.fb->strides[0] / sizeof(*ptr);
> +	unsigned up16_stride =3D cvt->dst.fb->strides[0] / sizeof(*up16);
> +	const unsigned char *swz =3D rgbx_swizzle(cvt->dst.fb->drm_format);
> +	bool needs_reswizzle =3D swz !=3D swizzle_rgbx;
> +
> +	for (i =3D 0; i < cvt->dst.fb->height; i++) {
> +		if (needs_reswizzle) {
> +			const float *rgb_tmp =3D ptr;
> +			uint16_t *u16_tmp =3D up16;
> +
> +			for (j =3D 0; j < cvt->dst.fb->width; j++) {
> +				struct igt_vec4 rgb;
> +
> +				rgb.d[0] =3D rgb_tmp[swz[0]];
> +				rgb.d[1] =3D rgb_tmp[swz[1]];
> +				rgb.d[2] =3D rgb_tmp[swz[2]];
> +				rgb.d[3] =3D rgb_tmp[swz[3]];
> +
> +				float_to_uint16(rgb.d, u16_tmp, 4);
> +
> +				rgb_tmp +=3D 4;
> +				u16_tmp +=3D 4;
> +			}
> +		} else {
> +			float_to_uint16(ptr, up16, cvt->dst.fb->width * 4);
> +		}
> +
> +		ptr +=3D float_stride;
> +		up16 +=3D up16_stride;
> +	}
> +}
> +
>  static void convert_pixman(struct fb_convert *cvt)
>  {
>  	pixman_format_code_t src_pixman =3D drm_format_to_pixman(cvt->src.fb->d=
rm_format);
> @@ -3560,6 +3671,12 @@ static void fb_convert(struct fb_convert *cvt)
>  		case DRM_FORMAT_ABGR16161616F:
>  			convert_fp16_to_float(cvt);
>  			return;
> +		case DRM_FORMAT_XRGB16161616:
> +		case DRM_FORMAT_XBGR16161616:
> +		case DRM_FORMAT_ARGB16161616:
> +		case DRM_FORMAT_ABGR16161616:
> +			convert_uint16_to_float(cvt);
> +			return;
>  		}
>  	} else if (cvt->src.fb->drm_format =3D=3D IGT_FORMAT_FLOAT) {
>  		switch (cvt->dst.fb->drm_format) {
> @@ -3589,6 +3706,12 @@ static void fb_convert(struct fb_convert *cvt)
>  		case DRM_FORMAT_ABGR16161616F:
>  			convert_float_to_fp16(cvt);
>  			return;
> +		case DRM_FORMAT_XRGB16161616:
> +		case DRM_FORMAT_XBGR16161616:
> +		case DRM_FORMAT_ARGB16161616:
> +		case DRM_FORMAT_ABGR16161616:
> +			convert_float_to_uint16(cvt);
> +			return;
>  		}
>  	}
>  =

> -- =

> 2.25.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
