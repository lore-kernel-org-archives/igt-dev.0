Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D306E31C
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jul 2020 20:06:29 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Sun, 12 Jul 2020 01:36:02 +0530
Message-Id: <20200711200602.3217-12-mohammed.khajapasha@intel.com>
In-Reply-To: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/11] tests/kms: Use crtc offset to read
 vblank event for a pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arkadiusz.hiler@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Pass crtc_offset parameter to read a vblank event for a pipe
to vblank helper functions.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/i915/perf_pmu.c           |  3 ++-
 tests/kms_atomic_transition.c   |  6 ++++--
 tests/kms_available_modes_crc.c |  4 +++-
 tests/kms_color.c               | 35 +++++++++++++++++++++++----------
 tests/kms_cursor_crc.c          | 18 +++++++++++------
 tests/kms_cursor_edge_walk.c    |  4 +++-
 tests/kms_lease.c               | 18 ++++++++++++-----
 tests/kms_pipe_crc_basic.c      |  5 +++--
 tests/kms_plane.c               |  8 ++++++--
 tests/kms_sequence.c            |  3 ++-
 tests/kms_vblank.c              |  3 ++-
 11 files changed, 75 insertions(+), 32 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index f4db3c10..13e1bd93 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -874,7 +874,8 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	igt_display_commit(display);
 
-	igt_wait_for_vblank(fd, data->pipe);
+	igt_wait_for_vblank(fd,
+			display->pipes[data->pipe].crtc_offset);
 }
 
 static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 8c1c1d93..35e435f9 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -77,13 +77,15 @@ run_primary_test(igt_display_t *display, enum pipe pipe, igt_output_t *output)
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
 		if (!(i & 1))
-			igt_wait_for_vblank(display->drm_fd, pipe);
+			igt_wait_for_vblank(display->drm_fd,
+					display->pipes[pipe].crtc_offset);
 
 		igt_plane_set_fb(primary, (i & 1) ? &fb : NULL);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
 		if (i & 1)
-			igt_wait_for_vblank(display->drm_fd, pipe);
+			igt_wait_for_vblank(display->drm_fd,
+					display->pipes[pipe].crtc_offset);
 
 		igt_plane_set_fb(primary, (i & 1) ? NULL : &fb);
 	}
diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
index 23d035f7..09785ed8 100644
--- a/tests/kms_available_modes_crc.c
+++ b/tests/kms_available_modes_crc.c
@@ -285,6 +285,7 @@ test_one_mode(data_t* data, igt_output_t *output, igt_plane_t* plane,
 	igt_crc_t current_crc;
 	signed rVal = 0;
 	int i;
+	igt_display_t *display = &data->display;
 
 	/*
 	 * Limit tests only to those fb formats listed in fillers table
@@ -304,7 +305,8 @@ test_one_mode(data_t* data, igt_output_t *output, igt_plane_t* plane,
 		igt_fb_set_position(&data->fb, plane, 0, 0);
 		igt_display_commit2(&data->display, data->commit);
 
-		igt_wait_for_vblank(data->gfx_fd, pipe);
+		igt_wait_for_vblank(data->gfx_fd,
+				display->pipes[pipe].crtc_offset);
 		igt_pipe_crc_get_current(data->gfx_fd, data->pipe_crc, &current_crc);
 
 		if (plane->type != DRM_PLANE_TYPE_CURSOR) {
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 8c50ee66..f2686f57 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -30,6 +30,7 @@ static void test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
 	igt_output_t *output;
+	igt_display_t *display = &data->display;
 	gamma_lut_t *degamma_linear, *degamma_full;
 	gamma_lut_t *gamma_linear;
 	color_t red_green_blue[] = {
@@ -82,7 +83,8 @@ static void test_pipe_degamma(data_t *data,
 		paint_rectangles(data, mode, red_green_blue, &fb);
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
 		/* Draw a gradient with degamma LUT to remap all
@@ -92,7 +94,8 @@ static void test_pipe_degamma(data_t *data,
 		igt_plane_set_fb(primary, &fb);
 		set_degamma(data, primary->pipe, degamma_full);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
 		/* Verify that the CRC of the software computed output is
@@ -117,6 +120,7 @@ static void test_pipe_gamma(data_t *data,
 			    igt_plane_t *primary)
 {
 	igt_output_t *output;
+	igt_display_t *display = &data->display;
 	gamma_lut_t *gamma_full;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -164,7 +168,8 @@ static void test_pipe_gamma(data_t *data,
 		paint_rectangles(data, mode, red_green_blue, &fb);
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
 		/* Draw a gradient with gamma LUT to remap all values
@@ -173,7 +178,8 @@ static void test_pipe_gamma(data_t *data,
 		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
 		/* Verify that the CRC of the software computed output is
@@ -197,6 +203,7 @@ static void test_pipe_legacy_gamma(data_t *data,
 				   igt_plane_t *primary)
 {
 	igt_output_t *output;
+	igt_display_t *display = &data->display;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -250,7 +257,8 @@ static void test_pipe_legacy_gamma(data_t *data,
 		paint_rectangles(data, mode, red_green_blue, &fb);
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
 
 		/* Draw a gradient with gamma LUT to remap all values
@@ -265,7 +273,8 @@ static void test_pipe_legacy_gamma(data_t *data,
 		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
 						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
 
 		/* Verify that the CRC of the software computed output is
@@ -426,6 +435,7 @@ static bool test_pipe_ctm(data_t *data,
 	gamma_lut_t *degamma_linear, *gamma_linear;
 	igt_output_t *output;
 	bool ret = true;
+	igt_display_t *display = &data->display;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
@@ -480,7 +490,8 @@ static bool test_pipe_ctm(data_t *data,
 		igt_plane_set_fb(primary, &fb);
 		set_ctm(primary->pipe, ctm_identity);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
 
 		/* With CTM transformation. */
@@ -488,7 +499,8 @@ static bool test_pipe_ctm(data_t *data,
 		igt_plane_set_fb(primary, &fb);
 		set_ctm(primary->pipe, ctm_matrix);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
 
 		/* Verify that the CRC of the software computed output is
@@ -539,6 +551,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 	gamma_lut_t *degamma_linear, *gamma_linear;
 	igt_output_t *output;
 	bool has_broadcast_rgb_output = false;
+	igt_display_t *display = &data->display;
 
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
@@ -583,7 +596,8 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		paint_rectangles(data, mode, red_green_blue_limited, &fb);
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
 
 		/* Set the output into limited range. */
@@ -591,7 +605,8 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		paint_rectangles(data, mode, red_green_blue_full, &fb);
 		igt_plane_set_fb(primary, &fb);
 		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
 
 		/* And reset.. */
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 7e6b24cc..88265fd9 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -199,7 +199,8 @@ static void do_single_test(data_t *data, int x, int y)
 	igt_display_commit(display);
 
 	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 
 	if (data->flags & (TEST_DPMS | TEST_SUSPEND)) {
@@ -238,7 +239,8 @@ static void do_single_test(data_t *data, int x, int y)
 	igt_display_commit(display);
 	igt_dirty_fb(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
 	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 	igt_assert_crc_equal(&crc, &ref_crc);
@@ -496,7 +498,8 @@ static void test_cursor_alpha(data_t *data, double a)
 	/*Hardware Test*/
 	cursor_enable(data);
 	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
 	cursor_disable(data);
 	igt_remove_fb(data->drm_fd, &data->fb);
@@ -507,7 +510,8 @@ static void test_cursor_alpha(data_t *data, double a)
 	igt_put_cairo_ctx(cr);
 
 	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 	igt_assert_crc_equal(&crc, &ref_crc);
 
@@ -612,7 +616,8 @@ static void test_cursor_size(data_t *data)
 		igt_plane_set_size(data->cursor, size, size);
 		igt_fb_set_size(&data->fb, data->cursor, size, size);
 		igt_display_commit(display);
-		igt_wait_for_vblank(data->drm_fd, data->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[i]);
 	}
 	cursor_disable(data);
@@ -626,7 +631,8 @@ static void test_cursor_size(data_t *data)
 		igt_put_cairo_ctx(cr);
 
 		igt_display_commit(display);
-		igt_wait_for_vblank(data->drm_fd, data->pipe);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset);
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 		/* Clear screen afterwards */
 		cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 96a78792..32b8e711 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -84,6 +84,7 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 static void cursor_move(data_t *data, int x, int y, int i)
 {
 	int crtc_id = data->output->config.crtc->crtc_id;
+	igt_display_t *display = &data->display;
 
 	igt_debug("[%d] x=%d, y=%d\n", i, x, y);
 
@@ -95,7 +96,8 @@ static void cursor_move(data_t *data, int x, int y, int i)
 	igt_assert(drmModeMoveCursor(data->drm_fd, crtc_id, x, y) == 0 ||
 		   (IS_CHERRYVIEW(data->devid) && data->pipe == PIPE_C &&
 		    x < 0 && x > -data->curw));
-	igt_wait_for_vblank(data->drm_fd, data->pipe);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[data->pipe].crtc_offset);
 }
 
 #define XSTEP 8
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 4045fbca..cd8928fb 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -183,7 +183,7 @@ static int prepare_crtc(lease_t *lease, uint32_t connector_id, uint32_t crtc_id)
 	if (ret)
 		return ret;
 
-	igt_wait_for_vblank(lease->fd, pipe);
+	igt_wait_for_vblank(lease->fd, display->pipes[pipe].crtc_offset);
 
 	lease->output = output;
 	lease->mode = mode;
@@ -321,6 +321,8 @@ static void page_flip_implicit_plane(data_t *data)
 	drmModePlaneRes *plane_resources;
 	uint32_t wrong_plane_id = 0;
 	int i;
+	enum pipe pipe;
+	igt_display_t *display;
 
 	/* find a plane which isn't the primary one for us */
 	plane_resources = drmModeGetPlaneResources(data->master.fd);
@@ -351,9 +353,13 @@ static void page_flip_implicit_plane(data_t *data)
 	do_or_die(drmModePageFlip(data->master.fd, data->crtc_id,
 			      data->master.primary_fb.fb_id,
 			      0, NULL));
+
+	display = &data->master.display;
+	pipe = crtc_id_to_pipe(display, data->crtc_id);
+
 	igt_wait_for_vblank_count(data->master.fd,
-				  crtc_id_to_pipe(&data->master.display, data->crtc_id),
-				  1);
+			display->pipes[pipe].crtc_offset, 1);
+
 	do_or_die(drmModePageFlip(mcl.fd, data->crtc_id,
 			      data->master.primary_fb.fb_id,
 			      0, NULL));
