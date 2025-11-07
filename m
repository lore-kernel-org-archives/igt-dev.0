Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36440CCFA18
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 15:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9AB10EAF6;
	Fri,  7 Nov 2025 15:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0/lh/FU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7760D10EAFC
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 15:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762528526; x=1794064526;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8HFVGRN1MxiYRw2BppGhZ8FFikFzEDaDnfdRY02AEEA=;
 b=U0/lh/FUvMwDq2S3uYuKFl3ruViIvpyL/FSxsre6g/s3majJRliO8fji
 zNpYMEcl4Q75/mAZtkA45KpjhEps3TnQuZWo5Zzxo6v6VHCz8psxHmGTg
 qB7HhT/PZvUJwstaa93WLP5UhOUEHFnpVQfTCxKjoxSlxsXpMIbV4bDjx
 jWLVNHf0o9Mg/EwaUbuQO7ihjI+YBBEdKSn0STayxCWzqrxtXQRslP7uE
 idVtgneQ1nm7mZ4rKtuu4XtXpgYwAVe3Rev9RtpQ7XOgTmA/OW9bM5Ftp
 nmdIHh52UgaOQfiORRCjQ4Sgshur7aaAowcHODeBWmGpJugGkfwHbs7Us g==;
X-CSE-ConnectionGUID: kGz1fpMNR+KdIwbutL3p7w==
X-CSE-MsgGUID: 4KbSWOjDRZWj6RYbuNBzAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64773453"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64773453"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 07:15:26 -0800
X-CSE-ConnectionGUID: n8V1f6qRSZyQuaQnsnwcGg==
X-CSE-MsgGUID: t6uk6A1FT3q3g8bYuQUCHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193087167"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2025 07:15:24 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v14 3/3] tests/intel/xe_compute: Add eu-busy-10s test
 for EU utilization measurement
Date: Fri,  7 Nov 2025 15:15:19 +0000
Message-ID: <20251107151519.66692-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107151519.66692-1-nishit.sharma@intel.com>
References: <20251107151519.66692-1-nishit.sharma@intel.com>
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
 tests/intel/xe_compute.c | 289 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 2 files changed, 286 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 192cbf492..995d93dfb 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -19,8 +19,26 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#include "igt_perf.h"
+#include "igt_sriov_device.h"
+
 #define LOOP_DURATION_2s	(1000000ull * 2)
 #define DURATION_MARGIN		0.2
+#define MIN_BUSYNESS		95.0
+
+bool sriov_enabled;
+
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
 
 static int gt_sysfs_open(int gt)
 {
@@ -247,6 +265,234 @@ test_compute_kernel_loop(uint64_t loop_duration)
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
+	igt_assert_f(((float)val[2] / (float)val[3] * 100.0) > MIN_BUSYNESS,
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
+static bool is_sriov_mode(int fd)
+{
+	bool is_sriov = false;
+
+	if (igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd))
+		is_sriov = true;
+
+	return is_sriov;
+}
+
+static void
+igt_store_ccs_mode(int ccs_mode[], int size)
+{
+	uint64_t gt_mask;
+	uint32_t gt, num_slices;
+	int gt_fd;
+
+	gt_mask = get_gt_mask();
+	for_each_bit(gt_mask, gt) {
+		if (!get_num_cslices(gt, &num_slices))
+			continue;
+		igt_assert(gt < size);
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
+	uint32_t gt, num_slices;
+	int gt_fd;
+
+	for_each_bit(gt_mask, gt) {
+		if (!get_num_cslices(gt, &num_slices))
+			continue;
+		igt_assert(gt < size);
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
+	u32 gt, n_instances = 0, i;
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
+	if (!kernels->loop_kernel_size)
+		drm_close_driver(fd);
+	igt_assert(kernels->loop_kernel_size);
+
+	/*
+	 * User should use different kernel if loop_kernel_duration not set
+	 * With loop kernel and loop duration it assumes we stop it via memory write
+	 *
+	 */
+	execenv.loop_kernel_duration = duration_sec;
+	execenv.kernel = kernels->loop_kernel;
+	execenv.kernel_size = kernels->loop_kernel_size;
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+			++n_instances;
+	}
+
+	threads_data = calloc(n_instances, sizeof(*threads_data));
+	if (!threads_data)
+		drm_close_driver(fd); /* drop reference for retrieve ccs_mode */
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	i = 0;
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		threads_data[i].fd = fd;
+		threads_data[i].eci = hwe;
+		threads_data[i].go = &go;
+		threads_data[i].execenv = &execenv;
+		pthread_create(&threads_data[i].thread, 0, intel_compute_thread,
+			       &threads_data[i]);
+		++i;
+	}
+	pthread_mutex_lock(&mutex);
+	go = true;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (int n = 0; n < i; ++n)
+		pthread_join(threads_data[n].thread, NULL);
+
+	free(threads_data);
+
+	drm_close_driver(fd);
+}
+
 /**
  * SUBTEST: compute-square
  * Mega feature: WMTP
@@ -266,10 +512,14 @@ test_compute_square(int fd)
 
 igt_main
 {
-	int xe;
+	int xe, ccs_mode[4];
+	unsigned int ip_ver;
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		sriov_enabled = is_sriov_mode(xe);
+		ip_ver = intel_graphics_ver(intel_get_drm_devid(xe));
+		igt_store_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
 	}
 
 	igt_subtest("compute-square")
@@ -279,13 +529,44 @@ igt_main
 		drm_close_driver(xe);
 
 	/* ccs mode tests should be run without open gpu file handles */
-	igt_subtest("ccs-mode-basic")
+	igt_subtest("ccs-mode-basic") {
+		/* skip if sriov enabled */
+		if (sriov_enabled)
+			igt_skip("Skipping test when SRIOV is enabled\n");
 		test_ccs_mode();
+	}
 
-	igt_subtest("ccs-mode-compute-kernel")
+	igt_subtest("ccs-mode-compute-kernel") {
+		/* skip if sriov enabled */
+		if (sriov_enabled)
+			igt_skip("Skipping test when SRIOV is enabled\n");
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
+		if (sriov_enabled)
+			igt_skip("Skipping test when SRIOV is enabled\n");
+
+		/* skip test if loop_kernel not supported in pipeline */
+		if (ip_ver < IP_VER(20, 0))
+			igt_check_supported_pipeline();
+
+		test_eu_busy(5 * LOOP_DURATION_2s);
+	}
+
+	igt_fixture {
+		if (!sriov_enabled)
+			igt_restore_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
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

