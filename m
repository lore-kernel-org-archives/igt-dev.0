Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F806F616
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 18:16:16 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 29 Jan 2020 20:15:57 +0200
Message-Id: <20200129181601.15918-5-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-1-imre.deak@intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/9] lib/igt_fb: Add 64bpp support to the
 XY_SRC blit command
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
List-ID: <igt-dev@lists.freedesktop.org>

While the XY_SRC blit command lacks native 64bpp copy support, we can
emulate it using a 32bpp copy by treating the 64bpp plane as a 2x wide
32bpp plane. Add support for this, as we need the XY_SRC command at
least for GEN12+ X-tiled formats.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c            | 30 ++++++++++++++++++++++++------
 lib/intel_batchbuffer.c |  5 +++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 53b43528..fa294a38 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1957,9 +1957,31 @@ struct fb_blit_upload {
 	struct intel_batchbuffer *batch;
 };
 
+static bool fast_blit_ok(const struct igt_fb *fb)
+{
+	int gen = intel_gen(intel_get_drm_devid(fb->fd));
+
+	if (gen < 9)
+		return false;
+
+	if (gen < 12)
+		return true;
+
+	return fb->modifier != I915_FORMAT_MOD_X_TILED;
+}
+
 static bool blitter_ok(const struct igt_fb *fb)
 {
 	for (int i = 0; i < fb->num_planes; i++) {
+		int width = fb->plane_width[i];
+
+		/*
+		 * XY_SRC blit supports only 32bpp, but we can still use it
+		 * for a 64bpp plane by treating that as a 2x wide 32bpp plane.
+		 */
+		if (!fast_blit_ok(fb) && fb->plane_bpp[i] == 64)
+			width *= 2;
+
 		/*
 		 * gen4+ stride limit is 4x this with tiling,
 		 * but since our blits are always between tiled
@@ -1967,7 +1989,7 @@ static bool blitter_ok(const struct igt_fb *fb)
 		 * for the tiled surface) we must use the lower
 		 * linear stride limit here.
 		 */
-		if (fb->plane_width[i] > 32767 ||
+		if (width > 32767 ||
 		    fb->plane_height[i] > 32767 ||
 		    fb->strides[i] > 32767)
 			return false;
@@ -2155,8 +2177,6 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
 
 	for (int i = 0; i < dst_fb->num_planes; i++) {
-		int gen = intel_gen(intel_get_drm_devid(src_fb->fd));
-
 		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
 		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
 		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
@@ -2165,9 +2185,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 		 * blit command, so use the XY_SRC blit command for it
 		 * instead.
 		 */
-		if ((gen >= 9 && gen < 12) ||
-		    (gen >= 12 && (src_tiling != I915_TILING_X &&
-				   dst_tiling != I915_TILING_X))) {
+		if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
 			igt_blitter_fast_copy__raw(dst_fb->fd,
 						   src_fb->gem_handle,
 						   src_fb->offsets[i],
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index c4bf7ef4..2fd3a75a 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -817,6 +817,11 @@ void igt_blitter_src_copy__raw(int fd,
 	src_pitch = (gen >= 4 && src_tiling) ? src_stride / 4 : src_stride;
 	dst_pitch = (gen >= 4 && dst_tiling) ? dst_stride / 4 : dst_stride;
 
+	if (bpp == 64) {
+		bpp /= 2;
+		width *= 2;
+	}
+
 	CHECK_RANGE(src_x); CHECK_RANGE(src_y);
 	CHECK_RANGE(dst_x); CHECK_RANGE(dst_y);
 	CHECK_RANGE(width); CHECK_RANGE(height);
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
