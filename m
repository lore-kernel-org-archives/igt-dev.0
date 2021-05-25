Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC68B6EA48
 for <igt-dev@lists.freedesktop.org>; Tue, 25 May 2021 13:06:50 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 25 May 2021 18:27:17 +0530
Message-Id: <20210525125718.244109-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210525125718.244109-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210525125718.244109-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t 1/2] lib/i915: Report scheduler caps for
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
To: igt-dev@lists.freedesktop.org, mahesh.meena@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Scheduler capability for timeslicing is getting enabled in
kernel which requires wrappers to be created for IGT.

Ref : https://patchwork.freedesktop.org/patch/365577/?series=77235&rev=3

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 include/drm-uapi/i915_drm.h |  1 +
 lib/i915/gem_scheduler.c    | 15 +++++++++++++++
 lib/i915/gem_scheduler.h    |  1 +
 3 files changed, 17 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index bf9ea471..51147a1d 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -524,6 +524,7 @@ typedef struct drm_i915_irq_wait {
 #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
 #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
 #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
+#define   I915_SCHEDULER_CAP_TIMESLICING	(1ul << 5)
 
 #define I915_PARAM_HUC_STATUS		 42
 
diff --git a/lib/i915/gem_scheduler.c b/lib/i915/gem_scheduler.c
index 184da843..8a452a1b 100644
--- a/lib/i915/gem_scheduler.c
+++ b/lib/i915/gem_scheduler.c
@@ -129,6 +129,19 @@ bool gem_scheduler_has_engine_busy_stats(int fd)
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
@@ -151,4 +164,6 @@ void gem_scheduler_print_capability(int fd)
 		igt_info(" - With HW semaphores enabled\n");
 	if (caps & I915_SCHEDULER_CAP_ENGINE_BUSY_STATS)
 		igt_info(" - With engine busy statistics\n");
+	if (caps & I915_SCHEDULER_CAP_TIMESLICING)
+		igt_info(" - With user timeslicing enabled\n");
 }
diff --git a/lib/i915/gem_scheduler.h b/lib/i915/gem_scheduler.h
index 14bd4cac..d43e84bd 100644
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
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
