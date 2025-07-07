Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C75FC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 13:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4158E10E4A3;
	Mon,  7 Jul 2025 13:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khahPT9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A07895B9
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751896759; x=1783432759;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1dTZNgFlP7HAJ335jNrTS1Hi9fI+kQk23fcvMH5rXBI=;
 b=khahPT9sb14FWRbzpZMRinVzfa3hsZSJ172zastIiiscuKCjTKr6e9vm
 vIP42HbY8gHJor03KV/0WP37hgIRBppz4CLfgLJNgmVVV9IsxTqrzzGMu
 0k0TzaV35+GDKIErLhurYISyBEcEvnmLOejYqsZIIluHjTZhpRXEtPwc1
 hu6z2c4lY4emj6G2M38nsPBkjjk3V72kS8LxwH7ifA0e77sf7vIITWCM9
 LULI1JxHgOwzW4MuUbJDEb990KhmGw6POOc7aaENidI4wFQx5baPayeAl
 6vBWlecc6iWt8kvjjryjBuXDGncw/Mrba03pDy5J9KxVRl41YLp86nAnK g==;
X-CSE-ConnectionGUID: f7hujCsgRvGgZMuMxYDv0A==
X-CSE-MsgGUID: WmJX46XlQYOPj5C6OKZenQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54241315"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="54241315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 06:59:19 -0700
X-CSE-ConnectionGUID: P6C/ugozS+2jtmDtz6RO0Q==
X-CSE-MsgGUID: YWlNaBerT6+w6T2Rh3QwrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159561539"
Received: from unknown (HELO DUT2943PVC.iind.intel.com) ([10.190.215.47])
 by orviesa003.jf.intel.com with ESMTP; 07 Jul 2025 06:59:17 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v6 1/1] tests/intel/xe_compute: Add Compute workload
 Scheduling and Display EU busyness
Date: Mon,  7 Jul 2025 13:59:16 +0000
Message-ID: <20250707135916.379631-1-nishit.sharma@intel.com>
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

Adds compute workload scheduling and execution on multi-ccs available.
This also adds logic to show EU busyness information on console while workload is running
on multiple CCS engine instances.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/intel_compute.c      |  19 +-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 598 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 4 files changed, 617 insertions(+), 3 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index bfb9024ba..0df1eaa7a 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -249,8 +249,14 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
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
@@ -1867,7 +1873,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				    OFFSET_KERNEL, 0, false,
 				    execenv.array_size);
 
-	bo_execenv_exec(&execenv, ADDR_BATCH);
+	if (user && user->loop_kernel_duration) {
+		bo_execenv_exec_async(&execenv, ADDR_BATCH);
+		igt_measured_usleep(user->loop_kernel_duration);
+		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
+		bo_execenv_sync(&execenv);
+		user->skip_results_check = 1;
+	} else
+		bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	for (int i = 0; i < execenv.array_size; i++) {
 		float input = input_data[i];
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
index 955edf082..9eef864ea 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -12,6 +12,7 @@
  */
 
 #include <string.h>
+#include <sys/ioctl.h>
 
 #include "igt.h"
 #include "igt_sysfs.h"
@@ -19,6 +20,45 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#include "igt_device.h"
+#include "tools/gputop/xe_gputop.h"
+#include "igt_drm_clients.h"
+
+/**
+ * Number of supported drivers needs to be adjusted as per the length of
+ * the drivers[] array.
+ */
+#define	NUM_DRIVER	1
+#define	LOOP_DURATION	(1000000ull)
+#define	engine_ptr(engines, n)	(&(engines)->engine + (n))
+#define NS_SLEEP	(1000000ull)
+
+enum utilization_type {
+	UTILIZATION_TYPE_ENGINE_TIME,
+	UTILIZATION_TYPE_TOTAL_CYCLES,
+};
+
+bool workload_sched;
+
+pthread_barrier_t barrier;
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
+struct xe_gpu_info {
+	char *pmu_device;
+	struct igt_device_card *card;
+	struct xe_pmu_device *eng_obj;
+};
+
 static int gt_sysfs_open(int gt)
 {
 	int fd, gt_fd;
@@ -178,6 +218,560 @@ test_compute_square(int fd)
 		      "GPU not supported\n");
 }
 
