Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A18C6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 14:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11A10E416;
	Wed, 20 Mar 2024 14:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="uR3nBdVJ";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2B10E416
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710944368;
 bh=Hlo8ZQBF/YLGr6b8fP3jFrFKgDie2pU47rzQAwsjCxc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uR3nBdVJ1GWC26cSDo+WqlHT6XiQNDBoIJDg5+kRIITGi9wIS5DAvxJ1nIfbCz1f3
 9Tahh98CrN4xAKYJ96ovAH30Wlz01VOqwCQL4CVAghVv8tRU5rgPF5vMcE4TZOIG0n
 uTKa8Qmi9M5ePmKZ4Q9zvnwbt/pmtoRwE1odZLGsf7JLvMlIA/TdGWTXuyVCMFFqrs
 L/Vo7hyM/Pr55MIpGn6F2+it1t4tSz5eKyeAg8gGzYwgLoI0H/qwXHAjeToqDO1VeM
 Ruasnl97YN1/yvsqJbezWdwHBubw4xYmrLujgTLPOvDAF770nAVTTspw58wVsp5d7y
 RInpbHPkx6yvg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1CFBB3781426;
 Wed, 20 Mar 2024 14:19:28 +0000 (UTC)
Date: Wed, 20 Mar 2024 16:19:18 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] lib: Add support for solid_fill and
 pixel_source plane properties
Message-ID: <20240320161918.2c9963ea.pekka.paalanen@collabora.com>
In-Reply-To: <20240301-solid-fill-v3-3-8dff68a8a566@quicinc.com>
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
 <20240301-solid-fill-v3-3-8dff68a8a566@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NB75m8h+Ha4IdRYoSqKIA2+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/NB75m8h+Ha4IdRYoSqKIA2+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Mar 2024 12:47:32 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Add corresponding IGT macros for solid_fill and pixel_source DRM
