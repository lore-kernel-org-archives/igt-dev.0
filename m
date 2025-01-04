Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBB2E77199
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 07:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAA910E367;
	Sat,  4 Jan 2025 07:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UByDVobR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6199110E102
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735974963; x=1767510963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eREPW7k3Nhb/Ol1aEo5QOTBVLlhiwf1XBpK7l6+PMkM=;
 b=UByDVobRbwLzpgcF1xYgyKY44QL4nYoU6TOXwB+PkIbAaIupdTNS3Bkr
 CTMohpLi/vsROQxIEkcIiOSVr0U14itfmG1WPnxkmfhnASp++Sz46/KIi
 keDITLfjwkRBh4KL+/XxlnueMSKRCfuRmGv7pZZ2IbmL5vreCcZRsaVkE
 ttxR4K4d1lSnRZSKT6Q8cJUBfusSyPfNHtOrcgLV35PSbK7MCMGC2Y41g
 7Hn0JckbOO/KOIiGPZ9jIKfiioZrcvW1NAxAMBp1Tj7J+X8iGzCpjIEEY
 Mtblldnc+WogmO4KAv1FViDOJJuDhrXloAtxkMEdSg6yLA45TKQ+Zq7ma Q==;
X-CSE-ConnectionGUID: A9iqnIU9QjW3C2glzH9ghw==
X-CSE-MsgGUID: q5HvRacbT7Knm2q4rEaYwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46878995"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="46878995"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
X-CSE-ConnectionGUID: q4z+jLrPQs+k1OMkO1h5bw==
X-CSE-MsgGUID: qB62B9BeTMaLpMiXI0Ev7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="101762004"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 7/8] treewide: s/ctx/cork/ when referring to xe_cork
Date: Fri,  3 Jan 2025 23:15:47 -0800
Message-ID: <20250104071548.737612-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250104071548.737612-1-lucas.demarchi@intel.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
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

Commit 2feb1d6718a1 ("lib/xe/xe_spin: move the spinner related functions
to lib") extracted the spin_ctx abstraction from xe_drm_fdinfo to be
re-used in other places as part of the xe_cork. Complement it by also
renaming the variable s/ctx/cork/ when referring to struct xe_cork.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_spin.c            | 158 ++++++++++++++++++------------------
 tests/intel/xe_drm_fdinfo.c |  74 ++++++++---------
 tests/intel/xe_spin_batch.c |  14 ++--
 tests/intel/xe_vm.c         |  12 +--
 4 files changed, 129 insertions(+), 129 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index bb6318cef..0de0b1f2e 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -291,148 +291,148 @@ xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe,
 		uint32_t vm, uint16_t width, uint16_t num_placements,
 		struct xe_cork_opts *opts)
 {
-	struct xe_cork *ctx = calloc(1, sizeof(*ctx));
+	struct xe_cork *cork = calloc(1, sizeof(*cork));
 
-	igt_assert(ctx);
+	igt_assert(cork);
 	igt_assert(width && num_placements &&
 		   (width == 1 || num_placements == 1));
 	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
 
-	ctx->class = hwe->engine_class;
-	ctx->width = width;
-	ctx->num_placements = num_placements;
-	ctx->vm = vm;
-	ctx->cork_opts = *opts;
-
-	ctx->exec.num_batch_buffer = width;
-	ctx->exec.num_syncs = 2;
-	ctx->exec.syncs = to_user_pointer(ctx->sync);
-
-	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
-	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
-	ctx->sync[0].handle = syncobj_create(fd, 0);
-
-	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
-	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
-	ctx->sync[1].handle = syncobj_create(fd, 0);
-
-	ctx->bo_size = sizeof(struct xe_spin);
-	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
-	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
-			       vram_if_possible(fd, hwe->gt_id),
-			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	if (ctx->cork_opts.ahnd) {
+	cork->class = hwe->engine_class;
+	cork->width = width;
+	cork->num_placements = num_placements;
+	cork->vm = vm;
+	cork->cork_opts = *opts;
+
+	cork->exec.num_batch_buffer = width;
+	cork->exec.num_syncs = 2;
+	cork->exec.syncs = to_user_pointer(cork->sync);
+
+	cork->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	cork->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	cork->sync[0].handle = syncobj_create(fd, 0);
+
+	cork->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	cork->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	cork->sync[1].handle = syncobj_create(fd, 0);
+
+	cork->bo_size = sizeof(struct xe_spin);
+	cork->bo_size = xe_bb_size(fd, cork->bo_size);
+	cork->bo = xe_bo_create(fd, cork->vm, cork->bo_size,
+				vram_if_possible(fd, hwe->gt_id),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	if (cork->cork_opts.ahnd) {
 		for (unsigned int i = 0; i < width; i++)
-			ctx->addr[i] = intel_allocator_alloc_with_strategy(ctx->cork_opts.ahnd,
-					ctx->bo, ctx->bo_size, 0,
+			cork->addr[i] = intel_allocator_alloc_with_strategy(cork->cork_opts.ahnd,
+					cork->bo, cork->bo_size, 0,
 					ALLOC_STRATEGY_LOW_TO_HIGH);
 	} else {
 		for (unsigned int i = 0; i < width; i++)
-			ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
+			cork->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
 	}
 
-	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
+	cork->spin = xe_bo_map(fd, cork->bo, cork->bo_size);
 
-	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
-					     hwe, 0, &ctx->exec_queue), 0);
+	igt_assert_eq(__xe_exec_queue_create(fd, cork->vm, width, num_placements,
+					     hwe, 0, &cork->exec_queue), 0);
 
-	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
-			 ctx->sync, 1);
+	xe_vm_bind_async(fd, cork->vm, 0, cork->bo, 0, cork->addr[0], cork->bo_size,
+			 cork->sync, 1);
 
-	return ctx;
+	return cork;
 }
 
 /**
  * xe_cork_sync_start:
  *
  * @fd: xe device fd
- * @ctx: pointer to xe_cork structure
+ * @cork: pointer to xe_cork structure
  *
  * run the spinner using xe_spin_init submit batch using xe_exec
  * and wait for fence using syncobj_wait
  */
