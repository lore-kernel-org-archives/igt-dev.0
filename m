Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25CEC79F9F
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 18:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5243210E035;
	Mon,  7 Sep 2026 18:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1cQIvCd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CD710E035
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788804134; x=1820340134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z8C2jWuArkDczNvZbrGyKhiSXNmgl/l5rz1LV4rvRY4=;
 b=I1cQIvCdiVI7RYFsLhA593BFs5FX1FJhZ2wvtHc5qaob52hlJDtr1Ga9
 kd4Bc4weauqVgmwHhTpIbLuUEAmROJaMHX6kaIVrm1qtJfzh9ECWDRZ8s
 nySVDh4YCPOyxr0hyI+vzHK4nFX6qXH8IKKyhCzTvVfyeqRQlq40QlvHu
 AdM7mYTU8HCd5EGAX38iuYtNav02iyPdrwX0w5JtiSFPpLKqkd4v63nBb
 oUIZaXdP0HB0/gwbmo3/7pAXrUDkdZcZ1+H2jC1FecL2XfTtXeMR/82Nd
 MRdhGMeeBiySotUHUTSxjsvZuZ7Kg2XYmAEFxn4nyYYCNJ6WmgRy/YLbu w==;
X-CSE-ConnectionGUID: JWa8lfUlRjWqDeSaTKH9aw==
X-CSE-MsgGUID: nqcQy4SnStaC4mj9vABK2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99867675"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99867675"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 11:02:14 -0700
X-CSE-ConnectionGUID: SzWhMyjNTFGEXDWemCz5Cg==
X-CSE-MsgGUID: p0UV3AfkTL+k87mrqFZS6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268195094"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.226])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 11:02:11 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 1/3] drm-uapi: Sync drm_mode.h with drm-next up to
 1258f9c9ff1d
Date: Mon,  7 Sep 2026 20:02:02 +0200
Message-ID: <20260907180204.336052-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907180204.336052-1-kamil.konieczny@linux.intel.com>
References: <20260907180204.336052-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <dev@lankhorst.se>

Sync the drm_mode.h up to commit 1258f9c9ff1d to get all the
background property macros. With this following changes comes:

1258f9c9ff1d ("drm/edid: parse panel type from DisplayID 2.x Display Parameters")
a1b6cf8e5e7e ("drm: uapi: Use SPDX in DRM core uAPI headers")
42dab3138176 ("drm/connector: Add a new 'panel_type' property")
db971856bbe0 ("drm/colorop: Add 3D LUT support to color pipeline")
7fa3ee8c0a79 ("drm/colorop: Define LUT_1D interpolation")

Update linux_scaffold.h to take the new changes into account.

This differs from drm-next with added DRM_COLOROP_FIXED_MATRIX
colorop property and removed to linux kernel includes.

v3: sync with most recent drm-next change (Kamil)

Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

fix drm-uapi
---
 include/drm-uapi/drm_mode.h | 213 +++++++++++++++++++++++++++++++-----
 include/linux_scaffold.h    |   2 +
 2 files changed, 190 insertions(+), 25 deletions(-)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 0924e38af..2aa005fcd 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -1,27 +1,10 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright (c) 2007 Dave Airlie <airlied@linux.ie>
  * Copyright (c) 2007 Jakob Bornecrantz <wallbraker@gmail.com>
  * Copyright (c) 2008 Red Hat Inc.
  * Copyright (c) 2007-2008 Tungsten Graphics, Inc., Cedar Park, TX., USA
  * Copyright (c) 2007-2008 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
  */
 
 #ifndef _DRM_MODE_H
