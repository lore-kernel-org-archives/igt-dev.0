Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC77C47DDC
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 08:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6931B10E1CD;
	Wed, 24 Jan 2024 08:47:33 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6FC10E1CD
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 08:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706086049;
 bh=jQ9e5FGIW6Oxc+qwiSdL78oG6C/sMUiV1RaXlVwBz90=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tnd33Se/6PKfi2CCjYZhAu4CkGEdXl0tdAnmfm/4V/Jft4/+xtjL0VgyiCIF9hVAw
 c3PPNDj5kTP9DpYgkz3HE0aoZ+glYgkF5bXSNrGtsBmuLxLlnD8UXolU3wn6SE1SF2
 U2xTy8lsNvtAdust62isOxn9PwYJ3EUQlnxthVe8Cfic6xJVS5m5B3AQqDXK46Ddnv
 t967mGj219hAl2sQRLvejlJpq9PO8Zlz7HkLl1dOK4YHg7SpagODHCRUKjXYCzTlXr
 J1mTghoAMH5UvTSPiyPTtLBo8lFWc2nE7dBRvczza+a5QDo/1/QFwB+lHzL2KmpkTt
 1YTlzUsn/3mIQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E14BE37820B7;
 Wed, 24 Jan 2024 08:47:28 +0000 (UTC)
Date: Wed, 24 Jan 2024 10:47:17 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH i-g-t v2 3/6] drm-uapi: Add drm_mode_solid_fill
Message-ID: <20240124104717.29f5ad49.pekka.paalanen@collabora.com>
In-Reply-To: <20240123-solid-fill-v2-3-4ecd2cf767fe@quicinc.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
 <20240123-solid-fill-v2-3-4ecd2cf767fe@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kUj4AVZbS13h/7s_jdjiIs0";
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
Cc: Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--Sig_/kUj4AVZbS13h/7s_jdjiIs0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Jan 2024 15:28:56 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Add the drm_mode_solid_fill struct to drm_mode.h
>=20
> This is required for https://patchwork.freedesktop.org/series/110283/
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  include/drm-uapi/drm_mode.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index 7040e7ea80c7..91b468348ba1 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -259,6 +259,30 @@ struct drm_mode_modeinfo {
>  	char name[DRM_DISPLAY_MODE_LEN];
>  };
> =20
> +/**
> + * struct drm_mode_solid_fill - User info for solid fill planes
> + *
> + * This is the userspace API solid fill information structure.
> + *
> + * Userspace can enable solid fill planes by assigning the plane "solid_=
fill"
> + * property to a blob containing a single drm_mode_solid_fill struct pop=
ulated with an RGB323232
> + * color and setting the pixel source to "SOLID_FILL".
> + *
> + * For information on the plane property, see drm_plane_create_solid_fil=
l_property()
> + *
> + * @r: Red color value of single pixel
> + * @g: Green color value of single pixel
> + * @b: Blue color value of single pixel
> + * @pad: padding, must be zero
> + */
> +struct drm_mode_solid_fill {
> +	__u32 r;
> +	__u32 g;
> +	__u32 b;
> +	__u32 pad;
> +};
> +
> +
>  struct drm_mode_card_res {
>  	__u64 fb_id_ptr;
>  	__u64 crtc_id_ptr;
>=20

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/kUj4AVZbS13h/7s_jdjiIs0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWwzpUACgkQI1/ltBGq
qqenzQ/4p92lTY5s9yjgs1q/d/8gAjd+xHsFABgbCZWSSHb+ULvxhQeMd3gkb++5
MRuwE8QFXk88zJEQoVyuh4wGisylX51L5+n43hDsgOpzcc52/u6RB1uKcFNJ8EJG
vLZbca/txGsasTuMjLpqW8XUXrB+J0vthXsAvFZiiYSks3IgvIrCTPWyZZr/fd6k
LgXfQeWQ/RKTgYUqVweqA3p07pI2XNdzcwOq1U0bStd//kPDxrf7QD7FvE3AoGZ/
gCQweRnd+OEavU6Fm23R6AOfj+Ihzo2ckPl/LiPRdNLP4oSA/DZjdaJ0LfdPJeqz
mUgPyTMbR5XjmmzHfcYcAtHQb4mDoljjnlrVNIFLA8n4AA5cOr/WsXLVZTvXsd6/
AjXHd1EniomYZgpAvdTH5VoF4VAbUV+8+MeTt+CH+p8lD9/1vrHBQZnGhOma01PU
s4ZEMJlXvExfKC5fcsWA3GuYOnu9CWseTY/mLmHLBZCazGEvNv8cyX9XN82kMD0J
TxJC6/bgLU/9Jp3QchYp9SQIi4Y9jP2Y4S3xcVv/C+gUKzaznYnw3ecldFchiqef
RC2tXEfpaIhRfbbOLCitYW7tPT+a6/e3WUMlded3RvFyXmJyar2Nbd84hc2/q5js
r/h/vNYSv3BqmugcXkDSek8AwNAvQjJ6NT39wqUm6lK4MXBHRA==
=NGJw
-----END PGP SIGNATURE-----

--Sig_/kUj4AVZbS13h/7s_jdjiIs0--
