Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E126B10E2D2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 05:44:10 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 05:44:05 +0000
Message-ID: <IA1PR11MB634813677A086346E4AADEADB203A@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20230615225809.21751-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230615225809.21751-1-nidhi1.gupta@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_vrr: New subtest for
 toggle VRR during fastsets
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

Hi Nidhi,

> -----Original Message-----
> From: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Sent: 16 June 2023 04:28
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Subject: [PATCH i-g-t v3] tests/kms_vrr: New subtest for toggle VRR durin=
g
> fastsets
>=20
> Allow VRR to be toggled during fastsets, without the need of full modeset=
.

Can you please add more details on this subtest in commit message ?

Is there any way around we can extend the current subtests itself instead o=
f adding a new subtest ?

Regards,
Mitul
>=20
> v2: move igt_require from fixture
>     (Kamil)
> v3: Apply modeset initially in basic-fastset subtest
>     and skip it after VRR toggeling
>     (Mitul)
>     fixed nitpicks (Kamil)
>=20
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_vrr.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index d2d79c4e..7b3fef9a
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -45,7 +45,8 @@ enum {
>  	TEST_DPMS =3D 1 << 1,
>  	TEST_SUSPEND =3D 1 << 2,
>  	TEST_FLIPLINE =3D 1 << 3,
> -	TEST_NEGATIVE =3D 1 << 4,
> +	TEST_FASTSET =3D 1 << 4,
> +	TEST_NEGATIVE =3D 1 << 5,
>  };
>=20
>  typedef struct range {
> @@ -193,11 +194,14 @@ static bool vrr_capable(igt_output_t *output)  }
>=20
>  /* Toggles variable refresh rate on the pipe. */ -static void
> set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
> +static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
> +			    bool need_modeset, bool enabled)
>  {
>  	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED,
>  				enabled);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (need_modeset)
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>=20
>  /* Prepare the display for testing on the given pipe. */ @@ -370,7 +374,=
7
> @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_=
t
> flags)
>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-
> %u) Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), range.min,
> range.max);
>=20
> -	set_vrr_on_pipe(data, pipe, true);
> +	set_vrr_on_pipe(data, pipe, (flags & ~TEST_FASTSET), true);
>=20
>  	/*
>  	 * Do a short run with VRR, but don't check the result.
> @@ -436,7 +440,7 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  	 * modeset. And the expected behavior is the same as disabling VRR
> on
>  	 * a VRR capable panel.
>  	 */
> -	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
> +	set_vrr_on_pipe(data, pipe, (flags & ~TEST_FASTSET), (flags &
> +TEST_NEGATIVE) ? true : false);
>  	rate =3D vtest_ns.mid;
>  	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
>  	igt_assert_f(result < 10,
> @@ -526,6 +530,12 @@ igt_main
>  	igt_subtest_with_dynamic("negative-basic")
>  		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
>=20
> +	igt_describe("Tests that VRR basic without modeset");
> +	igt_subtest_with_dynamic("flip-basic-fastset") {
> +		igt_require_intel(data.drm_fd);
> +		run_vrr_test(&data, test_basic, TEST_FASTSET);
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  	}
> --
> 2.39.0
