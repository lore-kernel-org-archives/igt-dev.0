Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB912CDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 12:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADB010E691;
	Mon, 22 Jun 2026 12:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PD07cdcm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25210E67D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782130824; x=1813666824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ahJsztQ7CJc+bJoU1zfB3m8TR3BJzverNempqFl382Q=;
 b=PD07cdcmh/pOh4LlCsbHDIVOuFBXkTpnKJeeTLiw0+VnlXiFbLspUKuN
 OloBwCGO4vilhKaISjw+APgimdzxj3Noxqw6ML6hJVD1RrqzVekvoPk08
 72/Hq3EwoJxe8K0EbbYYd04nLBZLvmLYpynzL2OuAQ+XvRBqF15g/nxUC
 JxkQZiv+nBrSSh+E66TnfXy3HUqM9Apek9oUNrg/lrvLQH6foZdm9fX5V
 BmbhAZCNZdMwMcG3a4WqhDmBp9fi4Nx6LFkINQp5UPRG2+p1bPl23Y++Q
 D3vJgH8Q5rssn9KgT/AVNdzG5opvQJ7otg2s2YEq1p7hrHozXGlY0W+UR g==;
X-CSE-ConnectionGUID: rqwU0AnVRnGDNCEmtZxPyA==
X-CSE-MsgGUID: ctVAuA2OTpauycfv4dlHMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82967184"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82967184"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 05:20:24 -0700
X-CSE-ConnectionGUID: 6FFWeoTMSAWeqDiQ7yZC4g==
X-CSE-MsgGUID: i3P89gDjQZynKkw75jNN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="245063644"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 05:20:23 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH v2 2/2] tests/intel/xe_vm: Add timeline syncobj vm_bind tests
Date: Mon, 22 Jun 2026 14:20:09 +0200
Message-ID: <20260622122009.3350724-3-jan.maslak@intel.com>
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
 tests/intel/xe_vm.c | 142 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 386a0981aa..ce05b775a7 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -307,6 +307,138 @@ static void test_partial_unbinds(int fd)
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
@@ -3226,6 +3358,16 @@ int igt_main()
 	igt_subtest("partial-unbinds")
 		test_partial_unbinds(fd);
 
+	igt_subtest("timeline-syncobj-bind-completed-point-in") {
+		igt_require(igt_has_drm_cap(fd, DRM_CAP_SYNCOBJ_TIMELINE));
+		test_timeline_syncobj_vm_bind_completed_point_in(fd);
+	}
+
+	igt_subtest("timeline-syncobj-bind-out") {
+		igt_require(igt_has_drm_cap(fd, DRM_CAP_SYNCOBJ_TIMELINE));
+		test_timeline_syncobj_vm_bind_out(fd);
+	}
+
 	igt_subtest("unbind-all-2-vmas")
 		unbind_all(fd, 2);
 
-- 
2.43.0

