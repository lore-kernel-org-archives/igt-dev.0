Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E503C10E1AF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 May 2023 07:45:02 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 11 May 2023 13:12:42 +0530
Message-Id: <20230511074243.167747-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] DO NOT MERGE: NV12 Experiment
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

From: Jeevan B <jeevan.b@intel.com>

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/fast-feedback.testlist |   9 +-
 tests/kms_pipe_crc_basic.c            | 292 ++++++++++++++++++++++++--
 2 files changed, 285 insertions(+), 16 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index d9fcb62d..4af9e8d2 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -118,7 +118,14 @@ igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-red
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-green
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-blue
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-red
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-green
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-blue
 igt@kms_pipe_crc_basic@hang-read-crc
 igt@kms_pipe_crc_basic@nonblocking-crc
 igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 65afc9f6..6b9def05 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -177,6 +177,108 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 	igt_display_commit(display);
 }
 
+static void test_compare_crc_xrgb(data_t *data, enum pipe pipe, igt_output_t *output, int color)
+{
+	igt_display_t *display = &data->display;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	igt_crc_t ref_crc, crc;
+	igt_pipe_crc_t *pipe_crc = NULL;
+	struct igt_fb fb0, fb1;
+
+	igt_display_reset(display);
+	igt_output_set_pipe(output, pipe);
+
+	mode = igt_output_get_mode(output);
+
+	/* Create two framebuffers with the same color info. */
+	switch (color) {
+	case 1:
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				1.0, 0.0, 0.0,
+				&fb0);
+
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				1.0, 0.0, 0.0,
+				&fb1);
+		break;
+	case 2:
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 1.0, 0.0,
+				&fb0);
+
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 1.0, 0.0,
+				&fb1);
+		break;
+	case 3:
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 0.0, 1.0,
+				&fb0);
+
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 0.0, 1.0,
+				&fb1);
+		break;
+	default:
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				1.0, 1.0, 1.0,
+				&fb0);
+
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				1.0, 1.0, 1.0,
+				&fb1);
+	}
+
+	/* Flip FB0 with the Primary plane & collect the CRC as ref CRC. */
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &fb0);
+	igt_display_commit(display);
+
+	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+				    IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+
+	/* Flip FB1 with the Primary plane & compare the CRC with ref CRC. */
+	igt_plane_set_fb(primary, &fb1);
+	igt_display_commit(display);
+
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &ref_crc);
+
+	/* Clean-up */
+	igt_pipe_crc_free(pipe_crc);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(display);
+
+	igt_remove_fb(data->drm_fd, &fb0);
+	igt_remove_fb(data->drm_fd, &fb1);
+}
 /*
  * CRC-sanity test, to make sure there would be no CRC mismatches
  *
@@ -187,7 +289,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
  *
  *   No CRC mismatch should happen
  */
-static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test_compare_crc_nv12(data_t *data, enum pipe pipe, igt_output_t *output, int color)
 {
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
@@ -202,18 +304,64 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 
 	/* Create two framebuffers with the same color info. */
-	igt_create_color_fb(data->drm_fd,
-			mode->hdisplay, mode->vdisplay,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_MOD_LINEAR,
-			1.0, 1.0, 1.0,
-			&fb0);
-	igt_create_color_fb(data->drm_fd,
-			mode->hdisplay, mode->vdisplay,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_MOD_LINEAR,
-			1.0, 1.0, 1.0,
-			&fb1);
+	switch (color) {
+	case 1:
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				1.0, 0.0, 0.0,
+				&fb0);
+
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				1.0, 0.0, 0.0,
+				&fb1);
+	case 2:
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 1.0, 0.0,
+				&fb0);
+
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 1.0, 0.0,
+				&fb1);
+	case 3:
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 0.0, 1.0,
+				&fb0);
+
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 0.0, 1.0,
+				&fb1);
+	default:
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				1.0, 1.0, 1.0,
+				&fb0);
+
+		igt_create_color_fb(data->drm_fd,
+				mode->hdisplay, mode->vdisplay,
+				DRM_FORMAT_NV12,
+				DRM_FORMAT_MOD_LINEAR,
+				1.0, 1.0, 1.0,
+				&fb1);
+	}
 
 	/* Flip FB0 with the Primary plane & collect the CRC as ref CRC. */
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -418,7 +566,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_describe("Basic sanity check for CRC mismatches");
-	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-xrgb") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
 			if (simulation_constraint(pipe))
 				continue;
@@ -427,7 +575,121 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-				test_compare_crc(&data, pipe, output);
+				test_compare_crc_xrgb(&data, pipe, output, 0);
+
+			break;
+		}
+	}
+
+	igt_describe("Basic sanity check for CRC mismatches");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-xrgb-red") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				if (simulation_constraint(pipe))
+					continue;
+
+				if(!pipe_output_combo_valid(&data.display, pipe, output))
+					continue;
+
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+					test_compare_crc_xrgb(&data, pipe, output, 1);
+
+			break;
+		}
+	}
+
+	igt_describe("Basic sanity check for CRC mismatches");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-xrgb-green") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				test_compare_crc_xrgb(&data, pipe, output, 2);
+
+			break;
+		}
+	}
+
+	igt_describe("Basic sanity check for CRC mismatches");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-xrgb-blue") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				test_compare_crc_xrgb(&data, pipe, output, 3);
+
+			break;
+		}
+	}
+
+	igt_describe("Basic sanity check for CRC mismatches");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				test_compare_crc_nv12(&data, pipe, output, 0);
+
+			break;
+		}
+	}
+
+	igt_describe("Basic sanity check for CRC mismatches");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12-red") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				if (simulation_constraint(pipe))
+					continue;
+
+				if(!pipe_output_combo_valid(&data.display, pipe, output))
+					continue;
+
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+					test_compare_crc_nv12(&data, pipe, output, 1);
+
+			break;
+		}
+	}
+
+	igt_describe("Basic sanity check for CRC mismatches");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12-green") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				test_compare_crc_nv12(&data, pipe, output, 2);
+
+			break;
+		}
+	}
+
+	igt_describe("Basic sanity check for CRC mismatches");
+	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12-blue") {
+		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
+			if(!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				test_compare_crc_nv12(&data, pipe, output, 3);
+
+			break;
 		}
 	}
 
-- 
2.25.1
