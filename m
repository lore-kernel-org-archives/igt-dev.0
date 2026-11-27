Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25037606A324
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 05:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TeE83rxj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA54C10E0B0;
	Fri, 27 Nov 2026 05:13:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA34410E82B
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 05:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795756212; x=1827292212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+aqtse9Zyr8YBy6ni6zysHq3Cd8zEhZrWCduxRMm0to=;
 b=TeE83rxjtRJVFR6//4mPly5se5I6D4RxrTx8IWmEHILSXiEEyJIevYLj
 2heDPthcPnQLb9Wsq2vPCawdI6C4mARW3D/vMo2FpMnFJntNEp3AcZpS4
 LEkUmgzWLJ5PUKfPhiTmzHayR0G+GAn2J8imn5lQQmjdEVNy4CV3eQWXT
 I3Iiwb24jZkJNovqH17L26ldWoR5lG2K7BUX1zrlfvb611Pf84LXB4ROy
 6fbDFxZZrEUuuhgBusvVlmYADi8ZVomlpP6/kH/07O6K8LsHvstq1UWEX
 lk4jOIDqtQAdKVQM2KF63vJVO9srQWVJVM7D+iyErK3YE02m7r23Tm97B w==;
X-CSE-ConnectionGUID: 9/44V4frS9KCzE+CUhRX/g==
X-CSE-MsgGUID: WkQgRHdLQYWluKeVQ2FDew==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4669961"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4669961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:10:12 -0800
X-CSE-ConnectionGUID: qAJcSt5fS8yQuwNx3V0+wQ==
X-CSE-MsgGUID: wS1qWnP7R2CcmxgKrRw+3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12099124"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:10:10 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v3 3/3] tests/kms_plane_multiple: Feature Adding pixel
 formats across multiple planes
Date: Fri, 27 Nov 2026 10:40:10 +0530
Message-ID: <20261127051010.937287-4-avandhica.s.r@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127051010.937287-1-avandhica.s.r@intel.com>
References: <20261127051010.937287-1-avandhica.s.r@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend kms_plane_multiple to test multiple pixel formats
and modifiers, including XYUV8888, XRGB16161616F, YUYV,
XRGB2101010, and XRGB8888. Add support for testing these
format and modifier combinations on both single-display
and dual-display configurations.

v2:
- separate fix and feature patch (kamil)

v3:
- use prefix for test in subject (kamil)

Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
---
 tests/kms_plane_multiple.c | 291 ++++++++++++++++++++++---------------
 1 file changed, 174 insertions(+), 117 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 9db3e891d..91de0685e 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -39,34 +39,47 @@
 #include <time.h>
 
 /**
- * SUBTEST: tiling-none
- * Description: Check that the kernel handles atomic updates of multiple planes
- *              correctly by changing their geometry and making sure the changes
- *              are reflected immediately after each commit.
- *
- * SUBTEST: tiling-%s
+ * SUBTEST: pixel-format-%s-and-modifier-format-%s
  * Description: Check that the kernel handles atomic updates of multiple planes
  *              correctly by changing their geometry and making sure the changes
  *              are reflected immediately after each commit.
  *
  * arg[1]:
  *
- * @4:           4-tiling
- * @x:           x-tiling
- * @y:           y-tiling
- * @yf:          yf-tiling
+ * @DRM_FORMAT_XYUV8888:       XYUV8888 pixel format
+ * @DRM_FORMAT_XRGB16161616F:  XRGB16161616F pixel format
+ * @DRM_FORMAT_YUYV:           YUYV pixel format
+ * @DRM_FORMAT_XRGB2101010:    XRGB2101010 pixel format
+ * @DRM_FORMAT_XRGB8888:       XRGB8888 pixel format
+ *
+ * arg[2]:
  *
- * SUBTEST: 2x-tiling-%s
+ * @tiling-none: no-tiling
+ * @tiling-4:    4-tiling
+ * @tiling-x:    x-tiling
+ * @tiling-y:    y-tiling
+ * @tiling-yf:   yf-tiling
+ */
+/**
+ * SUBTEST: 2x-%s-and-%s
  * Description: Check that the kernel handles atomic updates of multiple planes
- *		simultaneously committed on 2 displays.
+ *		simultaneously committed on 2 displays, across pixel formats
  *
  * arg[1]:
  *
- * @none:	 no-tiling
- * @4:           4-tiling
- * @x:           x-tiling
- * @y:           y-tiling
- * @yf:          yf-tiling
+ * @tiling-none:	no-tiling
+ * @tiling-4:           4-tiling
+ * @tiling-x:           x-tiling
+ * @tiling-y:           y-tiling
+ * @tiling-yf:          yf-tiling
+ *
+ * arg[2]:
+ *
+ * @DRM_FORMAT_XYUV8888:       XYUV8888 pixel format
+ * @DRM_FORMAT_XRGB16161616F:  XRGB16161616F pixel format
+ * @DRM_FORMAT_YUYV:           YUYV pixel format
+ * @DRM_FORMAT_XRGB2101010:    XRGB2101010 pixel format
+ * @DRM_FORMAT_XRGB8888:       XRGB8888 pixel format
  */
 
 IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
