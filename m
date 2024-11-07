Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18A8D4336A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 14:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F53F10E310;
	Thu,  7 Nov 2024 14:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiWOx+x+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E049C10E310
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730990103; x=1762526103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXQv866zrfv/zeMp29Qd+KHruOhjcpl1OwY2dJvYwGE=;
 b=GiWOx+x+wgjDeHjeKAmhy+zTrouxsNxvNUw/hRu/ceuDCFIrvJK4+QZH
 sTUmuyKZBYIKX2R1Ud7vTgufXaauJ/wPsA72xh+gJH0G9//ErOv8bQ5lG
 g5SUhBPFs9B4dvYdzm0QGY0WmGOBWlj1cHngE/YSUcZDFr5a0K6GhXg0R
 zDFg3E3vQt8VSsEq8rWub4MuZcPZFaB6o8zalLxad6xbD+iQqhADSTUnj
 Fh4d2qJpDvbW1GccflZl1+XI74aFl/TkZhE5L09cJo/VZzxRAexZ1E/uX
 apYKvxj03iNEFLRVRKM7gqEa9kSWF37zYj7W4vwS2yvf1jqKJFJ+8GjsV A==;
X-CSE-ConnectionGUID: ypx/9ailQaK52IWXVZCYlg==
X-CSE-MsgGUID: 8quO1guURSOkPYN1t26cBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="56231383"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="56231383"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:35:02 -0800
X-CSE-ConnectionGUID: WfS7+pHITAmSbZZjofwmwg==
X-CSE-MsgGUID: JntOQbT6SZKlEITZ5kqmbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="84632540"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 06:35:01 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 1/2] lib/xe/xe_spin: move the spinner related functions to lib
Date: Thu,  7 Nov 2024 20:03:21 +0530
Message-Id: <20241107143322.348545-2-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107143322.348545-1-pravalika.gurram@intel.com>
References: <20241107143322.348545-1-pravalika.gurram@intel.com>
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

move spin_ctx_init,spin_ctx_start,spin_ctx_end,spin_ctx_destroy
to xe spin lib to avoid code redundancy.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/xe/xe_spin.c            | 118 +++++++++++++++++++++++
 lib/xe/xe_spin.h            |  23 +++++
 tests/intel/xe_drm_fdinfo.c | 185 ++++++------------------------------
 3 files changed, 170 insertions(+), 156 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 3adacc3a8..8ba7b8875 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -292,6 +292,124 @@ void xe_spin_free(int fd, struct igt_spin *spin)
 	free(spin);
 }
 
+struct spin_ctx *
+xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
+	      uint16_t width, uint16_t num_placements)
+{
+	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
+
+	igt_assert(width && num_placements &&
+		   (width == 1 || num_placements == 1));
+	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
+
+	ctx->class = hwe->engine_class;
+	ctx->width = width;
+	ctx->num_placements = num_placements;
+	ctx->vm = vm;
+
+	ctx->ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+	ctx->exec.num_batch_buffer = width;
+	ctx->exec.num_syncs = 2;
+	ctx->exec.syncs = to_user_pointer(ctx->sync);
+
+	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	ctx->sync[0].handle = syncobj_create(fd, 0);
+
+	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	ctx->sync[1].handle = syncobj_create(fd, 0);
+
+	ctx->bo_size = sizeof(struct xe_spin);
+	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
+	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
+			       vram_if_possible(fd, hwe->gt_id),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	if (ctx->ahnd > 0) {
+		for (unsigned int i = 0; i < width; i++)
+			ctx->addr[i] = intel_allocator_alloc_with_strategy(ctx->ahnd,
+					ctx->bo, ctx->bo_size, 0,
+					ALLOC_STRATEGY_LOW_TO_HIGH);
+	} else {
+		for (unsigned int i = 0; i < width; i++)
+			ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
+	}
+
+	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
+
+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
+					     hwe, 0, &ctx->exec_queue), 0);
+
+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
+			 ctx->sync, 1);
+
+	return ctx;
+}
+
+void xe_spin_sync_start(int fd, struct spin_ctx *ctx)
+{
+	if (!ctx)
+		return;
+
+	ctx->spin_opts.addr = ctx->addr[0];
+	ctx->spin_opts.write_timestamp = true;
+	ctx->spin_opts.preempt = true;
+	xe_spin_init(ctx->spin, &ctx->spin_opts);
+
+	/* re-use sync[0] for exec */
+	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+
+	ctx->exec.exec_queue_id = ctx->exec_queue;
+
+	if (ctx->width > 1)
+		ctx->exec.address = to_user_pointer(ctx->addr);
+	else
+		ctx->exec.address = ctx->addr[0];
+
+	xe_exec(fd, &ctx->exec);
+
+	xe_spin_wait_started(ctx->spin);
+	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
+
+	igt_debug("%d: spinner started\n", ctx->class);
+}
+
+void xe_spin_sync_end(int fd, struct spin_ctx *ctx)
+{
+	if (!ctx || ctx->ended)
+		return;
+
+	xe_spin_end(ctx->spin);
+
+	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	ctx->ended = true;
+	igt_debug("%d: spinner ended (timestamp=%u)\n", ctx->class,
+		  ctx->spin->timestamp);
+}
+
+void xe_spin_ctx_destroy(int fd, struct spin_ctx *ctx)
+{
+	if (!ctx)
+		return;
+
+	syncobj_destroy(fd, ctx->sync[0].handle);
+	syncobj_destroy(fd, ctx->sync[1].handle);
+	xe_exec_queue_destroy(fd, ctx->exec_queue);
+
+	munmap(ctx->spin, ctx->bo_size);
+	gem_close(fd, ctx->bo);
+	put_ahnd(ctx->ahnd);
+
+	free(ctx);
+}
+
 void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 		  struct xe_cork *cork)
 {
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index d65adb05c..a35b06109 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -43,9 +43,30 @@ struct xe_spin {
 	uint32_t timestamp;
 };
 
+struct spin_ctx {
+	uint32_t vm;
+	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
+	struct drm_xe_sync sync[2];
+	struct drm_xe_exec exec;
+	uint32_t exec_queue;
+	size_t bo_size;
+	uint32_t bo;
+	struct xe_spin *spin;
+	struct xe_spin_opts spin_opts;
+	bool ended;
+	uint16_t class;
+	uint16_t width;
+	uint16_t num_placements;
+	uint64_t ahnd;
+};
+
 igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
 uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t ns);
 void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
