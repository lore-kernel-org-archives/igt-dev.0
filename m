Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03EB6E480
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 00:28:14 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 3 Apr 2019 00:28:12 +0000
Message-ID: <7a9ff86851ab310059172ed16c8131f67d92f208.camel@intel.com>
References: <20190402130837.27521-1-ville.syrjala@linux.intel.com>
 <20190402212108.4272.54731@emeril.freedesktop.org>
In-Reply-To: <20190402212108.4272.54731@emeril.freedesktop.org>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Allow_the_test_to_proceed_with_fewer_planes?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1998174877=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1998174877==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-q94Yr+/rxsK6QyJtKphD"

--=-q94Yr+/rxsK6QyJtKphD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-02 at 21:21 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: tests/kms_concurrent: Allow the test to proceed with fewer
> planes
> URL   : https://patchwork.freedesktop.org/series/58872/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from IGT_4920_full -> IGTPW_2760_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **FAILURE**
>=20
>   Serious unknown changes coming with IGTPW_2760_full absolutely need
> to be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the
> changes
>   introduced in IGTPW_2760_full, please notify your bug team to allow
> them
>   to document this new failure mode, which will reduce false
> positives in CI.
>=20
>   External URL:=20
> https://patchwork.freedesktop.org/api/1.0/series/58872/revisions/1/mbox/
>=20
> Possible new issues
> -------------------
>=20
>   Here are the unknown changes that may have been introduced in
> IGTPW_2760_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
>   * igt@kms_vblank@pipe-b-ts-continuation-modeset:
>     - shard-kbl:          PASS -> DMESG-FAIL

Not related at all.

Patch pushed.

Thanks

