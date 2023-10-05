Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  5 Oct 2023 16:31:08 +0100
Message-ID: <20231005153116.452319-5-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/12] lib/xe: support cpu_caching and
 coh_mod for gem_create
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Most tests shouldn't about such things, so likely it's just a case of
picking the most sane default. However we also add some helpers for the
tests that do care.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/xe/xe_ioctl.c       | 65 ++++++++++++++++++++++++++++++++++-------
 lib/xe/xe_ioctl.h       |  8 +++++
 tests/intel/xe_create.c |  3 ++
 3 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 730dcfd16..80696aa59 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -233,13 +233,30 @@ void xe_vm_destroy(int fd, uint32_t vm)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
 }
 
-uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
-			      uint32_t *handle)
+void __xe_default_coh_caching_from_flags(int fd, uint32_t flags,
+					 uint16_t *cpu_caching,
+					 uint16_t *coh_mode)
+{
+	if ((flags & all_memory_regions(fd)) != system_memory(fd) ||
+	    flags & XE_GEM_CREATE_FLAG_SCANOUT) {
+		/* VRAM placements or scanout should always use WC */
+		*cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+		*coh_mode = DRM_XE_GEM_COH_NONE;
+	} else {
+		*cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
+		*coh_mode = DRM_XE_GEM_COH_AT_LEAST_1WAY;
+	}
+}
+
+static uint32_t ___xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+				      uint16_t cpu_caching, uint16_t coh_mode, uint32_t *handle)
 {
 	struct drm_xe_gem_create create = {
 		.vm_id = vm,
 		.size = size,
 		.flags = flags,
+		.cpu_caching = cpu_caching,
+		.coh_mode = coh_mode,
 	};
 	int err;
 
@@ -249,6 +266,18 @@ uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags
 
 	*handle = create.handle;
 	return 0;
+
+}
+
+uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+			      uint32_t *handle)
+{
+	uint16_t cpu_caching, coh_mode;
+
+	__xe_default_coh_caching_from_flags(fd, flags, &cpu_caching, &coh_mode);
+
+	return ___xe_bo_create_flags(fd, vm, size, flags, cpu_caching, coh_mode,
+				     handle);
 }
 
 uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
@@ -260,19 +289,33 @@ uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
 	return handle;
 }
 
+uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+				uint16_t cpu_caching, uint16_t coh_mode,
+				uint32_t *handle)
+{
+	return ___xe_bo_create_flags(fd, vm, size, flags, cpu_caching, coh_mode,
+				     handle);
+}
+
+uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+			      uint16_t cpu_caching, uint16_t coh_mode)
+{
+	uint32_t handle;
+
+	igt_assert_eq(__xe_bo_create_caching(fd, vm, size, flags,
+					     cpu_caching, coh_mode, &handle), 0);
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
 
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext)
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 6c281b3bf..c18fc878c 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -67,6 +67,14 @@ void xe_vm_destroy(int fd, uint32_t vm);
 uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 			      uint32_t *handle);
 uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags);
+uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+				uint16_t cpu_caching, uint16_t coh_mode,
+				uint32_t *handle);
+uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+			      uint16_t cpu_caching, uint16_t coh_mode);
+void __xe_default_coh_caching_from_flags(int fd, uint32_t flags,
+					 uint16_t *cpu_caching,
+					 uint16_t *coh_mode);
 uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
 uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  struct drm_xe_engine_class_instance *instance,
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 8d845e5c8..f5d2cc1b2 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -30,6 +30,9 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 
 	igt_assert(handlep);
 
+	__xe_default_coh_caching_from_flags(fd, flags, &create.cpu_caching,
+					    &create.coh_mode);
+
 	if (igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create)) {
 		ret = -errno;
 		errno = 0;
-- 
2.41.0
