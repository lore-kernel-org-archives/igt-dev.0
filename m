Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02015CD6E79
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A719E11A915;
	Fri,  5 Jun 2026 14:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KuZi634u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04A611A910
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670421; x=1812206421;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2JP22BjgozFT9rSz/iOCCCU6ZNmntIb/h7KFYUmJVJs=;
 b=KuZi634uGM0ajW7iPNTPoc1hBmxoa2GedLPIqVRPtJV45P1Rnmuu69Mt
 u/Z40OPaDLyXIrmWs4lpaJmTvjcFsfxDzH3YfTjTJXkdKNqCPV+ssZ1bb
 juCSNSDss9LbiWAoKfWCO2/xlN11tPYwJRKwB6qZjrrhJX1kyFYWk3W/x
 LYUcfWOzuqTTQmTi9oamqUXctCjRwec7I5rzhyDdxV+gt/eXGFi9jwJ6a
 gDFH7my8TjJQJLhWLgMvYvnn9Ov2f1MLVJu6zonWbq27suBc8J7FnCP6A
 /ayZWFhNxQDx0aam1P3s/oO86BSRtcHme4ds1e+a3OM8vVtxD+4dny+Av w==;
X-CSE-ConnectionGUID: 6YdSh2orQJGTQyQLIdPA8Q==
X-CSE-MsgGUID: Trwm5h+MQBCHfh55jEHopQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483842"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:40:06 -0700
X-CSE-ConnectionGUID: cL4vKS3SQw2rePP5MiZY2A==
X-CSE-MsgGUID: pcXy+8b2TOK9Ayax4BPNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384455"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:40:05 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 9/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-engine-hang subtest
Date: Fri,  5 Jun 2026 14:39:53 +0000
Message-ID: <20260605143953.1122688-10-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605143953.1122688-1-nishit.sharma@intel.com>
References: <20260605143953.1122688-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Add a dedicated GT reset stress subtest that triggers reset while a long
spinner workload is active.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index cc2497896..2b0b88ace 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -841,6 +841,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions during PM transition windows
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-engine-hang
+ * Description: Test GT reset while long spinner workload is active
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -1265,6 +1269,14 @@ int igt_main()
 			gt_reset(fd, 0, 8, 2, s->flags);
 	}
 
+	igt_subtest("gt-stress-reset-engine-hang")
+		xe_for_each_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 2, 4,
+					    GT_RESET | LONG_SPIN,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
 	igt_subtest("gt-mocs-reset")
 		xe_for_each_gt(fd, gt)
 			gt_mocs_reset(fd, gt);
-- 
2.43.0