+struct spin_ctx *
+xe_spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
+	      uint16_t width, uint16_t num_placements);
+void xe_spin_ctx_destroy(int fd, struct spin_ctx *ctx);
 
 #define xe_spin_init_opts(fd, ...) \
 	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
@@ -55,6 +76,8 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
 void xe_spin_free(int fd, struct igt_spin *spin);
+void xe_spin_sync_start(int fd, struct spin_ctx *ctx);
+void xe_spin_sync_end(int fd, struct spin_ctx *ctx);
 
 struct xe_cork {
 	struct xe_spin *spin;
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 5fd7c0416..4a6dfa73c 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -367,133 +367,6 @@ static void basic_engine_utilization(int xe)
 	igt_require(info.num_engines);
 }
 
-struct spin_ctx {
-	uint32_t vm;
-	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
-	struct drm_xe_sync sync[2];
-	struct drm_xe_exec exec;
-	uint32_t exec_queue;
-	size_t bo_size;
-	uint32_t bo;
-	struct xe_spin *spin;
-	struct xe_spin_opts spin_opts;
-	bool ended;
-	uint16_t class;
-	uint16_t width;
-	uint16_t num_placements;
-};
-
-static struct spin_ctx *
-spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
-	      uint16_t width, uint16_t num_placements)
-{
-	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
-
-	igt_assert(width && num_placements &&
-		   (width == 1 || num_placements == 1));
-	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
-
-	ctx->class = hwe->engine_class;
-	ctx->width = width;
-	ctx->num_placements = num_placements;
-	ctx->vm = vm;
-
-	for (unsigned int i = 0; i < width; i++)
-		ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
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
-	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
-
-	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
-					     hwe, 0, &ctx->exec_queue), 0);
-
-	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
-			 ctx->sync, 1);
-
-	return ctx;
-}
-
-static void
-spin_sync_start(int fd, struct spin_ctx *ctx)
-{
-	if (!ctx)
-		return;
-
-	ctx->spin_opts.addr = ctx->addr[0];
-	ctx->spin_opts.write_timestamp = true;
-	ctx->spin_opts.preempt = true;
-	xe_spin_init(ctx->spin, &ctx->spin_opts);
-
-	/* re-use sync[0] for exec */
-	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-
-	ctx->exec.exec_queue_id = ctx->exec_queue;
-
-	if (ctx->width > 1)
-		ctx->exec.address = to_user_pointer(ctx->addr);
-	else
-		ctx->exec.address = ctx->addr[0];
-
-	xe_exec(fd, &ctx->exec);
-
-	xe_spin_wait_started(ctx->spin);
-	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
-
-	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
-}
-
-static void
-spin_sync_end(int fd, struct spin_ctx *ctx)
-{
-	if (!ctx || ctx->ended)
-		return;
-
-	xe_spin_end(ctx->spin);
-
-	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
-	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
-	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	ctx->ended = true;
-	igt_debug("%s: spinner ended (timestamp=%u)\n", engine_map[ctx->class],
-		  ctx->spin->timestamp);
-}
-
-static void
-spin_ctx_destroy(int fd, struct spin_ctx *ctx)
-{
-	if (!ctx)
-		return;
-
-	syncobj_destroy(fd, ctx->sync[0].handle);
-	syncobj_destroy(fd, ctx->sync[1].handle);
-	xe_exec_queue_destroy(fd, ctx->exec_queue);
-
-	munmap(ctx->spin, ctx->bo_size);
-	gem_close(fd, ctx->bo);
-
-	free(ctx);
-}
-
 static void
 check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 	      int class, int width, enum expected_load expected_load)
