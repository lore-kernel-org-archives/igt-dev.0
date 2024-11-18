Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C35FD60CF8
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534EC10E040;
	Mon, 18 Nov 2024 23:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eaze7rUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426CC10E190
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972953; x=1763508953;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ay6A70QWOSeOFEkh6hckt8gFzr/HHR3I+sf1nUFsfbY=;
 b=Eaze7rUimPWiRfdrKLOUCbvo8QfXH1HU0tCcig5LP58ysCnA0dYVlNQW
 4noVBuA1fik2iqh6V4eddF1tX/PaAy6J0+nOE1A0tCqYhGVlDPIPmzoS+
 Q6JWvz5K0qVbezs4PafDkHohyIoEcbKJUiOP8nrVT+lPhlIVObBugmnuX
 q+O9xbXbTpizCR46GA9DlyA+IjysjVDYjgbWDgVPoXPAdKSjG/jT5XzfA
 91/528hYGubgSHY4/S1BlJJI6WRu2v8hNK2PcwlhJ5on7CEv0wrh415RT
 7SGHpyj2H2rf9IRsjALyGKvraW9PCVY3bZbj/+JrNYyOFoVzRILh5qyPH w==;
X-CSE-ConnectionGUID: ZmtqE+XlSsuolktARhNAaQ==
X-CSE-MsgGUID: McRMrewDQ+mH2DzbFQGw3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451222"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: LH+XRpWhTbGag8Tp2k0XpA==
X-CSE-MsgGUID: WhVwGGMyRnyUCvaWEb4uyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245221"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 04/29] drm/xe: Allocate doorbells for UMD exec queues
Date: Mon, 18 Nov 2024 15:35:55 -0800
Message-Id: <20241118233620.2373819-5-matthew.brost@intel.com>
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

These will be mapped to user space for UMD submission. Add
infrastructure to GuC submission backend to manage these.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   2 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   7 ++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 107 +++++++++++++++++--
 3 files changed, 106 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1158b6062a6c..7f68587d4021 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -83,6 +83,8 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
 #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+/* queue used for UMD submission */
+#define EXEC_QUEUE_FLAG_UMD_SUBMISSION		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index 4c39f01e4f52..2d53af75ed75 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -47,6 +47,13 @@ struct xe_guc_exec_queue {
 	u16 id;
 	/** @suspend_wait: wait queue used to wait on pending suspends */
 	wait_queue_head_t suspend_wait;
+	/** @db: doorbell state */
+	struct {
+		/** @db.id: doorbell ID */
+		int id;
+		/** @db.dpa: doorbell device physical address */
+		u64 dpa;
+	} db;
 	/** @suspend_pending: a suspend of the exec_queue is pending */
 	bool suspend_pending;
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 58a3f4bb3887..cc7a98c1343e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -29,6 +29,7 @@
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_db_mgr.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_id_mgr.h"
 #include "xe_guc_submit_types.h"
@@ -67,6 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
 #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
 #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
+#define EXEC_QUEUE_STATE_DB_REGISTERED		(1 << 12)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -218,6 +220,16 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
 }
 
+static bool exec_queue_doorbell_registered(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_DB_REGISTERED;
+}
+
+static void set_exec_queue_doorbell_registered(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_DB_REGISTERED, &q->guc->state);
+}
+
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -354,13 +366,6 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	return ret;
 }
 
-static void release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
-{
-	mutex_lock(&guc->submission_state.lock);
-	__release_guc_id(guc, q, q->width);
-	mutex_unlock(&guc->submission_state.lock);
-}
-
 struct exec_queue_policy {
 	u32 count;
 	struct guc_update_exec_queue_policy h2g;
@@ -1238,7 +1243,13 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
-	release_guc_id(guc, q);
+
+	mutex_lock(&guc->submission_state.lock);
+	if (q->guc->db.id >= 0)
+		xe_guc_db_mgr_release_id_locked(&guc->dbm, q->guc->db.id);
+	__release_guc_id(guc, q, q->width);
+	mutex_unlock(&guc->submission_state.lock);
+
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
 
@@ -1273,6 +1284,8 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
 	guc_exec_queue_fini_async(q);
 }
 
+static void deallocate_doorbell(struct xe_guc *guc, u16 guc_id);
+
 static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
@@ -1281,6 +1294,9 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
 	trace_xe_exec_queue_cleanup_entity(q);
 
+	if (exec_queue_doorbell_registered(q))
+		deallocate_doorbell(guc, q->guc->id);
+
 	if (exec_queue_registered(q))
 		disable_scheduling_deregister(guc, q);
 	else
@@ -1399,6 +1415,53 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 	xe_pm_runtime_put(xe);
 }
 
+static int allocate_doorbell(struct xe_guc *guc, u16 guc_id, int doorbell_id,
+			     u64 gpa)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_ALLOCATE_DOORBELL,
+		guc_id,
+		doorbell_id,
+		lower_32_bits(gpa),
+		upper_32_bits(gpa),
+		0,
+	};
+
+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+static void deallocate_doorbell(struct xe_guc *guc, u16 guc_id)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_DEALLOCATE_DOORBELL,
+		guc_id
+	};
+
+	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
+#define GUC_MMIO_DB_BAR_OFFSET SZ_4M
+
+static int create_doorbell(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	int ret;
+
+	set_exec_queue_doorbell_registered(q);
+	xe_guc_submit_reset_wait(guc);
+
+	q->guc->db.dpa = GUC_MMIO_DB_BAR_OFFSET + PAGE_SIZE * q->guc->db.id;
+	register_exec_queue(q);
+	enable_scheduling(q);
+
+	ret = allocate_doorbell(guc, q->guc->id, q->guc->db.id, q->guc->db.dpa);
+	if (ret) {
+		disable_scheduling_deregister(guc, q);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_sched_backend_ops drm_sched_ops = {
 	.run_job = guc_exec_queue_run_job,
 	.free_job = guc_exec_queue_free_job,
@@ -1415,7 +1478,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_guc_exec_queue *ge;
 	long timeout;
-	int err, i;
+	int err, i, db_id = 0;
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -1458,14 +1521,35 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	if (xe_guc_read_stopped(guc))
 		xe_sched_stop(sched);
 
+	q->guc->db.id = -1;
+	if (q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION) {
+		db_id = xe_guc_db_mgr_reserve_id_locked(&guc->dbm);
+		if (db_id < 0) {
+			err = db_id;
+			goto err_id;
+		}
+	}
+
 	mutex_unlock(&guc->submission_state.lock);
 
+	if (q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION) {
+		q->guc->db.id = db_id;
+		err = create_doorbell(guc, q);
+		if (err)
+			goto err_db;
+	}
+
 	xe_exec_queue_assign_name(q, q->guc->id);
 
 	trace_xe_exec_queue_create(q);
 
 	return 0;
 
+err_db:
+	mutex_lock(&guc->submission_state.lock);
+	xe_guc_db_mgr_release_id_locked(&guc->dbm, q->guc->db.id);
+err_id:
+	__release_guc_id(guc, q, q->width);
 err_entity:
 	mutex_unlock(&guc->submission_state.lock);
 	xe_sched_entity_fini(&ge->entity);
@@ -1699,7 +1783,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		bool ban = false;
 
-		if (job) {
+		if (exec_queue_doorbell_registered(q)) {
+			/* TODO: Ban via UMD shim too */
+			ban = true;
+		} else if (job) {
 			if ((xe_sched_job_started(job) &&
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
-- 
2.34.1

