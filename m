Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA1D3B7E2
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363B10E4BD;
	Tue,  9 Dec 2025 03:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjZ4bhs5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3D610E37F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250545; x=1796786545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1j3KEQMZTRlDPhWrKgf5vpB08edSNhHB28AlHGQkUn8=;
 b=SjZ4bhs5sJvrvgx6WcaWBtc8ky+5lQEST+PNAOrG3S4rStUktBrM/2SF
 /6j5JfaxVcjSa97Hgre+nSSvp/dSCb1V0QyhFlc36ZwbjQqvRJGqPFOEB
 HZWzEN5Wbc/BO4XHCLcPB1nRc0HC1hZFpkxKSkNgN552jQhZStVvE1UhO
 dO0890A0c14BrJICIasV4A155NJ1N/GlRkz2ixK6wa738HAXTtlP3YB+z
 N0rlaVVdg0VTasg9aHVa0D/kvq7P+WXt1fLtHa5WTztvNCrEKmVIHbsnd
 P/H9p4h+3nk17FRV4YMvsivqHWLmMuIuzXU4p2njZ6GGMr5zFbuqcavIY Q==;
X-CSE-ConnectionGUID: QtSBiR4iTxOAt92/iCE6lQ==
X-CSE-MsgGUID: xE8xyAvsRzaD37rdB8OCaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164330"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:24 -0800
X-CSE-ConnectionGUID: 50lHd771SBaIE2fkQZc0jQ==
X-CSE-MsgGUID: MZR4UhalQmqk3zL2r77xhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570931"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 14/18] lib/xe/xe_spin: Add switch point for preemptible
 spinner
Date: Mon,  8 Dec 2025 19:22:20 -0800
Message-ID: <20251209032208.1540217-34-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
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
index 1b12ce991..ed68c6a79 100644
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
index 92479eb45..85cf80f5b 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -65,6 +65,7 @@ struct xe_spin {
 	uint64_t pad;
 	uint32_t start;
 	uint32_t end;
+	uint32_t wait_cond;
 	uint32_t ticks_delta;
 	uint64_t exec_sync;
 	uint32_t timestamp;
@@ -77,6 +78,8 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
+void xe_spin_preempt_wait(struct xe_spin *spin);
+void xe_spin_preempt_nowait(struct xe_spin *spin);
 
 /*
  * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
-- 
2.43.0

