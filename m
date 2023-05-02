Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A4B10E1FF
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 06:55:35 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 May 2023 23:55:33 -0700
Message-Id: <20230502065536.3223489-5-matthew.brost@intel.com>
In-Reply-To: <20230502065536.3223489-1-matthew.brost@intel.com>
References: <20230502065536.3223489-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 4/7] xe_vm: Add mmap / munmap sections that
 split large pages
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
 tests/xe/xe_vm.c | 81 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 038a80600..694f829b3 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1236,7 +1236,8 @@ static void *hammer_thread(void *tdata)
 #define MAP_FLAG_USERPTR		(0x1 << 0)
 #define MAP_FLAG_INVALIDATE		(0x1 << 1)
 #define MAP_FLAG_HAMMER_FIRST_PAGE	(0x1 << 2)
-
+#define MAP_FLAG_LARGE_PAGE		(0x1 << 3)
+#define MAP_FLAG_LARGE_PAGE_NO_SPLIT	(0x1 << 4)
 
 /**
  * SUBTEST: munmap-style-unbind-%s
@@ -1288,12 +1289,16 @@ static void *hammer_thread(void *tdata)
  *					userptr inval many either side full
  * @userptr-inval-many-end:		userptr inval many end
  * @userptr-inval-many-front:		userptr inval many front
+ * @either-side-partial-large-page-hammer:
+ *					either side partial large page hammer
+ * @either-side-partial-split-page-hammer:
+ *					either side partial split page hammer
  */
 
 static void
 test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			 int bo_n_pages, int n_binds,
-			 int unbind_n_page_offfset, int unbind_n_pages,
+			 int unbind_n_page_offset, int unbind_n_pages,
 			 unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -1305,7 +1310,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
-	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	uint64_t addr = 0x1a00000, base_addr = 0x1a00000;
 	uint32_t vm;
 	uint32_t engine;
 	size_t bo_size;
@@ -1323,6 +1328,14 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	struct thread_data t;
 	pthread_barrier_t barrier;
 	int exit = 0;
+	int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
+
+	if (flags & MAP_FLAG_LARGE_PAGE) {
+		bo_n_pages *= n_page_per_2mb;
+		unbind_n_pages *= n_page_per_2mb;
+		if (flags & MAP_FLAG_LARGE_PAGE_NO_SPLIT)
+			unbind_n_page_offset *= n_page_per_2mb;
+	}
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo_size = page_size * bo_n_pages;
@@ -1409,7 +1422,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
 	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0,
-			   addr + unbind_n_page_offfset * page_size,
+			   addr + unbind_n_page_offset * page_size,
 			   unbind_n_pages * page_size, sync, 2);
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
@@ -1438,8 +1451,8 @@ try_again_after_invalidate:
 		data = map + i * page_size;
 		addr += page_size;
 
-		if (i < unbind_n_page_offfset ||
-		    i + 1 > unbind_n_page_offfset + unbind_n_pages) {
+		if (i < unbind_n_page_offset ||
+		    i + 1 > unbind_n_page_offset + unbind_n_pages) {
 			b = 0;
 			data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
 			data->batch[b++] = sdi_addr;
@@ -1464,8 +1477,8 @@ try_again_after_invalidate:
 
 	/* Verify all pages still bound written */
 	for (i = 0; i < n_binds; ++i) {
-		if (i < unbind_n_page_offfset ||
-		    i + 1 > unbind_n_page_offfset + unbind_n_pages) {
+		if (i < unbind_n_page_offset ||
+		    i + 1 > unbind_n_page_offset + unbind_n_pages) {
 			data = map + i * page_size;
 			igt_assert_eq(data->data, 0xc0ffee);
 		}
@@ -1494,13 +1507,13 @@ try_again_after_invalidate:
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
@@ -1577,11 +1590,15 @@ try_again_after_invalidate:
  * @userptr-one-partial:		userptr one partial
  * @userptr-either-side-partial:	userptr either side partial
  * @userptr-either-side-full:		userptr either side full
+ * @either-side-partial-large-page-hammer:
+ *					either side partial large page hammer
+ * @either-side-partial-split-page-hammer:
+ *					either side partial split page hammer
  */
 
 static void
 test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
-		     int bo_n_pages, int n_binds, int unbind_n_page_offfset,
+		     int bo_n_pages, int n_binds, int unbind_n_page_offset,
 		     int unbind_n_pages, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -1593,7 +1610,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
-	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	uint64_t addr = 0x1a00000, base_addr = 0x1a00000;
 	uint32_t vm;
 	uint32_t engine;
 	size_t bo_size;
@@ -1610,6 +1627,14 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 	struct thread_data t;
 	pthread_barrier_t barrier;
 	int exit = 0;
+	int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
+
+	if (flags & MAP_FLAG_LARGE_PAGE) {
+		bo_n_pages *= n_page_per_2mb;
+		unbind_n_pages *= n_page_per_2mb;
+		if (flags & MAP_FLAG_LARGE_PAGE_NO_SPLIT)
+			unbind_n_page_offset *= n_page_per_2mb;
+	}
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo_size = page_size * bo_n_pages;
@@ -1704,13 +1729,13 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
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
@@ -1809,7 +1834,7 @@ igt_main
 		const char *name;
 		int bo_n_pages;
 		int n_binds;
-		int unbind_n_page_offfset;
+		int unbind_n_page_offset;
 		int unbind_n_pages;
 		unsigned int flags;
 	} munmap_sections[] = {
@@ -1818,6 +1843,13 @@ igt_main
 		{ "either-side-partial", 4, 2, 1, 2, 0 },
 		{ "either-side-partial-hammer", 4, 2, 1, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
+		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
+			MAP_FLAG_HAMMER_FIRST_PAGE |
+			MAP_FLAG_LARGE_PAGE },
+		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
+			MAP_FLAG_HAMMER_FIRST_PAGE |
+			MAP_FLAG_LARGE_PAGE |
+			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
 		{ "either-side-full", 4, 4, 1, 2, 0 },
 		{ "end", 4, 2, 0, 3, 0 },
 		{ "front", 4, 2, 1, 3, 0 },
@@ -1870,6 +1902,13 @@ igt_main
 		{ "either-side-full", 4, 4, 1, 2, 0 },
 		{ "either-side-partial-hammer", 4, 2, 1, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
+		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
+			MAP_FLAG_HAMMER_FIRST_PAGE |
+			MAP_FLAG_LARGE_PAGE },
+		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
+			MAP_FLAG_HAMMER_FIRST_PAGE |
+			MAP_FLAG_LARGE_PAGE |
+			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
 		{ "end", 4, 2, 0, 3, 0 },
 		{ "front", 4, 2, 1, 3, 0 },
 		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
@@ -2095,7 +2134,7 @@ igt_main
 			test_munmap_style_unbind(fd, hwe_non_copy,
 						 s->bo_n_pages,
 						 s->n_binds,
-						 s->unbind_n_page_offfset,
+						 s->unbind_n_page_offset,
 						 s->unbind_n_pages,
 						 s->flags);
 		}
@@ -2109,7 +2148,7 @@ igt_main
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
