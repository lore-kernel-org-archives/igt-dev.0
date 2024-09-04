Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A8BCD4F4A
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 22:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E75710E1BF;
	Wed,  4 Sep 2024 22:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDK1FWSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2037910E1BF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725490675; x=1757026675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AYdkLUp84evCrRLMWpm2izpdlzam53Dez9VBPYU0tvo=;
 b=GDK1FWSnCQ3DvgU+MUoi0hOgnjB6D9kXBEaqI1xZpaTriSEkIAjW+ymE
 evx5UQZ9yz7VJgkoNKUVAD2INcuEV/Qawu5u9oWPNlADsb2dTm7oUnEj9
 erNUWvIWZiOsSqCIC4h5oZckXUbEggobJfvjdiRxzxLqgdYU29nP2XS+3
 saJ/AJdJyyCKFCPmNkVwK8hHR4RvmJnlppwNrjjipLeC776RebgwGjpnS
 BlnfmAdNplTSs/sQ+LQL2co8+6Z4fqpbJzqs3oSPoi5dFhcZholqm7asl
 kH/W03V/N1+A99XnsR7gNDYpPFwkTOOt4Kx08LaG2SKyfxekSA1ecBWXy w==;
X-CSE-ConnectionGUID: OSe2APvzQTS9OjtBkbzxFA==
X-CSE-MsgGUID: V1fYGueBTNCkI/BDG/G1Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="23980963"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="23980963"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 15:57:54 -0700
X-CSE-ConnectionGUID: EVuQBnXQQRKjPBwjZk0lNQ==
X-CSE-MsgGUID: dOY7OfAvTnimn1DoLLsxaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; d="scan'208";a="69565870"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 15:57:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Wire up parallel/virtual
 submission
Date: Wed,  4 Sep 2024 15:57:45 -0700
Message-ID: <20240904225746.2857448-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904225746.2857448-1-lucas.demarchi@intel.com>
References: <20240904225746.2857448-1-lucas.demarchi@intel.com>
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

Add the boiler plate code for parallel and virtual submission in the
spin_ctx_* and check_results(). This is based on previous code by Umesh
that got simplified before applying.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 61 ++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index d1ed0fcaa..8acb95040 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -365,7 +365,7 @@ static void basic_engine_utilization(int xe)
 
 struct spin_ctx {
 	uint32_t vm;
-	uint64_t addr;
+	uint64_t addr[XE_MAX_ENGINE_INSTANCE];
 	struct drm_xe_sync sync[2];
 	struct drm_xe_exec exec;
 	uint32_t exec_queue;
@@ -375,18 +375,29 @@ struct spin_ctx {
 	struct xe_spin_opts spin_opts;
 	bool ended;
 	uint16_t class;
+	uint16_t width;
+	uint16_t num_placements;
 };
 
 static struct spin_ctx *
-spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
+spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
+	      uint16_t width, uint16_t num_placements)
 {
 	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
 
+	igt_assert(width && num_placements &&
+		   (width == 1 || num_placements == 1));
+	igt_assert_lt(width, XE_MAX_ENGINE_INSTANCE);
+
 	ctx->class = hwe->engine_class;
+	ctx->width = width;
+	ctx->num_placements = num_placements;
 	ctx->vm = vm;
-	ctx->addr = 0x100000 + 0x100000 * hwe->engine_class;
 
-	ctx->exec.num_batch_buffer = 1;
+	for (unsigned int i = 0; i < width; i++)
+		ctx->addr[i] = 0x100000 + 0x100000 * hwe->engine_class;
+
+	ctx->exec.num_batch_buffer = width;
 	ctx->exec.num_syncs = 2;
 	ctx->exec.syncs = to_user_pointer(ctx->sync);
 
@@ -405,10 +416,10 @@ spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm)
 			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
 
-	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, 1, 1,
+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
 					     hwe, 0, &ctx->exec_queue), 0);
 
-	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr, ctx->bo_size,
+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
 			 ctx->sync, 1);
 
 	return ctx;
@@ -420,7 +431,7 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
 	if (!ctx)
 		return;
 
-	ctx->spin_opts.addr = ctx->addr;
+	ctx->spin_opts.addr = ctx->addr[0];
 	ctx->spin_opts.write_timestamp = true;
 	ctx->spin_opts.preempt = true;
 	xe_spin_init(ctx->spin, &ctx->spin_opts);
