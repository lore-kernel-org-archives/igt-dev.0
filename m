Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EAE6E064
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 23:04:04 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  9 Nov 2021 14:59:22 -0800
Message-Id: <20211109225928.23711-2-matthew.brost@intel.com>
In-Reply-To: <20211109225928.23711-1-matthew.brost@intel.com>
References: <20211109225928.23711-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/7] drm/i915/guc: Drop guc->interrupts.enabled
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

Drop the variable guc->interrupts.enabled as this variable is just
leading to bugs creeping into the code.

e.g. A full GPU reset disables the GuC interrupts but forgot to clear
guc->interrupts.enabled, guc->interrupts.enabled being true suppresses
interrupts from getting re-enabled and now we are broken.

It is harmless to enable interrupt while already enabled so let's just
delete this variable to avoid bugs like this going forward.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-7-matthew.brost@intel.com
(cherry picked from commit ded32d381cbb06e9cc8915dbcb92be941e195cda)
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 27 +++++++++-----------------
 drivers/gpu/drm/i915/gt/uc/intel_guc.h |  1 -
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2578e62ccf7b..612d100d337d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -96,12 +96,9 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
 
 	spin_lock_irq(&gt->irq_lock);
-	if (!guc->interrupts.enabled) {
-		WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
-			     gt->pm_guc_events);
-		guc->interrupts.enabled = true;
-		gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
-	}
+	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
+		     gt->pm_guc_events);
+	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 	spin_unlock_irq(&gt->irq_lock);
 }
 
@@ -112,7 +109,6 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
 
 	spin_lock_irq(&gt->irq_lock);
-	guc->interrupts.enabled = false;
 
 	gen6_gt_pm_disable_irq(gt, gt->pm_guc_events);
 
@@ -134,18 +130,14 @@ static void gen11_reset_guc_interrupts(struct intel_guc *guc)
 static void gen11_enable_guc_interrupts(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
+	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
 
 	spin_lock_irq(&gt->irq_lock);
-	if (!guc->interrupts.enabled) {
-		u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
-
-		WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
-		intel_uncore_write(gt->uncore,
-				   GEN11_GUC_SG_INTR_ENABLE, events);
-		intel_uncore_write(gt->uncore,
-				   GEN11_GUC_SG_INTR_MASK, ~events);
-		guc->interrupts.enabled = true;
-	}
+	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
+	intel_uncore_write(gt->uncore,
+			   GEN11_GUC_SG_INTR_ENABLE, events);
+	intel_uncore_write(gt->uncore,
+			   GEN11_GUC_SG_INTR_MASK, ~events);
 	spin_unlock_irq(&gt->irq_lock);
 }
 
@@ -154,7 +146,6 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 	struct intel_gt *gt = guc_to_gt(guc);
 
 	spin_lock_irq(&gt->irq_lock);
-	guc->interrupts.enabled = false;
 
 	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
 	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index c20f3839de12..4abc59f6f3cd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -33,7 +33,6 @@ struct intel_guc {
 	unsigned int msg_enabled_mask;
 
 	struct {
-		bool enabled;
 		void (*reset)(struct intel_guc *guc);
 		void (*enable)(struct intel_guc *guc);
 		void (*disable)(struct intel_guc *guc);
