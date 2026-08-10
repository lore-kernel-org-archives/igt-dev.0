Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676A1C5AD4E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 09:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37FC10E76F;
	Mon, 10 Aug 2026 09:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kdiepwPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EEA10E76E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786354808; x=1817890808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mFSioh37HUUVE6r8VHRW92apzg9R+nQNZ6Yp9N+giic=;
 b=kdiepwPrQJXOkJutBJXQxDVXFS+Jb9rXD1xaLJw5VrIpllxm6gFCzkjY
 Z23QbVvo7rt2MPbK01dnl/pMeG8y8LzjLyM4ZHdKwck4G47PYW5exGAvH
 gQzKeE9FiiDnyauS+h0yHqVF3TRP5Ul/9ZkewqV7NJgfplMoLDGRcUj0w
 sNSiUHzrKV3ZmIgwWTCZDEm9WJV0iCDGH5AkZg/dNpXrQjL6Q8AoqUXND
 cqUBdcfqatClFL4d9H5arOE9Juf0N9j2XZU6J9B9A1VM2L817JlRPUCdh
 qzOwnnAPO56KTDFwnb6FyXgKUV4nvxAd+KPL4W3YddkiITqQ5hxnklSRE Q==;
X-CSE-ConnectionGUID: ayJ1MFvaRZaH5SYqXkkhzA==
X-CSE-MsgGUID: MdfuZX2kSY6zoYR6dg1AXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104256451"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="104256451"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 02:40:08 -0700
X-CSE-ConnectionGUID: 6ND8Lk/rTOis3DmuGqLmPg==
X-CSE-MsgGUID: mVzpOFc0ReGGE17gM2R12A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="266487691"
Received: from unknown (HELO localhost) ([10.94.249.102])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 02:40:06 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com, tvrtko.ursulin@igalia.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 2/2] benchmarks/gem_wsim: add compute/LR mode support
 for Xe VMs
Date: Mon, 10 Aug 2026 11:39:50 +0200
Message-ID: <20260810093950.1696330-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810093950.1696330-1-marcin.bernatowicz@linux.intel.com>
References: <20260810093950.1696330-1-marcin.bernatowicz@linux.intel.com>
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

Introduce new descriptor step:
    'c' - Enable compute/LR mode for VM (Virtual Memory) N (c.N).

Example:

gem_wsim -w "V.1,c.1,v.1.1,1.BCS.100.0.0,1.CCS.8000000.-1.0,1.BCS.100.-1.1"
8.009s elapsed (0.125 workloads/s)