-void xe_cork_sync_start(int fd, struct xe_cork *ctx)
+void xe_cork_sync_start(int fd, struct xe_cork *cork)
 {
-	igt_assert(ctx);
+	igt_assert(cork);
 
-	ctx->spin_opts.addr = ctx->addr[0];
-	ctx->spin_opts.write_timestamp = true;
-	ctx->spin_opts.preempt = true;
-	xe_spin_init(ctx->spin, &ctx->spin_opts);
+	cork->spin_opts.addr = cork->addr[0];
+	cork->spin_opts.write_timestamp = true;
+	cork->spin_opts.preempt = true;
+	xe_spin_init(cork->spin, &cork->spin_opts);
 
 	/* reuse sync[0] as in-fence for exec */
-	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	cork->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 
-	ctx->exec.exec_queue_id = ctx->exec_queue;
+	cork->exec.exec_queue_id = cork->exec_queue;
 
-	if (ctx->width > 1)
-		ctx->exec.address = to_user_pointer(ctx->addr);
+	if (cork->width > 1)
+		cork->exec.address = to_user_pointer(cork->addr);
 	else
-		ctx->exec.address = ctx->addr[0];
+		cork->exec.address = cork->addr[0];
 
-	xe_exec(fd, &ctx->exec);
+	xe_exec(fd, &cork->exec);
 
-	xe_spin_wait_started(ctx->spin);
-	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
+	xe_spin_wait_started(cork->spin);
+	igt_assert(!syncobj_wait(fd, &cork->sync[1].handle, 1, 1, 0, NULL));
 
-	if (ctx->cork_opts.debug)
-		igt_info("%d: spinner started\n", ctx->class);
+	if (cork->cork_opts.debug)
+		igt_info("%d: spinner started\n", cork->class);
 }
 
 /*
  * xe_cork_sync_end
  *
  * @fd: xe device fd
- * @ctx: pointer to xe_cork structure
+ * @cork: pointer to xe_cork structure
  *
  * Wrapper to end spinner created by xe_cork_create. It will
  * unbind the vm which was binded to the exec_queue and bo.
  */
