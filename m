Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC1A8977A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 19:39:35 +0000 (UTC)
Date: Mon, 14 Jun 2021 15:39:31 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210614193931.opnayynsdxsboogg@outlook.office365.com>
References: <20210614153557.19934-1-Anson.Jacob@amd.com>
 <20210614153557.19934-2-Anson.Jacob@amd.com>
In-Reply-To: <20210614153557.19934-2-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/amdgpu: Fix typo in
 amd_module_load
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0247774170=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Victor Lu <victorchengchi.lu@amd.com>, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

--===============0247774170==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ddblbijkx2kruiwu"
Content-Disposition: inline

--ddblbijkx2kruiwu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Anson,

Let's squash this patch with the previous one.

Thanks

On 06/14, Anson Jacob wrote:
> From: Victor Lu <victorchengchi.lu@amd.com>
>=20
> A typo in amd_module_load was causing the test to fail.
> igt_assert_f(err, 0) should have been igt_assert_eq(err, 0),
> to check err =3D=3D 0. Also added drm_fd >=3D 0 check and made
> ioctl query more explicit.
>=20
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>
> ---
>  tests/amdgpu/amd_module_load.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_loa=
d.c
> index e682d2c5..8762b2a2 100644
> --- a/tests/amdgpu/amd_module_load.c
> +++ b/tests/amdgpu/amd_module_load.c
> @@ -41,8 +41,10 @@ sanity_check(void)
>  	args.return_pointer =3D (uintptr_t) &arg_ret;
>  	args.return_size =3D sizeof(int);
>  	args.query =3D AMDGPU_INFO_HW_IP_INFO;
> +	args.query_hw_ip.type =3D AMDGPU_HW_IP_COMPUTE;
> =20
>  	fd =3D drm_open_driver(DRIVER_AMDGPU);
> +	igt_assert_f(fd >=3D 0, "Module failed to load\n");
>  	igt_set_timeout(1, "Module reload timeout!");
> =20
>  	if (ioctl(fd, DRM_IOCTL_AMDGPU_INFO, &args) < 0)
> @@ -51,7 +53,7 @@ sanity_check(void)
>  	igt_set_timeout(0, NULL);
>  	close(fd);
> =20
> -	igt_assert_f(err, 0);
> +	igt_assert_eq(err, 0);
>  }
> =20
>  igt_main
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--ddblbijkx2kruiwu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDHsHIACgkQWJzP/com
vP/4EhAAwcUgLjN/E2DrS7KAd7gtQXdfrX4yD1RvyYSOsewq7rv0O6fguBcojG9Z
u8usYg3s6VaZqCx6xCEoiVedOSD1f3AT58FsAmc5KJmuK58REVGkKGNL2pctZ8wL
E+q01ORO0bnwDFnEG94NIwZ3o4rlfNeZgb5M9cabvRZJZgMwXuaj49DpTeg81Kls
7nf72rovMWehkeVNwlJ1uy8ykT+SNwMyNeIQbMIoyOg0UPf5KSSwgeCV5SKtcmsh
EtiYoOFw7f6oHH36jbAzZPyh/fcEFrmHIW2NONGEI3ioQ4KsWuX3oOMkvRruQzjY
WEPXNvQaoLLNpbi1Dn5VI+x8Lm00397BVjFhWN1oAydhDqzCZr6gSMNXO3gKQt+l
l2/HHT7wIURCTZQ5Pnpbz4MKXVXvVVQ0WxdBtSanYaJwWtXdneGBOTn6uCZKOzpd
PhvweL5D7GnClJ15wLkyv/qsA0Pn2JvN3VQYSxbNmC1c50ayXLXASC457nMjYkVV
o9vREB57CXjLzAtuISmfkpMSAb1lh0NaAuDrC3ylOOy/VFSkwLXAN6UkiMyQF68D
VvfNfYw5xgXUsReQYG31loFAtTwOswMVAyTLvGYQRdhoQhPH0HILb/GCusoAUwij
H0NNN7lW1TyetNOeuqGYKYRGiNO4pjvUiCHhsZkFK9Zalo/ANrw=
=RXDQ
-----END PGP SIGNATURE-----

--ddblbijkx2kruiwu--

--===============0247774170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0247774170==--
