Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55DA10E0E4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 02:32:51 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 19:32:50 -0700
Message-Id: <20230316023250.4115730-5-matthew.brost@intel.com>
In-Reply-To: <20230316023250.4115730-1-matthew.brost@intel.com>
References: <20230316023250.4115730-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/4] xe_vm: Add mmap / munmap sections that split
 large pages
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

Splitting large pages involves using dma-resv slots for ordering, make
sure this works.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_vm.c | 60 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 344ef9d4..9eb6ec4b 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1206,7 +1206,7 @@ static void *hammer_thread(void *tdata)
 #define MAP_FLAG_USERPTR		(0x1 << 0)
 #define MAP_FLAG_INVALIDATE		(0x1 << 1)
 #define MAP_FLAG_HAMMER_FIRST_PAGE	(0x1 << 2)
-
+#define MAP_FLAG_LARGE_PAGE		(0x1 << 3)
 
 /**
  * SUBTEST: munmap-style-unbind-%s
@@ -1263,7 +1263,7 @@ static void *hammer_thread(void *tdata)
 static void
 test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			 int bo_n_pages, int n_binds,
-			 int unbind_n_page_offfset, int unbind_n_pages,
+			 int unbind_n_page_offset, int unbind_n_pages,
 			 unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -1275,7 +1275,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(&sync),
 	};
-	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	uint64_t addr = 0x1a00000, base_addr = 0x1a00000;
 	uint32_t vm;
 	uint32_t engine;
 	size_t bo_size;
@@ -1293,6 +1293,12 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	struct thread_data t;
 	pthread_barrier_t barrier;
 	int exit = 0;
+	int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
+
+	if (flags & MAP_FLAG_LARGE_PAGE) {
+		bo_n_pages *= n_page_per_2mb;
+		unbind_n_pages *= n_page_per_2mb;
+	}
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo_size = page_size * bo_n_pages;
@@ -1379,7 +1385,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
 	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0,
-			   addr + unbind_n_page_offfset * page_size,
+			   addr + unbind_n_page_offset * page_size,
 			   unbind_n_pages * page_size, sync, 2);
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
@@ -1408,8 +1414,8 @@ try_again_after_invalidate:
 		data = map + i * page_size;
 		addr += page_size;
 
-		if (i < unbind_n_page_offfset ||
-		    i + 1 > unbind_n_page_offfset + unbind_n_pages) {
+		if (i < unbind_n_page_offset ||
+		    i + 1 > unbind_n_page_offset + unbind_n_pages) {
 			b = 0;
 			data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
 			data->batch[b++] = sdi_addr;
@@ -1434,8 +1440,8 @@ try_again_after_invalidate:
 
 	/* Verify all pages still bound written */
 	for (i = 0; i < n_binds; ++i) {
-		if (i < unbind_n_page_offfset ||
-		    i + 1 > unbind_n_page_offfset + unbind_n_pages) {
+		if (i < unbind_n_page_offset ||
+		    i + 1 > unbind_n_page_offset + unbind_n_pages) {
 			data = map + i * page_size;
 			igt_assert_eq(data->data, 0xc0ffee);
 		}
@@ -1464,13 +1470,13 @@ try_again_after_invalidate:
 	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
 	if (flags & MAP_FLAG_USERPTR)
 		xe_vm_bind_userptr_async(fd, vm, 0,
-					 addr + unbind_n_page_offfset * page_size,
-					 addr + unbind_n_page_offfset * page_size,
+					 addr + unbind_n_page_offset * page_size,
+					 addr + unbind_n_page_offset * page_size,
 					 unbind_n_pages * page_size, sync, 1);
 	else
 		xe_vm_bind_async(fd, vm, 0, bo,
-				 unbind_n_page_offfset * page_size,
-				 addr + unbind_n_page_offfset * page_size,
+				 unbind_n_page_offset * page_size,
+				 addr + unbind_n_page_offset * page_size,
 				 unbind_n_pages * page_size, sync, 1);
 
 	/* Verify we can use every page */
@@ -1527,7 +1533,7 @@ try_again_after_invalidate:
 
 static void
 test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
-		     int bo_n_pages, int n_binds, int unbind_n_page_offfset,
+		     int bo_n_pages, int n_binds, int unbind_n_page_offset,
 		     int unbind_n_pages, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -1539,7 +1545,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(&sync),
 	};
-	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	uint64_t addr = 0x1a00000, base_addr = 0x1a00000;
 	uint32_t vm;
 	uint32_t engine;
 	size_t bo_size;
@@ -1556,6 +1562,12 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 	struct thread_data t;
 	pthread_barrier_t barrier;
 	int exit = 0;
+	int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
+
+	if (flags & MAP_FLAG_LARGE_PAGE) {
+		bo_n_pages *= n_page_per_2mb;
+		unbind_n_pages *= n_page_per_2mb;
+	}
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo_size = page_size * bo_n_pages;
@@ -1650,13 +1662,13 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
 	if (flags & MAP_FLAG_USERPTR)
 		xe_vm_bind_userptr_async(fd, vm, 0, addr + bo_size +
-					 unbind_n_page_offfset * page_size,
-					 addr + unbind_n_page_offfset * page_size,
+					 unbind_n_page_offset * page_size,
+					 addr + unbind_n_page_offset * page_size,
 					 unbind_n_pages * page_size, sync, 2);
 	else
 		xe_vm_bind_async(fd, vm, 0, bo1,
-				 unbind_n_page_offfset * page_size,
-				 addr + unbind_n_page_offfset * page_size,
+				 unbind_n_page_offset * page_size,
+				 addr + unbind_n_page_offset * page_size,
 				 unbind_n_pages * page_size, sync, 2);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
@@ -1755,7 +1767,7 @@ igt_main
 		const char *name;
 		int bo_n_pages;
 		int n_binds;
-		int unbind_n_page_offfset;
+		int unbind_n_page_offset;
 		int unbind_n_pages;
 		unsigned int flags;
 	} munmap_sections[] = {
@@ -1764,6 +1776,9 @@ igt_main
 		{ "either-side-partial", 4, 2, 1, 2, 0 },
 		{ "either-side-partial-hammer", 4, 2, 1, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
+		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
+			MAP_FLAG_HAMMER_FIRST_PAGE |
+			MAP_FLAG_LARGE_PAGE },
 		{ "either-side-full", 4, 4, 1, 2, 0 },
 		{ "end", 4, 2, 0, 3, 0 },
 		{ "front", 4, 2, 1, 3, 0 },
@@ -1816,6 +1831,9 @@ igt_main
 		{ "either-side-full", 4, 4, 1, 2, 0 },
 		{ "either-side-partial-hammer", 4, 2, 1, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
+		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
+			MAP_FLAG_HAMMER_FIRST_PAGE |
+			MAP_FLAG_LARGE_PAGE },
 		{ "end", 4, 2, 0, 3, 0 },
 		{ "front", 4, 2, 1, 3, 0 },
 		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
@@ -2038,7 +2056,7 @@ igt_main
 			test_munmap_style_unbind(fd, hwe_non_copy,
 						 s->bo_n_pages,
 						 s->n_binds,
-						 s->unbind_n_page_offfset,
+						 s->unbind_n_page_offset,
 						 s->unbind_n_pages,
 						 s->flags);
 		}
@@ -2052,7 +2070,7 @@ igt_main
 			test_mmap_style_bind(fd, hwe_non_copy,
 					     s->bo_n_pages,
 					     s->n_binds,
-					     s->unbind_n_page_offfset,
+					     s->unbind_n_page_offset,
 					     s->unbind_n_pages,
 					     s->flags);
 		}
-- 
2.34.1
