Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A296FC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 10:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595AD10E5C9;
	Thu, 20 Mar 2025 10:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTpF1oDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57F710E5C9
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742466722; x=1774002722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x9HshThe1G8NEW6Q05I1RQndCtHYsytLcOECc4Lq4Ls=;
 b=WTpF1oDPjLYenEI5ZY6n8joykDDKhZ3rUOAMax6QMc4V6zxuk6Nj/k+M
 RRJik82qTt1tYAdrC7dOHeQYn1hdpnw5NGZ/Vy8YaXxGuDmU3i1KMdkNV
 mMgFWm5FpC9RKVUQV1OK9ldBXwFK02z8EsnPrRc0HcqB9s+xsyWVWY93C
 ck2AtYPoxAjydHKNPnxKuJk18Rw4Rp71Tq9ZI7NfNDVy8KbaqlClVanoH
 cTYQmPpJ//Uhhu/rpkj9KwN8UYoEZE6QQ70LJu3M21J9AF3/WEuBsPUp3
 8o3YPg4jVFuiQPkGzy7fbN45FF/tSMIoml2Kw/fWG5QYn4zZz0h64leHG A==;
X-CSE-ConnectionGUID: MnETHUnYScaYYABOptMtsQ==
X-CSE-MsgGUID: nifTBTLQRau6f9jWRD5X4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="61081888"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="61081888"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 03:32:02 -0700
X-CSE-ConnectionGUID: aRcHRQsRSpOUS+VbXvR2zQ==
X-CSE-MsgGUID: pYlLvYctTwWJF7WG74WoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="122776038"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 03:32:00 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_plane_multiple: Add dual display subtest
Date: Thu, 20 Mar 2025 16:02:43 +0530
Message-ID: <20250320103243.823164-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add 2x subtest to verify MPO use case simulataneously on two
display configurations.

v2:
- Update the test to use all the modifiers (Jeevan)

v3:
- Add modifier support check before starting dynamic subtests

v4:
- Use n_planes instead of hardcoded values
- Free the displays resources after the subtest (Jeevan)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_plane_multiple.c | 259 ++++++++++++++++++++++++++++++-------
 1 file changed, 210 insertions(+), 49 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index eda300b06..775c9fa0f 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -55,6 +55,18 @@
  * @x:           x-tiling
  * @y:           y-tiling
  * @yf:          yf-tiling
+ *
+ * SUBTEST: 2x-tiling-%s
+ * Description: Check that the kernel handles atomic updates of multiple planes
+ *		simultaneously committed on 2 displays.
+ *
+ * arg[1]:
+ *
+ * @none:	 no-tiling
+ * @4:           4-tiling
+ * @x:           x-tiling
+ * @y:           y-tiling
+ * @yf:          yf-tiling
  */
 
 IGT_TEST_DESCRIPTION("Test atomic mode setting with multiple planes.");
@@ -73,10 +85,10 @@ typedef struct {
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
-	igt_crc_t ref_crc;
-	igt_pipe_crc_t *pipe_crc;
-	igt_plane_t **plane;
-	struct igt_fb *fb;
+	igt_crc_t ref_crc1, ref_crc2;
+	igt_pipe_crc_t *pipe_crc1, *pipe_crc2;
+	igt_plane_t **plane1, **plane2;
+	struct igt_fb *fb1, *fb2;
 } data_t;
 
 /* Command line parameters. */
