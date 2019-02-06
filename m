Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2586E06F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Feb 2019 14:26:15 +0000 (UTC)
References: <20190201111544.7920-1-maarten.lankhorst@linux.intel.com>
 <20190201111544.7920-4-maarten.lankhorst@linux.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <84d3cf4a-8382-7798-67d9-902e77161e48@intel.com>
Date: Wed, 6 Feb 2019 19:56:09 +0530
MIME-Version: 1.0
In-Reply-To: <20190201111544.7920-4-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] lib/igt_fb: Add support for
 Y410/Y416 formats.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0269837606=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0269837606==
Content-Type: multipart/alternative;
 boundary="------------E024B421C3270108A93E62EF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E024B421C3270108A93E62EF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

For Y410, there is crc mismatch for plane 0.

Being curious just wanted to ask, why haven't you added Y412? :/

On 01-Feb-19 4:45 PM, Maarten Lankhorst wrote:
> Y410 is packed with compressed a channel and only 32 bpp, like
> 10 bits RGB formats. Y416 is a packed 16 bits per component format.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   include/drm-uapi/drm_fourcc.h |   3 +
>   lib/igt_color_encoding.c      |   2 +
>   lib/igt_fb.c                  | 203 ++++++++++++++++++++++++++++++++++
>   3 files changed, 208 insertions(+)
>
> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index 8f1b5f832a09..1d04304a0528 100644
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
> index c14cc10d1b73..15c541d1fc4e 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -163,6 +163,14 @@ static const struct format_desc_struct {
>   	  .cairo_id = CAIRO_FORMAT_RGB96F,
>   	  .num_planes = 1, .plane_bpp = { 32, },
>   	},
> +	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
> +	  .cairo_id = CAIRO_FORMAT_RGBA128F,
> +	  .num_planes = 1, .plane_bpp = { 32, },
> +	},
> +	{ .name = "Y416", .depth = -1, .drm_id = DRM_FORMAT_Y416,
> +	  .cairo_id = CAIRO_FORMAT_RGBA128F,
> +	  .num_planes = 1, .plane_bpp = { 64, },
> +	},
>   	{ .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
>   	  .cairo_id = CAIRO_FORMAT_RGB96F,
>   	  .num_planes = 2, .plane_bpp = { 16, 32 },
> @@ -572,6 +580,28 @@ static int create_bo_for_fb(struct igt_fb *fb)
>   					full_range ? 0x80000000 : 0x80001000,
>   					fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
>   				break;
> +			case DRM_FORMAT_Y410:
> +				wmemset(ptr + fb->offsets[0],
> +					full_range ? 0xc0080000 : 0xc4080040,
> +					fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
> +				break;
> +			case DRM_FORMAT_Y416: {
> +				struct ayuv16 { uint16_t u, y, v, a; };
> +				const struct ayuv16 pixel = {
> +					.a = 0xffff,
> +					.v = full_range ? 0 : 0x1000,
> +					.y = 0x8000,
> +					.u = full_range ? 0 : 0x1000
> +				};
> +
> +				for (int i = 0; i < fb->plane_height[0]; i++) {
> +					struct ayuv16 *cur = ptr + fb->offsets[0] + fb->strides[0] * i;
> +
> +					for (int j = 0; i < fb->plane_width[0]; j++)
> +						*cur++ = pixel;
> +				}
> +				break;
> +				}
>   			}
>   			gem_munmap(ptr, fb->size);
>   
> @@ -2272,6 +2302,165 @@ static void convert_float_to_Y21X(struct fb_convert *cvt)
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
> +				  ((alpha & 3) << 30);
> +		}
> +
> +		ptr += float_stride;
> +		yuyv += yuyv_stride;
> +	}
> +}
> +
> +static void convert_Y416_to_float(struct fb_convert *cvt)
> +{
> +	int i, j;
> +	const uint16_t *yuyv;
> +	uint16_t *buf;
> +	float *ptr = cvt->dst.ptr;
> +	unsigned int float_stride = cvt->dst.fb->strides[0] / sizeof(*ptr);
> +	unsigned int yuyv_stride = cvt->src.fb->strides[0] / sizeof(*yuyv);
> +	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt->src.fb->drm_format,
> +						    cvt->dst.fb->drm_format,
> +						    cvt->src.fb->color_encoding,
> +						    cvt->src.fb->color_range);
> +
> +	igt_assert(cvt->src.fb->drm_format == DRM_FORMAT_Y416 &&
> +		   cvt->dst.fb->drm_format == IGT_FORMAT_FLOAT);
> +
> +	buf = convert_src_get(cvt);
> +
> +	for (i = 0; i < cvt->dst.fb->height; i++) {
> +		for (j = 0; j < cvt->dst.fb->width; j++) {
> +			/* Convert 2x1 pixel blocks */
> +			struct igt_vec4 yuv;
> +			struct igt_vec4 rgb;
> +
> +			yuv.d[0] = yuyv[j * 4 + 0];
> +			yuv.d[1] = yuyv[j * 4 + 1];
> +			yuv.d[2] = yuyv[j * 4 + 2];
> +			yuv.d[3] = 1.f;
> +
> +			rgb = igt_matrix_transform(&m, &yuv);
> +
> +			write_rgbf(&ptr[j * 4 + 0], &rgb);
> +			ptr[j * 4 + 3] = (float)yuyv[j * 4 + 3] / 65535.f;
> +		}
> +
> +		ptr += float_stride;
> +		yuyv += yuyv_stride;
> +	}
> +
> +	convert_src_put(cvt, buf);
> +}
> +
> +static void convert_float_to_Y416(struct fb_convert *cvt)
> +{
> +	int i, j;
> +	uint16_t *yuyv = cvt->dst.ptr;
> +	const float *ptr = cvt->src.ptr;
> +	unsigned float_stride = cvt->src.fb->strides[0] / sizeof(*ptr);
> +	unsigned yuyv_stride = cvt->dst.fb->strides[0] / sizeof(*yuyv);
> +	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt->src.fb->drm_format,
> +						    cvt->dst.fb->drm_format,
> +						    cvt->dst.fb->color_encoding,
> +						    cvt->dst.fb->color_range);
> +
> +	igt_assert(cvt->src.fb->drm_format == IGT_FORMAT_FLOAT &&
> +		   cvt->dst.fb->drm_format == DRM_FORMAT_Y416);
> +
> +	for (i = 0; i < cvt->dst.fb->height; i++) {
> +		for (j = 0; j < cvt->dst.fb->width; j++) {
> +			struct igt_vec4 rgb;
> +			struct igt_vec4 yuv;
> +
> +			read_rgbf(&rgb, &ptr[j * 4 + 0]);
> +
> +			yuv = igt_matrix_transform(&m, &rgb);
> +
> +			yuyv[j * 4 + 0] = yuv.d[0];
> +			yuyv[j * 4 + 1] = yuv.d[1];
> +			yuyv[j * 4 + 2] = yuv.d[2];
> +			yuyv[j * 4 + 3] = ptr[j * 4 + 3] * 65535.f + .5f;
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
> @@ -2359,6 +2548,12 @@ static void fb_convert(struct fb_convert *cvt)
>   		case DRM_FORMAT_Y216:
>   			convert_Y21X_to_float(cvt);
>   			return;
> +		case DRM_FORMAT_Y410:
> +			convert_Y410_to_float(cvt);
> +			return;
> +		case DRM_FORMAT_Y416:
> +			convert_Y416_to_float(cvt);
> +			return;
>   		}
>   	} else if (cvt->src.fb->drm_format == IGT_FORMAT_FLOAT) {
>   		switch (cvt->dst.fb->drm_format) {
> @@ -2372,6 +2567,12 @@ static void fb_convert(struct fb_convert *cvt)
>   		case DRM_FORMAT_Y216:
>   			convert_float_to_Y21X(cvt);
>   			return;
> +		case DRM_FORMAT_Y410:
> +			convert_float_to_Y410(cvt);
> +			return;
> +		case DRM_FORMAT_Y416:
> +			convert_float_to_Y416(cvt);
> +			return;
>   		}
>   	}
>   
> @@ -2729,6 +2930,8 @@ bool igt_format_is_yuv(uint32_t drm_format)
>   	case DRM_FORMAT_Y210:
>   	case DRM_FORMAT_Y212:
>   	case DRM_FORMAT_Y216:
> +	case DRM_FORMAT_Y410:
> +	case DRM_FORMAT_Y416:
>   	case DRM_FORMAT_YUYV:
>   	case DRM_FORMAT_YVYU:
>   	case DRM_FORMAT_UYVY:
-- 
Thanks and Regards, Swati

