Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D376F10E9D6
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 07:19:25 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t] intel/xe_exec_store.c: Fix the execution of basic-all
 test
Date: Fri,  8 Dec 2023 12:47:43 +0530
Message-Id: <20231208071743.17473-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Implement xe_for_each_engine in basic-all test, it queries
all the supported classes and instances for a gt and submits
workload to it. which fixes the num_placements issue.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_store.c | 126 +++++++-----------------------------
 1 file changed, 25 insertions(+), 101 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index dec8546a3..88ee69a63 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -51,8 +51,13 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 /**
  * SUBTEST: basic-store
  * Description: Basic test to verify store dword.
+ * Test category: functionality test
+ *
+ * SUBTEST: basic-all
+ * Description: Test to verify store dword on all available engines.
+ * Test category: functionality test
  */
-static void store(int fd)
+static void store(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
@@ -64,9 +69,9 @@ static void store(int fd)
 		.syncs = to_user_pointer(&sync),
 	};
 	struct data *data;
-	struct drm_xe_engine *engine;
 	uint32_t vm;
 	uint32_t exec_queue;
+	uint32_t bind_engine;
 	uint32_t syncobj;
 	size_t bo_size;
 	int value = 0x123456;
@@ -81,16 +86,17 @@ static void store(int fd)
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	engine = xe_engine(fd, 1);
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, engine->instance.gt_id),
+			  vram_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, &sync, 1);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	bind_engine = xe_bind_exec_queue_create(fd, vm, 0, true);
+	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
 	store_dword_batch(data, addr, value);
 
-	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	exec.exec_queue_id = exec_queue;
 	exec.address = data->addr;
 	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
@@ -206,112 +212,30 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 }
 
-/**
- * SUBTEST: basic-all
- * Description: Test to verify store dword on all available engines.
- */
-static void store_all(int fd, int gt, int class)
-{
-	struct drm_xe_sync sync[2] = {
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
-	};
-	struct drm_xe_exec exec = {
-		.num_batch_buffer = 1,
-		.num_syncs = 2,
-		.syncs = to_user_pointer(&sync),
-	};
-
-	struct data *data;
-	uint32_t syncobjs[MAX_INSTANCE];
-	uint32_t exec_queues[MAX_INSTANCE];
-	uint32_t vm;
-	size_t bo_size;
-	uint64_t addr = 0x100000;
-	uint32_t bo = 0;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
-	struct drm_xe_engine_class_instance *hwe;
-	int i, num_placements = 0;
-
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo_size = sizeof(*data);
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
-
-	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, 0),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	data = xe_bo_map(fd, bo, bo_size);
-
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
-			continue;
-		eci[num_placements++] = *hwe;
-	}
-
-	igt_require(num_placements);
-
-	for (i = 0; i < num_placements; i++) {
-		struct drm_xe_exec_queue_create create = {
-			.vm_id = vm,
-			.width = 1,
-			.num_placements = num_placements,
-			.instances = to_user_pointer(eci),
-		};
-
-		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
-					&create), 0);
-		exec_queues[i] = create.exec_queue_id;
-		syncobjs[i] = syncobj_create(fd, 0);
-	};
-
-	sync[0].handle = syncobj_create(fd, 0);
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
-
-	for (i = 0; i < num_placements; i++) {
-
-		store_dword_batch(data, addr, i);
-		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].handle = syncobjs[i];
-
-		exec.exec_queue_id = exec_queues[i];
-		exec.address = data->addr;
-		xe_exec(fd, &exec);
-
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
-		igt_assert_eq(data->data, i);
-	}
-
-	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	syncobj_destroy(fd, sync[0].handle);
-	munmap(data, bo_size);
-	gem_close(fd, bo);
-
-	for (i = 0; i < num_placements; i++) {
-		syncobj_destroy(fd, syncobjs[i]);
-		xe_exec_queue_destroy(fd, exec_queues[i]);
-	}
-	xe_vm_destroy(fd, vm);
-}
-
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
-	int fd, class, gt;
+	struct drm_xe_engine *engine;
+	int fd, i = 0;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
 	}
 
-	igt_subtest("basic-store")
-		store(fd);
+	igt_subtest("basic-store") {
+		engine = xe_engine(fd, 1);
+		store(fd, &engine->instance);
+	}
 
 	igt_subtest("basic-all") {
-		xe_for_each_gt(fd, gt)
-			xe_for_each_engine_class(class)
-				store_all(fd, gt, class);
+		xe_for_each_engine(fd, hwe) {
+			igt_info("engine %d: %s, engine instance: %d, tile: TILE-%d\n", i++,
+					xe_engine_class_string(hwe->engine_class),
+							       hwe->engine_instance,
+							       hwe->gt_id);
+			store(fd, hwe);
+		}
 	}
 
 	igt_subtest("cachelines")
-- 
2.39.1