Creates VM 1, enables compute/LR mode on it, assigns context 1 to the VM,
then runs BCS and CCS work with cross-step dependencies (8s CCS depends
on the first BCS step, and the final BCS step depends on the CCS step).

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 benchmarks/gem_wsim.c  | 171 ++++++++++++++++++++++++++++++++++++-----
 benchmarks/wsim/README |  17 +++-
 2 files changed, 165 insertions(+), 23 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 7d9363582..1a4139279 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -132,6 +132,7 @@ enum w_type {
 	WORKINGSET,
 	VM_CREATE,
 	CTX_VM,
+	VM_COMPUTE_MODE,
 };
 
 struct dep_entry {
@@ -246,6 +247,7 @@ struct vm {
 	uint32_t id;
 	bool declared;
 	bool compute_mode;
+	uint32_t bind_exec_queue;
 	uint64_t ahnd;
 };
 
@@ -323,6 +325,7 @@ static unsigned int master_prng;
 static int verbose = 1;
 static int fd;
 static bool is_xe;
+static const uint64_t user_fence_value = 0xdeadbeefdeadbeefull;
 static struct drm_i915_gem_context_param_sseu device_sseu = {
 	.slice_mask = -1 /* Force read on first use. */
 };
@@ -334,10 +337,18 @@ static struct drm_i915_gem_context_param_sseu device_sseu = {
 
 static void w_step_sync(struct w_step *w)
 {
-	if (is_xe)
-		igt_assert(syncobj_wait(fd, &w->xe.syncs[0].handle, 1, INT64_MAX, 0, NULL));
-	else
+	if (is_xe) {
+		if (w->xe.syncs[0].type == DRM_XE_SYNC_TYPE_USER_FENCE) {
+			xe_wait_ufence(fd, &w->xe.data->spin.exec_sync,
+				       w->xe.syncs[0].timeline_value, 0,
+				       INT64_MAX);
+		} else {
+			igt_assert(syncobj_wait(fd, &w->xe.syncs[0].handle, 1,
+						INT64_MAX, 0, NULL));
+		}
+	} else {
 		gem_sync(fd, w->i915.obj[0].handle);
+	}
 }
 
 static int read_timestamp_frequency(int i915)
@@ -1293,6 +1304,20 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 				step.context = ctx_id;
 				step.type = CTX_VM;
 				goto add_step;
+			} else if (!strcmp(field, "c")) {
+				/*
+				 * c.N  - enable compute/LR mode on VM N
+				 * (xe only, ignored on i915)
+				 */
+				field = strtok_r(fstart, ".", &fctx);
+				check_arg(!field,
+					  "Missing VM id at step %u!\n", nr_steps);
+				tmp = atoi(field);
+				check_arg(tmp <= 0,
+					  "Invalid VM id at step %u!\n", nr_steps);
+				step.vm_id = tmp;
+				step.type = VM_COMPUTE_MODE;
+				goto add_step;
 			}
 
 			if (!field) {
@@ -1855,10 +1880,27 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 				    vram_if_possible(fd, eq->hwe_list[0].gt_id),
 				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	w->xe.data = xe_bo_map(fd, w->bb_handle, w->bb_size);
+	w->xe.data->spin.exec_sync = 0;
+	w->xe.data->vm_sync = 0;
 	w->xe.exec.address =
 		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
 						    0, ALLOC_STRATEGY_LOW_TO_HIGH);
-	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, w->bb_size);
+	if (vm->compute_mode) {
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.addr = to_user_pointer(&w->xe.data->vm_sync),
+			.timeline_value = user_fence_value,
+		};
+
+		xe_vm_bind_async(fd, vm->id, vm->bind_exec_queue, w->bb_handle, 0,
+				 w->xe.exec.address, w->bb_size, &sync, 1);
+		xe_wait_ufence(fd, &w->xe.data->vm_sync, user_fence_value,
+			       vm->bind_exec_queue, 10 * NSEC_PER_SEC);
+		w->xe.data->vm_sync = 0;
+	} else {
+		xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, w->bb_size);
+	}
 	w->duration.requested_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
 							    1000LL * get_duration(wrk, w));
 	xe_spin_init_opts(&w->xe.data->spin,
@@ -1875,8 +1917,15 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 
 		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
 		igt_assert(wrk->steps[dep_idx].type == BATCH);
+		igt_assert(wrk->steps[dep_idx].xe.syncs);
 
-		w->xe.exec.num_syncs++;
+		/*
+		 * USER_FENCE is valid as an out-fence in LR mode, but cannot be
+		 * consumed as an in-fence in xe_exec. Those deps are resolved in
+		 * userspace before submission.
+		 */
+		if (wrk->steps[dep_idx].xe.syncs[0].type != DRM_XE_SYNC_TYPE_USER_FENCE)
+			w->xe.exec.num_syncs++;
 	}
 	for_each_dep(dep, w->fence_deps) {
 		int dep_idx = w->idx + dep->target;
@@ -1884,34 +1933,70 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
 		igt_assert(wrk->steps[dep_idx].type == SW_FENCE ||
 			   wrk->steps[dep_idx].type == BATCH);
+		igt_assert(wrk->steps[dep_idx].xe.syncs);
 
-		w->xe.exec.num_syncs++;
+		if (wrk->steps[dep_idx].xe.syncs[0].type != DRM_XE_SYNC_TYPE_USER_FENCE)
+			w->xe.exec.num_syncs++;
 	}
 	w->xe.syncs = calloc(w->xe.exec.num_syncs, sizeof(*w->xe.syncs));
 	/* fill syncs */
 	i = 0;
 	/* out fence */
