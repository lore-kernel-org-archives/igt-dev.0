Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969BD10EA37
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 08:45:35 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] tests/xe/xe_perf_pmu: Test for engine busyness
Date: Fri,  8 Dec 2023 14:22:51 +0530
Message-Id: <20231208085251.3798137-4-riana.tauro@intel.com>
In-Reply-To: <20231208085251.3798137-1-riana.tauro@intel.com>
References: <20231208085251.3798137-1-riana.tauro@intel.com>
MIME-Version: 1.0
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
List-ID: <igt-dev@lists.freedesktop.org>

Engine busyness percentage is calculated by reading busy-ticks and
total-active-ticks. Add a test that runs a spinner and reads busy-ticks
and total active ticks to calculate engine busyness percentage
and checks if it is within tolerance.

% busyness = ((busy-ticks) * 100) / total-active-ticks

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 include/drm-uapi/xe_drm.h |  24 ++++++
 tests/intel/xe_perf_pmu.c | 151 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 590f7b7af..e60b14ec4 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1100,6 +1100,10 @@ struct drm_xe_wait_user_fence {
  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
  */
 
+enum drm_xe_pmu_engine_sample {
+	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
+};
+
 /*
  * Top bits of every counter are GT id.
  */
@@ -1108,10 +1112,30 @@ struct drm_xe_wait_user_fence {
 #define ___DRM_XE_PMU_OTHER(gt, x) \
 	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
 
+#define __DRM_XE_PMU_SAMPLE_BITS (4)
+#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
+#define __DRM_XE_PMU_CLASS_SHIFT \
+	(__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
+
+/*
+ * Engine configs offset - 0x1000
+ */
+#define __DRM_XE_PMU_ENGINE_OFFSET(gt) \
+	(___DRM_XE_PMU_OTHER(gt, 0xfff) + 1)
+
+#define __DRM_XE_PMU_ENGINE(gt, class, instance, sample) \
+	(((class) << __DRM_XE_PMU_CLASS_SHIFT | \
+	(instance) << __DRM_XE_PMU_SAMPLE_BITS | \
+	(sample)) + __DRM_XE_PMU_ENGINE_OFFSET(gt))
+
+#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
+	__DRM_XE_PMU_ENGINE(gt, class, instance, DRM_XE_PMU_SAMPLE_BUSY_TICKS)
+
 #define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
 #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
 #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
 #define DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 3)
+#define DRM_XE_PMU_TOTAL_ACTIVE_TICKS(gt)	___DRM_XE_PMU_OTHER(gt, 4)
 
 #if defined(__cplusplus)
 }
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index 42cf62729..28122e7a7 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -45,6 +45,30 @@ static int open_pmu(int fd, uint64_t config)
 	return perf_fd;
 }
 
+static int open_group(int fd, uint64_t config, int group)
+{
+	int perf_fd;
+
+	perf_fd = igt_perf_open_group(xe_perf_type_id(fd), config, group);
+	igt_skip_on(perf_fd < 0 && errno == ENODEV);
+	igt_assert(perf_fd >= 0);
+
+	return perf_fd;
+}
+
+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+{
+	uint64_t buf[2 + num];
+	unsigned int i;
+
+	igt_assert_eq(read(fd, buf, sizeof(buf)), sizeof(buf));
+
+	for (i = 0; i < num; i++)
+		val[i] = buf[2 + i];
+
+	return buf[1];
+}
+
 static uint64_t engine_group_get_config(int gt, int class)
 {
 	uint64_t config;
@@ -66,6 +90,123 @@ static uint64_t engine_group_get_config(int gt, int class)
 	return config;
 }
 
+static unsigned int measured_usleep(unsigned int usec)
+{
+	struct timespec ts = { };
+	unsigned int slept;
+
+	slept = igt_nsec_elapsed(&ts);
+	igt_assert(slept == 0);
+	do {
+		usleep(usec - slept);
+		slept = igt_nsec_elapsed(&ts) / 1000;
+	} while (slept < usec);
+
+	return igt_nsec_elapsed(&ts);
+}
+
+/**
+ * SUBTEST: engine-busy-ticks
+ * Description:
+ *      Run a test to measure the busy-ticks for each engine
+ *      and total active ticks by running a spinner. Calculate
+ *      the busy percentage. Check if the engine busyness%
+ *      is within tolerance
+ * Run type: FULL
+ */
+static void test_engine_busy_ticks(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
+	struct xe_spin *spin;
+	uint64_t busy_ticks, total_active_ticks;
+	uint64_t before[2], after[2];
+	double busy_percent;
+	uint32_t exec_queue;
+	uint32_t syncobj;
+	uint32_t bo = 0;
+	size_t bo_size;
+	int pmu_fd[2];
+	uint32_t vm;
+
+	pmu_fd[0] = open_group(fd, DRM_XE_PMU_ENGINE_BUSY_TICKS(eci->gt_id,
+								eci->engine_class,
+								eci->engine_instance), -1);
+	pmu_fd[1] = open_group(fd, DRM_XE_PMU_TOTAL_ACTIVE_TICKS(eci->gt_id), pmu_fd[0]);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
+	bo_size = sizeof(*spin);
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
+	spin = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	syncobj = syncobj_create(fd, 0);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	xe_spin_init(spin, &spin_opts);
+
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobj;
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = addr;
+	xe_exec(fd, &exec);
+
+	xe_spin_wait_started(spin);
+
+	pmu_read_multi(pmu_fd[0], 2, before);
+	measured_usleep(500000); /* 500ms */
+	pmu_read_multi(pmu_fd[0], 2, after);
+
+	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
+	xe_spin_end(spin);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	busy_ticks = after[0] - before[0];
+	total_active_ticks = after[1] - before[1];
+
+	busy_percent = (double)(busy_ticks * 100) / (double)total_active_ticks;
+
+	igt_debug("busy-ticks:  after %ld, before %ld delta %ld\n",
+		  after[0], before[0], busy_ticks);
+	igt_debug("total-active-ticks: after %ld, before %ld delta %ld\n",
+		  after[1], before[1], total_active_ticks);
+	igt_debug("busyness percent %f\n", busy_percent);
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobj);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(spin, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+	close(pmu_fd[0]);
+	close(pmu_fd[1]);
+
+	igt_assert(busy_percent >= 90 && busy_percent <= 110);
+}
+
 /**
  * Test: Basic test for measure the active time when engine of any class active
  *
@@ -324,6 +465,16 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_any_engine_busyness(fd, hwe);
 
+	igt_describe("Validate engine busyness");
+	igt_subtest("engine-busy-ticks") {
+		char buf[80];
+		bool has_busy_ticks = igt_perf_event_found(xe_perf_device
+							  (fd, buf, sizeof(buf)), "busy-ticks");
+		igt_require(has_busy_ticks);
+		xe_for_each_engine(fd, hwe)
+			test_engine_busy_ticks(fd, hwe);
+	}
+
 	igt_fixture {
 		xe_device_put(fd);
 		close(fd);
-- 
2.40.0
