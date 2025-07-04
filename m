Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFDBC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 07:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4834310E93C;
	Fri,  4 Jul 2025 07:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxdOv3yP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8B810E93C
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751612561; x=1783148561;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cygiDodoipIl98+7UMmoAs1bdFbPyMe8/wZy9ZVuCF0=;
 b=SxdOv3yP+mPa8rvfB3ZjZaMXgWoL8xgm+C6JfdHRCb3Dw16V0KoWoBfD
 LxoyJ8iS6dR6+y/TZILVYLBgtXOkolnOAYYd1x1L0G6+pNb7yVp/YQ8O5
 Aackhsc/sgK40R4SHFK1pqO8CDh62dCvLZJ7WkRpwM+HCp8IWlYFtZ783
 90VNElkWACAu8F5zMjXeNgp1OYkoWwV1nbqgoSBGmugbd6/nOU9Db0WDK
 4giyfyykW7Nu+ZgpNAMtzQb2x6xBwvTGAi6Y9RJLcyLZM2eCgbiepRVqN
 VPkxqhSq9b9DwPrkXR5bbCXk12YbpAJTQ9q57DUDjpgb2vylil1hq/x8p A==;
X-CSE-ConnectionGUID: LWYoaiT4QXu6SXQehDv71Q==
X-CSE-MsgGUID: 6w2z4PC2SpKPPPrvdK3cuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="71518162"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="71518162"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:02:40 -0700
X-CSE-ConnectionGUID: UTIWlOo7S7GNutiKKKRj4g==
X-CSE-MsgGUID: uBKmNp0jSgeYRX0MwYIUDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154214971"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:02:39 -0700
Date: Fri, 4 Jul 2025 09:02:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_compute: Add Compute
 workload Scheduling and Display EU busyness
Message-ID: <wjevcyrk6t4qrs34bqtsych4hjgj2e7pz2ozq42v2yk4v2sage@zlyuwnw6f4ck>
References: <20250703151954.159617-1-nishit.sharma@intel.com>
 <20250703151954.159617-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703151954.159617-3-nishit.sharma@intel.com>
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

On Thu, Jul 03, 2025 at 03:19:54PM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Adds compute workload scheduling and execution on multi-ccs available.
> This also adds logic to show EU busyness information on console while workload is running
> on multiple CCS engine instances.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/intel_compute.c      |  29 +-
>  lib/intel_compute.h      |   2 +
>  tests/intel/xe_compute.c | 764 +++++++++++++++++++++++++++++++++++++++
>  tests/meson.build        |   1 +
>  4 files changed, 793 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index bfb9024ba..252fa2f81 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -249,8 +249,14 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
>  				break;
>  			}
>  
> -			bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
> -							 placement, flags);
> +			if (!execenv->user)

What's for this check? execenv->user is not used in else branch.

> +				bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
> +								 placement, flags);
> +			else
> +				bo_dict[i].handle = xe_bo_create_caching(fd, execenv->vm,
> +									 bo_dict[i].size,
> +									 placement, flags,
> +									 DRM_XE_GEM_CPU_CACHING_WC);
>  			bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
>  			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
>  					 bo_dict[i].size, &sync, 1);
> @@ -1788,6 +1794,15 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_destroy(&execenv);
>  }
>  
> +static void bo_execenv_exec_async_wait(struct bo_execenv *execenv)
> +{
> +	xe_wait_ufence(execenv->fd, &execenv->bo_sync->sync, USER_FENCE_VALUE,
> +			execenv->exec_queue, INT64_MAX);
> +
> +	munmap(execenv->bo_sync, sizeof(*execenv->bo_sync));
> +	gem_close(execenv->fd, execenv->bo);
> +}
> +

There's bo_execenv_sync() which does the same.

