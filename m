Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFCBCCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 09:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86D10E6E7;
	Wed,  5 Nov 2025 09:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQZuJJo0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F129610E6E7
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762335319; x=1793871319;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NeNm90aQZiOG5kShG0IU7medPKSCQaGo9to8WJ3csDI=;
 b=NQZuJJo0SccavboWbCS/WPXwETsBvuUnML5GC8jATSpV2Rluz3K54OpT
 G9KVpoXwLHA/u64SzOo7p2v/ApKmJUK+OS925Uki8q+cSFqu9HHUTvJEz
 xLxT1FYGjFHUloYPJ5bKmdvHjiLV7C/97N55f5LTsFepuRm5yE9LUmVxB
 ogD7h0bP6sbmhk0EJ/n3f8suO9Rt6xFTU/IxA7ddxiJTvVMuH8qToLyy1
 nxTt3hVyM9ulP3jHfBYqtH+9pkzVxYor4IFMUdo4SNA9R87S+BZ7sCPLE
 QLE1JvRFd5sYaBOgVFU2XYV2BZZup9aHFyNRCGOCqTusW3Gp2NA41+hbG Q==;
X-CSE-ConnectionGUID: cu3zgNsNR1GZSZymziAvlA==
X-CSE-MsgGUID: w0H7gpDGSaewXdh9WGaV9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64481781"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="64481781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 01:35:07 -0800
X-CSE-ConnectionGUID: aBNKoq7yQOaAvsJhZjCP1Q==
X-CSE-MsgGUID: UgMXvSqLT4yCIfnXngAtrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187860773"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2025 01:35:05 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v11 3/3] tests/intel/xe_compute: Add eu-busy-10s test
 for EU utilization measurement
Date: Wed,  5 Nov 2025 09:34:59 +0000
Message-ID: <20251105093459.55946-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105093459.55946-1-nishit.sharma@intel.com>
References: <20251105093459.55946-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Nishit Sharma <nishit.sharma@intel.com>

This test measures the utilization of available CCS instances based on the
number of slices reported in
/sys/class/drm/cardX/device/tileX/gtX/num_cslices. Compute workload is
scheduled on different CCS engines. The test runs workloads for fixed
duration using loop_kernel_duration. SR-IOV and CCS mode features are
mutually exclusive. This change updates the test to skip execution if
SR-IOV is enabled on the platform.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_compute.c | 290 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 2 files changed, 287 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index f8059b2d0..26ae37fce 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -19,9 +19,24 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#include "igt_perf.h"
+#include "igt_sriov_device.h"
+
 #define LOOP_DURATION_2s	(1000000ull * 2)
 #define DURATION_MARGIN		0.2
 
+struct thread_data {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	int class;
+	int fd;
+	int gt;
+	struct user_execenv *execenv;
+	struct drm_xe_engine_class_instance *eci;
+	bool *go;
+};
+
 static int gt_sysfs_open(int gt)
 {
 	int fd, gt_fd;
@@ -243,6 +258,244 @@ test_compute_kernel_loop(uint64_t loop_duration)
 	drm_close_driver(fd);
 }
 
