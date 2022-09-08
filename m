Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B6310EAEB
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 13:18:44 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Sep 2022 18:44:17 +0530
Message-Id: <20220908131417.17308-3-jeevan.b@intel.com>
In-Reply-To: <20220908131417.17308-1-jeevan.b@intel.com>
References: <20220908131417.17308-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_psr2_sf: Convert tests
 to dynamic
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

Converting the existing subtests to dynamic subtests.

v2: Check for pipe supporting PSR2 or not and then add to dynamic subtest. (Jouni)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_sf.c | 259 +++++++++++++++++++++++++++------------
 1 file changed, 181 insertions(+), 78 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 6612587c..19efc5b9 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -838,14 +838,31 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
+static int check_psr2_support(data_t *data, enum pipe pipe, int x)
+{
+       igt_output_t *output;
+       igt_display_t *display = &data->display;
+
+       igt_display_reset(display);
+       output = data->output;
+       igt_output_set_pipe(output, pipe);
+
+       prepare(data);
+       x = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
+       cleanup(data);
+
+       return x;
+}
+
 igt_main
 {
 	data_t data = {};
 	int i;
+	enum pipe pipe;
+	int r;
 
 	igt_fixture {
 		drmModeResPtr res;
-		int r;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
@@ -888,131 +905,211 @@ igt_main
 
 	/* Verify primary plane selective fetch */
 	igt_describe("Test that selective fetch works on primary plane");
-	igt_subtest_f("primary-%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+						data.damage_area_count = i;
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				}
+			}
 		}
 	}
 
 	/* Verify primary plane selective fetch with big fb */
 	data.big_fb_test = 1;
 	igt_describe("Test that selective fetch works on primary plane with big fb");
-	igt_subtest_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+						data.damage_area_count = i;
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				}
+			}
 		}
 	}
 	data.big_fb_test = 0;
 
 	/* Verify overlay plane selective fetch */
 	igt_describe("Test that selective fetch works on overlay plane");
-	igt_subtest_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+						data.damage_area_count = i;
+						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				}
+			}
 		}
 	}
 
 	/* Verify overlay plane selective fetch */
 	igt_describe("Test that selective fetch works on cursor plane");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.damage_area_count = 1;
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+						data.damage_area_count = 1;
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				}
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS;
 	igt_describe("Test that selective fetch works on moving cursor plane (no update)");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				}
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
 	igt_describe("Test that selective fetch works on moving cursor plane exceeding partially visible area (no update)");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				}
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
 	igt_describe("Test that selective fetch works on moving cursor plane exceeding fully visible area (no update)");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				}
+			}
+		}
 	}
 
 	/* Only for overlay plane */
 	data.op = PLANE_MOVE;
 	/* Verify overlay plane move selective fetch */
 	igt_describe("Test that selective fetch works on moving overlay plane");
-	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
-		for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
-			data.pos = i;
-			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			 if (check_psr2_support(&data, pipe, r)) {
+				 igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
+						data.pos = i;
+						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				 }
+			 }
 		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS;
 	igt_describe("Test that selective fetch works on moving overlay plane (no update)");
-	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					prepare(&data);
+					run(&data);
+					cleanup(&data);
+				}
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
 	igt_describe("Test that selective fetch works on moving overlay plane partially exceeding visible area (no update)");
-	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					prepare(&data);
+					run(&data);
+					cleanup(&data);
+				}
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
 	igt_describe("Test that selective fetch works on moving overlay plane fully exceeding visible area (no update)");
-	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					prepare(&data);
+					run(&data);
+					cleanup(&data);
+				}
+			}
+		}
 	}
 
 	/* Verify primary plane selective fetch with overplay plane blended */
 	data.op = OVERLAY_PRIM_UPDATE;
 	igt_describe("Test that selective fetch works on primary plane "
 		     "with blended overlay plane");
-	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+						data.damage_area_count = i;
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
+				}
+			}
 		}
 	}
 
@@ -1023,12 +1120,18 @@ igt_main
 	data.op = PLANE_UPDATE_CONTINUOUS;
 	data.primary_format = DRM_FORMAT_NV12;
 	igt_describe("Test that selective fetch works on overlay plane");
-	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
-			data.damage_area_count = 1;
-			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe, r)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					data.damage_area_count = 1;
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					prepare(&data);
+					run(&data);
+					cleanup(&data);
+				}
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.36.0
