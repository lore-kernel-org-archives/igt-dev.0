Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462B1C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 22:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB37C10E842;
	Fri, 16 Aug 2024 22:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/EEx//b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F4B10E842
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 22:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723846908; x=1755382908;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3EnTpTJEHtYVECrCpa+1ND6zEJAfl+Eo9Ogf0H7XeEc=;
 b=Z/EEx//bbX1vV8PjHD5+GqpAe/Tiz9m7XfGSxuK8j7tm6HGrLq5T7wah
 vdEfdXjW1fcycGUfXa6PVH+fUZGuE+lEWtkMyruGEAhfQWMpv0QJjPhi5
 UVGJvMBbJrEHjIf2saMGh4eW9SfOjb6n0ahdsMHLwKWbSUFvYG2DOpyW4
 FD/PvexinLfElA8ckb6fYBnjKDeQF3Qxz3BgLVp3DKhuF2vcapUT1sOeL
 p7pfp0Yj307bpX/zrMgA3x7mzTLxxRrZjeGLgG4QyDkTf4Pj4W20BSZnv
 dwgh/xgmAwLf+O6TsVIakEnzixYs1bN+McxVH0R2d/ksLH2Bxwe6vwqRV A==;
X-CSE-ConnectionGUID: A5IYD5bJRVWsXMeFxYN2Fw==
X-CSE-MsgGUID: Y6UIPgpcTLCjN++adSNhyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22299508"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="22299508"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 15:21:48 -0700
X-CSE-ConnectionGUID: ErDJwSH4RemO2SozjgsiDg==
X-CSE-MsgGUID: mdTYIcj1TJaguFZzQL5o1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="64194579"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 15:21:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Add single engine tests
Date: Fri, 16 Aug 2024 15:15:57 -0700
Message-ID: <20240816222140.22577-1-lucas.demarchi@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Add simple tests that submit work to one engine and measure utilization
per class.

v2:
- Drop measured_usleep since return value is not used
- s/parallel engines/parallel submission/ in comment
- Use NSEC_PER_SEC for batch_duration_ns
- Percent should not be > 100
- Check utilization for both clients for isolation case
v3 (Lucas):
- Squash some patches to avoid warnings
- Remove traces of parallel/virtual execution, to be added
  separately

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

This corresponds to patches 3-5 from https://patchwork.freedesktop.org/series/135204/
Changes heres are in the v3 changelog above.

I didn't want to heavily change this patch, so even if my feedback on v2
remains, I plan to do some cleanup on top, moving common stuff to
xe_spin.c to be similar to xe_cork.  The other patches from that series
will be further simplified since the setup for virtual/parallel exec
queue got merged.

 tests/intel/xe_drm_fdinfo.c | 222 ++++++++++++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 2f9661a0b..735fbe5e6 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -28,6 +28,15 @@
  * SUBTEST: basic-engine-utilization
  * Description: Check if basic fdinfo content is present for engine utilization
  *
+ * SUBTEST: drm-idle
+ * Description: Check that engines show no load when idle
+ *
+ * SUBTEST: drm-busy-idle
+ * Description: Check that engines show load when idle after busy
+ *
+ * SUBTEST: drm-busy-idle-isolation
+ * Description: Check that engine load does not spill over to other drm clients
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -42,6 +51,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 
 #define BO_SIZE (65536)
 
+/* flag masks */
+#define TEST_BUSY		(1 << 0)
+#define TEST_TRAILING_IDLE	(1 << 1)
+#define TEST_ISOLATION		(1 << 2)
+
+struct pceu_cycles {
+	uint64_t cycles;
+	uint64_t total_cycles;
+};
+
+const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
+
 static const char *engine_map[] = {
 	"rcs",
 	"bcs",
@@ -50,6 +71,21 @@ static const char *engine_map[] = {
 	"ccs",
 };
 
+static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
+{
+	struct drm_client_fdinfo info = { };
+	int class;
+
+	igt_assert(pceu);
+	igt_assert(igt_parse_drm_fdinfo(xe, &info, engine_map,
+					ARRAY_SIZE(engine_map), NULL, 0));
+
+	xe_for_each_engine_class(class) {
+		pceu[class].cycles = info.cycles[class];
+		pceu[class].total_cycles = info.total_cycles[class];
+	}
+}
+
 /* Subtests */
 static void test_active(int fd, struct drm_xe_engine *engine)
 {
@@ -310,8 +346,182 @@ static void basic_engine_utilization(int xe)
 	igt_require(info.num_engines);
 }
 
+struct spin_ctx {
+	uint32_t vm;
+	uint64_t addr;
+	struct drm_xe_sync sync[2];
+	struct drm_xe_exec exec;
+	uint32_t exec_queue;
+	size_t bo_size;
+	uint32_t bo;
+	struct xe_spin *spin;
+	struct xe_spin_opts spin_opts;
+	bool ended;
+	uint16_t class;
+};
+
+static struct spin_ctx *
+spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
+{
+	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
+
+	ctx->class = hwe->engine_class;
+	ctx->vm = vm;
+	ctx->addr = 0x100000;
+
+	ctx->exec.num_batch_buffer = 1;
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
+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, 1, 1,
+					     hwe, 0, &ctx->exec_queue), 0);
+
+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr, ctx->bo_size,
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
+	ctx->spin_opts.addr = ctx->addr;
+	ctx->spin_opts.preempt = true;
+	xe_spin_init(ctx->spin, &ctx->spin_opts);
+
+	/* re-use sync[0] for exec */
+	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+
+	ctx->exec.exec_queue_id = ctx->exec_queue;
+	ctx->exec.address = ctx->addr;
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
+	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr, ctx->bo_size, ctx->sync, 1);
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
+static void
+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
+	      int class, unsigned int flags)
+{
+	double percent;
+
+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
+
+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
+
+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
+
+	if (flags & TEST_BUSY)
+		igt_assert(percent >= 95 && percent <= 100);
+	else
+		igt_assert(!percent);
+}
+
+static void
+single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
+{
+	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx = NULL;
+	uint32_t vm;
+	int new_fd;
+
+	if (flags & TEST_ISOLATION)
+		new_fd = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		ctx = spin_ctx_init(fd, hwe, vm);
+		spin_sync_start(fd, ctx);
+	}
+
+	read_engine_cycles(fd, pceu1[0]);
+	if (flags & TEST_ISOLATION)
+		read_engine_cycles(new_fd, pceu1[1]);
+
+	usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		spin_sync_end(fd, ctx);
+
+	read_engine_cycles(fd, pceu2[0]);
+	if (flags & TEST_ISOLATION)
+		read_engine_cycles(new_fd, pceu2[1]);
+
+	check_results(pceu1[0], pceu2[0], hwe->engine_class, flags);
+
+	if (flags & TEST_ISOLATION) {
+		check_results(pceu1[1], pceu2[1], hwe->engine_class, 0);
+		close(new_fd);
+	}
+
+	spin_sync_end(fd, ctx);
+	spin_ctx_destroy(fd, ctx);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe;
 	int xe;
 
 	igt_fixture {
@@ -330,6 +540,18 @@ igt_main
 	igt_subtest("basic-engine-utilization")
 		basic_engine_utilization(xe);
 
+	igt_subtest("drm-idle")
+		xe_for_each_engine(xe, hwe)
+			single(xe, hwe, 0);
+
+	igt_subtest("drm-busy-idle")
+		xe_for_each_engine(xe, hwe)
+			single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-busy-idle-isolation")
+		xe_for_each_engine(xe, hwe)
+			single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.43.0

