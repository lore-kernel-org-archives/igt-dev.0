Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204DF6E8C6
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 23:04:06 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  9 Nov 2021 14:59:28 -0800
Message-Id: <20211109225928.23711-8-matthew.brost@intel.com>
In-Reply-To: <20211109225928.23711-1-matthew.brost@intel.com>
References: <20211109225928.23711-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/x-diff; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 7/7] REVIEW: Full tree diff against internal
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Auto-generated diff between internal..ct_backport
---
 .../drm/i915/gt/uc/abi/guc_communication_ctb_abi.h |   9 +-
 .../i915/gt/uc/abi/guc_communication_mmio_abi.h    |   8 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h    |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c             |  41 ++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h             |   6 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          | 167 ++++++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h          |   8 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |   8 +-
 drivers/gpu/drm/i915/i915_params.c                 |   2 +-
 9 files changed, 135 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
index 92660726c094..99e1fad5ca20 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
@@ -14,7 +14,7 @@
 /**
  * DOC: CT Buffer
  *
- * TBD
+ * Circular buffer used to send `CTB Message`_
  */
 
 /**
@@ -37,8 +37,6 @@
  *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too large)     |
  *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated message)      |
  *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail modified)      |
- *  |   |       |   - _`GUC_CTB_STATUS_NO_BACKCHANNEL` = 8                     |
- *  |   |       |   - _`GUC_CTB_STATUS_MALFORMED_MSG` = 16                     |
  *  +---+-------+--------------------------------------------------------------+
  *  |...|       | RESERVED = MBZ                                               |
  *  +---+-------+--------------------------------------------------------------+
@@ -54,8 +52,6 @@ struct guc_ct_buffer_desc {
 #define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
 #define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
 #define GUC_CTB_STATUS_MISMATCH				(1 << 2)
-#define GUC_CTB_STATUS_NO_BACKCHANNEL			(1 << 3)
-#define GUC_CTB_STATUS_MALFORMED_MSG			(1 << 4)
 	u32 reserved[13];
 } __packed;
 static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
@@ -83,7 +79,8 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
  *  +---+-------+--------------------------------------------------------------+
  */
 
-#define GUC_CTB_MSG_MIN_LEN			1u
+#define GUC_CTB_HDR_LEN				1u
+#define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
 #define GUC_CTB_MSG_MAX_LEN			256u
 #define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
 #define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
index 3f9039e3ef9d..bbf1ddb77434 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
@@ -18,17 +18,17 @@
  * registers, is directly written into those scratch registers.
  *
  * For Gen9+, there are 16 software scratch registers 0xC180-0xC1B8,
- * but no H2G command takes more than 8 parameters and the GuC firmware
- * itself uses an 8-element array to store the H2G message.
+ * but no H2G command takes more than 4 parameters and the GuC firmware
+ * itself uses an 4-element array to store the H2G message.
  *
  * For Gen11+, there are additional 4 registers 0x190240-0x19024C, which
- * are, regardless on lower count, preffered over legacy ones.
+ * are, regardless on lower count, preferred over legacy ones.
  *
  * The MMIO based communication is mainly used during driver initialization
  * phase to setup the `CTB based communication`_ that will be used afterwards.
  */
 
-#define GUC_MAX_MMIO_MSG_LEN		8
+#define GUC_MAX_MMIO_MSG_LEN		4
 
 /**
  * DOC: MMIO HXG Message
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index b1c79a2b814d..8085fb181274 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
@@ -7,6 +7,7 @@
 #define _ABI_GUC_ERRORS_ABI_H
 
 enum intel_guc_response_status {
+	INTEL_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
 	INTEL_GUC_RESPONSE_NOT_SUPPORTED = 0x20,
 	INTEL_GUC_RESPONSE_NO_ATTRIBUTE_TABLE = 0x201,
 	INTEL_GUC_RESPONSE_NO_DECRYPTION_KEY = 0x202,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 7e63463fe83a..e2df29fa0099 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -106,14 +106,12 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
+	guc->interrupts.enabled = true;
 
 	spin_lock_irq(gt->irq_lock);
-	if (!guc->interrupts.enabled) {
-		WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
-			     gt->pm_guc_events);
-		guc->interrupts.enabled = true;
-		gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
-	}
+	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
+		     gt->pm_guc_events);
+	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 	spin_unlock_irq(gt->irq_lock);
 }
 
@@ -122,9 +120,9 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
+	guc->interrupts.enabled = false;
 
 	spin_lock_irq(gt->irq_lock);
-	guc->interrupts.enabled = false;
 
 	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
 
@@ -172,14 +170,13 @@ static void gen11_enable_fake_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
+	guc->interrupts.enabled = true;
+
 	spin_lock_irq(gt->irq_lock);
-	if (!guc->interrupts.enabled) {
-		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
+	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
 
-		/* FIXME: Connect timer to GT PM */
-		fake_int_timer_start(gt);
-		guc->interrupts.enabled = true;
-	}
+	/* FIXME: Connect timer to GT PM */
+	fake_int_timer_start(gt);
 	spin_unlock_irq(gt->irq_lock);
 }
 
