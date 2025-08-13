Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFCBC87FCF
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 15:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE91B10E78A;
	Wed, 13 Aug 2025 15:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPYhdBKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6FF10E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755100776; x=1786636776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uFXLRnH51lk2ta00aKX5crmwwSt80NnS4uBlF+hnmJ4=;
 b=VPYhdBKeyejRmvubiZKYxXCDKqAKHYxkymOVuSgy669zG5Gq6+CZn6b3
 Vm97hNNTjJ4Hg3MGnm6B4zrPadw0gaf4j8oJW5DxsioB12PYDhio/5ldp
 7G6ameCnMpNzb7nwG9qixXZL9lLYl87/KBv0D6aJuX0ag67m6wdB3BC6+
 AxGTBq8KxLtzjdfv0W4hVZKcgQLRx65egphYHaCWvDiWEMcwyjURfXYL9
 hBNFHw5eaehsLHyLLbImcW8BbuX+RIpuQArYqQab1Bo9Rjr2TMfzzuhbD
 5qwzQPRq4mJUaLpYjvPTUrx9fjw0dMTHzzzU1ZFo2GsLzJDa/sjqJM2Wh Q==;
X-CSE-ConnectionGUID: FEMFEwHiSwmdJ4WAKGWVXA==
X-CSE-MsgGUID: cryIKKhoS1COTgCb0RzcqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68004181"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="68004181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:59:35 -0700
X-CSE-ConnectionGUID: Lu91S9G7SvGt7TWylyY7YA==
X-CSE-MsgGUID: OO1pXjG3R6qELZ50I9h+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166878591"
Received: from dut4086lnl.fm.intel.com ([10.105.10.26])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:59:35 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 niranjana.vishwanathapura@intel.com, matthew.brost@intel.com
Subject: [PATCH] lib/xe/xe_spin: Add switch point for preemptible spinner
Date: Wed, 13 Aug 2025 15:59:36 +0000
Message-ID: <20250813155935.87329-2-jonathan.cavitt@intel.com>
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

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

When 'preempt' option is specified, insert a MI_SEMAPHORE_WAIT
command in the spinner batch buffer. This provides the switch
point for preemption to happen in multi queue mode.

Additionally, allow the user to control the preempt wait condition.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5783
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/intel_gpu_commands.h |  1 +
 lib/xe/xe_spin.c             | 42 +++++++++++++++++++++++++++++++++++-
 lib/xe/xe_spin.h             |  3 +++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
index cd281ba89d..5158bb0ea0 100644
--- a/include/intel_gpu_commands.h
+++ b/include/intel_gpu_commands.h
@@ -123,6 +123,7 @@
 #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
 #define MI_SEMAPHORE_WAIT_TOKEN	MI_INSTR(0x1c, 3) /* GEN12+ */
 #define   MI_SEMAPHORE_POLL		(1 << 15)
+#define   MI_SEMAPHORE_QUEUE_SWITCH_MODE	(1 << 11)
 #define   MI_SEMAPHORE_SAD_GT_SDD	(0 << 12)
 #define   MI_SEMAPHORE_SAD_GTE_SDD	(1 << 12)
 #define   MI_SEMAPHORE_SAD_LT_SDD	(2 << 12)
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 25f7555e27..d62952b539 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -30,7 +30,6 @@
 
 enum { START_TS, NOW_TS };
 
-
 uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
 {
 	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
@@ -57,6 +56,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 
 	spin->start = 0;
 	spin->end = 0xffffffff;
+	spin->wait_cond = 0;
 	spin->ticks_delta = 0;
 
 	if (opts->ctx_ticks) {
@@ -167,6 +167,24 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 				   opts->mem_copy->dst->mocs_index;
 	}
 
+	/*
+	 * Insert a MI_SEMAPHORE_WAIT_CMD instruction with condition controlled
+	 * by the user. It also acts as a queue switch point in multi queue mode.
+	 */
+	if (opts->preempt) {
+		uint64_t wait_addr = opts->addr + offsetof(struct xe_spin, wait_cond);
+
+		spin->batch[b++] = MI_SEMAPHORE_WAIT_CMD |
+				MI_SEMAPHORE_POLL |
+				MI_SEMAPHORE_QUEUE_SWITCH_MODE |
+				MI_SEMAPHORE_SAD_EQ_SDD |
+				3;
+		spin->batch[b++] = 0;
+		spin->batch[b++] = wait_addr;
+		spin->batch[b++] = wait_addr >> 32;
+		spin->batch[b++] = 0;
+	}
+
 	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
 	spin->batch[b++] = 0;
 	spin->batch[b++] = end_addr;
@@ -207,6 +225,28 @@ void xe_spin_end(struct xe_spin *spin)
 	WRITE_ONCE(spin->end, 0);
 }
 
+/**
+ * xe_spin_preempt_wait:
+ * @spin: pointer to spinner mapped bo
+ *
+ * Make the spinner wait on the preemption semaphore.
+ */
+void xe_spin_preempt_wait(struct xe_spin *spin)
+{
+	spin->wait_cond = 1;
+}
+
+/**
+ * xe_spin_preempt_nowait:
+ * @spin: pointer to spinner mapped bo
+ *
+ * Make the spinner do not wait on the preemption semaphore.
+ */
+void xe_spin_preempt_nowait(struct xe_spin *spin)
+{
+	spin->wait_cond = 0;
+}
+
 /**
  * xe_spin_create:
  * @opt: controlling options such as allocator handle, exec_queue, vm etc
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index c2199d0aa2..eaf2a409e0 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -64,6 +64,7 @@ struct xe_spin {
 	uint64_t pad;
 	uint32_t start;
 	uint32_t end;
+	uint32_t wait_cond;
 	uint32_t ticks_delta;
 	uint64_t exec_sync;
 	uint32_t timestamp;
@@ -76,6 +77,8 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
+void xe_spin_preempt_wait(struct xe_spin *spin);
+void xe_spin_preempt_nowait(struct xe_spin *spin);
 
 /*
  * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
-- 
2.43.0

