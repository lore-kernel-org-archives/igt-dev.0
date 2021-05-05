Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE266EB46
 for <igt-dev@lists.freedesktop.org>; Wed,  5 May 2021 00:23:09 +0000 (UTC)
Date: Tue, 4 May 2021 20:23:05 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210505002305.7bagmdtisnu6hsiw@outlook.office365.com>
References: <20210429192628.4056795-1-imre.deak@intel.com>
 <20210429192628.4056795-2-imre.deak@intel.com>
In-Reply-To: <20210429192628.4056795-2-imre.deak@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_ccs: Skip CCS color clear
 value check for randomizing subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0223197098=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0223197098==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="flqfuwljhcvmkgyp"
Content-Disposition: inline

--flqfuwljhcvmkgyp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I looked at kms_ccs and tried to find a reference for "color control
surfaces" in DRM, and I found multiple references for this format in
i915. Is it an Intel-specific format? Is kms_ccs a test that can be
executed in different ASICs?

Thanks
Siqueira

On 04/29, Imre Deak wrote:
> When filling the color planes with randomized content, the color clear
> values won't match what the HW actually wrote there, so skip the clear
> value check in this case.
>=20
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  tests/kms_ccs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index 30e0fdb54..61c9b2277 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -195,7 +195,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *=
fb, int plane, const float
>  	munmap(map, fb->size);
>  };
> =20
> -static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *=
cc_color)
> +static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *=
cc_color, bool check_cc_plane)
>  {
>  	int i;
> =20
> @@ -203,7 +203,7 @@ static void check_all_ccs_planes(int drm_fd, igt_fb_t=
 *fb, const float *cc_color
>  		if (igt_fb_is_ccs_plane(fb, i) &&
>  		    !igt_fb_is_gen12_ccs_cc_plane(fb, i))
>  			check_ccs_plane(drm_fd, fb, i);
> -		else if (igt_fb_is_gen12_ccs_cc_plane(fb, i))
> +		else if (igt_fb_is_gen12_ccs_cc_plane(fb, i) && check_cc_plane)
>  			check_ccs_cc_plane(drm_fd, fb, i, cc_color);
>  	}
>  }
> @@ -348,7 +348,7 @@ static void generate_fb(data_t *data, struct igt_fb *=
fb,
>  		igt_assert_eq(ret, 0);
> =20
>  	if (check_ccs_planes)
> -		check_all_ccs_planes(data->drm_fd, fb, cc_color);
> +		check_all_ccs_planes(data->drm_fd, fb, cc_color, !(data->flags & TEST_=
RANDOM));
> =20
>  	fb->fb_id =3D f.fb_id;
>  }
> --=20
> 2.27.0
>=20
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=3D04%7C01%7CRodr=
igo.Siqueira%40amd.com%7C015d075eda3348bce83208d90b44b52e%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637553211995281967%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DIqMSw%2BtvmobHEOTGjdcrUL%2BE3gW6QlRfavthnqM1%2FVc%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--flqfuwljhcvmkgyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCR5WkACgkQWJzP/com
vP/O+xAAsX2bzBTHMj4Akx0AYfWYnvLS0LDmO8sM7XkuOTae6OY2MzWOZ19xM60H
qNO6j2c5/oNXT7GoJ5wG79bFNknJ70VOVwL75J4OqMzWF5/ubzwxFs/9C3zkALZZ
6ozNT8kKKpkH3dMPIIXv88cq6xg65TNDLfNajWOGz9KoZ5fU+ZSG6f1AP+DIgdAS
MrOSLftV5s/gjhnbULTm2mw0ziaiN3+Y87oZxHJPbK/j53+DH8q1tJO+QC9gyUzW
lPYnbu4tUtJ+j3k8KWKfQufvBlQg8DbRf09bZ+/zU37LJlOl7Q9RBrAJJXeKv1tg
R5HFb7ebk9x+mKWL56FylXFy+qCo1MHLlo/hyeShxJ20/qqCsuZLSZeiaO9bKCJq
oVOw+4jwpoa7rqbF+Umm/vOEd7tI9Em0DsPr2IsAkXc3ZN8GSvvnaaWu3hqCqjPV
QDQyHMUBQYwUeijBU729uCDMxrLYlea5cQWaKc1Zg8XKavdFaMDQ0k7TArECatKc
62e5E/AYMzUcVgjgCMIsCaP9Vje6iXkR5tjZ067oNx1lyqP6sAOqmE+8sbM1GTSW
rkUq0Q3WC/ySSHyTX8x6/qUqGBXFuo770wR9TFmgkg79nVLD758cEmsqR9sU+c18
Ul31QNnpg+OesTSm94J1A92MXQRL5p+CwwO/4yWAOf27GZpKNEo=
=M6sO
-----END PGP SIGNATURE-----

--flqfuwljhcvmkgyp--

--===============0223197098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0223197098==--
