Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4334010E176
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 02:35:26 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 4 Dec 2023 02:35:19 +0000
Message-ID: <DM6PR11MB4204E0149D62AFFC3E1DB3368986A@DM6PR11MB4204.namprd11.prod.outlook.com>
References: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
 <20231201141703.3013801-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20231201141703.3013801-7-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 6/7] tests/kms_vrr: Add new subtest to
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Friday, December 1, 2023 7:47 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t V4 6/7] tests/kms_vrr: Add new subtest to switc=
h RR
> without modeset
>=20
> Add new subtest to switch between low refresh rate to high refresh rate a=
nd
> vice versa seamlessly without modeset.
>=20
> Below are the sequence of operations to perform:
>=20
> 1. Use High RR mode + VRR On (if panel supports) -> Measure vblank timing=
s
> 2. Switch to Low RR mode -> Measure vblank timings 3. Switch back to High
> RR mode -> Measure vblank timings
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 135 ++++++++++++++++++++++++++++++++++++++++++++---
> -
>  1 file changed, 124 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 422d89073..8b89d1a87
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -53,6 +53,10 @@
>   * SUBTEST: flipline
>   * Description: Make sure that flips happen at flipline decision boundar=
y.
>   *
> + * SUBTEST: seamless-rr-switch
> + * Description: Test to switch RR seamlessly without modeset.
> + * Functionality: adaptive_sync, drrs, lrr
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
> +	TEST_SEAMLESS_RR =3D 1 << 4,
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
> +		/* TODO: Improve checks for downclock */
> +		if (connector->modes[i].hdisplay =3D=3D mode.hdisplay &&
> +		    connector->modes[i].vdisplay =3D=3D mode.vdisplay &&
> +		    connector->modes[i].vrefresh < mode.vrefresh &&
> +		    connector->modes[i].vrefresh >=3D vrr_min)
> +			mode =3D connector->modes[i];
> +
> +	return mode;
> +}
> +
>  /* Read min and max vrr range from the connector debugfs. */  static ran=
ge_t
> get_vrr_range(data_t *data, igt_output_t *output) @@ -380,6 +410,9 @@
> test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t f=
lags)
>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u)
> Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), range.min,
> range.max);
>=20
> +	igt_info("Override Mode: ");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +
>  	set_vrr_on_pipe(data, pipe, true);
>=20
>  	/*
> @@ -456,7 +489,9 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t
> *output, uint32_t flags)
>=20
>  static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put)
> {
> -	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, false);
> +	if (vrr_capable(output))
> +		igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED,
> +false);
> +
>  	igt_plane_set_fb(data->primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_output_override_mode(output, NULL); @@ -466,9 +501,71 @@
> static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *outp=
ut)
>  	igt_remove_fb(data->drm_fd, &data->fb0);  }
>=20
> -static bool output_constraint(data_t *data, igt_output_t *output)
> +static void
> +test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t
> +*output, uint32_t flags)
>  {
> -	drmModeModeInfo mode;
> +	uint32_t result;
> +	vtest_ns_t vtest_ns;
> +	uint64_t rate;
> +	bool vrr =3D vrr_capable(output);
> +
> +	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" :
> "OFF");
> +	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +
> +	prepare_test(data, output, pipe);
> +	vtest_ns =3D get_test_rate_ns(data->range);
> +
> +	if (vrr) {
> +		igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, true);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, 0,
> NULL) =3D=3D 0);
> +	}
> +
> +	rate =3D vtest_ns.max;
> +	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold not reached, result was %u%%\n",
> +		     data->range.max, rate, vrr ? "on" : "off", result);
> +
> +	/* Switch to low rr mode without modeset. */
> +	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
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
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold not reached, result was %u%%\n",
> +		     data->range.min, rate, vrr ? "on" : "off", result);
> +
> +	/* Switch back to high rr mode without modeset. */
> +	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" :
> "OFF");
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
> +	igt_assert_f(vrr ? (result > 75) : (result < 10),
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold %s, result was %u%%\n",
> +		     ((data->range.max + data->range.min) / 2), rate,
> +		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result); }
> +
> +static bool output_constraint(data_t *data, igt_output_t *output,
> +uint32_t flags) {
> +	if ((flags & TEST_SEAMLESS_RR) &&
> +	    output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
> +		return false;
> +
> +	/*
> +	 * FIXME: Read the DRRS capability, currently assuming:
> +	 * - Panel should contain 2 modes only
> +	 * - Both modes should have the same resolution but different RR
> +	 */
> +	if ((flags & TEST_SEAMLESS_RR) &&
> +	    !vrr_capable(output) && output->config.connector->count_modes
> !=3D 2)
> +		return false;
>=20
>  	/* Reset output */
>  	igt_display_reset(&data->display);
> @@ -481,16 +578,22 @@ static bool output_constraint(data_t *data,
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
> +	if (!(flags & TEST_SEAMLESS_RR))
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
> @@ -500,6 +603,9 @@ static bool config_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	if (!has_vrr(output))
>  		return false;
>=20
> +	if (flags & TEST_SEAMLESS_RR)
> +		goto out;
> +
>  	/* For Negative tests, panel should be non-vrr. */
>  	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
>  		return false;
> @@ -507,7 +613,8 @@ static bool config_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
>  		return false;
>=20
> -	if (!output_constraint(data, output))
> +out:
> +	if (!output_constraint(data, output, flags))
>  		return false;
>=20
>  	return true;
> @@ -583,6 +690,12 @@ igt_main
>  	igt_subtest_with_dynamic("negative-basic")
>  		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
>=20
> +	igt_describe("Test to switch RR seamlessly without modeset.");
> +	igt_subtest_with_dynamic("seamless-rr-switch") {
> +		igt_require_intel(data.drm_fd);
> +		run_vrr_test(&data, test_seamless_rr_basic,
> TEST_SEAMLESS_RR);
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.40.0
