Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CF6A88065
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 13:43:00 +0000 (UTC)
Message-ID: <c0c5564c8da3f77d1e19456163b567ffc072dc14.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 15:41:25 +0200
In-Reply-To: <7828bc34980b446d4eb77e9d892705b46850968a.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <7828bc34980b446d4eb77e9d892705b46850968a.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 03/12] fb: Add format conversion routine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1963108282=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1963108282==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-whD26yOoW/WVbJgE+/wu"


--=-whD26yOoW/WVbJgE+/wu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> The chamelium format subtests will need to convert the reference pattern =
to
> the format to be tested on the DRM device.
>=20
> However, Cairo is very limited when it comes to format, and while pixman
> has much more support for formats, it's still falling short compared to
> what DRM exposes, especially on the YUV side.
>=20
> In order to abstract this away, let's create a function that will convert=
 a
> igt_fb structure to another DRM format and return the converted igt_fb.
>=20
> For now, we will use pixman to do the conversion, but we will use other
> libraries or roll our own routines to convert to more exotic formats and
> abstract it away from the users.

Thanks for the series!

See a few comment below, looks good to me otherwise.

> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  lib/igt_fb.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++++-----
>  lib/igt_fb.h |  2 +-
>  2 files changed, 84 insertions(+), 8 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index e0d543aa1aeb..1de6f9f6c275 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -28,6 +28,7 @@
>  #include <stdio.h>
>  #include <math.h>
>  #include <inttypes.h>
> +#include <pixman.h>
> =20
>  #include "drmtest.h"
>  #include "igt_fb.h"
> @@ -54,24 +55,27 @@
>   * functions to work with these pixel format codes.
>   */
> =20
> +#define PIXMAN_invalid	-1

I'm not sure -1 is the best call here. Given the definition of the
PIXMAN_FORMAT macro (pixman.h), it looks like -1 would result in a
somewhat valid format (although it's unlikely that it will be used in
the future).

More specifically, the fact that the bpp field would be !=3D 0 makes that
choice not very straightforward. I would suggest using 0 instead so that
the bpp field gets set to 0 and only reading this field makes it clear
that it's an invalid format.