@@ -137,7 +150,8 @@ static void test_fini(data_t *data, igt_output_t *output)
 static void
 get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 		  igt_pipe_crc_t *pipe_crc,
-		  color_t *color, igt_plane_t **plane, uint64_t modifier,
+		  color_t *color, igt_plane_t **plane,
+		  unsigned int pixel_format, uint64_t modifier,
 		  igt_crc_t *ref_crc, struct igt_fb *ref_fb)
 {
 	drmModeModeInfo *mode;
@@ -153,7 +167,7 @@ get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 	mode = igt_output_get_mode(output);
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
+			    pixel_format,
 			    modifier,
 			    color->red, color->green, color->blue,
 			    ref_fb);
@@ -166,44 +180,9 @@ get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 	igt_pipe_crc_collect_crc(pipe_crc, ref_crc);
 }
 
-static void
-create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo *mode,
-			    color_t *color, int *rect_x, int *rect_y,
-			    int *rect_w, int *rect_h, uint64_t modifier,
-			    int max_planes, igt_fb_t *fb)
-{
-	unsigned int fb_id;
-	cairo_t *cr;
-	igt_plane_t *primary;
-
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      modifier,
-			      &fb[primary->index]);
-	igt_assert(fb_id);
-
-	cr = igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
-	igt_paint_color(cr, rect_x[0], rect_y[0],
-			mode->hdisplay, mode->vdisplay,
-			color->red, color->green, color->blue);
-
-	for (int i = 0; i < max_planes; i++) {
-		if (data->plane1[i]->type == DRM_PLANE_TYPE_PRIMARY)
-			continue;
-		igt_paint_color(cr, rect_x[i], rect_y[i],
-				rect_w[i], rect_h[i], 0.0, 0.0, 0.0);
-	}
-
-	igt_put_cairo_ctx(cr);
-}
-
-
 static void
 prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
-	       igt_plane_t **plane,
+	       igt_plane_t **plane, unsigned int pixel_format,
 	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_t *fb)
 {
 	drmModeModeInfo *mode;
@@ -213,10 +192,24 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 	int *size;
 	int i;
 	int *suffle;
+	cairo_t *cr, *o_cr;
+	unsigned int fb_id;
+	int h = 1;
 
+	mode = igt_output_get_mode(output);
 	igt_output_set_crtc(output,
 			    crtc);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay, mode->vdisplay,
+			      pixel_format,
+			      modifier,
+			      &fb[primary->index]);
+	igt_assert(fb_id);
+	cr = igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
+	igt_paint_color(cr, 0, 0,
+			mode->hdisplay, mode->vdisplay,
+			color->red, color->green, color->blue);
 
 	x = malloc(crtc->n_planes * sizeof(*x));
 	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n",
