Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B56389338
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 22:36:46 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 14 Jan 2019 22:36:43 +0000
Message-ID: <71f8d96f2a26344e19a7f811fa26501f6e26e3e8.camel@intel.com>
References: <20190111225148.28380-1-jose.souza@intel.com>
 <20190112075427.14931.63728@emeril.freedesktop.org>
In-Reply-To: <20190112075427.14931.63728@emeril.freedesktop.org>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2-resend-reviewed=2C1/2=5D_lib/psr?=
 =?utf-8?q?=3A_Add_a_macro_with_the_maximum_lenght_of_i915=5Fedp=5Fpsr=5Fs?=
 =?utf-8?q?tatus_and_use_it?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0982426172=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0982426172==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-bJSg5ZUA6DopB1EXlBQh"

--=-bJSg5ZUA6DopB1EXlBQh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pushed, thanks for the reviews DK.

On Sat, 2019-01-12 at 07:54 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: series starting with [i-g-t,v2-resend-reviewed,1/2] lib/psr:
> Add a macro with the maximum lenght of i915_edp_psr_status and use it
> URL   : https://patchwork.freedesktop.org/series/55105/
> State : success
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from CI_DRM_5408_full -> IGTPW_2227_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **SUCCESS**
>=20
>   No regressions found.
>=20
>   External URL:=20
> https://patchwork.freedesktop.org/api/1.0/series/55105/revisions/1/mbox/
>=20
> Known issues
> ------------
>=20
>   Here are the changes found in IGTPW_2227_full that come from known
> issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@i915_suspend@sysfs-reader:
>     - shard-snb:          PASS -> INCOMPLETE [fdo#105411]
>=20
>   * igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-c:
>     - shard-apl:          NOTRUN -> DMESG-WARN [fdo#107956]
>=20
>   * igt@kms_cursor_crc@cursor-64x21-sliding:
>     - shard-apl:          PASS -> FAIL [fdo#103232] +3
>     - shard-kbl:          PASS -> FAIL [fdo#103232]
>=20
>   * igt@kms_cursor_crc@cursor-64x64-sliding:
>     - shard-glk:          PASS -> FAIL [fdo#103232] +5
>=20
>   * igt@kms_cursor_crc@cursor-64x64-suspend:
>     - shard-apl:          PASS -> FAIL [fdo#103191] / [fdo#103232]
>=20
>   * igt@kms
> _cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-glk:          PASS -> FAIL [fdo#105454]
>=20
>   * igt@kms_flip@modeset-vs-vblank-race:
>     - shard-hsw:          PASS -> DMESG-FAIL [fdo#102614] /
> [fdo#103060]
>=20
>   * igt@kms
> _frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-kbl:          PASS -> FAIL [fdo#103167]
>=20
>   * igt@kms
> _frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
>     - shard-apl:          PASS -> FAIL [fdo#103167] +4
>=20
>   * igt@kms_frontbuffer_tracking@fbc-1p-rte:
>     - shard-apl:          PASS -> FAIL [fdo#103167] / [fdo#105682]
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-glk:          PASS -> FAIL [fdo#103167] +5
>=20
>   * igt@kms_plane@pixel-format-pipe-a-planes:
>     - shard-kbl:          PASS -> FAIL [fdo#103166] +3
>=20
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
>     - shard-apl:          NOTRUN -> FAIL [fdo#108145]
>=20
>   * igt@kms_plane_multiple@atomic-pipe-a-tiling-x:
>     - shard-apl:          PASS -> FAIL [fdo#103166] +3
>=20
>   * igt@kms_plane_multiple@atomic-pipe-a-tiling-y:
>     - shard-glk:          PASS -> FAIL [fdo#103166] +8
>=20
>   * igt@kms_setmode@basic:
>     - shard-apl:          PASS -> FAIL [fdo#99912]
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@kms_available_modes_crc@available_mode_test_crc:
>     - shard-apl:          FAIL [fdo#106641] -> PASS
>=20
>   * igt@kms_cursor_crc@cursor-128x128-random:
>     - shard-apl:          FAIL [fdo#103232] -> PASS +1
>=20
>   * igt@kms_cursor_crc@cursor-256x256-random:
>     - shard-glk:          FAIL [fdo#103232] -> PASS
>=20
>   * igt@kms_cursor_crc@cursor-64x64-dpms:
>     - shard-kbl:          FAIL [fdo#103232] -> PASS +1
>=20
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>     - shard-apl:          FAIL [fdo#103167] -> PASS
>=20
>   * igt@kms
> _frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-glk:          FAIL [fdo#103167] -> PASS +6
>=20
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-kbl:          DMESG-WARN [fdo#103558] / [fdo#105602] ->
> PASS +16
>=20
>   * igt@kms_plane@plane-position-covered-pipe-c-planes:
>     - shard-kbl:          FAIL [fdo#103166] -> PASS
>=20
>   * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>     - shard-glk:          FAIL [fdo#108145] -> PASS +2
>=20
>   * igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
>     - shard-glk:          FAIL [fdo#103166] -> PASS +2
>=20
>   * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
>     - shard-apl:          FAIL [fdo#103166] -> PASS +1
>=20
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-glk:          DMESG-FAIL [fdo#105763] / [fdo#106538] ->
> PASS
>=20
>   * igt@pm_rc6_residency@rc6-accuracy:
>     - shard-snb:          {SKIP} [fdo#109271] -> PASS
>=20
>  =20
>   {name}: This element is suppressed. This means it is ignored when
> computing
>           the status of the difference (SUCCESS, WARNING, or
> FAILURE).
>=20
>   [fdo#102614]: https://bugs.freedesktop.org/show_bug.cgi?id=3D102614
>   [fdo#103060]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103060
>   [fdo#103166]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103166
>   [fdo#103167]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103167
>   [fdo#103191]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103191
>   [fdo#103232]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103232
>   [fdo#103558]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103558
>   [fdo#105411]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105411
>   [fdo#105454]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105454
>   [fdo#105602]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105602
>   [fdo#105682]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105682
>   [fdo#105763]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105763
>   [fdo#106538]: https://bugs.freedesktop.org/show_bug.cgi?id=3D106538
>   [fdo#106641]: https://bugs.freedesktop.org/show_bug.cgi?id=3D106641
>   [fdo#107956]: https://bugs.freedesktop.org/show_bug.cgi?id=3D107956
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=3D108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109271
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109278
>   [fdo#99912]: https://bugs.freedesktop.org/show_bug.cgi?id=3D99912
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
>     * IGT: IGT_4764 -> IGTPW_2227
>     * Piglit: piglit_4509 -> None
>=20
>   CI_DRM_5408: bd0d0bbe6b5a740429be306d7eea41703daf08cc @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_2227: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2227/
>   IGT_4764: db19bccc1c220884baf2136e41683a3c2ba6aa24 @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2227/

--=-bJSg5ZUA6DopB1EXlBQh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlw9DvkACgkQVenbO/mO
WkmwOQf8CqmobFYAmH/TZp3E9qc9F782TCv90tVcWITwRz8s8PJMuKTDd3kHjfD/
y1hct8W1psmPhEUgVJ29XGzvMa0omJcpicUC5CZ/wqgcChIqEicoU+ezhB6R0+iK
4HmFg2w0YcBfcwKeeRM/tp9I0Ehm9P1A7vhhyVS+cLFqXCyJPLn4mD4hHIkNPiRQ
j+HlumOIFxwvpNuI/v8dcLGXaQ0l3wf2qEQQtbiI7kIf3JLJDCGTx3PwDUyG2ABm
SaotBXzIrpjfR6RcRJO5YHD7PSoDPbpmmsTp6ifMguF9x84b2lSCcJ4fgplpsTKs
g3vfie02NPGJybFET0YEzwoTqnPQGg==
=+mVR
-----END PGP SIGNATURE-----

--=-bJSg5ZUA6DopB1EXlBQh--

--===============0982426172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0982426172==--
