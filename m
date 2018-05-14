Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CCDE6E059
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 13:52:08 +0000 (UTC)
Message-ID: <355775d688f6e129c305d901f8d7b24ff465dc82.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 15:50:33 +0200
In-Reply-To: <67ca95b67e6943d484521f98bbcf30290ad303ba.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <67ca95b67e6943d484521f98bbcf30290ad303ba.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 05/12] chamelium: Make
 chamelium_calculate_fb_crc private
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0456523584=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0456523584==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SdFgeXGmlCtHEn809HJG"


--=-SdFgeXGmlCtHEn809HJG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> The function chamelium_calculate_fb_crc has no user outside of
> lib/igt_chamelium.c, but is still part of the global functions exposed in
> lib/igt_chamelium.h.

I don't think the fact that it has no immediate user within IGT is a
reason to move this function out of the public API. Is there a specific
use case that justifies the need for this?

The way I see it, chamelium_calculate_fb_crc is simply the synchronous
version of chamelium_calculate_fb_crc_async and although its use is
simplified with helpers, I think both functions should be public on the
same grounds.

What do you think?

Cheers,

Paul

> Remove that.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  lib/igt_chamelium.c | 146 ++++++++++++++++++++++-----------------------
>  lib/igt_chamelium.h |   1 +-
>  2 files changed, 73 insertions(+), 74 deletions(-)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index b25855a41ceb..ce2f5d6e3bf5 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -1064,6 +1064,79 @@ void chamelium_assert_crc_eq_or_dump(struct chamel=
ium *chamelium,
>  	igt_assert(eq);
>  }
> =20
> +static uint32_t chamelium_xrgb_hash16(const unsigned char *buffer, int w=
idth,
> +				      int height, int k, int m)
> +{
> +	unsigned char r, g, b;
> +	uint64_t sum =3D 0;
> +	uint64_t count =3D 0;
> +	uint64_t value;
> +	uint32_t hash;
> +	int index;
> +	int i;
> +
> +	for (i=3D0; i < width * height; i++) {
> +		if ((i % m) !=3D k)
> +			continue;
> +
> +		index =3D i * 4;
> +
> +		r =3D buffer[index + 2];
> +		g =3D buffer[index + 1];
> +		b =3D buffer[index + 0];
> +
> +		value =3D r | (g << 8) | (b << 16);
> +		sum +=3D ++count * value;
> +	}
> +
> +	hash =3D ((sum >> 0) ^ (sum >> 16) ^ (sum >> 32) ^ (sum >> 48)) & 0xfff=
f;
> +
> +	return hash;
> +}
> +
> +static void chamelium_do_calculate_fb_crc(cairo_surface_t *fb_surface,
> +					  igt_crc_t *out)
> +{
> +	unsigned char *buffer;
> +	int n =3D 4;
> +	int w, h;
> +	int i, j;
> +
> +	buffer =3D cairo_image_surface_get_data(fb_surface);
> +	w =3D cairo_image_surface_get_width(fb_surface);
> +	h =3D cairo_image_surface_get_height(fb_surface);
> +
> +	for (i =3D 0; i < n; i++) {
> +		j =3D n - i - 1;
> +		out->crc[i] =3D chamelium_xrgb_hash16(buffer, w, h, j, n);
> +	}
> +
> +	out->n_words =3D n;
> +}
> +
> +/**
> + * chamelium_calculate_fb_crc:
> + * @fd: The drm file descriptor
> + * @fb: The framebuffer to calculate the CRC for
> + *
> + * Calculates the CRC for the provided framebuffer, using the Chamelium'=
s CRC
> + * algorithm. This calculates the CRC in a synchronous fashion.
> + *
> + * Returns: The calculated CRC
> + */
> +static igt_crc_t *chamelium_calculate_fb_crc(int fd, struct igt_fb *fb)
> +{
> +	igt_crc_t *ret =3D calloc(1, sizeof(igt_crc_t));
> +	cairo_surface_t *fb_surface;
> +
> +	/* Get the cairo surface for the framebuffer */
> +	fb_surface =3D igt_get_cairo_surface(fd, fb);
> +
> +	chamelium_do_calculate_fb_crc(fb_surface, ret);
> +
> +	return ret;
> +}
> +
>  /**
>   * chamelium_assert_analog_frame_match_or_dump:
>   * @chamelium: The chamelium instance the frame dump belongs to
> @@ -1245,79 +1318,6 @@ int chamelium_get_frame_limit(struct chamelium *ch=
amelium,
>  	return ret;
>  }
> =20
> -static uint32_t chamelium_xrgb_hash16(const unsigned char *buffer, int w=
idth,
> -				      int height, int k, int m)
> -{
> -	unsigned char r, g, b;
> -	uint64_t sum =3D 0;
> -	uint64_t count =3D 0;
> -	uint64_t value;
> -	uint32_t hash;
> -	int index;
> -	int i;
> -
> -	for (i=3D0; i < width * height; i++) {
> -		if ((i % m) !=3D k)
> -			continue;
> -
> -		index =3D i * 4;
> -
> -		r =3D buffer[index + 2];
> -		g =3D buffer[index + 1];
> -		b =3D buffer[index + 0];
> -
> -		value =3D r | (g << 8) | (b << 16);
> -		sum +=3D ++count * value;
> -	}
> -
> -	hash =3D ((sum >> 0) ^ (sum >> 16) ^ (sum >> 32) ^ (sum >> 48)) & 0xfff=
f;
> -
> -	return hash;
> -}
> -
> -static void chamelium_do_calculate_fb_crc(cairo_surface_t *fb_surface,
> -					  igt_crc_t *out)
> -{
> -	unsigned char *buffer;
> -	int n =3D 4;
> -	int w, h;
> -	int i, j;
> -
> -	buffer =3D cairo_image_surface_get_data(fb_surface);
> -	w =3D cairo_image_surface_get_width(fb_surface);
> -	h =3D cairo_image_surface_get_height(fb_surface);
> -
> -	for (i =3D 0; i < n; i++) {
> -		j =3D n - i - 1;
> -		out->crc[i] =3D chamelium_xrgb_hash16(buffer, w, h, j, n);
> -	}
> -
> -	out->n_words =3D n;
> -}
> -
> -/**
> - * chamelium_calculate_fb_crc:
> - * @fd: The drm file descriptor
> - * @fb: The framebuffer to calculate the CRC for
> - *
> - * Calculates the CRC for the provided framebuffer, using the Chamelium'=
s CRC
> - * algorithm. This calculates the CRC in a synchronous fashion.
> - *
> - * Returns: The calculated CRC
> - */
> -igt_crc_t *chamelium_calculate_fb_crc(int fd, struct igt_fb *fb)
> -{
> -	igt_crc_t *ret =3D calloc(1, sizeof(igt_crc_t));
> -	cairo_surface_t *fb_surface;
> -
> -	/* Get the cairo surface for the framebuffer */
> -	fb_surface =3D igt_get_cairo_surface(fd, fb);
> -
> -	chamelium_do_calculate_fb_crc(fb_surface, ret);
> -
> -	return ret;
> -}
> -
>  static void *chamelium_calculate_fb_crc_async_work(void *data)
>  {
>  	struct chamelium_fb_crc_async_data *fb_crc;
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index af9655a0b1cf..1a6ad9b93ee8 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -95,7 +95,6 @@ struct chamelium_frame_dump *chamelium_port_dump_pixels=
(struct chamelium *chamel
>  							struct chamelium_port *port,
>  							int x, int y,
>  							int w, int h);
> -igt_crc_t *chamelium_calculate_fb_crc(int fd, struct igt_fb *fb);
>  struct chamelium_fb_crc_async_data *chamelium_calculate_fb_crc_async_sta=
rt(int fd,
>  									   struct igt_fb *fb);
>  igt_crc_t *chamelium_calculate_fb_crc_async_finish(struct chamelium_fb_c=
rc_async_data *fb_crc);
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-SdFgeXGmlCtHEn809HJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5lCkACgkQ3cLmz3+f
v9HTjgf/RmgYAAk75M23oasHWbSXgjKrveBNz/zH1KSFlwHrFihmWn/wGf/d3xMe
gIaoCQshv16QdcOAskrUM+nf3fVrzgUTJJzuJ5+MuMWbh5gMYW0V9D2mQl6CKID6
J1vQD7pKy5opo2bvNjlTBsQ330B2PGln8ulG/FB57ZaCP90TlytTQxBYqe9xGGSl
JshlPd2CuQOOWABGlPUUaEUnBzDSmhs1a3WuD2VpdjoIaVN8GPo1noP5qS0jrid2
u+cmwuOc+yCHf6/f8FrSk3+p6oiJroY+WuxCAwmB/r7GMc+upUjbF+tqBDXHDKqe
/YoBH5W2FseC2upK/YRqyBVKEvMUxw==
=qWMy
-----END PGP SIGNATURE-----

--=-SdFgeXGmlCtHEn809HJG--


--===============0456523584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0456523584==--
