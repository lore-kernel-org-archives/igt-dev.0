Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FA66E448
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 16:17:19 +0000 (UTC)
Date: Mon, 29 Mar 2021 12:17:14 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210329161714.tved4jivpesrzke7@outlook.office365.com>
References: <20210329140347.240201-1-mail@aurabindo.in>
In-Reply-To: <20210329140347.240201-1-mail@aurabindo.in>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] tests/amdgpu: Add test description for
 amd_abm
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1599628972=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1599628972==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="amqnk4vebakydisz"
Content-Disposition: inline

--amqnk4vebakydisz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 03/29, Aurabindo Pillai wrote:
> From: Aurabindo Pillai <aurabindo.pillai@amd.com>
>=20
> Add overall test description for amd_abm
>=20
> Changed in v2: Removed change id.
>=20
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>  tests/amdgpu/amd_abm.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 0505f17e..a1e48533 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -32,6 +32,8 @@
>  #include <fcntl.h>
>  #include <time.h>
> =20
> +IGT_TEST_DESCRIPTION("Tests Adaptive Backlight Modulation on supported h=
ardware");
> +
>  #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
> =20
>  typedef struct data {
> --=20
> 2.31.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--amqnk4vebakydisz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmBh/YUACgkQWJzP/com
vP+bkg//cPTobI6Ad0wFNsI58QwP8tq9KHy+niUFFsh8kaKi1o4Eonl9xu5IVvN8
vnRME+2+AezguPymcQmS97zL+Qhfw21y6WBjToFPII1KWlsqmY6rfYWIh6OB3dcK
obX5TLFp/yvDvZTTCDfxe0vlNF/h/JtwtlBDr2TyHm15yAQx+FPNPPDHFFbWRfe6
TBAClJdjK9Wcg/fF8pd8vxphezC0fTTP46LPQBmTbNNMbZhS0LNqWj6G7MBBAmMM
W5WPHRJFauyNjDc8VTCgXhwkAdKwEW9bxpCVew5Mz/Kmlz16HWUFfGiTCZROpIWv
alE2khx4nbr07Lm9j+QMkOUghj916HhNtZ6YY7LhGw38U04RzGYv0H2qo5muxfk6
zFp92KbntELy1tecZAyGRJijTXZYtYBjg0fCXOYOK7J/MKrCMsavQq3HRjCd++L0
HvQ1LW/XLi+tVJ+28+xywF/JtWCBOULa+cmU2hIJGcS0R2Z8Yh9Kz80e/in/eqSU
SmviNQPvx4d8PmldLkz51osBef4fHyciW/OoFATKlU4AlqkQ6UBt/aXdPtAtvrce
rKdzzGvZb9NhzT+UbRk7JGg9oiLOcEIJX2SHFz2Di/JdnmO2b32R7k9RggRJQ5nJ
YH1jtQt0HVFWqjKmFvuOVkNwlwI0B4fOs0BqphLkcap1KJgll9o=
=dkk+
-----END PGP SIGNATURE-----

--amqnk4vebakydisz--

--===============1599628972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1599628972==--
