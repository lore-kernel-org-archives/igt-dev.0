Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BCE6EC41
 for <igt-dev@lists.freedesktop.org>; Tue, 18 May 2021 17:01:19 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Tue, 18 May 2021 22:32:19 +0530
Message-Id: <20210518170219.25146-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_tiling: Fix clean up when
 subtest fails
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
Cc: kunal1.joshi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

If a subtest fails during commit for some reason on the first connector,
all the subsequent subtests on the same pipe fails.
This is because the pipe is still connected to the previous connector
as the cleanup part will have been skipped during the failed subtest.

To fix this, moved the cleanup part to a separate function and calling it
outside the subtest scope.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip_tiling.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
index 09e99580..36f69ffd 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -39,6 +39,7 @@ typedef struct {
 	igt_display_t display;
 	int gen;
 	uint32_t testformat;
+	struct igt_fb fb[2];
 } data_t;
 
 static igt_pipe_crc_t *_pipe_crc;
@@ -69,7 +70,6 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
-	struct igt_fb fb[2];
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t reference_crc, crc;
 	int fb_id, ret, width;
@@ -105,27 +105,27 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 
 	fb_id = igt_create_pattern_fb(data->drm_fd, width, mode->vdisplay,
 				      data->testformat, tiling[0],
-				      &fb[0]);
+				      &data->fb[0]);
 	igt_assert(fb_id);
 
 	/* Second fb has different background so CRC does not match. */
 	fb_id = igt_create_color_pattern_fb(data->drm_fd, width, mode->vdisplay,
 				      data->testformat, tiling[1],
-				      0.5, 0.5, 0.5, &fb[1]);
+				      0.5, 0.5, 0.5, &data->fb[1]);
 	igt_assert(fb_id);
 
 	/* Set the crtc and generate a reference CRC. */
-	igt_plane_set_fb(primary, &fb[1]);
+	igt_plane_set_fb(primary, &data->fb[1]);
 	igt_display_commit(&data->display);
 	igt_pipe_crc_collect_crc(pipe_crc, &reference_crc);
 
 	/* Commit the first fb. */
-	igt_plane_set_fb(primary, &fb[0]);
+	igt_plane_set_fb(primary, &data->fb[0]);
 	igt_display_commit(&data->display);
 
 	/* Flip to the second fb. */
 	ret = drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
-			      fb[1].fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			      data->fb[1].fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 	/*
 	 * Page flip should work but some transitions may be temporarily
 	 * on some kernels.
@@ -137,6 +137,12 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 	/* Get a crc and compare with the reference. */
 	igt_pipe_crc_collect_crc(pipe_crc, &crc);
 	igt_assert_crc_equal(&reference_crc, &crc);
+}
+
+static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
+{
+	igt_plane_t *primary;
+	primary = igt_output_get_plane(output, 0);
 
 	/* Clean up. */
 	igt_plane_set_fb(primary, NULL);
@@ -144,8 +150,8 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 	igt_output_set_pipe(output, PIPE_ANY);
 	igt_display_commit(&data->display);
 
-	igt_remove_fb(data->drm_fd, &fb[0]);
-	igt_remove_fb(data->drm_fd, &fb[1]);
+	igt_remove_fb(data->drm_fd, &data->fb[0]);
+	igt_remove_fb(data->drm_fd, &data->fb[1]);
 }
 
 static data_t data;
@@ -185,6 +191,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
@@ -204,6 +211,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
@@ -223,6 +231,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
@@ -246,6 +255,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
@@ -265,6 +275,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
@@ -284,6 +295,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
@@ -307,6 +319,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
@@ -326,6 +339,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
@@ -345,6 +359,7 @@ igt_main
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_flip_tiling(&data, pipe, output, tiling);
+				test_cleanup(&data, pipe, output);
 		}
 	}
 
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
