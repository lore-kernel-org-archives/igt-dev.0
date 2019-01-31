Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371416E170
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jan 2019 21:00:43 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 31 Jan 2019 21:00:37 +0000
Message-ID: <4b611b9a0f0e51417b7a25bf55074626062df520.camel@intel.com>
References: <20190131141852.14187-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20190131141852.14187-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/psr: Do not use out of bound
 enum for psr_set.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0920364637=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0920364637==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-tlqOrtYEWoGoM1RMfqeU"

--=-tlqOrtYEWoGoM1RMfqeU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-01-31 at 15:18 +0100, Maarten Lankhorst wrote:
> Using an undefined int not in the enum is undefined. Use -1 and
> change
> mode to an integer.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

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

--=-tlqOrtYEWoGoM1RMfqeU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxTYfQACgkQVenbO/mO
WklKFgf9G3hf+0pMy2eE0SksBeK8igrCCNdYdx1EpWHEwUCcBQo2andS3REa1y3N
z/anXtO1Y3czuukXxaSRkoxyAhCJ8IVP/idrwCM0/iSL/loANcuc8ovTLTk7Eh4N
SELyWIeWIvU+N+NuhIFty4nQJQZCZSkXm+i7RPNYHEEyRMild+s8Ty8fEFyRh9rb
hAKnMVZJyzKx6W+UzKmad7amyk/jQP+S+GLf9BcDGFmCg10hVdkN0PdCbgSaqIGu
JttNnY8hdhC5eHupllOBp3L0tW928MpdHigOLwfhxU8HunyPnWfYNOnELTMCOjAu
g86sIWot/6lxFpYR6wWp69g3AB3sJA==
=CE7n
-----END PGP SIGNATURE-----

--=-tlqOrtYEWoGoM1RMfqeU--

--===============0920364637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0920364637==--
