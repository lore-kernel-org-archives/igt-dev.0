Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9B26EA9F
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 19:15:49 +0000 (UTC)
Date: Wed, 9 Jun 2021 15:15:45 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210609191545.jfya5x2zi3vu7a4q@outlook.office365.com>
References: <20210607183110.259414-1-markyacoub@chromium.org>
In-Reply-To: <20210607183110.259414-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_content_protection: Skip on
 hdcp_sink_capability is not found.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0716740560=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0716740560==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxemaohwdouwlak3"
Content-Disposition: inline

--pxemaohwdouwlak3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/07, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
>=20
> [Why]
> In some configurations such as kernel 5.4 on Zork with no DP connected,
> debugfs will not contain hdcp_sink_capability file.
>=20
> [How]
> Check for hdcp_sink_capability but skip the test if file is not found.
>=20
> Tested on ChromeOS Zork Kernel 5.4
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_content_protection.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 1d1a439a..a0a136da 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -402,6 +402,7 @@ static void test_content_protection_on_output(igt_out=
put_t *output,
>  static void __debugfs_read(int fd, const char *param, char *buf, int len)
>  {
>  	len =3D igt_debugfs_simple_read(fd, param, buf, len);
> +	igt_require(len !=3D -ENOENT);
>  	if (len < 0)
>  		igt_assert_eq(len, -ENODEV);
>  }
> --=20
> 2.32.0.rc1.229.g3e70b5a671-goog
>=20

Hi Mark,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

After applying this patch, which tests start to pass in your Zork
system?

+ Bhawan

Thanks

--=20
Rodrigo Siqueira
https://siqueira.tech

--pxemaohwdouwlak3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDBE1cACgkQWJzP/com
vP+kLQ/9GYlRPNUBTHqFfqzDKF3GZ6kWA5t1KLmIlKwfqGYgHCsBcDLw8KYjGz4j
Ms6ZtQHU35SXwM2Pl38r+hIDdwbWYTp8Zj1NuxwAHYb0+bH+eODmes3ODLHv9GNI
Qp1E1jHJAYsYCmdPlq5mSdLEMvfOt76M+zTGEpxXJ48GAVqGUkO+tZS/cpZzYGiv
kgMNtVtb5tkGyQRF9qG4n9iNlcDM0P1TmohJZG88DL8o657jlqbZuZfxTe43iBoh
N7X3EHHIFN/T/SszqOOA3oEK2ZoMSWb+CMfd/VFBINYbYXiYpgB8NjAbyTxDwzf+
XMqepG53QFDzHnDq68fIV5uRH1hzS1wvVWGb+bbqMrXO+1Qsv07CAVpj0144vZXU
AraPqp31TrHjMeVd2eACVd1oVAd9Mn7R8/RG2EyHHfqgibueLWf5nGcjk/0SWtUJ
M6vqG4EUw0CtOPMxqoXjQMBYAXstvduZWtTmhOZ+OyI7RLBotOxHcKhep3MbsUKd
vSwCkmNaRPvUtQK9i/d+ImSWolUY99hVKl1o8lwjH3aYLxBMtRWsnFcodJuO8Sns
cvW7/5JZoOl7LlKw/a5CqYx5ov67B5wR8kmd/vVIffSaJKkxEzcGcaYo+XOol/Af
jb6cQh+0R+65JHFK1KAW6C8Ff576ZhKNLlCE6f4ohtTKJdTJwcY=
=Okwl
-----END PGP SIGNATURE-----

--pxemaohwdouwlak3--

--===============0716740560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0716740560==--
