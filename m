Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600866E2AD
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Feb 2019 17:32:54 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id 2so8773704qtb.5
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Feb 2019 09:32:54 -0800 (PST)
Date: Wed, 6 Feb 2019 15:32:49 -0200
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190206173249.uercdo7bqkko5ksz@smtp.gmail.com>
References: <20190127193815.z7fuqhmqh7dn2olc@smtp.gmail.com>
 <20190127234428.31056.61683@emeril.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20190127234428.31056.61683@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgU2tpcCBW?=
 =?utf-8?q?Blank_tests_in_modules_without_VBlank_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1417271918=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1417271918==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ynbvyd7oarst5bwm"
Content-Disposition: inline


--ynbvyd7oarst5bwm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/27, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: Skip VBlank tests in modules without VBlank (rev3)
> URL   : https://patchwork.freedesktop.org/series/48468/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from IGT_4791_full -> IGTPW_2301_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **FAILURE**
>=20
>   Serious unknown changes coming with IGTPW_2301_full absolutely need to =
be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_2301_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>=20
>   External URL: https://patchwork.freedesktop.org/api/1.0/series/48468/re=
visions/3/mbox/
>=20
> Possible new issues
> -------------------
>=20
>   Here are the unknown changes that may have been introduced in IGTPW_230=
1_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
>   * igt@gem_eio@in-flight-contexts-1us:
>     - shard-kbl:          NOTRUN -> DMESG-WARN
>     - shard-apl:          NOTRUN -> DMESG-WARN
>     - shard-glk:          NOTRUN -> DMESG-WARN
>=20
>   * igt@gem_mmap_gtt@hang:
>     - shard-kbl:          NOTRUN -> FAIL
>
=20
Hi,

I tried to figure out the reason for the failure described by the CI
[1]; however, I can=E2=80=99t see any relationship between my patch and the
problem reported by the CI. I tried to reproduce the CI results on my
i915, but all the tests passed on my machine.

I suspect this could be a false positive.

