Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C680ED4336A
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 01:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494D810E55A;
	Fri, 12 Dec 2025 01:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUpSa/XU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E83C10E12A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765501884; x=1797037884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OM/rCI7ZnsdorynFwCuetZ5RrIhQPEig5PgF5IZC+Gc=;
 b=VUpSa/XUWo6e5K9QQRcZxRWtFHPe6bfbugbV9sjbq4kaccKewza1p2xS
 TD6u8Q6aXAqxT+xRqrSYyWNhDzlFz6aQfPa9l8Y+MSaYxhhXsqyjfw/gr
 gcLFb+Iyd1oykO5V9YOWqbUUjHSQ359Tb2iisuqwmg4WfsCBw1lpSA8at
 4JNNPywYQQub5LQRrucubvchXt2Lt8YG3Nkvt/l2+yK8DFfDhgN7y6tlZ
 57sPd4wKnVVlEEY4n2wI+aYlsaFZ5vGqwrvcAt7HhSryawZuz8uflJUJI
 tX3+I/6rprBKxhSdUizPYN9K3lsjiI/i9O6fBepvF/XB3gP7Hf/Ymg6rw Q==;
X-CSE-ConnectionGUID: DjerJoTxTdSp83S4bydaqQ==
X-CSE-MsgGUID: U9pGeiTeQTGpN/LL+Tkg7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71118050"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71118050"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:24 -0800
X-CSE-ConnectionGUID: sysxh/e1TdyNUFmBgKvjVA==
X-CSE-MsgGUID: E4aOU+ovTUqSikc6WTxsKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196031253"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v5 14/18] lib/xe/xe_spin: Add multi-queue switch point for the
 spinner
Date: Thu, 11 Dec 2025 17:11:26 -0800
Message-ID: <20251212011115.1685703-34-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
References: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
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

When the new 'multi_queue_switch' option is specified, insert
a MI_SEMAPHORE_WAIT command in the spinner batch buffer. This
acts as the queue switch point for in multi queue mode.
Allow user to control the wait condition.

v5: Add new variable multi_queue_switch instead of piggy
    backing on existing preempt variable.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 include/intel_gpu_commands.h |  1 +
 lib/xe/xe_spin.c             | 41 ++++++++++++++++++++++++++++++++++++
 lib/xe/xe_spin.h             |  5 +++++
 3 files changed, 47 insertions(+)

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
index 1b12ce991..ff19128b6 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -58,6 +58,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 
 	spin->start = 0;
 	spin->end = 0xffffffff;
+	spin->wait_cond = 0;
 	spin->ticks_delta = 0;
 
 	if (opts->ctx_ticks) {
@@ -174,6 +175,24 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 					   opts->mem_copy->dst->mocs_index;
 	}
 
+	/*
+	 * Insert a MI_SEMAPHORE_WAIT_CMD instruction with condition controlled
+	 * by the user which acts as a queue switch point in multi queue mode.
+	 */
+	if (opts->multi_queue_switch) {
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
@@ -214,6 +233,28 @@ void xe_spin_end(struct xe_spin *spin)
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
+	WRITE_ONCE(spin->wait_cond, 1);
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
+	WRITE_ONCE(spin->wait_cond, 0);
+}
+
 /**
  * xe_spin_create:
  * @opt: controlling options such as allocator handle, exec_queue, vm etc
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 92479eb45..5c7566423 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -46,6 +46,7 @@ struct xe_spin_mem_copy {
  * struct xe_spin_opts
  * @addr: offset of spinner within vm
  * @preempt: allow spinner to be preempted or not
+ * @multi_queue_switch: Add a multi-queue switch point
  * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
  * @mem_copy: container of objects used for memory copy (optional)
  *
@@ -54,6 +55,7 @@ struct xe_spin_mem_copy {
 struct xe_spin_opts {
 	uint64_t addr;
 	bool preempt;
+	bool multi_queue_switch;
 	uint32_t ctx_ticks;
 	bool write_timestamp;
 	struct xe_spin_mem_copy *mem_copy;
@@ -65,6 +67,7 @@ struct xe_spin {
 	uint64_t pad;
 	uint32_t start;
 	uint32_t end;
+	uint32_t wait_cond;
 	uint32_t ticks_delta;
 	uint64_t exec_sync;
 	uint32_t timestamp;
@@ -77,6 +80,8 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
+void xe_spin_preempt_wait(struct xe_spin *spin);
+void xe_spin_preempt_nowait(struct xe_spin *spin);
 
 /*
  * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
-- 
2.43.0

