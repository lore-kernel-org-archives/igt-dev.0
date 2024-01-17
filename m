Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB0910E6AE
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 13:44:19 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v4 1/3] tests/intel: Add xe_exec_atomic test
Date: Wed, 17 Jan 2024 14:30:47 +0100
Message-ID: <20240117133050.19605-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Implement xe_exec_atomic test which will validate
MI_ATOMIC(increment, decrement) operations for all
engines and all memory regions. The test is skipped
on system memory for PVC as this is known to be not
supported.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/intel_reg.h              |   1 +
 tests/intel/xe_exec_atomic.c | 174 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 3 files changed, 176 insertions(+)
 create mode 100644 tests/intel/xe_exec_atomic.c

diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index a8190d683..26833c66f 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2647,6 +2647,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 /* Atomics */
 #define   MI_ATOMIC_INC                 (0x5 << 8)
+#define   MI_ATOMIC_DEC                 (0x6 << 8)
 #define   MI_ATOMIC_ADD                 (0x7 << 8)
 
 /* Batch */
diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
new file mode 100644
index 000000000..a21def999
--- /dev/null
+++ b/tests/intel/xe_exec_atomic.c
@@ -0,0 +1,174 @@
+/* SPDX-License-Identifier: MIT */
+/*
+* Copyright © 2024 Intel Corporation
+*
+* Authors:
+*    Nirmoy Das <nirmoy.das@intel.com>
+*/
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe_drm.h"
+
+/**
+ * TEST: Tests to verify atomic functionality.
+ * Category: Software building block
+ * Sub-category: HW
+ * Functionality: intel-bb
+ * Test category: functionality test
+ */
+
+struct data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+	uint64_t addr;
+};
+
+static void atomic_batch(struct data *data, uint64_t addr, int ops)
+{
+	int b;
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data->batch[b++] = MI_ATOMIC | ops;
+	data->batch[b++] = sdi_addr;
+	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	data->addr = batch_addr;
+}
+
+/**
+ * SUBTEST: basic-inc-all
+ * Description: Test to verify atomic increment on all available engines and memory types.
+ * SUBTEST: basic-dec-all
+ * Description: Test to verify atomic decrement on all available engines and memory types.
+ */
+static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci,
+		       uint32_t placement)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct data *data;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t bind_engine;
+	uint32_t syncobj;
+	size_t bo_size;
+	int value = 0x123456, match;
+	uint64_t addr = 0x100000;
+	uint32_t bo = 0;
+
+	syncobj = syncobj_create(fd, 0);
+	sync.handle = syncobj;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, vm, bo_size, placement,
+			  I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
+	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
+	data = xe_bo_mmap_ext(fd, bo, bo_size, PROT_READ|PROT_WRITE);
+	data->data = value;
+
+	atomic_batch(data, addr, inst_type);
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = data->addr;
+	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	munmap(data, bo_size);
+	data = xe_bo_mmap_ext(fd, bo, bo_size, PROT_READ|PROT_WRITE);
+	match = (inst_type == MI_ATOMIC_INC) ? ++value : --value;
+	igt_assert_eq(data->data, match);
+
+	syncobj_destroy(fd, syncobj);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
+static bool has_atomics(int fd, uint32_t region)
+{
+	/* System memory atomics on PVC doesn't work */
+	if (region == system_memory(fd) &&
+	    IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
+		return false;
+
+	return true;
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
+	igt_subtest_with_dynamic("basic-dec-all") {
+		xe_for_each_engine(fd, hwe) {
+			uint64_t memreg = all_memory_regions(fd), region;
+
+			xe_for_each_mem_region(fd, memreg, region) {
+
+				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
+					      xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance,
+					      hwe->gt_id, xe_region_name(region)) {
+
+					igt_skip_on(!has_atomics(fd, region));
+					basic_inst(fd, MI_ATOMIC_DEC, hwe, region);
+				}
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-inc-all") {
+		xe_for_each_engine(fd, hwe) {
+			uint64_t memreg = all_memory_regions(fd), region;
+
+			xe_for_each_mem_region(fd, memreg, region) {
+
+				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
+					      xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance,
+					      hwe->gt_id, xe_region_name(region)) {
+
+					igt_skip_on(!has_atomics(fd, region));
+					basic_inst(fd, MI_ATOMIC_INC, hwe, region);
+				}
+			}
+		}
+	}
+
+	igt_fixture {
+		xe_device_put(fd);
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a6a8498e2..c5ca951ef 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -284,6 +284,7 @@ intel_xe_progs = [
 	'xe_drm_fdinfo',
 	'xe_evict',
 	'xe_evict_ccs',
+	'xe_exec_atomic',
 	'xe_exec_balancer',
 	'xe_exec_basic',
 	'xe_exec_compute_mode',
-- 
2.42.0


