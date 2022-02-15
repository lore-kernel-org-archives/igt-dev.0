Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3210E5CB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 20:43:26 +0000 (UTC)
Date: Tue, 15 Feb 2022 22:43:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YgwQZUqPu5J5Ke54@intel.com>
References: <20220215122344.11168-1-swati2.sharma@intel.com>
 <20220215122344.11168-5-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220215122344.11168-5-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v4 4/9] tests/kms_plane_scaling: Downscaling each
 plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 05:53:39PM +0530, Swati Sharma wrote:
> Subtest for testing downscaling for each plane
> individually (checked 1 plane per "class" like
> we do in other tests).
>=20
> v2: -set modifier as LINEAR (Ville)
>     -shared code for upscaling and downscaling tests (Ville)
>     -removed num_scaler() check and added try_commit() (Ville)
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_plane_scaling.c | 55 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 39f2de3c..e960a6c5 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -32,6 +32,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
>  /* Test flags. */
>  enum {
>  	TEST_UPSCALING =3D 1 << 0,
> +	TEST_DOWNSCALING =3D 1 << 1,
>  };
> =20
>  typedef struct {
> @@ -266,6 +267,48 @@ __test_plane_upscaling(data_t *d, igt_plane_t *plane,
>  	igt_skip_on_f(ret =3D=3D -EINVAL, "Scaling op not supported\n");
>  }
> =20
> +static void
> +__test_plane_downscaling(data_t *d, igt_plane_t *plane,
> +		         enum pipe pipe, igt_output_t *output)
> +{
> +	igt_display_t *display =3D &d->display;
> +	int width, height;
> +	drmModeModeInfo *mode;
> +	bool test_complete =3D false;
> +	int scaling =3D 50;
> +	int ret;
> +
> +	cleanup_crtc(d);
> +
> +	igt_output_set_pipe(output, pipe);
> +	mode =3D igt_output_get_mode(output);
> +	width =3D mode->hdisplay;
> +	height =3D mode->vdisplay;
> +
> +	igt_create_color_pattern_fb(display->drm_fd,
> +				    width, height,
> +				    DRM_FORMAT_XRGB8888,
> +				    I915_TILING_NONE,
> +				    1.0, 0.0, 0.0, &d->fb[0]);
> +
> +	igt_plane_set_fb(plane, &d->fb[0]);
> +
> +	while(!test_complete) {
> +		igt_plane_set_size(plane, (width * scaling) / 100, (height * scaling) =
/ 100);
> +		ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_M=
ODESET, NULL);
> +
> +		if (ret !=3D -EINVAL)
> +			test_complete =3D true;
> +
> +		scaling +=3D 5;

This looks like it could go on forever.

> +	}
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_remove_fb(display->drm_fd, &d->fb[0]);
> +
> +	igt_skip_on_f(ret =3D=3D -EINVAL, "Scaling op not supported\n");
> +}
> +
>  static void
>  test_plane_scaling(data_t *d, enum pipe pipe, igt_output_t *output, uint=
32_t flags)
>  {
> @@ -285,9 +328,12 @@ test_plane_scaling(data_t *d, enum pipe pipe, igt_ou=
tput_t *output, uint32_t fla
>  			uint32_t format =3D plane->drm_plane->formats[j];
>  			if (test_format(d, &tested_formats, format) &&
>  			    igt_plane_has_format_mod(plane, format, modifier) &&
> -			    can_scale(d, format))
> +			    can_scale(d, format)) {
>  				if (flags & TEST_UPSCALING)
>  					__test_plane_upscaling(d, plane, pipe, output);
> +				if (flags & TEST_DOWNSCALING)
> +					__test_plane_downscaling(d, plane, pipe, output);
> +				}
>  		}
> =20
>  		igt_vec_fini(&tested_formats);
> @@ -618,6 +664,13 @@ igt_main_args("", long_opts, help_str, opt_handler, =
&data)
>  					test_plane_scaling(&data, pipe, output, TEST_UPSCALING);
>  		}
> =20
> +		igt_describe("Tests plane downscaling.");
> +		igt_subtest_with_dynamic("plane-downscaling") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-%s-downscaling", kmstest_pipe_name(pipe), igt=
_output_name(output))
> +					test_plane_scaling(&data, pipe, output, TEST_DOWNSCALING);
> +		}
> +
>  		igt_describe("Tests scaling with pixel formats.");
>  		igt_subtest_with_dynamic("scaler-with-pixel-format") {
>  			for_each_pipe_with_single_output(&data.display, pipe, output)
> --=20
> 2.25.1

--=20
Ville Syrj=E4l=E4
Intel
