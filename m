Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE303CA100C
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 07:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9806610E105;
	Wed,  3 Sep 2025 07:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtCriitB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3C810E105
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756885619; x=1788421619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tgeqDW52AaiY/wAdqF68hcFksE0xoSo3UiA1N1qcBoY=;
 b=LtCriitBvGTJR+vu2zdnd5RV2C4azgVQmWHvrhmRkFMMdcPmFVTj9K+T
 AsyCD0aGO47Fq0qhPCbFRrEkfBnbCtnAFzo6c1WKTc59bKcn8wDEiXzvG
 svvJE2lrFHlIJCak1z7eJW3riCQrWjty55Vz2iW0B6IqiLOQcZSWOWWpu
 1qSaOvCkA6cuv5IaqVlb7YGBTIKkcAkN+iPse1lIFrMiqzFpI+FcCGu2J
 zkhgDXduCqg1JXpwropnVmHiouXF43yA0eiGEJZiUEjVhJ3AsZLHHrXST
 045ZKSjEPz3ccvl0+3R59zRVAVpZ0lr3eWJUdwi3zSkQb+/u25chyT/tm A==;
X-CSE-ConnectionGUID: 9I1dAmBSTJeFI2zprTFEtQ==
X-CSE-MsgGUID: cx3STOO2Rnute9wmR2AtRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62832769"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="62832769"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:46:58 -0700
X-CSE-ConnectionGUID: jKugLGfkTiSFnk/mTm3QOQ==
X-CSE-MsgGUID: UahuvQh1TqCEu7uzV2jS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170792616"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.238])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:46:57 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_mix_modes: Remove absolute duration
 value
Date: Wed,  3 Sep 2025 09:46:46 +0200
Message-ID: <20250903074646.1789362-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

This absolute duration value was making implicit assumptions about
execution speed, which can lead to issues in specific environments.
Remove these assumptions and instead explicitly end the spinner and
check the completion order of the jobs.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Daniel Charles <daniel.charles@intel.com>
---
 tests/intel/xe_exec_mix_modes.c | 68 +++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index 59887d2aa..e65854d0d 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -28,7 +28,7 @@
 #define FLAG_EXEC_MODE_LR	(0x1 << 0)
 #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
 
-#define NUM_INTERRUPTING_JOBS	5
+#define NUM_INTERRUPTING_JOBS	1
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 #define VM_DATA			0
 #define SPIN_DATA		1
@@ -76,7 +76,8 @@ enum job_type {
 static void
 run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 	enum engine_execution_mode engine_execution_mode,
-	enum job_type job_type, bool allow_recursion)
+	enum job_type job_type, bool allow_recursion,
+	struct xe_spin *dma_fence_job_spin)
 {
 	struct drm_xe_sync sync[1] = {
 		{ .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -95,9 +96,9 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 	uint32_t bo = 0;
 	unsigned int vm_flags = 0;
 	struct xe_spin_opts spin_opts = { .preempt = true };
-	const uint64_t duration_ns = NSEC_PER_SEC / 2; /* 500ms */
 	struct timespec tv;
 	enum engine_execution_mode interrupting_engine_execution_mode;
+	int64_t timeout_short = 1;
 
 	if (engine_execution_mode == EXEC_MODE_LR) {
 		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
@@ -133,7 +134,6 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	if (job_type == SPINNER_INTERRUPTED) {
 		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
-		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, duration_ns);
 		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
 		if (engine_execution_mode == EXEC_MODE_LR)
 			sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
@@ -157,25 +157,51 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 		igt_gettime(&tv);
 		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
 		{
-			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE, false);
-			/**
-			 * Executing a SIMPLE_BATCH_STORE job takes significantly less time than
-			 * duration_ns.
-			 * When a spinner is running in LR mode, the interrupting job preempts it
-			 * in KMD and should complete fast, shortly after starting the spinner.
-			 * When a spinner is running in dma fence mode, the interrupting job waits
-			 * in KMD and should complete shortly after the spinner has ended.
-			 * The checks below are to verify preempting/waiting happens as expected
-			 * depending on the execution mode.
-			 */
-			if (engine_execution_mode == EXEC_MODE_LR)
-				igt_assert_lt(igt_nsec_elapsed(&tv), 0.5 * duration_ns);
-			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE &&
-				 job_type == SPINNER_INTERRUPTED)
-				igt_assert_lt(duration_ns, igt_nsec_elapsed(&tv));
+			struct xe_spin *spin_arg;
+
+			if (job_type == SPINNER_INTERRUPTED &&
+			    engine_execution_mode == EXEC_MODE_DMA_FENCE &&
+			    interrupting_engine_execution_mode == EXEC_MODE_LR)
+				/**
+				 * In this case, jobs in LR mode are submitted while a job in dma
+				 * fence mode is running. It is expected that the KMD will wait
+				 * for completion of the dma fence job before executing the jobs
+				 * in LR mode. Provide a pointer to the spinner to the interrupting
+				 * dma fence job so that it can check that it was blocked, then
+				 * end the spinner, then check that it was unblocked and completed,
+				 * see "if (dma_fence_job_spin) ... " below.
+				 */
+				spin_arg = &data[SPIN_DATA].spin;
+
+			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
+				false, spin_arg);
+
+			if (job_type == SPINNER_INTERRUPTED &&
+			    engine_execution_mode == EXEC_MODE_LR &&
+			    interrupting_engine_execution_mode == EXEC_MODE_DMA_FENCE) {
+				/**
+				 * In that case, jobs in dma fence mode are submitted while a job
+				 * in LR mode is running. It is expected that the KMD will preempt
+				 * the LR mode job to execute the dma fence mode jobs. At this
+				 * point the dma fence job has completed, check that the LR mode
+				 * job is still running, meaning was successfully preempted.
+				 */
+				igt_assert_neq(0, __xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
+								   USER_FENCE_VALUE,
+								   0, &timeout_short));
+			}
 		}
 	}
 
+	if (dma_fence_job_spin) {
+		igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
+						   USER_FENCE_VALUE, 0, &timeout_short));
+		xe_spin_end(dma_fence_job_spin);
+	} else if (job_type == SPINNER_INTERRUPTED &&
+		   engine_execution_mode == EXEC_MODE_LR) {
+		xe_spin_end(&data[SPIN_DATA].spin);
+	}
+
 	if (engine_execution_mode == EXEC_MODE_LR) {
 		if (job_type == SPINNER_INTERRUPTED)
 			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
@@ -227,7 +253,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
 	else
 		job_type = SPINNER_INTERRUPTED;
 
-	run_job(fd, hwe, engine_execution_mode, job_type, true);
+	run_job(fd, hwe, engine_execution_mode, job_type, true, NULL);
 }
 
 igt_main
-- 
2.43.0

