Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D4710E241
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 03:16:48 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V7 4/8] tests/kms_vrr: Fix pipe/output combo validity
 constraint
Date: Wed, 13 Dec 2023 03:16:44 +0000
Message-ID: <IA1PR11MB63480AC13F228046F5A75306B28DA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20231211113650.3520399-1-bhanuprakash.modem@intel.com>
 <20231211113650.3520399-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20231211113650.3520399-5-bhanuprakash.modem@intel.com>
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
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t V7 4/8] tests/kms_vrr: Fix pipe/output combo validity
> constraint
>=20
> Before starting the subtest, we are checking the selected pipe/output com=
bo
> validity with default mode, but inside the subtest we are using the mode =
with
> highest resolution.
>=20
> Few panels exposes 4K as a default mode even though it supports 8K, in th=
is
> scenario test may misbehave.
>=20
> So, check the pipe/output combo validity with the mode that we are actual=
ly
> going to use in the subtest.
>=20
> V2: Reword the commit message
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 62 +++++++++++++++++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 23 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index df241aa6c..4540d8b4b
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -163,9 +163,6 @@ output_mode_with_maxrate(igt_output_t *output,
> unsigned int vrr_max)
>  		    connector->modes[i].vrefresh <=3D vrr_max)
>  			mode =3D connector->modes[i];
>=20
> -	igt_info("Override Mode: ");
> -	kmstest_dump_mode(&mode);
> -
>  	return mode;
>  }
>=20
> @@ -233,21 +230,7 @@ static void prepare_test(data_t *data, igt_output_t
> *output, enum pipe pipe)
>  	drmModeModeInfo mode;
>  	cairo_t *cr;
>=20
> -	/* Reset output */
> -	igt_display_reset(&data->display);
> -	igt_output_set_pipe(output, pipe);
> -
> -	/* Capture VRR range */
> -	data->range =3D get_vrr_range(data, output);
> -
> -	/* Override mode with max vrefresh.
> -	 *   - vrr_min range should be less than the override mode vrefresh.
> -	 *   - Limit the vrr_max range with the override mode vrefresh.
> -	 */
> -	mode =3D output_mode_with_maxrate(output, data->range.max);
> -	igt_require(mode.vrefresh > data->range.min);
> -	data->range.max =3D mode.vrefresh;
> -	igt_output_override_mode(output, &mode);
> +	mode =3D *igt_output_get_mode(output);
>=20
>  	/* Prepare resources */
>  	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> @@ -483,7 +466,36 @@ static void test_cleanup(data_t *data, enum pipe
> pipe, igt_output_t *output)
>  	igt_remove_fb(data->drm_fd, &data->fb0);  }
>=20
> -static bool config_constraint(igt_output_t *output, uint32_t flags)
> +static bool output_constraint(data_t *data, igt_output_t *output) {
> +	drmModeModeInfo mode;
> +
> +	/* Reset output */
> +	igt_display_reset(&data->display);
> +
> +	/* Capture VRR range */
> +	data->range =3D get_vrr_range(data, output);
> +
> +	/*
> +	 * Override mode with max vrefresh.
> +	 *   - vrr_min range should be less than the override mode vrefresh.
> +	 *   - Limit the vrr_max range with the override mode vrefresh.
> +	 */
> +	mode =3D output_mode_with_maxrate(output, data->range.max);
> +	if (mode.vrefresh < data->range.min)
> +		return false;
> +
> +	data->range.max =3D mode.vrefresh;
> +
> +	igt_info("Override Mode: ");
> +	kmstest_dump_mode(&mode);
> +
> +	igt_output_override_mode(output, &mode);
> +
> +	return true;
> +}
> +
> +static bool config_constraint(data_t *data, igt_output_t *output,
> +uint32_t flags)
>  {
>  	if (!has_vrr(output))
>  		return false;
> @@ -495,6 +507,9 @@ static bool config_constraint(igt_output_t *output,
> uint32_t flags)
>  	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
>  		return false;
>=20
> +	if (!output_constraint(data, output))
> +		return false;
> +
>  	return true;
>  }
>=20
> @@ -507,16 +522,17 @@ run_vrr_test(data_t *data, test_t test, uint32_t
> flags)
>  	for_each_connected_output(&data->display, output) {
>  		enum pipe pipe;
>=20
> -		if (!config_constraint(output, flags))
> +		if (!config_constraint(data, output, flags))
>  			continue;
>=20
>  		for_each_pipe(&data->display, pipe) {
>  			if (igt_pipe_connector_valid(pipe, output)) {
> -				igt_display_reset(&data->display);
> -
>  				igt_output_set_pipe(output, pipe);
> -				if (!intel_pipe_output_combo_valid(&data-
> >display))
> +
> +				if (!intel_pipe_output_combo_valid(&data-
> >display)) {
> +					igt_output_set_pipe(output,
> PIPE_NONE);
>  					continue;
> +				}

Change LGTM
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

>=20
>  				igt_dynamic_f("pipe-%s-%s",
>  					      kmstest_pipe_name(pipe),
> output->name)
> --
> 2.40.0
