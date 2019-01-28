Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2C36E743
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 22:19:52 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 28 Jan 2019 22:19:50 +0000
Message-ID: <2fe10722756e3e34ca08ecd179c99733694d875c.camel@intel.com>
References: <20190128200126.1270-1-ville.syrjala@linux.intel.com>
 <20190128200126.1270-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20190128200126.1270-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] tools/intel_watermark: More biths
 for PLANE_BUF_CFG
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0586828122=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0586828122==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-kW4IqNNK+5CSJ7PHb+5Q"

--=-kW4IqNNK+5CSJ7PHb+5Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"biths"? I guess this is a typo.

Other than that LGTM:
Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

On Mon, 2019-01-28 at 22:01 +0200, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> On icl PLANE_BUF_CFG fields are 11 bits. Decode them correctly.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tools/intel_watermark.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
> index b61a26f1cd57..c98b8649cc9c 100644
> --- a/tools/intel_watermark.c
> +++ b/tools/intel_watermark.c
> @@ -349,20 +349,20 @@ static void skl_wm_dump(void)
> =20
>  		printf("\nstart");
>  		for (plane =3D 0; plane < num_planes; plane++) {
> -			start =3D REG_DECODE1(buf_cfg[pipe][plane], 0,
> 10);
> +			start =3D REG_DECODE1(buf_cfg[pipe][plane], 0,
> 11);
>  			printf("%10d", start);
>  		}
> =20
>  		printf("\n  end");
>  		for (plane =3D 0; plane < num_planes; plane++) {
> -			end =3D REG_DECODE1(buf_cfg[pipe][plane], 16,
> 10);
> +			end =3D REG_DECODE1(buf_cfg[pipe][plane], 16,
> 11);
>  			printf("%10d", end);
>  		}
> =20
>  		printf("\n size");
>  		for (plane =3D 0; plane < num_planes; plane++) {
> -			start =3D REG_DECODE1(buf_cfg[pipe][plane], 0,
> 10);
> -			end =3D  REG_DECODE1(buf_cfg[pipe][plane], 16,
> 10);
> +			start =3D REG_DECODE1(buf_cfg[pipe][plane], 0,
> 11);
> +			end =3D  REG_DECODE1(buf_cfg[pipe][plane], 16,
> 11);
>  			size =3D end - start + 1;
>  			printf("%10d", (end =3D=3D 0 && size =3D=3D 1) ? 0 :
> size);
>  		}

--=-kW4IqNNK+5CSJ7PHb+5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxPgAUACgkQVenbO/mO
Wkl/EAgAi5X13/gUVUR4uqQdaKuZ/Cd2QLhdgqXLsXkNrqLdkMp8vsttzW6BeRXX
2m2wziPQLObeKiigHvfjmE2SHNRU9TUkxynVXdB/b3dOCyFD28uoif3eYwiNDwp5
K0VKZCSD4DVM3v0nriJUtF85Ei4ap8nF1VCeqpw1F2Aii0+v42l3kD8JIik0Xey8
ur68RJnJDQlr7TdsdtR/lGNOnsYbwAqTihgrFJW2iVzsLqUcIhkN48qZXj9cwNpr
bpeEv3O0MW8y0XRrXoE332IOUckRv5cE3EgooCUVnUTZmVa9SP9Z8DJVm8jv86jS
kVyqoK9+Q664X15KSMsz21Nw6qTLaw==
=2SzG
-----END PGP SIGNATURE-----

--=-kW4IqNNK+5CSJ7PHb+5Q--

--===============0586828122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0586828122==--
