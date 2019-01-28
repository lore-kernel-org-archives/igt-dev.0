Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC48F6E756
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 23:09:01 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 28 Jan 2019 23:08:59 +0000
Message-ID: <d2ceaf80cacb90a0900bf9944573cf19aaf1b165.camel@intel.com>
References: <20190128125037.24541-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20190128125037.24541-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/psr: Fix skips on
 kms_frontbuffer_tracking on !PSR capable platforms.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1458933304=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1458933304==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-B3zzEw5GM4lBsoWcXr7z"

--=-B3zzEw5GM4lBsoWcXr7z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-01-28 at 13:50 +0100, Maarten Lankhorst wrote:
> We unconditionally call psr_disable in kms_frontbuffer_tracking,
> which
> causes a skipping of all tests on PSR incapable platforms. Use a
> proper
> int in psr_set() and use -1 to denote disable.

The call to disable_features() is the one causing problems? Could share
one report with this problem?

If this is the case would not be easier just do this?

static bool disable_features(const struct test_mode *t)
{
	bool ret =3D true;

	if (t->feature =3D=3D FEATURE_DEFAULT)
		return false;

	fbc_disable();
	drrs_disable();
	if (psr.can_test)
		ret =3D psr_disable(drm.debugfs);
	return ret;
}

>=20
> Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  lib/igt_psr.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index d726fad58e9d..5eb6d2c6ace5 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -100,13 +100,13 @@ static void restore_psr_debugfs(int sig)
>  	psr_write(psr_restore_debugfs_fd, "0");
>  }
> =20
> -static bool psr_set(int debugfs_fd, enum psr_mode mode)
> +static bool psr_set(int debugfs_fd, int mode)
>  {
>  	int ret;
> =20
>  	ret =3D has_psr_debugfs(debugfs_fd);
>  	if (ret =3D=3D -ENODEV) {
> -		igt_skip("PSR not available\n");
> +		igt_skip_on_f(mode >=3D PSR_MODE_1, "PSR not
> available\n");
>  		return false;
>  	}
> =20
> @@ -117,7 +117,7 @@ static bool psr_set(int debugfs_fd, enum psr_mode
> mode)
>  		 * version enabled and the PSR version of the test, it
> will
>  		 * fail in the first psr_wait_entry() of the test.
>  		 */
> -		ret =3D psr_modparam_set(mode <=3D PSR_MODE_2);
> +		ret =3D psr_modparam_set(mode >=3D PSR_MODE_1);
>  	} else {
>  		const char *debug_val;
> =20
> @@ -155,7 +155,7 @@ bool psr_enable(int debugfs_fd, enum psr_mode
> mode)
>  bool psr_disable(int debugfs_fd)
>  {
>  	/* Any mode different than PSR_MODE_1/2 will disable PSR */
> -	return psr_set(debugfs_fd, PSR_MODE_2 + 1);
> +	return psr_set(debugfs_fd, -1);
>  }
> =20
>  bool psr_sink_support(int debugfs_fd, enum psr_mode mode)

--=-B3zzEw5GM4lBsoWcXr7z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxPi4kACgkQVenbO/mO
Wkl4EggAkc8mce/XIP/SsDqKFgQJi8rau9x56qdH/lgj7h3mh8whQ+tOnS7ZxmyC
KiQ7/6vswap0ImrjQCdH/8c+r4fKOGcCm/pyEFsFWcLgwnJuE+yT9UJiDdiH9/1e
57IOzndHMIIikLKK0cR96Tz1EQyp6T0lU35bHcn1kEL0EYanwE9D9+V0h606Q9QS
l432PH0fFBS6G2j8SKMXhr5HGSuP75023YtY1kI6TVoA+fRfr2vglGNK+Pb9XwZA
gdRH6ZXbFb+WxDBLt83e7Z8DUOWnuijp9OXr2AEz+0QOMPGRN1Hzp/rFKMjSzj0v
xhp9uaHD5KV3OkO1hUdZj9dQzLKi3g==
=zZPY
-----END PGP SIGNATURE-----

--=-B3zzEw5GM4lBsoWcXr7z--

--===============1458933304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1458933304==--
