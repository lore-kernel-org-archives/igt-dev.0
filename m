Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F4A10E111
 for <igt-dev@lists.freedesktop.org>; Sat,  1 Apr 2023 17:34:06 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat,  1 Apr 2023 22:59:56 +0530
Message-Id: <20230401172957.183517-2-mohammed.thasleem@intel.com>
In-Reply-To: <20230401172957.183517-1-mohammed.thasleem@intel.com>
References: <20230401172957.183517-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 1/2] tests/i915/i915_pm_dc: Add DC6 DPMS test
 for mtl
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

The flow for DC6 validation has changed for MTL.
DC6 state achieved based on PKGC10 entry.
This test validates PKGC10 entry and confirm DC6 achieved

v2: - Removed variable to store disp version. (Vinod)
v3: - Used igt_debugfs_mount to open the path. (Imre)
    - Updated string in igt_skip_on_f. (Imre)
    - Removed redundant code. (Imre)
    - Set test execution for display for version >=14. (Imre)
    - Rename function read_pkc_state_value with pkgc. (Imre)
    - Added runtime PM disabled and enable. (Imre).
    - During testing the entry always happened in ~4.5ses so set
      max igt_wait to 5sec.
v4: - Updated with sysfs open and read entry calls. (Imre)
    - Renamed pkgc with read_pkgc_counter. (Imre)
    - Updated igt_wait to 6sec to avoid corner case failure.
v5: - Used igt_debugfs_mount to mount the path instead
      igt_sysfs_open. (Imre)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/i915_pm_dc.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 1c695b50..1d6ec2ee 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -45,6 +45,7 @@
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
 #define RPM_STATUS "i915_runtime_pm_status"
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
+#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid)))
 
@@ -60,6 +61,7 @@ typedef struct {
 	int drm_fd;
 	int msr_fd;
 	int debugfs_fd;
+	int debugfs_root_fd;
 	uint32_t devid;
 	char *debugfs_dump;
 	igt_display_t display;
@@ -519,6 +521,36 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
+static unsigned int read_pkgc_counter(int debugfs_root_fd)
+{
+	char buf[4096];
+	char *str;
+	int len;
+
+	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
+	igt_skip_on_f(len < 0, "PKGC state file not found\n");
+	buf[len] = '\0';
+	str = strstr(buf, "Package C10");
+	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
+
+	return get_dc_counter(str);
+}
+
+static void test_pkgc_state_dpms(data_t *data)
+{
+	unsigned int timeout_sec = 6;
+	unsigned int prev_value = 0, cur_value = 0;
+
+	prev_value = read_pkgc_counter(data->debugfs_root_fd);
+	setup_dc_dpms(data);
+	dpms_off(data);
+	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
+		  timeout_sec * 1000, 100);
+	igt_assert_f(cur_value > prev_value, "PK10 is not achieived.\n");
+	dpms_on(data);
+	cleanup_dc_dpms(data);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -538,6 +570,8 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		igt_require(data.debugfs_fd != -1);
+		data.debugfs_root_fd = open(igt_debugfs_mount(), O_RDONLY);
+		igt_require(data.debugfs_root_fd != -1);
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_pm_enable_sata_link_power_management();
@@ -600,7 +634,11 @@ igt_main
 	igt_subtest("dc6-dpms") {
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		test_dc_state_dpms(&data, CHECK_DC6);
+		if (intel_display_ver(data.devid) >= 14)
+			test_pkgc_state_dpms(&data);
+		else
+			test_dc_state_dpms(&data, CHECK_DC6);
+
 	}
 
 	igt_describe("This test validates display engine entry to DC9 state");
@@ -614,6 +652,7 @@ igt_main
 	igt_fixture {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
+		close(data.debugfs_root_fd);
 		close(data.msr_fd);
 		display_fini(&data);
 		close(data.drm_fd);
-- 
2.25.1
