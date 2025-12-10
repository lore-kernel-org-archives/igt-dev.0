Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E36D3C912
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF2C10E6E2;
	Wed, 10 Dec 2025 14:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQnilqT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB29410E719
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376572; x=1796912572;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=xYpX+HWiaHvYpKiho0uHD4UaQfljhZTq0bOLKmGbTZo=;
 b=NQnilqT/UvQHSakCM+MU7Jsb7TMTNH9csqEZEjNfLomDbBEuyjPtazNX
 4M607zpMzfKFYB4p9fVVSFD5NQG8NYZAu5TpaSBjZdvK0FCN92105HV4m
 yiXKvliTmVCRGYtPlqOVbmW+TY9mmI/bVr0D5m8JD4QkqBJIw94X5mJ6L
 /Tt+c5yeoC+suu4c2lnDwyJ7gpK2/jJXuEKooyIsocPxZhiSVwyM1kG3Q
 rPHDlusDYP5Dp49cWL0qKT4RPMGL0jtSc73PsNwkMm/+ynm+47EOmkXsz
 dXThw3NG4BuyB0WbS8mfi8Z9mXckzrn8xDCZCF90I78ttafFEy5/XVe5e w==;
X-CSE-ConnectionGUID: liRz6a7CTBW38eXRn19niw==
X-CSE-MsgGUID: 56BarzhYRM2fle7ff9Nq+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67519989"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67519989"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:22:52 -0800
X-CSE-ConnectionGUID: ptMsUDnXQmK1zi7nIkIKwg==
X-CSE-MsgGUID: P2A2dFarQ0eNlgzsixKKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="196278403"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:22:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/10] lib/kms: Use igt_display_n_crtcs() everywhere
In-Reply-To: <20251210093903.15934-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-4-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:22:46 +0200
Message-ID: <6930f2b7f3597ba5eb1d69d21a9d018f83fe624d@intel.com>
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

