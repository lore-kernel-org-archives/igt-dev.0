Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B086ECD4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 09:29:31 +0000 (UTC)
References: <20190207092136.10659-1-maarten.lankhorst@linux.intel.com>
 <20190207092136.10659-4-maarten.lankhorst@linux.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <fd1cd7dd-dfa0-2d0a-cff6-df0ca80a67b2@intel.com>
Date: Fri, 8 Feb 2019 14:59:28 +0530
MIME-Version: 1.0
In-Reply-To: <20190207092136.10659-4-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v2 4/4] lib/igt_fb: Add support for Y410/Y416
 formats, v2.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0448961513=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0448961513==
Content-Type: multipart/alternative;
 boundary="------------11161894B9EFB7578E16E2BA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------11161894B9EFB7578E16E2BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested V2 Y410/Y416 pixel formats on ICL U h/w. CRC mismatch. Since IGT 
is written for alpha supported Y410 and Y416. Driver code is written for 
non-alpha Y4xx pixel format.

Tried with pixel_blend_mode property set to DRM_MODE_BLEND_PIXEL_NONE 
for Y4xx pixel format (as suggested by Maarten), CRC mismatch is still 
there.

Need to decide whether to change driver or igt?

On 07-Feb-19 2:51 PM, Maarten Lankhorst wrote:
> Y410 is packed with compressed a channel and only 32 bpp, like
> 10 bits RGB formats. Y416 is a packed 16 bits per component format.
>
> Changes since v1:
> - Rebase on top of upstream YUV changes.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   include/drm-uapi/drm_fourcc.h |   3 +
>   lib/igt_color_encoding.c      |   2 +
>   lib/igt_fb.c                  | 204 ++++++++++++++++++++++++++++++----
>   3 files changed, 185 insertions(+), 24 deletions(-)
>
> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index ff9ea02766ee..62b4ba023a4d 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -157,6 +157,9 @@ extern "C" {
>   #define DRM_FORMAT_Y212		fourcc_code('Y', '2', '1', '2')
>   #define DRM_FORMAT_Y216		fourcc_code('Y', '2', '1', '6')
>   
> +#define DRM_FORMAT_Y410		fourcc_code('Y', '4', '1', '0') /* [31:0] A:V:Y:U 2:10:10:10 little endian */
> +#define DRM_FORMAT_Y416		fourcc_code('Y', '4', '1', '6') /* [127:0] A:V:Y:U 16:16:16:16 little endian */
> +
>   /*
>    * packed YCbCr420 2x2 tiled formats
>    * first 64 bits will contain Y,Cb,Cr components for a 2x2 tile
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index 6f82fcec62e4..bc9575fca1b4 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -147,6 +147,8 @@ static const struct color_encoding_format {
>   	{ DRM_FORMAT_Y210, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
>   	{ DRM_FORMAT_Y212, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
>   	{ DRM_FORMAT_Y216, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
> +	{ DRM_FORMAT_Y410, 1023.f, 64.f, 940.f, 64.f, 512.f, 960.f },
> +	{ DRM_FORMAT_Y416, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
>   };
>   
>   static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index cccd6bb98395..b8c82b985fd3 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -199,6 +199,16 @@ static const struct format_desc_struct {
>   	  .num_planes = 1, .plane_bpp = { 32, },
>   	  .hsub = 2, .vsub = 1,
>   	},
> +	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
> +	  .cairo_id = CAIRO_FORMAT_RGBA128F,
> +	  .num_planes = 1, .plane_bpp = { 32, },
> +	  .hsub = 1, .vsub = 1,
> +	},
> +	{ .name = "Y416", .depth = -1, .drm_id = DRM_FORMAT_Y416,
> +	  .cairo_id = CAIRO_FORMAT_RGBA128F,
> +	  .num_planes = 1, .plane_bpp = { 64, },
> +	  .hsub = 1, .vsub = 1,
> +	},
>   	{ .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
>   	  .cairo_id = CAIRO_FORMAT_RGB96F,
>   	  .num_planes = 2, .plane_bpp = { 16, 32 },
> @@ -584,6 +594,28 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>   			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
>   		break;
>   
> +	case DRM_FORMAT_Y410:
> +		wmemset(ptr + fb->offsets[0],
> +			full_range ? 0xe0000200 : 0xe0010200,
> +		fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
> +		break;
> +	case DRM_FORMAT_Y416: {
> +		struct ayuv16 { uint16_t u, y, v, a; };
> +		const struct ayuv16 pixel = {
> +			.a = 0xffff,
> +			.v = full_range ? 0 : 0x1000,
> +			.y = 0x8000,
> +			.u = full_range ? 0 : 0x1000
> +		};
> +
> +		for (int i = 0; i < fb->plane_height[0]; i++) {
> +			struct ayuv16 *cur = ptr + fb->offsets[0] + fb->strides[0] * i;
> +
> +			for (int j = 0; i < fb->plane_width[0]; j++)
> +				*cur++ = pixel;
> +		}
> +		break;
> +		}
>   	}
>   
>   	igt_fb_unmap_buffer(fb, ptr);
> @@ -1649,10 +1681,11 @@ static void convert_src_put(const struct fb_convert *cvt,
>   }
>   
>   struct yuv_parameters {
> -	unsigned	y_inc;
> +	unsigned	ay_inc;
>   	unsigned	uv_inc;
> -	unsigned	y_stride;
> +	unsigned	ay_stride;
>   	unsigned	uv_stride;
> +	unsigned	a_offset;
>   	unsigned	y_offset;
>   	unsigned	u_offset;
>   	unsigned	v_offset;
> @@ -1667,7 +1700,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   	case DRM_FORMAT_P010:
>   	case DRM_FORMAT_P012:
>   	case DRM_FORMAT_P016:
> -		params->y_inc = 1;
> +		params->ay_inc = 1;
>   		params->uv_inc = 2;
>   		break;
>   
> @@ -1678,12 +1711,13 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   	case DRM_FORMAT_Y210:
>   	case DRM_FORMAT_Y212:
>   	case DRM_FORMAT_Y216:
> -		params->y_inc = 2;
> +		params->ay_inc = 2;
>   		params->uv_inc = 4;
>   		break;
>   
> +	case DRM_FORMAT_Y416:
>   	case DRM_FORMAT_XYUV8888:
> -		params->y_inc = 4;
> +		params->ay_inc = 4;
>   		params->uv_inc = 4;
>   		break;
>   	}
> @@ -1693,7 +1727,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   	case DRM_FORMAT_P010:
>   	case DRM_FORMAT_P012:
>   	case DRM_FORMAT_P016:
> -		params->y_stride = fb->strides[0];
> +		params->ay_stride = fb->strides[0];
>   		params->uv_stride = fb->strides[1];
>   		break;
>   
> @@ -1705,7 +1739,8 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   	case DRM_FORMAT_Y212:
>   	case DRM_FORMAT_Y216:
>   	case DRM_FORMAT_XYUV8888:
> -		params->y_stride = fb->strides[0];
> +	case DRM_FORMAT_Y416:
> +		params->ay_stride = fb->strides[0];
>   		params->uv_stride = fb->strides[0];
>   		break;
>   	}
> @@ -1757,6 +1792,13 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   		params->v_offset = fb->offsets[0] + 6;
>   		break;
>   
> +	case DRM_FORMAT_Y416:
> +		params->a_offset = fb->offsets[0] + 6;
> +		params->y_offset = fb->offsets[0] + 2;
> +		params->u_offset = fb->offsets[0];
> +		params->v_offset = fb->offsets[0] + 4;
> +		break;
> +
>   	case DRM_FORMAT_XYUV8888:
>   		params->y_offset = fb->offsets[0] + 1;
>   		params->u_offset = fb->offsets[0] + 2;
> @@ -1808,7 +1850,7 @@ static void convert_yuv_to_rgb24(struct fb_convert *cvt)
>   			write_rgb(rgb_tmp, &rgb);
>   
>   			rgb_tmp += bpp;
> -			y_tmp += params.y_inc;
> +			y_tmp += params.ay_inc;
>   
>   			if ((src_fmt->hsub == 1) || (j % src_fmt->hsub)) {
>   				u_tmp += params.uv_inc;
> @@ -1817,7 +1859,7 @@ static void convert_yuv_to_rgb24(struct fb_convert *cvt)
>   		}
>   
>   		rgb24 += rgb24_stride;
> -		y += params.y_stride;
> +		y += params.ay_stride;
>   
>   		if ((src_fmt->vsub == 1) || (i % src_fmt->vsub)) {
>   			u += params.uv_stride;
> @@ -1868,7 +1910,7 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
>   			rgb_tmp += bpp;
>   
>   			*y_tmp = yuv.d[0];
> -			y_tmp += params.y_inc;
> +			y_tmp += params.ay_inc;
>   
>   			if ((i % dst_fmt->vsub) || (j % dst_fmt->hsub))
>   				continue;
> @@ -1905,7 +1947,7 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
>   		}
>   
>   		rgb24 += rgb24_stride;
> -		y += params.y_stride;
> +		y += params.ay_stride;
>   
>   		if ((i % dst_fmt->vsub) == (dst_fmt->vsub - 1)) {
>   			u += params.uv_stride;
> @@ -1929,13 +1971,13 @@ static void write_rgbf(float *rgb24, const struct igt_vec4 *rgb)
>   	rgb24[2] = rgb->d[2];
>   }
>   
> -static void convert_yuv16_to_float(struct fb_convert *cvt)
> +static void convert_yuv16_to_float(struct fb_convert *cvt, bool alpha)
>   {
>   	const struct format_desc_struct *src_fmt =
>   		lookup_drm_format(cvt->src.fb->drm_format);
>   	int i, j;
> -	uint8_t fpp = 3;
> -	uint16_t *y, *u, *v;
> +	uint8_t fpp = alpha ? 4 : 3;
> +	uint16_t *a, *y, *u, *v;
>   	float *ptr = cvt->dst.ptr;
>   	unsigned int float_stride = cvt->dst.fb->strides[0] / sizeof(*ptr);
>   	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt->src.fb->drm_format,
> @@ -1954,11 +1996,13 @@ static void convert_yuv16_to_float(struct fb_convert *cvt)
>   		   !(params.u_offset % sizeof(*buf)) &&
>   		   !(params.v_offset % sizeof(*buf)));
>   
> +	a = buf + params.a_offset / sizeof(*buf);
>   	y = buf + params.y_offset / sizeof(*buf);
>   	u = buf + params.u_offset / sizeof(*buf);
>   	v = buf + params.v_offset / sizeof(*buf);
>   
>   	for (i = 0; i < cvt->dst.fb->height; i++) {
> +		const uint16_t *a_tmp = a;
>   		const uint16_t *y_tmp = y;
>   		const uint16_t *u_tmp = u;
>   		const uint16_t *v_tmp = v;
> @@ -1975,8 +2019,13 @@ static void convert_yuv16_to_float(struct fb_convert *cvt)
>   			rgb = igt_matrix_transform(&m, &yuv);
>   			write_rgbf(rgb_tmp, &rgb);
>   
> +			if (alpha) {
> +				rgb_tmp[3] = ((float)*a_tmp) / 65535.f;
> +				a_tmp += params.ay_inc;
> +			}
> +
>   			rgb_tmp += fpp;
> -			y_tmp += params.y_inc;
> +			y_tmp += params.ay_inc;
>   
>   			if ((src_fmt->hsub == 1) || (j % src_fmt->hsub)) {
>   				u_tmp += params.uv_inc;
> @@ -1985,7 +2034,9 @@ static void convert_yuv16_to_float(struct fb_convert *cvt)
>   		}
>   
>   		ptr += float_stride;
> -		y += params.y_stride / sizeof(*y);
> +
> +		a += params.ay_stride / sizeof(*a);
> +		y += params.ay_stride / sizeof(*y);
>   
>   		if ((src_fmt->vsub == 1) || (i % src_fmt->vsub)) {
>   			u += params.uv_stride / sizeof(*u);
> @@ -1996,14 +2047,14 @@ static void convert_yuv16_to_float(struct fb_convert *cvt)
>   	convert_src_put(cvt, buf);
>   }
>   
> -static void convert_float_to_yuv16(struct fb_convert *cvt)
> +static void convert_float_to_yuv16(struct fb_convert *cvt, bool alpha)
>   {
>   	const struct format_desc_struct *dst_fmt =
>   		lookup_drm_format(cvt->dst.fb->drm_format);
>   	int i, j;
> -	uint16_t *y, *u, *v;
> +	uint16_t *a, *y, *u, *v;
>   	const float *ptr = cvt->src.ptr;
> -	uint8_t fpp = 3;
> +	uint8_t fpp = alpha ? 4 : 3;
>   	unsigned float_stride = cvt->src.fb->strides[0] / sizeof(*ptr);
>   	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt->src.fb->drm_format,
>   						    cvt->dst.fb->drm_format,
> @@ -2015,16 +2066,19 @@ static void convert_float_to_yuv16(struct fb_convert *cvt)
>   		   igt_format_is_yuv(cvt->dst.fb->drm_format));
>   
>   	get_yuv_parameters(cvt->dst.fb, &params);
> -	igt_assert(!(params.y_offset % sizeof(*y)) &&
> +	igt_assert(!(params.a_offset % sizeof(*a)) &&
> +		   !(params.y_offset % sizeof(*y)) &&
>   		   !(params.u_offset % sizeof(*u)) &&
>   		   !(params.v_offset % sizeof(*v)));
>   
> +	a = cvt->dst.ptr + params.a_offset;
>   	y = cvt->dst.ptr + params.y_offset;
>   	u = cvt->dst.ptr + params.u_offset;
>   	v = cvt->dst.ptr + params.v_offset;
>   
>   	for (i = 0; i < cvt->dst.fb->height; i++) {
>   		const float *rgb_tmp = ptr;
> +		uint16_t *a_tmp = a;
>   		uint16_t *y_tmp = y;
>   		uint16_t *u_tmp = u;
>   		uint16_t *v_tmp = v;
> @@ -2037,10 +2091,15 @@ static void convert_float_to_yuv16(struct fb_convert *cvt)
>   			read_rgbf(&rgb, rgb_tmp);
>   			yuv = igt_matrix_transform(&m, &rgb);
>   
> +			if (alpha) {
> +				*a_tmp = rgb_tmp[3] * 65535.f + .5f;
> +				a_tmp += params.ay_inc;
> +			}
> +
>   			rgb_tmp += fpp;
>   
>   			*y_tmp = yuv.d[0];
> -			y_tmp += params.y_inc;
> +			y_tmp += params.ay_inc;
>   
>   			if ((i % dst_fmt->vsub) || (j % dst_fmt->hsub))
>   				continue;
> @@ -2077,7 +2136,8 @@ static void convert_float_to_yuv16(struct fb_convert *cvt)
>   		}
>   
>   		ptr += float_stride;
> -		y += params.y_stride / sizeof(*y);
> +		a += params.ay_stride / sizeof(*a);
> +		y += params.ay_stride / sizeof(*y);
>   
>   		if ((i % dst_fmt->vsub) == (dst_fmt->vsub - 1)) {
>   			u += params.uv_stride / sizeof(*u);
> @@ -2086,6 +2146,88 @@ static void convert_float_to_yuv16(struct fb_convert *cvt)
>   	}
>   }
>   
> +static void convert_Y410_to_float(struct fb_convert *cvt)
> +{
> +	int i, j;
> +	const uint32_t *yuyv;
> +	uint32_t *buf;
> +	float *ptr = cvt->dst.ptr;
> +	unsigned int float_stride = cvt->dst.fb->strides[0] / sizeof(*ptr);
> +	unsigned int yuyv_stride = cvt->src.fb->strides[0] / sizeof(*yuyv);
> +	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt->src.fb->drm_format,
> +						    cvt->dst.fb->drm_format,
> +						    cvt->src.fb->color_encoding,
> +						    cvt->src.fb->color_range);
> +
> +	igt_assert(cvt->src.fb->drm_format == DRM_FORMAT_Y410 &&
> +		   cvt->dst.fb->drm_format == IGT_FORMAT_FLOAT);
> +
> +	yuyv = buf = convert_src_get(cvt);
> +
> +	for (i = 0; i < cvt->dst.fb->height; i++) {
> +		for (j = 0; j < cvt->dst.fb->width; j++) {
> +			/* Convert 2x1 pixel blocks */
> +			struct igt_vec4 yuv;
> +			struct igt_vec4 rgb;
> +
> +			yuv.d[0] = yuyv[j] & 0x3ff;
> +			yuv.d[1] = (yuyv[j] >> 10) & 0x3ff;
> +			yuv.d[2] = (yuyv[j] >> 20) & 0x3ff;
> +			yuv.d[3] = 1.f;
> +
> +			rgb = igt_matrix_transform(&m, &yuv);
> +
> +			write_rgbf(&ptr[j * 4 + 0], &rgb);
> +			ptr[j * 4 + 3] = (float)(yuyv[j] >> 30) / 3;
> +		}
> +
> +		ptr += float_stride;
> +		yuyv += yuyv_stride;
> +	}
> +
> +	convert_src_put(cvt, buf);
> +}
> +
> +static void convert_float_to_Y410(struct fb_convert *cvt)
> +{
> +	int i, j;
> +	uint32_t *yuyv = cvt->dst.ptr;
> +	const float *ptr = cvt->src.ptr;
> +	unsigned float_stride = cvt->src.fb->strides[0] / sizeof(*ptr);
> +	unsigned yuyv_stride = cvt->dst.fb->strides[0] / sizeof(*yuyv);
> +	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt->src.fb->drm_format,
> +						    cvt->dst.fb->drm_format,
> +						    cvt->dst.fb->color_encoding,
> +						    cvt->dst.fb->color_range);
> +
> +	igt_assert(cvt->src.fb->drm_format == IGT_FORMAT_FLOAT &&
> +		   cvt->dst.fb->drm_format == DRM_FORMAT_Y410);
> +
> +	for (i = 0; i < cvt->dst.fb->height; i++) {
> +		for (j = 0; j < cvt->dst.fb->width; j++) {
> +			struct igt_vec4 rgb;
> +			struct igt_vec4 yuv;
> +			uint8_t alpha = ptr[j * 4 + 3] * 3.f + .5f;
> +			uint16_t y, cb, cr;
> +
> +			read_rgbf(&rgb, &ptr[j * 4 + 0]);
> +
> +			yuv = igt_matrix_transform(&m, &rgb);
> +			cr = yuv.d[0];
> +			y = yuv.d[1];
> +			cb = yuv.d[2];
> +
> +			yuyv[j] = ((cr & 0x3ff) << 0) |
> +				  ((y & 0x3ff) << 10) |
> +				  ((cb & 0x3ff) << 20) |
> +				  (alpha << 30);
> +		}
> +
> +		ptr += float_stride;
> +		yuyv += yuyv_stride;
> +	}
> +}
> +
>   static void convert_pixman(struct fb_convert *cvt)
>   {
>   	pixman_format_code_t src_pixman = drm_format_to_pixman(cvt->src.fb->drm_format);
> @@ -2161,7 +2303,13 @@ static void fb_convert(struct fb_convert *cvt)
>   		case DRM_FORMAT_Y210:
>   		case DRM_FORMAT_Y212:
>   		case DRM_FORMAT_Y216:
> -			convert_yuv16_to_float(cvt);
> +			convert_yuv16_to_float(cvt, false);
> +			return;
> +		case DRM_FORMAT_Y410:
> +			convert_Y410_to_float(cvt);
> +			return;
> +		case DRM_FORMAT_Y416:
> +			convert_yuv16_to_float(cvt, true);
>   			return;
>   		}
>   	} else if (cvt->src.fb->drm_format == IGT_FORMAT_FLOAT) {
> @@ -2172,7 +2320,13 @@ static void fb_convert(struct fb_convert *cvt)
>   		case DRM_FORMAT_Y210:
>   		case DRM_FORMAT_Y212:
>   		case DRM_FORMAT_Y216:
> -			convert_float_to_yuv16(cvt);
> +			convert_float_to_yuv16(cvt, false);
> +			return;
> +		case DRM_FORMAT_Y410:
> +			convert_float_to_Y410(cvt);
> +			return;
> +		case DRM_FORMAT_Y416:
> +			convert_float_to_yuv16(cvt, true);
>   			return;
>   		}
>   	}
> @@ -2564,6 +2718,8 @@ bool igt_format_is_yuv(uint32_t drm_format)
>   	case DRM_FORMAT_Y210:
>   	case DRM_FORMAT_Y212:
>   	case DRM_FORMAT_Y216:
> +	case DRM_FORMAT_Y410:
> +	case DRM_FORMAT_Y416:
>   	case DRM_FORMAT_YUYV:
>   	case DRM_FORMAT_YVYU:
>   	case DRM_FORMAT_UYVY:
-- 
~Swati Sharma

