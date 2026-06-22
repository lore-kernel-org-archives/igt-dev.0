Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514ECCDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 12:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D117B10E67D;
	Mon, 22 Jun 2026 12:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lq/2jYRD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAB610E67D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 12:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782130823; x=1813666823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NelZmPeVzUiFVMlMUUKJKt6otnZUdsjWccM0LGyc+dY=;
 b=lq/2jYRDUh12ATvDFVt557MfUNbEm0nMeMfYIirq9FeNjfgUPO6lOhvc
 F354+qOpaJDOuBNj4T3Ft1DL/UTXBmRWBcHrSyUN6jjvrv6bnC6HURMgq
 7cG5Q4t6Hb+hJFcEhFfhKHPs0zrnVlnb+aQll+BIHQpn6J5aL6o26qGRu
 RtMs35TQx1b8LEdGc+fmaDKCI8T0VuiIyHCPXDTVZ5zPx0wAyVkVpez/d
 iYjxmpx313FZ4KHWIEkyHBGrzha/2Z83sPZmMBgNf/mNmdvStd5tFKEDt
 IiCWxD+gXB3NCF3h9Mra1GYfXstdRQXMcPVyTz2rNHSHViwhDtW7JHknJ A==;
X-CSE-ConnectionGUID: 0mtOTYdJSCS1pF9OXJLlGQ==
X-CSE-MsgGUID: TqsoJQvuRc2nAP45cz2uRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82967181"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82967181"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 05:20:23 -0700
X-CSE-ConnectionGUID: PpF25vF8SfW4CF3QJ/D+wQ==
X-CSE-MsgGUID: NV1waNiaT9Wjt++FLHGbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="245063638"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 05:20:22 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 1/2] tests/intel/xe_exec_basic: Add timeline syncobj exec
 tests
Date: Mon, 22 Jun 2026 14:20:08 +0200
Message-ID: <20260622122009.3350724-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622122009.3350724-1-jan.maslak@intel.com>
References: <20260622122009.3350724-1-jan.maslak@intel.com>
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

Add Xe-specific timeline syncobj coverage for xe_exec.

The input test covers waiting on an older completed timeline point
after the same syncobj has already advanced to a later point. This is
the shape that exposed the historical xe_exec regression when exec
parsing reached an input timeline sync with no backing fence.

Also add a timeline syncobj output test to verify Xe signals the
requested timeline point when execution completes.

Keep the coverage in xe_exec_basic so the test exercises the Xe exec
uAPI directly instead of only the generic syncobj timeline helpers.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_exec_basic.c | 223 ++++++++++++++++++++++++++++++++++++
 1 file changed, 223 insertions(+)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 5335bffc41..7b5318919f 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -31,6 +31,209 @@
 #define DEFER_BIND		(0x1 << 6)
 #define SPARSE			(0x1 << 7)
 
