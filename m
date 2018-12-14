Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id D72AE6F37E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 09:02:50 +0000 (UTC)
Date: Fri, 14 Dec 2018 10:02:47 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181214090247.adudnotmhunsp7fd@flea>
References: <20181213155533.18048-1-paul.kocialkowski@bootlin.com>
 <20181213155533.18048-6-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20181213155533.18048-6-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 05/12] lib/igt_fb: Add checks on i915
 for i915-specific tiled buffer allocation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0596219015=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0596219015==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eedz2o3ji3w5y7u4"
Content-Disposition: inline


--eedz2o3ji3w5y7u4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2018 at 04:55:26PM +0100, Paul Kocialkowski wrote:
> The code path for allocating tiled buffers has a few i915-specific bits
> without checks for the i915 driver. Add these missing checks.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  lib/igt_fb.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index e314916884d7..73e5c654b8f6 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -298,6 +298,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, =
int plane)
>  		(fb->plane_bpp[plane] / 8);
> =20
>  	if (fb->tiling !=3D LOCAL_DRM_FORMAT_MOD_NONE &&
> +	    is_i915_device(fb->fd) &&
>  	    intel_gen(intel_get_drm_devid(fb->fd)) <=3D 3) {
>  		uint32_t stride;
> =20
> @@ -326,6 +327,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, =
int plane)
>  static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
>  {
>  	if (fb->tiling !=3D LOCAL_DRM_FORMAT_MOD_NONE &&
> +	    is_i915_device(fb->fd) &&
>  	    intel_gen(intel_get_drm_devid(fb->fd)) <=3D 3) {
>  		uint64_t min_size =3D (uint64_t) fb->strides[plane] *
>  			fb->plane_height[plane];
> @@ -1466,7 +1468,7 @@ static void destroy_cairo_surface__gtt(void *arg)
> =20
>  static void *map_bo(int fd, struct igt_fb *fb)
>  {
> -	void *ptr;
> +	void *ptr =3D NULL;
> =20
>  	if (is_i915_device(fd))
>  		gem_set_domain(fd, fb->gem_handle,
> @@ -1475,9 +1477,11 @@ static void *map_bo(int fd, struct igt_fb *fb)
>  	if (fb->is_dumb)
>  		ptr =3D kmstest_dumb_map_buffer(fd, fb->gem_handle, fb->size,
>  					      PROT_READ | PROT_WRITE);
> -	else
> +	else if (is_i915_device(fd))
>  		ptr =3D gem_mmap__gtt(fd, fb->gem_handle, fb->size,
>  				    PROT_READ | PROT_WRITE);
> +	else
> +		igt_assert(false);
> =20
>  	return ptr;

You're not using that variable unless it has been assigned, so you
shouldn't need to set it to NULL. Did gcc put a warning?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--eedz2o3ji3w5y7u4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXBNxtwAKCRDj7w1vZxhR
xWa2AQD9H9hOIrxUcafDt2BUXyPCAokU9dd4EBKwzEAndCP7dQEAz65jYWRJD+85
rVkkP+5vQbZugsdwE1XIzSOP6a/7HAo=
=dBFX
-----END PGP SIGNATURE-----

--eedz2o3ji3w5y7u4--

--===============0596219015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0596219015==--
