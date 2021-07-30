Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 30 Jul 2021 09:53:47 +0100
Message-Id: <20210730085348.2326899-10-matthew.auld@intel.com>
In-Reply-To: <20210730085348.2326899-1-matthew.auld@intel.com>
References: <20210730085348.2326899-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v3 10/11] lib/i915/gem_mman: add helper
 query for has_device_coherent
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

Might be useful in some tests, where we are not explicitly testing WC
maps, but rather just require something that is "device coherent", which
should also play nice on discrete platforms.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/i915/gem_mman.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/i915/gem_mman.h | 11 +++++++++++
 2 files changed, 50 insertions(+)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index c69dc6f5..0406a0b9 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -197,6 +197,45 @@ bool gem_mmap_offset__has_wc(int fd)
 	return has_wc > 0;
 }
 
+bool gem_mmap__has_device_coherent(int fd)
+{
+	struct drm_i915_gem_mmap_offset arg;
+	bool supported;
+
+	if (gem_mmap__has_wc(fd))
+		return true;
+
+	/* Maybe we still have GTT mmaps? */
+	memset(&arg, 0, sizeof(arg));
+	arg.handle = gem_create(fd, 4096);
+	arg.offset = 0;
+	arg.flags = I915_MMAP_OFFSET_GTT;
+	supported = igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET,
+			      &arg) == 0;
+	gem_close(fd, arg.handle);
+
+	errno = 0;
+
+	if (supported)
+		return true;
+
+	/*
+	 * Maybe this is a discrete device, which only supports fixed mmaps?
+	 * Such mappings should also be considered device coherent.
+	 */
+	memset(&arg, 0, sizeof(arg));
+	arg.handle = gem_create(fd, 4096);
+	arg.offset = 0;
+	arg.flags = I915_MMAP_OFFSET_FIXED;
+	supported = igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET,
+			      &arg) == 0;
+	gem_close(fd, arg.handle);
+
+	errno = 0;
+
+	return supported;
+}
+
 /**
  * __gem_mmap:
  * @fd: open i915 drm file descriptor
diff --git a/lib/i915/gem_mman.h b/lib/i915/gem_mman.h
index 290c997d..5966ddb5 100644
--- a/lib/i915/gem_mman.h
+++ b/lib/i915/gem_mman.h
@@ -41,6 +41,7 @@ void *gem_mmap_offset__fixed(int fd, uint32_t handle, uint64_t offset,
 			     uint64_t size, unsigned prot);
 void *gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				uint64_t size, unsigned prot);
+bool gem_mmap__has_device_coherent(int fd);
 void *gem_mmap__cpu_coherent(int fd, uint32_t handle, uint64_t offset,
 			     uint64_t size, unsigned prot);
 
@@ -96,6 +97,16 @@ int gem_munmap(void *ptr, uint64_t size);
  */
 #define gem_require_mmap_offset_wc(fd) igt_require(gem_mmap_offset__has_wc(fd))
 
+/**
+ * gem_require_mmap_offset_device_coherent:
+ * @fd: open i915 drm file descriptor
+ *
+ * Feature test macro to query whether direct (i.e. cpu access path, bypassing
+ * the gtt) write-combine memory mappings are available, or fixed mapping for
+ * discrete. Automatically skips through igt_require() if not.
+ */
+#define gem_require_mmap_device_coherent(fd) igt_require(gem_mmap__has_device_coherent(fd))
+
 extern const struct mmap_offset {
 	const char *name;
 	unsigned int type;
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
