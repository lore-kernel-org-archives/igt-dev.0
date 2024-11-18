Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19968D60D00
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4542B10E571;
	Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yo6zLCbE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD0510E575
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972959; x=1763508959;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=C02NA37fN9dm3BF7bGK31pqMn+aFCtASLHdm9hCh/k4=;
 b=Yo6zLCbErwkAKeKpdeBoyX4MmIH+xPNNvOmlxEn+o9+vF8byp7FeIrRj
 2D4XTGMz/9FYLATCScOjWFaYnR1ZRA22uit7prw2hXaGbA4ROvKzhsZO/
 h/MMMH+6O0F0FnrUZ8g7JDkTIpmqzGNakEVIFv+qrXwQ4DJQm/KdFpT6y
 IcIMjjrQ7qVxgWC0IPtuD3vguttN9aqwplcCoKeNegOyDl8Z09ws0+9/C
 RcSmKv4qAPIbcfWoV/zcqNkHQG/+t7Emy0ZedBSFL8AXEz4Lv/2CVPDmD
 TC8wPj4OHq6+wJkNHKlP6iWi/iWbr/4HqzNrXo8kK9Jqp934BNiVJIleo g==;
X-CSE-ConnectionGUID: 9SVtuDoaTgylXsYbP9hNrw==
X-CSE-MsgGUID: nm8j/MSwQRi1GsuWJ+nH5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451247"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451247"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:54 -0800
X-CSE-ConnectionGUID: S85CrYfTQFaFPMxrgsjYKw==
X-CSE-MsgGUID: A9HbnN2vSxuKRAYQoEyIeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245245"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 23/29] drm/xe: Add user fence IRQ handler
Date: Mon, 18 Nov 2024 15:36:14 -0800
Message-Id: <20241118233620.2373819-24-matthew.brost@intel.com>
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

Imported user fences will not be tied to a specific queue or hardware
engine class. Therefore, a device IRQ handler is needed to signal the
associated exported DMA fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 4 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 4 +++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bbdff4308b2e..573b5f3df0c8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -39,6 +39,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_hw_engine_group.h"
+#include "xe_hw_fence.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
@@ -902,6 +903,7 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_hw_fence_irq_init(&xe->user_fence_irq);
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
 
@@ -944,6 +946,7 @@ int xe_device_probe(struct xe_device *xe)
 	xe_oa_fini(xe);
 
 err_fini_gt:
+	xe_hw_fence_irq_finish(&xe->user_fence_irq);
 	for_each_gt(gt, xe, id) {
 		if (id < last_gt)
 			xe_gt_remove(gt);
@@ -979,6 +982,7 @@ void xe_device_remove(struct xe_device *xe)
 
 	xe_heci_gsc_fini(xe);
 
+	xe_hw_fence_irq_finish(&xe->user_fence_irq);
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8592f1b02db1..3ac118c6f85e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -507,6 +507,9 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/** @user_fence_irq: User fence IRQ handler */
+	struct xe_hw_fence_irq user_fence_irq;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c4b0dc3be39c..2c9aa5343971 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -822,8 +822,10 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 	if (hwe->irq_handler)
 		hwe->irq_handler(hwe, intr_vec);
 
-	if (intr_vec & GT_RENDER_USER_INTERRUPT)
+	if (intr_vec & GT_RENDER_USER_INTERRUPT) {
+		xe_hw_fence_irq_run(&gt_to_xe(hwe->gt)->user_fence_irq);
 		xe_hw_fence_irq_run(hwe->fence_irq);
+	}
 }
 
 /**
-- 
2.34.1

