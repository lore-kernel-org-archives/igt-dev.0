Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759CC6E3C6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 06:42:09 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Tue, 23 Mar 2021 11:46:38 +0530
Message-Id: <20210323061639.26460-2-karthik.b.s@intel.com>
In-Reply-To: <20210323061639.26460-1-karthik.b.s@intel.com>
References: <20210323061639.26460-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_atomic_transition: Fix clean
 up when subtest fails
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
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

While running transition tests on a multi display setup,
if a subtest fails during commit for some reason on the first connector,
all the subsequent subtests on the same pipe fails.
This is because the pipe is still connected to the previous connector
as the cleanup part will have been skipped during the failed subtest.

To fix this, moved the cleanup part to a separate function and calling it
outside the subtest scope.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_atomic_transition.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 9689bf4d..90df7e33 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -47,6 +47,7 @@ struct plane_parms {
 
 typedef struct {
 	int drm_fd;
+	struct igt_fb fb, argb_fb, sprite_fb;
 	igt_display_t display;
 	bool extended;
 } data_t;
@@ -420,6 +421,10 @@ static void unprepare_fencing(data_t *data, enum pipe pipe)
 {
 	igt_plane_t *plane;
 
+	/* Make sure these got allocated in the first place */
+	if (!timeline)
+		return;
+
 	for_each_plane_on_pipe(&data->display, pipe, plane)
 		close(timeline[plane->index]);
 
@@ -476,7 +481,6 @@ static void
 run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		enum transition_type type, bool nonblocking, bool fencing)
 {
-	struct igt_fb fb, argb_fb, sprite_fb;
 	drmModeModeInfo *mode, override_mode;
 	igt_plane_t *plane;
 	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
@@ -502,7 +506,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	override_mode.flags ^= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC;
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -518,7 +522,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	setup_parms(data, pipe, mode, &fb, &argb_fb, &sprite_fb, parms, &iter_max);
+	setup_parms(data, pipe, mode, &data->fb, &data->argb_fb, &data->sprite_fb, parms, &iter_max);
 
 	/*
 	 * In some configurations the tests may not run to completion with all
@@ -583,7 +587,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 			igt_assert(fd_completed(data->drm_fd));
 			wait_for_transition(data, pipe, false, fencing);
 		}
-		goto cleanup;
+		return;
 	}
 
 	for (i = 0; i < iter_max; i++) {
@@ -642,8 +646,12 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 			}
 		}
 	}
+}
+
+static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output, bool fencing)
+{
+	igt_plane_t *plane;
 
-cleanup:
 	if (fencing)
 		unprepare_fencing(data, pipe);
 
@@ -654,9 +662,9 @@ cleanup:
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_remove_fb(data->drm_fd, &fb);
-	igt_remove_fb(data->drm_fd, &argb_fb);
-	igt_remove_fb(data->drm_fd, &sprite_fb);
+	igt_remove_fb(data->drm_fd, &data->fb);
+	igt_remove_fb(data->drm_fd, &data->argb_fb);
+	igt_remove_fb(data->drm_fd, &data->sprite_fb);
 }
 
 static void commit_display(data_t *data, unsigned event_mask, bool nonblocking)
@@ -1011,6 +1019,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			pipe_count++;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, false);
+			test_cleanup(&data, pipe, output, false);
 		}
 	}
 
@@ -1022,6 +1031,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			pipe_count++;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, true);
+			test_cleanup(&data, pipe, output, true);
 		}
 	}
 
@@ -1033,6 +1043,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			pipe_count++;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, false);
+			test_cleanup(&data, pipe, output, false);
 		}
 	}
 
@@ -1044,6 +1055,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			pipe_count++;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, true);
+			test_cleanup(&data, pipe, output, true);
 		}
 	}
 
@@ -1056,6 +1068,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			pipe_count++;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, false);
+			test_cleanup(&data, pipe, output, false);
 		}
 	}
 
@@ -1068,6 +1081,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			pipe_count++;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, true);
+			test_cleanup(&data, pipe, output, true);
 		}
 	}
 
@@ -1087,6 +1101,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, false);
+			test_cleanup(&data, pipe, output, false);
 		}
 
 	igt_describe("Modeset test for all plane combinations with fencing commit");
@@ -1100,6 +1115,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, true);
+			test_cleanup(&data, pipe, output, true);
 		}
 
 	igt_describe("Modeset test for all plane combinations on internal panels");
@@ -1113,6 +1129,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, false);
+			test_cleanup(&data, pipe, output, false);
 		}
 	}
 
@@ -1127,6 +1144,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, true);
+			test_cleanup(&data, pipe, output, true);
 		}
 	}
 
@@ -1137,6 +1155,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				break;
 			pipe_count++;
 			run_transition_test(&data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
+			test_cleanup(&data, pipe, output, false);
 		}
 
 	igt_describe("Modeset transition tests for combinations of crtc enabled");
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
