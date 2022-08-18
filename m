Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D88614A1ED
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Aug 2022 06:25:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu, 18 Aug 2022 11:53:10 +0530
Message-Id: <20220818062310.235749-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
References: <20220810122023.1816804-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2] tests/kms_plane_cursor: Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Convert the existing subtests to dynamic subtests at pipe/output
level. And create an array of structures to populate subtests to
avoid code duplication.

This patch will also do some clenup to have a single function for
all subtests.

V2:
- Populate overlay outside test_init()
- New function for fb cleanup

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_cursor.c | 173 ++++++++++++++++-----------------------
 1 file changed, 69 insertions(+), 104 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 73085cc8..900833b1 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -30,6 +30,12 @@
  * - DRM index indicates z-ordering, higher index = higher z-order
  */
 
+enum {
+	TEST_PRIMARY = 0,
+	TEST_OVERLAY = 1 << 0,
+	TEST_VIEWPORT = 1 << 1,
+};
+
 typedef struct {
 	int x;
 	int y;
@@ -58,18 +64,16 @@ typedef struct data {
 } data_t;
 
 /* Common test setup. */
-static void test_init(data_t *data, enum pipe pipe_id)
+static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
 
 	data->pipe_id = pipe_id;
 	data->pipe = &data->display.pipes[data->pipe_id];
+	data->output = output;
 
 	igt_display_reset(display);
 
-	data->output = igt_get_single_output_for_pipe(&data->display, pipe_id);
-	igt_require(data->output);
-
 	data->mode = igt_output_get_mode(data->output);
 
 	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -202,92 +206,35 @@ static void test_cursor_spots(data_t *data, igt_fb_t *pfb, igt_fb_t *ofb,
 	}
 }
 
-/*
- * Tests atomic cursor positioning on a primary and overlay plane.
- * Assumes the cursor can be placed on top of the overlay.
- */
-static void test_cursor_overlay(data_t *data, int size, enum pipe pipe_id)
+static void test_cleanup(int drm_fd, igt_fb_t *pfb, igt_fb_t *ofb, igt_fb_t *cfb)
 {
-	igt_fb_t pfb, ofb, cfb;
-	int sw, sh;
-
-	test_init(data, pipe_id);
-	igt_require(data->overlay);
-
-	sw = data->mode->hdisplay;
-	sh = data->mode->vdisplay;
-
-	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888, 0,
-			    1.0, 1.0, 1.0, &pfb);
-
-	igt_create_color_fb(data->drm_fd, data->or.w, data->or.h,
-			    DRM_FORMAT_XRGB8888, 0, 0.5, 0.5, 0.5, &ofb);
-
-	igt_create_color_fb(data->drm_fd, size, size, DRM_FORMAT_ARGB8888, 0,
-			    1.0, 0.0, 1.0, &cfb);
-
-	igt_plane_set_fb(data->primary, &pfb);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-
-	test_cursor_spots(data, &pfb, &ofb, &cfb, &data->or, size);
-
-	test_fini(data);
-
-	igt_remove_fb(data->drm_fd, &cfb);
-	igt_remove_fb(data->drm_fd, &ofb);
-	igt_remove_fb(data->drm_fd, &pfb);
-}
-
-/* Tests atomic cursor positioning on a primary plane. */
-static void test_cursor_primary(data_t *data, int size, enum pipe pipe_id)
-{
-	igt_fb_t pfb, cfb;
-	int sw, sh;
-
-	test_init(data, pipe_id);
-
-	sw = data->mode->hdisplay;
-	sh = data->mode->vdisplay;
-
-	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888, 0,
-			    1.0, 1.0, 1.0, &pfb);
-
-	igt_create_color_fb(data->drm_fd, size, size, DRM_FORMAT_ARGB8888, 0,
-			    1.0, 0.0, 1.0, &cfb);
-
-	igt_plane_set_fb(data->primary, &pfb);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-
-	test_cursor_spots(data, &pfb, NULL, &cfb, &data->or, size);
-
-	test_fini(data);
-
-	igt_remove_fb(data->drm_fd, &cfb);
-	igt_remove_fb(data->drm_fd, &pfb);
+	igt_remove_fb(drm_fd, cfb);
+	igt_remove_fb(drm_fd, ofb);
+	igt_remove_fb(drm_fd, pfb);
 }
 
