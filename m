Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49B96E0E3
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 09:51:52 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 12 Mar 2020 11:51:36 +0200
Message-ID: <20200312095137.551252-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_chamelium: Don't use CCS
 modifiers in random plane setup
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The randomized setup happens for overlay planes only and the
randomization of each value is completely independent, whereas every CCS
plane needs to come paired with a main surface that is setup correctly:

  Each CCS tile matches a 1024x512 pixel area of the main surface.
  To match certain aspects of the 3D hardware the CCS is
  considered to be made up of normal 128Bx32 Y tiles, Thus
  the CCS pitch must be specified in multiples of 128 bytes.

Let's not use CCS modifiers on the surfaces for the random tests - it
would complicate the code too much to create valid configurations.
A dedicated test for CCS would be much better.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1404
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_fb.c          | 12 ++++++------
 lib/igt_fb.h          |  2 ++
 tests/kms_chamelium.c |  1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0c4fdc5d..27d6e1d9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -493,7 +493,7 @@ static bool is_gen12_ccs_modifier(uint64_t modifier)
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
 }
 
-static bool is_ccs_modifier(uint64_t modifier)
+bool igt_is_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_ccs_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
@@ -502,7 +502,7 @@ static bool is_ccs_modifier(uint64_t modifier)
 
 static bool is_ccs_plane(const struct igt_fb *fb, int plane)
 {
-	if (!is_ccs_modifier(fb->modifier))
+	if (!igt_is_ccs_modifier(fb->modifier))
 		return false;
 
 	return plane >= fb->num_planes / 2;
@@ -604,7 +604,7 @@ static int fb_num_planes(const struct igt_fb *fb)
 {
 	int num_planes = lookup_drm_format(fb->drm_format)->num_planes;
 
-	if (is_ccs_modifier(fb->modifier))
+	if (igt_is_ccs_modifier(fb->modifier))
 		num_planes *= 2;
 
 	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
@@ -1995,7 +1995,7 @@ static bool blitter_ok(const struct igt_fb *fb)
 	if (!is_i915_device(fb->fd))
 		return false;
 
-	if (is_ccs_modifier(fb->modifier))
+	if (igt_is_ccs_modifier(fb->modifier))
 		return false;
 
 	for (int i = 0; i < fb->num_planes; i++) {
@@ -2030,7 +2030,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       is_ccs_modifier(fb->modifier) ||
+	       igt_is_ccs_modifier(fb->modifier) ||
 	       !gem_has_mappable_ggtt(fb->fd);
 }
 
@@ -2095,7 +2095,7 @@ static void init_buf(struct fb_blit_upload *blit,
 	if (buf->format_is_yuv_semiplanar)
 		buf->yuv_semiplanar_bpp = yuv_semiplanar_bpp(fb->drm_format);
 
-	if (is_ccs_modifier(fb->modifier)) {
+	if (igt_is_ccs_modifier(fb->modifier)) {
 		igt_assert_eq(fb->strides[0] & 127, 0);
 
 		if (is_gen12_ccs_modifier(fb->modifier))
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 587f7a44..d049f40c 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -207,5 +207,7 @@ int igt_format_plane_bpp(uint32_t drm_format, int plane);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 			   bool allow_yuv);
 
+bool igt_is_ccs_modifier(uint64_t modifier);
+
 #endif /* __IGT_FB_H__ */
 
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 2acac1e4..8046ac65 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -2079,6 +2079,7 @@ static void randomize_plane_setup(data_t *data, igt_plane_t *plane,
 	/* First pass to count the supported formats. */
 	for (i = 0; i < plane->format_mod_count; i++)
 		if (igt_fb_supported_format(plane->formats[i]) &&
+		    !igt_is_ccs_modifier(plane->modifiers[i]) &&
 		    (allow_yuv || !igt_format_is_yuv(plane->formats[i])))
 			idx[count++] = i;
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
