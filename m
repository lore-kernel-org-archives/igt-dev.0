Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D54F10E7C3
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 14:08:28 +0000 (UTC)
Date: Fri, 25 Nov 2022 13:08:22 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20221125140804.nr5x44d22s3apdfq@mail.igalia.com>
References: <20221111195813.277822-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dstcj2n3f2dsj2dv"
Content-Disposition: inline
In-Reply-To: <20221111195813.277822-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/7] V3D IGT Tests Updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--dstcj2n3f2dsj2dv
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ram4ekgsqat2h7ca"
Content-Disposition: inline


--ram4ekgsqat2h7ca
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O 11/11, Ma=EDra Canal wrote:
> This series aims to update the V3D IGT tests. The first five patches cont=
ain
> some janitorial duties related to the existing tests: updating the uAPI h=
eader,
> creating a folder for the V3D tests, removing some unused includes, addin=
g=20
> descriptions to the existing tests and adding a macro with the default PA=
GE_SIZE.
> The last two patches include new tests for the V3D driver.
>=20
> Best Regards,
> - Ma=EDra Canal

Hi Maira,

Thanks for this work.

Overall LGTM. I asked two improvements, and with that you can include my
r-b tag in the next version.

Reviewed-by: Melissa Wen <mwen@igalia.com>

>=20
> v1 -> v2: https://patchwork.freedesktop.org/series/110681/
> - Use SPDX licence (Kamil Konieczny).
> - Add descriptions to each new added test with igt_describe (Kamil Koniec=
zny).
> - Add descriptions to existing V3D tests.
>=20
> Ma=EDra Canal (7):
>   include/drm-uapi: Update to the latest v3d_drm.h
>   tests/v3d: Move V3D tests to their own folder
>   tests/v3d: Remove unused or redundant includes
>   tests/v3d: Add igt_describe() to all V3D subtests
>   lib/igt_v3d: Add PAGE_SIZE macro to V3D
>   tests/v3d_create_bo: Create test for V3D's Create BO IOCTL
>   tests/v3d_perfmon: Create test for V3D's Perfmon IOCTLs
>=20
>  include/drm-uapi/v3d_drm.h          |  78 +++++++++++++++
>  lib/igt_v3d.c                       |  39 +++++++-
>  lib/igt_v3d.h                       |   6 ++
>  tests/meson.build                   |  20 +++-
>  tests/v3d/v3d_create_bo.c           |  63 ++++++++++++
>  tests/{ =3D> v3d}/v3d_get_bo_offset.c |  21 ++--
>  tests/{ =3D> v3d}/v3d_get_param.c     |  17 +---
>  tests/{ =3D> v3d}/v3d_mmap.c          |  15 +--
>  tests/v3d/v3d_perfmon.c             | 144 ++++++++++++++++++++++++++++
>  tests/v3d_ci/v3d.testlist           |  14 +++
>  10 files changed, 373 insertions(+), 44 deletions(-)
>  create mode 100644 tests/v3d/v3d_create_bo.c
>  rename tests/{ =3D> v3d}/v3d_get_bo_offset.c (85%)
>  rename tests/{ =3D> v3d}/v3d_get_param.c (88%)
>  rename tests/{ =3D> v3d}/v3d_mmap.c (85%)
>  create mode 100644 tests/v3d/v3d_perfmon.c
>=20
> --=20
> 2.38.1
>=20

--ram4ekgsqat2h7ca--

--dstcj2n3f2dsj2dv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOAzFYACgkQwqF3j0dL
ehxIkg/+Px03MPGybmyP0alFEqIYhWAmxb+FULEFVXXYgQcgeIKC8vOxoYY/s3hr
wiN0nEgYoFNDFJvCrVT5M6MN3+X2R2UYh+qFmJAqNfMXL46RQ0LLeOEOTicd7Upj
wscMiCPZI7bdu9+ZmK3vqRCfjujkGz7WO+s33nJ41Gz+9QHHJ/cyCiAI9jJerfHr
1YcXYGGflsShDLlfL2ewsGJMOQIpLB9tPe/7gIG+3wdS5MfHR+ZVZMwxg/Xx4YXm
FBOZmcLlwuO/VrmFoEKbmgFmJweIsw3k/Ex8ctIX/K3LFloOQVHxxuOBsmZiUhVN
1LAhOyU3y1XNrxoIe0dd1FsYBZvUThKiaBunETiW4h69O3Mv+wZMCUTUArEivPdO
sZShYR/OSmZ3ehXSCdDYIIQIDe6rMPqkSG+tKDbDFiqQCE+ciW53zNS70rIJRbwE
T3oaFVUiv85MJeDTguh3YsKIcuEJ17r+7toFU32o+IkKGNNLfjwx6Rb5PsyeBrKj
yfS7XFOXJE4af5AgLg5WPVn+HBoxOOby2VKvaH40Nf1V1JyZMc6LKejgDz+ElW4Y
6cxON4jqFo0Q4lPpQTZJ3oWjd6gdc9kGDPjVohVjFM8XNwgce305SZzpU+6Egl5+
h0JcSooyjZ2hmbYWxJbFQdCONxFFcPMfnWdIIxWtx9StjK9OhlI=
=NOiP
-----END PGP SIGNATURE-----

--dstcj2n3f2dsj2dv--
