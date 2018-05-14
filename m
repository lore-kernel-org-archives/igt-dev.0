Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 352D988E95
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 14:48:04 +0000 (UTC)
Message-ID: <3e361e107291ef1eecf7ca78c21fdafb59e5514a.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 16:46:29 +0200
In-Reply-To: <ffa449ceb2649d040d9b58ecdac30d1cec046200.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <ffa449ceb2649d040d9b58ecdac30d1cec046200.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 11/12] chamelium: Add format subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1971737024=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1971737024==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-P8xnUxPBDTeUlj8OwgHO"


--=-P8xnUxPBDTeUlj8OwgHO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> Now that we have everything in place, we can add the support for the
> subtests testing the output of planes setup with formats other than XR24.
> Since YUV will be a bit trickier to handle, start with various common RGB
> formats.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  tests/kms_chamelium.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 9cd05b83076a..4a634c9e456d 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -964,6 +964,34 @@ igt_main
>  			test_display_crc_all_modes(&data, port,
>  						   DRM_FORMAT_XRGB8888, 3);
> =20
> +		connector_subtest("hdmi-crc-argb8888", HDMIA)
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_ARGB8888, 1);
> +
> +		connector_subtest("hdmi-crc-abgr8888", HDMIA)
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_ABGR8888, 1);
> +
> +		connector_subtest("hdmi-crc-xrgb8888", HDMIA)
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_XRGB8888, 1);
> +
> +		connector_subtest("hdmi-crc-rgb565", HDMIA)
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_RGB565, 1);
> +
> +		connector_subtest("hdmi-crc-bgr565", HDMIA)
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_BGR565, 1);
> +
> +		connector_subtest("hdmi-crc-argb1555", HDMIA)
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_ARGB1555, 1);
> +
> +		connector_subtest("hdmi-crc-xrgb1555", HDMIA)
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_XRGB1555, 1);
> +
>  		connector_subtest("hdmi-frame-dump", HDMIA)
>  			test_display_frame_dump(&data, port);
>  	}
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-P8xnUxPBDTeUlj8OwgHO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5oUUACgkQ3cLmz3+f
v9EtwQf8Dj3G7Hv8a5ttQbGB+zRwzoVMrNIbgm0Mqo+qw4h28guh2k03pqsvWj2L
rP0zKC9vh4ZuKTTWcHBmPLaymYmuDUSpAIX8EDNhl3gF9ZuwBnUPi4L5y9K2xhjP
kk7i4AdFIHLYQt00HCOA6gf1xNwUX6WQB+kJqb3MfkvPjcnpGWBa/TP3lBc6YnZK
pymkMWNBdVByJsIgx7vqqa2mOLCWTTP1OOaQ9hxfvux30HGm4ndWhoeDlU5nWkhd
8CWkHAuRY3eC8w3f5dZvCgtxl273gKwaaAQB02wUEzIwttOt/4cVRMdDFz0BfmNg
Y0sMIwBk5yVQOv9BDP9h7CaHZi8l1Q==
=3H82
-----END PGP SIGNATURE-----

--=-P8xnUxPBDTeUlj8OwgHO--


--===============1971737024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1971737024==--
