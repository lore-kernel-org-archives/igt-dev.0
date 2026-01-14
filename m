Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A780BD31A13
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CD610E362;
	Wed, 14 Jan 2026 06:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEquoeoX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692D210E362
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373451; x=1799909451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8pueAxS9UbM3GboG2KBPg/JHKpGx63/94dlZtX281KI=;
 b=AEquoeoXOz5TSpzHMQrxA3/DHMJynY2SN7/jfmNn2rxrnyZLeNt7l4sz
 JUVkbZw52YbsCr8C7iO9SZ3vvTC5BYl6vGCG7OZ4khqoKF8Yt/uRuDzRA
 mgHDAFmQYGGvfdNERn5tZeVi6dLk+foW/bhR9XDTJ2Pt4VW7iFNDk+a+c
 3toq+Qur8JFfLSN6tzg8pTOxlYAsWYoG7jkMYGwn0z5DKVRiVvnh4C+Gg
 6AZq3PQAmuuB4Kky8jhg2UuIfHT8dP8ke/b3ELnk2SAwHiohL0RCeVSmU
 Po6hmYgnK/QSED5k3CW97+VTpxlovA6YL7S1PqQz58D+5JxiOFp+3DB2c w==;
X-CSE-ConnectionGUID: 90/lkLLES4eOxGFVbAku2A==
X-CSE-MsgGUID: WTxVxc0pQGq368ZWDKA4ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73506570"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="73506570"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:50:51 -0800
X-CSE-ConnectionGUID: VMDngReIRL+oxr1mcN9yrA==
X-CSE-MsgGUID: /zZc3HmlQCiNiXY4Qi+liA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204612492"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa007.jf.intel.com with ESMTP; 13 Jan 2026 22:50:49 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com, Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_multi_queue: enable preempt flag for Q0
Date: Wed, 14 Jan 2026 06:50:48 +0000
Message-ID: <20260114065048.833061-1-x.wang@intel.com>
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

The spinner preempt flag enables queue preemption and multi-queue
switching. Always enable preempt flag while inserting a multi-queue
switch point. In priority test, we need multi-queue switch point
only in Q0 which acts as a gating queue until all other queues
with different priorities have been submitted to the hardware.

Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_spin.c                  | 2 +-
 tests/intel/xe_exec_multi_queue.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 4dc110c22..0bc06aec3 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -181,7 +181,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	 */
 	if (opts->multi_queue_switch) {
 		uint64_t wait_addr = opts->addr + offsetof(struct xe_spin, wait_cond);
-
+		igt_assert_f(opts->preempt, "preempt field is required to enable multi-queue switching\n");
 		spin->batch[b++] = MI_SEMAPHORE_WAIT_CMD |
 				MI_SEMAPHORE_POLL |
 				MI_SEMAPHORE_QUEUE_SWITCH_MODE |
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 6bc6f9f63..32a84ef6b 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -453,8 +453,8 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 
 	for (i = 0; i < num_queues; i++) {
 		uint64_t spin_addr = addr + i * sizeof(struct xe_spin);
-
-		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch = true);
+		/* Insert multi-queue switch point in Q0 to validate priority based queue switching */
+		xe_spin_init_opts(spin[i], .addr = spin_addr, .multi_queue_switch = !i, .preempt = !i);
 		sync.addr = spin_addr + (char *)&spin[i]->exec_sync - (char *)spin[i];
 		exec.exec_queue_id = exec_queues[i];
 		exec.address = spin_addr;
-- 
2.43.0

