Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC34D66B9A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 19:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C3310E07C;
	Wed, 17 Dec 2025 19:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtZBdJAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7994710E07C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765998304; x=1797534304;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=SiPdzS4B2yQs+RM6cV/FNcrsadL1HDxYmZTOOhtmhE0=;
 b=jtZBdJACIgZuVEEvGowYHwfXi9zieDUFs+Lq4ZdAl4n2wvGFQdcAtTJL
 nfWicp7tsRR6aH5DepKMynhXKXw88ssJo3nkwutZNq5wSWfZnCbhd6/RL
 Y18+s7l66ETFRGXbpA2qWBZNeKnvT9ng4HB9mgvFTJHvuMDWQtXKLgkpx
 uUvcDg2TjDmJHtuf1y+v+7opXp0+KrjTOxhUGUO7MoUdY3Hq3jq3BBZ1G
 RpKvK9xvWCPHMPaBYVDtd/wE73CKsECv4CM5iTZbIVLNNu3mczyrm4OZZ
 zul+Mtl8peZcBlYYxvWDfFBgX0w0fq+mdbrlYj3bnJYPRZwD7jTV5nYUD g==;
X-CSE-ConnectionGUID: GYsNmggGQA+GYxANSvU+Ig==
X-CSE-MsgGUID: d5g/zrTgREqi/xDo1S1y5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67913711"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67913711"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:05:03 -0800
X-CSE-ConnectionGUID: solCf7QsTVmTHdxN/HWdfQ==
X-CSE-MsgGUID: UzEQRcGKQ9WCHVuNQCkF4w==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.216])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:05:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/11] lib/kms: Extract igt_crtc_init()
In-Reply-To: <20251217153758.9369-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-2-ville.syrjala@linux.intel.com>
Date: Wed, 17 Dec 2025 21:04:59 +0200
Message-ID: <2076fb1f4d58efa1bc80fb619b0dae6ebfba9af7@intel.com>
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
> Coccinelle tends to hit some kind of pathological performance
> problem with igt_display_require(). Carving it up seems to help
> a bit, so extract the crtc init loop into a separate function.

It's too big for humans too, good cleanup.

'git show --color-moved-ws=3Dallow-indentation-change --color-moved' FTW.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c | 199 ++++++++++++++++++++++++++------------------------
>  1 file changed, 102 insertions(+), 97 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e3e9bf9bce07..4993d4db8a8a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3052,6 +3052,106 @@ void igt_display_reset_outputs(igt_display_t *dis=
play)
>  	drmModeFreeResources(resources);
>  }
>=20=20
> +static void igt_crtc_init(igt_display_t *display,
> +			  drmModeRes *resources, int i)
> +{
> +	igt_crtc_t *pipe =3D igt_crtc_for_pipe(display, i);
> +	igt_plane_t *plane;
> +	int p =3D 1, crtc_mask =3D 0;
> +	int j, type;
> +	uint8_t last_plane =3D 0, n_planes =3D 0;
> +
> +	pipe->display =3D display;
> +	pipe->plane_cursor =3D -1;
> +	pipe->plane_primary =3D -1;
> +	pipe->planes =3D NULL;
> +	pipe->num_primary_planes =3D 0;
> +
> +	igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_na=
mes);
> +
> +	/* Get valid crtc index from crtcs for a pipe */
> +	crtc_mask =3D __get_crtc_mask_for_pipe(resources, pipe);
> +
> +	/* count number of valid planes */
> +	for (j =3D 0; j < display->n_planes; j++) {
> +		drmModePlane *drm_plane =3D display->planes[j].drm_plane;
> +		igt_assert(drm_plane);
> +
> +		if (drm_plane->possible_crtcs & crtc_mask)
> +			n_planes++;
> +	}
> +
> +	igt_assert_lt(0, n_planes);
> +	pipe->planes =3D calloc(n_planes, sizeof(igt_plane_t));
> +	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",=
 n_planes);
