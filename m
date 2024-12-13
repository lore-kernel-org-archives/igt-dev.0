Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291A3E77180
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 08:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A8F10EF5E;
	Fri, 13 Dec 2024 08:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPyGRuLv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1229210EF5A
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734079201; x=1765615201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y71b7P6RKF0DpOEQZ3XBiRRPC8wRwTrTpeYWcWoFtVk=;
 b=SPyGRuLvSa1RgKbsKZjSrMLoKTbQrdNKo32emNerpH9ExgW+TWd9e2tc
 v+U4BMjkQQxVTitRyFWSpuAY8dD1ls+O3wimd5XXgIYC4RUnlB0iTWiz+
 glvikCL7YT9B4F250mK0d51ZmGqJFPDjqDx5yR5zkiJsKsObOSCpP+8Fd
 ByLncxle+0PKLnFFndbhCY7dlPp6kqoqCTtvH7mIUWpH0DbIRqvoXt2mn
 x51qKXDN3BoV9OWawhPiawuBvxNSSdP4Gug+4uH4smhujOO/gyVEHdH0g
 TC/OvTmVaQyK1uBpx/9wNaZm4mn+HqmDN0zfMemoqCnzrO9Y16//x5j0h Q==;
X-CSE-ConnectionGUID: phEj7aGAT+iLGXmnHgc65g==
X-CSE-MsgGUID: nLPQcm2BQ1C0OPhc/zl8kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37374482"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="37374482"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 00:40:01 -0800
X-CSE-ConnectionGUID: xOf0r6dLTaWSlani5UbHfg==
X-CSE-MsgGUID: IHIlOzf5SRyZ4Ay5ryqjUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="97035359"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2024 00:39:59 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v9 1/2] lib/xe/xe_spin: move the spinner related functions to
 lib
Date: Fri, 13 Dec 2024 14:07:29 +0530
Message-Id: <20241213083730.642423-2-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213083730.642423-1-pravalika.gurram@intel.com>
References: <20241213083730.642423-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
removed xe_cork*  functions to avoid duplicate spinner code.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/xe/xe_spin.c            | 203 ++++++++++++++++++++++++++----------
 lib/xe/xe_spin.h            |  52 +++++----
 tests/intel/xe_drm_fdinfo.c | 195 ++++++----------------------------
 tests/intel/xe_vm.c         |  17 +--
 4 files changed, 222 insertions(+), 245 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 3adacc3a8..2bde55856 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -292,77 +292,168 @@ void xe_spin_free(int fd, struct igt_spin *spin)
 	free(spin);
 }
 
-void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
-		  struct xe_cork *cork)
-{
-	uint64_t addr = xe_get_default_alignment(fd);
-	size_t bo_size = xe_bb_size(fd, SZ_4K);
-	uint32_t vm, bo, exec_queue, syncobj;
-	struct xe_spin *spin;
-	struct drm_xe_sync sync = {
-		.type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
-	};
-	struct drm_xe_exec exec = {
-		.num_batch_buffer = 1,
-		.num_syncs = 1,
-		.syncs = to_user_pointer(&sync),
-	};
-
-	vm = xe_vm_create(fd, 0, 0);
+/**
+ * xe_cork_create:
+ * @fd: xe device fd
+ * @hwe: Xe engine class instance if device is Xe
+ * @vm: vm handle
+ * @width: number of batch buffers
+ * @num_placements: number of valid placements for this exec queue
+ * @opts: controlling options such as allocator handle, debug.
+ *
+ * xe_cork_create create vm, bo, exec_queue and bind the buffer
+ * using vmbind
+ *
+ * This returns xe_cork after binding buffer object.
+ */
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	spin = xe_bo_map(fd, bo, 0x1000);
+struct xe_cork *
+xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe,
+		uint32_t vm, uint16_t width, uint16_t num_placements,
+		struct xe_cork_opts *opts)
+{
+	struct xe_cork *ctx = calloc(1, sizeof(*ctx));
+
+	igt_assert(ctx);
+	igt_assert(width && num_placements &&
+		   (width == 1 || num_placements == 1));
+	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
+
+	ctx->class = hwe->engine_class;
+	ctx->width = width;
+	ctx->num_placements = num_placements;
+	ctx->vm = vm;
+	ctx->cork_opts = *opts;
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
+	if (ctx->cork_opts.ahnd) {
+		for (unsigned int i = 0; i < width; i++)
+			ctx->addr[i] = intel_allocator_alloc_with_strategy(ctx->cork_opts.ahnd,
+					ctx->bo, ctx->bo_size, 0,
+					ALLOC_STRATEGY_LOW_TO_HIGH);
+	} else {
+		for (unsigned int i = 0; i < width; i++)
+			ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
+	}
 
-	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
 
-	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
-	syncobj = syncobj_create(fd, 0);
+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
+					     hwe, 0, &ctx->exec_queue), 0);
 
