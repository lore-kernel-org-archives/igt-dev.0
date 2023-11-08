Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F85310E32F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 08:55:09 +0000 (UTC)
Message-ID: <d2bcc308-7e3b-4a07-93ca-9f242f856d94@intel.com>
Date: Wed, 8 Nov 2023 14:24:59 +0530
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20231108064312.312681-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211153CC19083B6766EC2E395A8A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB6211153CC19083B6766EC2E395A8A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/intel: Add multi gt support for
 rc6_residency test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 11/8/2023 2:22 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Wednesday, November 8, 2023 12:13 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>
>> Subject: [PATCH] tests/intel: Add multi gt support for rc6_residency test
>>
>> Adding multi-gt support for rc6_idle, rc6_fence and rc6_accuracy tests.
> Please break this patch like below.
> 1) If any common  refactoring required, not applicable if no such refactoring.
> 2) Add multi gt support for rc6_idle.
> 3) Add multi gt support for rc6_fence.
> 4) Add multi gt support for rc6_accuracy test.
> 5) Add drpc debug support.
Okay I will make this a 4 patch series then.
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   tests/intel/i915_pm_rc6_residency.c | 134 ++++++++++++++++++----------
>>   1 file changed, 85 insertions(+), 49 deletions(-)
>>
>> diff --git a/tests/intel/i915_pm_rc6_residency.c
>> b/tests/intel/i915_pm_rc6_residency.c
>> index b266680ac..f865fbe94 100644
>> --- a/tests/intel/i915_pm_rc6_residency.c
>> +++ b/tests/intel/i915_pm_rc6_residency.c
>> @@ -36,6 +36,7 @@
>>   #include "i915/gem.h"
>>   #include "i915/gem_create.h"
>>   #include "igt.h"
>> +#include "igt_debugfs.h"
>>   #include "igt_perf.h"
>>   #include "igt_power.h"
>>   #include "igt_sysfs.h"
>> @@ -82,23 +83,19 @@ static unsigned long get_rc6_enabled_mask(void)
>>   	return enabled;
>>   }
>>
>> -static bool has_rc6_residency(const char *name)
>> +static bool has_rc6_residency(int dirfd, enum i915_attr_id id)
>>   {
>>   	unsigned long residency;
>> -	char path[128];
>>
>> -	sprintf(path, "power/%s_residency_ms", name);
>> -	return igt_sysfs_scanf(sysfs, path, "%lu", &residency) == 1;
>> +	return igt_sysfs_rps_scanf(dirfd, id, "%lu", &residency) == 1;
>>   }
>>
>> -static unsigned long read_rc6_residency(const char *name)
>> +static unsigned long read_rc6_residency(int dirfd, enum i915_attr_id
>> +id)
>>   {
>>   	unsigned long residency;
>> -	char path[128];
>>
>>   	residency = 0;
>> -	sprintf(path, "power/%s_residency_ms", name);
>> -	igt_assert(igt_sysfs_scanf(sysfs, path, "%lu", &residency) == 1);
>> +	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%lu", &residency) == 1);
>>   	return residency;
>>   }
>>
>> @@ -107,11 +104,14 @@ static void residency_accuracy(unsigned int diff,
>>   			       const char *name_of_rc6_residency)  {
>>   	double ratio;
>> +	int gt = 0, gt_current;
>>
>>   	ratio = (double)diff / duration;
>>
>> -	igt_info("Residency in %s or deeper state: %u ms (sleep duration %u
>> ms) (%.1f%% of expected duration)\n",
>> -		 name_of_rc6_residency, diff, duration, 100*ratio);
>> +	gt_current = igt_sysfs_get_u32(gt, "id");
>> +
>> +	igt_info("GT[%d]: Residency in %s or deeper state: %u ms (sleep
>> duration %u ms) (%.1f%% of expected duration)\n",
>> +		 gt_current, name_of_rc6_residency, diff, duration,
>> 100*ratio);
>>   	igt_assert_f(ratio > 0.9 && ratio < 1.05,
>>   		     "Sysfs RC6 residency counter is inaccurate.\n");  } @@ -
> Print gt id in igt_assert_f failed message .
> Thanks,
> Anshuman Gupta.

I thought maybe giving out the gt id as part of info would be useful, 
but sure I'll move it to the assert.

Will be better fro debug.

