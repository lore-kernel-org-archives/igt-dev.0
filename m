Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A74FEC0FC
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 21:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3467910E072;
	Tue, 24 Mar 2026 21:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8krw1nH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E099210E072
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774386691; x=1805922691;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=kZGJxuFyaj7Kve20zsEynoV8OQeTOjfR/rd5OapW5Qo=;
 b=f8krw1nHQbwX2MWTS8hdYacdE/lEFgK+/kIVjCp9otvWFqHIF93Gyqez
 kQkDSZukaMHHbUQGUY7DW0c8hugsE0teT5NUabK8TgGQbQjUbhoxeYiS0
 jUYvFmnzPNa33t+kyrfI0Wx8iCusUNOQm7y3AhZya2vAPaKUQpH4zy1jw
 JEy1FK1uAs1BFjEe/F3/soSL+ThyNHLZTfoFUAgzTfyJU5zn6ru6yyhuq
 KvepfNQKCDDqtamZsTXdT7MwuRP+dTYun1alz8Hf5PpG8ud9+yuu7Bwxr
 eRpe/kG+B3AQfdubzZCwdj1t+REr8rHCJqYPAlYFlKEUIguSkJMyyM0k3 g==;
X-CSE-ConnectionGUID: YQpN4m6pTymVNS36dFgv9g==
X-CSE-MsgGUID: vetsn1p1RPiYctJhvvBUJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86891137"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86891137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 14:11:30 -0700
X-CSE-ConnectionGUID: 1RL0PTlUQwunZjfKUyJoYg==
X-CSE-MsgGUID: pSmAkOGwT/a4/pFuyIB+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="221579244"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 14:11:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 24 Mar 2026 14:11:16 -0700
Subject: [PATCH i-g-t v2] tests/intel/xe_debugfs: Add subtest for reg_sr
 programming failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-reg_sr_check-v2-1-7206032f6b26@intel.com>
X-B4-Tracking: v=1; b=H4sIAPT9wmkC/1XM0QrCIBTG8VcZ5zpDTct11XvEGE3P5qE2Q4cUY
 ++eDbro8v/B91sgYSRMcK4WiJgpUZhKyF0F1t+mARm50iC5PPKDkCzi0KbYWo/2zmqNvVVSmU4
 rKJdnxJ5eG3dtSntKc4jvTc/iu/4g8w9lwQQzSjteO3nqnLjQNONjb8MIzbquH8XYI26oAAAA
X-Change-ID: 20260312-reg_sr_check-95efc4248b54
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4988;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=kZGJxuFyaj7Kve20zsEynoV8OQeTOjfR/rd5OapW5Qo=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpwv4C3sDqUAlnfUEjczMPrk9CFxvAiIaJWiFWx
 xN1BR69PiuJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCacL+AgAKCRBNeSQFyHKQ
 BFauD/48oGXvye47nwj9e77sZRrGYMNsvcQk/OY7XNzrxW7RQc0AqsPouoATX/x5Mz6D6MUWWM+
 rSob/ocXPlStKTP7N+0wA8I7ql9LKKL5Xs1NHekwArNHng2fL4lgzyCVTdy3IEDI5fnPWglo/jI
 CjI7IXbLjKYDOOpf/KPzvaABb+lU3m8s4c7cwGVBKyjOqaLlZkWIIphkHr5k3xMecxlNVY7K/E5
 dyK10ToUUkga9NOH22BIwjPBnkBE0z5xZhYIIGEUxe4foY2En+VAdM4MYrFokGJHTRBT6Bsq6FW
 JBhMJSgOk50Q6br5LkzCR8C8+OUCYHuiMv0JjUvmVhSORlpaz9Zr5GkITb9PFlNHV7/y/KRqRNy
 AzaaoT19JRamgbRSfOp1O1iMA3uvGmThSMcagd46JnhvWu7cPQ796RXE54uVm4nVCX5dVYrbROw
 UsIOreMTgGVJYqg00jLdGiPqExXG0wTQyOQ1+JsIDjIFBxn34GlnO/BBFFOQzJOfxeTElO5sGOK
 GCbB7ekZioqRJNLIy3zA5sUpv1iahN2k4xatoOzYc1gpwDuCFGAOmNbMMyF0xPuUFuAi+NXzxqO
 kHcrRK0OI/BlNtDO+TOuRzNoFubMPTS/CX0cm23qXb64TtLdwqvITfggG9p8gkhHsiOHCCwSqkM
 4T/lMOeuv9E/ylA==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The kernel provides a 'register-save-restore-check' debugfs entry that
