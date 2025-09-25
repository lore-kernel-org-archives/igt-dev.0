Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5A1CAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 11:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B28310E8D9;
	Thu, 25 Sep 2025 11:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m17QQS2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269C810E8D9
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 11:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758800197; x=1790336197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IR7tJ6NYoyyr5FAuwhclMpBj2wCsNdFiq5l1rHv/X6o=;
 b=m17QQS2uc3ydEjYv2wlxft6y1NtKJUYSZu8v6CTgfg7/wGm6UeAqY8UE
 SNGKORJn3ITKttrjq+p3fD2Chr0BgbUVuyNK65hzviJsQlhsAv7jYy/Hj
 yVQMc0CyXHvZ6cUgTMaLvcglXcV2E0JnKCS4xVyaikdIkVBXWsudNsWs4
 RXLElJyIskv4q+JAJSLIVCLRlLlAL4jbvmYO8wP1rgFQDkUhPfStbv7AH
 POtvEsNT61T/7B9eQXSjwJOHAMCcRb7ZMttqgxsYeYTYW1eVsh8gvlV8I
 sGQEEgSdyLVw8kY/f+f7VWd9SLSKnm3pMpydqg8GYzoWsp0IAt1TTT/Rh w==;
X-CSE-ConnectionGUID: BRDSLb1ASD253K0q8TdyLA==
X-CSE-MsgGUID: BVuAM1HpRSq7gIXT3oRBKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64956130"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="64956130"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:36:36 -0700
X-CSE-ConnectionGUID: UEChabBkQZaSS1ExT8R2LQ==
X-CSE-MsgGUID: Ou0pq/8HTK+zI7RcwQEKQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176593541"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.41])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:36:35 -0700
Date: Thu, 25 Sep 2025 13:36:32 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v5 3/3] tests/intel/xe_compute: Add eu-busy-10s test
Message-ID: <spyupqqtko4rm4txnzp4x4n4n3a2k6y24k6ev7kgyhirbri7ak@il33d4prus5w>
References: <20250925044333.176939-1-nishit.sharma@intel.com>
 <20250925044333.176939-4-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925044333.176939-4-nishit.sharma@intel.com>
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

