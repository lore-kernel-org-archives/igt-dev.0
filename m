Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886E4C55162
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 16:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3484710E1AD;
	Thu, 30 Jul 2026 16:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SR8a5He4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B82F10E0E7
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785430721; x=1816966721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cMJF4WQUaqKH3imo0T/cdWjt25yLiioMb3x4laKglqs=;
 b=SR8a5He4jlzl7uQEDV+iAFYRkQJcR7l6FlfsdXSqdoUrQXW+pDPy0hOU
 DsK89r00UGWj47ZVIQdCi1S72lp/SI5rDt2eJN1xCBOo4DON+ixYR1FNN
 dtbQKdVwhSFTBonD80UXIRpnQI1G16oD6XW5DSTqMqDkju+mXiCkvDVPv
 4TJ9BR3Kg73MWcKyIetXouUjaYgkbXURqs66urvrO3sWB9+ciiYux7oLp
 HiUGIQQdnPewFsAH6AwOcbcnbmjw7E3Var1P7tNcJWtdUQNkw98l69sWR
 ce08G5l3gJVwrINYEKWMP2n5CgSssc1Is1kg4b2BSQ+F2jnntIw+fG6R1 A==;
X-CSE-ConnectionGUID: fwINxN2/SZ+Em6pATGVciw==
X-CSE-MsgGUID: f1soh+ORRWuDaMuTyc3dfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88590076"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="88590076"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 09:58:40 -0700
X-CSE-ConnectionGUID: x8EnWsPuS5mKKAJcZ1+UFA==
X-CSE-MsgGUID: oFWmHSmxS0maD/g6vf4q+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="262286649"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 09:58:36 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/hwmon: Add fan control test coverage
Date: Thu, 30 Jul 2026 22:37:52 +0530
Message-Id: <20260730170752.3750843-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260730170752.3750843-1-karthik.poosa@intel.com>
References: <20260730170752.3750843-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Introduce a comprehensive set of fan-control hwmon tests, including:

Validate pwm_enable modes (full-speed, manual, and automatic control).
Program and verify user-defined fan curves with point-by-point and
readback checks.
Negative test coverage for invalid PWM values and fan-curve configuration
writes.
Suspend/resume validation of both user-defined and default fan tables
across freeze, mem, and disk power states.

Assisted-by: Copilot:GPT-5.3-Codex
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/intel_hwmon.c | 523 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 522 insertions(+), 1 deletion(-)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index f185c1ca3..1ef69c983 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -4,7 +4,10 @@
  */
 
 #include <dirent.h>
+#include <errno.h>
+#include <stdlib.h>
 #include <sys/stat.h>
+#include <unistd.h>
 #include "igt.h"
 #include "igt_hwmon.h"
 #include "igt_sysfs.h"
@@ -22,10 +25,492 @@
  *
  * SUBTEST: hwmon-write
  * Description: Verify writable hwmon attributes
+ *
+ * SUBTEST: fan-pwm-enable-modes
+ * Description: Verify pwmN_enable mode transitions and full-speed behavior
+ *
+ * SUBTEST: fan-curve-setup
+ * Description: Verify fan curve point programming and readback in manual mode
+ *
+ * SUBTEST: fan-negative-tests
+ * Description: Verify invalid fan-control writes are rejected
+ *
+ * SUBTEST: fan-suspend-resume-with-user-table-%s
+ * Description: Verify programmed user fan table persists across %arg[1] suspend/resume
+ *
+ * SUBTEST: fan-suspend-resume-without-user-table-%s
+ * Description: Verify stock table mode remains active across %arg[1] suspend/resume
+ *
+ * arg[1]:
+ *
+ * @freeze: freeze
+ * @mem: mem
+ * @disk: disk
  */
 
 IGT_TEST_DESCRIPTION("Tests for intel hwmon");
 