+static void
+*intel_compute_thread(void *data)
+{
+	struct thread_data *t = (struct thread_data *)data;
+
+	usleep(3 * NS_SLEEP);
+
+	igt_info("Compute kernel executing on engine class :%s instance :%d gt: GT-%d\n",
+			xe_engine_class_string(t->eci->engine_class), t->eci->engine_instance,
+			t->eci->gt_id);
+
+	pthread_mutex_lock(t->mutex);
+	while (*t->go == 0)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	workload_sched = true;
+	igt_assert_f(xe_run_intel_compute_kernel_on_engine(t->fd,
+							   t->eci,
+							   t->execenv,
+							   EXECENV_PREF_VRAM_IF_POSSIBLE),
+		     "Unable to run compute kernel successfully\n");
+	workload_sched = false;
+	return NULL;
+}
+
+static volatile bool stop_top;
+
+static int
+pmu_format_shift(int xe, const char *name,
+		 struct xe_gpu_info *obj)
+{
+	uint32_t start;
+	int format;
+
+	format = perf_event_format(obj->pmu_device, name, &start);
+	if (format)
+		return 0;
+
+	return start;
+}
+
+static const char
+*class_display_name(unsigned int class)
+{
+	switch (class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "Render/3D";
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return "Blitter";
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "Video";
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "VideoEnhance";
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "Compute";
+	default:
+		return "[unknown]";
+	}
+}
+
+static void
+*xe_init_engines(const void *obj)
+{
+	struct igt_device_card *card = ((struct xe_gpu_info *)obj)->card;
+	struct xe_pmu_device *engines;
+	struct drm_xe_engine *ccs_engine;
+	int ret = 0, engine_count = 0;
+	struct drm_xe_engine_class_instance *hwe;
+	int card_fd;
+	uint64_t engine_class, engine_instance, gt_shift;
+	uint64_t engine_active_config, engine_total_config;
+
+	if (!card || !strlen(card->card) || !strlen(card->render))
+		return NULL;
+
+	if (strlen(card->card)) {
+		card_fd = igt_open_card(card);
+	} else if (strlen(card->render)) {
+		card_fd = igt_open_render(card);
+	} else {
+		fprintf(stderr, "Failed to detect device!\n");
+		return NULL;
+	}
+	xe_device_get(card_fd);
+
+	xe_for_each_engine(card_fd, hwe) {
+		ccs_engine = xe_find_engine_by_class(card_fd, DRM_XE_ENGINE_CLASS_COMPUTE);
+		if (ccs_engine)
+			engine_count++;
+	}
+
+	engines = calloc(1, sizeof(struct xe_pmu_device) +
+			 engine_count * sizeof(struct xe_engine));
+	if (!engines)
+		return NULL;
+
+	engines->num_engines = 0;
+	engines->device = ((struct xe_gpu_info *)obj)->pmu_device;
+	gt_shift = pmu_format_shift(card_fd, "gt", (struct xe_gpu_info *)obj);
+	engine_class = pmu_format_shift(card_fd, "engine_class", (struct xe_gpu_info *)obj);
+	engine_instance = pmu_format_shift(card_fd, "engine_instance", (struct xe_gpu_info *)obj);
+	ret = perf_event_config(((struct xe_gpu_info *)obj)->pmu_device,
+			"engine-active-ticks",
+			&engine_active_config);
+	if (ret < 0)
+		return NULL;
+	ret = perf_event_config(((struct xe_gpu_info *)obj)->pmu_device,
+			"engine-total-ticks",
+			&engine_total_config);
+	if (ret < 0)
+		return NULL;
+	xe_for_each_engine(card_fd, hwe) {
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+			uint64_t  param_config;
+			struct xe_engine *engine;
+
+			engine = engine_ptr(engines, engines->num_engines);
+			param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
+				| hwe->engine_instance << engine_instance;
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
+			ret = asprintf(&engine->display_name, "%s/%u",
+					class_display_name(engine->drm_xe_engine.engine_class),
+					engine->drm_xe_engine.engine_instance);
+
+			if (ret <= 0) {
+				ret = errno;
+				break;
+			}
+
+			engines->num_engines++;
+		}
+	}
+
+	if (!ret) {
+		errno = ret;
+		return NULL;
+	}
+
+	((struct xe_gpu_info *)obj)->eng_obj = engines;
+
+	return engines;
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
+int xe_pmu_init(const void *obj)
+{
+	struct xe_pmu_device *engines = ((struct xe_gpu_info *)obj)->eng_obj;
+	unsigned int i;
+	int fd;
+	struct xe_engine *engine;
+	uint64_t type = igt_perf_type_id(engines->device);
+
+	engines->fd = -1;
+	engines->num_counters = 0;
+
+	for (i = 0; i < engines->num_engines; i++) {
+		engine = engine_ptr(engines, i);
+		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
+				&engines->fd);
+		if (fd < 0)
+			return -1;
+		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
+				&engines->fd);
+		if (fd < 0)
+			return -1;
+	}
+	return 0;
+}
+
+static void
+eu_util_free(struct xe_gpu_info *gpu_ptr)
+{
+	struct xe_engine *eng;
+	struct xe_pmu_counter pmu;
+
+	igt_info("EU cleanup process\n");
+
+	if (gpu_ptr->card)
+		free(gpu_ptr->card);
+
+	if (gpu_ptr->eng_obj) {
+		for (int j = 0; j < ((struct xe_pmu_device *)gpu_ptr->eng_obj)->num_engines ; j++) {
+			eng = engine_ptr((struct xe_pmu_device *)(gpu_ptr)->eng_obj, j);
+			if (eng->display_name)
+				free(eng->display_name);
+
+			pmu = eng->engine_active_ticks;
+			if (pmu.present)
+				close(pmu.fd);
+
+			pmu = eng->engine_total_ticks;
+			if (pmu.present)
+				close(pmu.fd);
+		}
+		free(gpu_ptr->eng_obj);
+	}
+	if (gpu_ptr->pmu_device)
+		free(gpu_ptr->pmu_device);
+}
+
+static char
+*pmu_name(struct igt_device_card *card)
+{
+	int card_fd;
+	char device[30];
+	char *path;
+
+	if (strlen(card->card))
+		card_fd = igt_open_card(card);
+	else if (strlen(card->render))
+		card_fd = igt_open_render(card);
+
+	if (card_fd == -1)
+		return NULL;
+
+	xe_perf_device(card_fd, device, sizeof(device));
+	path = strdup(device);
+	close(card_fd);
+	return path;
+}
+
+static struct xe_gpu_info *
+xe_device_match(const char *filter)
+{
+	struct igt_device_card card;
+	struct xe_gpu_info *gpu_ptr =  NULL;
+
+	if (!igt_device_card_match(filter, &card)) {
+		igt_info("No device found for the filter\n\n");
+		return NULL;
+	}
+
+	gpu_ptr = (struct xe_gpu_info *)malloc(sizeof(struct xe_gpu_info));
+	igt_assert(gpu_ptr);
+
+	gpu_ptr->pmu_device = pmu_name(&card);
+	if (!gpu_ptr->pmu_device) {
+		fprintf(stderr, "%s : pmu_device path returned NULL", card.pci_slot_name);
+		exit(EXIT_FAILURE);
+	}
+	gpu_ptr->card = &card;
+	return gpu_ptr;
+}
+
+static uint64_t
+pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+{
+	uint64_t buf[2 + num];
+	unsigned int i;
+	ssize_t len;
+
+	memset(buf, 0, sizeof(buf));
+
+	len = read(fd, buf, sizeof(buf));
+	assert(len == sizeof(buf));
+
+	for (i = 0; i < num; i++)
+		val[i] = buf[2 + i];
+
+	return buf[1];
+}
+
+static void
+__update_sample(struct xe_pmu_counter *counter, uint64_t val)
+{
+	counter->val.prev = counter->val.cur;
+	counter->val.cur = val;
+}
+
+static void
+update_sample(struct xe_pmu_counter *counter, uint64_t *val)
+{
+	if (counter->present)
+		__update_sample(counter, val[counter->idx]);
+}
+
+static void xe_pmu_device_sample(const void *obj)
+{
+	struct xe_pmu_device *engines = ((struct xe_gpu_info *)obj)->eng_obj;
+	const int num_val = engines->num_counters;
+	uint64_t val[2 + num_val];
+	unsigned int i;
+
+	pmu_read_multi(engines->fd, num_val, val);
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
+static void
+print_engine_perc(struct xe_pmu_device *engines, unsigned int i)
+{
+	struct xe_engine *engine = engine_ptr(engines, i);
+	double percentage = pmu_active_percentage(engine);
+
+	igt_assert(engines);
+	if (engine->drm_xe_engine.engine_class == DRM_XE_ENGINE_CLASS_COMPUTE && !workload_sched) {
+		igt_info("Engine_instance :%d EU busyness :%5.1f\n", engine->drm_xe_engine.engine_instance, percentage);
+		if (!percentage)
+			igt_info("No workload scheduled, BU busyness :%5.1f expected\n", percentage);
+		else
+			igt_info("Workload scheduled, BU busyness :%5.1f expected\n", percentage);
+	} else if (engine->drm_xe_engine.engine_class == DRM_XE_ENGINE_CLASS_COMPUTE && workload_sched) {
+		igt_info("Engine_instance :%d EU busyness :%5.1f\n", engine->drm_xe_engine.engine_instance, percentage);
+		if (!percentage)
+			igt_info("No workload scheduled, BU busyness :%5.1f expected\n", percentage);
+		else
+			igt_info("Workload scheduled, BU busyness :%5.1f expected\n", percentage);
+	}
+
+	printf("\n");
+}
+
+static void xe_print_perc(const void *obj)
+{
+	struct xe_pmu_device *show = ((struct xe_gpu_info *)obj)->eng_obj;
+
+	for (unsigned int i = 0; i < show->num_engines; i++)
+		print_engine_perc(show, i);
+}
+
+static void *show_eu_util(void *data)
+{
+	struct igt_drm_clients *clients = NULL;
+	struct pci_device *pdev = NULL;
+	struct xe_gpu_info *gpu_ptr = NULL;
+	char filter[50] = "";
+	int ret, dev_fd;
+	long n;
+
+	dev_fd = drm_open_driver(DRIVER_XE);
+
+	pdev = igt_device_get_pci_device(dev_fd);
+	igt_require(pdev);
+
+	strcpy(filter, "pci:vendor=Intel,device=discrete,card=0");
+	gpu_ptr = xe_device_match(filter);
+	if (!gpu_ptr) {
+		printf("No device found.\n");
+		eu_util_free(gpu_ptr);
+		exit(1);
+	}
+
+	drm_close_driver(dev_fd);
+
+	if (!xe_init_engines(gpu_ptr)) {
+		fprintf(stderr,
+				"Failed to initialize engines! (%s)\n",
+				strerror(errno));
+		eu_util_free(gpu_ptr);
+		return NULL;
+	}
+
+	ret = xe_pmu_init(gpu_ptr);
+	if (ret) {
+		fprintf(stderr,
+				"Failed to initialize PMU! (%s)\n",
+				strerror(errno));
+		if (errno == EACCES && geteuid())
+			fprintf(stderr,
+					"\n"
+					"Access error\n"
+					"More info athttps://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
+		igt_devices_free();
+		eu_util_free(gpu_ptr);
+		return NULL;
+	}
+
+	xe_pmu_device_sample(gpu_ptr);
+
+	clients = igt_drm_clients_init(NULL);
+	if (!clients)
+		exit(1);
+
+	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+	while ((n != 0) && !stop_top) {
+		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+		xe_pmu_device_sample(gpu_ptr);
+		xe_print_perc(gpu_ptr);
+		usleep(2 * NS_SLEEP);
+	}
+	igt_drm_clients_free(clients);
+	eu_util_free(gpu_ptr);
+
+	return NULL;
+}
+
+static void
+thread_init_eu_utils(void)
+{
+	pthread_t eu_utils;
+	int fd;
+	uint16_t dev_id;
+
+	fd = drm_open_driver(DRIVER_XE);
+	dev_id = intel_get_drm_devid(fd);
+
+	/* Creating thread to display EU utilization in BMG */
+	if (IS_BATTLEMAGE(dev_id))
+		pthread_create(&eu_utils, NULL, show_eu_util, NULL);
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
+	fd = drm_open_driver(DRIVER_XE);
+	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	kernels = intel_compute_square_kernels;
+	drm_close_driver(fd);
+
+	for (gt = 0; gt < num_gt; gt++) {
+		if (!get_num_cslices(gt, &num_slices))
+			continue;
+
+		gt_fd = gt_sysfs_open(gt);
+		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 2) > 0);
+		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
+		close(gt_fd);
+	}
+
+	igt_skip_on_f(ccs_mode <= 1, "Skipping test as ccs_mode <=1 not matching criteria :%d\n",
+				      ccs_mode);
+
+	fd = drm_open_driver(DRIVER_XE);
+	thread_init_eu_utils();
+
+	while (kernels->kernel) {
+		if (ip_ver == kernels->ip_ver)
+			break;
+		kernels++;
+	}
+
+	/*If loop_kernel_duration not set user should use different
+	 *kernel and size
+	 *use with loop kernel and loop duration it assumes we stop
+	 *it via memory write
+	 */
+
+	execenv.loop_kernel_duration = duration_sec;
+	execenv.kernel = kernels->loop_kernel;
+	execenv.kernel_size = kernels->loop_kernel_size;
+
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
+			usleep(2 * NS_SLEEP);
+		}
+
+		pthread_mutex_lock(&mutex);
+		go = true;
+		pthread_cond_broadcast(&cond);
+		pthread_mutex_unlock(&mutex);
+
+		for (int val = 0; val < i; ++val) {
+			pthread_join(threads_data[val].thread, NULL);
+		}
+
+		i = 0;
+		n_threads = 0;
+		iterations = 0;
+		stop_top = true;
+	}
+	free(threads_data);
+	drm_close_driver(fd);
+}
+
 igt_main
 {
 	int xe, num_gt;
@@ -199,4 +793,8 @@ igt_main
 
 	igt_subtest("ccs-mode-compute-kernel")
 		test_compute_kernel_with_ccs_mode(num_gt);
+
+	/* test to check available EU utilisation for multi_ccs */
+	igt_subtest("eu-busy-10-sec")
+		test_eu_busy(xe, num_gt, 10 * LOOP_DURATION);
 }
diff --git a/tests/meson.build b/tests/meson.build
index 55bcf57ec..3340e137d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -404,6 +404,7 @@ extra_dependencies = {
 	'sw_sync': [ libatomic ],
 	'xe_fault_injection': [ lib_igt_xe_oa ],
 	'xe_oa': [ lib_igt_xe_oa ],
+	'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math ],
 }
 
 test_executables = []
-- 
2.43.0

