Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29CFC6E064
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 14:26:15 +0000 (UTC)
Message-ID: <9aee563e1f348763ce6f85510b4b034c1851e52e.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 16:24:40 +0200
In-Reply-To: <eee519ed1db1474de03941c3009228b88224a716.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <eee519ed1db1474de03941c3009228b88224a716.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 09/12] chamelium: Change our pattern for
 a custom one
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0754501771=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0754501771==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZWdCG0/g7KNZ/ZvXzq9g"


--=-ZWdCG0/g7KNZ/ZvXzq9g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> The current pattern being used is the one generated through the
> igt_create_color_pattern_fb.
>=20
> However, in order to deal with multiple formats and the upsampling /
> downsampling issues that might arise from converting back and forth betwe=
en
> formats, we will need to have a pattern with quite precise color values,
> and without any shades or gradient of colors.
>=20
> The easiest way to do that will be to only use values that would have the
> same part on the common most significant bits (5, to deal with the most
> formats) and have the same bit repeated on the least significant bits tha=
t
> are going to be dropped and / or padded when converting between formats.
>=20
> Pixman will fill the lowest bits with 1, and our hardware is able to
> support that, so the easiest is to just use all 1's for our components in
> order to still be able to compute the CRCs.

I understand the issue at hand, the proposed solution and I agree that
it an easy way to deal with the issues introduced by up/downsampling.

However, it all other cases (where the color bpp is the same for the
source and destination formats), I think we should definitely use a
complex pattern with gradients (igt_create_color_pattern_fb) in order to
increase the coverage of the tests (gradients are something we
definitely want to make sure are displayed correctly).

So I think we should have a test for the bpp somewhere and only rely on
this new pattern when there is downsampling involved.

What do you think?

> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  tests/kms_chamelium.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index f14e3ebb4b87..2b82f2597c73 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -486,15 +486,40 @@ enable_output(data_t *data,
>  	drmModeFreeConnector(connector);
>  }
> =20
> +static void chamelium_paint_xr24_pattern(uint32_t *data,
> +					 size_t width, size_t height)
> +{
> +	uint32_t colors[] =3D { 0xff000000,
> +			      0xffff0000,
> +			      0xff00ff00,
> +			      0xff0000ff,
> +			      0xffffffff };
> +	unsigned i, j;
> +
> +	for (i =3D 0; i < height; i++)
> +		for (j =3D 0; j < width; j++)
> +			*(data + i * width + j) =3D colors[((j / 64) + (i / 64)) % 5];
> +}
> +
>  static int chamelium_get_pattern_fb(data_t *data, drmModeModeInfo *mode,
>  				    uint32_t fourcc, struct igt_fb *fb)
>  {
> +	int fb_id;
> +	void *ptr;
> +
>  	igt_assert(fourcc =3D=3D DRM_FORMAT_XRGB8888);
> =20
> -	return igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay,
> -					   mode->vdisplay, fourcc,
> -					   LOCAL_DRM_FORMAT_MOD_NONE,
> -					   0, 0, 0, fb);
> +	fb_id =3D igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +			      fourcc, LOCAL_DRM_FORMAT_MOD_NONE, fb);
> +	igt_assert(fb_id > 0);
> +
> +	ptr =3D igt_fb_get_buffer(fb->fd, fb);
> +	igt_assert(ptr);
> +
> +	chamelium_paint_xr24_pattern(ptr, mode->vdisplay, mode->hdisplay);
> +	igt_fb_put_buffer(fb, ptr);
> +
> +	return fb_id;
>  }
> =20
>  static void do_test_display_crc(data_t *data, struct chamelium_port *por=
t,
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-ZWdCG0/g7KNZ/ZvXzq9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5nCgACgkQ3cLmz3+f
v9HzWQf/UsipWh4IIlDHiTb+4oOjgkvIPBsyrburEPWgOmcbc+3zV1AOomXo7RfL
7Op+gFx2H4S6bL3rvAxRXHjE8aLjYAJy1Ap+UZNNWCQby/+ncpD3UTSMhQSEvee9
/o0GgUCjD0rGC7Unocm3hwlwNcbATXmw4+l+/vpBPM6gC/tlkzsrjeCGrB6nAawn
PkNIvvdLReNScrCPoyXuO5oqsSlYVfEUusSjYA6QO2F640EFWqcWpnAdV+8U9Pr2
Xz2ZvwjaZrkzqcPsSFmZyZDIIzGsB1/odX/xu7elv349n+G6OjqbZVrdtnJqhN8w
vZy0/t4ynIaZ9P1MYgGonAYyBO6MKA==
=f7Re
-----END PGP SIGNATURE-----

--=-ZWdCG0/g7KNZ/ZvXzq9g--


--===============0754501771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0754501771==--
