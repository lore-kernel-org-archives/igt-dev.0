Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F496E82A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jul 2021 15:08:09 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Tue, 27 Jul 2021 20:27:14 +0530
Message-Id: <20210727145714.27046-1-vidya.srinivas@intel.com>
In-Reply-To: <20210723093844.22352-1-vidya.srinivas@intel.com>
References: <20210723093844.22352-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Fix hw stride length tests
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
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com, Lin Charlton <lin.charlton@intel.com>, juha-pekka.heikkila@intel.com, charlton.Lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

We see the HW stride length tests are crashing
when run in sequence. Individually, they PASS.
This is happening due to missing data.ibb creation
before the test_scanout. Patch fixes the same.
Patch also fixes CRC failures seen.

Signed-off-by: Lin Charlton <lin.charlton@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_big_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index c6f374bdd073..89934ad3b5aa 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -462,6 +462,7 @@ static bool test_pipe(data_t *data)
 	igt_display_commit2(&data->display, data->display.is_atomic ?
 			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
+	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 
@@ -474,8 +475,6 @@ static bool test_pipe(data_t *data)
 	if (data->format == DRM_FORMAT_C8)
 		unset_lut(data);
 
-	igt_pipe_crc_free(data->pipe_crc);
-
 	igt_output_set_pipe(data->output, PIPE_ANY);
 
 	igt_remove_fb(data->drm_fd, &data->small_fb);
@@ -519,6 +518,7 @@ max_hw_stride_async_flip_test(data_t *data)
 		 data->hw_stride);
 	generate_pattern(data, &data->big_fb_flip[1], 640, 480);
 
+	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_start(data->pipe_crc);
@@ -564,7 +564,7 @@ max_hw_stride_async_flip_test(data_t *data)
 	}
 	igt_reset_timeout();
 
-	igt_pipe_crc_free(data->pipe_crc);
+	igt_pipe_crc_stop(data->pipe_crc);
 	igt_output_set_pipe(data->output, PIPE_NONE);
 	igt_remove_fb(data->drm_fd, &data->big_fb);
 	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
@@ -852,7 +852,6 @@ igt_main
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
 		data.bops = buf_ops_create(data.drm_fd);
-		data.ibb = intel_bb_create(data.drm_fd, 4096);
 
 		data.planeclearrgb[0] = 0.0;
 		data.planeclearrgb[1] = 0.0;
@@ -978,7 +977,9 @@ igt_main
 						igt_require(data.format == DRM_FORMAT_C8 ||
 							igt_fb_supported_format(data.format));
 						igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
+						data.ibb = intel_bb_create(data.drm_fd, 4096);
 						test_scanout(&data);
+						intel_bb_destroy(data.ibb);
 					}
 
 					// async flip doesn't support linear fbs.
@@ -994,7 +995,9 @@ igt_main
 							igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
 							igt_require_f(data.async_flip_support, "Async Flip is not supported\n");
 							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
+							data.ibb = intel_bb_create(data.drm_fd, 4096);
 							test_scanout(&data);
+							intel_bb_destroy(data.ibb);
 					}
 					data.async_flip_test = false;
 				}
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
