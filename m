Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33B1107761F
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 21:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D93110E479;
	Wed, 18 Mar 2026 21:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNfdGuS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA5D10E452
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 21:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773871091; x=1805407091;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=ZiXyv0aQM/qYCRftbkYX32u9bLjIvMnqjjER4uJxyjs=;
 b=eNfdGuS9enlo96qBtUqYxlg5Gm+KNUPj7VoW6fbJXzsDnu9qrb7kUsi9
 8VrlyEU3zwU+sx8GIUcdz567xpKm7EgcvHbPwgCaV8txawKeweng4m0jj
 BYOTDQx62orig2ayqa/Lhr/vHgla11dMf6lL7SViqTy8PwO/EIl3gIbLV
 6JH3fJcST25IZU2wjUj53NkZxE+kFilSCpEcezlXrrOojoxI5B7mPtTtb
 GN7pyaJIoT3l5kma2v1SB0s8MXAxQ3h2C1mH5XNLwyxinIQPhxNIG4RVv
 8E5+s/gX7JwwRT2YNDkibpkfH9AzVeWFo7GF5bEw5e+q0TPTFtKJhDVLj A==;
X-CSE-ConnectionGUID: yMTMCA0mTSaVzGjsDkVFHw==
X-CSE-MsgGUID: Avfa/MTuSsiFx2cw8Rux6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86417548"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="86417548"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 14:58:11 -0700
X-CSE-ConnectionGUID: 79byE5/BSxy+pvVbWYe5eA==
X-CSE-MsgGUID: s3o7wgldR1ywC8fP7HdH6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="218738751"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 14:58:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 18 Mar 2026 14:57:51 -0700
Subject: [PATCH i-g-t] tests/intel/xe_reg_sr_check: Add test for reg_sr
 programming failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-reg_sr_check-v1-1-845d09d27bd1@intel.com>
X-B4-Tracking: v=1; b=H4sIAN8fu2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mj3aLU9PjiovjkjNTkbF1L09S0ZBMjE4skUxMloJaCotS0zAqwcdG
 xtbUAiaFnhl4AAAA=
X-Change-ID: 20260312-reg_sr_check-95efc4248b54
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5503;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=ZiXyv0aQM/qYCRftbkYX32u9bLjIvMnqjjER4uJxyjs=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpux/yaIwCEUy5re3N+69i6X83ES/lK5u6Qx0K/
 mefPByUg6OJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCabsf8gAKCRBNeSQFyHKQ
 BOCfEACfqHoZE1dzLuUmQZBXJD0WTG3oXZYsesHzjMu6doKVaNiEoX1xtEcLHSbF3DkXdS7+zAb
 Bn1tSDHrwK9d7Buibco9PFl/DGhAOaQTIxsPVwkwkRN3P+YUDlJ0CmpyP7b3yIsnfPKxilg4RTt
 DN7rdZ4FAyov8XrFUprghm4PNgW/dAFCZLzoRlQI1hV1niOUX1mdIJ1i27Y6pLOQCS8zW+dKjEw
 r304cROKTm6gIduxPKvzSVcwaSjYMG5fa+UYQVWvZQ/NzQp6cXRz7g0XW0Ri0MrqFT+KAPqmE1v
 b/g+U8D1E+p6fl2fe3Jwey05/9btpLvHJZi0lIwh/EfO0c/Ukwqwd1KeG6k1QgI5g/diBrmYNab
 tHM9NAltCNByTUSSIAqq73OoE8SAFlTKu4S8l5j8YPRXtXb01yI07y4xe50qdxdLMvy5lV0ENU0
 AmXF7R/PgU8wO68MUnJfKtuPNwDscSOTP5cW/M3Kiyb/s8oLJ/NNohFPEWldJ8A9rLQnz5JaevP
 xyKBM/V29J9Ro2z5OooYJ2G3mgwlcCanj1+zDgQQ7/KiK8xVlaWu9qr7GkHex5A3tYpEafW5+Qo
 iHqqR2HNEsG0+Ipx+QH7Q+gcs6RXxJ6MTNQwUd2b3p1LkU9XfCPdB193nvfxm7s79YhaC7GoQ8m
 lEQiv+6h8LzbPpA==
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
 tests/intel/xe_reg_sr_check.c | 91 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build             |  1 +
 2 files changed, 92 insertions(+)

diff --git a/tests/intel/xe_reg_sr_check.c b/tests/intel/xe_reg_sr_check.c
new file mode 100644
index 0000000000000000000000000000000000000000..a5f0bbd7796b05559c373f13fc7380d5e19ac1b9
--- /dev/null
+++ b/tests/intel/xe_reg_sr_check.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: Register save-restore persistence
+ * Description:
+ *   Test whether the register programming specified by the kernel's
+ *   register save/restore (reg_sr) lists are still in effect.  If the current
+ *   value of a hardware register (or the value of a register recorded in the
+ *   default LRC in case of the LRC reg_sr) does not reflect the expected
+ *   values, this may indicate a bug in the Xe driver (e.g., attempted register
+ *   programming is not possible, or register was added to the wrong reg_sr
+ *   list) or may reveal a defect in firmware/hardware (e.g., register is
+ *   incorrectly losing its value at unexpected times, or MMIO readout of the
+ *   register is broken).
+ *
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Debugging
+ *
+ * SUBTEST: check-gt
+ * Description: Check the reg_sr list associated with GTs for missing reg values
+ */
+
+/*
+ * A small number of reg_sr programming mismatches are expected and not
+ * indicative of hardware/software problems.
+ */
+static const unsigned long exceptions[] = {
+	/* GUC_INTR_CHICKEN_GUC_REG: GuC takes ownership after initial programming */
+	0xC50C,
+};
+
+static void check_gt(int fd, int gt)
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
+		for (int ex = 0; ex < ARRAY_SIZE(exceptions); ex++) {
+			if (offset == exceptions[ex]) {
+				igt_info("Mismatch on %#lx is not a problem\n");
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
+int igt_main()
+{
+	int fd, gt;
+
+	igt_fixture() {
+		fd = drm_open_driver_master(DRIVER_XE);
+		igt_require(fd >= 0);
+	}
+
+	igt_subtest_with_dynamic("check-gt")
+		xe_for_each_gt(fd, gt)
+			igt_dynamic_f("gt%d", gt)
+				check_gt(fd, gt);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 7e0359a9dc554c4b91c01b9fada4605f76ede515..658f10630e3199c8b15223d9bb928cdcee216e7c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -329,6 +329,7 @@ intel_xe_progs = [
 	'xe_prime_self_import',
 	'xe_pxp',
 	'xe_query',
+	'xe_reg_sr_check',
 	'xe_render_copy',
 	'xe_vm',
 	'xe_waitfence',

---
base-commit: 4c8773922f643932cc017ba94d164d2b9d3dd546
change-id: 20260312-reg_sr_check-95efc4248b54

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

