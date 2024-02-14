Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73780C48BF0
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86F710E45C;
	Wed, 14 Feb 2024 06:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXI9i1SH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E5D10E41D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893149; x=1739429149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h5pgrjDqYKfbuAXtMB2Of1m966phk7GzGq0ol9+aK7o=;
 b=iXI9i1SHvNxCvlOm5gSKRC+TiVkKRRQT+rrK1NrvaRhxN82lz5+4NOpT
 DN/JHb7h6m+BdE4veOdh5nhB4oAYCgNVCVQOuNUULSGtFil4jDqVUF1ZK
 IBb9UZK8OCbwOueauzC9M87ximq0ikU6GdsbmGgEu6EbvL/WcMEVwGzlG
 1vxnoL/AsVmfRh3QJ+20+Ics13BYEeGEAm6SBWLYGZ+/2NhpOtYLC1BvD
 9OTP0X0FdjFSPQ+gNKyV4TxSo4H5dQjkiISvbR3POLB4tS+YFwku5kJpt
 eDMVdk9xE/8U8RmO3jL19JwCXfir1pXhQfYyG4XBdGD/kVTH49UxlOU9a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645444"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427583"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:48 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC v4 06/22] igt/color: Add SW color transform functionality
Date: Wed, 14 Feb 2024 12:09:37 +0530
Message-ID: <20240214063953.1285495-7-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
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

From: Harry Wentland <harry.wentland@amd.com>

In order to test color we want to compare a HW (KMS) transform
with a SW transform. This introduces color transform for an
sRGB EOTF but this can be extended to other transforms. Code is
borrowed from Skia.

v3:
 - Use SPDX style license identifier (Kamil)
 - Replace large copy-paste of Skia license with copyright note
   in file header. Skia is BSD licensed, which is compatible with
   MIT.

v2:
 - Add inverse sRGB TF
 - Make TF functions available to tests
 - Modify tranform_pixels function to take multple transforms

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 258 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_color.h |  43 ++++++++
 lib/igt_fb.c    |   6 +-
 lib/igt_fb.h    |   2 +
 lib/meson.build |   1 +
 5 files changed, 307 insertions(+), 3 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h