-	xe_spin_init_opts(spin, .addr = addr, .preempt = true);
-	exec.exec_queue_id = exec_queue;
-	exec.address = addr;
-	sync.handle = syncobj;
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
+			 ctx->sync, 1);
 
-	cork->spin = spin;
-	cork->fd = fd;
-	cork->vm = vm;
-	cork->bo = bo;
-	cork->exec_queue = exec_queue;
-	cork->syncobj = syncobj;
+	return ctx;
 }
 
-bool xe_cork_started(struct xe_cork *cork)
+/**
+ * xe_cork_sync_start:
+ *
+ * @fd: xe device fd
+ * @ctx: pointer to xe_cork structure
+ *
+ * run the spinner using xe_spin_init submit batch using xe_exec
+ * and wait for fence using syncobj_wait
+ */
+void xe_cork_sync_start(int fd, struct xe_cork *ctx)
 {
-	return xe_spin_started(cork->spin);
-}
+	igt_assert(ctx);
 
-void xe_cork_wait_started(struct xe_cork *cork)
-{
-	xe_spin_wait_started(cork->spin);
-}
+	ctx->spin_opts.addr = ctx->addr[0];
+	ctx->spin_opts.write_timestamp = true;
+	ctx->spin_opts.preempt = true;
+	xe_spin_init(ctx->spin, &ctx->spin_opts);
 
-void xe_cork_end(struct xe_cork *cork)
-{
-	xe_spin_end(cork->spin);
-}
+	/* reuse sync[0] as in-fence for exec */
+	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 
-void xe_cork_wait_done(struct xe_cork *cork)
-{
-	igt_assert(syncobj_wait(cork->fd, &cork->syncobj, 1, INT64_MAX, 0,
-				NULL));
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
+	if (ctx->cork_opts.debug)
+		igt_info("%d: spinner started\n", ctx->class);
 }
 
-void xe_cork_fini(struct xe_cork *cork)
+/*
+ * xe_cork_sync_end
+ *
+ * @fd: xe device fd
+ * @ctx: pointer to xe_cork structure
+ *
+ * Wrapper to end spinner created by xe_cork_create. It will
+ * unbind the vm which was binded to the exec_queue and bo.
+ */
+void xe_cork_sync_end(int fd, struct xe_cork *ctx)
 {
-	syncobj_destroy(cork->fd, cork->syncobj);
-	xe_exec_queue_destroy(cork->fd, cork->exec_queue);
-	xe_vm_destroy(cork->fd, cork->vm);
-	gem_close(cork->fd, cork->bo);
+	igt_assert(ctx);
+
+	if (ctx->ended)
+		igt_warn("Don't attempt call end twice %d\n", ctx->ended);
+
+	xe_spin_end(ctx->spin);
+
+	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	syncobj_reset(fd, &ctx->sync[0].handle, 1);
+
+	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	ctx->ended = true;
+
+	if (ctx->cork_opts.debug)
+		igt_info("%d: spinner ended (timestamp=%u)\n", ctx->class,
+			ctx->spin->timestamp);
 }
 
-uint32_t xe_cork_sync_handle(struct xe_cork *cork)
+/*
+ * xe_cork_destroy
+ *
+ * @fd: xe device fd
+ * @ctx: pointer to xe_cork structure
+ *
+ * It will destroy vm, exec_queue and free the ctx.
+ */
+void xe_cork_destroy(int fd, struct xe_cork *ctx)
 {
-	return cork->syncobj;
+	igt_assert(ctx);
+
+	syncobj_destroy(fd, ctx->sync[0].handle);
+	syncobj_destroy(fd, ctx->sync[1].handle);
+	xe_exec_queue_destroy(fd, ctx->exec_queue);
+
+	if (ctx->cork_opts.ahnd)
+		intel_allocator_free(ctx->cork_opts.ahnd, ctx->bo);
+
+	munmap(ctx->spin, ctx->bo_size);
+	gem_close(fd, ctx->bo);
+
+	free(ctx);
 }
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index d65adb05c..593065bc0 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -32,6 +32,11 @@ struct xe_spin_opts {
 	bool write_timestamp;
 };
 