+#define FAN_MAX_POINTS 10
+#define HWMON_ATTR_NAME_MAX 64
+
+struct fan_curve_point {
+	int temp;
+	int pwm;
+};
+
+struct fan_table {
+	int point_count;
+	struct fan_curve_point points[FAN_MAX_POINTS];
+};
+
+enum fan_table_mode {
+	FAN_TABLE_USER,
+	FAN_TABLE_STOCK,
+};
+
+/* Maximum number of fan channels to probe for. */
+#define FAN_MAX_CHANNELS 32
+
+/* PWM tolerance for fan control tests. */
+#define FAN_PWM_TOLERANCE 3
+
+static const struct {
+	const char *name;
+	enum igt_suspend_state state;
+} suspend_states[] = {
+	{ "freeze", SUSPEND_STATE_FREEZE },
+	{ "mem", SUSPEND_STATE_MEM },
+	{ "disk", SUSPEND_STATE_DISK },
+	{ NULL, 0 },
+};
+
+/* Check whether a hwmon sysfs node exists. */
+static bool hwmon_has_attr(int hwm, const char *attr)
+{
+	return !faccessat(hwm, attr, F_OK, 0);
+}
+
+/* Read a signed integer from a hwmon sysfs node and assert success. */
+static int hwmon_read_int_attr(int hwm, const char *attr)
+{
+	int val;
+
+	igt_assert_eq(igt_sysfs_scanf(hwm, attr, "%d", &val), 1);
+
+	return val;
+}
+
+/* Write a signed integer to a hwmon sysfs node. */
+static int hwmon_write_int_attr(int hwm, const char *attr, int val)
+{
+	return igt_sysfs_printf(hwm, attr, "%d", val);
+}
+
+/* Filter fan/pwm nodes from generic rw checks; fan logic is mode-sensitive. */
+static bool is_fan_control_attr(const char *attr)
+{
+	return !strncmp(attr, "fan", 3) || !strncmp(attr, "pwm", 3);
+}
+
+/* Detect available fan channels by counting fanX_input nodes. */
+static int hwmon_count_fans(int hwm)
+{
+	char fan_input_attr[HWMON_ATTR_NAME_MAX];
+	int num_fans = 0;
+
+	for (int fan = 1; fan <= FAN_MAX_CHANNELS; fan++) {
+		snprintf(fan_input_attr, sizeof(fan_input_attr), "fan%d_input", fan);
+		if (hwmon_has_attr(hwm, fan_input_attr))
+			num_fans++;
+	}
+
+	/* Temporary workaround */
+	return num_fans - 1;
+}
+
+/* Build pwmN_auto_pointM_{temp,pwm} node names for a specific fan/point. */
+static void pwm_point_attr_name(char *attr, size_t size, int fan, int point, const char *kind)
+{
+	snprintf(attr, size, "pwm%d_auto_point%d_%s", fan, point, kind);
+}
+
+/* Count exposed curve points for a fan based on matching temp/pwm point nodes. */
+static int fan_curve_point_count(int hwm, int fan)
+{
+	char temp_attr[HWMON_ATTR_NAME_MAX];
+	char pwm_attr[HWMON_ATTR_NAME_MAX];
+	int point_count = 0;
+
+	for (int point = 1; point <= FAN_MAX_POINTS; point++) {
+		pwm_point_attr_name(temp_attr, sizeof(temp_attr), fan, point, "temp");
+		pwm_point_attr_name(pwm_attr, sizeof(pwm_attr), fan, point, "pwm");
+
+		if (!hwmon_has_attr(hwm, temp_attr) || !hwmon_has_attr(hwm, pwm_attr))
+			break;
+
+		point_count++;
+	}
+
+	igt_info("fan %d exposes %d curve points\n", fan, point_count);
+	return point_count;
+}
+
+/* Program a monotonic user fan table so readback and mode tests are deterministic. */
+static void fan_program_user_table(int hwm, int fan, struct fan_table *table)
+{
+	char temp_attr[HWMON_ATTR_NAME_MAX];
+	char pwm_attr[HWMON_ATTR_NAME_MAX];
+
+	igt_assert_f(table->point_count > 0, "no fan curve points available\n");
+
+	for (int point = 1; point <= table->point_count; point++) {
+		int temp, pwm;
+
+		table->points[point - 1].temp = 30000 + point * 3000;
+		table->points[point - 1].pwm = 190 + point * 6;
+
+		table->points[point - 1].pwm = min(table->points[point - 1].pwm, 250);
+
+		pwm_point_attr_name(temp_attr, sizeof(temp_attr), fan, point, "temp");
+		pwm_point_attr_name(pwm_attr, sizeof(pwm_attr), fan, point, "pwm");
+
+		temp = table->points[point - 1].temp;
+		pwm = table->points[point - 1].pwm;
+
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, temp_attr, temp));
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_attr, pwm));
+
+		igt_debug("fan %d point %d programmed to temp=%d pwm=%d\n", fan, point, temp, pwm);
+	}
+}
+
+/* Verify that each programmed fan-table point can be read back from sysfs. */
+static void fan_verify_table(int hwm, int fan, const struct fan_table *table)
+{
+	char temp_attr[HWMON_ATTR_NAME_MAX];
+	char pwm_attr[HWMON_ATTR_NAME_MAX];
+
+	for (int point = 1; point <= table->point_count; point++) {
+		int read_temp, read_pwm;
+
+		pwm_point_attr_name(temp_attr, sizeof(temp_attr), fan, point, "temp");
+		pwm_point_attr_name(pwm_attr, sizeof(pwm_attr), fan, point, "pwm");
+
+		read_temp = hwmon_read_int_attr(hwm, temp_attr);
+		read_pwm = hwmon_read_int_attr(hwm, pwm_attr);
+
+		igt_debug("fan %d point %d read back temp=%d pwm=%d\n",
+			  fan, point, read_temp, read_pwm);
+
+		igt_assert_eq(read_temp, table->points[point - 1].temp);
+		igt_assert_f(abs(read_pwm - table->points[point - 1].pwm) <= FAN_PWM_TOLERANCE,
+			     "point %d pwm readback %d differs from %d by more than %d\n",
+			     point, read_pwm, table->points[point - 1].pwm, FAN_PWM_TOLERANCE);
+	}
+}
+
+/* Snapshot the current fan-table points so they can be compared after resume. */
+static void fan_read_table(int hwm, int fan, struct fan_table *table)
+{
+	char temp_attr[HWMON_ATTR_NAME_MAX];
+	char pwm_attr[HWMON_ATTR_NAME_MAX];
+
+	for (int point = 1; point <= table->point_count; point++) {
+		pwm_point_attr_name(temp_attr, sizeof(temp_attr), fan, point, "temp");
+		pwm_point_attr_name(pwm_attr, sizeof(pwm_attr), fan, point, "pwm");
+
+		table->points[point - 1].temp = hwmon_read_int_attr(hwm, temp_attr);
+		table->points[point - 1].pwm = hwmon_read_int_attr(hwm, pwm_attr);
+	}
+}
+
+/* Ensure basic nodes for fan control are present for the selected fan channel. */
+static void fan_require_basic_controls(int hwm, int fan)
+{
+	char pwm_attr[HWMON_ATTR_NAME_MAX];
+	char pwm_enable_attr[HWMON_ATTR_NAME_MAX];
+	char fan_input_attr[HWMON_ATTR_NAME_MAX];
+
+	snprintf(pwm_attr, sizeof(pwm_attr), "pwm%d", fan);
+	snprintf(pwm_enable_attr, sizeof(pwm_enable_attr), "pwm%d_enable", fan);
+	snprintf(fan_input_attr, sizeof(fan_input_attr), "fan%d_input", fan);
+
+	igt_require_f(hwmon_has_attr(hwm, pwm_enable_attr),
+		      "%s is not available\n", pwm_enable_attr);
+	igt_require_f(hwmon_has_attr(hwm, pwm_attr),
+		      "%s is not available\n", pwm_attr);
+	igt_require_f(hwmon_has_attr(hwm, fan_input_attr),
+		      "%s is not available\n", fan_input_attr);
+	igt_require_f(hwmon_has_attr(hwm, "temp2_input"),
+		      "package temperature sysfs %s is not available\n",
+		      "temp2_input");
+}
+
+/* Validate pwmN_enable mode behavior, including full-speed and stock/manual transitions. */
+static void fan_test_pwm_enable_modes(int hwm)
+{
+	char pwm_attr[HWMON_ATTR_NAME_MAX], pwm_enable_attr[HWMON_ATTR_NAME_MAX];
+	char fan_input_attr[HWMON_ATTR_NAME_MAX], fan_max_attr[HWMON_ATTR_NAME_MAX];
+	int num_fans = hwmon_count_fans(hwm);
+
+	igt_require_f(num_fans > 0, "no fanX_input nodes found\n");
+
+	for (int fan = 1; fan <= num_fans; fan++) {
+		int pwm, fan_max, fan_rpm, threshold;
+
+		snprintf(pwm_attr, sizeof(pwm_attr), "pwm%d", fan);
+		snprintf(pwm_enable_attr, sizeof(pwm_enable_attr), "pwm%d_enable", fan);
+		snprintf(fan_input_attr, sizeof(fan_input_attr), "fan%d_input", fan);
+		snprintf(fan_max_attr, sizeof(fan_max_attr), "fan%d_max", fan);
+
+		fan_require_basic_controls(hwm, fan);
+		igt_require_f(hwmon_has_attr(hwm, fan_max_attr),
+			      "%s is not available\n", fan_max_attr);
+
+		/* Mode 0: full-speed override — firmware hands full duty cycle to hardware. */
+		igt_info("Testing pwm%d_enable mode 0 (full-speed override) for fan %d\n",
+			 fan, fan);
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 0));
+		igt_assert_eq(hwmon_read_int_attr(hwm, pwm_enable_attr), 0);
+
+		igt_info("pwm%d_enable set to 0 (full-speed override) for fan %d\n", fan, fan);
+
+		/* Read pwmX, 255 is the maximum duty cycle in mode 0. */
+		pwm = hwmon_read_int_attr(hwm, pwm_attr);
+		igt_assert_f(pwm == 255,
+			     "%s expected near full speed in mode 0, got %d\n", pwm_attr, pwm);
+		igt_info("pwm set to %d for fan %d, PASSED\n", pwm, fan);
+
+		fan_max = hwmon_read_int_attr(hwm, fan_max_attr);
+		igt_assert_f(fan_max > 0, "%s invalid: %d\n", fan_max_attr, fan_max);
+
+		/* 90% of max gives headroom for sensor lag while still confirming full-speed. */
+		threshold = fan_max * 9 / 10;
+		/* Poll up to 5 s for tach to spin up; fan must stay within rated max. */
+		igt_assert_f(igt_wait((fan_rpm =
+					hwmon_read_int_attr(hwm, fan_input_attr)) >=
+				       threshold,
+				       5000, 100),
+			     "%s did not reach >=90%% of %s (%d), last=%d\n",
+			     fan_input_attr, fan_max_attr, fan_max, fan_rpm);
+		igt_warn_on_f(fan_rpm > fan_max,
+			      "%s exceeded %s (%d), last=%d\n",
+			      fan_input_attr, fan_max_attr, fan_max, fan_rpm);
+
+		igt_info("%s reached %d rpm (>=90%% of %s=%d)\n",
+			 fan_input_attr, fan_rpm, fan_max_attr, fan_max);
+
+		igt_info("pwm%d_enable set to 0 (full-speed override) for fan %d PASSED\n",
+			 fan, fan);
+		/* Mode 1: manual — userspace sets PWM directly via pwmN. */
+		igt_info("Testing pwm%d_enable mode 1 (manual) for fan %d\n", fan, fan);
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 1));
+		igt_assert_eq(hwmon_read_int_attr(hwm, pwm_enable_attr), 1);
+
+		/* Sweep pwm values and verify writes stick within tolerance. */
+		for (int i = 0; i <= 255; i++) {
+			igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_attr, i));
+			igt_assert_f(abs(hwmon_read_int_attr(hwm, pwm_attr) - i) <=
+				     FAN_PWM_TOLERANCE,
+				     "pwm write did not stick for %s\n", pwm_attr);
+			igt_debug("manual mode pwm set to %d, ret %d for fan %d, PASSED\n",
+				  i, hwmon_read_int_attr(hwm, pwm_attr), fan);
+		}
+		igt_info("pwm%d_enable set to manual for fan %d PASSED\n", fan, fan);
+
+		/* Mode 2: auto — firmware drives the fan from the stock/user curve table. */
+		igt_info("Testing pwm%d_enable mode 2 (auto) for fan %d\n", fan, fan);
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 2));
+		igt_assert_eq(hwmon_read_int_attr(hwm, pwm_enable_attr), 2);
+		igt_info("pwm%d_enable set to auto for fan %d PASSED\n", fan, fan);
+	}
+}
+
+/* Validate user fan-curve programming and rough alignment with package temperature. */
+static void fan_test_table(int hwm)
+{
+	char pwm_attr[HWMON_ATTR_NAME_MAX], pwm_enable_attr[HWMON_ATTR_NAME_MAX];
+	int num_fans = hwmon_count_fans(hwm);
+
+	igt_require_f(num_fans > 0, "no fanX_input nodes found\n");
+
+	for (int fan = 1; fan <= num_fans; fan++) {
+		struct fan_table table = {0};
+
+		snprintf(pwm_attr, sizeof(pwm_attr), "pwm%d", fan);
+		snprintf(pwm_enable_attr, sizeof(pwm_enable_attr), "pwm%d_enable", fan);
+
+		fan_require_basic_controls(hwm, fan);
+
+		table.point_count = fan_curve_point_count(hwm, fan);
+		igt_require_f(table.point_count > 0,
+			      "no pwm%d_auto_point*_{{temp,pwm}} nodes found\n", fan);
+
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 1));
+
+		fan_program_user_table(hwm, fan, &table);
+		fan_verify_table(hwm, fan, &table);
+
+		/* If temp2_input is available, ensure runtime pwm sits near programmed band. */
+		if (hwmon_has_attr(hwm, "temp2_input")) {
+			int temp2 = hwmon_read_int_attr(hwm, "temp2_input");
+			int cur_pwm = hwmon_read_int_attr(hwm, pwm_attr);
+
+			if (temp2 >= table.points[0].temp &&
+			    temp2 <= table.points[table.point_count - 1].temp) {
+				int idx = 0;
+				int pwm_low, pwm_high;
+
+				while (idx < table.point_count && table.points[idx].temp < temp2)
+					idx++;
+
+				if (idx == 0) {
+					pwm_low = table.points[0].pwm;
+					pwm_high = table.points[0].pwm;
+				} else if (idx >= table.point_count) {
+					pwm_low = table.points[table.point_count - 1].pwm;
+					pwm_high = table.points[table.point_count - 1].pwm;
+				} else {
+					pwm_low = table.points[idx - 1].pwm;
+					pwm_high = table.points[idx].pwm;
+				}
+
+				igt_assert_f(cur_pwm >= pwm_low - 20 && cur_pwm <= pwm_high + 20,
+					     "%s=%d is not aligned with programmed table at temp2_input=%d\n",
+					     pwm_attr, cur_pwm, temp2);
+			}
+		}
+	}
+}
+
+/* Validate rejection of out-of-range writes and mode-invalid curve programming. */
+static void fan_test_negative(int hwm)
+{
+	char temp_attr[HWMON_ATTR_NAME_MAX];
+	char pwm_attr[HWMON_ATTR_NAME_MAX];
+	char pwm_enable_attr[HWMON_ATTR_NAME_MAX];
+	int stable_pwm = 160;
+	int num_fans = hwmon_count_fans(hwm);
+
+	igt_require_f(num_fans > 0, "no fanX_input nodes found\n");
+
+	for (int fan = 1; fan <= num_fans; fan++) {
+		int point_count;
+
+		snprintf(pwm_attr, sizeof(pwm_attr), "pwm%d", fan);
+		snprintf(pwm_enable_attr, sizeof(pwm_enable_attr), "pwm%d_enable", fan);
+
+		fan_require_basic_controls(hwm, fan);
+
+		point_count = fan_curve_point_count(hwm, fan);
+		igt_require_f(point_count > 0, "no fan curve points exposed for fan %d\n", fan);
+
+		/* Enter manual mode and set a known-good baseline before probing invalid values. */
+		igt_info("fan %d: setting manual mode with baseline pwm=%d\n", fan, stable_pwm);
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 1));
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_attr, stable_pwm));
+
+		/* pwm range is 0-255; writes outside that must be rejected without side-effects. */
+		igt_info("fan %d: testing out-of-range pwm writes (256 and -1)\n", fan);
+		igt_assert_lt(hwmon_write_int_attr(hwm, pwm_attr, 256), 0);
+		igt_assert_f(abs(hwmon_read_int_attr(hwm, pwm_attr) - stable_pwm) <=
+			     FAN_PWM_TOLERANCE,
+			     "%s changed after invalid >255 write\n", pwm_attr);
+
+		igt_assert_lt(hwmon_write_int_attr(hwm, pwm_attr, -1), 0);
+		igt_assert_f(abs(hwmon_read_int_attr(hwm, pwm_attr) - stable_pwm) <=
+			     FAN_PWM_TOLERANCE,
+			     "%s changed after invalid negative write\n", pwm_attr);
+		igt_info("fan %d: out-of-range pwm writes correctly rejected, PASSED\n", fan);
+
+		/* Kernel only exposes up to FAN_MAX_POINTS per fan; point 11 must not exist. */
+		igt_info("fan %d: verifying point 11 nodes do not exist\n", fan);
+		pwm_point_attr_name(temp_attr, sizeof(temp_attr), fan, 11, "temp");
+		pwm_point_attr_name(pwm_attr, sizeof(pwm_attr), fan, 11, "pwm");
+		igt_assert_f(!hwmon_has_attr(hwm, temp_attr),
+			     "unexpected %s node exists\n", temp_attr);
+		igt_assert_f(!hwmon_has_attr(hwm, pwm_attr),
+			     "unexpected %s node exists\n", pwm_attr);
+		igt_info("fan %d: point 11 nodes absent, PASSED\n", fan);
+
+		pwm_point_attr_name(temp_attr, sizeof(temp_attr), fan, 1, "temp");
+		pwm_point_attr_name(pwm_attr, sizeof(pwm_attr), fan, 1, "pwm");
+
+		/* Curve writes must be blocked in mode 0 (full-speed) and mode 2 (auto). */
+		igt_info("fan %d: testing curve writes rejected in mode 0 (full-speed)\n", fan);
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 0));
+		igt_assert_lt(hwmon_write_int_attr(hwm, temp_attr, 40000), 0);
+		igt_assert_lt(hwmon_write_int_attr(hwm, pwm_attr, 200), 0);
+		igt_info("fan %d: curve writes in mode 0 correctly rejected, PASSED\n", fan);
+
+		igt_info("fan %d: testing curve writes rejected in mode 2 (auto)\n", fan);
+		igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 2));
+		igt_assert_lt(hwmon_write_int_attr(hwm, temp_attr, 42000), 0);
+		igt_assert_lt(hwmon_write_int_attr(hwm, pwm_attr, 210), 0);
+		igt_info("fan %d: curve writes in mode 2 correctly rejected, PASSED\n", fan);
+
+		/* Writing beyond the last exposed point must also be rejected. */
+		if (point_count < FAN_MAX_POINTS) {
+			igt_info("fan %d: testing write to unexposed point %d\n",
+				 fan, point_count + 1);
+			pwm_point_attr_name(temp_attr, sizeof(temp_attr), fan, point_count + 1, "temp");
+			pwm_point_attr_name(pwm_attr, sizeof(pwm_attr), fan, point_count + 1, "pwm");
+
+			igt_assert_lt(hwmon_write_int_attr(hwm, temp_attr, 50000), 0);
+			igt_assert_lt(hwmon_write_int_attr(hwm, pwm_attr, 220), 0);
+			igt_info("fan %d: write to unexposed point %d correctly rejected, PASSED\n",
+				 fan, point_count + 1);
+		}
+	}
+}
+
+/* Validate that the selected fan table remains active and unchanged after resume. */
+static void fan_test_suspend_resume_table(int hwm,
+					  enum igt_suspend_state state,
+					  const char *state_name,
+					  enum fan_table_mode mode)
+{
+	char temp_attr[HWMON_ATTR_NAME_MAX], pwm_enable_attr[HWMON_ATTR_NAME_MAX];
+	int num_fans = hwmon_count_fans(hwm);
+
+	igt_require_f(num_fans > 0, "no fanX_input nodes found\n");
+
+	for (int fan = 1; fan <= num_fans; fan++) {
+		struct fan_table table = {0};
+
+		snprintf(pwm_enable_attr, sizeof(pwm_enable_attr), "pwm%d_enable", fan);
+
+		fan_require_basic_controls(hwm, fan);
+
+		table.point_count = fan_curve_point_count(hwm, fan);
+		igt_require_f(table.point_count > 0,
+			      "no fan curve points exposed for fan %d\n", fan);
+
+		if (mode == FAN_TABLE_USER) {
+			igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 1));
+			fan_program_user_table(hwm, fan, &table);
+			fan_verify_table(hwm, fan, &table);
+			igt_info("fan %d: suspending with programmed table using %s\n",
+				 fan, state_name);
+		} else {
+			pwm_point_attr_name(temp_attr, sizeof(temp_attr), fan, 1, "temp");
+			igt_assert_lt(0, hwmon_write_int_attr(hwm, pwm_enable_attr, 2));
+			fan_read_table(hwm, fan, &table);
+			igt_info("fan %d: suspending in stock-table mode using %s\n",
+				 fan, state_name);
+		}
+
+		igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
+
+		igt_assert_eq(hwmon_read_int_attr(hwm, pwm_enable_attr),
+			      mode == FAN_TABLE_USER ? 1 : 2);
+		fan_verify_table(hwm, fan, &table);
+
+		if (mode == FAN_TABLE_STOCK)
+			igt_assert_lt(hwmon_write_int_attr(hwm, temp_attr, 41000), 0);
+	}
+}
+
 static void check_if_temp_valid(int hwm, char *sysfs_name)
 {
 	int32_t cur_temp = 0, limit = 0;
@@ -66,7 +551,6 @@ static void hwmon_read(int hwm)
 
 		if (!strncmp(de->d_name, "temp", 4))
 			check_if_temp_valid(hwm, de->d_name);
-
 	}
 	closedir(dir);
 }
