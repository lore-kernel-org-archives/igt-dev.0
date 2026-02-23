Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39630EA4FAD
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 11:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CF710E2E5;
	Mon, 23 Feb 2026 11:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghUpOaSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F9210E2E5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 11:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771847389; x=1803383389;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=pYhzdsW+EYOYYXLf4XQPuPizim7XzKGlRpy173ul0uk=;
 b=ghUpOaSzqp9X+F108xmJO+zMMcdtji9BoLC6UKLhmDAHFcKYW91+G0KB
 WaG9Er4cejloStulj1kE6HVdOOMKmCWyqtzyGcknFJ3NIVIgQ78B/8Jb3
 DpXxN4+DD+DPHNPp91Ac5JlL5LhEq1z0edY9JLbsHufqypn3fFFsNEchT
 /94LukqUiEyFdSEtgdVWvgXR9t2hUegehu8ifDAMuOAHTa15Hfldkv8PZ
 fKKlMy0ubXt8QQI41hQA6EWO3cmDun84HD2AGZGNufAnMoLhowdvBP2hG
 D9EpfGZbJD/FQ2NeNJYh3SmjAxDlijH17H+2qamBbB2hddLbpKWDf/FA2 g==;
X-CSE-ConnectionGUID: e50VCF92RvOYeGgxol6GhA==
X-CSE-MsgGUID: aFaRt3lQTN2Zw2CPKGYCXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72543228"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72543228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:49:49 -0800
X-CSE-ConnectionGUID: +rMMQOqmRC+g1V5NbRrwWg==
X-CSE-MsgGUID: 3XiNF7+NQgSZ5/44fH2eQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213912087"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:49:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 09/23] tests/kms_lease: Pass lease_t to
 prepare_crtc()
In-Reply-To: <20260221032003.30936-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-10-ville.syrjala@linux.intel.com>
Date: Mon, 23 Feb 2026 13:49:43 +0200
Message-ID: <09df69eaffab95572a2d37e6413033e11fc4e6ff@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> cleanup_crtc() gets passed the appropriate lease_t directly
> by the caller, but prepare_crtc() instead takes the same information
> as a boolean flag (and picks the appropriate lease_t based on that).
> Unify the approach to also pass the appropriate lease_t directly
> to prepare_crtc().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_lease.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 045cd62de0d7..9f7935e99902 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -147,10 +147,9 @@ static igt_output_t *connector_id_to_output(igt_disp=
lay_t *display, uint32_t con
>  	return igt_output_from_connector(display, &connector);
>  }
>=20=20
> -static int prepare_crtc(data_t *data, bool is_master)
> +static int prepare_crtc(data_t *data, lease_t *lease)
>  {
>  	drmModeModeInfo *mode;
> -	lease_t *lease =3D is_master ? &data->master : &data->lease;
>  	igt_display_t *display =3D &lease->display;
>  	igt_crtc_t *crtc =3D igt_crtc_for_crtc_id(display, data->crtc_id);
>  	igt_output_t *output =3D connector_id_to_output(display, data->connecto=
r_id);
> @@ -315,7 +314,7 @@ static void simple_lease(data_t *data)
>  	igt_display_require(&data->lease.display, data->lease.fd);
>=20=20
>  	/* Set a mode on the leased output */
> -	igt_assert_eq(0, prepare_crtc(data, false));
> +	igt_assert_eq(0, prepare_crtc(data, &data->lease));
>=20=20
>  	/* Paint something attractive */
>  	paint_fb(data->lease.fd, &data->lease.primary_fb, "simple-lease",
> @@ -364,7 +363,7 @@ static void page_flip_implicit_plane(data_t *data)
>  	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>=20=20
>  	/* Set a mode on the leased output */
> -	igt_assert_eq(0, prepare_crtc(data, true));
> +	igt_assert_eq(0, prepare_crtc(data, &data->master));
>=20=20
>  	/* sanity check */
>  	do_or_die(drmModePageFlip(data->master.fd, data->crtc_id,
> @@ -436,7 +435,7 @@ static void setcrtc_implicit_plane(data_t *data)
>  	}
>=20=20
>  	/* Set a mode on the leased output */
> -	igt_assert_eq(0, prepare_crtc(data, true));
> +	igt_assert_eq(0, prepare_crtc(data, &data->master));
>=20=20
>  	/* sanity check */
>  	ret =3D drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
> @@ -477,7 +476,7 @@ static void cursor_implicit_plane(data_t *data)
>  	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>=20=20
>  	/* Set a mode on the leased output */
> -	igt_assert_eq(0, prepare_crtc(data, true));
> +	igt_assert_eq(0, prepare_crtc(data, &data->master));
>=20=20
>  	/* sanity check */
>  	do_or_die(drmModeSetCursor(data->master.fd, data->crtc_id, 0, 0, 0));
> @@ -788,7 +787,7 @@ static void lease_revoke(data_t *data)
>  	igt_assert_eq(revoke_lease(data->master.fd, &mrl), 0);
>=20=20
>  	/* Try to use the leased objects */
> -	ret =3D prepare_crtc(data, false);
> +	ret =3D prepare_crtc(data, &data->lease);
>=20=20
>  	/* Ensure that the expected error is returned */
>  	igt_assert_eq(ret, -ENOENT);

--=20
Jani Nikula, Intel
