Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 096D06E059
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 13:47:00 +0000 (UTC)
Message-ID: <1ebc79c573c576fb5a5147256bd04967dd9a15bc.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 15:45:26 +0200
In-Reply-To: <6ffec1262d760c93811a8dd8230ac446a66068d7.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <6ffec1262d760c93811a8dd8230ac446a66068d7.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 04/12] fb: Add more formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2030487291=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============2030487291==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/cA/LGqQtjmSGD0j/XOE"


--=-/cA/LGqQtjmSGD0j/XOE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> We're going to need some DRM formats that are not defined in the
> format_desc_struct. Make sure we add them.

The commit subject line feels a bit vague here, as it doesn't mention
where these formats are added and what is added regarding these formats
(it's obvious that it's their definition when reading the patch, but it
could be a number of other things, which won't be obvious when reading
the subject line only).

Cheers,

> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  lib/igt_fb.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 1de6f9f6c275..c6e6b0377ae5 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -70,10 +70,14 @@ static struct format_desc_struct {
>  	int planes;
>  	int plane_bpp[4];
>  } format_desc[] =3D {
> +	DF(ARGB1555,	INVALID,	a1r5g5b5,	16, 16),
> +	DF(XRGB1555,	INVALID,	x1r5g5b5,	16, 16),
>  	DF(RGB565,	RGB16_565,	r5g6b5,		16, 16),
> +	DF(BGR565,	INVALID,	b5g6r5,		16, 16),
>  	//DF(RGB888,	INVALID,	r8g8b8,		24, 24),
>  	DF(XRGB8888,	RGB24,		x8r8g8b8,	32, 24),
>  	DF(XRGB2101010,	RGB30,		x2r10g10b10,	32, 30),
> +	DF(ABGR8888,	INVALID,	a8b8g8r8,	32, 32),
>  	DF(ARGB8888,	ARGB32,		a8r8g8b8,	32, 32),
>  	DF(NV12,	RGB24,		invalid,	32, -1, 2, {8, 16}),
>  };

--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-/cA/LGqQtjmSGD0j/XOE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5kvYACgkQ3cLmz3+f
v9HC4gf/R2OOeKIu/BY302aapx/fp2Gr4r0zXoeqiKC2R92DYSYM5kBEgUTLB0HG
saa7xAIDYjy9l22s6VRozEcr40wtbdX7JlyHkjxSYWXRsDk+RuAJ77hkpb76yhej
79cWEEN38U2ZQYTsAbIAIKcA2Kc+YT2Wmb0woN4R8b70Bmc5w2V7aGnAiKV0lkxM
5gnwMHLSygx+pJosqmq9xW+rQciclrtxLj6WXLRs9QQQlNFA5aZZ6u9HvB4JCkvD
mwvLDXdjxEN29CT7jN7Mb5aJHDXpJdOL5YzqzOAPtPBg9skNG+M8tDBZPMiqreWd
1k3Xx4FxWxK5w52jcZSr3r0nZ2RiFw==
=m5s3
-----END PGP SIGNATURE-----

--=-/cA/LGqQtjmSGD0j/XOE--


--===============2030487291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2030487291==--
