Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7593A6E0D7
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 08:15:07 +0000 (UTC)
References: <20190207092136.10659-1-maarten.lankhorst@linux.intel.com>
 <20190207092136.10659-3-maarten.lankhorst@linux.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <a94a4f96-d689-a3c7-8d8f-54cfa857d31a@intel.com>
Date: Fri, 8 Feb 2019 13:45:00 +0530
MIME-Version: 1.0
In-Reply-To: <20190207092136.10659-3-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v2 3/4] lib/igt_fb: Add support for Y21x
 formats as well, v2.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0114260836=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0114260836==
Content-Type: multipart/alternative;
 boundary="------------260568A54F0A09E90643881C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------260568A54F0A09E90643881C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested V2 Y21x pixel formats on ICL U h/w. Working fine for HDR planes. 
SDR planes having CRC mismatch for all the YUV formats.

On 07-Feb-19 2:51 PM, Maarten Lankhorst wrote:
> Those formats are packed like YUYV, but only 16 bits per component.
>
> Changes since v1:
> - Rebase on top of upstream YUV changes.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   include/drm-uapi/drm_fourcc.h |  6 ++++-
>   lib/igt_color_encoding.c      |  3 +++
>   lib/igt_fb.c                  | 46 +++++++++++++++++++++++++++++++++++
>   3 files changed, 54 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index fe6b66ef1756..ff9ea02766ee 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -149,10 +149,14 @@ extern "C" {
>   #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
>   #define DRM_FORMAT_UYVY		fourcc_code('U', 'Y', 'V', 'Y') /* [31:0] Y1:Cr0:Y0:Cb0 8:8:8:8 little endian */
>   #define DRM_FORMAT_VYUY		fourcc_code('V', 'Y', 'U', 'Y') /* [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian */
> -
>   #define DRM_FORMAT_AYUV		fourcc_code('A', 'Y', 'U', 'V') /* [31:0] A:Y:Cb:Cr 8:8:8:8 little endian */
>   #define DRM_FORMAT_XYUV8888		fourcc_code('X', 'Y', 'U', 'V') /* [31:0] X:Y:Cb:Cr 8:8:8:8 little endian */
>   
> +/* Like YUYV, but 16 bpc, lowest bits unused like in DRM_FORMAT_P01X */
> +#define DRM_FORMAT_Y210		fourcc_code('Y', '2', '1', '0')
> +#define DRM_FORMAT_Y212		fourcc_code('Y', '2', '1', '2')
> +#define DRM_FORMAT_Y216		fourcc_code('Y', '2', '1', '6')
> +
>   /*
>    * packed YCbCr420 2x2 tiled formats
>    * first 64 bits will contain Y,Cb,Cr components for a 2x2 tile
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index b7a12a1e07f7..6f82fcec62e4 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -144,6 +144,9 @@ static const struct color_encoding_format {
>   	{ DRM_FORMAT_P010, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
>   	{ DRM_FORMAT_P012, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
>   	{ DRM_FORMAT_P016, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
> +	{ DRM_FORMAT_Y210, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
> +	{ DRM_FORMAT_Y212, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
> +	{ DRM_FORMAT_Y216, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
>   };
>   
>   static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 12763cc85c86..cccd6bb98395 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -184,6 +184,21 @@ static const struct format_desc_struct {
>   	  .num_planes = 1, .plane_bpp = { 16, },
>   	  .hsub = 2, .vsub = 1,
>   	},
> +	{ .name = "Y210", .depth = -1, .drm_id = DRM_FORMAT_Y210,
> +	  .cairo_id = CAIRO_FORMAT_RGB96F,
> +	  .num_planes = 1, .plane_bpp = { 32, },
> +	  .hsub = 2, .vsub = 1,
> +	},
> +	{ .name = "Y212", .depth = -1, .drm_id = DRM_FORMAT_Y212,
> +	  .cairo_id = CAIRO_FORMAT_RGB96F,
> +	  .num_planes = 1, .plane_bpp = { 32, },
> +	  .hsub = 2, .vsub = 1,
> +	},
> +	{ .name = "Y216", .depth = -1, .drm_id = DRM_FORMAT_Y216,
> +	  .cairo_id = CAIRO_FORMAT_RGB96F,
> +	  .num_planes = 1, .plane_bpp = { 32, },
> +	  .hsub = 2, .vsub = 1,
> +	},
>   	{ .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
>   	  .cairo_id = CAIRO_FORMAT_RGB96F,
>   	  .num_planes = 2, .plane_bpp = { 16, 32 },
> @@ -561,6 +576,14 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>   		wmemset(ptr + fb->offsets[1], 0x80008000,
>   			fb->strides[1] * fb->plane_height[1] / sizeof(wchar_t));
>   		break;
> +	case DRM_FORMAT_Y210:
> +	case DRM_FORMAT_Y212:
> +	case DRM_FORMAT_Y216:
> +		wmemset(ptr + fb->offsets[0],
> +			full_range ? 0x80000000 : 0x80001000,
> +			fb->strides[0] * fb->plane_height[0] / sizeof(wchar_t));
> +		break;
> +
>   	}
>   
>   	igt_fb_unmap_buffer(fb, ptr);
> @@ -1652,6 +1675,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   	case DRM_FORMAT_YVYU:
>   	case DRM_FORMAT_UYVY:
>   	case DRM_FORMAT_VYUY:
> +	case DRM_FORMAT_Y210:
> +	case DRM_FORMAT_Y212:
> +	case DRM_FORMAT_Y216:
>   		params->y_inc = 2;
>   		params->uv_inc = 4;
>   		break;
> @@ -1675,6 +1701,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   	case DRM_FORMAT_YVYU:
>   	case DRM_FORMAT_UYVY:
>   	case DRM_FORMAT_VYUY:
> +	case DRM_FORMAT_Y210:
> +	case DRM_FORMAT_Y212:
> +	case DRM_FORMAT_Y216:
>   	case DRM_FORMAT_XYUV8888:
>   		params->y_stride = fb->strides[0];
>   		params->uv_stride = fb->strides[0];
> @@ -1720,6 +1749,14 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   		params->v_offset = fb->offsets[0];
>   		break;
>   
> +	case DRM_FORMAT_Y210:
> +	case DRM_FORMAT_Y212:
> +	case DRM_FORMAT_Y216:
> +		params->y_offset = fb->offsets[0];
> +		params->u_offset = fb->offsets[0] + 2;
> +		params->v_offset = fb->offsets[0] + 6;
> +		break;
> +
>   	case DRM_FORMAT_XYUV8888:
>   		params->y_offset = fb->offsets[0] + 1;
>   		params->u_offset = fb->offsets[0] + 2;
> @@ -2121,6 +2158,9 @@ static void fb_convert(struct fb_convert *cvt)
>   		case DRM_FORMAT_P010:
>   		case DRM_FORMAT_P012:
>   		case DRM_FORMAT_P016:
> +		case DRM_FORMAT_Y210:
> +		case DRM_FORMAT_Y212:
> +		case DRM_FORMAT_Y216:
>   			convert_yuv16_to_float(cvt);
>   			return;
>   		}
> @@ -2129,6 +2169,9 @@ static void fb_convert(struct fb_convert *cvt)
>   		case DRM_FORMAT_P010:
>   		case DRM_FORMAT_P012:
>   		case DRM_FORMAT_P016:
> +		case DRM_FORMAT_Y210:
> +		case DRM_FORMAT_Y212:
> +		case DRM_FORMAT_Y216:
>   			convert_float_to_yuv16(cvt);
>   			return;
>   		}
> @@ -2518,6 +2561,9 @@ bool igt_format_is_yuv(uint32_t drm_format)
>   	case DRM_FORMAT_P010:
>   	case DRM_FORMAT_P012:
>   	case DRM_FORMAT_P016:
> +	case DRM_FORMAT_Y210:
> +	case DRM_FORMAT_Y212:
> +	case DRM_FORMAT_Y216:
>   	case DRM_FORMAT_YUYV:
>   	case DRM_FORMAT_YVYU:
>   	case DRM_FORMAT_UYVY:
-- 
~Swati Sharma

--------------260568A54F0A09E90643881C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Calibri">Tested V2 Y21x pixel formats on ICL U h/w.
        Working fine for HDR planes. SDR planes having CRC mismatch for
        all the YUV formats.</font></p>
    <div class="moz-cite-prefix">On 07-Feb-19 2:51 PM, Maarten Lankhorst
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190207092136.10659-3-maarten.lankhorst@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Those formats are packed like YUYV, but only 16 bits per component.

Changes since v1:
- Rebase on top of upstream YUV changes.

Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
---
 include/drm-uapi/drm_fourcc.h |  6 ++++-
 lib/igt_color_encoding.c      |  3 +++
 lib/igt_fb.c                  | 46 +++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
index fe6b66ef1756..ff9ea02766ee 100644
--- a/include/drm-uapi/drm_fourcc.h
+++ b/include/drm-uapi/drm_fourcc.h
@@ -149,10 +149,14 @@ extern "C" {
 #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
 #define DRM_FORMAT_UYVY		fourcc_code('U', 'Y', 'V', 'Y') /* [31:0] Y1:Cr0:Y0:Cb0 8:8:8:8 little endian */
 #define DRM_FORMAT_VYUY		fourcc_code('V', 'Y', 'U', 'Y') /* [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian */
-
 #define DRM_FORMAT_AYUV		fourcc_code('A', 'Y', 'U', 'V') /* [31:0] A:Y:Cb:Cr 8:8:8:8 little endian */
 #define DRM_FORMAT_XYUV8888		fourcc_code('X', 'Y', 'U', 'V') /* [31:0] X:Y:Cb:Cr 8:8:8:8 little endian */
 
+/* Like YUYV, but 16 bpc, lowest bits unused like in DRM_FORMAT_P01X */
+#define DRM_FORMAT_Y210		fourcc_code('Y', '2', '1', '0')
+#define DRM_FORMAT_Y212		fourcc_code('Y', '2', '1', '2')
+#define DRM_FORMAT_Y216		fourcc_code('Y', '2', '1', '6')
+
 /*
  * packed YCbCr420 2x2 tiled formats
  * first 64 bits will contain Y,Cb,Cr components for a 2x2 tile
diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index b7a12a1e07f7..6f82fcec62e4 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -144,6 +144,9 @@ static const struct color_encoding_format {
 	{ DRM_FORMAT_P010, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
 	{ DRM_FORMAT_P012, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
 	{ DRM_FORMAT_P016, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
+	{ DRM_FORMAT_Y210, 65472.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
+	{ DRM_FORMAT_Y212, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
+	{ DRM_FORMAT_Y216, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
 };
 
 static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 12763cc85c86..cccd6bb98395 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -184,6 +184,21 @@ static const struct format_desc_struct {
 	  .num_planes = 1, .plane_bpp = { 16, },
 	  .hsub = 2, .vsub = 1,
 	},
+	{ .name = "Y210", .depth = -1, .drm_id = DRM_FORMAT_Y210,
+	  .cairo_id = CAIRO_FORMAT_RGB96F,
+	  .num_planes = 1, .plane_bpp = { 32, },
+	  .hsub = 2, .vsub = 1,
+	},
+	{ .name = "Y212", .depth = -1, .drm_id = DRM_FORMAT_Y212,
+	  .cairo_id = CAIRO_FORMAT_RGB96F,
+	  .num_planes = 1, .plane_bpp = { 32, },
+	  .hsub = 2, .vsub = 1,
+	},
+	{ .name = "Y216", .depth = -1, .drm_id = DRM_FORMAT_Y216,
+	  .cairo_id = CAIRO_FORMAT_RGB96F,
+	  .num_planes = 1, .plane_bpp = { 32, },
+	  .hsub = 2, .vsub = 1,
+	},
 	{ .name = "P010", .depth = -1, .drm_id = DRM_FORMAT_P010,
 	  .cairo_id = CAIRO_FORMAT_RGB96F,
 	  .num_planes = 2, .plane_bpp = { 16, 32 },
@@ -561,6 +576,14 @@ static void clear_yuv_buffer(struct igt_fb *fb)
 		wmemset(ptr + fb-&gt;offsets[1], 0x80008000,
 			fb-&gt;strides[1] * fb-&gt;plane_height[1] / sizeof(wchar_t));
 		break;
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_Y212:
+	case DRM_FORMAT_Y216:
+		wmemset(ptr + fb-&gt;offsets[0],
+			full_range ? 0x80000000 : 0x80001000,
+			fb-&gt;strides[0] * fb-&gt;plane_height[0] / sizeof(wchar_t));
+		break;
+
 	}
 
 	igt_fb_unmap_buffer(fb, ptr);
@@ -1652,6 +1675,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_YVYU:
 	case DRM_FORMAT_UYVY:
 	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_Y212:
+	case DRM_FORMAT_Y216:
 		params-&gt;y_inc = 2;
 		params-&gt;uv_inc = 4;
 		break;
@@ -1675,6 +1701,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 	case DRM_FORMAT_YVYU:
 	case DRM_FORMAT_UYVY:
 	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_Y212:
+	case DRM_FORMAT_Y216:
 	case DRM_FORMAT_XYUV8888:
 		params-&gt;y_stride = fb-&gt;strides[0];
 		params-&gt;uv_stride = fb-&gt;strides[0];
@@ -1720,6 +1749,14 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
 		params-&gt;v_offset = fb-&gt;offsets[0];
 		break;
 
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_Y212:
+	case DRM_FORMAT_Y216:
+		params-&gt;y_offset = fb-&gt;offsets[0];
+		params-&gt;u_offset = fb-&gt;offsets[0] + 2;
+		params-&gt;v_offset = fb-&gt;offsets[0] + 6;
+		break;
+
 	case DRM_FORMAT_XYUV8888:
 		params-&gt;y_offset = fb-&gt;offsets[0] + 1;
 		params-&gt;u_offset = fb-&gt;offsets[0] + 2;
@@ -2121,6 +2158,9 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_P010:
 		case DRM_FORMAT_P012:
 		case DRM_FORMAT_P016:
+		case DRM_FORMAT_Y210:
+		case DRM_FORMAT_Y212:
+		case DRM_FORMAT_Y216:
 			convert_yuv16_to_float(cvt);
 			return;
 		}
@@ -2129,6 +2169,9 @@ static void fb_convert(struct fb_convert *cvt)
 		case DRM_FORMAT_P010:
 		case DRM_FORMAT_P012:
 		case DRM_FORMAT_P016:
+		case DRM_FORMAT_Y210:
+		case DRM_FORMAT_Y212:
+		case DRM_FORMAT_Y216:
 			convert_float_to_yuv16(cvt);
 			return;
 		}
@@ -2518,6 +2561,9 @@ bool igt_format_is_yuv(uint32_t drm_format)
 	case DRM_FORMAT_P010:
 	case DRM_FORMAT_P012:
 	case DRM_FORMAT_P016:
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_Y212:
+	case DRM_FORMAT_Y216:
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

--------------260568A54F0A09E90643881C--

--===============0114260836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0114260836==--
