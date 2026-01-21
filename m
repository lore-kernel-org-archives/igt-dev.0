Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD66BC44501
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 08:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AA410E712;
	Wed, 21 Jan 2026 08:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qu8KiUb8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B0710E71E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 08:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768985852; x=1800521852;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=8YP6Doc1pM6+I34omHREf6AuH+f6gIKRWc/3IvBd36M=;
 b=Qu8KiUb8ofR2oGoxDcPXn4OPAUXamVN2LZJqzACEFbFibuKUDevc+Ikk
 pppPB+BOxR/kNcj3T7N1mPd7Uyz4rjahdfCxb/A5Su3CF5pWZxJ5Byj7h
 cQ2NaLaqS0w3N3G93M3ACRtbo1nbCTNDIU4K/2FvHigGjoA4hSSWy2lDE
 eH5L8WdFsa7tqKbMHOcvrqn87O2kypZZC6X7B/R0IJXLG9T9HOrg+V8a2
 HoxWgVe7lnIdB5BnjnuSjuJyujnb9sxw7emx5oDThz/s3wN6sbh01VYk3
 /v9NJY/uBoCq51VNwfrLb5HycXfu1L0wR/ipc4BNsj9BilP2YLNpBKJ7a g==;
X-CSE-ConnectionGUID: mstxM3BvSNufZ6aMLX1Hyg==
X-CSE-MsgGUID: u9r2qZGZQDyramqq+CKROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70114236"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70114236"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:57:31 -0800
X-CSE-ConnectionGUID: aqNPagQcSJGitTSuCgeCNA==
X-CSE-MsgGUID: 6+qyZHhXRp+/tmxsoSUXKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206448179"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:57:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/12] lib/kms: Pass igt_crtc_t to igt_pipe_refresh()
In-Reply-To: <20260120171656.15840-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-4-ville.syrjala@linux.intel.com>
Date: Wed, 21 Jan 2026 10:57:25 +0200
Message-ID: <09ebb9c8bbf7b8bc23f3af7de744cb90c872b990@intel.com>
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

On Tue, 20 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Pass the igt_crtc_t instead of the pipe to
> igt_pipe_refresh(). One step towards eliminating
> pipe usage from tests.
>
> Done with cocci (with manual fixup for docs):
>  #include "scripts/iterators.cocci"
>
> @@
> typedef igt_display_t;
> typedef igt_crtc_t;
> identifier DISPLAY, PIPE, CRTC;
> expression E;
> @@
> igt_pipe_refresh(
> -	igt_display_t *DISPLAY, enum pipe PIPE
> +	igt_crtc_t *CRTC
> 	,...)
> {
> ...
> - igt_crtc_t *CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE);
> + igt_display_t *DISPLAY =3D CRTC->display;
> ...
> }
>
> @@
> expression DISPLAY, PIPE;
> @@
> igt_pipe_refresh(
> -	DISPLAY, PIPE
> +	igt_crtc_for_pipe(DISPLAY, PIPE)
> 	,...)
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c                    | 9 ++++-----
>  lib/igt_kms.h                    | 2 +-
>  tests/intel/kms_busy.c           | 2 +-
>  tests/kms_atomic_interruptible.c | 2 +-
>  tests/kms_concurrent.c           | 2 +-
>  tests/kms_rmfb.c                 | 3 ++-
>  6 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d5436c4cdd2e..a7d259923932 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5465,19 +5465,18 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
>=20=20
>  /**
>   * igt_pipe_refresh:
> - * @display: a pointer to an #igt_display_t structure
> - * @pipe: Pipe to refresh
> + * @pipe_obj: CRTC to refresh
>   * @force: Should be set to true if mode_blob is no longer considered
>   * to be valid, for example after doing an atomic commit during fork or =
closing display fd.
>   *
> - * Requests the pipe to be part of the state on next update.
> + * Requests the CRTC to be part of the state on next update.
>   * This is useful when state may have been out of sync after
>   * a fork, or we just want to be sure the pipe is included
>   * in the next commit.
>   */
> -void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force)
> +void igt_pipe_refresh(igt_crtc_t *pipe_obj, bool force)
>  {
> -	igt_crtc_t *pipe_obj =3D igt_crtc_for_pipe(display, pipe);
> +	igt_display_t *display =3D pipe_obj->display;
>=20=20
>  	if (force && display->is_atomic) {
>  		igt_output_t *output =3D igt_pipe_get_output(pipe_obj);
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f12baf94504e..5e3108f56e11 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1119,7 +1119,7 @@ extern void igt_crtc_set_prop_enum(igt_crtc_t *pipe,
>  extern void igt_crtc_replace_prop_blob(igt_crtc_t *pipe,
>  					   enum igt_atomic_crtc_properties prop,
>  					   const void *ptr, size_t length);
> -void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force=
);
> +void igt_pipe_refresh(igt_crtc_t *pipe_obj, bool force);
>=20=20
>  void igt_enable_connectors(int drm_fd);
>  void igt_reset_connectors(void);
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index c38d45dd020d..55ad6f19a905 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -161,7 +161,7 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
>  		gem_quiescent_gpu(dpy->drm_fd);
>=20=20
>  		/* Clear old mode blob. */
> -		igt_pipe_refresh(dpy, pipe, true);
> +		igt_pipe_refresh(igt_crtc_for_pipe(dpy, pipe), true);
>=20=20
>  		igt_output_set_crtc(output,
>  				    igt_crtc_for_pipe(output->display, pipe));
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interrup=
tible.c
> index b519fc635a54..090c0ead7a24 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -297,7 +297,7 @@ static void run_plane_test(igt_display_t *display, en=
um pipe pipe, igt_output_t
>=20=20
>  	/* The mode is unset by the forked helper, force a refresh here */
>  	if (test_type =3D=3D test_legacy_modeset || test_type =3D=3D test_atomi=
c_modeset)
> -		igt_pipe_refresh(display, pipe, true);
> +		igt_pipe_refresh(igt_crtc_for_pipe(display, pipe), true);
>=20=20
>  	igt_plane_set_fb(plane, NULL);
>  	igt_plane_set_fb(primary, NULL);
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 4ef8e0f56339..8198832727cc 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -233,7 +233,7 @@ test_plane_position_with_output(data_t *data, enum pi=
pe pipe, int max_planes,
>  	bool loop_forever =3D opt.iterations =3D=3D LOOP_FOREVER ? true : false;
>  	int ret;
>=20=20
> -	igt_pipe_refresh(&data->display, pipe, true);
> +	igt_pipe_refresh(igt_crtc_for_pipe(&data->display, pipe), true);
>=20=20
>  	i =3D 0;
>  	while (i < iterations || loop_forever) {
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index 4726d4745d58..774d011a0531 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -147,7 +147,8 @@ test_rmfb(struct rmfb_data *data, igt_output_t *outpu=
t, enum pipe pipe, bool reo
>  		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>  		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
>=20=20
> -		igt_pipe_refresh(&data->display, pipe, true);
> +		igt_pipe_refresh(igt_crtc_for_pipe(&data->display, pipe),
> +				 true);
>  	} else {
>  		igt_remove_fb(data->drm_fd, &fb);
>  		igt_remove_fb(data->drm_fd, &argb_fb);

--=20
Jani Nikula, Intel