On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace all igt_display_get_n_pipes() and naked
> display->n_pipes uses with igt_display_n_crtcs().
>
> One step towards using 'crtcs' instead of 'pipes'.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> - igt_display_get_n_pipes(...) { ... }
>
> @@
> expression DISPLAY;
> @@
> - igt_display_get_n_pipes(DISPLAY)
> + igt_display_n_crtcs(DISPLAY)
>
> @@
> igt_display_t DISPLAY;
> expression E;
> @@
> (
>  DISPLAY.n_pipes =3D E;
> |
> - DISPLAY.n_pipes
> + igt_display_n_crtcs(&DISPLAY)
> )
>
> @@
> igt_display_t *DISPLAY;
> expression E;
> @@
> (
>  DISPLAY->n_pipes =3D E;
> |
> - DISPLAY->n_pipes
> + igt_display_n_crtcs(DISPLAY)
> )
>
> @@
> identifier DISPLAY;
> @@
> igt_display_n_crtcs(igt_display_t *DISPLAY)
> {
> <...
> - igt_display_n_crtcs(DISPLAY)
> + DISPLAY->n_pipes
> ...>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

There's a few extra newlines added by cocci's strict adheration to max
line length, but I guess we'll just let it slide.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c                           | 42 ++++++++++---------------
>  lib/igt_kms.h                           |  1 -
>  tests/amdgpu/amd_dp_dsc.c               |  3 +-
>  tests/amdgpu/amd_hotplug.c              |  2 +-
>  tests/amdgpu/amd_mode_switch.c          |  2 +-
>  tests/amdgpu/amd_multidisplay_modeset.c |  2 +-
>  tests/amdgpu/amd_plane.c                |  2 +-
>  tests/amdgpu/amd_subvp.c                |  3 +-
>  tests/intel/gem_eio.c                   |  2 +-
>  tests/kms_bw.c                          |  2 +-
>  tests/kms_cursor_legacy.c               |  2 +-
>  tests/kms_tiled_display.c               |  4 +--
>  12 files changed, 30 insertions(+), 37 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5b8598305f8c..a6bc41fb357d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2870,7 +2870,7 @@ static void igt_fill_display_format_mod(igt_display=
_t *display);
>   */
>  void igt_require_pipe(igt_display_t *display, enum pipe pipe)
>  {
> -	igt_skip_on_f(pipe >=3D display->n_pipes || !display->pipes[pipe].valid,
> +	igt_skip_on_f(pipe >=3D igt_display_n_crtcs(display) || !display->pipes=
[pipe].valid,
>  			"Pipe %s does not exist\n",
>  			kmstest_pipe_name(pipe));
>  }
> @@ -3107,8 +3107,10 @@ void igt_display_require(igt_display_t *display, i=
nt drm_fd)
>  		     resources->count_crtcs, IGT_MAX_PIPES);
>=20=20
>  	display->n_pipes =3D IGT_MAX_PIPES;
> -	display->pipes =3D calloc(display->n_pipes, sizeof(igt_pipe_t));
> -	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n"=
, display->n_pipes);
> +	display->pipes =3D calloc(igt_display_n_crtcs(display),
> +				sizeof(igt_pipe_t));
> +	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n",
> +		     igt_display_n_crtcs(display));
>=20=20
>  	for (i =3D 0; i < resources->count_crtcs; i++) {
>  		igt_pipe_t *pipe;
> @@ -3260,14 +3262,14 @@ void igt_display_require(igt_display_t *display, =
int drm_fd)
>  out:
>  	LOG_UNINDENT(display);
>=20=20
> -	if (display->n_pipes && display->n_outputs) {
> +	if (igt_display_n_crtcs(display) && display->n_outputs) {
>  		igt_enable_connectors(drm_fd);
>=20=20
>  		igt_handle_spurious_hpd(display);
>  	}
>  	else {
>  		igt_skip("No KMS driver or no outputs, pipes: %d, outputs: %d\n",
> -			 display->n_pipes, display->n_outputs);
> +			 igt_display_n_crtcs(display), display->n_outputs);
>  	}
>  }
>=20=20
> @@ -3282,17 +3284,6 @@ int igt_display_n_crtcs(igt_display_t *display)
>  	return display->n_pipes;
>  }
>=20=20
> -/**
> - * igt_display_get_n_pipes:
> - * @display: A pointer to an #igt_display_t structure
> - *
> - * Returns: Total number of pipes for the given @display
> - */
> -int igt_display_get_n_pipes(igt_display_t *display)
> -{
> -	return igt_display_n_crtcs(display);
> -}
> -
>  /**
>   * igt_display_require_output:
>   * @display: A pointer to an #igt_display_t structure
> @@ -3469,7 +3460,7 @@ void igt_display_fini(igt_display_t *display)
>  		}
>  	}
>=20=20
> -	for (i =3D 0; i < display->n_pipes; i++)
> +	for (i =3D 0; i < igt_display_n_crtcs(display); i++)
>  		igt_pipe_fini(&display->pipes[i]);
>=20=20
>  	for (i =3D 0; i < display->n_outputs; i++)
> @@ -3539,7 +3530,7 @@ static igt_pipe_t *igt_output_get_driving_pipe(igt_=
output_t *output)
>  		pipe =3D output->pending_pipe;
>  	}
>=20=20
> -	igt_assert(pipe >=3D 0 && pipe < display->n_pipes);
> +	igt_assert(pipe >=3D 0 && pipe < igt_display_n_crtcs(display));
>=20=20
>  	return &display->pipes[pipe];
>  }
> @@ -3663,9 +3654,10 @@ igt_output_t **__igt_pipe_populate_outputs(igt_dis=
play_t *display, igt_output_t
>  	igt_output_t *output;
>  	int i, j;
>=20=20
> -	memset(chosen_outputs, 0, sizeof(*chosen_outputs) * display->n_pipes);
> +	memset(chosen_outputs, 0,
> +	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
>=20=20
> -	for (i =3D 0; i < display->n_pipes; i++) {
> +	for (i =3D 0; i < igt_display_n_crtcs(display); i++) {
>  		igt_pipe_t *pipe =3D &display->pipes[i];
>  		if (pipe->valid)
>  			full_pipe_mask |=3D (1 << i);
> @@ -3676,7 +3668,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_disp=
lay_t *display, igt_output_t
>  	 * it, start with the outputs restricted to 1 pipe, then increase
>  	 * number of pipes until we assign connectors to all pipes.
>  	 */
> -	for (i =3D 0; i <=3D display->n_pipes; i++) {
> +	for (i =3D 0; i <=3D igt_display_n_crtcs(display); i++) {
>  		for_each_connected_output(display, output) {
>  			uint32_t pipe_mask =3D output->config.valid_crtc_idx_mask & full_pipe=
_mask;
>  			bool found =3D false;
> @@ -3693,7 +3685,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_disp=
lay_t *display, igt_output_t
>  			} else if (__builtin_popcount(pipe_mask) !=3D i)
>  				continue;
>=20=20
> -			for (j =3D 0; j < display->n_pipes; j++) {
> +			for (j =3D 0; j < igt_display_n_crtcs(display); j++) {
>  				bool pipe_assigned =3D assigned_pipes & (1 << j);
>=20=20
>  				if (pipe_assigned || !(pipe_mask & (1 << j)))
> @@ -3733,7 +3725,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_disp=
lay_t *display, igt_output_t
>   */
>  igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enu=
m pipe pipe)
>  {
> -	igt_output_t *chosen_outputs[display->n_pipes];
> +	igt_output_t *chosen_outputs[igt_display_n_crtcs(display)];
>=20=20
>  	igt_assert(pipe !=3D PIPE_NONE);
>  	igt_require_pipe(display, pipe);
> @@ -4969,7 +4961,7 @@ static int do_display_commit(igt_display_t *display,
>  	LOG_INDENT(display, "commit");
>=20=20
>  	/* someone managed to bypass igt_display_require, catch them */
> -	assert(display->n_pipes && display->n_outputs);
> +	assert(igt_display_n_crtcs(display) && display->n_outputs);
>=20=20
>  	igt_display_refresh(display);
>=20=20
> @@ -5022,7 +5014,7 @@ int igt_display_try_commit_atomic(igt_display_t *di=
splay, uint32_t flags, void *
>  	int ret;
>=20=20
>  	/* someone managed to bypass igt_display_require, catch them */
> -	assert(display->n_pipes && display->n_outputs);
> +	assert(igt_display_n_crtcs(display) && display->n_outputs);
>=20=20
>  	LOG_INDENT(display, "commit");
>=20=20
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 4171e2baef61..6e7cf112b1e2 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -574,7 +574,6 @@ int  igt_display_try_commit_atomic(igt_display_t *dis=
play, uint32_t flags, void
>  void igt_display_commit_atomic(igt_display_t *display, uint32_t flags, v=
oid *user_data);
>  int  igt_display_try_commit2(igt_display_t *display, enum igt_commit_sty=
le s);
>  int  igt_display_drop_events(igt_display_t *display);
> -int  igt_display_get_n_pipes(igt_display_t *display);
>  void igt_display_require_output(igt_display_t *display);
>  void igt_display_require_output_on_pipe(igt_display_t *display, enum pip=
e pipe);
>  int igt_display_n_crtcs(igt_display_t *display);
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index 30d7c898f907..788ff911691d 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -73,7 +73,8 @@ static void test_init(data_t *data)
>  						 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> -	for (i =3D 0, n =3D 0; i < display->n_outputs && n < display->n_pipes; =
++i) {
> +	for (i =3D 0,
> +	     n =3D 0; i < display->n_outputs && n < igt_display_n_crtcs(display=
); ++i) {
>  		igt_output_t *output =3D &display->outputs[i];
>  		data->output[n] =3D output;
>=20=20
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index 9038b2ed9208..8d875a5b888f 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -51,7 +51,7 @@ typedef struct data {
>  static void test_init(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display;
> -	int i, n, max_pipes =3D display->n_pipes;
> +	int i, n, max_pipes =3D igt_display_n_crtcs(display);
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switc=
h.c
> index 57b2b98023f5..8b6b93d68df7 100644
> --- a/tests/amdgpu/amd_mode_switch.c
> +++ b/tests/amdgpu/amd_mode_switch.c
> @@ -88,7 +88,7 @@ static void run_mode_switch_first_last(data_t *data, in=
t num_pipes)
>=20=20
>  	test_init(data);
>=20=20
> -	igt_skip_on_f(num_pipes > igt_display_get_n_pipes(&data->display) ||
> +	igt_skip_on_f(num_pipes > igt_display_n_crtcs(&data->display) ||
>  			      num_pipes > data->display.n_outputs,
>  		      "ASIC does not have %d outputs/pipes\n", num_pipes);
>=20=20
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_m=
ultidisplay_modeset.c
> index a53cf668fb5c..4e97438ad978 100644
> --- a/tests/amdgpu/amd_multidisplay_modeset.c
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -235,7 +235,7 @@ static void multiple_display_test(struct data_t *data=
, enum sub_test test_mode)
>=20=20
>  	igt_info("Connected num_disps:%d\n", num_disps);
>=20=20
> -	igt_skip_on_f(num_disps > igt_display_get_n_pipes(&data->display) ||
> +	igt_skip_on_f(num_disps > igt_display_n_crtcs(&data->display) ||
>  			      num_disps > data->display.n_outputs,
>  		      "ASIC does not have %d outputs/pipes\n", num_disps);
>=20=20
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index 8bf776f35770..ad7d921d2aa3 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -152,7 +152,7 @@ enum test {
>  static void test_init(data_t *data)
>  {
>  	igt_display_t *display =3D &data->display;
> -	int i, n, max_pipes =3D display->n_pipes;
> +	int i, n, max_pipes =3D igt_display_n_crtcs(display);
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
> index 7d29bcf10d18..fca9d6036ca2 100644
> --- a/tests/amdgpu/amd_subvp.c
> +++ b/tests/amdgpu/amd_subvp.c
> @@ -73,7 +73,8 @@ static void test_init(struct data *data)
>  						     IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> -	for (i =3D 0, n =3D 0; i < display->n_outputs && n < display->n_pipes; =
++i) {
> +	for (i =3D 0,
> +	     n =3D 0; i < display->n_outputs && n < igt_display_n_crtcs(display=
); ++i) {
>  		igt_output_t *output =3D &display->outputs[i];
>=20=20
>  		data->output[n] =3D output;
> diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
> index 290f3e2e870f..5f58cfe699a4 100644
> --- a/tests/intel/gem_eio.c
> +++ b/tests/intel/gem_eio.c
> @@ -1034,7 +1034,7 @@ static void display_helper(igt_display_t *dpy, int =
*done)
>  		igt_output_t *output;
>  		int pipe;
>=20=20
> -		pipe =3D rand() % dpy->n_pipes;
> +		pipe =3D rand() % igt_display_n_crtcs(dpy);
>  		if (!dpy->pipes[pipe].valid)
>  			continue;
>  		output =3D igt_get_single_output_for_pipe(dpy, pipe);
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 75b98f149665..9100dd329e30 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -119,7 +119,7 @@ static drmModeModeInfo test_mode[] =3D {
>  static void test_init(data_t *data, bool physical)
>  {
>  	igt_display_t *display =3D &data->display;
> -	int i, max_pipes =3D display->n_pipes;
> +	int i, max_pipes =3D igt_display_n_crtcs(display);
>  	igt_output_t *output;
>  	data->connected_outputs =3D 0;
>=20=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 63175fe4c8f5..ec35992bac6a 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -287,7 +287,7 @@ static void stress(igt_display_t *display,
>  	arg.handle =3D kmstest_dumb_create(display->drm_fd, 64, 64, 32, NULL, N=
ULL);
>=20=20
>  	if (pipe < 0) {
> -		num_crtcs =3D display->n_pipes;
> +		num_crtcs =3D igt_display_n_crtcs(display);
>  		for_each_pipe(display, n) {
>  			arg.crtc_id =3D crtc_id[n] =3D display->pipes[n].crtc_id;
>  			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index f50ac5f17a76..d6f5eda7d841 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -513,7 +513,7 @@ static void override_edid(data_t *data)
>  	int num_outputs =3D 0;
>  	int num_tiles =3D 0;
>=20=20
> -	igt_require(data->display.n_pipes >=3D 2);
> +	igt_require(igt_display_n_crtcs(&data->display) >=3D 2);
>=20=20
>  	for_each_connected_output(&data->display, output) {
>  		drmModeModeInfo *mode =3D igt_output_get_mode(output);
> @@ -530,7 +530,7 @@ static void override_edid(data_t *data)
>=20=20
>  	igt_require(num_outputs >=3D 2);
>=20=20
> -	num_tiles =3D min(num_outputs, data->display.n_pipes);
> +	num_tiles =3D min(num_outputs, igt_display_n_crtcs(&data->display));
>=20=20
>  	/* disable everything so that we are sure to get a full modeset */
>  	igt_display_reset(&data->display);

--=20
Jani Nikula, Intel
