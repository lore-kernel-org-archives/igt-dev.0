Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D053AD66B9A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 19:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675C810E2C9;
	Wed, 17 Dec 2025 19:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/hnGSDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB09210E2C9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 19:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765999113; x=1797535113;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=WKxlICsRqMEQmVL9K6HAjdFsZxjJYaF1f77usEVEH9I=;
 b=m/hnGSDELPM33dZtzLSoLaTtZmFcbqlhGjJo0GJl6hzTQm3xVk8zKrma
 aLLbtA06TQCxq3pjVLwkCEPdCPUuEwLGMclLCkC2XpxC6Z8fXxqcPrMdA
 HerC7BTvu4e+5Zc7c36kY9SKJ5B1MLWMGoOUVMW9YoSObnIyLv/eisw0B
 rXiyceaouCB84DAtORjKfDSa8LFPfFn3jCKaBeg9vuW43bX49yvpKpfyf
 xYlgrQuafFYRIaujVz8Y9xdvuAmlQssUsP2x7s1bapWvWtr07aaZtqdAd
 guJQn3g0RKfPl6oPoqmBI00URGZ09UZmkZUEaRG95gMTtgTBYlZ2YDH8v w==;
X-CSE-ConnectionGUID: ANwEnfIsQGW0kyZJ6fVCag==
X-CSE-MsgGUID: d7VQZ9LQTTucajusijFutw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79068345"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="79068345"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:18:32 -0800
X-CSE-ConnectionGUID: 4QhUsnWmTOeows5yivlKRA==
X-CSE-MsgGUID: fNcma++PRPGWxpySwcI4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="235802741"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:18:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 05/11] lib/kms: Extract igt_crtc_plane_init()
In-Reply-To: <20251217153758.9369-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-6-ville.syrjala@linux.intel.com>
Date: Wed, 17 Dec 2025 21:18:28 +0200
Message-ID: <80f5b0c4f43916452d1df4ddd23452d138561e29@intel.com>
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
> a bit, so extract the plane init loop into a separate function.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Smaller functions better.

'git show --color-moved-ws=3Dallow-indentation-change --color-moved'
highlights the superfluous space removal while it shouldn't have been
added in the first place.

Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 113 +++++++++++++++++++++++++++-----------------------
>  1 file changed, 61 insertions(+), 52 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5679643e167a..233f326d487f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3052,13 +3052,71 @@ void igt_display_reset_outputs(igt_display_t *dis=
play)
>  	drmModeFreeResources(resources);
>  }
>=20=20
> +static void igt_crtc_plane_init(igt_display_t *display,
> +				igt_crtc_t *pipe,
> +				drmModeRes *resources,
> +				igt_plane_t *global_plane)
> +{
> +	drmModePlane *drm_plane =3D global_plane->drm_plane;
> +	int type =3D global_plane->type;
> +	igt_plane_t *plane;
> +	int index;
> +
> +	if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary =3D=3D -1=
) {
> +		index =3D 0;
> +
> +		pipe->plane_primary =3D index;
> +		pipe->num_primary_planes++;
> +	} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor =3D=
=3D -1) {
> +		index =3D pipe->n_planes - 1;
> +
> +		pipe->plane_cursor =3D index;
> +		display->has_cursor_plane =3D true;
> +	} else {
> +		for (index =3D 1; index < pipe->n_planes; index++) {
> +			if (pipe->planes[index].index < 0)
> +				break;
> +		}
> +
> +		/*
> +		 * Increment num_primary_planes for any extra
> +		 * primary plane found.
> +		 */
> +		if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +			pipe->num_primary_planes++;
> +	}
> +
> +	igt_assert_lt(index, pipe->n_planes);
> +
> +	plane =3D &pipe->planes[index];
> +
> +	igt_assert_lt(plane->index, 0);
> +
> +	plane->index =3D index;
> +	plane->type =3D type;
> +	plane->pipe =3D pipe;
> +	plane->drm_plane =3D drm_plane;
> +	plane->values[IGT_PLANE_IN_FENCE_FD] =3D ~0ULL;
> +	plane->ref =3D global_plane;
> +
> +	/*
> +	 * HACK: point the global plane to the first pipe that
> +	 * it can go on.
> +	 */
> +	if (!global_plane->ref)
> +		igt_plane_set_pipe(plane, pipe);
> +
> +	igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_pro=
p_names);
> +
> +	igt_fill_plane_format_mod(display, plane);
> +}
> +
>  static void igt_crtc_init(igt_display_t *display,
>  			  drmModeRes *resources, int i)
>  {
>  	igt_crtc_t *pipe =3D igt_crtc_for_pipe(display, i);
> -	igt_plane_t *plane;
>  	int crtc_mask =3D 0;
> -	int j, type;
> +	int j;
>=20=20
>  	pipe->display =3D display;
>  	pipe->plane_cursor =3D -1;
> @@ -3091,60 +3149,11 @@ static void igt_crtc_init(igt_display_t *display,
>  	for (j =3D 0; j < display->n_planes; j++) {
>  		igt_plane_t *global_plane =3D &display->planes[j];
>  		drmModePlane *drm_plane =3D global_plane->drm_plane;
> -		int index;
>=20=20
>  		if (!(drm_plane->possible_crtcs & crtc_mask))
>  			continue;
>=20=20
> -		type =3D global_plane->type;
> -
> -		if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary =3D=3D -=
1) {
> -			index =3D 0;
> -
> -			pipe->plane_primary =3D index;
> -			pipe->num_primary_planes++;
> -		} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor =3D=
=3D -1) {
> -			index =3D pipe->n_planes - 1;
> -
> -			pipe->plane_cursor =3D index;
> -			display->has_cursor_plane =3D true;
> -		} else {
> -			for (index =3D 1 ; index < pipe->n_planes; index++) {
> -				if (pipe->planes[index].index < 0)
> -					break;
> -			}
> -
> -			/*
> -			 * Increment num_primary_planes for any extra
> -			 * primary plane found.
> -			 */
> -			if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> -				pipe->num_primary_planes++;
> -		}
> -
> -		igt_assert_lt(index, pipe->n_planes);
> -
> -		plane =3D &pipe->planes[index];
> -
> -		igt_assert_lt(plane->index, 0);
> -
> -		plane->index =3D index;
> -		plane->type =3D type;
> -		plane->pipe =3D pipe;
> -		plane->drm_plane =3D drm_plane;
> -		plane->values[IGT_PLANE_IN_FENCE_FD] =3D ~0ULL;
> -		plane->ref =3D global_plane;
> -
> -		/*
> -		 * HACK: point the global plane to the first pipe that
> -		 * it can go on.
> -		 */
> -		if (!global_plane->ref)
> -			igt_plane_set_pipe(plane, pipe);
> -
> -		igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_pr=
op_names);
> -
> -		igt_fill_plane_format_mod(display, plane);
> +		igt_crtc_plane_init(display, pipe, resources, global_plane);
>  	}
>=20=20
>  	/*

--=20
Jani Nikula, Intel
