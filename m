Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782D010E6CC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 06:22:01 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Nov 2023 11:59:44 +0530
Message-Id: <20231123062944.1889520-3-kunal1.joshi@intel.com>
In-Reply-To: <20231123062944.1889520-1-kunal1.joshi@intel.com>
References: <20231123062944.1889520-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_pipe_crc_basic: added new
 subtest for darkscreen detection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Nemesa Garg <nemesa.garg@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

dark screen detection feature when enable will monitor frames
and if black frame is detcted it will raise drm_error, added
two tests for positive (black frame) and negative case (white frame)

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_pipe_crc_basic.c | 55 +++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 94252415b..3c1ad3097 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -47,13 +47,10 @@ typedef struct {
 	struct igt_fb fb;
 } data_t;
 
-static struct {
+typedef struct {
 	double r, g, b;
 	igt_crc_t crc;
-} colors[2] = {
-	{ .r = 0.0, .g = 1.0, .b = 0.0 },
-	{ .r = 0.0, .g = 1.0, .b = 1.0 },
-};
+} color;
 
 static bool simulation_constraint(enum pipe pipe)
 {
@@ -92,6 +89,8 @@ enum {
 	TEST_NONBLOCK = 1 << 1,
 	TEST_SUSPEND = 1 << 2,
 	TEST_HANG = 1 << 3,
+	TEST_DARK_SCREEN = 1 << 4,
+	TEST_DARK_SCREEN_NEGATIVE = 1 << 5,
 };
 
 /**
@@ -136,6 +135,21 @@ enum {
  * Test category: functionality test
  * Functionality: crc, hang
  * Mega feature: General Display Features
+ *
+ * SUBTEST: darkscreen-read-crc
+ * Description: Test dark screen detection works
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc, hang, darkscreen
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: negative-darkscreen-read-crc
+ * Description: Test false positives aren't reported by dark screen detection
+ * Driver requirement: i915, xe
+ * Test category: functionality test
+ * Functionality: crc, hang, darkscreen
+ * Mega feature: General Display Features
+ *
  */
 static void test_read_crc(data_t *data, enum pipe pipe,
 			  igt_output_t *output, unsigned flags)
@@ -144,7 +158,8 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_crc_t *crcs = NULL;
-	int c, j;
+	color *colors;
+	int c, j, no_of_colors;
 
 	igt_display_reset(display);
 
@@ -153,7 +168,22 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-	for (c = 0; c < ARRAY_SIZE(colors); c++) {
+	if (flags & TEST_DARK_SCREEN) {
+		no_of_colors = 1;
+		colors = (color *)malloc(no_of_colors * sizeof(color));
+		colors[0] = (color){ .r = 0.0, .g = 0.0, .b = 0.0 };
+	} else if (flags & TEST_DARK_SCREEN_NEGATIVE) {
+		no_of_colors = 1;
+		colors = (color *)malloc(no_of_colors * sizeof(color));
+		colors[0] = (color){ .r = 1.0, .g = 1.0, .b = 1.0 };
+	} else {
+		no_of_colors = 2;
+		colors = (color *)malloc(no_of_colors * sizeof(color));
+		colors[0] = (color){ .r = 0.0, .g = 1.0, .b = 0.0 };
+		colors[1] = (color){ .r = 0.0, .g = 1.0, .b = 1.0 };
+	}
+
+	for (c = 0; c < no_of_colors; c++) {
 		char *crc_str;
 		int n_crcs;
 
@@ -229,6 +259,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 	}
 
 	/* Clean-up */
+	free(colors);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit(display);
@@ -422,6 +453,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			"Suspend test for pipe CRC reads." },
 		{ "hang-read-crc", TEST_HANG,
 			"Hang test for pipe CRC read." },
+		{"darkscreen-read-crc", TEST_DARK_SCREEN,
+			"Test dark screen detection works."},
+		{"negative-darkscreen-read-crc", TEST_DARK_SCREEN_NEGATIVE,
+			"Test false positives aren't reported by dark screen detection."},
 	};
 	int i;
 	last_pipe = 0;
@@ -475,6 +510,12 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 						test_read_crc(&data, pipe, output, 0);
 
 						igt_disallow_hang(data.drm_fd, hang);
+					} else if (tests[i].flags & TEST_DARK_SCREEN || tests[i].flags & TEST_DARK_SCREEN_NEGATIVE) {
+						igt_require_f(igt_is_dark_screen_supported(data.drm_fd, pipe),
+							     "Dark Screen Detection not supported\n");
+						igt_set_dark_screen_detection(data.drm_fd, pipe, true);
+						test_read_crc(&data, pipe, output, tests[i].flags);
+						igt_set_dark_screen_detection(data.drm_fd, pipe, false);
 					} else {
 						test_read_crc(&data, pipe, output, tests[i].flags);
 					}
-- 
2.25.1
