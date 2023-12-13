Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687DE10E004
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 03:03:55 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V7 5/8] tests/kms_vrr: Add new subtest to switch RR
 without modeset
Date: Wed, 13 Dec 2023 03:03:47 +0000
Message-ID: <IA1PR11MB6348B5511C88C09789B7B3A3B28DA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20231211113650.3520399-1-bhanuprakash.modem@intel.com>
 <20231211113650.3520399-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20231211113650.3520399-6-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Monday, December 11, 2023 5:07 PM
> To: igt-dev@lists.freedesktop.org; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Srinivas,
> Vidya <vidya.srinivas@intel.com>
> Subject: [i-g-t V7 5/8] tests/kms_vrr: Add new subtest to switch RR witho=
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
> V2: Squash other required patches
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_vrr.c | 115 +++++++++++++++++++++++++++++++++++++++++++----
> -
>  1 file changed, 104 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 4540d8b4b..6cb5a9b10
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
> @@ -166,6 +178,24 @@ output_mode_with_maxrate(igt_output_t *output,
> unsigned int vrr_max)
>  	return mode;
>  }
>=20
> +static drmModeModeInfo
> +low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min) {
> +	int i;
> +	drmModeConnectorPtr connector =3D output->config.connector;
> +	drmModeModeInfo mode =3D *igt_output_get_mode(output);
> +
> +	for (i =3D 0; i < connector->count_modes; i++)
> +		if (connector->modes[i].hdisplay =3D=3D mode.hdisplay &&
> +		    connector->modes[i].vdisplay =3D=3D mode.vdisplay &&
> +		    connector->modes[i].clock < mode.clock &&
> +		    connector->modes[i].vrefresh < mode.vrefresh &&
> +		    connector->modes[i].vrefresh >=3D vrr_min)
> +			mode =3D connector->modes[i];
> +
> +	return mode;
> +}
> +
>  /* Read min and max vrr range from the connector debugfs. */  static
> range_t  get_vrr_range(data_t *data, igt_output_t *output) @@ -329,7
> +359,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum
> pipe pipe,
>  		 * difference between 144Hz and 143Hz which should give
> this
>  		 * enough accuracy for most use cases.
>  		 */
> -		if ((rate_ns < vtest_ns.min) && (rate_ns >=3D vtest_ns.max))
> +		if ((rate_ns <=3D vtest_ns.min) && (rate_ns >=3D vtest_ns.max))
>  			diff_ns =3D rate_ns;
>  		else
>  			diff_ns =3D vtest_ns.max;
> @@ -379,6 +409,8 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>=20
>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-
> %u) Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), range.min,
> range.max);
> +	igt_info("Override Mode: ");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>=20
>  	set_vrr_on_pipe(data, pipe, true);
>=20
> @@ -454,6 +486,53 @@ test_basic(data_t *data, enum pipe pipe,
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
> +	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
> =3D=3D
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
> +	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
> =3D=3D
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
> +	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
> =3D=3D
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
> IGT_CRTC_VRR_ENABLED, false); @@ -466,9 +545,11 @@ static void
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
> @@ -481,16 +562,22 @@ static bool output_constraint(data_t *data,
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
> +
> +	data->switch_modes[LOW_RR_MODE] =3D
> low_rr_mode_with_same_res(output, data->range.min);
> +	if (data->switch_modes[LOW_RR_MODE].vrefresh =3D=3D data-
> >switch_modes[HIGH_RR_MODE].vrefresh)
> +		return false;
>=20
> -	igt_output_override_mode(output, &mode);
> +	data->range.min =3D data->switch_modes[LOW_RR_MODE].vrefresh;
>=20
>  	return true;
>  }
> @@ -507,7 +594,7 @@ static bool config_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
>  		return false;
>=20
> -	if (!output_constraint(data, output))
> +	if (!output_constraint(data, output, flags))
>  		return false;
>=20
>  	return true;
> @@ -583,6 +670,12 @@ igt_main
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

Change LGTM
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.40.0
