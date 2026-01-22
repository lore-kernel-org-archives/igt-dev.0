Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BB7D3EE6B
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 14:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C55E10E02D;
	Thu, 22 Jan 2026 14:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgaC28Oz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489B910E02D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769093027; x=1800629027;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=mync8QzPDxuYa2XoAGdpqEB301j+ICWZdVEeRnmiOKg=;
 b=SgaC28OzHZYKHBKlIqvavy7FFaeNYTRSoL4GS+sZbpyy4jck94avZ3to
 STHaXOME4CDdaujCfXBht6/gw1KXzDJ5vVkMyuFwZimcCzvolBoSC1X9R
 ViNbpidXHRCnZJ0AzzwkXpfoPgG4Kb0KpyOGNICsZqRVm6QmUL7IIbuvI
 2u3MybTuXNu6Vf4oAcwBkPrmmyDc0ovj0APYnrQJ4qF/3HHva+WYaFYO+
 tUEkM//JXy6bGU6F6vaNvZRWHajyXo+aHk3kCu83k7BMLXimrG3shDoBa
 n9rnwzgpVRVJNv6vkcwJlk7VOcWvwF1g94STt8lfNsh1I/FNVPBFdYh1U g==;
X-CSE-ConnectionGUID: 5LwrMdGTScWA57ZT71SMTA==
X-CSE-MsgGUID: pz/1SUqQQouvG43L4Iv4Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70306760"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70306760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:43:46 -0800
X-CSE-ConnectionGUID: HnVxoSIjSZS1d/PsnZAujw==
X-CSE-MsgGUID: 2UqSADpBQV2Pa1C6mOyupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="207185445"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 06:43:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/10] lib/kms: Rename display->pipes[] to
 display->crtcs[]
In-Reply-To: <20260122125937.10807-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-6-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 16:43:41 +0200
Message-ID: <262b96287fb014b226afa3f7a6c7bfa703208478@intel.com>
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

On Thu, 22 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> display->pipes[] actually contains igt_crtc_t's, so
> rename it to display->crtcs[] to match.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> @@
> struct igt_display {
> 	...
> -	igt_crtc_t *pipes;
> +	igt_crtc_t *crtcs;
> 	...
>  };
>
> @@
> typedef igt_display_t;
> igt_display_t *S;
> @@
> - S->pipes
> + S->crtcs
>
> @@
> typedef igt_display_t;
> igt_display_t S;
> @@
> - S.pipes
> + S.crtcs
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c                     | 9 +++++----
>  lib/igt_kms.h                     | 4 ++--
>  tests/amdgpu/amd_cursor_overlay.c | 2 +-
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6f29a419b42d..30b237263e91 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3219,9 +3219,10 @@ void igt_display_require(igt_display_t *display, i=
nt drm_fd)
>  		     resources->count_crtcs, IGT_MAX_PIPES);
>=20=20
>  	display->n_crtcs =3D IGT_MAX_PIPES;
> -	display->pipes =3D calloc(igt_display_n_crtcs(display),
> +	display->crtcs =3D calloc(igt_display_n_crtcs(display),
>  				sizeof(igt_crtc_t));
> -	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n",
> +	igt_assert_f(display->crtcs,
> +		     "Failed to allocate memory for %d pipes\n",

A manual touch-up could switch the error message s/pipes/CRTCs/.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>  		     igt_display_n_crtcs(display));
>=20=20
>  	for (i =3D 0; i < resources->count_crtcs; i++) {
> @@ -3485,8 +3486,8 @@ void igt_display_fini(igt_display_t *display)
>=20=20
>  	free(display->outputs);
>  	display->outputs =3D NULL;
> -	free(display->pipes);
> -	display->pipes =3D NULL;
> +	free(display->crtcs);
> +	display->crtcs =3D NULL;
>  	free(display->planes);
>  	display->planes =3D NULL;
>  	free(display->colorops);
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 73a907a2e474..0fbbeca754c8 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -533,7 +533,7 @@ struct igt_display {
>  	igt_output_t *outputs;
>  	igt_plane_t *planes;
>  	igt_colorop_t *colorops;
> -	igt_crtc_t *pipes;
> +	igt_crtc_t *crtcs;
>  	bool has_cursor_plane;
>  	bool is_atomic;
>  	bool has_virt_cursor_plane;
> @@ -581,7 +581,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_displ=
ay_t *display, enum pipe pi
>  	if (pipe =3D=3D PIPE_NONE)
>  		return NULL;
>=20=20
> -	return &display->pipes[pipe];
> +	return &display->crtcs[pipe];
>  }
>=20=20
>  typedef struct _igt_pipe_crc igt_pipe_crc_t;
> diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_=
overlay.c
> index e500d9e34066..5c7dcb197b44 100644
> --- a/tests/amdgpu/amd_cursor_overlay.c
> +++ b/tests/amdgpu/amd_cursor_overlay.c
> @@ -138,7 +138,7 @@ static void test_init(data_t *data, enum pipe pipe_id=
, igt_output_t *output,
>=20=20
>  	data->pipe_id =3D pipe_id;
>  	data->available_overlay_planes =3D available_overlay_planes;
> -	data->pipe =3D &data->display.pipes[data->pipe_id];
> +	data->pipe =3D &data->display.crtcs[data->pipe_id];
>  	data->output =3D output;
>  	data->mode =3D igt_output_get_mode(data->output);
>  	data->primary =3D igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PR=
IMARY);

--=20
Jani Nikula, Intel
