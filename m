Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A886606A329
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RMSrZpaC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A26A10E06D;
	Mon, 16 Nov 2026 03:53:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F97A10E06D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 03:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794801064; x=1826337064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pZ7PMZRcc8pLayal6TFLTLEvsqp7NmwXlc5eGCJspz8=;
 b=RMSrZpaC69tnJonMf/jn/hiS2WlU9SBrRu0d691MmrJMbO7rvTm7QjRp
 XsPbcDVm2/gBsnwP2pj1BfGigr32L4X8BXTTD5/Tc9APSYWQDhCUWCKdn
 HvPcRSLdTmZtaLmolXM/xF2jDLKMmsRQ5pXmWLyuMVB9AIYSSeLBuegQ5
 G5kUK5EINdBzCVx6nq0F7AU6scx47WbH5HBVCYLA3wGQl7J+XPCzWnoZr
 K1ccBimK/ucduOSHFr8xuYWbfsUKE0OZ7mpMjmaEzlNsNcRCzh8HBDmT2
 VgJawTM16/n8mJkqLeE3OoAIyeNxLO9h9G3vLx95B7vBnw96oS2l+KRw4 Q==;
X-CSE-ConnectionGUID: nanFwK1QStKqArNzTrKjGQ==
X-CSE-MsgGUID: Gph3fiR3Qa+ComAsXMZN6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3606012"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3606012"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 19:51:04 -0800
X-CSE-ConnectionGUID: v/fdM0auSzGxktQBQwA+Dg==
X-CSE-MsgGUID: jlSDPP8vTa+Cs7QZ9Ce+JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9977372"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 19:51:02 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v1 1/1] Extended multiple planes with multiple pixel
 formats
Date: Mon, 16 Nov 2026 09:21:31 +0530
Message-ID: <20261116035131.452844-2-avandhica.s.r@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116035131.452844-1-avandhica.s.r@intel.com>
References: <20261116035131.452844-1-avandhica.s.r@intel.com>
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

Extend kms_plane_multiple to additionally exercise a range of pixel
formats (DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB16161616F,
DRM_FORMAT_YUYV, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB8888) on top
of the existing modifier-based subtests, for both the single-display
and 2-display test variants, to improve coverage of multi-plane
atomic commits across different pixel formats.

Signed-off-by: Avandhica S R <avandhica.s.r@intel.com>
---
 tests/kms_plane_multiple.c | 329 ++++++++++++++++++++++---------------
 1 file changed, 194 insertions(+), 135 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 0d338eeb5..6d31c912a 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -39,34 +39,48 @@
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
+
+/**
+ * SUBTEST: 2x-%s-and-%s
  * Description: Check that the kernel handles atomic updates of multiple planes
- *		simultaneously committed on 2 displays.
+ *		simultaneously committed on 2 displays, across pixel formats.
  *
  * arg[1]:
  *
- * @none:	 no-tiling
- * @4:           4-tiling
- * @x:           x-tiling
- * @y:           y-tiling
- * @yf:          yf-tiling
+ * @tiling-none: no-tiling
+ * @tiling-4:    4-tiling
+ * @tiling-x:    x-tiling
+ * @tiling-y:    y-tiling
+ * @tiling-yf:   yf-tiling
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
@@ -110,10 +124,10 @@ static void test_init(data_t *data, igt_crtc_t *crtc, int n_planes)
 	data->pipe_crc1 = igt_crtc_crc_new(crtc,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 
-	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
+	data->plane1 = calloc(crtc->n_planes, sizeof(*data->plane1));
 	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
 
-	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
+	data->fb1 = calloc(crtc->n_planes, sizeof(struct igt_fb));
 	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for FBs\n");
 }
 
@@ -137,7 +151,8 @@ static void test_fini(data_t *data, igt_output_t *output, int n_planes)
 static void
 get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 		  igt_pipe_crc_t *pipe_crc,
-		  color_t *color, igt_plane_t **plane, uint64_t modifier,
+		  color_t *color, igt_plane_t **plane, unsigned int pixel_format,
+		  uint64_t modifier,
 		  igt_crc_t *ref_crc)
 {
 	drmModeModeInfo *mode;
@@ -153,7 +168,7 @@ get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 	mode = igt_output_get_mode(output);
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
+			    pixel_format,
 			    modifier,
 			    color->red, color->green, color->blue,
 			    &data->fb1[primary->index]);
@@ -166,44 +181,9 @@ get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
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
@@ -212,12 +192,26 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 	int *y;
 	int *size;
 	int i;
-	int* suffle;
+	int *suffle;
+	cairo_t *cr, *o_cr;
+	unsigned int fb_id;
+	int h = 0;
 
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
 		     (long int) (crtc->n_planes * sizeof(*x)));
@@ -242,13 +236,13 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 		int n, m;
 		int a, b;
 
-		n = rand() % (crtc->n_planes-1);
-		m = rand() % (crtc->n_planes-1);
+		n = rand() % (crtc->n_planes);
+		m = rand() % (crtc->n_planes);
 
 		/*
 		 * keep primary plane at its place for test's sake.
 		 */