> #### Suppressed ####
>=20
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
>=20
>   * {igt@runner@aborted}:
>     - shard-apl:          ( 3 FAIL ) -> ( 4 FAIL )
>=20
>  =20
> Known issues
> ------------
>=20
>   Here are the changes found in IGTPW_2301_full that come from known issu=
es:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-kbl:          PASS -> INCOMPLETE [fdo#103665]
>=20
>   * igt@i915_suspend@shrink:
>     - shard-hsw:          NOTRUN -> DMESG-WARN [fdo#109244]
>=20
>   * igt@kms_available_modes_crc@available_mode_test_crc:
>     - shard-glk:          PASS -> FAIL [fdo#106641]
>=20
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic:
>     - shard-apl:          PASS -> FAIL [fdo#106510] / [fdo#108145]
>=20
>   * igt@kms_cursor_crc@cursor-128x128-random:
>     - shard-apl:          PASS -> FAIL [fdo#103232] +5
>     - shard-kbl:          PASS -> FAIL [fdo#103232] +1
>=20
>   * igt@kms_cursor_crc@cursor-size-change:
>     - shard-glk:          PASS -> FAIL [fdo#103232] +4
>=20
>   * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
>     - shard-glk:          PASS -> FAIL [fdo#108948]
>=20
>   * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>     - shard-glk:          NOTRUN -> FAIL [fdo#108145]
>     - shard-apl:          NOTRUN -> FAIL [fdo#108145]
>     - shard-kbl:          NOTRUN -> FAIL [fdo#108145]
>=20
>   * igt@kms_plane_multiple@atomic-pipe-b-tiling-y:
>     - shard-glk:          PASS -> FAIL [fdo#103166] +1
>=20
>   * igt@kms_setmode@basic:
>     - shard-apl:          PASS -> FAIL [fdo#99912]
>     - shard-kbl:          PASS -> FAIL [fdo#99912]
>=20
>   * igt@kms_vblank@pipe-a-wait-idle-hang:
>     - shard-hsw:          PASS -> INCOMPLETE [fdo#103540]
>=20
>   * igt@perf_pmu@rc6-runtime-pm-long:
>     - shard-apl:          PASS -> FAIL [fdo#105010]
>     - shard-glk:          PASS -> FAIL [fdo#105010]
>     - shard-kbl:          PASS -> FAIL [fdo#105010]
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@kms_ccs@pipe-a-crc-sprite-planes-basic:
>     - shard-glk:          FAIL [fdo#108145] -> PASS
>=20
>   * igt@kms_cursor_crc@cursor-256x256-sliding:
>     - shard-kbl:          FAIL [fdo#103232] -> PASS
>=20
>   * igt@kms_cursor_crc@cursor-64x64-sliding:
>     - shard-apl:          FAIL [fdo#103232] -> PASS +2
>=20
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-glk:          FAIL [fdo#105454] / [fdo#106509] -> PASS
>=20
>   * igt@kms_plane_multiple@atomic-pipe-a-tiling-y:
>     - shard-glk:          FAIL [fdo#103166] -> PASS +6
>=20
>   * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
>     - shard-apl:          FAIL [fdo#103166] -> PASS +4
>     - shard-kbl:          FAIL [fdo#103166] -> PASS +1
>=20
>   * igt@kms_sequence@queue-idle:
>     - shard-hsw:          INCOMPLETE [fdo#103540] -> PASS
>=20
>   * igt@perf_pmu@rc6:
>     - shard-kbl:          {SKIP} [fdo#109271] -> PASS
>=20
>   * igt@prime_busy@hang-blt:
>     - shard-hsw:          FAIL -> PASS
>=20
>  =20
> #### Warnings ####
>=20
>   * igt@i915_suspend@shrink:
>     - shard-snb:          INCOMPLETE [fdo#105411] / [fdo#106886] -> DMESG=
-WARN [fdo#109244]
>=20
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-snb:          {SKIP} [fdo#109271] -> INCOMPLETE [fdo#105411]
>=20
>  =20
>   {name}: This element is suppressed. This means it is ignored when compu=
ting
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
>=20
>   [fdo#103166]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103166
>   [fdo#103232]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103232
>   [fdo#103540]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103540
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103665
>   [fdo#105010]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105010
>   [fdo#105411]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105411
>   [fdo#105454]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105454
>   [fdo#106509]: https://bugs.freedesktop.org/show_bug.cgi?id=3D106509
>   [fdo#106510]: https://bugs.freedesktop.org/show_bug.cgi?id=3D106510
>   [fdo#106641]: https://bugs.freedesktop.org/show_bug.cgi?id=3D106641
>   [fdo#106886]: https://bugs.freedesktop.org/show_bug.cgi?id=3D106886
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=3D108145
>   [fdo#108948]: https://bugs.freedesktop.org/show_bug.cgi?id=3D108948
>   [fdo#109244]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109244
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109271
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109278
>   [fdo#109373]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109373
>   [fdo#99912]: https://bugs.freedesktop.org/show_bug.cgi?id=3D99912
>   [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=3D202321
>=20
>=20
> Participating hosts (7 -> 5)
> ------------------------------
>=20
>   Missing    (2): shard-skl shard-iclb=20
>=20
>=20
> Build changes
> -------------
>=20
>     * IGT: IGT_4791 -> IGTPW_2301
>=20
>   CI_DRM_5490: 310d38b4b51e06ef7096716430e2ef262c3e45fe @ git://anongit.f=
reedesktop.org/gfx-ci/linux
>   IGTPW_2301: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2301/
>   IGT_4791: cf1222ced94328b6c7be9256e6101505b5d3d143 @ git://anongit.free=
desktop.org/xorg/app/intel-gpu-tools
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2301/

--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=C3=A3o Paulo

--ynbvyd7oarst5bwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlxbGkEACgkQWJzP/com
vP+IXBAAy6Ar7uXPXhPe9V7iuOUFe45CYGBgSKNMrSBv3QiskkbmaFs0HvKycc/d
yDOqsIKIsJUpUzjQuUwLQlJHIVLdRbVdGSZKc0jMBTkeF3Txpd+GHafDwBCw4Odj
U65QoBQhSClXP7OcsO1hZp7O8yTBDu+fI/Tk5rmUpa/s/ZR5L26f7qNCGU8T0pt+
as+quWUgvOQqVARZAEWHWr4oAnePkUbvLzUxkSAtHJvyWqUOczAYjqBgK129Ezib
wZ4oYs/JotbcVReCcSazakEPP+ba8wfdPI/Am2eHU0h5K9mD0l/MtHXUwziV/OeZ
+ogZXaLPySLAlNzRC72umZtRqVqorzaIgrfy5AtiRv1tVgtKG3XOz5iefG2YNFER
F6pEJEk7G/oCOGX0sPxISkLtyY7tIdgXfWF2mZLdhVbv+Vpc14x8FIbMkJ45fMYz
63jWQEGgJXpOLpcgceVbh8uJj2b/3UpXdVHs+2tGq0GTcTggHGAZe5mz/1bdtoeB
DaEI6AIcMXvxqyn8D125qCqrfoHZ9pFAJFcfhMpKvWAws+I445CqxDbwSWg9uE/k
89pSzP58NRu3PR7b4urnN7wjSBUtauWvTr2luC6uzh9LuWj2r1COTytRh7fvlf7+
qgEPnRehopMbjwCvbT1O6gXGnBRLWEaFneeW0V/+aDb9eQwiNvM=
=o3g+
-----END PGP SIGNATURE-----

--ynbvyd7oarst5bwm--

--===============1417271918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1417271918==--
