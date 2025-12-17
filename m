Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33237D66B9D
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 19:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C0E10E2AF;
	Wed, 17 Dec 2025 19:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJ/Bm06Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D9010E2AF
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 19:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765998704; x=1797534704;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=EzvYg3/SWGq5It9HyAYVrMZPBZWRd6mXNh/zoAB8Hxg=;
 b=DJ/Bm06QmqxXj0Wbmi9OnK31PJR7J7Q+8XeFrPcpF/+pihvBOpr4ex3S
 8fs187sPqyvFasEX1sFa7ydkumOB6bBLwyUx3/lWmN2Wu3M5I1v+dPd4w
 W+dJS0yNNRppaWcSFD562obzX4heFN74l/DLh66MC59fKN8LEcJgp+bKG
 6U5RBku3nSGG4Gne7IeonRweFZMl+HLzNNxOsUvYZnowOXXjeDKYB70mW
 SkTcMeX6zEQ++4dO6kYk8Zs6wGKQhDH9LWO/oiPpCzK00t1FnHwJAIarA
 wIOIENPM+Q94qjPE26EHoqVReBFT/gnz+JSo8lZ5i6w2D/TUmfBnjyn5y Q==;
X-CSE-ConnectionGUID: 0wIlpEssRSqQ/zxoGPIKHg==
X-CSE-MsgGUID: L2wMMGLtTby/gCjWHS4m0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85533767"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="85533767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:11:44 -0800
X-CSE-ConnectionGUID: U/IPxGtkR4iYZeqhtRsHCA==
X-CSE-MsgGUID: HPi74P/sR+erxgavJxi+uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="202581671"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.216])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:11:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/11] lib/kms: Nuke 'n_planes' from igt_crtc_init()
In-Reply-To: <20251217153758.9369-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-3-ville.syrjala@linux.intel.com>
Date: Wed, 17 Dec 2025 21:11:38 +0200
Message-ID: <564683f1389f6876e6c69e821c3a45f8ad71cc07@intel.com>
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
> The 'n_planes' varaible is essentially just a duplicate of

*variable

> 'pipe->n_planes'. Get rid of the copy and just populate the
> real thing early.
>
> Having less variables around will help with carving up

Nitpick, *fewer

> igt_crtc_init() further.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 4993d4db8a8a..082934e4e216 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3059,7 +3059,7 @@ static void igt_crtc_init(igt_display_t *display,
>  	igt_plane_t *plane;
>  	int p =3D 1, crtc_mask =3D 0;
>  	int j, type;
> -	uint8_t last_plane =3D 0, n_planes =3D 0;
> +	uint8_t last_plane =3D 0;
>=20=20
>  	pipe->display =3D display;
>  	pipe->plane_cursor =3D -1;
> @@ -3078,13 +3078,14 @@ static void igt_crtc_init(igt_display_t *display,
>  		igt_assert(drm_plane);
>=20=20
>  		if (drm_plane->possible_crtcs & crtc_mask)
> -			n_planes++;
> +			pipe->n_planes++;
>  	}
>=20=20
> -	igt_assert_lt(0, n_planes);
> -	pipe->planes =3D calloc(n_planes, sizeof(igt_plane_t));
> -	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",=
 n_planes);
> -	last_plane =3D n_planes - 1;
> +	igt_assert_lt(0, pipe->n_planes);
> +	pipe->planes =3D calloc(pipe->n_planes, sizeof(igt_plane_t));
> +	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
> +		     pipe->n_planes);
> +	last_plane =3D pipe->n_planes - 1;
>=20=20
>  	/* add the planes that can be used with that pipe */
>  	for (j =3D 0; j < display->n_planes; j++) {
> @@ -3118,7 +3119,8 @@ static void igt_crtc_init(igt_display_t *display,
>  			plane->index =3D p++;
>  		}
>=20=20
> -		igt_assert_f(plane->index < n_planes, "n_planes < plane->index failed\=
n");
> +		igt_assert_f(plane->index < pipe->n_planes,
> +			     "n_planes < plane->index failed\n");
>  		plane->type =3D type;
>  		plane->pipe =3D pipe;
>  		plane->drm_plane =3D drm_plane;
> @@ -3147,9 +3149,7 @@ static void igt_crtc_init(igt_display_t *display,
>  	if (display->has_cursor_plane)
>  		igt_assert_eq(p, last_plane);
>  	else
> -		igt_assert_eq(p, n_planes);
> -
> -	pipe->n_planes =3D n_planes;
> +		igt_assert_eq(p, pipe->n_planes);
>  }
>=20=20
>  /**

--=20
Jani Nikula, Intel