@@ -187,11 +184,9 @@ static void gen11_disable_fake_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
-	if (!guc->interrupts.enabled)
-		return;
+	guc->interrupts.enabled = false;
 
 	spin_lock_irq(gt->irq_lock);
-	guc->interrupts.enabled = false;
 
 	fake_int_timer_stop(gt);
 
@@ -203,8 +198,6 @@ static void gen11_disable_fake_interrupts(struct intel_guc *guc)
 
 void intel_guc_init_fake_interrupts(struct intel_guc *guc)
 {
-	GEM_BUG_ON(guc->interrupts.enabled);
-
 	guc->interrupts.enable = gen11_enable_fake_interrupts;
 	guc->interrupts.disable = gen11_disable_fake_interrupts;
 }
@@ -213,11 +206,10 @@ static void gen11_enable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
+	guc->interrupts.enabled = true;
+
 	spin_lock_irq(gt->irq_lock);
-	if (!guc->interrupts.enabled) {
-		__gen11_reset_guc_interrupts(gt);
-		guc->interrupts.enabled = true;
-	}
+	__gen11_reset_guc_interrupts(gt);
 	spin_unlock_irq(gt->irq_lock);
 }
 
@@ -225,12 +217,7 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
-	if (!guc->interrupts.enabled)
-		return;
-
-	spin_lock_irq(gt->irq_lock);
 	guc->interrupts.enabled = false;
-	spin_unlock_irq(gt->irq_lock);
 	intel_synchronize_irq(gt->i915);
 
 	gen11_reset_guc_interrupts(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 3e7fe30861b7..590365152e57 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -155,12 +155,6 @@ inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
 	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0, 0);
 }
 
-#define INTEL_GUC_SEND_NB		BIT(31)
-#define INTEL_GUC_SEND_G2H_DW_SHIFT	0
-#define INTEL_GUC_SEND_G2H_DW_MASK	(0xff << INTEL_GUC_SEND_G2H_DW_SHIFT)
-#define MAKE_SEND_FLAGS(len) \
-	({GEM_BUG_ON(!FIELD_FIT(INTEL_GUC_SEND_G2H_DW_MASK, len)); \
-	(FIELD_PREP(INTEL_GUC_SEND_G2H_DW_MASK, len) | INTEL_GUC_SEND_NB);})
 static
 inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len,
 			     u32 g2h_len_dw)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 8d1549c63600..494c66df8359 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -11,6 +11,7 @@
 #include "intel_guc_ct.h"
 #include "intel_pagefault.h"
 #include "gt/intel_gt.h"
+#include "gem/i915_gem_lmem.h"
 #include "gt/iov/intel_iov_event.h"
 #include "gt/iov/intel_iov_fault.h"
 #include "gt/iov/intel_iov_relay.h"
@@ -82,7 +83,7 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
  * Size of each `CT Buffer`_ must be multiple of 4K.
  * We don't expect too many messages in flight at any time, unless we are
  * using the GuC submission. In that case each request requires a minimum
- * 16 bytes which gives us a maximum 256 queue'd requests. Hopefully this
+ * 2 dwords which gives us a maximum 256 queue'd requests. Hopefully this
  * enough space to avoid backpressure on the driver. We increase the size
  * of the receive buffer (relative to the send) to ensure a G2H response
  * CTB has a landing spot.
@@ -92,8 +93,6 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
 #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
 #define G2H_ROOM_BUFFER_SIZE	(PAGE_SIZE)
 