@@ -166,6 +149,11 @@ extern "C" {
 #define DRM_MODE_LINK_STATUS_GOOD	0
 #define DRM_MODE_LINK_STATUS_BAD	1
 
+/* Panel type property */
+#define DRM_MODE_PANEL_TYPE_UNKNOWN	0
+#define DRM_MODE_PANEL_TYPE_OLED	1
+#define DRM_MODE_PANEL_TYPE_LCD		2
+
 /*
  * DRM_MODE_ROTATE_<degrees>
  *
@@ -895,31 +883,48 @@ enum drm_colorop_type {
 	/**
 	 * @DRM_COLOROP_1D_CURVE:
 	 *
+	 * enum string "1D Curve"
+	 *
 	 * A 1D curve that is being applied to all color channels. The
-	 * curve is specified via tha CURVE_1D_TYPE colorop property.
+	 * curve is specified via the CURVE_1D_TYPE colorop property.
 	 */
 	DRM_COLOROP_1D_CURVE,
 
 	/**
 	 * @DRM_COLOROP_1D_LUT:
 	 *
+	 * enum string "1D LUT"
+	 *
 	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
-	 * packed into a blob via the DATA property. The driver's expected
-	 * LUT size is advertised via the SIZE property.
+	 * packed into a blob via the DATA property. The driver's
+	 * expected LUT size is advertised via the SIZE property.
+	 *
+	 * The DATA blob is an array of struct drm_color_lut32 with size
+	 * of "size".
 	 */
 	DRM_COLOROP_1D_LUT,
 
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
+	 * enum string "3x4 Matrix"
+	 *
 	 * A 3x4 matrix. Its values are specified via the
 	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 *
+	 * The DATA blob is a float[12]:
+	 * out   matrix          in
+	 * | R |   | 0  1  2  3  |   | R |
+	 * | G | = | 4  5  6  7  | x | G |
+	 * | B |   | 8  9  10 12 |   | B |
 	 */
 	DRM_COLOROP_CTM_3X4,
 
 	/**
 	 * @DRM_COLOROP_MULTIPLIER:
 	 *
+	 * enum string "Multiplier"
+	 *
 	 * A simple multiplier, applied to all color values. The
 	 * multiplier is specified as a S31.32 via the MULTIPLIER
 	 * property.
@@ -929,9 +934,22 @@ enum drm_colorop_type {
 	/**
 	 * @DRM_COLOROP_3D_LUT:
 	 *
-	 * A 3D LUT of &drm_color_lut entries,
+	 * enum string "3D LUT"
+	 *
+	 * A 3D LUT of &drm_color_lut32 entries,
 	 * packed into a blob via the DATA property. The driver's expected
-	 * LUT size is advertised via the SIZE property.
+	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
+	 * 17x17x17 entries will have SIZE set to 17.
+	 *
+	 * The DATA blob is a 3D array of struct drm_color_lut32 with dimension
+	 * length of "size".
+	 * The LUT elements are traversed like so:
+	 *
+	 *   for B in range 0..n
+	 *     for G in range 0..n
+	 *       for R in range 0..n
+	 *        index = R + n * (G + n * B)
+	 *         color = lut3d[index]
 	 */
 	DRM_COLOROP_3D_LUT,
 
@@ -949,7 +967,6 @@ enum drm_colorop_type {
 
 /**
  * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
- *
  */
 enum drm_colorop_lut3d_interpolation_type {
 	/**
@@ -960,6 +977,19 @@ enum drm_colorop_lut3d_interpolation_type {
 	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
 };
 
+/**
+ * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
+ */
+enum drm_colorop_lut1d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR:
+	 *
+	 * Linear interpolation. Values between points of the LUT will be
+	 * linearly interpolated.
+	 */
+	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
@@ -1065,6 +1095,14 @@ struct hdr_output_metadata {
  * Request that the kernel sends back a vblank event (see
  * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when the
  * page-flip is done.
+ *
+ * When used with atomic uAPI, one event will be delivered per CRTC included in
+ * the atomic commit. A CRTC is included in an atomic commit if one of its
+ * properties is set, or if a property is set on a connector or plane linked
+ * via the CRTC_ID property to the CRTC. At least one CRTC must be included,
+ * and all pulled in CRTCs must be either previously or newly powered on (in
+ * other words, a powered off CRTC which stays off cannot be included in the
+ * atomic commit).
  */
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
 /**
@@ -1161,7 +1199,7 @@ struct drm_mode_crtc_page_flip_target {
  * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
  * @height: buffer height in pixels
  * @width: buffer width in pixels
- * @bpp: bits per pixel
+ * @bpp: color mode
  * @flags: must be zero
  * @handle: buffer object handle
  * @pitch: number of bytes between two consecutive lines
@@ -1169,6 +1207,54 @@ struct drm_mode_crtc_page_flip_target {
  *
  * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
  * the kernel fills @handle, @pitch and @size.
+ *
+ * The value of @bpp is a color-mode number describing a specific format
+ * or a variant thereof. The value often corresponds to the number of bits
+ * per pixel for most modes, although there are exceptions. Each color mode
+ * maps to a DRM format plus a number of modes with similar pixel layout.
+ * Framebuffer layout is always linear.
+ *
+ * Support for all modes and formats is optional. Even if dumb-buffer
+ * creation with a certain color mode succeeds, it is not guaranteed that
+ * the DRM driver supports any of the related formats. Most drivers support
+ * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
+ * plane.
+ *
+ * +------------+------------------------+------------------------+
+ * | Color mode | Framebuffer format     | Compatible formats     |
+ * +============+========================+========================+
+ * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_BGRX8888 |
+ * |            |                        |  * DRM_FORMAT_RGBX8888 |
+ * |            |                        |  * DRM_FORMAT_XBGR8888 |
+ * +------------+------------------------+------------------------+
+ * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
+ * +------------+------------------------+------------------------+
+ * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
+ * +------------+------------------------+------------------------+
+ * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_BGRX1555 |
+ * |            |                        |  * DRM_FORMAT_RGBX1555 |
+ * |            |                        |  * DRM_FORMAT_XBGR1555 |
+ * +------------+------------------------+------------------------+
+ * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_D8       |
+ * |            |                        |  * DRM_FORMAT_R8       |
+ * +------------+------------------------+------------------------+
+ * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_D4       |
+ * |            |                        |  * DRM_FORMAT_R4       |
+ * +------------+------------------------+------------------------+
+ * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_D2       |
+ * |            |                        |  * DRM_FORMAT_R2       |
+ * +------------+------------------------+------------------------+
+ * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_D1       |
+ * |            |                        |  * DRM_FORMAT_R1       |
+ * +------------+------------------------+------------------------+
+ *
+ * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
+ * legacy user space. Please don't use them in new code. Other modes
+ * are not support.
+ *
+ * Do not attempt to allocate anything but linear framebuffer memory
+ * with single-plane RGB data. Allocation of other framebuffer
+ * layouts requires dedicated ioctls in the respective DRM driver.
  */
 struct drm_mode_create_dumb {
 	__u32 height;
@@ -1458,6 +1544,83 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/*
+ * Put 16-bit ARGB values into a standard 64-bit representation that can be
+ * used for ioctl parameters, inter-driver communication, etc.
+ *
+ * If the component values being provided contain less than 16 bits of
+ * precision, use a conversion ratio to get a better color approximation.
+ * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
+ * the input and output precision, respectively.
+ * Also note bpc must be greater than 0.
+ */
+#define __DRM_ARGB64_PREP(c, shift)					\
+	(((__u64)(c) & __GENMASK(15, 0)) << (shift))
+
+#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)				\
+({									\
+	__u16 mask = __GENMASK((bpc) - 1, 0);				\
+	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
+						__GENMASK(15, 0), mask);\
+	__DRM_ARGB64_PREP(conv, shift);					\
+})
+
+#define DRM_ARGB64_PREP(alpha, red, green, blue)			\
+(									\
+	__DRM_ARGB64_PREP(alpha, 48) |					\
+	__DRM_ARGB64_PREP(red,   32) |					\
+	__DRM_ARGB64_PREP(green, 16) |					\
+	__DRM_ARGB64_PREP(blue,   0)					\
+)
+
+#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)		\
+({									\
+	__typeof__(bpc) __bpc = bpc;					\
+	__DRM_ARGB64_PREP_BPC(alpha, 48, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(red,   32, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(green, 16, __bpc) |			\
+	__DRM_ARGB64_PREP_BPC(blue,   0, __bpc);			\
+})
+
+/*
+ * Extract the specified color component from a standard 64-bit ARGB value.
+ *
+ * If the requested precision is less than 16 bits, make use of a conversion
+ * ratio calculated as (2^bpc - 1) / (2^16 - 1), where bpc and 16 are the
+ * output and input precision, respectively.
+ *
+ * If speed is more important than accuracy, use DRM_ARGB64_GET*_BPCS()
+ * instead of DRM_ARGB64_GET*_BPC() in order to replace the expensive
+ * division with a simple bit right-shift operation.
+ */
+#define __DRM_ARGB64_GET(c, shift)					\
+	((__u16)(((__u64)(c) >> (shift)) & __GENMASK(15, 0)))
+
+#define __DRM_ARGB64_GET_BPC(c, shift, bpc)				\
+({									\
+	__u16 comp = __DRM_ARGB64_GET(c, shift);			\
+	__KERNEL_DIV_ROUND_CLOSEST(comp * __GENMASK((bpc) - 1, 0),	\
+				   __GENMASK(15, 0));			\
+})
+
+#define __DRM_ARGB64_GET_BPCS(c, shift, bpc)				\
+	(__DRM_ARGB64_GET(c, shift) >> (16 - (bpc)))
+
+#define DRM_ARGB64_GETA(c)		__DRM_ARGB64_GET(c, 48)
+#define DRM_ARGB64_GETR(c)		__DRM_ARGB64_GET(c, 32)
+#define DRM_ARGB64_GETG(c)		__DRM_ARGB64_GET(c, 16)
+#define DRM_ARGB64_GETB(c)		__DRM_ARGB64_GET(c, 0)
+
+#define DRM_ARGB64_GETA_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 48, bpc)
+#define DRM_ARGB64_GETR_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 32, bpc)
+#define DRM_ARGB64_GETG_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 16, bpc)
+#define DRM_ARGB64_GETB_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 0, bpc)
+
+#define DRM_ARGB64_GETA_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 48, bpc)
+#define DRM_ARGB64_GETR_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 32, bpc)
+#define DRM_ARGB64_GETG_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 16, bpc)
+#define DRM_ARGB64_GETB_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 0, bpc)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
index 39f68b8d2..f6e8983b9 100644
--- a/include/linux_scaffold.h
+++ b/include/linux_scaffold.h
@@ -31,6 +31,8 @@ static inline s64 sign_extend64(u64 value, int index)
 	((~0ULL - (1ULL << (l)) + 1) & \
 	(~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))
 
+#define __GENMASK GENMASK
+
 #define BITS_PER_BYTE 8
 #define BITS_PER_TYPE(t) (sizeof(t) * BITS_PER_BYTE)
 #define BITS_PER_LONG BITS_PER_TYPE(long)
-- 
2.55.0

