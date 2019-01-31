Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04666E6BD
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jan 2019 12:49:06 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m17so1763082qki.5
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jan 2019 04:49:06 -0800 (PST)
Date: Thu, 31 Jan 2019 10:49:02 -0200
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190131124902.j2wtnuwhvhrpjfuu@smtp.gmail.com>
References: <7fe5b67752b0d53137360a0a4539572df0287e7d.1548799569.git.mamtashukla555@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7fe5b67752b0d53137360a0a4539572df0287e7d.1548799569.git.mamtashukla555@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t, v2,
 1/2] tests/kms_cursor_crc.c: Improve test_cursor_alpha()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0258015805=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mamta Shukla <mamtashukla555@gmail.com>
Cc: igt-dev@lists.freedesktop.org, hamohammed.sa@gmail.com, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>


--===============0258015805==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkgpspuomcitin6n"
Content-Disposition: inline


--gkgpspuomcitin6n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your patch! :)

The patch looks good for me.

I just have one question: why did you split the patch into two parts?
IMHO this series can be a single patch.

Best Regards
Rodrigo Siqueira

On 01/30, Mamta Shukla wrote:
> In the kms_cursor_crc, the subtest to check exterme alpha values failed d=
ue
> to different CRCs observed in hardware and software rendering. This patch=
 fixes
> CRC mismatch error in cursor-alpha-opaque and cursor-alpha-transparent su=
btests
> by improving the order in which cursor was rendered in hardware test. Cha=
nges
> made in test_cursor_alpha() to ensure cursor rendering in hardware test a=
nd
> acquire CRC value:
> - Add drmModeSetCursor() to set cursor image.
> - Remove igt_display_commit() to reduce the chance of getting crc values =
cleared
>   before it is acquired.
> - Add igt_remove_fb() to remove locally created framebuffer after disabli=
ng the
>   cursor plane in HW test
>=20
>   Also, aligned this function with test_cursor_size and after these chang=
es
>   got passing results for alpha blending support added in VKMS CRC API.
>=20
> Signed-off-by: Mamta Shukla <mamtashukla555@gmail.com>
> ---
> changes in v2:
> -Modify commit message
> -Add spaces around '=3D'
>=20
>  tests/kms_cursor_crc.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 3c9856d9..144b44b0 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -411,26 +411,28 @@ static void test_cursor_alpha(data_t *data, double =
a)
>  	igt_crc_t crc, ref_crc;
>  	cairo_t *cr;
>  	uint32_t fb_id;
> -	int curw=3Ddata->curw;
> -	int curh=3Ddata->curh;
> +	int curw =3D data->curw;
> +	int curh =3D data->curh;
> +	int ret;
> =20
>  	/*alpha cursor fb*/
> -	fb_id =3D igt_create_color_fb(data->drm_fd, curw, curh,
> +	fb_id =3D igt_create_fb(data->drm_fd, curw, curh,
>  				    DRM_FORMAT_ARGB8888,
>  				    LOCAL_DRM_FORMAT_MOD_NONE,
> -				    1.0, 1.0, 1.0,
>  				    &data->fb);
>  	igt_assert(fb_id);
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb);
> -	draw_cursor(cr, 0, 0, curw, curh, a);
> +	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
>  	igt_put_cairo_ctx(data->drm_fd, &data->fb, cr);
> =20
>  	/*Hardware Test*/
>  	cursor_enable(data);
> -	igt_display_commit(display);
> +	ret =3D drmModeSetCursor(data->drm_fd, data->output->config.crtc->crtc_=
id, data->fb.gem_handle, curw, curh);
> +	igt_assert_eq(ret, 0);
>  	igt_wait_for_vblank(data->drm_fd, data->pipe);
>  	igt_pipe_crc_collect_crc(pipe_crc, &crc);
>  	cursor_disable(data);
> +	igt_remove_fb(data->drm_fd, &data->fb);
> =20
>  	/*Software Test*/
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb);
> @@ -447,7 +449,6 @@ static void test_cursor_alpha(data_t *data, double a)
>  	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
>  			0.0, 0.0, 0.0);
>  	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb, cr);
> -	igt_remove_fb(data->drm_fd, &data->fb);
>  }
> =20
>  static void test_cursor_transparent(data_t *data)
> --=20
> 2.17.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=E3o Paulo

--gkgpspuomcitin6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlxS7r0ACgkQWJzP/com
vP8vTxAAqXfSycoOJTQ3CIgZEpBGBAWUjKy49nqrHjGMt+BkETUvgObkXC8tMwuy
8Dl+9hNK0EkwpeoGRsCumlLtN42DcQoEIeNgJV7Y1rIukyW/a3pjo+AFd/PAQgEY
maaW76J5+7E1LPYjDqm38m9U/viAk87aS78wL66Th7MnhQyZ1p75/Dzfiw/nbeV8
mUtcsx6o1krpPPum3PJ4ZAybHTsqtr++8t9aAHPCIkti1cmklq7eRRVxgw8LKtcM
O+mjNIbXsJl+H/gpMowU/RWouyuiHYnibodAE7ESLUnNb1xk4ittfn6GxNLL5BiC
l2Q8TqdMoz+RoQPYkfCGJft53U5/MchMdki8xKk9XAbY+1lvucwgjnBritpcM/IO
KqOGpRKzHxteUZSCE812iA14BdxIzs/mngrhOszDaIBVHSqroquz/yi58vwTrR1A
XKLRv5jDsLgVGx2wQkH5xZJEHBllFJ748UzylncypNy1oYmthR9Yv5gWf//VVf7K
+iDYfrl4qbbIq4QLhvGkZisxDcN7dYVtffE/qLY8C5tE7CwaaCDlVJmc6Qqtu4Mj
WwqnYWsPvLfUPsiKCxTIXGnxkt8OJeVnvx7jF3trpe+jAERbMeu8Q1tRiXYtmOwr
zIjG+UuTgvN7lUW/uf+JDPh7a9sDJM9FFE1HjqbmZ9IVnDBVtDw=
=Z6Ht
-----END PGP SIGNATURE-----

--gkgpspuomcitin6n--

--===============0258015805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0258015805==--