@@ -362,9 +368,11 @@ static void page_flip_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = wrong_plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl));
 
+	pipe = crtc_id_to_pipe(display, data->crtc_id);
+
 	igt_wait_for_vblank_count(data->master.fd,
-				  crtc_id_to_pipe(&data->master.display, data->crtc_id),
-				  1);
+			display->pipes[pipe].crtc_offset, 1);
+
 	igt_assert_eq(drmModePageFlip(mcl.fd, data->crtc_id,
 				      data->master.primary_fb.fb_id,
 				      0, NULL),
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 82856efa..cb93c1ad 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -105,10 +105,11 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 			igt_pipe_crc_t *pipe_crc;
 
 			pipe_crc = igt_pipe_crc_new_nonblock(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
-			igt_wait_for_vblank(data->drm_fd, pipe);
+			igt_wait_for_vblank(data->drm_fd, display->pipes[pipe].crtc_offset);
 			igt_pipe_crc_start(pipe_crc);
 
-			igt_wait_for_vblank_count(data->drm_fd, pipe, N_CRCS);
+			igt_wait_for_vblank_count(data->drm_fd,
+					display->pipes[pipe].crtc_offset, N_CRCS);
 			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS+1, &crcs);
 			igt_pipe_crc_stop(pipe_crc);
 			igt_pipe_crc_free(pipe_crc);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 42088488..430210d8 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -593,8 +593,12 @@ static void capture_format_crcs(data_t *data, enum pipe pipe,
 			igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
 
 			/* setplane for the cursor does not block */
-			if (plane->type == DRM_PLANE_TYPE_CURSOR)
-				igt_wait_for_vblank(data->drm_fd, pipe);
+			if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+				igt_display_t *display = &data->display;
+
+				igt_wait_for_vblank(data->drm_fd,
+						display->pipes[pipe].crtc_offset);
+			}
 		}
 
 		igt_remove_fb(data->drm_fd, &old_fb);
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index ff2d73cd..a21ab55c 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -117,7 +117,8 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	igt_display_commit(display);
 
-	igt_wait_for_vblank(fd, data->pipe);
+	igt_wait_for_vblank(fd,
+			display->pipes[data->pipe].crtc_offset);
 }
 
 static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index a895ab80..be001312 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -92,7 +92,8 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 	igt_display_commit(display);
 
-	igt_wait_for_vblank(fd, data->pipe);
+	igt_wait_for_vblank(fd,
+			display->pipes[data->pipe].crtc_offset);
 }
 
 static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
