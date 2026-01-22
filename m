Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EAAD6CFA3
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 18:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CB910EA3A;
	Thu, 22 Jan 2026 18:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZCbVamdW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCB410EA3A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769106431; x=1800642431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y1YZFBY7lobbOlr9aD8RcsC8Qt4FtM8Wlue8VNrR5g8=;
 b=ZCbVamdWpByYF9fyyIBDNTBIlRBwVb+IPq6pF7rdOGXe595ia1NXkm3i
 /L02Koml4LJAmoKBYP0eKB0lYu2OMr5hHED3Qny2qtHql5o+P+cneV7cV
 LRvNcqzS3EWu9tE92AUK0MLfFE06ouiW66j8EEMjmPc0Kjba3rfyTyr6h
 pwVwz4sDt+ozCnOSKrQaesFqL7zTwv6WgGQ3f7dcEMOVFKXKHpswy8j+V
 T7wRhS34YW3+R8OnBe+6J2Y6+T2/fdgOiRuJwImTfGM0iETPn6LWDs6YU
 rqCZSwBlRk5bSgcrvkNNVhALC/ckrCom3Y8YcJOCZdz+mSJ/iR6VvX9QZ A==;
X-CSE-ConnectionGUID: HHgyR5AcRmmGjPzlk1KLlw==
X-CSE-MsgGUID: pm4fRFZyQGGkHETrzyJBbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81729791"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81729791"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 10:27:11 -0800
X-CSE-ConnectionGUID: pfSVcyKoQdK2x0jZPkISFg==
X-CSE-MsgGUID: 55a3pJeFS0ar7+ywU65v9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211657528"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.70])
 by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2026 10:27:10 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Date: Thu, 22 Jan 2026 23:52:19 +0530
Message-Id: <20260122182219.9635-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260122182219.9635-1-mohammed.thasleem@intel.com>
References: <20260122182219.9635-1-mohammed.thasleem@intel.com>
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
 tests/intel/kms_pm_dc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index fde16ebf7..8cdbfad9f 100644
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
@@ -857,6 +868,16 @@ int igt_main()
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
+
 	igt_fixture() {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
-- 
2.25.1

