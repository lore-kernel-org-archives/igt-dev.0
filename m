Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A3D60CFD
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A04F10E577;
	Mon, 18 Nov 2024 23:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9nttNnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08C210E573
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972959; x=1763508959;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iQ6a/LouePdc9Se4be/vtSdyyt0+f/h9tau0Yc4zn40=;
 b=T9nttNnXAr7/pIdPeQkHWOzSwqRq+AJEcPn3EtlNef1TvVwAn6GCxn7K
 kwVt0uExaWQUEW2VyV+1ZTmqKu++O4Rt6NKV1BIDnDhNTLTJD4sO/ehzT
 1ryW8D9VStAY13H8vUG2nMowmbZW9z+rdJNn5KkiZ2OT6TeaBTeCeSvk0
 lPWvKKsIwOTzdjq9Fx6aBXL8gFtIqSGTcMOtMxLZDjWfZJflyzzwbsNlv
 28hRwag/Z19PwU/3Xo+sOVc0GkHXw4um12Ao9ENiMjzgeFAN+GgXe6gTa
 6seeFqQpWYGFWoOs3NraV9RSZkid8B9Kpkxa3QrCb448kLUee3zwD/23u Q==;
X-CSE-ConnectionGUID: IEtorl74T8awIMvsgNsxwA==
X-CSE-MsgGUID: wtQi+9qEQaWucKBdALfwGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451248"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:54 -0800
X-CSE-ConnectionGUID: jMhhiiWyRiaxDGdJrMbXsw==
X-CSE-MsgGUID: AcSLZeeMRmyGFx/uKJidWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245246"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 24/29] drm/xe: Add xe_hw_fence_user_init
Date: Mon, 18 Nov 2024 15:36:15 -0800
Message-Id: <20241118233620.2373819-25-matthew.brost@intel.com>
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

Add xe_hw_fence_user_init which can create a struct xe_hw_fence from a
user input rather than internal LRC state. Used to import user fence and
export them as dma fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_fence.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 0b4f12be3692..2ea4d8bca6eb 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -263,3 +263,20 @@ void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 
 	trace_xe_hw_fence_create(hw_fence);
 }
+
+void xe_hw_fence_user_init(struct dma_fence *fence, struct xe_device *xe,
+			   struct iosys_map seqno_map, u64 seqno)
+{
+	struct xe_hw_fence *hw_fence =
+		container_of(fence, typeof(*hw_fence), dma);
+
+	hw_fence->xe = xe;
+	snprintf(hw_fence->name, sizeof(hw_fence->name), "user");
+	hw_fence->seqno_map = seqno_map;
+
+	INIT_LIST_HEAD(&hw_fence->irq_link);
+	dma_fence_init(fence, &xe_hw_fence_ops, &xe->user_fence_irq.lock,
+		       dma_fence_context_alloc(1), seqno);
+
+	trace_xe_hw_fence_create(hw_fence);
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index f13a1c4982c7..76571ef2ef36 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -30,4 +30,7 @@ void xe_hw_fence_free(struct dma_fence *fence);
 
 void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 		      struct iosys_map seqno_map);
+void xe_hw_fence_user_init(struct dma_fence *fence, struct xe_device *xe,
+			   struct iosys_map seqno_map, u64 seqno);
+
 #endif
-- 
2.34.1

