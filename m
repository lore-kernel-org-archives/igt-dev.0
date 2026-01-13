Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957A1D2D10A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F80E10E4E9;
	Tue, 13 Jan 2026 14:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQXRMEZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A0910E4E7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768314677; x=1799850677;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=HKK71wxV474oFVN7CrkZ3VSzB0BvoBcPxR/d/psbGkw=;
 b=NQXRMEZ3dLo/hC7C7cvg9NP5rlJuPyXap4v1Noc/is75zs3iVwZRHbR0
 ZBbOetkgKWT8UzQf/p+Qxtub9W5Geyt0+rS6ky8dtLBi0B0vf4bRiBXTr
 6T+6aLdQV8wqlhR67eqFCRXRlp8YwVhVi1k2JnfgTn291DaQ3IGX0lSXs
 kICeZ0FxvN5GVEnp+aNIQ7xvuh9nVbSb4FgFNN5so2k870EUL1kXzSQV7
 j68tsKOHdh4Iz8DE3vKSm2Q5sfG7rfCplgMEl3tZboBfi3juE03xq4IDB
 7mjiNT/MMkrVKPuhIe1zR6BQbNjXkuE6KEeUTbSgTr16/NlUB0m709sSk g==;
X-CSE-ConnectionGUID: RIKb+Z6oROGbz/nwUwlKOQ==
X-CSE-MsgGUID: IGTlJSFuTi6kU8sGY1tMuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68606135"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="68606135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:31:17 -0800
X-CSE-ConnectionGUID: DHmk4VFoQtyHus6PCxI6Sw==
X-CSE-MsgGUID: PFO+wHG+RbOrc16JfwWv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204025004"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:31:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/8] tests/kms_plane_cursor: s/or/rect/
In-Reply-To: <20260113120439.12577-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
 <20260113120439.12577-2-ville.syrjala@linux.intel.com>
Date: Tue, 13 Jan 2026 16:31:12 +0200
Message-ID: <85efa5f57b75c87750b4e71b447f57bb98bdf7cb@intel.com>
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

