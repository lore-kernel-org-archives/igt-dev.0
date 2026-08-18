Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE671C5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D65510E9D4;
	Tue, 18 Aug 2026 04:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wy6Kn6vg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2011B10E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026129; x=1818562129;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UBzeGVS949wcwWpvoQkREEndSG6xRpyxJSE+z66Gnvk=;
 b=Wy6Kn6vgFOHLasHENNngrjTUaz02BYIiD9gXqHV4CGzeeVuyeQb+NSKv
 b8X2Motxorg+++NCTbXrwrs1f5imDvwEiSdwNXCJTwlLXsMjC6OPILoce
 ha9B3NGuC6D4i4sSfYDUPQNZh7cBbX/b4n2t4f/Gf/ij2A7eEInj88QTl
 kMmvsk9GkOjmCkOtQ+2NSJfYWtByjkKiCRQpd1MIErFcqOTJjW92Rezdd
 X1yJJk6ElkkAmxTQH8IQk9QNPvWlWPRWa+U4+iNOJWi8/D57flXWaYPMr
 KUnVfVfiY10bVTdqcGqK/R7u19vMgpDLMAY9OnValpShbjF4/bVDQYKZ3 Q==;
X-CSE-ConnectionGUID: C+cqv18YTem5GWkO6dklPw==
X-CSE-MsgGUID: OquZxphEQE2i5jKqLP+UBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870373"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870373"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:49 -0700
X-CSE-ConnectionGUID: iHdcAON+Q+OK6kldr0bKyA==
X-CSE-MsgGUID: ekXQGWVuRWyQsCkSUPG8Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477265"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:48 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 1/9] tests/intel/xe_exec_reset: Add concurrent GT reset
 submit stress test
Date: Tue, 18 Aug 2026 04:08:37 +0000
Message-ID: <20260818040845.548727-2-nishit.sharma@intel.com>
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

Add a dedicated stress subtest for concurrent GT reset and job submission.
The new subtest exercises reset/submit overlap by running:
1. GT resets on a selected GT
2. Concurrent job submission threads creating queues and executing batches

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 40 ++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 044d8f007..134378974 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -650,6 +650,9 @@ struct gt_thread_data {
 	int *go;
 	int *exit;
 	int *num_reset;
+	int *num_submit;
+	int *num_submit_fail;
+	unsigned int flags;
 	bool do_reset;
 };
 
@@ -671,7 +674,7 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint32_t bo;
 	uint32_t *data;
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, t->gt),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	data[0] = MI_BATCH_BUFFER_END;
@@ -682,7 +685,7 @@ static void submit_jobs(struct gt_thread_data *t)
 		struct drm_xe_engine_class_instance instance = {
 			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 			.engine_instance = 0,
-			.gt_id = 0,
+			.gt_id = t->gt,
 		};
 		struct drm_xe_exec exec = {
 			.address = addr,
@@ -692,11 +695,14 @@ static void submit_jobs(struct gt_thread_data *t)
 
 		/* GuC IDs can get exhausted */
 		ret = __xe_exec_queue_create(fd, vm, 1, 1, &instance, 0, &exec.exec_queue_id);
-		if (ret)
+		if (ret) {
+			(*t->num_submit_fail)++;
 			continue;
+		}
 
 		xe_exec(fd, &exec);
 		xe_exec_queue_destroy(fd, exec.exec_queue_id);
+		(*t->num_submit)++;
 	}
 
 	munmap(data, bo_size);
@@ -726,14 +732,19 @@ static void *gt_reset_thread(void *data)
  * Description: Stress GT reset
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-concurrent-submit
+ * Description: Stress concurrent GT resets and job submissions
+ * Test category: stress test
+ *
  */
 static void
-gt_reset(int fd, int n_threads, int n_sec)
+gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 {
 	struct gt_thread_data *threads;
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
 	int go = 0, exit = 0, num_reset = 0, i;
+	int num_submit = 0, num_submit_fail = 0;
 
 	threads = calloc(n_threads, sizeof(struct gt_thread_data));
 	igt_assert(threads);
@@ -745,10 +756,13 @@ gt_reset(int fd, int n_threads, int n_sec)
 		threads[i].mutex = &mutex;
 		threads[i].cond = &cond;
 		threads[i].fd = fd;
-		threads[i].gt = 0;
+		threads[i].gt = gt;
+		threads[i].flags = flags;
 		threads[i].go = &go;
 		threads[i].exit = &exit;
 		threads[i].num_reset = &num_reset;
+		threads[i].num_submit = &num_submit;
+		threads[i].num_submit_fail = &num_submit_fail;
 		threads[i].do_reset = (i == 0);
 
 		pthread_create(&threads[i].thread, 0, gt_reset_thread,
@@ -766,8 +780,11 @@ gt_reset(int fd, int n_threads, int n_sec)
 	for (i = 0; i < n_threads; i++)
 		pthread_join(threads[i].thread, NULL);
 
-	igt_info("number of resets %d\n", num_reset);
+	igt_info("number of resets %d, submissions %d, submit fails %d\n",
+		 num_reset, num_submit, num_submit_fail);
 
+	igt_assert_neq(num_reset, 0);
+	igt_assert_neq(num_submit, 0);
 	free(threads);
 }
 
@@ -934,6 +951,10 @@ int igt_main()
 		{ "parallel", PARALLEL },
 		{ NULL },
 	};
+	const struct section ssections[] = {
+		{ "reset-concurrent-submit", 0 },
+		{ NULL },
+	};
 	int gt;
 	int class;
 	int fd;
@@ -1126,7 +1147,12 @@ int igt_main()
 	}
 
 	igt_subtest("gt-reset-stress")
-		gt_reset(fd, 4, 1);
+		gt_reset(fd, 0, 4, 1, 0);
+
+	for (const struct section *s = ssections; s->name; s++) {
+		igt_subtest_f("gt-stress-%s", s->name)
+			gt_reset(fd, 0, 8, 2, 0);
+	}
 
 	igt_subtest("gt-mocs-reset")
 		xe_for_each_gt(fd, gt)
-- 
2.43.0

