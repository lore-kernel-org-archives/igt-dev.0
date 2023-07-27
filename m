Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E121310E0B0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 01:21:40 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 18:21:34 -0700
Message-Id: <20230727012136.456190-3-matthew.brost@intel.com>
In-Reply-To: <20230727012136.456190-1-matthew.brost@intel.com>
References: <20230727012136.456190-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/4] xe_vm: Add section to test zero number of VM
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
 lib/xe/xe_ioctl.c | 21 ++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 tests/xe/xe_vm.c  | 62 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 57c4873fe6..2d3ad00c60 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -159,6 +159,27 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
 			    num_syncs, 0, 0);
 }
 
+void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t engine,
+		     struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.extensions = 0,
+		.vm_id = vm,
+		.num_binds = 0,
+		.bind.obj = 0,
+		.bind.obj_offset = 0,
+		.bind.range = 0,
+		.bind.addr = 0,
+		.bind.op = 0,
+		.bind.region = 0,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.engine_id = engine,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
+}
+
 void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
 			    uint64_t offset, uint64_t addr, uint64_t size,
 			    struct drm_xe_sync *sync, uint32_t num_syncs,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 7c220b1034..5c4b4f21ab 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -38,6 +38,8 @@ void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t engine,
 void xe_vm_bind_async(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
 		      uint64_t offset, uint64_t addr, uint64_t size,
 		      struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_vm_bind_zero(int fd, uint32_t vm, uint32_t engine,
+		     struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t engine,
 			      uint64_t userptr, uint64_t addr, uint64_t size,
 			      struct drm_xe_sync *sync, uint32_t num_syncs);
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index f2bd56855f..6ffe756676 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -753,6 +753,62 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci,
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
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct xe_cork cork;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_DEFAULT, 0);
+	bo_size = ALIGN(xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
+
+	xe_cork_init(fd, eci, &cork);
+	xe_cork_wait_started(&cork);
+
+	/* Initial bind behind cork */
+	sync[0].handle = cork.syncobj;
+	sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	/* Bind /w num_binds == 0 */
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
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
 #define BIND_ARRAY_BIND_ENGINE_FLAG	(0x1 << 0)
 
 
@@ -1937,6 +1993,12 @@ igt_main
 		xe_for_each_hw_engine(fd, hwe)
 			test_bind_engines_independent(fd, hwe, CONFLICT);
 
+	igt_subtest("zero-binds")
+		xe_for_each_hw_engine(fd, hwe) {
+			test_zero_binds(fd, hwe);
+			break;
+		}
+
 	igt_subtest("bind-array-twice")
 		xe_for_each_hw_engine(fd, hwe)
 			test_bind_array(fd, hwe, 2, 0);
-- 
2.34.1