On Tue, 13 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename data.or to data.rect. Coccinelle seems to think
> 'or' is some kind of reserved keyword and fails to parse
> the code when it sees a variable with that name.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_plane_cursor.c | 48 ++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 8b172794bc88..fcb7cea06c9e 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -84,7 +84,7 @@ typedef struct data {
>  	igt_fb_t cfb;
>  	enum pipe pipe_id;
>  	int drm_fd;
> -	rect_t or;
> +	rect_t rect;
>  	uint64_t max_curw;
>  	uint64_t max_curh;
>  } data_t;
> @@ -112,10 +112,10 @@ static void test_init(data_t *data, enum pipe pipe_=
id, igt_output_t *output,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>=20=20
>  	/* Overlay rectangle for a rect in the center of the screen */
> -	data->or.x =3D data->mode->hdisplay / 4;
> -	data->or.y =3D data->mode->vdisplay / 4;
> -	data->or.w =3D data->mode->hdisplay / 2;
> -	data->or.h =3D data->mode->vdisplay / 2;
> +	data->rect.x =3D data->mode->hdisplay / 4;
> +	data->rect.y =3D data->mode->vdisplay / 4;
> +	data->rect.w =3D data->mode->hdisplay / 2;
> +	data->rect.h =3D data->mode->vdisplay / 2;
>  }
>=20=20
>  /* Common test cleanup. */
> @@ -149,13 +149,13 @@ static void test_cursor_pos(data_t *data, int x, in=
t y, unsigned int flags)
>  	igt_fb_t *cfb =3D &data->cfb;
>  	int cw =3D cfb->width;
>  	int ch =3D cfb->height;
> -	const rect_t *or =3D &data->or;
> +	const rect_t *rect =3D &data->rect;
>=20=20
>  	cr =3D igt_get_cairo_ctx(ref_fb->fd, ref_fb);
>  	igt_paint_color(cr, 0, 0, ref_fb->width, ref_fb->height, 1.0, 1.0, 1.0);
>=20=20
>  	if (flags & TEST_OVERLAY)
> -		igt_paint_color(cr, or->x, or->y, or->w, or->h, 0.5, 0.5, 0.5);
> +		igt_paint_color(cr, rect->x, rect->y, rect->w, rect->h, 0.5, 0.5, 0.5);
>=20=20
>  	igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
>  	igt_put_cairo_ctx(cr);
> @@ -173,12 +173,12 @@ static void test_cursor_pos(data_t *data, int x, in=
t y, unsigned int flags)
>=20=20
>  	if (flags & TEST_OVERLAY) {
>  		igt_plane_set_fb(data->overlay, ofb);
> -		igt_plane_set_position(data->overlay, or->x, or->y);
> -		igt_plane_set_size(data->overlay, or->w, or->h);
> -		igt_fb_set_size(ofb, data->overlay, or->w, or->h);
> +		igt_plane_set_position(data->overlay, rect->x, rect->y);
> +		igt_plane_set_size(data->overlay, rect->w, rect->h);
> +		igt_fb_set_size(ofb, data->overlay, rect->w, rect->h);
>  		igt_fb_set_position(ofb, data->overlay,
> -				    (ofb->width - or->w) / 2,
> -				    (ofb->height - or->h) / 2);
> +				    (ofb->width - rect->w) / 2,
> +				    (ofb->height - rect->h) / 2);
>  	}
>=20=20
>  	igt_plane_set_fb(data->cursor, cfb);
> @@ -206,27 +206,27 @@ static void test_cursor_spots(data_t *data, int siz=
e, unsigned int flags)
>  {
>  	int sw =3D data->mode->hdisplay;
>  	int sh =3D data->mode->vdisplay;
> -	const rect_t *or =3D &data->or;
> +	const rect_t *rect =3D &data->rect;
>  	int i;
>  	const pos_t pos[] =3D {
>  		/* Test diagonally from top left to bottom right. */
>  		{ -size / 3, -size / 3 },
>  		{ 0, 0 },
> -		{ or->x - size, or->y - size },
> -		{ or->x - size / 3, or->y - size / 3 },
> -		{ or->x, or->y },
> -		{ or->x + size, or->y + size },
> +		{ rect->x - size, rect->y - size },
> +		{ rect->x - size / 3, rect->y - size / 3 },
> +		{ rect->x, rect->y },
> +		{ rect->x + size, rect->y + size },
>  		{ sw / 2, sh / 2 },
> -		{ or->x + or->w - size, or->y + or->h - size },
> -		{ or->x + or->w - size / 3, or->y + or->h - size / 3 },
> -		{ or->x + or->w + size, or->y + or->h + size },
> +		{ rect->x + rect->w - size, rect->y + rect->h - size },
> +		{ rect->x + rect->w - size / 3, rect->y + rect->h - size / 3 },
> +		{ rect->x + rect->w + size, rect->y + rect->h + size },
>  		{ sw - size, sh - size },
>  		{ sw - size / 3, sh - size / 3 },
>  		/* Test remaining corners. */
>  		{ sw - size, 0 },
>  		{ 0, sh - size },
> -		{ or->x + or->w - size, or->y },
> -		{ or->x, or->y + or->h - size }
> +		{ rect->x + rect->w - size, rect->y },
> +		{ rect->x, rect->y + rect->h - size }
>  	};
>=20=20
>  	for (i =3D 0; i < ARRAY_SIZE(pos); ++i) {
> @@ -265,8 +265,8 @@ static void test_cursor(data_t *data, int size, unsig=
ned int flags)
>  			    DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0, &data->pfb);
>=20=20
>  	if (flags & TEST_OVERLAY) {
> -		int width =3D (flags & TEST_VIEWPORT) ? data->or.w + pad : data->or.w;
> -		int height =3D (flags & TEST_VIEWPORT) ? data->or.h + pad : data->or.h;
> +		int width =3D (flags & TEST_VIEWPORT) ? data->rect.w + pad : data->rec=
t.w;
> +		int height =3D (flags & TEST_VIEWPORT) ? data->rect.h + pad : data->re=
ct.h;
>=20=20
>  		igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>  				    DRM_FORMAT_MOD_LINEAR, 0.5, 0.5, 0.5, &data->ofb);

--=20
Jani Nikula, Intel
