Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF076E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 13:44:15 +0000 (UTC)
Date: Mon, 29 Mar 2021 09:44:10 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210329134410.o5jnxnh2d36y6tu4@outlook.office365.com>
References: <20210329130642.236359-1-mail@aurabindo.in>
In-Reply-To: <20210329130642.236359-1-mail@aurabindo.in>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: Add test description for amd_abm
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2117866037=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Aurabindo Pillai <mail@aurabindo.in>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2117866037==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogu3t6kib6voxd63"
Content-Disposition: inline

--ogu3t6kib6voxd63
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Aurabindo,

On 03/29, Aurabindo Pillai wrote:
> From: Aurabindo Pillai <aurabindo.pillai@amd.com>
>=20
> Add overall test description for amd_abm
>=20
> Change-Id: I4baa52ea66189688b12a82befbbd842ba3d3a24d

We don't need this Change-id in IGT.

Aside from the above comment, everything LGTM.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Let me know if you need help for applying this change in IGT.

Thanks
Siqueira

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

--ogu3t6kib6voxd63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmBh2aUACgkQWJzP/com
vP/1Fw//aADuYZMxHMOHVUXjON7GsZIdqInGSF7B8Hq9yFjgPufjgTNkAHD+TimV
5aZFeRI8F1bfl9HDmnuRsohPDsKknhDMakFipzuVBDdCdgxQgWPUfMKChQMSq3bh
+JIor3kmiqe6mI7SICSMC4i3UbWBa/TETsiQBbjCy2kKsaZ+g20Hfc/YnQdCjK4x
sO2BpJaJ4uy8c4kKV++lb8PGulY6VNCQofJmrWijM9H8C9XZxDWf0MgYKFBZECRZ
+YfXWyUbns664+wrrfDxyCz1pEs1zAmo/T05LPdoOOnRDtROFOqEncj+PZGqsDEe
99E+uiHSsAfVjDHwGeNzw6q7JChGuDw8MAMMHjHjUwVGeS1Q6ASKyIkHyjkJE3r+
71Q3D5XRf3jr1BHoY0UmiVrzP35PoIk7SJSo5OlgkjifBkQt9v5nFQd92BRf8Jvm
0cDyGUcmjxUZhNT6zlFjjYRhihVqKvYearQhPQvr9W/w81CSrt4gPtBfjXOTYK77
Vk8Ol4I9QxVNx0d1dVRfgXJNTUt5vMNZfODyMG53TixVn/YzNn8VP68w1NCa/YGc
kQVHRbBvxENbYfvv4wBfwD1lsogz55GrN3EtzsMQ7IYOGPSPYBC0eYN9NZo+BHyp
dsHDD9TEnsdFZuLbrlBLiNDKU4BKF5NRs1vwxXoQ7wX2l8jwGaE=
=yQ6x
-----END PGP SIGNATURE-----

--ogu3t6kib6voxd63--

--===============2117866037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2117866037==--
