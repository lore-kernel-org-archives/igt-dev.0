Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD9E66E05D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 14:02:28 +0000 (UTC)
Message-ID: <8a805e2bbc23868e94d488536eff38889550ed0c.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 16:00:53 +0200
In-Reply-To: <9f9547ff1e6c772b3d332991fe865fedb0fdf9d1.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <9f9547ff1e6c772b3d332991fe865fedb0fdf9d1.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 07/12] chamelium: Use preferred mode
 when testing a single mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1971832819=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1971832819==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-S43x3f7MmNfozGYmlF4Q"


--=-S43x3f7MmNfozGYmlF4Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> The current code is testing the first mode in the connector list when it'=
s
> testing a single mode. While this is arbitrarily chosen, it makes more
> sense to use the preferred mode reported by the display.

The rationale behind this decision was to use the highest resolution,
that is usually reported first, but I think your approach makes more
sense.

What happens when no mode is marked as preferred though? You put-in an
assert here, but does the DRM API ensure that at least one is marked as
preferred? If not, we should probably fallback to selecting the first
mode as before. This would also make things safer in case of a
descructive interaction with the mode pruning code, where the
recommended mode might get pruned (although that would be very
unfortunate).

What do you think?

Cheers,

Paul

> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  tests/kms_chamelium.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 490bacc6f5fe..5d7fb83fb74f 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -534,6 +534,20 @@ static void do_test_display_crc(data_t *data, struct=
 chamelium_port *port,
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
> =20
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
> =20
> -	do_test_display_crc(data, port, output, &connector->modes[0], count);
> +	mode =3D find_preferred_mode(connector);
> +	igt_assert(mode);
> +
> +	do_test_display_crc(data, port, output, mode, count);
> =20
>  	drmModeFreeConnector(connector);
>  }
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-S43x3f7MmNfozGYmlF4Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5lpUACgkQ3cLmz3+f
v9HFAgf9EodwaJcWtpEIVDxGd/MI4XL75b2J8C+hIle0UrqmRFcfJfe5c+/+knYo
na/IHZLQga89nJANvlnl+nljPy8Jp0k8WDx4PQ1QyNxuoCrmrsHnbXheT0Ls4fuD
SG/Ywi9HJJA5GtSpkytaizCRstoHn92sWamp0VNqCafSGDk8Rnw1Xw/2iMV9KMjl
ICzE3DpwSojr1RUV32i7oY6sCcgs/HBE0Ss0KpS3VDNPkbEZNHUCYihKX2zXwymN
sAL/Ez2p3bQBZfObCK7tNIfGRDlvCfZU7OgazJ6lKJ5b12SEfGk8BypXvV5BJfSk
LKKEJEiuLP43ZWKI/BxuCojWqZxjXA==
=TRFR
-----END PGP SIGNATURE-----

--=-S43x3f7MmNfozGYmlF4Q--


--===============1971832819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1971832819==--
