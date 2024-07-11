Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4E7C3DA42
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 01:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0028C10E157;
	Thu, 11 Jul 2024 01:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aM4MwYDc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FB210E157
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 01:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720659886; x=1752195886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/50XSJkEPMfop4UpPMGXZpaGLNzle5v7HBm6CGm04EA=;
 b=aM4MwYDcnkIuVjrPrM59YWuGSIsnt5vJi6aS1Ha+ce2C8zbbm+7yQsRY
 69y4d53hPzOmNQf5GMTem249Y8TYpQSmpwO0F4h/VyLF7dcWXvCdbya8I
 4eHZ2xWgzpcT+vvguoSRDR/BJoYTwkoeAGY3KS8fVt2JXCcLiHG3ci3vf
 klPibR9uQlWE4frhfq+2Ur6gGV1cWzpFhG8a0gcC+QJRUNeWGPofKGmC0
 fCt9sX7p5S3rIKTK7hjb9Ub1IPIgkuDuBqYtcrrlb6lVe7x6f56EfboRm
 lJ6PD7jQGZRpWg9xFhtSrwMlT4v+hAMi2wuTmt7eTgdZoGYceUtblxzBG g==;
X-CSE-ConnectionGUID: DAAtCJ4ET2e+jtPhk9xDqw==
X-CSE-MsgGUID: JVzSFnTVQbCWHlFWaRJYVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17963755"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="17963755"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 18:04:46 -0700
X-CSE-ConnectionGUID: Bme3O/UISyiPoMkwcEdZ0Q==
X-CSE-MsgGUID: UM+h7L/NQ+iL+q5MmbMxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="53336670"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 18:04:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: fei.yang@intel.com
Subject: [PATCH] Me: Add exec queue persistance back in as default behavior
Date: Wed, 10 Jul 2024 18:05:29 -0700
Message-Id: <20240711010529.1066920-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

---
 drivers/gpu/drm/xe/xe_device.c           | 40 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h           |  4 +++
 drivers/gpu/drm/xe/xe_device_types.h     |  8 +++++
 drivers/gpu/drm/xe/xe_exec_queue.c       | 15 +++++++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 11 +++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  2 ++
 6 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 64aea962afd5..b5e999878a1f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -93,6 +93,9 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
+static void device_kill_persistent_exec_queues(struct xe_device *xe,
+					       struct xe_file *xef);
+
 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -112,6 +115,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_exec_queue_put(q);
 	}
 	xa_destroy(&xef->exec_queue.xa);
+
+	device_kill_persistent_exec_queues(xe, xef);
+
 	mutex_destroy(&xef->exec_queue.lock);
 	mutex_lock(&xef->vm.lock);
 	xa_for_each(&xef->vm.xa, idx, vm)
@@ -301,6 +307,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 			xa_erase(&xe->usm.asid_to_vm, asid);
 	}
 
+	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
+	INIT_LIST_HEAD(&xe->persistent_engines.list);
+
 	spin_lock_init(&xe->pinned.lock);
 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
 	INIT_LIST_HEAD(&xe->pinned.external_vram);
@@ -747,6 +756,37 @@ void xe_device_shutdown(struct xe_device *xe)
 {
 }
 
+void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q)
+{
+	mutex_lock(&xe->persistent_engines.lock);
+	list_add_tail(&q->persistent.link, &xe->persistent_engines.list);
+	mutex_unlock(&xe->persistent_engines.lock);
+}
+
+void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
+					     struct xe_exec_queue *q)
+{
+	mutex_lock(&xe->persistent_engines.lock);
+	if (!list_empty(&q->persistent.link))
+		list_del(&q->persistent.link);
+	mutex_unlock(&xe->persistent_engines.lock);
+}
+
+static void device_kill_persistent_exec_queues(struct xe_device *xe,
+					       struct xe_file *xef)
+{
+	struct xe_exec_queue *q, *next;
+
+	mutex_lock(&xe->persistent_engines.lock);
+	list_for_each_entry_safe(q, next, &xe->persistent_engines.list,
+				 persistent.link)
+		if (q->persistent.xef == xef) {
+			xe_exec_queue_kill(q);
+			list_del_init(&q->persistent.link);
+		}
+	mutex_unlock(&xe->persistent_engines.lock);
+}
+
 /**
  * xe_device_wmb() - Device specific write memory barrier
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0a2a3e7fd402..2ada93ebcb01 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -32,6 +32,10 @@ int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
+void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q);
+void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
+					     struct xe_exec_queue *q);
+
 void xe_device_wmb(struct xe_device *xe);
 
 static inline struct xe_file *to_xe_file(const struct drm_file *file)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f0cf9020e463..a32cfa207fd3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -366,6 +366,14 @@ struct xe_device {
 		struct mutex lock;
 	} usm;
 
+	/** @persistent_engines: engines that are closed but still running */
+	struct {
+		/** @persistent_engines.lock: protects persistent engines */
+		struct mutex lock;
+		/** @persistent_engines.list: list of persistent engines */
+		struct list_head list;
+	} persistent_engines;
+
 	/** @pinned: pinned BO state */
 	struct {
 		/** @pinned.lock: protected pinned BO list state */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 3336a01a1006..52ea4d73df34 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -67,6 +67,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
+	INIT_LIST_HEAD(&q->persistent.link);
 	INIT_LIST_HEAD(&q->lr.link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
 
@@ -574,7 +575,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			/* The migration vm doesn't hold rpm ref */
 			xe_pm_runtime_get_noresume(xe);
 
-			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
+			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
+				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
 
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
 			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
@@ -625,7 +627,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
-					 args->width, hwe, 0,
+					 args->width, hwe,
+					 xe_vm_in_lr_mode(vm) ? 0 :
+					 EXEC_QUEUE_FLAG_PERSISTENT,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
@@ -642,6 +646,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
+	q->persistent.xef = xef;
+
 	mutex_lock(&xef->exec_queue.lock);
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	mutex_unlock(&xef->exec_queue.lock);
@@ -818,7 +824,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	xe_exec_queue_kill(q);
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERSISTENT))
+		xe_exec_queue_kill(q);
+	else
+		xe_device_add_persistent_exec_queues(xe, q);
 
 	trace_xe_exec_queue_close(q);
 	xe_exec_queue_put(q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ded9f9396429..d93bc8a0ba1e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -80,6 +80,7 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+#define EXEC_QUEUE_FLAG_PERSISTENT		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
@@ -101,6 +102,16 @@ struct xe_exec_queue {
 		struct xe_guc_exec_queue *guc;
 	};
 
+	/**
+	 * @persistent: persistent exec queue state
+	 */
+	struct {
+		/** @persistent.xef: file which this exec queue belongs to */
+		struct xe_file *xef;
+		/** @persisiten.link: link in list of persistent exec queues */
+		struct list_head link;
+	} persistent;
+
 	/** @sched_props: scheduling properties */
 	struct {
 		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6392381e8e69..0b99f0e1e495 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1239,6 +1239,8 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
+	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
+		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
 	release_guc_id(guc, q);
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
-- 
2.34.1