-void xe_cork_sync_end(int fd, struct xe_cork *ctx)
+void xe_cork_sync_end(int fd, struct xe_cork *cork)
 {
-	igt_assert(ctx);
+	igt_assert(cork);
 
-	if (ctx->ended)
-		igt_warn("Don't attempt call end twice %d\n", ctx->ended);
+	if (cork->ended)
+		igt_warn("Don't attempt call end twice %d\n", cork->ended);
 
-	xe_spin_end(ctx->spin);
+	xe_spin_end(cork->spin);
 
-	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &cork->sync[1].handle, 1, INT64_MAX, 0, NULL));
 
-	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	syncobj_reset(fd, &ctx->sync[0].handle, 1);
+	cork->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	syncobj_reset(fd, &cork->sync[0].handle, 1);
 
-	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
-	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
+	xe_vm_unbind_async(fd, cork->vm, 0, 0, cork->addr[0], cork->bo_size, cork->sync, 1);
+	igt_assert(syncobj_wait(fd, &cork->sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	ctx->ended = true;
+	cork->ended = true;
 
-	if (ctx->cork_opts.debug)
-		igt_info("%d: spinner ended (timestamp=%u)\n", ctx->class,
-			ctx->spin->timestamp);
+	if (cork->cork_opts.debug)
+		igt_info("%d: spinner ended (timestamp=%u)\n", cork->class,
+			cork->spin->timestamp);
 }
 
 /*
  * xe_cork_destroy
  *
  * @fd: xe device fd
- * @ctx: pointer to xe_cork structure
+ * @cork: pointer to xe_cork structure
  *
- * It will destroy vm, exec_queue and free the ctx.
+ * It will destroy vm, exec_queue and free the cork.
  */
-void xe_cork_destroy(int fd, struct xe_cork *ctx)
+void xe_cork_destroy(int fd, struct xe_cork *cork)
 {
-	igt_assert(ctx);
+	igt_assert(cork);
 
-	syncobj_destroy(fd, ctx->sync[0].handle);
-	syncobj_destroy(fd, ctx->sync[1].handle);
-	xe_exec_queue_destroy(fd, ctx->exec_queue);
+	syncobj_destroy(fd, cork->sync[0].handle);
+	syncobj_destroy(fd, cork->sync[1].handle);
+	xe_exec_queue_destroy(fd, cork->exec_queue);
 
-	if (ctx->cork_opts.ahnd)
-		intel_allocator_free(ctx->cork_opts.ahnd, ctx->bo);
+	if (cork->cork_opts.ahnd)
+		intel_allocator_free(cork->cork_opts.ahnd, cork->bo);
 
-	munmap(ctx->spin, ctx->bo_size);
-	gem_close(fd, ctx->bo);
+	munmap(cork->spin, cork->bo_size);
+	gem_close(fd, cork->bo);
 
-	free(ctx);
+	free(cork);
 }
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index f4264aadb..1089e5119 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -410,7 +410,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 {
 	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct xe_cork *ctx = NULL;
+	struct xe_cork *cork = NULL;
 	enum expected_load expected_load;
 	uint32_t vm;
 	int new_fd;
@@ -420,8 +420,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	vm = xe_vm_create(fd, 0, 0);
 	if (flags & TEST_BUSY) {
-		ctx = xe_cork_create_opts(fd, hwe, vm, 1, 1);
-		xe_cork_sync_start(fd, ctx);
+		cork = xe_cork_create_opts(fd, hwe, vm, 1, 1);
+		xe_cork_sync_start(fd, cork);
 	}
 
 	read_engine_cycles(fd, pceu1[0]);
@@ -430,7 +430,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
-		xe_cork_sync_end(fd, ctx);
+		xe_cork_sync_end(fd, cork);
 
 	read_engine_cycles(fd, pceu2[0]);
 	if (flags & TEST_ISOLATION)
@@ -449,8 +449,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 		close(new_fd);
 	}
 
-	if (flags & TEST_BUSY)
-		xe_cork_destroy(fd, ctx);
+	if (cork)
+		xe_cork_destroy(fd, cork);
 
 	xe_vm_destroy(fd, vm);
 }
