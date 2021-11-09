Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F9A6E064
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 23:04:05 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  9 Nov 2021 14:59:23 -0800
Message-Id: <20211109225928.23711-3-matthew.brost@intel.com>
In-Reply-To: <20211109225928.23711-1-matthew.brost@intel.com>
References: <20211109225928.23711-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/7] drm/i915/guc: Ensure H2G buffer updates
 visible before tail update
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

Ensure H2G buffer updates are visible before descriptor tail updates by
inserting a barrier between the H2G buffer update and the tail. The
barrier is simple wmb() for SMEM and is register write for LMEM. This is
needed if more than 1 H2G can be inflight at once.

If this barrier is not inserted it is possible the descriptor tail
update is scene by the GuC before H2G buffer update which results in the
GuC reading a corrupt H2G value. This can bring down the H2G channel
among other bad things.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20210603051630.2635-16-matthew.brost@intel.com
(cherry picked from commit d35ca600873eebceb071af81bdc279fb6ec538db)
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 5b9f69458c7d..4d4503b55c96 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -6,6 +6,7 @@
 #include "i915_drv.h"
 #include "intel_guc_ct.h"
 #include "gt/intel_gt.h"
+#include "gem/i915_gem_lmem.h"
 
 static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
 {
@@ -328,6 +329,28 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
 	return ++ct->requests.last_fence;
 }
 
+static void write_barrier(struct intel_guc_ct *ct)
+{
+	struct intel_guc *guc = ct_to_guc(ct);
+	struct intel_gt *gt = guc_to_gt(guc);
+
+	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
+		GEM_BUG_ON(guc->send_regs.fw_domains);
+		/*
+		 * This register is used by the i915 and GuC for MMIO based
+		 * communication. Once we are in this code CTBs are the only
+		 * method the i915 uses to communicate with the GuC so it is
+		 * safe to write to this register (a value of 0 is NOP for MMIO
+		 * communication). If we ever start mixing CTBs and MMIOs a new
+		 * register will have to be chosen.
+		 */
+		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
+	} else {
+		/* wmb() sufficient for a barrier if in smem */
+		wmb();
+	}
+}
+
 /**
  * DOC: CTB Host to GuC request
  *
@@ -411,6 +434,12 @@ static int ct_write(struct intel_guc_ct *ct,
 	}
 	GEM_BUG_ON(tail > size);
 
+	/*
+	 * make sure H2G buffer update and LRC tail update (if this triggering a
+	 * submission) are visible before updating the descriptor tail
+	 */
+	write_barrier(ct);
+
 	/* now update desc tail (back in bytes) */
 	desc->tail = tail * 4;
 	return 0;
