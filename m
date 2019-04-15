Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BF48991A
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2019 19:55:00 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 15 Apr 2019 19:54:57 +0000
Message-ID: <52b5a54854947b83461df3be88801a10783a95ce.camel@intel.com>
References: <20190412172136.17116-1-jose.souza@intel.com>
 <20190412211339.11255.78685@emeril.freedesktop.org>
In-Reply-To: <20190412211339.11255.78685@emeril.freedesktop.org>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv4=2C1/6=5D_tests/fbcon=5Ffbt=3A_Use_?=
 =?utf-8?q?psr=5Fwait=5Fentry=28=29_to_wait_PSR_be_enabled?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0662073366=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0662073366==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-mGMtfGUC05kAfaK/XZYS"

--=-mGMtfGUC05kAfaK/XZYS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-04-12 at 21:13 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: series starting with [i-g-t,v4,1/6] tests/fbcon_fbt: Use
> psr_wait_entry() to wait PSR be enabled
> URL   : https://patchwork.freedesktop.org/series/59414/
> State : success
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from CI_DRM_5923_full -> IGTPW_2854_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **SUCCESS**

Pushed, thanks for the reviews Maarten and Dhinakaran

>=20
>   No regressions found.
>=20
>   External URL:=20
> https://patchwork.freedesktop.org/api/1.0/series/59414/revisions/1/mbox/
>=20
> Known issues
> ------------
>=20
>   Here are the changes found in IGTPW_2854_full that come from known
> issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@gem_exec_params@invalid-flag:
>     - shard-apl:          PASS -> INCOMPLETE [fdo#103927]
>=20
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-kbl:          PASS -> SKIP [fdo#109271]
>=20
>   * igt@i915_suspend@debugfs-reader:
>     - shard-apl:          PASS -> DMESG-WARN [fdo#108566] +3
>=20
>   * igt@kms_concurrent@pipe-c:
>     - shard-apl:          PASS -> DMESG-WARN [fdo#110376]
>=20
>   * igt@kms_flip@2x-busy-flip:
>     - shard-kbl:          NOTRUN -> SKIP [fdo#109271] +9
>=20
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-glk:          PASS -> FAIL [fdo#102887]
>=20
>   * igt@kms
> _frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-glk:          PASS -> FAIL [fdo#103167]
>=20
>   * igt@kms
> _frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-iclb:         PASS -> FAIL [fdo#103167] +3
>=20
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
>     - shard-iclb:         PASS -> FAIL [fdo#109247] +18
>=20
>   * igt@kms
> _frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>     - shard-apl:          NOTRUN -> SKIP [fdo#109271] +8
>=20
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-f:
>     - shard-kbl:          NOTRUN -> SKIP [fdo#109271] / [fdo#109278]
>=20
>   * igt@kms_plane@plane-position-covered-pipe-a-planes:
>     - shard-kbl:          PASS -> FAIL [fdo#110038]
>=20
>   * igt@kms_plane_lowres@pipe-a-tiling-y:
>     - shard-iclb:         PASS -> FAIL [fdo#103166]
>=20
>   * igt@kms_psr@cursor_blt:
>     - shard-iclb:         PASS -> FAIL [fdo#107383] / [fdo#110215]
>=20
>   * igt@kms_psr@psr2_cursor_mmap_gtt:
>     - shard-iclb:         PASS -> SKIP [fdo#109441]
>=20
>   * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
>     - shard-hsw:          PASS -> INCOMPLETE [fdo#103540]
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@gem_softpin@noreloc-s3:
>     - shard-kbl:          DMESG-WARN [fdo#103313] -> PASS
>=20
>   * igt@i915_selftest@live_workarounds:
>     - shard-iclb:         DMESG-FAIL [fdo#108954] -> PASS
>=20
>   * igt@kms_fbcon_fbt@psr:
>     - shard-iclb:         FAIL [fdo#103833] -> PASS
>=20
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-glk:          FAIL [fdo#105363] -> PASS
>=20
>   * igt@kms_frontbuffer_tracking@fbc-stridechange:
>     - shard-glk:          FAIL [fdo#103167] -> PASS
>     - shard-kbl:          FAIL [fdo#103167] -> PASS
>=20
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-apl:          DMESG-WARN [fdo#108566] -> PASS +5
>=20
>   * igt@kms
> _frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
>     - shard-iclb:         FAIL [fdo#109247] -> PASS +14
>=20
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>     - shard-iclb:         FAIL [fdo#103167] -> PASS +3
>=20
>   * igt@kms_plane@pixel-format-pipe-b-planes:
>     - shard-glk:          SKIP [fdo#109271] -> PASS
>=20
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-iclb:         FAIL [fdo#103166] -> PASS
>=20
>   * igt@kms_psr@suspend:
>     - shard-iclb:         FAIL [fdo#107383] / [fdo#110215] -> PASS
>=20
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-kbl:          DMESG-FAIL [fdo#105763] -> PASS
>=20
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-kbl:          FAIL [fdo#109016] -> PASS
>=20
>   * igt@kms_setmode@basic:
>     - shard-apl:          FAIL [fdo#99912] -> PASS
>     - shard-kbl:          FAIL [fdo#99912] -> PASS
>=20
>   * igt@testdisplay:
>     - shard-kbl:          INCOMPLETE [fdo#103665] -> PASS
>     - shard-apl:          INCOMPLETE [fdo#103927] -> PASS
>=20
>   * igt@tools_test@tools_test:
>     - shard-snb:          SKIP [fdo#109271] -> PASS
>=20
>  =20
>   [fdo#102887]: https://bugs.freedesktop.org/show_bug.cgi?id=3D102887
>   [fdo#103166]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103166
>   [fdo#103167]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103167
>   [fdo#103313]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103313
>   [fdo#103540]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103540
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103665
>   [fdo#103833]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103833
>   [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103927
>   [fdo#105363]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105363
>   [fdo#105763]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105763
>   [fdo#107383]: https://bugs.freedesktop.org/show_bug.cgi?id=3D107383
>   [fdo#108566]: https://bugs.freedesktop.org/show_bug.cgi?id=3D108566
>   [fdo#108954]: https://bugs.freedesktop.org/show_bug.cgi?id=3D108954
>   [fdo#109016]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109016
>   [fdo#109247]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109247
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109271
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109278
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109441
>   [fdo#110038]: https://bugs.freedesktop.org/show_bug.cgi?id=3D110038
>   [fdo#110215]: https://bugs.freedesktop.org/show_bug.cgi?id=3D110215
>   [fdo#110376]: https://bugs.freedesktop.org/show_bug.cgi?id=3D110376
>   [fdo#99912]: https://bugs.freedesktop.org/show_bug.cgi?id=3D99912
>=20
>=20
> Participating hosts (10 -> 6)
> ------------------------------
>=20
>   Missing    (4): pig-skl-6260u shard-skl pig-hsw-4770r pig-glk-
> j5005=20
>=20
>=20
> Build changes
> -------------
>=20
>     * IGT: IGT_4945 -> IGTPW_2854
>     * Piglit: piglit_4509 -> None
>=20
>   CI_DRM_5923: 8f69ca66d43ef57be72394ba23c2ff1718d94164 @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_2854: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2854/
>   IGT_4945: a52cc643cfe6733465cfc9ccb3d21cbdc4fd7506 @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2854/

--=-mGMtfGUC05kAfaK/XZYS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAly04ZAACgkQVenbO/mO
WknzAggAmCY1HK7uVks9WdiI7w3NS5klpmbfk+6ox1T2fJ/NozhaMMUNa9UvkAUx
FH9RQShpZzK7gG0WN/vn6QDSnd0u1GbB+KO1PxWZEBsB9dZbTIqkOPQzc2j7Qoi5
w7nt380MhII2lKiH+WOXaNQ/o08/KtRGqDbdrcXB/G6kmUN2xJleWg9KK40Vkw1X
091xP+nVcv4Wf7YGyKNXlizs1uywRYtsxbvwDC/ZfvDNnCk8cAORAnarUmhtgSPg
SEoif5JOvd0t5b2ueGuRTFuWRlvpQ0VlJoDQXgCzw1GxYTj4D80IL2kX1h4g2Hxa
0gAzWku7d9l8az73LxbAjE1u723Z1w==
=/3/f
-----END PGP SIGNATURE-----

--=-mGMtfGUC05kAfaK/XZYS--

--===============0662073366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0662073366==--
