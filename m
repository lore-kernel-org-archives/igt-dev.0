Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B10FCD6E7D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F03311A915;
	Fri,  5 Jun 2026 14:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/abBs+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE5811A910
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670420; x=1812206420;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dShSAXFGrRNw3xhBqluFA7JukLAz0aOw5bFG07Ys9rM=;
 b=R/abBs+m2YkKvfl6sLAxVj+t52POfFwbjRfl/Leyo1fqSJeQG6od+PG2
 jmMvB0ObEQkc44gCRWQ8OD8THcSkejtx+yQx0kFlb2clHn3FEnImtpmC4
 0gt8PD6DMV7858R3HWm8ZFEUWN7Iklq3FNITYGqjz/tILy46UZnAmrEBB
 /Ln/VLATq4x1HJ/CEXkExa1dbsvkuABIKoGp6Fq2eDDw2LzhnFNqB7snz
 VHcJI4GuuL1LmuU0twumRgTUEkHZR3kXLON9tWYJLoUvdrI68rJmFJIm0
 vLQ35rqG6l/sx6248I8wdexH2jscwpgDMZay9968Z/sG3xBHkbDpJK6OH Q==;
X-CSE-ConnectionGUID: WAkBA26iTjS2jGM9CIMZbQ==
X-CSE-MsgGUID: eN7VniidTWOAoaecUiKHsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483815"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483815"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:39:58 -0700
X-CSE-ConnectionGUID: CRRn5ZQ3Qy2FUh5gVFNOGw==
X-CSE-MsgGUID: Qn2z4aebR/On6LYagGde/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384379"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:39:56 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 2/9] tests/intel/xe_exec_reset: add sync concurrent
 reset submit subtest
Date: Fri,  5 Jun 2026 14:39:46 +0000
Message-ID: <20260605143953.1122688-3-nishit.sharma@intel.com>
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

Add gt-reset-concurrent-submit-sync to xe_exec_reset to stress concurrent
job submission while issuing synchronous GT resets.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 3377a6b3b..8e8e4e27d 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -126,6 +126,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define COMPRESSION			(0x1 << 13)
 #define MULTI_QUEUE			(0x1 << 14)
 #define SECONDARY_QUEUE			(0x1 << 15)
+#define RESET_SYNC_MODE			(0x1 << 16)
 
 /**
  * SUBTEST: %s-cat-error
@@ -615,7 +616,10 @@ static void do_resets(struct gt_thread_data *t)
 	while (!*(t->exit)) {
 		usleep(250000);	/* 250 ms */
 		(*t->num_reset)++;
-		xe_force_gt_reset_async(t->fd, t->gt);
+		if (t->flags & RESET_SYNC_MODE)
+			xe_force_gt_reset_sync(t->fd, t->gt);
+		else
+			xe_force_gt_reset_async(t->fd, t->gt);
 	}
 }
 
@@ -690,6 +694,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-concurrent-submit-sync
+ * Description: Stress concurrent GT resets and job submissions with sync resets
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -904,6 +912,7 @@ int igt_main()
 	};
 	const struct section ssections[] = {
 		{ "reset-concurrent-submit", 0 },
+		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
 		{ NULL },
 	};
 	int gt;
@@ -1102,7 +1111,7 @@ int igt_main()
 
 	for (const struct section *s = ssections; s->name; s++) {
 		igt_subtest_f("gt-stress-%s", s->name)
-			gt_reset(fd, 0, 8, 2, 0);
+			gt_reset(fd, 0, 8, 2, s->flags);
 	}
 
 	igt_subtest("gt-mocs-reset")
-- 
2.43.0

