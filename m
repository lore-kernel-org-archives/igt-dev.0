Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049CE10E838
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 10:19:20 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 21 Jun 2022 10:19:19 +0000
Message-ID: <83728cd3731e4b9e89cbec7dc87f3e64@intel.com>
References: <20220621100606.2037879-1-riana.tauro@intel.com>
 <20220621100606.2037879-3-riana.tauro@intel.com>
In-Reply-To: <20220621100606.2037879-3-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/pm_rc6_residency: Modify
 rc6_fence to use intel_ctx_t from igt_fixture
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
> Sent: Tuesday, June 21, 2022 3:36 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/i915/pm_rc6_residency: Modify rc6_fence =
to
> use intel_ctx_t from igt_fixture
>=20
> Modify rc6_fence test to use intel_ctx_t from igt_fixture
Commit message can be more descriptive , this should be non-functional patc=
h.
We are not doing any functional change to patch.
Also this should be the first patch of the series,
which create and destroy the context in igt_fixture and rc6_fences will use=
 the same ctx,
Followed by second patch.
Regards,
Anshuman Gupta.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/i915/i915_pm_rc6_residency.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_rc6_residency.c
> b/tests/i915/i915_pm_rc6_residency.c
> index 560b635f..043370cc 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -450,13 +450,12 @@ static void rc6_idle(int i915, uint64_t flags)
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
> @@ -486,7 +485,6 @@ static void rc6_fence(int i915)
>  	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
>=20
>  	/* Submit but delay execution, we should be idle and conserving power
> */
> -	ctx =3D intel_ctx_create_all_physical(i915);
>  	ahnd =3D get_reloc_ahnd(i915, ctx->id);
>  	for_each_ctx_engine(i915, ctx, e) {
>  		igt_spin_t *spin;
> @@ -525,7 +523,6 @@ static void rc6_fence(int i915)
>  		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
>  		gem_quiescent_gpu(i915);
>  	}
> -	intel_ctx_destroy(i915, ctx);
>  	put_ahnd(ahnd);
>=20
>  	rapl_close(&rapl);
> @@ -560,7 +557,7 @@ igt_main
>  		igt_require_gem(i915);
>  		gem_quiescent_gpu(i915);
>=20
> -		rc6_fence(i915);
> +		rc6_fence(i915, ctx);
>  	}
>=20
>  	igt_subtest_group {
> --
> 2.25.1