>  /**
>   * xe2lpg_compute_exec - run a pipeline compatible with XE2
>   *
> @@ -1867,7 +1882,15 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  				    OFFSET_KERNEL, 0, false,
>  				    execenv.array_size);
>  
> -	bo_execenv_exec(&execenv, ADDR_BATCH);
> +	if (!user)
> +		bo_execenv_exec(&execenv, ADDR_BATCH);

What if happen when user will pass:
    user != NULL and user->loop_kernel_duration == 0?

> +	else if (user->loop_kernel_duration) {
> +		bo_execenv_exec_async(&execenv, ADDR_BATCH);
> +		igt_measured_usleep(user->loop_kernel_duration);
> +		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
> +		bo_execenv_exec_async_wait(&execenv);
> +		user->skip_results_check = 1;
> +	}

Main drawback of this approach is we stuck here doing sleep,
but xe2lpg_compute_exec() is synchronous so let it be, we're
not able at the moment to control duration of loop shader
within it.

>  
>  	for (int i = 0; i < execenv.array_size; i++) {
>  		float input = input_data[i];
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index 412791d07..19977933f 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -63,6 +63,8 @@ struct user_execenv {
>  	uint64_t input_addr;
>  	/** @output_addr: override default address of the output array if provided */
>  	uint64_t output_addr;
> +	/** @loop_kernel_duration: duration till kernel should execute in gpu **/
> +	uint32_t loop_kernel_duration;
>  };
>  
>  enum execenv_alloc_prefs {
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 955edf082..b226a870e 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -12,6 +12,7 @@
>   */
>  
>  #include <string.h>
> +#include <sys/ioctl.h>
>  
>  #include "igt.h"
>  #include "igt_sysfs.h"
> @@ -19,6 +20,52 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#include "tools/gputop/utils.h"
> +#include "tools/gputop/xe_gputop.h"
> +#include "igt_drm_clients.h"
> +
> +static const char * const drivers[] = {
> +	"xe",
> +	/* Keep the last one as NULL */
> +	NULL
> +};
> +
> +/**
> + * Number of supported drivers needs to be adjusted as per the length of
> + * the drivers[] array.
> + */
> +#define	NUM_DRIVER	1
> +#define	LOOP_DURATION	(1000000ull)
> +#define	engine_ptr(engines, n)	(&(engines)->engine + (n))
> +#define THREAD_SLEEP	(1000000ull)
> +
> +/*
> + * devices[] array of type struct gputop_device
> + */
> +struct gputop_device devices[] = {
> +	{false, 0, NULL}
> +};
> +
> +enum utilization_type {
> +	UTILIZATION_TYPE_ENGINE_TIME,
> +	UTILIZATION_TYPE_TOTAL_CYCLES,
> +};
> +
> +bool workload_sched;
> +
> +pthread_barrier_t barrier;
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
> @@ -178,6 +225,719 @@ test_compute_square(int fd)
>  		      "GPU not supported\n");
>  }
>  
> +static void
> +*intel_compute_thread(void *data)
> +{
> +	struct thread_data *t = (struct thread_data *)data;
> +
> +	usleep(3 * THREAD_SLEEP);
> +
> +	igt_info("Compute kernel executing on engine class :%s instance :%d gt: GT-%d\n",
> +			xe_engine_class_string(t->eci->engine_class), t->eci->engine_instance,
> +			t->eci->gt_id);
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (*t->go == 0)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	workload_sched = true;
> +	igt_assert_f(xe_run_intel_compute_kernel_on_engine(t->fd,
> +							   t->eci,
> +							   t->execenv,
> +							   EXECENV_PREF_VRAM_IF_POSSIBLE),
> +		     "Unable to run compute kernel successfully\n");
> +	workload_sched = false;
> +	return NULL;
> +}
> +
> +static volatile bool stop_top;
> +
> +static void
> +update_console_size(int *w, int *h)
> +{
> +	struct winsize ws = {};
> +
> +	if (ioctl(0, TIOCGWINSZ, &ws) == -1)
> +		return;
> +
> +	*w = ws.ws_col;
> +	*h = ws.ws_row;
> +
> +	if (*w == 0 && *h == 0) {
> +		/* Serial console. */
> +		*w = 80;
> +		*h = 24;
> +	}
> +}

What's that for? You're not implementing gputop here, right?

