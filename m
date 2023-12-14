Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE55210E95A
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 15:34:33 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/kms_psr2_sf: Fix primary_format setting
Date: Thu, 14 Dec 2023 21:12:19 +0530
Message-Id: <20231214154219.2638408-1-jeevan.b@intel.com>
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

The format is being changed globally to DRM_FORMAT_NV12. additionally,
FBC doesn't support the NV12 format, so this issue is being addressed.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 76435f501..272260cdf 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1387,7 +1387,6 @@ igt_main
 		 * plane and continuous updates.
 		 */
 		data.op = PLANE_UPDATE_CONTINUOUS;
-		data.primary_format = DRM_FORMAT_NV12;
 		igt_describe("Test that selective fetch works on overlay plane");
 		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
 					   op_str(data.op)) {
@@ -1404,6 +1403,11 @@ igt_main
 						data.pipe = pipes[i];
 						data.output = outputs[i];
 						data.damage_area_count = 1;
+						if (data.fbc_flag == true &&
+						    data.op_fbc_mode == FBC_ENABLED)
+							data.primary_format = DRM_FORMAT_XRGB8888;
+						else
+							data.primary_format = DRM_FORMAT_NV12;
 						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
 						prepare(&data);
-- 
2.25.1
