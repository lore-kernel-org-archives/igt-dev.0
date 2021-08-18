Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18A86E5C5
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Aug 2021 14:07:09 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 18 Aug 2021 16:06:51 +0200
Message-Id: <20210818140651.819205-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_lmem_swapping: Add the
 gem_lmem_swapping test
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
Cc: CQ Tang <cq.tang@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

This test exercises the lmem eviction functionality with one
dynamic subtest per lmem region.

In essence the various subtests create lmem buffers objects consuming more
lmem memory than available and check that they are successful submitting
workload subsets whose lmem size requirements are smaller than the total
amount of lmem available, forcing eviction of buffer objects under
various conditions.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_lmem_swapping.c | 562 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 2 files changed, 563 insertions(+)
 create mode 100644 tests/i915/gem_lmem_swapping.c

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
new file mode 100644
index 00000000..5b27dd1a
--- /dev/null
+++ b/tests/i915/gem_lmem_swapping.c
@@ -0,0 +1,562 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019-2021 Intel Corporation
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
+ * Authors:
+ *	CQ Tang <cq.tang@intel.com>
+ *
+ */
+
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+#include "i915/gem_vm.h"
+#include "i915/intel_memory_region.h"
+#include "igt.h"
+#include "igt_kmod.h"
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+#include <sys/time.h>
+#include <sys/wait.h>
+#include "drm.h"
+
+IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
+
+#define __round_mask(x, y) ((__typeof__(x))((y) - 1))
+#define round_up(x, y) ((((x) - 1) | __round_mask(x, y)) + 1)
+
+#define PAGE_SIZE  (1ULL << 12)
+#define SZ_64K	   (16 * PAGE_SIZE)
+
+struct pr_data {
+	uint64_t value;
+	char unit[6];
+};
+
+struct params {
+	struct {
+		uint64_t min;
+		uint64_t max;
+	} size;
+	struct pr_data pr_min, pr_max;
+	unsigned int count;
+	unsigned int loops;
+	unsigned int mem_limit;
+#define TEST_VERIFY	(1 << 0)
+#define TEST_PARALLEL	(1 << 1)
+#define TEST_HEAVY	(1 << 2)
+#define TEST_RANDOM	(1 << 3)
+#define TEST_ENGINES	(1 << 4)
+#define TEST_MULTI	(1 << 5)
+	unsigned int flags;
+	uint64_t va;
+};
+
+struct object {
+	uint64_t size;
+	uint32_t seed;
+	uint32_t handle;
+	uint64_t va;
+};
+
+static bool do_oom_test;
+
+static void __get_pr_data(uint64_t value, struct pr_data *data)
+{
+	if (value >> 20) {
+		data->value = value >> 20;
+		strcpy(data->unit, "MiB");
+	} else if (value >> 10) {
+		data->value = value >> 10;
+		strcpy(data->unit, "KiB");
+	} else {
+		data->value = value;
+		strcpy(data->unit, "Bytes");
+	}
+}
+
+static uint32_t create_bo(int i915,
+			  uint64_t size,
+			  struct drm_i915_gem_memory_class_instance *region)
+{
+	uint32_t handle;
+	int ret;
+
+retry:
+	ret = __gem_create_in_memory_region_list(i915, &handle, size, region, 1);
+	if (do_oom_test && (ret == -ENOMEM || ret == -ENXIO))
+		goto retry;
+	igt_assert_eq(ret, 0);
+	return handle;
+}
+
+static unsigned int __num_engines__;
+
+static void
+init_object(int i915, struct object *obj, unsigned long seed, unsigned int flags)
+{
+	unsigned int j;
+	uint32_t *buf;
+
+	obj->seed = seed;
+
+	buf = gem_mmap_offset__fixed(i915, obj->handle, 0, obj->size, PROT_WRITE);
+
+	for (j = 0; j < obj->size / sizeof(*buf); j++)
+		buf[j] = seed++;
+
+	munmap(buf, obj->size);
+}
+
+static void
+verify_object(int i915, const struct object *obj,  unsigned int flags)
+{
+	unsigned long j;
+	uint32_t *buf;
+
+	buf = gem_mmap_offset__fixed(i915, obj->handle, 0, obj->size, PROT_READ);
+
+	for (j = 0; j < obj->size / PAGE_SIZE; j++) {
+		unsigned long x = (j * PAGE_SIZE + rand() % PAGE_SIZE) / sizeof(*buf);
+		uint32_t val = obj->seed + x;
+
+		igt_assert_f(buf[x] == val,
+			     "Object mismatch at offset %zu - found %08x, expected %08x; difference:%08x!\n",
+			     x * sizeof(*buf), buf[x], val, buf[x] ^ val);
+	}
+
+	munmap(buf, obj->size);
+}
+
+static void move_to_lmem(int i915,
+			 struct drm_i915_gem_memory_class_instance *region,
+			 struct object *list,
+			 unsigned int num,
+			 uint32_t batch,
+			 unsigned int engine)
+{
+	struct drm_i915_gem_exec_object2 obj[1 + num];
+	struct drm_i915_gem_execbuffer2 eb = {
+		.buffers_ptr = to_user_pointer(obj),
+		.buffer_count = 1 + num,
+		.flags = I915_EXEC_NO_RELOC | I915_EXEC_HANDLE_LUT | engine,
+	};
+	unsigned int i, ret;
+
+	memset(obj, 0, sizeof(obj));
+
+	for (i = 0; i < num; i++) {
+		obj[i].handle = list[i].handle;
+		obj[i].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	}
+
+	obj[i].handle = batch;
+retry:
+	ret = __gem_execbuf(i915, &eb);
+	if (do_oom_test && (ret == -ENOMEM || ret == -ENXIO))
+		goto retry;
+	igt_assert_eq(ret, 0);
+}
+
+static void __do_evict(int i915,
+		       struct drm_i915_gem_memory_class_instance *region,
+		       struct params *params)
+{
+	const unsigned int max_swap_in = params->count / 100 + 1;
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct object *objects, *obj, *list;
+	uint32_t batch;
+	unsigned int engine = 0;
+	unsigned int i, l;
+	uint64_t size;
+	struct timespec t = {};
+	unsigned int num;
+
+	__gem_context_set_persistence(i915, 0, false);
+	size = 4096;
+	batch = create_bo(i915, size, region);
+
+	gem_write(i915, batch, 0, &bbe, sizeof(bbe));
+
+	objects = calloc(params->count, sizeof(*objects));
+	igt_assert(objects);
+
+	list = calloc(max_swap_in, sizeof(*list));
+	igt_assert(list);
+
+	srand(time(0));
+
+	/* Create the initial working set of objects. */
+
+	size = 0;
+	for (i = 0, obj = objects; i < params->count; i++, obj++) {
+		if (params->flags & TEST_RANDOM)
+			obj->size = rand() %
+				(params->size.max - params->size.min) +
+				params->size.min;
+		else
+			obj->size = params->size.min;
+
+		size += obj->size;
+		if ((size >> 20) > params->mem_limit) {
+			params->count = i;
+			break;
+		}
+		obj->handle = create_bo(i915, obj->size, region);
+
+		if (params->flags & TEST_VERIFY)
+			init_object(i915, obj, rand(), params->flags);
+		else
+			move_to_lmem(i915, region, objects + i, 1, batch, engine);
+	}
+
+	igt_debug("obj size min/max=%lu %s/%lu %s, count=%u\n",
+		  params->pr_min.value, params->pr_min.unit,
+		  params->pr_max.value, params->pr_max.unit,
+		  params->count);
+
+	/*
+	 * Move random objects back into lmem.
+	 * for TEST_MULTI runs, make each object count s a loop to
+	 * avoid excessive run times
+	 */
+	for (l = 0; l < params->loops && igt_seconds_elapsed(&t) < 300; l += num) {
+		unsigned int idx = rand() % params->count;
+
+		num = params->flags & TEST_MULTI ? rand() % max_swap_in + 1 : 1;
+		for (i = 0; i < num; i++) {
+			list[i] = objects[idx];
+			idx = (idx + 1) % params->count;
+		}
+
+		move_to_lmem(i915, region, list, num, batch, engine);
+
+		if (params->flags & TEST_ENGINES)
+			engine = (engine + 1) % __num_engines__;
+
+		if (params->flags & TEST_VERIFY) {
+			for (i = 0; i < num; i++)
+				verify_object(i915, &list[i], params->flags);
+
+			/* Update random object - may swap it back in. */
+			i = rand() % params->count;
+			init_object(i915, &objects[i], rand(), params->flags);
+		}
+	}
+
+	for (i = 0; i < params->count; i++)
+		gem_close(i915, objects[i].handle);
+
+	free(list);
+	free(objects);
+
+	gem_close(i915, batch);
+}
+
+static void fill_params(int i915, struct params *params,
+			struct drm_i915_memory_region_info *region,
+			unsigned int flags,
+			unsigned int nproc)
+{
+	const int swap_mb = /* For lmem, swap is total of smem + swap. */
+		intel_get_total_ram_mb() + intel_get_total_swap_mb();
+	const unsigned int size = 1 << 20;
+	const int max_swap_pct = 75;
+	/*
+	 * In random mode, add 85% hard limit to use system memory.
+	 * noticed that 88.8% can trigger OOM on some system.
+	 */
+	const int mem_limit_pct = 85;
+	int spill_mb;
+	uint32_t handle;
+
+	if (flags & TEST_RANDOM) {
+		params->size.min = 4096;
+		handle = create_bo(i915, params->size.min, &region->region);
+		gem_close(i915, handle);
+		params->size.max = 2 * size + params->size.min;
+	} else {
+		params->size.min = size;
+		params->size.max = size;
+	}
+
+	params->count = (region->probed_size + (size - 1)) / size * 3 / 2;
+	spill_mb = (size >> 20) * params->count - (region->probed_size >> 20);
+	/* Don't use all RAM for swapout. */
+	igt_require(spill_mb <= swap_mb * max_swap_pct / 100);
+
+	if (flags & TEST_HEAVY) {
+		params->count *= 2;
+		spill_mb = (size >> 20) * params->count -
+			(region->probed_size >> 20);
+
+		if (spill_mb > swap_mb * max_swap_pct / 100) {
+			unsigned int count;
+			unsigned long set;
+
+			igt_warn("Reducing working set due low RAM + swap! (Need %d MiB, have %d MiB.)\n",
+				 spill_mb, swap_mb);
+			set = region->probed_size +
+				(((unsigned long)swap_mb * max_swap_pct / 100) << 20);
+			count = set / size;
+			/* No point if heavy test is too similar to normal. */
+			igt_require(count > (params->count / 2) * 133 / 100);
+			params->count = count;
+		}
+	}
+
+	params->loops = params->count;
+
+	/*
+	 * If run in parallel, reduce per process buffer count to keep the
+	 * total the same, but don't reduce loops since we gain some
+	 * efficiency by the parallel execution
+	 */
+	if (flags & TEST_PARALLEL)
+		params->count /= nproc;
+
+	/*
+	 * For heavy tests, reduce the loop count to avoid excessive
+	 * run-times
+	 */
+	if (flags & TEST_HEAVY)
+		params->loops = params->loops / 2 + 1;
+
+	params->flags = flags;
+
+	params->mem_limit = swap_mb * mem_limit_pct / 100 +
+		(region->probed_size >> 20);
+	__get_pr_data(params->size.min, &params->pr_min);
+	__get_pr_data(params->size.max, &params->pr_max);
+	igt_info("Memory: system-total %dMiB, lmem-region %lldMiB, usage-limit %dMiB\n",
+		 swap_mb, (region->probed_size >> 20), params->mem_limit);
+	igt_info("Using %u thread(s), %u loop(s), %u objects of %lu %s - %lu %s\n",
+		 params->flags & TEST_PARALLEL ? nproc : 1,
+		 params->loops,
+		 params->count,
+		 params->pr_min.value,
+		 params->pr_min.unit,
+		 params->pr_max.value,
+		 params->pr_max.unit);
+}
+
+static void test_evict(int i915,
+		       struct drm_i915_memory_region_info *region,
+		       unsigned int flags)
+{
+	const unsigned int nproc = sysconf(_SC_NPROCESSORS_ONLN) + 1;
+	struct params params;
+
+	fill_params(i915, &params, region, flags, nproc);
+
+	if (flags & TEST_PARALLEL) {
+		int fd = gem_reopen_driver(i915);
+
+		igt_fork(child, nproc) {
+			params.va = 0x1000000 + params.va * child;
+			params.va = round_up(params.va, SZ_64K);
+			__do_evict(fd, &region->region, &params);
+		}
+
+		igt_waitchildren();
+		close(fd);
+	} else {
+		__do_evict(i915, &region->region, &params);
+	}
+}
+
+static void leak(uint64_t alloc)
+{
+	char *ptr;
+
+	ptr = mmap(NULL, alloc, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_POPULATE, -1, 0);
+	if (ptr == MAP_FAILED)
+		return;
+
+	while (alloc) {
+		alloc -= 4096;
+		ptr[alloc] = 0;
+	}
+}
+
+static void gem_leak(int fd, uint64_t alloc)
+{
+	uint32_t handle = gem_create(fd, alloc);
+	void *buf;
+
+	buf = gem_mmap_offset__fixed(fd, handle, 0, PAGE_SIZE, PROT_WRITE);
+	memset(buf, 0, PAGE_SIZE);
+	munmap(buf, PAGE_SIZE);
+
+	gem_madvise(fd, handle, I915_MADV_DONTNEED);
+}
+
+static int *lmem_done;
+
+static void smem_oom_exit_handler(int sig)
+{
+	(*lmem_done)++;
+}
+
+static void test_smem_oom(int i915,
+			  struct drm_i915_memory_region_info *region,
+			  unsigned int flags)
+{
+	const uint64_t smem_size = intel_get_total_ram_mb() +
+		intel_get_total_swap_mb();
+	const unsigned int alloc = 256 * 1024 * 1024;
+	const unsigned int num_alloc = 1 + smem_size / (alloc >> 20);
+	struct igt_helper_process smem_proc = {};
+	unsigned int n;
+
+	do_oom_test = true;
+
+	lmem_done = mmap(0, sizeof(*lmem_done), PROT_WRITE,
+			 MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(lmem_done != MAP_FAILED);
+	*lmem_done = 0;
+
+	/* process for testing lmem eviction */
+	igt_fork(child, 1) {
+		int fd = gem_reopen_driver(i915);
+		struct params params;
+
+		fill_params(i915, &params, region, flags, 1);
+
+		igt_install_exit_handler(smem_oom_exit_handler);
+		__do_evict(fd, &region->region, &params);
+
+		close(fd);
+	}
+
+	/* smem memory hog process, respawn till the lmem process completes */
+	while (!READ_ONCE(*lmem_done)) {
+		igt_fork_helper(&smem_proc) {
+			igt_fork(child, 1) {
+				for (int pass = 0; pass < num_alloc; pass++) {
+					if (READ_ONCE(*lmem_done))
+						break;
+					leak(alloc);
+				}
+			}
+			igt_fork(child, 1) {
+				int fd = gem_reopen_driver(i915);
+
+				for (int pass = 0; pass < num_alloc; pass++) {
+					if (READ_ONCE(*lmem_done))
+						break;
+					gem_leak(fd, alloc);
+				}
+				close(fd);
+			}
+			/*
+			 * Wait for grand-child processes to finish or be
+			 * killed by the oom killer, don't call
+			 * igt_waitchildren because of the noise
+			 */
+			for (n = 0; n < 2; n++)
+				wait(NULL);
+		}
+		igt_wait_helper(&smem_proc);
+	}
+	munmap(lmem_done, sizeof(*lmem_done));
+	/* Reap exit status of the lmem process */
+	igt_waitchildren();
+
+	do_oom_test = false;
+}
+
+igt_main
+{
+	struct drm_i915_query_memory_regions *regions;
+	struct test {
+		const char *name;
+		unsigned int flags;
+		void (*func)(int i915,
+			     struct drm_i915_memory_region_info *region,
+			     unsigned int flags);
+	} *test, tests[] = {
+		{ "basic", 0, test_evict },
+		{ "random", TEST_RANDOM, test_evict },
+		{ "random-engines", TEST_RANDOM | TEST_ENGINES, test_evict },
+		{ "heavy-random", TEST_RANDOM | TEST_HEAVY, test_evict },
+		{ "heavy-multi", TEST_RANDOM | TEST_HEAVY | TEST_ENGINES | TEST_MULTI, test_evict },
+		{ "verify", TEST_VERIFY, test_evict },
+		{ "verify-random", TEST_VERIFY | TEST_RANDOM, test_evict },
+		{ "heavy-verify-random", TEST_VERIFY | TEST_RANDOM | TEST_HEAVY, test_evict },
+		{ "heavy-verify-multi", TEST_VERIFY | TEST_RANDOM | TEST_HEAVY | TEST_ENGINES | TEST_MULTI, test_evict },
+		{ "parallel-random", TEST_PARALLEL | TEST_RANDOM, test_evict },
+		{ "parallel-random-engines", TEST_PARALLEL | TEST_RANDOM | TEST_ENGINES, test_evict },
+		{ "parallel-random-verify", TEST_PARALLEL | TEST_RANDOM | TEST_VERIFY, test_evict },
+		{ "parallel-multi", TEST_PARALLEL | TEST_RANDOM | TEST_VERIFY | TEST_ENGINES | TEST_MULTI, test_evict },
+		{ "smem-oom", 0, test_smem_oom },
+		{ }
+	};
+	int i915 = -1;
+
+	igt_fixture {
+		struct intel_execution_engine2 *e;
+
+		i915 = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(i915);
+
+		regions = gem_get_query_memory_regions(i915);
+		igt_require(regions);
+
+		for_each_physical_engine(i915, e)
+			__num_engines__++;
+		igt_require(__num_engines__);
+	}
+
+	for (test = tests; test->name; test++) {
+		igt_subtest_with_dynamic(test->name) {
+			unsigned int i;
+
+			for (i = 0; i < regions->num_regions; i++) {
+				if (regions->regions[i].region.memory_class !=
+				    I915_MEMORY_CLASS_DEVICE)
+					continue;
+
+				igt_dynamic_f("lmem%u",
+					      regions->regions[i].region.memory_instance)
+					test->func(i915,
+						   &regions->regions[i],
+						   test->flags);
+			}
+		}
+	}
+
+	igt_fixture {
+		free(regions);
+		close(i915);
+	}
+
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1bdfddbb..5783e79e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -173,6 +173,7 @@ i915_progs = [
 	'gem_gtt_speed',
 	'gem_huc_copy',
 	'gem_linear_blits',
+	'gem_lmem_swapping',
 	'gem_lut_handle',
 	'gem_madvise',
 	'gem_media_fill',
-- 
2.31.1