> +
> +static int
> +__client_id_cmp(const struct igt_drm_client *a,
> +		const struct igt_drm_client *b)
> +{
> +	if (a->id > b->id)
> +		return 1;
> +	else if (a->id < b->id)
> +		return -1;
> +	else
> +		return 0;
> +}
> +
> +static int
> +client_cmp(const void *_a, const void *_b, void *unused)
> +{
> +	const struct igt_drm_client *a = _a;
> +	const struct igt_drm_client *b = _b;
> +	long val_a, val_b;
> +
> +	/* DRM cards into consecutive buckets first. */
> +	val_a = a->drm_minor;
> +	val_b = b->drm_minor;
> +	if (val_a > val_b)
> +		return 1;
> +	else if (val_b > val_a)
> +		return -1;
> +
> +	/*
> +	 * Within buckets sort by last sampling period aggregated runtime, with
> +	 * client id as a tie-breaker.
> +	 */
> +	val_a = a->agg_delta_engine_time;
> +	val_b = b->agg_delta_engine_time;
> +	if (val_a == val_b)
> +		return __client_id_cmp(a, b);
> +	else if (val_b > val_a)
> +		return 1;
> +	else
> +		return -1;
> +
> +}
> +
> +static void clrscr(void)
> +{
> +	printf("\033[H\033[J");
> +}
> +
> +static int
> +pmu_format_shift(int xe, const char *name)
> +{
> +	uint32_t start;
> +	int format;
> +	char device[80];
> +
> +	format = perf_event_format(xe_perf_device(xe, device, sizeof(device)),
> +			name, &start);
> +	if (format)
> +		return 0;
> +
> +	return start;
> +}
> +
> +static const char
> +*class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +static int
> +engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +static void
> +*xe_init_engines(const void *obj)
> +{
> +	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
> +	struct xe_pmu_device *engines;
> +	int ret = 0;
> +	char device[30];
> +	struct drm_xe_engine_class_instance *hwe;
> +	int card_fd;
> +	uint64_t engine_class, engine_instance, gt_shift;
> +	uint64_t engine_active_config, engine_total_config;
> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);
> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return NULL;
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_pmu_device) +
> +			xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(struct xe_pmu_device) +
> +			xe_number_engines(card_fd) * sizeof(struct xe_engine));
> +
> +	engines->num_engines = 0;
> +	engines->device = ((struct xe_gputop *)obj)->pmu_device;
> +	gt_shift = pmu_format_shift(card_fd, "gt");
> +	engine_class = pmu_format_shift(card_fd, "engine_class");
> +	engine_instance = pmu_format_shift(card_fd, "engine_instance");
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	ret = perf_event_config(device,
> +			"engine-active-ticks",
> +			&engine_active_config);
> +	if (ret < 0)
> +		return NULL;
> +	ret = perf_event_config(device,
> +			"engine-total-ticks",
> +			&engine_total_config);
> +	if (ret < 0)
> +		return NULL;
> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t  param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
> +		engine->drm_xe_engine = *hwe;
> +		engine->engine_active_ticks.config = engine_active_config | param_config;
> +		engine->engine_total_ticks.config = engine_total_config | param_config;
> +
> +		if (engine->engine_active_ticks.config == -1 ||
> +				engine->engine_total_ticks.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +				class_display_name(engine->drm_xe_engine.engine_class),
> +				engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return NULL;
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +			sizeof(struct xe_engine), engine_cmp);
> +
> +	((struct xe_gputop *)obj)->eng_obj = engines;

Instead of gathering all engines pick ones which are necessary
to collect statistics from them (ccsX), nothing else.

