Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022C4D6CFA3
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 18:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670D810EA39;
	Thu, 22 Jan 2026 18:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvQG/gTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0146210EA38
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769106430; x=1800642430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MBgSJbNQweHg02czfjUQYP4E5wDKu+D7hV8JSGGo4+E=;
 b=PvQG/gTSLnw+JMWpObYNSsqAMRP/Oyp2BnzmzryhUyfapLs+/XeI3grG
 7NLccARj6zCmV0WnJyA9vMMrvHCrzdcwyCUxJS82Ad7mTIyaLudt9QxAe
 8FViFvjagmfZ5FpKw5rYLg/Q54239iz9ayHRe1zxBx382n9WP+G8imVfA
 wXHPJp3XUlpkMnCouDkmgkb0ukhtx6AhAwvfyxnW0XPsdltQhg/CmQTw+
 GUydzRvAwPQ5SXyYvxoJj78u60R9FIpNCFm+NaEsI4Q/5qLC/2voEhuxI
 LfT+NgpGntZNVG2AbTo+ljvnQC82IXtuea3+HImFU78sX7x+LmshldYYj g==;
X-CSE-ConnectionGUID: ytUxcaw5QiqFAduo5/jwMg==
X-CSE-MsgGUID: 79sJDpPMROubbke4RY8SZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81729789"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81729789"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 10:27:10 -0800
X-CSE-ConnectionGUID: pFSO0QY4QUeZdtjrHqJj8Q==
X-CSE-MsgGUID: MMNAqnq4Qzm2z+jcixW8kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211657525"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.70])
 by fmviesa004.fm.intel.com with ESMTP; 22 Jan 2026 10:27:09 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume
 validation test
Date: Thu, 22 Jan 2026 23:52:18 +0530
Message-Id: <20260122182219.9635-2-mohammed.thasleem@intel.com>
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

Validate DC5 state entry before and after suspend/resume cycle using DPMS.
Ensures DC5 functionality is preserved across system suspend/resume
operations.

v2: Remove repeated word. (Pranay)
    Remove extra line.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 5e59ba6e0..fde16ebf7 100644
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
@@ -841,6 +852,11 @@ int igt_main()
 		test_dc9_dpms(&data);
 	}
 
+	igt_describe("This test validates display engine entry to DC5 state "
+		      "before and after suspend/resume cycle using DPMS");
+	igt_subtest("dc5-dpms-suspend-resume")
+		test_dc5_dpms_suspend_resume(&data, CHECK_DC5);
+
 	igt_fixture() {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
-- 
2.25.1

