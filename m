Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  5 May 2020 14:38:35 +0100
Message-Id: <20200505133836.2873640-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915: Report scheduler caps for
 timeslicing
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 include/drm-uapi/i915_drm.h |  8 +++++---
 lib/i915/gem_scheduler.c    | 15 +++++++++++++++
 lib/i915/gem_scheduler.h    |  1 +
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 2b55af13a..a222b6bfb 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -523,6 +523,7 @@ typedef struct drm_i915_irq_wait {
 #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
 #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
 #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
+#define   I915_SCHEDULER_CAP_TIMESLICING	(1ul << 5)
 
 #define I915_PARAM_HUC_STATUS		 42
 
@@ -1040,9 +1041,10 @@ struct drm_i915_gem_exec_fence {
 	 */
 	__u32 handle;
 
-#define I915_EXEC_FENCE_WAIT            (1<<0)
-#define I915_EXEC_FENCE_SIGNAL          (1<<1)
-#define __I915_EXEC_FENCE_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_SIGNAL << 1))
+#define I915_EXEC_FENCE_WAIT            (1u << 0)
+#define I915_EXEC_FENCE_SIGNAL          (1u << 1)
+#define I915_EXEC_FENCE_WAIT_SUBMIT     (1u << 2)
+#define __I915_EXEC_FENCE_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_WAIT_SUBMIT << 1))
 	__u32 flags;
 };
 
diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
index 1beb85dec..a1dc694e5 100644
--- a/lib/i915/gem_scheduler.c
+++ b/lib/i915/gem_scheduler.c
@@ -131,6 +131,19 @@ bool gem_scheduler_has_engine_busy_stats(int fd)
 		I915_SCHEDULER_CAP_ENGINE_BUSY_STATS;
 }
 
+/**
+ * gem_scheduler_has_timeslicing:
+ * @fd: open i915 drm file descriptor
+ *
+ * Feature test macro to query whether the driver supports using HW preemption
+ * to implement timeslicing of userspace batches. This allows userspace to
+ * implement micro-level scheduling within their own batches.
+ */
+bool gem_scheduler_has_timeslicing(int fd)
+{
+	return gem_scheduler_capability(fd) & I915_SCHEDULER_CAP_TIMESLICING;
+}
+
 /**
  * gem_scheduler_print_capability:
  * @fd: open i915 drm file descriptor
@@ -151,6 +164,8 @@ void gem_scheduler_print_capability(int fd)
 		igt_info(" - With preemption enabled\n");
 	if (caps & I915_SCHEDULER_CAP_SEMAPHORES)
 		igt_info(" - With HW semaphores enabled\n");
+	if (caps & I915_SCHEDULER_CAP_TIMESLICING)
+		igt_info(" - With user timeslicing enabled\n");
 	if (caps & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
 		igt_info(" - With engine busy statistics\n");
 }
diff --git a/lib/i915/gem_scheduler.h b/lib/i915/gem_scheduler.h
index 14bd4cac4..d43e84bd2 100644
--- a/lib/i915/gem_scheduler.h
+++ b/lib/i915/gem_scheduler.h
@@ -32,6 +32,7 @@ bool gem_scheduler_has_ctx_priority(int fd);
 bool gem_scheduler_has_preemption(int fd);
 bool gem_scheduler_has_semaphores(int fd);
 bool gem_scheduler_has_engine_busy_stats(int fd);
+bool gem_scheduler_has_timeslicing(int fd);
 void gem_scheduler_print_capability(int fd);
 
 #endif /* GEM_SCHEDULER_H */
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
