Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315BC6F404
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jul 2021 09:27:43 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Fri, 30 Jul 2021 14:47:06 +0530
Message-Id: <20210730091706.5942-1-vidya.srinivas@intel.com>
In-Reply-To: <20210727185445.11804-1-vidya.srinivas@intel.com>
References: <20210727185445.11804-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Fix crash in hw stride
 length tests
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
Cc: Charlton Lin <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

We see the HW stride length tests are crashing or
FAILING on 5.4 kernel. Individually, they PASS.
On Gen11, they CRASH mostly.
This is happening due to missing data.ibb creation
before the test_scanout. Patch fixes the same.
Patch also fixes a missing crc stop in max_hw_stride_async_flip_test

Signed-off-by: Charlton Lin <charlton.lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_big_fb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index c6f374bdd073..d9250259020e 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -563,6 +563,7 @@ max_hw_stride_async_flip_test(data_t *data)
 			     i?"should":"shouldn't");
 	}
 	igt_reset_timeout();
+	igt_pipe_crc_stop(data->pipe_crc);
 
 	igt_pipe_crc_free(data->pipe_crc);
 	igt_output_set_pipe(data->output, PIPE_NONE);
@@ -852,7 +853,6 @@ igt_main
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
 		data.bops = buf_ops_create(data.drm_fd);
-		data.ibb = intel_bb_create(data.drm_fd, 4096);
 
 		data.planeclearrgb[0] = 0.0;
 		data.planeclearrgb[1] = 0.0;
@@ -978,7 +978,9 @@ igt_main
 						igt_require(data.format == DRM_FORMAT_C8 ||
 							igt_fb_supported_format(data.format));
 						igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
+						data.ibb = intel_bb_create(data.drm_fd, 4096);
 						test_scanout(&data);
+						intel_bb_destroy(data.ibb);
 					}
 
 					// async flip doesn't support linear fbs.
@@ -994,7 +996,9 @@ igt_main
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
