Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639E2CD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 07:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D0F10E762;
	Wed, 10 Jun 2026 07:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0AUzQVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B3710E754
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781075576; x=1812611576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=upLksLnHQMicRKdcGIl1K2E+vhpCR9yeTiE37EoDaKM=;
 b=A0AUzQVcfoqKhQCZ9+d34/+tF43gfSpReYaZ7BpMHsnyKatmD1XzuoVt
 zAFKSjggJTGBx7MBEzZLbtUbV7kQRaFXtOrTpnuyzAEWvvFcLyqwOrYy3
 s9TPhLlQqzx+KyR+oYSB3tWdx9fniPqyAC1fJBfA3Nua65pujm1lskk3S
 aX/CrXCgb1BAkbyUXvjZzxK5OzNS6juD0mm8wM1iIcUMsbjTt+ZfMuoxl
 s1g1Y3YzGggb/EMS1ALlLmppixIDSeESYb7XliJkvmT+lCTDO8a3JeDrI
 pZH5hL/rxUih9t66z0Q3Jez/PyNgAkKqxhZ7GYfLEwfd/G2pbwpo7L7L7 Q==;
X-CSE-ConnectionGUID: HVB+i5hjS0u5m0In8Ua20w==
X-CSE-MsgGUID: s6wZ15ypSvCdfQyxVg3kqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92180158"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92180158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:12:55 -0700
X-CSE-ConnectionGUID: jgwOkPW8TlWcd7O3QQrl+Q==
X-CSE-MsgGUID: jieVcXMJQtCmvrj2RbTkog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251167528"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2026 00:12:54 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH v4 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Date: Wed, 10 Jun 2026 12:32:53 +0530
Message-ID: <20260610070253.25329-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610070253.25329-1-mohammed.thasleem@intel.com>
References: <20260610070253.25329-1-mohammed.thasleem@intel.com>
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

This test validates display engine entry to DC5 state while PSR is active,
performs suspend/resume cycle, and verifies DC5 entry is restored after
resume.

v2: Update test description and psr cleanup. (Jeevan)
v3: Add igt_info log during test cycle. (Jeevan)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 521521196..2e7e4af92 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -83,6 +83,9 @@
  *
  * SUBTEST: dc5-dpms-suspend-resume
  * Description: This test validates DC5 state entry before and after a suspend/resume cycle using DPMS
+ *
+ * SUBTEST: dc5-psr-suspend-resume
+ * Description: This test validates DC5 state entry while PSR is active before and after a suspend/resume cycle
  */
 
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
@@ -683,6 +686,18 @@ static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag)
 	test_dc_state_dpms(data, dc_flag);
 }
 
+static void test_dc5_psr_suspend_resume(data_t *data, int dc_flag)
+{
+	igt_info("Testing DC5 state before suspend\n");
+	test_dc_state_psr(data, dc_flag);
+
+	igt_info("Starting suspend/resume cycle\n");
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_info("Testing DC5 state after resume\n");
+	test_dc_state_psr(data, dc_flag);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -821,6 +836,17 @@ int igt_main()
 	igt_subtest("dc5-dpms-suspend-resume")
 		test_dc5_dpms_suspend_resume(&data, IGT_INTEL_CHECK_DC5);
 
+	igt_describe("This test validates DC5 state entry while PSR is active "
+		     "before and after a suspend/resume cycle");
+	igt_subtest("dc5-psr-suspend-resume") {
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_1, NULL));
+		data.op_psr_mode = PSR_MODE_1;
+		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
+		test_dc5_psr_suspend_resume(&data, IGT_INTEL_CHECK_DC5);
+		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
+	}
+
 	igt_fixture() {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
-- 
2.43.0

