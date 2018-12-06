Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 578F06E5F3
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Dec 2018 14:33:06 +0000 (UTC)
Date: Thu, 6 Dec 2018 15:32:48 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181206143248.mjk2kw5icq5un4hs@flea>
References: <20181206141132.23349-1-paul.kocialkowski@bootlin.com>
 <20181206141132.23349-8-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181206141132.23349-8-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/9] lib/igt_fb: Add a
 stride-provisioned fashion of igt_fb_convert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1224487615=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1224487615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ibmeeyiwe6ipygjc"
Content-Disposition: inline


--ibmeeyiwe6ipygjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

65;5402;1c
On Thu, Dec 06, 2018 at 03:11:30PM +0100, Paul Kocialkowski wrote:
> The current implementation of igt_fb_convert does not allow passing
> the destination stride, which is something we want to change for tests.
>=20
> Add a new fashion of this function that allocates the desintation buffer
> with a given stride. Since the current function does the same thing with
> an unspecified stride (set to zero, which will be filled later), make it
> call our new fashion with the stride set to zero to avoid duplication.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  lib/igt_fb.c | 38 ++++++++++++++++++++++++++++++++------
>  lib/igt_fb.h |  3 +++
>  2 files changed, 35 insertions(+), 6 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 61250b0e..1548bf4e 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2253,14 +2253,15 @@ void igt_remove_fb(int fd, struct igt_fb *fb)
>  }
> =20
>  /**
> - * igt_fb_convert:
> + * igt_fb_convert_with_stride:
>   * @dst: pointer to the #igt_fb structure that will store the conversion=
 result
>   * @src: pointer to the #igt_fb structure that stores the frame we conve=
rt
>   * @dst_fourcc: DRM format specifier to convert to
> + * @dst_stride: DRM format specifier to convert to

I'm not sure that's what you meant :)

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ibmeeyiwe6ipygjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXAkzEAAKCRDj7w1vZxhR
xTDVAP0V2e4p9xnsAB+wR6u9R8VxqHTEr7KYr9BiWp88Giy8BwEA6zqatps7Teh5
RdHUvZkMioGm4KmajY3AconM5AdiTAc=
=A9k8
-----END PGP SIGNATURE-----

--ibmeeyiwe6ipygjc--

--===============1224487615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1224487615==--