> properties, and change IGT commit behavior to allow for NULL FB commits.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  lib/igt_kms.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
>  lib/igt_kms.h |  4 ++++
>  2 files changed, 49 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1b4d0d7612a2..8e965a3798b6 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -669,6 +669,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE=
_PROPS] =3D {
>  	[IGT_PLANE_HOTSPOT_X] =3D "HOTSPOT_X",
>  	[IGT_PLANE_HOTSPOT_Y] =3D "HOTSPOT_Y",
>  	[IGT_PLANE_FB_ID] =3D "FB_ID",
> +	[IGT_PLANE_SOLID_FILL] =3D "solid_fill",
> +	[IGT_PLANE_PIXEL_SOURCE] =3D "pixel_source",
>  	[IGT_PLANE_CRTC_ID] =3D "CRTC_ID",
>  	[IGT_PLANE_IN_FENCE_FD] =3D "IN_FENCE_FD",
>  	[IGT_PLANE_TYPE] =3D "type",
> @@ -2379,6 +2381,8 @@ static void igt_plane_reset(igt_plane_t *plane)
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_H, 0);
> =20
>  	/* Reset binding to fb and crtc. */
> +	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, 0);
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_SOURCE, "FB");
>  	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, 0);
>  	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, 0);
> =20
> @@ -3417,6 +3421,11 @@ static igt_output_t *igt_pipe_get_output(igt_pipe_=
t *pipe)
>  	return NULL;
>  }
> =20
> +static uint32_t igt_plane_get_solid_fill_id(igt_plane_t *plane)
> +{
> +	return plane->values[IGT_PLANE_SOLID_FILL];
> +}
> +
>  static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
>  {
>  	return plane->values[IGT_PLANE_FB_ID];
> @@ -3648,7 +3657,7 @@ static int igt_primary_plane_commit_legacy(igt_plan=
e_t *primary,
>  	struct igt_display *display =3D primary->pipe->display;
>  	igt_output_t *output =3D igt_pipe_get_output(pipe);
>  	drmModeModeInfo *mode;
> -	uint32_t fb_id, crtc_id;
> +	uint32_t fb_id, solid_fill_id, crtc_id;
>  	int ret;
> =20
>  	/* Primary planes can't be windowed when using a legacy commit */
> @@ -3665,12 +3674,14 @@ static int igt_primary_plane_commit_legacy(igt_pl=
ane_t *primary,
> =20
>  	crtc_id =3D pipe->crtc_id;
>  	fb_id =3D output ? igt_plane_get_fb_id(primary) : 0;
> -	if (fb_id)
> +	solid_fill_id =3D output ? igt_plane_get_solid_fill_id(primary) : 0;
> +
> +	if (fb_id || solid_fill_id)
>  		mode =3D igt_output_get_mode(output);
>  	else
>  		mode =3D NULL;
> =20
> -	if (fb_id) {
> +	if (fb_id || solid_fill_id) {
>  		uint32_t src_x =3D primary->values[IGT_PLANE_SRC_X] >> 16;
>  		uint32_t src_y =3D primary->values[IGT_PLANE_SRC_Y] >> 16;

Hi Jessica,

can igt_primary_plane_commit_legacy() really handle solid_fill?
Is it not an atomic-only property?


Thanks,
pq

> =20
> @@ -4935,6 +4946,37 @@ igt_plane_t *igt_output_get_plane_type_index(igt_o=
utput_t *output,
>  	return igt_pipe_get_plane_type_index(pipe, plane_type, index);
>  }
> =20
> +/**
> + * igt_plane_set_solid_fill:
> + * @plane: Plane
> + * @rect: Rect for size and position of @plane
> + * @solid_fill_id: Solid fill property blob ID
> + *
> + * Pairs the solid_fill blob (identified by @solid_fill_id) to a @plane
> + *
> + * The size and position of the solid fill plane will be specified by @r=
ect
> + */
> +void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *=
rect,
> +		int solid_fill_id)
> +{
> +	igt_pipe_t *pipe =3D plane->pipe;
> +	igt_display_t *display =3D pipe->display;
> +	int width =3D rect->x2 - rect->x1;
> +	int height =3D rect->y2 - rect->y1;
> +
> +	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
> +			solid_fill_id ? pipe->crtc_id : 0);
> +	igt_plane_set_prop_value(plane, IGT_PLANE_SOLID_FILL, solid_fill_id);
> +
> +	plane->gem_handle =3D 0;
> +
> +	LOG(display, "%s.%d: plane_set_solid_fill(%d)\n", kmstest_pipe_name(pip=
e->pipe),
> +	    plane->index, solid_fill_id);
> +
> +	igt_plane_set_position(plane, rect->x1, rect->y1);
> +	igt_plane_set_size(plane, width, height);
> +}
> +
>  /**
>   * igt_plane_set_fb:
>   * @plane: Plane
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index b3882808b42f..9c05272abe1e 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -330,6 +330,8 @@ enum igt_atomic_plane_properties {
>  #define IGT_PLANE_COORD_CHANGED_MASK 0xff
> =20
>         IGT_PLANE_FB_ID,
> +       IGT_PLANE_SOLID_FILL,
> +       IGT_PLANE_PIXEL_SOURCE,
>         IGT_PLANE_CRTC_ID,
>         IGT_PLANE_IN_FENCE_FD,
>         IGT_PLANE_TYPE,
> @@ -537,6 +539,8 @@ igt_output_t *igt_get_single_output_for_pipe(igt_disp=
lay_t *display, enum pipe p
> =20
>  void igt_pipe_request_out_fence(igt_pipe_t *pipe);
> =20
> +void igt_plane_set_solid_fill(igt_plane_t *plane, struct drm_mode_rect *=
rect,
> +		int solid_fill_id);
>  void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
>  void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
>  void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe);
>=20


--Sig_/NB75m8h+Ha4IdRYoSqKIA2+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmX68GYACgkQI1/ltBGq
qqcvVA//T6ZYS6GNPjHNKrbCYeRhPRwUHN0n+cqXjxVRsqAcbaaPfvvSOCk9jHhc
Hvu2/Tol0L2gY5Bxi0o3XrsZWS+ilNg6Eu64vIZ2R03bxPrJi4mYt0urB+Dht5fX
OK+TST+QyarZpP4+eksRj/8j1mZ4xyVelr4g3UKVPykgE0/ititeWBqNOq1npXOH
c7zSPfoFTqiaop1NMl7tko9o6U1axCJOCEkEBsrVWTlHgnlIgKMg7Mk0vUpilyJk
JcjSJtCsa/kG2+sj52F2MUWv//vp7befC3CWp540R1mUdKTyK/02TNftxNzxaZUl
sQ1nLjMtw15Da+733k1LX1Wroh5d8fbLYsZs57pK+pl3iUYOScckWR/Bjd1FYGSc
8toFnrneYMWMtuxZ2jVZBeN9c7dZKUNPDM133gEID50+AvFl3WBoyoDHKkPGWGzF
I3Qg9N/A4JfN8UShr3+iA11p6yDTvSaEfPYLH5pYA33pY0oGChF9TKLa9YbsRsz4
n+kwmNfS3nOtcwIO6xZtJtSUaU/qz0sZsy+KTD2ESSaddUDfNd5bAGeaLPU/X40H
5u3Udu1tXeD8bAmwD0rq2IXnBwKrrN6NZbcJM5hujHvMlxJvEP64V15EEu3vEnF4
zPk3q8VZKAfOO6vG5OGoIxm8nYTUwkg4VbjVmoDTi13Lj+0Hv2s=
=SCcO
-----END PGP SIGNATURE-----

--Sig_/NB75m8h+Ha4IdRYoSqKIA2+--