+struct xe_cork_opts {
+	uint64_t ahnd;
+	bool debug;
+};
+
 /* Mapped GPU object */
 struct xe_spin {
 	uint32_t batch[128];
@@ -43,9 +48,36 @@ struct xe_spin {
 	uint32_t timestamp;
 };
 
+struct xe_cork {
+	struct xe_spin *spin;
+	int fd;
+	uint32_t vm;
+	uint32_t bo;
+	uint32_t exec_queue;
+	uint32_t syncobj;
+	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
+	struct drm_xe_sync sync[2];
+	struct drm_xe_exec exec;
+	size_t bo_size;
+	struct xe_spin_opts spin_opts;
+	struct xe_cork_opts cork_opts;
+	bool ended;
+	uint16_t class;
+	uint16_t width;
+	uint16_t num_placements;
+};
+
 igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
 uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t ns);
 void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
+struct xe_cork *
+xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
+	      uint16_t width, uint16_t num_placements, struct xe_cork_opts *opts);
+void xe_cork_destroy(int fd, struct xe_cork *ctx);
+
+#define xe_cork_create_opts(fd, hwe, vm, width, num_placements, ...) \
+	xe_cork_create(fd, hwe, vm, width, num_placements, \
+			&((struct xe_cork_opts){__VA_ARGS__}))
 
 #define xe_spin_init_opts(fd, ...) \
 	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
@@ -55,23 +87,7 @@ void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
 void xe_spin_free(int fd, struct igt_spin *spin);
-
-struct xe_cork {
-	struct xe_spin *spin;
-	int fd;
-	uint32_t vm;
-	uint32_t bo;
-	uint32_t exec_queue;
-	uint32_t syncobj;
-};
-
-void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
-		  struct xe_cork *cork);
-bool xe_cork_started(struct xe_cork *cork);
-void xe_cork_wait_started(struct xe_cork *cork);
-void xe_cork_end(struct xe_cork *cork);
-void xe_cork_wait_done(struct xe_cork *cork);
-void xe_cork_fini(struct xe_cork *cork);
-uint32_t xe_cork_sync_handle(struct xe_cork *cork);
+void xe_cork_sync_start(int fd, struct xe_cork *ctx);
+void xe_cork_sync_end(int fd, struct xe_cork *ctx);
 
 #endif	/* XE_SPIN_H */
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index ef9273e2a..66a181d5b 100644
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
@@ -535,7 +408,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 {
 	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct spin_ctx *ctx = NULL;
+	struct xe_cork *ctx = NULL;
 	enum expected_load expected_load;
 	uint32_t vm;
 	int new_fd;
@@ -545,8 +418,8 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	vm = xe_vm_create(fd, 0, 0);
 	if (flags & TEST_BUSY) {
-		ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
-		spin_sync_start(fd, ctx);
+		ctx = xe_cork_create_opts(fd, hwe, vm, 1, 1);
+		xe_cork_sync_start(fd, ctx);
 	}
 
 	read_engine_cycles(fd, pceu1[0]);
@@ -555,7 +428,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
-		spin_sync_end(fd, ctx);
+		xe_cork_sync_end(fd, ctx);
 
 	read_engine_cycles(fd, pceu2[0]);
 	if (flags & TEST_ISOLATION)
@@ -574,8 +447,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 		close(new_fd);
 	}
 
-	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
+	xe_cork_destroy(fd, ctx);
 	xe_vm_destroy(fd, vm);
 }
 
@@ -584,19 +456,19 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct spin_ctx *ctx = NULL;
+	struct xe_cork *ctx = NULL;
 	uint32_t vm;
 
 	vm = xe_vm_create(fd, 0, 0);
-	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
-	spin_sync_start(fd, ctx);
+	ctx = xe_cork_create_opts(fd, hwe, vm, 1, 1);
+	xe_cork_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
-	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
+	xe_cork_sync_end(fd, ctx);
+	xe_cork_destroy(fd, ctx);
 
 	read_engine_cycles(fd, pceu2);
 
@@ -610,18 +482,17 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct spin_ctx *ctx = NULL;
+	struct xe_cork *ctx = NULL;
 	uint32_t vm;
 	int class;
 
 	vm = xe_vm_create(fd, 0, 0);
-
-	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
-	spin_sync_start(fd, ctx);
+	ctx = xe_cork_create_opts(fd, hwe, vm, 1, 1);
+	xe_cork_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
-	spin_sync_end(fd, ctx);
+	xe_cork_sync_end(fd, ctx);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -631,8 +502,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 		check_results(pceu1, pceu2, class, 1, expected_load);
 	}
 
-	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
+	xe_cork_destroy(fd, ctx);
 	xe_vm_destroy(fd, vm);
 }
 
@@ -641,7 +511,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct xe_cork *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
 	struct drm_xe_engine_class_instance *_hwe;
 	uint32_t vm;
 	int class;
@@ -654,15 +524,14 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 
 		if (_class == hwe->engine_class || ctx[_class])
 			continue;
