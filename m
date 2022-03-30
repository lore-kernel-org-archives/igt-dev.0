Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8270510F56A
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Mar 2022 07:30:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 390823201F94
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Mar 2022 03:30:29 -0400 (EDT)
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <igt-dev@lists.freedesktop.org>; Wed, 30 Mar 2022 03:30:28 -0400 (EDT)
Date: Wed, 30 Mar 2022 09:30:25 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org
Message-ID: <20220330073025.qomf6qllegdfljtv@houat>
References: <20220328145509.2331195-1-maxime@cerno.tech>
 <164849452241.2846.12744785311234377100@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ym2ky56xhymwu2k4"
Content-Disposition: inline
In-Reply-To: <164849452241.2846.12744785311234377100@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgV3JpdGVi?=
 =?utf-8?q?ack_fixes_and_improvements_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--ym2ky56xhymwu2k4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 28, 2022 at 07:08:42PM -0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: Writeback fixes and improvements (rev2)
> URL   : https://patchwork.freedesktop.org/series/101159/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from CI_DRM_11412_full -> IGTPW_6839_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **FAILURE**
>=20
>   Serious unknown changes coming with IGTPW_6839_full absolutely need to =
be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6839_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>=20
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/index=
=2Ehtml
>=20
> Participating hosts (11 -> 7)
> ------------------------------
>=20
>   Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005=20
>=20
> Possible new issues
> -------------------
>=20
>   Here are the unknown changes that may have been introduced in IGTPW_683=
9_full:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
>   * igt@gem_create@create-clear:
>     - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6839/shard-tglb7/i=
gt@gem_create@create-clear.html

It looks like this test runner has a faulty hard disk.

Maxime

--ym2ky56xhymwu2k4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkQHEQAKCRDj7w1vZxhR
xe6hAQCPN8acv8wBIYvtenq69FR9IjtGhPnRmimpcVFn/xUWlAD/W5p/6GsUiJWj
Uu2xvMqm4xZPk2Yi7UBo4L21T5qjkQw=
=I+hl
-----END PGP SIGNATURE-----

--ym2ky56xhymwu2k4--
