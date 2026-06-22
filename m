Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76AECDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 08:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C0210E545;
	Mon, 22 Jun 2026 08:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQQ5dwd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850910E545
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782118415; x=1813654415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fjUI5/KemragSjiox4Ap9NcU3vvRItwpRv5JrGgD9q4=;
 b=AQQ5dwd9/RlesPjLLvDdZ/N0T91dEk3A9wZRUBi8BEd4SzElz1/jOm3D
 lZnCILh93oO5kphSkS1XJQHN49zbTGbCckQsb0R9/1HOnGpADSsz15yLQ
 MACKJMpWPMD/bZh5FMpA61R8+Pnnj0ogArw0I+jWRkHt1GFOnzKuTRlzy
 CymVXLZYKFdwEanwGNYTm7qSVQ1f14GGkVL1/eOeRFAysVSH0/kkRwh67
 Y7T2fZRyrxgmP6jh0sKy8UhHX3jvladK8fGEps86G0YIs06Iz0ckDxU4R
 s+COOCzkJ8ey5hB18YmDEQ3EcrcG+kVxev2GJur7nxQWL884Kb77ZQxSl w==;
X-CSE-ConnectionGUID: NObLKULTQyy9M6nClrAUyg==
X-CSE-MsgGUID: FjH45amkQ96j/Yh7XM4KMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="85396581"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="85396581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:53:35 -0700
X-CSE-ConnectionGUID: WhsWyySJTvSDGYw7wQsm7w==
X-CSE-MsgGUID: P8+5CceZRmycGSMWiWF8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="253505537"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:53:33 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/2] tests/intel/xe_vm: Add timeline syncobj vm_bind tests
Date: Mon, 22 Jun 2026 10:51:59 +0200
Message-ID: <20260622085159.3318909-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622085159.3318909-1-jan.maslak@intel.com>
References: <20260622085159.3318909-1-jan.maslak@intel.com>
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

Add Xe-specific timeline syncobj coverage for xe_vm_bind.

The input test mirrors the exec-side completed-point setup by waiting on
an older completed timeline point after the same syncobj has already
advanced to a later point. While the historical regression was in the
exec path, this adds equivalent vm_bind interface coverage for the same
timeline syncobj behavior.

Also add a timeline syncobj output test to verify xe_vm_bind signals the
requested timeline point when the bind completes.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_vm.c | 152 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 386a0981aa..872be0825f 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -29,6 +29,16 @@ enum overcommit_stage {
 	EXPECT_EXEC,
 };
 
