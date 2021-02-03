Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BA86EA4C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 10:18:57 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  3 Feb 2021 15:33:09 +0530
Message-Id: <20210203100310.19441-4-anshuman.gupta@intel.com>
In-Reply-To: <20210203100310.19441-1-anshuman.gupta@intel.com>
References: <20210203100310.19441-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 3/4] i915/i915_pm_rpm: Add PC10 display
 off test
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
Cc: rodrigo.vivi@intel.com, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

Add a test to validate PC10 residencies while all output's
display is off.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index a33cc27a..c03bf2fb 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -179,6 +179,16 @@ static bool pc8_plus_residency_changed(unsigned int timeout_sec)
 			timeout_sec * 1000, 100);
 }
 
+static bool pc10_residency_changed(unsigned int timeout_sec)
+{
+	uint64_t res_pc10;
+
+	res_pc10 = get_residency(MSR_PC10_RES);
+
+	return igt_wait(res_pc10 != get_residency(MSR_PC10_RES),
+			timeout_sec * 1000, 100);
+}
+
 static enum pc8_status get_pc8_status(void)
 {
 	ssize_t n_read;
@@ -855,6 +865,19 @@ static void pc8_residency_subtest(bool display_on)
 	}
 }
 
+static void pc10_residency_subtest(bool display_on)
+{
+	igt_require(has_pc8);
+	igt_require(AT_LEAST_GEN(ms_data.devid, 9));
+
+	if (!display_on) {
+		/* Make sure PC10 residencies move! */
+		disable_all_screens_and_wait(&ms_data);
+		igt_assert_f(pc10_residency_changed(30),
+			     "Machine is not reaching PC10 state with all screens disabled.\n");
+	}
+}
+
 static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
 {
 	int i;
@@ -2089,6 +2112,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		pc8_residency_subtest(true);
 	igt_subtest("pc8-residency-display-off")
 		pc8_residency_subtest(false);
+	igt_subtest("pc10-residency-display-off")
+		pc10_residency_subtest(false);
 	igt_subtest("debugfs-read")
 		debugfs_read_subtest();
 	igt_subtest("debugfs-forcewake-user")
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
