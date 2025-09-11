Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6089CA1016
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 06:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C17410EA2D;
	Thu, 11 Sep 2025 06:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpy7ztzy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A0510EA21
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 06:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757573973; x=1789109973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=h7CQl4N9M6bLlLWcwSTt2VmMolwkiY9wMdw7D11OTe8=;
 b=mpy7ztzyZYhZngLSHWFvuj7qUwM0mnvezJiT6QxOu+B3mHF42VLJTwHc
 ZeorDEJkASlmOMP+Mj6gd0I8D3yo7KANXEaBKtDgmVaQ8dALRyIQRhtOM
 Umt30QV5tK79avL6vK3k+RXOQHzdIL5DhCffSB2K4roOKyMKAZXNgGEq6
 6+VkLsGepuDvEASozMMLXpDkaj/x+UySZvg4+zfjWV9BvImtYZOxH/5o7
 dD9gFWeP7V5Kmr/rgZS4RPKdqN56hdwi0F6F42mq66XId5eoZAcTMOQn3
 nskNxLndzkbefJEwhizyTn0QkPSZywLUmIPH1ZlhTlIJz8RCTnycUxljM g==;
X-CSE-ConnectionGUID: ubPbf5loRam79s1i94maJw==
X-CSE-MsgGUID: RpFo+sDBRUKtPgXxrgjuQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85340450"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="85340450"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:59:33 -0700
X-CSE-ConnectionGUID: q+xi+Qw2Q5WaUD8W1ACQsA==
X-CSE-MsgGUID: 6LgMZVFfSHGXgj56tu1jmQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:59:30 -0700
Date: Thu, 11 Sep 2025 08:59:27 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 3/3] tests/intel/xe_compute: Added eu-busy-10s
 test
Message-ID: <e4hgfddh3uouq57nk3vcgjwoffixgdi6hyvsbzl3kig2aaoz6r@nw66hvgeydhw>
References: <20250908144629.938071-1-nishit.sharma@intel.com>
 <20250908144629.938071-4-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908144629.938071-4-nishit.sharma@intel.com>
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

On Mon, Sep 08, 2025 at 02:46:29PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Added multi threading to utilize available CCS instances as per num_slices
> available in /sys/class/drm/cardX/device/tileX/gtX/num_cslices.
> Depending upon num_slices, number of threads will be created and
> schedule compute workload in different CCS instances. Sleep is
> called via loop_kernel_duration so that HW engine runs for sleep duration.
> During execution per EU utlization percentage is grabbed and displayed
> on console. Added igt_skip() if sriov is enabled in platform, so if
> sriov_numvfs > 0 then test will be skipped.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/igt_eu_perf.h | 255 ++++++++++++++++++++++++++++++++++++++
>  tests/intel/xe_compute.c  | 233 ++++++++++++++++++++++++++++++++++
>  tests/meson.build         |   1 +
>  3 files changed, 489 insertions(+)
>  create mode 100644 tests/intel/igt_eu_perf.h
> 
> diff --git a/tests/intel/igt_eu_perf.h b/tests/intel/igt_eu_perf.h

It seems you're trying to abstract collecting counters to a separate file.
That's fine, but there're some things you should to follow.

> new file mode 100644
> index 000000000..b2758a941
> --- /dev/null
> +++ b/tests/intel/igt_eu_perf.h

Name suggests I can use it in i915.

> @@ -0,0 +1,255 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef IGT_EU_PERF_H
> +#define IGT_EU_PERF_H
> +
> +#include "igt_perf.h"
> +
> +#define engine_ptr(pmu_device, n)       (&(pmu_device)->engine + (n))
> +
> +bool eu_busy, stop_top;
> +double eu_perc;

Globals in header file? Really bad idea.

> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct xe_pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	int fd;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;
> +	struct xe_pmu_counter engine_active_ticks;
> +	struct xe_pmu_counter engine_total_ticks;
> +};
> +
> +struct xe_pmu_device {
> +	unsigned int num_engines;
> +	unsigned int num_counters;
> +	int fd;
> +	char *device;
> +	struct xe_engine engine;
> +};
> +
> +struct thread_data {
> +	pthread_t thread;
> +	pthread_mutex_t *mutex;
> +	pthread_cond_t *cond;
> +	int class;
> +	int fd;
> +	int gt;
> +	struct user_execenv *execenv;
> +	struct drm_xe_engine_class_instance *eci;
> +	bool *go;
> +};

thread_data is not used, what is for?

> +
> +static char *pmu_name(int fd)
> +{
> +	char device[30];
> +
> +	xe_perf_device(fd, device, sizeof(device));
> +
> +	return strdup(device);
> +}
> +
> +static int
> +_open_pmu(uint64_t type, unsigned int *cnt,
> +	  struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +		pmu->fd = fd__;
> +	}
> +
> +	return fd__;
> +}
> +
> +static struct xe_pmu_device
> +*xe_init_engines(int dev_fd)
> +{
> +	struct xe_pmu_device *engines;
> +	int ret = 0, engine_count = 0;
> +	char device[30];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +	uint32_t engine_class, engine_instance, gt_shift;
> +	uint64_t engine_active_config, engine_total_config;
> +	uint64_t type = igt_perf_type_id(xe_perf_device(dev_fd, device, sizeof(device)));
> +
> +	xe_device_get(dev_fd);
> +
> +	xe_for_each_engine(dev_fd, hwe)
> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +			engine_count++;

You provide sth what is kind of library part, but you're narrowing
its use to compute. What if I would like to check bcs engine?

And worst thing here are static functions (in the header file).

> +
> +	engines = calloc(1, sizeof(struct xe_pmu_device) +
> +			engine_count * sizeof(struct xe_engine));
> +	if (!engines)
> +		return NULL;
> +
> +	engines->num_engines = 0;
> +	engines->device = pmu_name(dev_fd);
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	perf_event_format(engines->device, "gt", &gt_shift);
> +	perf_event_format(engines->device, "engine_class", &engine_class);
> +	perf_event_format(engines->device, "engine_instance", &engine_instance);
> +	ret = perf_event_config(engines->device,
> +			"engine-active-ticks",
> +			&engine_active_config);
> +	if (ret < 0)
> +		return NULL;
> +	ret = perf_event_config(engines->device,
> +			"engine-total-ticks",
> +			&engine_total_config);
> +	if (ret < 0)
> +		return NULL;
> +	xe_for_each_engine(dev_fd, hwe) {
> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> +			uint64_t  param_config;
> +			struct xe_engine *engine;
> +
> +			engine = engine_ptr(engines, engines->num_engines);
> +			param_config = (uint64_t)hwe->gt_id << gt_shift |
> +				hwe->engine_class << engine_class |
> +				hwe->engine_instance << engine_instance;
> +			engine->drm_xe_engine = *hwe;
> +			engine->engine_active_ticks.config = engine_active_config | param_config;
> +			engine->engine_total_ticks.config = engine_total_config | param_config;
> +
> +			if (engine->engine_active_ticks.config == -1 ||
> +					engine->engine_total_ticks.config == -1) {
> +				ret = ENOENT;
> +				break;
> +			}
> +
> +			fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
> +					&engines->fd);
> +			if (fd < 0)
> +				return NULL;
> +
> +			fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
> +					&engines->fd);
> +			if (fd < 0)
> +				return NULL;
> +
> +			engines->num_engines++;
> +		}
> +	}
> +
> +	return engines;
> +}
> +
> +static void
> +eu_util_free(struct xe_pmu_device *pmu_device)
> +{
> +	struct xe_engine *eng;
> +	struct xe_pmu_counter pmu;
> +
> +	igt_info("EU cleanup process\n");
> +
> +	if (pmu_device) {
> +		for (int j = 0; j < pmu_device->num_engines ; j++) {
> +			eng = engine_ptr(pmu_device, j);
> +			pmu = eng->engine_active_ticks;
> +			if (pmu.present)
> +				close(pmu.fd);
> +
> +			pmu = eng->engine_total_ticks;
> +			if (pmu.present)
> +				close(pmu.fd);
> +		}
> +		free(pmu_device);
> +	}
> +}
> +
> +static void
> +update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present) {
> +		counter->val.prev = counter->val.cur;
> +		counter->val.cur = val[counter->idx];
> +	}
> +}
> +
> +static void xe_pmu_device_sample(const void *obj)
> +{
> +	struct xe_pmu_device *engines = ((struct xe_pmu_device *)obj);
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	uint64_t buf[2 + num_val];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +	len = read(engines->fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num_val; i++)
> +		val[i] = buf[2 + i];
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->engine_active_ticks, val);
> +		update_sample(&engine->engine_total_ticks, val);
> +	}
> +}
> +
> +static double
> +pmu_active_percentage(struct xe_engine *engine)
> +{
> +	double pmu_active_ticks = engine->engine_active_ticks.val.cur -
> +		engine->engine_active_ticks.val.prev;
> +	double pmu_total_ticks = engine->engine_total_ticks.val.cur -
> +		engine->engine_total_ticks.val.prev;
> +	double percentage;
> +
> +	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
> +	return percentage;
> +}
> +
> +static void xe_print_perc(const void *obj)
> +{
> +	struct xe_pmu_device *pmu_device = ((struct xe_pmu_device *)obj);
> +
> +	for (unsigned int i = 0; i < pmu_device->num_engines; i++) {
> +		double percentage;
> +		struct xe_engine *engine = engine_ptr(pmu_device, i);
> +
> +		igt_assert(engine);
> +
> +		percentage = pmu_active_percentage(engine);
> +		eu_perc = percentage;
> +
> +		igt_debug("Engine_instance :%d EU busyness :%5.1f\n",
> +				engine->drm_xe_engine.engine_instance, percentage);
> +		if (!percentage)
> +			igt_debug("No workload scheduled, BU busyness :%5.1f expected\n",
> +					percentage);
> +		else if (percentage > 10.0) {
> +			eu_busy = false;

If gpu is doing some job and takes more than 10% it becomes
not busy?

> +			igt_info("Workload scheduled, ccs engine :%d utilized :%5.1f\n",
> +					engine->drm_xe_engine.engine_instance, percentage);
> +		}
> +	}
> +}
> +#endif
> +