diff --git a/lib/igt_color.c b/lib/igt_color.c
new file mode 100644
index 000000000..b8e6a86b0
--- /dev/null
+++ b/lib/igt_color.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * This file contains code adapted from Skia, which is
+ * Copyright (c) 2011 Google Inc. All rights reserved.
+ */
+
+#include <errno.h>
+#include <math.h>
+
+#include "igt_color.h"
+#include "igt_core.h"
+#include "igt_x86.h"
+
+
+static float clamp(float val, float min, float max)
+{
+	return ((val < min) ? min : ((val > max) ? max : val));
+}
+
+static float igt_color_tf_eval_unclamped(const struct igt_color_tf *fn, float x)
+{
+	if (x < fn->d)
+		return fn->c * x + fn->f;
+	return pow(fn->a * x + fn->b, fn->g) + fn->e;
+}
+
+static float igt_color_tf_eval(const struct igt_color_tf *fn, float x)
+{
+	float fn_at_x_unclamped = igt_color_tf_eval_unclamped(fn, x);
+	return clamp(fn_at_x_unclamped, 0.0f, 1.0f);
+}
+
+static void tf_inverse(const struct igt_color_tf *fn, struct igt_color_tf *inv) {
+	memset(inv, 0, sizeof(struct igt_color_tf));
+
+	if (fn->a > 0 && fn->g > 0) {
+		double a_to_the_g = pow(fn->a, fn->g);
+		inv->a = 1.f / a_to_the_g;
+		inv->b = -fn->e / a_to_the_g;
+		inv->g = 1.f / fn->g;
+	}
+
+	inv->d = fn->c * fn->d + fn->f;
+	inv->e = -fn->b / fn->a;
+	if (fn->c != 0) {
+		inv->c = 1.f / fn->c;
+		inv->f = -fn->f / fn->c;
+	}
+}
+
+void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
+{
+	struct igt_color_tf inv;
+
+	tf_inverse(&srgb_tf, &inv);
+
+	pixel->r = igt_color_tf_eval(&inv, pixel->r);
+	pixel->g = igt_color_tf_eval(&inv, pixel->g);
+	pixel->b = igt_color_tf_eval(&inv, pixel->b);
+}
+
+
+
+void igt_color_srgb_eotf(igt_pixel_t *pixel)
+{
+	pixel->r = igt_color_tf_eval(&srgb_tf, pixel->r);
+	pixel->g = igt_color_tf_eval(&srgb_tf, pixel->g);
+	pixel->b = igt_color_tf_eval(&srgb_tf, pixel->b);
+}
+
+int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
+{
+	uint32_t *line = NULL;
+	void *map;
+	char *ptr;
+	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
+	uint32_t stride = igt_fb_calc_plane_stride(fb, 0);
+
+	if (fb->num_planes != 1)
+		return -EINVAL;
+
+	/* TODO expand for other formats */
+	if (fb->drm_format != DRM_FORMAT_XRGB8888)
+		return -EINVAL;
+
+	ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(ptr);
+	map = ptr;
+
+	/*
+	 * Framebuffers are often uncached, which can make byte-wise accesses
+	 * very slow. We copy each line of the FB into a local buffer to speed
+	 * up the hashing.
+	 */
+	line = malloc(stride);
+	if (!line) {
+		munmap(map, fb->size);
+		return -ENOMEM;
+	}
+
+	for (y = 0; y < fb->height; y++, ptr += stride) {
+
+		/* get line from buffer */
+		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
+
+		for (x = 0; x < fb->width; x++) {
+			uint32_t raw_pixel = le32_to_cpu(line[x]);
+			igt_pixel_t pixel;
+			int i;
+
+			raw_pixel &= 0x00ffffff;
+
+			/*
+			 * unpack pixel into igt_pixel_t
+			 *
+			 * only for XRGB8888 for now
+			 *
+			 * TODO add "generic" mechanism for unpacking
+			 * other FB formats
+			 */
+			pixel.r = (raw_pixel & 0x00ff0000) >> 16;
+			pixel.g = (raw_pixel & 0x0000ff00) >> 8;
+			pixel.b = (raw_pixel & 0x000000ff);
+
+			/* normalize for 8-bit */
+			pixel.r /= (0xff);
+			pixel.g /= (0xff);
+			pixel.b /= (0xff);
+
+			/* TODO use read_rgb from igt_fb? */
+
+			/* run transform on pixel */
+
+			for (i = 0; i < num_transforms; i++)
+				transforms[i](&pixel);
+
+			/* de-normalize back to 8-bit */
+			pixel.r *= (0xff);
+			pixel.g *= (0xff);
+			pixel.b *= (0xff);
+
+			/* re-pack pixel into FB*/
+			raw_pixel = 0x0;
+			raw_pixel |= ((uint8_t) (lround(pixel.r) & 0xff)) << 16;
+			raw_pixel |= ((uint8_t) (lround(pixel.g) & 0xff)) << 8;
+			raw_pixel |= ((uint8_t) (lround(pixel.b) & 0xff));
+			/* TODO use write_rgb from igt_fb? */
+
+			/* write back to line */
+			line[x] = cpu_to_le32(raw_pixel);
+		}
+
+		/* copy line back to fb buffer */
+		igt_memcpy_from_wc(ptr, line, fb->width * cpp);
+	}
+
+	free(line);
+	igt_fb_unmap_buffer(fb, map);
+
+	return 0;
+
+	/* for each pixel */
+
+	/* convert to float and create igt_pixel */
+
+	/* call transform */
+
+	/* convert back to fb format from igt_pixel */
+
+
+}
+
+bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down)
+{
+	int16_t diff = comp2 - comp1;
+
+	if ((diff < -down) || (diff > up)) {
+		printf("comp1 %x comp2 %x diff %d down %d, up %d\n", comp1, comp2, diff, -down, up);
+		return false;
+	}
+
+	return true;
+}
+
+bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
+{
+	uint32_t *ptr1, *ptr2;
+	uint32_t pixel1, pixel2, i, j;
+	bool matched = true;
+
+
+	ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
+	ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
+
+	igt_assert(fb1->drm_format == fb2->drm_format);
+	igt_assert(fb1->size == fb2->size);
+
+	for (i = 0; i < fb1->size / sizeof(uint32_t); i++) {
+		uint16_t mask = 0xff;
+		uint16_t shift = 8;
+
+		if (fb1->drm_format == DRM_FORMAT_XRGB2101010) {
+			/* ignore alpha */
+			pixel1 = ptr1[i] & ~0xc0000000;
+			pixel2 = ptr2[i] & ~0xc0000000;
+
+			mask = 0x3ff;
+			shift = 10;
+
+
+		} else if (fb1->drm_format == DRM_FORMAT_XRGB8888) {
+			/* ignore alpha */
+			pixel1 = ptr1[i] & ~0xff000000;
+			pixel2 = ptr2[i] & ~0xff000000;
+
+			mask = 0xff;
+			shift = 8;
+
+		} else {
+			pixel1 = ptr1[i];
+			pixel2 = ptr2[i];
+		}
+
+		for (j = 0; j < 3; j++) {
+			uint16_t comp1 = (pixel1 >> (shift*j)) & mask;
+			uint16_t comp2 = (pixel2 >> (shift*j)) & mask;
+
+			if (!igt_cmp_fb_component(comp1, comp2, up, down)) {
+				/* TODO use proper log*/
+				printf("i %d j %d shift %d mask %x comp1 %x comp2 %x, pixel1 %x pixel2 %x\n",
+				       i, j, shift, mask, comp1, comp2, pixel1, pixel2);
+				return false;
+			}
+		}
+	}
+
+	igt_fb_unmap_buffer(fb1, ptr1);
+	igt_fb_unmap_buffer(fb2, ptr2);
+
+	return matched;
+}
+
+
+void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
+		 const char *path_name, const char *file_name)
+{
+	char filepath_out[PATH_MAX];
+	cairo_surface_t *fb_surface_out;
+	cairo_status_t status;
+
+	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name, file_name);
+	fb_surface_out = igt_get_cairo_surface(display->drm_fd, fb);
+	status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
+	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
+	cairo_surface_destroy(fb_surface_out);
+}
\ No newline at end of file
diff --git a/lib/igt_color.h b/lib/igt_color.h
new file mode 100644
index 000000000..ce72a025a
--- /dev/null
+++ b/lib/igt_color.h
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * This file contains code adapted from Skia, which is
+ * Copyright (c) 2011 Google Inc. All rights reserved.
+ */
+
+
+#ifndef __IGT_COLOR_H__
+#define __IGT_COLOR_H__
+
+#include <limits.h>
+
+#include "igt_fb.h"
+#include "igt_kms.h"
+
+struct igt_color_tf {
+    float g, a,b,c,d,e,f;
+};
+
+const struct igt_color_tf srgb_tf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+
+typedef struct igt_pixel {
+	float r;
+	float g;
+	float b;
+} igt_pixel_t;
+
+bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down);
+bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down);
+
+void igt_dump_fb(igt_display_t *display, igt_fb_t *fb, const char *path_name, const char *file_name);
+
+/* TODO also allow 64-bit pixels, or other weird sizes */
+typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
+
+int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
+
+void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
+void igt_color_srgb_eotf(igt_pixel_t *pixel);
+
+#endif
\ No newline at end of file
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 71c220a08..ee9cd1f35 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -762,7 +762,7 @@ void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 	}
 }
 
