Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469E7D6ACED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 11:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CB010E3CA;
	Thu, 18 Dec 2025 11:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHHfK6xf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A6110E3CA
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766057854; x=1797593854;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=7mJZ6qLvPNpOaXJfYWBEkVe0cdUafpbRpmcumi6rh7Q=;
 b=MHHfK6xfarGKP3i6hJpWSuCd/Xh/IYRz3FNJrBTmpS2V/tlPq2jPCeBI
 A2pcX0kwjqdlhKjTk+7oLI0VqNJo/ebUQtc4BefaUJeDKqGGFuxIDY7iU
 OKBYKXb0XBWPWCKmUpR/tEr86gtDoVMLk/prr5Ufnr+FOrEG1RJqHRLfi
 4HASQzy8mmaJNOkxkQEmp0QEaclcBidrY+1f3bngTzHOH+DLLKWo2RCDm
 PEejHWuhZJ5BNlfN1NuHFR7edEAuuyL33u8GKAwCO/Lo/fglxbfMIsfEP
 BZXeCsGYSX9YdCXT3+3CIr3UKrQ7rb2lgeNH3lrizfzp7+3R/wEA9RGGO w==;
X-CSE-ConnectionGUID: xX5+J4f4SIK4nwHzJ+AVZg==
X-CSE-MsgGUID: P7WZAwL1QhOY5MSyZgJZMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71640199"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="71640199"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:37:34 -0800
X-CSE-ConnectionGUID: b7SDdHAKSMK7uruJMYeENw==
X-CSE-MsgGUID: /Fjl1ZwGS8C6A5Y6WVXrpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="229622224"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:37:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 06/11] lib/kms: Nuke pipe->plane_primary
In-Reply-To: <20251217153758.9369-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-7-ville.syrjala@linux.intel.com>
Date: Thu, 18 Dec 2025 13:37:28 +0200
Message-ID: <48d127a066e9d48da70b7d6d15f90f81183caf97@intel.com>
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
> Get rid of of the redundant pipe->plane_primary. It'll
> always be 0 after we've found the plane. And before we've
> found the plane we can just check for 'pipe->planes[0].index < 0'.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 31 +++++++++----------------------
>  lib/igt_kms.h |  1 -
>  2 files changed, 9 insertions(+), 23 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 233f326d487f..5bb8da1ec2c5 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3022,29 +3022,24 @@ void igt_display_reset_outputs(igt_display_t *dis=
play)
>  		output =3D igt_get_single_output_for_pipe(display, i);
>=20=20
>  		if (pipe->num_primary_planes > 1) {
> -			igt_plane_t *primary =3D
> -				&pipe->planes[pipe->plane_primary];
> +			igt_plane_t *primary =3D &pipe->planes[0];
>  			igt_plane_t *assigned_primary =3D
>  				igt_get_assigned_primary(output, pipe);
>  			int assigned_primary_index =3D assigned_primary->index;
>=20=20
>  			/*
>  			 * If the driver-assigned primary plane isn't at
> -			 * the pipe->plane_primary index, swap it with
> -			 * the plane that's currently at the
> -			 * plane_primary index and update plane->index
> -			 * accordingly.
> +			 * index 0, swap it with the plane that's currently
> +			 * at index 0 and update the indexes accordingly.
>  			 *
> -			 * This way, we can preserve pipe->plane_primary
> -			 * as 0 so that tests that assume
> -			 * pipe->plane_primary is always 0 won't break.
> +			 * This way, the primary plane is always at index 0.
>  			 */
> -			if (assigned_primary_index !=3D pipe->plane_primary) {
> -				assigned_primary->index =3D pipe->plane_primary;
> +			if (assigned_primary_index !=3D 0) {
> +				assigned_primary->index =3D 0;
>  				primary->index =3D assigned_primary_index;
>=20=20
>  				igt_swap(pipe->planes[assigned_primary_index],
> -					 pipe->planes[pipe->plane_primary]);
> +					 pipe->planes[0]);
>  			}
>  		}
>  	}
> @@ -3062,10 +3057,9 @@ static void igt_crtc_plane_init(igt_display_t *dis=
play,
>  	igt_plane_t *plane;
>  	int index;
>=20=20
> -	if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary =3D=3D -1=
) {
> +	if (type =3D=3D DRM_PLANE_TYPE_PRIMARY && pipe->planes[0].index < 0) {
>  		index =3D 0;
>=20=20
> -		pipe->plane_primary =3D index;
>  		pipe->num_primary_planes++;
>  	} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor =3D=
=3D -1) {
>  		index =3D pipe->n_planes - 1;
> @@ -3120,7 +3114,6 @@ static void igt_crtc_init(igt_display_t *display,
>=20=20
>  	pipe->display =3D display;
>  	pipe->plane_cursor =3D -1;
> -	pipe->plane_primary =3D -1;
>  	pipe->planes =3D NULL;
>  	pipe->num_primary_planes =3D 0;
>=20=20
> @@ -3156,12 +3149,6 @@ static void igt_crtc_init(igt_display_t *display,
>  		igt_crtc_plane_init(display, pipe, resources, global_plane);
>  	}
>=20=20
> -	/*
> -	 * At the bare minimum, we should expect to have a primary
> -	 * plane, and it must be in slot 0.
> -	 */
> -	igt_assert_eq(pipe->plane_primary, 0);
> -
>  	for (j =3D 0; j < pipe->n_planes; j++)
>  		igt_assert_lt(0, pipe->planes[j].index);
>  }
> @@ -3582,7 +3569,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pi=
pe, int plane_type)
>  		plane_idx =3D pipe->plane_cursor;
>  		break;
>  	case DRM_PLANE_TYPE_PRIMARY:
> -		plane_idx =3D pipe->plane_primary;
> +		plane_idx =3D 0;
>  		break;
>  	case DRM_PLANE_TYPE_OVERLAY:
>  		for(i =3D 0; i < pipe->n_planes; i++)
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b00884640e16..810eb7497834 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -490,7 +490,6 @@ struct igt_crtc {
>  	int n_planes;
>  	int num_primary_planes;
>  	int plane_cursor;
> -	int plane_primary;
>  	igt_plane_t *planes;
>=20=20
>  	uint64_t changed;

--=20
Jani Nikula, Intel