--------------E024B421C3270108A93E62EF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Calibri">For Y410, there is crc mismatch for plane 0.</font></p>
    <p><font face="Calibri">Being curious just wanted to ask, why
        haven't you added Y412? :/</font><br>
    </p>
    <div class="moz-cite-prefix">On 01-Feb-19 4:45 PM, Maarten Lankhorst
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190201111544.7920-4-maarten.lankhorst@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Y410 is packed with compressed a channel and only 32 bpp, like
10 bits RGB formats. Y416 is a packed 16 bits per component format.

Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
---
 include/drm-uapi/drm_fourcc.h |   3 +
 lib/igt_color_encoding.c      |   2 +
 lib/igt_fb.c                  | 203 ++++++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index 8f1b5f832a09..1d04304a0528 100644
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
index c14cc10d1b73..15c541d1fc4e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -163,6 +163,14 @@ static const struct format_desc_struct {
 	  .cairo_id = CAIRO_FORMAT_RGB96F,
 	  .num_planes = 1, .plane_bpp = { 32, },
 	},
+	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
+	  .cairo_id = CAIRO_FORMAT_RGBA128F,
+	  .num_planes = 1, .plane_bpp = { 32, },
+	},
+	{ .name = "Y416", .depth = -1, .drm_id = DRM_FORMAT_Y416,
+	  .cairo_id = CAIRO_FORMAT_RGBA128F,
+	  .num_planes = 1, .plane_bpp = { 64, },
+	},
 	{ .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
 	  .cairo_id = CAIRO_FORMAT_RGB96F,
 	  .num_planes = 2, .plane_bpp = { 16, 32 },
@@ -572,6 +580,28 @@ static int create_bo_for_fb(struct igt_fb *fb)
 					full_range ? 0x80000000 : 0x80001000,
 					fb-&gt;strides[0] * fb-&gt;plane_height[0] / sizeof(wchar_t));
 				break;
