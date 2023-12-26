Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E5010E047
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 08:38:29 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/intel/kms_psr2_sf: Fix primary_format setting
Date: Tue, 26 Dec 2023 14:17:55 +0530
Message-Id: <20231226084756.35472-2-jeevan.b@intel.com>
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

The format is being changed globally to DRM_FORMAT_NV12. Additionally,
FBC doesn't support the NV12 format, so this issue is being addressed.

v2: Initialize data members at the beginning of the loop.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_psr2_sf.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 76435f501..9e0b3c32d 100644
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
@@ -100,13 +100,13 @@
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
+ * SUBTEST: fbc-primary-plane-update-sf-dmg-area-big-fb
  * Description: Test that fbc with selective fetch works on primary plane with big fb
  */

@@ -1014,10 +1014,7 @@ igt_main
 			      "Error enabling PSR2\n");

 		data.damage_area_count = MAX_DAMAGE_AREAS;
-		data.op = PLANE_UPDATE;
-		data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 		data.primary_format = DRM_FORMAT_XRGB8888;
-		data.big_fb_test = 0;

 		res = drmModeGetResources(data.drm_fd);
 		data.big_fb_width = res->max_width;
@@ -1043,6 +1040,11 @@ igt_main
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
@@ -1387,7 +1389,6 @@ igt_main
 		 * plane and continuous updates.
 		 */
 		data.op = PLANE_UPDATE_CONTINUOUS;
-		data.primary_format = DRM_FORMAT_NV12;
 		igt_describe("Test that selective fetch works on overlay plane");
 		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
 					   op_str(data.op)) {
@@ -1404,6 +1405,10 @@ igt_main
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
