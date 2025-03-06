Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75824C282DE
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 05:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A46510E8DB;
	Thu,  6 Mar 2025 05:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHqW0hYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AEB10E8DB
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 05:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741240091; x=1772776091;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=23Qvb2VkKw23k9N+Tk9Cnq3+/ojApRD1q2sg9UmZfoM=;
 b=iHqW0hYYdk0WRsFssTIfyithBMx7Z6G+p0I62mQDOCaN9UbDrAh3eMAF
 eZ3qxdn40N+X+kECFn/SU2Jn7kfo81QwwMBnzcYNHwfhjyG7PcseItIYG
 ESJEVdeO6tJaEpP9dUGJD3OVRraY0kx7VVG/3rtLytvOMD5Y35d/FzL0y
 cxldkMWAYKdpLXzs8jOpxj8kDsBy7Ua1LOtnNWEuadsxkRBXNqt9c8pef
 MiTamphV/fcbwkLqsisz2BN3uxYifaxwC1sHTOsY5I6SPnuz5WqjzwQyQ
 KNE3HL3HewS+NQB4uTOu0f9qqjLP0GJa66Lapa2FSIX6TuoMH+NePlg57 g==;
X-CSE-ConnectionGUID: ee4POdekRtqyoEos5oUz3A==
X-CSE-MsgGUID: SaLDopENSra209E6yyy6ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41943342"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="41943342"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 21:48:11 -0800
X-CSE-ConnectionGUID: NZSetvJGSeGl9syt3p4ZTA==
X-CSE-MsgGUID: w32Q9ILEROidIIKsSJSnxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="118923513"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 21:48:10 -0800
Date: Thu, 6 Mar 2025 06:48:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_render_copy: Render under copy
 stress
Message-ID: <20250306054806.yb4pthypylbckn54@zkempczy-mobl2>
References: <20250305135821.37517-1-francois.dugast@intel.com>
 <20250305135821.37517-6-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305135821.37517-6-francois.dugast@intel.com>
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

On Wed, Mar 05, 2025 at 02:58:00PM +0100, Francois Dugast wrote:
> These new tests are meant to observe the impact of stressing the copy
> engines with multiple copy jobs on a rendering job running in parallel.
> 
> Add the following tests:
> * "render-stress-0-copies"
> * "render-stress-1-copies"
> * "render-stress-2-copies"
> * "render-stress-4-copies"
> * "render-stress-16-copies"
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

