Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2103610E6AB
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 15:16:17 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Jul 2023 16:15:28 +0100
Message-ID: <20230721151528.495893-6-matthew.auld@intel.com>
In-Reply-To: <20230721151528.495893-1-matthew.auld@intel.com>
References: <20230721151528.495893-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 5/5] tests/xe/mmap: sanity check small-bar
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

Some basic sanity checks.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/xe/xe_ioctl.c  | 28 ++++++++++----
 lib/xe/xe_ioctl.h  |  2 +
 tests/xe/xe_mmap.c | 92 +++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 114 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 0b5c7a4fc..f9f722335 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -233,17 +233,31 @@ void xe_vm_destroy(int fd, uint32_t vm)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
 }
 
+uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+			      uint32_t *handle)
+{
+	struct drm_xe_gem_create create = {
+		.vm_id = vm,
+		.size = size,
+		.flags = flags,
+	};
+	int err;
+
+	err = igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create);
+	if (err)
+		return err;
+
+	*handle = create.handle;
+	return 0;
+}
+
 uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
 {
-	struct drm_xe_gem_create create = {
-		.vm_id = vm,
-		.size = size,
-		.flags = flags,
-	};
+	uint32_t handle;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create), 0);
+	igt_assert_eq(__xe_bo_create_flags(fd, vm, size, flags, &handle), 0);
 
-	return create.handle;
+	return handle;
 }
 
 uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 320e0f9f6..f9c3acb4a 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -64,6 +64,8 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t engine,
 			    uint32_t bo, struct drm_xe_sync *sync,
 			    uint32_t num_syncs);
 void xe_vm_destroy(int fd, uint32_t vm);
+uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+			      uint32_t *handle);
 uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags);
 uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
 uint32_t xe_engine_create(int fd, uint32_t vm,
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index b268158ab..8a70a5c35 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -18,14 +18,21 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#include <setjmp.h>
+#include <signal.h>
 #include <string.h>
 
-
 /**
  * SUBTEST: system
  * Description: Test mmap on system memory
  */
 
+/**
+ * SUBTEST: small-bar
+ * Description: Sanity check mmap behaviour on small-bar systems
+ * GPU requirements: GPU needs to have dedicated VRAM and using small-bar
+ */
+
 /**
  * SUBTEST: %s
  * Description: Test mmap on %arg[1] memory
@@ -110,6 +117,83 @@ static void test_bad_object(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, ENOENT);
 }
 
+static jmp_buf jmp;
+
+__noreturn static void sigtrap(int sig)
+{
+	siglongjmp(jmp, sig);
+}
+
+static void trap_sigbus(uint32_t *ptr)
+{
+	sighandler_t old_sigbus;
+
+	old_sigbus = signal(SIGBUS, sigtrap);
+	switch (sigsetjmp(jmp, SIGBUS)) {
+	case SIGBUS:
+		break;
+	case 0:
+		*ptr = 0xdeadbeaf;
+	default:
+		igt_assert(!"reached");
+		break;
+	}
+	signal(SIGBUS, old_sigbus);
+}
+
+/**
+ * SUBTEST: small-bar
+ * Description: Test mmap behaviour on small-bar systems.
+ *
+ */
+static void test_small_bar(int fd)
+{
+	uint32_t visible_size = xe_visible_vram_size(fd, 0);
+	uint32_t bo;
+	uint64_t mmo;
+	uint32_t *map;
+
+	/* 2BIG invalid case */
+	igt_assert_neq(__xe_bo_create_flags(fd, 0, visible_size + 4096,
+					    visible_vram_memory(fd, 0), &bo),
+		       0);
+
+	/* Normal operation */
+	bo = xe_bo_create_flags(fd, 0, visible_size / 4,
+				visible_vram_memory(fd, 0));
+	mmo = xe_bo_mmap_offset(fd, bo);
+	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	map[0] = 0xdeadbeaf;
+
+	munmap(map, 4096);
+	gem_close(fd, bo);
+
+	/* Normal operation with system memory spilling */
+	bo = xe_bo_create_flags(fd, 0, visible_size,
+				visible_vram_memory(fd, 0) |
+				system_memory(fd));
+	mmo = xe_bo_mmap_offset(fd, bo);
+	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	map[0] = 0xdeadbeaf;
+
+	munmap(map, 4096);
+	gem_close(fd, bo);
+
+	/* Bogus operation with SIGBUS */
+	bo = xe_bo_create_flags(fd, 0, visible_size + 4096,
+				vram_memory(fd, 0));
+	mmo = xe_bo_mmap_offset(fd, bo);
+	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	trap_sigbus(map);
+	gem_close(fd, bo);
+}
+
 igt_main
 {
 	int fd;
@@ -135,6 +219,12 @@ igt_main
 	igt_subtest("bad-object")
 		test_bad_object(fd);
 
+	igt_subtest("small-bar") {
+		igt_require(xe_visible_vram_size(fd, 0));
+		igt_require(xe_visible_vram_size(fd, 0) < xe_vram_size(fd, 0));
+		test_small_bar(fd);
+	}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.41.0
