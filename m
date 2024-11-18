Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A93D60CFA
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642A710E572;
	Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lL7n6VGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB42F10E569
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972959; x=1763508959;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0CfghZNeiZ/DK/IeKHwi+ZoI/7jLbVs/H+RcKIZeBk8=;
 b=lL7n6VGkvmEX91mhtdoQ/Ml6DHOhFQoK3ljdEI2gYcLqSLJle85Rwui/
 vfUw3EWuAk/gYoueufLzv0iq9DnG80VCdLOj7MFkP2U5Ar8ylBHdLEH4v
 nCYtg6paQm6JagkmecfRWHhM0srBvmmc7BPV85A/b3lao/OaIdWmtI7RO
 MSMb2sH+jD+YPCLk3Ud/5aqSiDyBv+Beu8g0+/s7hn7bjld3jk72Z9siu
 L18WTnLbWEhPFw4BciDXj8dRBgxZ0k7RUiApuU35mDyX4+ieOz2LasnjE
 9ry6HhlTQ5cm2l6l6Fv5P4iyHQTyjEmg2DdyoI5OJL5zhbiuoNx9ZCSHP g==;
X-CSE-ConnectionGUID: fmQNixb7RwutsTPeKtcr5w==
X-CSE-MsgGUID: 5W3E7GjeRsOVN1x8aLIx0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451246"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451246"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:54 -0800
X-CSE-ConnectionGUID: bi9S7DIKS3KyCLghhf4nJQ==
X-CSE-MsgGUID: UWkgxEMFTsWSxkUpRffQrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245242"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 21/29] drm/xe: Enable preempt fences on usermap queues
Date: Mon, 18 Nov 2024 15:36:12 -0800
Message-Id: <20241118233620.2373819-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

Preempt fences are used by usermap queues to implement dynamic memory
(BO eviction, userptr invalidation), enable preempt fences on usermap
queues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  3 ++-
 drivers/gpu/drm/xe/xe_pt.c         |  3 +--
 drivers/gpu/drm/xe/xe_vm.c         | 18 ++++++++----------
 drivers/gpu/drm/xe/xe_vm.h         |  2 +-
 4 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index a22f089ccec6..987584090263 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -794,7 +794,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		if (IS_ERR(q))
 			return PTR_ERR(q);
 
-		if (xe_vm_in_preempt_fence_mode(vm)) {
+		if (xe_vm_in_preempt_fence_mode(vm) ||
+		    xe_exec_queue_is_usermap(q)) {
 			q->lr.context = dma_fence_context_alloc(1);
 
 			err = xe_vm_add_compute_exec_queue(vm, q);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 684dc075deac..a75667346ab3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1882,8 +1882,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	 * the rebind worker
 	 */
 	if (pt_update_ops->wait_vm_bookkeep &&
-	    xe_vm_in_preempt_fence_mode(vm) &&
-	    !current->mm)
+	    vm->preempt.num_exec_queues && !current->mm)
 		xe_vm_queue_rebind_worker(vm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2e67648ed512..16bc1b82d950 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -229,7 +229,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	int err;
 	bool wait;
 
-	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
+	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm) ||
+		  xe_exec_queue_is_usermap(q));
 
 	down_write(&vm->lock);
 	err = drm_gpuvm_exec_lock(&vm_exec);
@@ -280,7 +281,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
  */
 void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	if (!xe_vm_in_preempt_fence_mode(vm))
+	if (!xe_vm_in_preempt_fence_mode(vm) && !xe_exec_queue_is_usermap(q))
 		return;
 
 	down_write(&vm->lock);
@@ -487,7 +488,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	long wait;
 	int __maybe_unused tries = 0;
 
-	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
+	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
 	trace_xe_vm_rebind_worker_enter(vm);
 
 	down_write(&vm->lock);
@@ -1467,10 +1468,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		vm->batch_invalidate_tlb = true;
 	}
 
-	if (vm->flags & XE_VM_FLAG_LR_MODE) {
-		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
+	INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
+	if (vm->flags & XE_VM_FLAG_LR_MODE)
 		vm->batch_invalidate_tlb = false;
-	}
 
 	/* Fill pt_root after allocating scratch tables */
 	for_each_tile(tile, xe, id) {
@@ -1543,8 +1543,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_assert(xe, !vm->preempt.num_exec_queues);
 
 	xe_vm_close(vm);
-	if (xe_vm_in_preempt_fence_mode(vm))
-		flush_work(&vm->preempt.rebind_work);
+	flush_work(&vm->preempt.rebind_work);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -1644,8 +1643,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	/* xe_vm_close_and_put was not called? */
 	xe_assert(xe, !vm->size);
 
-	if (xe_vm_in_preempt_fence_mode(vm))
-		flush_work(&vm->preempt.rebind_work);
+	flush_work(&vm->preempt.rebind_work);
 
 	mutex_destroy(&vm->snap_mutex);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c864dba35e1d..4391dbaeba51 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -216,7 +216,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
-	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
+	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
 	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
 }
 
-- 
2.34.1

