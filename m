Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56FD6E80B
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 05:23:09 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  3 Mar 2021 10:37:33 +0530
Message-Id: <20210303050737.22056-2-anshuman.gupta@intel.com>
In-Reply-To: <20210303050737.22056-1-anshuman.gupta@intel.com>
References: <20210303050737.22056-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 1/5] i915/i915_pm_rpm: Enable PC8+
 residency test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Enabled pc8-residency test for each platform that supports pc8.
Bifurcate pc8-residency is display-on and display-off test case.

Negative testing of PC8 residency on HASWELL/BROADWELL while
display being "on" is removed as it saves CI time and there is
no ROI of such testing.

v2: chooses the optimum timeout value for PC8 test timeout.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 56 ++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index d9ec0388..067d1b91 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -52,6 +52,16 @@
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_edid.h"
+#include "igt_psr.h"
+
+#define MSR_PKG_CST_CONFIG_CONTROL	0xE2
+/*
+ * Below PKG CST limit mask and PC8 bits are meant for
+ * HSW,BDW SKL,ICL and Goldmont Microarch.
+ * Refer IA S/W developers manual vol3c part3 chapter:35
+ */
+#define  PKG_CST_LIMIT_MASK		0xF
+#define  PKG_CST_LIMIT_C8		0x6
 
 #define MSR_PC8_RES	0x630
 #define MSR_PC9_RES	0x631
@@ -85,6 +95,14 @@ enum plane_type {
 #define WAIT_EXTRA	4
 #define USE_DPMS	8
 
+/*
+ * PC state timeout
+ * idle time of msecs is enough for cpu to be in C10 but for package C states
+ * it requeries other soc devices to be idle to be ready for entry to PC8/PC10.
+ * Let's keep 3 seconds timeout for PC8 and 5 seconds for PC10.
+ */
+#define PC8_TIMEOUT 3
+
 int drm_fd, msr_fd, pc8_status_fd;
 int debugfs;
 bool has_runtime_pm, has_pc8;
@@ -301,7 +319,6 @@ static void init_modeset_cached_params(struct mode_set_data *data)
 					    SCREEN_TYPE_LPSP);
 	non_lpsp = init_modeset_params_for_type(data, &non_lpsp_mode_params,
 						SCREEN_TYPE_NON_LPSP);
-
 	if (lpsp)
 		default_mode_params = &lpsp_mode_params;
 	else if (non_lpsp)
@@ -728,10 +745,6 @@ static void setup_pc8(void)
 {
 	has_pc8 = false;
 
-	/* Only Haswell supports the PC8 feature. */
-	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid))
-		return;
-
 	/* Make sure our Kernel supports MSR and the module is loaded. */
 	igt_require(modprobe("msr") == 0);
 
@@ -827,20 +840,27 @@ static void basic_subtest(void)
 	/* XXX Also we can test wake up via exec nop */
 }
 
-static void pc8_residency_subtest(void)
+static void pc8_residency_subtest(bool display_on)
 {
 	igt_require(has_pc8);
 
-	/* Make sure PC8+ residencies move! */
-	disable_all_screens(&ms_data);
-	igt_assert_f(pc8_plus_residency_changed(30),
-		     "Machine is not reaching PC8+ states, please check its "
-		     "configuration.\n");
+	if (IS_HASWELL(ms_data.devid) || IS_BROADWELL(ms_data.devid))
+		igt_require_f(!display_on, "pc8 with display on not supported\n");
 
-	/* Make sure PC8+ residencies stop! */
-	enable_one_screen(&ms_data);
-	igt_assert_f(!pc8_plus_residency_changed(10),
-		     "PC8+ residency didn't stop with screen enabled.\n");
+	if (!display_on) {
+		/* Make sure PC8+ residencies move! */
+		disable_all_screens(&ms_data);
+		igt_assert_f(pc8_plus_residency_changed(PC8_TIMEOUT),
+			     "Machine is not reaching PC8+ states with all screens disabled.\n");
+	} else {
+		/* check pc8 with psr disabled on any output */
+		psr_disable(drm_fd, debugfs);
+		enable_one_screen(&ms_data);
+		igt_assert_f(pc8_plus_residency_changed(PC8_TIMEOUT),
+			     "Machine is not reaching PC8+ states with a screen enabled.\n");
+		/* Restore PSR with PSR_MODE_1 for rest of IGT */
+		psr_enable(drm_fd, debugfs, PSR_MODE_1);
+	}
 }
 
 static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
@@ -2075,8 +2095,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		reg_read_ioctl_subtest();
 	igt_subtest("i2c")
 		i2c_subtest();
-	igt_subtest("pc8-residency")
-		pc8_residency_subtest();
+	igt_subtest("pc8-residency-display-on")
+		pc8_residency_subtest(true);
+	igt_subtest("pc8-residency-display-off")
+		pc8_residency_subtest(false);
 	igt_subtest("debugfs-read")
 		debugfs_read_subtest();
 	igt_subtest("debugfs-forcewake-user")
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
