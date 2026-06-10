Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5778DCD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 07:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E338410E754;
	Wed, 10 Jun 2026 07:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsJV5JHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FE910E75C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 07:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781075575; x=1812611575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y8VZmoUvME8vRVy63lGHQWOf9lJ8H0GWIugvrISmKUY=;
 b=UsJV5JHGbk4rLD3F4woWJfXEQONR4DmLQosQQ4a5i4krSgn+yLORQ8bQ
 +75CfaPCLjnq7308HM1cxWLt3HQfrylEvhYagK3u5DLqU2VupJ/3tvjCi
 2pCqkpDbHakmUP2zQ4W1ybEamMjXffnEIJabJqXybx928KvFgBzY4og0e
 nqlYgru6Jts9iK5eD/JdvtUrtF9puZpeL5hZGWLxwKlfvfUCVvFzvfLZL
 LR5OuSqjvw6gru308w2T/7C0FmmiR2KaatQyJDC97mMNKYObmKquT1FuU
 c6wZM1MjWx8Tzj6/Yrvg+8lXorLCohhsIoiE9vRO2C8t3PRYVFWlnMijL w==;
X-CSE-ConnectionGUID: bEYlZW9ZSGeHKB2d9JStTQ==
X-CSE-MsgGUID: D8+ndStdR+aNZsrJfb5yrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92180155"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92180155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 00:12:54 -0700
X-CSE-ConnectionGUID: 2evT2iuJQq6dyZxM5Ay3bQ==
X-CSE-MsgGUID: 5Vnjde+nTaGpzhhibiSA7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251167518"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2026 00:12:53 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH v4 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume
 validation test
Date: Wed, 10 Jun 2026 12:32:52 +0530
Message-ID: <20260610070253.25329-2-mohammed.thasleem@intel.com>
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

Validate DC5 state entry before and after suspend/resume cycle using DPMS.
Ensures DC5 functionality is preserved across system suspend/resume
operations.

v2: Remove repeated word. (Pranay)
    Remove extra line.
v3: Update test description. (Jeevan)
v4: Add igt_info log during test cycle. (Jeevan)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 90df8ee37..521521196 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -80,6 +80,9 @@
  *
  * SUBTEST: dc5-pageflip-negative
  * Description: This test validates that DC5 entry should not occur during continuous page-flips
+ *
+ * SUBTEST: dc5-dpms-suspend-resume
+ * Description: This test validates DC5 state entry before and after a suspend/resume cycle using DPMS
  */
 
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
@@ -668,6 +671,18 @@ static void test_dc5_pageflip_negative(data_t *data, int dc_flag)
 	cleanup_dc3co_fbs(data);
 }
 
+static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag)
+{
+	igt_info("Testing DC5 state before suspend\n");
+	test_dc_state_dpms(data, dc_flag);
+
+	igt_info("Starting suspend/resume cycle\n");
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_info("Testing DC5 state after resume\n");
+	test_dc_state_dpms(data, dc_flag);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -801,6 +816,11 @@ int igt_main()
 		test_dc9_dpms(&data);
 	}
 
+	igt_describe("This test validates DC5 state entry before and after a "
+		      "suspend/resume cycle using DPMS");
+	igt_subtest("dc5-dpms-suspend-resume")
+		test_dc5_dpms_suspend_resume(&data, IGT_INTEL_CHECK_DC5);
+
 	igt_fixture() {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
-- 
2.43.0

