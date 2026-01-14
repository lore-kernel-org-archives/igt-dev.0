Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B9CD31A0F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E48510E1C0;
	Wed, 14 Jan 2026 06:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+vXcRxo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A4710E31A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768372362; x=1799908362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XI2X2mBBwm1xBXnn09FjR2ubYw6XwLWo82oFqr4tLdo=;
 b=m+vXcRxo1pJmeFdz3UdgHpNulFcrHWkZ1YFf+bUdQ5c6H1a5t/uFsnHF
 HgKbUaPQRunenHQtLQyuGGskx2tXBacdGCUknk3LVXFUvjC2ygnlI8jRc
 xfjt6B+Wau8jonYsttQ37VE8OV4jSzfeHHfKW328SJv8OMMryfHaE7hhj
 W0xXkphrNRk+IdSyjlEJVJ68uzEyfJcx92PpoKKiEh20IV8YjopL7pbkq
 X3AOdmGFMYvGDa+10qEbbiPP+gRovmQ6UCRBLx5lvbmhUYz4VUTgw/2d8
 rM4WXkATWMFkR19USjU5mRi3xVDRB0XJ/LyQuZS0Nm6aCHZmOeBeSe69n Q==;
X-CSE-ConnectionGUID: F01YZHIKTIeuz0f/RwfqFw==
X-CSE-MsgGUID: k0X8df7ATJG1i7kiksOqRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87079792"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="87079792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:32:42 -0800
X-CSE-ConnectionGUID: zn3ecI1yRWyRicI+kMdlHQ==
X-CSE-MsgGUID: BHEgGoF6QGCSw4GeIyOeeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205014394"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa009.fm.intel.com with ESMTP; 13 Jan 2026 22:32:41 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com, Xin Wang <x.wang@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH] tests/intel/xe_exec_multi_queue: enable preempt flag for Q0
Date: Wed, 14 Jan 2026 06:32:36 +0000
Message-ID: <20260114063236.831396-1-x.wang@intel.com>
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
switching. Always enable premept flag while inserting multi-queue
switch point. We need multi-queue switch point only in Q0 which
acts as a gating queue until all other queues with different
priorities are submitted to hardware.

Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
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

