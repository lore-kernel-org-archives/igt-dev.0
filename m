Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49AA894C9
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Sep 2021 15:57:55 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Tue,  7 Sep 2021 21:30:11 +0530
Message-Id: <20210907160012.21601-2-ramalingam.c@intel.com>
In-Reply-To: <20210907160012.21601-1-ramalingam.c@intel.com>
References: <20210907160012.21601-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/ioctl_wrappers: wrapper for mmap
 ptr for gem obj
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev <igt-dev@lists.freedesktop.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>, Chris_intel_ID <chris.p.wilson@intel.com>, Dixit Ashutosh <ashutosh.dixit@intel.com>, Michael Ruhl <michael.j.ruhl@intel.com>, Ramalingam C <ramalingam.c@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Refactoring the code for abstracting a wrapper for the mmaped pointer
for a gem object.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 lib/ioctl_wrappers.c | 69 +++++++++++++++++---------------------------
 lib/ioctl_wrappers.h |  1 +
 2 files changed, 28 insertions(+), 42 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 09eb3ce7b57b..d585b4f33210 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -331,13 +331,13 @@ static bool is_cache_coherent(int fd, uint32_t handle)
 	return gem_get_caching(fd, handle) != I915_CACHING_NONE;
 }
 
-static void mmap_write(int fd, uint32_t handle, uint64_t offset,
-		       const void *buf, uint64_t length)
+void *gem_mmap_ptr(int fd, uint32_t handle, uint64_t offset, uint64_t length,
+		   unsigned prot)
 {
 	void *map = NULL;
 
 	if (!length)
-		return;
+		return map;
 
 	if (gem_has_lmem(fd)) {
 		/*
@@ -346,66 +346,51 @@ static void mmap_write(int fd, uint32_t handle, uint64_t offset,
 		 */
 		map = gem_mmap_offset__fixed(fd, handle, 0,
 					     offset + length,
-					     PROT_READ | PROT_WRITE);
+					     prot);
 		igt_assert_eq(gem_wait(fd, handle, 0), 0);
+		if (map)
+			return map;
 	}
 
-	if (!map && is_cache_coherent(fd, handle)) {
+	if (!map && (prot & PROT_READ ? gem_has_llc(fd) : true ||
+	    is_cache_coherent(fd, handle))) {
 		/* offset arg for mmap functions must be 0 */
 		map = __gem_mmap__cpu_coherent(fd, handle, 0, offset + length,
-					       PROT_READ | PROT_WRITE);
-		if (map)
+					       prot);
+		if (map) {
 			gem_set_domain(fd, handle,
-				       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
+				       I915_GEM_DOMAIN_CPU, prot & PROT_WRITE ?
+				       I915_GEM_DOMAIN_CPU : 0);
+			return map;
+		}
 	}
 
 	if (!map) {
 		map = __gem_mmap_offset__wc(fd, handle, 0, offset + length,
-					    PROT_READ | PROT_WRITE);
+					    prot);
 		if (!map)
 			map = gem_mmap__wc(fd, handle, 0, offset + length,
-					   PROT_READ | PROT_WRITE);
+					   prot);
 		gem_set_domain(fd, handle,
-			       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
+			       I915_GEM_DOMAIN_WC, prot & PROT_WRITE ?
+			       I915_GEM_DOMAIN_WC : 0);
 	}
 
+	return map;
+}
+
+static void mmap_write(int fd, uint32_t handle, uint64_t offset,
+		       const void *buf, uint64_t length)
+{
+	void *map = gem_mmap_ptr(fd, handle, offset, length, PROT_READ | PROT_WRITE);
+
 	memcpy(map + offset, buf, length);
 	munmap(map, offset + length);
 }
 
 static void mmap_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
-	void *map = NULL;
-
-	if (!length)
-		return;
-
-	if (gem_has_lmem(fd)) {
-		/*
-		 * set/get_caching and set_domain are no longer supported on
-		 * discrete, also the only supported mmap mode is FIXED.
-		 */
-		map = gem_mmap_offset__fixed(fd, handle, 0,
-					     offset + length, PROT_READ);
-		igt_assert_eq(gem_wait(fd, handle, 0), 0);
-	}
-
-	if (!map && (gem_has_llc(fd) || is_cache_coherent(fd, handle))) {
-		/* offset arg for mmap functions must be 0 */
-		map = __gem_mmap__cpu_coherent(fd, handle, 0,
-					       offset + length, PROT_READ);
-		if (map)
-			gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, 0);
-	}
-
-	if (!map) {
-		map = __gem_mmap_offset__wc(fd, handle, 0, offset + length,
-					    PROT_READ);
-		if (!map)
-			map = gem_mmap__wc(fd, handle, 0, offset + length,
-					   PROT_READ);
-		gem_set_domain(fd, handle, I915_GEM_DOMAIN_WC, 0);
-	}
+	void *map = gem_mmap_ptr(fd, handle, offset, length, PROT_READ);
 
 	igt_memcpy_from_wc(buf, map + offset, length);
 	munmap(map, offset + length);
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 9a897fec2386..7284329d67b8 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -68,6 +68,7 @@ uint32_t gem_get_caching(int fd, uint32_t handle);
 uint32_t gem_flink(int fd, uint32_t handle);
 uint32_t gem_open(int fd, uint32_t name);
 void gem_close(int fd, uint32_t handle);
+void *gem_mmap_ptr(int fd, uint32_t handle, uint64_t offset, uint64_t length, unsigned prot);
 int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length);
 void gem_write(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
 int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
-- 
2.20.1
