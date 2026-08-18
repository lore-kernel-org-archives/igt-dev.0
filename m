Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09A9C5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AF710E4F6;
	Tue, 18 Aug 2026 04:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHXIQFEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2508710E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026130; x=1818562130;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bIbmM/GuQfaVakkhHIQGCNUm7r5JtGdsdMb+XnjXwlg=;
 b=JHXIQFEd+UrI+houYshi8bOslxB9E6FIU5TBs2zxoCc7+TcQoOewDjax
 9QPVrtI68ypsV9YKUwbOw5XUVlQGfgQ+PgQWCoxfsDLFLBPuX/unv/JAF
 BxZdq1zTC8AT4yJiQxx+N/EbKfZamb+5EqMRBz6K9OHIBTt+UcTFDz2pm
 Iczulm5WXPkYqLCaMOfqiymuZ65CjHUxvxLxI+xy9MUbxFunZtp83x9Hu
 Q8Z6GAPt5AGRhQ4mZ54nJ9xbzh+xKrKZLHj0VB1vpHk+66x+5Du5ShWtk
 DIdxYmRPqGyzme96jIkTLiOMchjLrv4hL+G8mxvPDpIIuKq0IlJXBMUVE Q==;
X-CSE-ConnectionGUID: ngXJOcQ6T06QXQZAr2z9WQ==
X-CSE-MsgGUID: eLNAi/GtQfyTMVmF5u1Oxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870374"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870374"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:50 -0700
X-CSE-ConnectionGUID: er0BCtC2TeOXZrFAcr2/IQ==
X-CSE-MsgGUID: Z2tT5f1hQk6aoRZjvReIcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477268"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:49 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 2/9] tests/intel/xe_exec_reset: add sync concurrent reset
 submit subtest
Date: Tue, 18 Aug 2026 04:08:38 +0000
Message-ID: <20260818040845.548727-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818040845.548727-1-nishit.sharma@intel.com>
References: <20260818040845.548727-1-nishit.sharma@intel.com>
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
index 134378974..407775cfc 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -132,6 +132,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define COMPRESSION			(0x1 << 13)
 #define MULTI_QUEUE			(0x1 << 14)
 #define SECONDARY_QUEUE			(0x1 << 15)
+#define RESET_SYNC_MODE			(0x1 << 16)
 
 /**
  * SUBTEST: %s-cat-error
@@ -661,7 +662,10 @@ static void do_resets(struct gt_thread_data *t)
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
 
@@ -736,6 +740,10 @@ static void *gt_reset_thread(void *data)
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
@@ -953,6 +961,7 @@ int igt_main()
 	};
 	const struct section ssections[] = {
 		{ "reset-concurrent-submit", 0 },
+		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
 		{ NULL },
 	};
 	int gt;
@@ -1151,7 +1160,7 @@ int igt_main()
 
 	for (const struct section *s = ssections; s->name; s++) {
 		igt_subtest_f("gt-stress-%s", s->name)
-			gt_reset(fd, 0, 8, 2, 0);
+			gt_reset(fd, 0, 8, 2, s->flags);
 	}
 
 	igt_subtest("gt-mocs-reset")
-- 
2.43.0