So if you want to provide universal mechanism to check engine
busyness it should be more generic, not narrowed to compute only.
And you should expose only necessary interface outside, keeping
implementation details private. Another thing is such library
code should be in separate patch and contain the documentation.


> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index d5641e428..4373a992e 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -19,6 +19,9 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#include "igt_sriov_device.h"
> +#include "igt_eu_perf.h"
> +
>  #define LOOP_DURATION_2s	(1000000ull * 2)
>  #define DURATION_MARGIN		0.2
>  
> @@ -242,6 +245,232 @@ test_compute_kernel_loop(uint64_t loop_duration)
>  	drm_close_driver(fd);
>  }
>  
> +static void
> +*intel_compute_thread(void *data)
> +{
> +	struct thread_data *t = (struct thread_data *)data;
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (*t->go == 0)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	igt_info("Compute kernel executing on engine class :%s instance :%d gt: GT-%d\n",
> +			xe_engine_class_string(t->eci->engine_class), t->eci->engine_instance,
> +			t->eci->gt_id);
> +
> +	igt_assert_f(xe_run_intel_compute_kernel_on_engine(t->fd,
> +				t->eci,
> +				t->execenv,
> +				EXECENV_PREF_VRAM_IF_POSSIBLE),
> +			"Unable to run compute kernel successfully\n");
> +	return NULL;
> +}
> +
> +static void *show_eu_util(void *data)
> +{
> +	struct xe_pmu_device *pmu_device = NULL;
> +	int dev_fd;
> +	long n;
> +
> +	n = -1;
> +	dev_fd = drm_open_driver(DRIVER_XE);
> +
> +	pmu_device = xe_init_engines(dev_fd);
> +	if (!pmu_device) {
> +		fprintf(stderr,
> +				"Failed to initialize engines! (%s)\n",
> +				strerror(errno));

Why not igt_critical()?

> +		drm_close_driver(dev_fd);
> +		return NULL;
> +	}
> +
> +	xe_pmu_device_sample(pmu_device);
> +
> +	while ((n != 0) && !stop_top) {
> +		xe_pmu_device_sample(pmu_device);
> +		xe_print_perc(pmu_device);
> +		usleep(1 * LOOP_DURATION_2s);
> +	}
> +	eu_util_free(pmu_device);
> +	drm_close_driver(dev_fd);
> +	return NULL;
> +}
> +
> +static void
> +thread_init_eu_utils(void)
> +{
> +	pthread_t eu_utils;
> +
> +	pthread_create(&eu_utils, NULL, show_eu_util, NULL);
> +}
> +
> +/* To avoid calling igt_skip in threads which can cause issue */
> +static void
> +igt_check_supported_pipeline(void)
> +{
> +	int fd;
> +	unsigned int ip_ver;
> +	const struct intel_compute_kernels *kernels;
> +	struct user_execenv execenv = { 0 };
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	kernels = intel_compute_square_kernels;
> +
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			break;
> +		kernels++;
> +	}
> +
> +	/* loop_kernel_duration used as sleep to make EU busy for loop_duration */
> +	execenv.loop_kernel_duration = 1000000;
> +	execenv.kernel = kernels->loop_kernel;
> +	execenv.kernel_size = kernels->loop_kernel_size;
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, &execenv, EXECENV_PREF_SYSTEM),
> +				"Unable to run compute kernel successfully\n");
> +	}
> +	drm_close_driver(fd);
> +}
> +
> +/**
> + * SUBTEST: eu-busy-10s
> + * Functionality: OpenCL kernel
> + * Description: Run loop_kernel for 10 seconds and observe EU business
> + */
> +static void
> +test_eu_busy(uint64_t duration_sec)
> +{
> +	struct user_execenv execenv = { 0 };
> +	struct thread_data *threads_data;
> +	struct drm_xe_engine_class_instance *hwe;
> +	const struct intel_compute_kernels *kernels;
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	u32 gt, n_threads = 0, iterations = 0, n_instances = 0, i;
> +	bool go = false;
> +	int ccs_mode, gt_fd, fd;
> +	u32 num_slices, ip_ver;
> +	uint64_t gt_mask = get_gt_mask();
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +
> +	igt_skip_on_f(igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd),
> +		     "Skipping test when SRIOV is enabled\n");
> +	drm_close_driver(fd);
> +
> +	for_each_bit(gt_mask, gt) {
> +		if (!get_num_cslices(gt, &num_slices))
> +			continue;
> +
> +		gt_fd = gt_sysfs_open(gt);
> +		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
> +		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
> +		close(gt_fd);
> +	}
> +
> +	igt_skip_on_f(ccs_mode <= 1, "Skipping test as ccs_mode <=1 not matching criteria :%d\n",
> +			ccs_mode);
> +
> +	thread_init_eu_utils();

