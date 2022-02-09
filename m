Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61AE10E20D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Feb 2022 08:31:04 +0000 (UTC)
Date: Wed, 9 Feb 2022 10:31:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YgN7xEYyqGP8ldLr@intel.com>
References: <20220208055039.31306-1-swati2.sharma@intel.com>
 <20220208055039.31306-5-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220208055039.31306-5-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v3 4/9] tests/kms_plane_scaling: Downscaling each
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

On Tue, Feb 08, 2022 at 11:20:34AM +0530, Swati Sharma wrote:
> Subtest for testing downscaling for each plane
> individually (checked 1 plane per "class" like
> we do in other tests).
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_plane_scaling.c | 77 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 25e91659..22563fac 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -288,6 +288,76 @@ test_plane_upscaling(data_t *d, enum pipe pipe, igt_=
output_t *output)
>  	}
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
> +	while(!test_complete) {
> +
> +		igt_create_color_pattern_fb(display->drm_fd,
> +					    width, height,
> +					    DRM_FORMAT_XRGB8888,
> +					    I915_TILING_NONE,
> +					    1.0, 0.0, 0.0, &d->fb[0]);
> +
> +		igt_plane_set_fb(plane, &d->fb[0]);
> +		igt_plane_set_size(plane, (width * scaling) / 100, (height * scaling) =
/ 100);
> +		ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_M=
ODESET, NULL);
> +
> +		if (ret !=3D -EINVAL)
> +			test_complete =3D true;
> +
> +		scaling +=3D 5;
> +
> +		igt_plane_set_fb(plane, NULL);
> +		igt_remove_fb(display->drm_fd, &d->fb[0]);
> +	}
> +}
> +
> +static void
> +test_plane_downscaling(data_t *d, enum pipe pipe, igt_output_t *output)
> +{
> +	igt_display_t *display =3D &d->display;
> +	igt_plane_t *plane;
> +	uint64_t modifier =3D is_i915_device(d->drm_fd) ?
> +		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;

Same Y-tile thing a sin the upscale test.

> +
> +	igt_require(get_num_scalers(d, pipe) > 0);

That i915ism shouldn't be required given you use try_commit().

> +
> +	for_each_plane_on_pipe(display, pipe, plane) {
> +		struct igt_vec tested_formats;
> +
> +		if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> +			continue;
> +
> +		igt_vec_init(&tested_formats, sizeof(uint32_t));
> +
> +		for (int j =3D 0; j < plane->drm_plane->count_formats; j++) {
> +			uint32_t format =3D plane->drm_plane->formats[j];
> +			if (test_format(d, &tested_formats, format) &&
> +			    igt_plane_has_format_mod(plane, format, modifier) &&
> +			    can_scale(d, format))
> +					__test_plane_downscaling(d, plane, pipe, output);
> +		}
> +
> +		igt_vec_fini(&tested_formats);
> +	}
> +}

This whole function seems identical to the upscaling test.
Could be all shared code pretty easily.


> +
>  static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iterat=
ion)
>  {
>  	if (!is_i915_device(data->drm_fd) ||
> @@ -612,6 +682,13 @@ igt_main_args("", long_opts, help_str, opt_handler, =
&data)
>  					test_plane_upscaling(&data, pipe, output);
>  		}
> =20
> +		igt_describe("Tests plane downscaling.");
> +		igt_subtest_with_dynamic("plane-downscaling") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-%s-downscaling", kmstest_pipe_name(pipe), igt=
_output_name(output))
> +					test_plane_downscaling(&data, pipe, output);
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
