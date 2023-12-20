Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF7A10E239
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 18:24:30 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/kms_psr2_sf: Fix primary_format setting
Date: Thu, 21 Dec 2023 00:01:29 +0530
Message-Id: <20231220183129.2797363-1-jeevan.b@intel.com>
MIME-Version: 1.0
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

The format is being changed globally to DRM_FORMAT_NV12. Additionally,
FBC doesn't support the NV12 format, so this issue is being addressed.

v2: Initialize data members at the beginning of the loop.
    bigfb plane size is too big for FBC, so skipping that test.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 68 +++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 28 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 76435f501..9cafe1f7a 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -68,13 +68,13 @@
  * SUBTEST: cursor-plane-update-sf
  * Description: Test that selective fetch works on cursor plane
  *
- * SUBTEST: fbc-cursor-plane-update-continuous-sf
+ * SUBTEST: fbc-cursor-plane-update-sf
  * Description: Test that fbc with selective fetch works on cursor plane
  *
  * SUBTEST: overlay-plane-update-continuous-sf
  * Description: Test that selective fetch works on overlay plane
  *
- * SUBTEST: fbc-overlay-plane-update-continuous-sf-dmg-area
+ * SUBTEST: fbc-overlay-plane-update-sf-dmg-area
  * Description: Test that fbc with selective fetch works on overlay plane
  *
  * SUBTEST: overlay-plane-update-sf-dmg-area
@@ -100,14 +100,12 @@
  * SUBTEST: primary-plane-update-sf-dmg-area
  * Description: Test that selective fetch works on primary plane
  *
- * SUBTEST: fbc-primary-plane-update-continuous-sf-dmg-area
+ * SUBTEST:  fbc-primary-plane-update-sf-dmg-area
  * Description: Test that fbc with selective fetch works on primary plane
  *
  * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
  * Description: Test that selective fetch works on primary plane with big fb
  *
- * SUBTEST: fbc-primary-plane-update-continuous-sf-dmg-area-big-fb
- * Description: Test that fbc with selective fetch works on primary plane with big fb
  */
 
 IGT_TEST_DESCRIPTION("Tests to varify PSR2 selective fetch by sending multiple"
@@ -1043,6 +1041,11 @@ igt_main
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
+		data.op = PLANE_UPDATE;
+		data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+		data.primary_format = DRM_FORMAT_XRGB8888;
+		data.big_fb_test = 0;
+
 		data.op_fbc_mode = fbc_status[y];
 		/* Verify primary plane selective fetch */
 		igt_describe("Test that selective fetch works on primary plane");
@@ -1074,29 +1077,35 @@ igt_main
 		}
 
 		/* Verify primary plane selective fetch with big fb */
-		data.big_fb_test = 1;
-		igt_describe("Test that selective fetch works on primary plane with big fb");
-		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area-big-fb", append_fbc_subtest[y],
-					   op_str(data.op)) {
-			for (i = 0; i < n_pipes; i++) {
-				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-					continue;
-
-				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		if (data.op_fbc_mode == FBC_DISABLED) {
+			data.big_fb_test = 1;
+			igt_describe("Test that selective fetch works on primary plane with "
+				     "big fb");
+			igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area-big-fb",
+						   append_fbc_subtest[y],
+						   op_str(data.op)) {
+				for (i = 0; i < n_pipes; i++) {
+					if (!pipe_output_combo_valid(&data.display, pipes[i],
+								     outputs[i]))
 						continue;
-					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-						      igt_output_name(outputs[i]),
-						      coexist_feature_str(j)) {
-						data.pipe = pipes[i];
-						data.output = outputs[i];
-						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-						data.coexist_feature = j;
-						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-							data.damage_area_count = k;
-							prepare(&data);
-							run(&data);
-							cleanup(&data);
+
+					for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+						if (j != FEATURE_NONE && !(coexist_features[i] & j))
+							continue;
+						igt_dynamic_f("pipe-%s-%s%s",
+							      kmstest_pipe_name(pipes[i]),
+							      igt_output_name(outputs[i]),
+							      coexist_feature_str(j)) {
+							data.pipe = pipes[i];
+							data.output = outputs[i];
+							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+							data.coexist_feature = j;
+							for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
+								data.damage_area_count = k;
+								prepare(&data);
+								run(&data);
+								cleanup(&data);
+							}
 						}
 					}
 				}
@@ -1387,7 +1396,6 @@ igt_main
 		 * plane and continuous updates.
 		 */
 		data.op = PLANE_UPDATE_CONTINUOUS;
-		data.primary_format = DRM_FORMAT_NV12;
 		igt_describe("Test that selective fetch works on overlay plane");
 		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
 					   op_str(data.op)) {
@@ -1404,6 +1412,10 @@ igt_main
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.damage_area_count = 1;
+						if (data.op_fbc_mode == FBC_ENABLED)
+							data.primary_format = DRM_FORMAT_XRGB8888;
+						else
+							data.primary_format = DRM_FORMAT_NV12;
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
 						prepare(&data);
-- 
2.25.1