+static bool has_syncobj_timeline(int fd)
+{
+	uint64_t value;
+
+	if (drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE, &value))
+		return false;
+
+	return value;
+}
+
 static uint32_t
 addr_low(uint64_t addr)
 {
@@ -307,6 +317,138 @@ static void test_partial_unbinds(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+struct timeline_vm_bind_ctx {
+	uint64_t addr;
+	uint64_t prime_addr;
+	uint32_t vm;
+	uint32_t bo;
+	size_t bo_size;
+};
+
+static void timeline_vm_bind_ctx_init(int fd, struct timeline_vm_bind_ctx *ctx)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->addr = 0x1a0000;
+	ctx->vm = xe_vm_create(fd, 0, 0);
+	ctx->bo_size = xe_get_default_alignment(fd);
+	ctx->prime_addr = ctx->addr + ctx->bo_size;
+	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
+			       vram_if_possible(fd, 0), 0);
+}
+
+static void timeline_vm_bind_ctx_fini(int fd, struct timeline_vm_bind_ctx *ctx)
+{
+	xe_vm_unbind_sync(fd, ctx->vm, 0, ctx->addr, ctx->bo_size);
+	gem_close(fd, ctx->bo);
+	xe_vm_destroy(fd, ctx->vm);
+}
+
+/**
+ * SUBTEST: timeline-syncobj-bind-completed-point-in
+ * Description: Submit xe_vm_bind with an input dependency on an older
+ *              completed timeline point after the same syncobj has already
+ *              advanced to a later point, and verify Xe accepts the completed
+ *              dependency.
+ * Test category: functionality test
+ */
+
+static void test_timeline_syncobj_vm_bind_completed_point_in(int fd)
+{
+	struct timeline_vm_bind_ctx ctx;
+	uint64_t input_wait_point = 1;
+	uint64_t input_signal_point = 2;
+	uint32_t input_syncobj;
+	uint32_t completion_syncobj;
+	struct drm_xe_sync prime_sync;
+	struct drm_xe_sync input_sync;
+	struct drm_xe_sync completion_sync;
+
+	timeline_vm_bind_ctx_init(fd, &ctx);
+	input_syncobj = syncobj_create(fd, 0);
+
+	/* Step 1: signal point 1 on this timeline from Xe vm_bind work. */
+	prime_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = input_syncobj,
+		.timeline_value = input_wait_point,
+	};
+	xe_vm_bind_async(fd, ctx.vm, 0, ctx.bo, 0, ctx.prime_addr, ctx.bo_size,
+			 &prime_sync, 1);
+	igt_assert(syncobj_timeline_wait(fd, &input_syncobj,
+					 &input_wait_point, 1,
+					 INT64_MAX, 0, NULL));
+	xe_vm_unbind_sync(fd, ctx.vm, 0, ctx.prime_addr, ctx.bo_size);
+
+	/* Step 2: signal point 2 on the same timeline so point 1 becomes older. */
+	prime_sync.timeline_value = input_signal_point;
+	xe_vm_bind_async(fd, ctx.vm, 0, ctx.bo, 0, ctx.prime_addr, ctx.bo_size,
+			 &prime_sync, 1);
+	igt_assert(syncobj_timeline_wait(fd, &input_syncobj,
+					 &input_signal_point, 1,
+					 INT64_MAX, 0, NULL));
+	xe_vm_unbind_sync(fd, ctx.vm, 0, ctx.prime_addr, ctx.bo_size);
+
+	/* Step 3: submit the real bind with point 1 as the input dependency. */
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
+		struct drm_xe_sync bind_syncs[] = { input_sync, completion_sync };
+
+		/* Wait for timeline point 1, then signal the binary completion syncobj. */
+		xe_vm_bind_async(fd, ctx.vm, 0, ctx.bo, 0, ctx.addr, ctx.bo_size,
+				 bind_syncs, ARRAY_SIZE(bind_syncs));
+	}
+	igt_assert(syncobj_wait(fd, &completion_syncobj, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, completion_syncobj);
+	syncobj_destroy(fd, input_syncobj);
+	timeline_vm_bind_ctx_fini(fd, &ctx);
+}
+
+/**
+ * SUBTEST: timeline-syncobj-bind-out
+ * Description: Submit xe_vm_bind with a timeline syncobj output and verify Xe
+ *              signals the requested timeline point when the bind completes.
+ * Test category: functionality test
+ */
+
+static void test_timeline_syncobj_vm_bind_out(int fd)
+{
+	struct timeline_vm_bind_ctx ctx;
+	uint64_t output_point = 2;
+	uint32_t output_syncobj;
+	struct drm_xe_sync output_sync;
+
+	timeline_vm_bind_ctx_init(fd, &ctx);
+	output_syncobj = syncobj_create(fd, 0);
+	output_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = output_syncobj,
+		.timeline_value = output_point,
+	};
+	xe_vm_bind_async(fd, ctx.vm, 0, ctx.bo, 0, ctx.addr, ctx.bo_size,
+			 &output_sync, 1);
+	igt_assert(syncobj_timeline_wait(fd, &output_syncobj, &output_point, 1,
+					 INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, output_syncobj);
+	timeline_vm_bind_ctx_fini(fd, &ctx);
+}
+
 /**
  * SUBTEST: unbind-all-%d-vmas
  * Functionality: unbind
@@ -3226,6 +3368,16 @@ int igt_main()
 	igt_subtest("partial-unbinds")
 		test_partial_unbinds(fd);
 
+	igt_subtest("timeline-syncobj-bind-completed-point-in") {
+		igt_require(has_syncobj_timeline(fd));
+		test_timeline_syncobj_vm_bind_completed_point_in(fd);
+	}
+
+	igt_subtest("timeline-syncobj-bind-out") {
+		igt_require(has_syncobj_timeline(fd));
+		test_timeline_syncobj_vm_bind_out(fd);
+	}
+
 	igt_subtest("unbind-all-2-vmas")
 		unbind_all(fd, 2);
 
-- 
2.43.0

