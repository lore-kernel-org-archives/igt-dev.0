Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496A76E449
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 20:00:27 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 3 Apr 2019 20:00:25 +0000
Message-ID: <48ef1098ecdc66be576298d4ecd65fff96c441c4.camel@intel.com>
References: <20190402205902.2245-1-jose.souza@intel.com>
 <20190403110554.7102.11880@emeril.freedesktop.org>
In-Reply-To: <20190403110554.7102.11880@emeril.freedesktop.org>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/frontbuffer=5Ftrack?=
 =?utf-8?q?ing=3A_Do_not_assert_FBC_state_after_a_page_flip_changing_strid?=
 =?utf-8?q?e?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1009820702=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1009820702==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-XbNQhhwJKfZboGEUyVOX"

--=-XbNQhhwJKfZboGEUyVOX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-04-03 at 11:05 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: series starting with [i-g-t,v2,1/2]
> tests/frontbuffer_tracking: Do not assert FBC state after a page flip
> changing stride
> URL   : https://patchwork.freedesktop.org/series/58892/
> State : success
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from CI_DRM_5857_full -> IGTPW_2767_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **SUCCESS**

Pushed, thanks for the reviews Dhinakaran

>=20
>   No regressions found.
>=20
>   External URL:=20
> https://patchwork.freedesktop.org/api/1.0/series/58892/revisions/1/mbox/
>=20
> Known issues
> ------------
>=20
>   Here are the changes found in IGTPW_2767_full that come from known
> issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@gem_create@create-clear:
>     - shard-snb:          PASS -> INCOMPLETE [fdo#105411]
>=20
>   * igt@i915_suspend@debugfs-reader:
>     - shard-kbl:          PASS -> INCOMPLETE [fdo#103665]
>=20
>   * igt@kms_busy@extended-modeset-hang-newfb-render-c:
>     - shard-hsw:          PASS -> DMESG-WARN [fdo#110222]
>=20
>   * igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-c:
>     - shard-glk:          NOTRUN -> DMESG-WARN [fdo#110222]
>=20
>   * igt@kms_cursor_crc@cursor-128x42-sliding:
>     - shard-glk:          NOTRUN -> FAIL [fdo#103232] +1
>=20
>   * igt@kms_cursor_crc@cursor-256x256-random:
>     - shard-apl:          PASS -> FAIL [fdo#103232] +1
>     - shard-kbl:          PASS -> FAIL [fdo#103232]
>=20
>   * igt@kms_cursor_legacy@pipe-b-torture-bo:
>     - shard-kbl:          PASS -> DMESG-WARN [fdo#107122]
>=20
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - shard-hsw:          PASS -> INCOMPLETE [fdo#103540]
>=20
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-snb:          PASS -> DMESG-WARN [fdo#102365]
>=20
>   * igt@kms
> _frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-glk:          PASS -> FAIL [fdo#103167]
>=20
>   * igt@kms
> _frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
>     - shard-glk:          NOTRUN -> SKIP [fdo#109271] +53
>=20
>   * igt@kms_frontbuffer_tracking@psr-farfromfence:
>     - shard-kbl:          NOTRUN -> SKIP [fdo#109271] +7
>=20
>   * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-e:
>     - shard-glk:          NOTRUN -> SKIP [fdo#109271] / [fdo#109278]
> +5
>=20
>   * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
>     - shard-glk:          PASS -> SKIP [fdo#109271] / [fdo#109278]
>=20
>   * igt@kms_psr@psr2_primary_render:
>     - shard-apl:          NOTRUN -> SKIP [fdo#109271] +2
>=20
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-kbl:          PASS -> DMESG-FAIL [fdo#105763]
>=20
>   * igt@kms_setmode@basic:
>     - shard-kbl:          PASS -> FAIL [fdo#99912]
>=20
>   * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
>     - shard-apl:          PASS -> FAIL [fdo#104894]
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@kms_atomic@plane_invalid_params:
>     - shard-snb:          SKIP [fdo#109271] -> PASS +2
>=20
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-glk:          INCOMPLETE [fdo#103359] / [k.org#198133] ->
> PASS
>=20
>   * igt@kms_busy@extended-modeset-hang-newfb-render-b:
>     - shard-hsw:          DMESG-WARN [fdo#110222] -> PASS
>=20
>   * igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-b:
>     - shard-kbl:          DMESG-WARN [fdo#110222] -> PASS +1
>     - shard-snb:          DMESG-WARN [fdo#110222] -> PASS +3
>=20
>   * igt@kms_chv_cursor_fail@pipe-b-128x128-left-edge:
>     - shard-snb:          SKIP [fdo#109271] / [fdo#109278] -> PASS +1
>=20
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-glk:          FAIL [fdo#103060] -> PASS
>=20
>   * igt@kms_frontbuffer_tracking@fbc-stridechange:
>     - shard-hsw:          FAIL [fdo#105682] -> PASS
>=20
>   * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
>     - shard-glk:          SKIP [fdo#109271] / [fdo#109278] -> PASS
>=20
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-kbl:          INCOMPLETE [fdo#103665] -> PASS
>=20
>   * igt@kms_setmode@basic:
>     - shard-apl:          FAIL [fdo#99912] -> PASS
>=20
>  =20
>   [fdo#102365]: https://bugs.freedesktop.org/show_bug.cgi?id=3D102365
>   [fdo#103060]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103060
>   [fdo#103167]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103167
>   [fdo#103232]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103232
>   [fdo#103359]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103359
>   [fdo#103540]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103540
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103665
>   [fdo#104894]: https://bugs.freedesktop.org/show_bug.cgi?id=3D104894
>   [fdo#105411]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105411
>   [fdo#105682]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105682
>   [fdo#105763]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105763
>   [fdo#107122]: https://bugs.freedesktop.org/show_bug.cgi?id=3D107122
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109271
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109278
>   [fdo#110222]: https://bugs.freedesktop.org/show_bug.cgi?id=3D110222
>   [fdo#99912]: https://bugs.freedesktop.org/show_bug.cgi?id=3D99912
>   [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=3D198133
>=20
>=20
> Participating hosts (10 -> 5)
> ------------------------------
>=20
>   Missing    (5): shard-skl pig-hsw-4770r pig-glk-j5005 shard-iclb
> pig-skl-6260u=20
>=20
>=20
> Build changes
> -------------
>=20
>     * IGT: IGT_4922 -> IGTPW_2767
>     * Piglit: piglit_4509 -> None
>=20
>   CI_DRM_5857: 650af99ea37e684646d7ed0804e10ea1c7d73228 @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_2767: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2767/
>   IGT_4922: e941e4a29438c7130554492e4daf52afbc99ffdf @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2767/

--=-XbNQhhwJKfZboGEUyVOX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlylENcACgkQVenbO/mO
WkmsUAf+PRMG7wu+2bSWo+xQXVGO8f27j4OD3O+pgIDq7o35To3x55YHHiBS51Ta
VfWW0oTVujiKx2we9S8QXlT5nAyHCN7P3DWfQvP4D3gi5bGJ6XoZCkLESUQWo8pn
yNg/afKvBzyC8NnYl6UHnCOkwJ3YrpNZVCmQxrdF5SaUSEbQ0QqvIvE9ArZC7w57
woas4nzGRlXTKgg3TmKDo3N4xe/1CE8Z7A/Uoi78HCtWW/zuvolU2stZooVxQqIA
vxBqyfkc30peRnQHB6aeGMaZDP5rFAeJH+BLVOtq2iios0SmTBRi/+UpLJ82BSPb
sKOHoVihZTSYh7CZGOzOnHskIT8n9w==
=a1Cw
-----END PGP SIGNATURE-----

--=-XbNQhhwJKfZboGEUyVOX--

--===============1009820702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1009820702==--
