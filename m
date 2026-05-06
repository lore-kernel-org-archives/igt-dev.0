Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC458CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 18:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C9010E275;
	Wed,  6 May 2026 18:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTW8+nq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7BD10E275
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778092304; x=1809628304;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WmngtEsq3ZPfZpHNmQqVUoW850HVlZthSe0Hsj7TyQM=;
 b=JTW8+nq5eHh5FpkS/msT/UpuNjzdbHse9IvRC92x7NWKlKUSjxnhsBx7
 WOl9Ijn2CWgYpNqtr93rbf2roxH73JRvb2zv4XpRSO8nXAtefpNqRV+0N
 H8FBvVNJR3a0WjYBCrRA0sr/pQov3Y/8WPqDqmr2ZChcXUYZHIuOE2z8u
 a3grYWX3U0HrpETjbv2msw2hphrfVKXKQcOmjHG85yhftKFGSdNu6xizq
 V+0XrvxMvZg815jRXHExH02P5CiL6hKcRaeeBORusrBQrYMBh2J/r5zaU
 lO/f35aAg0sTH8/z/oRkfkLeZH2ZzOBifGiY4KytjqldhaS5dbBlf35lG A==;
X-CSE-ConnectionGUID: HURj2goMT9SLKH8EX4+w6Q==
X-CSE-MsgGUID: H49JAl9aT7Cvbsg/Q6f47Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="66564514"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="66564514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 11:31:43 -0700
X-CSE-ConnectionGUID: GdOvjBULR2uVwpkDfDqrPA==
X-CSE-MsgGUID: zyoE4XmwSfmH+bBbNKlAnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259658728"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 11:31:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/3] lib/xe/xe_spin: Add option for QUEUE_TIMESTAMP
Date: Wed,  6 May 2026 11:31:38 -0700
Message-ID: <20260506183137.51479-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
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

From: gta <gta@DUT4637NVLP.fm.intel.com>

In multi-queue case, CTX_TIMESTAMP register does not
provide the running time of individual queues of a group.
Provide the option for spinner to read timestamp from the
QUEUE_TIMESTAMP registers instead which is useful in the
multi-queue scenarios.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_spin.c | 9 +++++----
 lib/xe/xe_spin.h | 2 ++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 14952ca90e..8743107898 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -25,7 +25,8 @@
 #define MI_LRI_CS_MMIO				(1 << 19)
 #define MI_LRR_DST_CS_MMIO			(1 << 19)
 #define MI_LRR_SRC_CS_MMIO			(1 << 18)
-#define CTX_TIMESTAMP 0x3a8
+#define CTX_TIMESTAMP		0x3a8
+#define QUEUE_TIMESTAMP		0x4c0
 #define CS_GPR(x) (0x600 + 8 * (x))
 
 enum { START_TS, NOW_TS };
@@ -67,7 +68,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = CS_GPR(START_TS) + 4;
 		spin->batch[b++] = 0;
 		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
-		spin->batch[b++] = CTX_TIMESTAMP;
+		spin->batch[b++] = opts->use_queue_timestamp ? QUEUE_TIMESTAMP : CTX_TIMESTAMP;
 		spin->batch[b++] = CS_GPR(START_TS);
 	}
 
@@ -83,7 +84,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 
 	if (opts->write_timestamp) {
 		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
-		spin->batch[b++] = CTX_TIMESTAMP;
+		spin->batch[b++] = opts->use_queue_timestamp ? QUEUE_TIMESTAMP : CTX_TIMESTAMP;
 		spin->batch[b++] = CS_GPR(NOW_TS);
 
 		spin->batch[b++] = MI_STORE_REGISTER_MEM_GEN8 | MI_SRM_CS_MMIO;
@@ -97,7 +98,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = CS_GPR(NOW_TS) + 4;
 		spin->batch[b++] = 0;
 		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
-		spin->batch[b++] = CTX_TIMESTAMP;
+		spin->batch[b++] = opts->use_queue_timestamp ? QUEUE_TIMESTAMP : CTX_TIMESTAMP;
 		spin->batch[b++] = CS_GPR(NOW_TS);
 
 		/* delta = now - start; inverted to match COND_BBE */
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index db0febd8ab..75a6ada420 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -51,6 +51,7 @@ struct xe_spin_mem_copy {
  * @multi_queue_switch_on_wait: Add a SEMAPHORE_WAIT multi-queue switch point
  * and have the queue switch only happen if waiting on the semaphore.
  * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
+ * @use_queue_timestamp: Use QUEUE_TIMESTAMP register instead of CTX_TIMESTAMP
  * @mem_copy: container of objects used for memory copy (optional)
  *
  * Used to initialize struct xe_spin spinner behavior.
@@ -62,6 +63,7 @@ struct xe_spin_opts {
 	bool multi_queue_switch_on_wait;
 	uint32_t ctx_ticks;
 	bool write_timestamp;
+	bool use_queue_timestamp;
 	struct xe_spin_mem_copy *mem_copy;
 };
 
-- 
2.43.0

