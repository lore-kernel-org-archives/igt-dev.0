Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDBA6E573
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 21:59:43 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed,  6 Oct 2021 17:59:34 -0400
Message-Id: <20211006215936.972661-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] i915_drm.h sync with drm-next
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Let's do a catch-up on i915_drm.h here.
Only on i915_drm.h for now so we can have a clean
view of the LOCAL_ ones that we need to remove.

Taken from 25fed6b324ac ("Merge tag 'drm-intel-gt-next-2021-08-06-1' of ssh://git.freedesktop.org/git/drm/drm-intel into drm-next")

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/i915_drm.h | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index b9632bb2..c788a1ab 100644
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
 
@@ -674,6 +683,9 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
 
+/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
+#define I915_PARAM_HAS_USERPTR_PROBE 56
+
 /* Must be kept compact -- no holes and well documented */
 
 typedef struct drm_i915_getparam {
@@ -923,6 +935,25 @@ struct drm_i915_gem_mmap_offset {
  *	- I915_GEM_DOMAIN_GTT: Mappable aperture domain
  *
  * All other domains are rejected.
+ *
+ * Note that for discrete, starting from DG1, this is no longer supported, and
+ * is instead rejected. On such platforms the CPU domain is effectively static,
+ * where we also only support a single &drm_i915_gem_mmap_offset cache mode,
+ * which can't be set explicitly and instead depends on the object placements,
+ * as per the below.
+ *
+ * Implicit caching rules, starting from DG1:
+ *
+ *	- If any of the object placements (see &drm_i915_gem_create_ext_memory_regions)
+ *	  contain I915_MEMORY_CLASS_DEVICE then the object will be allocated and
+ *	  mapped as write-combined only.
+ *
+ *	- Everything else is always allocated and mapped as write-back, with the
+ *	  guarantee that everything is also coherent with the GPU.
+ *
+ * Note that this is likely to change in the future again, where we might need
+ * more flexibility on future devices, so making this all explicit as part of a
+ * new &drm_i915_gem_create_ext extension is probable.
  */
 struct drm_i915_gem_set_domain {
 	/** @handle: Handle for the object. */
@@ -2203,12 +2234,29 @@ struct drm_i915_gem_userptr {
 	 * through the GTT. If the HW can't support readonly access, an error is
 	 * returned.
 	 *
+	 * I915_USERPTR_PROBE:
+	 *
+	 * Probe the provided @user_ptr range and validate that the @user_ptr is
+	 * indeed pointing to normal memory and that the range is also valid.
+	 * For example if some garbage address is given to the kernel, then this
+	 * should complain.
+	 *
+	 * Returns -EFAULT if the probe failed.
+	 *
+	 * Note that this doesn't populate the backing pages, and also doesn't
+	 * guarantee that the object will remain valid when the object is
+	 * eventually used.
+	 *
+	 * The kernel supports this feature if I915_PARAM_HAS_USERPTR_PROBE
+	 * returns a non-zero value.
+	 *
 	 * I915_USERPTR_UNSYNCHRONIZED:
 	 *
 	 * NOT USED. Setting this flag will result in an error.
 	 */
 	__u32 flags;
 #define I915_USERPTR_READ_ONLY 0x1
+#define I915_USERPTR_PROBE 0x2
 #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
 	/**
 	 * @handle: Returned handle for the object.
-- 
2.31.1