@@ -460,19 +460,19 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct xe_cork *ctx = NULL;
+	struct xe_cork *cork;
 	uint32_t vm;
 
 	vm = xe_vm_create(fd, 0, 0);
-	ctx = xe_cork_create_opts(fd, hwe, vm, 1, 1);
-	xe_cork_sync_start(fd, ctx);
+	cork = xe_cork_create_opts(fd, hwe, vm, 1, 1);
+	xe_cork_sync_start(fd, cork);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
-	xe_cork_sync_end(fd, ctx);
-	xe_cork_destroy(fd, ctx);
+	xe_cork_sync_end(fd, cork);
+	xe_cork_destroy(fd, cork);
 
 	read_engine_cycles(fd, pceu2);
 
@@ -486,17 +486,17 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct xe_cork *ctx = NULL;
+	struct xe_cork *cork;
 	uint32_t vm;
 	int class;
 
 	vm = xe_vm_create(fd, 0, 0);
-	ctx = xe_cork_create_opts(fd, hwe, vm, 1, 1);
-	xe_cork_sync_start(fd, ctx);
+	cork = xe_cork_create_opts(fd, hwe, vm, 1, 1);
+	xe_cork_sync_start(fd, cork);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	xe_cork_sync_end(fd, ctx);
+	xe_cork_sync_end(fd, cork);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -506,7 +506,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 		check_results(pceu1, pceu2, class, 1, expected_load);
 	}
 
-	xe_cork_destroy(fd, ctx);
+	xe_cork_destroy(fd, cork);
 	xe_vm_destroy(fd, vm);
 }
 
@@ -515,7 +515,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct xe_cork *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct xe_cork *cork[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
 	struct drm_xe_engine_class_instance *_hwe;
 	uint32_t vm;
 	int class;
@@ -526,17 +526,17 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 	xe_for_each_engine(fd, _hwe) {
 		int _class = _hwe->engine_class;
 
-		if (_class == hwe->engine_class || ctx[_class])
+		if (_class == hwe->engine_class || cork[_class])
 			continue;
-		ctx[_class] = xe_cork_create_opts(fd, _hwe, vm, 1, 1);
-		xe_cork_sync_start(fd, ctx[_class]);
+		cork[_class] = xe_cork_create_opts(fd, _hwe, vm, 1, 1);
+		xe_cork_sync_start(fd, cork[_class]);
 	}
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 	xe_for_each_engine_class(class)
-		if (ctx[class])
-			xe_cork_sync_end(fd, ctx[class]);
+		if (cork[class])
+			xe_cork_sync_end(fd, cork[class]);
 
 	read_engine_cycles(fd, pceu2);
 
@@ -544,11 +544,11 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 		enum expected_load expected_load = hwe->engine_class == class ?
 			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
-		if (!ctx[class])
+		if (!cork[class])
 			continue;
 
 		check_results(pceu1, pceu2, class, 1, expected_load);
-		xe_cork_destroy(fd, ctx[class]);
+		xe_cork_destroy(fd, cork[class]);
 	}
 
 	xe_vm_destroy(fd, vm);
@@ -559,7 +559,7 @@ utilization_all_full_load(int fd)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct xe_cork *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct xe_cork *cork[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
 	struct drm_xe_engine_class_instance *hwe;
 	uint32_t vm;
 	int class;
@@ -569,24 +569,24 @@ utilization_all_full_load(int fd)
 	/* spin on one hwe per class */
 	xe_for_each_engine(fd, hwe) {
 		class = hwe->engine_class;
-		if (ctx[class])
+		if (cork[class])
 			continue;
-		ctx[class] = xe_cork_create_opts(fd, hwe, vm, 1, 1);
-		xe_cork_sync_start(fd, ctx[class]);
+		cork[class] = xe_cork_create_opts(fd, hwe, vm, 1, 1);
+		xe_cork_sync_start(fd, cork[class]);
 	}
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 	xe_for_each_engine_class(class)
-		xe_cork_sync_end(fd, ctx[class]);
+		xe_cork_sync_end(fd, cork[class]);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
-		if (!ctx[class])
+		if (!cork[class])
 			continue;
 
 		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
-		xe_cork_destroy(fd, ctx[class]);
+		xe_cork_destroy(fd, cork[class]);
 	}
 
 	xe_vm_destroy(fd, vm);
