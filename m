Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3824CFD7F8E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 10:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D081010E136;
	Fri, 27 Feb 2026 10:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UaGWm0eP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C919110E136
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772187745; x=1803723745;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=cZxLzYMR1r3z3OaQWm95Lxx8ujOgxJm7l6J0UXhPVCE=;
 b=UaGWm0ePFcfDJLehgY6vVr4B9ODXf1TYLrlF+Zgao2t1m5f4gc+vq3kd
 0NHXNcsq7PiOCIrjg+/ULYGVKbzCQxQM2az/g4UWDhUcUVrfVDq/55sry
 Z1SsmX9c1MRt9AK03biKvj1D28sLzcIZpWK1OPqTtr7PYmkY85220lEUb
 XUpgKLFgo0tR3ZoaCYZWSk0xEU4dbirQO0Es/cuJiOJgGwxsTPgF/K26u
 oyL6M/FJq6a5z8tHp2ZcNCtBWsUpma2l2Rnh7JPh/vSyWt6XTN1UouePB
 sx4fLFcMCwkwb9nMeKgyImdSB1Dxx+DzbP9Gy/teu9IO03FY+OD69keI1 g==;
X-CSE-ConnectionGUID: G6WKH8kzSz+mkuGo2c3U9w==
X-CSE-MsgGUID: H9m6KQbBTQ+HhmfupRE8+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77107100"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="77107100"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:22:25 -0800
X-CSE-ConnectionGUID: l18N1TyUThyTLC2dTsK0Jg==
X-CSE-MsgGUID: C7SgEpQKSv2cT7ICo5OEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="247381689"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:22:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/17] lib/kms: Replace
 igt_get_single_output_for_pipe() with igt_get_single_output_for_crtc()
In-Reply-To: <20260227080653.30389-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
 <20260227080653.30389-4-ville.syrjala@linux.intel.com>
Date: Fri, 27 Feb 2026 12:22:21 +0200
Message-ID: <8f23edefdc5671cf06d614748c058b06e96f8d33@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Fri, 27 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the pipe based igt_get_single_output_for_pipe() with
> the crtc based igt_get_single_output_for_crtc()

Should also mention this removes the last user of igt_require_pipe(),
and the whole function.

