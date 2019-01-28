Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594E86E74D
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 22:30:20 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 28 Jan 2019 22:30:18 +0000
Message-ID: <0e82117dda2d41318e5086c39efa694050e0975b.camel@intel.com>
References: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
 <20190128200126.1270-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20190128200126.1270-3-ville.syrjala@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] tools/intel_watermark: Decode wm
 blocks correctly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0602804230=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0602804230==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-3+Qt0mRyOgUfW/m1U9K2"

--=-3+Qt0mRyOgUfW/m1U9K2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-01-28 at 22:01 +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Bump up the width of the wm blocks to 11 bits, which it is on icl.
> On earlier platforms it was actually 10 bits but the code decoded
> it as 9 bits.

11? Where did you get that? BSpec says ICL still uses 10 bits and
kernel is also using 10 bits for ICL.
BSpec: 7670

>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index c98b8649cc9c..97b769250927 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -319,7 +319,7 @@ static void skl_wm_dump(void)
>  		for (level =3D 0; level < num_levels; level++) {
>  			printf("%5d", level);
>  			for (plane =3D 0; plane < num_planes; plane++) {
> -				blocks =3D
> REG_DECODE1(wm[level][pipe][plane], 0, 9);
> +				blocks =3D
> REG_DECODE1(wm[level][pipe][plane], 0, 11);
>  				lines =3D
> REG_DECODE1(wm[level][pipe][plane], 14, 5);
>  				enable =3D
> REG_DECODE1(wm[level][pipe][plane], 31, 1);
> =20
> @@ -334,7 +334,7 @@ static void skl_wm_dump(void)
> =20
>  		printf("TRANS");
>  		for (plane =3D 0; plane < num_planes; plane++) {
> -			blocks =3D REG_DECODE1(wm_trans[pipe][plane], 0,
> 9);
> +			blocks =3D REG_DECODE1(wm_trans[pipe][plane], 0,
> 11);
>  			lines =3D REG_DECODE1(wm_trans[pipe][plane], 14,
> 5);
>  			enable =3D REG_DECODE1(wm_trans[pipe][plane], 31,
> 1);
> =20

--=-3+Qt0mRyOgUfW/m1U9K2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxPgngACgkQVenbO/mO
WklsAAf/bFKWlKd01EZ9itUJxRLjOWL2oXLnpIseJ+PwDNKdT4zNNGxwgQg3ge1I
PxwAuimKPZXLifrvJV/u9FgpT9+JT04aTGUUWVqEkyIbGt5hpVIfFLqFMX0LP6+s
2JjQvUsvd5X0iSYG6COmq2cDVaUr93OVdpQwvFcNmVCJj9qE9fY2jV6Z7Fbfsm2N
HDyiabSFWgebrNHlMlBDGdB0R5f9SaDoG9Pc2FCR9zC6m+//FbCqkvB8g8Jisuxn
TVepb3/OTk6NS4/owrQXvXGYW3E8HHpkAH/tAGiAlyFYH/yEcFJ9OkIzutDbzkC2
3eT4v7e7ntT1B3qCPQDzCLyAqZ2uBQ==
=3J6D
-----END PGP SIGNATURE-----

--=-3+Qt0mRyOgUfW/m1U9K2--

--===============0602804230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0602804230==--