-#define MAX_US_STALL_CTB	1000000
-
 struct ct_request {
 	struct list_head link;
 	u32 fence;
@@ -112,7 +111,7 @@ enum { CTB_SEND = 0, CTB_RECV = 1 };
 
 enum { CTB_OWNER_HOST = 0 };
 
-static void ct_receive_tasklet_func(unsigned long data);
+static void ct_receive_tasklet_func(struct tasklet_struct *t);
 static void ct_incoming_request_worker_func(struct work_struct *w);
 
 /**
@@ -128,7 +127,7 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
 	INIT_LIST_HEAD(&ct->requests.incoming);
 	INIT_WORK(&ct->dead_ct_worker, ct_dead_ct_worker_func);
 	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
-	tasklet_init(&ct->receive_tasklet, ct_receive_tasklet_func, (unsigned long)ct);
+	tasklet_setup(&ct->receive_tasklet, ct_receive_tasklet_func);
 	init_waitqueue_head(&ct->wq);
 }
 
@@ -354,7 +353,6 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 	if (unlikely(err))
 		goto err_out;
 
-	ct->requests.last_fence = 1;
 	ct->enabled = true;
 	ct->stall_time = KTIME_MAX;
 	ct->dead_ct_reported = false;
@@ -394,14 +392,24 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
 	return ++ct->requests.last_fence;
 }
 
-static void write_barrier(struct intel_guc_ct *ct) {
+static void write_barrier(struct intel_guc_ct *ct)
+{
 	struct intel_guc *guc = ct_to_guc(ct);
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
 		GEM_BUG_ON(guc->send_regs.fw_domains);
+		/*
+		 * This register is used by the i915 and GuC for MMIO based
+		 * communication. Once we are in this code CTBs are the only
+		 * method the i915 uses to communicate with the GuC so it is
+		 * safe to write to this register (a value of 0 is NOP for MMIO
+		 * communication). If we ever start mixing CTBs and MMIOs a new
+		 * register will have to be chosen.
+		 */
 		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
 	} else {
+		/* wmb() sufficient for a barrier if in smem */
 		wmb();
 	}
 }
@@ -417,21 +425,27 @@ static int ct_write(struct intel_guc_ct *ct,
 	u32 size = ctb->size;
 	u32 header;
 	u32 hxg;
+	u32 type;
 	u32 *cmds = ctb->cmds;
 	unsigned int i;
 
 	if (!I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected)) {
-		if (unlikely(ctb->broken))
-			return -EIO;
-
 		if (unlikely(desc->status))
 			goto corrupted;
 	}
 
+	GEM_BUG_ON(tail > size);
+
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
-	if (unlikely((desc->tail | desc->head) >= size)) {
-		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-			 desc->head, desc->tail, size);
+	if (unlikely(tail != READ_ONCE(desc->tail))) {
+		CT_ERROR(ct, "Tail was modified %u != %u\n",
+			 desc->tail, tail);
+		desc->status |= GUC_CTB_STATUS_MISMATCH;
+		goto corrupted;
+	}
+	if (unlikely(READ_ONCE(desc->head) >= size)) {
+		CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
+			 desc->head, size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
 	}
@@ -439,7 +453,8 @@ static int ct_write(struct intel_guc_ct *ct,
 
 	/*
 	 * dw0: CT header (including fence)
-	 * dw1: HXG header
+	 * dw1: HXG header (including action code)
+	 * dw2+: action data
 	 */
 	header = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
 		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
@@ -454,13 +469,11 @@ static int ct_write(struct intel_guc_ct *ct,
 	}
 #endif
 
-	hxg = (flags & INTEL_GUC_SEND_NB) ?
-		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
-		 FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
-			    GUC_HXG_EVENT_MSG_0_DATA0, action[0])) :
-		(FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
-		 FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
-			    GUC_HXG_REQUEST_MSG_0_DATA0, action[0]));
+	type = (flags & INTEL_GUC_CT_SEND_NB) ? GUC_HXG_TYPE_EVENT :
+		GUC_HXG_TYPE_REQUEST;
+	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |
+		FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
+			   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
 
 	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
 		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
