Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9CE10E5FE
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 18:00:27 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/12] tests/kms_big_fb: Determine the max fb size the
 same way always
Date: Wed, 20 Dec 2023 19:59:28 +0200
Message-ID: <20231220175934.22849-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
References: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently the scanout tests and the addfb test may determine
the max framebuffer size differently. That may be OK for now,
but I have plans to extend the test to cover compressed formats
as well, and those can't generally use the reported max fb size.
So reuse the same piece of code to always determine the max fb
size (to which I can add compressed formats checks later).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 41 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 75b0c4758743..f758155d9bdd 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -337,7 +337,6 @@ static bool size_ok(data_t *data, uint64_t size)
 	return true;
 }
 
-
 static void max_fb_size(data_t *data, int *width, int *height,
 			uint32_t format, uint64_t modifier)
 {
@@ -345,6 +344,21 @@ static void max_fb_size(data_t *data, int *width, int *height,
 	uint64_t size;
 	int i = 0;
 
+	if (data->max_hw_stride_test) {
+		igt_output_t *output;
+
+		*width = data->max_hw_fb_width;
+		*height = 0;
+
+		for_each_connected_output(&data->display, output) {
+			if (*height < output->config.default_mode.vdisplay * 2)
+				*height = output->config.default_mode.vdisplay * 2;
+		}
+	} else {
+		*width = data->max_fb_width;
+		*height = data->max_fb_height;
+	}
+
 	/* max fence stride is only 8k bytes on gen3 */
 	if (intel_display_ver(data->devid) < 4 &&
 	    format == DRM_FORMAT_XRGB8888)
@@ -690,26 +704,11 @@ max_hw_stride_async_flip_test(data_t *data)
 
 static void test_scanout(data_t *data)
 {
-	igt_output_t *output;
-
 	igt_require(data->format == DRM_FORMAT_C8 ||
 		    igt_fb_supported_format(data->format));
 
 	igt_require(igt_display_has_format_mod(&data->display, data->format, data->modifier));
 
-	if (data->max_hw_stride_test) {
-		data->big_fb_width = data->max_hw_fb_width;
-		data->big_fb_height = 0;
-
-		for_each_connected_output(&data->display, output) {
-			if (data->big_fb_height < output->config.default_mode.vdisplay * 2)
-				data->big_fb_height = output->config.default_mode.vdisplay * 2;
-		}
-	} else {
-		data->big_fb_width = data->max_fb_width;
-		data->big_fb_height = data->max_fb_height;
-	}
-
 	max_fb_size(data, &data->big_fb_width, &data->big_fb_height,
 		    data->format, data->modifier);
 
@@ -844,6 +843,7 @@ test_addfb(data_t *data)
 	uint32_t offsets[4] = {};
 	uint32_t strides[4] = {};
 	uint32_t format;
+	int width, height;
 	int ret;
 
 	/*
@@ -859,9 +859,9 @@ test_addfb(data_t *data)
 	igt_require(igt_display_has_format_mod(&data->display,
 					       format, data->modifier));
 
-	igt_calc_fb_size(data->drm_fd,
-			 data->max_fb_width,
-			 data->max_fb_height,
+	max_fb_size(data, &width, &height, format, data->modifier);
+
+	igt_calc_fb_size(data->drm_fd, width, height,
 			 format, data->modifier,
 			 &size, &strides[0]);
 
@@ -878,8 +878,7 @@ test_addfb(data_t *data)
 			       igt_fb_mod_to_tiling(data->modifier), strides[0]);
 
 	ret = __kms_addfb(data->drm_fd, bo,
-			  data->max_fb_width,
-			  data->max_fb_height,
+			  width, height,
 			  format, data->modifier,
 			  strides, offsets, 1,
 			  DRM_MODE_FB_MODIFIERS, &fb_id);
-- 
2.41.0