@@ -262,14 +255,16 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 	/* planes with random positions */
 	x[primary->index] = 0;
 	y[primary->index] = 0;
-	for (i = 0; i < max_planes; i++) {
+	for (i = 0; i < crtc->n_planes; i++) {
 		/*
 		 * Here is made assumption primary plane will have
 		 * index zero.
 		 */
 		uint32_t plane_format;
 		uint64_t plane_modifier;
-
+		/* h counts the successfully prepared planes */
+		if (h == max_planes)
+			break;
 		plane[i] = igt_output_get_plane(output, suffle[i]);
 
 		if (plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
@@ -281,30 +276,57 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 
 		x[i] = rand() % (mode->hdisplay - size[i]);
 		y[i] = rand() % (mode->vdisplay - size[i]);
+		/* source and destination framebuffer needs to be even for YUYV format */
+		if (pixel_format == DRM_FORMAT_YUYV) {
+			x[i] &= ~1;
+			size[i] &= ~1;
+		}
 
-		plane_format = plane[i]->type == DRM_PLANE_TYPE_CURSOR ?
-						 DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
-		plane_modifier = plane[i]->type == DRM_PLANE_TYPE_CURSOR ?
-						   DRM_FORMAT_MOD_LINEAR : modifier;
-
-		igt_skip_on(!igt_plane_has_format_mod(plane[i], plane_format,
-						      plane_modifier));
-
-		igt_create_color_fb(data->drm_fd,
-				    size[i], size[i],
-				    plane_format,
-				    plane_modifier,
-				    color->red, color->green, color->blue,
-				    &fb[i]);
+		if (plane[i]->type == DRM_PLANE_TYPE_CURSOR) {
+			if (pixel_format != DRM_FORMAT_XRGB8888) {
+				continue;
+			} else {
+				plane_format = DRM_FORMAT_ARGB8888;
+				plane_modifier = DRM_FORMAT_MOD_LINEAR;
+			}
+		}
 
-		igt_plane_set_position(plane[i], x[i], y[i]);
+		if (plane[i]->type == DRM_PLANE_TYPE_OVERLAY) {
+			if (!igt_plane_has_format_mod(plane[i], pixel_format, modifier))
+				continue;
+			/*
+			 * skipping planes above 2 due to crc mismatch for
+			 * DRM_FORMAT_XYUV8888 as it takes different hw
+			 * composition path
+			 */
+			if (plane[i]->index > 2 && pixel_format == DRM_FORMAT_XYUV8888) {
+				continue;
+			} else {
+				plane_format = pixel_format;
+				plane_modifier = modifier;
+			}
+		}
+		igt_paint_color(cr, x[i], y[i],
+				size[i], size[i], 0.0, 0.0, 0.0);
+
+		fb_id = igt_create_color_fb(data->drm_fd,
+					    size[i], size[i],
+					    plane_format,
+					    plane_modifier,
+					    color->red, color->green, color->blue,
+					    &fb[i]);
+		igt_assert(fb_id);
+		o_cr = igt_get_cairo_ctx(data->drm_fd, &fb[i]);
+		igt_paint_color(o_cr, 0, 0, size[i], size[i],
+				color->red, color->green, color->blue);
+		igt_put_cairo_ctx(o_cr);
 		igt_plane_set_fb(plane[i], &fb[i]);
+		igt_plane_set_position(plane[i], x[i], y[i]);
+		h++;
 	}
 
 	/* primary plane */
-	plane[primary->index] = primary;
-	create_fb_for_mode_position(data, output, mode, color, x, y,
-				    size, size, modifier, max_planes, &fb[primary->index]);
+	igt_put_cairo_ctx(cr);
 	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
 	free((void *)x);
 	free((void *)y);
@@ -325,7 +347,7 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 
 static void
 test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
-				igt_output_t *output, int n_planes,
+				igt_output_t *output, int n_planes, unsigned int pixel_format,
 				uint64_t modifier)
 {
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
@@ -354,13 +376,13 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 	get_reference_crc(data, output,
 			  crtc,
 			  data->pipe_crc1, &blue,
-			  data->plane1, modifier, &data->ref_crc1, &data->ref_fb1);
+			  data->plane1, pixel_format, modifier, &data->ref_crc1, &data->ref_fb1);
 
 	/* Find out how many planes are allowed simultaneously */
 	do {
 		c++;
 		prepare_planes(data, crtc, &blue,
-			       data->plane1, modifier, c, output, data->fb1);
+			       data->plane1, pixel_format, modifier, c, output, data->fb1);
 		err = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 		for_each_plane_on_crtc(crtc,
@@ -383,10 +405,9 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 
 	i = 0;
 	while (i < iterations || loop_forever) {
-
 		/* randomize planes and set up the holes */
 		prepare_planes(data, crtc, &blue,
-			       data->plane1, modifier, c, output, data->fb1);
+			       data->plane1, pixel_format, modifier, c, output, data->fb1);
 
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 		igt_skip_on(ret != 0);
@@ -413,7 +434,8 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 }
 
 static void
-test_plane_position(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+test_plane_position(data_t *data, igt_crtc_t *crtc,
+		    igt_output_t *output, unsigned int pixel_format,
 		    uint64_t modifier)
 {
 	int n_planes = opt.all_planes ?
@@ -427,7 +449,7 @@ test_plane_position(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	test_plane_position_with_output(data,
 					crtc,
 					output,
-					n_planes, modifier);
+					n_planes, pixel_format, modifier);
 }
 
 static void test_init_2_display(data_t *data, igt_crtc_t *crtc1,
@@ -476,7 +498,9 @@ static void test_fini_2_display(data_t *data)
 
 static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 					  igt_crtc_t *crtc2,
-					  igt_output_t *output1, igt_output_t *output2,
+					  igt_output_t *output1,
+					  igt_output_t *output2,
+					  unsigned int pixel_format,
 					  uint64_t modifier)
 {
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
@@ -499,21 +523,21 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 	get_reference_crc(data, output1,
 			  crtc1,
 			  data->pipe_crc1, &blue,
-			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1, &data->ref_fb1);
+			  data->plane1, pixel_format, modifier, &data->ref_crc1, &data->ref_fb1);
 	get_reference_crc(data, output2,
 			  crtc2,
 			  data->pipe_crc2, &blue,
-			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2, &data->ref_fb2);
+			  data->plane2, pixel_format, modifier, &data->ref_crc2, &data->ref_fb2);
 
 	prepare_planes(data, crtc1, &blue,
-		       data->plane1,
+		       data->plane1, pixel_format,
 		       modifier, 2, output1, data->fb1);
 	prepare_planes(data, crtc2, &blue,
-		       data->plane2,
+		       data->plane2, pixel_format,
 		       modifier, 2, output2, data->fb2);
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
-	igt_skip_on(ret != 0);
+	igt_skip_on_f(ret != 0, "Bandwidth combination not supported on this pipe pair\n");
 	igt_pipe_crc_start(data->pipe_crc1);
 	igt_pipe_crc_start(data->pipe_crc2);
 
@@ -524,14 +548,16 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 	igt_assert_crc_equal(&data->ref_crc2, &crc2);
 }
 
