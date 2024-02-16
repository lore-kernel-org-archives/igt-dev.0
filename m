Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7525C48260
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 08:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C9110E494;
	Fri, 16 Feb 2024 08:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="rGQODclN";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D3010E494
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708073209;
 bh=9nqQX0ufxT+fisMOZyOnUMYwRRdg7gjEeHKLPGbjYP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rGQODclNJ17XwJvSRx0nzfh1HLTglwnMddG7PLt5H9BQ6BBm5930UPAV/hLlqZQdU
 5K6xkmP4m7Th8sAWdrVUGGQIurGMa6NsNTLwSgUtvTET1zrCA5QjC6KyCdWazW8WJe
 0jV4E3Jxjc4b8UlJ7angD7nmMTxFTRNq8JqmUj4+6aXS00QWCeMQSvUA57iCqnXA70
 44QAZ0yxfIKAu+bM1G19TRkAuYeCigXu0iM3W76ZXp9qp2aszeBb6W9RJKetQmJJ25
 YcLfzmCG7ES9B09s0OIgDsO7cTLYbFHoJImdPe0Q7M9y8NfMxoPewjB8ajHQ9IXc8O
 0Td55wdSN/d2A==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D6E5378000B;
 Fri, 16 Feb 2024 08:46:49 +0000 (UTC)
Date: Fri, 16 Feb 2024 10:46:47 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Enable DRM_CLIENT_CAP_ATOMIC
 before enabling DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
Message-ID: <20240216104647.1c6cfef1.pekka.paalanen@collabora.com>
In-Reply-To: <20240215-duplicate-calls-v1-1-512afbe1bda7@riseup.net>
References: <20240215-duplicate-calls-v1-0-512afbe1bda7@riseup.net>
 <20240215-duplicate-calls-v1-1-512afbe1bda7@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IOmWsHwSoUJ0NLd5pMo4Pjb";
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

--Sig_/IOmWsHwSoUJ0NLd5pMo4Pjb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Feb 2024 16:21:04 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> As stated at [1], we first need to set DRM_CLIENT_CAP_ATOMIC before
> setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS. Fix that.
>=20
> [1]: https://docs.kernel.org/gpu/drm-uapi.html?highlight=3Dwriteback#c.DR=
M_CLIENT_CAP_WRITEBACK_CONNECTORS
>=20
> Fixes: 3642acbb74f5 ("lib/igt_kms: Add writeback support")
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  lib/igt_kms.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1b4d0d7612a2..e18f6fe59882 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2747,6 +2747,9 @@ void igt_display_require(igt_display_t *display, in=
t drm_fd)
>  	display->drm_fd =3D drm_fd;
>  	is_intel_dev =3D is_intel_device(drm_fd);
> =20
> +	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
> +		display->is_atomic =3D 1;
> +
>  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> =20
>  	resources =3D drmModeGetResources(display->drm_fd);
> @@ -2795,8 +2798,6 @@ void igt_display_require(igt_display_t *display, in=
t drm_fd)
>  	}
> =20
>  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);

The docs also say that enabling DRM_CLIENT_CAP_ATOMIC implicitly
enables DRM_CLIENT_CAP_UNIVERSAL_PLANES. But since enabling atomic can
fail, setting universal planes explicitly should not be dropped.

IOW, this code works as far as I can see, but perhaps the client cap
ordering is slightly less logical now. I think it's a purely cosmetic
thing.

> -	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
> -		display->is_atomic =3D 1;
> =20
>  	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, =
1) =3D=3D 0)
>  		display->has_virt_cursor_plane =3D 1;
>=20

Anyway, this looks ok to me, so

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

and the patch 2/2 acked-by me too.


Thanks,
pq

--Sig_/IOmWsHwSoUJ0NLd5pMo4Pjb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXPIPcACgkQI1/ltBGq
qqcYKw//foNT1vsBJqDi1K0slsgAfHWBWyOUGOk4puPGtdDqZvOzJqjTvt33uUEJ
91ux45iJJ34fTOrK2KIY09FuqJ+d1nSzoHrUt1RizFpJs9v+pcAga+lCXWEc1xPi
5T7Mw8ZgyxmvCk5TA7xKbrnKDdz7ZXH3KXybi3av6p9uNYmcM1m0a6rcU7+0GOWB
RB91wImo63nzB+ASI/85KPOCxVl4Fallpr1MH8LUjk20/alm5Vc4BPv3BtgCctOR
9knyy7JPuKOfsRQlMIJf+6YgYYOh4GJNNqkCjHn6Iqyn3HTaL5RiG6x9+2BXtDey
PDo781gCXjCg/Y/X8yCOZC0hQXl+yL1QvB9e7jxOaGIUNiEV0tm7+BRcjx4xZiC8
8Dj61WkIe6/TrRnl9Qh/u4DtoztB129bpSLmaLaLxiDM8N0N/1qNCtEkpHNmQe5A
+xoS1iuF29rZftdAGLFuEAtPWOQnp97cBzco8vWfNR8yxQDfTdN/1YBvXgXo3tHb
ZyuYzkkghA6OIty/94Ok6Gybl1M1Ben0KjUcV8cnY4/HUD1uIo+HW6qUtWfGTKrQ
vAdDnBbvqGCci4oXgOfJKY0dEo+/J+c1ZM5HwGo2RwfFrmytWkPjluerVNBiX7Y1
8MFyrouKO7aUgsRDaftYeVqjgKPdE00IzeSsWdApNbrjAAXEG2A=
=zy2X
-----END PGP SIGNATURE-----

--Sig_/IOmWsHwSoUJ0NLd5pMo4Pjb--