+static void write_store_dword_batch(uint32_t *batch, size_t batch_size,
+				    uint64_t addr, uint32_t value)
+{
+	int b = 0;
+
+	/* Build a minimal batch that stores one dword and then terminates. */
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = addr;
+	batch[b++] = addr >> 32;
+	batch[b++] = value;
+	batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert_lte(b, batch_size);
+	igt_assert_eq(b, 5);
+}
+
+struct timeline_exec_data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+};
+
+struct timeline_exec_ctx {
+	struct timeline_exec_data *data;
+	struct drm_xe_exec exec;
+	uint64_t addr;
+	uint64_t batch_addr;
+	uint64_t sdi_addr;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t bo;
+	size_t bo_size;
+};
+
+static void timeline_exec_ctx_init(int fd,
+				   struct drm_xe_engine_class_instance *eci,
+				   struct timeline_exec_ctx *ctx)
+{
+	uint64_t batch_offset;
+	uint64_t sdi_offset;
+
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->addr = 0x1a0000;
+	ctx->vm = xe_vm_create(fd, 0, 0);
+	ctx->bo_size = xe_bb_size(fd, sizeof(*ctx->data));
+	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
+			       vram_if_possible(fd, eci->gt_id),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	ctx->data = xe_bo_map(fd, ctx->bo, ctx->bo_size);
+	ctx->exec_queue = xe_exec_queue_create(fd, ctx->vm, eci, 0);
+
+	batch_offset = (char *)&ctx->data->batch - (char *)ctx->data;
+	ctx->batch_addr = ctx->addr + batch_offset;
+	sdi_offset = (char *)&ctx->data->data - (char *)ctx->data;
+	ctx->sdi_addr = ctx->addr + sdi_offset;
+
+	ctx->exec = (struct drm_xe_exec) {
+		.num_batch_buffer = 1,
+		.exec_queue_id = ctx->exec_queue,
+		.address = ctx->batch_addr,
+	};
+	xe_vm_bind_sync(fd, ctx->vm, ctx->bo, 0, ctx->addr, ctx->bo_size);
+}
+
+static void timeline_exec_ctx_fini(int fd, struct timeline_exec_ctx *ctx)
+{
+	xe_vm_unbind_sync(fd, ctx->vm, 0, ctx->addr, ctx->bo_size);
+	xe_exec_queue_destroy(fd, ctx->exec_queue);
+	munmap(ctx->data, ctx->bo_size);
+	gem_close(fd, ctx->bo);
+	xe_vm_destroy(fd, ctx->vm);
+}
+
+/**
+ * SUBTEST: timeline-syncobj-exec-completed-point-in
+ * Description: Submit xe_exec with an input dependency on an older completed
+ *              timeline point after the same syncobj has already advanced to a
+ *              later point, and verify Xe still accepts the completed
+ *              dependency and runs the batch.
+ * Test category: functionality test
+ */
+
+static void
+test_timeline_syncobj_exec_completed_point_in(int fd,
+					      struct drm_xe_engine_class_instance *eci)
+{
+	struct timeline_exec_ctx ctx;
+	struct drm_xe_exec exec;
+	uint64_t input_wait_point = 1;
+	uint64_t input_signal_point = 2;
+	uint32_t input_syncobj;
+	uint32_t completion_syncobj;
+	struct drm_xe_sync prime_sync;
+	struct drm_xe_sync input_sync;
+	struct drm_xe_sync completion_sync;
+	const uint32_t prime_value = 0x1234abcd;
+	const uint32_t expected = 0xc0ffee;
+
+	timeline_exec_ctx_init(fd, eci, &ctx);
+	exec = ctx.exec;
+	input_syncobj = syncobj_create(fd, 0);
+
+	/* Step 1: signal point 1 on this timeline from Xe work. */
+	write_store_dword_batch(ctx.data->batch, ARRAY_SIZE(ctx.data->batch),
+				ctx.sdi_addr, prime_value);
+	ctx.data->data = 0;
+	prime_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = input_syncobj,
+		.timeline_value = input_wait_point,
+	};
+	exec.syncs = to_user_pointer(&prime_sync);
+	exec.num_syncs = 1;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_timeline_wait(fd, &input_syncobj,
+					 &input_wait_point, 1,
+					 INT64_MAX, 0, NULL));
+	igt_assert_eq(ctx.data->data, prime_value);
+
+	/* Step 2: signal point 2 on the same timeline so point 1 becomes older. */
+	ctx.data->data = 0;
+	prime_sync.timeline_value = input_signal_point;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_timeline_wait(fd, &input_syncobj,
+					 &input_signal_point, 1,
+					 INT64_MAX, 0, NULL));
+	igt_assert_eq(ctx.data->data, prime_value);
+
+	/* Step 3: submit the real exec with point 1 as the input dependency. */
+	write_store_dword_batch(ctx.data->batch, ARRAY_SIZE(ctx.data->batch),
+				ctx.sdi_addr, expected);
+	ctx.data->data = 0;
+	input_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = 0,
+		.handle = input_syncobj,
+		.timeline_value = input_wait_point,
+	};
+	completion_syncobj = syncobj_create(fd, 0);
+
+	/* Use a binary completion fence so the input-only case stays input-only. */
+	completion_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = completion_syncobj,
+	};
+	{
+		struct drm_xe_sync exec_syncs[] = { input_sync, completion_sync };
+
+		/* Wait for timeline point 1, then signal the binary completion syncobj. */
+		exec.syncs = to_user_pointer(exec_syncs);
+		exec.num_syncs = ARRAY_SIZE(exec_syncs);
+		xe_exec(fd, &exec);
+	}
+	igt_assert(syncobj_wait(fd, &completion_syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(ctx.data->data, expected);
+
+	syncobj_destroy(fd, completion_syncobj);
+	syncobj_destroy(fd, input_syncobj);
+	timeline_exec_ctx_fini(fd, &ctx);
+}
+
+/**
+ * SUBTEST: timeline-syncobj-exec-out
+ * Description: Submit xe_exec with a timeline syncobj output and verify Xe
+ *              signals the requested timeline point when execution completes.
+ * Test category: functionality test
+ */
+
+static void test_timeline_syncobj_exec_out(int fd,
+					   struct drm_xe_engine_class_instance *eci)
+{
+	struct timeline_exec_ctx ctx;
+	struct drm_xe_exec exec;
+	uint64_t output_point = 2;
+	uint32_t output_syncobj;
+	struct drm_xe_sync output_sync;
+	const uint32_t expected = 0xc0ffee;
+
+	timeline_exec_ctx_init(fd, eci, &ctx);
+	exec = ctx.exec;
+	output_syncobj = syncobj_create(fd, 0);
+
+	write_store_dword_batch(ctx.data->batch, ARRAY_SIZE(ctx.data->batch),
+				ctx.sdi_addr, expected);
+	ctx.data->data = 0;
+	output_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = output_syncobj,
+		.timeline_value = output_point,
+	};
+	exec.syncs = to_user_pointer(&output_sync);
+	exec.num_syncs = 1;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_timeline_wait(fd, &output_syncobj, &output_point, 1,
+					 INT64_MAX, 0, NULL));
+	igt_assert_eq(ctx.data->data, expected);
+
+	syncobj_destroy(fd, output_syncobj);
+	timeline_exec_ctx_fini(fd, &ctx);
+}
+
 /**
  * SUBTEST: once-%s
  * Description: Run %arg[1] test only once
@@ -348,6 +551,26 @@ int igt_main()
 	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
+	igt_subtest_with_dynamic("timeline-syncobj-exec-completed-point-in") {
+		igt_require(igt_has_drm_cap(fd, DRM_CAP_SYNCOBJ_TIMELINE));
+
+		xe_for_each_engine(fd, hwe)
+			igt_dynamic_f("%s%d",
+				      xe_engine_class_short_string(hwe->engine_class),
+				      hwe->engine_instance)
+				test_timeline_syncobj_exec_completed_point_in(fd, hwe);
+	}
+
+	igt_subtest_with_dynamic("timeline-syncobj-exec-out") {
+		igt_require(igt_has_drm_cap(fd, DRM_CAP_SYNCOBJ_TIMELINE));
+
+		xe_for_each_engine(fd, hwe)
+			igt_dynamic_f("%s%d",
+				      xe_engine_class_short_string(hwe->engine_class),
+				      hwe->engine_instance)
+				test_timeline_syncobj_exec_out(fd, hwe);
+	}
+
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_with_dynamic_f("once-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-- 
2.43.0

