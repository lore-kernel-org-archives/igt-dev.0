Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE3910E324
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 14:16:35 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 24 Jul 2023 15:15:57 +0100
Message-ID: <20230724141602.47733-2-matthew.auld@intel.com>
In-Reply-To: <20230724141602.47733-1-matthew.auld@intel.com>
References: <20230724141602.47733-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 1/6] xe: sync small-bar uapi
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We need a couple new fields for the region query and the new flag to
ensure the buffer is CPU accessible.

make headers_install at fcd32328261c ("drm/xe/uapi: add the userspace
bits for small-bar")

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/drm-uapi/xe_drm.h | 78 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 9 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 432bd87ca..02419c1d5 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -29,7 +29,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the __user boundary with pointers encapsulated inside u64.
+ * the boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -180,8 +180,37 @@ struct drm_xe_query_mem_region {
 	 * zero.
 	 */
 	__u64 used;
+	/*
+	 * @cpu_visible_size: How much of this region can be CPU
+	 * accessed, in bytes.
+	 *
+	 * This will always be <= @total_size, and the remainder (if
+	 * any) will not be CPU accessible. If the CPU accessible part
+	 * is smaller than @total_size then this is referred to as a
+	 * small BAR system.
+	 *
+	 * On systems without small BAR (full BAR), the probed_size will
+	 * always equal the @total_size, since all of it will be CPU
+	 * accessible.
+	 *
+	 * Note this is only tracked for XE_MEM_REGION_CLASS_VRAM
+	 * regions (for other types the value here will always equal
+	 * zero).
+	 */
+	__u64 cpu_visible_size;
+	/**
+	 * @cpu_visible_used: Estimate of CPU visible memory used, in
+	 * bytes.
+	 *
+	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
+	 * accounting. Without this the value here will always equal
+	 * zero.  Note this is only currently tracked for
+	 * XE_MEM_REGION_CLASS_VRAM regions (for other types the value
+	 * here will always be zero).
+	 */
+	__u64 cpu_visible_used;
 	/** @reserved: MBZ */
-	__u64 reserved[8];
+	__u64 reserved[6];
 };
 
 /**
@@ -242,11 +271,13 @@ struct drm_xe_query_gts {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/*
+	/**
+	 * @gts: The GTs returned for this device
+	 *
+	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
 	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
 	 * bandwidth between this GT and remote region?
 	 */
-
 	struct drm_xe_query_gt {
 #define XE_QUERY_GT_TYPE_MAIN		0
 #define XE_QUERY_GT_TYPE_REMOTE		1
@@ -381,6 +412,22 @@ struct drm_xe_gem_create {
 
 #define XE_GEM_CREATE_FLAG_DEFER_BACKING	(0x1 << 24)
 #define XE_GEM_CREATE_FLAG_SCANOUT		(0x1 << 25)
+/*
+ * When using VRAM as a possible placement, ensure that the corresponding VRAM
+ * allocation will always use the CPU accessible part of VRAM. This is important
+ * for small-bar systems (on full-bar systems this gets turned into a noop).
+ *
+ * Note: System memory can be used as an extra placement if the kernel should
+ * spill the allocation to system memory, if space can't be made available in
+ * the CPU accessible part of VRAM (giving the same behaviour as the i915
+ * interface, see I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS).
+ *
+ * Note: For clear-color CCS surfaces the kernel needs to read the clear-color
+ * value stored in the buffer, and on discrete platforms we need to use VRAM for
+ * display surfaces, therefore the kernel requires setting this flag for such
+ * objects, otherwise an error is thrown on small-bar systems.
+ */
+#define XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
 	/**
 	 * @flags: Flags, currently a mask of memory instances of where BO can
 	 * be placed
@@ -799,7 +846,7 @@ struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @vm_id: VM ID to run batch buffer in */
+	/** @engine_id: Engine ID for the batch buffer */
 	__u32 engine_id;
 
 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
@@ -852,8 +899,9 @@ struct drm_xe_mmio {
  * struct drm_xe_wait_user_fence - wait user fence
  *
  * Wait on user fence, XE will wakeup on every HW engine interrupt in the
- * instances list and check if user fence is complete:
- * (*addr & MASK) OP (VALUE & MASK)
+ * instances list and check if user fence is complete::
+ *
+ *	(*addr & MASK) OP (VALUE & MASK)
  *
  * Returns to user on user fence completion or timeout.
  */
@@ -901,8 +949,20 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
 	/** @mask: comparison mask */
 	__u64 mask;
-
-	/** @timeout: how long to wait before bailing, value in jiffies */
+	/**
+	 * @timeout: how long to wait before bailing, value in nanoseconds.
+	 * Without DRM_XE_UFENCE_WAIT_ABSTIME flag set (relative timeout)
+	 * it contains timeout expressed in nanoseconds to wait (fence will
+	 * expire at now() + timeout).
+	 * When DRM_XE_UFENCE_WAIT_ABSTIME flat is set (absolute timeout) wait
+	 * will end at timeout (uses system MONOTONIC_CLOCK).
+	 * Passing negative timeout leads to neverending wait.
+	 *
+	 * On relative timeout this value is updated with timeout left
+	 * (for restarting the call in case of signal delivery).
+	 * On absolute timeout this value stays intact (restarted call still
+	 * expire at the same point of time).
+	 */
 	__s64 timeout;
 
 	/**
-- 
2.41.0
