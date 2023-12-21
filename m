Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110E210E6D3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 16:34:58 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 1/4] test/xe_pm: Add exit handler to close fw handle
Date: Thu, 21 Dec 2023 22:03:35 +0530
Message-Id: <20231221163338.2157257-2-anshuman.gupta@intel.com>
In-Reply-To: <20231221163338.2157257-1-anshuman.gupta@intel.com>
References: <20231221163338.2157257-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kamil.konieczny@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding an exit handler to close the fw handle to make sure we don't
leak the fw in CI environment. Adding a IGT subtest group for the
test using the fw handle to runtime wake the device.
Scaling forcewake close exit handler for vram-d3cold-threshold
subtest, while doing so add the missing subtest Functionality
as well.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 602729daf..c4ec38ae3 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -39,6 +39,7 @@ typedef struct {
 } device_t;
 
 uint64_t orig_threshold;
+int fw_handle = -1;
 
 /* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
 static bool runtime_usage_available(struct pci_device *pci)
@@ -166,6 +167,14 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
 	return true;
 }
 
+static void close_fw_handle(int sig)
+{
+	if (fw_handle < 0)
+		return;
+
+	close(fw_handle);
+}
+
 /**
  * SUBTEST: %s-basic
  * Description: set GPU state to %arg[1] and test suspend/autoresume
@@ -382,9 +391,9 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	};
 	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
 	uint32_t bo, placement;
-	int handle, i;
 	bool active;
 	void *map;
+	int i;
 
 	igt_require(xe_has_vram(device.fd_xe));
 
@@ -428,10 +437,10 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	 * the device from runtime suspend.
 	 * Therefore open and close fw handle to wake the device.
 	 */
-	handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
-	igt_assert(handle >= 0);
+	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+	igt_assert(fw_handle >= 0);
 	active = igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE;
-	close(handle);
+	close(fw_handle);
 	igt_assert(active);
 
 	/* Test D3Cold again after freeing up the Xe BO */
@@ -536,11 +545,18 @@ igt_main
 		}
 	}
 
-	igt_describe("Validate whether card is limited to d3hot, if vram used > vram threshold");
-	igt_subtest("vram-d3cold-threshold") {
-		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
-		igt_install_exit_handler(vram_d3cold_threshold_restore);
-		test_vram_d3cold_threshold(device, sysfs_fd);
+	igt_subtest_group {
+		igt_fixture {
+			igt_install_exit_handler(close_fw_handle);
+		}
+
+		igt_describe("Validate whether card is limited to d3hot,"
+			     "if vram used > vram threshold");
+		igt_subtest("vram-d3cold-threshold") {
+			orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
+			igt_install_exit_handler(vram_d3cold_threshold_restore);
+			test_vram_d3cold_threshold(device, sysfs_fd);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1
