Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778EA10E0D7
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 10:49:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu,  9 Feb 2023 16:14:22 +0530
Message-Id: <20230209104422.1645753-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/kms_draw_crc: Create separate subtest
 for each draw method
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

Instead of clubbing all draw methods, have a separate subtest for
each draw method.

Fixes: 9e71c27c6 (tests/i915/kms_draw_crc: Convert tests to dynamic)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_draw_crc.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 64d3b937e..701de8ecb 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -286,32 +286,23 @@ igt_main
 	igt_fixture
 		setup_environment();
 
-	igt_describe("This subtest verfies igt_draw library works "
-		     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
-	igt_subtest_with_dynamic("draw-method") {
-		for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
-			/* 10-bit & 16-bit formats are bit slow, ignore in pre-si. */
-			if (igt_run_in_simulation() &&
-			    formats[format_idx] != DRM_FORMAT_XRGB8888)
-				continue;
-
-			for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
+	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
+		igt_describe_f("Verify that igt draw library works for the draw "
+			       "method (%s) with different modifiers & DRM formats.",
+			       igt_draw_get_method_name(method));
+		igt_subtest_with_dynamic_f("draw-method-%s", igt_draw_get_method_name(method)) {
+			igt_skip_on(method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd));
+			igt_skip_on(method == IGT_DRAW_MMAP_GTT && !gem_has_mappable_ggtt(drm_fd));
+
+			for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
 				for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
 					modifier = modifiers[modifier_idx];
 
 					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
 						continue;
 
-					if (method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd))
-						continue;
-
-					if (method == IGT_DRAW_MMAP_GTT &&
-					    !gem_has_mappable_ggtt(drm_fd))
-						continue;
-
-					igt_dynamic_f("%s-%s-%s",
+					igt_dynamic_f("%s-%s",
 						      format_str(format_idx),
-						      igt_draw_get_method_name(method),
 						      modifier_str(modifier_idx))
 						draw_method_subtest(method, format_idx,
 								    modifier);
-- 
2.39.0
