Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF1156E05D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 13:57:24 +0000 (UTC)
Message-ID: <47f8f21a23c58b2b99f8887ac85a9a038ffb4cf8.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 15:55:50 +0200
In-Reply-To: <db1971640f87b5491941bdc3e0711064ac6385f7.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <db1971640f87b5491941bdc3e0711064ac6385f7.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 06/12] chamelium: Split CRC test
 function in two
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0621749217=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0621749217==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-p6ETmjpEnyTeHBAD3eBG"


--=-p6ETmjpEnyTeHBAD3eBG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> We have two use cases in our current sub-test suites: the tests that test
> all the modes exposed by the driver, and the ones just picking up one.
>=20
> Instead of having to deal with this two cases in the same function as it =
is
> currently done, move the part that test a single mode into a separate
> function, and just call it for every mode that we want to test if needs b=
e.
>=20
> This will result in a simpler function that will be easier to extend to
> support formats.

Thanks for making that change!

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  tests/kms_chamelium.c | 121 +++++++++++++++++++++++++------------------
>  1 file changed, 73 insertions(+), 48 deletions(-)
>=20
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 2bc34d07788d..490bacc6f5fe 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -486,20 +486,61 @@ enable_output(data_t *data,
>  	drmModeFreeConnector(connector);
>  }
> =20
> -static void
> -test_display_crc(data_t *data, struct chamelium_port *port, int count,
> -		 bool fast)
> +static void do_test_display_crc(data_t *data, struct chamelium_port *por=
t,
> +				igt_output_t *output, drmModeModeInfo *mode,
> +				int count)
>  {
> -	igt_output_t *output;
> -	igt_plane_t *primary;
>  	igt_crc_t *crc;
>  	igt_crc_t *expected_crc;
>  	struct chamelium_fb_crc_async_data *fb_crc;
>  	struct igt_fb fb;
> -	drmModeModeInfo *mode;
> +	int i, fb_id, captured_frame_count;
> +
> +	fb_id =3D igt_create_color_pattern_fb(data->drm_fd,
> +					    mode->hdisplay,
> +					    mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888,
> +					    LOCAL_DRM_FORMAT_MOD_NONE,
> +					    0, 0, 0, &fb);
> +	igt_assert(fb_id > 0);
> +
> +	fb_crc =3D chamelium_calculate_fb_crc_async_start(data->drm_fd,
> +							&fb);
> +
> +	enable_output(data, port, output, mode, &fb);
> +
> +	/* We want to keep the display running for a little bit, since
> +	 * there's always the potential the driver isn't able to keep
> +	 * the display running properly for very long
> +	 */
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, count);
> +	crc =3D chamelium_read_captured_crcs(data->chamelium,
> +					   &captured_frame_count);
> +
> +	igt_assert(captured_frame_count =3D=3D count);
> +
> +	igt_debug("Captured %d frames\n", captured_frame_count);
> +
> +	expected_crc =3D chamelium_calculate_fb_crc_async_finish(fb_crc);
> +
> +	for (i =3D 0; i < captured_frame_count; i++)
> +		chamelium_assert_crc_eq_or_dump(data->chamelium,
> +						expected_crc, &crc[i],
> +						&fb, i);
> +
> +	free(expected_crc);
> +	free(crc);
> +
> +	igt_remove_fb(data->drm_fd, &fb);
> +}
> +
> +static void test_display_crc_one_mode(data_t *data, struct chamelium_por=
t *port,
> +				      int count)
> +{
> +	igt_output_t *output;
>  	drmModeConnector *connector;
> -	int fb_id, i, j, captured_frame_count;
> -	int count_modes;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> =20
>  	reset_state(data, port);
> =20
> @@ -508,46 +549,30 @@ test_display_crc(data_t *data, struct chamelium_por=
t *port, int count,
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_assert(primary);
> =20
> -	count_modes =3D fast ? 1 : connector->count_modes;
> -
> -	for (i =3D 0; i < count_modes; i++) {
> -		mode =3D &connector->modes[i];
> -		fb_id =3D igt_create_color_pattern_fb(data->drm_fd,
> -						    mode->hdisplay,
> -						    mode->vdisplay,
> -						    DRM_FORMAT_XRGB8888,
> -						    LOCAL_DRM_FORMAT_MOD_NONE,
> -						    0, 0, 0, &fb);
> -		igt_assert(fb_id > 0);
> -
> -		fb_crc =3D chamelium_calculate_fb_crc_async_start(data->drm_fd,
> -								&fb);
> +	do_test_display_crc(data, port, output, &connector->modes[0], count);
> =20
> -		enable_output(data, port, output, mode, &fb);
> -
> -		/* We want to keep the display running for a little bit, since
> -		 * there's always the potential the driver isn't able to keep
> -		 * the display running properly for very long
> -		 */
> -		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, count);
> -		crc =3D chamelium_read_captured_crcs(data->chamelium,
> -						   &captured_frame_count);
> -
> -		igt_assert(captured_frame_count =3D=3D count);
> +	drmModeFreeConnector(connector);
> +}
> =20
> -		igt_debug("Captured %d frames\n", captured_frame_count);
> +static void test_display_crc_all_modes(data_t *data, struct chamelium_po=
rt *port,
> +					int count)
> +{
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	drmModeConnector *connector;
> +	int i;
> =20
> -		expected_crc =3D chamelium_calculate_fb_crc_async_finish(fb_crc);
> +	reset_state(data, port);
> =20
> -		for (j =3D 0; j < captured_frame_count; j++)
> -			chamelium_assert_crc_eq_or_dump(data->chamelium,
> -							expected_crc, &crc[j],
> -							&fb, j);
> +	output =3D prepare_output(data, port);
> +	connector =3D chamelium_port_get_connector(data->chamelium, port, false=
);
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(primary);
> =20
> -		free(expected_crc);
> -		free(crc);
> +	for (i =3D 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode =3D &connector->modes[i];
> =20
> -		igt_remove_fb(data->drm_fd, &fb);
> +		do_test_display_crc(data, port, output, mode, count);
>  	}
> =20
>  	drmModeFreeConnector(connector);
> @@ -808,13 +833,13 @@ igt_main
>  							edid_id, alt_edid_id);
> =20
>  		connector_subtest("dp-crc-single", DisplayPort)
> -			test_display_crc(&data, port, 1, false);
> +			test_display_crc_all_modes(&data, port, 1);
> =20
>  		connector_subtest("dp-crc-fast", DisplayPort)
> -			test_display_crc(&data, port, 1, true);
> +			test_display_crc_one_mode(&data, port, 1);
> =20
>  		connector_subtest("dp-crc-multiple", DisplayPort)
> -			test_display_crc(&data, port, 3, false);
> +			test_display_crc_all_modes(&data, port, 3);
> =20
>  		connector_subtest("dp-frame-dump", DisplayPort)
>  			test_display_frame_dump(&data, port);
> @@ -872,13 +897,13 @@ igt_main
>  							edid_id, alt_edid_id);
> =20
>  		connector_subtest("hdmi-crc-single", HDMIA)
> -			test_display_crc(&data, port, 1, false);
> +			test_display_crc_all_modes(&data, port, 1);
> =20
>  		connector_subtest("hdmi-crc-fast", HDMIA)
> -			test_display_crc(&data, port, 1, true);
> +			test_display_crc_one_mode(&data, port, 1);
> =20
>  		connector_subtest("hdmi-crc-multiple", HDMIA)
> -			test_display_crc(&data, port, 3, false);
> +			test_display_crc_all_modes(&data, port, 3);
> =20
>  		connector_subtest("hdmi-frame-dump", HDMIA)
>  			test_display_frame_dump(&data, port);
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-p6ETmjpEnyTeHBAD3eBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5lWYACgkQ3cLmz3+f
v9HliAf+Oew2JBs3FcE6+x0ZaOvAXKJx00vR0ZZJ3DmofvnqkQX3EjEcO/rkw2rj
e8ou4Wdg8m+R8bhK/AUeeNkxvny2VmBhFWNtnTPtQ4yKyB+m+/TkQreg92Plmsdy
7qg++Jq/vI3tQ1jDX4gKx69wKeqS0h1nxwR0hBGW+q7IUUJ+WwM7eqy8z95G9kfH
HmfbbD7yOdq6ohvpIzuR82lXoevnrfj+1hSxFlb9StOMStaUGbWopnDTaanKa9RO
hw9gTUbcZ+z++4USPNkOaDzIyPrqJhK3HJvzRdMDfFqj5mEhxXItPuioCyfFrKEO
0cNPKJzu6fTub5SlcLI3dfN7JqhcsQ==
=7g3s
-----END PGP SIGNATURE-----

--=-p6ETmjpEnyTeHBAD3eBG--


--===============0621749217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0621749217==--
