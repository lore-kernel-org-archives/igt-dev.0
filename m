Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4637D6E11C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 07:10:21 +0000 (UTC)
References: <20190207092136.10659-1-maarten.lankhorst@linux.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <b91fedae-4be6-ac79-6aa9-381ea3cef986@intel.com>
Date: Fri, 8 Feb 2019 12:40:18 +0530
MIME-Version: 1.0
In-Reply-To: <20190207092136.10659-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v2 1/4] lib/color_encoding: Prepare support
 for HDR modes.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1061954048=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1061954048==
Content-Type: multipart/alternative;
 boundary="------------7D9037AC27EA48B98C96360A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7D9037AC27EA48B98C96360A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Should we state which all HDR formats are?

On 07-Feb-19 2:51 PM, Maarten Lankhorst wrote:
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   lib/igt_color_encoding.c | 83 +++++++++++++++++++++++++++++++---------
>   lib/igt_color_encoding.h |  9 ++++-
>   lib/igt_fb.c             | 10 +++--
>   3 files changed, 79 insertions(+), 23 deletions(-)
>
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index 03e16e0c9658..4cbe18e217e3 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -24,6 +24,8 @@
>   #include "igt_color_encoding.h"
>   #include "igt_matrix.h"
>   #include "igt_core.h"
> +#include "igt_fb.h"
> +#include "drmtest.h"
>   
>   struct color_encoding {
>   	float kr, kb;
> @@ -85,60 +87,105 @@ static struct igt_mat4 ycbcr_to_rgb_matrix(const struct color_encoding *e)
>   	return ret;
>   }
>   
> -static struct igt_mat4 ycbcr_input_convert_matrix(enum igt_color_range color_range)
> +static struct igt_mat4 ycbcr_input_convert_matrix(enum igt_color_range color_range, float scale,
> +						  float ofs_y, float max_y,
> +						  float ofs_cbcr, float mid_cbcr, float max_cbcr,
> +						  float max_val)
>   {
>   	struct igt_mat4 t, s;
>   
>   	if (color_range == IGT_COLOR_YCBCR_FULL_RANGE) {
> -		t = igt_matrix_translate(0.0f, -128.0f, -128.0f);
> -		s = igt_matrix_scale(1.0f, 2.0f, 2.0f);
> +		t = igt_matrix_translate(0.f, -mid_cbcr, -mid_cbcr);
> +		s = igt_matrix_scale(scale, 2.0f * scale, 2.0f * scale);
>   	} else {
> -		t = igt_matrix_translate(-16.0f, -128.0f, -128.0f);
> -		s = igt_matrix_scale(255.0f / (235.0f - 16.0f),
> -				     255.0f / (240.0f - 128.0f),
> -				     255.0f / (240.0f - 128.0f));
> +		t = igt_matrix_translate(-ofs_y, -mid_cbcr, -mid_cbcr);
> +		s = igt_matrix_scale(scale * max_val / (max_y - ofs_y),
> +				     scale * max_val / (max_cbcr - mid_cbcr),
> +				     scale * max_val / (max_cbcr - mid_cbcr));
>   	}
>   
>   	return igt_matrix_multiply(&s, &t);
>   }
>   
> -static struct igt_mat4 ycbcr_output_convert_matrix(enum igt_color_range color_range)
> +static struct igt_mat4 ycbcr_output_convert_matrix(enum igt_color_range color_range, float scale,
> +						   float ofs_y, float max_y,
> +						   float ofs_cbcr, float mid_cbcr, float max_cbcr,
> +						   float max_val)
>   {
>   	struct igt_mat4 s, t;
>   
>   	if (color_range == IGT_COLOR_YCBCR_FULL_RANGE) {
> -		s = igt_matrix_scale(1.0f, 0.5f, 0.5f);
> -		t = igt_matrix_translate(0.0f, 128.0f, 128.0f);
> +		s = igt_matrix_scale(scale, 0.5f * scale, 0.5f * scale);
> +		t = igt_matrix_translate(0.f, mid_cbcr, mid_cbcr);
>   	} else {
> -		s = igt_matrix_scale((235.0f - 16.0f) / 255.0f,
> -				     (240.0f - 128.0f) / 255.0f,
> -				     (240.0f - 128.0f) / 255.0f);
> -		t = igt_matrix_translate(16.0f, 128.0f, 128.0f);
> +		s = igt_matrix_scale(scale * (max_y - ofs_y) / max_val,
> +				     scale * (max_cbcr - mid_cbcr) / max_val,
> +				     scale * (max_cbcr - mid_cbcr) / max_val);
> +		t = igt_matrix_translate(ofs_y, mid_cbcr, mid_cbcr);
>   	}
>   
>   	return igt_matrix_multiply(&t, &s);
>   }
>   
> -struct igt_mat4 igt_ycbcr_to_rgb_matrix(enum igt_color_encoding color_encoding,
> +static const struct color_encoding_format {
> +	uint32_t fourcc;
> +
> +	float max_val;
> +
> +	float ofs_y, max_y, ofs_cbcr, mid_cbcr, max_cbcr;
> +} formats[] = {
> +	{ DRM_FORMAT_XRGB8888, 255.f, },
> +	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_VYUY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +};
> +
> +static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
> +{
> +	int i;
> +	for (i = 0; i < ARRAY_SIZE(formats); i++)
> +		if (fourcc == formats[i].fourcc)
> +			return &formats[i];
> +
> +	igt_assert_f(0, "Could not look up fourcc %.4s\n", (char *)&fourcc);
> +}
> +
> +struct igt_mat4 igt_ycbcr_to_rgb_matrix(uint32_t from_fourcc,
> +					uint32_t to_fourcc,
> +					enum igt_color_encoding color_encoding,
>   					enum igt_color_range color_range)
>   {
>   	const struct color_encoding *e = &color_encodings[color_encoding];
>   	struct igt_mat4 r, c;
> +	const struct color_encoding_format *fycbcr = lookup_fourcc(from_fourcc);
> +	const struct color_encoding_format *frgb = lookup_fourcc(to_fourcc);
> +	float scale = frgb->max_val / fycbcr->max_val;
>   
> -	r = ycbcr_input_convert_matrix(color_range);
> +	igt_assert(fycbcr->ofs_y && !frgb->ofs_y);
> +
> +	r = ycbcr_input_convert_matrix(color_range, scale, fycbcr->ofs_y, fycbcr->max_y, fycbcr->ofs_cbcr, fycbcr->mid_cbcr, fycbcr->max_cbcr, fycbcr->max_val);
>   	c = ycbcr_to_rgb_matrix(e);
>   
>   	return igt_matrix_multiply(&c, &r);
>   }
>   
> -struct igt_mat4 igt_rgb_to_ycbcr_matrix(enum igt_color_encoding color_encoding,
> +struct igt_mat4 igt_rgb_to_ycbcr_matrix(uint32_t from_fourcc,
> +					uint32_t to_fourcc,
> +					enum igt_color_encoding color_encoding,
>   					enum igt_color_range color_range)
>   {
>   	const struct color_encoding *e = &color_encodings[color_encoding];
> +	const struct color_encoding_format *frgb = lookup_fourcc(from_fourcc);
> +	const struct color_encoding_format *fycbcr = lookup_fourcc(to_fourcc);
>   	struct igt_mat4 c, r;
> +	float scale = fycbcr->max_val / frgb->max_val;
> +
> +	igt_assert(fycbcr->ofs_y && !frgb->ofs_y);
>   
>   	c = rgb_to_ycbcr_matrix(e);
> -	r = ycbcr_output_convert_matrix(color_range);
> +	r = ycbcr_output_convert_matrix(color_range, scale, fycbcr->ofs_y, fycbcr->max_y, fycbcr->ofs_cbcr, fycbcr->mid_cbcr, fycbcr->max_cbcr, fycbcr->max_val);
>   
>   	return igt_matrix_multiply(&r, &c);
>   }
> diff --git a/lib/igt_color_encoding.h b/lib/igt_color_encoding.h
> index 3884e4939f4c..db45b16d3687 100644
> --- a/lib/igt_color_encoding.h
> +++ b/lib/igt_color_encoding.h
> @@ -25,6 +25,7 @@
>   #define __IGT_COLOR_ENCODING_H__
>   
>   #include <stdbool.h>
> +#include <stdint.h>
>   
>   #include "igt_matrix.h"
>   
> @@ -44,9 +45,13 @@ enum igt_color_range {
>   const char *igt_color_encoding_to_str(enum igt_color_encoding encoding);
>   const char *igt_color_range_to_str(enum igt_color_range range);
>   
> -struct igt_mat4 igt_ycbcr_to_rgb_matrix(enum igt_color_encoding color_encoding,
> +struct igt_mat4 igt_ycbcr_to_rgb_matrix(uint32_t ycbcr_fourcc,
> +					uint32_t rgb_fourcc,
> +					enum igt_color_encoding color_encoding,
>   					enum igt_color_range color_range);
> -struct igt_mat4 igt_rgb_to_ycbcr_matrix(enum igt_color_encoding color_encoding,
> +struct igt_mat4 igt_rgb_to_ycbcr_matrix(uint32_t rgb_fourcc,
> +					uint32_t ycbcr_fourcc,
> +					enum igt_color_encoding color_encoding,
>   					enum igt_color_range color_range);
>   
>   #endif /* __IGT_COLOR_ENCODING_H__ */
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5d8c187a9ac9..db3ae06748d1 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1508,7 +1508,7 @@ static void *igt_fb_create_cairo_shadow_buffer(int fd,
>   		DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
>   		IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
>   
> -	shadow->strides[0] = ALIGN(width * 4, 16);
> +	shadow->strides[0] = ALIGN(width * shadow->plane_bpp[0], 16);
>   	shadow->size = ALIGN(shadow->strides[0] * height,
>   			     sysconf(_SC_PAGESIZE));
>   	ptr = mmap(NULL, shadow->size, PROT_READ | PROT_WRITE,
> @@ -1681,7 +1681,9 @@ static void convert_yuv_to_rgb24(struct fb_convert *cvt)
>   	uint8_t *y, *u, *v;
>   	uint8_t *rgb24 = cvt->dst.ptr;
>   	unsigned int rgb24_stride = cvt->dst.fb->strides[0];
> -	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt->src.fb->color_encoding,
> +	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt->src.fb->drm_format,
> +						    cvt->dst.fb->drm_format,
> +						    cvt->src.fb->color_encoding,
>   						    cvt->src.fb->color_range);
>   	uint8_t *buf;
>   	struct yuv_parameters params = { };
> @@ -1742,7 +1744,9 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
>   	const uint8_t *rgb24 = cvt->src.ptr;
>   	uint8_t bpp = 4;
>   	unsigned rgb24_stride = cvt->src.fb->strides[0];
> -	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt->dst.fb->color_encoding,
> +	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt->src.fb->drm_format,
> +						    cvt->dst.fb->drm_format,
> +						    cvt->dst.fb->color_encoding,
>   						    cvt->dst.fb->color_range);
>   	struct yuv_parameters params = { };
>   
-- 
~Swati Sharma

--------------7D9037AC27EA48B98C96360A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Calibri">Should we state which all HDR formats are?</font><br>
    </p>
    <div class="moz-cite-prefix">On 07-Feb-19 2:51 PM, Maarten Lankhorst
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190207092136.10659-1-maarten.lankhorst@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
---
 lib/igt_color_encoding.c | 83 +++++++++++++++++++++++++++++++---------
 lib/igt_color_encoding.h |  9 ++++-
 lib/igt_fb.c             | 10 +++--
 3 files changed, 79 insertions(+), 23 deletions(-)

diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index 03e16e0c9658..4cbe18e217e3 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -24,6 +24,8 @@
 #include "igt_color_encoding.h"
 #include "igt_matrix.h"
 #include "igt_core.h"
+#include "igt_fb.h"
+#include "drmtest.h"
 
 struct color_encoding {
 	float kr, kb;
@@ -85,60 +87,105 @@ static struct igt_mat4 ycbcr_to_rgb_matrix(const struct color_encoding *e)
 	return ret;
 }
 
-static struct igt_mat4 ycbcr_input_convert_matrix(enum igt_color_range color_range)
+static struct igt_mat4 ycbcr_input_convert_matrix(enum igt_color_range color_range, float scale,
+						  float ofs_y, float max_y,
+						  float ofs_cbcr, float mid_cbcr, float max_cbcr,
+						  float max_val)
 {
 	struct igt_mat4 t, s;
 
 	if (color_range == IGT_COLOR_YCBCR_FULL_RANGE) {
-		t = igt_matrix_translate(0.0f, -128.0f, -128.0f);
-		s = igt_matrix_scale(1.0f, 2.0f, 2.0f);
+		t = igt_matrix_translate(0.f, -mid_cbcr, -mid_cbcr);
+		s = igt_matrix_scale(scale, 2.0f * scale, 2.0f * scale);
 	} else {
-		t = igt_matrix_translate(-16.0f, -128.0f, -128.0f);
-		s = igt_matrix_scale(255.0f / (235.0f - 16.0f),
-				     255.0f / (240.0f - 128.0f),
-				     255.0f / (240.0f - 128.0f));
+		t = igt_matrix_translate(-ofs_y, -mid_cbcr, -mid_cbcr);
+		s = igt_matrix_scale(scale * max_val / (max_y - ofs_y),
+				     scale * max_val / (max_cbcr - mid_cbcr),
+				     scale * max_val / (max_cbcr - mid_cbcr));
 	}
 
 	return igt_matrix_multiply(&amp;s, &amp;t);
 }
 
-static struct igt_mat4 ycbcr_output_convert_matrix(enum igt_color_range color_range)
+static struct igt_mat4 ycbcr_output_convert_matrix(enum igt_color_range color_range, float scale,
+						   float ofs_y, float max_y,
+						   float ofs_cbcr, float mid_cbcr, float max_cbcr,
+						   float max_val)
 {
 	struct igt_mat4 s, t;
 
 	if (color_range == IGT_COLOR_YCBCR_FULL_RANGE) {
-		s = igt_matrix_scale(1.0f, 0.5f, 0.5f);
-		t = igt_matrix_translate(0.0f, 128.0f, 128.0f);
+		s = igt_matrix_scale(scale, 0.5f * scale, 0.5f * scale);
+		t = igt_matrix_translate(0.f, mid_cbcr, mid_cbcr);
 	} else {
-		s = igt_matrix_scale((235.0f - 16.0f) / 255.0f,
-				     (240.0f - 128.0f) / 255.0f,
-				     (240.0f - 128.0f) / 255.0f);
-		t = igt_matrix_translate(16.0f, 128.0f, 128.0f);
+		s = igt_matrix_scale(scale * (max_y - ofs_y) / max_val,
+				     scale * (max_cbcr - mid_cbcr) / max_val,
+				     scale * (max_cbcr - mid_cbcr) / max_val);
+		t = igt_matrix_translate(ofs_y, mid_cbcr, mid_cbcr);
 	}
 
 	return igt_matrix_multiply(&amp;t, &amp;s);
 }
 
-struct igt_mat4 igt_ycbcr_to_rgb_matrix(enum igt_color_encoding color_encoding,
+static const struct color_encoding_format {
+	uint32_t fourcc;
+
+	float max_val;
+
+	float ofs_y, max_y, ofs_cbcr, mid_cbcr, max_cbcr;
+} formats[] = {
+	{ DRM_FORMAT_XRGB8888, 255.f, },
+	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+	{ DRM_FORMAT_VYUY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
+};
+
+static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
+{
+	int i;
+	for (i = 0; i &lt; ARRAY_SIZE(formats); i++)
+		if (fourcc == formats[i].fourcc)
+			return &amp;formats[i];
+
+	igt_assert_f(0, "Could not look up fourcc %.4s\n", (char *)&amp;fourcc);
+}
+
+struct igt_mat4 igt_ycbcr_to_rgb_matrix(uint32_t from_fourcc,
+					uint32_t to_fourcc,
+					enum igt_color_encoding color_encoding,
 					enum igt_color_range color_range)
 {
 	const struct color_encoding *e = &amp;color_encodings[color_encoding];
 	struct igt_mat4 r, c;
+	const struct color_encoding_format *fycbcr = lookup_fourcc(from_fourcc);
+	const struct color_encoding_format *frgb = lookup_fourcc(to_fourcc);
+	float scale = frgb-&gt;max_val / fycbcr-&gt;max_val;
 
-	r = ycbcr_input_convert_matrix(color_range);
+	igt_assert(fycbcr-&gt;ofs_y &amp;&amp; !frgb-&gt;ofs_y);
+
+	r = ycbcr_input_convert_matrix(color_range, scale, fycbcr-&gt;ofs_y, fycbcr-&gt;max_y, fycbcr-&gt;ofs_cbcr, fycbcr-&gt;mid_cbcr, fycbcr-&gt;max_cbcr, fycbcr-&gt;max_val);
 	c = ycbcr_to_rgb_matrix(e);
 
 	return igt_matrix_multiply(&amp;c, &amp;r);
 }
 
-struct igt_mat4 igt_rgb_to_ycbcr_matrix(enum igt_color_encoding color_encoding,
+struct igt_mat4 igt_rgb_to_ycbcr_matrix(uint32_t from_fourcc,
+					uint32_t to_fourcc,
+					enum igt_color_encoding color_encoding,
 					enum igt_color_range color_range)
 {
 	const struct color_encoding *e = &amp;color_encodings[color_encoding];
+	const struct color_encoding_format *frgb = lookup_fourcc(from_fourcc);
+	const struct color_encoding_format *fycbcr = lookup_fourcc(to_fourcc);
 	struct igt_mat4 c, r;
+	float scale = fycbcr-&gt;max_val / frgb-&gt;max_val;
+
+	igt_assert(fycbcr-&gt;ofs_y &amp;&amp; !frgb-&gt;ofs_y);
 
 	c = rgb_to_ycbcr_matrix(e);
-	r = ycbcr_output_convert_matrix(color_range);
+	r = ycbcr_output_convert_matrix(color_range, scale, fycbcr-&gt;ofs_y, fycbcr-&gt;max_y, fycbcr-&gt;ofs_cbcr, fycbcr-&gt;mid_cbcr, fycbcr-&gt;max_cbcr, fycbcr-&gt;max_val);
 
 	return igt_matrix_multiply(&amp;r, &amp;c);
 }
diff --git a/lib/igt_color_encoding.h b/lib/igt_color_encoding.h
index 3884e4939f4c..db45b16d3687 100644
--- a/lib/igt_color_encoding.h
+++ b/lib/igt_color_encoding.h
@@ -25,6 +25,7 @@
 #define __IGT_COLOR_ENCODING_H__
 
 #include &lt;stdbool.h&gt;
+#include &lt;stdint.h&gt;
 
 #include "igt_matrix.h"
 
@@ -44,9 +45,13 @@ enum igt_color_range {
 const char *igt_color_encoding_to_str(enum igt_color_encoding encoding);
 const char *igt_color_range_to_str(enum igt_color_range range);
 
-struct igt_mat4 igt_ycbcr_to_rgb_matrix(enum igt_color_encoding color_encoding,
+struct igt_mat4 igt_ycbcr_to_rgb_matrix(uint32_t ycbcr_fourcc,
+					uint32_t rgb_fourcc,
+					enum igt_color_encoding color_encoding,
 					enum igt_color_range color_range);
-struct igt_mat4 igt_rgb_to_ycbcr_matrix(enum igt_color_encoding color_encoding,
+struct igt_mat4 igt_rgb_to_ycbcr_matrix(uint32_t rgb_fourcc,
+					uint32_t ycbcr_fourcc,
+					enum igt_color_encoding color_encoding,
 					enum igt_color_range color_range);
 
 #endif /* __IGT_COLOR_ENCODING_H__ */
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 5d8c187a9ac9..db3ae06748d1 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1508,7 +1508,7 @@ static void *igt_fb_create_cairo_shadow_buffer(int fd,
 		DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
 		IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
 
-	shadow-&gt;strides[0] = ALIGN(width * 4, 16);
+	shadow-&gt;strides[0] = ALIGN(width * shadow-&gt;plane_bpp[0], 16);
 	shadow-&gt;size = ALIGN(shadow-&gt;strides[0] * height,
 			     sysconf(_SC_PAGESIZE));
 	ptr = mmap(NULL, shadow-&gt;size, PROT_READ | PROT_WRITE,
@@ -1681,7 +1681,9 @@ static void convert_yuv_to_rgb24(struct fb_convert *cvt)
 	uint8_t *y, *u, *v;
 	uint8_t *rgb24 = cvt-&gt;dst.ptr;
 	unsigned int rgb24_stride = cvt-&gt;dst.fb-&gt;strides[0];
-	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt-&gt;src.fb-&gt;color_encoding,
+	struct igt_mat4 m = igt_ycbcr_to_rgb_matrix(cvt-&gt;src.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;drm_format,
+						    cvt-&gt;src.fb-&gt;color_encoding,
 						    cvt-&gt;src.fb-&gt;color_range);
 	uint8_t *buf;
 	struct yuv_parameters params = { };
@@ -1742,7 +1744,9 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
 	const uint8_t *rgb24 = cvt-&gt;src.ptr;
 	uint8_t bpp = 4;
 	unsigned rgb24_stride = cvt-&gt;src.fb-&gt;strides[0];
-	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt-&gt;dst.fb-&gt;color_encoding,
+	struct igt_mat4 m = igt_rgb_to_ycbcr_matrix(cvt-&gt;src.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;drm_format,
+						    cvt-&gt;dst.fb-&gt;color_encoding,
 						    cvt-&gt;dst.fb-&gt;color_range);
 	struct yuv_parameters params = { };
 
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      ~Swati Sharma
    </div>
  </body>
</html>

--------------7D9037AC27EA48B98C96360A--

--===============1061954048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1061954048==--
