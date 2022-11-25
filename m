Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AD110E7C2
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 14:05:09 +0000 (UTC)
Date: Fri, 25 Nov 2022 13:05:03 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20221125140446.ngr64ruqiphsqdj6@mail.igalia.com>
References: <20221111195813.277822-1-mcanal@igalia.com>
 <20221111195813.277822-7-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="byl3knflpul5ozdb"
Content-Disposition: inline
In-Reply-To: <20221111195813.277822-7-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 6/7] tests/v3d_create_bo: Create test
 for V3D's Create BO IOCTL
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


--byl3knflpul5ozdb
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2uuagygcululn7gk"
Content-Disposition: inline


--2uuagygcululn7gk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/11, Ma=EDra Canal wrote:
> Add three igt_subtests for the DRM_IOCTL_V3D_CREATE_BO, which tests the
> creation of a zeroed BO and a 4096 bytes BO, and tests if the BO is
> properly cleaned.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  tests/meson.build         |  1 +
>  tests/v3d/v3d_create_bo.c | 63 +++++++++++++++++++++++++++++++++++++++
>  tests/v3d_ci/v3d.testlist |  3 ++
>  3 files changed, 67 insertions(+)
>  create mode 100644 tests/v3d/v3d_create_bo.c
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c9b1829..f1a6a9dd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -256,6 +256,7 @@ msm_progs =3D [
>  ]
> =20
>  v3d_progs =3D [
> +	'v3d_create_bo',
>  	'v3d_get_bo_offset',
>  	'v3d_get_param',
>  	'v3d_mmap',
> diff --git a/tests/v3d/v3d_create_bo.c b/tests/v3d/v3d_create_bo.c
> new file mode 100644
> index 00000000..efdb218e
> --- /dev/null
> +++ b/tests/v3d/v3d_create_bo.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2022 Igalia S.L.
> + */
> +
> +#include "igt.h"
> +#include "igt_v3d.h"
> +
> +IGT_TEST_DESCRIPTION("Tests for the V3D's Create BO IOCTL");
> +
> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture
> +		fd =3D drm_open_driver(DRIVER_V3D);
> +
> +	igt_describe("Make sure a BO cannot be created with size zero.");
> +	igt_subtest("create-bo-0") {
> +		struct drm_v3d_create_bo create =3D {
> +			.size =3D 0,
> +		};
> +		do_ioctl_err(fd, DRM_IOCTL_V3D_CREATE_BO, &create, EINVAL);
> +	}

How about including a subtest for no-flags validation?

> +
> +	igt_describe("Sanity check for creating a BO with size 4096.");
> +	igt_subtest("create-bo-4096") {
> +		struct v3d_bo *bo =3D igt_v3d_create_bo(fd, PAGE_SIZE);
> +		igt_v3d_free_bo(fd, bo);
> +	}
> +
> +	igt_describe("Make sure that BOs can be allocated in different fd witho=
ut "
> +		     "carrying old contents from one another.");
> +	igt_subtest("create-bo-zeroed") {
> +		int fd2 =3D drm_open_driver(DRIVER_V3D);
> +		struct v3d_bo *bo;
> +		/* A size different from any used in our other tests, to try
> +		 * to convince it to land as the only one of its size in the
> +		 * kernel BO cache
> +		 */
> +		size_t size =3D 3 * PAGE_SIZE, i;
> +
> +		/* Make a BO and free it on our main fd. */
> +		bo =3D igt_v3d_create_bo(fd, size);
> +		bo->map =3D igt_v3d_mmap_bo(fd, bo->handle, size, PROT_READ | PROT_WRI=
TE);
> +		memset(bo->map, 0xd0, size);
> +		igt_v3d_free_bo(fd, bo);
> +
> +		/* Now, allocate a BO on the other fd and make sure it doesn't
> +		 * have the old contents.
> +		 */
> +		bo =3D igt_v3d_create_bo(fd2, size);
> +		bo->map =3D igt_v3d_mmap_bo(fd2, bo->handle, size, PROT_READ | PROT_WR=
ITE);
> +		for (i =3D 0; i < size / 4; i++)
> +			igt_assert_eq_u32(((uint32_t *)bo->map)[i], 0x0);
> +		igt_v3d_free_bo(fd2, bo);
> +
> +		close(fd2);
> +	}
> +
> +	igt_fixture
> +		close(fd);
> +}
> diff --git a/tests/v3d_ci/v3d.testlist b/tests/v3d_ci/v3d.testlist
> index b55e8e57..f4355285 100644
> --- a/tests/v3d_ci/v3d.testlist
> +++ b/tests/v3d_ci/v3d.testlist
> @@ -1,3 +1,6 @@
> +igt@v3d_create_bo@create-bo-0
> +igt@v3d_create_bo@create-bo-4096
> +igt@v3d_create_bo@create-bo-zeroed
>  igt@v3d_get_bo_offset@create-get-offsets
>  igt@v3d_get_bo_offset@get-bad-handle
>  igt@v3d_get_param@base-params
> --=20
> 2.38.1
>=20

--2uuagygcululn7gk--

--byl3knflpul5ozdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOAy48ACgkQwqF3j0dL
ehzn/A/+NoHo9UEMA2LaA1gL4uzU90hBX09/XENUCB8EMUl4OfIvZEUGE3DWu+X1
aThVjbGG83sHtHikUEY5ZfGKJji9RPPemSFBw/gpU0dobR/0WycL9V35liWGr2db
Qmq8UvMsn9CJcCMzC5G+nft80HT29Dp3YfeyoUQ3OE7uAlE3ACT+hEjllHtzQjd/
XD8zMBmEGzPEJhsXnOc9PZP/X2cgb1wR4V4u231I0kX0Hu2m2+YOUTBB68nyhKWf
8KD4wMb8GhKv2PjjaAOrhJs9Mf+YcIb5nCRYEV4y/YuLbPrLAbbguwvg620HvbMe
DxK39VcJ5mKywiuDFfbjjtbXaNoeizMDzVr3/t0WLFneybE50LVMmNh9MjCq4csJ
67BYHk1CI9R/Niwe1M2pKkPDHwYBPHCe2QQHdOX8P3HYbvFaY5DBQO22a5RKjT7M
QUxxjU7Z+FWMy/wZttthwveWly4qSDVIZAS1Ll8E3iIT6+MHQa5O0I/k0wDysI2/
GONFT0iQHak6BbH6V2C9O1bDXx7n1hFPE1cVjJ4tr+oqS0KYyfJYh5C7/A731JZ7
sBTc50D20sVgfSRfj8k4kTb0kIgwKnujr0j6CbuSFFN5Fy7xe90pk05o+WleRh2z
o9X+1dC/iBw/8yzN8VUMU4sehiNO4TasPlj4TsgQN0odmsdjbTA=
=HPSN
-----END PGP SIGNATURE-----

--byl3knflpul5ozdb--