>
>  #include "scripts/iterators.cocci"
>
> @@
> expression DISPLAY, PIPE;
> @@
> - igt_get_single_output_for_pipe(DISPLAY, PIPE)
> + igt_get_single_output_for_crtc(igt_crtc_for_pipe(DISPLAY, PIPE))
>
> @@
> igt_crtc_t *CRTC;
> @@
> - igt_crtc_for_pipe(..., CRTC->pipe)
> + CRTC
>
> @@
> type T;
> @@
> T igt_get_single_output_for_pipe(...);
> +igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc);
>
> @@
> @@
> igt_get_single_output_for_pipe(...)
> { ... }
> +/**
> + * igt_get_single_output_for_crtc:
> + * @crtc: The CRTC for which an #igt_output_t must be returned.
> + *
> + * Get a compatible output for a CRTC.
> + *
> + * Returns: A compatible output for a given CRTC, or NULL.
> + */
> +igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc)
> +{
> +       igt_display_t *display =3D crtc->display;
> +       igt_output_t *chosen_outputs[igt_display_n_crtcs(display)];
> +
> +       __igt_pipe_populate_outputs(display, chosen_outputs);
> +
> +       return chosen_outputs[crtc->pipe];
> +}
>
> @@
> @@
> - igt_get_single_output_for_pipe(...) { ... }
>
> @@
> @@
> - igt_require_pipe(...) { ... }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c                           | 26 ++++++++-----------------
>  lib/igt_kms.h                           |  2 +-
>  tests/amdgpu/amd_abm.c                  |  3 +--
>  tests/amdgpu/amd_bypass.c               |  3 +--
>  tests/amdgpu/amd_color.c                |  3 +--
>  tests/amdgpu/amd_multidisplay_modeset.c |  2 +-
>  tests/amdgpu/amd_psr.c                  |  3 +--
>  tests/amdgpu/amd_replay.c               |  3 +--
>  tests/intel/gem_eio.c                   |  2 +-
>  tests/nouveau_crc.c                     |  3 +--
>  10 files changed, 17 insertions(+), 33 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 11ed109d74fb..5c2e101f08be 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2814,13 +2814,6 @@ void igt_display_reset(igt_display_t *display)
>  static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_=
t *plane);
>  static void igt_fill_display_format_mod(igt_display_t *display);
>=20=20
> -static void igt_require_pipe(igt_display_t *display, enum pipe pipe)
> -{
> -	igt_skip_on_f(pipe >=3D igt_display_n_crtcs(display) || !igt_crtc_for_p=
ipe(display, pipe)->valid,
> -			"Pipe %s does not exist\n",
> -			kmstest_pipe_name(pipe));
> -}
> -
>  static bool igt_crtc_has_valid_output(igt_crtc_t *crtc)
>  {
>  	igt_display_t *display =3D crtc->display;
> @@ -2949,7 +2942,7 @@ void igt_display_reset_outputs(igt_display_t *displ=
ay)
>  		if (!igt_crtc_has_valid_output(crtc))
>  			continue;
>=20=20
> -		output =3D igt_get_single_output_for_pipe(display, crtc->pipe);
> +		output =3D igt_get_single_output_for_crtc(crtc);
>=20=20
>  		if (crtc->num_primary_planes > 1) {
>  			igt_plane_t *old_primary =3D &crtc->planes[0];
> @@ -3655,24 +3648,21 @@ igt_output_t **__igt_pipe_populate_outputs(igt_di=
splay_t *display, igt_output_t
>  }
>=20=20
>  /**
> - * igt_get_single_output_for_pipe:
> - * @display: a pointer to an #igt_display_t structure
> - * @pipe: The pipe for which an #igt_output_t must be returned.
> + * igt_get_single_output_for_crtc:
> + * @crtc: The CRTC for which an #igt_output_t must be returned.
>   *
> - * Get a compatible output for a pipe.
> + * Get a compatible output for a CRTC.
>   *
> - * Returns: A compatible output for a given pipe, or NULL.
> + * Returns: A compatible output for a given CRTC, or NULL.
>   */
> -igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enu=
m pipe pipe)
> +igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc)
>  {
> +	igt_display_t *display =3D crtc->display;
>  	igt_output_t *chosen_outputs[igt_display_n_crtcs(display)];
>=20=20
> -	igt_assert(pipe !=3D PIPE_NONE);
> -	igt_require_pipe(display, pipe);
> -
>  	__igt_pipe_populate_outputs(display, chosen_outputs);
>=20=20
> -	return chosen_outputs[pipe];
> +	return chosen_outputs[crtc->pipe];
>  }
>=20=20
>  static igt_output_t *igt_crtc_get_output(igt_crtc_t *crtc)
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c79c8664e9a9..08573316eea6 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -616,7 +616,7 @@ int igt_crtc_count_plane_type(igt_crtc_t *crtc, int p=
lane_type);
>  igt_plane_t *igt_crtc_get_plane_type_index(igt_crtc_t *crtc, int plane_t=
ype,
>  					   int index);
>  bool output_is_internal_panel(igt_output_t *output);
> -igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enu=
m pipe pipe);
> +igt_output_t *igt_get_single_output_for_crtc(igt_crtc_t *crtc);
>=20=20
>  void igt_crtc_request_out_fence(igt_crtc_t *crtc);
>=20=20
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index bd700b90f361..1752a7e5c48d 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -133,8 +133,7 @@ static void test_init(data_t *data)
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	data->output =3D igt_get_single_output_for_pipe(display,
> -						      data->crtc->pipe);
> +	data->output =3D igt_get_single_output_for_crtc(data->crtc);
>  	igt_require(data->output);
>  	igt_info("output %s\n", data->output->name);
>=20=20
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 25136e83e6ad..9d5f3dd71c89 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -67,8 +67,7 @@ static void test_init(data_t *data)
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	data->output =3D igt_get_single_output_for_pipe(display,
> -						      data->crtc->pipe);
> +	data->output =3D igt_get_single_output_for_crtc(data->crtc);
>  	igt_assert(data->output);
>=20=20
>  	if (data->output->config.connector->connector_type =3D=3D DRM_MODE_CONN=
ECTOR_eDP) {
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index cdc6f3e6abd8..68f541d64d63 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -182,8 +182,7 @@ static void test_init(data_t *data)
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	data->output =3D igt_get_single_output_for_pipe(display,
> -						      data->crtc->pipe);
> +	data->output =3D igt_get_single_output_for_crtc(data->crtc);
>  	igt_require(data->output);
>=20=20
>  	data->mode =3D igt_output_get_mode(data->output);
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_m=
ultidisplay_modeset.c
> index a2853e73225a..40d1e5d7f42b 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -159,7 +159,7 @@ static void test_init(struct data_t *data)
>  		 * This will let displays connected to MST hub be
>  		 * tested
>  		 */
> -		output =3D igt_get_single_output_for_pipe(display, crtc->pipe);
> +		output =3D igt_get_single_output_for_crtc(crtc);
>  		data->primary[crtc->pipe] =3D igt_crtc_get_plane_type(crtc,
>  							   DRM_PLANE_TYPE_PRIMARY);
>  		data->output[crtc->pipe] =3D output;
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index b1d6d1631e26..85247d0e20da 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -174,8 +174,7 @@ static void test_init(data_t *data)
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	data->output =3D igt_get_single_output_for_pipe(display,
> -						      data->crtc->pipe);
> +	data->output =3D igt_get_single_output_for_crtc(data->crtc);
>  	igt_require(data->output);
>  	igt_info("output %s\n", data->output->name);
>=20=20
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index 5f62465d6b72..775bed190adf 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -64,8 +64,7 @@ static void test_init(struct test_data *data)
>=20=20
>  	igt_display_reset(display);
>=20=20
> -	data->output =3D igt_get_single_output_for_pipe(display,
> -						      data->crtc->pipe);
> +	data->output =3D igt_get_single_output_for_crtc(data->crtc);
>  	igt_require(data->output);
>  	igt_info("output %s\n", data->output->name);
>=20=20
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 361fd24744c4..546fff14bd5b 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -1041,7 +1041,7 @@ static void display_helper(igt_display_t *dpy, int =
*done)
>  		if (!crtc || !crtc->valid)
>  			continue;
>=20=20
> -		output =3D igt_get_single_output_for_pipe(dpy, crtc->pipe);
> +		output =3D igt_get_single_output_for_crtc(crtc);
>  		if (!output)
>  			continue;
>=20=20
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index 98394674e463..eeb544acad76 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -350,8 +350,7 @@ int igt_main()
>  				igt_display_commit(&data.display);
>  			}
>=20=20
> -			data.output =3D igt_get_single_output_for_pipe(&data.display,
> -								     data.crtc->pipe);
> +			data.output =3D igt_get_single_output_for_crtc(data.crtc);
>  			data.mode =3D igt_output_get_mode(data.output);
>=20=20
>  			/* None of these tests need to perform modesets, just page flips. So =
running

--=20
Jani Nikula, Intel
