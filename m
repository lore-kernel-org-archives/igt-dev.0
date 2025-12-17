Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E43D66B9A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 19:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5709F10E93E;
	Wed, 17 Dec 2025 19:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a77o84CW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119FE10E92A
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765998769; x=1797534769;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=EVyRblLm387zjhjPS2Do561Ee9RzVcVIIMfe5pY2RVM=;
 b=a77o84CWYRPV70zD6ggdZksvwK5v7T+aoGoz0ppyO2SWJlxA4CbUf8T1
 3w8Ky1igpPwQF/qqFgERvTETB02EDjYrtPZ86HJJG4VYIys/8wYWy3FJ0
 2pqoSo2sxaRhBLy2gz9/CNUHLSyd5v3HHxuykulatVJdlO3B3T38aKEdq
 er8YHdMRVkPT4WowgFpvdtTKVkgdAZtjvv8cG7GavFiGe7nW3sNx6NFNB
 ZKVaAidZGeCZTahL8wBo7lt6tV7cjzYSKWJmk9B71wI2zIGk7szuroj9m
 3Jde2ks0lAyhEvmboGpUIbItbDOibqMbx640W3o9tkaRjzOXgWqRxw5rB w==;
X-CSE-ConnectionGUID: FUImXdyfSeyeraAjfxZaHg==
X-CSE-MsgGUID: KgkPegYWQXiH9gqWm/mDKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67827361"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67827361"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:12:49 -0800
X-CSE-ConnectionGUID: BjuDYjhdTsqvjiV9xeegvA==
X-CSE-MsgGUID: m6r1XgHGQ0avRN9yo6t0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="229426268"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:12:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/11] lib/kms: Nuke 'last_plane' from
 igt_crtc_init()
In-Reply-To: <20251217153758.9369-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-4-ville.syrjala@linux.intel.com>
Date: Wed, 17 Dec 2025 21:12:44 +0200
Message-ID: <f0a0d9e3a127c43fdfcc004953a072813374bf66@intel.com>
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

On Wed, 17 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> 'last_plane' is just 'pipe->n_planes - 1'. Remvoe the redundant

*Remove

> variable.
>
> Having less variables around will help with carving up

Nitpick, *fewer ;)

> igt_crtc_init() further.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 082934e4e216..72c91fb5da76 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3059,7 +3059,6 @@ static void igt_crtc_init(igt_display_t *display,
>  	igt_plane_t *plane;
>  	int p =3D 1, crtc_mask =3D 0;
>  	int j, type;
> -	uint8_t last_plane =3D 0;
>=20=20
>  	pipe->display =3D display;
>  	pipe->plane_cursor =3D -1;
> @@ -3085,7 +3084,6 @@ static void igt_crtc_init(igt_display_t *display,
>  	pipe->planes =3D calloc(pipe->n_planes, sizeof(igt_plane_t));
>  	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
>  		     pipe->n_planes);
> -	last_plane =3D pipe->n_planes - 1;
>=20=20
>  	/* add the planes that can be used with that pipe */
>  	for (j =3D 0; j < display->n_planes; j++) {
> @@ -3103,9 +3101,9 @@ static void igt_crtc_init(igt_display_t *display,
>  			pipe->plane_primary =3D 0;
>  			pipe->num_primary_planes++;
>  		} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor =3D=
=3D -1) {
> -			plane =3D &pipe->planes[last_plane];
> -			plane->index =3D last_plane;
> -			pipe->plane_cursor =3D last_plane;
> +			plane =3D &pipe->planes[pipe->n_planes - 1];
> +			plane->index =3D pipe->n_planes - 1;
> +			pipe->plane_cursor =3D pipe->n_planes - 1;
>  			display->has_cursor_plane =3D true;
>  		} else {
>  			/*
> @@ -3147,7 +3145,7 @@ static void igt_crtc_init(igt_display_t *display,
>=20=20
>  	/* Check that we filled every slot exactly once */
>  	if (display->has_cursor_plane)
> -		igt_assert_eq(p, last_plane);
> +		igt_assert_eq(p, pipe->n_planes - 1);
>  	else
>  		igt_assert_eq(p, pipe->n_planes);
>  }

--=20
Jani Nikula, Intel
