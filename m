Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3EA10E79C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 14:51:10 +0000 (UTC)
Date: Fri, 25 Nov 2022 13:50:55 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20221125145055.5dlcarmgogoixc7f@mail.igalia.com>
References: <20221115202101.278995-1-mcanal@igalia.com>
 <20221115202101.278995-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zjxqjndiqsdpiwv2"
Content-Disposition: inline
In-Reply-To: <20221115202101.278995-2-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] tests/vc4: Move VC4 tests to their
 own folder
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


--zjxqjndiqsdpiwv2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/15, Ma=EDra Canal wrote:
> VC4 contains a substantial number of tests. In order to avoid polluting
> the main tests folder, move the VC4 tests to a separate folder.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  tests/meson.build                  | 28 ++++++++++++++++++++--------
>  tests/{ =3D> vc4}/vc4_create_bo.c    |  0
>  tests/{ =3D> vc4}/vc4_dmabuf_poll.c  |  0
>  tests/{ =3D> vc4}/vc4_label_bo.c     |  0
>  tests/{ =3D> vc4}/vc4_lookup_fail.c  |  0
>  tests/{ =3D> vc4}/vc4_purgeable_bo.c |  0
>  tests/{ =3D> vc4}/vc4_tiling.c       |  0
>  tests/{ =3D> vc4}/vc4_wait_bo.c      |  0
>  tests/{ =3D> vc4}/vc4_wait_seqno.c   |  0
>  9 files changed, 20 insertions(+), 8 deletions(-)
>  rename tests/{ =3D> vc4}/vc4_create_bo.c (100%)
>  rename tests/{ =3D> vc4}/vc4_dmabuf_poll.c (100%)
>  rename tests/{ =3D> vc4}/vc4_label_bo.c (100%)
>  rename tests/{ =3D> vc4}/vc4_lookup_fail.c (100%)
>  rename tests/{ =3D> vc4}/vc4_purgeable_bo.c (100%)
>  rename tests/{ =3D> vc4}/vc4_tiling.c (100%)
>  rename tests/{ =3D> vc4}/vc4_wait_bo.c (100%)
>  rename tests/{ =3D> vc4}/vc4_wait_seqno.c (100%)
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index 12e53e0b..c42efdef 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -83,14 +83,6 @@ test_progs =3D [
>  	'v3d_get_bo_offset',
>  	'v3d_get_param',
>  	'v3d_mmap',
> -	'vc4_create_bo',
> -	'vc4_dmabuf_poll',
> -	'vc4_label_bo',
> -	'vc4_lookup_fail',
> -	'vc4_purgeable_bo',
> -	'vc4_tiling',
> -	'vc4_wait_bo',
> -	'vc4_wait_seqno',
>  	'vgem_basic',
>  	'vgem_slow',
>  ]
> @@ -258,6 +250,17 @@ msm_progs =3D [
>  	'msm_submit'
>  ]
> =20
> +vc4_progs =3D [
> +	'vc4_create_bo',
> +	'vc4_dmabuf_poll',
> +	'vc4_label_bo',
> +	'vc4_lookup_fail',
> +	'vc4_purgeable_bo',
> +	'vc4_tiling',
> +	'vc4_wait_bo',
> +	'vc4_wait_seqno',
> +]
> +
As I commented for v3d tests, it would be clearer to me ig the test go
to a subdir /build/tests/vc4/ as I see for amdgpu tests.

>  chamelium_progs =3D [
>  	'kms_chamelium',
>  ]
> @@ -305,6 +308,15 @@ foreach prog : msm_progs
>  	test_list +=3D prog
>  endforeach
> =20
> +foreach prog : vc4_progs
> +	test_executables +=3D executable(prog, join_paths('vc4', prog + '.c'),
> +				       dependencies : test_deps,
> +				       install_dir : libexecdir,
> +				       install_rpath : libexecdir_rpathdir,
> +				       install : true)
> +	test_list +=3D prog
> +endforeach
> +
>  if chamelium.found()
>  	foreach prog : chamelium_progs
>  		test_executables +=3D executable(prog,
> diff --git a/tests/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
> similarity index 100%
> rename from tests/vc4_create_bo.c
> rename to tests/vc4/vc4_create_bo.c
> diff --git a/tests/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
> similarity index 100%
> rename from tests/vc4_dmabuf_poll.c
> rename to tests/vc4/vc4_dmabuf_poll.c
> diff --git a/tests/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
> similarity index 100%
> rename from tests/vc4_label_bo.c
> rename to tests/vc4/vc4_label_bo.c
> diff --git a/tests/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
> similarity index 100%
> rename from tests/vc4_lookup_fail.c
> rename to tests/vc4/vc4_lookup_fail.c
> diff --git a/tests/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
> similarity index 100%
> rename from tests/vc4_purgeable_bo.c
> rename to tests/vc4/vc4_purgeable_bo.c
> diff --git a/tests/vc4_tiling.c b/tests/vc4/vc4_tiling.c
> similarity index 100%
> rename from tests/vc4_tiling.c
> rename to tests/vc4/vc4_tiling.c
> diff --git a/tests/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
> similarity index 100%
> rename from tests/vc4_wait_bo.c
> rename to tests/vc4/vc4_wait_bo.c
> diff --git a/tests/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
> similarity index 100%
> rename from tests/vc4_wait_seqno.c
> rename to tests/vc4/vc4_wait_seqno.c
> --=20
> 2.38.1
>=20

--zjxqjndiqsdpiwv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOA1kcACgkQwqF3j0dL
ehzGFQ/8Daw2REHjqHTC8r+3DS36ON9mBm2YDIYyJttVe0iXG8GGO41OCMutHyDt
9eJuX4oKNgZ/qAKCsWV500bbcIeD+pdRVsP+yIXWXcvXpO3bWqgQ9ooa6ZKRBbEw
RI4k6gud7R6P5ccFhOmpLc24aTemvVrhCTbJB5HAiuiAy/IYKdcaqGqLfyC3z4Ke
VYAUnlltnJbQ2myMtJApDRv6e3hxL4epX7pRsW8heejXWNs07rYDMmtJkewYgKqu
n4v+qwQ5whLYTx0UUoqzM8mK7vZ1SoJebFWa2QHbdchxjTlsJ2X1z+NoSneyONVs
GOZbbu2mLUI8WC/cxpLIw4jBf0QyYFZs/Boc6jA82IP5OPopBLePvZ4gpXN+8G9m
6WBiQlZC+11O7Wiy224KUl8fdpo9pdLf+u00VHkJ5wEeIXE1xs8bmX2gySzO1VZ1
9pDsLVjh/TCiIWpF35C04WhGjlXvPpwi8brRdiYRedWumQumlAyeboZKLiClh9wv
Lxgw2E7zjPSslrI6aZuFQo36kGgsmSN+FWeqEcBEhc4oesmv8wNGuwl7JwfY41Qs
FfZM1jJC02mIq3uhKy56Kp40mFpjLAIfdPVRjVByjzjjd+pw83g3ae0uy/DgFmnN
FwTk24GAKSyPBemItgNBZdXAsMqvKHurKw2LmxpAT8g7HboRNZc=
=q4Ys
-----END PGP SIGNATURE-----

--zjxqjndiqsdpiwv2--
