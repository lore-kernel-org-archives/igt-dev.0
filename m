Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B532810E8E1
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 14:10:01 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 21 Jun 2022 14:10:00 +0000
Message-ID: <dc2613cc47e84863a0b8708b02cedc4d@intel.com>
References: <20220621134526.2040218-1-riana.tauro@intel.com>
 <20220621134526.2040218-2-riana.tauro@intel.com>
In-Reply-To: <20220621134526.2040218-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/i915/pm_rc6_residency:
 Refactoring intel_ctx_t to igt_fixture
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Tuesday, June 21, 2022 7:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Subject: [PATCH i-g-t v2 1/2] tests/i915/pm_rc6_residency: Refactoring
> intel_ctx_t to igt_fixture
>=20
> Refactor code to move intel_ctx_create_all_physical() and
> intel_ctx_destroy() to igt_fixture to be used by rc6_fence and other test=
s.
>=20
> No functional changes
>=20
> v2 : refactor code (Anshuman)
LGTM.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/i915/i915_pm_rc6_residency.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_rc6_residency.c
> b/tests/i915/i915_pm_rc6_residency.c
> index cf9eae90..7c1ff32b 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -449,13 +449,12 @@ static void rc6_idle(int i915)
>  	}
>  }
>=20
> -static void rc6_fence(int i915)
> +static void rc6_fence(int i915, const intel_ctx_t *ctx)
>  {
>  	const int64_t duration_ns =3D SLEEP_DURATION *
> (int64_t)NSEC_PER_SEC;
>  	const int tolerance =3D 20; /* Some RC6 is better than none! */
>  	const unsigned int gen =3D intel_gen(intel_get_drm_devid(i915));
>  	const struct intel_execution_engine2 *e;
> -	const intel_ctx_t *ctx;
>  	struct power_sample sample[2];
>  	unsigned long slept;
>  	uint64_t rc6, ts[2], ahnd;
> @@ -485,7 +484,6 @@ static void rc6_fence(int i915)
>  	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
>=20
>  	/* Submit but delay execution, we should be idle and conserving power
> */
> -	ctx =3D intel_ctx_create_all_physical(i915);
>  	ahnd =3D get_reloc_ahnd(i915, ctx->id);
>  	for_each_ctx_engine(i915, ctx, e) {
>  		igt_spin_t *spin;
> @@ -524,7 +522,6 @@ static void rc6_fence(int i915)
>  		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
>  		gem_quiescent_gpu(i915);
>  	}
> -	intel_ctx_destroy(i915, ctx);
>  	put_ahnd(ahnd);
>=20
>  	rapl_close(&rapl);
> @@ -534,10 +531,12 @@ static void rc6_fence(int i915)  igt_main  {
>  	int i915 =3D -1;
> +	const intel_ctx_t *ctx;
>=20
>  	/* Use drm_open_driver to verify device existence */
>  	igt_fixture {
>  		i915 =3D drm_open_driver(DRIVER_INTEL);
> +		ctx =3D intel_ctx_create_all_physical(i915);
>  	}
>=20
>  	igt_subtest("rc6-idle") {
> @@ -551,7 +550,7 @@ igt_main
>  		igt_require_gem(i915);
>  		gem_quiescent_gpu(i915);
>=20
> -		rc6_fence(i915);
> +		rc6_fence(i915, ctx);
>  	}
>=20
>  	igt_subtest_group {
> @@ -592,7 +591,8 @@ igt_main
>  			close(sysfs);
>  	}
>=20
> -	igt_fixture
> +	igt_fixture {
> +		intel_ctx_destroy(i915, ctx);
>  		close(i915);
> -
> +	}
>  }
> --
> 2.25.1