@@ -479,14 +492,17 @@ static int ct_write(struct intel_guc_ct *ct,
 
 	/*
 	 * make sure H2G buffer update and LRC tail update (if this triggering a
-	 * submission) are visable before updating the descriptor tail
+	 * submission) are visible before updating the descriptor tail
 	 */
 	write_barrier(ct);
 
-	/* now update descriptor */
+	/* update local copies */
 	ctb->tail = tail;
+	GEM_BUG_ON(atomic_read(&ctb->space) < len + GUC_CTB_HDR_LEN);
+	atomic_sub(len + GUC_CTB_HDR_LEN, &ctb->space);
+
+	/* now update descriptor */
 	WRITE_ONCE(desc->tail, tail);
-	atomic_sub(len + 1, &ctb->space);
 
 	return 0;
 
@@ -501,7 +517,7 @@ static int ct_write(struct intel_guc_ct *ct,
 		queue_work(system_unbound_wq, &ct->dead_ct_worker);
 	}
 	ctb->broken = true;
-	return -EIO;
+	return -EPIPE;
 }
 
 /**
@@ -522,25 +538,24 @@ static int ct_write(struct intel_guc_ct *ct,
 static int wait_for_ct_request_update(struct intel_guc_ct *ct,
 				      struct ct_request *req, u32 *status)
 {
-	long timeout;
 	int err;
 
 	/*
 	 * Fast commands should complete in less than 10us, so sample quickly
 	 * up to that length of time, then switch to a slower sleep-wait loop.
-	 * No GuC command should ever take longer than 10ms.
-	 *
-	 * However, there might be other CT requests in flight before this one,
-	 * so use @CONFIG_DRM_I915_HEARTBEAT_INTERVAL as backup timeout value.
+	 * No GuC command should ever take longer than 10ms but many GuC
+	 * commands can be inflight at time, so use a 1s timeout on the slower
+	 * sleep-wait loop.
 	 */
-	timeout = max(10, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
-
+#define GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS 10
+#define GUC_CTB_RESPONSE_TIMEOUT_LONG_MS 1000
+#define done \
+	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
+	 GUC_HXG_ORIGIN_GUC)
 	intel_boost_fake_int_timer(ct_to_gt(ct), true);
-
-#define done (FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == GUC_HXG_ORIGIN_GUC)
-	err = wait_for_us(done, 10);
+	err = wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
 	if (err)
-		err = wait_for(done, timeout * PRESI_GET_MULTIPLIER(1));
+		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS * PRESI_GET_MULTIPLIER(1));
 #undef done
 
 	if (unlikely(err))
@@ -552,25 +567,32 @@ static int wait_for_ct_request_update(struct intel_guc_ct *ct,
 	return err;
 }
 
-#define PRESI_CTB_TIMEOUT \
-	(((s64)MAX_US_STALL_CTB) * PRESI_GET_MULTIPLIER(MAX_US_STALL_CTB))
+#define GUC_CTB_TIMEOUT_MS	1500
 static inline bool ct_deadlocked(struct intel_guc_ct *ct)
 {
-	bool ret = ktime_us_delta(ktime_get(), ct->stall_time) >
-		PRESI_CTB_TIMEOUT;
+	long timeout = GUC_CTB_TIMEOUT_MS * PRESI_GET_MULTIPLIER(1);
+	bool ret = ktime_ms_delta(ktime_get(), ct->stall_time) > timeout;
 
 	if (unlikely(ret)) {
+		struct guc_ct_buffer_desc *send = ct->ctbs.send.desc;
+		struct guc_ct_buffer_desc *recv = ct->ctbs.send.desc;
+
 		/*
 		 * CI doesn't like error messages, demote to debug if deadlock was
 		 * intentionally hit.
 		 */
-		if (I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected))
-			CT_DEBUG(ct, "CT deadlocked\n");
-		else {
-			CT_ERROR(ct, "CT deadlocked\n");
+		if (I915_SELFTEST_ONLY(ct_to_guc(ct)->deadlock_expected)) {
+			CT_DEBUG(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+				 ktime_ms_delta(ktime_get(), ct->stall_time),
+				 send->status, recv->status);
+		} else {
+			CT_ERROR(ct, "Communication stalled for %lld ms, desc status=%#x,%#x\n",
+				 ktime_ms_delta(ktime_get(), ct->stall_time),
+				 send->status, recv->status);
 			ct->dead_ct_reason |= 1 << CT_DEAD_DEADLOCK;
 			queue_work(system_unbound_wq, &ct->dead_ct_worker);
 		}
+		ct->ctbs.send.broken = true;
 	}
 
 	return ret;
@@ -600,17 +622,18 @@ static inline void g2h_reserve_space(struct intel_guc_ct *ct, u32 g2h_len_dw)
 static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
 {
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
+	struct guc_ct_buffer_desc *desc = ctb->desc;
 	u32 head;
 	u32 space;
 
 	if (atomic_read(&ctb->space) >= len_dw)
 		return true;
 
-	head = READ_ONCE(ctb->desc->head);
+	head = READ_ONCE(desc->head);
 	if (unlikely(head > ctb->size)) {
-		CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u size=%u\n",
-			  ctb->desc->head, ctb->desc->tail, ctb->size);
-		ctb->desc->status |= GUC_CTB_STATUS_OVERFLOW;
+		CT_ERROR(ct, "Invalid head offset %u >= %u)\n",
+			 head, ctb->size);
+		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		ctb->broken = true;
 		ct->dead_ct_reason |= 1 << CT_DEAD_H2G_HAS_ROOM;
 		queue_work(system_unbound_wq, &ct->dead_ct_worker);
@@ -632,7 +655,7 @@ static int has_room_nb(struct intel_guc_ct *ct, u32 h2g_dw, u32 g2h_dw)
 			ct->stall_time = ktime_get();
 
 		if (unlikely(ct_deadlocked(ct)))
-			return -EIO;
+			return -EPIPE;
 		else
 			return -EBUSY;
 	}
@@ -641,7 +664,7 @@ static int has_room_nb(struct intel_guc_ct *ct, u32 h2g_dw, u32 g2h_dw)
 	return 0;
 }
 
