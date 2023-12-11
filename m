Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F271E10E086
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 08:36:04 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: RE: [i-g-t V6 08/10] tests/kms_vrr: Add new subtest for DRRS without
 modeset
Date: Mon, 11 Dec 2023 08:35:55 +0000
Message-ID: <IA1PR11MB6348CB15ED8AAF9D250CD559B28FA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20231207064900.3328723-1-bhanuprakash.modem@intel.com>
 <20231207064900.3328723-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20231207064900.3328723-9-bhanuprakash.modem@intel.com>
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
> Sent: Thursday, December 7, 2023 12:19 PM
> To: igt-dev@lists.freedesktop.org; ville.syrjala@linux.intel.com; Golani,
> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Srinivas,
> Vidya <vidya.srinivas@intel.com>
> Subject: [i-g-t V6 08/10] tests/kms_vrr: Add new subtest for DRRS without
> modeset
>=20
> This test is same as 'kms_vrr@seamless-rr-switch-vrr' but performs on DRR=
S
> panel without enabling the VRR.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_vrr.c | 69 +++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 20 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 6cb5a9b10..de2ee13c7
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -31,6 +31,7 @@
>   */
>=20
>  #include "igt.h"
> +#include "i915/intel_drrs.h"
>  #include "sw_sync.h"
>  #include <fcntl.h>
>  #include <signal.h>
> @@ -57,6 +58,10 @@
>   * Description: Test to switch RR seamlessly without modeset.
>   * Functionality: adaptive_sync, lrr
>   *
> + * SUBTEST: seamless-rr-switch-drrs
> + * Description: Test to switch RR seamlessly without modeset.
> + * Functionality: adaptive_sync, drrs
> + *
>   * SUBTEST: negative-basic
>   * Description: Make sure that VRR should not be enabled on the Non-VRR
> panel.
>   */
> @@ -75,7 +80,8 @@ enum {
>  	TEST_SUSPEND =3D 1 << 2,
>  	TEST_FLIPLINE =3D 1 << 3,
>  	TEST_SEAMLESS_VRR =3D 1 << 4,
> -	TEST_NEGATIVE =3D 1 << 5,
> +	TEST_SEAMLESS_DRRS =3D 1 << 5,
> +	TEST_NEGATIVE =3D 1 << 6,
>  };
>=20
>  enum {
> @@ -492,24 +498,27 @@ test_seamless_rr_basic(data_t *data, enum pipe
> pipe, igt_output_t *output, uint3
>  	uint32_t result;
>  	vtest_ns_t vtest_ns;
>  	uint64_t rate;
> +	bool vrr =3D !!(flags & TEST_SEAMLESS_VRR);
>=20
> -	igt_info("Use HIGH_RR Mode as default: ");
> +	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" :
> +"OFF");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>=20
>  	prepare_test(data, output, pipe);
>  	vtest_ns =3D get_test_rate_ns(data->range);
>=20
> -	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, true);
> -	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
> =3D=3D 0);
> +	if (vrr) {
> +		igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, true);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, 0,
> NULL) =3D=3D 0);
> +	}
>=20
>  	rate =3D vtest_ns.max;
>  	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
>  	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> -		     data->range.max, rate, result);
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold not reached, result was %u%%\n",
> +		     data->range.max, rate, vrr ? "on" : "off", result);
>=20
>  	/* Switch to low rr mode without modeset. */
> -	igt_info("Switch to LOW_RR Mode: ");
> +	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
>  	kmstest_dump_mode(&data->switch_modes[LOW_RR_MODE]);
>  	igt_output_override_mode(output, &data-
> >switch_modes[LOW_RR_MODE]);
>  	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
> =3D=3D 0); @@ -517,25 +526,28 @@ test_seamless_rr_basic(data_t *data, enu=
m
> pipe pipe, igt_output_t *output, uint3
>  	rate =3D vtest_ns.min;
>  	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
>  	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> -		     data->range.min, rate, result);
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold not reached, result was %u%%\n",
> +		     data->range.min, rate, vrr ? "on" : "off", result);
>=20
>  	/* Switch back to high rr mode without modeset. */
> -	igt_info("Switch back to HIGH_RR Mode: ");
> +	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" :
> +"OFF");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>  	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL)
> =3D=3D 0);
>=20
>  	rate =3D vtest_ns.mid;
>  	result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> -		     ((data->range.max + data->range.min) / 2), rate, result);
> +	igt_assert_f(vrr ? (result > 75) : (result < 10),
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold %s, result was %u%%\n",
> +		     ((data->range.max + data->range.min) / 2), rate,
> +		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
>  }
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
>  	igt_output_override_mode(output, NULL); @@ -547,10 +559,16 @@
> static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *outp=
ut)
>=20
>  static bool output_constraint(data_t *data, igt_output_t *output, uint32=
_t
> flags)  {
> -	if ((flags & TEST_SEAMLESS_VRR) &&
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
>  	    output->config.connector->connector_type !=3D
> DRM_MODE_CONNECTOR_eDP)
>  		return false;
>=20
> +	if ((flags & TEST_SEAMLESS_DRRS) &&
> +	    !intel_output_has_drrs(data->drm_fd, output)) {
> +		igt_info("Selected panel won't support DRRS.\n");
> +		return false;
> +	}
> +
>  	/* Reset output */
>  	igt_display_reset(&data->display);
>=20
> @@ -570,7 +588,7 @@ static bool output_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
>=20
>  	/* Search for a low refresh rate mode. */
> -	if (!(flags & TEST_SEAMLESS_VRR))
> +	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
>  		return true;
>=20
>  	data->switch_modes[LOW_RR_MODE] =3D
> low_rr_mode_with_same_res(output, data->range.min); @@ -587,6 +605,9
> @@ static bool config_constraint(data_t *data, igt_output_t *output,
> uint32_t flags
>  	if (!has_vrr(output))
>  		return false;
>=20
> +	if (flags & TEST_SEAMLESS_DRRS)
> +		goto out;
> +
>  	/* For Negative tests, panel should be non-vrr. */
>  	if ((flags & TEST_NEGATIVE) && vrr_capable(output))
>  		return false;
> @@ -594,6 +615,7 @@ static bool config_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
>  		return false;
>=20
> +out:
>  	if (!output_constraint(data, output, flags))
>  		return false;
>=20
> @@ -670,10 +692,17 @@ igt_main
>  	igt_subtest_with_dynamic("negative-basic")
>  		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
>=20
> -	igt_describe("Test to switch RR seamlessly without modeset.");
> -	igt_subtest_with_dynamic("seamless-rr-switch-vrr"){
> -		igt_require_intel(data.drm_fd);
> -		run_vrr_test(&data, test_seamless_rr_basic,
> TEST_SEAMLESS_VRR);
> +	igt_subtest_group {
> +		igt_fixture
> +			igt_require_intel(data.drm_fd);
> +
> +		igt_describe("Test to switch RR seamlessly without
> modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-vrr")
> +			run_vrr_test(&data, test_seamless_rr_basic,
> TEST_SEAMLESS_VRR);
> +
> +		igt_describe("Test to switch RR seamlessly without
> modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-drrs")
> +			run_vrr_test(&data, test_seamless_rr_basic,
> TEST_SEAMLESS_DRRS);
>  	}
>=20
>  	igt_fixture {
> --
> 2.40.0

Approach assumed for this approach is considerable but suggested to validat=
e the same manually  by checking kernel logs if these changes trigger full =
modest or not. As possible skip can happen with CI. Also assuming this patc=
h will be squashed with last 2 patches from this series.

Regards,
Mitul
