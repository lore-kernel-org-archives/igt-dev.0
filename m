Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6835010E30F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 16:31:29 +0000 (UTC)
From: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 22:01:53 +0530
Message-Id: <20230627163153.1755550-1-venkata.ramana.nayana@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/xe/perf_pmu: Tests for the XE pmu interface
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

There are set of engine group busyness counters provided by HW which are
exposed via PMU events. Adding a basic unit tests to read those counters.

Signed-off-by: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
---
 include/drm-uapi/xe_drm.h |  21 +++
 lib/igt_perf.c            |  36 ++++
 lib/igt_perf.h            |   5 +
 tests/meson.build         |   1 +
 tests/xe/xe_perf_pmu.c    | 335 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 398 insertions(+)
 create mode 100644 tests/xe/xe_perf_pmu.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 432bd87ca..7bfd46c02 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -732,6 +732,27 @@ struct drm_xe_engine_create {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: perf_events exposed by xe through /sys/bus/event_sources/drivers/xe
+ *
+ */
+
+
+/* PMU event config IDs */
+
+/*
+ * Top 4 bits of every counter are GT id.
+ */
+#define __XE_PMU_GT_SHIFT (60)
+
+#define ___XE_PMU_OTHER(gt, x) \
+	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
+
+#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
+#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
+#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
+#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
+
 struct drm_xe_engine_get_property {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index ffe078adc..3866c6d77 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -69,6 +69,36 @@ const char *i915_perf_device(int i915, char *buf, int buflen)
 	return buf;
 }
 
+const char *xe_perf_device(int xe, char *buf, int buflen)
+{
+	char *s;
+	char pref[] = "xe_";
+	int len = strlen(pref);
+
+
+	if (!buf || buflen < len)
+		return "xe";
+
+	memcpy(buf, pref, len);
+
+	if (!bus_address(xe, buf + len, buflen - len))
+		buf[len - 1] = '\0';
+
+	/* Convert all colons in the address to '_', thanks perf! */
+	for (s = buf; *s; s++)
+		if (*s == ':')
+			*s = '_';
+
+	return buf;
+}
+
+uint64_t xe_perf_type_id(int xe)
+{
+	char buf[80];
+
+	return igt_perf_type_id(xe_perf_device(xe, buf, sizeof(buf)));
+}
+
 uint64_t i915_perf_type_id(int i915)
 {
 	char buf[80];
@@ -147,6 +177,12 @@ int perf_igfx_open_group(uint64_t config, int group)
 			  PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_GROUP);
 }
 