-#define G2H_LEN_DW(flags)	FIELD_GET(INTEL_GUC_SEND_G2H_DW_MASK, flags)
+#define G2H_LEN_DW(flags)	FIELD_GET(INTEL_GUC_CT_SEND_G2H_DW_MASK, flags)
 static int ct_send_nb(struct intel_guc_ct *ct,
 		      const u32 *action,
 		      u32 len,
@@ -655,7 +678,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
 
 	spin_lock_irqsave(&ctb->lock, spin_flags);
 
-	ret = has_room_nb(ct, len + 1, g2h_len_dw);
+	ret = has_room_nb(ct, len + GUC_CTB_HDR_LEN, g2h_len_dw);
 	if (unlikely(ret))
 		goto out;
 
@@ -683,6 +706,7 @@ static int ct_send(struct intel_guc_ct *ct,
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
 	struct ct_request request;
 	unsigned long flags;
+	unsigned int sleep_period_ms = 1;
 	bool send_again;
 	u32 fence;
 	int err;
@@ -703,15 +727,18 @@ static int ct_send(struct intel_guc_ct *ct,
 	 */
 retry:
 	spin_lock_irqsave(&ctb->lock, flags);
-	if (unlikely(!h2g_has_room(ct, len + 1))) {
+	if (unlikely(!h2g_has_room(ct, len + GUC_CTB_HDR_LEN))) {
 		if (ct->stall_time == KTIME_MAX)
 			ct->stall_time = ktime_get();
 		spin_unlock_irqrestore(&ctb->lock, flags);
 
 		if (unlikely(ct_deadlocked(ct)))
-			return -EIO;
+			return -EPIPE;
+
+		if (msleep_interruptible(sleep_period_ms))
+			return -EINTR;
+		sleep_period_ms = sleep_period_ms << 1;
 
-		cond_resched();
 		goto retry;
 	}
 
@@ -800,7 +827,10 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		return -ENODEV;
 	}
 
-	if (flags & INTEL_GUC_SEND_NB)
+	if (unlikely(ct->ctbs.send.broken))
+		return -EPIPE;
+
+	if (flags & INTEL_GUC_CT_SEND_NB)
 		return ct_send_nb(ct, action, len, flags);
 
 	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
@@ -840,7 +870,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
 	struct guc_ct_buffer_desc *desc = ctb->desc;
 	u32 head = ctb->head;
-	u32 tail = desc->tail;
+	u32 tail = READ_ONCE(desc->tail);
 	u32 size = ctb->size;
 	u32 *cmds = ctb->cmds;
 	s32 available;
@@ -854,21 +884,22 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	if (unlikely(desc->status))
 		goto corrupted;
 
+	GEM_BUG_ON(head > size);
+
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
-	if (unlikely((desc->tail | desc->head) >= size)) {
-		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-			 head, tail, size);
-		desc->status |= GUC_CTB_STATUS_OVERFLOW;
+	if (unlikely(head != READ_ONCE(desc->head))) {
+		CT_ERROR(ct, "Head was modified %u != %u\n",
+			 desc->head, head);
+		desc->status |= GUC_CTB_STATUS_MISMATCH;
 		goto corrupted;
 	}
-#else
-	if (unlikely((tail | ctb->head) >= size)) {
-		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
-			 head, tail, size);
+#endif
+	if (unlikely(tail >= size)) {
+		CT_ERROR(ct, "Invalid tail offset %u >= %u)\n",
+			 tail, size);
 		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
 	}
-#endif
 
 	/* tail == head condition indicates empty */
 	available = tail - head;
@@ -918,7 +949,9 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	}
 	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
 
+	/* update local copies */
 	ctb->head = head;
+
 	/* now update descriptor */
 	WRITE_ONCE(desc->head, head);
 
@@ -1280,9 +1313,9 @@ static void ct_try_receive_message(struct intel_guc_ct *ct)
 		tasklet_hi_schedule(&ct->receive_tasklet);
 }
 
-static void ct_receive_tasklet_func(unsigned long data)
+static void ct_receive_tasklet_func(struct tasklet_struct *t)
 {
-	struct intel_guc_ct *ct = (struct intel_guc_ct *)data;
+	struct intel_guc_ct *ct = from_tasklet(ct, t, receive_tasklet);
 
 	ct_try_receive_message(ct);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 1fbd89049edc..de3cde968108 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -110,6 +110,14 @@ static inline bool intel_guc_ct_enabled(const struct intel_guc_ct *ct)
 	return ct->enabled;
 }
 
+#define INTEL_GUC_CT_SEND_NB            BIT(31)
+#define INTEL_GUC_CT_SEND_G2H_DW_SHIFT  0
+#define INTEL_GUC_CT_SEND_G2H_DW_MASK   (0xff << INTEL_GUC_CT_SEND_G2H_DW_SHIFT)
+#define MAKE_SEND_FLAGS(len) ({ \
+        typeof(len) len_ = (len); \
+        GEM_BUG_ON(!FIELD_FIT(INTEL_GUC_CT_SEND_G2H_DW_MASK, len_)); \
+        (FIELD_PREP(INTEL_GUC_CT_SEND_G2H_DW_MASK, len_) | INTEL_GUC_CT_SEND_NB); \
+})
 int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 		      u32 *response_buf, u32 response_buf_size, u32 flags);
 void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index cb808c86eed5..65bb61e0abea 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1065,7 +1065,7 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
 		ret = tasklet_register_context(gse, last);
 		if (unlikely(ret == -EINPROGRESS))
 			goto blk_tasklet;
