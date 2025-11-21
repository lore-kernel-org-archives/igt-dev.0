Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AF6CFA46E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCB810E7F8;
	Fri, 21 Nov 2025 03:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JT+QQk/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA3B10E7FA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697448; x=1795233448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bqolMO5aqZROjzDNx7KzOj12J94pSWWnjQAPEbE+Puc=;
 b=JT+QQk/4r1pfPMHi6Anc33n79rOpD1pu8+XD3ybs7DwPyl6jyJSh7BEO
 d9VN0xWVsMkzIEKHOW6htbGaFzwyqqZybEqiRWvbCVxP/kl3vBh1pp7s8
 vnUba7QspU9FBlgpM/3zQU/su5inYnPKZy5m3+quujN1flLXvGR8YtS/k
 Vk6ODxOLWzQgSIHEDoewgT/J/fBH1FuCSRwYDF5JrqZC2JJXF8SHDsHG+
 3/gZwSd7/wrt0gbuepLKMq3TzPvJZbT6TfCwrOv1Z4vYbKy6JmI4gDDLd
 0CyvtCp+gh/wJyL1Y8NEonluuCJrcIwkLd9rmny7aUmVbUWaGTHlsUHYz g==;
X-CSE-ConnectionGUID: ocxOy/XKRTS63aL+wRsOMg==
X-CSE-MsgGUID: 3HG37DyLRcWAujv2oh5oEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484676"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484676"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:27 -0800
X-CSE-ConnectionGUID: 3zdegApjTq6umD8yNmmmeA==
X-CSE-MsgGUID: apyICd+2T+qOcAdmf/kwTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433503"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 14/19] lib/xe/xe_spin: Add switch point for preemptible
 spinner
Date: Thu, 20 Nov 2025 19:57:26 -0800
Message-ID: <20251121035715.767226-35-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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

