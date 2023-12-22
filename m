Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E7810E1B5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 03/15] lib/igt_fb: Expose igt_fb_is_ccs_modifier()
Date: Fri, 22 Dec 2023 16:31:47 +0200
Message-ID: <20231222143159.24662-4-ville.syrjala@linux.intel.com>
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

I'm going to need is_ccs_modifier() outside of igt_fb.c.
Rename it to igt_fb_is_ccs_modifier() and expose it to everyone.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 21 ++++++++++++---------
 lib/igt_fb.h |  1 +
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 683eb176b7a4..d7d8840fa432 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -605,7 +605,7 @@ static bool is_gen12_ccs_modifier(uint64_t modifier)
 		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
 }
 
-static bool is_ccs_modifier(uint64_t modifier)
+bool igt_fb_is_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_ccs_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
@@ -614,7 +614,8 @@ static bool is_ccs_modifier(uint64_t modifier)
 
 static bool is_ccs_plane(const struct igt_fb *fb, int plane)
 {
-	if (!is_ccs_modifier(fb->modifier) || HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
+	if (!igt_fb_is_ccs_modifier(fb->modifier) ||
+	    HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
 		return false;
 
 	return plane >= fb->num_planes / 2;
@@ -724,7 +725,8 @@ static int fb_num_planes(const struct igt_fb *fb)
 {
 	int num_planes = lookup_drm_format(fb->drm_format)->num_planes;
 
-	if (is_ccs_modifier(fb->modifier) && !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
+	if (igt_fb_is_ccs_modifier(fb->modifier) &&
+	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
 		num_planes *= 2;
 
 	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
@@ -2491,7 +2493,7 @@ static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
 static bool fast_blit_ok(const struct igt_fb *fb)
 {
 	return blt_has_fast_copy(fb->fd) &&
-		!is_ccs_modifier(fb->modifier) &&
+		!igt_fb_is_ccs_modifier(fb->modifier) &&
 		blt_fast_copy_supports_tiling(fb->fd,
 					      fb_tile_to_blt_tile(fb->modifier));
 }
@@ -2508,7 +2510,7 @@ static bool blitter_ok(const struct igt_fb *fb)
 	if (!is_intel_device(fb->fd))
 		return false;
 
-	if ((is_ccs_modifier(fb->modifier) &&
+	if ((igt_fb_is_ccs_modifier(fb->modifier) &&
 	     !HAS_FLATCCS(intel_get_drm_devid(fb->fd))) ||
 	     is_gen12_mc_ccs_modifier(fb->modifier))
 		return false;
@@ -2548,7 +2550,8 @@ static bool use_enginecopy(const struct igt_fb *fb)
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) && is_ccs_modifier(fb->modifier)) ||
+	       (!HAS_FLATCCS(intel_get_drm_devid(fb->fd)) &&
+		igt_fb_is_ccs_modifier(fb->modifier)) ||
 	       is_gen12_mc_ccs_modifier(fb->modifier);
 }
 
@@ -2608,7 +2611,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 
 	igt_assert_eq(fb->offsets[0], 0);
 
-	if (is_ccs_modifier(fb->modifier)) {
+	if (igt_fb_is_ccs_modifier(fb->modifier)) {
 		igt_assert_eq(fb->strides[0] & 127, 0);
 
 		if (is_gen12_ccs_modifier(fb->modifier)) {
@@ -2651,7 +2654,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 	if (buf->format_is_yuv_semiplanar)
 		buf->yuv_semiplanar_bpp = yuv_semiplanar_bpp(fb->drm_format);
 
-	if (is_ccs_modifier(fb->modifier)) {
+	if (igt_fb_is_ccs_modifier(fb->modifier)) {
 		num_surfaces = fb->num_planes / (HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? 1 : 2);
 		for (i = 0; i < num_surfaces; i++)
 			init_buf_ccs(buf, i,
@@ -2773,7 +2776,7 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 		       intel_get_uc_mocs_index(fb->fd),
 		       intel_get_pat_idx_uc(fb->fd),
 		       blt_tile,
-		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
+		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
 		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
 
 	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 834aaef54dea..0b85819b0f9e 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -182,6 +182,7 @@ void igt_fb_calc_crc(struct igt_fb *fb, igt_crc_t *crc);
 uint64_t igt_fb_mod_to_tiling(uint64_t modifier);
 uint64_t igt_fb_tiling_to_mod(uint64_t tiling);
 
+bool igt_fb_is_ccs_modifier(uint64_t modifier);
 bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
 bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
 int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);
-- 
2.41.0
