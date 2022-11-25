Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447D410E7B6
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 14:01:08 +0000 (UTC)
Date: Fri, 25 Nov 2022 13:00:55 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20221125140055.6bt65wlms2o6js47@mail.igalia.com>
References: <20221111195813.277822-1-mcanal@igalia.com>
 <20221111195813.277822-3-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rbztixejk2csey6a"
Content-Disposition: inline
In-Reply-To: <20221111195813.277822-3-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/7] tests/v3d: Move V3D tests to
 their own folder
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


--rbztixejk2csey6a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/11, Ma=EDra Canal wrote:
> With the introduction of new tests to V3D, in order to avoid polluting
> the main tests folder, move the V3D tests to a separate folder.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  tests/meson.build                   | 18 +++++++++++++++---
>  tests/{ =3D> v3d}/v3d_get_bo_offset.c |  0
>  tests/{ =3D> v3d}/v3d_get_param.c     |  0
>  tests/{ =3D> v3d}/v3d_mmap.c          |  0
>  4 files changed, 15 insertions(+), 3 deletions(-)
>  rename tests/{ =3D> v3d}/v3d_get_bo_offset.c (100%)
>  rename tests/{ =3D> v3d}/v3d_get_param.c (100%)
>  rename tests/{ =3D> v3d}/v3d_mmap.c (100%)
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index 12e53e0b..5c9b1829 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -80,9 +80,6 @@ test_progs =3D [
>  	'syncobj_timeline',
>  	'template',
>  	'tools_test',
> -	'v3d_get_bo_offset',
> -	'v3d_get_param',
> -	'v3d_mmap',
>  	'vc4_create_bo',
>  	'vc4_dmabuf_poll',
>  	'vc4_label_bo',
> @@ -258,6 +255,12 @@ msm_progs =3D [
>  	'msm_submit'
>  ]
> =20
> +v3d_progs =3D [
> +	'v3d_get_bo_offset',
> +	'v3d_get_param',
> +	'v3d_mmap',
> +]

Not a strong opinion, but I would prefer to have a subdir `v3d` and run
tests from there, the same way as done for amdgpu tests. That means,
running from build/tests/v3d/

> +
>  chamelium_progs =3D [
>  	'kms_chamelium',
>  ]
> @@ -305,6 +308,15 @@ foreach prog : msm_progs
>  	test_list +=3D prog
>  endforeach
> =20
> +foreach prog : v3d_progs
> +	test_executables +=3D executable(prog, join_paths('v3d', prog + '.c'),
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
> diff --git a/tests/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
> similarity index 100%
> rename from tests/v3d_get_bo_offset.c
> rename to tests/v3d/v3d_get_bo_offset.c
> diff --git a/tests/v3d_get_param.c b/tests/v3d/v3d_get_param.c
> similarity index 100%
> rename from tests/v3d_get_param.c
> rename to tests/v3d/v3d_get_param.c
> diff --git a/tests/v3d_mmap.c b/tests/v3d/v3d_mmap.c
> similarity index 100%
> rename from tests/v3d_mmap.c
> rename to tests/v3d/v3d_mmap.c
> --=20
> 2.38.1
>=20

--rbztixejk2csey6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOAyowACgkQwqF3j0dL
ehx+kRAAyHcJbcnZ7dcZ18EvalR59jRwQKkX+58Ywv4y+yw80ny7QwpqyyPTxyNB
pikZuyqBlmQk6HPp/GsQ/deQi7clQAPK6mkfofVPmSy35WhTyXFI8FzUVbxs84qv
Xj69gxp0CAImQl8OqB4qEnAugRp22ZTxwOBZvyHyJK0gggi0xpmgNUs/LB5Fy3M6
0tmHCJSffeNjNWQANXDevk+bqGf4o1tCyn0emfkjTxGDAg677NCLWqx0offX219O
iptM+/N0CQf1DwXZBsWijMV3uIVsWL0WlJlxkXGZDtDSjhKsBhhYQWnB+MbZm9Gz
mC7UXV/AaWdOqH+LdYuwKwRZElImBCsVF97Q/iiAVx3/+i2Kh5xFs8dq+ihCmCCb
FP1K2GOxTvxiyjwxGCbk7eFqjbsjjmNhOi0abFalzov5pmozd3BzlISdV0DREQtR
F1eO+is+fC2NRgdBdE8Q2LP+09BobMDVI0ymrTetzWA9sN7A+bfcV18RfKlJrD4h
P8zk7Av6X3aLFNiu1K9HEV8sjarhXqgL6gOZ7RAaQlibd8dLqgH7vu81IvQcIbEr
awQkXfUAvS9ycRVMxdeyGrh+x5DtRweq33uWX3GAHEVxR4uEaCtShKJEOlnAgHfk
//18LowS31mu5DvJB4RuSlAGolx+XwundXhZRw9axYhiCNnA1YQ=
=FZ9/
-----END PGP SIGNATURE-----

--rbztixejk2csey6a--
