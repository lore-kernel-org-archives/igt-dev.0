Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282466E139
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2020 16:30:29 +0000 (UTC)
Date: Wed, 1 Jul 2020 12:30:17 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20200701163017.abrrtiorksox2oi3@outlook.office365.com>
References: <cover.1592991729.git.melissa.srw@gmail.com>
In-Reply-To: <cover.1592991729.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] minor improvements to the
 kms_cursor_crc doc and some comments cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0278776097=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Melissa Wen <melissa.srw@gmail.com>
Cc: kernel-usp@googlegroups.com, igt-dev@lists.freedesktop.org, aurabindo.pillai@amd.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

--===============0278776097==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cxl2m4isisfwqbx"
Content-Disposition: inline

--2cxl2m4isisfwqbx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Melissa,

First of all, thanks a lot for your effort to improve the documentation.

I noticed that for some weird reason the CI pointed out a failure in
this series. I looked at it, and I believe this is a false positive.

Hiler, Petri
Do you know if this failure is a false positive? Can I go ahead and
apply this change?

Thanks
Rodrigo Siqueira

On 06/25, Melissa Wen wrote:
> Hi,
>=20
> (I had sent this to the wrong list before)
>=20
> I was studying the code of kms_cursor_crc test, and I just adjusted some =
comments
> and added descriptions for subtests.
>=20
> Melissa Wen (2):
>   lib/igt_fb: change comments with fd description
>   test/kms_cursor_crc: update subtests descriptions and some comments
>=20
>  lib/igt_fb.c           |  6 +++---
>  tests/kms_cursor_crc.c | 38 ++++++++++++++++++++++++++++----------
>  2 files changed, 31 insertions(+), 13 deletions(-)
>=20
> --=20
> 2.27.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--2cxl2m4isisfwqbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl78uhgACgkQWJzP/com
vP+PNA//YYbWayB/Vrw0Z8CsEKRcxuxczWto2AMzMX86beURNmHJx3ZSA9Fc0KaJ
yMduK/FbJwHPb2nH0umZd8GjdpOuFja634JFcZMSKWeIV5z5+C6HNsheTgNMn+q2
qAKSeDWd/sXjUPGzuDAkXDe7mGeVFxFo0t216TQ0f8z3GwkWos5VwYe1t8lctfEe
lh7Yu8wCm3g0Q5dZr7OxRr15nrKbZf+WlxlbUGaPjWXWtGh/fFtEismgUmXqcFtI
321StnP+uD3hhE7mDRyPH6SzhpqWsN8mWfUT2eU1r/Q1PIBYfSFM6BsllkM8THXg
ilmIcNd1gC7dTHmVuGLyqRmosj/iZ0D4wKoCDN/HYLyH3ehm29gClgxa64r762NC
LpGKXxOQRJ7mg7fMFekIhQvaIB5WTSPhHvATSQA7rieMurdcr5+gzSG/o2a15rBD
ZAiF8NYwvPEJ7lxjHMMpZs4sE8w/HkelbWZ+DaeB+761x1Se1wDUgowcqowf0QcQ
wcbsQD0n2ztAll/55iWFHXRHYc28V98mcM71tNbntLXRD9QHOf63xJKNyjW18Zw/
899CAwfK6SiqSN8DVwxIJg4gB+FBMVuHhzcVyON1/g8H33claquFMtlye1AlVYWJ
kNAX0vr45XLlhNZ75Xea2Zqu/cCX/E9b42KK+/EFMgTnkWyWTBA=
=Fleu
-----END PGP SIGNATURE-----

--2cxl2m4isisfwqbx--

--===============0278776097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0278776097==--
