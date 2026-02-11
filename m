Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8B9E81BD2
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D975910E09C;
	Wed, 11 Feb 2026 09:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDN9p/Ls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6505310E09C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770802833; x=1802338833;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=48/NzNluw9RE25EeD5fg1UE4XYMf4gJhWOGGsHQDRhQ=;
 b=WDN9p/LsvzKjjho2emQubcGOeyOFTkVsb4mmWnMW1PaXks22e5khOo+j
 JF/grZok5uUykq5SFz4KpVXLMPRl3At6BECzm+nhyBooNd80nq/4LhG3N
 gkg5Kkezn/nGbdfE3S2MdWiW+2YqW/LS2E6/UnKT7HDuAkfbF9VK8mAVm
 U+7Q0NuXDamnVxBotDSasr0i2pDsIGdj4ohpKgjUdSbOgGyNQU520VuWa
 T4CmXwttz50lwuw92ux8wpeUWjqh7kzHFGxpfuYxsYfyaAGXuzbNgKWp+
 wzxtX3/4gl298kFTuQ1DMPNnaIrLg0OPivqi8OgO350WryEwV6DojwCoX g==;
X-CSE-ConnectionGUID: scUx9d9sQ0a8qzm7AHjnag==
X-CSE-MsgGUID: UQ/s1c7mSSKyYhMk9NOW6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71988289"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71988289"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:40:33 -0800
X-CSE-ConnectionGUID: YQ0aswe3RCaRqy2luz4P+w==
X-CSE-MsgGUID: GEMR1QhzQi2mMDY+qN+C9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216361601"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:40:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/5] tests/kms: Pull the igt_crtc_for_pipe() call
 earlier
In-Reply-To: <20260210161016.29459-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
 <20260210161016.29459-4-ville.syrjala@linux.intel.com>
Date: Wed, 11 Feb 2026 11:40:28 +0200
Message-ID: <0dbfaa6381cd10c5041acbb0dd051761b4df0543@intel.com>
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
> Do the 'crtc =3D igt_crtc_for_pipe(...)' assignment
> as early as possible.
>
> This can make subsequent cocci cleanups around
> igt_crtc_for_pipe() usage a bit easier.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
>  #include "scripts/iterators.cocci"
>
> @@
> typedef igt_crtc_t;
> identifier FUNC, DISPLAY, PIPE, CRTC;
> expression E;
> @@
> FUNC(..., enum pipe PIPE, ...)
> {
> ...
> igt_display_t *DISPLAY =3D E;
> ...
> - igt_crtc_t *CRTC;
> + igt_crtc_t *CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE);
> <+... when !=3D PIPE =3D ...
> - CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE);
> ...+>
> }
>
> @@
> typedef igt_crtc_t;
> identifier DISPLAY, CRTC;
> constant PIPE;
> expression E;
> @@
> {
> ...
> igt_display_t *DISPLAY =3D E;
> ...
> - igt_crtc_t *CRTC;
> + igt_crtc_t *CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE);
> <+... when !=3D PIPE =3D ...
> - CRTC =3D igt_crtc_for_pipe(DISPLAY, PIPE);
> ...+>
> }
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/amdgpu/amd_assr.c                          | 4 +---
>  tests/chamelium/kms_chamelium_color.c            | 4 +---
>  tests/chamelium/kms_chamelium_sharpness_filter.c | 4 +---
>  tests/kms_color.c                                | 4 +---
>  tests/kms_color_pipeline.c                       | 4 +---
>  5 files changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
> index f6b39412d6ba..f02a30e8fea3 100644
> --- a/tests/amdgpu/amd_assr.c
> +++ b/tests/amdgpu/amd_assr.c
> @@ -161,14 +161,12 @@ static void present_visual_pattern(data_t *data, ig=
t_output_t *output)
>  {
>  	igt_display_t *display =3D &data->display;
>  	igt_plane_t *primary;
> -	igt_crtc_t *crtc;
> +	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, PIPE_A);
>  	drmModeModeInfo *mode;
>  	igt_fb_t fb;
>=20=20
>  	mode =3D igt_output_get_mode(output);
>  	igt_assert(mode);
> -
> -	crtc =3D igt_crtc_for_pipe(display, PIPE_A);
>  	primary =3D
>  		igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
>  	igt_output_set_crtc(output,
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_=
chamelium_color.c
> index 8f4e2ac29229..6bcf3226d858 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -452,13 +452,11 @@ prep_pipe(data_t *data, enum pipe p)
>  static int test_setup(data_t *data, enum pipe p)
>  {
>  	igt_display_t *display =3D &data->display;
> -	igt_crtc_t *crtc;
> +	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, p);
>  	int i =3D 0;
>=20=20
>  	igt_display_reset(&data->display);
>  	prep_pipe(data, p);
> -
> -	crtc =3D igt_crtc_for_pipe(display, p);
>  	igt_require(crtc->n_planes >=3D 0);
>=20=20
>  	data->primary =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/cha=
melium/kms_chamelium_sharpness_filter.c
> index d405e6311380..de8cf7fc1199 100644
> --- a/tests/chamelium/kms_chamelium_sharpness_filter.c
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -182,12 +182,10 @@ static void test_t(data_t *data, igt_plane_t *prima=
ry,
>  static int test_setup(data_t *data, enum pipe p)
>  {
>  	igt_display_t *display =3D &data->display;
> -	igt_crtc_t *crtc;
> +	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, p);
>  	int i =3D 0;
>=20=20
>  	igt_display_reset(&data->display);
> -
> -	crtc =3D igt_crtc_for_pipe(display, p);
>  	igt_require(crtc->n_planes >=3D 0);
>=20=20
>  	data->primary =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index aa65a70ab790..4f44997124a7 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -734,12 +734,10 @@ prep_pipe(data_t *data, enum pipe p)
>  static void test_setup(data_t *data, enum pipe p)
>  {
>  	igt_display_t *display =3D &data->display;
> -	igt_crtc_t *crtc;
> +	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, p);
>=20=20
>  	prep_pipe(data, p);
>  	igt_require_pipe_crc(data->drm_fd);
> -
> -	crtc =3D igt_crtc_for_pipe(display, p);
>  	igt_require(crtc->n_planes >=3D 0);
>=20=20
>  	data->primary =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index f0bf500af8bf..733ead1cd55c 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -49,11 +49,9 @@ static void test_cleanup(data_t *data)
>  static void test_setup(data_t *data, enum pipe p)
>  {
>  	igt_display_t *display =3D &data->display;
> -	igt_crtc_t *crtc;
> +	igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, p);
>=20=20
>  	igt_require_pipe_crc(data->drm_fd);
> -
> -	crtc =3D igt_crtc_for_pipe(display, p);
>  	igt_require(crtc);
>  	igt_require(crtc->n_planes > 0);

--=20
Jani Nikula, Intel
