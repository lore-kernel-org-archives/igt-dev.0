Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056E89F0B
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 13:12:59 +0000 (UTC)
Date: Tue, 15 Jun 2021 09:12:54 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210615131254.5x5u2fjyy7p3uctf@outlook.office365.com>
References: <20210614164135.1519746-1-markyacoub@chromium.org>
In-Reply-To: <20210614164135.1519746-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_prime: Filter out devices that
 can't import buffers.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0488732351=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: igt-dev@lists.freedesktop.org, Anson.Jacob@amd.com, seanpaul@chromium.org, petri.latvala@intel.com, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

--===============0488732351==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55xcr3tqu3ancye2"
Content-Disposition: inline

--55xcr3tqu3ancye2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex and Christian,

This patch is related to prime, but I'm not familiar with this part of
our driver. Could you take a look at that?

Thanks

On 06/14, Mark Yacoub wrote:
> Some devices such as amdgpu do not support imported buffers.
> Filter out those devices.
> Tested on Zork with chromeos-kernel-5_4.
>=20
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_prime.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 8cb2ca2a..480c7eb4 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -249,6 +249,16 @@ static void test_crc(int exporter_fd, int importer_f=
d)
>  	igt_display_fini(&display);
>  }
> =20
> +/* The test attempts to import the buffer object from one device to anot=
her.
> + * Filter out devices that aren't capable of doing this.
> + */
> +bool does_device_support_dmabuf_import(int fd) {
> +	/* AMDGPU uses VRAM. Any use of the fb will migrate it to VRAM, which i=
s not sensible for
> +	 * an imported dma-buf.
> +	 */
> +	return !is_amdgpu_device(fd);
> +}
> +
>  igt_main
>  {
>  	igt_fixture
> @@ -262,10 +272,10 @@ igt_main
> =20
>  		/* ANY =3D anything that is not VGEM */
>  		first_fd =3D __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
> -		igt_require(first_fd >=3D 0);
> +		igt_require(first_fd >=3D 0 && does_device_support_dmabuf_import(first=
_fd));
> =20
>  		second_fd =3D __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
> -		igt_require(second_fd >=3D 0);
> +		igt_require(second_fd >=3D 0 && does_device_support_dmabuf_import(seco=
nd_fd));
> =20
>  		if (has_prime_export(first_fd) &&
>  		    has_prime_import(second_fd))
> --=20
> 2.32.0.272.g935e593368-goog
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--55xcr3tqu3ancye2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDIp1IACgkQWJzP/com
vP9zGBAAkXXQz9yor5IHWFzaVg6Ydi9SMR1kz5/HBPrtw5A2l1XXQEt2AEV5uibg
dicMtjtQHmFOe6cAG9ysbCjnIKdnPknJag6nwn/H63aVAQGiVgNxgvHSAxVblHBv
4cQXshn6iPSBfH4dtV/6dHhOWI8tDBNfJLOa4tYg4JMij7HdeCS/Y77HGTUmEdRf
exTBO9GfO5vD6M2hH4sWozNdXwOwwzFXSmtSH+DCtSgz4cwfrPXNIRj0QulzBypl
Z+QgX5xSNIFbP+JSwg4/Cuq5B80HU9Vba/QlXd8p2DRQIjfL8np48QaaGLGNKew/
YQRwk8dKTUZ63XNASPUploybXxRCki6cBuTnzXlrD5SoiyTpz/5RzFr7xrkrl6ZL
1qM7NfD19CNHfMEpYMonF88llxozQGqI3GfXwYBJtQzLh+sTR06KMPWeqhABMzoB
YOHoY6PSxFNK30wnsqDUETb6yDWNS0tT7RtMruKCsCeQbCA4k3bvsH+tEU/xWbDE
Lu8DM3XXo27HxRYePjEenszrTZ4EOnZuPa6y37UGA1j8k0zMSvnTOTggrGC9TvLw
z90BoCI4wBPlnAjvNpdcyaIy5XB570FtYxOXr5Cc1JNcvqN092xlb/vCRXVf77v4
i9/BtA7fvehJnvAI9m5KkcxVS+Gox6dyctOiVEFnqjxcJ3zTZng=
=iKPi
-----END PGP SIGNATURE-----

--55xcr3tqu3ancye2--

--===============0488732351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0488732351==--
