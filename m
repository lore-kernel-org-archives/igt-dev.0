Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9D910E057
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 08:38:33 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Skip the test for bigfb
 with FBC enabled
Date: Tue, 26 Dec 2023 14:17:56 +0530
Message-Id: <20231226084756.35472-3-jeevan.b@intel.com>
In-Reply-To: <20231226084756.35472-1-jeevan.b@intel.com>
References: <20231226084756.35472-1-jeevan.b@intel.com>
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

The size of the 'bigfb' plane is too large for FBC, so we are
skipping that test.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_psr2_sf.c | 52 ++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 9e0b3c32d..3eacd7c26 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -105,9 +105,6 @@
  *
  * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
  * Description: Test that selective fetch works on primary plane with big fb
- *
- * SUBTEST: fbc-primary-plane-update-sf-dmg-area-big-fb
- * Description: Test that fbc with selective fetch works on primary plane with big fb
  */

 IGT_TEST_DESCRIPTION("Tests to varify PSR2 selective fetch by sending multiple"
@@ -1076,29 +1073,34 @@ igt_main
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
+						   append_fbc_subtest[y], op_str(data.op)) {
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
--
2.25.1
