Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6152D60D03
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FAF10E581;
	Mon, 18 Nov 2024 23:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7e1z2jx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006E110E576
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972959; x=1763508959;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XTgAsegDjFV05M1nrJP912+yjN4Cgy2+lhTXrEG8ScA=;
 b=k7e1z2jx+lAYSFpFZ61UsQtfC9Vj84KlUcAbfKWxH7L+ZYzyt30Y04pG
 OzKA0cJbYQe3uTVkJBFAW6wIvrU8UK4bEI+vBsBYYt6eN/AcETC0XwaJK
 NHOvEA8uxecWqF/iw9VMhKW55HnjnZ8ctyOrBKaRhXGkLi7GcXvM3Ty/6
 nF54q0W6V0MK+BPUzgs/AhD5FJOYeiwLwTCLWtGsLZljC/1TIHa4GE03J
 A0TfmJPky/ndRWTSasJKxIeeJlkBbMpn7MMb0U4opEvIbkwN7vFcRLKgo
 bezIGp0R/2oUlTCfcK3NfrTXwWBLSDMK7zmK5LmrcNUlF4kXH9GHT9UbI A==;
X-CSE-ConnectionGUID: diCi1UJMS66M50A3Jr+MIA==
X-CSE-MsgGUID: R497is+vRVa3tMgt4q7wMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451256"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451256"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:58 -0800
X-CSE-ConnectionGUID: wBafm9+uSSOySsjEJ6+6gA==
X-CSE-MsgGUID: zmkj7NvQT6y7B9hQl8OqIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245254"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 28/29] drm/xe: Add VM convert fence IOCTL
Date: Mon, 18 Nov 2024 15:36:19 -0800
Message-Id: <20241118233620.2373819-29-matthew.brost@intel.com>
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

Basically a version of the resume worker which also converts user syncs
to kerenl syncs (dma-fences) and vise versa. The expoxrted dma-fences in
the conversion guard against preemption which is required to avoid
breaking dma fence rules (no memory allocations in path of dma-fence,
resume requires memory allocations).

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c        |   1 +
 drivers/gpu/drm/xe/xe_preempt_fence.c |   9 +
 drivers/gpu/drm/xe/xe_vm.c            | 247 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h            |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h      |   4 +
 5 files changed, 254 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 573b5f3df0c8..56dd26eddd92 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -191,6 +191,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_CONVERT_FENCE, xe_vm_convert_fence_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 80a8bc82f3cc..c225f3cc82a3 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -12,6 +12,14 @@ static struct xe_exec_queue *to_exec_queue(struct dma_fence_preempt *fence)
 	return container_of(fence, struct xe_preempt_fence, base)->q;
 }
 
+static struct dma_fence *
+xe_preempt_fence_preempt_delay(struct dma_fence_preempt *fence)
+{
+	struct xe_exec_queue *q = to_exec_queue(fence);
+
+	return q->vm->preempt.exported_fence ?: dma_fence_get_stub();
+}
+
 static int xe_preempt_fence_preempt(struct dma_fence_preempt *fence)
 {
 	struct xe_exec_queue *q = to_exec_queue(fence);
@@ -35,6 +43,7 @@ static void xe_preempt_fence_preempt_finished(struct dma_fence_preempt *fence)
 }
 
 static const struct dma_fence_preempt_ops xe_preempt_fence_ops = {
+	.preempt_delay = xe_preempt_fence_preempt_delay,
 	.preempt = xe_preempt_fence_preempt,
 	.preempt_wait = xe_preempt_fence_preempt_wait,
 	.preempt_finished = xe_preempt_fence_preempt_finished,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 16bc1b82d950..5078aeea2bd8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -6,6 +6,7 @@
 #include "xe_vm.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/dma-fence-chain.h>
 #include <linux/nospec.h>
 
 #include <drm/drm_exec.h>
@@ -441,29 +442,44 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 }
 
 static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
-				 bool *done)
+				 int extra_fence_count, bool *done)
 {
 	int err;
 
+	*done = false;
+
 	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, 0);
 	if (err)
 		return err;
 
-	if (xe_vm_is_idle(vm)) {
+	if (xe_vm_in_preempt_fence_mode(vm) && xe_vm_is_idle(vm)) {
 		vm->preempt.rebind_deactivated = true;
 		*done = true;
 		return 0;
 	}
 
+	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, 0);
+	if (err)
+		return err;
+
 	if (!preempt_fences_waiting(vm)) {
 		*done = true;
+
+		if (extra_fence_count) {
+			struct drm_gem_object *obj;
+			unsigned long index;
+
+			drm_exec_for_each_locked_object(exec, index, obj) {
+				err = dma_resv_reserve_fences(obj->resv,
+							      extra_fence_count);
+				if (err)
+					return err;
+			}
+		}
+
 		return 0;
 	}
 