+int perf_xe_open(int xe, uint64_t config)
+{
+	return _perf_open(xe_perf_type_id(xe), config, -1,
+			PERF_FORMAT_TOTAL_TIME_ENABLED);
+}
+
 int perf_i915_open(int i915, uint64_t config)
 {
 	return _perf_open(i915_perf_type_id(i915), config, -1,
diff --git a/lib/igt_perf.h b/lib/igt_perf.h
index 4d86e31ae..3d9ba2917 100644
--- a/lib/igt_perf.h
+++ b/lib/igt_perf.h
@@ -61,10 +61,15 @@ int igt_perf_open_group(uint64_t type, uint64_t config, int group);
 const char *i915_perf_device(int i915, char *buf, int buflen);
 uint64_t i915_perf_type_id(int i915);
 
+const char *xe_perf_device(int xe, char *buf, int buflen);
+uint64_t xe_perf_type_id(int);
+
 int perf_igfx_open(uint64_t config);
 int perf_igfx_open_group(uint64_t config, int group);
 
 int perf_i915_open(int i915, uint64_t config);
 int perf_i915_open_group(int i915, uint64_t config, int group);
 
+int perf_xe_open(int xe, uint64_t config);
+
 #endif /* I915_PERF_H */
diff --git a/tests/meson.build b/tests/meson.build
index 85ea7e74e..e64d8232e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -270,6 +270,7 @@ xe_progs = [
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
+	'xe_perf_pmu',
 ]
 
 msm_progs = [
diff --git a/tests/xe/xe_perf_pmu.c b/tests/xe/xe_perf_pmu.c
new file mode 100644
index 000000000..97c2f84a3
--- /dev/null
+++ b/tests/xe/xe_perf_pmu.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for verify pmu perf interface
+ * Category: Hardware building block
+ * Sub-category: pmu interface
+ * Functionality: pmu
+ * Test category: functionality test
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "lib/igt_perf.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+#define MAX_INSTANCE 9
+
+static uint64_t pmu_read(int fd)
+{
+	uint64_t  data[2];
+
+	igt_assert_eq(read(fd, data, sizeof(data)), sizeof(data));
+
+	return data[0];
+}
+
+static int open_pmu(int fd, uint64_t config)
+{
+	int perf_fd;
+
+	perf_fd = perf_xe_open(fd, config);
+	igt_skip_on(perf_fd < 0 && errno == ENODEV);
+	igt_assert(perf_fd >= 0);
+
+	return perf_fd;
+}
+
+static uint64_t engine_group_get_config(int gt, int class)
+{
+	uint64_t config;
+
+	switch (class) {
+	case DRM_XE_ENGINE_CLASS_COPY:
+		config = XE_PMU_COPY_GROUP_BUSY(gt);
+		break;
+	case DRM_XE_ENGINE_CLASS_RENDER:
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		config = XE_PMU_RENDER_GROUP_BUSY(gt);
+		break;
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		config = XE_PMU_MEDIA_GROUP_BUSY(gt);
+		break;
+	}
+
+	return config;
+}
+
+/**
+ * Test: Basic test for measure the active time when engine of any class active
+ *
+ * SUBTEST: any-engine-group-busy
+ * Description:
+ *      Run a test to measure the global activity time by submitting
+ *      the WL to all existing engines.
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t engine;
+	uint32_t syncobj;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct xe_spin *spin;
+	uint32_t pmu_fd;
+	uint64_t count, idle = 0;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*spin);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	spin = xe_bo_map(fd, bo, bo_size);
+
+	engine = xe_engine_create(fd, vm, eci, 0);
+	syncobj = syncobj_create(fd, 0);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	pmu_fd = open_pmu(fd, XE_PMU_ANY_ENGINE_GROUP_BUSY(eci->gt_id));
+
+	xe_spin_init(spin, addr, false);
+
+	sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+	sync[1].handle = syncobj;
+
+	exec.engine_id = engine;
+	exec.address = addr;
+	xe_exec(fd, &exec);
+
+	xe_spin_wait_started(spin);
+	usleep(50000);
+
+	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
+	xe_spin_end(spin);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobj);
+
+	count = pmu_read(pmu_fd);
+	igt_assert_lt_u64(idle, count);
+	igt_debug("Incrementing counter all-busy-group %ld ns\n", count);
+
+	xe_engine_destroy(fd, engine);
+	munmap(spin, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+	close(pmu_fd);
+}
+
+/**
+ * Test: Basic test for measure the active time across engine class
+ *
+ * SUBTEST: render-busy
+ * Description:
+ *	Run a test to measure the active engine class time by submitting the
+ *	WL to all instances of a class
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: compute-busy
+ * Description: Run copy-group-busy test
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: copy-busy
+ * Description: Run copy-group-busy test
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: vcs-busy
+ * Description: Run copy-group-busy test
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ * SUBTEST: vecs-busy
+ * Description: Run copy-group-busy test
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ *
+ */
+
+static void test_engine_group_busyness(int fd, int gt, int class, const char *name)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t engines[MAX_INSTANCE];
+	uint32_t syncobjs[MAX_INSTANCE];
+	int    pmu_fd;
+	size_t bo_size;
+	uint32_t bo = 0, i = 0;
+	struct {
+		struct xe_spin spin;
+	} *data;
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	int num_placements = 0;
+	uint64_t config, count, idle = 0;
+
+	config = engine_group_get_config(gt, class);
+
+	xe_for_each_hw_engine(fd, hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+
+		eci[num_placements++] = *hwe;
+	}
+
+	if (!num_placements) {
+		igt_info("Engine class:%d gt:%d not enabled on this platform\n", class, gt);
+		return;
+	}
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+	bo_size = sizeof(*data) * num_placements;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, gt, vm, bo_size);
+	data = xe_bo_map(fd, bo, bo_size);
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
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	pmu_fd = open_pmu(fd, config);
+
+	for (i = 0; i < num_placements; i++) {
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t spin_addr = addr + spin_offset;
+
+		xe_spin_init(&data[i].spin, spin_addr, false);
+		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
+		sync[1].handle = syncobjs[i];
+
+		exec.engine_id = engines[i];
+		exec.address = spin_addr;
+		xe_exec(fd, &exec);
+		xe_spin_wait_started(&data[i].spin);
+	}
+
+	for (i = 0; i < num_placements; i++) {
+		xe_spin_end(&data[i].spin);
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	}
+
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < num_placements; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_engine_destroy(fd, engines[i]);
+	}
+
+	count = pmu_read(pmu_fd);
+	igt_assert_lt_u64(idle, count);
+	igt_debug("Incrementing counter %s-gt-%d  %ld ns\n", name, gt, count);
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+	close(pmu_fd);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		int class;
+	} sections[] = {
+		{ "render-busy", DRM_XE_ENGINE_CLASS_RENDER },
+		{ "compute-busy", DRM_XE_ENGINE_CLASS_COMPUTE },
+		{ "copy-busy", DRM_XE_ENGINE_CLASS_COPY },
+		{ "vcs-busy", DRM_XE_ENGINE_CLASS_VIDEO_DECODE },
+		{ "vecs-busy", DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE },
+		{ NULL },
+	};
+	int gt;
+	int class;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("%s", s->name)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
+					if (class == s->class)
+						test_engine_group_busyness(fd, gt, class, s->name);
+	}
+
+	igt_subtest("any-engine-group-busy")
+		xe_for_each_hw_engine(fd, hwe)
+			test_any_engine_busyness(fd, hwe);
+
+	igt_fixture {
+		xe_device_put(fd);
+		close(fd);
+	}
+}
-- 
2.25.1
