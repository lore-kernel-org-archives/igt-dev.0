Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EE810E32F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 10:25:57 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 20 Mar 2023 10:24:39 +0000
Message-ID: <DM4PR11MB63125D8117AF45B4C13F504890809@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
 <20230223151018.2565040-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-16-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v8 15/51] tests/kms_display_modes: Add support
 for Bigjoiner
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

LGTM

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Thursday, February 23, 2023 8:40 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t v8 15/51] tests/kms_display_modes: Add support =
for
> Bigjoiner
>=20
> As many 2x tests are currently running on Pipe-A & B only, those tests wi=
ll always
> SKIP if there is any 8K supported panel in the config. Instead of Skippin=
g the test,
> add some intelligence to the subtest to identify the valid pipe/output co=
mbo to
> execute the subtest.
>=20
> V2: - Use updated helper name
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_display_modes.c | 104 +++++++++++++++++++++++---------------
>  1 file changed, 62 insertions(+), 42 deletions(-)
>=20
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c index
> e4191811e..02fee317d 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -34,31 +34,26 @@ typedef struct {
>  	int n_pipes;
>  } data_t;
>=20
> -static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
> +static void run_extendedmode_basic(data_t *data,
> +				   enum pipe pipe1, igt_output_t *output1,
> +				   enum pipe pipe2, igt_output_t *output2)
>  {
>  	struct igt_fb fb, fbs[2];
>  	drmModeModeInfo *mode[2];
> -	igt_output_t *output, *extended_output[2];
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *plane[2];
>  	igt_pipe_crc_t *pipe_crc[2] =3D { 0 };
>  	igt_crc_t ref_crc[2], crc[2];
> -	int count =3D 0, width, height;
> +	int width, height;
>  	cairo_t *cr;
>=20
> -	for_each_connected_output(display, output) {
> -		extended_output[count] =3D output;
> -		count++;
> +	igt_display_reset(display);
>=20
> -		if (count > 1)
> -			break;
> -	}
> -
> -	igt_output_set_pipe(extended_output[0], pipe1);
> -	igt_output_set_pipe(extended_output[1], pipe2);
> +	igt_output_set_pipe(output1, pipe1);
> +	igt_output_set_pipe(output2, pipe2);
>=20
> -	mode[0] =3D igt_output_get_mode(extended_output[0]);
> -	mode[1] =3D igt_output_get_mode(extended_output[1]);
> +	mode[0] =3D igt_output_get_mode(output1);
> +	mode[1] =3D igt_output_get_mode(output2);
>=20
>  	pipe_crc[0] =3D igt_pipe_crc_new(data->drm_fd, pipe1,
> IGT_PIPE_CRC_SOURCE_AUTO);
>  	pipe_crc[1] =3D igt_pipe_crc_new(data->drm_fd, pipe2,
> IGT_PIPE_CRC_SOURCE_AUTO); @@ -115,8 +110,8 @@ static void
> run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
>  	igt_pipe_crc_free(pipe_crc[0]);
>  	igt_pipe_crc_free(pipe_crc[1]);
>=20
> -	igt_output_set_pipe(extended_output[0], PIPE_NONE);
> -	igt_output_set_pipe(extended_output[1], PIPE_NONE);
> +	igt_output_set_pipe(output1, PIPE_NONE);
> +	igt_output_set_pipe(output2, PIPE_NONE);
>=20
>  	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe1],
>  			  DRM_PLANE_TYPE_PRIMARY), NULL);
> @@ -129,43 +124,68 @@ static void run_extendedmode_basic(data_t *data,
> int pipe1, int pipe2)
>  	igt_assert_crc_equal(&crc[1], &ref_crc[1]);  }
>=20
> +#define for_each_connected_output_local(display, output)		\
> +	for (int j__ =3D 0;  assert(igt_can_fail()), j__ < (display)->n_outputs=
; j__++)
> 	\
> +		for_each_if ((((output) =3D &(display)->outputs[j__]), \
> +			      igt_output_is_connected((output))))
> +
> +#define for_each_valid_output_on_pipe_local(display, pipe, output) \
> +	for_each_connected_output_local((display), (output)) \
> +		for_each_if (igt_pipe_connector_valid((pipe), (output)))
> +
> +static void run_extendedmode_test(data_t *data) {
> +	enum pipe pipe1, pipe2;
> +	igt_output_t *output1, *output2;
> +	igt_display_t *display =3D &data->display;
> +
> +	igt_display_reset(display);
> +
> +	for_each_pipe(display, pipe1) {
> +		for_each_valid_output_on_pipe(display, pipe1, output1) {
> +			for_each_pipe(display, pipe2) {
> +				if (pipe1 =3D=3D pipe2)
> +					continue;
> +
> +				for_each_valid_output_on_pipe_local(display,
> pipe2, output2) {
> +					if (output1 =3D=3D output2)
> +						continue;
> +
> +					igt_display_reset(display);
> +
> +					igt_output_set_pipe(output1, pipe1);
> +					igt_output_set_pipe(output2, pipe2);
> +
> +					if
> (!i915_pipe_output_combo_valid(display))
> +						continue;
> +
> +					igt_dynamic_f("pipe-%s-%s-pipe-%s-
> %s",
> +						      kmstest_pipe_name(pipe1),
> +						      igt_output_name(output1),
> +						      kmstest_pipe_name(pipe2),
> +						      igt_output_name(output2))
> +
> 	run_extendedmode_basic(data,
> +								pipe1,
> output1,
> +								pipe2,
> output2);
> +				}
> +			}
> +		}
> +	}
> +}
> +
>  igt_main
>  {
>  	data_t data;
> -	int valid_output =3D 0, i, j =3D 0;
> -	igt_output_t *output;
> -	int pipe[IGT_MAX_PIPES];
>=20
>  	igt_fixture {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
> -
> -		for_each_connected_output(&data.display, output) {
> -			valid_output++;
> -
> -			if (valid_output > 1)
> -				break;
> -		}
> -
> -		data.n_pipes =3D 0;
> -		for_each_pipe(&data.display, i) {
> -			data.n_pipes++;
> -			pipe[j] =3D i;
> -			j++;
> -		}
> -
> -		igt_require_f(valid_output > 1, "No valid second output
> found\n");
> +		igt_display_require_output(&data.display);
>  	}
>=20
>  	igt_describe("Test for validating display extended mode with a pair of
> connected displays");
> -	igt_subtest_with_dynamic("extended-mode-basic") {
> -		for (i =3D 0; i < data.n_pipes - 1; i++) {
> -			igt_dynamic_f("pipe-%s%s",
> kmstest_pipe_name(pipe[i]),
> -					kmstest_pipe_name(pipe[i+1]));
> -			run_extendedmode_basic(&data, pipe[i], pipe[i+1]);
> -		}
> -	}
> +	igt_subtest_with_dynamic("extended-mode-basic")
> +		run_extendedmode_test(&data);
>=20
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> --
> 2.39.1
