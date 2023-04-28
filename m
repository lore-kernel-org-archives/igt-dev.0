Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E8F10EC78
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 07:19:00 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 12:43:26 +0530
Message-Id: <20230428071350.2561575-24-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
References: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 23/47] tests/i915/kms_draw_crc: Add XE support
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

Add XE driver support for differnt draw methods.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_draw_crc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 3a3cd99a0..db6d71f2e 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -149,8 +149,8 @@ static void draw_method_subtest(enum igt_draw_method method,
 	 * comparison. Cache the value so we don't recompute it for every single
 	 * subtest. */
 	if (!base_crcs[format_index].set) {
-		get_method_crc(gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
-							       IGT_DRAW_MMAP_WC,
+		get_method_crc(igt_draw_supports_method(drm_fd, IGT_DRAW_MMAP_GTT) ?
+			       IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
 			       formats[format_index],
 			       DRM_FORMAT_MOD_LINEAR,
 			       &base_crcs[format_index].crc);
@@ -195,8 +195,8 @@ static void fill_fb_subtest(void)
 	igt_plane_set_fb(primary, &fb);
 
 	igt_draw_rect_fb(drm_fd, bops, 0, &fb,
-			 gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
-							 IGT_DRAW_MMAP_WC,
+			 igt_draw_supports_method(drm_fd, IGT_DRAW_MMAP_GTT) ?
+			 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
 			 0, 0, fb.width, fb.height, 0xFF);
 
 	rc = igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -222,7 +222,7 @@ static void fill_fb_subtest(void)
 
 static void setup_environment(void)
 {
-	drm_fd = drm_open_driver_master(DRIVER_INTEL);
+	drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 	igt_require(drm_fd >= 0);
 	igt_display_require(&display, drm_fd);
 	igt_display_require_output(&display);
@@ -289,13 +289,17 @@ igt_main
 			       "method (%s) with different modifiers & DRM formats.",
 			       igt_draw_get_method_name(method));
 		igt_subtest_with_dynamic_f("draw-method-%s", igt_draw_get_method_name(method)) {
-			igt_skip_on(method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd));
-			igt_skip_on(method == IGT_DRAW_MMAP_GTT && !gem_has_mappable_ggtt(drm_fd));
+			if (!igt_draw_supports_method(drm_fd, method))
+				continue;
 
-			for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
-				for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
-					modifier = modifiers[modifier_idx];
+			for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
+				modifier = modifiers[modifier_idx];
 
+				/* No tiling support in XE. */
+				if (is_xe_device(drm_fd) && modifier != DRM_FORMAT_MOD_LINEAR)
+					continue;
+
+				for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
 					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
 						continue;
 
-- 
2.40.0
