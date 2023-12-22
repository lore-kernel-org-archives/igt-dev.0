Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA9910E7CD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:33 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 10/15] tests/kms_big_fb: Replace 'bpp' with 'name'
Date: Fri, 22 Dec 2023 16:31:54 +0200
Message-ID: <20231222143159.24662-11-ville.syrjala@linux.intel.com>
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

Instead of storing the bpp in the formats[] array let's instead
store a string represtantion. I want to add planar YCbCr tests
to the mix, and so a simple bpp value will no logner cut it.

A bunch of stuff is using the numerical bpp value for some things,
but we can replace those with igt_drm_format_to_bpp().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 1e6e01500be5..2b6fadeaa7a6 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -963,12 +963,12 @@ static const struct {
 
 static const struct {
 	uint32_t format;
-	uint8_t bpp;
+	const char *name;
 } formats[] = {
-	{ DRM_FORMAT_C8, 8, },
-	{ DRM_FORMAT_RGB565, 16, },
-	{ DRM_FORMAT_XRGB8888, 32, },
-	{ DRM_FORMAT_XBGR16161616F, 64, },
+	{ DRM_FORMAT_C8, "8bpp", },
+	{ DRM_FORMAT_RGB565, "16bpp", },
+	{ DRM_FORMAT_XRGB8888, "32bpp", },
+	{ DRM_FORMAT_XBGR16161616F, "64bpp", },
 };
 
 static const igt_rotation_t rotations[] = {
@@ -1091,8 +1091,8 @@ igt_main
 				igt_describe("Sanity check if scanout of big framebuffers works "
 					     "correctly for given combination of modifier formats "
 					     "and rotation");
-				igt_subtest_f("%s-%dbpp-rotate-%s%s", modifiers[i].name,
-					      formats[j].bpp,
+				igt_subtest_f("%s-%s-rotate-%s%s", modifiers[i].name,
+					      formats[j].name,
 					      igt_plane_rotation_name(data.rotation),
 					      rotation_flip_str(data.rotation))
 					test_scanout(&data);
@@ -1111,13 +1111,15 @@ igt_main
 		set_max_hw_stride(&data);
 
 		for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+			int bpp = igt_drm_format_to_bpp(formats[j].format);
+
 			/*
 			 * try only those formats which can show full length.
 			 * Here 32K is used to have CI test results consistent
 			 * for all platforms, 32K is smallest number possbily
 			 * coming to data.hw_stride from above set_max_hw_stride()
 			 */
-			if (32768 / (formats[j].bpp >> 3) > 8192)
+			if (32768 / (bpp >> 3) > 8192)
 				continue;
 
 			data.format = formats[j].format;
@@ -1132,23 +1134,23 @@ igt_main
 					continue;
 
 				igt_describe("test maximum hardware supported stride length for given bpp and modifiers.");
-				igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%s%s",
-					      modifiers[i].name, formats[j].bpp,
+				igt_subtest_f("%s-max-hw-stride-%s-rotate-%s%s",
+					      modifiers[i].name, formats[j].name,
 					      igt_plane_rotation_name(data.rotation),
 					      rotation_flip_str(data.rotation)) {
 					igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 5);
-					data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
+					data.max_hw_fb_width = min(data.hw_stride / (bpp >> 3), data.max_fb_width);
 					test_scanout(&data);
 				}
 
 				data.async_flip_test = true;
 				igt_describe("test async flip on maximum hardware supported stride length for given bpp and modifiers.");
-				igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%s%s-async-flip",
-					      modifiers[i].name, formats[j].bpp,
+				igt_subtest_f("%s-max-hw-stride-%s-rotate-%s%s-async-flip",
+					      modifiers[i].name, formats[j].name,
 					      igt_plane_rotation_name(data.rotation),
 					      rotation_flip_str(data.rotation)) {
 					igt_require(has_async_flip(&data));
-					data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
+					data.max_hw_fb_width = min(data.hw_stride / (bpp >> 3), data.max_fb_width);
 					test_scanout(&data);
 				}
 				data.async_flip_test = false;
-- 
2.41.0