-	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, 0);
-	if (err)
-		return err;
-
 	err = wait_for_existing_preempt_fences(vm);
 	if (err)
 		return err;
@@ -474,7 +490,8 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	 * The fence reservation here is intended for the new preempt fences
 	 * we attach at the end of the rebind work.
 	 */
-	return xe_vm_validate_rebind(vm, exec, vm->preempt.num_exec_queues);
+	return xe_vm_validate_rebind(vm, exec, vm->preempt.num_exec_queues +
+				     extra_fence_count);
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
@@ -509,9 +526,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 
 	drm_exec_until_all_locked(&exec) {
-		bool done = false;
+		bool done;
 
-		err = xe_preempt_work_begin(&exec, vm, &done);
+		err = xe_preempt_work_begin(&exec, vm, 0, &done);
 		drm_exec_retry_on_contention(&exec);
 		if (err || done) {
 			drm_exec_fini(&exec);
@@ -1638,6 +1655,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 		container_of(w, struct xe_vm, destroy_work);
 	struct xe_device *xe = vm->xe;
 	struct xe_tile *tile;
+	struct dma_fence *fence;
 	u8 id;
 
 	/* xe_vm_close_and_put was not called? */
@@ -1660,6 +1678,9 @@ static void vm_destroy_work_func(struct work_struct *w)
 	if (vm->xef)
 		xe_file_put(vm->xef);
 
+	dma_fence_chain_for_each(fence, vm->preempt.exported_fence);
+	dma_fence_put(vm->preempt.exported_fence);
+
 	kfree(vm);
 }
 
@@ -3403,3 +3424,211 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	}
 	kvfree(snap);
 }
