Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B846EC1C
 for <igt-dev@lists.freedesktop.org>; Wed, 26 May 2021 07:36:32 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed, 26 May 2021 12:50:36 +0530
Message-Id: <20210526072040.2286-2-anshuman.gupta@intel.com>
In-Reply-To: <20210526072040.2286-1-anshuman.gupta@intel.com>
References: <20210526072040.2286-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 1/5] i915/i915_pm_rpm: Enable PC8+
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
SKL onwards Platforms can enter the PC8 even with display on,
therefore it requires to bifurcate pc8-residency igt test into
display-on and display-off igt test case.

Negative testing of PC8 residency on HASWELL/BROADWELL while
display being "on" is removed as it saves CI time and there is
no ROI of such testing.

v2: chooses the optimum timeout value for PC8 test timeout.

v3: cosmetics changes. [Uma]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 46 ++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index d9ec0388..9f5656bb 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -52,6 +52,7 @@
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_edid.h"
+#include "igt_psr.h"
 
 #define MSR_PC8_RES	0x630
 #define MSR_PC9_RES	0x631
@@ -85,6 +86,14 @@ enum plane_type {
 #define WAIT_EXTRA	4
 #define USE_DPMS	8
 
+/*
+ * PC state timeout
+ * idle time of msecs is enough for cpu to be in C10 but for package C states
+ * it requires other soc devices to be idle, to be ready for entry to PC8/PC10.
+ * Let's keep 3 seconds timeout for PC8 and 5 seconds for PC10.
+ */
+#define PC8_TIMEOUT 3
+
 int drm_fd, msr_fd, pc8_status_fd;
 int debugfs;
 bool has_runtime_pm, has_pc8;
@@ -728,10 +737,6 @@ static void setup_pc8(void)
 {
 	has_pc8 = false;
 
-	/* Only Haswell supports the PC8 feature. */
-	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid))
-		return;
-
 	/* Make sure our Kernel supports MSR and the module is loaded. */
 	igt_require(modprobe("msr") == 0);
 
@@ -827,20 +832,27 @@ static void basic_subtest(void)
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
@@ -2075,8 +2087,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
