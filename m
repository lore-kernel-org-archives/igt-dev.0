Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B1110E34E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 21:50:28 +0000 (UTC)
Date: Thu, 19 May 2022 20:50:11 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Message-ID: <20220519215011.z2jdx5oo4zw67lxv@mail.igalia.com>
References: <20220516175927.27616-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3dcjtthuhalnjxr4"
Content-Disposition: inline
In-Reply-To: <20220516175927.27616-1-andrealmeid@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] tests/kms_async_flips: Expand test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--3dcjtthuhalnjxr4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/16, Andr=E9 Almeida wrote:
> Hi,
>=20
> This patchset enables kms_async_flips to run in more vendors. It was
> tested at i915, amdgpu and vc4.
>=20
> The first patch adds a helper to keep the same behavior of the test
> while keeping things simple, and the second patch make the test work on
> more platforms.
Hi,

LGTM. Furthermore, it is an excellent contribution towards the
generalization of kms tests.

The series is:

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks

>=20
> Andr=E9 Almeida (2):
>   lib/igt_fb: Add support for drawing rectangles with random colors
>   tests/kms_async_flips: Support more vendors
>=20
>  lib/igt_fb.c            | 20 ++++++++++++++++++
>  lib/igt_fb.h            |  1 +
>  tests/kms_async_flips.c | 47 ++++++++++++++++++++++++-----------------
>  3 files changed, 49 insertions(+), 19 deletions(-)
>=20
> --=20
> 2.36.0
>=20

--3dcjtthuhalnjxr4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmKGu4kACgkQwqF3j0dL
ehzLdg//T0Si9PmaCoWmDQcN9hp14LI7XclN7T89dV03YdofVosrd6lFv1e3IxxR
AneRFcnKrqTfG46clkGyoHih1KiTXFzxOb5K9wSVP22jY1iRJOfnysfQUjA89i9r
4EC+P8G5B11fInnL3+P/g8NR7+jHUcYOU462dl7zZXRb/4P4E9GJdRaRRrC+TTyt
9kS/KgF7J6uJapciAAbodHE1cNEA1cuugPq+AP5PuaB7X9Vv0BZzalcf+TzLSjdb
XNmMyt0vJMWOvyaRHfVPtCgSoPDkCP7gAzPB40vBt3ReR0dgRrbNQIE6HU77V+Iv
B1CI1/js66ajYkHxpddj92Axo7CSL9j2FLSX8IttmQKaZJshwm+6Zn1eyJ7UXTGY
k7AxEA3JaFhMyxVjCUi3zyR7OYpFeLCxB5Zewsoy/JJNUBV8GYuDvAPKmrjSIttq
/VvfISMGOfgvWqjKLW6U361PLjoieSB/50IhB4JUXr/k7yQ4TZ/JvW1fkjoG/joO
PVxeeN9XsSeC46KOCvZ8cmTFOrFNN5CCZt3WHEPpPlr1o6kEJDlXKi+W2ohcQ7zV
F1cNDrpjs6sP2Px+JX/SC/X0KoaX5M++x0D1myKwSRI0jamGG3ZLLJPqYDQQll4q
6w8fcwfJ6K+lqIvMkF6tthoS+5DrT4iA0ypHNi0jGfG4w8Y0JZY=
=DIsf
-----END PGP SIGNATURE-----

--3dcjtthuhalnjxr4--