@@ -95,14 +107,14 @@ struct {
  */
 static void test_init(data_t *data, enum pipe pipe, int n_planes)
 {
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+	data->pipe_crc1 = igt_pipe_crc_new(data->drm_fd, pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	data->plane = calloc(n_planes, sizeof(*data->plane));
-	igt_assert_f(data->plane != NULL, "Failed to allocate memory for planes\n");
+	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
+	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
 
-	data->fb = calloc(n_planes, sizeof(struct igt_fb));
-	igt_assert_f(data->fb != NULL, "Failed to allocate memory for FBs\n");
+	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
+	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for FBs\n");
 }
 
 static void test_fini(data_t *data, igt_output_t *output, int n_planes)
@@ -110,21 +122,21 @@ static void test_fini(data_t *data, igt_output_t *output, int n_planes)
 	/* reset the constraint on the pipe */
 	igt_output_set_pipe(output, PIPE_ANY);
 
-	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = NULL;
+	igt_pipe_crc_free(data->pipe_crc1);
+	data->pipe_crc1 = NULL;
 
-	free(data->plane);
-	data->plane = NULL;
+	free(data->plane1);
+	data->plane1 = NULL;
 
-	free(data->fb);
-	data->fb = NULL;
+	free(data->fb1);
+	data->fb1 = NULL;
 
 	igt_display_reset(&data->display);
 }
 
 static void
-get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
-	      color_t *color, uint64_t modifier)
+get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe, igt_pipe_crc_t *pipe_crc,
+	      color_t *color, igt_plane_t **plane, uint64_t modifier, igt_crc_t *ref_crc)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -134,7 +146,7 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	data->plane[primary->index] = primary;
+	plane[primary->index] = primary;
 
 	mode = igt_output_get_mode(output);
 
@@ -142,21 +154,21 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 			    DRM_FORMAT_XRGB8888,
 			    modifier,
 			    color->red, color->green, color->blue,
-			    &data->fb[primary->index]);
+			    &data->fb1[primary->index]);
 
-	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
+	igt_plane_set_fb(plane[primary->index], &data->fb1[primary->index]);
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 	igt_skip_on(ret != 0);
 
-	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
+	igt_pipe_crc_collect_crc(pipe_crc, ref_crc);
 }
 
 static void
 create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo *mode,
 			    color_t *color, int *rect_x, int *rect_y,
 			    int *rect_w, int *rect_h, uint64_t modifier,
-			    int max_planes)
+			    int max_planes, igt_fb_t *fb)
 {
 	unsigned int fb_id;
 	cairo_t *cr;
@@ -168,16 +180,16 @@ create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo
 			      mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
 			      modifier,
-			      &data->fb[primary->index]);
+			      &fb[primary->index]);
 	igt_assert(fb_id);
 
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[primary->index]);
+	cr = igt_get_cairo_ctx(data->drm_fd, &fb[primary->index]);
 	igt_paint_color(cr, rect_x[0], rect_y[0],
 			mode->hdisplay, mode->vdisplay,
 			color->red, color->green, color->blue);
 
 	for (int i = 0; i < max_planes; i++) {
-		if (data->plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
+		if (data->plane1[i]->type == DRM_PLANE_TYPE_PRIMARY)
 			continue;
 		igt_paint_color(cr, rect_x[i], rect_y[i],
 				rect_w[i], rect_h[i], 0.0, 0.0, 0.0);
@@ -188,8 +200,8 @@ create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo
 
 
 static void
-prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
-	       uint64_t modifier, int max_planes, igt_output_t *output)
+prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **plane,
+	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_t *fb)
 {
 	drmModeModeInfo *mode;
 	igt_pipe_t *pipe;
@@ -249,15 +261,14 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 		 * Here is made assumption primary plane will have
 		 * index zero.
 		 */
-		igt_plane_t *plane = igt_output_get_plane(output, suffle[i]);
 		uint32_t plane_format;
 		uint64_t plane_modifier;
 
-		data->plane[i] = plane;
+		plane[i] = igt_output_get_plane(output, suffle[i]);
 
-		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+		if (plane[i]->type == DRM_PLANE_TYPE_PRIMARY)
 			continue;
-		else if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		else if (plane[i]->type == DRM_PLANE_TYPE_CURSOR)
 			size[i] = SIZE_CURSOR;
 		else
 			size[i] = SIZE_PLANE;
@@ -265,10 +276,12 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 		x[i] = rand() % (mode->hdisplay - size[i]);
 		y[i] = rand() % (mode->vdisplay - size[i]);
 
-		plane_format = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
-		plane_modifier = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : modifier;
+		plane_format = plane[i]->type == DRM_PLANE_TYPE_CURSOR ?
+						 DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
+		plane_modifier = plane[i]->type == DRM_PLANE_TYPE_CURSOR ?
+						   DRM_FORMAT_MOD_LINEAR : modifier;
 
-		igt_skip_on(!igt_plane_has_format_mod(plane, plane_format,
+		igt_skip_on(!igt_plane_has_format_mod(plane[i], plane_format,
 						      plane_modifier));
 
 		igt_create_color_fb(data->drm_fd,
@@ -276,17 +289,17 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 				    plane_format,
 				    plane_modifier,
 				    color->red, color->green, color->blue,
-				    &data->fb[i]);
+				    &fb[i]);
 
-		igt_plane_set_position(data->plane[i], x[i], y[i]);
-		igt_plane_set_fb(data->plane[i], &data->fb[i]);
+		igt_plane_set_position(plane[i], x[i], y[i]);
+		igt_plane_set_fb(plane[i], &fb[i]);
 	}
 
 	/* primary plane */
-	data->plane[primary->index] = primary;
+	plane[primary->index] = primary;
 	create_fb_for_mode_position(data, output, mode, color, x, y,
-				    size, size, modifier, max_planes);
-	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
+				    size, size, modifier, max_planes, &fb[primary->index]);
+	igt_plane_set_fb(plane[primary->index], &fb[primary->index]);
 	free((void*)x);
 	free((void*)y);
 	free((void*)size);
