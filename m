Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA9710E4CE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 08:40:56 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  2 May 2023 14:15:07 +0530
Message-Id: <20230502084507.1412747-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] DO NOT MERGE: NV12 Experiment
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/fast-feedback.testlist |  3 ++
 tests/kms_pipe_crc_basic.c            | 72 +++++++++++++++++++++++----
 2 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index d9fcb62d..7c93aa2b 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -119,6 +119,9 @@ igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@NV12-Check-BLUE
+igt@kms_pipe_crc_basic@NV12-Check-GREEN
+igt@kms_pipe_crc_basic@NV12-Check-RED
 igt@kms_pipe_crc_basic@hang-read-crc
 igt@kms_pipe_crc_basic@nonblocking-crc
 igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 65afc9f6..a6024cfc 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -187,7 +187,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
  *
  *   No CRC mismatch should happen
  */
-static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output, int color)
 {
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
@@ -208,12 +208,30 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
 			DRM_FORMAT_MOD_LINEAR,
 			1.0, 1.0, 1.0,
 			&fb0);
-	igt_create_color_fb(data->drm_fd,
-			mode->hdisplay, mode->vdisplay,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_MOD_LINEAR,
-			1.0, 1.0, 1.0,
-			&fb1);
+	if (color == 0)
+	{
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				1, 0, 0,
+				&fb1);
+	} else if (color == 1) {
+		igt_create_color_fb(data->drm_fd,
+                                mode->hdisplay, mode->vdisplay,
+                                DRM_FORMAT_NV12,
+                                DRM_FORMAT_MOD_LINEAR,
+                                0, 1, 0,
+                                &fb1);
+	} else {
+		igt_create_color_fb(data->drm_fd,
+                                mode->hdisplay, mode->vdisplay,
+                                DRM_FORMAT_NV12,
+                                DRM_FORMAT_MOD_LINEAR,
+                                0, 0, 1,
+                                &fb1);
+	}
+
 
 	/* Flip FB0 with the Primary plane & collect the CRC as ref CRC. */
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -418,7 +436,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Basic sanity check for CRC mismatches");
-	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
+	igt_subtest_with_dynamic("NV12-Check-BLUE") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
 			if (simulation_constraint(pipe))
 				continue;
@@ -426,11 +444,45 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			if(!pipe_output_combo_valid(&data.display, pipe, output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-				test_compare_crc(&data, pipe, output);
+			igt_dynamic_f("pipe-%s-%s-BLUE", kmstest_pipe_name(pipe), output->name)
+				test_compare_crc(&data, pipe, output, 2);
+
+			break;
 		}
 	}
 
+	igt_subtest_with_dynamic("NV12-Check-GREEN") {
+                for_each_pipe_with_single_output(&data.display, pipe, output) {
+                        if (simulation_constraint(pipe))
+                                continue;
+
+                        if(!pipe_output_combo_valid(&data.display, pipe, output))
+                                continue;
+
+                        igt_dynamic_f("pipe-%s-%s-GREEN", kmstest_pipe_name(pipe), output->name)
+                                test_compare_crc(&data, pipe, output, 1);
+
+                        break;
+                }
+        }
+
+
+	igt_subtest_with_dynamic("NV12-Check-RED") {
+                for_each_pipe_with_single_output(&data.display, pipe, output) {
+                        if (simulation_constraint(pipe))
+                                continue;
+
+                        if(!pipe_output_combo_valid(&data.display, pipe, output))
+                                continue;
+
+                        igt_dynamic_f("pipe-%s-%s-RED", kmstest_pipe_name(pipe), output->name)
+                                test_compare_crc(&data, pipe, output, 0);
+
+                        break;
+                }
+        }
+
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
-- 
2.25.1
