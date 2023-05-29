Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DE710E2C4
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 14:22:49 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 19:52:10 +0530
Message-Id: <20230529142211.333069-2-swati2.sharma@intel.com>
In-Reply-To: <20230529142211.333069-1-swati2.sharma@intel.com>
References: <20230529142211.333069-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] tests/kms_pipe_crc_basic: add nv12
 crc sanity check
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

New CRC sanitycheck test case is added with NV12 format.
kms_plane@pixel-format test is validating all formats.
To improve BAT coverage we can have one planar format crc
sanity test.

v2: -improved documentation (Bhanu)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_pipe_crc_basic.c | 46 ++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 84c73fd7..38092737 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -227,25 +227,31 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 }
 
 /**
- * SUBTEST: compare-crc-sanitycheck
- * Description: Basic sanity check for CRC mismatches
+ * SUBTEST: compare-crc-sanitycheck-%s
+ * Description: Basic sanity check for CRC mismatches with %arg[1]
  * Test category: functionality test
  * Run type: BAT
  * Functionality: crc
  * Mega feature: General Display Features
+ *
+ * arg[1]:
+ *
+ * @xr24:	XR24 format
+ * @nv12:	NV12 format
  */
 
 /*
  * CRC-sanity test, to make sure there would be no CRC mismatches
  *
- * - Create two framebuffers (FB0 & FB1) with same color info
- * - Flip FB0 with the Primary plane & collect the CRC as ref CRC.
- * - Flip FB1 with the Primary plane, collect the CRC & compare with
+ * - Create two framebuffers (FB0 & FB1).
+ * - Flip FB0 with the primary plane & collect the CRC as ref CRC.
+ * - Flip FB1 with the primary plane, collect the CRC & compare with
  *   the ref CRC.
  *
  *   No CRC mismatch should happen
  */
-static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
+			     uint32_t format)
 {
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
@@ -259,7 +265,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	mode = igt_output_get_mode(output);
 
-	/* Create two framebuffers with the same color info. */
 	igt_create_color_fb(data->drm_fd,
 			mode->hdisplay, mode->vdisplay,
 			DRM_FORMAT_XRGB8888,
@@ -267,13 +272,12 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
 			1.0, 1.0, 1.0,
 			&fb0);
 	igt_create_color_fb(data->drm_fd,
-			mode->hdisplay, mode->vdisplay,
-			DRM_FORMAT_XRGB8888,
+			mode->hdisplay, mode->vdisplay, format,
 			DRM_FORMAT_MOD_LINEAR,
 			1.0, 1.0, 1.0,
 			&fb1);
 
-	/* Flip FB0 with the Primary plane & collect the CRC as ref CRC. */
+	/* Flip FB0 with the primary plane & collect the CRC as ref CRC. */
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &fb0);
 	igt_display_commit(display);
@@ -282,7 +286,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
-	/* Flip FB1 with the Primary plane & compare the CRC with ref CRC. */
+	/* Flip FB1 with the primary plane & compare the CRC with ref CRC. */
 	igt_plane_set_fb(primary, &fb1);
 	igt_display_commit(display);
 
@@ -475,8 +479,22 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
-	igt_describe("Basic sanity check for CRC mismatches");
-	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
+	igt_describe("Basic sanity check for CRC mismatches with XR24 format");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-xr24") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				test_compare_crc(&data, pipe, output, DRM_FORMAT_XRGB8888);
+		}
+	}
+
+	igt_describe("Basic sanity check for CRC mismatches with NV12 format");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
 			if (simulation_constraint(pipe))
 				continue;
@@ -485,7 +503,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-				test_compare_crc(&data, pipe, output);
+				test_compare_crc(&data, pipe, output, DRM_FORMAT_NV12);
 		}
 	}
 
-- 
2.25.1
