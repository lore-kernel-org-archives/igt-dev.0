Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F91D2D0FF
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 13:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E72710E33B;
	Tue, 13 Jan 2026 13:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYl5ZJtl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C8F10E2A6
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768311082; x=1799847082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BFxIr2aS4yw+bQ2Njky8NTk8qlUgZiwLyUNl3eprEkY=;
 b=iYl5ZJtlBBFdcWYJ5Ne+KrriRkCibGNEaXBNiut+VpFoYLC19D3eF8/y
 uXx7NAZUpOOjNGuuG13WffTpgtPZA2HMCRqMvaxOfouo31vw8vu7MOd6+
 1HKjChWYFvNTFFbDOcJtBcG++zWQMXQIdRtEI2/vfZPhz6264AoA6eSLm
 wU5QW0vmhfCz7ZXyKIzYbzrac6tr1kE5bdYOddjI2pS075io8bRtKeBtM
 t1Dh9gfNMb/vLi7o22FgcwB1MKW2bNCwI9joNq7Qbwz7y9How3zeP63e0
 +HESren/GVxAZTJxGoEIRUze7cc3WguBT+is+CLnkCYt3EyjQ9OouZLS7 g==;
X-CSE-ConnectionGUID: KRvqRg+yRhKqeyt71Ar9mw==
X-CSE-MsgGUID: 0qY5A3f6StebgDvVV7G/QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69752841"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69752841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 05:31:22 -0800
X-CSE-ConnectionGUID: brzY6MHJS0CZiSxbVebRJQ==
X-CSE-MsgGUID: FjLhzCKHQT2H+1/9LIICEA==
X-ExtLoop1: 1
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.70])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 05:31:20 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume
 validation test
Date: Tue, 13 Jan 2026 18:56:38 +0530
Message-Id: <20260113132639.13411-2-mohammed.thasleem@intel.com>
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

Validate DC5 state entry before and after suspend/resume cycle using DPMS.
Ensures DC5 functionality is preserved across system suspend/resume
operations.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 5e59ba6e0..ba00fd96a 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -77,6 +77,9 @@
  *
  * SUBTEST: dc5-retention-flops
  * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
+ *
+ * SUBTEST: dc5-dpms-suspend-resume
+ * Description: This test validate DC5 state entry before and after suspend/resume cycle using DPMS
  */
 
 /* DC State Flags */
@@ -721,6 +724,14 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
 }
 
+static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag)
+{
+	test_dc_state_dpms(data, dc_flag);
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	test_dc_state_dpms(data, dc_flag);
+
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -841,6 +852,12 @@ int igt_main()
 		test_dc9_dpms(&data);
 	}
 
+	igt_describe("This test validates display engine entry to DC5 state "
+		      "entry before and after suspend/resume cycle using DPMS");
+	igt_subtest("dc5-dpms-suspend-resume")
+		test_dc5_dpms_suspend_resume(&data, CHECK_DC5);
+
+
 	igt_fixture() {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
-- 
2.25.1

