Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE61E10E13D
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 10:21:49 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Thu,  2 Nov 2023 15:51:44 +0530
Message-Id: <20231102102144.31460-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_store: Add cachelines
 and page-sized subtests
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

Intension of these subtests is to verify that each capable engine can store a
dword to different cachelines/pages of a buffer object.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_store.c | 107 ++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 90684b8cb..d393da224 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -105,6 +105,104 @@ static void store(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+#define PAGES 1
+#define NCACHELINES (4096/64)
+/**
+ * SUBTEST: %s
+ * Description: Verify that each capable engine can store a dword to different
+ * 		%arg[1] of a buffer object.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cachelines: cachelines
+ * @page-sized: page-sized
+ */
+static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, }
+	};
+
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+
+	int count = flags & PAGES ? NCACHELINES + 1 : 2;
+	int i, object_index, b = 0;
+	uint64_t dst_offset[count];
+	uint32_t exec_queues, vm, syncobjs;
+	uint32_t bo[count], *bo_map[count];
+	uint32_t value[NCACHELINES], *ptr[NCACHELINES], delta;
+	uint64_t offset[NCACHELINES];
+	uint64_t ahnd;
+	uint32_t *batch_map;
+	size_t bo_size = 4096;
+
+	bo_size = ALIGN(bo_size , xe_get_default_alignment(fd));
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
+	syncobjs = syncobj_create(fd, 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	for (i = 0; i < count; i++) {
+		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
+					       visible_vram_if_possible(fd, eci->gt_id));
+		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
+		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
+								    bo_size, 0,
+								    ALLOC_STRATEGY_LOW_TO_HIGH);
+		xe_vm_bind_async(fd, vm, eci->gt_id, bo[i], 0, dst_offset[i], bo_size, sync, 1);
+	}
+
+	batch_map = xe_bo_map(fd, bo[i-1], bo_size);
+	exec.address = dst_offset[i-1];
+
+	for (unsigned n = 0; n < NCACHELINES; n++) {
+		delta = 4 * (n * 16 + n % 16);
+		value[n] = n | ~n << 16;
+		offset[n] = dst_offset[n % (count - 1)] + delta;
+
+		batch_map[b++] = MI_STORE_DWORD_IMM_GEN4;
+		batch_map[b++] = offset[n];
+		batch_map[b++] = offset[n] >> 32;
+		batch_map[b++] = value[n];
+	}
+	batch_map[b++] = MI_BATCH_BUFFER_END;
+	sync[0].flags &= DRM_XE_SYNC_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[1].handle = syncobjs;
+	exec.exec_queue_id = exec_queues;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
+
+	for (unsigned n = 0; n < NCACHELINES; n++) {
+		delta = 4 * (n * 16 + n % 16);
+		value[n] = n | ~n << 16;
+		object_index = n % (count - 1);
+		ptr[n]  = bo_map[object_index] + delta / 4;
+
+		igt_assert(*ptr[n] == value[n]);
+	}
+
+	for ( i = 0; i < count; i++) {
+		munmap(bo_map[i], bo_size);
+		xe_vm_unbind_async(fd, vm, 0, 0, dst_offset[i], bo_size, sync, 1);
+		gem_close(fd, bo[i]);
+	}
+
+	munmap(batch_map, bo_size);
+	put_ahnd(ahnd);
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobjs);
+	xe_exec_queue_destroy(fd, exec_queues);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: basic-all
  * Description: Test to verify store dword on all available engines.
@@ -195,6 +293,7 @@ static void store_all(int fd, int gt, int class)
 
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe;
 	int fd, class, gt;
 
 	igt_fixture {
@@ -211,6 +310,14 @@ igt_main
 				store_all(fd, gt, class);
 	}
 
+	igt_subtest("cachelines")
+		xe_for_each_hw_engine(fd, hwe)
+			store_cachelines(fd, hwe, 0);
+
+	igt_subtest("page-sized")
+		xe_for_each_hw_engine(fd, hwe)
+			store_cachelines(fd, hwe, PAGES);
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.39.1