> +	last_plane =3D n_planes - 1;
> +
> +	/* add the planes that can be used with that pipe */
> +	for (j =3D 0; j < display->n_planes; j++) {
> +		igt_plane_t *global_plane =3D &display->planes[j];
> +		drmModePlane *drm_plane =3D global_plane->drm_plane;
> +
> +		if (!(drm_plane->possible_crtcs & crtc_mask))
> +			continue;
> +
> +		type =3D global_plane->type;
> +
> +		if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary =3D=3D -=
1) {
> +			plane =3D &pipe->planes[0];
> +			plane->index =3D 0;
> +			pipe->plane_primary =3D 0;
> +			pipe->num_primary_planes++;
> +		} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor =3D=
=3D -1) {
> +			plane =3D &pipe->planes[last_plane];
> +			plane->index =3D last_plane;
> +			pipe->plane_cursor =3D last_plane;
> +			display->has_cursor_plane =3D true;
> +		} else {
> +			/*
> +			 * Increment num_primary_planes for any extra
> +			 * primary plane found.
> +			 */
> +			if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +				pipe->num_primary_planes++;
> +
> +			plane =3D &pipe->planes[p];
> +			plane->index =3D p++;
> +		}
> +
> +		igt_assert_f(plane->index < n_planes, "n_planes < plane->index failed\=
n");
> +		plane->type =3D type;
> +		plane->pipe =3D pipe;
> +		plane->drm_plane =3D drm_plane;
> +		plane->values[IGT_PLANE_IN_FENCE_FD] =3D ~0ULL;
> +		plane->ref =3D global_plane;
> +
> +		/*
> +		 * HACK: point the global plane to the first pipe that
> +		 * it can go on.
> +		 */
> +		if (!global_plane->ref)
> +			igt_plane_set_pipe(plane, pipe);
> +
> +		igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_pr=
op_names);
> +
> +		igt_fill_plane_format_mod(display, plane);
> +	}
> +
> +	/*
> +	 * At the bare minimum, we should expect to have a primary
> +	 * plane, and it must be in slot 0.
> +	 */
> +	igt_assert_eq(pipe->plane_primary, 0);
> +
> +	/* Check that we filled every slot exactly once */
> +	if (display->has_cursor_plane)
> +		igt_assert_eq(p, last_plane);
> +	else
> +		igt_assert_eq(p, n_planes);
> +
> +	pipe->n_planes =3D n_planes;
> +}
> +
>  /**
>   * igt_display_require:
>   * @display: a pointer to an #igt_display_t structure
> @@ -3155,103 +3255,8 @@ void igt_display_require(igt_display_t *display, =
int drm_fd)
>  	display->colorops =3D calloc(MAX_NUM_COLOROPS, sizeof(igt_colorop_t));
>  	display->n_colorops =3D 0;
>=20=20
> -	for_each_pipe(display, i) {
> -		igt_crtc_t *pipe =3D igt_crtc_for_pipe(display, i);
> -		igt_plane_t *plane;
> -		int p =3D 1, crtc_mask =3D 0;
> -		int j, type;
> -		uint8_t last_plane =3D 0, n_planes =3D 0;
> -
> -		pipe->display =3D display;
> -		pipe->plane_cursor =3D -1;
> -		pipe->plane_primary =3D -1;
> -		pipe->planes =3D NULL;
> -		pipe->num_primary_planes =3D 0;
> -
> -		igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_n=
ames);
> -
> -		/* Get valid crtc index from crtcs for a pipe */
> -		crtc_mask =3D __get_crtc_mask_for_pipe(resources, pipe);
> -
> -		/* count number of valid planes */
> -		for (j =3D 0; j < display->n_planes; j++) {
> -			drmModePlane *drm_plane =3D display->planes[j].drm_plane;
> -			igt_assert(drm_plane);
> -
> -			if (drm_plane->possible_crtcs & crtc_mask)
> -				n_planes++;
> -		}
> -
> -		igt_assert_lt(0, n_planes);
> -		pipe->planes =3D calloc(n_planes, sizeof(igt_plane_t));
> -		igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n"=
, n_planes);
> -		last_plane =3D n_planes - 1;
> -
> -		/* add the planes that can be used with that pipe */
> -		for (j =3D 0; j < display->n_planes; j++) {
> -			igt_plane_t *global_plane =3D &display->planes[j];
> -			drmModePlane *drm_plane =3D global_plane->drm_plane;
> -
> -			if (!(drm_plane->possible_crtcs & crtc_mask))
> -				continue;
> -
> -			type =3D global_plane->type;
> -
> -			if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary =3D=3D =
-1) {
> -				plane =3D &pipe->planes[0];
> -				plane->index =3D 0;
> -				pipe->plane_primary =3D 0;
> -				pipe->num_primary_planes++;
> -			} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor =
=3D=3D -1) {
> -				plane =3D &pipe->planes[last_plane];
> -				plane->index =3D last_plane;
> -				pipe->plane_cursor =3D last_plane;
> -				display->has_cursor_plane =3D true;
> -			} else {
> -				/*
> -				 * Increment num_primary_planes for any extra
> -				 * primary plane found.
> -				 */
> -				if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> -					pipe->num_primary_planes++;
> -
> -				plane =3D &pipe->planes[p];
> -				plane->index =3D p++;
> -			}
> -
> -			igt_assert_f(plane->index < n_planes, "n_planes < plane->index failed=
\n");
> -			plane->type =3D type;
> -			plane->pipe =3D pipe;
> -			plane->drm_plane =3D drm_plane;
> -			plane->values[IGT_PLANE_IN_FENCE_FD] =3D ~0ULL;
> -			plane->ref =3D global_plane;
> -
> -			/*
> -			 * HACK: point the global plane to the first pipe that
> -			 * it can go on.
> -			 */
> -			if (!global_plane->ref)
> -				igt_plane_set_pipe(plane, pipe);
> -
> -			igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_p=
rop_names);
> -
> -			igt_fill_plane_format_mod(display, plane);
> -		}
> -
> -		/*
> -		 * At the bare minimum, we should expect to have a primary
> -		 * plane, and it must be in slot 0.
> -		 */
> -		igt_assert_eq(pipe->plane_primary, 0);
> -
> -		/* Check that we filled every slot exactly once */
> -		if (display->has_cursor_plane)
> -			igt_assert_eq(p, last_plane);
> -		else
> -			igt_assert_eq(p, n_planes);
> -
> -		pipe->n_planes =3D n_planes;
> -	}
> +	for_each_pipe(display, i)
> +		igt_crtc_init(display, resources, i);
>=20=20
>  	drmModeFreeResources(resources);

--=20
Jani Nikula, Intel
