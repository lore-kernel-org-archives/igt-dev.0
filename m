Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5876E045
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 11:05:15 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 18 Jun 2021 16:32:19 +0530
Message-Id: <20210618110220.23344-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms: Create buffer object from
 LMEM for discrete
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Create framebuffer object from lmem for discrete file descriptor
The framebuffer backing object should be from local memory for discrete.

Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 lib/ioctl_wrappers.c | 22 ++++++++++++++++++++++
 lib/ioctl_wrappers.h |  1 +
 tests/kms_big_fb.c   |  7 ++++---
 tests/kms_getfb.c    |  2 +-
 4 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 619d288a..48526d29 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -594,6 +594,28 @@ void gem_sync(int fd, uint32_t handle)
 	errno = 0;
 }
 
+/**
+ * gem_buffer_create_fb_obj:
+ * @fd: open i915 drm file descriptor
+ * @size: desired size of the buffer
+ *
+ * This wraps the GEM_CREATE ioctl, which allocates a new gem buffer object of
+ * @size from file descriptor specific region
+ *
+ * Returns: The file-private handle of the created buffer object
+ */
+uint32_t gem_buffer_create_fb_obj(int fd, uint64_t size)
+{
+	uint32_t handle;
+
+	if (gem_has_lmem(fd))
+		handle = gem_create_in_memory_regions(fd, size, REGION_LMEM(0));
+	else
+		handle = gem_create(fd, size);
+
+	return handle;
+}
+
 /**
  * __gem_execbuf:
  * @fd: open i915 drm file descriptor
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 36640e30..a8274a3f 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -79,6 +79,7 @@ int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
 void gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
 int gem_wait(int fd, uint32_t handle, int64_t *timeout_ns);
 void gem_sync(int fd, uint32_t handle);
+uint32_t gem_buffer_create_fb_obj(int fd, uint64_t size);
 void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index dbb9ac46..096dee35 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -628,7 +628,8 @@ test_size_overflow(data_t *data)
 	igt_require(data->max_fb_width >= 16383 &&
 		    data->max_fb_height >= 16383);
 
-	bo = gem_create(data->drm_fd, (1ULL << 32) - 4096);
+	bo = gem_buffer_create_fb_obj(data->drm_fd, (1ULL << 32) - 4096);
+
 	igt_require(bo);
 
 	ret = __kms_addfb(data->drm_fd, bo,
@@ -666,7 +667,7 @@ test_size_offset_overflow(data_t *data)
 					       DRM_FORMAT_NV12,
 					       data->modifier));
 
-	bo = gem_create(data->drm_fd, (1ULL << 32) - 4096);
+	bo = gem_buffer_create_fb_obj(data->drm_fd, (1ULL << 32) - 4096);
 	igt_require(bo);
 
 	offsets[0] = 0;
@@ -725,7 +726,7 @@ test_addfb(data_t *data)
 			 format, data->modifier,
 			 &size, &strides[0]);
 
-	bo = gem_create(data->drm_fd, size);
+	bo = gem_buffer_create_fb_obj(data->drm_fd, size);
 	igt_require(bo);
 
 	if (intel_display_ver(data->devid) < 4)
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 14be74d6..75f5f30c 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -128,7 +128,7 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 		size += add.pitches[1] * ALIGN(ALIGN(add.height, 16) / 16, 32);
 	}
 
-	add.handles[0] = gem_create(fd, size);
+	add.handles[0] = gem_buffer_create_fb_obj(fd, size);
 	igt_require(add.handles[0] != 0);
 	add.handles[1] = add.handles[0];
 
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
