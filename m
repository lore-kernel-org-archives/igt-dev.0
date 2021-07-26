Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Mon, 26 Jul 2021 13:03:04 +0100
Message-Id: <20210726120310.1115522-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/7] lib/i915/gem_mman: add FIXED mmap mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We need this for discrete.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/i915/gem_mman.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/i915/gem_mman.h |  4 ++++
 2 files changed, 41 insertions(+)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index 4b4f2114..e2514f0c 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -497,6 +497,43 @@ void *gem_mmap_offset__cpu(int fd, uint32_t handle, uint64_t offset,
 	return ptr;
 }
 
+#define LOCAL_I915_MMAP_OFFSET_FIXED 4
+
+void *__gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
+			       uint64_t size, unsigned prot)
+{
+	return __gem_mmap_offset(fd, handle, offset, size, prot,
+				 LOCAL_I915_MMAP_OFFSET_FIXED);
+}
+
+/**
+ * gem_mmap_offset__fixed: Used to mmap objects on discrete platforms
+ * @fd: open i915 drm file descriptor
+ * @handle: gem buffer object handle
+ * @offset: offset in the gem buffer of the mmap arena
+ * @size: size of the mmap arena
+ * @prot: memory protection bits as used by mmap()
+ *
+ * Like __gem_mmap_offset__fixed() except we assert on failure.
+ *
+ * For discrete the caching attributes for the pages are fixed at allocation
+ * time, and can't be changed. The FIXED mode will simply use the same caching *
+ * mode of the allocated pages. This mode will always be coherent with GPU
+ * access.
+ *
+ * On non-discrete platforms this mode is not supported.
+ *
+ * Returns: A pointer to the created memory mapping
+ */
+void *gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
+			   uint64_t size, unsigned prot)
+{
+	void *ptr = __gem_mmap_offset__fixed(fd, handle, offset, size, prot);
+
+	igt_assert(ptr);
+	return ptr;
+}
+
 /**
  * __gem_mmap__cpu_coherent:
  * @fd: open i915 drm file descriptor
diff --git a/lib/i915/gem_mman.h b/lib/i915/gem_mman.h
index 5695d2ad..290c997d 100644
--- a/lib/i915/gem_mman.h
+++ b/lib/i915/gem_mman.h
@@ -37,6 +37,8 @@ bool gem_mmap_offset__has_wc(int fd);
 void *gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot);
 void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
 			  uint64_t size, unsigned prot);
+void *gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
+			     uint64_t size, unsigned prot);
 void *gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				uint64_t size, unsigned prot);
 void *gem_mmap__cpu_coherent(int fd, uint32_t handle, uint64_t offset,
@@ -54,6 +56,8 @@ void *__gem_mmap_offset__cpu(int fd, uint32_t handle, uint64_t offset,
 void *__gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot);
 void *__gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
 			    uint64_t size, unsigned prot);
+void *__gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
+			       uint64_t size, unsigned prot);
 void *__gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				  uint64_t size, unsigned prot);
 void *__gem_mmap_offset(int fd, uint32_t handle, uint64_t offset, uint64_t size,
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
