Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECF910E1B6
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 14:58:48 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 07:58:53 -0700
Message-Id: <20230710145856.1864141-2-matthew.brost@intel.com>
In-Reply-To: <20230710145856.1864141-1-matthew.brost@intel.com>
References: <20230710145856.1864141-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/5] xe_vm: MMAP style VM binds section
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

GPUVA added support for this let's test it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_vm.c | 350 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 314 insertions(+), 36 deletions(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 04d6c3956..434bdb332 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1249,9 +1249,9 @@ static void *hammer_thread(void *tdata)
 	return NULL;
 }
 
-#define MUNMAP_FLAG_USERPTR		(0x1 << 0)
-#define MUNMAP_FLAG_INVALIDATE		(0x1 << 1)
-#define MUNMAP_FLAG_HAMMER_FIRST_PAGE	(0x1 << 2)
+#define MAP_FLAG_USERPTR		(0x1 << 0)
+#define MAP_FLAG_INVALIDATE		(0x1 << 1)
+#define MAP_FLAG_HAMMER_FIRST_PAGE	(0x1 << 2)
 
 
 /**
@@ -1344,7 +1344,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo_size = page_size * bo_n_pages;
 
-	if (flags & MUNMAP_FLAG_USERPTR) {
+	if (flags & MAP_FLAG_USERPTR) {
 		map = mmap(from_user_pointer(addr), bo_size, PROT_READ |
 			    PROT_WRITE, MAP_SHARED | MAP_FIXED |
 			    MAP_ANONYMOUS, -1, 0);
@@ -1363,7 +1363,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	/* Do initial binds */
 	bind_size = (page_size * bo_n_pages) / n_binds;
 	for (i = 0; i < n_binds; ++i) {
-		if (flags & MUNMAP_FLAG_USERPTR)
+		if (flags & MAP_FLAG_USERPTR)
 			xe_vm_bind_userptr_async(fd, vm, 0, addr, addr,
 						 bind_size, sync, 1);
 		else
@@ -1378,7 +1378,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	 * cause a fault if a rebind occurs during munmap style VM unbind
 	 * (partial VMAs unbound).
 	 */
-	if (flags & MUNMAP_FLAG_HAMMER_FIRST_PAGE) {
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
 		t.fd = fd;
 		t.vm = vm;
 #define PAGE_SIZE	4096
@@ -1437,7 +1437,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		data = map + i * page_size;
 		igt_assert_eq(data->data, 0xc0ffee);
 	}
-	if (flags & MUNMAP_FLAG_HAMMER_FIRST_PAGE) {
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
 		memset(map, 0, PAGE_SIZE / 2);
 		memset(map + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
 	} else {
@@ -1487,7 +1487,7 @@ try_again_after_invalidate:
 			igt_assert_eq(data->data, 0xc0ffee);
 		}
 	}
-	if (flags & MUNMAP_FLAG_HAMMER_FIRST_PAGE) {
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
 		memset(map, 0, PAGE_SIZE / 2);
 		memset(map + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
 	} else {
@@ -1498,7 +1498,7 @@ try_again_after_invalidate:
 	 * The munmap style VM unbind can create new VMAs, make sure those are
 	 * in the bookkeeping for another rebind after a userptr invalidate.
 	 */
-	if (flags & MUNMAP_FLAG_INVALIDATE && !invalidate++) {
+	if (flags & MAP_FLAG_INVALIDATE && !invalidate++) {
 		map = mmap(from_user_pointer(addr), bo_size, PROT_READ |
 			    PROT_WRITE, MAP_SHARED | MAP_FIXED |
 			    MAP_ANONYMOUS, -1, 0);
@@ -1509,7 +1509,7 @@ try_again_after_invalidate:
 	/* Confirm unbound region can be rebound */
 	syncobj_reset(fd, &sync[0].handle, 1);
 	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
-	if (flags & MUNMAP_FLAG_USERPTR)
+	if (flags & MAP_FLAG_USERPTR)
 		xe_vm_bind_userptr_async(fd, vm, 0,
 					 addr + unbind_n_page_offfset * page_size,
 					 addr + unbind_n_page_offfset * page_size,
@@ -1557,7 +1557,7 @@ try_again_after_invalidate:
 		igt_assert_eq(data->data, 0xc0ffee);
 	}
 
-	if (flags & MUNMAP_FLAG_HAMMER_FIRST_PAGE) {
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
 		exit = 1;
 		pthread_join(t.thread, NULL);
 		pthread_barrier_destroy(&barrier);
@@ -1572,6 +1572,251 @@ try_again_after_invalidate:
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: mmap-style-bind-%s
+ * Description: Test mmap style unbind with %arg[1]
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * arg[1]:
+ *
+ * @all:				all
+ * @one-partial:			one partial
+ * @either-side-partial:		either side partial
+ * @either-side-full:			either side full
+ * @either-side-partial-hammer:		either side partial hammer
+ * @end:				end
+ * @front:				front
+ * @many-all:				many all
+ * @many-either-side-partial:		many either side partial
+ * @many-either-side-partial-hammer:	many either side partial hammer
+ * @userptr-all:			userptr all
+ * @userptr-one-partial:		userptr one partial
+ * @userptr-either-side-partial:	userptr either side partial
+ * @userptr-either-side-full:		userptr either side full
+ */
+
+static void
+test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
+		     int bo_n_pages, int n_binds, int unbind_n_page_offfset,
+		     int unbind_n_pages, unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	uint32_t vm;
+	uint32_t engine;
+	size_t bo_size;
+	uint32_t bo0 = 0, bo1 = 0;
+	uint64_t bind_size;
+	uint64_t page_size = xe_get_default_alignment(fd);
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	void *map0, *map1;
+	int i, b;
+	struct thread_data t;
+	pthread_barrier_t barrier;
+	int exit = 0;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = page_size * bo_n_pages;
+
+	if (flags & MAP_FLAG_USERPTR) {
+		map0 = mmap(from_user_pointer(addr), bo_size, PROT_READ |
+			    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+			    MAP_ANONYMOUS, -1, 0);
+		map1 = mmap(from_user_pointer(addr + bo_size),
+			    bo_size, PROT_READ | PROT_WRITE, MAP_SHARED |
+			    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+		igt_assert(map0 != MAP_FAILED);
+		igt_assert(map1 != MAP_FAILED);
+	} else {
+		bo0 = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+		map0 = xe_bo_map(fd, bo0, bo_size);
+		bo1 = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+		map1 = xe_bo_map(fd, bo1, bo_size);
+	}
+	memset(map0, 0, bo_size);
+	memset(map1, 0, bo_size);
+
+	engine = xe_engine_create(fd, vm, eci, 0);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[1].handle = syncobj_create(fd, 0);
+
+	/* Do initial binds */
+	bind_size = (page_size * bo_n_pages) / n_binds;
+	for (i = 0; i < n_binds; ++i) {
+		if (flags & MAP_FLAG_USERPTR)
+			xe_vm_bind_userptr_async(fd, vm, 0, addr, addr,
+						 bind_size, sync, 1);
+		else
+			xe_vm_bind_async(fd, vm, 0, bo0, i * bind_size,
+					 addr, bind_size, sync, 1);
+		addr += bind_size;
+	}
+	addr = base_addr;
+
+	/*
+	 * Kick a thread to write the first page continously to ensure we can't
+	 * cause a fault if a rebind occurs during munmap style VM unbind
+	 * (partial VMAs unbound).
+	 */
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
+		t.fd = fd;
+		t.vm = vm;
+#define PAGE_SIZE	4096
+		t.addr = addr + PAGE_SIZE / 2;
+		t.eci = eci;
+		t.exit = &exit;
+		t.map = map0 + PAGE_SIZE / 2;
+		t.barrier = &barrier;
+		pthread_barrier_init(&barrier, NULL, 2);
+		pthread_create(&t.thread, 0, hammer_thread, &t);
+		pthread_barrier_wait(&barrier);
+	}
+
+	/* Verify we can use every page */
+	for (i = 0; i < n_binds; ++i) {
+		uint64_t batch_offset = (char *)&data->batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data->data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		data = map0 + i * page_size;
+
+		b = 0;
+		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data->batch[b++] = sdi_addr;
+		data->batch[b++] = sdi_addr >> 32;
+		data->batch[b++] = 0xc0ffee;
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		if (i)
+			syncobj_reset(fd, &sync[1].handle, 1);
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+
+		exec.engine_id = engine;
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+
+		addr += page_size;
+	}
+	addr = base_addr;
+
+	/* Bind some of the pages to different BO / userptr */
+	syncobj_reset(fd, &sync[0].handle, 1);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
+	if (flags & MAP_FLAG_USERPTR)
+		xe_vm_bind_userptr_async(fd, vm, 0, addr + bo_size +
+					 unbind_n_page_offfset * page_size,
+					 addr + unbind_n_page_offfset * page_size,
+					 unbind_n_pages * page_size, sync, 2);
+	else
+		xe_vm_bind_async(fd, vm, 0, bo1,
+				 unbind_n_page_offfset * page_size,
+				 addr + unbind_n_page_offfset * page_size,
+				 unbind_n_pages * page_size, sync, 2);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+	/* Verify all pages written */
+	for (i = 0; i < n_binds; ++i) {
+		data = map0 + i * page_size;
+		igt_assert_eq(data->data, 0xc0ffee);
+	}
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
+		memset(map0, 0, PAGE_SIZE / 2);
+		memset(map0 + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
+	} else {
+		memset(map0, 0, bo_size);
+		memset(map1, 0, bo_size);
+	}
+
+	/* Verify we can use every page */
+	for (i = 0; i < n_binds; ++i) {
+		uint64_t batch_offset = (char *)&data->batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data->data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+
+		data = map0 + i * page_size;
+		b = 0;
+		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data->batch[b++] = sdi_addr;
+		data->batch[b++] = sdi_addr >> 32;
+		data->batch[b++] = 0xc0ffee;
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		data = map1 + i * page_size;
+		b = 0;
+		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data->batch[b++] = sdi_addr;
+		data->batch[b++] = sdi_addr >> 32;
+		data->batch[b++] = 0xc0ffee;
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		if (i)
+			syncobj_reset(fd, &sync[1].handle, 1);
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+
+		exec.engine_id = engine;
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+
+		addr += page_size;
+	}
+	addr = base_addr;
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
+
+	/* Verify all pages written */
+	for (i = 0; i < n_binds; ++i) {
+		uint32_t result = 0;
+
+		data = map0 + i * page_size;
+		result |= data->data;
+
+		data = map1 + i * page_size;
+		result |= data->data;
+
+		igt_assert_eq(result, 0xc0ffee);
+	}
+
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
+		exit = 1;
+		pthread_join(t.thread, NULL);
+		pthread_barrier_destroy(&barrier);
+	}
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, sync[1].handle);
+	xe_engine_destroy(fd, engine);
+	munmap(map0, bo_size);
+	munmap(map1, bo_size);
+	if (bo0)
+		gem_close(fd, bo0);
+	if (bo1)
+		gem_close(fd, bo1);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -1584,55 +1829,74 @@ igt_main
 		int unbind_n_page_offfset;
 		int unbind_n_pages;
 		unsigned int flags;
-	} sections[] = {
+	} munmap_sections[] = {
 		{ "all", 4, 2, 0, 4, 0 },
 		{ "one-partial", 4, 1, 1, 2, 0 },
 		{ "either-side-partial", 4, 2, 1, 2, 0 },
 		{ "either-side-partial-hammer", 4, 2, 1, 2,
-			MUNMAP_FLAG_HAMMER_FIRST_PAGE },
+			MAP_FLAG_HAMMER_FIRST_PAGE },
 		{ "either-side-full", 4, 4, 1, 2, 0 },
 		{ "end", 4, 2, 0, 3, 0 },
 		{ "front", 4, 2, 1, 3, 0 },
 		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
 		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
 		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
-			MUNMAP_FLAG_HAMMER_FIRST_PAGE },
+			MAP_FLAG_HAMMER_FIRST_PAGE },
 		{ "many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8, 0 },
 		{ "many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2, 0 },
 		{ "many-front", 4 * 8, 4, 1 * 8 - 2, 3 * 8 + 2, 0 },
-		{ "userptr-all", 4, 2, 0, 4, MUNMAP_FLAG_USERPTR },
-		{ "userptr-one-partial", 4, 1, 1, 2, MUNMAP_FLAG_USERPTR },
+		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
+		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
 		{ "userptr-either-side-partial", 4, 2, 1, 2,
-			MUNMAP_FLAG_USERPTR },
+			MAP_FLAG_USERPTR },
 		{ "userptr-either-side-full", 4, 4, 1, 2,
-			MUNMAP_FLAG_USERPTR },
-		{ "userptr-end", 4, 2, 0, 3, MUNMAP_FLAG_USERPTR },
-		{ "userptr-front", 4, 2, 1, 3, MUNMAP_FLAG_USERPTR },
+			MAP_FLAG_USERPTR },
+		{ "userptr-end", 4, 2, 0, 3, MAP_FLAG_USERPTR },
+		{ "userptr-front", 4, 2, 1, 3, MAP_FLAG_USERPTR },
 		{ "userptr-many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8,
-			MUNMAP_FLAG_USERPTR },
+			MAP_FLAG_USERPTR },
 		{ "userptr-many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8,
-			MUNMAP_FLAG_USERPTR },
+			MAP_FLAG_USERPTR },
 		{ "userptr-many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2,
-			MUNMAP_FLAG_USERPTR },
+			MAP_FLAG_USERPTR },
 		{ "userptr-many-front", 4 * 8, 4, 1 * 8 - 2, 3 * 8 + 2,
-			MUNMAP_FLAG_USERPTR },
+			MAP_FLAG_USERPTR },
 		{ "userptr-inval-either-side-full", 4, 4, 1, 2,
-			MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
-		{ "userptr-inval-end", 4, 2, 0, 3, MUNMAP_FLAG_USERPTR |
-			MUNMAP_FLAG_INVALIDATE },
-		{ "userptr-inval-front", 4, 2, 1, 3, MUNMAP_FLAG_USERPTR |
-			MUNMAP_FLAG_INVALIDATE },
+			MAP_FLAG_USERPTR | MAP_FLAG_INVALIDATE },
+		{ "userptr-inval-end", 4, 2, 0, 3, MAP_FLAG_USERPTR |
+			MAP_FLAG_INVALIDATE },
+		{ "userptr-inval-front", 4, 2, 1, 3, MAP_FLAG_USERPTR |
+			MAP_FLAG_INVALIDATE },
 		{ "userptr-inval-many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8,
-			MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+			MAP_FLAG_USERPTR | MAP_FLAG_INVALIDATE },
 		{ "userptr-inval-many-either-side-partial", 4 * 8, 2 * 8, 1,
-			4 * 8 - 2, MUNMAP_FLAG_USERPTR |
-				MUNMAP_FLAG_INVALIDATE },
+			4 * 8 - 2, MAP_FLAG_USERPTR |
+				MAP_FLAG_INVALIDATE },
 		{ "userptr-inval-many-either-side-full", 4 * 8, 4 * 8, 1 * 8,
-			2 * 8, MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+			2 * 8, MAP_FLAG_USERPTR | MAP_FLAG_INVALIDATE },
 		{ "userptr-inval-many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2,
-			MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+			MAP_FLAG_USERPTR | MAP_FLAG_INVALIDATE },
 		{ "userptr-inval-many-front", 4 * 8, 4, 1 * 8 - 2, 3 * 8 + 2,
-			MUNMAP_FLAG_USERPTR | MUNMAP_FLAG_INVALIDATE },
+			MAP_FLAG_USERPTR | MAP_FLAG_INVALIDATE },
+		{ NULL },
+	};
+	const struct section mmap_sections[] = {
+		{ "all", 4, 2, 0, 4, 0 },
+		{ "one-partial", 4, 1, 1, 2, 0 },
+		{ "either-side-partial", 4, 2, 1, 2, 0 },
+		{ "either-side-full", 4, 4, 1, 2, 0 },
+		{ "either-side-partial-hammer", 4, 2, 1, 2,
+			MAP_FLAG_HAMMER_FIRST_PAGE },
+		{ "end", 4, 2, 0, 3, 0 },
+		{ "front", 4, 2, 1, 3, 0 },
+		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
+		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
+		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
+			MAP_FLAG_HAMMER_FIRST_PAGE },
+		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
+		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
+		{ "userptr-either-side-partial", 4, 2, 1, 2, MAP_FLAG_USERPTR },
+		{ "userptr-either-side-full", 4, 4, 1, 2, MAP_FLAG_USERPTR },
 		{ NULL },
 	};
 
@@ -1839,7 +2103,7 @@ igt_main
 			break;
 		}
 
-	for (const struct section *s = sections; s->name; s++) {
+	for (const struct section *s = munmap_sections; s->name; s++) {
 		igt_subtest_f("munmap-style-unbind-%s", s->name) {
 			igt_require_f(hwe_non_copy,
 				      "Requires non-copy engine to run\n");
@@ -1853,6 +2117,20 @@ igt_main
 		}
 	}
 
+	for (const struct section *s = mmap_sections; s->name; s++) {
+		igt_subtest_f("mmap-style-bind-%s", s->name) {
+			igt_require_f(hwe_non_copy,
+				      "Requires non-copy engine to run\n");
+
+			test_mmap_style_bind(fd, hwe_non_copy,
+					     s->bo_n_pages,
+					     s->n_binds,
+					     s->unbind_n_page_offfset,
+					     s->unbind_n_pages,
+					     s->flags);
+		}
+	}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1
