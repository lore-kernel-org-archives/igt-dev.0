Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EEC10E5FB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 18:00:39 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/12] tests/kms_big_fb: Also test some CCS modifiers
Date: Wed, 20 Dec 2023 19:59:34 +0200
Message-ID: <20231220175934.22849-13-ville.syrjala@linux.intel.com>
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

Panning inside compressed framebuffers has similar challenges
as planar YCbCr framebuffers. So let's test this as well.
The difference is that i915 can't do GGTT remapping for CCS,
so we must limit the fb size to fit insie the hw limits.

Only enable this for the pre-TGL modifiers for now as testing
on TGL didn't go well. I suspect the problem lies with rendercopy
but until that is sorted let's not add tons of failures to CI.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index f8dd5a015ee1..f7551fe0e873 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -73,6 +73,8 @@
  * @x-tiled:            TILE-X modifier
  * @y-tiled:            TILE-Y modifier
  * @yf-tiled:           TILE-YF modifier
+ * @y-tiled-ccs:        TILE-Y+CCS modifier
+ * @yf-tiled-ccs:       TILE-YF+CCS modifier
  *
  * arg[2].values:       8bpp, 16bpp, 32bpp, 64bpp, nv12, p016
  * arg[3].values:       0, 90, 180, 270
@@ -110,6 +112,8 @@
  * @x-tiled:            TILE-X modifier
  * @y-tiled:            TILE-Y modifier
  * @yf-tiled:           TILE-YF modifier
+ * @y-tiled-ccs:        TILE-Y+CCS modifier
+ * @yf-tiled-ccs:       TILE-YF+CCS modifier
  *
  * arg[2].values:       32, 64
  * arg[3].values:       0, 180
@@ -134,6 +138,8 @@
  * @x-tiled:            TILE-X modifier
  * @y-tiled:            TILE-Y modifier
  * @yf-tiled:           TILE-YF modifier
+ * @y-tiled-ccs:        TILE-Y+CCS modifier
+ * @yf-tiled-ccs:       TILE-YF+CCS modifier
  *
  * arg[2].values:       32, 64
  * arg[3].values:       0, 180
@@ -171,6 +177,8 @@
  * @x-tiled:    TILE-X
  * @y-tiled:    TILE-Y
  * @yf-tiled:   TILE-YF
+ * @y-tiled-ccs:        TILE-Y+CCS modifier
+ * @yf-tiled-ccs:       TILE-YF+CCS modifier
  */
 
 IGT_TEST_DESCRIPTION("Test big framebuffers");
@@ -371,7 +379,11 @@ static void max_fb_size(data_t *data, int *width, int *height,
 	struct igt_fb fb;
 	int i = 0;
 
-	if (data->max_hw_stride_test) {
+	if (igt_fb_is_ccs_modifier(data->modifier)) {
+		/* FIXME figure out what's correct */
+		*width = 8192;
+		*height = 8192;
+	} else if (data->max_hw_stride_test) {
 		igt_output_t *output;
 
 		*width = data->max_hw_fb_width;
@@ -957,6 +969,9 @@ static bool has_async_flip(data_t *data)
 	 * TODO: preferably probe all this stuff with
 	 * TEST_ONLY rather than hardcoding it...
 	 */
+	if (igt_fb_is_ccs_modifier(data->modifier))
+		return false;
+
 	if (igt_format_is_yuv_semiplanar(data->format))
 		return false;
 
@@ -978,6 +993,8 @@ static const struct {
 	{ I915_FORMAT_MOD_Y_TILED, "y-tiled", },
 	{ I915_FORMAT_MOD_Yf_TILED, "yf-tiled", },
 	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
+	{ I915_FORMAT_MOD_Y_TILED_CCS, "y-tiled-ccs", },
+	{ I915_FORMAT_MOD_Yf_TILED_CCS, "yf-tiled-ccs", },
 };
 
 static const struct {
-- 
2.41.0
