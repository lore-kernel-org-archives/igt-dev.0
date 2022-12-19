Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5311610E15B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 09:30:43 +0000 (UTC)
Date: Mon, 19 Dec 2022 08:30:31 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20221219093031.rpay5zyia4vyezc7@mail.igalia.com>
References: <20221216162854.294042-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jthchuipwx7o55ws"
Content-Disposition: inline
In-Reply-To: <20221216162854.294042-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 0/5] VC4 IGT Tests Updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>,
 igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--jthchuipwx7o55ws
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/16, Ma=EDra Canal wrote:
> This series aims to update the VC4 IGT tests. The first three patches con=
tain
> some janitorial duties related to the existing tests: creating a folder f=
or the
> VC4 tests, removing some unused includes, and adding a macro with the def=
ault
> PAGE_SIZE. The fourth patch adds an igt_require to all the VC4 tests to
> check that the tests are not running on BCM2711. The final patch includes
> new tests for the VC4's performance monitors.
>=20
> This series was tested on the Raspberry Pi 3 Model B and Raspberry Pi 4 M=
odel B,
> and the HTML outputs of the VC4 tests are available on:
>=20
> - Raspberry Pi 4: https://mairacanal.fedorapeople.org/igt-results/rpi4-v2=
/html/
> - Raspberry Pi 3: https://mairacanal.fedorapeople.org/igt-results/rpi3-v2=
/html/
>=20

You already have the a-b from Petri.

And the series LGTM too:

Reviewed-by: Melissa Wen <mwen@igalia.com>

> Best Regards,
> - Ma=EDra Canal
>=20
> v1 -> v2:
> - Install VC4 tests on build/tests/vc4/ instead of build/tests/ (Melissa =
Wen).
> - Use the syncobj capability to identify vc4 and vc5 (Melissa Wen).
> - Change the order of the commits (Melissa Wen).
> - Add Petri Latvala tags.
>=20
> v2 -> v3:
> - Remove ternary conditional operator from return (Petri Latvala).
> - Add Petri Latvala tag.
>=20
> Ma=EDra Canal (5):
>   tests/vc4: Move VC4 tests to their own folder
>   tests/vc4: Remove unused or redundant includes
>   lib/igt_vc4: Add PAGE_SIZE macro to VC4
>   tests/vc4: Skip VC4 tests if they are running on BCM2711/RaspberryPi4
>   tests/vc4_perfmon: Create test for VC4's Perfmon IOCTLs
>=20
>  lib/igt_vc4.c                      |  60 ++++++++++---
>  lib/igt_vc4.h                      |   9 ++
>  meson.build                        |   8 ++
>  tests/meson.build                  |  10 +--
>  tests/vc4/meson.build              |  20 +++++
>  tests/{ =3D> vc4}/vc4_create_bo.c    |  15 +---
>  tests/{ =3D> vc4}/vc4_dmabuf_poll.c  |  14 +--
>  tests/{ =3D> vc4}/vc4_label_bo.c     |  21 ++---
>  tests/{ =3D> vc4}/vc4_lookup_fail.c  |  14 +--
>  tests/vc4/vc4_perfmon.c            | 138 +++++++++++++++++++++++++++++
>  tests/{ =3D> vc4}/vc4_purgeable_bo.c |  10 ---
>  tests/{ =3D> vc4}/vc4_tiling.c       |  27 ++----
>  tests/{ =3D> vc4}/vc4_wait_bo.c      |  14 +--
>  tests/{ =3D> vc4}/vc4_wait_seqno.c   |  15 +---
>  tests/vc4_ci/vc4.testlist          |  80 +++++++++--------
>  15 files changed, 298 insertions(+), 157 deletions(-)
>  create mode 100644 tests/vc4/meson.build
>  rename tests/{ =3D> vc4}/vc4_create_bo.c (89%)
>  rename tests/{ =3D> vc4}/vc4_dmabuf_poll.c (91%)
>  rename tests/{ =3D> vc4}/vc4_label_bo.c (85%)
>  rename tests/{ =3D> vc4}/vc4_lookup_fail.c (90%)
>  create mode 100644 tests/vc4/vc4_perfmon.c
>  rename tests/{ =3D> vc4}/vc4_purgeable_bo.c (97%)
>  rename tests/{ =3D> vc4}/vc4_tiling.c (88%)
>  rename tests/{ =3D> vc4}/vc4_wait_bo.c (92%)
>  rename tests/{ =3D> vc4}/vc4_wait_seqno.c (89%)
>=20
> --=20
> 2.38.1
>=20

--jthchuipwx7o55ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOgLyQACgkQwqF3j0dL
ehy1HQ/+IpXXh1TXt817jHV+3aa+biwyg0IRJ1FlffsMHaMEBc3PL1XCmmpof2F7
EyaJ5tEuwwYjdMQTiugou5D7fr9Fmnb7ha1N+0PDeNzIQTpGg4ERw1kKvMOqnr8F
0Ww00l3mCaqS1aA9qKquOYS1A3dEa8mD8MtbKtSPowRqJS/IrL46VI/c9UW90dWF
n5I99GvwMADNLMHmQ64ZKFb+X9FnCVeWe6LHl0/ASlMxBQRGYoPSueGHst3H1mZa
RBHL/ACoPuHRDX3FAN7EcfJzgcYJO+/XyUQhKo8i4YsuRwzkAHEM4YZrY3HQZMkq
UmPUtGR1WfJmnX8lXtsJthAyeQ5IKOg3vlgMtbDwA9jSDPNKiiKnPOljOmjIrwyq
gDaU3GJR5kuNqfuM0ed2xQlXVhKj5a5UE/VGkznLV4f3VVBN40+FSQ1z1e+idCDI
js96bX/cSujXd7NdHHyIJjjQMir2ogmX//PuXRg9oRu3XaCb+U9WJlr7dytQrdyN
Uj3I4ywEk1odBEwN5+YEe8scwUESc+YLbTOdlHr72WvTTGu6dB2zOgt+QavJJRvA
ge53P0UBqq+n4ngqAm2s+QBdqIrwRk8kUFduJYjlayXhyVF3uSpwLC9FgVTbZ18P
D3gKzm9/DyAxXtAkvo4FZc4O3wDYZvTNTFW7OW7MG5fai8Ir5n8=
=lono
-----END PGP SIGNATURE-----

--jthchuipwx7o55ws--
