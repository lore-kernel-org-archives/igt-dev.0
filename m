Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAE7D60D07
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB93F10E57E;
	Mon, 18 Nov 2024 23:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFPw0uhv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5E810E56B
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972958; x=1763508958;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lTAKyN0n/mTKOEi99XONgPWWRs53ycg5RdPiTuMR5+s=;
 b=VFPw0uhv+h6TD+xlaJoonlGIUTNB4CGEXzNSle2IrUxgUCEMp/h1qPmH
 1ce7jOhBdcllSJKmK/+495C7J6qpCrMdxz3hSFcUkX+Z63mNc62oGMXca
 D7JQHiBnFNrHgjddpHvT9K/pQ7qEM/YV92juzSLwj2TIxCs6oVd02uCXS
 xxBpZECm1dlhpHkTeDgVL/MKXGRneYbj6E/uCeI2Be8tPrl4D+v+OqCCs
 IOqCEcC5tA9NpSKOZl8zt/BCBTSxWe+/H/Sw6JBP2d52Yd64aH/+nE3kq
 Z7ln3AYk2trVfaO+DNqPbn/QJ3j6EHCo03YTzDYik4GRLPL5UCWZZczDO w==;
X-CSE-ConnectionGUID: Z4QsnjJERUWrJ5rx7fnAMw==
X-CSE-MsgGUID: 8OJ5W4OFRIanZ3mCqN6H7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451237"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451237"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: Tsx1zlSYQ9ek9R4XcLj2tg==
X-CSE-MsgGUID: MWntfpp2Q6CqqyhlxxuTyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245233"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 15/29] drm/xe: Add support for mmapping submission ring
 and indirect ring state to user space
Date: Mon, 18 Nov 2024 15:36:06 -0800
Message-Id: <20241118233620.2373819-16-matthew.brost@intel.com>
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

The ring and indirect ring state need to mapped to user space for UMD
direction submission, add support for this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         |  3 ---
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c        | 29 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_lrc.h        |  4 ++--
 5 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index f948262e607f..a87871f1cb95 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1311,9 +1311,6 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	size_t aligned_size;
 	int err;
 
-	/* Only kernel objects should set GT */
-	xe_assert(xe, !tile || type == ttm_bo_type_kernel);
-
 	if (XE_WARN_ON(!size)) {
 		xe_bo_free(bo);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index f402988b4fc0..aef5b130e7f8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -119,7 +119,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q, q->hwe, q->vm, SZ_16K);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a8c416a48812..93f76280d453 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -265,7 +265,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	port->lrc = xe_lrc_create(NULL, hwe, NULL, SZ_16K);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9633e5e700f6..8a79470b52ae 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -901,8 +901,9 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
-static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
+		       struct xe_hw_engine *hwe, struct xe_vm *vm,
+		       u32 ring_size)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -911,6 +912,11 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	void *init_data = NULL;
 	u32 arb_enable;
 	u32 lrc_size;
+	bool user_queue = q && q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION;
+	enum ttm_bo_type submit_type = user_queue ? ttm_bo_type_device :
+		ttm_bo_type_kernel;
+	unsigned int submit_flags = user_queue ?
+		XE_BO_FLAG_USER : 0;
 	int err;
 
 	kref_init(&lrc->refcount);
@@ -930,7 +936,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		return PTR_ERR(lrc->bo);
 
 	lrc->submission_ring = xe_bo_create_pin_map(xe, tile, vm, SZ_32K,
-						    ttm_bo_type_kernel,
+						    submit_type,
+						    submit_flags |
 						    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						    XE_BO_FLAG_GGTT |
 						    XE_BO_FLAG_GGTT_INVALIDATE);
@@ -944,7 +951,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
 		lrc->indirect_state = xe_bo_create_pin_map(xe, tile, vm, SZ_8K,
-							   ttm_bo_type_kernel,
+							   submit_type,
+							   submit_flags |
 							   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 							   XE_BO_FLAG_GGTT |
 							   XE_BO_FLAG_GGTT_INVALIDATE);
@@ -955,6 +963,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		}
 	}
 
+	/* Wait for clear */
+	if (user_queue)
+		dma_resv_wait_timeout(xe_vm_resv(vm),
+				      DMA_RESV_USAGE_KERNEL,
+				      false, MAX_SCHEDULE_TIMEOUT);
+
 	lrc->size = lrc_size;
 	lrc->tile = gt_to_tile(hwe->gt);
 	lrc->ring.size = ring_size;
@@ -1060,6 +1074,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 /**
  * xe_lrc_create - Create a LRC
+ * @q: Execution queue
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @ring_size: LRC ring size
@@ -1069,8 +1084,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * Return pointer to created LRC upon success and an error pointer
  * upon failure.
  */
-struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
+			     struct xe_vm *vm, u32 ring_size)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1079,7 +1094,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, q, hwe, vm, ring_size);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index b459dcab8787..23d71283c79d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -41,8 +41,8 @@ struct xe_lrc_snapshot {
 
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
-struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
+			     struct xe_vm *vm, u32 ring_size);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.34.1

