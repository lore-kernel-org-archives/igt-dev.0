Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB19BC5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994FF10E9D4;
	Tue, 18 Aug 2026 04:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7Fm/fms";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9C610E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026133; x=1818562133;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0h7/tiFHAZxKKgow68o52zJNJyEGEkOjsMQ7XqpF4Uk=;
 b=S7Fm/fmsRD5UQoCf05BfAZLvlCEujP//wdZxK7Ret1ahuQmFg3ykDTFD
 QJ98p78k/TwmkJ2lroIcoaISQdx/ft/JC8pP+oFxC/M5CT/VFxJPQP2Aj
 xtcVzwJkLY2h7lfW92dlYroACtdTxJPa8yvdK/OPSTDCoTwbyh74CVp4X
 XSg5OdOmjvd1lecafykpdnJrqCurNWwSh7xektBNxgz+vJnTWVlE83/YW
 SxSa5QXjbujsXUWnNkpCtWH0x8Q+hDnI951/5qRZizL8nE57AA/yPH3bB
 5qaYvjLNtl+Zzb2fdI87nk0gyPEOv8+cvEmzAKdO6ac7UDA9McNlWqWTi w==;
X-CSE-ConnectionGUID: nTlvH+fkTHKfECpEgcDQuA==
X-CSE-MsgGUID: N2gD86yzT86EddQ0cQ5sLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870379"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870379"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:53 -0700
X-CSE-ConnectionGUID: lAYnKAv0Q4eeC0zRyCRR2A==
X-CSE-MsgGUID: uBUuyxEzTNOkJ8U9gJMsdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477282"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:53 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 5/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-rapid-cycle subtest
Date: Tue, 18 Aug 2026 04:08:41 +0000
Message-ID: <20260818040845.548727-6-nishit.sharma@intel.com>
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

This extends concurrent reset and submission stress coverage to a
high-frequency reset scenario while keeping the existing stress harness
unchanged for other subtests.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 2a822b29b..a9c3b593d 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -136,6 +136,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define RESET_SYNC_MODE			(0x1 << 16)
 #define MEM_PRESSURE_STRESS		(0x1 << 17)
 #define INVALIDATE_BO_STRESS		(0x1 << 18)
+#define RAPID_RESET_STRESS		(0x1 << 19)
 
 /**
  * SUBTEST: %s-cat-error
@@ -717,8 +718,10 @@ static void pressure_bo_destroy(int fd, uint32_t *bos, int count)
 
 static void do_resets(struct gt_thread_data *t)
 {
+	int interval_us = (t->flags & RAPID_RESET_STRESS) ? 1000 : 250000;
+
 	while (!*(t->exit)) {
-		usleep(250000);	/* 250 ms */
+		usleep(interval_us);
 		(*t->num_reset)++;
 		if (t->flags & RESET_SYNC_MODE)
 			xe_force_gt_reset_sync(t->fd, t->gt);
@@ -840,6 +843,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions while invalidating BO CPU mappings
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-rapid-cycle
+ * Description: Stress concurrent GT resets and job submissions with rapid-cycle resets
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -1061,6 +1068,7 @@ int igt_main()
 		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
 		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
 		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
+		{ "reset-rapid-cycle", RAPID_RESET_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