> +
> +	return engines;
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
> +int xe_pmu_init(const void *obj)
> +{
> +	struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	unsigned int i;
> +	int fd;
> +	struct xe_engine *engine;
> +	uint64_t type = igt_perf_type_id(engines->device);
> +
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
> +				&engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
> +				&engines->fd);
> +		if (fd < 0)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +void xe_clean_up(void *obj, int len)
> +{
> +	struct xe_engine *eng;
> +	struct xe_pmu_counter pmu;
> +	struct xe_gputop *dev = (struct xe_gputop *)obj;
> +
> +	for (int i = 0; i < len; i++) {
> +		if ((dev + i)->card)
> +			free((dev + i)->card);
> +		if ((dev + i)->eng_obj) {
> +
> +			for (int j = 0; j < ((struct xe_pmu_device *)(dev + i)->eng_obj)->num_engines ; j++) {
> +				eng = engine_ptr((struct xe_pmu_device *)(dev + i)->eng_obj, j);
> +				if (eng->display_name)
> +					free(eng->display_name);
> +
> +				pmu = eng->engine_active_ticks;
> +				if (pmu.present)
> +					close(pmu.fd);
> +
> +				pmu = eng->engine_total_ticks;
> +				if (pmu.present)
> +					close(pmu.fd);
> +			}
> +			free(dev->eng_obj);
> +		}
> +		if ((dev + i)->pmu_device)
> +			free(dev->pmu_device);
> +	}
> +}
> +
> +static void
> +eu_util_free(void)
> +{
> +	for (int i = 0; drivers[i]; i++) {
> +		xe_clean_up(devices[i].instances, devices[i].len);
> +		free(devices[i].instances);
> +		devices[i].driver_present = false;
> +		devices[i].len = 0;
> +	}
> +}
> +
> +static int
> +find_driver(struct igt_device_card *card)
> +{
> +	for (int i = 0; drivers[i]; i++) {
> +		if (strcmp(drivers[i], card->driver) == 0)
> +			return i;
> +	}
> +	return -1;
> +}
> +
> +static char
> +*pmu_name(struct igt_device_card *card)
> +{
> +	int card_fd;
> +	char device[30];
> +	char *path;
> +
> +	if (strlen(card->card))
> +		card_fd = igt_open_card(card);
> +	else if (strlen(card->render))
> +		card_fd = igt_open_render(card);
> +
> +	if (card_fd == -1)
> +		return NULL;
> +
> +	xe_perf_device(card_fd, device, sizeof(device));
> +	path = strdup(device);
> +	close(card_fd);
> +	return path;
> +}
> +
> +void xe_gputop_init(void *ptr, struct igt_device_card *card)
> +{
> +	struct xe_gputop *obj = (struct xe_gputop *)ptr;
> +
> +	obj->pmu_device = pmu_name(card);
> +	if (!obj->pmu_device) {
> +		fprintf(stderr, "%s : pmu_device path returned NULL", card->pci_slot_name);
> +		exit(EXIT_FAILURE);
> +	}
> +	obj->card = card;
> +}
> +
> +static int populate_device_instances(const char *filter)

You need to pick single device on which you're doing the test.
Gputop does this for all devices, so you don't need this.

Please remove everything what is not needed to achieve the goal
and respin.

--
Zbigniew

