Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E5D10E004
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 20:02:05 +0000 (UTC)
Message-ID: <d089eb0d3d652b6d81bd60e5cddfd3752106ecc4.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
Date: Thu, 09 Feb 2023 22:02:00 +0200
In-Reply-To: <20230209115151.8681-1-juhapekka.heikkila@gmail.com>
References: <20230209115151.8681-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: add invalid
 parameter tests
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

On Thu, 2023-02-09 at 13:51 +0200, Juha-Pekka Heikkila wrote:
> Add skeleton for adding invalid parameter tests and add
> two tests which are expected to return -EINVAL or -ERANGE
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---

You forgot to add "v3" in the patch subject, but that's okay.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

(thanks for the "pulla" =F0=9F=99=82)

Cheers,
Luca.


>  tests/kms_plane_scaling.c | 71 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 887a55e63..30a839f15 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -819,6 +819,75 @@ static void test_scaler_with_multi_pipe_plane(data_t=
 *d)
>  	igt_assert_eq(ret1 && ret2, 0);
>  }
> =20
> +static void invalid_parameter_tests(data_t *d) {
> +	enum pipe pipe =3D PIPE_A;
> +	igt_output_t *output;
> +	igt_fb_t fb;
> +	igt_plane_t* plane;
> +	int rval;
> +
> +	const struct {
> +		const char* testname;
> +		uint32_t planesize[2];
> +		struct {
> +			enum igt_atomic_plane_properties prop;
> +			uint32_t value;
> +		} params[8];
> +	} paramtests[] =3D {
> +		{
> +			.testname =3D "less-than-1-height-src",
> +			.planesize =3D {256, 8},
> +			.params =3D {{IGT_PLANE_SRC_H, IGT_FIXED(0, 30) }, {~0}}
> +		},
> +		{
> +			.testname =3D "less-than-1-width-src",
> +			.planesize =3D {8, 256},
> +			.params =3D {{IGT_PLANE_SRC_W, IGT_FIXED(0, 30) }, {~0}}
> +		},
> +	};
> +
> +	igt_fixture {
> +		output =3D igt_get_single_output_for_pipe(&d->display, pipe);
> +		igt_require(output);
> +
> +		igt_output_set_pipe(output, pipe);
> +		plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_create_fb(d->drm_fd, 256, 256,
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_MOD_NONE,
> +			&fb);
> +	}
> +
> +	igt_describe("test parameters which should not be accepted");
> +	igt_subtest_with_dynamic("invalid-parameters") {
> +		for (uint32_t i =3D 0; i < ARRAY_SIZE(paramtests); i++) {
> +			igt_dynamic(paramtests[i].testname) {
> +				igt_plane_set_position(plane, 0, 0);
> +				igt_plane_set_fb(plane, &fb);
> +				igt_plane_set_size(plane,
> +							paramtests[i].planesize[0],
> +							paramtests[i].planesize[1]);
> +
> +
> +				for (uint32_t j =3D 0; paramtests[i].params[j].prop !=3D ~0; j++)
> +					igt_plane_set_prop_value(plane,
> +									paramtests[i].params[j].prop,
> +									paramtests[i].params[j].value);
> +
> +				rval =3D 	igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
> +
> +				igt_assert(rval =3D=3D -EINVAL || rval =3D=3D -ERANGE);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_remove_fb(d->drm_fd, &fb);
> +		igt_output_set_pipe(output, PIPE_NONE);
> +	}
> +}
> +
>  static int opt_handler(int opt, int opt_index, void *_data)
>  {
>  	data_t *data =3D _data;
> @@ -982,6 +1051,8 @@ igt_main_args("", long_opts, help_str, opt_handler, =
&data)
>  	igt_subtest_f("2x-scaler-multi-pipe")
>  		test_scaler_with_multi_pipe_plane(&data);
> =20
> +	invalid_parameter_tests(&data);
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		close(data.drm_fd);
