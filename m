Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECD8CCFA02
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B1810E2FC;
	Fri, 31 Oct 2025 18:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBo4YNtq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A7510EC10
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bqolMO5aqZROjzDNx7KzOj12J94pSWWnjQAPEbE+Puc=;
 b=nBo4YNtqtpW9DBCpW6XaooognRJwMYqN6U7sqSVz85SK1dTLmymGCrSm
 nQd8vOBXG2GT6nVNSD0KdyzkdAoU75EMyG+Clcs/AbEJBR5KLIG5cBbcg
 rpgWmiVpszuOmz1adk8hloJlD67KpvHnU2hgwwi9ZdNXzDgeNFaq1iYWf
 2UVxIDPT+BIRvdZZGmYptJM+XiuiBlF4UVU9WWNnNlkWUuhV43ocyndhu
 dt24Z415AV2c/QWY2L74AdkvNe/Km3AntwEg4EB5jJ6KZ0uL7huG6PMjT
 hm9YYKbwWcFwyse4+PlMlvvzaKbE5IoHsdhqs1vsOPad0r901c+M6UcAN A==;
X-CSE-ConnectionGUID: kAHtqZMnR7m52PqKxjVNvg==
X-CSE-MsgGUID: N0it078mRsiFdAxxSJwhfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144736"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: Nly9XIEPQkCYJPTYeze0jg==
X-CSE-MsgGUID: jVt4HJr2RMm1Lzyq32XC4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650034"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 14/18] lib/xe/xe_spin: Add switch point for preemptible spinner
Date: Fri, 31 Oct 2025 11:35:51 -0700
Message-ID: <20251031183555.1882721-15-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

When 'preempt' option is specified, insert a MI_SEMAPHORE_WAIT
command in the spinner batch buffer. This provides the switch
point for preemption to happen in multi queue mode.
Allow user to control preempt wait condition.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 include/intel_gpu_commands.h |  1 +
 lib/xe/xe_spin.c             | 41 ++++++++++++++++++++++++++++++++++++
 lib/xe/xe_spin.h             |  3 +++
 3 files changed, 45 insertions(+)

diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
index cd281ba89..5158bb0ea 100644
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
index 72b13ef42..174c5f7ec 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -57,6 +57,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 
 	spin->start = 0;
 	spin->end = 0xffffffff;
+	spin->wait_cond = 0;
 	spin->ticks_delta = 0;
 
 	if (opts->ctx_ticks) {
@@ -167,6 +168,24 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
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
@@ -207,6 +226,28 @@ void xe_spin_end(struct xe_spin *spin)
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
index c2199d0aa..eaf2a409e 100644
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