> +{
> +	struct igt_device_card *cards = NULL;
> +	struct igt_device_card *card_inplace = NULL;
> +	struct gputop_device *dev =  NULL;
> +	int driver_no;
> +	int count, final_count = 0;
> +
> +	count = igt_device_card_match_all(filter, &cards);
> +	for (int j = 0; j < count; j++) {
> +		if (strcmp((cards + j)->subsystem, "pci") != 0)
> +			continue;
> +
> +		driver_no = find_driver(cards + j);
> +		if (driver_no < 0)
> +			continue;
> +
> +		dev = devices + driver_no;
> +		if (!dev->driver_present)
> +			dev->driver_present = true;
> +		dev->len++;
> +		dev->instances = realloc(dev->instances,
> +				dev->len * sizeof(struct xe_gputop));
> +		if (!dev->instances) {
> +			fprintf(stderr,
> +					"Device instance realloc failed (%s)\n",
> +					strerror(errno));
> +			exit(EXIT_FAILURE);
> +		}
> +		card_inplace = (struct igt_device_card *)
> +			calloc(1, sizeof(struct igt_device_card));
> +		memcpy(card_inplace, cards + j, sizeof(struct igt_device_card));
> +		xe_gputop_init((struct xe_gputop *)(dev->instances + dev->len - 1),
> +				card_inplace);
> +		final_count++;
> +	}
> +	if (count)
> +		free(cards);
> +	return final_count;
> +}
> +
> +static uint64_t
> +pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +static void
> +__update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void
> +update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +void xe_pmu_sample(const void *obj)
> +{
> +	struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	pmu_read_multi(engines->fd, num_val, val);
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
> +void n_spaces(const unsigned int n)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < n; i++)
> +		putchar(' ');
> +}
> +
> +static int
> +print_engine(struct xe_pmu_device *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double percentage = pmu_active_percentage(engine);
> +
> +	if (engine->drm_xe_engine.engine_class == DRM_XE_ENGINE_CLASS_COMPUTE && !workload_sched) {
> +		igt_info("Engine_instance :%d EU busyness :%5.1f\n", engine->drm_xe_engine.engine_instance, percentage);
> +		if (!percentage)
> +			igt_info("No workload scheduled, BU busyness :%5.1f expected\n", percentage);
> +		else
> +			igt_info("Workload scheduled, BU busyness :%5.1f expected\n", percentage);
> +	} else if (engine->drm_xe_engine.engine_class == DRM_XE_ENGINE_CLASS_COMPUTE && workload_sched) {
> +		igt_info("Engine_instance :%d EU busyness :%5.1f\n", engine->drm_xe_engine.engine_instance, percentage);
> +		if (!percentage)
> +			igt_info("No workload scheduled, BU busyness :%5.1f expected\n", percentage);
> +		else
> +			igt_info("Workload scheduled, BU busyness :%5.1f expected\n", percentage);
> +	}
> +
> +	printf("\n");
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int lines, int w, int h)
> +{
> +	struct xe_pmu_device *show = ((struct xe_gputop *)obj)->eng_obj;
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	return lines;
> +}
> +
> +static void *show_eu_util(void *data)
> +{
> +	struct igt_drm_clients *clients = NULL;
> +	int con_w = -1, con_h = -1;
> +	int ret;
> +	long n;
> +
> +	n = -1;
> +	if (!populate_device_instances("device:subsystem=pci,card=all")) {
> +		printf("No device found.\n");
> +		eu_util_free();
> +		exit(1);
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		if (devices[i].driver_present) {
> +			for (int j = 0; j < devices[i].len; j++) {
> +				if (!xe_init_engines(devices[i].instances + j)) {
> +					fprintf(stderr,
> +							"Failed to initialize engines! (%s)\n",
> +							strerror(errno));
> +					eu_util_free();
> +					exit(1);
> +					return NULL;
> +				}
> +				ret = xe_pmu_init(devices[i].instances + j);
> +
> +				if (ret) {
> +					fprintf(stderr,
> +							"Failed to initialize PMU! (%s)\n",
> +							strerror(errno));
> +					if (errno == EACCES && geteuid())
> +						fprintf(stderr,
> +								"\n"
> +								"When running as a normal user CAP_PERFMON is required to access performance\n"
> +								"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
> +								"distribution vendor for assistance.\n"
> +								"\n"
> +								"More information can be found at 'Perf events and tool security' document:\n"
> +								"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
> +
> +					igt_devices_free();
> +					eu_util_free();
> +					return NULL;
> +				}
> +			}
> +		}
> +	}
> +	for (int i = 0; drivers[i]; i++) {
> +		for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +			xe_pmu_sample(devices[i].instances + j);
> +	}
> +
> +	clients = igt_drm_clients_init(NULL);
> +	if (!clients)
> +		exit(1);
> +
> +	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> +	while ((n != 0) && !stop_top) {
> +		int lines = 0;
> +
> +		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> +
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +				xe_pmu_sample(devices[i].instances + j);
> +		}
> +
> +		igt_drm_clients_sort(clients, client_cmp);
> +
> +		update_console_size(&con_w, &con_h);
> +		clrscr();
> +
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++) {
> +				lines = xe_print_engines(devices[i].instances + j,
> +						lines, con_w, con_h);
> +			}
> +		}
> +
> +		if (!clients->num_clients) {
> +			const char *msg = " (No GPU clients yet. Start workload to see stats)";
> +
> +			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
> +					(int)(con_w - strlen(msg) - 1), msg);
> +		}
> +	}
> +	igt_drm_clients_free(clients);
> +	eu_util_free();
> +
> +	return NULL;
> +}
> +
> +static void
> +thread_init_eu_utils(void)
> +{
> +	pthread_t eu_utils;
> +	int fd;
> +	uint16_t dev_id;
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	dev_id = intel_get_drm_devid(fd);
> +
> +	/* Creating thread to display EU utilization in BMG */
> +	if (IS_BATTLEMAGE(dev_id))
> +		pthread_create(&eu_utils, NULL, show_eu_util, NULL);
> +}
> +
> +/**
> + * SUBTEST: eu-busy-10-sec
> + * Functionality: OpenCL kernel
> + * Description:
> + *      Run an openCL long rinning Kernel that returns output[i] = input[i] * input[i],
> + */
> +static void
> +test_eu_busy(int fd, int num_gt, u32 duration_sec)
> +{
> +	struct user_execenv execenv = { 0 };
> +	struct thread_data *threads_data;
> +	struct drm_xe_engine_class_instance *hwe;
> +	const struct intel_compute_kernels *kernels;
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	u32 gt, n_threads = 0, iterations = 0, n_instances = 0, i;
> +	bool go = false;
> +	int ccs_mode, gt_fd;
> +	u32 num_slices, ip_ver;
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	kernels = intel_compute_square_kernels;
> +	drm_close_driver(fd);
> +
> +	for (gt = 0; gt < num_gt; gt++) {
> +		if (!get_num_cslices(gt, &num_slices))
> +			continue;
> +
> +		gt_fd = gt_sysfs_open(gt);
> +		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 2) > 0);
> +		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
> +		close(gt_fd);
> +	}
> +
> +	igt_skip_on_f(ccs_mode <= 1, "Skipping test as ccs_mode <=1 not matching criteria :%d\n",
> +				      ccs_mode);
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	thread_init_eu_utils();
> +
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			break;
> +		kernels++;
> +	}
> +
> +	execenv.loop_kernel_duration = duration_sec;
> +	execenv.kernel = kernels->loop_kernel;
> +	execenv.kernel_size = kernels->loop_kernel_size;
> +
> +	for (gt = 0; gt < num_gt; gt++) {
> +		xe_for_each_engine(fd, hwe) {
> +			igt_assert(hwe);
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +				++n_instances;
> +		}
> +	}
> +
> +	threads_data = calloc(n_instances, sizeof(*threads_data));
> +	igt_assert(threads_data);
> +
> +	pthread_mutex_init(&mutex, 0);
> +	pthread_cond_init(&cond, 0);
> +
> +	for (gt = 0; gt < num_gt; gt++) {
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
> +			usleep(1 * THREAD_SLEEP);
> +		}
> +
> +		pthread_mutex_lock(&mutex);
> +		go = true;
> +		pthread_cond_broadcast(&cond);
> +		pthread_mutex_unlock(&mutex);
> +
> +		for (int val = 0; val < i; ++val) {
> +			pthread_join(threads_data[val].thread, NULL);
> +		}
> +
> +		i = 0;
> +		n_threads = 0;
> +		iterations = 0;
> +		stop_top = true;
> +	}
> +	free(threads_data);
> +	drm_close_driver(fd);
> +}
> +
>  igt_main
>  {
>  	int xe, num_gt;
> @@ -199,4 +959,8 @@ igt_main
>  
>  	igt_subtest("ccs-mode-compute-kernel")
>  		test_compute_kernel_with_ccs_mode(num_gt);
> +
> +	/* test to check available EU utilisation for multi_ccs */
> +	igt_subtest("eu-busy-10-sec")
> +		test_eu_busy(xe, num_gt, 10 * LOOP_DURATION);
>  }
> diff --git a/tests/meson.build b/tests/meson.build
> index 55bcf57ec..3340e137d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -404,6 +404,7 @@ extra_dependencies = {
>  	'sw_sync': [ libatomic ],
>  	'xe_fault_injection': [ lib_igt_xe_oa ],
>  	'xe_oa': [ lib_igt_xe_oa ],
> +	'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math ],
>  }
>  
>  test_executables = []
> -- 
> 2.43.0
> 
