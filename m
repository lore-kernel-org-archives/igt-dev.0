Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C2510EA1A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 16:03:07 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 16:02:26 +0000
Message-ID: <20231103160237.405122-5-matthew.auld@intel.com>
In-Reply-To: <20231103160237.405122-1-matthew.auld@intel.com>
References: <20231103160237.405122-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 04/15] lib/xe: support explicit
 cpu_caching gem_create
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

Most tests shouldn't about such things, so likely it's just a case of
picking the most sane default. However we also add some helpers for the
tests that do care.

v2: Rebase on coh_mode removal

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/xe/xe_ioctl.c       | 55 ++++++++++++++++++++++++++++++++---------
 lib/xe/xe_ioctl.h       |  5 ++++
 tests/intel/xe_create.c |  1 +
 3 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 895e3bd4e..9010380c3 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -226,13 +226,24 @@ void xe_vm_destroy(int fd, uint32_t vm)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
 }
 
-uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
-			      uint32_t *handle)
+uint16_t __xe_default_cpu_caching_from_flags(int fd, uint32_t flags)
+{
+	if ((flags & all_memory_regions(fd)) != system_memory(fd) ||
+	    flags & XE_GEM_CREATE_FLAG_SCANOUT)
+		/* VRAM placements or scanout should always use WC */
+		return DRM_XE_GEM_CPU_CACHING_WC;
+
+	return DRM_XE_GEM_CPU_CACHING_WB;
+}
+
+static uint32_t ___xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+				      uint16_t cpu_caching, uint32_t *handle)
 {
 	struct drm_xe_gem_create create = {
 		.vm_id = vm,
 		.size = size,
 		.flags = flags,
+		.cpu_caching = cpu_caching,
 	};
 	int err;
 
@@ -242,6 +253,15 @@ uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags
 
 	*handle = create.handle;
 	return 0;
+
+}
+
+uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+			      uint32_t *handle)
+{
+	uint16_t cpu_caching = __xe_default_cpu_caching_from_flags(fd, flags);
+
+	return ___xe_bo_create_flags(fd, vm, size, flags, cpu_caching, handle);
 }
 
 uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
@@ -253,19 +273,32 @@ uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
 	return handle;
 }
 
+uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+				uint16_t cpu_caching, uint32_t *handle)
+{
+	return ___xe_bo_create_flags(fd, vm, size, flags, cpu_caching,
+				     handle);
+}
+
+uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+			      uint16_t cpu_caching)
+{
+	uint32_t handle;
+
+	igt_assert_eq(__xe_bo_create_caching(fd, vm, size, flags,
+					     cpu_caching, &handle), 0);
+
+	return handle;
+}
+
 uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
 {
-	struct drm_xe_gem_create create = {
-		.vm_id = vm,
-		.size = size,
-		.flags = vram_if_possible(fd, gt),
-	};
-	int err;
+	uint32_t handle;
 
-	err = igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create);
-	igt_assert_eq(err, 0);
+	igt_assert_eq(__xe_bo_create_flags(fd, vm, size, vram_if_possible(fd, gt),
+					   &handle), 0);
 
-	return create.handle;
+	return handle;
 }
 
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async)
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index a8dbcf376..3681a6977 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -67,6 +67,11 @@ void xe_vm_destroy(int fd, uint32_t vm);
 uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 			      uint32_t *handle);
 uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags);
+uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+				uint16_t cpu_caching, uint32_t *handle);
+uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+			      uint16_t cpu_caching);
+uint16_t __xe_default_cpu_caching_from_flags(int fd, uint32_t flags);
 uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
 uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  struct drm_xe_engine_class_instance *instance,
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d99bd51cf..587df2dfc 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -25,6 +25,7 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 		.vm_id = vm,
 		.size = size,
 		.flags = flags,
+		.cpu_caching = __xe_default_cpu_caching_from_flags(fd, flags),
 	};
 	int ret = 0;
 
-- 
2.41.0