@@ -545,8 +418,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	vm = xe_vm_create(fd, 0, 0);
 	if (flags & TEST_BUSY) {
-		ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
-		spin_sync_start(fd, ctx);
+		ctx = xe_spin_ctx_init(fd, hwe, vm, 1, 1);
+		xe_spin_sync_start(fd, ctx);
 	}
 
 	read_engine_cycles(fd, pceu1[0]);
@@ -555,7 +428,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
-		spin_sync_end(fd, ctx);
+		xe_spin_sync_end(fd, ctx);
 
 	read_engine_cycles(fd, pceu2[0]);
 	if (flags & TEST_ISOLATION)
@@ -574,8 +447,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 		close(new_fd);
 	}
 
-	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
+	xe_spin_sync_end(fd, ctx);
+	xe_spin_ctx_destroy(fd, ctx);
 	xe_vm_destroy(fd, vm);
 }
 
@@ -588,15 +461,15 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 	uint32_t vm;
 
 	vm = xe_vm_create(fd, 0, 0);
-	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
-	spin_sync_start(fd, ctx);
+	ctx = xe_spin_ctx_init(fd, hwe, vm, 1, 1);
+	xe_spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
-	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
+	xe_spin_sync_end(fd, ctx);
+	xe_spin_ctx_destroy(fd, ctx);
 
 	read_engine_cycles(fd, pceu2);
 
@@ -616,12 +489,12 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
-	spin_sync_start(fd, ctx);
+	ctx = xe_spin_ctx_init(fd, hwe, vm, 1, 1);
+	xe_spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	spin_sync_end(fd, ctx);
+	xe_spin_sync_end(fd, ctx);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -631,8 +504,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 		check_results(pceu1, pceu2, class, 1, expected_load);
 	}
 
-	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
+	xe_spin_sync_end(fd, ctx);
+	xe_spin_ctx_destroy(fd, ctx);
 	xe_vm_destroy(fd, vm);
 }
 
@@ -655,14 +528,14 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 		if (_class == hwe->engine_class || ctx[_class])
 			continue;
 
-		ctx[_class] = spin_ctx_init(fd, _hwe, vm, 1, 1);
-		spin_sync_start(fd, ctx[_class]);
+		ctx[_class] = xe_spin_ctx_init(fd, _hwe, vm, 1, 1);
+		xe_spin_sync_start(fd, ctx[_class]);
 	}
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 	xe_for_each_engine_class(class)
-		spin_sync_end(fd, ctx[class]);
+		xe_spin_sync_end(fd, ctx[class]);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -673,8 +546,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 			continue;
 
 		check_results(pceu1, pceu2, class, 1, expected_load);
-		spin_sync_end(fd, ctx[class]);
-		spin_ctx_destroy(fd, ctx[class]);
+		xe_spin_sync_end(fd, ctx[class]);
+		xe_spin_ctx_destroy(fd, ctx[class]);
 	}
 
 	xe_vm_destroy(fd, vm);
@@ -698,14 +571,14 @@ utilization_all_full_load(int fd)
 		if (ctx[class])
 			continue;
 
-		ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
-		spin_sync_start(fd, ctx[class]);
+		ctx[class] = xe_spin_ctx_init(fd, hwe, vm, 1, 1);
+		xe_spin_sync_start(fd, ctx[class]);
 	}
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 	xe_for_each_engine_class(class)
-		spin_sync_end(fd, ctx[class]);
+		xe_spin_sync_end(fd, ctx[class]);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -713,8 +586,8 @@ utilization_all_full_load(int fd)
 			continue;
 
 		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
-		spin_sync_end(fd, ctx[class]);
-		spin_ctx_destroy(fd, ctx[class]);
+		xe_spin_sync_end(fd, ctx[class]);
+		xe_spin_ctx_destroy(fd, ctx[class]);
 	}
 
 	xe_vm_destroy(fd, vm);
@@ -767,8 +640,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
 	vm = xe_vm_create(fd, 0, 0);
 	if (flags & TEST_BUSY) {
-		ctx = spin_ctx_init(fd, eci, vm, width, num_placements);
-		spin_sync_start(fd, ctx);
+		ctx = xe_spin_ctx_init(fd, eci, vm, width, num_placements);
+		xe_spin_sync_start(fd, ctx);
 	}
 
 	read_engine_cycles(fd, pceu[0]);
@@ -777,7 +650,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
 	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
-		spin_sync_end(fd, ctx);
+		xe_spin_sync_end(fd, ctx);
 
 	read_engine_cycles(fd, pceu[1]);
 	if (flags & TEST_ISOLATION)
@@ -797,8 +670,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 		close(fd_spill);
 	}
 
-	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
+	xe_spin_sync_end(fd, ctx);
+	xe_spin_ctx_destroy(fd, ctx);
 
 	xe_vm_destroy(fd, vm);
 }
-- 
2.34.1

