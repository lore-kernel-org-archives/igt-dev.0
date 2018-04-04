Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18D896E419
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Apr 2018 18:39:08 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20180306142112.29890-1-daniel.vetter@ffwll.ch>
References: <20180306142112.29890-1-daniel.vetter@ffwll.ch>
Date: Wed, 04 Apr 2018 11:39:04 -0700
Message-ID: <871sfuzuif.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] gtkdoc: Remove the build_by_default hack
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0786016171=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0786016171==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> meson 0.45 properly supports generated content_files. Except for the
> minor issue that we're hitting an internal bug in meson. I've made a
> pull request for that, but this needs more work:
>
> https://github.com/mesonbuild/meson/pull/3189
>
> Downside of this all is that we'd need to up the meson requirements to
> something like 0.46, at least if you want to build the docs.

What's the status of this?  I just pulled this to my vc5 dev branch so
that builds don't take ages, and it seems to have fixed it for me.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlrFG8gACgkQtdYpNtH8
nujYaA/+L4KJDN+H5l1lkx4NbPl/DEwykTJHluC3P/wx+Yb83N+YjrUi54JX3C8q
ZoxyHzdh/hZzKIlFn2fgc/ZmIL0T8iJ250LOAxgGKXhv77tYv5tI63LHT0dAW4Vy
IldApIRNHddYwB9LC85RbHGTX2Puh9eL/h2rhisvFztrw8JW6TU2rW4JFk1F632Z
gTLkM+QCktxBCsw7X2ya3Ve6eoOOBVHoeXi7xi9u7Zp9O4TChYBakuuPSMfaMevx
M8dnD/nw3Zro4K9ctEWYgENOgGZexhokZewcuccYm+n1ZGOw0rlfpTChCf+tdqj4
8rnPBxB9vbn/HbL/zeJDHEjehm27tkbCM4pBkSeI3N2Y7FHXvrYbWwpMOVP+HLIT
DWT2xD+ZipzEFdXgPqkBZDHN6SRo61IePXGt9e7G0SJJ+3oSLuOQZGM7bCMP3U4Y
thly5hsEwPtzwesPl+win5p9StuBBOiZfOOIMhuT6bhzVqAqVp0uZhYOyYbpQEOe
mfs8X4uqxr5v5DlThgVpWo9S8LhGdgLLOHXNxtj9P6xmY69fZdpcSlhgmrnHrbjJ
SR7GfTkSN5Yy+fuyBHTCFVHTvnjm41Lj5A1PizxoTlObahHOknXB+8D4FEKnBzQH
9tnfl4SezyCjaY795sHwcZwRgXCcIiTwr55j4gs1GssQJzXKdQ0=
=ddpT
-----END PGP SIGNATURE-----
--=-=-=--

--===============0786016171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0786016171==--
