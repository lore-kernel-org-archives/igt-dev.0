Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86E8CD4F26
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 06:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6493010E495;
	Tue, 23 Jun 2026 06:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nliegYlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D1310E495
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 06:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782196570; x=1813732570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jlp2WbbmEPICqKwTdy38y7YfI6Pn40uc+mfalZxmg6s=;
 b=nliegYlvYL4/kCWFGA3Tk4g2LsDw9VCCSibnf+Xxkd/yX/5o++WXGA2L
 IjK4Hkqx1F97mdeOuxwMEEpkUzo6HEGQXnFZ4rrxGVbH9OF5SJEbdoIRg
 O2ERxvHPTsynvJHCf21WscqnHpxUwkLHOq1WGctQqEsEuMPLSNbyH2FAz
 Mluby5Exxfis4uKb8holUGABqIu0RaX/y3zetaDx8CPprEmCysb4jIoXs
 XJcTTmf3N5UEeiPioVYXLdK3OwmD763etvWsh44cyGluk8CG7S5B7oF8r
 6vnZpBtJnHGwKeUD6ZaEE0j3xJXt4w5uc8QLGwSqsDkR6pjkF/7iQcSn3 g==;
X-CSE-ConnectionGUID: DRkKnOdOSTiynPTfmIoCrg==
X-CSE-MsgGUID: rM2tSN9wTqOi5o9L6+27tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93295373"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="93295373"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 23:36:10 -0700
X-CSE-ConnectionGUID: XkACX+MyRE2p7TG4JYHXJQ==
X-CSE-MsgGUID: l6iHV3kbT0GX1ib1/S5eLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="245295984"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.72.118])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 23:36:08 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 igt-dev@lists.freedesktop.org
Cc: dwarakanath.ramadeva@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH i-g-t] tests/intel: ensure stable GT C6 for residency
 measurement
Date: Tue, 23 Jun 2026 06:36:00 +0000
Message-ID: <20260623063559.223470-2-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Wait for the GT to remain in C6 continuously before taking idle
residency measurements to avoid capturing transient C6 entries caused by
asynchronous register accesses (for example, from in-flight modeset
commits). Add a helper `xe_gt_wait_stable_c6(fd, gt, stable_ms, timeout_ms)`
that polls the GT and requires `stable_ms` of continuous C6 within the
`timeout_ms` window.

Update `test_idle_residency()` to use the new helper and require 300ms
continuous C6 (2s timeout) before starting the residency baseline. This
reduces flaky/residual measurements and makes the test more robust.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 tests/intel/xe_pm_residency.c | 41 ++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index bfae1f844..7a8e11eae 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -212,12 +212,51 @@ static unsigned long read_idle_residency(int fd, int gt)
 	return residency;
 }

+/*
+ * xe_gt_wait_stable_c6 - wait until the GT is stable in C6
+ *
+ * Waits for the GT to stay in C6 continuously for @stable_ms to ensure
+ * genuine idle state before capturing residency baseline. This filters
+ * out brief C6 entries that occur during register accesses from async
+ * operations like modeset commits.
+ *
+ * Returns true if GT stayed in C6 for @stable_ms, false if timeout reached.
+ */
+
+static bool xe_gt_wait_stable_c6(int fd, int gt, int stable_ms, int timeout_ms)
+{
+	int stable = 0;
+	int elapsed = 0;
+	const int step = 10; /* ms */
+
+	while (elapsed < timeout_ms) {
+		usleep(step * USEC_PER_MSEC);
+		elapsed += step;
+		if (xe_gt_is_in_c6(fd, gt)) {
+			stable += step;
+			if (stable >= stable_ms)
+				return true;
+		} else {
+			stable = 0;
+		}
+	}
+	return false;
+}
+
 static void test_idle_residency(int fd, int gt, enum test_type flag)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
 	struct timespec ts_start, ts_end;

-	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
+	/*
+	 * Wait for stable C6 state before measurement. Previous test cleanup
+	 * can trigger async modeset commits that access GT registers for
+	 * extended periods, causing brief C6 entries. Requiring 300ms continuous
+	 * C6 ensures any in-flight operations complete first.
+	 */
+
+	igt_assert_f(xe_gt_wait_stable_c6(fd, gt, 300, 2000),
+		     "GT %d did not reach stable C6 within 2s\n", gt);

 	if (flag == TEST_S2IDLE) {
 		clock_gettime(CLOCK_BOOTTIME, &ts_start);
--
2.43.0

