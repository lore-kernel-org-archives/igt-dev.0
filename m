Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED25BD2D0FE
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 13:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C38710E4DB;
	Tue, 13 Jan 2026 13:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7WJ9lf5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FC510E33B
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768311083; x=1799847083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ii0Ox+WHElLkWdAF7KDvsDztOZXHfX8HhQ1jOXv4qcs=;
 b=U7WJ9lf5bwHzYLGy/2CrDB2Ais72qS1fpY6qhHDXPDXyA3XQ7uvhShmI
 2/89Romy5C68D9K6D0Ye9exj0dfhFRZLPJjkovKu9L4lwzjfLqmJLzG5D
 SVJ8y1P5CTDuYBP2NdxskBE5mithdljEFHxBM77j10fv+cmSt9QPTDHxN
 sC8mjURp0vkLiNx99NCXO8W8vUYQyPryGJVDMPCAQ8jzAtOSdn2GCbIVF
 HgWP8zKAqjT1W4IhKtniEWWmt1PUNjnxp0FMAWRqA3mz3o52A6ksrpNUD
 lpoPRSPQL0BV6milHLp3FYIXt01yBzB+4i8fz3QqBtN81CJlmjZAb+YxB g==;
X-CSE-ConnectionGUID: ShLZ/wx8RNC/KWZrmKbFoQ==
X-CSE-MsgGUID: siNAYTvUTyWVx2IeFunxNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69752843"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69752843"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 05:31:23 -0800
X-CSE-ConnectionGUID: fII+FAuzQNunepLvtgngng==
X-CSE-MsgGUID: 1IgSYeMVTDqcnLhCn25lKg==
X-ExtLoop1: 1
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.70])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 05:31:21 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Date: Tue, 13 Jan 2026 18:56:39 +0530
Message-Id: <20260113132639.13411-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113132639.13411-1-mohammed.thasleem@intel.com>
References: <20260113132639.13411-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index ba00fd96a..fc23f3207 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -80,6 +80,10 @@
  *
  * SUBTEST: dc5-dpms-suspend-resume
  * Description: This test validate DC5 state entry before and after suspend/resume cycle using DPMS
+ *
+ * SUBTEST: dc5-psr-suspend-resume
+ * Description: This test validates display engine entry to DC5 state while PSR is active
+ *               before and after respend/resume cycle
  */
 
 /* DC State Flags */
@@ -732,6 +736,13 @@ static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag)
 
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
@@ -857,6 +868,15 @@ int igt_main()
 	igt_subtest("dc5-dpms-suspend-resume")
 		test_dc5_dpms_suspend_resume(&data, CHECK_DC5);
 
+	igt_describe("This test validates display engine entry to DC5 state "
+		     "while PSR is active before and after suspend/resume cycle");
+	igt_subtest("dc5-psr-suspend-resume") {
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_1, NULL));
+		data.op_psr_mode = PSR_MODE_1;
+		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
+		test_dc5_psr_suspend_resume(&data, CHECK_DC5);
+	}
 
 	igt_fixture() {
 		free(data.debugfs_dump);
-- 
2.25.1

