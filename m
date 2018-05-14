Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6685F6E04E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 May 2018 13:29:24 +0000 (UTC)
Message-ID: <9fa1b15f4c6e51872da3ec1f3dbafb754e337d65.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 May 2018 15:27:49 +0200
In-Reply-To: <892ff89b7295ccb26593deb37aa5a7df4c9b1aad.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <892ff89b7295ccb26593deb37aa5a7df4c9b1aad.1524555464.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 02/12] fb: Add buffer map/unmap functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0000316941=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0000316941==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-AUpW4jdY8oKJcyUh+F6A"


--=-AUpW4jdY8oKJcyUh+F6A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

See a comment about function naming.

Cheers,

Paul

On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> The current code to manipulate the buffer has the assumption that we can
> create an underlying cairo instance.
>=20
> However, when it comes to supporting various formats, cairo is very limit=
ed
> so we would need to decouple the buffer access from cairo surfaces.
>=20
> Let's create a function that allows to map the underlying GEM buffer from
> an igt_fb structure, which will then allow use to manipulate as we wish.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  lib/igt_fb.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++-----
>  lib/igt_fb.h |  2 ++
>  2 files changed, 48 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 7404ba7cb0c0..e0d543aa1aeb 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1274,18 +1274,23 @@ int igt_dirty_fb(int fd, struct igt_fb *fb)
>  	return drmModeDirtyFB(fb->fd, fb->fb_id, NULL, 0);
>  }
> =20
> +static void unmap_bo(struct igt_fb *fb, void *ptr)
> +{
> +	gem_munmap(ptr, fb->size);
> +
> +	if (fb->is_dumb)
> +		igt_dirty_fb(fb->fd, fb);
> +}
> +
>  static void destroy_cairo_surface__gtt(void *arg)
>  {
>  	struct igt_fb *fb =3D arg;
> =20
> -	gem_munmap(cairo_image_surface_get_data(fb->cairo_surface), fb->size);
> +	unmap_bo(fb, cairo_image_surface_get_data(fb->cairo_surface));
>  	fb->cairo_surface =3D NULL;
> -
> -	if (fb->is_dumb)
> -		igt_dirty_fb(fb->fd, fb);
>  }
> =20
> -static void create_cairo_surface__gtt(int fd, struct igt_fb *fb)
> +static void *map_bo(int fd, struct igt_fb *fb)
>  {
>  	void *ptr;
> =20
> @@ -1296,6 +1301,13 @@ static void create_cairo_surface__gtt(int fd, stru=
ct igt_fb *fb)
>  		ptr =3D gem_mmap__gtt(fd, fb->gem_handle, fb->size,
>  				    PROT_READ | PROT_WRITE);
> =20
> +	return ptr;
> +}
> +
> +static void create_cairo_surface__gtt(int fd, struct igt_fb *fb)
> +{
> +	void *ptr =3D map_bo(fd, fb);
> +
>  	fb->cairo_surface =3D
>  		cairo_image_surface_create_for_data(ptr,
>  						    drm_format_to_cairo(fb->drm_format),
> @@ -1535,6 +1547,35 @@ static void create_cairo_surface__convert(int fd, =
struct igt_fb *fb)
>  }
> =20
>  /**
> + * igt_fb_get_buffer:
> + * @fd: open drm file descriptor
> + * @fb: pointer to an #igt_fb structure
> + *
> + * This function will map and return a pointer to the content of the
> + * supplied framebuffer's plane.
> + *
> + * Returns:
> + * A pointer to a buffer with the contents of the framebuffer
> + */

=46rom the description and name of the function, it's not fully clear what
happens and what needs to be done with the returned pointer. More
specifically, what if igt_fb_get_buffer is called multiple times in a
row: is a new pointer (resulting from a new mmap call) returned each
time or is there only one per buffer? Also, how must the returned buffer
be disposed of? igt_fb_get_buffer should probably be mentioned in this
function's documentation (otherwise users of this API may miss the call
and the reason to call it entirely).

I'm a bit confused here because the name does not suggest that this maps
a buffer (I would expect get_buffer to return a pointer to a previously-
mapped buffer instead) while it behaves similarly to map_bo here. Maybe
keeping map/unmap in the name instead of get/put would clarify things.

> +void *igt_fb_get_buffer(int fd, struct igt_fb *fb)
> +{
> +	return map_bo(fd, fb);
> +}
> +
> +/**
> + * igt_fb_put_buffer:
> + * @fb: pointer to the backing igt_fb structure
> + * @buffer: pointer to the buffer previously mappped
> + *
> + * This function will unmap a buffer mapped previously with
> + * igt_fb_get_buffer().
> + */
> +void igt_fb_put_buffer(struct igt_fb *fb, void *buffer)
> +{
> +	return unmap_bo(fb, buffer);
> +}=09
> +
> +/**
>   * igt_get_cairo_surface:
>   * @fd: open drm file descriptor
>   * @fb: pointer to an #igt_fb structure
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 023b069db592..631fe5db7318 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -128,6 +128,8 @@ unsigned int igt_create_stereo_fb(int drm_fd, drmMode=
ModeInfo *mode,
>  				  uint32_t format, uint64_t tiling);
>  void igt_remove_fb(int fd, struct igt_fb *fb);
>  int igt_dirty_fb(int fd, struct igt_fb *fb);
> +void *igt_fb_get_buffer(int fd, struct igt_fb *fb);
> +void igt_fb_put_buffer(struct igt_fb *fb, void *buffer);
> =20
>  int igt_create_bo_with_dimensions(int fd, int width, int height, uint32_=
t format,
>  				  uint64_t modifier, unsigned stride,
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-AUpW4jdY8oKJcyUh+F6A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlr5jtUACgkQ3cLmz3+f
v9H4Ywf/f9+uTl/IMPDquDlKN5JDyLGN/sCScnn3lIxZZkueAbSLJFzkCCKftbre
FxGu4MkcE1lgeVZUUNaCkLi4+qpFfT0a9TuZEfWUHER0NHQVklOuWYuOI2gQLpMf
HSySNKnkenHV2Qx0433Lqv6XhzHDGfDpKlBigUic/YWaNejIzCiUV/kNsi6E7dZD
iuaP06ED8o11qv04IqLK1/lQmPEZ3DMfRpBhInmbDWNUTAbarzYw5SZeGzVS7WOg
uhDIJ3s+drt/KE+mLfv+o/pwDVnaS15uDJ+RyNDu6iLvAs+NlBkCRzmrk1JcBB63
uEYaAO1y10ZbeZdgrmIzfE/tRi7O4w==
=RsOu
-----END PGP SIGNATURE-----

--=-AUpW4jdY8oKJcyUh+F6A--


--===============0000316941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0000316941==--