+static void
+*intel_compute_thread(void *data)
+{
+	struct thread_data *t = (struct thread_data *)data;
+	char device[30];
+	uint64_t type;
+	uint32_t engine_class, engine_instance, gt_shift;
+	uint64_t engine_active_config, engine_total_config;
+	int ret, fd1, fd2;
+	uint64_t val[4];
+	uint64_t param_config;
+
+	pthread_mutex_lock(t->mutex);
+	while (*t->go == 0)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	type = igt_perf_type_id(xe_perf_device(t->fd, device, sizeof(device)));
+	igt_debug("type: %lx, device: %s\n", type, device);
+
+	perf_event_format(device, "gt", &gt_shift);
+	perf_event_format(device, "engine_class", &engine_class);
+	perf_event_format(device, "engine_instance", &engine_instance);
+
+	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
+	igt_assert_eq(ret, 0);
+	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
+	igt_assert_eq(ret, 0);
+
+	igt_debug("gt_id: %x, class: %x, instance: %x\n",
+		  t->eci->gt_id, t->eci->engine_class, t->eci->engine_instance);
+
+	/* Setting collective counters for compute engine available in t->eci */
+	param_config = (uint64_t)t->eci->gt_id << gt_shift |
+		       t->eci->engine_class << engine_class |
+		       t->eci->engine_instance << engine_instance;
+
+	fd1 = igt_perf_open_group(type, engine_active_config | param_config, -1);
+	fd2 = igt_perf_open_group(type, engine_total_config | param_config, fd1);
+
+	ret = read(fd1, val, sizeof(val));
+	igt_assert_eq(ret, sizeof(val));
+	igt_info("start - active: %ld, total: %ld, busyness: %.1f before scheduling on engine_instance :%d\n",
+		 val[2], val[3], (float)val[2] / (float)val[3] * 100.0, t->eci->engine_instance);
+
+	igt_assert_f(xe_run_intel_compute_kernel_on_engine(t->fd, t->eci, t->execenv,
+							   EXECENV_PREF_VRAM_IF_POSSIBLE),
+		     "Unable to run compute kernel successfully\n");
+
+	ret = read(fd1, val, sizeof(val));
+	igt_assert_eq(ret, sizeof(val));
+	igt_info("end - active: %ld, total: %ld, busyness: %.1f after scheduling on engine_instance :%d\n",
+		 val[2], val[3], (float)val[2] / (float)val[3] * 100.0, t->eci->engine_instance);
+
+	igt_assert_f(((float)val[2] / (float)val[3] * 100.0) > 95.0,
+		     "Engines are under utilizated\n");
+
+	close(fd1);
+	close(fd2);
+	return NULL;
+}
+
+static void
+igt_check_supported_pipeline(void)
+{
+	int fd;
+	unsigned int ip_ver;
+	const struct intel_compute_kernels *kernels;
+
+	fd = drm_open_driver(DRIVER_XE);
+	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	kernels = intel_compute_square_kernels;
+	drm_close_driver(fd);
+
+	while (kernels->kernel) {
+		if (ip_ver == kernels->ip_ver)
+			break;
+		kernels++;
+	}
+
+	/* skip if loop_kernel is not supported by pipeline */
+	if (!kernels->kernel || !kernels->loop_kernel)
+		igt_skip("loop_kernel not supported by pipeline\n");
+}
+
+static void
+igt_check_sriov(void)
+{
+	int fd = drm_open_driver(DRIVER_XE);
+
+	if (igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd)) {
+		drm_close_driver(fd);
+		igt_skip("Skipping test when SRIOV is enabled\n");
+	}
+	drm_close_driver(fd);
+}
+
+static void
+igt_store_ccs_mode(uint64_t gt_mask, int ccs_mode[], int size)
+{
+	int gt_fd, gt;
+	u32 num_slices;
+
+	for_each_bit(gt_mask, gt) {
+		if (!get_num_cslices(gt, &num_slices))
+			continue;
+
+		gt_fd = gt_sysfs_open(gt);
+		igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode[gt]);
+		close(gt_fd);
+	}
+}
+
+static void
+igt_restore_ccs_mode(int ccs_mode[], int size)
+{
+	uint64_t gt_mask = get_gt_mask();
+	u32 gt, num_slices;
+	int gt_fd;
+
+	for_each_bit(gt_mask, gt) {
+		if (!get_num_cslices(gt, &num_slices))
+			continue;
+
+		gt_fd = gt_sysfs_open(gt);
+		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", ccs_mode[gt]) > 0);
+		close(gt_fd);
+	}
+}
+
+/**
+ * SUBTEST: eu-busy-10s
+ * Functionality: OpenCL kernel
+ * Description: Run loop_kernel for duration_sec and observe EU business
+ */
+static void
+test_eu_busy(uint64_t duration_sec)
+{
+	struct user_execenv execenv = { 0 };
+	struct thread_data *threads_data;
+	struct drm_xe_engine_class_instance *hwe;
+	const struct intel_compute_kernels *kernels;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	u32 gt, n_threads = 0, iterations = 0, n_instances = 0, i;
+	bool go = false;
+	int ccs_mode, gt_fd, fd;
+	u32 num_slices, ip_ver;
+	uint64_t gt_mask = get_gt_mask();
+
+	for_each_bit(gt_mask, gt) {
+		if (!get_num_cslices(gt, &num_slices))
+			continue;
+
+		gt_fd = gt_sysfs_open(gt);
+		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
+		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
+		close(gt_fd);
+	}
+
+	igt_skip_on_f(ccs_mode <= 1, "Skipping test as ccs_mode <=1 not matching criteria :%d\n",
+		      ccs_mode);
+
+	fd = drm_open_driver(DRIVER_XE);
+
+	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	kernels = intel_compute_square_kernels;
+	while (kernels->kernel) {
+		if (ip_ver == kernels->ip_ver)
+			break;
+		kernels++;
+	}
+
+	/*
+	 * User should use different kernel if loop_kernel_duration not set
+	 * With loop kernel and loop duration it assumes we stop it via memory write
+	 *
+	 */
+
+	execenv.loop_kernel_duration = duration_sec;
+	execenv.kernel = kernels->loop_kernel;
+	execenv.kernel_size = kernels->loop_kernel_size;
+	drm_close_driver(fd);
+
+	gt_mask = get_gt_mask();
+
+	for_each_bit(gt_mask, gt) {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_for_each_engine(fd, hwe) {
+			igt_assert(hwe);
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+				++n_instances;
+		}
+		drm_close_driver(fd);
+	}
+
+	threads_data = calloc(n_instances, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	gt_mask = get_gt_mask();
+	fd = drm_open_driver(DRIVER_XE);
+	for_each_bit(gt_mask, gt) {
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->gt_id != gt ||
+			    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			threads_data[i].mutex = &mutex;
+			threads_data[i].cond = &cond;
+			threads_data[i].fd = fd;
+			threads_data[i].eci = hwe;
+			threads_data[i].go = &go;
+			threads_data[i].execenv = &execenv;
+			++n_threads;
+			pthread_create(&threads_data[i].thread, 0, intel_compute_thread,
+				       &threads_data[i]);
+			++i;
+			++iterations;
+		}
+		pthread_mutex_lock(&mutex);
+		go = true;
+		pthread_cond_broadcast(&cond);
+		pthread_mutex_unlock(&mutex);
+
+		for (int val = 0; val < i; ++val)
+			pthread_join(threads_data[val].thread, NULL);
+
+		i = 0;
+		n_threads = 0;
+		iterations = 0;
+	}
+	free(threads_data);
+	drm_close_driver(fd);
+}
+
 /**
  * SUBTEST: compute-square
  * Mega feature: WMTP
@@ -262,10 +515,15 @@ test_compute_square(int fd)
 
 igt_main
 {
-	int xe;
+	int xe, ccs_mode[4];
+	unsigned int ip_ver;
+	uint64_t gt_mask;
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		ip_ver = intel_graphics_ver(intel_get_drm_devid(xe));
+		gt_mask = get_gt_mask();
+		igt_store_ccs_mode(gt_mask, ccs_mode, sizeof(ccs_mode));
 	}
 
 	igt_subtest("compute-square")
@@ -275,13 +533,37 @@ igt_main
 		drm_close_driver(xe);
 
 	/* ccs mode tests should be run without open gpu file handles */
