Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660C010E6B1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:14:00 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:43 -0800
Message-Id: <20230118071350.17498-13-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
References: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 12/19] tests/i915/vm_bind: Add
 gem_exec3_balancer test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To test parallel submissions support in execbuf3, port the subtest
gem_exec_balancer@parallel-ordering to a new gem_exec3_balancer test
and switch to execbuf3 ioctl.

v2: use i915_vm_bind library functions
v3: Remove unwanted gem_set_domain()
v4: Require guc submission
v5: Use syncobj library functions

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/gem_exec3_balancer.c | 450 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   7 +
 2 files changed, 457 insertions(+)
 create mode 100644 tests/i915/gem_exec3_balancer.c

diff --git a/tests/i915/gem_exec3_balancer.c b/tests/i915/gem_exec3_balancer.c
new file mode 100644
index 000000000..cc8c743fd
--- /dev/null
+++ b/tests/i915/gem_exec3_balancer.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+/** @file gem_exec3_balancer.c
+ *
+ * Load balancer tests with execbuf3.
+ * Ported from gem_exec_balancer and made to work with
+ * vm_bind and execbuf3.
+ *
+ */
+
+#include <poll.h>
+
+#include "i915/gem.h"
+#include "i915/i915_vm_bind.h"
+#include "i915/gem_engine_topology.h"
+#include "i915/gem_create.h"
+#include "i915/gem_vm.h"
+#include "igt.h"
+#include "igt_gt.h"
+#include "igt_perf.h"
+#include "igt_syncobj.h"
+
+IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing with execbuf3");
+
+#define INSTANCE_COUNT (1 << I915_PMU_SAMPLE_INSTANCE_BITS)
+
+static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
+{
+	int fd;
+
+	fd = perf_i915_open(i915, I915_PMU_ENGINE_BUSY(class, instance));
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+
+	return false;
+}
+
+static struct i915_engine_class_instance *
+list_engines(int i915, uint32_t class_mask, unsigned int *out)
+{
+	unsigned int count = 0, size = 64;
+	struct i915_engine_class_instance *engines;
+
+	engines = malloc(size * sizeof(*engines));
+	igt_assert(engines);
+
+	for (enum drm_i915_gem_engine_class class = I915_ENGINE_CLASS_RENDER;
+	     class_mask;
+	     class++, class_mask >>= 1) {
+		if (!(class_mask & 1))
+			continue;
+
+		for (unsigned int instance = 0;
+		     instance < INSTANCE_COUNT;
+		     instance++) {
+			if (!has_class_instance(i915, class, instance))
+				continue;
+
+			if (count == size) {
+				size *= 2;
+				engines = realloc(engines,
+						  size * sizeof(*engines));
+				igt_assert(engines);
+			}
+
+			engines[count++] = (struct i915_engine_class_instance){
+				.engine_class = class,
+				.engine_instance = instance,
+			};
+		}
+	}
+
+	if (!count) {
+		free(engines);
+		engines = NULL;
+	}
+
+	*out = count;
+	return engines;
+}
+
+static bool has_perf_engines(int i915)
+{
+	return i915_perf_type_id(i915);
+}
+
+static intel_ctx_cfg_t
+ctx_cfg_for_engines(const struct i915_engine_class_instance *ci,
+		    unsigned int count)
+{
+	intel_ctx_cfg_t cfg = { };
+	unsigned int i;
+
+	for (i = 0; i < count; i++)
+		cfg.engines[i] = ci[i];
+	cfg.num_engines = count;
+
+	return cfg;
+}
+
+static const intel_ctx_t *
+ctx_create_engines(int i915, const struct i915_engine_class_instance *ci,
+		   unsigned int count)
+{
+	intel_ctx_cfg_t cfg = ctx_cfg_for_engines(ci, count);
+	return intel_ctx_create(i915, &cfg);
+}
+
+static void check_bo(int i915, uint32_t handle, unsigned int expected)
+{
+	uint32_t *map;
+
+	map = gem_mmap__cpu(i915, handle, 0, 4096, PROT_READ);
+	igt_assert_eq(map[0], expected);
+	munmap(map, 4096);
+}
+
+static struct drm_i915_query_engine_info *query_engine_info(int i915)
+{
+	struct drm_i915_query_engine_info *engines;
+
+#define QUERY_SIZE	0x4000
+	engines = malloc(QUERY_SIZE);
+	igt_assert(engines);
+	memset(engines, 0, QUERY_SIZE);
+	igt_assert(!__gem_query_engines(i915, engines, QUERY_SIZE));
+#undef QUERY_SIZE
+
+	return engines;
+}
+
+/* This function only works if siblings contains all instances of a class */
+static void logical_sort_siblings(int i915,
+				  struct i915_engine_class_instance *siblings,
+				  unsigned int count)
+{
+	struct i915_engine_class_instance *sorted;
+	struct drm_i915_query_engine_info *engines;
+	unsigned int i, j;
+
+	sorted = calloc(count, sizeof(*sorted));
+	igt_assert(sorted);
+
+	engines = query_engine_info(i915);
+
+	for (j = 0; j < count; ++j) {
+		for (i = 0; i < engines->num_engines; ++i) {
+			if (siblings[j].engine_class ==
+			    engines->engines[i].engine.engine_class &&
+			    siblings[j].engine_instance ==
+			    engines->engines[i].engine.engine_instance) {
+				uint16_t logical_instance =
+					engines->engines[i].logical_instance;
+
+				igt_assert(logical_instance < count);
+				igt_assert(!sorted[logical_instance].engine_class);
+				igt_assert(!sorted[logical_instance].engine_instance);
+
+				sorted[logical_instance] = siblings[j];
+				break;
+			}
+		}
+		igt_assert(i != engines->num_engines);
+	}
+
+	memcpy(siblings, sorted, sizeof(*sorted) * count);
+	free(sorted);
+	free(engines);
+}
+
+static bool fence_busy(int fence)
+{
+	return poll(&(struct pollfd){fence, POLLIN}, 1, 0) == 0;
+}
+
+/*
+ * Always reading from engine instance 0, with GuC submission the values are the
+ * same across all instances. Execlists they may differ but quite unlikely they
+ * would be and if they are we can live with this.
+ */
+static unsigned int get_timeslice(int i915,
+				  struct i915_engine_class_instance engine)
+{
+	unsigned int val;
+
+	switch (engine.engine_class) {
+	case I915_ENGINE_CLASS_RENDER:
+		gem_engine_property_scanf(i915, "rcs0", "timeslice_duration_ms",
+					  "%d", &val);
+		break;
+	case I915_ENGINE_CLASS_COPY:
+		gem_engine_property_scanf(i915, "bcs0", "timeslice_duration_ms",
+					  "%d", &val);
+		break;
+	case I915_ENGINE_CLASS_VIDEO:
+		gem_engine_property_scanf(i915, "vcs0", "timeslice_duration_ms",
+					  "%d", &val);
+		break;
+	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
+		gem_engine_property_scanf(i915, "vecs0", "timeslice_duration_ms",
+					  "%d", &val);
+		break;
+	}
+
+	return val;
+}
+
+/*
+ * Ensure a parallel submit actually runs on HW in parallel by putting on a
+ * spinner on 1 engine, doing a parallel submit, and parallel submit is blocked
+ * behind spinner.
+ */
+static void parallel_ordering(int i915, unsigned int flags)
+{
+	uint32_t vm_id;
+	int class;
+
+	vm_id = gem_vm_create_in_vm_bind_mode(i915);
+
+	for (class = 0; class < 32; class++) {
+		struct drm_i915_gem_timeline_fence exec_fence = { };
+		const intel_ctx_t *ctx = NULL, *spin_ctx = NULL;
+		uint64_t fence_value = 0, batch_addr[32] = { };
+		struct i915_engine_class_instance *siblings;
+		uint32_t batch[16], obj[32], exec_syncobj;
+		struct drm_i915_gem_execbuffer3 execbuf;
+		struct drm_i915_gem_context_param param = {
+			.param = I915_CONTEXT_PARAM_RECOVERABLE,
+			.value = 0,
+		};
+		intel_ctx_cfg_t cfg;
+		unsigned int count;
+		igt_spin_t *spin;
+		uint64_t ahnd;
+		int i = 0;
+
+		siblings = list_engines(i915, 1u << class, &count);
+		if (!siblings)
+			continue;
+
+		if (count < 2) {
+			free(siblings);
+			continue;
+		}
+
+		logical_sort_siblings(i915, siblings, count);
+
+		memset(&cfg, 0, sizeof(cfg));
+		cfg.parallel = true;
+		cfg.num_engines = 1;
+		cfg.width = count;
+		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
+
+		if (__intel_ctx_create(i915, &cfg, &ctx)) {
+			free(siblings);
+			continue;
+		}
+		param.ctx_id = ctx->id;
+		gem_context_set_param(i915, &param);
+		gem_context_set_vm(i915, ctx->id, vm_id);
+
+		batch[i] = MI_ATOMIC | MI_ATOMIC_INC;
+#define TARGET_BO_OFFSET	(0x1 << 16)
+		batch[++i] = TARGET_BO_OFFSET;
+		batch[++i] = 0;
+		batch[++i] = MI_BATCH_BUFFER_END;
+
+		obj[0] = gem_create(i915, 4096);
+		i915_vm_bind(i915, vm_id, TARGET_BO_OFFSET, obj[0], 0, 4096, 0, 0, 0);
+
+		for (i = 1; i < count + 1; ++i) {
+			obj[i] = gem_create(i915, 4096);
+			gem_write(i915, obj[i], 0, batch, sizeof(batch));
+
+			batch_addr[i - 1] = TARGET_BO_OFFSET * (i + 1);
+			i915_vm_bind(i915, vm_id, batch_addr[i - 1], obj[i], 0, 4096, 0, 0, 0);
+		}
+
+		exec_syncobj = syncobj_create(i915, 0);
+		exec_fence.handle = exec_syncobj;
+		exec_fence.flags = I915_TIMELINE_FENCE_SIGNAL;
+
+		memset(&execbuf, 0, sizeof(execbuf));
+		execbuf.ctx_id = ctx->id;
+		execbuf.batch_address = to_user_pointer(batch_addr);
+		execbuf.fence_count = 1;
+		execbuf.timeline_fences = to_user_pointer(&exec_fence);
+
+		/* Block parallel submission */
+		spin_ctx = ctx_create_engines(i915, siblings, count);
+		ahnd = get_simple_ahnd(i915, spin_ctx->id);
+		spin = __igt_spin_new(i915,
+				      .ahnd = ahnd,
+				      .ctx = spin_ctx,
+				      .engine = 0,
+				      .flags = IGT_SPIN_FENCE_OUT |
+				      IGT_SPIN_NO_PREEMPTION);
+
+		/* Wait for spinners to start */
+		usleep(5 * 10000);
+		igt_assert(fence_busy(spin->out_fence));
+
+		/* Submit parallel execbuf */
+		gem_execbuf3(i915, &execbuf);
+
+		/*
+		 * Wait long enough for timeslcing to kick in but not
+		 * preemption. Spinner + parallel execbuf should be
+		 * active. Assuming default timeslice / preemption values, if
+		 * these are changed it is possible for the test to fail.
+		 */
+		usleep(get_timeslice(i915, siblings[0]) * 2);
+		igt_assert(fence_busy(spin->out_fence));
+		igt_assert(syncobj_busy(i915, exec_syncobj));
+		check_bo(i915, obj[0], 0);
+
+		/*
+		 * End spinner and wait for spinner + parallel execbuf
+		 * to compelte.
+		 */
+		igt_spin_end(spin);
+		igt_assert(syncobj_timeline_wait(i915, &exec_syncobj, &fence_value, 1,
+						 gettime_ns() + (2 * NSEC_PER_SEC),
+						 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+		igt_assert(!syncobj_busy(i915, exec_syncobj));
+		syncobj_destroy(i915, exec_syncobj);
+		check_bo(i915, obj[0], count);
+
+		/* Clean up */
+		intel_ctx_destroy(i915, ctx);
+		intel_ctx_destroy(i915, spin_ctx);
+		i915_vm_unbind(i915, vm_id, TARGET_BO_OFFSET, 4096);
+		for (i = 1; i < count + 1; ++i)
+			i915_vm_unbind(i915, vm_id, batch_addr[i - 1], 4096);
+
+		for (i = 0; i < count + 1; ++i)
+			gem_close(i915, obj[i]);
+		free(siblings);
+		igt_spin_free(i915, spin);
+		put_ahnd(ahnd);
+	}
+
+	gem_vm_destroy(i915, vm_id);
+}
+
+static bool has_load_balancer(int i915)
+{
+	const intel_ctx_cfg_t cfg = {
+		.load_balance = true,
+		.num_engines = 1,
+	};
+	const intel_ctx_t *ctx = NULL;
+	int err;
+
+	err = __intel_ctx_create(i915, &cfg, &ctx);
+	intel_ctx_destroy(i915, ctx);
+
+	return err == 0;
+}
+
+static bool has_logical_mapping(int i915)
+{
+	struct drm_i915_query_engine_info *engines;
+	unsigned int i;
+
+	engines = query_engine_info(i915);
+
+	for (i = 0; i < engines->num_engines; ++i)
+		if (!(engines->engines[i].flags &
+		     I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE)) {
+			free(engines);
+			return false;
+		}
+
+	free(engines);
+	return true;
+}
+
+static bool has_parallel_execbuf(int i915)
+{
+	intel_ctx_cfg_t cfg = {
+		.parallel = true,
+		.num_engines = 1,
+	};
+	const intel_ctx_t *ctx = NULL;
+	int err;
+
+	/* Currently, parallel submission is only working with guc */
+	if (!gem_using_guc_submission(i915))
+		return false;
+
+	for (int class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *siblings;
+		unsigned int count;
+
+		siblings = list_engines(i915, 1u << class, &count);
+		if (!siblings)
+			continue;
+
+		if (count < 2) {
+			free(siblings);
+			continue;
+		}
+
+		logical_sort_siblings(i915, siblings, count);
+
+		cfg.width = count;
+		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
+		free(siblings);
+
+		err = __intel_ctx_create(i915, &cfg, &ctx);
+		intel_ctx_destroy(i915, ctx);
+
+		return err == 0;
+	}
+
+	return false;
+}
+
+igt_main
+{
+	int i915 = -1;
+
+	igt_fixture {
+		i915 = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(i915);
+
+		gem_require_contexts(i915);
+		igt_require(i915_vm_bind_version(i915) == 1);
+		igt_require(gem_has_engine_topology(i915));
+		igt_require(has_load_balancer(i915));
+		igt_require(has_perf_engines(i915));
+	}
+
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(has_logical_mapping(i915));
+			igt_require(has_parallel_execbuf(i915));
+		}
+
+		igt_describe("Ensure a parallel submit actually runs in parallel");
+		igt_subtest("parallel-ordering")
+			parallel_ordering(i915, 0);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 19293e38a..2ac10df2d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -369,6 +369,13 @@ test_executables += executable('gem_exec_balancer', 'i915/gem_exec_balancer.c',
 	   install : true)
 test_list += 'gem_exec_balancer'
 
+test_executables += executable('gem_exec3_balancer', 'i915/gem_exec3_balancer.c',
+	   dependencies : test_deps + [ lib_igt_perf ],
+	   install_dir : libexecdir,
+	   install_rpath : libexecdir_rpathdir,
+	   install : true)
+test_list += 'gem_exec3_balancer'
+
 test_executables += executable('gem_mmap_offset',
 	   join_paths('i915', 'gem_mmap_offset.c'),
 	   dependencies : test_deps + [ libatomic ],
-- 
2.21.0.rc0.32.g243a4c7e27
