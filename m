Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741466EACA
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 16:22:00 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  9 Dec 2020 21:36:38 +0530
Message-Id: <20201209160642.6317-3-anshuman.gupta@intel.com>
In-Reply-To: <20201209160642.6317-1-anshuman.gupta@intel.com>
References: <20201209160642.6317-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/6] i915/i915_pm_rpm.c: create PC state
 subtest group
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

Create a separate igt test group and move package C
state in to this subgroup.
Run powertop --auto-tune to tune SOC power configuration
for package C state tests.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index af55b569..42bc44d9 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -832,6 +832,25 @@ static void basic_subtest(void)
 	/* XXX Also we can test wake up via exec nop */
 }
 
+static bool setup_powertop(void)
+{
+	FILE *fp;
+	char tmp[512];
+
+	fp = popen("powertop --auto-tune", "r");
+	if (fp == NULL) {
+		igt_info("Failed to run powertop\n");
+		perror("popen");
+		return false;
+	}
+
+	while (fgets(tmp, sizeof(tmp), fp) != NULL)
+		igt_info("%s\n", tmp);
+
+	pclose(fp);
+	return true;
+}
+
 static void pc8_residency_subtest(bool display_on)
 {
 	igt_require(has_pc8);
@@ -2082,15 +2101,23 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("universal-planes-dpms")
 		planes_subtest(true, true);
 
+	igt_describe("package C state residency test");
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(setup_powertop());
+		}
+
+		igt_subtest("pc8-residency-display-on")
+			pc8_residency_subtest(true);
+		igt_subtest("pc8-residency-display-off")
+			pc8_residency_subtest(false);
+	}
+
 	/* Misc */
 	igt_subtest("reg-read-ioctl")
 		reg_read_ioctl_subtest();
 	igt_subtest("i2c")
 		i2c_subtest();
-	igt_subtest("pc8-residency-display-on")
-		pc8_residency_subtest(true);
-	igt_subtest("pc8-residency-display-off")
-		pc8_residency_subtest(false);
 	igt_subtest("debugfs-read")
 		debugfs_read_subtest();
 	igt_subtest("debugfs-forcewake-user")
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
