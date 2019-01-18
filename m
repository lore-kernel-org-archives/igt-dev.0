Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E336E109
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jan 2019 22:44:10 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 18 Jan 2019 22:44:09 +0000
Message-ID: <726a64bd398ff4cc38c63a0c98c8d06ce65006bd.camel@intel.com>
References: <20190118085818.10124-1-dhinakaran.pandiyan@intel.com>
 <20190118085818.10124-3-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20190118085818.10124-3-dhinakaran.pandiyan@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_modes_available_crc: Fix
 NV12 failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0783040718=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0783040718==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-zx0fyVPls2qKl/ynklKq"

--=-zx0fyVPls2qKl/ynklKq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-01-18 at 00:58 -0800, Dhinakaran Pandiyan wrote:
> The size of the UV is not calculated correctly - height is not tile
> aligned. Make use the stride and offset values intilized in the
> previous patch to calculate plane size. The next step would be to
> rewrite
> test to make use of the library functions, but for now this should
> fix
> NV12.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

>=20
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> ---
>  tests/kms_available_modes_crc.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_available_modes_crc.c
> b/tests/kms_available_modes_crc.c
> index fbc40297..c0f33f3c 100644
> --- a/tests/kms_available_modes_crc.c
> +++ b/tests/kms_available_modes_crc.c
> @@ -197,17 +197,18 @@ static bool fill_in_fb(data_t *data,
> igt_output_t *output, igt_plane_t *plane,
>  		writesize =3D data->size;
>  		break;
>  	case BYTES_PP_1:
> -		memset((void*)data->buf, fillers[i].value, data->size);
> +		memset((void *)data->buf, fillers[i].value, data-
> >size);
>  		writesize =3D data->size;
>  		break;
>  	case NV12:
> -		memset((void*)data->buf, fillers[i].value&0xff,
> -		       data->size);
> +		memset((void *)data->buf, fillers[i].value&0xff,
> +		       data->fb.offsets[1]);

Nit:
s/fillers[i].value&0xff/fillers[i].value & 0xff

> =20
> -		memset((void*)(data->buf+data->size),
> -		       (fillers[i].value>>8)&0xff, data->size/2);
> +		memset((void *)(data->buf+data->fb.offsets[1]),
> +		       (fillers[i].value>>8)&0xff,
> +		       data->size - data->fb.offsets[1]);
> =20
> -		writesize =3D data->size+data->size/2;
> +		writesize =3D data->size;
>  		break;
>  	case P010:
>  		ptemp_16_buf =3D (unsigned short*)data->buf;
> @@ -302,6 +303,10 @@ static bool setup_fb(data_t *data, igt_output_t
> *output, igt_plane_t *plane,
>  		data->fb.offsets[1] =3D data->size;
>  		data->fb.strides[1] =3D data->fb.strides[0];
>  		gemsize =3D data->size * 2;
> +
> +		if (fillers[i].bpp =3D=3D NV12)
> +			data->size +=3D data->fb.strides[1] * ALIGN(h/2,
> tile_height);
> +
>  		num_planes =3D 2;
>  	}
> =20

--=-zx0fyVPls2qKl/ynklKq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxCVrcACgkQVenbO/mO
WkmydwgAk7yHvYrhKUuCqxoofNxuJUsW+/nb+RxylCElcbdvuRLNkn0cRtONNPlW
Th7B3yX/EiSLHkkvwbCgNME3soeVL1Vrr1FbCuNPfhamHjUwsYiedxOfzZ8bxhQV
M9AMEX4AGapvbjw7VHUPnbhabRA9TKigQP+ev0WI6ifSywGvyIvpITN/Y7a89n1m
qcD9lk1eBNah/wjy/YVyWXk5oqhq9seOZ7PS7jEcuwI553N40WRwC6NZUlb+lauj
Qg8MOXrh7/LDMHB08nw4Xnd3FmzJyJF3N6/0DGhB/1sqGUCkYByc8qFWXAenE09W
9Z8y05wzHfKeo6j1j94hzm8ehbqLIw==
=mWkr
-----END PGP SIGNATURE-----

--=-zx0fyVPls2qKl/ynklKq--

--===============0783040718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0783040718==--
