Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B468610EE74
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Apr 2022 20:57:20 +0000 (UTC)
Date: Tue, 5 Apr 2022 19:56:56 -0100
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20220405205656.qyrwslu6c7tx5sej@mail.igalia.com>
References: <20220331145344.2503592-1-mwen@igalia.com>
 <164874782770.14474.9535419622516592112@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eslc6pkzmjszoxiv"
Content-Disposition: inline
In-Reply-To: <164874782770.14474.9535419622516592112@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fplane=5Falpha=5Fblend=3A_refactor_alpha-7efc_for_cle?=
 =?utf-8?q?arer_validation?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lakshminarayana.vudum@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--eslc6pkzmjszoxiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/31, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: tests/kms_plane_alpha_blend: refactor alpha-7efc for clearer vali=
dation
> URL   : https://patchwork.freedesktop.org/series/102026/
> State : warning
>=20
> =3D=3D Summary =3D=3D
>=20
> Pipeline status: FAILED.
>=20
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/547045 =
for the overview.
>=20
> test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/i=
gt-ci-tags/-/jobs/20569675):
>   Ok:                   22
>   Expected Fail:         3
>   Fail:                287
>   Unexpected Pass:       0
>   Skipped:               0
>   Timeout:               0
Hi,

Can these failures be false positives too? Basically all tests fail
after the expected fails.

Thanks,
>  =20
>   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog=
=2Etxt
>   section_end:1648747524:step_script
>   section_start:1648747524:upload_artifacts_on_failure
>   Uploading artifacts for failed job
>   Uploading artifacts...
>   build: found 1713 matching files and directories  =20
>   Uploading artifacts as "archive" to coordinator... 201 Created  id=3D20=
569675 responseStatus=3D201 Created token=3DZkXD-TSJ
>   section_end:1648747535:upload_artifacts_on_failure
>   section_start:1648747535:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1648747536:cleanup_file_variables
>   ERROR: Job failed: exit code 1
>  =20
>=20
> test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/ig=
t-ci-tags/-/jobs/20569676):
>   Ok:                   22
>   Expected Fail:         3
>   Fail:                287
>   Unexpected Pass:       0
>   Skipped:               0
>   Timeout:               0
>  =20
>   Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog=
=2Etxt
>   section_end:1648747524:step_script
>   section_start:1648747524:upload_artifacts_on_failure
>   Uploading artifacts for failed job
>   Uploading artifacts...
>   build: found 1713 matching files and directories  =20
>   Uploading artifacts as "archive" to coordinator... 201 Created  id=3D20=
569676 responseStatus=3D201 Created token=3DGWysfov2
>   section_end:1648747535:upload_artifacts_on_failure
>   section_start:1648747535:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1648747535:cleanup_file_variables
>   ERROR: Job failed: exit code 1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-=
/pipelines/547045

--eslc6pkzmjszoxiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJMrPsACgkQwqF3j0dL
ehwh5Q/7Bu0MLsB9z47zaKyeFTEfXakSwdbLXVcE3g18kQhuiNj7GDhOsWC9DYxf
pUBfrlt/AQbUc3BOqtEMjyU8Qby8xWAVvrF43Zo8CigXM6SsWkqSbsO+/44hkkeN
4GQ+RmGQ0HnMZbKZwXIOA9u9wLlCQMI+sOdcamz659QYlo1wUr6MDJIaJGULR9OB
TBVjVyo3yRplctUahRWzn/kqyjI0EDJMxzSxYL0/fm1IxCJ/kWhZoqSnxd+REnK1
V0rNgp9oECHtvuAq68tIx3/080yK4I+ZkJZ9PbQEyid7V2APzKsN04S+TYwKeiJH
R0OtwM6LFmRIklEJqctZDBUh9yQ3WfLTSTRp2GOaBANE1sxZR0edARKKOkfyAeyI
UEb22TdNyBXMMXIrjF2WXD+E/hJoUUQU+My8d0QgmagOC7BwtanSnyYUQHmvCX6U
9PM/P+vlLy0c2hNvESc4PK+FwaJDhdcn8K5nM1NPXD0i77ailk8Rm/pld1eqYf2x
5eIDApsnH0/LMczNionb4I5F/qRcpITqeBWgIKd0TEpx6GSiM36tl/RAnf/wJtSy
tvdndXq2BeK2Ivo/GcsRP6xyQaSoOmTZHGOYsyMsyqFh2lbBfEsZFd03CEB3EAb1
BgikivkGoo32jF+HPMn3n3X2y74xOuTsMJ5F/P6RBWcw43f4nqs=
=31pt
-----END PGP SIGNATURE-----

--eslc6pkzmjszoxiv--
