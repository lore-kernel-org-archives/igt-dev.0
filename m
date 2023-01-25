Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743BC10E762
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 09:08:09 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 11:07:41 +0200
Message-Id: <20230125090742.1599761-2-jouni.hogander@intel.com>
In-Reply-To: <20230125090742.1599761-1-jouni.hogander@intel.com>
References: <20230125090742.1599761-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_psr2_sf: Some cleanups
 after
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

Handle setting output for pipe in prepare and remove separate setup_output.
Carry all test parameters in data structure

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 145 ++++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 77 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index cfde6cfc..078884ac 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -85,6 +85,7 @@ typedef struct {
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
+	enum pipe pipe;
 } data_t;
 
 static const char *op_str(enum operations op)
@@ -103,30 +104,10 @@ static const char *op_str(enum operations op)
 	return name[op];
 }
 
-static void setup_output(data_t *data)
-{
-	igt_display_t *display = &data->display;
-	igt_output_t *output;
-	enum pipe pipe;
-
-	for_each_pipe_with_valid_output(display, pipe, output) {
-		drmModeConnectorPtr c = output->config.connector;
-
-		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
-			continue;
-
-		igt_output_set_pipe(output, pipe);
-		data->output = output;
-		data->mode = igt_output_get_mode(output);
-
-		return;
-	}
-}
-
 static void display_init(data_t *data)
 {
 	igt_display_require(&data->display, data->drm_fd);
-	setup_output(data);
+	igt_display_reset(&data->display);
 }
 
 static void display_fini(data_t *data)
@@ -237,11 +218,15 @@ static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
 	set_clip(&data->plane_move_clip, x, y, SQUARE_SIZE, SQUARE_SIZE);
 }
 
-static void prepare(data_t *data, igt_output_t *output)
+static void prepare(data_t *data)
 {
+	igt_output_t *output = data->output;
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
 	int fb_w, fb_h, x, y, view_w, view_h;
 
+	igt_output_set_pipe(output, data->pipe);
+	data->mode = igt_output_get_mode(output);
+
 	if (data->big_fb_test) {
 		fb_w = data->big_fb_width;
 		fb_h = data->big_fb_height;
@@ -808,8 +793,9 @@ static void run(data_t *data)
 	}
 }
 
-static void cleanup(data_t *data, igt_output_t *output)
+static void cleanup(data_t *data)
 {
+	igt_output_t *output = data->output;
 	igt_plane_t *primary;
 	igt_plane_t *sprite;
 
@@ -838,20 +824,13 @@ static void cleanup(data_t *data, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
-static int check_psr2_support(data_t *data, enum pipe pipe)
+static int check_psr2_support(data_t *data)
 {
 	int status;
 
-	igt_output_t *output;
-	igt_display_t *display = &data->display;
-
-	igt_display_reset(display);
-	output = data->output;
-	igt_output_set_pipe(output, pipe);
-
-	prepare(data, output);
+	prepare(data);
 	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
-	cleanup(data, output);
+	cleanup(data);
 
 	return status;
 }
@@ -861,7 +840,6 @@ igt_main
 	data_t data = {};
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int i, j;
-	enum pipe pipe;
 	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int n_pipes = 0;
 
@@ -898,9 +876,9 @@ igt_main
 		igt_require_f(psr2_selective_fetch_check(data.debugfs_fd),
 			      "PSR2 selective fetch not enabled\n");
 
-		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
-			if (check_psr2_support(&data, pipe)) {
-				pipes[n_pipes] = pipe;
+		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
+			if (check_psr2_support(&data)) {
+				pipes[n_pipes] = data.pipe;
 				outputs[n_pipes] = data.output;
 				n_pipes++;
 			}
@@ -913,13 +891,14 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
 					data.damage_area_count = j;
 					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-					prepare(&data, outputs[i]);
+					prepare(&data);
 					run(&data);
-					cleanup(&data, outputs[i]);
+					cleanup(&data);
 				}
 			}
 		}
@@ -932,13 +911,14 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
 					data.damage_area_count = j;
 					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-					prepare(&data, outputs[i]);
+					prepare(&data);
 					run(&data);
-					cleanup(&data, outputs[i]);
+					cleanup(&data);
 				}
 			}
 		}
@@ -951,13 +931,14 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
 					data.damage_area_count = j;
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-					prepare(&data, outputs[i]);
+					prepare(&data);
 					run(&data);
-					cleanup(&data, outputs[i]);
+					cleanup(&data);
 				}
 			}
 		}
@@ -970,11 +951,12 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-				prepare(&data, outputs[i]);
+				prepare(&data);
 				run(&data);
-				cleanup(&data, outputs[i]);
+				cleanup(&data);
 			}
 		}
 	}
@@ -985,11 +967,12 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-				prepare(&data, outputs[i]);
+				prepare(&data);
 				run(&data);
-				cleanup(&data, outputs[i]);
+				cleanup(&data);
 			}
 		}
 	}
@@ -1000,11 +983,12 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-				prepare(&data, outputs[i]);
+				prepare(&data);
 				run(&data);
-				cleanup(&data, outputs[i]);
+				cleanup(&data);
 			}
 		}
 	}
@@ -1015,11 +999,12 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-				prepare(&data, outputs[i]);
+				prepare(&data);
 				run(&data);
-				cleanup(&data, outputs[i]);
+				cleanup(&data);
 			}
 		}
 	}
@@ -1032,13 +1017,14 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				for (j = POS_TOP_LEFT; j <= POS_BOTTOM_RIGHT ; j++) {
 					data.pos = j;
 					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-					prepare(&data, outputs[i]);
+					prepare(&data);
 					run(&data);
-					cleanup(&data, outputs[i]);
+					cleanup(&data);
 				}
 			}
 		}
@@ -1050,11 +1036,12 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-				prepare(&data, outputs[i]);
+				prepare(&data);
 				run(&data);
-				cleanup(&data, outputs[i]);
+				cleanup(&data);
 			}
 		}
 	}
@@ -1065,11 +1052,12 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-				prepare(&data, outputs[i]);
+				prepare(&data);
 				run(&data);
-				cleanup(&data, outputs[i]);
+				cleanup(&data);
 			}
 		}
 	}
@@ -1080,11 +1068,12 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-				prepare(&data, outputs[i]);
+				prepare(&data);
 				run(&data);
-				cleanup(&data, outputs[i]);
+				cleanup(&data);
 			}
 		}
 	}
@@ -1097,13 +1086,14 @@ igt_main
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
 					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
 					data.damage_area_count = j;
 					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-					prepare(&data, outputs[i]);
+					prepare(&data);
 					run(&data);
-					cleanup(&data, outputs[i]);
+					cleanup(&data);
 				}
 			}
 		}
@@ -1119,13 +1109,14 @@ igt_main
 	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
-					igt_output_name(outputs[i])) {
-				igt_output_set_pipe(outputs[i], pipes[i]);
+				      igt_output_name(outputs[i])) {
+				data.pipe = pipes[i];
+				data.output = outputs[i];
 				data.damage_area_count = 1;
 				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-				prepare(&data, outputs[i]);
+				prepare(&data);
 				run(&data);
-				cleanup(&data, outputs[i]);
+				cleanup(&data);
 			}
 		}
 	}
-- 
2.34.1
