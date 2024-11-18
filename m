Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831C5D60D07
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7698710E573;
	Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2GsrRNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2DF10E569
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972958; x=1763508958;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3JQ2v4LblLT+fySLDRUZtov1VGz24hLhWMPLpO5qV7M=;
 b=b2GsrRNEb9FqK9rEUQaA+96tohB+hMN1cwQbspJBRdAJcQctFe/wV+GA
 DcFIeVvm2bXZ8lE5VlK4prE0ixq1PbE1lsaK78SsQbS38ozch3CDz7egy
 UAqcOXLdBF+ur4YjkAyXi+ZMw9IOSx2OD99u1eudxl2U4nPqUYifX9WXx
 9cdmKz/Es8Zz9WTGrqjoqGmDQh1O5ICJBwEm8H++twp24GWVuAZSxflk2
 ZFPJfLBQRcuucHrIp2jy4PGItk4gA0Ib1N+KSFMD/08ve88NNcOkAvOV+
 W2gVhoYN7+RJujxyHFGtJnVlhqukU33ldtGZZSRXUBF8EWIJ5uOkX0qEL w==;
X-CSE-ConnectionGUID: zaep16+JSoWAYSwLRXQzAg==
X-CSE-MsgGUID: Kdggk1fUTbGLiyqS327dKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451232"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451232"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: boTL4phBSkCNCmli8kbrsA==
X-CSE-MsgGUID: oKh0Gx9JR6ezdiHI7axubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245226"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 09/29] FIXME: drm/xe: Add pad to ring and indirect state
Date: Mon, 18 Nov 2024 15:36:00 -0800
Message-Id: <20241118233620.2373819-10-matthew.brost@intel.com>
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

Unsure why, but without this intermittent hangs occur on GuC context
switching.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e3c1773191bd..9633e5e700f6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -929,7 +929,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
-	lrc->submission_ring = xe_bo_create_pin_map(xe, tile, vm, ring_size,
+	lrc->submission_ring = xe_bo_create_pin_map(xe, tile, vm, SZ_32K,
 						    ttm_bo_type_kernel,
 						    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						    XE_BO_FLAG_GGTT |
@@ -943,8 +943,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (xe_gt_has_indirect_ring_state(gt)) {
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
-		lrc->indirect_state = xe_bo_create_pin_map(xe, tile, vm,
-							   LRC_INDIRECT_RING_STATE_SIZE,
+		lrc->indirect_state = xe_bo_create_pin_map(xe, tile, vm, SZ_8K,
 							   ttm_bo_type_kernel,
 							   XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 							   XE_BO_FLAG_GGTT |
-- 
2.34.1