This suits more to benchmarks, not tests. This test always passes (unless
there's a bug in submission or you can't spawn threads). If you would
compare this for example to kms_pipe_stress there're data integrity checks,
here you got only duration numbers which are not useful from CI
perspective (CI doesn't compare such results between runs so how you can
tell if it's a regression or not?).

--
Zbigniew

> ---
>  tests/intel/xe_render_copy.c | 202 +++++++++++++++++++++++++++++++++++
>  1 file changed, 202 insertions(+)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 2125e0667..03d7986bf 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -14,6 +14,7 @@
>  #include "intel_bufops.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> +#include "xe/xe_util.h"
>  
>  /**
>   * TEST: Copy memory using 3d engine
> @@ -438,6 +439,188 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>  	return fails;
>  }
>  
> +/**
> + * TEST: Render while stressing copy functions
> + * Category: Core
> + * Mega feature: Render
> + * Sub-category: 3d
> + * Functionality: copy
> + * Test category: stress test
> + *
> + * SUBTEST: render-stress-%s-copies
> + * Description: Render while running %arg[1] parallel copies per supported engine
> + *
> + * arg[1]:
> + * @0: 0 parallel copies
> + * @1: 1 parallel copies
> + * @2: 2 parallel copies
> + * @4: 4 parallel copies
> + * @16: 16 parallel copies
> + */
> +
> +/*
> + * Copy parameters
> + */
> +#define COPY_SIZE		SZ_16M
> +#define COPY_N_SEQ_BLT_MEM	200
> +#define COPY_MAX_THREADS	64
> +
> +/*
> + * Render parameters
> + */
> +#define RENDER_TEST_TYPE	COPY_FULL
> +#define RENDER_TILING		T_LINEAR
> +#define RENDER_ITERATIONS	50
> +
> +static void stress_copy(int fd, uint32_t size, uint32_t region,
> +			struct drm_xe_engine_class_instance *hwe, int ncopies)
> +{
> +	uint32_t src_handle, dst_handle, vm, exec_queue, src_size;
> +	uint32_t bo_size = ALIGN(size, xe_get_default_alignment(fd));
> +	intel_ctx_t *ctx;
> +
> +	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> +	dst_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> +	vm = xe_vm_create(fd, 0, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
> +
> +	src_size = bo_size;
> +
> +	blt_bo_copy(fd, src_handle, dst_handle, ctx, src_size, size, 1, region, ncopies);
> +
> +	gem_close(fd, src_handle);
> +	gem_close(fd, dst_handle);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +	free(ctx);
> +}
> +
> +typedef struct {
> +	int fd;
> +	uint32_t size;
> +	uint32_t region;
> +	struct drm_xe_engine_class_instance *hwe;
> +	uint32_t ncopies;
> +} data_thread_stress_copy;
> +
> +static void *run_thread_stress_copy(void *arg)
> +{
> +	data_thread_stress_copy *data = (data_thread_stress_copy *)arg;
> +
> +	stress_copy(data->fd, data->size, data->region, data->hwe, data->ncopies);
> +	pthread_exit(NULL);
> +}
> +
> +static void data_thread_stress_copy_init(data_thread_stress_copy *data, int fd)
> +{
> +	data->fd = fd;
> +	data->size = COPY_SIZE;
> +	data->ncopies = COPY_N_SEQ_BLT_MEM;
> +}
> +
> +typedef struct {
> +	int fd;
> +	uint32_t render_width;
> +	uint32_t render_height;
> +	uint32_t render_tiling;
> +	enum render_copy_testtype render_testtype;
> +	uint32_t iterations;
> +	uint64_t duration_total;
> +	uint64_t duration_min;
> +	uint64_t duration_max;
> +} data_thread_render;
> +
> +static void *run_thread_render(void *arg)
> +{
> +	data_thread_render *data = (data_thread_render *)arg;
> +	struct buf_ops *bops;
> +
> +	bops = buf_ops_create(data->fd);
> +
> +	for (int i = 0; i < data->iterations; i++) {
> +		uint64_t duration;
> +
> +		render(bops, data->render_tiling, data->render_width, data->render_height,
> +		       data->render_testtype, &duration);
> +		data->duration_total += duration;
> +		if (duration < data->duration_min)
> +			data->duration_min = duration;
> +		if (duration > data->duration_max)
> +			data->duration_max = duration;
> +	}
> +
> +	pthread_exit(NULL);
> +}
> +
> +static void data_thread_render_init(data_thread_render *data, int fd)
> +{
> +	data->fd = fd;
> +	data->duration_total = 0;
> +	data->duration_min = -1;
> +	data->duration_max = 0;
> +	data->render_width = WIDTH;
> +	data->render_height = HEIGHT;
> +	data->render_tiling = RENDER_TILING;
> +	data->render_testtype = RENDER_TEST_TYPE;
> +	data->iterations = RENDER_ITERATIONS;
> +}
> +
> +static bool has_copy_function(struct drm_xe_engine_class_instance *hwe)
> +{
> +	return hwe->engine_class == DRM_XE_ENGINE_CLASS_COPY;
> +}
> +
> +static void render_stress_copy(int fd, struct igt_collection *set,
> +			       uint32_t nparallel_copies_per_engine)
> +{
> +	struct igt_collection *regions;
> +	struct drm_xe_engine_class_instance *hwe;
> +	data_thread_stress_copy data_stress_copy[COPY_MAX_THREADS];
> +	pthread_t threads_stress_copy[COPY_MAX_THREADS];
> +	int count_threads_stress_copy = 0;
> +
> +	data_thread_render data_render;
> +	pthread_t thread_render;
> +
> +	data_thread_render_init(&data_render, fd);
> +	igt_assert(pthread_create(&thread_render,
> +				  NULL,
> +				  run_thread_render,
> +				  &data_render) == 0);
> +
> +	for_each_variation_r(regions, 1, set) {
> +		xe_for_each_engine(fd, hwe) {
> +			if (!has_copy_function(hwe))
> +				continue;
> +
> +			for (int i = 0; i < nparallel_copies_per_engine; i++) {
> +				data_thread_stress_copy_init(
> +					&data_stress_copy[count_threads_stress_copy], fd);
> +				data_stress_copy[count_threads_stress_copy].region =
> +					igt_collection_get_value(regions, 0);
> +				data_stress_copy[count_threads_stress_copy].hwe = hwe;
> +				igt_assert(pthread_create(
> +						   &threads_stress_copy[count_threads_stress_copy],
> +						   NULL,
> +						   run_thread_stress_copy,
> +						   &data_stress_copy[count_threads_stress_copy])
> +					   == 0);
> +				count_threads_stress_copy++;
> +				igt_assert_lt(count_threads_stress_copy, COPY_MAX_THREADS);
> +			}
> +		}
> +	}
> +
> +	for (int i = 0; i < count_threads_stress_copy; i++)
> +		pthread_join(threads_stress_copy[i], NULL);
> +	pthread_join(thread_render, NULL);
> +
> +	igt_info("Render duration: avg = %ld ns, min = %ld ns, max = %ld ns\n",
> +		 data_render.duration_total / data_render.iterations,
> +		 data_render.duration_min, data_render.duration_max);
> +}
> +
>  static int opt_handler(int opt, int opt_index, void *data)
>  {
>  	switch (opt) {
> @@ -478,11 +661,25 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>  	struct buf_ops *bops;
>  	const char *tiling_name;
>  	int tiling;
> +	struct igt_collection *set;
> +	const struct section {
> +		const char *name;
> +		unsigned int nparallel_copies_per_engine;
> +	} sections[] = {
> +		{ "0", 0 },
> +		{ "1", 1 },
> +		{ "2", 2 },
> +		{ "4", 4 },
> +		{ "16", 16 },
> +		{ NULL },
> +	};
>  
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
>  		bops = buf_ops_create(xe);
>  		srand(time(NULL));
> +		set = xe_get_memory_region_set(xe,
> +					       DRM_XE_MEM_REGION_CLASS_SYSMEM);
>  	}
>  
>  	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
> @@ -502,6 +699,11 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>  
> +	for (const struct section *s = sections; s->name; s++)
> +		igt_subtest_f("render-stress-%s-copies", s->name) {
> +			render_stress_copy(xe, set, s->nparallel_copies_per_engine);
> +		}
> +
>  	igt_fixture {
>  		buf_ops_destroy(bops);
>  		drm_close_driver(xe);
> -- 
> 2.43.0
> 