-
-		ctx[_class] = spin_ctx_init(fd, _hwe, vm, 1, 1);
-		spin_sync_start(fd, ctx[_class]);
+		ctx[_class] = xe_cork_create_opts(fd, _hwe, vm, 1, 1);
+		xe_cork_sync_start(fd, ctx[_class]);
 	}
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 	xe_for_each_engine_class(class)
-		spin_sync_end(fd, ctx[class]);
+		xe_cork_sync_end(fd, ctx[class]);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -673,8 +542,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 			continue;
 
 		check_results(pceu1, pceu2, class, 1, expected_load);
-		spin_sync_end(fd, ctx[class]);
-		spin_ctx_destroy(fd, ctx[class]);
+		xe_cork_destroy(fd, ctx[class]);
 	}
 
 	xe_vm_destroy(fd, vm);
@@ -685,7 +553,7 @@ utilization_all_full_load(int fd)
 {
 	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
-	struct spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct xe_cork *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
 	struct drm_xe_engine_class_instance *hwe;
 	uint32_t vm;
 	int class;
@@ -697,15 +565,14 @@ utilization_all_full_load(int fd)
 		class = hwe->engine_class;
 		if (ctx[class])
 			continue;
-
-		ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
-		spin_sync_start(fd, ctx[class]);
+		ctx[class] = xe_cork_create_opts(fd, hwe, vm, 1, 1);
+		xe_cork_sync_start(fd, ctx[class]);
 	}
 
 	read_engine_cycles(fd, pceu1);
 	usleep(batch_duration_usec);
 	xe_for_each_engine_class(class)
-		spin_sync_end(fd, ctx[class]);
+		xe_cork_sync_end(fd, ctx[class]);
 	read_engine_cycles(fd, pceu2);
 
 	xe_for_each_engine_class(class) {
@@ -713,8 +580,7 @@ utilization_all_full_load(int fd)
 			continue;
 
 		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
-		spin_sync_end(fd, ctx[class]);
-		spin_ctx_destroy(fd, ctx[class]);
+		xe_cork_destroy(fd, ctx[class]);
 	}
 
 	xe_vm_destroy(fd, vm);
@@ -741,7 +607,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 	struct pceu_cycles pceu[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct pceu_cycles pceu_spill[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
 	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
-	struct spin_ctx *ctx = NULL;
+	struct xe_cork *ctx = NULL;
 	enum expected_load expected_load;
 	int fd_spill, num_placements;
 	uint32_t vm;
@@ -767,8 +633,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
 	vm = xe_vm_create(fd, 0, 0);
 	if (flags & TEST_BUSY) {
-		ctx = spin_ctx_init(fd, eci, vm, width, num_placements);
-		spin_sync_start(fd, ctx);
+		ctx = xe_cork_create_opts(fd, eci, vm, width, num_placements);
+		xe_cork_sync_start(fd, ctx);
 	}
 
 	read_engine_cycles(fd, pceu[0]);
@@ -777,7 +643,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 
 	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
-		spin_sync_end(fd, ctx);
+		xe_cork_sync_end(fd, ctx);
 
 	read_engine_cycles(fd, pceu[1]);
 	if (flags & TEST_ISOLATION)
@@ -797,8 +663,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 		close(fd_spill);
 	}
 
-	spin_sync_end(fd, ctx);
-	spin_ctx_destroy(fd, ctx);
+	xe_cork_destroy(fd, ctx);
 
 	xe_vm_destroy(fd, vm);
 }
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index e78ddd0e5..d51a75aec 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -945,18 +945,23 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	sync[0].handle = syncobj_create(fd, 0);
 	if (flags & BIND_ARRAY_ENOBUFS_FLAG) {
-		struct xe_cork cork;
+		struct xe_cork *ctx = NULL;
+		uint32_t vm_cork;
 
-		xe_cork_init(fd, eci, &cork);
+		vm_cork = xe_vm_create(fd, 0, 0);
+		ctx = xe_cork_create_opts(fd, eci, vm_cork, 1, 1);
+		xe_cork_sync_start(fd, ctx);
 
-		sync[1].handle = xe_cork_sync_handle(&cork);
+		sync[1].handle = ctx->sync[1].handle;
 		sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 
 		xe_vm_bind_array_err(fd, vm, bind_exec_queue, bind_ops,
 				     n_execs, sync, 2, ENOBUFS);
-		xe_cork_end(&cork);
-		xe_cork_wait_done(&cork);
-		xe_cork_fini(&cork);
+		/* destroy queue before sampling again */
+		xe_cork_sync_end(fd, ctx);
+		xe_cork_destroy(fd, ctx);
+		xe_vm_destroy(fd, vm_cork);
+
 		n_execs = n_execs / 4;
 	}
 
-- 
2.34.1