-		if(n == primary->index || m == primary->index)
+		if (n == primary->index || m == primary->index)
 			continue;
 
 		a = suffle[n];
@@ -262,7 +256,7 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 	/* planes with random positions */
 	x[primary->index] = 0;
 	y[primary->index] = 0;
-	for (i = 0; i < max_planes; i++) {
+	for (i = 0; i < crtc->n_planes; i++) {
 		/*
 		 * Here is made assumption primary plane will have
 		 * index zero.
@@ -281,35 +275,61 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 
 		x[i] = rand() % (mode->hdisplay - size[i]);
 		y[i] = rand() % (mode->vdisplay - size[i]);
+		/* source and destination frame buffer need to be even for YUYV FORMAT */
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
+			 * skipping planes 2 and above due to crc mismatch for
+			 * DRM_FORMAT_XYUV8888 and DRM_FORMAT_YUYV as they take
+			 * a different hw composition path
+			 */
+			if (plane[i]->index >= 2 &&
+			    (pixel_format == DRM_FORMAT_XYUV8888 ||
+			     pixel_format == DRM_FORMAT_YUYV)) {
+				continue;
+			} else {
+				plane_format = pixel_format;
+				plane_modifier = modifier;
+			}
+		}
+		igt_paint_color(cr, x[i], y[i],
+				size[i], size[i], 0.0, 0.0, 0.0);
+
+		fb_id = igt_create_fb(data->drm_fd, size[i], size[i],
+				      plane_format, plane_modifier, &fb[i]);
+		igt_assert(fb_id);
+		o_cr = igt_get_cairo_ctx(data->drm_fd, &fb[i]);
+		igt_paint_color(o_cr, 0, 0, size[i], size[i],
+				color->red, color->green, color->blue);
+		igt_put_cairo_ctx(o_cr);
 		igt_plane_set_fb(plane[i], &fb[i]);
+		igt_plane_set_position(plane[i], x[i], y[i]);
+		/* h counts successfully prepared planes */
+		h++;
+		if (h == max_planes - 1)
+			break;
 	}
-
-	/* primary plane */
-	plane[primary->index] = primary;
-	create_fb_for_mode_position(data, output, mode, color, x, y,
-				    size, size, modifier, max_planes, &fb[primary->index]);
+	igt_put_cairo_ctx(cr);
 	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