--------------11161894B9EFB7578E16E2BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Calibri">Tested V2 Y410/Y416 pixel formats on ICL U
        h/w. CRC mismatch. Since IGT is written for alpha supported Y410
        and Y416. Driver code is written for non-alpha Y4xx pixel
        format.</font></p>
    <p><font face="Calibri">Tried with </font><font face="Calibri">pixel_blend_mode
        property set to DRM_MODE_BLEND_PIXEL_NONE for Y4xx pixel format
        (as suggested by Maarten), CRC mismatch is still there.</font></p>
    <p><font face="Calibri">Need to decide whether to change driver or
        igt?<br>
      </font></p>
    <div class="moz-cite-prefix">On 07-Feb-19 2:51 PM, Maarten Lankhorst
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190207092136.10659-4-maarten.lankhorst@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Y410 is packed with compressed a channel and only 32 bpp, like
10 bits RGB formats. Y416 is a packed 16 bits per component format.

Changes since v1:
- Rebase on top of upstream YUV changes.

Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
---
 include/drm-uapi/drm_fourcc.h |   3 +
 lib/igt_color_encoding.c      |   2 +
 lib/igt_fb.c                  | 204 ++++++++++++++++++++++++++++++----
 3 files changed, 185 insertions(+), 24 deletions(-)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index ff9ea02766ee..62b4ba023a4d 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -157,6 +157,9 @@ extern "C" {
 #define DRM_FORMAT_Y212		fourcc_code('Y', '2', '1', '2')
 #define DRM_FORMAT_Y216		fourcc_code('Y', '2', '1', '6')
 
+#define DRM_FORMAT_Y410		fourcc_code('Y', '4', '1', '0') /* [31:0] A:V:Y:U 2:10:10:10 little endian */
+#define DRM_FORMAT_Y416		fourcc_code('Y', '4', '1', '6') /* [127:0] A:V:Y:U 16:16:16:16 little endian */
+
 /*
  * packed YCbCr420 2x2 tiled formats
  * first 64 bits will contain Y,Cb,Cr components for a 2x2 tile
diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index 6f82fcec62e4..bc9575fca1b4 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -147,6 +147,8 @@ static const struct color_encoding_format {
 	{ DRM_FORMAT_Y210, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
 	{ DRM_FORMAT_Y212, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
 	{ DRM_FORMAT_Y216, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
+	{ DRM_FORMAT_Y410, 1023.f, 64.f, 940.f, 64.f, 512.f, 960.f },
+	{ DRM_FORMAT_Y416, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
 };
 
 static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cccd6bb98395..b8c82b985fd3 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -199,6 +199,16 @@ static const struct format_desc_struct {
 	  .num_planes = 1, .plane_bpp = { 32, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
+	  .cairo_id = CAIRO_FORMAT_RGBA128F,
+	  .num_planes = 1, .plane_bpp = { 32, },
+	  .hsub = 1, .vsub = 1,
+	},
+	{ .name = "Y416", .depth = -1, .drm_id = DRM_FORMAT_Y416,
+	  .cairo_id = CAIRO_FORMAT_RGBA128F,
+	  .num_planes = 1, .plane_bpp = { 64, },
+	  .hsub = 1, .vsub = 1,
+	},
 	{ .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
 	  .cairo_id = CAIRO_FORMAT_RGB96F,
 	  .num_planes = 2, .plane_bpp = { 16, 32 },
@@ -584,6 +594,28 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 			fb-&gt;strides[0] * fb-&gt;plane_height[0] / sizeof(wchar_t));
 		break;
 
+	case DRM_FORMAT_Y410:
+		wmemset(ptr + fb-&gt;offsets[0],
+			full_range ? 0xe0000200 : 0xe0010200,
+		fb-&gt;strides[0] * fb-&gt;plane_height[0] / sizeof(wchar_t));
+		break;
+	case DRM_FORMAT_Y416: {
+		struct ayuv16 { uint16_t u, y, v, a; };
+		const struct ayuv16 pixel = {
+			.a = 0xffff,
+			.v = full_range ? 0 : 0x1000,
+			.y = 0x8000,
+			.u = full_range ? 0 : 0x1000
+		};
+
+		for (int i = 0; i &lt; fb-&gt;plane_height[0]; i++) {
+			struct ayuv16 *cur = ptr + fb-&gt;offsets[0] + fb-&gt;strides[0] * i;
+
+			for (int j = 0; i &lt; fb-&gt;plane_width[0]; j++)
+				*cur++ = pixel;
+		}
+		break;
+		}
 	}
 
 	igt_fb_unmap_buffer(fb, ptr);
@@ -1649,10 +1681,11 @@ static void convert_src_put(const struct fb_convert *cvt,
 }
 
 struct yuv_parameters {
-	unsigned	y_inc;
+	unsigned	ay_inc;
 	unsigned	uv_inc;
-	unsigned	y_stride;
+	unsigned	ay_stride;
 	unsigned	uv_stride;
+	unsigned	a_offset;
 	unsigned	y_offset;
 	unsigned	u_offset;
 	unsigned	v_offset;
@@ -1667,7 +1700,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
-		params-&gt;y_inc = 1;
+		params-&gt;ay_inc = 1;
 		params-&gt;uv_inc = 2;
 		break;
 
@@ -1678,12 +1711,13 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_Y210:
 	case DRM_FORMAT_Y212:
 	case DRM_FORMAT_Y216:
-		params-&gt;y_inc = 2;
+		params-&gt;ay_inc = 2;
 		params-&gt;uv_inc = 4;
 		break;
 
+	case DRM_FORMAT_Y416:
 	case DRM_FORMAT_XYUV8888:
-		params-&gt;y_inc = 4;
+		params-&gt;ay_inc = 4;
 		params-&gt;uv_inc = 4;
 		break;
 	}
@@ -1693,7 +1727,7 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
-		params-&gt;y_stride = fb-&gt;strides[0];
+		params-&gt;ay_stride = fb-&gt;strides[0];
 		params-&gt;uv_stride = fb-&gt;strides[1];
 		break;
 
@@ -1705,7 +1739,8 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_Y212:
 	case DRM_FORMAT_Y216:
 	case DRM_FORMAT_XYUV8888:
-		params-&gt;y_stride = fb-&gt;strides[0];
+	case DRM_FORMAT_Y416:
+		params-&gt;ay_stride = fb-&gt;strides[0];
 		params-&gt;uv_stride = fb-&gt;strides[0];
 		break;
 	}
@@ -1757,6 +1792,13 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 		params-&gt;v_offset = fb-&gt;offsets[0] + 6;
 		break;
 
+	case DRM_FORMAT_Y416:
+		params-&gt;a_offset = fb-&gt;offsets[0] + 6;
+		params-&gt;y_offset = fb-&gt;offsets[0] + 2;
+		params-&gt;u_offset = fb-&gt;offsets[0];
+		params-&gt;v_offset = fb-&gt;offsets[0] + 4;
+		break;
+
 	case DRM_FORMAT_XYUV8888:
 		params-&gt;y_offset = fb-&gt;offsets[0] + 1;
 		params-&gt;u_offset = fb-&gt;offsets[0] + 2;
@@ -1808,7 +1850,7 @@ static void convert_yuv_to_rgb24(struct fb_convert *cvt)
 			write_rgb(rgb_tmp, &amp;rgb);
 
 			rgb_tmp += bpp;
-			y_tmp += params.y_inc;
+			y_tmp += params.ay_inc;
 
 			if ((src_fmt-&gt;hsub == 1) || (j % src_fmt-&gt;hsub)) {
 				u_tmp += params.uv_inc;
@@ -1817,7 +1859,7 @@ static void convert_yuv_to_rgb24(struct fb_convert *cvt)
 		}
 
 		rgb24 += rgb24_stride;
-		y += params.y_stride;
+		y += params.ay_stride;
 
 		if ((src_fmt-&gt;vsub == 1) || (i % src_fmt-&gt;vsub)) {
 			u += params.uv_stride;
@@ -1868,7 +1910,7 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
 			rgb_tmp += bpp;
 
 			*y_tmp = yuv.d[0];
-			y_tmp += params.y_inc;
+			y_tmp += params.ay_inc;
 
 			if ((i % dst_fmt-&gt;vsub) || (j % dst_fmt-&gt;hsub))
 				continue;
@@ -1905,7 +1947,7 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
 		}
 
 		rgb24 += rgb24_stride;
-		y += params.y_stride;
+		y += params.ay_stride;
 
 		if ((i % dst_fmt-&gt;vsub) == (dst_fmt-&gt;vsub - 1)) {
 			u += params.uv_stride;
@@ -1929,13 +1971,13 @@ static void write_rgbf(float *rgb24, const struct igt_vec4 *rgb)
 	rgb24[2] = rgb-&gt;d[2];
 }
 
-static void convert_yuv16_to_float(struct fb_convert *cvt)
+static void convert_yuv16_to_float(struct fb_convert *cvt, bool alpha)
 {
 	const struct format_desc_struct *src_fmt =
 		lookup_drm_format(cvt-&gt;src.fb-&gt;drm_format);
 	int i, j;
-	uint8_t fpp = 3;
-	uint16_t *y, *u, *v;
+	uint8_t fpp = alpha ? 4 : 3;
+	uint16_t *a, *y, *u, *v;
 	float *ptr = cvt-&gt;dst.ptr;
 	unsigned int float_stride = cvt-&gt;dst.fb-&gt;strides[0] / sizeof(*ptr);
 	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt-&gt;src.fb-&gt;drm_format,
@@ -1954,11 +1996,13 @@ static void convert_yuv16_to_float(struct fb_convert *cvt)
 		   !(params.u_offset % sizeof(*buf)) &amp;&amp;
 		   !(params.v_offset % sizeof(*buf)));
 
+	a = buf + params.a_offset / sizeof(*buf);
 	y = buf + params.y_offset / sizeof(*buf);
 	u = buf + params.u_offset / sizeof(*buf);
 	v = buf + params.v_offset / sizeof(*buf);
 
 	for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
+		const uint16_t *a_tmp = a;
 		const uint16_t *y_tmp = y;
 		const uint16_t *u_tmp = u;
 		const uint16_t *v_tmp = v;
@@ -1975,8 +2019,13 @@ static void convert_yuv16_to_float(struct fb_convert *cvt)
 			rgb = igt_matrix_transform(&amp;m, &amp;yuv);
 			write_rgbf(rgb_tmp, &amp;rgb);
 
+			if (alpha) {
+				rgb_tmp[3] = ((float)*a_tmp) / 65535.f;
+				a_tmp += params.ay_inc;
+			}
+
 			rgb_tmp += fpp;
-			y_tmp += params.y_inc;
+			y_tmp += params.ay_inc;
 
 			if ((src_fmt-&gt;hsub == 1) || (j % src_fmt-&gt;hsub)) {
 				u_tmp += params.uv_inc;
@@ -1985,7 +2034,9 @@ static void convert_yuv16_to_float(struct fb_convert *cvt)
 		}
 
 		ptr += float_stride;
-		y += params.y_stride / sizeof(*y);
+
+		a += params.ay_stride / sizeof(*a);
+		y += params.ay_stride / sizeof(*y);
 
 		if ((src_fmt-&gt;vsub == 1) || (i % src_fmt-&gt;vsub)) {
 			u += params.uv_stride / sizeof(*u);
@@ -1996,14 +2047,14 @@ static void convert_yuv16_to_float(struct fb_convert *cvt)
 	convert_src_put(cvt, buf);
 }
 
-static void convert_float_to_yuv16(struct fb_convert *cvt)
+static void convert_float_to_yuv16(struct fb_convert *cvt, bool alpha)
 {
 	const struct format_desc_struct *dst_fmt =
 		lookup_drm_format(cvt-&gt;dst.fb-&gt;drm_format);
 	int i, j;
-	uint16_t *y, *u, *v;
+	uint16_t *a, *y, *u, *v;
 	const float *ptr = cvt-&gt;src.ptr;
-	uint8_t fpp = 3;
+	uint8_t fpp = alpha ? 4 : 3;
 	unsigned float_stride = cvt-&gt;src.fb-&gt;strides[0] / sizeof(*ptr);
 	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt-&gt;src.fb-&gt;drm_format,
 						    cvt-&gt;dst.fb-&gt;drm_format,
@@ -2015,16 +2066,19 @@ static void convert_float_to_yuv16(struct fb_convert *cvt)
 		   igt_format_is_yuv(cvt-&gt;dst.fb-&gt;drm_format));
 
 	get_yuv_parameters(cvt-&gt;dst.fb, &amp;params);
-	igt_assert(!(params.y_offset % sizeof(*y)) &amp;&amp;
+	igt_assert(!(params.a_offset % sizeof(*a)) &amp;&amp;
+		   !(params.y_offset % sizeof(*y)) &amp;&amp;
 		   !(params.u_offset % sizeof(*u)) &amp;&amp;
 		   !(params.v_offset % sizeof(*v)));
 
+	a = cvt-&gt;dst.ptr + params.a_offset;
 	y = cvt-&gt;dst.ptr + params.y_offset;
 	u = cvt-&gt;dst.ptr + params.u_offset;
 	v = cvt-&gt;dst.ptr + params.v_offset;
 
 	for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
 		const float *rgb_tmp = ptr;
+		uint16_t *a_tmp = a;
 		uint16_t *y_tmp = y;
 		uint16_t *u_tmp = u;
 		uint16_t *v_tmp = v;
@@ -2037,10 +2091,15 @@ static void convert_float_to_yuv16(struct fb_convert *cvt)
 			read_rgbf(&amp;rgb, rgb_tmp);
 			yuv = igt_matrix_transform(&amp;m, &amp;rgb);
 
+			if (alpha) {
+				*a_tmp = rgb_tmp[3] * 65535.f + .5f;
+				a_tmp += params.ay_inc;
+			}
+
 			rgb_tmp += fpp;
 
 			*y_tmp = yuv.d[0];
-			y_tmp += params.y_inc;
+			y_tmp += params.ay_inc;
 
 			if ((i % dst_fmt-&gt;vsub) || (j % dst_fmt-&gt;hsub))
 				continue;
@@ -2077,7 +2136,8 @@ static void convert_float_to_yuv16(struct fb_convert *cvt)
 		}
 
 		ptr += float_stride;
-		y += params.y_stride / sizeof(*y);
+		a += params.ay_stride / sizeof(*a);
+		y += params.ay_stride / sizeof(*y);
 
 		if ((i % dst_fmt-&gt;vsub) == (dst_fmt-&gt;vsub - 1)) {
 			u += params.uv_stride / sizeof(*u);
@@ -2086,6 +2146,88 @@ static void convert_float_to_yuv16(struct fb_convert *cvt)
 	}
 }
 
+static void convert_Y410_to_float(struct fb_convert *cvt)
+{
+	int i, j;
+	const uint32_t *yuyv;
+	uint32_t *buf;
+	float *ptr = cvt-&gt;dst.ptr;
+	unsigned int float_stride = cvt-&gt;dst.fb-&gt;strides[0] / sizeof(*ptr);
+	unsigned int yuyv_stride = cvt-&gt;src.fb-&gt;strides[0] / sizeof(*yuyv);
+	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt-&gt;src.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;drm_format,
+						    cvt-&gt;src.fb-&gt;color_encoding,
+						    cvt-&gt;src.fb-&gt;color_range);
+
+	igt_assert(cvt-&gt;src.fb-&gt;drm_format == DRM_FORMAT_Y410 &amp;&amp;
+		   cvt-&gt;dst.fb-&gt;drm_format == IGT_FORMAT_FLOAT);
+
+	yuyv = buf = convert_src_get(cvt);
+
+	for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
+		for (j = 0; j &lt; cvt-&gt;dst.fb-&gt;width; j++) {
+			/* Convert 2x1 pixel blocks */
+			struct igt_vec4 yuv;
+			struct igt_vec4 rgb;
+
+			yuv.d[0] = yuyv[j] &amp; 0x3ff;
+			yuv.d[1] = (yuyv[j] &gt;&gt; 10) &amp; 0x3ff;
+			yuv.d[2] = (yuyv[j] &gt;&gt; 20) &amp; 0x3ff;
+			yuv.d[3] = 1.f;
+
+			rgb = igt_matrix_transform(&amp;m, &amp;yuv);
+
+			write_rgbf(&amp;ptr[j * 4 + 0], &amp;rgb);
+			ptr[j * 4 + 3] = (float)(yuyv[j] &gt;&gt; 30) / 3;
+		}
+
+		ptr += float_stride;
+		yuyv += yuyv_stride;
+	}
+
+	convert_src_put(cvt, buf);
+}
+
+static void convert_float_to_Y410(struct fb_convert *cvt)
+{
+	int i, j;
+	uint32_t *yuyv = cvt-&gt;dst.ptr;
+	const float *ptr = cvt-&gt;src.ptr;
+	unsigned float_stride = cvt-&gt;src.fb-&gt;strides[0] / sizeof(*ptr);
+	unsigned yuyv_stride = cvt-&gt;dst.fb-&gt;strides[0] / sizeof(*yuyv);
+	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt-&gt;src.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;color_encoding,
+						    cvt-&gt;dst.fb-&gt;color_range);
+
+	igt_assert(cvt-&gt;src.fb-&gt;drm_format == IGT_FORMAT_FLOAT &amp;&amp;
+		   cvt-&gt;dst.fb-&gt;drm_format == DRM_FORMAT_Y410);
+
+	for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
+		for (j = 0; j &lt; cvt-&gt;dst.fb-&gt;width; j++) {
+			struct igt_vec4 rgb;
+			struct igt_vec4 yuv;
+			uint8_t alpha = ptr[j * 4 + 3] * 3.f + .5f;
+			uint16_t y, cb, cr;
+
+			read_rgbf(&amp;rgb, &amp;ptr[j * 4 + 0]);
+
+			yuv = igt_matrix_transform(&amp;m, &amp;rgb);
+			cr = yuv.d[0];
+			y = yuv.d[1];
+			cb = yuv.d[2];
+
+			yuyv[j] = ((cr &amp; 0x3ff) &lt;&lt; 0) |
+				  ((y &amp; 0x3ff) &lt;&lt; 10) |
+				  ((cb &amp; 0x3ff) &lt;&lt; 20) |
+				  (alpha &lt;&lt; 30);
+		}
+
+		ptr += float_stride;
+		yuyv += yuyv_stride;
+	}
+}
+
 static void convert_pixman(struct fb_convert *cvt)
 {
 	pixman_format_code_t src_pixman = drm_format_to_pixman(cvt-&gt;src.fb-&gt;drm_format);
@@ -2161,7 +2303,13 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_Y210:
 		case DRM_FORMAT_Y212:
 		case DRM_FORMAT_Y216:
-			convert_yuv16_to_float(cvt);
+			convert_yuv16_to_float(cvt, false);
+			return;
+		case DRM_FORMAT_Y410:
+			convert_Y410_to_float(cvt);
+			return;
+		case DRM_FORMAT_Y416:
+			convert_yuv16_to_float(cvt, true);
 			return;
 		}
 	} else if (cvt-&gt;src.fb-&gt;drm_format == IGT_FORMAT_FLOAT) {
@@ -2172,7 +2320,13 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_Y210:
 		case DRM_FORMAT_Y212:
 		case DRM_FORMAT_Y216:
-			convert_float_to_yuv16(cvt);
+			convert_float_to_yuv16(cvt, false);
+			return;
+		case DRM_FORMAT_Y410:
+			convert_float_to_Y410(cvt);
+			return;
+		case DRM_FORMAT_Y416:
+			convert_float_to_yuv16(cvt, true);
 			return;
 		}
 	}
@@ -2564,6 +2718,8 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	case DRM_FORMAT_Y210:
 	case DRM_FORMAT_Y212:
 	case DRM_FORMAT_Y216:
+	case DRM_FORMAT_Y410:
+	case DRM_FORMAT_Y416:
 	case DRM_FORMAT_YUYV:
 	case DRM_FORMAT_YVYU:
 	case DRM_FORMAT_UYVY:
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      ~Swati Sharma
    </div>
  </body>
</html>

--------------11161894B9EFB7578E16E2BA--

--===============0448961513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0448961513==--