> +
>  /* drm fourcc/cairo format maps */
> -#define DF(did, cid, ...)	\
> -	{ DRM_FORMAT_##did, CAIRO_FORMAT_##cid, # did, __VA_ARGS__ }
> +#define DF(did, cid, pid, ...)					\
> +	{ DRM_FORMAT_##did, CAIRO_FORMAT_##cid, PIXMAN_##pid, # did, __VA_ARGS_=
_ }
>  static struct format_desc_struct {
>  	uint32_t drm_id;
>  	cairo_format_t cairo_id;
> +	pixman_format_code_t pixman_id;
>  	const char *name;
>  	int bpp;
>  	int depth;
>  	int planes;
>  	int plane_bpp[4];
>  } format_desc[] =3D {
> -	DF(RGB565,	RGB16_565,	16, 16),
> -	//DF(RGB888,	INVALID,	24, 24),
> -	DF(XRGB8888,	RGB24,		32, 24),
> -	DF(XRGB2101010,	RGB30,		32, 30),
> -	DF(ARGB8888,	ARGB32,		32, 32),
> -	DF(NV12,	RGB24,		32, -1, 2, {8, 16}),
> +	DF(RGB565,	RGB16_565,	r5g6b5,		16, 16),
> +	//DF(RGB888,	INVALID,	r8g8b8,		24, 24),
> +	DF(XRGB8888,	RGB24,		x8r8g8b8,	32, 24),
> +	DF(XRGB2101010,	RGB30,		x2r10g10b10,	32, 30),
> +	DF(ARGB8888,	ARGB32,		a8r8g8b8,	32, 32),
> +	DF(NV12,	RGB24,		invalid,	32, -1, 2, {8, 16}),
>  };
>  #undef DF
> =20
> @@ -1123,6 +1127,18 @@ unsigned int igt_create_stereo_fb(int drm_fd, drmM=
odeModeInfo *mode,
>  	return fb_id;
>  }
> =20
> +static pixman_format_code_t drm_format_to_pixman(uint32_t drm_format)
> +{
> +	struct format_desc_struct *f;
> +
> +	for_each_format(f)
> +		if (f->drm_id =3D=3D drm_format)
> +			return f->pixman_id;
> +
> +	igt_assert_f(0, "can't find a pixman format for %08x (%s)\n",
> +		     drm_format, igt_format_str(drm_format));

Purely a cosmetic nit: instead of asserting 0 here, one might want to
introduce a found boolean, breaking instead of returning and setting
found when the format matches, asserting on the found variable and
finally returning f->pixman_id unconditionally. Up to you :)

> +}
> +
>  static cairo_format_t drm_format_to_cairo(uint32_t drm_format)
>  {
>  	struct format_desc_struct *f;
> @@ -1675,6 +1691,64 @@ void igt_remove_fb(int fd, struct igt_fb *fb)
>  }
> =20
>  /**
> + * igt_fb_convert:
> + * @dst: pointer to the #igt_fb structure that will store the conversion=
 result
> + * @src: pointer to the #igt_fb structure that stores the frame we conve=
rt
> + * @dst_fourcc: DRM format specifier to convert to
> + *
> + * This will convert a given @src content to the @dst_fourcc format,
> + * storing the result in the @dst fb, allocating the @dst fb
> + * underlying buffer.
> + *
> + * Once done with @dst, the caller will have to call igt_remove_fb()
> + * on it to free the associated resources.
> + *
> + * Returns:
> + * The kms id of the created framebuffer.
> + */
> +unsigned int igt_fb_convert(struct igt_fb *dst, struct igt_fb *src,
> +			    uint32_t dst_fourcc)
> +{
> +	pixman_format_code_t src_pixman =3D drm_format_to_pixman(src->drm_forma=
t);
> +	pixman_format_code_t dst_pixman =3D drm_format_to_pixman(dst_fourcc);
> +	pixman_image_t *dst_image, *src_image;
> +	void *dst_ptr, *src_ptr;
> +	int fb_id;
> +
> +	igt_assert(src_pixman !=3D PIXMAN_invalid);
> +	igt_assert(dst_pixman !=3D PIXMAN_invalid);
> +
> +	fb_id =3D igt_create_fb(src->fd, src->width, src->height,
> +			      dst_fourcc, LOCAL_DRM_FORMAT_MOD_NONE, dst);
> +	igt_assert(fb_id > 0);
> +
> +	src_ptr =3D igt_fb_get_buffer(src->fd, src);
> +	igt_assert(src_ptr);
> +
> +	dst_ptr =3D igt_fb_get_buffer(dst->fd, dst);
> +	igt_assert(dst_ptr);
> +
> +	src_image =3D pixman_image_create_bits(src_pixman,
> +					     src->width, src->height,
> +					     src_ptr, src->stride);
> +	igt_assert(src_image);
> +
> +	dst_image =3D pixman_image_create_bits(dst_pixman,
> +					     dst->width, dst->height,
> +					     dst_ptr, dst->stride);
> +	igt_assert(dst_image);
> +
> +	pixman_image_composite(PIXMAN_OP_SRC, src_image, NULL, dst_image,
> +			       0, 0, 0, 0, 0, 0, dst->width, dst->height);
> +	pixman_image_unref(dst_image);
> +	pixman_image_unref(src_image);
> +	igt_fb_put_buffer(dst, dst_ptr);
> +	igt_fb_put_buffer(src, src_ptr);
> +
> +	return fb_id;
> +}
> +
> +/**
>   * igt_bpp_depth_to_drm_format:
>   * @bpp: desired bits per pixel
>   * @depth: desired depth
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 631fe5db7318..09df52e34992 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -126,6 +126,8 @@ unsigned int igt_create_image_fb(int drm_fd,  int wid=
th, int height,
>  				 struct igt_fb *fb /* out */);
>  unsigned int igt_create_stereo_fb(int drm_fd, drmModeModeInfo *mode,
>  				  uint32_t format, uint64_t tiling);
> +unsigned int igt_fb_convert(struct igt_fb *dst, struct igt_fb *src,
> +			    uint32_t dst_fourcc);
>  void igt_remove_fb(int fd, struct igt_fb *fb);
>  int igt_dirty_fb(int fd, struct igt_fb *fb);
>  void *igt_fb_get_buffer(int fd, struct igt_fb *fb);
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-whD26yOoW/WVbJgE+/wu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5kgUACgkQ3cLmz3+f
v9E1nwf+IWJpWHHmtl4fl8WL+JyiLcDnSXFiyiKrUk999vQ3yIlgrbeUtuQlQL6I
Jj6HIvgPFGoB4m84vn82zKExTB6QMlnxVgzvHJrdjsOQdBTKbqI2cOoa34D8mhq9
70sF4/C0F4Mh8g2Sxt+cX7rVMH/07pr7TA6K/3U3kqpyTo5GrEoZM3TaWwlUqDTJ
OdQpMnE8kXQpNNFXT9c60aViFNeMjFoYeYmPt7u8kwxcBN9hDIMXfKtvMlkRb/ap
BQQcwt5koZ4DoikwbsQHXuMdQViqnyn6RHDkEzziElk50Sex6QJKjE+zCVOhPkEs
s5eIbQFHnN0P9y9cFRtLORiWK/rtmA==
=x6iV
-----END PGP SIGNATURE-----

--=-whD26yOoW/WVbJgE+/wu--


--===============1963108282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1963108282==--
