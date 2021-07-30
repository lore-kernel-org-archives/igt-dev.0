Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB196F428
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jul 2021 12:55:13 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Fri, 30 Jul 2021 18:14:36 +0530
Message-Id: <20210730124436.25249-1-vidya.srinivas@intel.com>
In-Reply-To: <20210730091706.5942-1-vidya.srinivas@intel.com>
References: <20210730091706.5942-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Fix hw stride/async
 subtests for 5.4 kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: charlton.Lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 5.4 kernel, hw stride and async flip tests are giving
CRASH on JSL (Gen11) and FAIL on TGL (Gen12).
Patch fixes the missing data.ibb creation
before the test_scanout.

Patch also fixes a missing crc stop
in max_hw_stride_async_flip_test.

As per kernel i9xx_plane_max_stride, if I915_FORMAT_MOD_X_TILED
stride should be 16*1024 and for other modifiers 32*1024.
So changing 32K to 16K set_max_hw_stride for Gen < 12.
Changing Gen12 stride to 128K to avoid failures on 5.4 kernel.

Signed-off-by: Charlton Lin <charlton.Lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_big_fb.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index c6f374bdd073..23deeaacd575 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -563,6 +563,7 @@ max_hw_stride_async_flip_test(data_t *data)
 			     i?"should":"shouldn't");
 	}
 	igt_reset_timeout();
+	igt_pipe_crc_stop(data->pipe_crc);
 
 	igt_pipe_crc_free(data->pipe_crc);
 	igt_output_set_pipe(data->output, PIPE_NONE);
@@ -754,16 +755,15 @@ test_addfb(data_t *data)
 static void
 set_max_hw_stride(data_t *data)
 {
-	if (intel_display_ver(data->devid) >= 13) {
+	if (intel_display_ver(data->devid) >= 12) {
 		/*
 		 * The stride in bytes must not exceed of the size
 		 * of 128K bytes. For pixel formats of 64bpp will allow
 		 * for a 16K pixel surface.
 		 */
 		data->hw_stride = 131072;
-	} else {
-		data->hw_stride = 32768;
-	}
+	} else
+		data->hw_stride = 16384;
 }
 
 static data_t data = {};
@@ -852,7 +852,6 @@ igt_main
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
 		data.bops = buf_ops_create(data.drm_fd);
-		data.ibb = intel_bb_create(data.drm_fd, 4096);
 
 		data.planeclearrgb[0] = 0.0;
 		data.planeclearrgb[1] = 0.0;
@@ -939,13 +938,19 @@ igt_main
 
 		for (int l = 0; l < ARRAY_SIZE(fliptab); l++) {
 			for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+				int min;
 				/*
 				* try only those formats which can show full length.
-				* Here 32K is used to have CI test results consistent
-				* for all platforms, 32K is smallest number possbily
+				* Here 16K is used to have CI test results consistent
+				* for all platforms, 16K is smallest number possbily
 				* coming to data.hw_stride from above set_max_hw_stride()
 				*/
-				if (32768 / (formats[j].bpp >> 3) > 8192)
+				if (intel_display_ver(data.devid) >= 12)
+					min = 32768;
+				else
+					min = 16384;
+
+				if (min / (formats[j].bpp >> 3) > 8192)
 					continue;
 
 				data.format = formats[j].format;
@@ -978,7 +983,9 @@ igt_main
 						igt_require(data.format == DRM_FORMAT_C8 ||
 							igt_fb_supported_format(data.format));
 						igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
+						data.ibb = intel_bb_create(data.drm_fd, 4096);
 						test_scanout(&data);
+						intel_bb_destroy(data.ibb);
 					}
 
 					// async flip doesn't support linear fbs.
@@ -994,7 +1001,9 @@ igt_main
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
