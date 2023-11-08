Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C56F10E011
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 08:52:37 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 08:52:30 +0000
Message-ID: <CY5PR11MB6211153CC19083B6766EC2E395A8A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231108064312.312681-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231108064312.312681-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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



> -----Original Message-----
> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Sent: Wednesday, November 8, 2023 12:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: [PATCH] tests/intel: Add multi gt support for rc6_residency test
>=20
> Adding multi-gt support for rc6_idle, rc6_fence and rc6_accuracy tests.
Please break this patch like below.
1) If any common  refactoring required, not applicable if no such refactori=
ng.
2) Add multi gt support for rc6_idle.
3) Add multi gt support for rc6_fence.
4) Add multi gt support for rc6_accuracy test.
5) Add drpc debug support.
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  tests/intel/i915_pm_rc6_residency.c | 134 ++++++++++++++++++----------
>  1 file changed, 85 insertions(+), 49 deletions(-)
>=20
> diff --git a/tests/intel/i915_pm_rc6_residency.c
> b/tests/intel/i915_pm_rc6_residency.c
> index b266680ac..f865fbe94 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -36,6 +36,7 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +#include "igt_debugfs.h"
>  #include "igt_perf.h"
>  #include "igt_power.h"
>  #include "igt_sysfs.h"
> @@ -82,23 +83,19 @@ static unsigned long get_rc6_enabled_mask(void)
>  	return enabled;
>  }
>=20
> -static bool has_rc6_residency(const char *name)
> +static bool has_rc6_residency(int dirfd, enum i915_attr_id id)
>  {
>  	unsigned long residency;
> -	char path[128];
>=20
> -	sprintf(path, "power/%s_residency_ms", name);
> -	return igt_sysfs_scanf(sysfs, path, "%lu", &residency) =3D=3D 1;
> +	return igt_sysfs_rps_scanf(dirfd, id, "%lu", &residency) =3D=3D 1;
>  }
>=20
> -static unsigned long read_rc6_residency(const char *name)
> +static unsigned long read_rc6_residency(int dirfd, enum i915_attr_id
> +id)
>  {
>  	unsigned long residency;
> -	char path[128];
>=20
>  	residency =3D 0;
> -	sprintf(path, "power/%s_residency_ms", name);
> -	igt_assert(igt_sysfs_scanf(sysfs, path, "%lu", &residency) =3D=3D 1);
> +	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%lu", &residency) =3D=3D 1);
>  	return residency;
>  }
>=20
> @@ -107,11 +104,14 @@ static void residency_accuracy(unsigned int diff,
>  			       const char *name_of_rc6_residency)  {
>  	double ratio;
> +	int gt =3D 0, gt_current;
>=20
>  	ratio =3D (double)diff / duration;
>=20
> -	igt_info("Residency in %s or deeper state: %u ms (sleep duration %u
> ms) (%.1f%% of expected duration)\n",
> -		 name_of_rc6_residency, diff, duration, 100*ratio);
> +	gt_current =3D igt_sysfs_get_u32(gt, "id");
> +
> +	igt_info("GT[%d]: Residency in %s or deeper state: %u ms (sleep
> duration %u ms) (%.1f%% of expected duration)\n",
> +		 gt_current, name_of_rc6_residency, diff, duration,
> 100*ratio);
>  	igt_assert_f(ratio > 0.9 && ratio < 1.05,
>  		     "Sysfs RC6 residency counter is inaccurate.\n");  } @@ -
Print gt id in igt_assert_f failed message .
Thanks,
Anshuman Gupta.
> 125,28 +125,28 @@ static unsigned long gettime_ms(void)
>  	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;  }
>=20
> -static void read_residencies(int devid, unsigned int mask,
> +static void read_residencies(int devid, int dirfd, unsigned int mask,
>  			     struct residencies *res)
>  {
>  	res->duration =3D gettime_ms();
>=20
>  	if (mask & RC6_ENABLED)
> -		res->rc6 =3D read_rc6_residency("rc6");
> +		res->rc6 =3D read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
>=20
>  	if ((mask & RC6_ENABLED) &&
>  	    (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)))
> -		res->media_rc6 =3D read_rc6_residency("media_rc6");
> +		res->media_rc6 =3D read_rc6_residency(dirfd,
> MEDIA_RC6_RESIDENCY_MS);
>=20
>  	if (mask & RC6P_ENABLED)
> -		res->rc6p =3D read_rc6_residency("rc6p");
> +		res->rc6p =3D read_rc6_residency(dirfd, RC6P_RESIDENCY_MS);
>=20
>  	if (mask & RC6PP_ENABLED)
> -		res->rc6pp =3D read_rc6_residency("rc6pp");
> +		res->rc6pp =3D read_rc6_residency(dirfd,
> RC6PP_RESIDENCY_MS);
>=20
>  	res->duration +=3D (gettime_ms() - res->duration) / 2;  }
>=20
> -static void measure_residencies(int devid, unsigned int mask,
> +static void measure_residencies(int devid, int dirfd, unsigned int
> +mask,
>  				struct residencies *res)
>  {
>  	struct residencies start =3D { };
> @@ -158,13 +158,13 @@ static void measure_residencies(int devid,
> unsigned int mask,
>  	 * measurement, since the valid counter range is different on
>  	 * different platforms and so fixing it up would be non-trivial.
>  	 */
> -	read_residencies(devid, mask, &end);
> +	read_residencies(devid, dirfd, mask, &end);
>  	igt_debug("time=3D%d: rc6=3D(%d, %d), rc6p=3D%d, rc6pp=3D%d\n",
>  		  end.duration, end.rc6, end.media_rc6, end.rc6p, end.rc6pp);
>  	for (retry =3D 0; retry < 2; retry++) {
>  		start =3D end;
>  		sleep(SLEEP_DURATION);
> -		read_residencies(devid, mask, &end);
> +		read_residencies(devid, dirfd, mask, &end);
>=20
>  		igt_debug("time=3D%d: rc6=3D(%d, %d), rc6p=3D%d, rc6pp=3D%d\n",
>  			  end.duration,
> @@ -196,7 +196,7 @@ static void measure_residencies(int devid, unsigned
> int mask,
>  	res->rc6 +=3D res->rc6p;
>  }
>=20
> -static bool wait_for_rc6(void)
> +static bool wait_for_rc6(int dirfd)
>  {
>  	struct timespec tv =3D {};
>  	unsigned long start, now;
> @@ -205,11 +205,11 @@ static bool wait_for_rc6(void)
>  	usleep(160 * 1000);
>=20
>  	/* Then poll for RC6 to start ticking */
> -	now =3D read_rc6_residency("rc6");
> +	now =3D read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
>  	do {
>  		start =3D now;
>  		usleep(5000);
> -		now =3D read_rc6_residency("rc6");
> +		now =3D read_rc6_residency(dirfd, RC6_RESIDENCY_MS);
>  		if (now - start > 1)
>  			return true;
>  	} while (!igt_seconds_elapsed(&tv));
> @@ -234,14 +234,27 @@ static uint64_t pmu_read_single(int fd)
>  	return __pmu_read_single(fd, NULL);
>  }
>=20
> -#define __assert_within_epsilon(x, ref, tol_up, tol_down) \
> -	igt_assert_f((x) <=3D (ref) * (1.0 + (tol_up)/100.) && \
> -		     (x) >=3D (ref) * (1.0 - (tol_down)/100.), \
> -		     "'%s' !=3D '%s' (%.3g not within +%d%%/-%d%% tolerance of
> %.3g)\n",\
> -		     #x, #ref, (double)(x), (tol_up), (tol_down), (double)(ref))
> +#define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
> +	igt_assert_f((double)(x) <=3D (1.0 + (tol_up)) * (double)(ref) && \
> +		     (double)(x) >=3D (1.0 - (tol_down)) * (double)(ref), \
> +		     "'%s' !=3D '%s' (%f not within +%.1f%%/-%.1f%% tolerance of
> %f)\n %s\n",\
> +		     #x, #ref, (double)(x), \
> +		     (tol_up) * 100.0, (tol_down) * 100.0, \
> +		     (double)(ref), debug_data)
> +
> +#define assert_within_epsilon(x, ref, tolerance, debug_data) \
> +	__assert_within_epsilon(x, ref, tolerance, tolerance, debug_data)
>=20
> -#define assert_within_epsilon(x, ref, tolerance) \
> -	__assert_within_epsilon(x, ref, tolerance, tolerance)
> +char *drpc;
> +
> +static char *get_drpc(int i915, int gt_id) {
> +	int gt_dir;
> +
> +	gt_dir =3D igt_debugfs_gt_dir(i915, gt_id);
> +	igt_assert(gt_dir !=3D -1);
> +	return igt_sysfs_get(gt_dir, "drpc");
> +}
>=20
>  static bool __pmu_wait_for_rc6(int fd)
>  {
> @@ -376,7 +389,7 @@ static void kill_children(int sig)
>  	signal(sig, old);
>  }
>=20
> -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
> +static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags,
> +unsigned int gt)
>  {
>  	const int64_t duration_ns =3D SLEEP_DURATION *
> (int64_t)NSEC_PER_SEC;
>  	const int tolerance =3D 20; /* Some RC6 is better than none! */ @@ -
> 397,7 +410,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t =
flags)
>  	struct igt_power gpu;
>  	int fd;
>=20
> -	fd =3D open_pmu(i915, I915_PMU_RC6_RESIDENCY);
> +	fd =3D open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
>  	igt_drop_caches_set(i915, DROP_IDLE);
>  	igt_require(__pmu_wait_for_rc6(fd));
>  	igt_power_open(i915, &gpu, "gpu");
> @@ -418,7 +431,10 @@ static void rc6_idle(int i915, uint32_t ctx_id,
> uint64_t flags)
>  			"Total energy used while idle: %.1fmJ (%.1fmW)\n",
>  			idle, (idle * 1e9) / slept);
>  	}
> -	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
> +
> +	drpc =3D get_drpc(i915, igt_sysfs_get_u32(gt, "id"));
> +
> +	assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
>=20
>  	done =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -
> 1, 0);
>=20
> @@ -454,7 +470,10 @@ static void rc6_idle(int i915, uint32_t ctx_id,
> uint64_t flags)
>  		igt_assert(cycles >=3D SLEEP_DURATION);
>=20
>  		/* While very nearly idle, expect full RC6 */
> -		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
> +		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
> +
> +		free(drpc);
> +		drpc =3D NULL;
>  	}
>=20
>  	munmap(done, 4096);
> @@ -471,12 +490,13 @@ static void rc6_idle(int i915, uint32_t ctx_id,
> uint64_t flags)
>  	}
>  }
>=20
> -static void rc6_fence(int i915, const intel_ctx_t *ctx)
> +static void rc6_fence(int i915, unsigned int gt)
>  {
>  	const int64_t duration_ns =3D SLEEP_DURATION *
> (int64_t)NSEC_PER_SEC;
>  	const int tolerance =3D 20; /* Some RC6 is better than none! */
>  	const unsigned int gen =3D intel_gen(intel_get_drm_devid(i915));
>  	const struct intel_execution_engine2 *e;
> +	const intel_ctx_t *ctx;
>  	struct power_sample sample[2];
>  	unsigned long slept;
>  	uint64_t rc6, ts[2], ahnd;
> @@ -485,7 +505,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ct=
x)
>=20
>  	igt_require_sw_sync();
>=20
> -	fd =3D open_pmu(i915, I915_PMU_RC6_RESIDENCY);
> +	fd =3D open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
>  	igt_drop_caches_set(i915, DROP_IDLE);
>  	igt_require(__pmu_wait_for_rc6(fd));
>  	igt_power_open(i915, &gpu, "gpu");
> @@ -506,9 +526,12 @@ static void rc6_fence(int i915, const intel_ctx_t *c=
tx)
>  			"Total energy used while idle: %.1fmJ (%.1fmW)\n",
>  			idle, (idle * 1e9) / slept);
>  	}
> -	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
> +	drpc =3D get_drpc(i915, igt_sysfs_get_u32(gt, "id"));
> +
> +	assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
>=20
>  	/* Submit but delay execution, we should be idle and conserving
> power */
> +	ctx =3D intel_ctx_create_for_gt(i915, gt);
>  	ahnd =3D get_reloc_ahnd(i915, ctx->id);
>  	for_each_ctx_engine(i915, ctx, e) {
>  		igt_spin_t *spin;
> @@ -546,10 +569,14 @@ static void rc6_fence(int i915, const intel_ctx_t
> *ctx)
>=20
>  		close(timeline);
>=20
> -		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
> +		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
>  		gem_quiescent_gpu(i915);
> +
> +		free(drpc);
> +		drpc =3D NULL;
>  	}
>  	put_ahnd(ahnd);
> +	intel_ctx_destroy(i915,ctx);
>=20
>  	igt_power_close(&gpu);
>  	close(fd);
> @@ -558,6 +585,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ct=
x)
> igt_main  {
>  	int i915 =3D -1;
> +	unsigned int dirfd, gt;
>  	const intel_ctx_t *ctx;
>=20
>  	/* Use drm_open_driver to verify device existence */ @@ -572,19
> +600,25 @@ igt_main
>  		igt_require_gem(i915);
>  		gem_quiescent_gpu(i915);
>=20
> -		for_each_ctx_engine(i915, ctx, e) {
> -			if (e->instance =3D=3D 0) {
> -				igt_dynamic_f("%s", e->name)
> -					rc6_idle(i915, ctx->id, e->flags);
> +		i915_for_each_gt(i915, dirfd, gt) {
> +			ctx =3D intel_ctx_create_for_gt(i915, gt);
> +			for_each_ctx_engine(i915, ctx, e) {
> +				if (e->instance =3D=3D 0) {
> +					igt_dynamic_f("gt%u-%s", gt, e-
> >name)
> +						rc6_idle(i915, ctx->id, e-
> >flags, gt);
> +				}
>  			}
> +			intel_ctx_destroy(i915, ctx);
>  		}
>  	}
>=20
> -	igt_subtest("rc6-fence") {
> +	igt_subtest_with_dynamic("rc6-fence") {
>  		igt_require_gem(i915);
>  		gem_quiescent_gpu(i915);
>=20
> -		rc6_fence(i915, ctx);
> +		i915_for_each_gt(i915, dirfd, gt)
> +			igt_dynamic_f("gt%u", gt)
> +				rc6_fence(i915, gt);
>  	}
>=20
>  	igt_subtest_group {
> @@ -595,21 +629,23 @@ igt_main
>  			devid =3D intel_get_drm_devid(i915);
>  			sysfs =3D igt_sysfs_open(i915);
>=20
> -			igt_require(has_rc6_residency("rc6"));
> +			igt_require(has_rc6_residency(dirfd,
> RC6_RESIDENCY_MS));
>=20
>  			/* Make sure rc6 counters are running */
>  			igt_drop_caches_set(i915, DROP_IDLE);
> -			igt_require(wait_for_rc6());
> +			igt_require(wait_for_rc6(dirfd));
>=20
>  			rc6_enabled =3D get_rc6_enabled_mask();
>  			igt_require(rc6_enabled & RC6_ENABLED);
>  		}
>=20
>  		igt_subtest("rc6-accuracy") {
> -			struct residencies res;
> +			for_each_sysfs_gt_dirfd(i915, dirfd, gt) {
> +				struct residencies res;
>=20
> -			measure_residencies(devid, rc6_enabled, &res);
> -			residency_accuracy(res.rc6, res.duration, "rc6");
> +				measure_residencies(devid, dirfd,
> rc6_enabled, &res);
> +				residency_accuracy(res.rc6, res.duration,
> "rc6");
> +			}
>  		}
>=20
>  		igt_subtest("media-rc6-accuracy") {
> @@ -617,7 +653,7 @@ igt_main
>=20
>  			igt_require(IS_VALLEYVIEW(devid) ||
> IS_CHERRYVIEW(devid));
>=20
> -			measure_residencies(devid, rc6_enabled, &res);
> +			measure_residencies(devid, sysfs, rc6_enabled, &res);
>  			residency_accuracy(res.media_rc6, res.duration,
> "media_rc6");
>  		}
>=20
> @@ -626,7 +662,7 @@ igt_main
>  	}
>=20
>  	igt_fixture {
> -		intel_ctx_destroy(i915, ctx);
> +		free(drpc);
>  		drm_close_driver(i915);
>  	}
>  }
> --
> 2.25.1
