Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA655C5AD4E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 09:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3F810E76E;
	Mon, 10 Aug 2026 09:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OW4CMh+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47DF10E76E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786354803; x=1817890803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+bFyTnnjkPtS3SSmlzsPfT3HUlkl1uFvccs3sBTrhk=;
 b=OW4CMh+SJHbYv8UNLKXmqDm0wHb5JaABXXpT2xoCnnnHIugHlp4h+0jZ
 etEs/rSEPQ21leT1mVsU0yJyd0ueRTANaeWm4XmAnDvNxAtXusnuAvhBU
 JiubLyIynLkiWsiM27TnQoFJIx3Ky1r5UU1oG+FYXzwp2gRl4+0MRU4Vq
 DH0/VdFFlyLKHWQ+q+7rMhIipJNw/Am0OCyw/n5fwPFwxanjlLZvJ3rXF
 aO3gfS+q+fuDeE4wjv7rJqABSzzSNX2Px2VGhbUqiVNxwHMOGgm/hCsFF
 Ach92k2YSVyvydDgj/kL/RWWEOdA3sVLDmhBxZrQbbSJlLq8XWTDddfTB g==;
X-CSE-ConnectionGUID: 8hzXUFFbTWK9dUR3uTKD8A==
X-CSE-MsgGUID: +TjJR7SjTLKMGIzCuXH5Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="104256443"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="104256443"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 02:40:03 -0700
X-CSE-ConnectionGUID: PPZZ5yDgTUiDamkmUxt+xw==
X-CSE-MsgGUID: Y4xOPwsoSNi8q09wDI3lzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="266487672"
Received: from unknown (HELO localhost) ([10.94.249.102])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 02:40:01 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com, tvrtko.ursulin@igalia.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/2] benchmarks/gem_wsim: add explicit VM
 create/assign steps
Date: Mon, 10 Aug 2026 11:39:49 +0200
Message-ID: <20260810093950.1696330-2-marcin.bernatowicz@linux.intel.com>
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

Add explicit VM (Virtual Memory) management to workload descriptors so Xe
runs can model VM topology directly.

Introduce two new descriptor steps:
- V.N     create VM id N (1-based)
- v.N.M   assign VM N to context M

Implementation details:
- Add VM_CREATE and CTX_VM step types and vm_id storage in w_step.
- Parse V/v syntax with validation and clear error messages.
- Add allocate_vms() pre-scan to size and allocate vm_list from V steps.
- Update xe_prepare_contexts() to support explicit VM mode:
  - create all explicit VMs
  - default contexts to VM 0
  - apply per-context VM assignments from v steps
  - retain implicit single-VM fallback when no V steps are present
- Make get_vm() use per-context VM linkage.

Documentation:
- Add VM (Virtual Memory) management step documentation into
  benchmarks/wsim/README.

