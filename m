Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB35F10E1E8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:14 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Mon, 26 Jun 2023 16:21:12 +0530
Message-Id: <20230626105112.15705-1-sai.gowtham.ch@intel.com>
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
 tests/xe/xe_store.c | 173 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)
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
index 00000000..bb2e5319
--- /dev/null
+++ b/tests/xe/xe_store.c
@@ -0,0 +1,173 @@
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe_drm.h"
+
+/**
+ * TEST: Tests to verify store dword functionality.
+ * Category: Software building block
+ * Sub-category: spin
+ * Functionality: intel-bb
+ * Test category: functionality test
+ */
+
+#define MAX_INSTANCE 9
+
+/**
+ * SUBTEST: basic-store
+ * Description: Basic test to verify store dword.
+ * Run type: FULL
+ */
+static void store(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	uint32_t vm;
+	uint32_t engine;
+	size_t bo_size;
+	uint64_t addr = 0x100000;
+	uint32_t bo = 0;
+	int b;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+
+	bo_size = sizeof(*data);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+				xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+
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
+	engine = xe_engine_create(fd, vm, hwe, 0);
+	xe_exec_wait(fd, engine, batch_addr);
+
+	igt_assert_eq(data->data, 0x123456);
+
+	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	xe_engine_destroy(fd, engine);
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: spin-basic
+ * Description: Test to verify store dword on all available engine.
+ * Run type: BAT
+ */
+static void store_all(int fd, int gt, int class)
+{
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	uint32_t vm;
+	uint32_t engines[MAX_INSTANCE];
+	size_t bo_size;
+	uint64_t addr = 0x100000;
+	uint32_t bo = 0;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *hwe;
+	int b, i, num_placements = 0;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+
+	bo_size = sizeof(*data);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+				xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, 0, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data->batch[b++] = sdi_addr;
+	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = 0xc0ffee;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	xe_for_each_hw_engine(fd, hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+		eci[num_placements++] = *hwe;
+	}
+	if (num_placements < 2)
+		return;
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
+		xe_exec_wait(fd, engine[i], batch_addr);
+		igt_assert_eq(data[i]->data, 0xc0ffee);
+	}
+
+	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	for (i = 0; i < num_placements; i++) {
+		xe_engine_destroy(fd, engine[i]);
+	}
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest("basic-store")
+		xe_for_each_hw_engine(fd, hwe)
+			store(fd, hwe);
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
