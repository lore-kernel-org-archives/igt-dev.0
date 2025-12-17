Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F344D66B9A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 19:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2020F10E2C9;
	Wed, 17 Dec 2025 19:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPA2vyai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32F10E2C9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765999044; x=1797535044;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=bhX8vDZowplzh+2IAp9ThMPtXZWEMSFt5RDHUaXqFwY=;
 b=mPA2vyaiNGONYaa7qUnzq1aN2//86aoRQtf7AaOzFtZOYoW2KlOWVcVX
 TdLrzvh0ULENqzGaIiouU7tGIlhcHP/GUn6/g9O/aXHQ2U4U9dEsimyba
 6n5Naji6rJTJXmkP92bpg0ZPp550HAp7dydcyLLTkNgtHedAMoMD7Y/Fj
 DUATYNTE2njSmt4eSSng3T7U3WMgdX/20uGO9wMj+GkcAhFn0qlU16Leo
 q8VrrPMlmj3EfoU4GmUk3qOAwpvzZIyMGOoEL6mDQYL16fuWfWmXmVzw2
 LN4yxbdD3SNfM0aIhlrmNoniyuGtdTIhExTe7SKvSTls3L7RPgJ8jX7bR g==;
X-CSE-ConnectionGUID: hTzBzfNJRRSSm6KyqPR0Dg==
X-CSE-MsgGUID: 02aRem6OT9WfKqd/Tt1owQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78658931"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="78658931"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:17:24 -0800
X-CSE-ConnectionGUID: O6JdXMewQG6uPcpSWRWwAw==
X-CSE-MsgGUID: NPJ9OG45Ttue9mzwYiyWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="203474494"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.216])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:17:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/11] lib/kms: Get rid of the 'p' plane index
 variable
In-Reply-To: <20251217153758.9369-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-5-ville.syrjala@linux.intel.com>
Date: Wed, 17 Dec 2025 21:17:19 +0200
Message-ID: <6c4c2a0b6668ee81aed22bcfdd2afb09e2b8c342@intel.com>
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
> The 'p' thing used to track the next free plane slot is annoying.
> Get rid of it by just initializing the plane indexes to -1 to
> indicate a free slot at the start, and then do a straightforward
> search for the next free slot. And for good measure make sure all
> the -1's have disappeared at the end.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c | 45 ++++++++++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 72c91fb5da76..5679643e167a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3057,7 +3057,7 @@ static void igt_crtc_init(igt_display_t *display,
>  {
>  	igt_crtc_t *pipe =3D igt_crtc_for_pipe(display, i);
>  	igt_plane_t *plane;
> -	int p =3D 1, crtc_mask =3D 0;
> +	int crtc_mask =3D 0;
>  	int j, type;
>=20=20
>  	pipe->display =3D display;
> @@ -3082,13 +3082,16 @@ static void igt_crtc_init(igt_display_t *display,
>=20=20
>  	igt_assert_lt(0, pipe->n_planes);
>  	pipe->planes =3D calloc(pipe->n_planes, sizeof(igt_plane_t));
> -	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
> -		     pipe->n_planes);
> +	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",=
 pipe->n_planes);
> +
> +	for (j =3D 0 ; j < pipe->n_planes; j++)
> +		pipe->planes[j].index =3D -1;
>=20=20
>  	/* add the planes that can be used with that pipe */
>  	for (j =3D 0; j < display->n_planes; j++) {
>  		igt_plane_t *global_plane =3D &display->planes[j];
>  		drmModePlane *drm_plane =3D global_plane->drm_plane;
> +		int index;
>=20=20
>  		if (!(drm_plane->possible_crtcs & crtc_mask))
>  			continue;
> @@ -3096,29 +3099,36 @@ static void igt_crtc_init(igt_display_t *display,
>  		type =3D global_plane->type;
>=20=20
>  		if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary =3D=3D -=
1) {
> -			plane =3D &pipe->planes[0];
> -			plane->index =3D 0;
> -			pipe->plane_primary =3D 0;
> +			index =3D 0;
> +
> +			pipe->plane_primary =3D index;
>  			pipe->num_primary_planes++;
>  		} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor =3D=
=3D -1) {
> -			plane =3D &pipe->planes[pipe->n_planes - 1];
> -			plane->index =3D pipe->n_planes - 1;
> -			pipe->plane_cursor =3D pipe->n_planes - 1;
> +			index =3D pipe->n_planes - 1;
> +
> +			pipe->plane_cursor =3D index;
>  			display->has_cursor_plane =3D true;
>  		} else {
> +			for (index =3D 1 ; index < pipe->n_planes; index++) {

I'll come back to the patch for more scrutiny later, but for starters,
there's a superfluous space before ; that gets removed in the next
movement patch.

> +				if (pipe->planes[index].index < 0)
> +					break;
> +			}
> +
>  			/*
>  			 * Increment num_primary_planes for any extra
>  			 * primary plane found.
>  			 */
>  			if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  				pipe->num_primary_planes++;
> -
> -			plane =3D &pipe->planes[p];
> -			plane->index =3D p++;
>  		}
>=20=20
> -		igt_assert_f(plane->index < pipe->n_planes,
> -			     "n_planes < plane->index failed\n");
> +		igt_assert_lt(index, pipe->n_planes);
> +
> +		plane =3D &pipe->planes[index];
> +
> +		igt_assert_lt(plane->index, 0);
> +
> +		plane->index =3D index;
>  		plane->type =3D type;
>  		plane->pipe =3D pipe;
>  		plane->drm_plane =3D drm_plane;
> @@ -3143,11 +3153,8 @@ static void igt_crtc_init(igt_display_t *display,
>  	 */
>  	igt_assert_eq(pipe->plane_primary, 0);
>=20=20
> -	/* Check that we filled every slot exactly once */
> -	if (display->has_cursor_plane)
> -		igt_assert_eq(p, pipe->n_planes - 1);
> -	else
> -		igt_assert_eq(p, pipe->n_planes);
> +	for (j =3D 0; j < pipe->n_planes; j++)
> +		igt_assert_lt(0, pipe->planes[j].index);
>  }
>=20=20
>  /**

--=20
Jani Nikula, Intel