Thanks for the review.

Suja

>> 125,28 +125,28 @@ static unsigned long gettime_ms(void)
>>   	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;  }
>>
>> -static void read_residencies(int devid, unsigned int mask,
>> +static void read_residencies(int devid, int dirfd, unsigned int mask,
>>   			     struct residencies *res)
>>   {
>>   	res->duration = gettime_ms();
>>
>>   	if (mask & RC6_ENABLED)
>> -		res->rc6 = read_rc6_residency("rc6");
>> +		res->rc6 = read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
>>
>>   	if ((mask & RC6_ENABLED) &&
>>   	    (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)))
>> -		res->media_rc6 = read_rc6_residency("media_rc6");
>> +		res->media_rc6 = read_rc6_residency(dirfd,
>> MEDIA_RC6_RESIDENCY_MS);
>>
>>   	if (mask & RC6P_ENABLED)
>> -		res->rc6p = read_rc6_residency("rc6p");
>> +		res->rc6p = read_rc6_residency(dirfd, RC6P_RESIDENCY_MS);
>>
>>   	if (mask & RC6PP_ENABLED)
>> -		res->rc6pp = read_rc6_residency("rc6pp");
>> +		res->rc6pp = read_rc6_residency(dirfd,
>> RC6PP_RESIDENCY_MS);
>>
>>   	res->duration += (gettime_ms() - res->duration) / 2;  }
>>
>> -static void measure_residencies(int devid, unsigned int mask,
>> +static void measure_residencies(int devid, int dirfd, unsigned int
>> +mask,
>>   				struct residencies *res)
>>   {
>>   	struct residencies start = { };
>> @@ -158,13 +158,13 @@ static void measure_residencies(int devid,
>> unsigned int mask,
>>   	 * measurement, since the valid counter range is different on
>>   	 * different platforms and so fixing it up would be non-trivial.
>>   	 */
>> -	read_residencies(devid, mask, &end);
>> +	read_residencies(devid, dirfd, mask, &end);
>>   	igt_debug("time=%d: rc6=(%d, %d), rc6p=%d, rc6pp=%d\n",
>>   		  end.duration, end.rc6, end.media_rc6, end.rc6p, end.rc6pp);
>>   	for (retry = 0; retry < 2; retry++) {
>>   		start = end;
>>   		sleep(SLEEP_DURATION);
>> -		read_residencies(devid, mask, &end);
>> +		read_residencies(devid, dirfd, mask, &end);
>>
>>   		igt_debug("time=%d: rc6=(%d, %d), rc6p=%d, rc6pp=%d\n",
>>   			  end.duration,
>> @@ -196,7 +196,7 @@ static void measure_residencies(int devid, unsigned
>> int mask,
>>   	res->rc6 += res->rc6p;
>>   }
>>
>> -static bool wait_for_rc6(void)
>> +static bool wait_for_rc6(int dirfd)
>>   {
>>   	struct timespec tv = {};
>>   	unsigned long start, now;
>> @@ -205,11 +205,11 @@ static bool wait_for_rc6(void)
>>   	usleep(160 * 1000);
>>
>>   	/* Then poll for RC6 to start ticking */
>> -	now = read_rc6_residency("rc6");
>> +	now = read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
>>   	do {
>>   		start = now;
>>   		usleep(5000);
>> -		now = read_rc6_residency("rc6");
>> +		now = read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
>>   		if (now - start > 1)
>>   			return true;
>>   	} while (!igt_seconds_elapsed(&tv));
>> @@ -234,14 +234,27 @@ static uint64_t pmu_read_single(int fd)
>>   	return __pmu_read_single(fd, NULL);
>>   }
>>
>> -#define __assert_within_epsilon(x, ref, tol_up, tol_down) \
>> -	igt_assert_f((x) <= (ref) * (1.0 + (tol_up)/100.) && \
>> -		     (x) >= (ref) * (1.0 - (tol_down)/100.), \
>> -		     "'%s' != '%s' (%.3g not within +%d%%/-%d%% tolerance of
>> %.3g)\n",\
>> -		     #x, #ref, (double)(x), (tol_up), (tol_down), (double)(ref))
>> +#define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
>> +	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
>> +		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
>> +		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of
>> %f)\n %s\n",\
>> +		     #x, #ref, (double)(x), \
>> +		     (tol_up) * 100.0, (tol_down) * 100.0, \
>> +		     (double)(ref), debug_data)
>> +
>> +#define assert_within_epsilon(x, ref, tolerance, debug_data) \
>> +	__assert_within_epsilon(x, ref, tolerance, tolerance, debug_data)
>>
>> -#define assert_within_epsilon(x, ref, tolerance) \
>> -	__assert_within_epsilon(x, ref, tolerance, tolerance)
>> +char *drpc;
>> +
>> +static char *get_drpc(int i915, int gt_id) {
>> +	int gt_dir;
>> +
>> +	gt_dir = igt_debugfs_gt_dir(i915, gt_id);
>> +	igt_assert(gt_dir != -1);
>> +	return igt_sysfs_get(gt_dir, "drpc");
>> +}
>>
>>   static bool __pmu_wait_for_rc6(int fd)
>>   {
>> @@ -376,7 +389,7 @@ static void kill_children(int sig)
>>   	signal(sig, old);
>>   }
>>
>> -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
>> +static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags,
>> +unsigned int gt)
>>   {
>>   	const int64_t duration_ns = SLEEP_DURATION *
>> (int64_t)NSEC_PER_SEC;
>>   	const int tolerance = 20; /* Some RC6 is better than none! */ @@ -
>> 397,7 +410,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
>>   	struct igt_power gpu;
>>   	int fd;
>>
>> -	fd = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
>> +	fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
>>   	igt_drop_caches_set(i915, DROP_IDLE);
>>   	igt_require(__pmu_wait_for_rc6(fd));
>>   	igt_power_open(i915, &gpu, "gpu");
>> @@ -418,7 +431,10 @@ static void rc6_idle(int i915, uint32_t ctx_id,
>> uint64_t flags)
>>   			"Total energy used while idle: %.1fmJ (%.1fmW)\n",
>>   			idle, (idle * 1e9) / slept);
>>   	}
>> -	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
>> +
>> +	drpc = get_drpc(i915, igt_sysfs_get_u32(gt, "id"));
>> +
>> +	assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
>>
>>   	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -
>> 1, 0);
>>
>> @@ -454,7 +470,10 @@ static void rc6_idle(int i915, uint32_t ctx_id,
>> uint64_t flags)
>>   		igt_assert(cycles >= SLEEP_DURATION);
>>
>>   		/* While very nearly idle, expect full RC6 */
>> -		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
>> +		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
>> +
>> +		free(drpc);
>> +		drpc = NULL;
>>   	}
>>
>>   	munmap(done, 4096);
>> @@ -471,12 +490,13 @@ static void rc6_idle(int i915, uint32_t ctx_id,
>> uint64_t flags)
>>   	}
>>   }
>>
>> -static void rc6_fence(int i915, const intel_ctx_t *ctx)
>> +static void rc6_fence(int i915, unsigned int gt)
>>   {
>>   	const int64_t duration_ns = SLEEP_DURATION *
>> (int64_t)NSEC_PER_SEC;
>>   	const int tolerance = 20; /* Some RC6 is better than none! */
>>   	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>>   	const struct intel_execution_engine2 *e;
>> +	const intel_ctx_t *ctx;
>>   	struct power_sample sample[2];
>>   	unsigned long slept;
>>   	uint64_t rc6, ts[2], ahnd;
>> @@ -485,7 +505,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
>>
>>   	igt_require_sw_sync();
>>
>> -	fd = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
>> +	fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
>>   	igt_drop_caches_set(i915, DROP_IDLE);
>>   	igt_require(__pmu_wait_for_rc6(fd));
>>   	igt_power_open(i915, &gpu, "gpu");
>> @@ -506,9 +526,12 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
>>   			"Total energy used while idle: %.1fmJ (%.1fmW)\n",
>>   			idle, (idle * 1e9) / slept);
>>   	}
>> -	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
>> +	drpc = get_drpc(i915, igt_sysfs_get_u32(gt, "id"));
>> +
>> +	assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
>>
>>   	/* Submit but delay execution, we should be idle and conserving
>> power */
>> +	ctx = intel_ctx_create_for_gt(i915, gt);
>>   	ahnd = get_reloc_ahnd(i915, ctx->id);
>>   	for_each_ctx_engine(i915, ctx, e) {
>>   		igt_spin_t *spin;
>> @@ -546,10 +569,14 @@ static void rc6_fence(int i915, const intel_ctx_t
>> *ctx)
>>
>>   		close(timeline);
>>
>> -		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
>> +		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
>>   		gem_quiescent_gpu(i915);
>> +
>> +		free(drpc);
>> +		drpc = NULL;
>>   	}
>>   	put_ahnd(ahnd);
>> +	intel_ctx_destroy(i915,ctx);
>>
>>   	igt_power_close(&gpu);
>>   	close(fd);
>> @@ -558,6 +585,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
>> igt_main  {
>>   	int i915 = -1;
>> +	unsigned int dirfd, gt;
>>   	const intel_ctx_t *ctx;
>>
>>   	/* Use drm_open_driver to verify device existence */ @@ -572,19
>> +600,25 @@ igt_main
>>   		igt_require_gem(i915);
>>   		gem_quiescent_gpu(i915);
>>
>> -		for_each_ctx_engine(i915, ctx, e) {
>> -			if (e->instance == 0) {
>> -				igt_dynamic_f("%s", e->name)
>> -					rc6_idle(i915, ctx->id, e->flags);
>> +		i915_for_each_gt(i915, dirfd, gt) {
>> +			ctx = intel_ctx_create_for_gt(i915, gt);
>> +			for_each_ctx_engine(i915, ctx, e) {
>> +				if (e->instance == 0) {
>> +					igt_dynamic_f("gt%u-%s", gt, e-
>>> name)
>> +						rc6_idle(i915, ctx->id, e-
>>> flags, gt);
>> +				}
>>   			}
>> +			intel_ctx_destroy(i915, ctx);
>>   		}
>>   	}
>>
>> -	igt_subtest("rc6-fence") {
>> +	igt_subtest_with_dynamic("rc6-fence") {
>>   		igt_require_gem(i915);
>>   		gem_quiescent_gpu(i915);
>>
>> -		rc6_fence(i915, ctx);
>> +		i915_for_each_gt(i915, dirfd, gt)
>> +			igt_dynamic_f("gt%u", gt)
>> +				rc6_fence(i915, gt);
>>   	}
>>
>>   	igt_subtest_group {
>> @@ -595,21 +629,23 @@ igt_main
>>   			devid = intel_get_drm_devid(i915);
>>   			sysfs = igt_sysfs_open(i915);
>>
>> -			igt_require(has_rc6_residency("rc6"));
>> +			igt_require(has_rc6_residency(dirfd,
>> RC6_RESIDENCY_MS));
>>
>>   			/* Make sure rc6 counters are running */
>>   			igt_drop_caches_set(i915, DROP_IDLE);
>> -			igt_require(wait_for_rc6());
>> +			igt_require(wait_for_rc6(dirfd));
>>
>>   			rc6_enabled = get_rc6_enabled_mask();
>>   			igt_require(rc6_enabled & RC6_ENABLED);
>>   		}
>>
>>   		igt_subtest("rc6-accuracy") {
>> -			struct residencies res;
>> +			for_each_sysfs_gt_dirfd(i915, dirfd, gt) {
>> +				struct residencies res;
>>
>> -			measure_residencies(devid, rc6_enabled, &res);
>> -			residency_accuracy(res.rc6, res.duration, "rc6");
>> +				measure_residencies(devid, dirfd,
>> rc6_enabled, &res);
>> +				residency_accuracy(res.rc6, res.duration,
>> "rc6");
>> +			}
>>   		}
>>
>>   		igt_subtest("media-rc6-accuracy") {
>> @@ -617,7 +653,7 @@ igt_main
>>
>>   			igt_require(IS_VALLEYVIEW(devid) ||
>> IS_CHERRYVIEW(devid));
>>
>> -			measure_residencies(devid, rc6_enabled, &res);
>> +			measure_residencies(devid, sysfs, rc6_enabled, &res);
>>   			residency_accuracy(res.media_rc6, res.duration,
>> "media_rc6");
>>   		}
>>
>> @@ -626,7 +662,7 @@ igt_main
>>   	}
>>
>>   	igt_fixture {
>> -		intel_ctx_destroy(i915, ctx);
>> +		free(drpc);
>>   		drm_close_driver(i915);
>>   	}
>>   }
>> --
>> 2.25.1