@@ -332,12 +345,13 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 
 	test_init(data, pipe, n_planes);
 
-	get_reference_crc(data, output, pipe, &blue, modifier);
+	get_reference_crc(data, output, pipe, data->pipe_crc1, &blue,
+			  data->plane1, modifier, &data->ref_crc1);
 
 	/* Find out how many planes are allowed simultaneously */
 	do {
 		c++;
-		prepare_planes(data, pipe, &blue, modifier, c, output);
+		prepare_planes(data, pipe, &blue, data->plane1, modifier, c, output, data->fb1);
 		err = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 		for_each_plane_on_pipe(&data->display, pipe, plane)
@@ -347,7 +361,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
-			igt_remove_fb(data->drm_fd, &data->fb[x]);
+			igt_remove_fb(data->drm_fd, &data->fb1[x]);
 	} while (!err && c < n_planes);
 
 	if (err)
@@ -361,14 +375,14 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 	while (i < iterations || loop_forever) {
 
 		/* randomize planes and set up the holes */
-		prepare_planes(data, pipe, &blue, modifier, c, output);
+		prepare_planes(data, pipe, &blue, data->plane1, modifier, c, output, data->fb1);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		igt_pipe_crc_start(data->pipe_crc);
+		igt_pipe_crc_start(data->pipe_crc1);
 
-		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &crc);
-		igt_assert_crc_equal(&data->ref_crc, &crc);
-		igt_pipe_crc_stop(data->pipe_crc);
+		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc);
+		igt_assert_crc_equal(&data->ref_crc1, &crc);
+		igt_pipe_crc_stop(data->pipe_crc1);
 
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
@@ -377,7 +391,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
-			igt_remove_fb(data->drm_fd, &data->fb[x]);
+			igt_remove_fb(data->drm_fd, &data->fb1[x]);
 
 		i++;
 	}
@@ -400,6 +414,139 @@ test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t
 					n_planes, modifier);
 }
 
