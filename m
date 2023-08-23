Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E7010E0D9
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 18:49:12 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 18:45:38 +0000
Message-Id: <20230823184538.6273-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] i915/poc: Use semaphore wait to sync gpu and cpu
 times
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

This is just a POC to sync gpu and cpu time. The requirement is to
provide a solution that works with SRIOV as well.

The CS will block polling on a semaphore. The semaphore is signaled by
CPU by writing the CPU timestamp into the SAD field. As soon as the CS
unblocks, it reads the RING_TIMESTAMP. This makes the 2 values as close
to each other as possible.

Accuracy is within a few us (1 to 2). Repeated runs get better accuracy.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/cpu_gpu_time.c | 220 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 221 insertions(+)
 create mode 100644 tests/i915/cpu_gpu_time.c

diff --git a/tests/i915/cpu_gpu_time.c b/tests/i915/cpu_gpu_time.c
new file mode 100644
index 000000000..a87a3fa88
--- /dev/null
+++ b/tests/i915/cpu_gpu_time.c
@@ -0,0 +1,220 @@
+/*
+ * Copyright © 2016 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <signal.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+#include <sys/times.h>
+#include <sys/types.h>
+#include <dirent.h>
+#include <time.h>
+#include <poll.h>
+#include <math.h>
+
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_perf.h"
+#include "igt_sysfs.h"
+#include "igt_pm.h"
+#include "intel_ctx.h"
+#include "sw_sync.h"
+
+/**
+ * TEST: cpu_gpu_time
+ * Description: Test correlated time
+ * Run type: FULL
+ *
+ * SUBTEST: cpu-gpu-time
+ * Description: Test time correlation
+ * Feature: i915 streaming interface, oa
+ * Test category: Perf 
+ */
+
+static void
+test_cpu_gpu_time(int gem_fd,
+		  const intel_ctx_t *ctx,
+		  const struct intel_execution_engine2 *e,
+		  uint64_t *cpu_ns,
+		  uint64_t *gpu_ns)
+{
+	struct drm_i915_gem_relocation_entry reloc[2] = {};
+	struct drm_i915_gem_exec_object2 obj[2] = {};
+	struct drm_i915_gem_execbuffer2 eb = {};
+	uint32_t bb_handle, obj_handle;
+	uint32_t *obj_ptr;
+	uint32_t batch[64];
+	uint32_t mmio_base;
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
+	uint64_t obj_offset, bb_offset, *gpu_ts;
+	struct timespec *ts;
+	int i = 0;
+
+	igt_require(intel_gen(intel_get_drm_devid(gem_fd)) >= 8);
+
+	mmio_base = gem_engine_mmio_base(gem_fd, e->name);
+
+	/**
+	 * Setup up a batchbuffer with a polling semaphore wait command which
+	 * will wait on an value in a shared bo to change. This way we are able
+	 * to control how much time we will spend in this bb.
+	 */
+
+	bb_handle = gem_create(gem_fd, 4096);
+	obj_handle = gem_create(gem_fd, 4096);
+	bb_offset = get_offset(ahnd, bb_handle, 4096, 0);
+	obj_offset = get_offset(ahnd, obj_handle, 4096, 0);
+
+	obj_ptr = gem_mmap__device_coherent(gem_fd, obj_handle, 0, 4096, PROT_WRITE);
+
+#define obj(__o) (obj_offset + __o)
+	/* Poll from CPU to check the batch started */
+	batch[i++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[i++] = obj(0);
+	batch[i++] = obj(0) >> 32;
+	batch[i++] = 1;
+
+	/* Block the batch until this offset has a value GTE than 1 */
+	batch[i++] = MI_SEMAPHORE_WAIT |
+		   MI_SEMAPHORE_POLL |
+		   MI_SEMAPHORE_SAD_GTE_SDD;
+	batch[i++] = 1;
+	batch[i++] = obj(4);
+	batch[i++] = obj(4) >> 32;
+
+	/* Once unblocked, capture RING timestamp */
+	batch[i++] = MI_STORE_REGISTER_MEM_GEN8;
+	batch[i++] = mmio_base + 0x358;
+	batch[i++] = obj(20);
+	batch[i++] = 0;
+
+	batch[i++] = MI_STORE_REGISTER_MEM_GEN8;
+	batch[i++] = mmio_base + 0x35c;
+	batch[i++] = obj(24);
+	batch[i++] = 0;
+
+	batch[i++] = MI_BATCH_BUFFER_END;
+
+	gem_write(gem_fd, bb_handle, 0, batch, sizeof(batch));
+
+	reloc[0].target_handle = obj_handle;
+	reloc[0].offset = 1 * sizeof(uint32_t);
+	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
+	reloc[0].delta = 4;
+
+	reloc[1].target_handle = obj_handle;
+	reloc[1].offset = 6 * sizeof(uint32_t);
+	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
+
+	obj[0].handle = obj_handle;
+
+	obj[1].handle = bb_handle;
+	obj[1].relocation_count = !ahnd ? 2 : 0;
+	obj[1].relocs_ptr = to_user_pointer(reloc);
+
+	eb.buffer_count = 2;
+	eb.buffers_ptr = to_user_pointer(obj);
+	eb.flags = e->flags;
+	eb.rsvd1 = ctx->id;
+
+	if (ahnd) {
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[0].offset = obj_offset;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		obj[1].offset = bb_offset;
+	}
+
+	gem_execbuf(gem_fd, &eb);
+
+	/* wait for the batch to start executing */
+	while (!obj_ptr[0])
+		usleep(5e3);
+
+	ts = (struct timespec *)&obj_ptr[1];
+	clock_gettime(CLOCK_REALTIME, ts);
+
+	gem_sync(gem_fd, bb_handle);
+
+	for (int j = 0; j < 16; j++)
+		igt_debug("[%d] %08x\n", j, obj_ptr[j]);
+
+	gpu_ts = (uint64_t *) &obj_ptr[5];
+	*gpu_ns = (*gpu_ts * 1000000) / 19200;
+	*cpu_ns = ts->tv_sec * NSEC_PER_SEC + ts->tv_nsec;
+
+	munmap(obj_ptr, 4096);
+	gem_close(gem_fd, obj_handle);
+	gem_close(gem_fd, bb_handle);
+	put_ahnd(ahnd);
+}
+
+#define test_each_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
+		igt_dynamic_f("%s", e->name)
+
+igt_main
+{
+	const struct intel_execution_engine2 *e;
+	uint64_t prev_cpu = 0, prev_gpu = 0;
+	uint64_t cpu_ns, gpu_ns;
+	const intel_ctx_t *ctx;
+	int device;
+
+	igt_fixture {
+		drm_load_module(DRIVER_INTEL);
+		device = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(device);
+		ctx = intel_ctx_create_all_physical(device);
+	}
+
+	igt_describe("Capture cpu and gpu time close to each other");
+	test_each_engine("cpu-gpu-time", device, ctx, e) {
+		test_cpu_gpu_time(device, ctx, e, &cpu_ns, &gpu_ns);
+		igt_debug("CPU = %ld, GPU = %ld\n", cpu_ns, gpu_ns);
+		if (prev_cpu && prev_gpu) {
+			int64_t cpu_delta = cpu_ns - prev_cpu;
+			int64_t gpu_delta = gpu_ns - prev_gpu;
+
+			igt_debug("d_CPU = %ld, d_GPU = %ld\n", cpu_delta, gpu_delta);
+			igt_info("d_d = %ld\n", labs(gpu_delta - cpu_delta));
+		}
+		prev_cpu = cpu_ns;
+		prev_gpu = gpu_ns;
+	}
+
+	igt_fixture {
+		intel_ctx_destroy(device, ctx);
+		drm_close_driver(device);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 58061dbc2..c18dae125 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -260,6 +260,7 @@ i915_progs = [
 	'sysfs_heartbeat_interval',
 	'sysfs_preempt_timeout',
 	'sysfs_timeslice_duration',
+	'cpu_gpu_time',
 ]
 
 xe_progs = [
-- 
2.34.1