@@ -429,7 +440,12 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
 	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 
 	ctx->exec.exec_queue_id = ctx->exec_queue;
-	ctx->exec.address = ctx->addr;
+
+	if (ctx->width > 1)
+		ctx->exec.address = to_user_pointer(ctx->addr);
+	else
+		ctx->exec.address = ctx->addr[0];
+
 	xe_exec(fd, &ctx->exec);
 
 	xe_spin_wait_started(ctx->spin);
@@ -450,7 +466,7 @@ spin_sync_end(int fd, struct spin_ctx *ctx)
 	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr, ctx->bo_size, ctx->sync, 1);
+	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
 	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	ctx->ended = true;
@@ -476,7 +492,7 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
 
 static void
 check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
-	      int class, enum expected_load expected_load)
+	      int class, int width, enum expected_load expected_load)
 {
 	double percent;
 	u64 den, num;
@@ -490,6 +506,9 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 	den = s2[class].total_cycles - s1[class].total_cycles;
 	percent = (num * 100.0) / (den + 1);
 
+	/* for parallel submission scale the busyness with width */
+	percent /= width;
+
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
 	switch (expected_load) {
@@ -522,7 +541,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	vm = xe_vm_create(fd, 0, 0);
 	if (flags & TEST_BUSY) {
-		ctx = spin_ctx_init(fd, hwe, vm);
+		ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
 		spin_sync_start(fd, ctx);
 	}
 
@@ -540,14 +559,14 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 
 	expected_load = flags & TEST_BUSY ?
 	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
-	check_results(pceu1[0], pceu2[0], hwe->engine_class, expected_load);
+	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1, expected_load);
 
 	if (flags & TEST_ISOLATION) {
 		/*
 		 * Load from one client shouldn't spill on another,
 		 * so check for idle
 		 */
-		check_results(pceu1[1], pceu2[1], hwe->engine_class, EXPECTED_LOAD_IDLE);
+		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, EXPECTED_LOAD_IDLE);
 		close(new_fd);
 	}
 
@@ -565,7 +584,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 	uint32_t vm;
 
 	vm = xe_vm_create(fd, 0, 0);
-	ctx = spin_ctx_init(fd, hwe, vm);
+	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
@@ -579,7 +598,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
 
 	xe_vm_destroy(fd, vm);
 
-	check_results(pceu1, pceu2, hwe->engine_class, EXPECTED_LOAD_FULL);
+	check_results(pceu1, pceu2, hwe->engine_class, 1, EXPECTED_LOAD_FULL);
 }
 
 static void
@@ -593,7 +612,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	ctx = spin_ctx_init(fd, hwe, vm);
+	ctx = spin_ctx_init(fd, hwe, vm, 1, 1);
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
@@ -605,7 +624,7 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
 		enum expected_load expected_load = hwe->engine_class != class ?
 			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
 
-		check_results(pceu1, pceu2, class, expected_load);
+		check_results(pceu1, pceu2, class, 1, expected_load);
 	}
 
 	spin_sync_end(fd, ctx);
@@ -632,7 +651,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 		if (_class == hwe->engine_class || ctx[_class])
 			continue;
 
-		ctx[_class] = spin_ctx_init(fd, _hwe, vm);
+		ctx[_class] = spin_ctx_init(fd, _hwe, vm, 1, 1);
 		spin_sync_start(fd, ctx[_class]);
 	}
 
@@ -649,7 +668,7 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
 		if (!ctx[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, expected_load);
+		check_results(pceu1, pceu2, class, 1, expected_load);
 		spin_sync_end(fd, ctx[class]);
 		spin_ctx_destroy(fd, ctx[class]);
 	}
@@ -675,7 +694,7 @@ utilization_all_full_load(int fd)
 		if (ctx[class])
 			continue;
 
-		ctx[class] = spin_ctx_init(fd, hwe, vm);
+		ctx[class] = spin_ctx_init(fd, hwe, vm, 1, 1);
 		spin_sync_start(fd, ctx[class]);
 	}
 
@@ -689,7 +708,7 @@ utilization_all_full_load(int fd)
 		if (!ctx[class])
 			continue;
 
-		check_results(pceu1, pceu2, class, EXPECTED_LOAD_FULL);
+		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
 		spin_sync_end(fd, ctx[class]);
 		spin_ctx_destroy(fd, ctx[class]);
 	}
-- 
2.43.0

