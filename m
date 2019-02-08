Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C1C6E7D3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 08:07:32 +0000 (UTC)
References: <20190207092136.10659-1-maarten.lankhorst@linux.intel.com>
 <20190207092136.10659-2-maarten.lankhorst@linux.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <3d355364-1a31-f86d-658f-5cc5af35e5ed@intel.com>
Date: Fri, 8 Feb 2019 13:37:28 +0530
MIME-Version: 1.0
In-Reply-To: <20190207092136.10659-2-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v2 2/4] lib/igt_fb: Add support for P01x
 formats, v4.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0006639184=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0006639184==
Content-Type: multipart/alternative;
 boundary="------------97152EB8A070FDAF9F257DDF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------97152EB8A070FDAF9F257DDF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested V4 P0xx pixel formats on ICL U h/w. Working fine for HDR planes. 
SDR planes having CRC mismatch for all the YUV formats.

On 07-Feb-19 2:51 PM, Maarten Lankhorst wrote:
> The P01x formats are planar 16 bits per component, with the unused lower bits set to 0.
> This means they can all be converted the same way. Only the range is slightly different,
> and this is handled in the color_encoding implementation.
>
> This requires cairo 1.17.2 and pixman 0.36. This works but doesn't give extra precision.
> For more than 8 bits precision a few more patches are required to pixman, pending review:
> https://lists.freedesktop.org/archives/pixman/2019-January/004815.html
> https://lists.freedesktop.org/archives/pixman/2019-January/004809.html
>
> Once those are merged, we will require the next pixman release for better precision.
>
> Changes since v1:
> - Add fallback color definitions when compiling on cairo version < 1.17.2.
> - Skip when FB creation fails on HDR formats, instead of failing.
> Changes since v2:
> - Complain slightly harder when pixman/cairo are out of date.
> - Create a fb with alpha when converting to pixman formats with alpha.
> - Oops, s/pixman_format_code_t/cairo_format_t/
> Changes since v3:
> - Rebase on top of upstream YUV changes.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   configure.ac                  |  11 +-
>   include/drm-uapi/drm_fourcc.h |  10 ++
>   lib/igt_color_encoding.c      |   4 +
>   lib/igt_fb.c                  | 293 +++++++++++++++++++++++++++++++++-
>   lib/igt_fb.h                  |   6 +
>   meson.build                   |  10 ++
>   6 files changed, 329 insertions(+), 5 deletions(-)
>
> diff --git a/configure.ac b/configure.ac
> index b46f024f875a..a333cf8d6dbb 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -136,10 +136,17 @@ fi
>   PKG_CHECK_MODULES(XRANDR, xrandr >= 1.3, AC_DEFINE(HAVE_XRANDR, 1, [Have libXrandr]), [have_xrandr=no])
>   
>   # for testdisplay
> -PKG_CHECK_MODULES(CAIRO, [cairo >= 1.12.0])
> +PKG_CHECK_MODULES(CAIRO, [cairo >= 1.17.2], [],
> +	[AC_MSG_WARN([Cairo too old, HDR formats not available. Upgrade to cairo 1.17.2])
> +	PKG_CHECK_MODULES(CAIRO, [cairo >= 1.12.0])]
> +)
>   PKG_CHECK_MODULES(LIBUDEV, [libudev])
>   PKG_CHECK_MODULES(GLIB, [glib-2.0])
> -PKG_CHECK_MODULES(PIXMAN, [pixman-1])
> +PKG_CHECK_MODULES(PIXMAN, [pixman-1 >= 0.36.0], [], [
> +	AC_MSG_WARN([Pixman too old, HDR formats not available. Upgrade to pixman 0.36.0])
> +	PKG_CHECK_MODULES(PIXMAN, [pixman-1])
> +])
> +
>   PKG_CHECK_MODULES(GSL, [gsl], [gsl=yes], [gsl=no])
>   AM_CONDITIONAL(HAVE_GSL, [test "x$gsl" = xyes])
>   
> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index 41106c835747..fe6b66ef1756 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -195,6 +195,16 @@ extern "C" {
>   #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
>   #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
>   
> +/*
> + * 2 plane YCbCr
> + * index 0 = Y plane, [15:0] Y little endian where Pxxx indicate
> + * component xxx msb Y [xxx:16-xxx]
> + * index 1 = Cr:Cb plane, [31:0] Cr:Cb little endian [xxx:16-xxx:xxx:16-xxx]
> + */
> +#define DRM_FORMAT_P010		fourcc_code('P', '0', '1', '0') /* 2x2 subsampled Cr:Cb plane, 10 bit per channel */
> +#define DRM_FORMAT_P012		fourcc_code('P', '0', '1', '2') /* 2x2 subsampled Cr:Cb plane, 12 bit per channel */
> +#define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane, 16 bit per channel */
> +
>   /*
>    * 3 plane YCbCr
>    * index 0: Y plane, [7:0] Y
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index 4cbe18e217e3..b7a12a1e07f7 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -135,11 +135,15 @@ static const struct color_encoding_format {
>   	float ofs_y, max_y, ofs_cbcr, mid_cbcr, max_cbcr;
>   } formats[] = {
>   	{ DRM_FORMAT_XRGB8888, 255.f, },
> +	{ IGT_FORMAT_FLOAT, 1.f, },
>   	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_VYUY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_P010, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
> +	{ DRM_FORMAT_P012, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
> +	{ DRM_FORMAT_P016, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
>   };
>   
>   static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index db3ae06748d1..12763cc85c86 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -62,6 +62,20 @@
>   
>   #define PIXMAN_invalid	0
>   
> +#if CAIRO_VERSION < CAIRO_VERSION_ENCODE(1, 17, 2)
> +/*
> + * We need cairo 1.17.2 to use HDR formats, but the only thing added is a value
> + * to cairo_format_t.
> + *
> + * To prevent going outside the enum, make cairo_format_t an int and define
> + * ourselves.
> + */
> +
> +#define CAIRO_FORMAT_RGB96F (6)
> +#define CAIRO_FORMAT_RGBA128F (7)
> +#define cairo_format_t int
> +#endif
> +
>   /* drm fourcc/cairo format maps */
>   static const struct format_desc_struct {
>   	const char *name;
> @@ -170,6 +184,25 @@ static const struct format_desc_struct {
>   	  .num_planes = 1, .plane_bpp = { 16, },
>   	  .hsub = 2, .vsub = 1,
>   	},
> +	{ .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
> +	  .cairo_id = CAIRO_FORMAT_RGB96F,
> +	  .num_planes = 2, .plane_bpp = { 16, 32 },
> +	  .vsub = 2, .hsub = 2,
> +	},
> +	{ .name = "P012", .depth = -1, .drm_id = DRM_FORMAT_P012,
> +	  .cairo_id = CAIRO_FORMAT_RGB96F,
> +	  .num_planes = 2, .plane_bpp = { 16, 32 },
> +	  .vsub = 2, .hsub = 2,
> +	},
> +	{ .name = "P016", .depth = -1, .drm_id = DRM_FORMAT_P016,
> +	  .cairo_id = CAIRO_FORMAT_RGB96F,
> +	  .num_planes = 2, .plane_bpp = { 16, 32 },
> +	  .vsub = 2, .hsub = 2,
> +	},
> +	{ .name = "IGT-FLOAT", .depth = -1, .drm_id = IGT_FORMAT_FLOAT,
> +	  .cairo_id = CAIRO_FORMAT_INVALID,
> +	  .num_planes = 1, .plane_bpp = { 128 },
> +	},
>   };
>   #define for_each_format(f)	\
>   	for (f = format_desc; f - format_desc < ARRAY_SIZE(format_desc); f++)
> @@ -520,6 +553,14 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>   			full_range ? 0x00800080 : 0x10801080,
>   			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
>   		break;
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +		wmemset(ptr, full_range ? 0 : 0x10001000,
> +			fb->offsets[1] / sizeof(wchar_t));
> +		wmemset(ptr + fb->offsets[1], 0x80008000,
> +			fb->strides[1] * fb->plane_height[1] / sizeof(wchar_t));
> +		break;
>   	}
>   
>   	igt_fb_unmap_buffer(fb, ptr);
> @@ -1496,6 +1537,7 @@ struct fb_convert_blit_upload {
>   };
>   
>   static void *igt_fb_create_cairo_shadow_buffer(int fd,
> +					       unsigned drm_format,
>   					       unsigned int width,
>   					       unsigned int height,
>   					       struct igt_fb *shadow)
> @@ -1505,7 +1547,7 @@ static void *igt_fb_create_cairo_shadow_buffer(int fd,
>   	igt_assert(shadow);
>   
>   	fb_init(shadow, fd, width, height,
> -		DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> +		drm_format, LOCAL_DRM_FORMAT_MOD_NONE,
>   		IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
>   
>   	shadow->strides[0] = ALIGN(width * shadow->plane_bpp[0], 16);
> @@ -1599,6 +1641,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   
>   	switch (fb->drm_format) {
>   	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
>   		params->y_inc = 1;
>   		params->uv_inc = 2;
>   		break;
> @@ -1619,6 +1664,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   
>   	switch (fb->drm_format) {
>   	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
>   		params->y_stride = fb->strides[0];
>   		params->uv_stride = fb->strides[1];
>   		break;
> @@ -1640,6 +1688,14 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   		params->v_offset = fb->offsets[1] + 1;
>   		break;
>   
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +		params->y_offset = fb->offsets[0];
> +		params->u_offset = fb->offsets[1];
> +		params->v_offset = fb->offsets[1] + 2;
> +		break;
> +
>   	case DRM_FORMAT_YUYV:
>   		params->y_offset = fb->offsets[0];
>   		params->u_offset = fb->offsets[0] + 1;
> @@ -1821,6 +1877,178 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
>   	}
>   }
>   
> +static void read_rgbf(struct igt_vec4 *rgb, const float *rgb24)
> +{
> +	rgb->d[0] = rgb24[0];
> +	rgb->d[1] = rgb24[1];
> +	rgb->d[2] = rgb24[2];
> +	rgb->d[3] = 1.0f;
> +}
> +
> +static void write_rgbf(float *rgb24, const struct igt_vec4 *rgb)
> +{
> +	rgb24[0] = rgb->d[0];
> +	rgb24[1] = rgb->d[1];
> +	rgb24[2] = rgb->d[2];
> +}
> +
> +static void convert_yuv16_to_float(struct fb_convert *cvt)
> +{
> +	const struct format_desc_struct *src_fmt =
> +		lookup_drm_format(cvt->src.fb->drm_format);
> +	int i, j;
> +	uint8_t fpp = 3;
> +	uint16_t *y, *u, *v;
> +	float *ptr = cvt->dst.ptr;
> +	unsigned int float_stride = cvt->dst.fb->strides[0] / sizeof(*ptr);
> +	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt->src.fb->drm_format,
> +						    cvt->dst.fb->drm_format,
> +						    cvt->src.fb->color_encoding,
> +						    cvt->src.fb->color_range);
> +	uint16_t *buf;
> +	struct yuv_parameters params = { };
> +
> +	igt_assert(cvt->dst.fb->drm_format == IGT_FORMAT_FLOAT &&
> +		   igt_format_is_yuv(cvt->src.fb->drm_format));
> +
> +	buf = convert_src_get(cvt);
> +	get_yuv_parameters(cvt->src.fb, &params);
> +	igt_assert(!(params.y_offset % sizeof(*buf)) &&
> +		   !(params.u_offset % sizeof(*buf)) &&
> +		   !(params.v_offset % sizeof(*buf)));
> +
> +	y = buf + params.y_offset / sizeof(*buf);
> +	u = buf + params.u_offset / sizeof(*buf);
> +	v = buf + params.v_offset / sizeof(*buf);
> +
> +	for (i = 0; i < cvt->dst.fb->height; i++) {
> +		const uint16_t *y_tmp = y;
> +		const uint16_t *u_tmp = u;
> +		const uint16_t *v_tmp = v;
> +		float *rgb_tmp = ptr;
> +
> +		for (j = 0; j < cvt->dst.fb->width; j++) {
> +			struct igt_vec4 rgb, yuv;
> +
> +			yuv.d[0] = *y_tmp;
> +			yuv.d[1] = *u_tmp;
> +			yuv.d[2] = *v_tmp;
> +			yuv.d[3] = 1.0f;
> +
> +			rgb = igt_matrix_transform(&m, &yuv);
> +			write_rgbf(rgb_tmp, &rgb);
> +
> +			rgb_tmp += fpp;
> +			y_tmp += params.y_inc;
> +
> +			if ((src_fmt->hsub == 1) || (j % src_fmt->hsub)) {
> +				u_tmp += params.uv_inc;
> +				v_tmp += params.uv_inc;
> +			}
> +		}
> +
> +		ptr += float_stride;
> +		y += params.y_stride / sizeof(*y);
> +
> +		if ((src_fmt->vsub == 1) || (i % src_fmt->vsub)) {
> +			u += params.uv_stride / sizeof(*u);
> +			v += params.uv_stride / sizeof(*v);
> +		}
> +	}
> +
> +	convert_src_put(cvt, buf);
> +}
> +
> +static void convert_float_to_yuv16(struct fb_convert *cvt)
> +{
> +	const struct format_desc_struct *dst_fmt =
> +		lookup_drm_format(cvt->dst.fb->drm_format);
> +	int i, j;
> +	uint16_t *y, *u, *v;
> +	const float *ptr = cvt->src.ptr;
> +	uint8_t fpp = 3;
> +	unsigned float_stride = cvt->src.fb->strides[0] / sizeof(*ptr);
> +	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt->src.fb->drm_format,
> +						    cvt->dst.fb->drm_format,
> +						    cvt->dst.fb->color_encoding,
> +						    cvt->dst.fb->color_range);
> +	struct yuv_parameters params = { };
> +
> +	igt_assert(cvt->src.fb->drm_format == IGT_FORMAT_FLOAT &&
> +		   igt_format_is_yuv(cvt->dst.fb->drm_format));
> +
> +	get_yuv_parameters(cvt->dst.fb, &params);
> +	igt_assert(!(params.y_offset % sizeof(*y)) &&
> +		   !(params.u_offset % sizeof(*u)) &&
> +		   !(params.v_offset % sizeof(*v)));
> +
> +	y = cvt->dst.ptr + params.y_offset;
> +	u = cvt->dst.ptr + params.u_offset;
> +	v = cvt->dst.ptr + params.v_offset;
> +
> +	for (i = 0; i < cvt->dst.fb->height; i++) {
> +		const float *rgb_tmp = ptr;
> +		uint16_t *y_tmp = y;
> +		uint16_t *u_tmp = u;
> +		uint16_t *v_tmp = v;
> +
> +		for (j = 0; j < cvt->dst.fb->width; j++) {
> +			const float *pair_float = rgb_tmp;
> +			struct igt_vec4 pair_rgb, rgb;
> +			struct igt_vec4 pair_yuv, yuv;
> +
> +			read_rgbf(&rgb, rgb_tmp);
> +			yuv = igt_matrix_transform(&m, &rgb);
> +
> +			rgb_tmp += fpp;
> +
> +			*y_tmp = yuv.d[0];
> +			y_tmp += params.y_inc;
> +
> +			if ((i % dst_fmt->vsub) || (j % dst_fmt->hsub))
> +				continue;
> +
> +			/*
> +			 * We assume the MPEG2 chroma siting convention, where
> +			 * pixel center for Cb'Cr' is between the left top and
> +			 * bottom pixel in a 2x2 block, so take the average.
> +			 *
> +			 * Therefore, if we use subsampling, we only really care
> +			 * about two pixels all the time, either the two
> +			 * subsequent pixels horizontally, vertically, or the
> +			 * two corners in a 2x2 block.
> +			 *
> +			 * The only corner case is when we have an odd number of
> +			 * pixels, but this can be handled pretty easily by not
> +			 * incrementing the paired pixel pointer in the
> +			 * direction it's odd in.
> +			 */
> +			if (j != (cvt->dst.fb->width - 1))
> +				pair_float += (dst_fmt->hsub - 1) * fpp;
> +
> +			if (i != (cvt->dst.fb->height - 1))
> +				pair_float += float_stride * (dst_fmt->vsub - 1);
> +
> +			read_rgbf(&pair_rgb, pair_float);
> +			pair_yuv = igt_matrix_transform(&m, &pair_rgb);
> +
> +			*u_tmp = (yuv.d[1] + pair_yuv.d[1]) / 2.0f;
> +			*v_tmp = (yuv.d[2] + pair_yuv.d[2]) / 2.0f;
> +
> +			u_tmp += params.uv_inc;
> +			v_tmp += params.uv_inc;
> +		}
> +
> +		ptr += float_stride;
> +		y += params.y_stride / sizeof(*y);
> +
> +		if ((i % dst_fmt->vsub) == (dst_fmt->vsub - 1)) {
> +			u += params.uv_stride / sizeof(*u);
> +			v += params.uv_stride / sizeof(*v);
> +		}
> +	}
> +}
> +
>   static void convert_pixman(struct fb_convert *cvt)
>   {
>   	pixman_format_code_t src_pixman = drm_format_to_pixman(cvt->src.fb->drm_format);
> @@ -1888,6 +2116,22 @@ static void fb_convert(struct fb_convert *cvt)
>   			convert_rgb24_to_yuv(cvt);
>   			return;
>   		}
> +	} else if (cvt->dst.fb->drm_format == IGT_FORMAT_FLOAT) {
> +		switch (cvt->src.fb->drm_format) {
> +		case DRM_FORMAT_P010:
> +		case DRM_FORMAT_P012:
> +		case DRM_FORMAT_P016:
> +			convert_yuv16_to_float(cvt);
> +			return;
> +		}
> +	} else if (cvt->src.fb->drm_format == IGT_FORMAT_FLOAT) {
> +		switch (cvt->dst.fb->drm_format) {
> +		case DRM_FORMAT_P010:
> +		case DRM_FORMAT_P012:
> +		case DRM_FORMAT_P016:
> +			convert_float_to_yuv16(cvt);
> +			return;
> +		}
>   	}
>   
>   	igt_assert_f(false,
> @@ -1928,12 +2172,37 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
>   {
>   	struct fb_convert_blit_upload *blit = malloc(sizeof(*blit));
>   	struct fb_convert cvt = { };
> +	const struct format_desc_struct *f = lookup_drm_format(fb->drm_format);
> +	unsigned drm_format;
> +	cairo_format_t cairo_id;
> +
> +	if (f->cairo_id != CAIRO_FORMAT_INVALID) {
> +		cairo_id = f->cairo_id;
> +
> +		switch (f->cairo_id) {
> +		case CAIRO_FORMAT_RGB96F:
> +		case CAIRO_FORMAT_RGBA128F:
> +			drm_format = IGT_FORMAT_FLOAT;
> +			break;
> +		case CAIRO_FORMAT_RGB24:
> +			drm_format = DRM_FORMAT_XRGB8888;
> +			break;
> +		default:
> +			igt_assert_f(0, "Unsupported format %u", f->cairo_id);
> +		}
> +	} else if (PIXMAN_FORMAT_A(f->pixman_id)) {
> +		cairo_id = CAIRO_FORMAT_ARGB32;
> +		drm_format = DRM_FORMAT_ARGB8888;
> +	} else {
> +		cairo_id = CAIRO_FORMAT_RGB24;
> +		drm_format = DRM_FORMAT_XRGB8888;
> +	}
>   
>   	igt_assert(blit);
>   
>   	blit->base.fd = fd;
>   	blit->base.fb = fb;
> -	blit->shadow_ptr = igt_fb_create_cairo_shadow_buffer(fd,
> +	blit->shadow_ptr = igt_fb_create_cairo_shadow_buffer(fd, drm_format,
>   							     fb->width,
>   							     fb->height,
>   							     &blit->shadow_fb);
> @@ -1960,7 +2229,7 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
>   
>   	fb->cairo_surface =
>   		cairo_image_surface_create_for_data(blit->shadow_ptr,
> -						    CAIRO_FORMAT_RGB24,
> +						    cairo_id,
>   						    fb->width, fb->height,
>   						    blit->shadow_fb.strides[0]);
>   
> @@ -2025,6 +2294,21 @@ cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb)
>   			create_cairo_surface__blit(fd, fb);
>   		else
>   			create_cairo_surface__gtt(fd, fb);
> +
> +		if (f->cairo_id == CAIRO_FORMAT_RGB96F ||
> +		    f->cairo_id == CAIRO_FORMAT_RGBA128F) {
> +			cairo_status_t status = cairo_surface_status(fb->cairo_surface);
> +
> +			igt_skip_on_f(status == CAIRO_STATUS_INVALID_FORMAT &&
> +				      cairo_version() < CAIRO_VERSION_ENCODE(1, 17, 2),
> +				      "Cairo version too old, need 1.17.2, have %s\n",
> +				      cairo_version_string());
> +
> +			igt_skip_on_f(status == CAIRO_STATUS_NO_MEMORY &&
> +				      pixman_version() < PIXMAN_VERSION_ENCODE(0, 36, 0),
> +				      "Pixman version too old, need 0.36.0, have %s\n",
> +				      pixman_version_string());
> +		}
>   	}
>   
>   	igt_assert(cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS);
> @@ -2231,6 +2515,9 @@ bool igt_format_is_yuv(uint32_t drm_format)
>   {
>   	switch (drm_format) {
>   	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
>   	case DRM_FORMAT_YUYV:
>   	case DRM_FORMAT_YVYU:
>   	case DRM_FORMAT_UYVY:
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 9f027deba842..8c683db5e9ec 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -38,6 +38,12 @@
>   
>   #include "igt_color_encoding.h"
>   
> +/*
> + * Internal format to denote a buffer compatible with pixman's
> + * floating point format. Range [0-1].
> + */
> +#define IGT_FORMAT_FLOAT fourcc_code('I', 'G', 'F', 'x')
> +
>   /**
>    * igt_fb_t:
>    * @fb_id: KMS ID of the framebuffer
> diff --git a/meson.build b/meson.build
> index b17e67ef7f05..356a5414226b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -336,3 +336,13 @@ message('=============')
>   foreach str : build_info
>   	message(str)
>   endforeach
> +
> +if cairo.version().version_compare('<1.17.2')
> +	if pixman.version().version_compare('<0.36.0')
> +		warning('Pixman < 0.36.0 found, cannot test HDR formats')
> +	endif
> +	warning('Cairo < 1.17.2 found, cannot test HDR formats')
> +elif pixman.version().version_compare('<0.36.0')
> +	# Cairo 1.17.2 requires 0.36.0 to compile, but somehow it went missing?
> +	error('Cairo with floating point support found, but pixman version too old')
> +endif
-- 
~Swati Sharma

--------------97152EB8A070FDAF9F257DDF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Calibri">Tested V4 P0xx pixel formats on ICL U h/w.
        Working fine for HDR planes. SDR planes having CRC mismatch for
        all the YUV formats.</font><br>
    </p>
    <div class="moz-cite-prefix">On 07-Feb-19 2:51 PM, Maarten Lankhorst
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190207092136.10659-2-maarten.lankhorst@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">The P01x formats are planar 16 bits per component, with the unused lower bits set to 0.
This means they can all be converted the same way. Only the range is slightly different,
and this is handled in the color_encoding implementation.

This requires cairo 1.17.2 and pixman 0.36. This works but doesn't give extra precision.
For more than 8 bits precision a few more patches are required to pixman, pending review:
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/archives/pixman/2019-January/004815.html">https://lists.freedesktop.org/archives/pixman/2019-January/004815.html</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/archives/pixman/2019-January/004809.html">https://lists.freedesktop.org/archives/pixman/2019-January/004809.html</a>

Once those are merged, we will require the next pixman release for better precision.

Changes since v1:
- Add fallback color definitions when compiling on cairo version &lt; 1.17.2.
- Skip when FB creation fails on HDR formats, instead of failing.
Changes since v2:
- Complain slightly harder when pixman/cairo are out of date.
- Create a fb with alpha when converting to pixman formats with alpha.
- Oops, s/pixman_format_code_t/cairo_format_t/
Changes since v3:
- Rebase on top of upstream YUV changes.

Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
---
 configure.ac                  |  11 +-
 include/drm-uapi/drm_fourcc.h |  10 ++
 lib/igt_color_encoding.c      |   4 +
 lib/igt_fb.c                  | 293 +++++++++++++++++++++++++++++++++-
 lib/igt_fb.h                  |   6 +
 meson.build                   |  10 ++
 6 files changed, 329 insertions(+), 5 deletions(-)

diff --git a/configure.ac b/configure.ac
index b46f024f875a..a333cf8d6dbb 100644
--- a/configure.ac
+++ b/configure.ac
@@ -136,10 +136,17 @@ fi
 PKG_CHECK_MODULES(XRANDR, xrandr &gt;= 1.3, AC_DEFINE(HAVE_XRANDR, 1, [Have libXrandr]), [have_xrandr=no])
 
 # for testdisplay
-PKG_CHECK_MODULES(CAIRO, [cairo &gt;= 1.12.0])
+PKG_CHECK_MODULES(CAIRO, [cairo &gt;= 1.17.2], [],
+	[AC_MSG_WARN([Cairo too old, HDR formats not available. Upgrade to cairo 1.17.2])
+	PKG_CHECK_MODULES(CAIRO, [cairo &gt;= 1.12.0])]
+)
 PKG_CHECK_MODULES(LIBUDEV, [libudev])
 PKG_CHECK_MODULES(GLIB, [glib-2.0])
-PKG_CHECK_MODULES(PIXMAN, [pixman-1])
+PKG_CHECK_MODULES(PIXMAN, [pixman-1 &gt;= 0.36.0], [], [
+	AC_MSG_WARN([Pixman too old, HDR formats not available. Upgrade to pixman 0.36.0])
+	PKG_CHECK_MODULES(PIXMAN, [pixman-1])
+])
+
 PKG_CHECK_MODULES(GSL, [gsl], [gsl=yes], [gsl=no])
 AM_CONDITIONAL(HAVE_GSL, [test "x$gsl" = xyes])
 
diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 41106c835747..fe6b66ef1756 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -195,6 +195,16 @@ extern "C" {
 #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
 #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
 
+/*
+ * 2 plane YCbCr
+ * index 0 = Y plane, [15:0] Y little endian where Pxxx indicate
+ * component xxx msb Y [xxx:16-xxx]
+ * index 1 = Cr:Cb plane, [31:0] Cr:Cb little endian [xxx:16-xxx:xxx:16-xxx]
+ */
+#define DRM_FORMAT_P010		fourcc_code('P', '0', '1', '0') /* 2x2 subsampled Cr:Cb plane, 10 bit per channel */
+#define DRM_FORMAT_P012		fourcc_code('P', '0', '1', '2') /* 2x2 subsampled Cr:Cb plane, 12 bit per channel */
+#define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane, 16 bit per channel */
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y
diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index 4cbe18e217e3..b7a12a1e07f7 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -135,11 +135,15 @@ static const struct color_encoding_format {
 	float ofs_y, max_y, ofs_cbcr, mid_cbcr, max_cbcr;
 } formats[] = {
 	{ DRM_FORMAT_XRGB8888, 255.f, },
+	{ IGT_FORMAT_FLOAT, 1.f, },
 	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_VYUY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_P010, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
+	{ DRM_FORMAT_P012, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
+	{ DRM_FORMAT_P016, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
 };
 
 static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index db3ae06748d1..12763cc85c86 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -62,6 +62,20 @@
 
 #define PIXMAN_invalid	0
 
+#if CAIRO_VERSION &lt; CAIRO_VERSION_ENCODE(1, 17, 2)
+/*
+ * We need cairo 1.17.2 to use HDR formats, but the only thing added is a value
+ * to cairo_format_t.
+ *
+ * To prevent going outside the enum, make cairo_format_t an int and define
+ * ourselves.
+ */
+
+#define CAIRO_FORMAT_RGB96F (6)
+#define CAIRO_FORMAT_RGBA128F (7)
+#define cairo_format_t int
+#endif
+
 /* drm fourcc/cairo format maps */
 static const struct format_desc_struct {
 	const char *name;
@@ -170,6 +184,25 @@ static const struct format_desc_struct {
 	  .num_planes = 1, .plane_bpp = { 16, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
+	  .cairo_id = CAIRO_FORMAT_RGB96F,
+	  .num_planes = 2, .plane_bpp = { 16, 32 },
+	  .vsub = 2, .hsub = 2,
+	},
+	{ .name = "P012", .depth = -1, .drm_id = DRM_FORMAT_P012,
+	  .cairo_id = CAIRO_FORMAT_RGB96F,
+	  .num_planes = 2, .plane_bpp = { 16, 32 },
+	  .vsub = 2, .hsub = 2,
+	},
+	{ .name = "P016", .depth = -1, .drm_id = DRM_FORMAT_P016,
+	  .cairo_id = CAIRO_FORMAT_RGB96F,
+	  .num_planes = 2, .plane_bpp = { 16, 32 },
+	  .vsub = 2, .hsub = 2,
+	},
+	{ .name = "IGT-FLOAT", .depth = -1, .drm_id = IGT_FORMAT_FLOAT,
+	  .cairo_id = CAIRO_FORMAT_INVALID,
+	  .num_planes = 1, .plane_bpp = { 128 },
+	},
 };
 #define for_each_format(f)	\
 	for (f = format_desc; f - format_desc &lt; ARRAY_SIZE(format_desc); f++)
@@ -520,6 +553,14 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 			full_range ? 0x00800080 : 0x10801080,
 			fb-&gt;strides[0] * fb-&gt;plane_height[0] / sizeof(wchar_t));
 		break;
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+		wmemset(ptr, full_range ? 0 : 0x10001000,
+			fb-&gt;offsets[1] / sizeof(wchar_t));
+		wmemset(ptr + fb-&gt;offsets[1], 0x80008000,
+			fb-&gt;strides[1] * fb-&gt;plane_height[1] / sizeof(wchar_t));
+		break;
 	}
 
 	igt_fb_unmap_buffer(fb, ptr);
@@ -1496,6 +1537,7 @@ struct fb_convert_blit_upload {
 };
 
 static void *igt_fb_create_cairo_shadow_buffer(int fd,
+					       unsigned drm_format,
 					       unsigned int width,
 					       unsigned int height,
 					       struct igt_fb *shadow)
@@ -1505,7 +1547,7 @@ static void *igt_fb_create_cairo_shadow_buffer(int fd,
 	igt_assert(shadow);
 
 	fb_init(shadow, fd, width, height,
-		DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+		drm_format, LOCAL_DRM_FORMAT_MOD_NONE,
 		IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
 
 	shadow-&gt;strides[0] = ALIGN(width * shadow-&gt;plane_bpp[0], 16);
@@ -1599,6 +1641,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 
 	switch (fb-&gt;drm_format) {
 	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
 		params-&gt;y_inc = 1;
 		params-&gt;uv_inc = 2;
 		break;
@@ -1619,6 +1664,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 
 	switch (fb-&gt;drm_format) {
 	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
 		params-&gt;y_stride = fb-&gt;strides[0];
 		params-&gt;uv_stride = fb-&gt;strides[1];
 		break;
@@ -1640,6 +1688,14 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 		params-&gt;v_offset = fb-&gt;offsets[1] + 1;
 		break;
 
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
+		params-&gt;y_offset = fb-&gt;offsets[0];
+		params-&gt;u_offset = fb-&gt;offsets[1];
+		params-&gt;v_offset = fb-&gt;offsets[1] + 2;
+		break;
+
 	case DRM_FORMAT_YUYV:
 		params-&gt;y_offset = fb-&gt;offsets[0];
 		params-&gt;u_offset = fb-&gt;offsets[0] + 1;
@@ -1821,6 +1877,178 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
 	}
 }
 
+static void read_rgbf(struct igt_vec4 *rgb, const float *rgb24)
+{
+	rgb-&gt;d[0] = rgb24[0];
+	rgb-&gt;d[1] = rgb24[1];
+	rgb-&gt;d[2] = rgb24[2];
+	rgb-&gt;d[3] = 1.0f;
+}
+
+static void write_rgbf(float *rgb24, const struct igt_vec4 *rgb)
+{
+	rgb24[0] = rgb-&gt;d[0];
+	rgb24[1] = rgb-&gt;d[1];
+	rgb24[2] = rgb-&gt;d[2];
+}
+
+static void convert_yuv16_to_float(struct fb_convert *cvt)
+{
+	const struct format_desc_struct *src_fmt =
+		lookup_drm_format(cvt-&gt;src.fb-&gt;drm_format);
+	int i, j;
+	uint8_t fpp = 3;
+	uint16_t *y, *u, *v;
+	float *ptr = cvt-&gt;dst.ptr;
+	unsigned int float_stride = cvt-&gt;dst.fb-&gt;strides[0] / sizeof(*ptr);
+	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt-&gt;src.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;drm_format,
+						    cvt-&gt;src.fb-&gt;color_encoding,
+						    cvt-&gt;src.fb-&gt;color_range);
+	uint16_t *buf;
+	struct yuv_parameters params = { };
+
+	igt_assert(cvt-&gt;dst.fb-&gt;drm_format == IGT_FORMAT_FLOAT &amp;&amp;
+		   igt_format_is_yuv(cvt-&gt;src.fb-&gt;drm_format));
+
+	buf = convert_src_get(cvt);
+	get_yuv_parameters(cvt-&gt;src.fb, &amp;params);
+	igt_assert(!(params.y_offset % sizeof(*buf)) &amp;&amp;
+		   !(params.u_offset % sizeof(*buf)) &amp;&amp;
+		   !(params.v_offset % sizeof(*buf)));
+
+	y = buf + params.y_offset / sizeof(*buf);
+	u = buf + params.u_offset / sizeof(*buf);
+	v = buf + params.v_offset / sizeof(*buf);
+
+	for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
+		const uint16_t *y_tmp = y;
+		const uint16_t *u_tmp = u;
+		const uint16_t *v_tmp = v;
+		float *rgb_tmp = ptr;
+
+		for (j = 0; j &lt; cvt-&gt;dst.fb-&gt;width; j++) {
+			struct igt_vec4 rgb, yuv;
+
+			yuv.d[0] = *y_tmp;
+			yuv.d[1] = *u_tmp;
+			yuv.d[2] = *v_tmp;
+			yuv.d[3] = 1.0f;
+
+			rgb = igt_matrix_transform(&amp;m, &amp;yuv);
+			write_rgbf(rgb_tmp, &amp;rgb);
+
+			rgb_tmp += fpp;
+			y_tmp += params.y_inc;
+
+			if ((src_fmt-&gt;hsub == 1) || (j % src_fmt-&gt;hsub)) {
+				u_tmp += params.uv_inc;
+				v_tmp += params.uv_inc;
+			}
+		}
+
+		ptr += float_stride;
+		y += params.y_stride / sizeof(*y);
+
+		if ((src_fmt-&gt;vsub == 1) || (i % src_fmt-&gt;vsub)) {
+			u += params.uv_stride / sizeof(*u);
+			v += params.uv_stride / sizeof(*v);
+		}
+	}
+
+	convert_src_put(cvt, buf);
+}
+
+static void convert_float_to_yuv16(struct fb_convert *cvt)
+{
+	const struct format_desc_struct *dst_fmt =
+		lookup_drm_format(cvt-&gt;dst.fb-&gt;drm_format);
+	int i, j;
+	uint16_t *y, *u, *v;
+	const float *ptr = cvt-&gt;src.ptr;
+	uint8_t fpp = 3;
+	unsigned float_stride = cvt-&gt;src.fb-&gt;strides[0] / sizeof(*ptr);
+	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt-&gt;src.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;color_encoding,
+						    cvt-&gt;dst.fb-&gt;color_range);
+	struct yuv_parameters params = { };
+
+	igt_assert(cvt-&gt;src.fb-&gt;drm_format == IGT_FORMAT_FLOAT &amp;&amp;
+		   igt_format_is_yuv(cvt-&gt;dst.fb-&gt;drm_format));
+
+	get_yuv_parameters(cvt-&gt;dst.fb, &amp;params);
+	igt_assert(!(params.y_offset % sizeof(*y)) &amp;&amp;
+		   !(params.u_offset % sizeof(*u)) &amp;&amp;
+		   !(params.v_offset % sizeof(*v)));
+
+	y = cvt-&gt;dst.ptr + params.y_offset;
+	u = cvt-&gt;dst.ptr + params.u_offset;
+	v = cvt-&gt;dst.ptr + params.v_offset;
+
+	for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
+		const float *rgb_tmp = ptr;
+		uint16_t *y_tmp = y;
+		uint16_t *u_tmp = u;
+		uint16_t *v_tmp = v;
+
+		for (j = 0; j &lt; cvt-&gt;dst.fb-&gt;width; j++) {
+			const float *pair_float = rgb_tmp;
+			struct igt_vec4 pair_rgb, rgb;
+			struct igt_vec4 pair_yuv, yuv;
+
+			read_rgbf(&amp;rgb, rgb_tmp);
+			yuv = igt_matrix_transform(&amp;m, &amp;rgb);
+
+			rgb_tmp += fpp;
+
+			*y_tmp = yuv.d[0];
+			y_tmp += params.y_inc;
+
+			if ((i % dst_fmt-&gt;vsub) || (j % dst_fmt-&gt;hsub))
+				continue;
+
+			/*
+			 * We assume the MPEG2 chroma siting convention, where
+			 * pixel center for Cb'Cr' is between the left top and
+			 * bottom pixel in a 2x2 block, so take the average.
+			 *
+			 * Therefore, if we use subsampling, we only really care
+			 * about two pixels all the time, either the two
+			 * subsequent pixels horizontally, vertically, or the
+			 * two corners in a 2x2 block.
+			 *
+			 * The only corner case is when we have an odd number of
+			 * pixels, but this can be handled pretty easily by not
+			 * incrementing the paired pixel pointer in the
+			 * direction it's odd in.
+			 */
+			if (j != (cvt-&gt;dst.fb-&gt;width - 1))
+				pair_float += (dst_fmt-&gt;hsub - 1) * fpp;
+
+			if (i != (cvt-&gt;dst.fb-&gt;height - 1))
+				pair_float += float_stride * (dst_fmt-&gt;vsub - 1);
+
+			read_rgbf(&amp;pair_rgb, pair_float);
+			pair_yuv = igt_matrix_transform(&amp;m, &amp;pair_rgb);
+
+			*u_tmp = (yuv.d[1] + pair_yuv.d[1]) / 2.0f;
+			*v_tmp = (yuv.d[2] + pair_yuv.d[2]) / 2.0f;
+
+			u_tmp += params.uv_inc;
+			v_tmp += params.uv_inc;
+		}
+
+		ptr += float_stride;
+		y += params.y_stride / sizeof(*y);
+
+		if ((i % dst_fmt-&gt;vsub) == (dst_fmt-&gt;vsub - 1)) {
+			u += params.uv_stride / sizeof(*u);
+			v += params.uv_stride / sizeof(*v);
+		}
+	}
+}
+
 static void convert_pixman(struct fb_convert *cvt)
 {
 	pixman_format_code_t src_pixman = drm_format_to_pixman(cvt-&gt;src.fb-&gt;drm_format);
@@ -1888,6 +2116,22 @@ static void fb_convert(struct fb_convert *cvt)
 			convert_rgb24_to_yuv(cvt);
 			return;
 		}
+	} else if (cvt-&gt;dst.fb-&gt;drm_format == IGT_FORMAT_FLOAT) {
+		switch (cvt-&gt;src.fb-&gt;drm_format) {
+		case DRM_FORMAT_P010:
+		case DRM_FORMAT_P012:
+		case DRM_FORMAT_P016:
+			convert_yuv16_to_float(cvt);
+			return;
+		}
+	} else if (cvt-&gt;src.fb-&gt;drm_format == IGT_FORMAT_FLOAT) {
+		switch (cvt-&gt;dst.fb-&gt;drm_format) {
+		case DRM_FORMAT_P010:
+		case DRM_FORMAT_P012:
+		case DRM_FORMAT_P016:
+			convert_float_to_yuv16(cvt);
+			return;
+		}
 	}
 
 	igt_assert_f(false,
@@ -1928,12 +2172,37 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
 {
 	struct fb_convert_blit_upload *blit = malloc(sizeof(*blit));
 	struct fb_convert cvt = { };
+	const struct format_desc_struct *f = lookup_drm_format(fb-&gt;drm_format);
+	unsigned drm_format;
+	cairo_format_t cairo_id;
+
+	if (f-&gt;cairo_id != CAIRO_FORMAT_INVALID) {
+		cairo_id = f-&gt;cairo_id;
+
+		switch (f-&gt;cairo_id) {
+		case CAIRO_FORMAT_RGB96F:
+		case CAIRO_FORMAT_RGBA128F:
+			drm_format = IGT_FORMAT_FLOAT;
+			break;
+		case CAIRO_FORMAT_RGB24:
+			drm_format = DRM_FORMAT_XRGB8888;
+			break;
+		default:
+			igt_assert_f(0, "Unsupported format %u", f-&gt;cairo_id);
+		}
+	} else if (PIXMAN_FORMAT_A(f-&gt;pixman_id)) {
+		cairo_id = CAIRO_FORMAT_ARGB32;
+		drm_format = DRM_FORMAT_ARGB8888;
+	} else {
+		cairo_id = CAIRO_FORMAT_RGB24;
+		drm_format = DRM_FORMAT_XRGB8888;
+	}
 
 	igt_assert(blit);
 
 	blit-&gt;base.fd = fd;
 	blit-&gt;base.fb = fb;
-	blit-&gt;shadow_ptr = igt_fb_create_cairo_shadow_buffer(fd,
+	blit-&gt;shadow_ptr = igt_fb_create_cairo_shadow_buffer(fd, drm_format,
 							     fb-&gt;width,
 							     fb-&gt;height,
 							     &amp;blit-&gt;shadow_fb);
@@ -1960,7 +2229,7 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
 
 	fb-&gt;cairo_surface =
 		cairo_image_surface_create_for_data(blit-&gt;shadow_ptr,
-						    CAIRO_FORMAT_RGB24,
+						    cairo_id,
 						    fb-&gt;width, fb-&gt;height,
 						    blit-&gt;shadow_fb.strides[0]);
 
@@ -2025,6 +2294,21 @@ cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb)
 			create_cairo_surface__blit(fd, fb);
 		else
 			create_cairo_surface__gtt(fd, fb);
+
+		if (f-&gt;cairo_id == CAIRO_FORMAT_RGB96F ||
+		    f-&gt;cairo_id == CAIRO_FORMAT_RGBA128F) {
+			cairo_status_t status = cairo_surface_status(fb-&gt;cairo_surface);
+
+			igt_skip_on_f(status == CAIRO_STATUS_INVALID_FORMAT &amp;&amp;
+				      cairo_version() &lt; CAIRO_VERSION_ENCODE(1, 17, 2),
+				      "Cairo version too old, need 1.17.2, have %s\n",
+				      cairo_version_string());
+
+			igt_skip_on_f(status == CAIRO_STATUS_NO_MEMORY &amp;&amp;
+				      pixman_version() &lt; PIXMAN_VERSION_ENCODE(0, 36, 0),
+				      "Pixman version too old, need 0.36.0, have %s\n",
+				      pixman_version_string());
+		}
 	}
 
 	igt_assert(cairo_surface_status(fb-&gt;cairo_surface) == CAIRO_STATUS_SUCCESS);
@@ -2231,6 +2515,9 @@ bool igt_format_is_yuv(uint32_t drm_format)
 {
 	switch (drm_format) {
 	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_P010:
+	case DRM_FORMAT_P012:
+	case DRM_FORMAT_P016:
 	case DRM_FORMAT_YUYV:
 	case DRM_FORMAT_YVYU:
 	case DRM_FORMAT_UYVY:
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 9f027deba842..8c683db5e9ec 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -38,6 +38,12 @@
 
 #include "igt_color_encoding.h"
 
+/*
+ * Internal format to denote a buffer compatible with pixman's
+ * floating point format. Range [0-1].
+ */
+#define IGT_FORMAT_FLOAT fourcc_code('I', 'G', 'F', 'x')
+
 /**
  * igt_fb_t:
  * @fb_id: KMS ID of the framebuffer
diff --git a/meson.build b/meson.build
index b17e67ef7f05..356a5414226b 100644
--- a/meson.build
+++ b/meson.build
@@ -336,3 +336,13 @@ message('=============')
 foreach str : build_info
 	message(str)
 endforeach
+
+if cairo.version().version_compare('&lt;1.17.2')
+	if pixman.version().version_compare('&lt;0.36.0')
+		warning('Pixman &lt; 0.36.0 found, cannot test HDR formats')
+	endif
+	warning('Cairo &lt; 1.17.2 found, cannot test HDR formats')
+elif pixman.version().version_compare('&lt;0.36.0')
+	# Cairo 1.17.2 requires 0.36.0 to compile, but somehow it went missing?
+	error('Cairo with floating point support found, but pixman version too old')
+endif
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      ~Swati Sharma
    </div>
  </body>
</html>

--------------97152EB8A070FDAF9F257DDF--

--===============0006639184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0006639184==--
