Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A2E10E6CB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 05:26:59 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Nov 2023 10:58:05 +0530
Message-Id: <20231123052807.157210-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_feature_discovery: Fix
 display subtest
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Instead of doing nothing, check the connected platform really
supports the display or not.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_feature_discovery.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 428f97ffe..81064aa0e 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -30,8 +30,7 @@
  *		anything else means we have a serious problem.
  *
  * SUBTEST: display
- * Description: Make sure that we have display support with
- * 		some outputs connected.
+ * Description: Make sure that we have display support.
  * Driver requirement: i915, xe
  * Functionality: feature_discovery
  * Mega feature: General Display Features
@@ -97,18 +96,25 @@ igt_main {
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		debugfs_fd = igt_debugfs_dir(fd);
+
+		errno = 0;
 	}
 
 	igt_subtest_group {
-		igt_fixture {
-			igt_display_require(&display, fd);
-		}
-
-		igt_describe("Make sure that we have display support with some outputs connected.");
+		igt_describe("Make sure that we have display support.");
 		igt_subtest("display") {
-			/* will skip because of the fixture */
+			drmModeResPtr resources = drmModeGetResources(fd);
+
+			/* Operation not supported on non-display platforms. */
+			if (!resources)
+				igt_assert_eq(errno, EOPNOTSUPP);
+
+			drmModeFreeResources(resources);
 		}
 
+		igt_fixture
+			igt_display_require(&display, fd);
+
 		igt_subtest_group {
 			volatile int output_count = 0;
 			igt_output_t *output;
-- 
2.25.1
