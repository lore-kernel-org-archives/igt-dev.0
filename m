Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC2D10E5E3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 20:43:40 +0000 (UTC)
Date: Tue, 15 Feb 2022 22:43:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YgwQeeXoIXP50G3J@intel.com>
References: <20220215122344.11168-1-swati2.sharma@intel.com>
 <20220215122344.11168-6-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220215122344.11168-6-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v4 5/9] tests/kms_plane_scaling: Upscaling on 2
 planes
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

On Tue, Feb 15, 2022 at 05:53:40PM +0530, Swati Sharma wrote:
> i915 driver supports 2 scalers per pipe. Added test case
> to upscale 2 overlay planes simultaneously on single pipe.
>=20
> v2: -add check for min 2 scalers
>     -add igt_require() for overlay planes, fixes CRASH on KBL
> v3: -test modified for n planes (Ville)
> v4: -modularized the code
>     -removed i915 dependency (Ville)
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_plane_scaling.c | 85 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index e960a6c5..11bf5af9 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -33,6 +33,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
>  enum {
>  	TEST_UPSCALING =3D 1 << 0,
>  	TEST_DOWNSCALING =3D 1 << 1,
> +	TEST_UPSCALING_UPSCALING =3D 1 << 2,
>  };
> =20
>  typedef struct {
> @@ -340,6 +341,83 @@ test_plane_scaling(data_t *d, enum pipe pipe, igt_ou=
tput_t *output, uint32_t fla
>  	}
>  }
> =20
> +static void
> +__test_planes_upscaling_upscaling(data_t *d, enum pipe pipe, igt_output_=
t *output,
> +				  igt_plane_t *overlay1, igt_plane_t *overlay2,
> +				  struct igt_fb *fb1, struct igt_fb *fb2)
> +{
> +	igt_display_t *display =3D &d->display;
> +	drmModeModeInfo *mode;
> +	int width, height;
> +	int ret;
> +
> +	mode =3D igt_output_get_mode(output);
> +	width =3D mode->hdisplay;
> +	height =3D mode->vdisplay;
> +
> +	igt_plane_set_fb(overlay1, fb1);
> +	igt_plane_set_fb(overlay2, fb2);
> +
> +	/* 1st overlay plane upscaling */
> +	igt_plane_set_size(overlay1, width, height);
> +	/* 2nd overlay plane upscaling */
> +	igt_plane_set_size(overlay2, width - 20, height - 20);
> +	ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MO=
DESET, NULL);
> +
> +	igt_plane_set_fb(overlay1, NULL);
> +	igt_plane_set_fb(overlay2, NULL);
> +
> +	igt_skip_on_f(ret =3D=3D -EINVAL, "Scaling op not supported\n");
> +}
> +
> +static void setup_fb(int fd, int width, int height,
> +		     double r, double g, double b,
> +		     struct igt_fb *fb)
> +{
> +	igt_create_color_pattern_fb(fd, width, height,
> +				    DRM_FORMAT_XRGB8888,
> +				    I915_TILING_NONE,
> +				    r, g, b, fb);
> +}
> +
> +static void
> +test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output=
, uint32_t flags)
> +{
> +	igt_display_t *display =3D &d->display;
> +	int width, height;
> +
> +	cleanup_crtc(d);
> +
> +	width =3D height =3D 20;
> +
> +	if (flags & TEST_UPSCALING_UPSCALING) {
> +		setup_fb(display->drm_fd, width, height, 1.0, 0.0, 0.0, &d->fb[1]);
> +		setup_fb(display->drm_fd, width, height, 0.0, 1.0, 0.0, &d->fb[2]);
> +	}
> +
> +	igt_output_set_pipe(output, pipe);
> +
> +	for (int k =3D 0; k < display->pipes[pipe].n_planes; k++) {
> +		igt_plane_t *plane1, *plane2;
> +
> +		plane1 =3D &display->pipes[pipe].planes[k];
> +		igt_require(plane1);
> +		plane2 =3D &display->pipes[pipe].planes[k+1];
> +		igt_require(plane2);
> +
> +		if (plane1->type =3D=3D DRM_PLANE_TYPE_PRIMARY  || plane1->type =3D=3D=
 DRM_PLANE_TYPE_CURSOR ||
> +		    plane2->type =3D=3D DRM_PLANE_TYPE_PRIMARY || plane2->type =3D=3DD=
RM_PLANE_TYPE_CURSOR)
> +				continue;

Why are we not interested in primary planes in this test?
I think you were testing them in the individual plane tests.

> +
> +		if (flags & TEST_UPSCALING_UPSCALING)
> +			__test_planes_upscaling_upscaling(d, pipe, output, plane1, plane2,
> +							  &d->fb[1], &d->fb[2]);
> +	}
> +
> +	igt_remove_fb(display->drm_fd, &d->fb[1]);
> +        igt_remove_fb(display->drm_fd, &d->fb[2]);

Some kind of whitespace gremlin was here.

> +}
> +
>  static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iterat=
ion)
>  {
>  	if (!is_i915_device(data->drm_fd) ||
> @@ -671,6 +749,13 @@ igt_main_args("", long_opts, help_str, opt_handler, =
&data)
>  					test_plane_scaling(&data, pipe, output, TEST_DOWNSCALING);
>  		}
> =20
> +		igt_describe("Tests upscaling of 2 overlay planes.");
> +		igt_subtest_with_dynamic("planes-upscaling-upscaling") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-%s-planes-upscaling-upscaling", kmstest_pipe_=
name(pipe), igt_output_name(output))
> +					test_plane_scaling_combo(&data, pipe, output, TEST_UPSCALING_UPSCAL=
ING);
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
