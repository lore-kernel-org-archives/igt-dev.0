Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA6C6E241
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 20:39:12 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 31 Jan 2020 12:38:12 -0800
Message-Id: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580503049.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 1/2] lib/i915/gem_mman: Add
 gem_mmap__wc_ext()
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

Add gem_mmap__wc_ext() for when specifically a WC mapping is required,
whether by using mmap_offset or mmap__wc.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_mman.c | 23 +++++++++++++++++++++++
 lib/i915/gem_mman.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index c034f3173..796ae6ebc 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -338,6 +338,29 @@ void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
 	return ptr;
 }
 
+
+/**
+ * gem_mmap__wc_ext
+ * @fd: open i915 drm file descriptor
+ * @handle: gem buffer object handle
+ * @offset: offset in the gem buffer of the mmap arena
+ * @size: size of the mmap arena
+ * @prot: memory protection bits as used by mmap()
+ *
+ * Used when specifically a WC mapping is needed, whether by using
+ * mmap_offset or mmap__wc
+ */
+void *gem_mmap__wc_ext(int fd, uint32_t handle, uint64_t offset,
+		       uint64_t size, unsigned prot)
+{
+	void *ptr = __gem_mmap_offset(fd, handle, offset, size, prot,
+				      I915_MMAP_OFFSET_WC);
+	if (!ptr)
+		ptr = __gem_mmap__wc(fd, handle, offset, size, prot);
+
+	return ptr;
+}
+
 /**
  * __gem_mmap__device_coherent:
  * @fd: open i915 drm file descriptor
diff --git a/lib/i915/gem_mman.h b/lib/i915/gem_mman.h
index 2730295ea..b8e0c9dcd 100644
--- a/lib/i915/gem_mman.h
+++ b/lib/i915/gem_mman.h
@@ -37,6 +37,8 @@ bool gem_mmap_offset__has_wc(int fd);
 void *gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot);
 void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
 			  uint64_t size, unsigned prot);
+void *gem_mmap__wc_ext(int fd, uint32_t handle, uint64_t offset,
+		       uint64_t size, unsigned prot);
 void *gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				uint64_t size, unsigned prot);
 void *gem_mmap__cpu_coherent(int fd, uint32_t handle, uint64_t offset,
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