+static void test_init_2_display(data_t *data, enum pipe pipe1, enum pipe pipe2, int n_planes)
+{
+	data->pipe_crc1 = igt_pipe_crc_new(data->drm_fd, pipe1,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc2 = igt_pipe_crc_new(data->drm_fd, pipe2,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
+
+	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
+	igt_assert_f(data->plane1 != NULL, "Failed to allocate memory for planes\n");
+
+	data->plane2 = calloc(n_planes, sizeof(*data->plane2));
+	igt_assert_f(data->plane2 != NULL, "Failed to allocate memory for planes\n");
+
+	data->fb1 = calloc(n_planes, sizeof(struct igt_fb));
+	igt_assert_f(data->fb1 != NULL, "Failed to allocate memory for FBs\n");
+
+	data->fb2 = calloc(n_planes, sizeof(struct igt_fb));
+	igt_assert_f(data->fb2 != NULL, "Failed to allocate memory for FBs\n");
+}
+
+static void test_fini_2_display(data_t *data)
+{
+	igt_pipe_crc_stop(data->pipe_crc1);
+	igt_pipe_crc_stop(data->pipe_crc2);
+
+	igt_pipe_crc_free(data->pipe_crc1);
+	igt_pipe_crc_free(data->pipe_crc2);
+	data->pipe_crc1 = NULL;
+	data->pipe_crc2 = NULL;
+
+	free(data->plane1);
+	free(data->plane2);
+	data->plane1 = NULL;
+	data->plane2 = NULL;
+
+	free(data->fb1);
+	free(data->fb2);
+	data->fb1 = NULL;
+	data->fb2 = NULL;
+
+	igt_display_reset(&data->display);
+}
+
+static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pipe pipe2,
+					  igt_output_t *output1, igt_output_t *output2,
+					  uint64_t modifier)
+{
+	color_t blue  = { 0.0f, 0.0f, 1.0f };
+	igt_crc_t crc1, crc2;
+	int n_planes = opt.all_planes ?
+		       data->display.pipes[0].n_planes : DEFAULT_N_PLANES;
+
+	/*
+	 * Note: We could use the dynamic way of calculating the maximum planes here
+	 * like we've on single display subtest but this consumes a lot of extra time
+	 * with the number of dynamic subtests in this case. So keeping n_planes to the 
+	 * default value. This might need to be tweaked if we see any bw related failures.
+	 */
+
+	test_init_2_display(data, pipe1, pipe2, n_planes);
+	get_reference_crc(data, output1, pipe1, data->pipe_crc1, &blue,
+			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1);
+	get_reference_crc(data, output2, pipe2, data->pipe_crc2, &blue,
+			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2);
+
+	prepare_planes(data, pipe1, &blue, data->plane1,
+		       modifier, 2, output1, data->fb1);
+	prepare_planes(data, pipe2, &blue, data->plane2,
+		       modifier, 2, output2, data->fb2);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_pipe_crc_start(data->pipe_crc1);
+	igt_pipe_crc_start(data->pipe_crc2);
+
+	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc1, &crc1);
+	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc2, &crc2);
+
+	igt_assert_crc_equal(&data->ref_crc1, &crc1);
+	igt_assert_crc_equal(&data->ref_crc2, &crc2);
+}
+
+#define for_each_connected_output_local(display, output)		\
+	for (int j__ = 0;  assert(igt_can_fail()), j__ < (display)->n_outputs; j__++)	\
+		for_each_if((((output) = &(display)->outputs[j__]), \
+			      igt_output_is_connected((output))))
+
+#define for_each_valid_output_on_pipe_local(display, pipe, output) \
+	for_each_connected_output_local((display), (output)) \
+		for_each_if(igt_pipe_connector_valid((pipe), (output)))
+
+static void run_2_display_test(data_t *data, uint64_t modifier)
+{
+	enum pipe pipe1, pipe2;
+	igt_output_t *output1, *output2;
+	igt_display_t *display = &data->display;
+
+	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
+		return;
+
+	igt_display_reset(display);
+
+	for_each_pipe(display, pipe1) {
+		for_each_valid_output_on_pipe(display, pipe1, output1) {
+			for_each_pipe(display, pipe2) {
+				if (pipe1 == pipe2)
+					continue;
+
+				for_each_valid_output_on_pipe_local(display, pipe2, output2) {
+					if (output1 == output2)
+						continue;
+
+					igt_display_reset(display);
+
+					igt_output_set_pipe(output1, pipe1);
+					igt_output_set_pipe(output2, pipe2);
+
+					if (!intel_pipe_output_combo_valid(display))
+						continue;
+
+					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
+						       kmstest_pipe_name(pipe1), output1->name,
+						       kmstest_pipe_name(pipe2), output2->name)
+						test_plane_position_2_display(data, pipe1, pipe2,
+									      output1, output2,
+									      modifier);
+
+					test_fini_2_display(data);
+				}
+			}
+		}
+	}
+}
+
 static void run_test(data_t *data, uint64_t modifier)
 {
 	enum pipe pipe;
@@ -503,6 +650,20 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			run_test(&data, subtests[i].modifier);
 	}
 
+	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
+		igt_subtest_with_dynamic_f("2x-%s", subtests[i].name) {
+			int valid_outputs = 0;
+			igt_output_t *output;
+
+			for_each_connected_output(&data.display, output)
+				valid_outputs++;
+
+			igt_require(valid_outputs > 1);
+
+			run_2_display_test(&data, subtests[i].modifier);
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.43.0