-static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
+uint32_t igt_fb_calc_plane_stride(struct igt_fb *fb, int plane)
 {
 	uint32_t min_stride = fb->plane_width[plane] *
 		(fb->plane_bpp[plane] / 8);
@@ -944,7 +944,7 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
 
 		/* respect the stride requested by the caller */
 		if (!fb->strides[plane])
-			fb->strides[plane] = calc_plane_stride(fb, plane);
+			fb->strides[plane] = igt_fb_calc_plane_stride(fb, plane);
 
 		align = get_plane_alignment(fb, plane);
 		if (align)
@@ -4756,7 +4756,7 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 	void *map;
 	char *ptr;
 	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
-	uint32_t stride = calc_plane_stride(fb, 0);
+	uint32_t stride = igt_fb_calc_plane_stride(fb, 0);
 
 	if (fb->num_planes != 1)
 		return -EINVAL;
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 834aaef54..d2751c0bb 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -170,6 +170,8 @@ int igt_dirty_fb(int fd, struct igt_fb *fb);
 void *igt_fb_map_buffer(int fd, struct igt_fb *fb);
 void igt_fb_unmap_buffer(struct igt_fb *fb, void *buffer);
 
+uint32_t igt_fb_calc_plane_stride(struct igt_fb *fb, int plane);
+
 void igt_create_bo_for_fb(int fd, int width, int height,
 			  uint32_t format, uint64_t modifier,
 			  struct igt_fb *fb);
diff --git a/lib/meson.build b/lib/meson.build
index 6122861d8..0c0e45522 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -104,6 +104,7 @@ lib_sources = [
 	'igt_edid.c',
 	'igt_eld.c',
 	'igt_infoframe.c',
+	'igt_color.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
 	'igt_dsc.c',
-- 
2.43.0

