Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD0CCD6E7D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCEB11A904;
	Fri,  5 Jun 2026 14:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idyvsb5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997A311A90F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670421; x=1812206421;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BYZBCObsh2De3hWsfEprapd7UT01dVYot6vmfzWSzcg=;
 b=idyvsb5/IOa50DP6nS2PJlfM3uf476ao3X7Kw1U2Bqb0ilNqvF3MLyiH
 GMVKAT5P9Z1tJFpT7zRHGISNNWO60FbIxCrv8FFcotWVHyWP9kmOqxJHj
 fDqTKxiQ5aEj8maWIgSCzCCt2/yCvCTRR1PL7EV9W1faM75gWbDYeI9zd
 MxW9vF/rahvbOn9eHa7sYXcVWytqEZnBsxkRahOKPJjzEtz+8ABBY92jM
 BEyfVbgAQ2OoecPe2CtHk1O1COw6baZ9TD+tHK5u9o10y3nYMJE+iaetG
 S5Iqd94hLkPPGYJCp7ZDQTMro2WPfzEpS+6Nn/QHUr3xTCrJ3peUkD5q4 g==;
X-CSE-ConnectionGUID: YhavesjuRyeZj/at7MF+EQ==
X-CSE-MsgGUID: bSV2VZDiSIa3QcRvWSf84A==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483827"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:40:03 -0700
X-CSE-ConnectionGUID: vFfkQdS8RSi5LEdpqKX8QQ==
X-CSE-MsgGUID: sgy80091RqGDszUgbNwzkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384408"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:40:01 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 6/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-destroy-vm-context subtest
Date: Fri,  5 Jun 2026 14:39:50 +0000
Message-ID: <20260605143953.1122688-7-nishit.sharma@intel.com>
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

This test destroy VM context while reset/submission is active, The BO/VM
is periodically torn down and recreated while the reset thread continues
running.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index fecd75aad..862caae27 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -131,6 +131,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define MEM_PRESSURE_STRESS		(0x1 << 17)
 #define INVALIDATE_BO_STRESS		(0x1 << 18)
 #define RAPID_RESET_STRESS		(0x1 << 19)
+#define DESTROY_VM_CTX_STRESS		(0x1 << 20)
 
 /**
  * SUBTEST: %s-cat-error
@@ -735,7 +736,8 @@ static void submit_jobs(struct gt_thread_data *t)
 			pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
 		}
 
-		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96))) {
+		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96)) ||
+		    ((t->flags & DESTROY_VM_CTX_STRESS) && !(i % 128))) {
 			if (t->flags & MEM_PRESSURE_STRESS) {
 				pressure_bo_destroy(fd, pressure_bos, pressure_count);
 				pressure_count = 0;
@@ -801,6 +803,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions with rapid-fire resets
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-destroy-vm-context
+ * Description: Stress concurrent GT resets and job submissions while destroying and recreating VM context
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -1020,6 +1026,7 @@ int igt_main()
 		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
 		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
 		{ "reset-rapid-fire", RAPID_RESET_STRESS },
+		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