-		else if (unlikely(ret == -EIO))
+		else if (unlikely(ret == -EPIPE))
 			goto deadlk;
 		else if (unlikely(ret == -EBUSY))
 			goto schedule_tasklet;
@@ -1089,7 +1089,7 @@ static int gse_dequeue_one_context(struct guc_submit_engine *gse)
 
 add_request:
 		ret = gse_add_request(gse, last);
-		if (unlikely(ret == -EIO))
+		if (unlikely(ret == -EPIPE))
 			goto deadlk;
 		else if (ret == -EBUSY)
 			goto schedule_tasklet;
@@ -1896,7 +1896,7 @@ static int gse_bypass_tasklet_submit(struct guc_submit_engine *gse,
 		ret = gse_add_request(gse, rq);
 	}
 
-	if (unlikely(ret == -EIO))
+	if (unlikely(ret == -EPIPE))
 		disable_submission(gse->guc);
 
 	return ret;
@@ -3616,7 +3616,7 @@ static int guc_request_alloc(struct i915_request *rq)
 	if (context_needs_lrc_desc_pin(ce, !!ret)) {
 		ret = guc_lrc_desc_pin(ce, true);
 		if (unlikely(ret)) {	/* unwind */
-			if (ret == -EIO) {	/* GPU will be reset */
+			if (ret == -EPIPE) {	/* GPU will be reset */
 				disable_submission(guc);
 				goto out;
 			}
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index b03637c8ca49..054fdfa486b7 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -179,7 +179,7 @@ i915_param_named_unsafe(edp_vswing, int, 0400,
 i915_param_named_unsafe(enable_guc, int, 0400,
 	"Enable GuC load for GuC submission and/or HuC load. "
 	"Required functionality can be selected using bitmask values. "
-	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load, "
+	"(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load, "
 	"4=SR-IOV PF)");
 
 i915_param_named_unsafe(guc_feature_flags, uint, 0400,
--
git-pile 0.98-dev
