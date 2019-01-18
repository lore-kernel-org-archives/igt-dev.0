Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46EE6E565
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jan 2019 22:24:39 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 18 Jan 2019 22:24:38 +0000
Message-ID: <64967b1523f982022aceb473eb53f4684aa60b56.camel@intel.com>
References: <20190118085818.10124-1-dhinakaran.pandiyan@intel.com>
 <20190118085818.10124-2-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20190118085818.10124-2-dhinakaran.pandiyan@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms_available_modes_crc:
 Initialize fb struct
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0589215617=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0589215617==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-j+aEF2Lsu9Tt0RnlzOqC"

--=-j+aEF2Lsu9Tt0RnlzOqC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-01-18 at 00:58 -0800, Dhinakaran Pandiyan wrote:
> The test does not initialize data->fb, initializing stride and offset
> is
> necessary to fill NV12 planes correctly. We should ideally be using
> library functions in place handrolled code in this test, but let's
> start
> with fixing the failures.

It is the right thing to fill igt_fb stride and offset but I did not
found any call to a function that would use that information in this
test.

>=20
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> ---
>  tests/kms_available_modes_crc.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kms_available_modes_crc.c
> b/tests/kms_available_modes_crc.c
> index 0c0282f8..fbc40297 100644
> --- a/tests/kms_available_modes_crc.c
> +++ b/tests/kms_available_modes_crc.c
> @@ -254,8 +254,6 @@ static bool setup_fb(data_t *data, igt_output_t
> *output, igt_plane_t *plane,
>  	uint64_t w, h;
>  	signed ret, gemsize =3D 0;
>  	unsigned tile_width, tile_height;
> -	uint32_t strides[4] =3D {};
> -	uint32_t offsets[4] =3D {};
>  	int num_planes =3D 1;
>  	uint64_t tiling;
>  	int bpp =3D 0;
> @@ -296,24 +294,25 @@ static bool setup_fb(data_t *data, igt_output_t
> *output, igt_plane_t *plane,
> =20
>  	igt_get_fb_tile_size(data->gfx_fd, tiling, bpp,
>  			     &tile_width, &tile_height);
> -	strides[0] =3D ALIGN(w * bpp / 8, tile_width);
> -	gemsize =3D data->size =3D strides[0] * ALIGN(h, tile_height);
> +	data->fb.offsets[0] =3D 0;
> +	data->fb.strides[0] =3D ALIGN(w * bpp / 8, tile_width);
> +	gemsize =3D data->size =3D data->fb.strides[0] * ALIGN(h,
> tile_height);
> =20
>  	if (fillers[i].bpp =3D=3D P010 || fillers[i].bpp =3D=3D NV12) {
> -		offsets[1] =3D data->size;
> -		strides[1] =3D strides[0];
> +		data->fb.offsets[1] =3D data->size;
> +		data->fb.strides[1] =3D data->fb.strides[0];
>  		gemsize =3D data->size * 2;
>  		num_planes =3D 2;
>  	}
> =20
>  	data->gem_handle =3D gem_create(data->gfx_fd, gemsize);
>  	ret =3D __gem_set_tiling(data->gfx_fd, data->gem_handle,
> -			       igt_fb_mod_to_tiling(tiling),
> strides[0]);
> +			       igt_fb_mod_to_tiling(tiling), data-
> >fb.strides[0]);
> =20
>  	igt_assert_eq(ret, 0);
> =20
>  	ret =3D __kms_addfb(data->gfx_fd, data->gem_handle, w, h,
> -			  format, tiling, strides, offsets,
> +			  format, tiling, data->fb.strides, data-
> >fb.offsets,
>  			  num_planes, LOCAL_DRM_MODE_FB_MODIFIERS,
>  			  &data->fb.fb_id);
> =20

--=-j+aEF2Lsu9Tt0RnlzOqC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxCUiQACgkQVenbO/mO
WkkC4QgAhzKX2sGm6CE96lhrotfNc88Ng9gMLbweHIuQMF0J45vS+9rlZBMqsTDU
i0E6FWJrZF9O2YidHQ6yNitw6x7UgfF+Qk08SPF6Kb/hFi+i2Jk+COYpYB4yGIdX
vklQRiOG7YnRNirO7AAKGfg3CWdSaRz1ua7pJAchRXJO4cjCVhMgkCrwci+BS4f3
y87wipjn3vOgl6Y7YrKv1Ts6viwvmIN3lc/vUlGq3q3+fDkcLsxmBpfw6d+D0r9k
qIwev40JUpEv2yCdLMCdeYTAhVl7/A5AtY+Xnc9vBHBwyo8xgbYuxsf0oQHpsXa1
UO9sYBIyuB67jHmTvhoH6YSnpjtpgw==
=g65H
-----END PGP SIGNATURE-----

--=-j+aEF2Lsu9Tt0RnlzOqC--

--===============0589215617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0589215617==--
