Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032F76E3BE
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2019 20:33:51 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 22 Mar 2019 20:33:49 +0000
Message-ID: <27039e7645410bbb1804454df624bf3a22911deb.camel@intel.com>
References: <20190321231822.9118-1-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20190321231822.9118-1-dhinakaran.pandiyan@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Disable DSC even if
 enabling failed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1273533708=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1273533708==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-83qYqKOvHW9F3VpDHec8"

--=-83qYqKOvHW9F3VpDHec8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-21 at 16:18 -0700, Dhinakaran Pandiyan wrote:
> The test leaves the debugfs flag enabled if the driver failed to
> enable
> DSC. And is it turns out, the feature gets enabled only after the
> test
> completes and consequently affects PSR2 tests that follow. Let's make
> sure
> the test cleans up correctly, even if the DSC test itself needs to be
> fixed.
>=20
> Also included some formatting fixes within the function.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
>=20
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> ---
>  tests/kms_dp_dsc.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
> index 9792be33..da93cd74 100644
> --- a/tests/kms_dp_dsc.c
> +++ b/tests/kms_dp_dsc.c
> @@ -157,14 +157,16 @@ static void update_display(data_t *data, enum
> dsc_test_type test_type)
> =20
>  	if (data->connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort &&
>  	    data->pipe =3D=3D PIPE_A) {
> -		igt_debug ("DSC not supported on Pipe A on external
> DP\n");
> +		igt_debug("DSC not supported on Pipe A on external
> DP\n");
>  		return;
>  	}
> =20
>  	if (test_type =3D=3D test_basic_dsc_enable) {
> -		igt_debug ("DSC is supported on %s\n",
> -			   data->conn_name);
> +		bool enabled;
> +
> +		igt_debug("DSC is supported on %s\n", data->conn_name);
>  		force_dp_dsc_enable(data);
> +
>  		igt_create_pattern_fb(data->drm_fd, data->mode-
> >hdisplay,
>  				      data->mode->vdisplay,
>  				      DRM_FORMAT_XRGB8888,
> @@ -174,13 +176,20 @@ static void update_display(data_t *data, enum
> dsc_test_type test_type)
>  						    DRM_PLANE_TYPE_PRIM
> ARY);
>  		igt_plane_set_fb(primary, &data->fb_test_pattern);
>  		igt_display_commit(&data->display);
> -		/* Until we have CRC check support, manually check if
> RGB test pattern has no corruption */
> -		manual ("RGB test pattern without corruption");
> -		igt_assert_f(is_dp_dsc_enabled(data),
> +
> +		/*
> +		 * Until we have CRC check support, manually check if
> RGB test
> +		 * pattern has no corruption.
> +		 */
> +		manual("RGB test pattern without corruption");
> +
> +		enabled =3D is_dp_dsc_enabled(data);
> +		clear_dp_dsc_enable(data);
> +
> +		igt_assert_f(enabled,
>  			     "Default DSC enable failed on Connector:
> %s Pipe: %s",
>  			     data->conn_name,
>  			     kmstest_pipe_name(data->pipe));
> -		clear_dp_dsc_enable(data);
>  	} else {
>  		igt_assert(!"Unknown test type\n");

Ugr

--=-83qYqKOvHW9F3VpDHec8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyVRqwACgkQVenbO/mO
Wkn/ugf/VVt+MLrMrjyqnU3YyE5rbfdM8g/y2EHW1Bj6hntSyB83sAEBoi8Nks2k
VR5K7vtiuwSbEm8OMv0c/wYAtBZ0IDoF3parVRavWzjbYI06yXUJi0TI6YtsJObk
ranZ36ajOSwn0+Ug1SzEtLoK7rgROjsop4f+IiBh3KFteJzXufiACui2bCvc/yyw
KNS5uCbJfgIVgbTVVN58c/SMEjCa1E5IK+cIdI9RfngU87GNX3uTfYMAZ0/mHE9j
0ADKmrjbQFg1CYtjJAXlppwscvMkMil9E9MIRN7Di+7H5FvZh7M4wTMjfqidlPom
WFXhhQ1wtFrqA5J6jUO68O+Tjuo/DQ==
=2z3C
-----END PGP SIGNATURE-----

--=-83qYqKOvHW9F3VpDHec8--

--===============1273533708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1273533708==--