-	w->xe.syncs[i].handle = syncobj_create(fd, 0);
-	w->xe.syncs[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
-	w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	if (vm->compute_mode) {
+		w->xe.syncs[i].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		w->xe.syncs[i].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		w->xe.syncs[i].addr = w->xe.exec.address + offsetof(struct xe_spin, exec_sync);
+		w->xe.syncs[i++].timeline_value = user_fence_value;
+	} else {
+		w->xe.syncs[i].handle = syncobj_create(fd, 0);
+		w->xe.syncs[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	}
 	/* in fence(s) */
 	for_each_dep(dep, w->data_deps) {
 		int dep_idx = w->idx + dep->target;
 
-		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
-		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
-		w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		igt_assert(wrk->steps[dep_idx].xe.syncs);
+		if (wrk->steps[dep_idx].xe.syncs[0].type == DRM_XE_SYNC_TYPE_USER_FENCE)
+			continue;
+		w->xe.syncs[i] = wrk->steps[dep_idx].xe.syncs[0];
+		w->xe.syncs[i++].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	}
 	for_each_dep(dep, w->fence_deps) {
 		int dep_idx = w->idx + dep->target;
 
-		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
-		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
-		w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		igt_assert(wrk->steps[dep_idx].xe.syncs);
+		if (wrk->steps[dep_idx].xe.syncs[0].type == DRM_XE_SYNC_TYPE_USER_FENCE)
+			continue;
+		w->xe.syncs[i] = wrk->steps[dep_idx].xe.syncs[0];
+		w->xe.syncs[i++].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 	}
 	w->xe.exec.syncs = to_user_pointer(w->xe.syncs);
 }
 
+static void xe_sync_user_fence_deps(struct workload *wrk, struct w_step *w)
+{
+	struct dep_entry *dep;
+
+	for_each_dep(dep, w->data_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
+		igt_assert(wrk->steps[dep_idx].xe.syncs);
+		if (wrk->steps[dep_idx].xe.syncs[0].type == DRM_XE_SYNC_TYPE_USER_FENCE)
+			w_step_sync(&wrk->steps[dep_idx]);
+	}
+
+	for_each_dep(dep, w->fence_deps) {
+		int dep_idx = w->idx + dep->target;
+
+		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
+		igt_assert(wrk->steps[dep_idx].xe.syncs);
+		if (wrk->steps[dep_idx].xe.syncs[0].type == DRM_XE_SYNC_TYPE_USER_FENCE)
+			w_step_sync(&wrk->steps[dep_idx]);
+	}
+}
+
 static bool set_priority(uint32_t ctx_id, int prio)
 {
 	struct drm_i915_gem_context_param param = {
@@ -2190,7 +2275,7 @@ static void allocate_contexts(unsigned int id, struct workload *wrk)
 
 		w->wrk = wrk;
 
-		if (w->type == VM_CREATE)
+		if (w->type == VM_CREATE || w->type == VM_COMPUTE_MODE)
 			continue;
 
 		ctx = w->context + 1;
@@ -2427,6 +2512,14 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 	struct ctx *ctx;
 	unsigned int i;
 
+	for_each_w_step(w, wrk) {
+		if (w->type == VM_COMPUTE_MODE) {
+			igt_assert_lt((unsigned int)w->vm_id, wrk->nr_vms);
+			igt_assert(wrk->vm_list[w->vm_id].declared);
+			wrk->vm_list[w->vm_id].compute_mode = true;
+		}
+	}
+
 	/* Slot 0 is the implicit/default VM. */
 	xe_vm_create_(&wrk->vm_list[0]);
 	wrk->vm_list[0].ahnd = intel_allocator_open(fd, wrk->vm_list[0].id,
@@ -2437,6 +2530,9 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 			continue;
 
 		xe_vm_create_(&wrk->vm_list[i]);
+		if (wrk->vm_list[i].compute_mode)
+			wrk->vm_list[i].bind_exec_queue =
+				xe_bind_exec_queue_create(fd, wrk->vm_list[i].id, 0);
 		wrk->vm_list[i].ahnd =
 			intel_allocator_open(fd, wrk->vm_list[i].id,
 					     INTEL_ALLOCATOR_RELOC);
@@ -2767,11 +2863,22 @@ static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
 static void do_xe_exec(struct workload *wrk, struct w_step *w)
 {
 	struct xe_exec_queue *eq = xe_get_eq(wrk, w);
+	struct vm *vm = get_vm(wrk, w);
 
 	igt_assert(w->emit_fence <= 0);
 	if (w->emit_fence == -1)
 		syncobj_reset(fd, &w->xe.syncs[0].handle, 1);
 
+	/*
+	 * LR mode reuses the same user-fence location for completion.
+	 * Re-arm it before every submit so waiters do not observe the
+	 * previous iteration's signaled value.
+	 */
+	if (vm->compute_mode)
+		w->xe.data->spin.exec_sync = 0;
+
+	xe_sync_user_fence_deps(wrk, w);
+
 	/* update duration if random */
 	if (w->duration.max != w->duration.min) {
 		w->duration.requested_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
@@ -2976,7 +3083,8 @@ static void *run_workload(void *data)
 				   w->type == BOND ||
 				   w->type == WORKINGSET ||
 				   w->type == VM_CREATE ||
-				   w->type == CTX_VM) {
+				   w->type == CTX_VM ||
+				   w->type == VM_COMPUTE_MODE) {
 				   /* No action for these at execution time. */
 				continue;
 			}
@@ -3066,14 +3174,35 @@ static void *run_workload(void *data)
 		for_each_w_step(w, wrk) {
 			if (w->type == BATCH) {
 				w_step_sync(w);
-				syncobj_destroy(fd, w->xe.syncs[0].handle);
+				if (w->xe.syncs[0].type == DRM_XE_SYNC_TYPE_SYNCOBJ)
+					syncobj_destroy(fd, w->xe.syncs[0].handle);
 				free(w->xe.syncs);
-				xe_vm_unbind_sync(fd, get_vm(wrk, w)->id, 0, w->xe.exec.address,
-						  w->bb_size);
+				if (get_vm(wrk, w)->compute_mode) {
+					struct vm *vm = get_vm(wrk, w);
+					struct drm_xe_sync sync = {
+						.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+						.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+						.addr = to_user_pointer(&w->xe.data->vm_sync),
+						.timeline_value = user_fence_value,
+					};
+
+					xe_vm_unbind_async(fd, vm->id, vm->bind_exec_queue,
+							   0, w->xe.exec.address, w->bb_size,
+							   &sync, 1);
+					xe_wait_ufence(fd, &w->xe.data->vm_sync,
+						       user_fence_value,
+						       vm->bind_exec_queue,
+						       10 * NSEC_PER_SEC);
+					w->xe.data->vm_sync = 0;
+				} else {
+					xe_vm_unbind_sync(fd, get_vm(wrk, w)->id, 0,
+							  w->xe.exec.address, w->bb_size);
+				}
 				gem_munmap(w->xe.data, w->bb_size);
 				gem_close(fd, w->bb_handle);
 			} else if (w->type == SW_FENCE) {
-				syncobj_destroy(fd, w->xe.syncs[0].handle);
+				if (w->xe.syncs[0].type == DRM_XE_SYNC_TYPE_SYNCOBJ)
+					syncobj_destroy(fd, w->xe.syncs[0].handle);
 				free(w->xe.syncs);
 			}
 		}
diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
index 364759da0..8a7d79635 100644
--- a/benchmarks/wsim/README
+++ b/benchmarks/wsim/README
@@ -11,7 +11,7 @@ P|S|X.<uint>.<int>
 d|p|s|t|q|a|T.<int>,...
 b.<uint>.<str>[|<str>].<str>
 w|W.<uint>.<str>[/<str>]...
-V.<uint>
+V|c.<uint>
 v.<uint>.<uint>
 f
 
@@ -45,6 +45,7 @@ VM (Virtual Memory) management steps (Xe: active; i915: ignored):
 
  'V' - Create VM with id N (V.N, VM ids are 1-based).
  'v' - Assign VM N to context/queue M (v.N.M).
+ 'c' - Enable compute/LR mode for VM N (c.N).
 
 Engine ids: DEFAULT, RCS, BCS, VCS, VCS1, VCS2, VECS
 
@@ -95,7 +96,7 @@ Batch durations can also be specified as infinite by using the '*' in the
 duration field. Such batches must be ended by the terminate command ('T')
 otherwise they will cause a GPU hang to be reported.
 
-VM Example:
+VM Examples:
 
   V.1
   M.1.VCS
@@ -107,6 +108,18 @@ Creates VM 1, configures context 1 with a VCS engine map, assigns context 1
 to VM 1, enables load balancing for context 1, and runs a single 1ms VCS
 batch.
 
+  V.1
+  c.1
+  v.1.1
+  v.1.2
+  1.BCS.5000.0.0
+  2.CCS.7000000.-1.0
+  1.BCS.5000.-1.1
+
+Creates VM 1, enables compute/LR mode on it, assigns contexts 1 and 2 to the
+same VM, then runs BCS and CCS work with cross-step dependencies (CCS depends
+on the first BCS step, and the final BCS step depends on the CCS step).
+
 Xe and i915 differences
 ------------------------
 
-- 
2.43.0

