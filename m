Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC05810E630
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 07:16:28 +0000 (UTC)
Date: Thu, 16 Dec 2021 08:16:23 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Ybrnx35uHdu5NW2S@zkempczy-mobl2>
References: <20211216051758.3919-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216051758.3919-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_suspend: Add
 support for local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 16, 2021 at 10:47:58AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Add support for local memory region (Device memory)
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Looks good:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/i915/gem_exec_suspend.c | 121 ++++++++++++++++++++--------------
>  1 file changed, 72 insertions(+), 49 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index 887bb735..59fad1dc 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -52,7 +52,7 @@
>  #define HANG (2<<8)
>  
>  static void run_test(int fd, const intel_ctx_t *ctx,
> -		     unsigned engine, unsigned flags);
> +		     unsigned engine, unsigned flags, uint32_t region);
>  
>  static void check_bo(int fd, uint32_t handle)
>  {
> @@ -67,13 +67,13 @@ static void check_bo(int fd, uint32_t handle)
>  	munmap(map, 4096);
>  }
>  
> -static void test_all(int fd, const intel_ctx_t *ctx, unsigned flags)
> +static void test_all(int fd, const intel_ctx_t *ctx, unsigned flags, uint32_t region)
>  {
> -	run_test(fd, ctx, ALL_ENGINES, flags & ~0xff);
> +	run_test(fd, ctx, ALL_ENGINES, flags & ~0xff, region);
>  }
>  
>  static void run_test(int fd, const intel_ctx_t *ctx,
> -		     unsigned engine, unsigned flags)
> +		     unsigned engine, unsigned flags, uint32_t region)
>  {
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
>  	const uint32_t bbe = MI_BATCH_BUFFER_END;
> @@ -100,7 +100,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
>  
>  	/* Before suspending, check normal operation */
>  	if (mode(flags) != NOSLEEP)
> -		test_all(fd, ctx, flags);
> +		test_all(fd, ctx, flags, region);
>  
>  	gem_quiescent_gpu(fd);
>  
> @@ -113,11 +113,11 @@ static void run_test(int fd, const intel_ctx_t *ctx,
>  	execbuf.rsvd1 = ctx->id;
>  
>  	memset(obj, 0, sizeof(obj));
> -	obj[0].handle = gem_create(fd, 4096);
> +	obj[0].handle = gem_create_in_memory_regions(fd, 4096, region);
>  	if (!gem_has_lmem(fd))
>  		gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
>  	obj[0].flags |= EXEC_OBJECT_WRITE;
> -	obj[1].handle = gem_create(fd, 4096);
> +	obj[1].handle = gem_create_in_memory_regions(fd, 4096, region);
>  	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
>  	igt_require(__gem_execbuf(fd, &execbuf) == 0);
>  	gem_close(fd, obj[1].handle);
> @@ -222,7 +222,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
>  
>  	/* After resume, make sure it still works */
>  	if (mode(flags) != NOSLEEP)
> -		test_all(fd, ctx, flags);
> +		test_all(fd, ctx, flags, region);
>  }
>  
>  struct battery_sample {
> @@ -250,7 +250,7 @@ static double d_time(const struct battery_sample *after,
>  }
>  
>  static void power_test(int i915, const intel_ctx_t *ctx,
> -		       unsigned engine, unsigned flags)
> +		       unsigned engine, unsigned flags, uint32_t region)
>  {
>  	struct battery_sample before, after;
>  	char *status;
> @@ -270,7 +270,7 @@ static void power_test(int i915, const intel_ctx_t *ctx,
>  	igt_set_autoresume_delay(5 * 60); /* 5 minutes; longer == more stable */
>  
>  	igt_assert(get_power(dir, &before));
> -	run_test(i915, ctx, engine, flags);
> +	run_test(i915, ctx, engine, flags, region);
>  	igt_assert(get_power(dir, &after));
>  
>  	igt_set_autoresume_delay(0);
> @@ -292,10 +292,33 @@ igt_main
>  		{ "-S4", HIBERNATE },
>  		{ NULL, 0 }
>  	}, *m;
> +	struct test {
> +		const char *name;
> +		unsigned int flags;
> +		void (*fn)(int, const intel_ctx_t *, unsigned, unsigned, uint32_t);
> +	} *test, tests_all_engines[] = {
> +		{ "basic", NOSLEEP, run_test },
> +		{ "basic-S0", IDLE, run_test },
> +		{ "basic-S3-devices", SUSPEND_DEVICES, run_test },
> +		{ "basic-S3", SUSPEND, run_test },
> +		{ "basic-S4-devices", HIBERNATE_DEVICES, run_test },
> +		{ "basic-S4", HIBERNATE, run_test },
> +		{ }
> +	}, tests_power_hang[] = {
> +		{ "hang-S3", SUSPEND | HANG, run_test },
> +		{ "hang-S4", HIBERNATE | HANG, run_test },
> +		{ "power-S0", IDLE, power_test },
> +		{ "power-S3", SUSPEND, power_test },
> +		{ }
> +	};
>  	const struct intel_execution_engine2 *e;
>  	igt_hang_t hang;
>  	const intel_ctx_t *ctx;
>  	int fd;
> +	char *sub_name;
> +	uint32_t region;
> +	struct drm_i915_query_memory_regions *query_info;
> +	struct igt_collection *set, *regions;
>  
>  	igt_fixture {
>  		fd = drm_open_driver_master(DRIVER_INTEL);
> @@ -304,50 +327,55 @@ igt_main
>  		ctx = intel_ctx_create_all_physical(fd);
>  
>  		igt_fork_hang_detector(fd);
> +		query_info = gem_get_query_memory_regions(fd);
> +		igt_assert(query_info);
> +
> +		set = get_memory_region_set(query_info,
> +				I915_SYSTEM_MEMORY,
> +				I915_DEVICE_MEMORY);
> +	}
> +
> +#define subtest_for_each_combination(__name, __ctx, __flags, __fn) \
> +	igt_subtest_with_dynamic(__name) { \
> +		for_each_combination(regions, 1, set) { \
> +			sub_name = memregion_dynamic_subtest_name(regions); \
> +			region = igt_collection_get_value(regions, 0); \
> +			igt_dynamic_f("%s", sub_name) \
> +				(__fn)(fd, (__ctx), ALL_ENGINES, (__flags), region); \
> +			free(sub_name); \
> +		} \
>  	}
>  
> -	igt_subtest("basic")
> -		run_test(fd, ctx, ALL_ENGINES, NOSLEEP);
> -	igt_subtest("basic-S0")
> -		run_test(fd, ctx, ALL_ENGINES, IDLE);
> -	igt_subtest("basic-S3-devices")
> -		run_test(fd, ctx, ALL_ENGINES, SUSPEND_DEVICES);
> -	igt_subtest("basic-S3")
> -		run_test(fd, ctx, ALL_ENGINES, SUSPEND);
> -	igt_subtest("basic-S4-devices")
> -		run_test(fd, ctx, ALL_ENGINES, HIBERNATE_DEVICES);
> -	igt_subtest("basic-S4")
> -		run_test(fd, ctx, ALL_ENGINES, HIBERNATE);
> +#define for_each_ctx_engine_combination(__mode) \
> +	for_each_ctx_engine(fd, ctx, e) { \
> +		if (!gem_class_can_store_dword(fd, e->class)) \
> +			continue; \
> +		for_each_combination(regions, 1, set) { \
> +			sub_name = memregion_dynamic_subtest_name(regions); \
> +			region = igt_collection_get_value(regions, 0); \
> +			igt_dynamic_f("%s-%s", e->name, sub_name) \
> +				run_test(fd, ctx, e->flags, (__mode), region); \
> +			free(sub_name); \
> +		} \
> +	}
> +
> +	for (test = tests_all_engines; test->name; test++)
> +		subtest_for_each_combination(test->name, intel_ctx_0(fd), test->flags, test->fn);
>  
>  	for (m = modes; m->suffix; m++) {
>  		igt_subtest_with_dynamic_f("fixed%s", m->suffix) {
>  			igt_require(gem_has_lmem(fd));
> -			for_each_ctx_engine(fd, ctx, e) {
> -				if (!gem_class_can_store_dword(fd, e->class))
> -					continue;
> -				igt_dynamic_f("%s", e->name)
> -					run_test(fd, ctx, e->flags, m->mode);
> -			}
> +			for_each_ctx_engine_combination(m->mode);
>  		}
>  
>  		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
>  			igt_require(!gem_has_lmem(fd));
> -			for_each_ctx_engine(fd, ctx, e) {
> -				if (!gem_class_can_store_dword(fd, e->class))
> -					continue;
> -				igt_dynamic_f("%s", e->name)
> -					run_test(fd, ctx, e->flags, m->mode | UNCACHED);
> -			}
> +			for_each_ctx_engine_combination(m->mode | UNCACHED);
>  		}
>  
>  		igt_subtest_with_dynamic_f("cached%s", m->suffix) {
>  			igt_require(!gem_has_lmem(fd));
> -			for_each_ctx_engine(fd, ctx, e) {
> -				if (!gem_class_can_store_dword(fd, e->class))
> -					continue;
> -				igt_dynamic_f("%s", e->name)
> -					run_test(fd, ctx, e->flags, m->mode | CACHED);
> -			}
> +			for_each_ctx_engine_combination(m->mode | CACHED);
>  		}
>  	}
>  
> @@ -356,17 +384,12 @@ igt_main
>  		hang = igt_allow_hang(fd, 0, 0);
>  	}
>  
> -	igt_subtest("hang-S3")
> -		run_test(fd, intel_ctx_0(fd), 0, SUSPEND | HANG);
> -	igt_subtest("hang-S4")
> -		run_test(fd, intel_ctx_0(fd), 0, HIBERNATE | HANG);
> -
> -	igt_subtest("power-S0")
> -		power_test(fd, intel_ctx_0(fd), 0, IDLE);
> -	igt_subtest("power-S3")
> -		power_test(fd, intel_ctx_0(fd), 0, SUSPEND);
> +	for (test = tests_power_hang; test->name; test++)
> +		subtest_for_each_combination(test->name, intel_ctx_0(fd), test->flags, test->fn);
>  
>  	igt_fixture {
> +		free(query_info);
> +		igt_collection_destroy(set);
>  		igt_disallow_hang(fd, hang);
>  		intel_ctx_destroy(fd, ctx);
>  		close(fd);
> -- 
> 2.32.0
> 
