Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E3BCCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 11:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4843E10E385;
	Fri,  3 Oct 2025 11:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln975da5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E04110E385
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759491116; x=1791027116;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UIJRfsLB/8L6yUu00/KQqu+xNilReTOiMSHajmhCC5M=;
 b=Ln975da5OQmVh09ANGftAtKYVn9d8KbG8E13A0GSqs5a3C3sXlXHRufc
 weoe9OQikHpHaP6vzpeio6+4/P/Rbpl6DUMulRFzZhlsu5ftzZMStxWqB
 pX/jolbumxBuU1KvLLdSzmhbjlhIAMKPXc+Hc9afW+IL4p7Yw5+bLR47L
 zbffuJ8IgetCsk6izEaU6Yl2yd+aEsi1297BVO1RXtjYqhdLDZJ4mQLDU
 oDgelPc3MmgafoI0QXrzk1Bajpzk/xh1bjCHqIBPOit6ZJy0osXLuku3w
 A5T7Z/CPsFhzc8T0+dTX38nsJIwKLYO67J5cNB8s3zGVjJgwAhVZhHs/Y w==;
X-CSE-ConnectionGUID: S/i8B+ScRnGP5hCvJ37S7A==
X-CSE-MsgGUID: Kzg7BAKPReSmvC5nyxrgOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61874916"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="61874916"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:31:56 -0700
X-CSE-ConnectionGUID: m342eIpeR5yxzGSa0Z0p6g==
X-CSE-MsgGUID: MK8p0wU8SeeoxvT9hfhdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183677174"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa005.fm.intel.com with ESMTP; 03 Oct 2025 04:31:54 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v6 3/3] tests/intel/xe_compute: Add eu-busy-10s test
Date: Fri,  3 Oct 2025 11:31:49 +0000
Message-ID: <20251003113149.262620-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003113149.262620-1-nishit.sharma@intel.com>
References: <20251003113149.262620-1-nishit.sharma@intel.com>
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

Add multi threading to utilize available CCS instances as per num_slices
available in /sys/class/drm/cardX/device/tileX/gtX/num_cslices.
Depending upon num_slices, number of threads will be created and
schedule compute workload in different CCS instances. Sleep is
called via loop_kernel_duration so that HW engine runs for sleep duration.
During execution per EU utlization percentage is grabbed and displayed
on console. Added igt_skip() if sriov is enabled in platform, so if
sriov_numvfs > 0 then test will be skipped.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_compute.c | 273 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 2 files changed, 273 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index f8059b2d0..6596025cf 100644
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
@@ -243,6 +258,233 @@ test_compute_kernel_loop(uint64_t loop_duration)
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
+		   t->eci->gt_id, t->eci->engine_class, t->eci->engine_instance);
+
+	/* Setting collective counters for compute engine available in t->eci */
+	param_config = (uint64_t)t->eci->gt_id << gt_shift |
+		       t->eci->engine_class << engine_class |
+		       t->eci->engine_instance << engine_instance;
+
+	fd1 = igt_perf_open_group(type, engine_active_config | param_config, -1);
+	fd2 = igt_perf_open_group(type, engine_total_config | param_config, fd1);
+	igt_debug("fd1: %d, fd2: %d\n", fd1, fd2);
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
+	igt_assert_f(((float)val[2] / (float)val[3] * 100.0) > 50.0,
+		     "Engines utilization is below 50 perc\n");
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
+
+	while (kernels->kernel) {
+		if (ip_ver == kernels->ip_ver)
+			break;
+		kernels++;
+	}
+
+	/* skip if loop_kernel is not supported by pipeline */
+	if (!kernels->kernel || !kernels->loop_kernel) {
+		drm_close_driver(fd);
+		igt_skip("loop_kernel not supported by pipeline\n");
+	} else {
+		igt_info("loop kernel supported by pipeline\n");
+		drm_close_driver(fd);
+	}
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
+igt_set_ccs_default_value(int ccs_mode[], int size)
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
@@ -262,10 +504,22 @@ test_compute_square(int fd)
 
 igt_main
 {
-	int xe;
+	int xe, ccs_mode[4], gt_fd, gt;
+	unsigned int ip_ver;
+	u32 num_slices;
+	uint64_t gt_mask = get_gt_mask();
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		ip_ver = intel_graphics_ver(intel_get_drm_devid(xe));
+		for_each_bit(gt_mask, gt) {
+			if (!get_num_cslices(gt, &num_slices))
+				continue;
+
+			gt_fd = gt_sysfs_open(gt);
+			igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode[gt]);
+			close(gt_fd);
+		}
 	}
 
 	igt_subtest("compute-square")
@@ -284,4 +538,21 @@ igt_main
 	/* To test compute function stops after loop_kernel_duration */
 	igt_subtest("loop-duration-2s")
 		test_compute_kernel_loop(LOOP_DURATION_2s);
+
+	/* test to check available EU utilisation in multi-ccs case */
+	igt_subtest("eu-busy-10s") {
+		/* skip test if loop_kernel not supported in pipeline */
+		if (ip_ver < IP_VER(20, 0))
+			igt_check_supported_pipeline();
+
+		/* skip if sriov enabled */
+		igt_check_sriov();
+
+		test_eu_busy(5 * LOOP_DURATION_2s);
+		/* calling sleep to make sure EUs done with execution */
+		sleep(3);
+	}
+
+	igt_fixture
+		igt_set_ccs_default_value(ccs_mode, sizeof(ccs_mode));
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

