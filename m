Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB61410E43D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 08:24:23 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Nov 2022 13:53:34 +0530
Message-Id: <20221116082335.1194410-3-anshuman.gupta@intel.com>
In-Reply-To: <20221116082335.1194410-1-anshuman.gupta@intel.com>
References: <20221116082335.1194410-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] test/device_reset: Refactor
 initiate_device_reset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added a reset type enum to support multiple types
of reset like WARM, COLD and FLR reset.

No functional change.

v2:
- Removed WARM_RESET enum as not used yet. [Badal]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/device_reset.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index e60d4c7fde..0c477a02c0 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -19,6 +19,11 @@ IGT_TEST_DESCRIPTION("Examine behavior of a driver on device sysfs reset");
 #define DEV_PATH_LEN 80
 #define DEV_BUS_ADDR_LEN 13 /* addr has form 0000:00:00.0 */
 
+enum reset {
+	COLD_RESET,
+	FLR_RESET
+};
+
 /**
  * Helper structure containing file descriptors
  * and bus address related to tested device
@@ -222,10 +227,13 @@ static void driver_bind(struct device_fds *dev)
 }
 
 /* Initiate device reset */
-static void initiate_device_reset(struct device_fds *dev)
+static void initiate_device_reset(struct device_fds *dev, enum reset type)
 {
 	igt_debug("reset device\n");
-	igt_assert(igt_sysfs_set(dev->fds.dev_dir, "reset", "1"));
+
+	if (type == FLR_RESET)
+		igt_assert(igt_sysfs_set(dev->fds.dev_dir, "reset", "1"));
+
 }
 
 static bool is_i915_wedged(int i915)
@@ -274,14 +282,14 @@ static void set_device_filter(const char* dev_path)
 	igt_assert_eq(igt_device_filter_add(filter), 1);
 }
 
-static void unbind_reset_rebind(struct device_fds *dev)
+static void unbind_reset_rebind(struct device_fds *dev, enum reset type)
 {
 	igt_debug("close the device\n");
 	close_if_opened(&dev->fds.dev);
 
 	driver_unbind(dev);
 
-	initiate_device_reset(dev);
+	initiate_device_reset(dev, type);
 
 	driver_bind(dev);
 }
@@ -306,13 +314,13 @@ igt_main
 	igt_describe("Unbinds driver from device, initiates reset"
 		     " then rebinds driver to device");
 	igt_subtest("unbind-reset-rebind") {
-		unbind_reset_rebind(&dev);
+		unbind_reset_rebind(&dev, FLR_RESET);
 		healthcheck(&dev);
 	}
 
 	igt_describe("Resets device with bound driver");
 	igt_subtest("reset-bound") {
-		initiate_device_reset(&dev);
+		initiate_device_reset(&dev, FLR_RESET);
 		healthcheck(&dev);
 	}
 
-- 
2.25.1
