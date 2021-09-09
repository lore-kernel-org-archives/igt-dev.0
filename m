Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44256E88E
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Sep 2021 15:31:11 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  9 Sep 2021 18:30:42 +0300
Message-Id: <20210909153047.16729-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
References: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 06/11] tests/kms_big_fb: Move batch
 creation into lower level functions
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

At some point the back creation from moved form the fixture
into each subtest, on account of something going bad between
subtests (not really sure what that was). But when the hw stride
tests were added they stuffed the batch back into the fixture,
and indeed I get a segfault when running this stuff. So let's move
all the batch stuff to the lowe level functions that actually need
it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_big_fb.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index 308227c9113a..9e98ed3f9edc 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -410,6 +410,8 @@ static bool test_pipe(data_t *data)
 				   IGT_CRTC_GAMMA_LUT))
 		return false;
 
+	data->ibb = intel_bb_create(data->drm_fd, 4096);
+
 	mode = igt_output_get_mode(data->output);
 
 	data->width = mode->hdisplay;
@@ -470,6 +472,8 @@ static bool test_pipe(data_t *data)
 
 	igt_remove_fb(data->drm_fd, &data->small_fb);
 
+	intel_bb_destroy(data->ibb);
+
 	return ret;
 }
 
@@ -492,6 +496,8 @@ max_hw_stride_async_flip_test(data_t *data)
 	igt_require_f(igt_display_try_commit2(&data->display, COMMIT_ATOMIC) == 0,
 		      "rotation/flip not supported\n");
 
+	data->ibb = intel_bb_create(data->drm_fd, 4096);
+
 	setup_fb(data, &data->big_fb, data->big_fb_width, data->big_fb_height,
 		 data->format, data->modifier, data->hw_stride);
 	generate_pattern(data, &data->big_fb, 640, 480);
@@ -559,6 +565,9 @@ max_hw_stride_async_flip_test(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->big_fb);
 	igt_remove_fb(data->drm_fd, &data->big_fb_flip[0]);
 	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
+
+	intel_bb_destroy(data->ibb);
+
 	return true;
 }
 
@@ -841,7 +850,6 @@ igt_main
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
 		data.bops = buf_ops_create(data.drm_fd);
-		data.ibb = intel_bb_create(data.drm_fd, 4096);
 
 		data.planeclearrgb[0] = 0.0;
 		data.planeclearrgb[1] = 0.0;
@@ -862,9 +870,7 @@ igt_main
 		igt_subtest_f("%s-addfb-size-overflow",
 			      modifiers[i].name) {
 			data.modifier = modifiers[i].modifier;
-			data.ibb = intel_bb_create(data.drm_fd, 4096);
 			test_size_overflow(&data);
-			intel_bb_destroy(data.ibb);
 		}
 	}
 
@@ -873,9 +879,7 @@ igt_main
 		igt_subtest_f("%s-addfb-size-offset-overflow",
 			      modifiers[i].name) {
 			data.modifier = modifiers[i].modifier;
-			data.ibb = intel_bb_create(data.drm_fd, 4096);
 			test_size_offset_overflow(&data);
-			intel_bb_destroy(data.ibb);
 		}
 	}
 
@@ -883,9 +887,7 @@ igt_main
 	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 		igt_subtest_f("%s-addfb", modifiers[i].name) {
 			data.modifier = modifiers[i].modifier;
-			data.ibb = intel_bb_create(data.drm_fd, 4096);
 			test_addfb(&data);
-			intel_bb_destroy(data.ibb);
 		}
 	}
 
@@ -905,9 +907,7 @@ igt_main
 					igt_require(data.format == DRM_FORMAT_C8 ||
 						    igt_fb_supported_format(data.format));
 					igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
-					data.ibb = intel_bb_create(data.drm_fd, 4096);
 					test_scanout(&data);
-					intel_bb_destroy(data.ibb);
 				}
 			}
 
-- 
2.31.1
