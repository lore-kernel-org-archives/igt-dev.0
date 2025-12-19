Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE1FD767FC
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C94610EF24;
	Fri, 19 Dec 2025 12:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8OM0TqK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC3210EF24
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766146097; x=1797682097;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=PdPtCiDM3Eb8RO8O+1ZmbQyVhULwvka2JyX+NW2cQmU=;
 b=a8OM0TqKeOEYGaCJ31OFF4j2u0JaI0Qs/sE1JETUi4oo/4BOryXxeAh/
 3siQSce8+bORRiXFFZKHi80M+TwYYOMYMKdGHUlugfZ2EXKqZT3EBVyCE
 Itsvo7+zH3TIokMg7hmm06E3BSw8wUllHELPyCUTLnE2HaWOadS9wZRuK
 9cdNUKjATZPdTddAoToZXx8HCiEGIHulKtabQQi8lbjFLbA/+EVugZKvS
 kKX0wt30a3Pte4bbP+EShEBTWb9fBo2Sm88OZAeoxpQGOXSpNK78ec030
 +KO0AowrE1u+N8LW7IAO+0kPERgdCOdkrJ5b4vYLGq1kTwTu8TLNlhQtN Q==;
X-CSE-ConnectionGUID: 0NsNW79+RTKrDfvX6/LpyA==
X-CSE-MsgGUID: OEjL9R1vQLOFHZSRrD/bBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78740806"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78740806"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:08:17 -0800
X-CSE-ConnectionGUID: jYED//BuTtS4oIhS5hmjjQ==
X-CSE-MsgGUID: Udkh4CaKSaqkqJ2Op1QD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199103296"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.34])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:08:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/11] lib/kms: Extract plane_type_index()
In-Reply-To: <20251217153758.9369-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-11-ville.syrjala@linux.intel.com>
Date: Fri, 19 Dec 2025 14:08:12 +0200
Message-ID: <d75a4fdfa64ee88cb899c2aea556eb70c3418c0c@intel.com>
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
> Extract the duplicated plane_type->index stuff into a helper.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 69a430f01e21..4f30732bf1bb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3055,6 +3055,18 @@ void igt_display_reset_outputs(igt_display_t *disp=
lay)
>  	drmModeFreeResources(resources);
>  }
>=20=20
> +static int plane_type_index(igt_crtc_t *crtc, int type)
> +{
> +	switch (type) {
> +	case DRM_PLANE_TYPE_PRIMARY:
> +		return 0;
> +	case DRM_PLANE_TYPE_CURSOR:
> +		return crtc->n_planes - 1;
> +	default:
> +		return -1;
> +	}
> +}
> +
>  static void igt_crtc_plane_init(igt_display_t *display,
>  				igt_crtc_t *pipe,
>  				drmModeRes *resources,
> @@ -3063,15 +3075,11 @@ static void igt_crtc_plane_init(igt_display_t *di=
splay,
>  	drmModePlane *drm_plane =3D global_plane->drm_plane;
>  	int type =3D global_plane->type;
>  	igt_plane_t *plane;
> -	int index;
> -
> -	if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->planes[0].index < 0) {
> -		index =3D 0;
> +	int index =3D plane_type_index(pipe, type);
>=20=20
> +	if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->planes[index].index < 0=
) {
>  		pipe->num_primary_planes++;
> -	} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->planes[pipe->n_pl=
anes - 1].index < 0) {
> -		index =3D pipe->n_planes - 1;
> -
> +	} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->planes[index].ind=
ex < 0) {
>  		display->has_cursor_plane =3D true;
>  	} else {
>  		for (index =3D 1; index < pipe->n_planes; index++) {
> @@ -3572,10 +3580,8 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *p=
ipe, int plane_type)
>=20=20
>  	switch(plane_type) {
>  	case DRM_PLANE_TYPE_CURSOR:
> -		plane_idx =3D pipe->n_planes - 1;
> -		break;
>  	case DRM_PLANE_TYPE_PRIMARY:
> -		plane_idx =3D 0;
> +		plane_idx =3D plane_type_index(pipe, plane_type);
>  		break;
>  	case DRM_PLANE_TYPE_OVERLAY:
>  		for(i =3D 0; i < pipe->n_planes; i++)

--=20
Jani Nikula, Intel
