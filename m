Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630E2D60CFD
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108BB10E569;
	Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUSynGRB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C917E10E56E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972959; x=1763508959;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gg7AO0QPwabBwsHQ+3ISwQCdQZLih9895VdKNFkARtg=;
 b=KUSynGRBScakCV3wyTzrjAnFLbOAiGH9nYj2oZXDA6vTmPZmo7IbVLMz
 0zhwQsaA8tp7oFuR957qH3C89iHqEqARv3FEiKKXxTeXakhmQTO/2FP9D
 Fb0sbg3jTod7J3WYwnm516pKVvRFAXxA4ecKbD76ccpKTKGPC+KNvCD2k
 q6LC38ZIdBXudX+gsImpBO8nOgRYDa8Bb0nGxHMxaMRKEFUKTDx2JUTef
 OEoq7mdjWkfkK/0yPuRhh9FMzPOkhuPBGOt91fJEfVkdeVCeprTSK8NuO
 HI13DBSbIru93QrypQnv3vRLliBhqDEb6uPF4hIAaBmdGe6kaRBP06nC5 Q==;
X-CSE-ConnectionGUID: ZK+JfGKHQ9C7IVrvamqlyw==
X-CSE-MsgGUID: 9t18HHyfSdGN3QhyFOlkGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451240"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451240"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: ffw6yZp/QPCR3/OpE84LVA==
X-CSE-MsgGUID: NrO2rmaQSoqiFCN0jPxG1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245238"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 18/29] drm/xe: Drop EXEC_QUEUE_FLAG_UMD_SUBMISSION flag
Date: Mon, 18 Nov 2024 15:36:09 -0800
Message-Id: <20241118233620.2373819-19-matthew.brost@intel.com>
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

Use xe_exec_queue_is_usermap helper instead.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 3 +--
 drivers/gpu/drm/xe/xe_exec_queue.h       | 5 +++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 --
 drivers/gpu/drm/xe/xe_guc_submit.c       | 4 ++--
 drivers/gpu/drm/xe/xe_lrc.c              | 4 ++--
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c8d45133eb59..a22f089ccec6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -486,7 +486,7 @@ static int exec_queue_user_ext_usermap(struct xe_device *xe,
 	if (XE_IOCTL_DBG(xe, xe_vm_in_lr_mode(q->vm)))
 		return -EOPNOTSUPP;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION))
+	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_usermap(q)))
 		return -EINVAL;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
@@ -519,7 +519,6 @@ static int exec_queue_user_ext_usermap(struct xe_device *xe,
 	q->usermap->ring_addr = ext.ring_addr;
 
 	xe_pm_runtime_get_noresume(xe);
-	q->flags |= EXEC_QUEUE_FLAG_UMD_SUBMISSION;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 90c7f73eab88..a4a1dbf5b977 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -57,6 +57,11 @@ static inline bool xe_exec_queue_is_parallel(struct xe_exec_queue *q)
 	return q->width > 1;
 }
 
+static inline bool xe_exec_queue_is_usermap(struct xe_exec_queue *q)
+{
+	return !!q->usermap;
+}
+
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
 bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index b30b5ee910fa..26ce85b8d163 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -93,8 +93,6 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
-/* queue used for UMD submission */
-#define EXEC_QUEUE_FLAG_UMD_SUBMISSION		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c226c7b3245d..59d2e08797f5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1522,7 +1522,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		xe_sched_stop(sched);
 
 	q->guc->db.id = -1;
-	if (q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION) {
+	if (xe_exec_queue_is_usermap(q)) {
 		db_id = xe_guc_db_mgr_reserve_id_locked(&guc->dbm);
 		if (db_id < 0) {
 			err = db_id;
@@ -1532,7 +1532,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	mutex_unlock(&guc->submission_state.lock);
 
-	if (q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION) {
+	if (xe_exec_queue_is_usermap(q)) {
 		q->guc->db.id = db_id;
 		err = create_doorbell(guc, q);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8d5a65724c04..e8675624966d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -18,7 +18,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
-#include "xe_exec_queue_types.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_hw_fence.h"
@@ -912,7 +912,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
 	void *init_data = NULL;
 	u32 arb_enable;
 	u32 lrc_size;
-	bool user_queue = q && q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION;
+	bool user_queue = q && xe_exec_queue_is_usermap(q);;
 	enum ttm_bo_type submit_type = user_queue ? ttm_bo_type_device :
 		ttm_bo_type_kernel;
 	unsigned int submit_flags = user_queue ?
-- 
2.34.1

