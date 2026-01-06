Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1038ECD042B
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 01:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49BB10E44B;
	Tue,  6 Jan 2026 01:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ta0OLs9U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEE410E44B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 01:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767663024; x=1799199024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BhpSHZATPwrTLXTyvJXP63peYDq+95dHgjWKo3/cIy0=;
 b=Ta0OLs9UOKmRsYlRTBd6WBhMBHtHeSWiQUt08QALSlEI1yAHsWF2R2UI
 nyduHSGJ2Wi36yoDdsvAI9XGaLa/DQ6USV8Cy96kpEQkl3fYxYxNMbB/c
 Z29GxG+DtzQiDhAcJ2EiYPzlCH7pPzRcWHIiLf39IN9PsGLYKMedyyotl
 mtc6VfPBWvGp+00mphUIu9TTHXZFnLwdYoF6aqv5oeOXG7yL+M36hl4nG
 yYxtNNz83rvjkwnw82XUUmjFtr0wu57nbtPtdEzGIarvgtppvXiHPbuHf
 W7H2z9RmdobtcVroyuF9S7sRYkT1dIaBweSYsXaPrTH1nfRdhDu+KbTO2 A==;
X-CSE-ConnectionGUID: YjcBslQwRVi7s8u5oxba9Q==
X-CSE-MsgGUID: RxHPXtn7RwCfgPLmf2NjZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80483739"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="80483739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:30:23 -0800
X-CSE-ConnectionGUID: hZNCCM8HTDO4x8o1RuWhEA==
X-CSE-MsgGUID: RhY2ncpnSOeileUTAnIP4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201756982"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:30:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com,
	stuart.summers@intel.com
Subject: [PATCH 1/3] Revert "tests/intel/xe_exec_multi_queue: Keep group
 active in exec-sanity"
Date: Mon,  5 Jan 2026 17:30:18 -0800
Message-ID: <20260106013018.2851521-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
References: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
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

This reverts commit 1806ab9c982ccaaa9d60cdde16bc1dc3bb250654.

The KEEP_ACTIVE feature is being reverted, update exec-sanity test.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 888e7f1a81..c37aea0a25 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -282,7 +282,6 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
 	};
 	uint64_t ext = to_user_pointer(&multi_queue);
 	bool preempt_mode = flags & PREEMPT_MODE;
-	bool keep_active = flags & KEEP_ACTIVE;
 	int i;
 
 	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
@@ -294,13 +293,9 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
 		sync.handle = syncobj_create(fd, 0);
 	}
 
-	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
-			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
 	bo_size = xe_bb_size(fd, sizeof(struct xe_spin));
 
-	if (keep_active)
-		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
-
 	for (i = 0; i < NUM_QUEUES; i++) {
 		bo[i] = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -348,27 +343,14 @@ __test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned in
 	/* Destroy primary queue */
 	xe_exec_queue_destroy(fd, exec_queues[0]);
 
-	/* Validate submission on secondary queues after destroying the primary */
+	/* Validate submission on secondary queues fail after destroying the primary */
 	xe_spin_init_opts(spin[1], .addr = addr[1]);
 	if (preempt_mode)
 		sync.addr = addr[1] + (char *)&spin[1]->exec_sync - (char *)spin[1];
 
 	exec.exec_queue_id = exec_queues[1];
 	exec.address = addr[1];
-
-	if (keep_active) {
-		xe_exec(fd, &exec);
-		xe_spin_wait_started(spin[1]);
-		xe_spin_end(spin[1]);
-		if (preempt_mode) {
-			xe_wait_ufence(fd, &spin[1]->exec_sync, USER_FENCE_VALUE, exec_queues[1], fence_timeout);
-		} else {
-			igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
-			syncobj_reset(fd, &sync.handle, 1);
-		}
-	} else {
-		igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
-	}
+	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
 
 	if (preempt_mode)
 		sync.addr = to_user_pointer(&vm_sync);
@@ -408,8 +390,6 @@ test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	__test_exec_sanity(fd, eci, 0);
 	__test_exec_sanity(fd, eci, PREEMPT_MODE);
-	__test_exec_sanity(fd, eci, KEEP_ACTIVE);
-	__test_exec_sanity(fd, eci, PREEMPT_MODE | KEEP_ACTIVE);
 }
 
 static void
-- 
2.43.0

