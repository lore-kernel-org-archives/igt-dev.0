Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E5610E2E9
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 14:12:23 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Tue, 27 Jun 2023 19:41:07 +0530
Message-Id: <20230627141107.22549-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_store: Add xe_store test to
 check store dword functionality
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

Adding xe_store test to valide store dword funtionality, this has basic
test and test which runs on all the available engines.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/meson.build   |   1 +
 tests/xe/xe_store.c | 197 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 tests/xe/xe_store.c

diff --git a/tests/meson.build b/tests/meson.build
index 85ea7e74..2874be77 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -267,6 +267,7 @@ xe_progs = [
 	'xe_pm',
 	'xe_prime_self_import',
 	'xe_query',
+	'xe_store',
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
diff --git a/tests/xe/xe_store.c b/tests/xe/xe_store.c
new file mode 100644
index 00000000..5765c3d8
--- /dev/null
+++ b/tests/xe/xe_store.c
@@ -0,0 +1,197 @@
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe_drm.h"
+
+/**
+ * TEST: Tests to verify store dword functionality.
+ * Category: Software building block
+ * Sub-category: HW
+ * Functionality: intel-bb
+ * Test category: functionality test
+ */
+
+#define MAX_INSTANCE 9
+
+struct batch {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+	uint64_t addr;
+};
+
+static void batch(struct batch *data, uint64_t addr)
+{
+	int b;
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data->batch[b++] = sdi_addr;
+	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = 0x123456;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	data->addr = batch_addr;
+}
+
+/**
+ * SUBTEST: basic-store
+ * Description: Basic test to verify store dword.
+ * Run type: FULL
+ */
+static void store(int fd)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct batch *data;
+	struct drm_xe_engine_class_instance *hw_engine;
+	uint32_t vm;
+	uint32_t engine;
+	uint32_t syncobj;
+	size_t bo_size;
+	uint64_t addr = 0x100000;
+	uint32_t bo = 0;
+
+	syncobj = syncobj_create(fd, 0);
+	sync.handle = syncobj;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	hw_engine = xe_hw_engine(fd, 1);
+	bo = xe_bo_create(fd, hw_engine->gt_id, vm, bo_size);
+
+	xe_vm_bind_async(fd, vm, hw_engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
+	data = xe_bo_map(fd, bo, bo_size);
+	batch(data, addr);
+
+	engine = xe_engine_create(fd, vm, hw_engine, 0);
+	exec.engine_id = engine;
+	exec.address = data->addr;
+	sync.flags &= DRM_XE_SYNC_SIGNAL;
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data->data, 0x123456);
+
+	syncobj_destroy(fd, syncobj);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	xe_engine_destroy(fd, engine);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: basic-all
+ * Description: Test to verify store dword on all available engine.
+ * Run type: BAT
+ */
+static void store_all(int fd, int gt, int class)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+
+	struct batch *data;
+	uint32_t vm, syncobj;
+	uint32_t engines[MAX_INSTANCE];
+	size_t bo_size;
+	uint64_t addr = 0x100000;
+	uint32_t bo = 0;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *hwe;
+	int i, num_placements = 0;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	syncobj = syncobj_create(fd, 0);
+	sync.handle = syncobj;
+
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+
+	xe_for_each_hw_engine(fd, hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+		eci[num_placements++] = *hwe;
+	}
+	if (num_placements < 2)
+		return;
+	batch(data, addr);
+
+	for (i = 0; i < num_placements; i++) {
+		struct drm_xe_engine_create create = {
+			.vm_id = vm,
+			.width = 1,
+			.num_placements = num_placements,
+			.instances = to_user_pointer(eci),
+		};
+
+		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE,
+					&create), 0);
+		engines[i] = create.engine_id;
+		exec.engine_id = engines[i];
+		exec.address = data->addr;
+		sync.flags &= DRM_XE_SYNC_SIGNAL;
+		xe_exec(fd, &exec);
+
+		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+		igt_assert_eq(data->data, 0x123456);
+	}
+
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
+	syncobj_destroy(fd, syncobj);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	for (i = 0; i < num_placements; i++) {
+		xe_engine_destroy(fd, engines[i]);
+	}
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	int fd, class, gt;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest("basic-store")
+		store(fd);
+
+	igt_subtest("basic-all") {
+		xe_for_each_gt(fd, gt)
+			xe_for_each_hw_engine_class(class)
+				store_all(fd, gt, class);
+	}
+
+	igt_fixture
+		close(fd);
+}
-- 
2.39.1
