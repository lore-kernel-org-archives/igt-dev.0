Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2686C83F27
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 13:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A3F10E2A4;
	Tue, 22 Jul 2025 13:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcWQ/aRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA4410E2A4
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753191060; x=1784727060;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vy2VfRlp76BFleNEDveFFTVmNmXlZdsCJXXSG1XqaeM=;
 b=EcWQ/aRrmW6SDYvoCfGawRCv+4TWt6r8U0hREoE8hjNFbKljO9f5rH5S
 RMycD7xKWoWwIMwniybK/H4Swg8Anb25ebWmyveJjXuhuViGwDlzni2ro
 wJa9yC7U+Vejqj4QwMJb4/szIUSVw+OWRUiOIWzI1zfOhbPAh883IvnF0
 ktddPcRETIqW6ASyAWn46zSHeL6T6YUjOb1qBNtRxtzdUZic520BvflMN
 rJbxkVAYoo8zS/jf7CzetNrKuWxdjnZ0RbT1nvdDCksenlyaXmSvNe6RD
 ehNythjTydO9iW7kPoco9mbWqdNojJKvqFgYQu+4XwjR7yswyihtwjj90 g==;
X-CSE-ConnectionGUID: x7FhhDcbS0K2tW8dFq3wCw==
X-CSE-MsgGUID: 3X/tdwQdS5q8HZ171mUFjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66781194"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="66781194"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:31:00 -0700
X-CSE-ConnectionGUID: wSBx1UvyQIaQr4dYQCsqeA==
X-CSE-MsgGUID: XJ4NVUNRRx+TG+wHsCXEPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="158461021"
Received: from dut2943pvc.iind.intel.com ([10.190.215.47])
 by orviesa010.jf.intel.com with ESMTP; 22 Jul 2025 06:30:58 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v12] tests/intel/xe_compute: Add Compute workload
 Scheduling
Date: Tue, 22 Jul 2025 13:30:56 +0000
Message-ID: <20250722133056.139441-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

Adds compute workload scheduling and execution on multiple CCS engines
available. This also adds logic to show EU busyness information on console
during workload execution on multiple CCS engine instances.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/intel_compute.c      |  34 ++-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 451 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 4 files changed, 481 insertions(+), 7 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..d9e446488 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -255,8 +255,14 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 				break;
 			}
 
-			bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
-							 placement, flags);
+			if (!execenv->user)
+				bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
+								 placement, flags);
+			else if (execenv->user)
+				bo_dict[i].handle = xe_bo_create_caching(fd, execenv->vm,
+									 bo_dict[i].size,
+									 placement, flags,
+									 DRM_XE_GEM_CPU_CACHING_WC);
 			bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
 			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
 					 bo_dict[i].size, &sync, 1);
@@ -1849,10 +1855,26 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				    OFFSET_KERNEL, 0, false,
 				    execenv.array_size);
 
