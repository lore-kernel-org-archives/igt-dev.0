Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDA610E1C2
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 13:09:06 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 4 Dec 2023 13:09:02 +0000
Message-ID: <DM6PR11MB4204A188348F6B8BDB58183B8986A@DM6PR11MB4204.namprd11.prod.outlook.com>
References: <20231204074111.3167784-1-bhanuprakash.modem@intel.com>
 <20231204074111.3167784-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20231204074111.3167784-8-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V5 7/9] tests/kms_vrr: Add new subtest to
 switch RR without modeset
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

Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Monday, December 4, 2023 1:11 PM
> To: igt-dev@lists.freedesktop.org; Srinivas, Vidya <vidya.srinivas@intel.=
com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t V5 7/9] tests/kms_vrr: Add new subtest to switch RR witho=
ut
> modeset
>=20
> Add new subtest to switch between low refresh rate to high refresh rate a=
nd
> vice versa seamlessly without modeset.
>=20
> Below are the sequence of operations to perform:
>=20
> 1. Use High RR mode + VRR On  -> Measure vblank timings 2. Switch to Low
> RR mode -> Measure vblank timings 3. Switch back to High RR mode ->
> Measure vblank timings
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 95 +++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 85 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 26f89f7a8..74f1b0d09
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -53,6 +53,10 @@
>   * SUBTEST: flipline
>   * Description: Make sure that flips happen at flipline decision boundar=
y.
>   *
> + * SUBTEST: seamless-rr-switch-vrr
> + * Description: Test to switch RR seamlessly without modeset.
> + * Functionality: adaptive_sync, lrr
> + *
>   * SUBTEST: negative-basic
>   * Description: Make sure that VRR should not be enabled on the Non-VRR
> panel.
>   */
> @@ -70,7 +74,14 @@ enum {
>  	TEST_DPMS =3D 1 << 1,
>  	TEST_SUSPEND =3D 1 << 2,
>  	TEST_FLIPLINE =3D 1 << 3,
> -	TEST_NEGATIVE =3D 1 << 4,
> +	TEST_SEAMLESS_VRR =3D 1 << 4,
> +	TEST_NEGATIVE =3D 1 << 5,
> +};
> +
> +enum {
> +	HIGH_RR_MODE,
> +	LOW_RR_MODE,
> +	RR_MODES_COUNT,
>  };
>=20
>  typedef struct range {
> @@ -85,6 +96,7 @@ typedef struct data {
>  	igt_fb_t fb0;
>  	igt_fb_t fb1;
>  	range_t range;
> +	drmModeModeInfo switch_modes[RR_MODES_COUNT];
>  } data_t;
>=20
>  typedef struct vtest_ns {
> @@ -397,6 +409,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t
> *output, uint32_t flags)
>=20
>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u)
> Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), range.min,
> range.max);
> +	igt_info("Override Mode: ");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>=20
>  	set_vrr_on_pipe(data, pipe, true);
>=20
> @@ -472,6 +486,53 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  		     ((range.max + range.min) / 2), rate, (flags &
> TEST_NEGATIVE)? "on" : "off", result);  }
>=20
> +static void
> +test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t
> +*output, uint32_t flags) {
> +	uint32_t result;
> +	vtest_ns_t vtest_ns;
> +	uint64_t rate;
> +
> +	igt_info("Use HIGH_RR Mode as default: ");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +
> +	prepare_test(data, output, pipe);
> +	vtest_ns =3D get_test_rate_ns(data->range);
> +
> +	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, true);
> +	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) =3D=
=3D
> +0);
> +
> +	rate =3D vtest_ns.max;
> +	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> +		     data->range.max, rate, result);
> +
> +	/* Switch to low rr mode without modeset. */
> +	igt_info("Switch to LOW_RR Mode: ");
> +	kmstest_dump_mode(&data->switch_modes[LOW_RR_MODE]);
> +	igt_output_override_mode(output, &data-
> >switch_modes[LOW_RR_MODE]);
> +	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) =3D=
=3D
> +0);
> +
> +	rate =3D vtest_ns.min;
> +	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> +		     data->range.min, rate, result);
> +
> +	/* Switch back to high rr mode without modeset. */
> +	igt_info("Switch back to HIGH_RR Mode: ");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> +	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) =3D=
=3D
> +0);
> +
> +	rate =3D vtest_ns.mid;
> +	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> +		     ((data->range.max + data->range.min) / 2), rate, result); }
> +
>  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put)
> {
>  	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, false); @@ -484,9 +545,11 @@ static void
> test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>  	igt_remove_fb(data->drm_fd, &data->fb0);  }
>=20
> -static bool output_constraint(data_t *data, igt_output_t *output)
> +static bool output_constraint(data_t *data, igt_output_t *output,
> +uint32_t flags)
>  {
> -	drmModeModeInfo mode;
> +	if ((flags & TEST_SEAMLESS_VRR) &&
> +	    output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +		return false;
>=20
>  	/* Reset output */
>  	igt_display_reset(&data->display);
> @@ -499,16 +562,22 @@ static bool output_constraint(data_t *data,
> igt_output_t *output)
>  	 *   - vrr_min range should be less than the override mode vrefresh.
>  	 *   - Limit the vrr_max range with the override mode vrefresh.
>  	 */
> -	mode =3D output_mode_with_maxrate(output, data->range.max);
> -	if (mode.vrefresh < data->range.min)
> +	data->switch_modes[HIGH_RR_MODE] =3D
> output_mode_with_maxrate(output, data->range.max);
> +	if (data->switch_modes[HIGH_RR_MODE].vrefresh < data-
> >range.min)
>  		return false;
>=20
> -	data->range.max =3D mode.vrefresh;
> +	data->range.max =3D data->switch_modes[HIGH_RR_MODE].vrefresh;
> +	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>=20
> -	igt_info("Override Mode: ");
> -	kmstest_dump_mode(&mode);
> +	/* Search for a low refresh rate mode. */
> +	if (!(flags & TEST_SEAMLESS_VRR))
> +		return true;
>=20
> -	igt_output_override_mode(output, &mode);
> +	data->switch_modes[LOW_RR_MODE] =3D
> low_rr_mode_with_same_res(output, data->range.min);
> +	if (data->switch_modes[LOW_RR_MODE].vrefresh =3D=3D data-
> >switch_modes[HIGH_RR_MODE].vrefresh)
> +		return false;
> +
> +	data->range.min =3D data->switch_modes[LOW_RR_MODE].vrefresh;
>=20
>  	return true;
>  }
> @@ -525,7 +594,7 @@ static bool config_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
>  		return false;
>=20
> -	if (!output_constraint(data, output))
> +	if (!output_constraint(data, output, flags))
>  		return false;
>=20
>  	return true;
> @@ -601,6 +670,12 @@ igt_main
>  	igt_subtest_with_dynamic("negative-basic")
>  		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
>=20
> +	igt_describe("Test to switch RR seamlessly without modeset.");
> +	igt_subtest_with_dynamic("seamless-rr-switch-vrr"){
> +		igt_require_intel(data.drm_fd);
> +		run_vrr_test(&data, test_seamless_rr_basic,
> TEST_SEAMLESS_VRR);
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.40.0