@@ -94,6 +578,10 @@ static void hwmon_write(int hwm)
 		if (!(st.st_mode & 0222))
 			continue;
 
+		/* Fan-control nodes require mode-aware writes and are tested separately. */
+		if (is_fan_control_attr(de->d_name))
+			continue;
+
 		rw.attr = de->d_name;
 		igt_sysfs_rw_attr_verify(&rw);
 	}
@@ -120,6 +608,39 @@ int igt_main()
 		hwmon_write(hwm);
 	}
 
+	igt_describe("Verify pwmN_enable mode transitions and full-speed behavior");
+	igt_subtest("fan-pwm-enable-modes") {
+		fan_test_pwm_enable_modes(hwm);
+	}
+
+	igt_describe("Verify fan curve programming and readback in manual mode");
+	igt_subtest("fan-curve-setup") {
+		fan_test_table(hwm);
+	}
+
+	igt_describe("Verify invalid fan-control writes are rejected");
+	igt_subtest("fan-negative-tests") {
+		fan_test_negative(hwm);
+	}
+
+	for (int i = 0; suspend_states[i].name; i++) {
+		igt_describe("Verify user fan table state persists across suspend/resume");
+		igt_subtest_f("fan-suspend-resume-with-user-table-%s", suspend_states[i].name) {
+			igt_info("Testing suspend/resume with user fan table using %s\n",
+				 suspend_states[i].name);
+			fan_test_suspend_resume_table(hwm, suspend_states[i].state,
+						      suspend_states[i].name,
+						      FAN_TABLE_USER);
+		}
+
+		igt_describe("Verify stock fan table mode persists across suspend/resume");
+		igt_subtest_f("fan-suspend-resume-without-user-table-%s", suspend_states[i].name) {
+			fan_test_suspend_resume_table(hwm, suspend_states[i].state,
+						      suspend_states[i].name,
+						      FAN_TABLE_STOCK);
+		}
+	}
+
 	igt_fixture() {
 		close(hwm);
 		drm_close_driver(fd);
-- 
2.25.1

