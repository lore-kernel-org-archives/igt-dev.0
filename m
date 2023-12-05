Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8B110E608
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 20:42:05 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Dec 2023 12:42:16 -0800
Message-Id: <20231205204217.322849-2-matthew.brost@intel.com>
In-Reply-To: <20231205204217.322849-1-matthew.brost@intel.com>
References: <20231205204217.322849-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] xe_vm: Add section to test zero number of VM
 binds
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

Verify the bind queue ordering works wrt out-sync signaling when zero
number of binds passed to VM bind IOCTL.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_ioctl.c   | 13 ++++++++++
 lib/xe/xe_ioctl.h   |  2 ++
 tests/intel/xe_vm.c | 63 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index c91bf25c49..761e91eb3a 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -164,6 +164,19 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			    num_syncs, 0, 0);
 }
 
+void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t exec_queue,
+		     struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.exec_queue_id = exec_queue,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
+}
+
 void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			    uint64_t offset, uint64_t addr, uint64_t size,
 			    struct drm_xe_sync *sync, uint32_t num_syncs,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 32b34b15a3..a302418544 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -38,6 +38,8 @@ void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue,
 void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		      uint64_t offset, uint64_t addr, uint64_t size,
 		      struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t exec_queue,
+		     struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t exec_queue,
 			      uint64_t userptr, uint64_t addr, uint64_t size,
 			      struct drm_xe_sync *sync, uint32_t num_syncs);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fb65793d11..62bf950504 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -730,6 +730,63 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: zero-binds
+ * Description: Test zero binds in IOCTL
+ * Functionality: bind engines
+ * Run type: BAT
+ */
+
+static void test_zero_binds(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[1] = {
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct xe_cork cork;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	bo_size = ALIGN(xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	xe_cork_init(fd, eci, &cork);
+	xe_cork_wait_started(&cork);
+
+	/* Initial bind behind cork */
+	sync[0].handle = cork.syncobj;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	/* Bind /w num_binds == 0 */
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_bind_zero(fd, vm, 0, sync, 1);
+
+	/* Let jobs runs for a bit */
+	usleep(100000);
+
+	/* both binds are waiting */
+	igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
+
+	/* Release cork */
+	xe_cork_end(&cork);
+	xe_cork_wait_done(&cork);
+	xe_cork_fini(&cork);
+
+	/* both binds are done */
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
 
 
@@ -1917,6 +1974,12 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_bind_execqueues_independent(fd, hwe, CONFLICT);
 
+	igt_subtest("zero-binds")
+		xe_for_each_engine(fd, hwe) {
+			test_zero_binds(fd, hwe);
+			break;
+		}
+
 	igt_subtest("bind-array-twice")
 		xe_for_each_engine(fd, hwe)
 			test_bind_array(fd, hwe, 2, 0);
-- 
2.34.1