allows developers to easily check and see whether any of the driver's
'register save/restore' (reg_sr) programming is no longer in effect.
Wrap a simple IGT test around this debugfs entry so that CI can help
flag any unexpected changes via a dedicated test.

Note that we're intentionally avoiding i915's approach of having the
driver do immediate readback and verification of workaround/tuning
programming.  That wound up being very problematic since any programming
failure (even benign/expected failures) would show up as a problem on
driver probe, and CI would treat that as a fatal error and refuse to run
any other tests.

At the moment this test will already report gt0 failures on some Xe2
platforms (specifically for workaround registers 0xb104, 0xb108, and
0xb158) --- this reflects a legitimate kernel bug that's been root
caused to incorrect bspec documentation about MCR register steering
(fortunately the bug only affects the register readback used for
verification; the actual programming did indeed reach the hardware as
expected in this case).  The fix for that failure will be implemented in
the kernel once the necessary hardware documentation is available, at
which point this test should start passing on those platforms.

At the moment there's an "exception" list containing one register
(GUC_INTR_CHICKEN_GUC_REG) which is expected to show up in the debugfs
entry.  This is a case where once the KMD completes its initial
programming, ownership of the register transfers to an external agent
(the GuC firmware) and further changes to its value are legitimate and
not indicative of any hardware or software problem.  Other exceptions
may show up in the future, either due to cases where ownership of a
register transfers, or cases where reg_sr programming targets "write
only" registers that are expected to not read back properly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Changes in v2:
- Moved subtest to xe_debugfs. (Kamil)
- Add missing parameter to igt_info().
- Link to v1: https://lore.kernel.org/r/20260318-reg_sr_check-v1-1-845d09d27bd1@intel.com
---
 tests/intel/xe_debugfs.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 7fc4a3cbec4b925a40a37a18a5ebd256ba927e0f..587e3e785f6782317f4555035ca59dee060d82ef 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -28,6 +28,8 @@ struct {
  * Feature: core
  * Test category: uapi
  *
+ * SUBTEST: check-gt-reg-sr
+ * Description: Check the reg_sr list associated with GTs for missing reg values
  */
 
 IGT_TEST_DESCRIPTION("Validate Xe debugfs devnodes and their contents");
@@ -365,6 +367,50 @@ static void test_info_read(struct xe_device *xe_dev)
 
 }
 
+/*
+ * A small number of reg_sr programming mismatches are expected and not
+ * indicative of hardware/software problems.
+ */
+static const unsigned long reg_sr_exceptions[] = {
+	/* GUC_INTR_CHICKEN_GUC_REG: GuC takes ownership after initial programming */
+	0xC50C,
+};
+
+static void check_gt_reg_sr(int fd, int gt)
+{
+	char buf[1024];
+	int debugfs_fd;
+	FILE *file;
+	int problems = 0;
+
+	debugfs_fd = igt_debugfs_gt_open(fd, gt, "register-save-restore-check",
+					 O_RDONLY);
+	igt_require(debugfs_fd);
+	file = fdopen(debugfs_fd, "r");
+	while (fgets(buf, sizeof(buf), file) != NULL) {
+		unsigned long offset = strtoul(buf, NULL, 16);
+		bool ok = false;
+
+		for (int ex = 0; ex < ARRAY_SIZE(reg_sr_exceptions); ex++) {
+			if (offset == reg_sr_exceptions[ex]) {
+				igt_info("Mismatch on %#lx is not a problem\n", offset);
+				ok = true;
+				break;
+			}
+		}
+
+		if (!ok) {
+			igt_warn("Mismatch on %#lx, Driver reports: %s", offset, buf);
+			problems++;
+		}
+	}
+
+	fclose(file);
+	close(debugfs_fd);
+
+	igt_assert_eq(problems, 0);
+}
+
 const char *help_str =
 	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
 
@@ -390,7 +436,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct xe_device *xe_dev;
 	unsigned int t;
-	int fd = -1;
+	int fd = -1, gt;
 
 	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_XE);
@@ -412,6 +458,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_describe("Check info debugfs devnode contents.");
 	igt_subtest("info-read")
 		test_info_read(xe_dev);
+
+	igt_subtest_with_dynamic("check-gt-reg-sr")
+		xe_for_each_gt(fd, gt)
+			igt_dynamic_f("gt%d", gt)
+				check_gt_reg_sr(fd, gt);
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}

---
base-commit: 4c8773922f643932cc017ba94d164d2b9d3dd546
change-id: 20260312-reg_sr_check-95efc4248b54

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

