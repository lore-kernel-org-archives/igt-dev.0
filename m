Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6465F10E60F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 21:23:35 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Fri, 11 Aug 2023 02:55:20 +0530
Message-Id: <20230810212521.1405970-3-janga.rahul.kumar@intel.com>
In-Reply-To: <20230810212521.1405970-1-janga.rahul.kumar@intel.com>
References: <20230810212521.1405970-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/xe: Add hang library support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com, kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add helper library support to submit hanging batch and clean
state post hang.

An hanging batch is a spinning batch that never gets stopped.

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Anna Karas <anna.karas@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Tested-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/xe/xe_gt.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h |  7 ++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index a72f9bcc9..10ffb00d5 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -59,3 +59,72 @@ void xe_force_gt_reset_all(int xe_fd)
 		xe_force_gt_reset(xe_fd, gt);
 }
 
+/**
+ * xe_hang_ring:
+ * @fd: open xe drm file descriptor
+ * @ring: execbuf ring flag
+ *
+ * This helper function injects a hanging batch into @ring. It returns a
+ * #igt_hang_t structure which must be passed to xe_post_hang_ring() for
+ * hang post-processing (after the gpu hang interaction has been tested.
+ *
+ * Returns:
+ * Structure with helper internal state for xe_post_hang_ring().
+ */
+igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
+				unsigned int flags)
+{
+	uint16_t class;
+	uint32_t vm;
+	unsigned int exec_queue;
+	igt_spin_t *spin_t;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	switch (ring) {
+	case I915_EXEC_DEFAULT:
+		if (IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
+			class = DRM_XE_ENGINE_CLASS_COPY;
+		else
+			class = DRM_XE_ENGINE_CLASS_RENDER;
+		break;
+	case I915_EXEC_RENDER:
+		if (IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
+			igt_skip("Render engine not supported on this platform.\n");
+		else
+			class = DRM_XE_ENGINE_CLASS_RENDER;
+		break;
+	case I915_EXEC_BLT:
+		class = DRM_XE_ENGINE_CLASS_COPY;
+		break;
+	case I915_EXEC_BSD:
+		class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+		break;
+	case I915_EXEC_VEBOX:
+		class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+		break;
+	default:
+		igt_assert_f(false, "Unknown engine: %x", (uint32_t) flags);
+	}
+
+	exec_queue = xe_exec_queue_create_class(fd, vm, class);
+
+	spin_t = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm,
+				.flags = IGT_SPIN_NO_PREEMPTION);
+	return (igt_hang_t){ spin_t, exec_queue, 0, flags };
+}
+
+/**
+ * xe_post_hang_ring:
+ * @fd: open xe drm file descriptor
+ * @arg: hang state from xe_hang_ring()
+ *
+ * This function does the necessary post-processing after a gpu hang injected
+ * with xe_hang_ring().
+ */
+void xe_post_hang_ring(int fd, igt_hang_t arg)
+{
+	xe_exec_queue_destroy(fd, arg.ctx);
+	xe_vm_destroy(fd, arg.spin->vm);
+}
+
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index e075ebf62..26bbe23d4 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -12,6 +12,9 @@
 
 #include "igt_core.h"
 #include "igt_sysfs.h"
+#include "lib/igt_gt.h"
+#include "lib/intel_chipset.h"
+#include "xe_spin.h"
 #include "xe_ioctl.h"
 #include "xe_query.h"
 
@@ -24,4 +27,6 @@
 
 bool has_xe_gt_reset(int fd);
 void xe_force_gt_reset_all(int fd);
-
+igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
+				unsigned int flags);
+void xe_post_hang_ring(int fd, igt_hang_t arg);
-- 
2.25.1