This keeps i915 behavior unchanged while enabling explicit VM topology
control for Xe workloads.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
v2: Clarify that VM means Virtual Memory (Kamil, Adam)
---
 benchmarks/gem_wsim.c  | 143 +++++++++++++++++++++++++++++++++++++----
 benchmarks/wsim/README |  19 ++++++
 2 files changed, 150 insertions(+), 12 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 462188708..7d9363582 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -130,6 +130,8 @@ enum w_type {
 	TERMINATE,
 	SSEU,
 	WORKINGSET,
+	VM_CREATE,
+	CTX_VM,
 };
 
 struct dep_entry {
@@ -210,6 +212,7 @@ struct w_step {
 		struct bond bond;
 		int sseu;
 		struct working_set working_set;
+		int vm_id;
 	};
 
 	/* Implementation details */
@@ -241,6 +244,7 @@ struct w_step {
 
 struct vm {
 	uint32_t id;
+	bool declared;
 	bool compute_mode;
 	uint64_t ahnd;
 };
@@ -1240,6 +1244,55 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 
 				step.type = WORKINGSET;
 				goto add_step;
+			} else if (!strcmp(field, "V")) {
+				/*
+				 * V.N  - create VM with id N (xe only, ignored on i915)
+				 * VM ids are 1-based in the descriptor.
+				 */
+				field = strtok_r(fstart, ".", &fctx);
+				check_arg(!field, "Missing VM id at step %u!\n",
+					  nr_steps);
+				tmp = atoi(field);
+				check_arg(tmp <= 0, "Invalid VM id at step %u!\n",
+					  nr_steps);
+				step.vm_id = tmp;
+				step.type = VM_CREATE;
+				goto add_step;
+			} else if (!strcmp(field, "v")) {
+				/*
+				 * v.N.M  - assign VM N to ctx M
+				 * (xe only, ignored on i915)
+				 */
+				unsigned int nr = 0;
+				int vm = 0, ctx_id = 0;
+
+				while ((field = strtok_r(fstart, ".", &fctx))) {
+					fstart = NULL;
+					tmp = atoi(field);
+					if (nr == 0) {
+						check_arg(tmp <= 0,
+							  "Invalid VM id at step %u!\n",
+							  nr_steps);
+						vm = tmp;
+					} else if (nr == 1) {
+						check_arg(tmp <= 0,
+							  "Invalid ctx id at step %u!\n",
+							  nr_steps);
+						ctx_id = tmp;
+					} else {
+						check_arg(1,
+							  "Too many fields in v step at step %u!\n",
+							  nr_steps);
+					}
+					nr++;
+				}
+				check_arg(nr != 2,
+					  "v step requires VM id and ctx id at step %u!\n",
+					  nr_steps);
+				step.vm_id = vm;
+				step.context = ctx_id;
+				step.type = CTX_VM;
+				goto add_step;
 			}
 
 			if (!field) {
@@ -1665,6 +1718,14 @@ xe_get_eq(struct workload *wrk, const struct w_step *w)
 static struct vm *
 get_vm(struct workload *wrk, const struct w_step *w)
 {
+	struct ctx *ctx = __get_ctx(wrk, w);
+
+	/* If the ctx has been linked to an explicit VM, use it; otherwise
+	 * fall back to the implicit single vm_list[0].
+	 */
+	if (ctx->vm)
+		return ctx->vm;
+
 	return wrk->vm_list;
 }
 
@@ -2087,6 +2148,33 @@ static void xe_exec_queue_create_(struct ctx *ctx, struct xe_exec_queue *eq)
 	eq->id = create.exec_queue_id;
 }
 
+static void allocate_vms(struct workload *wrk)
+{
+	int max_vm = 0;
+	struct w_step *w;
+
+	/*
+	 * Slot 0 is always the implicit/default VM. Descriptor VM ids are
+	 * 1-based and map directly to vm_list[N] for explicit V.N steps.
+	 */
+	for_each_w_step(w, wrk) {
+		if (w->type != VM_CREATE)
+			continue;
+		if (w->vm_id > max_vm)
+			max_vm = w->vm_id;
+	}
+
+	wrk->nr_vms = max_vm + 1;
+	wrk->vm_list = calloc(wrk->nr_vms, sizeof(*wrk->vm_list));
+	igt_assert(wrk->vm_list);
+
+	for_each_w_step(w, wrk) {
+		if (w->type == VM_CREATE)
+			/* Mark only explicitly declared VMs; slot 0 stays implicit. */
+			wrk->vm_list[w->vm_id].declared = true;
+	}
+}
+
 static void allocate_contexts(unsigned int id, struct workload *wrk)
 {
 	int max_ctx = -1;
@@ -2094,13 +2182,19 @@ static void allocate_contexts(unsigned int id, struct workload *wrk)
 
 	/*
 	 * Pre-scan workload steps to allocate context list storage.
+	 * Skip VM management steps whose context field is unused.
 	 */
 	for_each_w_step(w, wrk) {
-		int ctx = w->context + 1;
+		int ctx;
 		int delta;
 
 		w->wrk = wrk;
 
+		if (w->type == VM_CREATE)
+			continue;
+
+		ctx = w->context + 1;
+
 		if (ctx <= max_ctx)
 			continue;
 
@@ -2333,18 +2427,38 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 	struct ctx *ctx;
 	unsigned int i;
 
-	/* shortcut, create one vm */
-	wrk->nr_vms = 1;
-	wrk->vm_list = calloc(wrk->nr_vms, sizeof(struct vm));
-	igt_assert(wrk->vm_list);
-	wrk->vm_list->compute_mode = false;
-	xe_vm_create_(wrk->vm_list);
-	wrk->vm_list->ahnd = intel_allocator_open(fd, wrk->vm_list->id,
-						  INTEL_ALLOCATOR_RELOC);
+	/* Slot 0 is the implicit/default VM. */
+	xe_vm_create_(&wrk->vm_list[0]);
+	wrk->vm_list[0].ahnd = intel_allocator_open(fd, wrk->vm_list[0].id,
+						    INTEL_ALLOCATOR_RELOC);
+
+	for (i = 1; i < wrk->nr_vms; i++) {
+		if (!wrk->vm_list[i].declared)
+			continue;
+
+		xe_vm_create_(&wrk->vm_list[i]);
+		wrk->vm_list[i].ahnd =
+			intel_allocator_open(fd, wrk->vm_list[i].id,
+					     INTEL_ALLOCATOR_RELOC);
+	}
+
+	/*
+	 * Process CTX_VM steps to link each ctx to an explicit VM. Contexts
+	 * without a v.N.M mapping remain on the implicit VM in slot 0.
+	 */
+	__for_each_ctx(ctx, wrk, ctx_idx)
+		ctx->vm = &wrk->vm_list[0];
+
+	for_each_w_step(w, wrk) {
+		if (w->type != CTX_VM)
+			continue;
+		igt_assert_lt((unsigned int)w->vm_id, wrk->nr_vms);
+		igt_assert(wrk->vm_list[w->vm_id].declared);
+		igt_assert_lt((unsigned int)w->context, wrk->nr_ctxs);
+		wrk->ctx_list[w->context].vm = &wrk->vm_list[w->vm_id];
+	}
 
 	__for_each_ctx(ctx, wrk, ctx_idx) {
-		/* link with vm */
-		ctx->vm = wrk->vm_list;
 		for_each_w_step(w, wrk) {
 			if (w->context != ctx_idx)
 				continue;
@@ -2537,6 +2651,9 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 
 	allocate_contexts(id, wrk);
 
+	if (is_xe)
+		allocate_vms(wrk);
+
 	if (is_xe)
 		ret = xe_prepare_contexts(id, wrk);
 	else
@@ -2857,7 +2974,9 @@ static void *run_workload(void *data)
 				   w->type == ENGINE_MAP ||
 				   w->type == LOAD_BALANCE ||
 				   w->type == BOND ||
-				   w->type == WORKINGSET) {
+				   w->type == WORKINGSET ||
+				   w->type == VM_CREATE ||
+				   w->type == CTX_VM) {
 				   /* No action for these at execution time. */
 				continue;
 			}
diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
index e43813335..364759da0 100644
--- a/benchmarks/wsim/README
+++ b/benchmarks/wsim/README
@@ -11,6 +11,8 @@ P|S|X.<uint>.<int>
 d|p|s|t|q|a|T.<int>,...
 b.<uint>.<str>[|<str>].<str>
 w|W.<uint>.<str>[/<str>]...
+V.<uint>
+v.<uint>.<uint>
 f
 
 For duration a range can be given from which a random value will be picked
@@ -39,6 +41,11 @@ Additional workload steps are also supported:
  'W' - Shared working set.
  'X' - Context preemption control.
 
+VM (Virtual Memory) management steps (Xe: active; i915: ignored):
+
+ 'V' - Create VM with id N (V.N, VM ids are 1-based).
+ 'v' - Assign VM N to context/queue M (v.N.M).
+
 Engine ids: DEFAULT, RCS, BCS, VCS, VCS1, VCS2, VECS
 
 Example (leading spaces must not be present in the actual file):
@@ -88,6 +95,18 @@ Batch durations can also be specified as infinite by using the '*' in the
 duration field. Such batches must be ended by the terminate command ('T')
 otherwise they will cause a GPU hang to be reported.
 
+VM Example:
+
+  V.1
+  M.1.VCS
+  v.1.1
+  B.1
+  1.VCS.1000.0.0
+
+Creates VM 1, configures context 1 with a VCS engine map, assigns context 1
+to VM 1, enables load balancing for context 1, and runs a single 1ms VCS
+batch.
+
 Xe and i915 differences
 ------------------------
 
-- 
2.43.0

