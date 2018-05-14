Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 82CFC89BDB
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 14:43:18 +0000 (UTC)
Message-ID: <1a75f00122de239dcfc55caeca24f43e3fc5d7ae.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 16:41:43 +0200
In-Reply-To: <ad27c9b88bd9d9f07b4dc902ee80181ae905ff6c.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <ad27c9b88bd9d9f07b4dc902ee80181ae905ff6c.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 10/12] chamelium: Add format support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1666356809=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1666356809==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-pNnJbl65tx9sLyny3QBB"


--=-pNnJbl65tx9sLyny3QBB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> In order to introduce subtests for DRM formats, we need to take an
> intermediate step.

Maybe make it clear in the commit subject that this concerns the CRC
tests only. We could (and probably should) be doing the same with the
full-frame comparison tests.

> The current code will generate a pattern in XR24, and will try to compare
> the CRC returned by the Chamelium for each frames.
>=20
> This CRC is computed on an XR24 format as well, so it works. However, as
> soon as we will start implementing other formats, if we just change the
> format of the pattern, the raw content of the buffer, and therefore the
> CRC's won't match anymore.
>=20
> In order to address that, we will need an intermediate step, and we will
> now still create the XR24 pattern, and compute its CRC, then convert it t=
o
> the format we want to test, and finally retrieve the CRC from the Chameli=
um
> to compare it with the one from the XR24 pattern.
>=20
> The current code is converted to the new prototype that will take the
> fourcc of the format to test, even though we're still using XR24 everywhe=
re
> for now.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  tests/kms_chamelium.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>=20
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 2b82f2597c73..9cd05b83076a 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -524,21 +524,25 @@ static int chamelium_get_pattern_fb(data_t *data, d=
rmModeModeInfo *mode,
> =20
>  static void do_test_display_crc(data_t *data, struct chamelium_port *por=
t,
>  				igt_output_t *output, drmModeModeInfo *mode,
> -				int count)
> +				uint32_t fourcc, int count)
>  {
>  	igt_crc_t *crc;
>  	igt_crc_t *expected_crc;
>  	struct chamelium_fb_crc_async_data *fb_crc;
> -	struct igt_fb fb;
> +	struct igt_fb frame_fb, fb;
>  	int i, fb_id, captured_frame_count;
> +	int frame_id;
> =20
>  	fb_id =3D chamelium_get_pattern_fb(data, mode, DRM_FORMAT_XRGB8888, &fb=
);
>  	igt_assert(fb_id > 0);
> =20
> +	frame_id =3D igt_fb_convert(&frame_fb, &fb, fourcc);
> +	igt_assert(frame_id > 0);
> +
>  	fb_crc =3D chamelium_calculate_fb_crc_async_start(data->drm_fd,
>  							&fb);
> =20
> -	enable_output(data, port, output, mode, &fb);
> +	enable_output(data, port, output, mode, &frame_fb);
> =20
>  	/* We want to keep the display running for a little bit, since
>  	 * there's always the potential the driver isn't able to keep
> @@ -562,6 +566,7 @@ static void do_test_display_crc(data_t *data, struct =
chamelium_port *port,
>  	free(expected_crc);
>  	free(crc);
> =20
> +	igt_remove_fb(data->drm_fd, &frame_fb);
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
> =20
> @@ -580,7 +585,7 @@ static drmModeModeInfo *find_preferred_mode(drmModeCo=
nnector *connector)
>  }
> =20
>  static void test_display_crc_one_mode(data_t *data, struct chamelium_por=
t *port,
> -				      int count)
> +				      uint32_t fourcc, int count)
>  {
>  	igt_output_t *output;
>  	drmModeConnector *connector;
> @@ -597,13 +602,13 @@ static void test_display_crc_one_mode(data_t *data,=
 struct chamelium_port *port,
>  	mode =3D find_preferred_mode(connector);
>  	igt_assert(mode);
> =20
> -	do_test_display_crc(data, port, output, mode, count);
> +	do_test_display_crc(data, port, output, mode, fourcc, count);
> =20
>  	drmModeFreeConnector(connector);
>  }
> =20
>  static void test_display_crc_all_modes(data_t *data, struct chamelium_po=
rt *port,
> -					int count)
> +				       uint32_t fourcc, int count)
>  {
>  	igt_output_t *output;
>  	igt_plane_t *primary;
> @@ -620,7 +625,7 @@ static void test_display_crc_all_modes(data_t *data, =
struct chamelium_port *port
>  	for (i =3D 0; i < connector->count_modes; i++) {
>  		drmModeModeInfo *mode =3D &connector->modes[i];
> =20
> -		do_test_display_crc(data, port, output, mode, count);
> +		do_test_display_crc(data, port, output, mode, fourcc, count);
>  	}
> =20
>  	drmModeFreeConnector(connector);
> @@ -881,13 +886,16 @@ igt_main
>  							edid_id, alt_edid_id);
> =20
>  		connector_subtest("dp-crc-single", DisplayPort)
> -			test_display_crc_all_modes(&data, port, 1);
> +			test_display_crc_all_modes(&data, port,
> +						   DRM_FORMAT_XRGB8888, 1);
> =20
>  		connector_subtest("dp-crc-fast", DisplayPort)
> -			test_display_crc_one_mode(&data, port, 1);
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_XRGB8888, 1);
> =20
>  		connector_subtest("dp-crc-multiple", DisplayPort)
> -			test_display_crc_all_modes(&data, port, 3);
> +			test_display_crc_all_modes(&data, port,
> +						   DRM_FORMAT_XRGB8888, 3);
> =20
>  		connector_subtest("dp-frame-dump", DisplayPort)
>  			test_display_frame_dump(&data, port);
> @@ -945,13 +953,16 @@ igt_main
>  							edid_id, alt_edid_id);
> =20
>  		connector_subtest("hdmi-crc-single", HDMIA)
> -			test_display_crc_all_modes(&data, port, 1);
> +			test_display_crc_all_modes(&data, port,
> +						   DRM_FORMAT_XRGB8888, 1);
> =20
>  		connector_subtest("hdmi-crc-fast", HDMIA)
> -			test_display_crc_one_mode(&data, port, 1);
> +			test_display_crc_one_mode(&data, port,
> +						  DRM_FORMAT_XRGB8888, 1);
> =20
>  		connector_subtest("hdmi-crc-multiple", HDMIA)
> -			test_display_crc_all_modes(&data, port, 3);
> +			test_display_crc_all_modes(&data, port,
> +						   DRM_FORMAT_XRGB8888, 3);
> =20
>  		connector_subtest("hdmi-frame-dump", HDMIA)
>  			test_display_frame_dump(&data, port);
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-pNnJbl65tx9sLyny3QBB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5oCcACgkQ3cLmz3+f
v9FI9Af9EIj1NCmBx8LB1M+U/4glxCLFwXKRZgYPqs4iwYdOIBnSmXU7kFxiLNUF
tUnZ+Qn+9z9gydk0R4Of1OymPuPTZKzL5qwqKCYcxfR4ngycd4cDFenzsiEEFUUa
DYPqHC1mrOIf8SUTN/c0UoR5rkHf6Yu1h0SgXw7mLYnfjhdcrx8OZlKxfIs0D/9y
3xTDcLYvcNtRWLLgGusj1Z8lpclkPxVfVUUnLiI8gD+XzB54yf4++ikuSolLm/yW
ArhscCWSMjtaLlPonjjEWbX3lLrVGOYwR1iIM73dbOQj/I8oMEWB/Wr3d/C53o7n
N1zhQtnM6Y5QcYVG2Y6kgRsfthn/gA==
=71qf
-----END PGP SIGNATURE-----

--=-pNnJbl65tx9sLyny3QBB--


--===============1666356809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1666356809==--
