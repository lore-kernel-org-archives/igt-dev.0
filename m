Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243C8D60D09
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C4410E576;
	Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGVP/2Xb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B61D10E56B
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972958; x=1763508958;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JMIpXjB8x2plmka8KMhBqdpOHr0UlIYDdaEUAuZzIxQ=;
 b=aGVP/2XbVMWR6Xv0r9MDv294caIfORBaXWqoE90GYyy3E9ebkjX0bxQb
 KegQs8LQCrrUGRKk5i5ykzNs3p8+bQD7a4A3loLS8BfCiPCrspTFKtn0U
 /IGLZU7nhdcvbQ/mKVCIe2EC34+mwk2OO6U0iim1xoMTyqiEQzJaeEfin
 NuVcZD7cv4zbr6x9G3vZd3V+WscaslJyuUPBSK6E22ppcBxib2th10qrZ
 duQpTOlPCcdc75i+y4oOVgwLXuSawreIFUIfBEzhnmY06tvWGKqub6Ym3
 GQjZinAiQlOfeEjx0dfs/ZHueCEYeNnoctm/QbCs0AVVBZeKu8E/toRjX g==;
X-CSE-ConnectionGUID: PiKf60qfRWOeTcOLCPNE+g==
X-CSE-MsgGUID: HAMyZIGzSeuMHeWDcpycbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451233"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451233"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: sGObH/YKQBmt+XTjoKjbTA==
X-CSE-MsgGUID: UnLIrRTkTqWg8RmC0dA6Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245228"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 11/29] drm/xe: Don't add pinned mappings to VM bulk move
Date: Mon, 18 Nov 2024 15:36:02 -0800
Message-Id: <20241118233620.2373819-12-matthew.brost@intel.com>
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

We don't want kernel pinned resources (ring, indirect state) in the VM's
bulk move as these are unevictable.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 549866da5cd1..96dbc88b1f55 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1470,6 +1470,9 @@ __xe_bo_create_locked(struct xe_device *xe,
 {
 	struct xe_bo *bo = NULL;
 	int err;
+	bool want_bulk = vm && !xe_vm_in_fault_mode(vm) &&
+		flags & XE_BO_FLAG_USER &&
+		!(flags & (XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT));
 
 	if (vm)
 		xe_vm_assert_held(vm);
@@ -1488,9 +1491,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 	}
 
 	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
-				    vm && !xe_vm_in_fault_mode(vm) &&
-				    flags & XE_BO_FLAG_USER ?
-				    &vm->lru_bulk_move : NULL, size,
+				    want_bulk ? &vm->lru_bulk_move : NULL, size,
 				    cpu_caching, type, flags);
 	if (IS_ERR(bo))
 		return bo;
@@ -1781,9 +1782,6 @@ int xe_bo_pin(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
 
-	/* We currently don't expect user BO to be pinned */
-	xe_assert(xe, !xe_bo_is_user(bo));
-
 	/* Pinned object must be in GGTT or have pinned flag */
 	xe_assert(xe, bo->flags & (XE_BO_FLAG_PINNED |
 				   XE_BO_FLAG_GGTT));
-- 
2.34.1

