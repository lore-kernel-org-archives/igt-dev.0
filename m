Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D6210FA9C
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Dec 2021 12:35:03 +0000 (UTC)
Date: Fri, 17 Dec 2021 14:34:25 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbyD0XmieiIahnYo@platvala-desk.ger.corp.intel.com>
References: <20211215225118.280-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211215225118.280-1-quic_jesszhan@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_scaling: Increase
 buffer size if driver doesn't support larger scale factors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_khsieh@quicinc.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 02:51:18PM -0800, Jessica Zhang wrote:
> Catch edge cases where driver doesn't support larger scale factors or
> pipe doesn't support scaling.
>=20
> Currently, a 20x20 framebuffer is passed in to be upscaled. However,
> this will cause issues with other drivers as they may not support larger
> scale factors or may not support scaling at all for certain planes.
>=20
> This avoids failures due to invalid scale factor by trying
> the original 20x20 framebuffer commit, then trying to commit larger
> framebuffers up to and including unity scale.
>=20
> Changes since V1:
> - try_commit_with_fb_size: Changed igt_try_commit2 to
>   igt_display_try_commit_atomic instead to avoid redundant commits
> - try_commit_with_fb_size: Moved calls to clear framebuffer to outside
>   of success condition and moved cleanup_crtc back to outside of method
>=20
> Changes since V2:
> - try_commit_with_fb_size: Replaced igt_display_try_commit_atomic with
>   igt_display_try_commit2 and removed igt_display_try_commit2 to avoid
>   redundant checks
>=20
> Tested-on: Qualcomm RB5 (sdm845)
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_plane_scaling.c | 51 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 42 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 85db11ee..55042d40 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright =A9 2013,2014 Intel Corporation
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
>   * copy of this software and associated documentation files (the "Softwa=
re"),
> @@ -118,6 +119,28 @@ static void prepare_crtc(data_t *data, igt_output_t =
*output, enum pipe pipe,
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  }
> =20
> +static int try_commit_with_fb_size(int width, int height, igt_rotation_t=
 rot,
> +		                    igt_display_t *display, data_t *d,
> +                                   igt_plane_t *plane,
> +		                    drmModeModeInfo *mode)
> +{
> +	int ret;
> +
> +	/* Check min to full resolution upscaling */
> +	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> +	igt_fb_set_size(&d->fb[0], plane, width, height);
> +	igt_plane_set_position(plane, 0, 0);
> +	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_rotation(plane, rot);
> +
> +	ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_plane_set_position(plane, 0, 0);

These set_fb and set_position calls should only be done if the commit
is successful, maybe?

> +
> +	return ret;
> +}
> +
>  static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>  					 uint32_t pixel_format,
>  					 uint64_t modifier, enum pipe pipe,
> @@ -126,6 +149,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, i=
gt_plane_t *plane,
>  {
>  	igt_display_t *display =3D &d->display;
>  	int width, height;
> +	int commit_ret;
>  	drmModeModeInfo *mode;
> =20
>  	cleanup_crtc(d);
> @@ -139,16 +163,25 @@ static void check_scaling_pipe_plane_rot(data_t *d,=
 igt_plane_t *plane,
>  		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
>  	igt_plane_set_fb(plane, &d->fb[0]);
> =20
> -	/* Check min to full resolution upscaling */
> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> -	igt_fb_set_size(&d->fb[0], plane, width, height);
> -	igt_plane_set_position(plane, 0, 0);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_rotation(plane, rot);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	commit_ret =3D try_commit_with_fb_size(width, height, rot, display,
> +                                            d, plane, mode);
> =20
> -	igt_plane_set_fb(plane, NULL);
> -	igt_plane_set_position(plane, 0, 0);
> +	if(commit_ret =3D=3D -ERANGE) {
> +		igt_debug("Scaling for %dx%d plane not supported, trying scale factor =
of 4x\n", width, height);
> +		width =3D height =3D mode->vdisplay / 4;
> +		commit_ret =3D try_commit_with_fb_size(width, height, rot, display,
> +                                                    d, plane, mode);
> +	}
> +
> +	if (commit_ret =3D=3D -ERANGE) {
> +		igt_debug("Scale factor of 4x (or scaling in general) not supported, t=
rying unity scale\n");
> +		width =3D mode->hdisplay;
> +		height =3D mode->vdisplay;
> +		commit_ret =3D try_commit_with_fb_size(width, height, rot, display,
> +                                                    d, plane, mode);
> +	}
> +

In here, after going through the fallbacks.


--=20
Petri Latvala



> +	igt_assert_eq(commit_ret, 0);
>  }
> =20
>  static const igt_rotation_t rotations[] =3D {
> --=20
> 2.34.1
>=20
