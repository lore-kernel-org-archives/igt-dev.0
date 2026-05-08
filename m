Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A2FCD37AC
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 23:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7143510E031;
	Fri,  8 May 2026 23:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Otcp8p9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFF910E35A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 23:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778283563; x=1809819563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wvzBdg8Yq/2m3pYUCWHEcUDGWTq7Mr4evJZjRu0VwNc=;
 b=Otcp8p9/YHEuCeLdeN2dc1A9OP1VZr87f1KD6HZaEHK+GyrsZdNsWUM9
 Mv36LZa3QdINXrDZWYG6ltZaceHCLlmKZtsPP2Wh7Vz/gsRw+25GE4A+C
 Tpnxz2zBvhH+CJtQZqmPx44F1keL7uH/PZwrrghgl9qPARuq35Qdbyb7E
 QSLLgNOYmaR3LJ+x43YPegeNffkohCtihZsdyP2fBLVd+oSeR/qkgNUyQ
 xhC4pDTNJlPfkJaky2+Alxp7r1VV35barJJX7Vv3ifi4wIq9inIT2yuT3
 jQbrZJUuTiw40ar9yARFWU7S4C60fq8nve3lfx4uV1+m6Gk8cSyHeHc4d g==;
X-CSE-ConnectionGUID: Lkr34snLR/ClO4K1d7fkug==
X-CSE-MsgGUID: OPToTcMMQlGavU9HxZV1Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89852622"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="89852622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 16:39:23 -0700
X-CSE-ConnectionGUID: bMoHe2AeRTeXxAvaVv6pyQ==
X-CSE-MsgGUID: xn05zFFEQf+pdAVFXy8cew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="241253819"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 16:39:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 1/3] lib/xe/xe_spin: Enhance multi-queue switch option
Date: Fri,  8 May 2026 16:39:17 -0700
Message-ID: <20260508233917.87720-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508233917.87720-5-niranjana.vishwanathapura@intel.com>
References: <20260508233917.87720-5-niranjana.vishwanathapura@intel.com>
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

Allow user to control whether the multi-queue switch should
happen after parsing the MI_SEMAPHORE_WAIT instruction or
only if the instruction is unsuccessful in getting the
semaphore, thus having to wait.

Ensure that in xe_exec_multi_queue@priority test, the multi-queue
switch happens only when the spinner has to wait for the semaphore.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_spin.c                  | 13 +++++++------
 lib/xe/xe_spin.h                  |  6 +++++-
 tests/intel/xe_exec_multi_queue.c |  2 +-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 4dc110c222..14952ca90e 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -179,14 +179,15 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	 * Insert a MI_SEMAPHORE_WAIT_CMD instruction with condition controlled
 	 * by the user which acts as a queue switch point in multi queue mode.
 	 */
-	if (opts->multi_queue_switch) {
+	if (opts->multi_queue_switch || opts->multi_queue_switch_on_wait) {
 		uint64_t wait_addr = opts->addr + offsetof(struct xe_spin, wait_cond);
+		uint32_t sema_cmd = MI_SEMAPHORE_WAIT_CMD | MI_SEMAPHORE_POLL |
+				    MI_SEMAPHORE_SAD_EQ_SDD | 3;
 
-		spin->batch[b++] = MI_SEMAPHORE_WAIT_CMD |
-				MI_SEMAPHORE_POLL |
-				MI_SEMAPHORE_QUEUE_SWITCH_MODE |
-				MI_SEMAPHORE_SAD_EQ_SDD |
-				3;
+		if (opts->multi_queue_switch_on_wait)
+			sema_cmd |= MI_SEMAPHORE_QUEUE_SWITCH_MODE;
+
+		spin->batch[b++] = sema_cmd;
 		spin->batch[b++] = 0;
 		spin->batch[b++] = wait_addr;
 		spin->batch[b++] = wait_addr >> 32;
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 31154997b9..db0febd8ab 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -46,7 +46,10 @@ struct xe_spin_mem_copy {
  * struct xe_spin_opts
  * @addr: offset of spinner within vm
  * @preempt: allow spinner to be preempted or not
- * @multi_queue_switch: Add a multi-queue switch point
+ * @multi_queue_switch: Add a SEMAPHORE_WAIT multi-queue switch point
+ * and have the queue switch happen after command is parsed.
+ * @multi_queue_switch_on_wait: Add a SEMAPHORE_WAIT multi-queue switch point
+ * and have the queue switch only happen if waiting on the semaphore.
  * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
  * @mem_copy: container of objects used for memory copy (optional)
  *
@@ -56,6 +59,7 @@ struct xe_spin_opts {
 	uint64_t addr;
 	bool preempt;
 	bool multi_queue_switch;
+	bool multi_queue_switch_on_wait;
 	uint32_t ctx_ticks;
 	bool write_timestamp;
 	struct xe_spin_mem_copy *mem_copy;
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 0479554bb6..6f90c3e4e8 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -459,7 +459,7 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < num_queues; i++) {
 		uint64_t spin_addr = addr + i * sizeof(struct xe_spin);
 
-		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch = true,
+		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch_on_wait = true,
 				  .write_timestamp = true);
 		/*
 		 * Pre-set all spinners to preempt-wait so each queue, once
-- 
2.43.0