+
+static int check_semaphores(struct xe_vm *vm, struct xe_sync_entry *syncs,
+			    struct drm_exec *exec, int num_syncs)
+{
+	int i, j;
+
+	for (i = 0; i < num_syncs; ++i) {
+		struct xe_bo *bo = syncs[i].bo;
+		struct drm_gem_object *obj = &bo->ttm.base;
+
+		if (bo->vm == vm)
+			continue;
+
+		for (j = 0; j < exec->num_objects; ++j) {
+			if (obj == exec->objects[j])
+				break;
+		}
+
+		if (j == exec->num_objects)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_convert_fence __user *args = data;
+	struct drm_xe_sync __user *syncs_user;
+	struct drm_xe_semaphore __user *semaphores_user;
+	struct xe_sync_entry *syncs = NULL;
+	struct xe_vm *vm;
+	int err = 0, i, num_syncs = 0;
+	bool done = false;
+	struct drm_exec exec;
+	unsigned int fence_count = 0;
+	LIST_HEAD(preempt_fences);
+	ktime_t end = 0;
+	long wait;
+	int __maybe_unused tries = 0;
+	struct dma_fence *fence, *prev = NULL;
+
+	if (XE_IOCTL_DBG(xe, args->extensions || args->flags ||
+			 args->reserved[0] || args->reserved[1] ||
+			 args->pad))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	err = down_write_killable(&vm->lock);
+	if (err)
+		goto put_vm;
+
+	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
+		err = -ENOENT;
+		goto release_vm_lock;
+	}
+
+	syncs = kcalloc(args->num_syncs * 2, sizeof(*syncs), GFP_KERNEL);
+	if (!syncs) {
+		err = -ENOMEM;
+		goto release_vm_lock;
+	}
+
+	syncs_user = u64_to_user_ptr(args->syncs);
+	semaphores_user = u64_to_user_ptr(args->semaphores);
+	for (i = 0; i < args->num_syncs; i++, num_syncs++) {
+		struct xe_sync_entry *sync = &syncs[i];
+		struct xe_sync_entry *semaphore_sync =
+			&syncs[args->num_syncs + i];
+
+		err = xe_sync_entry_parse(xe, xef, sync, &syncs_user[i],
+					  SYNC_PARSE_FLAG_DISALLOW_USER_FENCE);
+		if (err)
+			goto release_syncs;
+
+		err = xe_sync_semaphore_parse(xe, xef, semaphore_sync,
+					      &semaphores_user[i],
+					      sync->flags);
+		if (err) {
+			xe_sync_entry_cleanup(&syncs[i]);
+			goto release_syncs;
+		}
+	}
+
+retry:
+	if (xe_vm_userptr_check_repin(vm)) {
+		err = xe_vm_userptr_pin(vm);
+		if (err)
+			goto release_syncs;
+	}
+
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+
+	drm_exec_until_all_locked(&exec) {
+		err = xe_preempt_work_begin(&exec, vm, num_syncs, &done);
+		drm_exec_retry_on_contention(&exec);
+		if (err) {
+			drm_exec_fini(&exec);
+			if (err && xe_vm_validate_should_retry(&exec, err, &end))
+				err = -EAGAIN;
+
+			goto release_syncs;
+		}
+	}
+
+	if (XE_IOCTL_DBG(xe, check_semaphores(vm, syncs + num_syncs,
+					      &exec, num_syncs))) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (!done) {
+		err = alloc_preempt_fences(vm, &preempt_fences, &fence_count);
+		if (err)
+			goto out_unlock;
+
+		wait = dma_resv_wait_timeout(xe_vm_resv(vm),
+					     DMA_RESV_USAGE_KERNEL,
+					     false, MAX_SCHEDULE_TIMEOUT);
+		if (wait <= 0) {
+			err = -ETIME;
+			goto out_unlock;
+		}
+	}
+
+#define retry_required(__tries, __vm) \
+	(IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT) ? \
+	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
+	__xe_vm_userptr_needs_repin(__vm))
+
+	down_read(&vm->userptr.notifier_lock);
+	if (retry_required(tries, vm)) {
+		up_read(&vm->userptr.notifier_lock);
+		err = -EAGAIN;
+		goto out_unlock;
+	}
+
+#undef retry_required
+
+	/* Point of no return. */
+	xe_assert(vm->xe, list_empty(&vm->rebind_list));
+
+	for (i = 0; i < num_syncs; i++) {
+		struct xe_sync_entry *sync = &syncs[i];
+		struct xe_sync_entry *semaphore_sync = &syncs[num_syncs + i];
+
+		if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) {
+			xe_sync_entry_signal(sync, semaphore_sync->fence);
+			xe_sync_entry_hw_fence_installed(semaphore_sync);
+
+			dma_fence_put(prev);
+			prev = dma_fence_get(vm->preempt.exported_fence);
+
+			dma_fence_chain_init(semaphore_sync->chain_fence,
+					     prev, semaphore_sync->fence,
+					     vm->preempt.seqno++);
+
+			vm->preempt.exported_fence =
+				&semaphore_sync->chain_fence->base;
+			semaphore_sync->chain_fence = NULL;
+
+			semaphore_sync->fence = NULL;   /* Ref owned by chain */
+		} else {
+			xe_sync_entry_signal(semaphore_sync, sync->fence);
+			drm_gpuvm_resv_add_fence(&vm->gpuvm, &exec,
+						 dma_fence_chain_contained(sync->fence),
+						 DMA_RESV_USAGE_BOOKKEEP,
+						 DMA_RESV_USAGE_BOOKKEEP);
+		}
+	}
+
+	dma_fence_chain_for_each(fence, prev);
+	dma_fence_put(prev);
+
+	if (!done) {
+		spin_lock(&vm->xe->ttm.lru_lock);
+		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
+		spin_unlock(&vm->xe->ttm.lru_lock);
+
+		arm_preempt_fences(vm, &preempt_fences);
+		resume_and_reinstall_preempt_fences(vm, &exec);
+	}
+	up_read(&vm->userptr.notifier_lock);
+
+out_unlock:
+	drm_exec_fini(&exec);
+release_syncs:
+	while (err != -EAGAIN && num_syncs--) {
+		xe_sync_entry_cleanup(&syncs[num_syncs]);
+		xe_sync_entry_cleanup(&syncs[args->num_syncs + num_syncs]);
+	}
+release_vm_lock:
+	if (err == -EAGAIN)
+		goto retry;
+	up_write(&vm->lock);
+put_vm:
+	xe_vm_put(vm);
+	free_preempt_fences(&preempt_fences);
+	kfree(syncs);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4391dbaeba51..c1c70239cc91 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -181,6 +181,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
+int xe_vm_convert_fence_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file);
 
 void xe_vm_close_and_put(struct xe_vm *vm);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7f9a303e51d8..c5cb83722706 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -254,6 +254,10 @@ struct xe_vm {
 		 * BOs
 		 */
 		struct work_struct rebind_work;
+		/** @seqno: Seqno of exported dma-fences */
+		u64 seqno;
+		/** @exported_fence: Chain of exported dma-fences */
+		struct dma_fence *exported_fence;
 	} preempt;
 
 	/** @um: unified memory state */
-- 
2.34.1

