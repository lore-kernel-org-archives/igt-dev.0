Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64397CD6E6B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 07:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120BE11A4E0;
	Fri,  5 Jun 2026 07:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSKxhwUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F24911A4DC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 07:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780643570; x=1812179570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iAiXQkbfIwHTYZHFaMUrHBIGoVc4n//4StQMQAmTEGI=;
 b=HSKxhwUBOiV7M1fXb039qMsh5TM/Aa5oqy1v3Szo9ENpspJsYyU2NEY8
 kgVI6Ealex8zbhv0LvVIfd/++rp6o+kd3sTxDBJIXMoLlzI+f74eYIX4Z
 DI+jtzz26QJ6vAaeW/UGxRDpOt3e2l2/MogiLLNmiIShZb/4BuxhsOknu
 9kfKtuYR9L4uAHUZgl/jp2LjJ5A9w5MnvDCt+BTVIz5AqVXLTWWc7S+xk
 PXGGj4ZLo1IOO+1Jtsp3cdUcAMyfSYE1gnbqMx1S0DlYYzoSQIQv2vXZt
 7DpbxIdlLUDt/F6yNB/aoU2izLQcKjx2Rspf9bkoDVBhMSamxj8HDnqYZ w==;
X-CSE-ConnectionGUID: yMPfjpYtTr6Bk63a7KxGjA==
X-CSE-MsgGUID: M3KEC1+0SCaYTaxPZX9W4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85328300"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="85328300"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 00:12:50 -0700
X-CSE-ConnectionGUID: dxmBHJgtT1Ow0t/ALU/T1w==
X-CSE-MsgGUID: EcfBQiBqSgCFL6h7WyvUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="240319002"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2026 00:12:49 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Date: Fri,  5 Jun 2026 12:32:34 +0530
Message-ID: <20260605070235.42439-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605070235.42439-1-mohammed.thasleem@intel.com>
References: <20260605070235.42439-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 249d9e11a..b97cac7fb 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -80,6 +80,9 @@
  *
  * SUBTEST: dc5-dpms-suspend-resume
  * Description: This test validates DC5 state entry before and after a suspend/resume cycle using DPMS
+ *
+ * SUBTEST: dc5-psr-suspend-resume
+ * Description: This test validates DC5 state entry while PSR is active before and after a suspend/resume cycle
  */
 
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
@@ -632,6 +635,13 @@ static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag)
 	test_dc_state_dpms(data, dc_flag);
 }
 
+static void test_dc5_psr_suspend_resume(data_t *data, int dc_flag)
+{
+	test_dc_state_psr(data, dc_flag);
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	test_dc_state_psr(data, dc_flag);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -758,6 +768,17 @@ int igt_main()
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

