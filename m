Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58C10E088
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jun 2022 10:48:48 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Jun 2022 15:47:50 +0530
Message-Id: <20220613101750.31129-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: Test Refactoring
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

Add igt_display_reset in test_init().
Add new function to call all the subtests to avoid code duplication.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_plane.c | 117 ++++++++++++++++------------------------------
 1 file changed, 40 insertions(+), 77 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index b1be44c3..b9a25762 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -61,6 +61,7 @@ typedef struct {
 	int num_colors;
 	uint32_t crop;
 	bool extended;
+	unsigned int flags;
 } data_t;
 
 static bool all_pipes;
@@ -74,7 +75,9 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
  */
 static void test_init(data_t *data, enum pipe pipe)
 {
+	igt_require(data->display.pipes[pipe].n_planes > 0);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+	igt_display_reset(&data->display);
 }
 
 static void test_fini(data_t *data)
@@ -264,7 +267,7 @@ test_plane_position_with_output(data_t *data,
 }
 
 static void
-test_plane_position(data_t *data, enum pipe pipe, unsigned int flags)
+test_plane_position(data_t *data, enum pipe pipe)
 {
 	int n_planes = data->display.pipes[pipe].n_planes;
 	igt_output_t *output;
@@ -274,12 +277,12 @@ test_plane_position(data_t *data, enum pipe pipe, unsigned int flags)
 	igt_require(output);
 
 	test_init(data, pipe);
-	test_grab_crc(data, output, pipe, &green, flags, &reference_crc);
+	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
 
 	for (int plane = 1; plane < n_planes; plane++)
 		test_plane_position_with_output(data, pipe, plane,
 						output, &reference_crc,
-						flags);
+						data->flags);
 
 	test_fini(data);
 }
@@ -372,7 +375,7 @@ test_plane_panning_with_output(data_t *data,
 }
 
 static void
-test_plane_panning(data_t *data, enum pipe pipe, unsigned int flags)
+test_plane_panning(data_t *data, enum pipe pipe)
 {
 	igt_output_t *output;
 	igt_crc_t ref_crc;
@@ -382,12 +385,12 @@ test_plane_panning(data_t *data, enum pipe pipe, unsigned int flags)
 
 	test_init(data, pipe);
 
-	if (flags & TEST_PANNING_TOP_LEFT)
-		test_grab_crc(data, output, pipe, &red, flags, &ref_crc);
+	if (data->flags & TEST_PANNING_TOP_LEFT)
+		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
 	else
-		test_grab_crc(data, output, pipe, &blue, flags, &ref_crc);
+		test_grab_crc(data, output, pipe, &blue, data->flags, &ref_crc);
 
-	test_plane_panning_with_output(data, pipe, output, &ref_crc, flags);
+	test_plane_panning_with_output(data, pipe, output, &ref_crc, data->flags);
 
 	test_fini(data);
 }
@@ -1097,110 +1100,70 @@ static bool is_pipe_limit_reached(int count) {
 	return count >= CRTC_RESTRICT_CNT && !all_pipes;
 }
 
-static void
-run_tests_for_pipe_plane(data_t *data)
+static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 {
 	enum pipe pipe;
 	int count;
-	igt_fixture {
-		igt_require_pipe(&data->display, pipe);
-		igt_require(data->display.pipes[pipe].n_planes > 0);
+	count = 0;
+	for_each_pipe(&data->display, pipe) {
+		igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
+			test(data, pipe);
+
+		if (is_pipe_limit_reached(++count))
+			break;
 	}
+}
 
+static void
+run_tests_for_pipe_plane(data_t *data)
+{
 	igt_describe("verify the pixel formats for given plane and pipe");
-	igt_subtest_with_dynamic_f("pixel-format") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
-				test_pixel_formats(data, pipe);
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
-	}
+	igt_subtest_with_dynamic_f("pixel-format")
+		run_test(data, test_pixel_formats);
+
 	igt_describe("verify the pixel formats for given plane and pipe with source clamping");
 	igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe)) {
-				data->crop = 4;
-				test_pixel_formats(data, pipe);
-			}
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
+		data->crop = 4;
+		run_test(data, test_pixel_formats);
 	}
 
 	data->crop = 0;
 	igt_describe("verify plane position using two planes to create a fully covered screen");
 	igt_subtest_with_dynamic_f("plane-position-covered") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
-				test_plane_position(data, pipe, 0);
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
+		data->flags = 0;
+		run_test(data, test_plane_position);
 	}
 
 	igt_describe("verify plane position using two planes to create a partially covered screen");
 	igt_subtest_with_dynamic_f("plane-position-hole") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
-				test_plane_position(data, pipe,
-				TEST_POSITION_PARTIALLY_COVERED);
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
+		data->flags = TEST_POSITION_PARTIALLY_COVERED;
+		run_test(data, test_plane_position);
 	}
 
 	igt_describe("verify plane position using two planes to create a partially covered screen and"
 		       "check for DPMS");
 	igt_subtest_with_dynamic_f("plane-position-hole-dpms") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
-				test_plane_position(data, pipe,
-				TEST_POSITION_PARTIALLY_COVERED | TEST_DPMS);
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
+		data->flags = TEST_POSITION_PARTIALLY_COVERED | TEST_DPMS;
+		run_test(data, test_plane_position);
 	}
 
 	igt_describe("verify plane panning at top-left position using primary plane");
 	igt_subtest_with_dynamic_f("plane-panning-top-left") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
-				test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
+		data->flags = TEST_PANNING_TOP_LEFT;
+		run_test(data, test_plane_panning);
 	}
 
 	igt_describe("verify plane panning at bottom-right position using primary plane");
 	igt_subtest_with_dynamic_f("plane-panning-bottom-right") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
-				test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
+		data->flags = TEST_PANNING_BOTTOM_RIGHT;
+		run_test(data, test_plane_panning);
 	}
 
 	igt_describe("verify plane panning at bottom-right position using primary plane and executes system"
 		       "suspend cycles");
 	igt_subtest_with_dynamic_f("plane-panning-bottom-right-suspend") {
-		count = 0;
-		for_each_pipe(&data->display, pipe) {
-			igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
-				test_plane_panning(data, pipe,
-				TEST_PANNING_BOTTOM_RIGHT |
-				TEST_SUSPEND_RESUME);
-			if (is_pipe_limit_reached(++count))
-				break;
-		}
+		data->flags = TEST_PANNING_BOTTOM_RIGHT | TEST_SUSPEND_RESUME;
+		run_test(data, test_plane_panning);
 	}
 }
 
-- 
2.22.0