>=20
>  =20
> Known issues
> ------------
>=20
>   Here are the changes found in IGTPW_2760_full that come from known
> issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@gem_busy@busy-bsd1:
>     - shard-apl:          NOTRUN -> SKIP [fdo#109271] +22
>=20
>   * igt@gem_exec_schedule@independent-bsd2:
>     - shard-glk:          NOTRUN -> SKIP [fdo#109271] +63
>=20
>   * igt@gem_exec_schedule@preempt-queue-contexts-chain-vebox:
>     - shard-snb:          NOTRUN -> SKIP [fdo#109271] +12
>=20
>   * igt@kms_busy@extended-modeset-hang-newfb-render-c:
>     - shard-glk:          NOTRUN -> DMESG-WARN [fdo#110222]
>=20
>   * igt@kms_busy@extended-modeset-hang-oldfb-render-d:
>     - shard-kbl:          NOTRUN -> SKIP [fdo#109271] / [fdo#109278]
> +1
>=20
>   * igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-e:
>     - shard-glk:          NOTRUN -> SKIP [fdo#109271] / [fdo#109278]
> +4
>=20
>   * igt@kms_busy@extended-pageflip-modeset-hang-oldfb-render-b:
>     - shard-hsw:          NOTRUN -> DMESG-WARN [fdo#110222]
>=20
>   * igt@kms_cursor_crc@cursor-64x64-onscreen:
>     - shard-glk:          NOTRUN -> FAIL [fdo#103232] +2
>=20
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-glk:          PASS -> FAIL [fdo#104873]
>=20
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-kbl:          NOTRUN -> SKIP [fdo#109271] +32
>=20
>   * igt@kms
> _frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-pwrite:
>     - shard-hsw:          NOTRUN -> SKIP [fdo#109271] +75
>=20
>   * igt@kms_plane_alpha_blend@pipe-b-alpha-transparant-fb:
>     - shard-kbl:          NOTRUN -> FAIL [fdo#108145]
>=20
>   * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
>     - shard-glk:          PASS -> FAIL [fdo#108145]
>     - shard-apl:          PASS -> FAIL [fdo#108145]
>     - shard-kbl:          PASS -> FAIL [fdo#108145]
>=20
>   * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
>     - shard-snb:          NOTRUN -> SKIP [fdo#109271] / [fdo#109278]
> +1
>=20
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-apl:          NOTRUN -> SKIP [fdo#109271] / [fdo#109278]
> +2
>=20
>   * igt@kms_plane_scaling@pipe-c-plane-scaling:
>     - shard-hsw:          NOTRUN -> SKIP [fdo#109271] / [fdo#109278]
> +8
>=20
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-kbl:          PASS -> INCOMPLETE [fdo#103665]
>=20
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-kbl:          NOTRUN -> DMESG-FAIL [fdo#105763]
>=20
>   * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
>     - shard-apl:          PASS -> FAIL [fdo#104894] +1
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@gem_ctx_isolation@vecs0-s3:
>     - shard-kbl:          INCOMPLETE [fdo#103665] -> PASS
>=20
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-apl:          INCOMPLETE [fdo#103927] -> PASS
>=20
>   * igt@kms_busy@extended-modeset-hang-newfb-render-a:
>     - shard-hsw:          DMESG-WARN [fdo#110222] -> PASS +1
>=20
>   * igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-b:
>     - shard-kbl:          DMESG-WARN [fdo#110222] -> PASS +2
>     - shard-snb:          DMESG-WARN [fdo#110222] -> PASS +2
>=20
>   * igt@kms_cursor_crc@cursor-128x42-sliding:
>     - shard-apl:          FAIL [fdo#103232] -> PASS
>=20
>   * igt@kms_cursor_crc@cursor-256x256-suspend:
>     - shard-apl:          DMESG-WARN [fdo#108566] -> PASS
>=20
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-hsw:          INCOMPLETE [fdo#103540] -> PASS +1
>     - shard-glk:          INCOMPLETE [fdo#103359] / [k.org#198133] ->
> PASS
>=20
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
>     - shard-kbl:          FAIL [fdo#103167] -> PASS
>     - shard-apl:          FAIL [fdo#103167] -> PASS
>=20
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen
> :
>     - shard-glk:          FAIL [fdo#103167] -> PASS
>=20
>   * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
>     - shard-glk:          SKIP [fdo#109271] / [fdo#109278] -> PASS +1
>=20
>   * igt@kms_setmode@basic:
>     - shard-kbl:          FAIL [fdo#99912] -> PASS
>=20
>   * igt@kms_universal_plane@universal-plane-pipe-a-functional:
>     - shard-glk:          FAIL [fdo#110037] -> PASS
>     - shard-apl:          FAIL [fdo#110037] -> PASS
>     - shard-kbl:          FAIL [fdo#110037] -> PASS
>=20
>   * igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:
>     - shard-kbl:          FAIL [fdo#104894] -> PASS
>=20
>   * igt@kms_vblank@pipe-c-ts-continuation-suspend:
>     - shard-apl:          FAIL [fdo#104894] -> PASS +2
>=20
>   * igt@prime_busy@hang-vebox:
>     - shard-apl:          FAIL [fdo#108807] -> PASS
>=20
>  =20
>   [fdo#103167]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103167
>   [fdo#103232]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103232
>   [fdo#103359]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103359
>   [fdo#103540]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103540
>   [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103665
>   [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=3D103927
>   [fdo#104873]: https://bugs.freedesktop.org/show_bug.cgi?id=3D104873
>   [fdo#104894]: https://bugs.freedesktop.org/show_bug.cgi?id=3D104894
>   [fdo#105763]: https://bugs.freedesktop.org/show_bug.cgi?id=3D105763
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=3D108145
>   [fdo#108566]: https://bugs.freedesktop.org/show_bug.cgi?id=3D108566
>   [fdo#108807]: https://bugs.freedesktop.org/show_bug.cgi?id=3D108807
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109271
>   [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109278
>   [fdo#110037]: https://bugs.freedesktop.org/show_bug.cgi?id=3D110037
>   [fdo#110222]: https://bugs.freedesktop.org/show_bug.cgi?id=3D110222
>   [fdo#99912]: https://bugs.freedesktop.org/show_bug.cgi?id=3D99912
>   [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=3D198133
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
>     * IGT: IGT_4920 -> IGTPW_2760
>=20
>   CI_DRM_5854: 3b59d4fb5ba3fb53a87c7a4495d81b0a25aa96eb @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_2760: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2760/
>   IGT_4920: dc36fa26305b832686616f3fadb1ef05f10f0f8f @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_2760/
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

--=-q94Yr+/rxsK6QyJtKphD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyj/hsACgkQVenbO/mO
WkkhxAf/Yqn/nw6yNwNMrSZTExd/dsvioeFuP6LP+mZ0rjEwvFUKUlSGHM33NMg2
Lzib/Fmdsr46uN5sfueWQAlyfRjOCTjrCRU271ftS/FKBSnCnbVExcLEebLp2Tlq
BCWlY0FT96zaeVPhL4SuiMeTKjX+XCtRqGnWrsHJ1ugDlIiMBGwCousrwGZu6nBD
Nx985OOGBpZaB8Yo6v+sElizx6b79Zmz5NTo+uknBx8mRiuklkwgrZFfCiR8mlt2
7YYC6zwn8kIj4pPj7Q3yGrfMzHCyJWUeKrE+di54LaZUZFtQ86DAH3a8scNHeW8K
Oxm7d73AomnLbCNMxtHaIAsbCwluvA==
=xemF
-----END PGP SIGNATURE-----

--=-q94Yr+/rxsK6QyJtKphD--

--===============1998174877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1998174877==--