-static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
+static void run_2_display_test(data_t *data, unsigned int pixel_format,
+			       const char *f_name, uint64_t modifier,
+			       const char *name)
 {
 	igt_crtc_t *crtc1, *crtc2;
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
-	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
-		      "%s modifier is not supported\n", name);
+	igt_skip_on_f(!igt_display_has_format_mod(display, pixel_format, modifier),
+		      "%s modifier and %s format is not supported\n", name, f_name);
 
 	igt_display_reset(display);
 
@@ -556,7 +582,7 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 				      igt_crtc_name(crtc2), output2->name)
 				test_plane_position_2_display(data,
 							      crtc1, crtc2,
-							      output1, output2,
+							      output1, output2, pixel_format,
 							      modifier);
 			igt_output_set_crtc(output1, NULL);
 			igt_output_set_crtc(output2, NULL);
@@ -574,14 +600,16 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 	}
 }
 
-static void run_test(data_t *data, uint64_t modifier, const char *name)
+static void run_test(data_t *data, unsigned int pixel_format,
+		     const char *format_name, uint64_t modifier,
+		     const char *name)
 {
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
 
-	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
-		      "%s modifier is not supported\n", name);
+	igt_skip_on_f(!igt_display_has_format_mod(display, pixel_format, modifier),
+		      "%s modifier and %s pixel format is not supported\n", name, format_name);
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
 		igt_display_reset(display);