-	bo_execenv_exec(&execenv, ADDR_BATCH);
-
-	if (!user || (user && !user->skip_results_check))
-		bo_check_square(input_data, output_data, execenv.array_size);
+	if (user && user->loop_kernel_duration) {
+		bo_execenv_exec_async(&execenv, ADDR_BATCH);
+		igt_measured_usleep(user->loop_kernel_duration);
+		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
+		bo_execenv_sync(&execenv);
+		user->skip_results_check = 1;
+	} else
+		bo_execenv_exec(&execenv, ADDR_BATCH);
+
+	for (int i = 0; i < execenv.array_size; i++) {
+		float input = input_data[i];
+		float output = output_data[i];
+		float expected_output = input * input;
+
+		if (output != expected_output)
+			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
+					i, input, output, expected_output);
+		if (!user || (user && !user->skip_results_check))
+			bo_check_square(input_data, output_data, execenv.array_size);
+	}
 
 	bo_execenv_unbind(&execenv, bo_dict, entries);
 	bo_execenv_destroy(&execenv);
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 412791d07..19977933f 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -63,6 +63,8 @@ struct user_execenv {
 	uint64_t input_addr;
 	/** @output_addr: override default address of the output array if provided */
 	uint64_t output_addr;
+	/** @loop_kernel_duration: duration till kernel should execute in gpu **/
+	uint32_t loop_kernel_duration;
 };
 
 enum execenv_alloc_prefs {
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 5e9140902..9db819c15 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -12,6 +12,7 @@
  */
 
 #include <string.h>
+#include <sys/ioctl.h>
 
 #include "igt.h"
 #include "igt_sysfs.h"
@@ -19,6 +20,60 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#include "igt_perf.h"
+
+/**
+ * Number of supported drivers needs to be adjusted as per the length of
+ * the drivers[] array.
+ */
+#define	LOOP_DURATION	(1000000ull)
+#define NS_SLEEP	(1000000ull)
+#define engine_ptr(pmu_device, n)	(&(pmu_device)->engine + (n))
+
+bool eu_busy;
+double eu_perc;
+
+struct xe_pmu_pair {
+	uint64_t cur;
+	uint64_t prev;
+};
+
+struct xe_pmu_counter {
+	uint64_t type;
+	uint64_t config;
+	unsigned int idx;
+	struct xe_pmu_pair val;
+	int fd;
+	bool present;
+};
+
+struct xe_engine {
+	const char *name;
+	struct drm_xe_engine_class_instance drm_xe_engine;
+	struct xe_pmu_counter engine_active_ticks;
+	struct xe_pmu_counter engine_total_ticks;
+};
+
+struct xe_pmu_device {
+	unsigned int num_engines;
+	unsigned int num_counters;
+	int fd;
+	char *device;
+	struct xe_engine engine;
+};
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
+
 static int gt_sysfs_open(int gt)
 {
 	int fd, gt_fd;
@@ -203,12 +258,402 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
+static void
+*intel_compute_thread(void *data)
+{
+	struct thread_data *t = (struct thread_data *)data;
+
+	pthread_mutex_lock(t->mutex);
+	while (*t->go == 0)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	igt_info("Compute kernel executing on engine class :%s instance :%d gt: GT-%d\n",
+			xe_engine_class_string(t->eci->engine_class), t->eci->engine_instance,
+			t->eci->gt_id);
+
+	igt_assert_f(xe_run_intel_compute_kernel_on_engine(t->fd,
+				t->eci,
+				t->execenv,
+				EXECENV_PREF_VRAM_IF_POSSIBLE),
+			"Unable to run compute kernel successfully\n");
+	return NULL;
+}
+
+bool stop_top;
+
+static char *pmu_name(int fd)
+{
+	char device[30];
+
+	xe_perf_device(fd, device, sizeof(device));
+
+	return strdup(device);
+}
+
+static int
+_open_pmu(uint64_t type, unsigned int *cnt,
+	  struct xe_pmu_counter *pmu, int *fd)
+{
+	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
+
+	if (fd__ >= 0) {
+		if (*fd == -1)
+			*fd = fd__;
+		pmu->present = true;
+		pmu->idx = (*cnt)++;
+		pmu->fd = fd__;
+	}
+
+	return fd__;
+}
+
+static struct xe_pmu_device
+*xe_init_engines(int dev_fd)
+{
+	struct xe_pmu_device *engines;
+	int ret = 0, engine_count = 0;
+	char device[30];
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+	uint32_t engine_class, engine_instance, gt_shift;
+	uint64_t engine_active_config, engine_total_config;
+	uint64_t type = igt_perf_type_id(xe_perf_device(dev_fd, device, sizeof(device)));
+
+	xe_device_get(dev_fd);
+
+	xe_for_each_engine(dev_fd, hwe)
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+			engine_count++;
+
+	engines = calloc(1, sizeof(struct xe_pmu_device) +
+			engine_count * sizeof(struct xe_engine));
+	if (!engines)
+		return NULL;
+
+	engines->num_engines = 0;
+	engines->device = pmu_name(dev_fd);
+	engines->fd = -1;
+	engines->num_counters = 0;
+
+	perf_event_format(engines->device, "gt", &gt_shift);
+	perf_event_format(engines->device, "engine_class", &engine_class);
+	perf_event_format(engines->device, "engine_instance", &engine_instance);
+	ret = perf_event_config(engines->device,
+			"engine-active-ticks",
+			&engine_active_config);
+	if (ret < 0)
+		return NULL;
+	ret = perf_event_config(engines->device,
+			"engine-total-ticks",
+			&engine_total_config);
+	if (ret < 0)
+		return NULL;
+	xe_for_each_engine(dev_fd, hwe) {
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+			uint64_t  param_config;
+			struct xe_engine *engine;
+
+			engine = engine_ptr(engines, engines->num_engines);
+			param_config = (uint64_t)hwe->gt_id << gt_shift |
+						hwe->engine_class << engine_class |
+						hwe->engine_instance << engine_instance;
+			engine->drm_xe_engine = *hwe;
+			engine->engine_active_ticks.config = engine_active_config | param_config;
+			engine->engine_total_ticks.config = engine_total_config | param_config;
+
+			if (engine->engine_active_ticks.config == -1 ||
+					engine->engine_total_ticks.config == -1) {
+				ret = ENOENT;
+				break;
+			}
+
+			if (ret <= 0) {
+				ret = errno;
+				break;
+			}
+
+			fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
+					&engines->fd);
+			if (fd < 0)
+				return NULL;
+
+			fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
+					&engines->fd);
+			if (fd < 0)
+				return NULL;
+
+			engines->num_engines++;
+		}
+	}
+
+	return engines;
+}
+
+static void
+eu_util_free(struct xe_pmu_device *pmu_device)
+{
+	struct xe_engine *eng;
+	struct xe_pmu_counter pmu;
+
+	igt_info("EU cleanup process\n");
+
+	if (pmu_device) {
+		for (int j = 0; j < pmu_device->num_engines ; j++) {
+			eng = engine_ptr(pmu_device, j);
+			pmu = eng->engine_active_ticks;
+			if (pmu.present)
+				close(pmu.fd);
+
+			pmu = eng->engine_total_ticks;
+			if (pmu.present)
+				close(pmu.fd);
+		}
+		free(pmu_device);
+	}
+}
+
+static void
+update_sample(struct xe_pmu_counter *counter, uint64_t *val)
+{
+	if (counter->present) {
+		counter->val.prev = counter->val.cur;
+		counter->val.cur = val[counter->idx];
+	}
+}
+
+static void xe_pmu_device_sample(const void *obj)
+{
+	struct xe_pmu_device *engines = ((struct xe_pmu_device *)obj);
+	const int num_val = engines->num_counters;
+	uint64_t val[2 + num_val];
+	uint64_t buf[2 + num_val];
+	unsigned int i;
+	ssize_t len;
+
+	memset(buf, 0, sizeof(buf));
+	len = read(engines->fd, buf, sizeof(buf));
+	assert(len == sizeof(buf));
+
+	for (i = 0; i < num_val; i++)
+		val[i] = buf[2 + i];
+
+	for (i = 0; i < engines->num_engines; i++) {
+		struct xe_engine *engine = engine_ptr(engines, i);
+
+		update_sample(&engine->engine_active_ticks, val);
+		update_sample(&engine->engine_total_ticks, val);
+	}
+}
+
+static double
+pmu_active_percentage(struct xe_engine *engine)
+{
+	double pmu_active_ticks = engine->engine_active_ticks.val.cur -
+		engine->engine_active_ticks.val.prev;
+	double pmu_total_ticks = engine->engine_total_ticks.val.cur -
+		engine->engine_total_ticks.val.prev;
+	double percentage;
+
+	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
+	return percentage;
+}
+
+static void xe_print_perc(const void *obj)
+{
+	struct xe_pmu_device *pmu_device = ((struct xe_pmu_device *)obj);
+
+	for (unsigned int i = 0; i < pmu_device->num_engines; i++) {
+		double percentage;
+		struct xe_engine *engine = engine_ptr(pmu_device, i);
+
+		igt_assert(engine);
+
+		percentage = pmu_active_percentage(engine);
+		eu_perc = percentage;
+
+		igt_debug("Engine_instance :%d EU busyness :%5.1f\n",
+			  engine->drm_xe_engine.engine_instance, percentage);
+		if (!percentage)
+			igt_debug("No workload scheduled, BU busyness :%5.1f expected\n",
+					percentage);
+		else if (percentage > 10.0) {
+			eu_busy = false;
+			igt_info("Workload scheduled, ccs engine :%d utilized :%5.1f\n",
+					engine->drm_xe_engine.engine_instance, percentage);
+		}
+	}
+}
+
+static void *show_eu_util(void *data)
+{
+	struct xe_pmu_device *pmu_device = NULL;
+	int dev_fd;
+	long n;
+
+	dev_fd = drm_open_driver(DRIVER_XE);
+
+	pmu_device = xe_init_engines(dev_fd);
+	if (!pmu_device) {
+		fprintf(stderr,
+				"Failed to initialize engines! (%s)\n",
+				strerror(errno));
+		return NULL;
+	}
+
+	xe_pmu_device_sample(pmu_device);
+
+	while ((n != 0) && !stop_top) {
+		xe_pmu_device_sample(pmu_device);
+		xe_print_perc(pmu_device);
+		usleep(2 * NS_SLEEP);
+	}
+	eu_util_free(pmu_device);
+	drm_close_driver(dev_fd);
+
+	return NULL;
+}
+
+static void
+thread_init_eu_utils(void)
+{
+	pthread_t eu_utils;
+
+	pthread_create(&eu_utils, NULL, show_eu_util, NULL);
+}
+
+static void
+*check_eu_busy(void *data)
+{
+	while (!eu_busy) {
+		igt_info("EU Busy utilizing :%5.1f\n", eu_perc);
+		usleep(1 * NS_SLEEP);
+	}
+	return NULL;
+}
+
+static void
+igt_check_eu_busy(void)
+{
+	pthread_t eu_business;
+
+	/* Creating thread to poll EU business */
+	pthread_create(&eu_business, NULL, check_eu_busy, NULL);
+}
+
+/**
+ * SUBTEST: eu-busy-10-sec
+ * Functionality: OpenCL kernel
+ * Description:
+ *      Run an openCL long rinning Kernel that returns output[i] = input[i] * input[i],
+ */
+static void
+test_eu_busy(int fd, int num_gt, u32 duration_sec)
+{
+	struct user_execenv execenv = { 0 };
+	struct thread_data *threads_data;
+	struct drm_xe_engine_class_instance *hwe;
+	const struct intel_compute_kernels *kernels;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	u32 gt, n_threads = 0, iterations = 0, n_instances = 0, i;
+	bool go = false;
+	int ccs_mode, gt_fd;
+	u32 num_slices, ip_ver;
+
+	for (gt = 0; gt < num_gt; gt++) {
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
+	thread_init_eu_utils();
+	usleep(2 * NS_SLEEP);
+	igt_check_eu_busy();
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
+	for (gt = 0; gt < num_gt; gt++) {
+		xe_for_each_engine(fd, hwe) {
+			igt_assert(hwe);
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+				++n_instances;
+		}
+	}
+
+	threads_data = calloc(n_instances, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	for (gt = 0; gt < num_gt; gt++) {
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->gt_id != gt ||
+					hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
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
+					&threads_data[i]);
+			++i;
+			++iterations;
+		}
+
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
+		stop_top = true;
+		eu_busy = true;
+	}
+	free(threads_data);
+	drm_close_driver(fd);
+}
+
 igt_main
 {
-	int xe;
+	int xe, num_gt;
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		num_gt = xe_number_gt(xe);
 	}
 
 	igt_subtest("compute-square")
@@ -223,4 +668,8 @@ igt_main
 
 	igt_subtest("ccs-mode-compute-kernel")
 		test_compute_kernel_with_ccs_mode();
+
+	/* test to check available EU utilisation for multi_ccs */
+	igt_subtest("eu-busy-10-sec")
+		test_eu_busy(xe, num_gt, 10 * LOOP_DURATION);
 }
diff --git a/tests/meson.build b/tests/meson.build
index 9b87a0d24..e11305e26 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -405,6 +405,7 @@ extra_dependencies = {
 	'sw_sync': [ libatomic ],
 	'xe_fault_injection': [ lib_igt_xe_oa ],
 	'xe_oa': [ lib_igt_xe_oa ],
+	'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
 }
 
 test_executables = []
-- 
2.43.0