-/*
- * Tests atomic cursor positioning on a primary and overlay plane.
- * The overlay's buffer is larger than the viewport actually used
- * for display.
- */
-static void test_cursor_viewport(data_t *data, int size, enum pipe pipe_id)
+static void test_cursor(data_t *data, int size,
+			igt_fb_t pfb, igt_fb_t ofb, igt_fb_t cfb,
+			unsigned int flags)
 {
-	igt_fb_t pfb, ofb, cfb;
 	int sw, sh;
 	int pad = 128;
 
-	test_init(data, pipe_id);
-	igt_require(data->overlay);
-
 	sw = data->mode->hdisplay;
 	sh = data->mode->vdisplay;
 
+	test_cleanup(data->drm_fd, &pfb, &ofb, &cfb);
+
 	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888, 0,
 			    1.0, 1.0, 1.0, &pfb);
 
-	igt_create_color_fb(data->drm_fd, data->or.w + pad, data->or.h + pad,
-			    DRM_FORMAT_XRGB8888, 0, 0.5, 0.5, 0.5, &ofb);
+	if (flags & TEST_OVERLAY) {
+		int width = (flags & TEST_VIEWPORT) ? data->or.w + pad : data->or.w;
+		int height = (flags & TEST_VIEWPORT) ? data->or.h + pad : data->or.h;
+
+		igt_create_color_fb(data->drm_fd, width, height,
+				    DRM_FORMAT_XRGB8888, 0, 0.5, 0.5, 0.5, &ofb);
+	}
 
 	igt_create_color_fb(data->drm_fd, size, size, DRM_FORMAT_ARGB8888, 0,
 			    1.0, 0.0, 1.0, &cfb);
@@ -295,13 +242,7 @@ static void test_cursor_viewport(data_t *data, int size, enum pipe pipe_id)
 	igt_plane_set_fb(data->primary, &pfb);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	test_cursor_spots(data, &pfb, &ofb, &cfb, &data->or, size);
-
-	test_fini(data);
-
-	igt_remove_fb(data->drm_fd, &cfb);
-	igt_remove_fb(data->drm_fd, &ofb);
-	igt_remove_fb(data->drm_fd, &pfb);
+	test_cursor_spots(data, &pfb, (flags & TEST_OVERLAY)? &ofb : NULL, &cfb, &data->or, size);
 }
 
 igt_main
@@ -309,7 +250,21 @@ igt_main
 	static const int cursor_sizes[] = { 64, 128, 256 };
 	data_t data = {};
 	enum pipe pipe;
-	int i;
+	igt_output_t *output;
+	int i, j;
+	struct {
+		const char *name;
+		unsigned int flags;
+		const char *desc;
+	} tests[] = {
+		{ "primary", TEST_PRIMARY,
+		  "Tests atomic cursor positioning on primary plane" },
+		{ "overlay", TEST_PRIMARY | TEST_OVERLAY,
+		  "Tests atomic cursor positioning on primary plane and overlay plane" },
+		{ "viewport", TEST_PRIMARY | TEST_OVERLAY | TEST_VIEWPORT,
+		  "Tests atomic cursor positioning on primary plane and overlay plane "
+		  "with buffer larger than viewport used for display" },
+	};
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -321,26 +276,36 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
-	for_each_pipe_static(pipe)
-		for (i = 0; i < ARRAY_SIZE(cursor_sizes); ++i) {
-			int size = cursor_sizes[i];
-
-			igt_describe("Tests atomic cursor positioning on primary plane and overlay plane");
-			igt_subtest_f("pipe-%s-overlay-size-%d",
-				      kmstest_pipe_name(pipe), size)
-				test_cursor_overlay(&data, size, pipe);
-
-			igt_describe("Tests atomic cursor positioning on primary plane");
-			igt_subtest_f("pipe-%s-primary-size-%d",
-				      kmstest_pipe_name(pipe), size)
-				test_cursor_primary(&data, size, pipe);
-
-			igt_describe("Tests atomic cursor positioning on primary plane and overlay plane"
-				"with buffer larger than viewport used for display");
-			igt_subtest_f("pipe-%s-viewport-size-%d",
-				      kmstest_pipe_name(pipe), size)
-				test_cursor_viewport(&data, size, pipe);
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe_f("%s", tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", tests[i].name) {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				if ((tests[i].flags & TEST_OVERLAY) &&
+				    !igt_pipe_get_plane_type(&data.display.pipes[pipe],
+							     DRM_PLANE_TYPE_OVERLAY))
+					continue;
+
+				test_init(&data, pipe, output);
+
+				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
+					int size = cursor_sizes[j];
+					igt_fb_t pfb, ofb, cfb;
+
+					igt_dynamic_f("pipe-%s-%s-size-%d",
+						      kmstest_pipe_name(pipe),
+						      igt_output_name(output),
+						      size)
+						test_cursor(&data, size,
+							    pfb, ofb, cfb,
+							    tests[i].flags);
+
+					test_cleanup(data.drm_fd, &pfb, &ofb, &cfb);
+				}
+
+				test_fini(&data);
+			}
 		}
+	}
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.35.1
