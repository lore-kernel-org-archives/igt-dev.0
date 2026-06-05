Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05E5CD6E79
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8536611A915;
	Fri,  5 Jun 2026 14:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3AJI6cM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6672111A90F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670420; x=1812206420;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IApJjycQvF29JrR8VIRxNpF3VWyg+S/xe2+JO6Xeb40=;
 b=a3AJI6cMJwra+wc7y3wa8og7qeLHc/6Cs/9Wv94j7qCAiCjLG3YddNbK
 owINPW1jK5CHAupfWb08uaJGLYk42KV3IJnWIkltgO/IsdS6YQjS24P17
 B3X6M5uoxsdsdL5jeml7qQJlB0ds3U73qKFx1boh1xw6/esC4TKRaSMs/
 XUGLdNBK0wBN22XiGX8/4gjhDt+aRpe73LXOGy1uY1fJV0yfsu1JOtVmm
 qEMovzwS81FGrwEsF3lA61dZx7z8t0DENXVoHBNF7Pbp7E6zCCSByyFMG
 3c71FG3Ni9zpA3FhEyi8lKRD6hjBm2eX7MtiLD70VYAom1TFhdGz1elVt Q==;
X-CSE-ConnectionGUID: kdYTl1scQveXQh3gIJCRZg==
X-CSE-MsgGUID: gCq9vUSlRQWc8fpLnLZDvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483823"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:40:01 -0700
X-CSE-ConnectionGUID: QBqY/qK2S2mOmdLvo+n6JA==
X-CSE-MsgGUID: Gdpy8ObfRP6Gj8e+obD6Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384393"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:40:00 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 5/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-rapid-fire subtest
Date: Fri,  5 Jun 2026 14:39:49 +0000
Message-ID: <20260605143953.1122688-6-nishit.sharma@intel.com>
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

This extends concurrent reset and submission stress coverage to a
high-frequency reset scenario while keeping the existing stress harness
unchanged for other subtests.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index e57d4ecf2..fecd75aad 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -130,6 +130,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define RESET_SYNC_MODE			(0x1 << 16)
 #define MEM_PRESSURE_STRESS		(0x1 << 17)
 #define INVALIDATE_BO_STRESS		(0x1 << 18)
+#define RAPID_RESET_STRESS		(0x1 << 19)
 
 /**
  * SUBTEST: %s-cat-error
@@ -671,8 +672,10 @@ static void pressure_bo_destroy(int fd, uint32_t *bos, int count)
 
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
@@ -794,6 +797,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions while invalidating BO CPU mappings
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-rapid-fire
+ * Description: Stress concurrent GT resets and job submissions with rapid-fire resets
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -1012,6 +1019,7 @@ int igt_main()
 		{ "reset-concurrent-submit-sync", RESET_SYNC_MODE },
 		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
 		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
+		{ "reset-rapid-fire", RAPID_RESET_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