What will happen if your collecting thread will fail for some
reason? Executing rest of the code doesn't makes sense as you
won't be able to collect counters.

> +	usleep(1 * LOOP_DURATION_2s);
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +
> +	igt_skip_on_f(igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd),
> +		     "Skipping test when SRIOV is enabled\n");
> +
> +	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	kernels = intel_compute_square_kernels;
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			break;
> +		kernels++;
> +	}
> +
> +	/*
> +	 * User should use different kernel if loop_kernel_duration not set
> +	 * With loop kernel and loop duration it assumes we stop it via memory write
> +	 *
> +	 */
> +
> +	execenv.loop_kernel_duration = duration_sec;
> +	execenv.kernel = kernels->loop_kernel;
> +	execenv.kernel_size = kernels->loop_kernel_size;
> +	drm_close_driver(fd);
> +
> +	/*
> +	 * Calling igt_skip in threads can cause issue during execution
> +	 * To avoid this check igt_check_supported_pipeline function called
> +	 * to make sure igt_skip happens before creating threads
> +	 *
> +	 */
> +	if (ip_ver < IP_VER(20, 0))
> +		igt_check_supported_pipeline();

Test makes sense for ver20 only. You can check this on the beginning
of the test and skip if this condition is not met. If you want to
check is loop_kernel supported it also should happen on the very
beginning, before spawning any threads.

