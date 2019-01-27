Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Sun, 27 Jan 2019 16:00:02 -0200
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190127180002.seqemwouk3jbmklk@smtp.gmail.com>
References: <20190122205405.dpzt3oxkpjxzgvnq@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190122205405.dpzt3oxkpjxzgvnq@smtp.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_flip: Add test to check
 suspend/resume
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1009532214=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Shayenne Moura <shayenneluzmoura@gmail.com>
Cc: Petri Latvala <petri.latvala@intel.com>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1009532214==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4p3xhjvuhuyslmpx"
Content-Disposition: inline


--4p3xhjvuhuyslmpx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/22, Shayenne Moura wrote:
> This patch adds one test to evaluate suspend/resume operations using kms_=
flip.
>=20
> Signed-off-by: Shayenne Moura <shayenneluzmoura@gmail.com>
>=20
> v2: Reduce test time to 10 (Daniel)
> ---
>  tests/kms_flip.c | 1 +
>  1 file changed, 1 insertion(+)
>  mode change 100644 =3D> 100755 tests/kms_flip.c
>=20
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> old mode 100644
> new mode 100755
> index f28272dd..3c29f47a
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1567,6 +1567,7 @@ int main(int argc, char **argv)
>  		{ 10, TEST_DPMS_OFF | TEST_DPMS | TEST_VBLANK_RACE, "dpms-vs-vblank-ra=
ce" },
>  		{ 10, TEST_MODESET | TEST_VBLANK_RACE, "modeset-vs-vblank-race" },
>  		{ 0, TEST_BO_TOOBIG | TEST_NO_2X_OUTPUT, "bo-too-big" },
> +		{ 10, TEST_FLIP | TEST_SUSPEND, "flip-vs-suspend" },
>  	};
>  	int i;
> =20
> --=20
> 2.17.1
>=20

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

--4p3xhjvuhuyslmpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlxN8aEACgkQWJzP/com
vP+Ljg/+KUgwriUenCshpd+xjhoIlp4ga080a09pZWktKmkVQD4p7ip5i6S2QwNO
PtyjXiJOg9zvr1fKKn1N+OiTMK8r7bScTaIl6XufNw+xYljPc/T4kf+p68nqojEC
8sWa+HC6XHqh9dt8aT7KzH0XMTBWuubqpEpEj5GdaDdfu30Upt12dmkVWUi3lEg+
+rPhYI9i0WTju0MtYiUhTNlcetKNz4zCxHpAwCZc+X07KGZ5hZ++aUf+3lAvebcJ
bepkPZagaoLljeNi2ETMFwRY9BlzvpK90toK/UjMCWt5Ji+IxTuCAaCiY+eLYkRV
GUnnV+6eomwdps6k9FuEq1GCS3vuy9mdOi4AiLJCVScJuADZw6Yfw7ZRHs6TpemC
qIMsCPW0fXmU8+CoYAcE8bi88V/IruEVoL4a+pjrwBEi0+VxXRHjDVOHy33sQ+b3
juwLMVmakT8iCoUPTsC4LajM1p+VIB7CqIwzjts6EN6DZEcQjoSLT6dp8GY6M+Hx
VUaRFfMwl3Qpzlb6uALbHkoaQDhf6PBTQAn+6Ds7g27oMSC66t81shjfQ/zUm3e0
lQFS6ekgTs4CT0f+uUfvTimUX9ZBJox+iFoH4O4/JaqC2Jw6BzzaKhMmApEnnPYt
nYUjaVfVfTu3px5ObvK2SazTgtj9omSdZSMP5nvY/+Qy4n8hgr8=
=po+i
-----END PGP SIGNATURE-----

--4p3xhjvuhuyslmpx--

--===============1009532214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1009532214==--
