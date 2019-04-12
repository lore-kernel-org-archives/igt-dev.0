Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA38D89083
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 14:54:23 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 12 Apr 2019 14:54:07 +0000
Message-ID: <3d0d06543f88e74505fab7aade9e836aedff4015.camel@intel.com>
References: <20190412110740.8036-1-mika.kahola@intel.com>
In-Reply-To: <20190412110740.8036-1-mika.kahola@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Test if pixel
 format supports rotation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0401817937=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kahola,
 Mika" <mika.kahola@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0401817937==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-eOlYxbXBBNtB959ecvQc"

--=-eOlYxbXBBNtB959ecvQc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-04-12 at 14:07 +0300, Mika Kahola wrote:
> Before actually do the commit with plane rotation, test if the pixel
> format
> supports requested rotation. Kernel replies with -EINVAL when
> requested to do
> rotation with the pixel format that is not supported. The patch uses
> this fact
> to filter out unsupported pixel formats.
>=20
> References: https://bugs.freedesktop.org/show_bug.cgi?id=3D109052
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D110369
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  tests/kms_plane_scaling.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index e843bf86..57092263 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -138,6 +138,7 @@ static void check_scaling_pipe_plane_rot(data_t
> *d, igt_plane_t *plane,
>  	igt_display_t *display =3D &d->display;
>  	int width, height;
>  	drmModeModeInfo *mode;
> +	int errno;
> =20
>  	cleanup_crtc(d);
> =20
> @@ -158,7 +159,15 @@ static void check_scaling_pipe_plane_rot(data_t
> *d, igt_plane_t *plane,
>  	igt_plane_set_position(plane, 0, 0);
>  	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>  	igt_plane_set_rotation(plane, rot);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/*
> +	 * Test first, if pixel format supports rotation.
> +	 * We expect from kernel to return with -EINVAL
> +	 * if format is not supported.
> +	 */
> +	errno =3D igt_display_try_commit_atomic(display,
> DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> +	if (errno !=3D -EINVAL)
> +		igt_display_commit2(display, COMMIT_ATOMIC);

This is going to cause the test to always pass, becoming useless.

It is already filtering out the know format and rotation combination
that should not work in the caller, if a combination is not covered it
should be added to those:

if (igt_fb_supported_format(format) && igt_plane_has_format_mod(plane,
format, tiling) && can_rotate(d, format))
	check_scaling_pipe_plane_rot(d, plane, format, tiling, pipe,
output, rot);


> =20
>  	igt_plane_set_fb(plane, NULL);
>  	igt_plane_set_position(plane, 0, 0);

--=-eOlYxbXBBNtB959ecvQc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlywpo4ACgkQVenbO/mO
WklzQQf+P7xDp4X2y3OZL2lB6sGyVAZaOAvnkjcVavxOmUVqOoDuAhn0nnH9NU8Z
AzDSwA4Cfz9mgAQ/hldioD8lhEsYrFs7Z7FLOMazZ4XS7hDrv46bWwdNi5WIAwlU
BTnADippUPggrZamayLYgXk9psU0K894dMfKfdF7udsYpJMQ/IDGO7m6KB6BwlFI
oM5m3O8sQybVlnzS0qt4+D2V8adiX6FGvcxbk70gcJMNS9/KyOnHE1lIVZ7VSdDQ
ZeSreyUGqHigJCTRVZO5qVTglOK3/k9/p2lHQZ5IzxL3+3bRLN6BySD46xZFvoaB
g/gqtUej09Ms64VXSu3q2dxoNyzmrQ==
=Jk+V
-----END PGP SIGNATURE-----

--=-eOlYxbXBBNtB959ecvQc--

--===============0401817937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0401817937==--