+			case DRM_FORMAT_Y410:
+				wmemset(ptr + fb-&gt;offsets[0],
+					full_range ? 0xc0080000 : 0xc4080040,
+					fb-&gt;strides[0] * fb-&gt;plane_height[0] / sizeof(wchar_t));
+				break;
+			case DRM_FORMAT_Y416: {
+				struct ayuv16 { uint16_t u, y, v, a; };
+				const struct ayuv16 pixel = {
+					.a = 0xffff,
+					.v = full_range ? 0 : 0x1000,
+					.y = 0x8000,
+					.u = full_range ? 0 : 0x1000
+				};
+
+				for (int i = 0; i &lt; fb-&gt;plane_height[0]; i++) {
+					struct ayuv16 *cur = ptr + fb-&gt;offsets[0] + fb-&gt;strides[0] * i;
+
+					for (int j = 0; i &lt; fb-&gt;plane_width[0]; j++)
+						*cur++ = pixel;
+				}
+				break;
+				}
 			}
 			gem_munmap(ptr, fb-&gt;size);
 
@@ -2272,6 +2302,165 @@ static void convert_float_to_Y21X(struct fb_convert *cvt)
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
+				  ((alpha &amp; 3) &lt;&lt; 30);
+		}
+
+		ptr += float_stride;
+		yuyv += yuyv_stride;
+	}
+}
+
+static void convert_Y416_to_float(struct fb_convert *cvt)
+{
+	int i, j;
+	const uint16_t *yuyv;
+	uint16_t *buf;
+	float *ptr = cvt-&gt;dst.ptr;
+	unsigned int float_stride = cvt-&gt;dst.fb-&gt;strides[0] / sizeof(*ptr);
+	unsigned int yuyv_stride = cvt-&gt;src.fb-&gt;strides[0] / sizeof(*yuyv);
+	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt-&gt;src.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;drm_format,
+						    cvt-&gt;src.fb-&gt;color_encoding,
+						    cvt-&gt;src.fb-&gt;color_range);
+
+	igt_assert(cvt-&gt;src.fb-&gt;drm_format == DRM_FORMAT_Y416 &amp;&amp;
+		   cvt-&gt;dst.fb-&gt;drm_format == IGT_FORMAT_FLOAT);
+
+	buf = convert_src_get(cvt);
+
+	for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
+		for (j = 0; j &lt; cvt-&gt;dst.fb-&gt;width; j++) {
+			/* Convert 2x1 pixel blocks */
+			struct igt_vec4 yuv;
+			struct igt_vec4 rgb;
+
+			yuv.d[0] = yuyv[j * 4 + 0];
+			yuv.d[1] = yuyv[j * 4 + 1];
+			yuv.d[2] = yuyv[j * 4 + 2];
+			yuv.d[3] = 1.f;
+
+			rgb = igt_matrix_transform(&amp;m, &amp;yuv);
+
+			write_rgbf(&amp;ptr[j * 4 + 0], &amp;rgb);
+			ptr[j * 4 + 3] = (float)yuyv[j * 4 + 3] / 65535.f;
+		}
+
+		ptr += float_stride;
+		yuyv += yuyv_stride;
+	}
+
+	convert_src_put(cvt, buf);
+}
+
+static void convert_float_to_Y416(struct fb_convert *cvt)
+{
+	int i, j;
+	uint16_t *yuyv = cvt-&gt;dst.ptr;
+	const float *ptr = cvt-&gt;src.ptr;
+	unsigned float_stride = cvt-&gt;src.fb-&gt;strides[0] / sizeof(*ptr);
+	unsigned yuyv_stride = cvt-&gt;dst.fb-&gt;strides[0] / sizeof(*yuyv);
+	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt-&gt;src.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;color_encoding,
+						    cvt-&gt;dst.fb-&gt;color_range);
+
+	igt_assert(cvt-&gt;src.fb-&gt;drm_format == IGT_FORMAT_FLOAT &amp;&amp;
+		   cvt-&gt;dst.fb-&gt;drm_format == DRM_FORMAT_Y416);
+
+	for (i = 0; i &lt; cvt-&gt;dst.fb-&gt;height; i++) {
+		for (j = 0; j &lt; cvt-&gt;dst.fb-&gt;width; j++) {
+			struct igt_vec4 rgb;
+			struct igt_vec4 yuv;
+
+			read_rgbf(&amp;rgb, &amp;ptr[j * 4 + 0]);
+
+			yuv = igt_matrix_transform(&amp;m, &amp;rgb);
+
+			yuyv[j * 4 + 0] = yuv.d[0];
+			yuyv[j * 4 + 1] = yuv.d[1];
+			yuyv[j * 4 + 2] = yuv.d[2];
+			yuyv[j * 4 + 3] = ptr[j * 4 + 3] * 65535.f + .5f;
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
@@ -2359,6 +2548,12 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_Y216:
 			convert_Y21X_to_float(cvt);
 			return;
+		case DRM_FORMAT_Y410:
+			convert_Y410_to_float(cvt);
+			return;
+		case DRM_FORMAT_Y416:
+			convert_Y416_to_float(cvt);
+			return;
 		}
 	} else if (cvt-&gt;src.fb-&gt;drm_format == IGT_FORMAT_FLOAT) {
 		switch (cvt-&gt;dst.fb-&gt;drm_format) {
@@ -2372,6 +2567,12 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_Y216:
 			convert_float_to_Y21X(cvt);
 			return;
+		case DRM_FORMAT_Y410:
+			convert_float_to_Y410(cvt);
+			return;
+		case DRM_FORMAT_Y416:
+			convert_float_to_Y416(cvt);
+			return;
 		}
 	}
 
@@ -2729,6 +2930,8 @@ bool igt_format_is_yuv(uint32_t drm_format)
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
      Thanks and Regards,
      Swati
    </div>
  </body>
</html>

--------------E024B421C3270108A93E62EF--

--===============0269837606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0269837606==--
