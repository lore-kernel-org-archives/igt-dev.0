Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEB510E1EF
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Nov 2022 07:53:16 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Nov 2022 23:53:02 -0800
Message-Id: <20221113075309.32023-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221113075309.32023-1-niranjana.vishwanathapura@intel.com>
References: <20221113075309.32023-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 06/13] lib/vm_bind: Add
 __prime_handle_to_fd()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make __prime_handle_to_fd() as a library interface as VM_BIND
functionality will also be using it.

v2: Rename prime_handle_to_fd_no_assert() to __prime_handle_to_fd()

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/ioctl_wrappers.c    | 39 +++++++++++++++++++++++++++++++++------
 lib/ioctl_wrappers.h    |  1 +
 tests/i915/gem_pwrite.c | 16 +---------------
 tests/prime_mmap.c      | 26 ++++----------------------
 4 files changed, 39 insertions(+), 43 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index ac37b6bb4..db9cbb724 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1153,28 +1153,55 @@ void gem_require_mocs_registers(int fd)
 /* prime */
 
 /**
- * prime_handle_to_fd:
+ * __prime_handle_to_fd:
  * @fd: open i915 drm file descriptor
  * @handle: file-private gem buffer object handle
+ * @flags: DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl flags
+ * @fd_out: place holder for output file handle
  *
  * This wraps the PRIME_HANDLE_TO_FD ioctl, which is used to export a gem buffer
  * object into a global (i.e. potentially cross-device) dma-buf file-descriptor
  * handle.
  *
- * Returns: The created dma-buf fd handle.
+ * Returns: 0 on success, error otherwise. Upon success, it returns
+ *          the created dma-buf fd handle in fd_out.
  */
-int prime_handle_to_fd(int fd, uint32_t handle)
+int __prime_handle_to_fd(int fd, uint32_t handle, int flags, int *fd_out)
 {
 	struct drm_prime_handle args;
+	int ret;
 
 	memset(&args, 0, sizeof(args));
 	args.handle = handle;
-	args.flags = DRM_CLOEXEC;
+	args.flags = flags;
 	args.fd = -1;
 
-	do_ioctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
+	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
+	if (ret)
+		ret = -errno;
+	*fd_out = args.fd;
 
-	return args.fd;
+	return ret;
+}
+
+/**
+ * prime_handle_to_fd:
+ * @fd: open i915 drm file descriptor
+ * @handle: file-private gem buffer object handle
+ *
+ * This wraps the PRIME_HANDLE_TO_FD ioctl, which is used to export a gem buffer
+ * object into a global (i.e. potentially cross-device) dma-buf file-descriptor
+ * handle. It asserts that ioctl succeeds.
+ *
+ * Returns: The created dma-buf fd handle.
+ */
+int prime_handle_to_fd(int fd, uint32_t handle)
+{
+	int dmabuf;
+
+	igt_assert_eq(__prime_handle_to_fd(fd, handle, DRM_CLOEXEC, &dmabuf), 0);
+
+	return dmabuf;
 }
 
 /**
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 223cd9160..66faa2755 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -143,6 +143,7 @@ struct local_dma_buf_sync {
 #define LOCAL_DMA_BUF_BASE 'b'
 #define LOCAL_DMA_BUF_IOCTL_SYNC _IOW(LOCAL_DMA_BUF_BASE, 0, struct local_dma_buf_sync)
 
+int __prime_handle_to_fd(int fd, uint32_t handle, int flags, int *fd_out);
 int prime_handle_to_fd(int fd, uint32_t handle);
 #ifndef DRM_RDWR
 #define DRM_RDWR O_RDWR
diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index 6e3f833cd..f4fe069ca 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -293,19 +293,6 @@ struct ufd_thread {
 	int err;
 };
 
-static int __prime_handle_to_fd(int fd, uint32_t handle)
-{
-	struct drm_prime_handle args;
-
-	memset(&args, 0, sizeof(args));
-	args.handle = handle;
-	args.flags = DRM_CLOEXEC;
-	args.fd = -1;
-
-	ioctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
-	return args.fd;
-}
-
 static uint32_t dmabuf_create_handle(int i915, int vgem)
 {
 	struct vgem_bo scratch;
@@ -317,8 +304,7 @@ static uint32_t dmabuf_create_handle(int i915, int vgem)
 	scratch.bpp = 32;
 	vgem_create(vgem, &scratch);
 
-	dmabuf = __prime_handle_to_fd(vgem, scratch.handle);
-	if (dmabuf < 0)
+	if (__prime_handle_to_fd(vgem, scratch.handle, DRM_CLOEXEC, &dmabuf))
 		return 0;
 
 	handle = prime_fd_to_handle(i915, dmabuf);
diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index bc19f68c9..432e85763 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -298,24 +298,6 @@ test_dup(uint32_t region, uint64_t size)
 	close (dma_buf_fd);
 }
 
-/* Used for error case testing to avoid wrapper */
-static int prime_handle_to_fd_no_assert(uint32_t handle, int flags, int *fd_out)
-{
-	struct drm_prime_handle args;
-	int ret;
-
-	args.handle = handle;
-	args.flags = flags;
-	args.fd = -1;
-
-	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
-	if (ret)
-		ret = errno;
-	*fd_out = args.fd;
-
-	return ret;
-}
-
 static bool has_userptr(void)
 {
 	uint32_t handle = 0;
@@ -346,9 +328,9 @@ test_userptr(uint32_t region, uint64_t size)
 	gem_userptr(fd, (uint32_t *)ptr, size, 0, 0, &handle);
 
 	/* export userptr */
-	ret = prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
+	ret = __prime_handle_to_fd(fd, handle, DRM_CLOEXEC, &dma_buf_fd);
 	if (ret) {
-		igt_assert(ret == EINVAL || ret == ENODEV);
+		igt_assert(ret == -EINVAL || ret == -ENODEV);
 		goto free_userptr;
 	} else {
 		igt_assert_eq(ret, 0);
@@ -376,7 +358,7 @@ test_errors(uint32_t region, uint64_t size)
 	/* Test for invalid flags */
 	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	for (i = 0; i < ARRAY_SIZE(invalid_flags); i++) {
-		prime_handle_to_fd_no_assert(handle, invalid_flags[i], &dma_buf_fd);
+		__prime_handle_to_fd(fd, handle, invalid_flags[i], &dma_buf_fd);
 		igt_assert_eq(errno, EINVAL);
 		errno = 0;
 	}
@@ -386,7 +368,7 @@ test_errors(uint32_t region, uint64_t size)
 	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 	gem_close(fd, handle);
-	prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
+	__prime_handle_to_fd(fd, handle, DRM_CLOEXEC, &dma_buf_fd);
 	igt_assert(dma_buf_fd == -1 && errno == ENOENT);
 	errno = 0;
 
-- 
2.21.0.rc0.32.g243a4c7e27