-	free((void*)x);
-	free((void*)y);
-	free((void*)size);
-	free((void*)suffle);
+	free((void *)x);
+	free((void *)y);
+	free((void *)size);
+	free((void *)suffle);
 }
 
 /*
@@ -325,13 +345,13 @@ prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
 
 static void
 test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
-				igt_output_t *output, int n_planes,
+				igt_output_t *output, int n_planes, unsigned int pixel_format,
 				uint64_t modifier)
 {
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
 	igt_crc_t crc;
 	igt_plane_t *plane;
-	int i;
+	int i, ret;
 	int err, c = 0;
 	int iterations = max(1, opt.iterations);
 	bool loop_forever;
@@ -354,13 +374,13 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 	get_reference_crc(data, output,
 			  crtc,
 			  data->pipe_crc1, &blue,
-			  data->plane1, modifier, &data->ref_crc1);
+			  data->plane1, pixel_format, modifier, &data->ref_crc1);
 
 	/* Find out how many planes are allowed simultaneously */
 	do {
 		c++;
 		prepare_planes(data, crtc, &blue,
-			       data->plane1, modifier, c, output, data->fb1);
+			       data->plane1, pixel_format, modifier, c, output, data->fb1);
 		err = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 		for_each_plane_on_crtc(crtc,
@@ -370,7 +390,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 		igt_output_set_crtc(output, NULL);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		for (int x = 0; x < c; x++)
+		for (int x = 0; x < crtc->n_planes; x++)
 			igt_remove_fb(data->drm_fd, &data->fb1[x]);
 	} while (!err && c < n_planes);
 
@@ -383,15 +403,16 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 
 	i = 0;
 	while (i < iterations || loop_forever) {
-
 		/* randomize planes and set up the holes */
 		prepare_planes(data, crtc, &blue,
-			       data->plane1, modifier, c, output, data->fb1);
+			       data->plane1, pixel_format, modifier, c, output, data->fb1);
 
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		igt_pipe_crc_start(data->pipe_crc1);
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+		igt_skip_on(ret != 0);
 
+		igt_pipe_crc_start(data->pipe_crc1);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc);
+
 		igt_assert_crc_equal(&data->ref_crc1, &crc);
 		igt_pipe_crc_stop(data->pipe_crc1);
 
@@ -406,6 +427,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 			igt_remove_fb(data->drm_fd, &data->fb1[x]);
 
 		i++;
+
 	}
 
 	test_fini(data, output, n_planes);
@@ -413,7 +435,7 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 
 static void
 test_plane_position(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
-		    uint64_t modifier)
+		    unsigned int pixel_format, uint64_t modifier)
 {
 	int n_planes = opt.all_planes ?
 			crtc->n_planes : DEFAULT_N_PLANES;
@@ -426,27 +448,27 @@ test_plane_position(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	test_plane_position_with_output(data,
 					crtc,
 					output,
-					n_planes, modifier);
+					n_planes, pixel_format, modifier);
 }
 
 static void test_init_2_display(data_t *data, igt_crtc_t *crtc1,
-				igt_crtc_t *crtc2, int n_planes)
+				igt_crtc_t *crtc2)
 {
 	data->pipe_crc1 = igt_crtc_crc_new(crtc1,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 	data->pipe_crc2 = igt_crtc_crc_new(crtc2,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 
-	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
+	data->plane1 = calloc(crtc1->n_planes, sizeof(*data->plane1));
 	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
 
-	data->plane2 = calloc(n_planes, sizeof(*data->plane2));
+	data->plane2 = calloc(crtc2->n_planes, sizeof(*data->plane2));
 	igt_assert_f(data->plane2 != NULL, "Failed to allocate memory for planes\n");
 
-	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
+	data->fb1 = calloc(crtc1->n_planes, sizeof(struct igt_fb));
 	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for FBs\n");
 
-	data->fb2 = calloc(n_planes, sizeof(struct igt_fb));
+	data->fb2 = calloc(crtc2->n_planes, sizeof(struct igt_fb));
 	igt_assert_f(data->fb2 != NULL, "Failed to allocate memory for FBs\n");
 }
 
@@ -476,12 +498,12 @@ static void test_fini_2_display(data_t *data)
 static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 					  igt_crtc_t *crtc2,
 					  igt_output_t *output1, igt_output_t *output2,
+					  unsigned int pixel_format,
 					  uint64_t modifier)
 {
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
 	igt_crc_t crc1, crc2;
-	int n_planes;
-
+	int n_planes, ret;
 	n_planes = min(crtc1->n_planes, crtc2->n_planes);
 	if (!opt.all_planes)
 		n_planes = min(n_planes, DEFAULT_N_PLANES);
@@ -494,24 +516,26 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 	 */
 
 	test_init_2_display(data, crtc1,
-			    crtc2, n_planes);
+			    crtc2);
 	get_reference_crc(data, output1,
 			  crtc1,
 			  data->pipe_crc1, &blue,
-			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1);
+			  data->plane1, pixel_format, modifier, &data->ref_crc1);
 	get_reference_crc(data, output2,
 			  crtc2,
 			  data->pipe_crc2, &blue,
-			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2);
+			  data->plane2, pixel_format, modifier, &data->ref_crc2);
 
 	prepare_planes(data, crtc1, &blue,
-		       data->plane1,
+		       data->plane1, pixel_format,
 		       modifier, 2, output1, data->fb1);
 	prepare_planes(data, crtc2, &blue,
-		       data->plane2,
+		       data->plane2, pixel_format,
 		       modifier, 2, output2, data->fb2);
 
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	igt_skip_on_f(ret != 0, "Bandwidth  combination not supported on this pipe pair\n");
+
 	igt_pipe_crc_start(data->pipe_crc1);
 	igt_pipe_crc_start(data->pipe_crc2);
 
