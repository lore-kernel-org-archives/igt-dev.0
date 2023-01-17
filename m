Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C8210E527
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 08:52:00 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 14:20:55 +0530
Message-Id: <20230117085055.128552-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC i-g-t] [RFC] tests/i915/i915_pm_dc: Add DC6
 test for mtl
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
This test validates PKGC10 entry and confirm DC6 achieved.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/i915_pm_dc.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index ba49d014..c30269a6 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -45,6 +45,7 @@
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
 #define RPM_STATUS "i915_runtime_pm_status"
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
+#define PACKAGE_STATE_PATH "/sys/kernel/debug/pmc_core/"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid)))
 
@@ -60,6 +61,8 @@ typedef struct {
 	int drm_fd;
 	int msr_fd;
 	int debugfs_fd;
+	int pmc_fd;
+	uint32_t ver;
 	uint32_t devid;
 	char *debugfs_dump;
 	igt_display_t display;
@@ -485,6 +488,36 @@ static void test_dc9_dpms(data_t *data)
 	setup_dc9_dpms(data, dc_target);
 }
 
+static unsigned int read_pk10_value(int pmc_fd)
+{
+	char buf[4096];
+	char *str;
+
+	igt_require((pmc_fd = open(PACKAGE_STATE_PATH, O_RDONLY)) >= 0);
+
+	igt_debugfs_simple_read(pmc_fd, "package_cstate_show",
+				buf, sizeof(buf));
+	igt_skip_on_f(!strstr(buf, "Package C10"),
+		      "PK10 will be not supported.\n");
+	str = strstr(buf, "Package C10");
+	igt_assert_f(str, "PK10 value not available\n");
+
+	return get_dc_counter(str);
+}
+
+static void test_pk10_dpms(data_t *data)
+{
+	unsigned int timeout_sec = 30;
+	unsigned int prev_value = 0, cur_value = 0;
+
+	prev_value = read_pk10_value(data->pmc_fd);
+	dpms_off(data);
+	igt_wait((cur_value = read_pk10_value(data->pmc_fd)),
+		  timeout_sec * 1000, 100);
+	igt_assert_f(cur_value > prev_value, "PK10 is not achieived.\n");
+	dpms_on(data);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -506,6 +539,7 @@ igt_main
 		igt_require(data.debugfs_fd != -1);
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
+		data.ver = intel_display_ver(data.devid);
 		igt_pm_enable_sata_link_power_management();
 		igt_require(igt_setup_runtime_pm(data.drm_fd));
 		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
@@ -557,7 +591,10 @@ igt_main
 	igt_subtest("dc6-dpms") {
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		test_dc_state_dpms(&data, CHECK_DC6);
+		if (data.ver == 14)
+			test_pk10_dpms(&data);
+		else
+			test_dc_state_dpms(&data, CHECK_DC6);
 	}
 
 	igt_describe("This test validates display engine entry to DC9 state");
-- 
2.25.1
