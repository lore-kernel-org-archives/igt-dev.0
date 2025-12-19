Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FA6D767CB
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 10:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F85010EEFB;
	Fri, 19 Dec 2025 10:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmH00sso";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA41F10EEFB
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766141715; x=1797677715;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=qdOpEZPCPFkhM3QAtjl4iPWWfWnDnAYpI2oRU9AErbw=;
 b=VmH00ssoQSyWgJSyaOs0/IKftGEgej2HUax/Jm+eZga/7tMIrj3kpbcV
 s8juCJd1900vd570w9hIUZhakRdbg5UzTLSQTKw8vgkT1h8EOhZQZj+Qw
 zVfPEmyb4t1fmMhIzZv9t73oQ57rJNTwRK9mejCyV1Brt7jW5BHNaeuOE
 T6NIjqiMU+pefQPnI5WArMQjkiFjjN/0exyJpIK1pz0Iz84ZQ7yxi/ue7
 Jg5Wxjd7uD4Rp5uZYqIfWkyJi9wiTaRWFl4PN+PwcX4K4+QT798twzsBN
 uVmlXOnLQ2+bbB5o45fenfLlQw5i14/j5NF53ytqGY/seMixIkSwtJoBx A==;
X-CSE-ConnectionGUID: iRLl95obSia3W4MnMrsrZg==
X-CSE-MsgGUID: JLSrPKdUQRmhVX1i6b2UkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79558998"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79558998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:55:14 -0800
X-CSE-ConnectionGUID: Eby5yx7nRuCkyfdJL6FRHQ==
X-CSE-MsgGUID: sTPum3HlQjO+/KkJd3OacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="222252653"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.34])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:55:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 04/11] lib/kms: Get rid of the 'p' plane index
 variable
In-Reply-To: <20251218154723.14896-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-5-ville.syrjala@linux.intel.com>
 <20251218154723.14896-1-ville.syrjala@linux.intel.com>
Date: Fri, 19 Dec 2025 12:55:09 +0200
Message-ID: <10394ac34bb9dd0112a2da94d8382b17fb8e95be@intel.com>
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

On Thu, 18 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The 'p' thing used to track the next free plane slot is annoying.
> Get rid of it by just initializing the plane indexes to -1 to
> indicate a free slot at the start, and then do a straightforward
> search for the next free slot. And for good measure make sure all
> the -1's have disappeared at the end.
>
> v2: Remove spurious whitespace (Jani)
>     Fix the post init plane->index assert (Jani/CI)
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 42 +++++++++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 72c91fb5da76..803a1e926b10 100644
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
> @@ -3085,10 +3085,14 @@ static void igt_crtc_init(igt_display_t *display,
>  	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
>  		     pipe->n_planes);
>=20=20
> +	for (j =3D 0; j < pipe->n_planes; j++)
> +		pipe->planes[j].index =3D -1;
> +
>  	/* add the planes that can be used with that pipe */
>  	for (j =3D 0; j < display->n_planes; j++) {
>  		igt_plane_t *global_plane =3D &display->planes[j];
>  		drmModePlane *drm_plane =3D global_plane->drm_plane;
> +		int index;
>=20=20
>  		if (!(drm_plane->possible_crtcs & crtc_mask))
>  			continue;
> @@ -3096,29 +3100,36 @@ static void igt_crtc_init(igt_display_t *display,
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
> +			for (index =3D 1; index < pipe->n_planes; index++) {
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
> @@ -3143,11 +3154,8 @@ static void igt_crtc_init(igt_display_t *display,
>  	 */
>  	igt_assert_eq(pipe->plane_primary, 0);
>=20=20
> -	/* Check that we filled every slot exactly once */
> -	if (display->has_cursor_plane)
> -		igt_assert_eq(p, pipe->n_planes - 1);
> -	else
> -		igt_assert_eq(p, pipe->n_planes);
> +	for (j =3D 0; j < pipe->n_planes; j++)
> +		igt_assert_lte(0, pipe->planes[j].index);
>  }
>=20=20
>  /**

--=20
Jani Nikula, Intel
