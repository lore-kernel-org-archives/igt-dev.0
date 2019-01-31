Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B866E170
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jan 2019 20:59:06 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 31 Jan 2019 20:58:39 +0000
Message-ID: <81ed0c63f689aa79f0a0dec6d303044fa9a69d71.camel@intel.com>
References: <20190131141852.14187-1-maarten.lankhorst@linux.intel.com>
 <20190131141852.14187-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20190131141852.14187-2-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_frontbuffer_tracking: Fix
 skips when PSR is not available.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0177233549=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0177233549==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-AxNlhGIZU/DMmmPU/1Sq"

--=-AxNlhGIZU/DMmmPU/1Sq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-01-31 at 15:18 +0100, Maarten Lankhorst wrote:
> Use psr.can_test to determine we can disable PSR, and not skip
> because
> PSR is unavailable.
>=20
> Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  lib/igt_psr.c                    | 2 +-
>  tests/kms_frontbuffer_tracking.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 5eb6d2c6ace5..6ad2c522f9a4 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -106,7 +106,7 @@ static bool psr_set(int debugfs_fd, int mode)
> =20
>  	ret =3D has_psr_debugfs(debugfs_fd);
>  	if (ret =3D=3D -ENODEV) {
> -		igt_skip_on_f(mode >=3D PSR_MODE_1, "PSR not
> available\n");
> +		igt_skip("PSR not available\n");
>  		return false;
>  	}
> =20
> diff --git a/tests/kms_frontbuffer_tracking.c
> b/tests/kms_frontbuffer_tracking.c
> index 609f7b41a527..4d15ce1cf1d6 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -1134,7 +1134,7 @@ static bool disable_features(const struct
> test_mode *t)
> =20
>  	fbc_disable();
>  	drrs_disable();
> -	return psr_disable(drm.debugfs);

Although the return true of this functions will cause a unecessary
igt_display_commit() this changes looks good. In other patch we could
just drop the return and remove the commit in prepare_subtest_data().

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

> +	return psr.can_test ? psr_disable(drm.debugfs) : false;
>  }
> =20
>  static void *busy_thread_func(void *data)

--=-AxNlhGIZU/DMmmPU/1Sq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxTYX0ACgkQVenbO/mO
WklevAf/Z8ICypA4ahsLGv35i5+PRV7NEBncOyad9C3UhUCbmMh1b2gAb548XNW1
tzeeg1GuBpn7UUrvD9xu/ORKZXkXZ1J2uFzdlodP5Oj8as57SwAS8RoEfKv9tH6N
haeEiz4Qavd88A2VV9GogF7bxSw4YKOzxoVlz9Jdegj2PunxOy1QbHnyIcfLX0Yk
ezI4B7HYT37B3cjbBUXiIvK56q+J+nxyye1VITpjiByP2HpIJnBHmLQoPx932iI7
Abi8yknkxBk4ph9U67Bj7KcgJmSbwX+x2caBx1qowNorUK6RBCoYnZ3E9zbyPk9c
DKQa1zKxhVHsN19Q19OMF5BzR47oGg==
=Xs73
-----END PGP SIGNATURE-----

--=-AxNlhGIZU/DMmmPU/1Sq--

--===============0177233549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0177233549==--
