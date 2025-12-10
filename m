Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE50D3C912
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8432F10E73F;
	Wed, 10 Dec 2025 14:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTGxzKZ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F8B10E73F
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765377303; x=1796913303;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=PHRIkPd+DpnhPHZLqy44H6WO3L6iLhDdtQpimXow5co=;
 b=DTGxzKZ1u3ab8Lt0lBA0uFsHTDKlmjyQbnqSJB54AfOkxW/AqTafruvC
 a9fSwKPh5l7wvGn8tNeHIywyoNE7p5xg5EAk31qavWgwMCiIPZniOnStJ
 ZjzQDwMw++pIsrsQJTBUoL8yDiHCuAH3lOvdq/aiCd8qMfmX2Jm4Oavot
 HCQqkZwQ/DrZSqFxnc5QmEawkph82jz6nbbp88QkZ95FASCEIU9Tsa6+2
 ++9Jzh/pdJt/pLFAJs0tZhGJaZ5zVJJYmOlIR/gqLARYtXtdGkHGp/6/o
 lhU+8OEoPfGq6IbQ3P3M4jG1NN1YRSIttYYVn0QKDykNWm0Cbig/KD004 w==;
X-CSE-ConnectionGUID: peBDYXyvTgmF25xnVBnN4Q==
X-CSE-MsgGUID: jpycL6/BTxul1ONW0iHTdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69935320"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="69935320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:35:02 -0800
X-CSE-ConnectionGUID: l0fww5UgQce7jhNom06PKw==
X-CSE-MsgGUID: w2u9cFSqQg2b+Pbxq8Wuwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="197319682"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:35:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/10] lib/kms: Introduce igt_output_set_crtc()
In-Reply-To: <20251210093903.15934-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-9-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:34:58 +0200
Message-ID: <d1e219d0430f467035ee6ff53cdebba072d85695@intel.com>
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
> Introduce igt_output_set_crtc() as the intended replacement for
> igt_output_set_pipe().
>
> One step towards using 'crtcs' instead of 'pipes'.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c | 44 +++++++++++++++++++++++++++++++-------------
>  lib/igt_kms.h |  1 +
>  2 files changed, 32 insertions(+), 13 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3b71cee61635..40c521b3a331 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5277,31 +5277,35 @@ int igt_output_preferred_vrefresh(igt_output_t *o=
utput)
>  		return 60;
>  }
>=20=20
> +static const char *igt_crtc_name(igt_pipe_t *crtc)
> +{
> +	if (crtc =3D=3D NULL)
> +		return "None";
> +
> +	return kmstest_pipe_name(crtc->pipe);
> +}
> +
>  /**
> - * igt_output_set_pipe:
> + * igt_output_set_crtc:
>   * @output: Target output for which the pipe is being set to
> - * @pipe: Display pipe to set to
> + * @pipe_obj: CRTC to set to
>   *
> - * This function sets a @pipe to a specific @output connector by
> - * setting the CRTC_ID property of the @pipe. The pipe
> - * is only activated for all pipes except PIPE_NONE.
> + * This function sets a @crtc to a specific @output connector by
> + * setting the CRTC_ID property of the @crtc.
>   */
> -void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
> +void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj)
>  {
>  	igt_display_t *display =3D output->display;
> -	igt_pipe_t *old_pipe =3D NULL, *pipe_obj =3D NULL;;
> +	igt_pipe_t *old_pipe =3D NULL;
>=20=20
>  	igt_assert(output->name);
>=20=20
>  	if (output->pending_pipe !=3D PIPE_NONE)
>  		old_pipe =3D igt_output_get_driving_pipe(output);
>=20=20
> -	if (pipe !=3D PIPE_NONE)
> -		pipe_obj =3D igt_crtc_for_pipe(display, pipe);
> -
>  	LOG(display, "%s: set_pipe(%s)\n", igt_output_name(output),
> -	    kmstest_pipe_name(pipe));
> -	output->pending_pipe =3D pipe;
> +	    igt_crtc_name(pipe_obj));
> +	output->pending_pipe =3D pipe_obj ? pipe_obj->pipe : PIPE_NONE;
>=20=20
>  	if (old_pipe) {
>  		igt_output_t *old_output;
> @@ -5318,7 +5322,7 @@ void igt_output_set_pipe(igt_output_t *output, enum=
 pipe pipe)
>  	}
>=20=20
>  	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID,
> -				  pipe =3D=3D PIPE_NONE ? 0 : igt_crtc_for_pipe(display, pipe)->crtc=
_id);
> +				  pipe_obj ? pipe_obj->crtc_id : 0);
>=20=20
>  	igt_output_refresh(output);
>=20=20
> @@ -5332,6 +5336,20 @@ void igt_output_set_pipe(igt_output_t *output, enu=
m pipe pipe)
>  	}
>  }
>=20=20
> +/**
> + * igt_output_set_pipe:
> + * @output: Target output for which the pipe is being set to
> + * @pipe_obj: Display pipe to set to
> + *
> + * This function sets a @pipe to a specific @output connector by
> + * setting the CRTC_ID property of the @pipe. The pipe
> + * is only activated for all pipes except PIPE_NONE.
> + */
> +void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
> +{
> +	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));

How does that work for the igt_output_set_pipe(output, PIPE_NONE) calls?
Seems like the idea was to pass NULL here? Or should igt_crtc_for_pipe()
handle PIPE_NONE and return NULL?

> +}
> +
>  static
>  bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
>  						  igt_output_t *outputs[IGT_MAX_PIPES],
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a9d2d9027ae8..9ec0f08ada24 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -589,6 +589,7 @@ drmModeModeInfo *igt_output_get_highres_mode(igt_outp=
ut_t *output);
>  drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
>  void igt_output_override_mode(igt_output_t *output, const drmModeModeInf=
o *mode);
>  int igt_output_preferred_vrefresh(igt_output_t *output);
> +void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj);
>  void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
>  igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
>  igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_t=
ype);

--=20
Jani Nikula, Intel
