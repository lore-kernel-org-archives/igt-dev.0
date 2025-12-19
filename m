Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA82D767F5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FC810EF86;
	Fri, 19 Dec 2025 12:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hM8R67Pn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF2110EF85
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766146264; x=1797682264;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=bQ589q9DwO4U1eA7LUyDFRSHuL0loVHPhbmfT1NTZb0=;
 b=hM8R67PnKGkj5x+rGdPw9SFBgkKuo38hzGABDtPTbxH0oWc9I4hKhzoo
 T35G6bN82IMvCjzDSgxQ15oXlRpGb0v4Q3CPP/4W1CELfna3HleOMHyr2
 2zC7E7lpvnzbyEDppw37Kt7Bc92mtI2T4PNyWSljvrKjV3bBjFIlCz8XP
 kKX4nqtSTogUZTSxrLoJM05R+Umi7EV4nqgOEEfv268STCAPtREL3b7ba
 G7qlJ/BBIY5zbb3EWYkWZpdmNbF67QgU0NBikJLsiNE0ywIWqgql9AVTQ
 UNXBFegSZzp9on0FZu+W1YMBNJaDw+PqUziW7tNUog5mbiv92g8hw2IMu A==;
X-CSE-ConnectionGUID: 5vAKF6QFSK6JZzL+WoqzqA==
X-CSE-MsgGUID: 9fbpsikCT6W7FOp9GWm8zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67301877"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="67301877"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:10:51 -0800
X-CSE-ConnectionGUID: ZcYcriXoRUeGm95HjvBIpg==
X-CSE-MsgGUID: QhcUZdwZQda2xu02JTegew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199667480"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.34])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:10:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 11/11] lib/kms: Streamline plane index handling
 further
In-Reply-To: <20251217153758.9369-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-12-ville.syrjala@linux.intel.com>
Date: Fri, 19 Dec 2025 14:10:47 +0200
Message-ID: <64e9c557dd142be53110c82113fcbaaf8f65dd81@intel.com>
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
> Eliminate some redundant plane type checks and just rely
> on plane_type_index() knowing what it's doing.
>
> We do need to keep one plane type check to determing
> what to do with pipe->num_primary_plane and
> pipe->has_cursor_plane. But it's a bit more obvious
> what's happening there now that index stuff isn't mixed in.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c | 43 +++++++++++++++++++------------------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 4f30732bf1bb..04a86f235471 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3075,24 +3075,26 @@ static void igt_crtc_plane_init(igt_display_t *di=
splay,
>  	drmModePlane *drm_plane =3D global_plane->drm_plane;
>  	int type =3D global_plane->type;
>  	igt_plane_t *plane;
> -	int index =3D plane_type_index(pipe, type);
> +	int index;
>=20=20
> -	if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->planes[index].index < 0=
) {
> +	switch (type) {
> +	case DRM_PLANE_TYPE_PRIMARY:
>  		pipe->num_primary_planes++;
> -	} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->planes[index].ind=
ex < 0) {
> +		break;
> +	case DRM_PLANE_TYPE_CURSOR:
>  		display->has_cursor_plane =3D true;
> -	} else {
> +		break;
> +	default:
> +		break;
> +	}

Plain old if would be much shorter...

	if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
		pipe->num_primary_planes++;
	else if (type =3D=3D DRM_PLANE_TYPE_CURSOR)
		display->has_cursor_plane =3D true;

But *shrug*.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +
> +	index =3D plane_type_index(pipe, type);
> +
> +	if (index < 0 || pipe->planes[index].index >=3D 0) {
>  		for (index =3D 1; index < pipe->n_planes; index++) {
>  			if (pipe->planes[index].index < 0)
>  				break;
>  		}
> -
> -		/*
> -		 * Increment num_primary_planes for any extra
> -		 * primary plane found.
> -		 */
> -		if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> -			pipe->num_primary_planes++;
>  	}
>=20=20
>  	igt_assert_lt(index, pipe->n_planes);
> @@ -3576,20 +3578,13 @@ static igt_plane_t *igt_pipe_get_plane(igt_crtc_t=
 *pipe, int plane_idx)
>   */
>  igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
>  {
> -	int i, plane_idx =3D -1;
> +	int plane_idx =3D plane_type_index(pipe, plane_type);
>=20=20
> -	switch(plane_type) {
> -	case DRM_PLANE_TYPE_CURSOR:
> -	case DRM_PLANE_TYPE_PRIMARY:
> -		plane_idx =3D plane_type_index(pipe, plane_type);
> -		break;
> -	case DRM_PLANE_TYPE_OVERLAY:
> -		for(i =3D 0; i < pipe->n_planes; i++)
> -			if (pipe->planes[i].type =3D=3D DRM_PLANE_TYPE_OVERLAY)
> -			    plane_idx =3D i;
> -		break;
> -	default:
> -		break;
> +	if (plane_idx < 0) {
> +		for (plane_idx =3D 0; plane_idx < pipe->n_planes; plane_idx++) {
> +			if (pipe->planes[plane_idx].type =3D=3D plane_type)
> +				break;
> +		}
>  	}
>=20=20
>  	igt_require_f(plane_idx >=3D 0 && plane_idx < pipe->n_planes,

--=20
Jani Nikula, Intel