-	igt_subtest("ccs-mode-basic")
+	igt_subtest("ccs-mode-basic") {
+		/* skip if sriov enabled */
+		igt_check_sriov();
 		test_ccs_mode();
+	}
 
-	igt_subtest("ccs-mode-compute-kernel")
+	igt_subtest("ccs-mode-compute-kernel") {
+		/* skip if sriov enabled */
+		igt_check_sriov();
 		test_compute_kernel_with_ccs_mode();
+	}
 
 	/* To test compute function stops after loop_kernel_duration */
-	igt_subtest("loop-duration-2s")
+	igt_subtest("loop-duration-2s") {
+		/* skip test if loop_kernel not supported in pipeline */
+		if (ip_ver < IP_VER(20, 0))
+			igt_check_supported_pipeline();
+
 		test_compute_kernel_loop(LOOP_DURATION_2s);
+	}
+
+	/* test to check available EU utilisation in multi-ccs case */
+	igt_subtest("eu-busy-10s") {
+		/* skip if sriov enabled */
+		igt_check_sriov();
+
+		/* skip test if loop_kernel not supported in pipeline */
+		if (ip_ver < IP_VER(20, 0))
+			igt_check_supported_pipeline();
+
+		test_eu_busy(5 * LOOP_DURATION_2s);
+		igt_restore_ccs_mode(ccs_mode, sizeof(ccs_mode));
+	}
 }
diff --git a/tests/meson.build b/tests/meson.build
index a7b9375ed..a7ffc6383 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -408,6 +408,7 @@ extra_dependencies = {
 	'sw_sync': [ libatomic ],
 	'xe_fault_injection': [ lib_igt_xe_oa ],
 	'xe_oa': [ lib_igt_xe_oa ],
+        'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
 }
 
 test_executables = []
-- 
2.43.0

