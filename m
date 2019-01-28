Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BA189803
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 22:16:53 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 28 Jan 2019 22:16:51 +0000
Message-ID: <9f0a9db30498f1e8c39c691053b5a6f0989bede2.camel@intel.com>
References: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] tools/intel_watermark: Bump number
 of planes to 8 for icl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1510128244=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1510128244==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-6XJj2RrCXPJbOQOSrCau"

--=-6XJj2RrCXPJbOQOSrCau
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-01-28 at 22:01 +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> icl has 8 planes per pipe. Bump the limits to match.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index 3fd37441cba7..b61a26f1cd57 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -137,7 +137,9 @@ static int is_hsw_plus(uint32_t d)
> =20
>  static int skl_num_planes(uint32_t d, int pipe)
>  {
> -	if (IS_GEN10(d) || IS_GEMINILAKE(d))
> +	if (IS_GEN11(d))
> +		return 8;
> +	else if (IS_GEN10(d) || IS_GEMINILAKE(d))
>  		return 5;
>  	else if (IS_BROXTON(d))
>  		return pipe =3D=3D 2 ? 4 : 5;
> @@ -147,7 +149,9 @@ static int skl_num_planes(uint32_t d, int pipe)
> =20
>  static int skl_max_planes(uint32_t d)
>  {
> -	if (IS_GEN10(d) || IS_GEMINILAKE(d) || IS_BROXTON(d))
> +	if (IS_GEN11(d))
> +		return 8;
> +	else if (IS_GEN10(d) || IS_GEMINILAKE(d) || IS_BROXTON(d))
>  		return 5;
>  	else
>  		return 4;

--=-6XJj2RrCXPJbOQOSrCau
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxPf1EACgkQVenbO/mO
WklnaQgAgjaHLcBNtbVd5M7bvwoxO3bX10yUtXzxDDKwzI7zUtjD78rUhlgu1QwV
09dwAMM9x3U1yM2zg/wNLCReBNr4QM81mh6Q5qF7SoGAMdPiYPutTLtXxfJKRrop
s2As+N0ojwf8DTCtTyeNp8DA8jPE+2cOigIoA2YpRR1kxO1UDgn552UYrfAP/9i8
YWzJa/lnsoJcHF7MfF5CCSNyLOlzJ3X6VayKMKAOPMuVNedjnQkkmIFqrczAI0oK
jYKn2fwRK5+BSQSq2osm4vpldMAo8EmqrnATs/39RGcoXTwRDwDZGv/vPs4TlPPi
yzmvwbCpGCgO08To22GxLCBcdPkjgA==
=zKaZ
-----END PGP SIGNATURE-----

--=-6XJj2RrCXPJbOQOSrCau--

--===============1510128244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1510128244==--
