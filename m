Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BE110E3FE
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jan 2023 12:02:19 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Jan 2023 17:32:04 +0530
Message-Id: <20230109120205.2259410-2-anshuman.gupta@intel.com>
In-Reply-To: <20230109120205.2259410-1-anshuman.gupta@intel.com>
References: <20230109120205.2259410-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] test/device_reset: Rename device_fds to
 device_data
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We need to encapsulate the the struct pci_device to device_fds
structure, which is a general helper data structure.
Rename its accordingly to device_data.
It will be used to encapsulate root port to support
warm reset IGT Test.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/device_reset.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 39ee8dca9f..fe26030783 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -30,7 +30,7 @@ enum reset {
  * Helper structure containing file descriptors
  * and bus address related to tested device
  */
-struct device_fds {
+struct device_data {
 	struct {
 		int dev;
 		int dev_dir;
@@ -157,7 +157,7 @@ static char *device_sysfs_path(int fd, char *path)
 	return realpath(sysfs, path);
 }
 
-static void init_device_fds(struct device_fds *dev)
+static void init_device_fds(struct device_data *dev)
 {
 	char dev_path[PATH_MAX];
 	char *addr_pos;
@@ -210,7 +210,7 @@ static int close_if_opened(int *fd)
 	return rc;
 }
 
-static void cleanup_device_fds(struct device_fds *dev)
+static void cleanup_device_fds(struct device_data *dev)
 {
 	igt_ignore_warn(close_if_opened(&dev->fds.dev));
 	igt_ignore_warn(close_if_opened(&dev->fds.dev_dir));
@@ -283,7 +283,7 @@ static bool is_sysfs_cold_reset_supported(int slot_fd)
 }
 
 /* Unbind the driver from the device */
-static void driver_unbind(struct device_fds *dev)
+static void driver_unbind(struct device_data *dev)
 {
 	/**
 	 * FIXME: Unbinding the i915 driver on affected platforms with
@@ -319,7 +319,7 @@ static void driver_unbind(struct device_fds *dev)
 }
 
 /* Re-bind the driver to the device */
-static void driver_bind(struct device_fds *dev)
+static void driver_bind(struct device_data *dev)
 {
 	igt_debug("rebind the driver to the device\n");
 	igt_abort_on_f(!igt_sysfs_set(dev->fds.drv_dir, "bind",
@@ -330,7 +330,7 @@ static void driver_bind(struct device_fds *dev)
 }
 
 /* Initiate device reset */
-static void initiate_device_reset(struct device_fds *dev, enum reset type)
+static void initiate_device_reset(struct device_data *dev, enum reset type)
 {
 	igt_debug("reset device\n");
 
@@ -358,7 +358,7 @@ static bool is_i915_wedged(int i915)
  * @dev: structure with device descriptor, if descriptor equals -1
  * 	 the device is reopened
  */
-static void healthcheck(struct device_fds *dev)
+static void healthcheck(struct device_data *dev)
 {
 	if (dev->fds.dev == -1) {
 		/* refresh device list */
@@ -390,7 +390,7 @@ static void set_device_filter(const char* dev_path)
 	igt_assert_eq(igt_device_filter_add(filter), 1);
 }
 
-static void unbind_reset_rebind(struct device_fds *dev, enum reset type)
+static void unbind_reset_rebind(struct device_data *dev, enum reset type)
 {
 	igt_debug("close the device\n");
 	close_if_opened(&dev->fds.dev);
@@ -404,7 +404,7 @@ static void unbind_reset_rebind(struct device_fds *dev, enum reset type)
 
 igt_main
 {
-	struct device_fds dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}, };
+	struct device_data dev = { .fds = {-1, -1, -1}, .dev_bus_addr = {0}, };
 
 	igt_fixture {
 		char dev_path[PATH_MAX];
-- 
2.25.1
