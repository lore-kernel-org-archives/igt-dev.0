Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7F010FF1A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 10:05:51 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 17 Jun 2022 10:05:32 +0000
Message-ID: <487477ff03da4b24856dc5b5dc9d771c@intel.com>
References: <20220609064330.1460290-1-riana.tauro@intel.com>
 <20220609064330.1460290-2-riana.tauro@intel.com>
In-Reply-To: <20220609064330.1460290-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] tests/i915/pm_rc6_residency:
 Extend rc6-idle test on remaining engines
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
> Sent: Thursday, June 9, 2022 12:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t v2 1/1] tests/i915/pm_rc6_residency: Extend rc6-idl=
e test
> on remaining engines
>=20
> rc6-idle should run on a single instance of every engine
>=20
> v2: add dynamic subtest (Anshuman)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/i915/i915_pm_rc6_residency.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_rc6_residency.c
> b/tests/i915/i915_pm_rc6_residency.c
> index cf9eae90..560b635f 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -292,7 +292,7 @@ static void sighandler(int sig)  {  }
>=20
> -static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
> +static void bg_load(int i915, uint64_t engine_flags, unsigned int
> +flags, unsigned long *ctl)
>  {
>  	const bool has_execlists =3D intel_gen(intel_get_drm_devid(i915)) >=3D =
8;
>  	struct drm_i915_gem_exec_object2 obj =3D { @@ -301,6 +301,7 @@
> static void bg_load(int i915, unsigned int flags, unsigned long *ctl)
>  	struct drm_i915_gem_execbuffer2 execbuf =3D {
>  		.buffers_ptr =3D to_user_pointer(&obj),
>  		.buffer_count =3D 1,
> +		.flags =3D engine_flags,
>  	};
>  	struct sigaction act =3D {
>  		.sa_handler =3D sighandler
> @@ -358,7 +359,7 @@ static void kill_children(int sig)
>  	signal(sig, old);
>  }
>=20
> -static void rc6_idle(int i915)
> +static void rc6_idle(int i915, uint64_t flags)
>  {
>  	const int64_t duration_ns =3D SLEEP_DURATION *
> (int64_t)NSEC_PER_SEC;
>  	const int tolerance =3D 20; /* Some RC6 is better than none! */ @@ -
> 404,7 +405,7 @@ static void rc6_idle(int i915)
>  	for (int p =3D 0; p < ARRAY_SIZE(phases); p++) {
>  		memset(done, 0, 2 * sizeof(*done));
>  		igt_fork(child, 1) /* Setup up a very light load */
> -			bg_load(i915, phases[p].flags, done);
> +			bg_load(i915, flags, phases[p].flags, done);
>=20
>  		rapl_read(&rapl, &sample[0]);
>  		cycles =3D -READ_ONCE(done[1]);
> @@ -534,17 +535,25 @@ static void rc6_fence(int i915)  igt_main  {
>  	int i915 =3D -1;
> +	const intel_ctx_t *ctx;
> +	const struct intel_execution_engine2 *e;
>=20
>  	/* Use drm_open_driver to verify device existence */
>  	igt_fixture {
>  		i915 =3D drm_open_driver(DRIVER_INTEL);
> +		ctx =3D intel_ctx_create_all_physical(i915);
If we are adding this to igt_fixture(), lets remove this call from=20
rc6-fence test , ditto for destroy call.
With that=20
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Regards ,
Anshuman Gupta.
>  	}
>=20
> -	igt_subtest("rc6-idle") {
> +	igt_subtest_with_dynamic("rc6-idle") {
>  		igt_require_gem(i915);
>  		gem_quiescent_gpu(i915);
>=20
> -		rc6_idle(i915);
> +		for_each_ctx_engine(i915, ctx, e) {
> +			if (e->instance =3D=3D 0) {
> +				igt_dynamic_f("%s", e->name)
> +					rc6_idle(i915, e->flags);
> +			}
> +		}
>  	}
>=20
>  	igt_subtest("rc6-fence") {
> @@ -592,7 +601,9 @@ igt_main
>  			close(sysfs);
>  	}
>=20
> -	igt_fixture
> +	igt_fixture {
> +		intel_ctx_destroy(i915, ctx);
>  		close(i915);
> +	}
>=20
>  }
> --
> 2.25.1
