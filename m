Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830866E135
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Feb 2019 18:45:02 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 5 Feb 2019 18:45:00 +0000
Message-ID: <bfdf6a356fc2f95bbb3fd3b4e9a39473afe898f1.camel@intel.com>
References: <20190204205556.32512-1-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20190204205556.32512-1-dhinakaran.pandiyan@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_fbcon_fbt: Do a full
 connector probe.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2132509797=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2132509797==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-n45tWBwrPoyOzV3DQt3w"

--=-n45tWBwrPoyOzV3DQt3w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-02-04 at 12:55 -0800, Dhinakaran Pandiyan wrote:
> kms_fbtcon_fbt appears to fail when it is the first test that is
> executed
> after module load.
> 'Test requirement not met in function set_mode_for_one_screen, file
> ../tests/kms_fbcon_fbt.c:153:
> Test requirement: i < drm->res->count_connectors'
> The problem seems to be that the 1920x1080 bios fb is re-used and
> that
> prunes the 4k mode before test execution. Later, when the test does
> not
> do a full-probe, the eDP connector does not have any valid modes.

drmModeGetConnectorCurrent() will get only one mode, the active one.

>=20
> <7>[   12.444411] [drm:drm_mode_debug_printmodeline] Modeline
> 191:"3840x2160" 60 533250 3840 3888 3920 4000 2160 2163 2168 2222
> 0x48
> 0xa
> <7>[   12.444418] [drm:drm_mode_prune_invalid] Not using 3840x2160
> mode:
> VIRTUAL_X
>=20
> Fix this by calling drmModeGetConnector() instead
> drmModeGetConnectorCurrent()
>=20
> Note that that test is still expected to fail as PSR status checks
> are
> broken.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

>=20
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D109518
> Signed-off-by: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> ---
>  tests/kms_fbcon_fbt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> index 9d0d5a36..40465a1c 100644
> --- a/tests/kms_fbcon_fbt.c
> +++ b/tests/kms_fbcon_fbt.c
> @@ -67,7 +67,7 @@ static void setup_drm(struct drm_info *drm)
>  	igt_assert(drm->res->count_connectors <=3D MAX_CONNECTORS);
> =20
>  	for (i =3D 0; i < drm->res->count_connectors; i++)
> -		drm->connectors[i] =3D drmModeGetConnectorCurrent(drm-
> >fd,
> +		drm->connectors[i] =3D drmModeGetConnector(drm->fd,
>  						drm->res-
> >connectors[i]);
> =20
>  	kmstest_set_vt_graphics_mode();

--=-n45tWBwrPoyOzV3DQt3w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxZ2aoACgkQVenbO/mO
Wklqqwf8DsgUu9Ph3Nz1kdusbTr0WFEQ1FRjMftIEe7zN3LpMHTUFqfSxDUMXQRT
Yw3XLa5YzrvHaBQTpbmZ+jeAdTdl4z9YbWhcbivUpD6beKDOXyXB852a3jwAR8CM
zx0w6nVYWz1TzA1MQaeV/XjMPs0I5GjwGjufiK9nfohHScCTkJPhEJHTwAUVZOjq
8s9eAm2QyxOIWHyaHgRcSAooAeB9G/cgHekRaQR1tf86+fmFTwC0BNzQjwDjPAlt
RAp4C9VUe1JoQ6p5qTGax/5q0TOD5PYbn/tySvn5rc2VWAu1VAct4FaMlNDh8Ig6
lW8K2dAMegxgwkafGs9hU0HWdHKR+g==
=9IMo
-----END PGP SIGNATURE-----

--=-n45tWBwrPoyOzV3DQt3w--

--===============2132509797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2132509797==--