In general - checking of test conditions should execute first, then
rest. And do error handling.

BTW - do we need to have separate threads for collecting pmu counters?
Can't we simply read the counters before and after you spawn compute
kernels. We don't need to visualize counters like gputop so two reads
for each engine should be enough.

--
Zbigniew

> +
> +	gt_mask = get_gt_mask();
> +
> +	for_each_bit(gt_mask, gt) {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_for_each_engine(fd, hwe) {
> +			igt_assert(hwe);
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +				++n_instances;
> +		}
> +		drm_close_driver(fd);
> +	}
> +
> +	threads_data = calloc(n_instances, sizeof(*threads_data));
> +	igt_assert(threads_data);
> +
> +	pthread_mutex_init(&mutex, 0);
> +	pthread_cond_init(&cond, 0);
> +
> +	gt_mask = get_gt_mask();
> +	fd = drm_open_driver(DRIVER_XE);
> +	for_each_bit(gt_mask, gt) {
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->gt_id != gt ||
> +					hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +
> +			threads_data[i].mutex = &mutex;
> +			threads_data[i].cond = &cond;
> +			threads_data[i].fd = fd;
> +			threads_data[i].eci = hwe;
> +			threads_data[i].go = &go;
> +			threads_data[i].execenv = &execenv;
> +			++n_threads;
> +			pthread_create(&threads_data[i].thread, 0, intel_compute_thread,
> +					&threads_data[i]);
> +			++i;
> +			++iterations;
> +		}
> +		pthread_mutex_lock(&mutex);
> +		go = true;
> +		pthread_cond_broadcast(&cond);
> +		pthread_mutex_unlock(&mutex);
> +
> +		for (int val = 0; val < i; ++val)
> +			pthread_join(threads_data[val].thread, NULL);
> +
> +		i = 0;
> +		n_threads = 0;
> +		iterations = 0;
> +		stop_top = true;
> +		eu_busy = true;
> +	}
> +	free(threads_data);
> +	drm_close_driver(fd);
> +}
> +
>  /**
>   * SUBTEST: compute-square
>   * Mega feature: WMTP
> @@ -283,4 +512,8 @@ igt_main
>  	/* To test compute function stops after loop_kernel_duration */
>  	igt_subtest("loop-duration-2s")
>  		test_compute_kernel_loop(LOOP_DURATION_2s);
> +
> +	/* test to check available EU utilisation in multi-ccs case */
> +	igt_subtest("eu-busy-10s")
> +		test_eu_busy(5 * LOOP_DURATION_2s);
>  }
> diff --git a/tests/meson.build b/tests/meson.build
> index a7b9375ed..a7ffc6383 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -408,6 +408,7 @@ extra_dependencies = {
>  	'sw_sync': [ libatomic ],
>  	'xe_fault_injection': [ lib_igt_xe_oa ],
>  	'xe_oa': [ lib_igt_xe_oa ],
> +        'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
>  }
>  
>  test_executables = []
> -- 
> 2.43.0
> 
