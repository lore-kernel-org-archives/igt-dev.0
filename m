Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FB410E5B1
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jan 2022 10:22:52 +0000 (UTC)
Date: Wed, 26 Jan 2022 12:21:30 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YfEgqkJDpw9ZXfLE@platvala-desk.ger.corp.intel.com>
References: <20220126010105.187-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220126010105.187-1-quic_jesszhan@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/kms_plane_scaling: Increase
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

On Tue, Jan 25, 2022 at 05:01:05PM -0800, Jessica Zhang wrote:
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
> Changes since V3:
> - try_commit_with_fb_size: Moved igt_plane_set_position to outside
>   method after fallback cases
>=20
> Changes since V4:
> - try_commit_with_fb_size: Moved igt_create_color_fb to inside
>   display_try_commit_with_fb and moved igt_set_plane_fb out so that a
>   new framebuffer is created and set for different sizes
>=20
> Tested-on: Qualcomm RB5 (sdm845), Chromebook (Lazor)
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Change-Id: Ib6758fec0293a2ba4c4109fbf42674cf93f784dd
> ---
>  tests/kms_plane_scaling.c | 57 +++++++++++++++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 85db11ee6dbd..bbc89c23b91f 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright =A9 2013,2014 Intel Corporation
> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights r=
eserved.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
>   * copy of this software and associated documentation files (the "Softwa=
re"),
> @@ -118,6 +119,32 @@ static void prepare_crtc(data_t *data, igt_output_t =
*output, enum pipe pipe,
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  }
> =20
> +static int try_commit_with_fb_size(int width, int height, igt_rotation_t=
 rot,
> +				   igt_display_t *display, data_t *d,
> +				   uint32_t pixel_format,
> +				   uint64_t modifier,
> +				   igt_plane_t *plane,
> +				   drmModeModeInfo *mode)
> +{
> +	int ret;
> +
> +	/* create buffer in the range of  min and max source side limit.*/
> +	igt_create_color_fb(display->drm_fd, width, height,
> +		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
> +	igt_plane_set_fb(plane, &d->fb[0]);
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
> +	return ret;
> +}
> +
>  static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>  					 uint32_t pixel_format,
>  					 uint64_t modifier, enum pipe pipe,
> @@ -126,6 +153,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, i=
gt_plane_t *plane,
>  {
>  	igt_display_t *display =3D &d->display;
>  	int width, height;
> +	int commit_ret;
>  	drmModeModeInfo *mode;
> =20
>  	cleanup_crtc(d);
> @@ -133,22 +161,29 @@ static void check_scaling_pipe_plane_rot(data_t *d,=
 igt_plane_t *plane,
>  	igt_output_set_pipe(output, pipe);
>  	mode =3D igt_output_get_mode(output);
> =20
> -	/* create buffer in the range of  min and max source side limit.*/
>  	width =3D height =3D 20;
> -	igt_create_color_fb(display->drm_fd, width, height,
> -		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
> -	igt_plane_set_fb(plane, &d->fb[0]);
> =20
> -	/* Check min to full resolution upscaling */
> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> -	igt_fb_set_size(&d->fb[0], plane, width, height);
> -	igt_plane_set_position(plane, 0, 0);
> -	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	igt_plane_set_rotation(plane, rot);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	commit_ret =3D try_commit_with_fb_size(width, height, rot, display, d,
> +					     pixel_format, modifier, plane, mode);
> +
> +	if(commit_ret =3D=3D -ERANGE) {
> +		igt_debug("Scaling for %dx%d plane not supported, trying scale factor =
of 4x\n", width, height);
> +		width =3D height =3D mode->vdisplay / 4;
> +		commit_ret =3D try_commit_with_fb_size(width, height, rot, display, d,
> +						     pixel_format, modifier, plane, mode);
> +	}
> +
> +	if (commit_ret =3D=3D -ERANGE) {
> +		igt_debug("Scale factor of 4x (or scaling in general) not supported, t=
rying unity scale\n");
> +		width =3D mode->hdisplay;
> +		height =3D mode->vdisplay;
> +		commit_ret =3D try_commit_with_fb_size(width, height, rot, display, d,
> +						     pixel_format, modifier, plane, mode);
> +	}

Now the changes look good and they do what it says on the tin. But now
it got me thinking if this needs to be even more complicated...

If a kernel change causes the first scaling attempt to fail and this
goes into the fallbacks and succeeds there, it all happens very
silently. A better setup for catching that case would be to have
separate dynamic subtests for the different scaling factors, where the
unsupported factors do a 'SKIP' result with igt_skip_on_f(commit_ret
=3D=3D -ERANGE, "Unsupported scaling factor\n");

What do you think? Sorry to go back and forth like this on the patch.


--=20
Petri Latvala



> =20
>  	igt_plane_set_fb(plane, NULL);
>  	igt_plane_set_position(plane, 0, 0);
> +	igt_assert_eq(commit_ret, 0);
>  }
> =20
>  static const igt_rotation_t rotations[] =3D {
> --=20
> 2.31.0
>=20
