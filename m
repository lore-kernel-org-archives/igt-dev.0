Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0CFD6ACED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 11:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D5910EE96;
	Thu, 18 Dec 2025 11:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGNN+aka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B103710EE96
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 11:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766057984; x=1797593984;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=NVFH43rTCwFBM8m8Rlqu2RzlTl30aNLjIw2znWWcbxs=;
 b=iGNN+akaPm6qrwqmw2z06F0N0FRPwBb2Nbk6LFqN1h370xjrnahcJj8u
 n4FBjmr019Um597ewD8fd8Tdx0FTKLkKnKEhLXfhFK2XoqG+QLUnjsc2L
 E3JoZgl7If9weGJlXb6pSTm5zM67w+y4ucatjABR8Ik7I/b4BQfjXsbrt
 OLLKrJxFOlgKjt+QtnXLom83jG6LxTzQ15tiv9Dq831gYhowuwR+PJLPo
 2z3gQmZfhsRqYOlhofqavERx/aVfN8sdcFf0SKJHDlZni6LPWO0mqj2Q1
 yz84oPnMBLKNIEfM16Z5PXbWhgUVxBZywM77Z6unjN/GJkpVVb4pkH1BB w==;
X-CSE-ConnectionGUID: pUv6KqWwQ2OahkeKOx3jXA==
X-CSE-MsgGUID: fg+4wbjUTJCqrHDaEUhn+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71640278"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="71640278"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:39:44 -0800
X-CSE-ConnectionGUID: AMsY4/NjTKGIAXo1v5h29A==
X-CSE-MsgGUID: uzpUtO8jR9WnzCCNCXdUsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="229622457"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:39:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/11] lib/kms: Nuke pipe->plane_cursor
In-Reply-To: <20251217153758.9369-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-8-ville.syrjala@linux.intel.com>
Date: Thu, 18 Dec 2025 13:39:38 +0200
Message-ID: <c05e294d80f2b51faba53483e1dff9f3d570dc7a@intel.com>
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
> Get rid of of the redundant pipe->plane_cursor. It'll
> always be 'pipe->n_planes-1' after we've found the plane.
> And before we've found the plane we can just check for
> 'pipe->planes[pipe->n_planes-1].index < 0'.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 6 ++----
>  lib/igt_kms.h | 1 -
>  2 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5bb8da1ec2c5..7ae166253a3f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3061,10 +3061,9 @@ static void igt_crtc_plane_init(igt_display_t *dis=
play,
>  		index =3D 0;
>=20=20
>  		pipe->num_primary_planes++;
> -	} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor =3D=
=3D -1) {
> +	} else if (type =3D=3D DRM_PLANE_TYPE_CURSOR && pipe->planes[pipe->n_pl=
anes - 1].index < 0) {
>  		index =3D pipe->n_planes - 1;
>=20=20
> -		pipe->plane_cursor =3D index;
>  		display->has_cursor_plane =3D true;
>  	} else {
>  		for (index =3D 1; index < pipe->n_planes; index++) {
> @@ -3113,7 +3112,6 @@ static void igt_crtc_init(igt_display_t *display,
>  	int j;
>=20=20
>  	pipe->display =3D display;
> -	pipe->plane_cursor =3D -1;
>  	pipe->planes =3D NULL;
>  	pipe->num_primary_planes =3D 0;
>=20=20
> @@ -3566,7 +3564,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pi=
pe, int plane_type)
>=20=20
>  	switch(plane_type) {
>  	case DRM_PLANE_TYPE_CURSOR:
> -		plane_idx =3D pipe->plane_cursor;
> +		plane_idx =3D pipe->n_planes - 1;
>  		break;
>  	case DRM_PLANE_TYPE_PRIMARY:
>  		plane_idx =3D 0;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 810eb7497834..4a814f0e9962 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -489,7 +489,6 @@ struct igt_crtc {
>=20=20
>  	int n_planes;
>  	int num_primary_planes;
> -	int plane_cursor;
>  	igt_plane_t *planes;
>=20=20
>  	uint64_t changed;

--=20
Jani Nikula, Intel
