Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C892910E041
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 16:55:19 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 May 2022 22:24:52 +0530
Message-Id: <20220518165454.17352-3-anshuman.gupta@intel.com>
In-Reply-To: <20220518165454.17352-1-anshuman.gupta@intel.com>
References: <20220518165454.17352-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/4] i915_pm_rpm:
 s/display_disabled/display_enabled
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Change var display_disabled to display_enabled, also
modify the passed argument and condition accordingly.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rpm.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 2cc89eef2a..b836656c29 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -784,7 +784,7 @@ static void dump_file(int dir, const char *filename)
 	free(contents);
 }
 
-static bool setup_environment(bool display_disabled)
+static bool setup_environment(bool display_enabled)
 {
 	if (has_runtime_pm)
 		goto out;
@@ -798,7 +798,7 @@ static bool setup_environment(bool display_disabled)
 
 	ms_data.devid = intel_get_drm_devid(drm_fd);
 
-	if (!display_disabled)
+	if (display_enabled)
 		init_mode_set_data(&ms_data);
 
 	igt_pm_enable_sata_link_power_management();
@@ -812,14 +812,14 @@ static bool setup_environment(bool display_disabled)
 	igt_require(igt_pm_dmc_loaded(debugfs));
 
 out:
-	if (!display_disabled)
+	if (display_enabled)
 		disable_all_screens(&ms_data);
 	dump_file(debugfs, "i915_runtime_pm_status");
 
 	return wait_for_suspended();
 }
 
-static void teardown_environment(bool display_disabled)
+static void teardown_environment(bool display_enabled)
 {
 	close(msr_fd);
 	if (has_pc8)
@@ -829,7 +829,7 @@ static void teardown_environment(bool display_disabled)
 
 	igt_pm_restore_sata_link_power_management();
 
-	if (!display_disabled)
+	if (display_enabled)
 		fini_mode_set_data(&ms_data);
 
 	close(debugfs);
@@ -2050,7 +2050,7 @@ static struct option long_options[] = {
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	igt_subtest("basic-rte") {
-		igt_assert(setup_environment(false));
+		igt_assert(setup_environment(true));
 		basic_subtest();
 	}
 
@@ -2058,7 +2058,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	 * PC8+. We don't want bug reports from cases where the machine is just
 	 * not properly configured. */
 	igt_fixture {
-		igt_require(setup_environment(false));
+		igt_require(setup_environment(true));
 	}
 
 	if (stay)
@@ -2196,7 +2196,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture
-		teardown_environment(false);
+		teardown_environment(true);
 
 	igt_subtest("module-reload") {
 		igt_debug("Reload w/o display\n");
@@ -2205,9 +2205,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");
 		igt_assert_eq(igt_i915_driver_load("disable_display=1 mmio_debug=-1"), 0);
 
-		igt_assert(setup_environment(true));
+		igt_assert(setup_environment(false));
 		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
-		teardown_environment(true);
+		teardown_environment(false);
 
 		igt_debug("Reload as normal\n");
 		igt_i915_driver_unload();
@@ -2215,11 +2215,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
 		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
 
-		igt_assert(setup_environment(false));
+		igt_assert(setup_environment(true));
 		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
 		if (enable_one_screen_with_type(&ms_data, SCREEN_TYPE_ANY))
 			drm_resources_equal_subtest();
-		teardown_environment(false);
+		teardown_environment(true);
 
 		/* Remove our mmio_debugging module */
 		igt_i915_driver_unload();
-- 
2.26.2
