Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D983D6E47B
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 17:49:32 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 2 Apr 2019 17:49:30 +0000
Message-ID: <5a3e1d330a2bf85b17c2dfca3c21387c1b19f596.camel@intel.com>
References: <20190402130837.27521-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190402130837.27521-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Allow the test to
 proceed with fewer planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2003945971=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2003945971==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-z5P14o1LAqCfYLMI58Xw"

--=-z5P14o1LAqCfYLMI58Xw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-02 at 16:08 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> We may not be able to enable all the planes simultaneously. In that
> case just keep going with fewer planes. The test already requires
> atomic so let's use TEST_ONLY unconditionally.

Tested and Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>


>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_concurrent.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 117016dc44e8..d82ca0404839 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -184,6 +184,7 @@ prepare_planes(data_t *data, enum pipe pipe, int
> max_planes,
>  	y[primary->index] =3D 0;
>  	for (i =3D 0; i < max_planes; i++) {
>  		igt_plane_t *plane =3D igt_output_get_plane(output, i);
> +		int ret;
> =20
>  		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>  			continue;
> @@ -206,7 +207,18 @@ prepare_planes(data_t *data, enum pipe pipe, int
> max_planes,
> =20
>  		igt_plane_set_position(data->plane[i], x[i], y[i]);
>  		igt_plane_set_fb(data->plane[i], &data->fb[i]);
> +
> +		ret =3D igt_display_try_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> +		if (ret) {
> +			igt_plane_set_fb(data->plane[i], NULL);
> +			igt_remove_fb(data->drm_fd, &data->fb[i]);
> +			data->plane[i] =3D NULL;
> +			break;
> +		}
>  	}
> +	max_planes =3D i;
> +
> +	igt_assert_lt(0, max_planes);
> =20
>  	/* primary plane */
>  	data->plane[primary->index] =3D primary;

--=-z5P14o1LAqCfYLMI58Xw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyjoKkACgkQVenbO/mO
WklCXwgAnB/kXi4vUiKwt9fr+RdMmwnGeMId71lTvRlI49xMDQOSFqpf/BaWhXRB
CE4DmIVgrrfeHr6txw6Xf4QyaBA+hSvs4Wm/9uJnwunk+680OHt/wcvOPjDnh4ZU
4az8jsGPr9IPTdP3Q7pAEBfO5R4eVx1ccV05QJadO2Ws8J8DTDTMdEizZpNzM5d+
eNSE9XHVOWix4oS5w5zJkIjQd9CFREnDBZhwrMjajrjqw6iH+5mH4dBEoHScnfvL
hCcU0q9bZbFcNnoTosAY2hh5Pfg6eo1Ylun4GclG9eel4KCV6bY8jo8qTZzg7NmO
aYNiWYpTcNkaKtCJl6QE2OmvjnQyNw==
=4WH8
-----END PGP SIGNATURE-----

--=-z5P14o1LAqCfYLMI58Xw--

--===============2003945971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============2003945971==--
