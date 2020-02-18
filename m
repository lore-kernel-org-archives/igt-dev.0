Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4E36E079
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 16:16:16 +0000 (UTC)
From: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Date: Tue, 18 Feb 2020 05:47:09 +0530
Message-Id: <20200218001710.16537-2-sreedhar.telukuntla@intel.com>
In-Reply-To: <20200218001710.16537-1-sreedhar.telukuntla@intel.com>
References: <20200218001710.16537-1-sreedhar.telukuntla@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915/gem_mman: Add coherent mmap
 api support with set domain
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

gem_mmap__device_coherent_domain api maps buffer object and returns
the memory domain to be used by the caller for subsequent set_domain
call for cpu access.

gem_mmap__device_coherent_sync api maps buffer object and also does
set_domain to make the memory ready for cpu access.

Signed-off-by: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/i915/gem_mman.c | 76 ++++++++++++++++++++++++++++++++++++++++++---
 lib/i915/gem_mman.h |  6 +++-
 2 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index 08ae6769..b8d20c07 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -345,21 +345,25 @@ void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
  * @offset: offset in the gem buffer of the mmap arena
  * @size: size of the mmap arena
  * @prot: memory protection bits as used by mmap()
+ * @domain: cache  domain used for mmap
  *
  * Returns: A pointer to a block of linear device memory mapped into the
  * process with WC semantics. When no WC is available try to mmap using GGTT.
  */
 void *__gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
-				  uint64_t size, unsigned prot)
+				  uint64_t size, unsigned prot, uint32_t *domain)
 {
 	void *ptr = __gem_mmap_offset(fd, handle, offset, size, prot,
 				      I915_MMAP_OFFSET_WC);
 	if (!ptr)
 		ptr = __gem_mmap__wc(fd, handle, offset, size, prot);
 
-	if (!ptr)
-		ptr = __gem_mmap__gtt(fd, handle, size, prot);
+	*domain = I915_GEM_DOMAIN_WC;
 
+	if (!ptr) {
+		ptr = __gem_mmap__gtt(fd, handle, size, prot);
+		*domain = I915_GEM_DOMAIN_GTT;
+	}
 	return ptr;
 }
 
@@ -382,15 +386,79 @@ void *gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				uint64_t size, unsigned prot)
 {
 	void *ptr;
+	uint32_t domain;
 
 	igt_assert(offset == 0);
 
-	ptr = __gem_mmap__device_coherent(fd, handle, offset, size, prot);
+	ptr = __gem_mmap__device_coherent(fd, handle, offset, size, prot, &domain);
 	igt_assert(ptr);
 
 	return ptr;
 }
 
+/**
+ * gem_mmap__device_coherent_domain:
+ * @fd: open i915 drm file descriptor
+ * @handle: gem buffer object handle
+ * @offset: offset in the gem buffer of the mmap arena
+ * @size: size of the mmap arena
+ * @prot: memory protection bits as used by mmap()
+ * @domain: memory domain to be used by the caller for set_domain after mmap
+ *
+ * Call __gem_mmap__device__coherent_domain(), asserts on fail.
+ * Offset argument passed in function call must be 0. In the future
+ * when driver will allow slice mapping of buffer object this restriction
+ * will be removed.
+ *
+ * Returns: A pointer to the created memory mapping.
+ */
+void *gem_mmap__device_coherent_domain(int fd, uint32_t handle, uint64_t offset,
+                               uint64_t size, unsigned prot, uint32_t *domain)
+{
+       void *ptr;
+
+       igt_assert(offset == 0);
+
+       ptr = __gem_mmap__device_coherent(fd, handle, offset, size, prot, domain);
+       igt_assert(ptr);
+
+       return ptr;
+}
+
+/**
+ * gem_mmap__device_coherent_sync:
+ * @fd: open i915 drm file descriptor
+ * @handle: gem buffer object handle
+ * @offset: offset in the gem buffer of the mmap arena
+ * @size: size of the mmap arena
+ * @prot: memory protection bits as used by mmap()
+ *
+ * Call __gem_mmap__device__coherent_sync(), asserts on fail.
+ * Offset argument passed in function call must be 0. In the future
+ * when driver will allow slice mapping of buffer object this restriction
+ * will be removed.
+ *
+ * This function sets appropriate memory domain as well once the mapping is
+ * complete and makes the memory ready for cpu access
+ *
+ * Returns: A pointer to the created memory mapping.
+ */
+void *gem_mmap__device_coherent_sync(int fd, uint32_t handle, uint64_t offset,
+                               uint64_t size, unsigned prot)
+{
+       void *ptr;
+       uint32_t domain;
+
+       igt_assert(offset == 0);
+
+       ptr = gem_mmap__device_coherent_domain(fd, handle, offset, size, prot, &domain);
+       igt_assert(ptr);
+
+       gem_set_domain(fd, handle, domain, domain);
+
+       return ptr;
+}
+
 /**
  * __gem_mmap__cpu:
  * @fd: open i915 drm file descriptor
diff --git a/lib/i915/gem_mman.h b/lib/i915/gem_mman.h
index 4fc6a018..3b062498 100644
--- a/lib/i915/gem_mman.h
+++ b/lib/i915/gem_mman.h
@@ -39,6 +39,10 @@ void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
 			  uint64_t size, unsigned prot);
 void *gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				uint64_t size, unsigned prot);
+void *gem_mmap__device_coherent_domain(int fd, uint32_t handle, uint64_t offset,
+                               uint64_t size, unsigned prot, uint32_t *domain);
+void *gem_mmap__device_coherent_sync(int fd, uint32_t handle, uint64_t offset,
+                               uint64_t size, unsigned prot);
 void *gem_mmap__cpu_coherent(int fd, uint32_t handle, uint64_t offset,
 			     uint64_t size, unsigned prot);
 
@@ -58,7 +62,7 @@ void *__gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size, un
 void *__gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
 			    uint64_t size, unsigned prot);
 void *__gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
-				  uint64_t size, unsigned prot);
+				  uint64_t size, unsigned prot, uint32_t *domain);
 void *__gem_mmap_offset(int fd, uint32_t handle, uint64_t offset, uint64_t size,
 			unsigned int prot, uint64_t flags);
 void *__gem_mmap__cpu_coherent(int fd, uint32_t handle, uint64_t offset,
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