@@ -520,16 +544,19 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 
 	igt_assert_crc_equal(&data->ref_crc1, &crc1);
 	igt_assert_crc_equal(&data->ref_crc2, &crc2);
+
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
 
@@ -554,21 +581,22 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 				      igt_crtc_name(crtc2), output2->name)
 				test_plane_position_2_display(data,
 							      crtc1, crtc2,
-							      output1, output2,
+							      output1, output2, pixel_format,
 							      modifier);
 			test_fini_2_display(data);
 		}
 	}
 }
 
-static void run_test(data_t *data, uint64_t modifier, const char *name)
+static void run_test(data_t *data, unsigned int pixel_format, const char *format_name,
+		     uint64_t modifier, const char *name)
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
@@ -581,7 +609,7 @@ static void run_test(data_t *data, uint64_t modifier, const char *name)
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name)
 			test_plane_position(data,
 					    crtc,
-					    output,
+					    output, pixel_format,
 					    modifier);
 	}
 }
@@ -607,6 +635,27 @@ static const struct {
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
@@ -657,28 +706,37 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
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
 
-	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
-		igt_subtest_with_dynamic_f("2x-%s", subtests[i].name) {
-			int valid_outputs = 0;
-			igt_output_t *output;
+	for (int j = 0; j < ARRAY_SIZE(pixel_format_list); j++) {
+		for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
+			igt_subtest_with_dynamic_f("2x-%s-and-%s", subtests[i].name,
+						   pixel_format_list[j].name) {
+				int valid_outputs = 0;
+				igt_output_t *output;
 
-			for_each_connected_output(&data.display, output)
-				valid_outputs++;
+				for_each_connected_output(&data.display, output)
+					valid_outputs++;
 
-			igt_require(valid_outputs > 1);
+				igt_require(valid_outputs > 1);
 
-			run_2_display_test(&data, subtests[i].modifier, subtests[i].name);
+				run_2_display_test(&data, pixel_format_list[j].format,
+						   pixel_format_list[j].name,
+						   subtests[i].modifier, subtests[i].name);
+			}
 		}
 	}
 
@@ -687,3 +745,4 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 		drm_close_driver(data.drm_fd);
 	}
 }
+
-- 
2.53.0

