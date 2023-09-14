Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3406B10E298
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 14:03:33 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Sep 2023 19:33:58 +0530
Message-Id: <20230914140401.11101-3-swati2.sharma@intel.com>
In-Reply-To: <20230914140401.11101-1-swati2.sharma@intel.com>
References: <20230914140401.11101-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/intel/kms_pm_lpsp: Add XE support
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
 tests/intel/kms_pm_lpsp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 9093f728c..14f4b77f5 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -39,7 +39,7 @@
  *
  * SUBTEST: kms-lpsp
  * Description: This test validates lpsp on all connected outputs on low power PIPE_A
- * Driver requirement: i915
+ * Driver requirement: i915, xe
  * Functionality: pm_lpsp
  * Mega feature: Display Power
  * Test category: functionality test
@@ -192,8 +192,7 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
-
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		igt_require(data.drm_fd >= 0);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		igt_require(data.debugfs_fd >= 0);
@@ -206,6 +205,7 @@ igt_main
 
 	igt_describe("This test validates lpsp while all crtc are disabled");
 	igt_subtest("screens-disabled") {
+		igt_require_i915(data.drm_fd);
 		igt_require_f(!dmc_supported(data.debugfs_fd),
 			      "DC states supported platform don't have ROI for this subtest\n");
 		screens_disabled_subtest(&data);
-- 
2.25.1
