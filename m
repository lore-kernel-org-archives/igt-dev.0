Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14210E1E4
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 04/15] tests/kms_big_fb: Fix async
Date: Fri, 22 Dec 2023 16:31:48 +0200
Message-ID: <20231222143159.24662-5-ville.syrjala@linux.intel.com>
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

The 'continue' statement causes us to skip test_cleanup()
which means the next iteration of the loop will not re-create
the fb, instead attempting to use the previous fb which has
the wrong format. The result is that things blow up. Skip
the async flip test using igt_require() instead which will let
the cleanup fixture do its job.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index eef8148d2ba3..6393504be7d7 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -75,6 +75,12 @@
  *              and %arg[2]-rotation
  * Functionality: big_fbs, kms_gem_interop, rotation
  *
+ * SUBTEST: linear-max-hw-stride-%dbpp-rotate-%d-async-flip
+ * Description: Test maximum hardware supported stride length for given combination
+ *              of linear modifier with max hardware stride length, %arg[1]-bpp,
+ *              and %arg[2]-rotation
+ * Functionality: async_flips, big_fbs, kms_gem_interop, rotation
+ *
  * arg[1].values:       32, 64
  * arg[2].values:       0, 180
  */
@@ -918,6 +924,18 @@ static void test_cleanup(data_t *data)
 	data->output = NULL;
 }
 
+static bool has_async_flip(data_t *data)
+{
+	/*
+	 * TODO: preferably probe all this stuff with
+	 * TEST_ONLY rather than hardcoding it...
+	 */
+	if (data->modifier == DRM_FORMAT_MOD_LINEAR)
+		return false;
+
+	return igt_has_drm_cap(data->drm_fd, DRM_CAP_ASYNC_PAGE_FLIP);
+}
+
 static data_t data = {};
 
 static const struct {
@@ -1108,17 +1126,14 @@ igt_main
 						test_scanout(&data);
 					}
 
-					// async flip doesn't support linear fbs.
-					if (modifiers[i].modifier == DRM_FORMAT_MOD_LINEAR)
-						continue;
-
 					data.async_flip_test = true;
 					igt_describe("test async flip on maximum hardware supported stride length for given bpp and modifiers.");
-					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s-async-flip", modifiers[i].name,
-						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
-							igt_require(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP));
-							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
-							test_scanout(&data);
+					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s-async-flip",
+						      modifiers[i].name, formats[j].bpp,
+						      rotations[k].angle, fliptab[l].flipname) {
+						igt_require(has_async_flip(&data));
+						data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
+						test_scanout(&data);
 					}
 					data.async_flip_test = false;
 
-- 
2.41.0
