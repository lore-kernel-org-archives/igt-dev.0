Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Brost <matthew.brost@intel.com>
Date: Wed, 21 Jul 2021 16:20:02 -0700
Message-Id: <20210721232004.31470-6-matthew.brost@intel.com>
In-Reply-To: <20210721232004.31470-1-matthew.brost@intel.com>
References: <20210721232004.31470-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] include/drm-uapi: Add static priority
 mapping UAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/i915_drm.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 6ac6c76b4..008d39426 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -572,6 +572,15 @@ typedef struct drm_i915_irq_wait {
 #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
 #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
 #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
+/*
+ * Indicates the 2k user priority levels are statically mapped into 3 buckets as
+ * follows:
+ *
+ * -1k to -1	Low priority
+ * 0		Normal priority
+ * 1 to 1k	Highest priority
+ */
+#define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
 
 #define I915_PARAM_HUC_STATUS		 42
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
