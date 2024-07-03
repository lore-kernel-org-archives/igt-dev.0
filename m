Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9E0C31D97
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C689010E70C;
	Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvRGcFlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2E010E6F8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966338; x=1751502338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3as+QvGNtEwMNNXw68sJRvCb/e/wSPll0DQq5gkU35k=;
 b=DvRGcFlq3tBGW+H614Xq/bjLmpGkhn17ilBDvepBF9jtVjLJmnniMcu+
 z77/YXBIsshbpyiovjIPzTWx6KBKvbzQMxaNyKLDUBjHGdGTG203xvWHG
 SgX39LLmA7WZhqFXGC/Wcp26hID0GztdUPiSmRzh2CnyVsCFA+9fit7wQ
 Ak69VYciWKM9Qybl+K7JR/+maDjCtI3YUGYkC8lkCso+5yfITSqqsPkch
 vcOyBCFhnJz5U1PCYPpG8tADqA5hj626BtC2c0iijohQU15qcxjlN1QRf
 zr2zjlF5gMT215gaIFT/VfCq/4UXOOUuCKUV7y34ltuJCD/KzOz3QX28F Q==;
X-CSE-ConnectionGUID: muPR2Xc1QGOrCgNzZL8+ow==
X-CSE-MsgGUID: 9rBvagMmSeaXUvH51iQYGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074283"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074283"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
X-CSE-ConnectionGUID: ZPgnsh4yQTSKHWPtwFP9yw==
X-CSE-MsgGUID: pQGnjk8jSquQcAFPOqv6yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072872"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 04/10] tests/intel/xe_drm_fdinfo: Add helpers for
 spinning batches
Date: Tue,  2 Jul 2024 17:25:26 -0700
Message-Id: <20240703002532.3156277-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
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

Add helpers for submitting batches and waiting for them to start.

v2: Remove xe prefixes from the structures and helpers (Lucas)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 135 ++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index c697f3e53..037f25e53 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -54,6 +54,17 @@ static const char *engine_map[] = {
 	"vecs",
 	"ccs",
 };
+
+static const uint64_t batch_addr[] = {
+	0x170000,
+	0x180000,
+	0x190000,
+	0x1a0000,
+	0x1b0000,
+	0x1c0000,
+	0x1d0000,
+	0x1e0000,
+};
 static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
 {
 	struct drm_client_fdinfo info = { };
@@ -329,6 +340,130 @@ static void basic_engine_utilization(int xe)
 	igt_require(info.num_engines);
 }
 
+#define MAX_PARALLEL 8
+struct spin_ctx {
+	uint32_t vm;
+	uint64_t addr[MAX_PARALLEL];
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
+};
+
+static struct spin_ctx *
+spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
+	      uint16_t width, uint16_t num_placements)
+{
+	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
+
+	igt_assert(width && num_placements &&
+		   (width == 1 || num_placements == 1));
+
+	igt_assert(width <= MAX_PARALLEL);
+
+	ctx->class = hwe->engine_class;
+	ctx->width = width;
+	ctx->num_placements = num_placements;
+	ctx->vm = vm;
+	for (int i = 0; i < ctx->width; i++)
+		ctx->addr[i] = batch_addr[hwe->engine_class];
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
+static void
+spin_sync_start(int fd, struct spin_ctx *ctx)
+{
+	if (!ctx)
+		return;
+
+	ctx->spin_opts.addr = ctx->addr[0];
+	ctx->spin_opts.preempt = true;
+	xe_spin_init(ctx->spin, &ctx->spin_opts);
+
+	/* re-use sync[0] for exec */
+	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+
+	ctx->exec.exec_queue_id = ctx->exec_queue;
+	if (ctx->width > 1)
+		ctx->exec.address = to_user_pointer(ctx->addr);
+	else
+		ctx->exec.address = ctx->addr[0];
+	xe_exec(fd, &ctx->exec);
+
+	xe_spin_wait_started(ctx->spin);
+	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
+
+	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
+}
+
+static void
+spin_sync_end(int fd, struct spin_ctx *ctx)
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
+	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
+}
+
+static void
+spin_ctx_destroy(int fd, struct spin_ctx *ctx)
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
+
+	free(ctx);
+}
+
 igt_main
 {
 	int xe;
-- 
2.38.1

