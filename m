Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B07489E47
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Dec 2022 22:02:13 +0000 (UTC)
Date: Wed, 28 Dec 2022 21:01:49 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20221228220149.ypin6twisdy6sbvp@mail.igalia.com>
References: <20221223214433.31547-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bmumtmohlvtoznah"
Content-Disposition: inline
In-Reply-To: <20221223214433.31547-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Tests for V3D/VC4 Mmap BO IOCTLs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--bmumtmohlvtoznah
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/23, Ma=EDra Canal wrote:
> Currently, the Mmap BO IOCTL is not completely covered by the existing te=
sts:
> V3D only tests invalid BO handlers and VC4 doesn't have tests for this IO=
CTL.
> Therefore, create tests for the Mmap BO IOCTL for the V3D and VC4. For bo=
th
> drivers, the sub-tests will test invalid parameters and also the consiste=
ncy
> of newly mapped BOs.
>=20
> Best Regards,
> - Ma=EDra Canal
>=20
> Ma=EDra Canal (2):
>   tests/v3d_mmap: Improve tests from V3D's Mmap BO IOCTL
>   tests/vc4_mmap: Create test for VC4's Mmap BO IOCTL
Hi Ma=EDra,

Just that comment about coherency that doesn't fit well in these tests.
Otherwise, this series LGTM.

Reviewed-by: Melissa Wen <mwen@igalia.com>
>=20
>  lib/igt_v3d.c             |  2 ++
>  lib/igt_vc4.c             |  2 ++
>  tests/v3d/v3d_mmap.c      | 34 ++++++++++++++++++++++++
>  tests/v3d_ci/v3d.testlist |  2 ++
>  tests/vc4/meson.build     |  1 +
>  tests/vc4/vc4_mmap.c      | 55 +++++++++++++++++++++++++++++++++++++++
>  tests/vc4_ci/vc4.testlist |  2 ++
>  7 files changed, 98 insertions(+)
>  create mode 100644 tests/vc4/vc4_mmap.c
>=20
> --=20
> 2.38.1
>=20

--bmumtmohlvtoznah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOsvMcACgkQwqF3j0dL
ehzE6xAAmdhlnlapPKqrmTD9lqapvQhj253gb/6jsvFcjVU9QKufgv8i4w67k/oN
rVpxBnrSAWIhM8bGf+QPYOsRAzmEH0IbDuND/qduZdkYcbNJ0wYuCOrFRzI55qW3
KSlpMKvRV8z9GUomGt3kUQPRszhXz+ebgNyTmj4StVvkwiBwyx7vCCoyNo3AwIkX
TOjPr5wfY+fWLK3kiYtyhP7EO/zGW78ZLcvLR6Ys8OrO6GnWoCPPBTZJApW0WAG7
8hSi3fp2RsuSmh9XZqsTWxqtpb/Zv+ZI+x4laY7x7GdWJmD5DZ9TrVwMn5GNAsvs
VN9mb4AB0zNsC78GH3d6jqpVVOOkIIwmCiyq+c5yYjaH2ihkB77o86fqQHgdxC+F
eo+0ToRjEl9XAbA+u/VB2GIbkQk91YTzPQL2Yci+70zJW4JKtAHDF6iCIz+BSIhb
oW2q3QvRyv26ZmbPit3kSZ1kyskKZL7R2iccvqjBNKCbG4lw3fcVxj2L9G2NPYRa
p6C/yqHnH6tfXgjypflBdsl84/GDDci7EoOvHeoQ22noTdfmgi1EOL9bAE8PLEAJ
KMCjjstU5oKTrmOtvAgTvq9yO/R5YuookW5whfKw0s33E/m45zX4x16yIKJ41i6J
VAed11B3kvr8ZI/qI0jrxdRvct9FeUPmSU37bNgkeGOBUViFIro=
=7xlG
-----END PGP SIGNATURE-----

--bmumtmohlvtoznah--
