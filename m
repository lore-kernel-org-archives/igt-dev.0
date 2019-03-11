Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B546889C5E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2019 17:14:31 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id u7so5910867qtg.9
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2019 10:14:31 -0700 (PDT)
Date: Mon, 11 Mar 2019 14:14:25 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190311171425.jrnllz6k6iqkklzd@smtp.gmail.com>
References: <20190307115557.14169-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190307115557.14169-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: Reduce execution time
 by reducing source size and performing upscaling.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0841748964=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0841748964==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zodierccbscgn3rf"
Content-Disposition: inline


--zodierccbscgn3rf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I tested it on my computer with i915, and the performance improvements
are significant. Without your patch, the pixel-format-pipe-A-planes test
took 42s to finish; with this patch, the test completed in 13s. Also,
the final result was the same. I just have some tiny comments inline,
feel free to ignore them.

On 03/07, Maarten Lankhorst wrote:
> Execution time is way too high because of all the various conversion
> routines and inefficient accesses done by pixman on uncached memory.
> Fix it by reducing the source fb siaze, and using scaling to increase

fb siaze -> fb size

> to span the entire crtc.
>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  tests/kms_plane.c | 44 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 91de46948a3a..3a2dd3e3f1f9 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -407,14 +407,15 @@ static void set_legacy_lut(data_t *data, enum pipe =
pipe,
> =20
>  static void test_format_plane_color(data_t *data, enum pipe pipe,
>  				    igt_plane_t *plane,
> -				    uint32_t format, int width, int height,
> +				    uint32_t format, int src_w, int src_h,
> +				    int dst_w, int dst_h,
>  				    int color, igt_crc_t *crc, struct igt_fb *fb)
>  {
>  	const color_t *c =3D &colors[color];
>  	struct igt_fb old_fb =3D *fb;
> =20
>  	if (data->crop =3D=3D 0 || format =3D=3D DRM_FORMAT_XRGB8888) {
> -		igt_create_color_fb(data->drm_fd, width, height, format,
> +		igt_create_color_fb(data->drm_fd, src_w, src_h, format,
>  				    LOCAL_DRM_FORMAT_MOD_NONE,
>  				    c->red, c->green, c->blue, fb);
>  	} else {
> @@ -424,22 +425,22 @@ static void test_format_plane_color(data_t *data, e=
num pipe pipe,
>  	 */
>  		cairo_t *cr;
> =20
> -		igt_create_fb(data->drm_fd, width + data->crop * 2,
> -				    height + data->crop * 2, format,
> +		igt_create_fb(data->drm_fd, src_w + data->crop * 2,
> +				    src_h + data->crop * 2, format,
>  				    LOCAL_DRM_FORMAT_MOD_NONE,
>  				    fb);
> =20
>  		cr =3D igt_get_cairo_ctx(data->drm_fd, fb);
> =20
>  		igt_paint_color(cr, 0, 0,
> -				width+data->crop * 2,
> -				height+data->crop * 2,
> +				src_w+data->crop * 2,
> +				src_h+data->crop * 2,
>  				1.0f - c->red,
>  				1.0f - c->green,
>  				1.0f - c->blue);
> =20
>  		igt_paint_color(cr, data->crop, data->crop,
> -				width, height,
> +				src_w, src_h,
>  				c->red, c->green, c->blue);
> =20
>  		igt_put_cairo_ctx(data->drm_fd, fb, cr);
> @@ -451,10 +452,10 @@ static void test_format_plane_color(data_t *data, e=
num pipe pipe,
>  	 * if clamping test. DRM_FORMAT_XRGB8888 is used for reference color.
>  	 */
>  	if (data->crop !=3D 0  && format !=3D DRM_FORMAT_XRGB8888) {
> -		igt_plane_set_size(plane, width, height);
>  		igt_fb_set_position(fb, plane, data->crop, data->crop);
> -		igt_fb_set_size(fb, plane, width, height);
> +		igt_fb_set_size(fb, plane, src_w, src_h);
>  	}
> +	igt_plane_set_size(plane, dst_w, dst_h);
> =20
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_AT=
OMIC : COMMIT_UNIVERSAL);
>  	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, crc);
> @@ -470,7 +471,7 @@ static void test_format_plane(data_t *data, enum pipe=
 pipe,
>  	struct igt_fb fb =3D {};
>  	drmModeModeInfo *mode;
>  	uint32_t format, ref_format;
> -	uint64_t width, height;
> +	uint64_t width, height, dst_w, dst_h;
>  	igt_crc_t ref_crc[ARRAY_SIZE(colors)];
> =20
>  	/*
> @@ -493,6 +494,8 @@ static void test_format_plane(data_t *data, enum pipe=
 pipe,
>  		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &height));
>  		ref_format =3D format =3D DRM_FORMAT_ARGB8888;
>  	}
> +	dst_w =3D width;
> +	dst_h =3D height;
> =20
>  	igt_debug("Testing connector %s on %s plane %s.%u\n",
>  		  igt_output_name(output), kmstest_plane_type_name(plane->type),
> @@ -516,9 +519,29 @@ static void test_format_plane(data_t *data, enum pip=
e pipe,
>  		 IGT_FORMAT_ARGS(format),
>  		 kmstest_pipe_name(pipe), plane->index);
> =20
> +	if (plane->type !=3D DRM_PLANE_TYPE_CURSOR && data->display.is_atomic) {
> +		int ret;
> +
> +		igt_create_fb(data->drm_fd, 256, 256, format,
> +				    LOCAL_DRM_FORMAT_MOD_NONE, &fb);
> +
> +		igt_plane_set_fb(plane, &fb);
> +		/* Upscale to max size */
> +		igt_plane_set_size(plane, dst_w, dst_h);
> +
> +		ret =3D igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_=
TEST_ONLY, NULL);
> +		igt_remove_fb(data->drm_fd, &fb);
> +
> +		if (!ret)
> +			width =3D height =3D 256;
> +

You used the constant 256 three times here. How about creating a define
for it? Maybe it could be easy to change the value if required.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

Best Regards

> +		igt_plane_set_fb(plane, NULL);
> +	}
> +
>  	for (int i =3D 0; i < ARRAY_SIZE(colors); i++) {
>  		test_format_plane_color(data, pipe, plane,
>  					format, width, height,
> +					dst_w, dst_h,
>  					i, &ref_crc[i], &fb);
>  	}
> =20
> @@ -550,6 +573,7 @@ static void test_format_plane(data_t *data, enum pipe=
 pipe,
>  		for (int j =3D 0; j < ARRAY_SIZE(colors); j++) {
>  			test_format_plane_color(data, pipe, plane,
>  						format, width, height,
> +						dst_w, dst_h,
>  						j, &crc, &fb);
> =20
>  			igt_assert_crc_equal(&crc, &ref_crc[j]);
> --=20
> 2.20.1
>=20
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=E3o Paulo

--zodierccbscgn3rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlyGl3EACgkQWJzP/com
vP/3hA/7BalEiJdrg7ChRRUiGUPsC2+VzKUsA/7apJbHqnmxYJBu6UPk5+2BrTVD
DOQKkWxzYnqI2hFnWb0MlqbBV1I5trfI0+ZnEmcbpQEn4V/MjH1H4CQ2JPYllVrr
k/R5GR4c9QgwTl8eP/ClUBrqus/aa6BuaWVgvO78nUEG2R1veC6Q8J07VPQCPK/H
tgJMT1Kyl/fUEE5BP8Y78jWRsRDRXF35fnkiHjTNRuCD7YwLsswlgzo27wThrMww
/JxqYRQ/WkCve8LVSJ2BsUfOv5EjIayqXfMWad8Qr6U/Ptl0I7pwAW+WfHuTn4kZ
HmTEAb5Jeq2Bo7xrDxYUGHiWKiESSBeBVr9auCg+R8zaURwwHjnLAKY1iN2wcEmU
DPKQGTyMX0N0FU0/MU/zv0nNTQUPePOFZrBRo2gYp28Yt/DzE4TO2ZlpApHO+9Uz
RU7YzOcV/QpTANgVaidk49/CM3z7Nlkgm5z2XVhJu+8r741t4DHZyl0O3ooA2j31
21dAdoGH6024ix2wxF+CNBSxEZCvP6fzPW64b1N7RJHf63pxkOG7BDLtrS6slGmw
QQ68TzcAwqJy0N2Q2lnPbRhGHn3MmhrRawj7q64S16MZynQ8UJcbfoHBbyK9d1N+
mfheMZIOPf1hicDzXsMXkblDK16Fvokolk5WhhblDgSw4kRPwns=
=XPcO
-----END PGP SIGNATURE-----

--zodierccbscgn3rf--

--===============0841748964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0841748964==--
