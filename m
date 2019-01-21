Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 21 Jan 2019 07:34:32 -0200
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190121093432.jf6vfbmjmb2rzlyz@smtp.gmail.com>
References: <20190118112920.56syxshpya3urqps@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190118112920.56syxshpya3urqps@smtp.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Add test to check
 suspend/resume
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0706580300=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Shayenne Moura <shayenneluzmoura@gmail.com>
Cc: Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0706580300==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a3at2giehlp6wtzk"
Content-Disposition: inline


--a3at2giehlp6wtzk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On 01/18, Shayenne Moura wrote:
> This patch adds one test to evaluate suspend/resume operations using kms_=
flip.
>=20
> Signed-off-by: Shayenne Moura <shayenneluzmoura@gmail.com>
> ---
>  tests/kms_flip.c | 1 +
>  1 file changed, 1 insertion(+)
>  mode change 100644 =3D> 100755 tests/kms_flip.c
>=20
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> old mode 100644
> new mode 100755
> index f28272dd..3ca2fdfc
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1567,6 +1567,7 @@ int main(int argc, char **argv)
>  		{ 10, TEST_DPMS_OFF | TEST_DPMS | TEST_VBLANK_RACE, "dpms-vs-vblank-ra=
ce" },
>  		{ 10, TEST_MODESET | TEST_VBLANK_RACE, "modeset-vs-vblank-race" },
>  		{ 0, TEST_BO_TOOBIG | TEST_NO_2X_OUTPUT, "bo-too-big" },
> +		{ 30, TEST_FLIP | TEST_SUSPEND, "flip-vs-suspend" },

I remember to follow a conversation in the IRC that you said that VKMS
pass this test. I tried it here on my VM, and after running the test my
system got freeze. My VM uses Arch Linux with Kernel 5.0.0-rc1. Did I
miss something?

Also, I tested it on my host machine with i915 driver and I noticed that
the test took much more than 30 seconds to finish. Is it right?

Thanks
Best Regards

>  	};
>  	int i;
> =20
> --=20
> 2.17.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=E3o Paulo

--a3at2giehlp6wtzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlxFkigACgkQWJzP/com
vP+wHQ/+JWyE4hWvrJfpZoF1Iy6sv35A6MMPwam1sNovsFiO6EH9zsZ+UCBx+ZyX
s7WHtNzZ+czuYupyIyDcCe3qOqS4517GJdLZITk+24ZQePAfLBwoZ7zmbcz+USWU
fQdBTepTxsXAu+XRb8G64RwYOQ+Df2a3g1RFfgKLk5p8dlNIlj3rU7pAKfvzuAcu
5B4pI/bGe1tw+rIL7SNPgxgZtkCMxOhGC2kZaGKRVAJFjal4IG+qouOrzrYLmQDo
FLHBvpM9nrt+0hegSXFhisrfabadivSjZ9cczLsZkW7Q41kcTuD74vYqKNZ7btcm
UOhgrH4XBLwS8jwWe7R27oA4C6idhjVqH039eGDK8A7uLmTZ8LskUXGbqV4ZzxHo
4jtiMoMZ/BKQOrqk0XIfr5HK4P0G0w75m7VVy0HM0N+Sj522py8PJO6fJuBiuIFU
MfUzyDqFTXNlFld765cKi/M6UIzIavqFpEA2M5P5n5B75JqaCliurm7U703NwSko
QxDXlUrAJI67wdgb7A37az4xSi+jX/67pYo0OiIBuljmJoWb49OIM/uwKBSs/9DZ
oHfruk+gqJGnee+9uu0UobnAA2a6aYHlrRaPinNRbxmt0qww6/b7K5RtvFpkvZGq
HpU6r2Bm/qpsnCM31ISh83YIzl35R2Guc4vB9MzR8mW4Q8rvyjY=
=X9nb
-----END PGP SIGNATURE-----

--a3at2giehlp6wtzk--

--===============0706580300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0706580300==--
