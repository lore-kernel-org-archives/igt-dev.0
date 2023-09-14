Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142A110E299
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 14:03:32 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Sep 2023 19:33:57 +0530
Message-Id: <20230914140401.11101-2-swati2.sharma@intel.com>
In-Reply-To: <20230914140401.11101-1-swati2.sharma@intel.com>
References: <20230914140401.11101-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] tests/intel/kms_pm_backlight: Add XE
 support
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

Add XE driver support for kms pm tests.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_backlight.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 20af15a6b..f6e7db0b2 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -43,35 +43,35 @@
  *
  * SUBTEST: bad-brightness
  * Description: Test the bad brightness.
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: backlight
  * Mega feature: Display Power
  * Test category: functionality test
  *
  * SUBTEST: basic-brightness
  * Description: Test the basic brightness.
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: backlight
  * Mega feature: Display Power
  * Test category: functionality test
  *
  * SUBTEST: fade
  * Description: Test basic fade.
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: backlight
  * Mega feature: Display Power
  * Test category: functionality test
  *
  * SUBTEST: fade-with-dpms
  * Description: Test the fade with DPMS.
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: dpms, backlight
  * Mega feature: Display Power
  * Test category: functionality test
  *
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: backlight, suspend
  * Mega feature: Display Power
  * Test category: functionality test
@@ -297,7 +297,7 @@ igt_main
 		 * try to enable all.
 		 */
 		kmstest_set_vt_graphics_mode();
-		igt_display_require(&display, drm_open_driver(DRIVER_INTEL));
+		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
 
 		for_each_connected_output(&display, output) {
 			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-- 
2.25.1
