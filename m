Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDD310E7C2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:31 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 09/15] tests/kms_big_fb: Nuke fliptab[]
Date: Fri, 22 Dec 2023 16:31:53 +0200
Message-ID: <20231222143159.24662-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
References: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
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

Let's just stuff the full transformation into rotations[]
and get rid of fliptab[] and yet another nested loop.

This also extends the hflip tests to be done universally
(as opposed to just in combination with the max-hw-stride
tests).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 135 ++++++++++++++++++++++-----------------
 1 file changed, 75 insertions(+), 60 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index d219b466ec30..1e6e01500be5 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -47,6 +47,11 @@
  *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
  * Functionality: big_fbs, kms_gem_interop, rotation
  *
+ * SUBTEST: linear-%dbpp-rotate-%d-hflip
+ * Description: Sanity check if addfb ioctl works correctly for given combination
+ *              of Linear modifier with %arg[1]-bpp & %arg[2]-rotation
+ * Functionality: big_fbs, kms_gem_interop, rotation
+ *
  * arg[1].values:       8, 16, 32, 64
  * arg[2].values:       0, 90, 180, 270
  */
@@ -57,6 +62,11 @@
  *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
  * Functionality: big_fbs, kms_gem_interop, rotation, tiling
  *
+ * SUBTEST: %s-%dbpp-rotate-%d-hflip
+ * Description: Sanity check if addfb ioctl works correctly for given combination
+ *              of %arg[1] with %arg[2]-bpp & %arg[3]-rotation
+ * Functionality: big_fbs, kms_gem_interop, rotation, tiling
+*
  * arg[1]:
  *
  * @4-tiled:            TILE-4 modifier
@@ -66,6 +76,8 @@
  *
  * arg[2].values:       8, 16, 32, 64
  * arg[3].values:       0, 90, 180, 270
+ *
+ * arg[4]:
  */
 
 /**
@@ -959,23 +971,22 @@ static const struct {
 	{ DRM_FORMAT_XBGR16161616F, 64, },
 };
 
-static const struct {
-	igt_rotation_t rotation;
-	uint16_t angle;
-} rotations[] = {
-	{ IGT_ROTATION_0, 0, },
-	{ IGT_ROTATION_90, 90, },
-	{ IGT_ROTATION_180, 180, },
-	{ IGT_ROTATION_270, 270, },
+static const igt_rotation_t rotations[] = {
+	 IGT_ROTATION_0,
+	 IGT_ROTATION_90,
+	 IGT_ROTATION_180,
+	 IGT_ROTATION_270,
+	 IGT_ROTATION_0 | IGT_REFLECT_X,
+	 IGT_ROTATION_90 | IGT_REFLECT_X,
+	 IGT_ROTATION_180 | IGT_REFLECT_X,
+	 IGT_ROTATION_270 | IGT_REFLECT_X,
 };
 
-static const struct {
-	igt_rotation_t flip;
-	const char *flipname;
-} fliptab[] = {
-	{ 0, "" },
-	{ IGT_REFLECT_X, "-hflip" },
-};
+static const char *rotation_flip_str(igt_rotation_t rotation)
+{
+	return rotation & IGT_REFLECT_X ? "-hflip" : "";
+}
+
 igt_main
 {
 	igt_fixture {
@@ -1075,12 +1086,15 @@ igt_main
 			data.format = formats[j].format;
 
 			for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
-				data.rotation = rotations[k].rotation;
+				data.rotation = rotations[k];
 
-				igt_describe("Sanity check if addfb ioctl works correctly for given "
-						"combination of modifier formats and rotation");
-				igt_subtest_f("%s-%dbpp-rotate-%d", modifiers[i].name,
-					      formats[j].bpp, rotations[k].angle)
+				igt_describe("Sanity check if scanout of big framebuffers works "
+					     "correctly for given combination of modifier formats "
+					     "and rotation");
+				igt_subtest_f("%s-%dbpp-rotate-%s%s", modifiers[i].name,
+					      formats[j].bpp,
+					      igt_plane_rotation_name(data.rotation),
+					      rotation_flip_str(data.rotation))
 					test_scanout(&data);
 			}
 
@@ -1096,50 +1110,51 @@ igt_main
 
 		set_max_hw_stride(&data);
 
-		for (int l = 0; l < ARRAY_SIZE(fliptab); l++) {
-			for (int j = 0; j < ARRAY_SIZE(formats); j++) {
-				/*
-				* try only those formats which can show full length.
-				* Here 32K is used to have CI test results consistent
-				* for all platforms, 32K is smallest number possbily
-				* coming to data.hw_stride from above set_max_hw_stride()
-				*/
-				if (32768 / (formats[j].bpp >> 3) > 8192)
+		for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+			/*
+			 * try only those formats which can show full length.
+			 * Here 32K is used to have CI test results consistent
+			 * for all platforms, 32K is smallest number possbily
+			 * coming to data.hw_stride from above set_max_hw_stride()
+			 */
+			if (32768 / (formats[j].bpp >> 3) > 8192)
+				continue;
+
+			data.format = formats[j].format;
+
+			for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
+				data.rotation = rotations[k];
+
+				// this combination will never happen.
+				if (igt_rotation_90_or_270(data.rotation) ||
+				    (data.rotation & IGT_REFLECT_X &&
+				     modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR))
 					continue;
 
-				data.format = formats[j].format;
-
-				for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
-					data.rotation = rotations[k].rotation | fliptab[l].flip;
-
-					// this combination will never happen.
-					if (igt_rotation_90_or_270(data.rotation) ||
-					    (fliptab[l].flip == IGT_REFLECT_X && modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR))
-						continue;
-
-					igt_describe("test maximum hardware supported stride length for given bpp and modifiers.");
-					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s", modifiers[i].name,
-						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
-						igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 5);
-						data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
-
-						test_scanout(&data);
-					}
-
-					data.async_flip_test = true;
-					igt_describe("test async flip on maximum hardware supported stride length for given bpp and modifiers.");
-					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s-async-flip",
-						      modifiers[i].name, formats[j].bpp,
-						      rotations[k].angle, fliptab[l].flipname) {
-						igt_require(has_async_flip(&data));
-						data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
-						test_scanout(&data);
-					}
-					data.async_flip_test = false;
+				igt_describe("test maximum hardware supported stride length for given bpp and modifiers.");
+				igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%s%s",
+					      modifiers[i].name, formats[j].bpp,
+					      igt_plane_rotation_name(data.rotation),
+					      rotation_flip_str(data.rotation)) {
+					igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 5);
+					data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
+					test_scanout(&data);
+				}
 
-					igt_fixture
-						test_cleanup(&data);
+				data.async_flip_test = true;
+				igt_describe("test async flip on maximum hardware supported stride length for given bpp and modifiers.");
+				igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%s%s-async-flip",
+					      modifiers[i].name, formats[j].bpp,
+					      igt_plane_rotation_name(data.rotation),
+					      rotation_flip_str(data.rotation)) {
+					igt_require(has_async_flip(&data));
+					data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
+					test_scanout(&data);
 				}
+				data.async_flip_test = false;
+
+				igt_fixture
+					test_cleanup(&data);
 			}
 		}
 	}
-- 
2.41.0
