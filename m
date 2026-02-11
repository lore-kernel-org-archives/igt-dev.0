Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7506CEA3F27
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2614A10E029;
	Wed, 11 Feb 2026 09:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAgiajra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B017E10E029
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770803266; x=1802339266;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=9OAQsw0B6E+a5Hts8wdh/Z4OQullNNra4lOSQi8leyI=;
 b=DAgiajra3hU2YXPWsXxTJwJifC2uRG9JkE9hqDCO6uEpw/RePLgyE2ZJ
 TwJhH+Y1nsiRzg3e9+Rqer53xlZ/1BiX/dVbW3ApwICylWIA3sCnOsopy
 NHSuEhfsXs1ROvHb+xcnKhgQz/g5gBkI9c1hIGbpjQCeCfQ1I/DVsLiGe
 jSpCM7+C3OMI5tN9AoNO8RTx1Fo2HepFFZcp+zZKk/Z5DMKteNdwqNfuh
 7OAIytL+M9efV3PD5OP3ZKnZIuboK1u9gmWYHTErRVebRNQJ7gcgexdJG
 Ed4Ll56JHqNPnK+2cK76p89MLzuP3QbmFJ+gB3n3AUMxR8LQ3GTZQkzpu A==;
X-CSE-ConnectionGUID: i2VwVxrZSSCkkZb0PqUGAA==
X-CSE-MsgGUID: 3OfMrNi+RsyViTVcJPTFOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71848619"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71848619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:47:45 -0800
X-CSE-ConnectionGUID: VoOEbprmRwSvTMjOhe6m7w==
X-CSE-MsgGUID: fepNZHz7R265rN0Uf2DR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211599566"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:47:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] tests/kms: Pull igt_crtc_for_pipe() calls
 earlier, when dealing with planes
In-Reply-To: <20260210161016.29459-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
 <20260210161016.29459-5-ville.syrjala@linux.intel.com>
Date: Wed, 11 Feb 2026 11:47:40 +0200
Message-ID: <c1b6e362097748f87c9c89b97c74e09d03cce308@intel.com>
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

On Tue, 10 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Do the igt_crtc_for_pipe() calls as early as possible.
> In this case we specifically deal witht the case where

*with

> the local 'crtc' variable is populated via a plane->crtc
> pointer.
>
> This can make subsequent cocci cleanups around
> igt_crtc_for_pipe() usage a bit easier.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
>  #include "scripts/iterators.cocci"
>
> @@
> typedef igt_display_t;
> identifier DISPLAY;
> expression DISPLAY2, E;
> @@
> igt_display_t* DISPLAY =3D E;
> <+...
> igt_crtc_for_pipe(
> - DISPLAY2
> + DISPLAY
>   ,...)
> ...+>
>
> @find_1@
> identifier FUNC, DISPLAY, PIPE, CRTC, PLANE;
> expression E;
> @@
> FUNC(..., enum pipe PIPE, ...)
> {
> ...
> igt_display_t *DISPLAY =3D E;
> ...
> igt_crtc_t *CRTC;
> ...
> PLANE =3D igt_output_get_plane_type(...);
> ...
> CRTC =3D PLANE->crtc;
> ...
> }
>
> @change_1 depends on find_1@
> identifier find_1.FUNC, find_1.DISPLAY, find_1.PIPE, find_1.CRTC, find_1.=
PLANE;
> expression find_1.E;
> @@
> FUNC(..., enum pipe PIPE, ...)
> {
> ...
> igt_display_t *DISPLAY =3D E;
> + igt_crtc_t *CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE);
> ...
> - igt_crtc_t *CRTC;
> <+...
> (
> - CRTC =3D PLANE->crtc;
> |
> - igt_crtc_for_pipe(DISPLAY, PIPE)
> + CRTC
> )
> ...+>
> }
>
> @@
> identifier CRTC;
> @@
> - igt_crtc_t *CRTC =3D CRTC;
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_concurrent.c     | 5 ++---
>  tests/kms_plane_multiple.c | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 572d61d831d3..81f3944c29f6 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -158,8 +158,8 @@ prepare_planes(data_t *data, enum pipe pipe, int max_=
planes,
>  	       igt_output_t *output)
>  {
>  	igt_display_t *display =3D &data->display;
> +	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe);
>  	drmModeModeInfo *mode;
> -	igt_crtc_t *crtc;
>  	igt_plane_t *primary;
>  	int *x;
>  	int *y;
> @@ -167,10 +167,9 @@ prepare_planes(data_t *data, enum pipe pipe, int max=
_planes,
>  	int i;
>  	int format, modifier;
>=20=20
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
> +	igt_output_set_crtc(output, crtc);
>=20=20
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	crtc =3D primary->crtc;
>=20=20
>  	x =3D malloc(crtc->n_planes * sizeof(*x));
>  	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n",
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 624c1d42efb9..105ea50d464e 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -206,8 +206,8 @@ prepare_planes(data_t *data, enum pipe pipe_id, color=
_t *color, igt_plane_t **pl
>  	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_=
t *fb)
>  {
>  	igt_display_t *display =3D &data->display;
> +	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, pipe_id);
>  	drmModeModeInfo *mode;
> -	igt_crtc_t *crtc;
>  	igt_plane_t *primary;
>  	int *x;
>  	int *y;
> @@ -216,9 +216,8 @@ prepare_planes(data_t *data, enum pipe pipe_id, color=
_t *color, igt_plane_t **pl
>  	int* suffle;
>=20=20
>  	igt_output_set_crtc(output,
> -			    igt_crtc_for_pipe(display, pipe_id));
> +			    crtc);
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	crtc =3D primary->crtc;
>=20=20
>  	x =3D malloc(crtc->n_planes * sizeof(*x));
>  	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n",

--=20
Jani Nikula, Intel
