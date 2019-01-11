Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id B0F166F760
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 15:15:19 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:15:18 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190111151518.u4bbdgpr3syflhbq@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-13-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190111090532.19235-13-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 12/21] lib/igt_vc4: Add helper for
 checking SAND tiling support on plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0788254300=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0788254300==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vvrjdnddp3xoks34"
Content-Disposition: inline


--vvrjdnddp3xoks34
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:05:23AM +0100, Paul Kocialkowski wrote:
> This introduces a convenience helper for checking whether a plane
> supports SAND tiling for a given format.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  lib/igt_vc4.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> index 9118ae193f60..cb980541a61f 100644
> --- a/lib/igt_vc4.h
> +++ b/lib/igt_vc4.h
> @@ -33,6 +33,30 @@ static inline bool igt_vc4_plane_supports_t_tiling(igt=
_plane_t *plane,
>  					DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED);
>  }
> =20
> +static inline bool igt_vc4_plane_supports_sand_tiling(igt_plane_t *plane,
> +						      uint32_t format,
> +						      size_t column_width_bytes)
> +{
> +	uint64_t modifier;
> +
> +	switch (column_width_bytes) {
> +	case 32:
> +		modifier =3D DRM_FORMAT_MOD_BROADCOM_SAND32;
> +		break;
> +	case 64:
> +		modifier =3D DRM_FORMAT_MOD_BROADCOM_SAND64;
> +		break;
> +	case 128:
> +		modifier =3D DRM_FORMAT_MOD_BROADCOM_SAND128;
> +		break;
> +	case 256:
> +		modifier =3D DRM_FORMAT_MOD_BROADCOM_SAND256;
> +		break;
> +	}
> +
> +	return igt_plane_has_format_mod(plane, format, modifier);
> +}
> +

I'm not quite sure what that function is supposed to be doing, or
rather, why do you need the column_width_bytes parameter.

If that function was just about checking whether the sand tiling is
supported, then you can just return an or'd igt_plane_has_format_mod
of all the modifiers supported, right?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vvrjdnddp3xoks34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDizBgAKCRDj7w1vZxhR
xckzAQChM2rDEZSXTZeeksnURUIo1esIYx6i7i6wIGJIMa5AdwD7BQhY2Y6YKdAE
yF7mKXw43FpaifyOk1sy5+GlYHdlrAM=
=GNQo
-----END PGP SIGNATURE-----

--vvrjdnddp3xoks34--

--===============0788254300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0788254300==--
