Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 681F86E003
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Aug 2018 21:28:15 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <cbedc79edb2bcfc1ad2ed89cb86b15bc9088e634.1532596850.git-series.maxime.ripard@bootlin.com>
References: <cover.85e5bbe6ef5f0fd420e1fc21fc248471b98481e5.1532596850.git-series.maxime.ripard@bootlin.com>
 <cbedc79edb2bcfc1ad2ed89cb86b15bc9088e634.1532596850.git-series.maxime.ripard@bootlin.com>
Date: Thu, 09 Aug 2018 14:28:12 -0700
Message-ID: <87tvo3s00j.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 08/13] chamelium: Use preferred mode when
 testing a single mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1941066905=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Maxime Ripard <maxime.ripard@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1941066905==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Maxime Ripard <maxime.ripard@bootlin.com> writes:

> The current code is testing the first mode in the connector list when it's
> testing a single mode. While this is arbitrarily chosen, it makes more
> sense to use the preferred mode reported by the display.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  tests/kms_chamelium.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 490bacc6f5fe..5d7fb83fb74f 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -534,6 +534,20 @@ static void do_test_display_crc(data_t *data, struct=
 chamelium_port *port,
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
>=20=20
> +static drmModeModeInfo *find_preferred_mode(drmModeConnector *connector)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode =3D &connector->modes[i];
> +
> +		if (mode->type & DRM_MODE_TYPE_PREFERRED)
> +			return mode;
> +	}
> +
> +	return NULL;
> +}
> +
>  static void test_display_crc_one_mode(data_t *data, struct chamelium_por=
t *port,
>  				      int count)
>  {
> @@ -549,7 +563,10 @@ static void test_display_crc_one_mode(data_t *data, =
struct chamelium_port *port,
>  	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_assert(primary);
>=20=20
> -	do_test_display_crc(data, port, output, &connector->modes[0], count);
> +	mode =3D find_preferred_mode(connector);
> +	igt_assert(mode);
> +
> +	do_test_display_crc(data, port, output, mode, count);

Instead of asserting, should we pick the first if there was no
preferred?  I don't really know, so I'd ack the patch either way.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAltssewACgkQtdYpNtH8
nui3mQ/+JRIXd6jdbMCvliSSZ31YKXKakeWuX3BOK+ryBbgErhbXRfFb6tHTHYNB
MoEE5WiYVEWXBP75sXPS5bQmlP+ClzMcZYuf/7OHBXtuSBJ8PZySA4yvtLg+pK3u
x5cKNLUuuWlyqmmW+tgbENJ5Rz02MITK75aV3l53l82ECARR3TzShEeSTlWxdNUk
yXIhje+PD/KGZwv94Fmma/7Y+XAau7rMDo7/PTYX6cEl7cboGKoSpdL05Q1C91Ge
wjTstKY2r/wuVk8xOyUikxAlhyx9g7Gz2Abd/eaW383Jz95i3xfcR6sC6CkVSlj5
pbcqF/jmXBV8z7koN2AM78WM11FhI1wHB4JVJYRSmhC8lB0YhGiB9pYnZRYf9yHt
8mA6fJMshS7k/BiJbEx3jNxU/FUVHHJAY5EKTm1SbtkOplBSejPQEcRF3w/bbI3L
9+RwOLtGmSuuvrmSZeTzIBW7w/AlXxYhnskLqHPLzsDipYskw+sL8PyQkkIHenne
ia5sujkSobkOcSBbtC6yGazc/270yUs1lOyc5EZ5XWrPgjvCYVrQNKa/iDoB6qY3
mukPfqN1N1RpwpjepRDowAX9dSiXdeHuGX1q9F1ot4ZNK+rvkTw3mQk+v6zdQViE
2/KUxJHMUm63rdzGlOyyyNRkOpG4uQdU3FyI0mEOwmfK8Xb7738=
=d9GX
-----END PGP SIGNATURE-----
--=-=-=--

--===============1941066905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1941066905==--
