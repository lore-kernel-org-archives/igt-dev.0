Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBE9D60D08
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC8710E57F;
	Mon, 18 Nov 2024 23:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExEscGaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D804710E040
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972954; x=1763508954;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Rg2arXeuFU6PrAFxbxFS4Q0ahHLNAQySLw0eB/7jbv0=;
 b=ExEscGaJSXaxWrDDuZ7kxRrARS2SMCHV0zZbVP4zxBq5CygDiItTe6XO
 4ByQ/KYRx2HLMM/2sOW9IlpN5XZNkwDCMcFiHrAnBpMHjNIDvrM4J7PZP
 UXUhl9rZiqSTRrLwMK0dPLsBzg8suIB9NWfXZeulmdfxEv7NjUdAQ+vIm
 ulYw1B4XB32J8uoStoLIly4esXyGScZjm4vkINTBYfwfWRnPHUErtKfpq
 AWdDe5VlHmZ49BaAkAUFH4kiBJNMLmEZcm1MIi2lS3uryBr2KW5i52RdQ
 ZXbyE59JhyI9vqYFqNSiiTszSBBQ99jXaJuxIxqNbpUAqSy6zvZ7z9Ub1 Q==;
X-CSE-ConnectionGUID: cwzrVdiFT5K4ziagiYGKnQ==
X-CSE-MsgGUID: KR+d1Y6XRf+rZzqbzp6y+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451230"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451230"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: kfHZabehRD+OocvsbrLtnA==
X-CSE-MsgGUID: m8WqZxZVTGCsNCAIExlg1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245224"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 07/29] drm/xe: Break indirect ring state out into its own
 BO
Date: Mon, 18 Nov 2024 15:35:58 -0800
Message-Id: <20241118233620.2373819-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

Start laying the ground work for UMD submission. This will allow mmaping
the indirect ring state to user space.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 79 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_lrc_types.h |  7 ++-
 2 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 758648b6a711..e3c1773191bd 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -74,10 +74,6 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
 		size = 2 * SZ_4K;
 	}
 
-	/* Add indirect ring state page */
-	if (xe_gt_has_indirect_ring_state(gt))
-		size += LRC_INDIRECT_RING_STATE_SIZE;
-
 	return size;
 }
 
@@ -694,8 +690,7 @@ static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
 
 static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
 {
-	/* Indirect ring state page is at the very end of LRC */
-	return lrc->size - LRC_INDIRECT_RING_STATE_SIZE;
+	return 0;
 }
 
 #define DECL_MAP_ADDR_HELPERS(elem) \
@@ -726,6 +721,20 @@ static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc)
 	return xe_bo_ggtt_addr(lrc->submission_ring) + __xe_lrc_##elem##_offset(lrc); \
 } \
 
+#define DECL_MAP_INDIRECT_ADDR_HELPERS(elem) \
+static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
+{ \
+	struct iosys_map map = lrc->indirect_state->vmap; \
+\
+	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));  \
+	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
+	return map; \
+} \
+static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
+{ \
+	return xe_bo_ggtt_addr(lrc->indirect_state) + __xe_lrc_##elem##_offset(lrc); \
+} \
+
 DECL_MAP_RING_ADDR_HELPERS(ring)
 DECL_MAP_ADDR_HELPERS(pphwsp)
 DECL_MAP_ADDR_HELPERS(seqno)
@@ -734,8 +743,9 @@ DECL_MAP_ADDR_HELPERS(start_seqno)
 DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
 DECL_MAP_ADDR_HELPERS(ctx_timestamp)
 DECL_MAP_ADDR_HELPERS(parallel)
-DECL_MAP_ADDR_HELPERS(indirect_ring)
+DECL_MAP_INDIRECT_ADDR_HELPERS(indirect_ring)
 
+#undef DECL_INDIRECT_MAP_ADDR_HELPERS
 #undef DECL_RING_MAP_ADDR_HELPERS
 #undef DECL_MAP_ADDR_HELPERS
 
@@ -845,25 +855,27 @@ void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val)
 	xe_map_write32(xe, &map, val);
 }
 