@@ -613,7 +613,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 	struct pceu_cycles pceu[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu_spill[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
-	struct xe_cork *ctx = NULL;
+	struct xe_cork *cork = NULL;
 	enum expected_load expected_load;
 	int fd_spill, num_placements;
 	uint32_t vm;
@@ -639,8 +639,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
 	vm = xe_vm_create(fd, 0, 0);
 	if (flags & TEST_BUSY) {
-		ctx = xe_cork_create_opts(fd, eci, vm, width, num_placements);
-		xe_cork_sync_start(fd, ctx);
+		cork = xe_cork_create_opts(fd, eci, vm, width, num_placements);
+		xe_cork_sync_start(fd, cork);
 	}
 
 	read_engine_cycles(fd, pceu[0]);
@@ -649,7 +649,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
 	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
-		xe_cork_sync_end(fd, ctx);
+		xe_cork_sync_end(fd, cork);
 
 	read_engine_cycles(fd, pceu[1]);
 	if (flags & TEST_ISOLATION)
@@ -669,8 +669,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 		close(fd_spill);
 	}
 
-	if (flags & TEST_BUSY)
-		xe_cork_destroy(fd, ctx);
+	if (cork)
+		xe_cork_destroy(fd, cork);
 
 	xe_vm_destroy(fd, vm);
 }
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 5d9afaf3d..e4000f50e 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -384,25 +384,25 @@ static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
 
 static void run_spinner(int fd, struct drm_xe_engine_class_instance *eci)
 {
-	struct xe_cork *ctx = NULL;
+	struct xe_cork *cork;
 	uint32_t vm;
 	uint32_t ts_1, ts_2;
 	uint64_t ahnd;
 
 	vm = xe_vm_create(fd, 0, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
-	ctx = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
-	xe_cork_sync_start(fd, ctx);
+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
+	xe_cork_sync_start(fd, cork);
 
 	/* Collect and check timestamps before stopping the spinner */
 	usleep(50000);
-	ts_1 = READ_ONCE(ctx->spin->timestamp);
+	ts_1 = READ_ONCE(cork->spin->timestamp);
 	usleep(50000);
-	ts_2 = READ_ONCE(ctx->spin->timestamp);
+	ts_2 = READ_ONCE(cork->spin->timestamp);
 	igt_assert_neq_u32(ts_1, ts_2);
 
-	xe_cork_sync_end(fd, ctx);
-	xe_cork_destroy(fd, ctx);
+	xe_cork_sync_end(fd, cork);
+	xe_cork_destroy(fd, cork);
 
 	xe_vm_destroy(fd, vm);
 	put_ahnd(ahnd);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index b10269191..9e524578a 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -945,21 +945,21 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	sync[0].handle = syncobj_create(fd, 0);
 	if (flags & BIND_ARRAY_ENOBUFS_FLAG) {
-		struct xe_cork *ctx = NULL;
+		struct xe_cork *cork;
 		uint32_t vm_cork;
 
 		vm_cork = xe_vm_create(fd, 0, 0);
-		ctx = xe_cork_create_opts(fd, eci, vm_cork, 1, 1);
-		xe_cork_sync_start(fd, ctx);
+		cork = xe_cork_create_opts(fd, eci, vm_cork, 1, 1);
+		xe_cork_sync_start(fd, cork);
 
-		sync[1].handle = ctx->sync[1].handle;
+		sync[1].handle = cork->sync[1].handle;
 		sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 
 		xe_vm_bind_array_err(fd, vm, bind_exec_queue, bind_ops,
 				     n_execs, sync, 2, ENOBUFS);
 		/* destroy queue before sampling again */
-		xe_cork_sync_end(fd, ctx);
-		xe_cork_destroy(fd, ctx);
+		xe_cork_sync_end(fd, cork);
+		xe_cork_destroy(fd, cork);
 		xe_vm_destroy(fd, vm_cork);
 
 		n_execs = n_execs / 4;
-- 
2.47.0

