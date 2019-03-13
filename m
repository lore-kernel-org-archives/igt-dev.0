Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4576E067
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 07:54:12 +0000 (UTC)
Date: Wed, 13 Mar 2019 09:54:07 +0200
From: Marius Vlad <marius.vlad@collabora.com>
Message-ID: <20190313075407.GA1154@xpredator>
References: <20190311171309.25383-1-marius.vlad@collabora.com>
 <20190311171309.25383-2-marius.vlad@collabora.com>
 <1552326341.3561.0.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1552326341.3561.0.camel@pengutronix.de>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2 v3] kms_atomic: Add subtest for
 testing zpos plane property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0861636544=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: igt-dev@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, petri.latvala@intel.com, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>


--===============0861636544==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 06:45:41PM +0100, Philipp Zabel wrote:
> On Mon, 2019-03-11 at 19:13 +0200, Marius Vlad wrote:
> > From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> >=20
> > We use a 16-bit pixel buffer format for the overlay plane, as some older
> > HW might not be capable of driving a 32-bit pixel format.
> >=20
> > Changes since v2:
> > - use 0 for igt_paint_color_alpha() alpha parameter, as ARGB1555 uses
> > just 1 bit for (of) alpha.
> >=20
> > Changes since v1:
> > - fix 'commitintg' with 'committing' (Philipp Zabel)
> > - replace RGB565 with ARGB1555 (Philipp Zabel)
> > - test plane if it supports the pixel format supplied (Philipp Zabel)
> >=20
> > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Thanks Philipp, patches have been pushed.
>=20
> regards
> Philipp

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAlyItxwACgkQ9jQS5glH
1u8cfRAA1rtmb/1gaE7ytYeFatHr0dFIAyx8E5TAcqN4zX8LMjZSjSh3hZRJA92/
hvOGC7v1TM1lqOjTLZNzsffLu9qUxSiVfn2LDG7yiZU9Ap2viAD17bQkzgvrCQ42
9LvBRj21ugq2fdFO8cE4JN5j2BhYWXL81jAHj3A1ArVcxMoeH0y9kuHk77SNb1ls
nBm4jBNSKor4GRStm6ttrydIbS4kA3y+/x6u4WCaaMxbnvKzGeevfxgYwN5h/7aN
QLqTG2KY4Q8JwPtcXPCOMnsIq3FK7IGwAw7HsLo7vtH+PolYa/YEAcQtHKtjT8cE
l3GdqNndFzTWc7t3J7gPOQiJb72a71qyAbuN0gXx8hRKOxzQNr10yklADi37cfv5
tTskG6TpxeG4YzxV0dhiw5jFcxv2HSGXXHYvR8VES7J+Ot9WQczR7lKezYiu5U8G
4rILV2ClBs3FeoJh6D58whtjL57t3R1KddnUH61eDwiT557fmHMkhpGoSPlUi0oj
hPplAqnVzw0q00hyJh7VzO2qlfIhCCCXsqm5Si+3ywoEQy0pIgMouICNPX3xrFPh
SRhXqVGZih8P7p7AKzsaYIprXhNSw2gt1g0NZyF+fe2TjvOn1MezxVVOg2H4y2n/
1nsCtA9te/FtCb6ENKBEaeIsFr8320jObUbkCJ2AvghA99PEzG4=
=Y4pd
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

--===============0861636544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0861636544==--