-static void *empty_lrc_data(struct xe_hw_engine *hwe)
+static void *empty_lrc_data(struct xe_hw_engine *hwe, bool has_default)
 {
 	struct xe_gt *gt = hwe->gt;
 	void *data;
 	u32 *regs;
 
-	data = kzalloc(xe_gt_lrc_size(gt, hwe->class), GFP_KERNEL);
+	data = kzalloc(xe_gt_lrc_size(gt, hwe->class) +
+		       LRC_INDIRECT_RING_STATE_SIZE, GFP_KERNEL);
 	if (!data)
 		return NULL;
 
 	/* 1st page: Per-Process of HW status Page */
-	regs = data + LRC_PPHWSP_SIZE;
-	set_offsets(regs, reg_offsets(gt_to_xe(gt), hwe->class), hwe);
-	set_context_control(regs, hwe);
-	set_memory_based_intr(regs, hwe);
-	reset_stop_ring(regs, hwe);
+	if (!has_default) {
+		regs = data + LRC_PPHWSP_SIZE;
+		set_offsets(regs, reg_offsets(gt_to_xe(gt), hwe->class), hwe);
+		set_context_control(regs, hwe);
+		set_memory_based_intr(regs, hwe);
+		reset_stop_ring(regs, hwe);
+	}
 	if (xe_gt_has_indirect_ring_state(gt)) {
-		regs = data + xe_gt_lrc_size(gt, hwe->class) -
-		       LRC_INDIRECT_RING_STATE_SIZE;
+		regs = data + xe_gt_lrc_size(gt, hwe->class);
 		set_offsets(regs, xe2_indirect_ring_state_offsets, hwe);
 	}
 
@@ -883,6 +895,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
 	xe_bo_unpin_map_no_vm(lrc->bo);
 	xe_bo_unpin_map_no_vm(lrc->submission_ring);
+	xe_bo_unpin_map_no_vm(lrc->indirect_state);
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
@@ -903,8 +916,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	kref_init(&lrc->refcount);
 	lrc->flags = 0;
 	lrc_size = xe_gt_lrc_size(gt, hwe->class);
-	if (xe_gt_has_indirect_ring_state(gt))
-		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
 	/*
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
@@ -929,6 +940,22 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		goto err_lrc_finish;
 	}
 
+	if (xe_gt_has_indirect_ring_state(gt)) {
+		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
+
+		lrc->indirect_state = xe_bo_create_pin_map(xe, tile, vm,
+							   LRC_INDIRECT_RING_STATE_SIZE,
+							   ttm_bo_type_kernel,
+							   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+							   XE_BO_FLAG_GGTT |
+							   XE_BO_FLAG_GGTT_INVALIDATE);
+		if (IS_ERR(lrc->indirect_state)) {
+			err = PTR_ERR(lrc->indirect_state);
+			lrc->indirect_state = NULL;
+			goto err_lrc_finish;
+		}
+	}
+
 	lrc->size = lrc_size;
 	lrc->tile = gt_to_tile(hwe->gt);
 	lrc->ring.size = ring_size;
@@ -938,8 +965,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
 			     hwe->fence_irq, hwe->name);
 
-	if (!gt->default_lrc[hwe->class]) {
-		init_data = empty_lrc_data(hwe);
+	if (!gt->default_lrc[hwe->class] || xe_gt_has_indirect_ring_state(gt)) {
+		init_data = empty_lrc_data(hwe, !!gt->default_lrc[hwe->class]);
 		if (!init_data) {
 			err = -ENOMEM;
 			goto err_lrc_finish;
@@ -951,7 +978,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * values
 	 */
 	map = __xe_lrc_pphwsp_map(lrc);
-	if (!init_data) {
+	if (gt->default_lrc[hwe->class]) {
 		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
 		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
 				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
@@ -959,9 +986,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	} else {
 		xe_map_memcpy_to(xe, &map, 0, init_data,
 				 xe_gt_lrc_size(gt, hwe->class));
-		kfree(init_data);
 	}
 
+	if (xe_gt_has_indirect_ring_state(gt)) {
+		map = __xe_lrc_indirect_ring_map(lrc);
+		xe_map_memcpy_to(xe, &map, 0, init_data +
+				 xe_gt_lrc_size(gt, hwe->class),
+				 LRC_INDIRECT_RING_STATE_SIZE);
+	}
+
+	kfree(init_data);
+
 	if (vm) {
 		xe_lrc_set_ppgtt(lrc, vm);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 3ad9ac2d644f..3be708c82313 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -27,7 +27,12 @@ struct xe_lrc {
 	 */
 	struct xe_bo *submission_ring;
 
-	/** @size: size of lrc including any indirect ring state page */
+	/**
+	 * @indirect_state: buffer object (memory) for indirect state
+	 */
+	struct xe_bo *indirect_state;
+
+	/** @size: size of lrc */
 	u32 size;
 
 	/** @tile: tile which this LRC belongs to */
-- 
2.34.1

