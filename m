Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Feb 2022 14:10:31 +0000
Message-Id: <20220221141036.2490380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] lib/i915_drm_local: Add
 I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For now dump into i915_drm_local.h. Once the uapi on the kernel side is
merged, and is part of drm-next, we can sync the kernel headers and
remove this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/i915/i915_drm_local.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 9e82c968..7b5285f3 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -21,6 +21,33 @@ extern "C" {
  */
 #define I915_ENGINE_CLASS_COMPUTE 4
 
+/*
+ * Signal to the kernel that the object will need to be accessed via
+ * the CPU.
+ *
+ * Only valid when placing objects in I915_MEMORY_CLASS_DEVICE, and only
+ * strictly required on platforms where only some of the device memory
+ * is directly visible or mappable through the CPU, like on DG2+.
+ *
+ * One of the placements MUST also be I915_MEMORY_CLASS_SYSTEM, to
+ * ensure we can always spill the allocation to system memory, if we
+ * can't place the object in the mappable part of
+ * I915_MEMORY_CLASS_DEVICE.
+ *
+ * Note that buffers that need to be captured with EXEC_OBJECT_CAPTURE,
+ * will need to enable this hint, if the object can also be placed in
+ * I915_MEMORY_CLASS_DEVICE, starting from DG2+. The execbuf call will
+ * throw an error otherwise. This also means that such objects will need
+ * I915_MEMORY_CLASS_SYSTEM set as a possible placement.
+ *
+ * Without this hint, the kernel will assume that non-mappable
+ * I915_MEMORY_CLASS_DEVICE is preferred for this object. Note that the
+ * kernel can still migrate the object to the mappable part, as a last
+ * resort, if userspace ever CPU faults this object, but this might be
+ * expensive, and so ideally should be avoided.
+ */
+#define I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS (1 << 0)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1