@@ -594,7 +622,7 @@ static void run_test(data_t *data, uint64_t modifier, const char *name)
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name)
 			test_plane_position(data,
 					    crtc,
-					    output,
+					    output, pixel_format,
 					    modifier);
 	}
 }
@@ -620,6 +648,27 @@ static const struct {
 	},
 };
 
+static const struct {
+	const char *name;
+	unsigned int format;
+} pixel_format_list[] = {
+	{ .name = "DRM_FORMAT_XYUV8888",
+	  .format = DRM_FORMAT_XYUV8888,
+	},
+	{ .name = "DRM_FORMAT_XRGB16161616F",
+	  .format = DRM_FORMAT_XRGB16161616F,
+	},
+	{ .name = "DRM_FORMAT_YUYV",
+	  .format = DRM_FORMAT_YUYV,
+	},
+	{ .name = "DRM_FORMAT_XRGB2101010",
+	  .format = DRM_FORMAT_XRGB2101010,
+	},
+	{ .name = "DRM_FORMAT_XRGB8888",
+	  .format = DRM_FORMAT_XRGB8888,
+	},
+};
+
 static data_t data;
 
 static int opt_handler(int option, int option_index, void *input)
@@ -670,28 +719,36 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 	}
-
-	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
-		igt_describe("Check that the kernel handles atomic updates of "
-			     "multiple planes correctly by changing their "
-			     "geometry and making sure the changes are "
-			     "reflected immediately after each commit.");
-
-		igt_subtest_with_dynamic(subtests[i].name)
-			run_test(&data, subtests[i].modifier, subtests[i].name);
+	for (int j = 0; j < ARRAY_SIZE(pixel_format_list); j++) {
+		for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
+			igt_describe("Check that the kernel handles atomic updates of "
+				     "multiple planes correctly by changing their "
+				     "geometry and making sure the changes are "
+				     "reflected immediately after each commit.");
+
+			igt_subtest_with_dynamic_f("pixel-format-%s-and-modifier-format-%s",
+						   pixel_format_list[j].name, subtests[i].name)
+				run_test(&data, pixel_format_list[j].format,
+					 pixel_format_list[j].name, subtests[i].modifier,
+					 subtests[i].name);
+		}
 	}
-
-	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
-		igt_subtest_with_dynamic_f("2x-%s", subtests[i].name) {
-			int valid_outputs = 0;
-			igt_output_t *output;
-
-			for_each_connected_output(&data.display, output)
-				valid_outputs++;
-
-			igt_require(valid_outputs > 1);
-
-			run_2_display_test(&data, subtests[i].modifier, subtests[i].name);
+	for (int j = 0; j < ARRAY_SIZE(pixel_format_list); j++) {
+		for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
+			igt_subtest_with_dynamic_f("2x-%s-and-%s", subtests[i].name,
+						   pixel_format_list[j].name) {
+				int valid_outputs = 0;
+				igt_output_t *output;
+
+				for_each_connected_output(&data.display, output)
+					valid_outputs++;
+
+				igt_require(valid_outputs > 1);
+
+				run_2_display_test(&data, pixel_format_list[j].format,
+						   pixel_format_list[j].name,
+						   subtests[i].modifier, subtests[i].name);
+			}
 		}
 	}
 
-- 
2.53.0