On Thu, Sep 25, 2025 at 04:43:33AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Add multi threading to utilize available CCS instances as per num_slices
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
>  tests/intel/xe_compute.c | 238 +++++++++++++++++++++++++++++++++++++++
>  tests/meson.build        |   1 +
>  2 files changed, 239 insertions(+)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index ab1677950..1dd3fcc83 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -19,9 +19,24 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#include "igt_perf.h"
> +#include "igt_sriov_device.h"
> +
>  #define LOOP_DURATION_2s	(1000000ull * 2)
>  #define DURATION_MARGIN		0.2
>  
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
> +
>  static int gt_sysfs_open(int gt)
>  {
>  	int fd, gt_fd;
> @@ -243,6 +258,219 @@ test_compute_kernel_loop(uint64_t loop_duration)
>  	drm_close_driver(fd);
>  }
>  
> +static void
> +*intel_compute_thread(void *data)
> +{
> +	struct thread_data *t = (struct thread_data *)data;
> +	char device[30];
> +	uint64_t type;
> +	uint32_t engine_class, engine_instance, gt_shift;
> +	uint64_t engine_active_config, engine_total_config;
> +	int ret, fd1, fd2;
> +	uint64_t val[4];
> +	uint64_t param_config;
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (*t->go == 0)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	type = igt_perf_type_id(xe_perf_device(t->fd, device, sizeof(device)));
> +	igt_debug("type: %lx, device: %s\n", type, device);
> +
> +	perf_event_format(device, "gt", &gt_shift);
> +	perf_event_format(device, "engine_class", &engine_class);
> +	perf_event_format(device, "engine_instance", &engine_instance);
> +
> +	ret = perf_event_config(device, "engine-active-ticks", &engine_active_config);
> +	igt_assert_eq(ret, 0);
> +	ret = perf_event_config(device, "engine-total-ticks", &engine_total_config);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_debug("gt_id: %x, class: %x, instance: %x\n",
> +		   t->eci->gt_id, t->eci->engine_class, t->eci->engine_instance);
> +
> +	/* Setting collective counters for compute engine available in t->eci */
> +	param_config = (uint64_t)t->eci->gt_id << gt_shift |
> +		       t->eci->engine_class << engine_class |
> +		       t->eci->engine_instance << engine_instance;
> +
> +	fd1 = igt_perf_open_group(type, engine_active_config | param_config, -1);
> +	fd2 = igt_perf_open_group(type, engine_total_config | param_config, fd1);
> +	igt_debug("fd1: %d, fd2: %d\n", fd1, fd2);
> +
> +	ret = read(fd1, val, sizeof(val));
> +	igt_assert_eq(ret, sizeof(val));
> +	igt_info("start - active: %ld, total: %ld, busyness: %.1f before scheduling on engine_instance :%d\n",
> +		 val[2], val[3], (float)val[2] / (float)val[3] * 100.0, t->eci->engine_instance);
> +
> +	igt_assert_f(xe_run_intel_compute_kernel_on_engine(t->fd, t->eci, t->execenv,
> +							   EXECENV_PREF_VRAM_IF_POSSIBLE),
> +		     "Unable to run compute kernel successfully\n");
> +
> +	ret = read(fd1, val, sizeof(val));
> +	igt_assert_eq(ret, sizeof(val));
> +	igt_info("end - active: %ld, total: %ld, busyness: %.1f after scheduling on engine_instance :%d\n",
> +		 val[2], val[3], (float)val[2] / (float)val[3] * 100.0, t->eci->engine_instance);

Where's the assertion if busyness is lesser than let's say 99%?

> +
> +	return NULL;
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
> +		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd,
> +								   hwe,
> +								   &execenv,
> +								   EXECENV_PREF_SYSTEM),
> +			     "Unable to run compute kernel successfully\n");
> +	}
> +	drm_close_driver(fd);
> +}

No, you're executing shader to return if is it supported. And using
it in the fixture is not a good idea.

> +
> +/**
> + * SUBTEST: eu-busy-10s
> + * Functionality: OpenCL kernel
> + * Description: Run loop_kernel for duration_sec and observe EU business
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
> +		      "Skipping test when SRIOV is enabled\n");
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

You should retrieve ccs_mode back to it's original value after the test.
As it can fail you should use fixtures before / after test.

> +
> +	igt_skip_on_f(ccs_mode <= 1, "Skipping test as ccs_mode <=1 not matching criteria :%d\n",
> +		      ccs_mode);
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +
> +	igt_skip_on_f(igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd),
> +		      "Skipping test when SRIOV is enabled\n");

Dejavu?

> +
> +	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	kernels = intel_compute_square_kernels;
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			break;
> +		kernels++;
> +	}
> +

You may exit here if kernels->loop_kernel is not supported. There's
guard in the end of intel_compute_square_kernels so you may use it.

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
> +			    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
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
> +				       &threads_data[i]);
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
> +	}
> +	free(threads_data);
> +	drm_close_driver(fd);
> +}
> +
>  /**
>   * SUBTEST: compute-square
>   * Mega feature: WMTP
> @@ -263,9 +491,15 @@ test_compute_square(int fd)
>  igt_main
>  {
>  	int xe;
> +	unsigned int ip_ver;
>  
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
> +		ip_ver = intel_graphics_ver(intel_get_drm_devid(xe));
> +
> +		/* check for loop kernel support in pipeline */
> +		if (ip_ver < IP_VER(20, 0))
> +			igt_check_supported_pipeline();

You're executing shader in the fixture?

--
Zbigniew

>  	}
>  
>  	igt_subtest("compute-square")
> @@ -284,4 +518,8 @@ igt_main
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
