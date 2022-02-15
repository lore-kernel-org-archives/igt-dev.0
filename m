Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD2D10E5CB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 20:43:11 +0000 (UTC)
Date: Tue, 15 Feb 2022 22:43:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YgwQW7Wjli+6cRZg@intel.com>
References: <20220215122344.11168-1-swati2.sharma@intel.com>
 <20220215122344.11168-4-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220215122344.11168-4-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v4 3/9] tests/kms_plane_scaling: Upscaling each plane
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

On Tue, Feb 15, 2022 at 05:53:38PM +0530, Swati Sharma wrote:
> Subtest for testing upscaling for each plane
> individually (checked 1 plane per "class" like
> we do in other tests)
>=20
> v2: -set modifier as LINEAR (Ville)
>     -shared code for upscaling and downscaling tests (Ville)
>     -removed num_scaler() check and added try_commit() (Ville)
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_plane_scaling.c | 71 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 1cf62841..39f2de3c 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -29,6 +29,11 @@
> =20
>  IGT_TEST_DESCRIPTION("Test display plane scaling");
> =20
> +/* Test flags. */
> +enum {
> +	TEST_UPSCALING =3D 1 << 0,
> +};

That doesn't seem like it's actually used as flags.
So looks to me like it can be a straight up enum.

> +
>  typedef struct {
>  	uint32_t devid;
>  	int drm_fd;
> @@ -230,6 +235,65 @@ static bool test_format(data_t *data,
>  	return true;
>  }
> =20
> +static void
> +__test_plane_upscaling(data_t *d, igt_plane_t *plane,
> +		       enum pipe pipe, igt_output_t *output)
> +{
> +	igt_display_t *display =3D &d->display;
> +	int width, height, ret;
> +	drmModeModeInfo *mode;
> +
> +	cleanup_crtc(d);
> +
> +	igt_output_set_pipe(output, pipe);
> +	mode =3D igt_output_get_mode(output);
> +	width =3D height =3D 20;
> +
> +	igt_create_color_pattern_fb(display->drm_fd,
> +                                    width, height,
> +                                    DRM_FORMAT_XRGB8888,
> +                                    I915_TILING_NONE,
> +                                    1.0, 0.0, 0.0, &d->fb[0]);
> +
> +	igt_plane_set_fb(plane, &d->fb[0]);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MO=
DESET, NULL);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_remove_fb(display->drm_fd, &d->fb[0]);
> +
> +	igt_skip_on_f(ret =3D=3D -EINVAL, "Scaling op not supported\n");

So we skip on -EINVAL and pass on anything else (error or success).
Is that going to tell us something useful?

> +}
> +
> +static void
> +test_plane_scaling(data_t *d, enum pipe pipe, igt_output_t *output, uint=
32_t flags)
> +{
> +	igt_display_t *display =3D &d->display;
> +	uint64_t modifier =3D DRM_FORMAT_MOD_LINEAR;
> +	igt_plane_t *plane;
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
> +				if (flags & TEST_UPSCALING)

I'd probably just have passed a function pointer rather than add that
enum. But maybe it's useful for the other tests...

> +					__test_plane_upscaling(d, plane, pipe, output);
> +		}
> +
> +		igt_vec_fini(&tested_formats);
> +	}
> +}
> +
>  static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iterat=
ion)
>  {
>  	if (!is_i915_device(data->drm_fd) ||
> @@ -547,6 +611,13 @@ igt_main_args("", long_opts, help_str, opt_handler, =
&data)
>  	igt_subtest_group {
>  		igt_output_t *output;
> =20
> +		igt_describe("Tests plane upscaling.");
> +		igt_subtest_with_dynamic("plane-upscaling") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-%s-upscaling", kmstest_pipe_name(pipe), igt_o=
utput_name(output))
> +					test_plane_scaling(&data, pipe, output, TEST_UPSCALING);
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
