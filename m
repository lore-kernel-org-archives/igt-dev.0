Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 149696EC2F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jun 2018 22:17:20 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20180430092848.10830-1-petri.latvala@intel.com>
References: <20180430092848.10830-1-petri.latvala@intel.com>
Date: Mon, 04 Jun 2018 15:17:17 -0700
Message-ID: <87r2lm6vte.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] New runner to rule them all
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0735843530=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0735843530==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Petri Latvala <petri.latvala@intel.com> writes:

> A new test running framework to replace piglit; Refer to patch 3/4 for
> a more thorough explanation.
>
> Note, building it with autotools not done. Only meson hooked up atm.

I gave this a try on raspberry pi, and it cut the test runtime from 33s
to 17s.  Thanks for working on this!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsVum0ACgkQtdYpNtH8
nuiKmw//bp0LxF9vfO3W8OyfRzFIPmr2nsXo0I5CjXEvS2fG9lZy+PC+lWvC/b/U
cIDDN8Orr92tOQID6A51x68FZv5ivHWk8g8b3yllMQdjigkQB2hYhuPYCeme7hhR
+ZtTPNMZR4xaaQmenJhwUJVnRbrFeDqfmWJYObJ+b5keVgspvc2E5WP5rF0UXYij
szBqobsltksiIM2wH153aXT1REPF8HILchZsuZIM9yPu8OEehz3MspacT67cklhl
BsZMk+H3wEInQ8aNxbPiZjxyeff/ohGu+w50XLQlT8sE2L5ywY1qvEPfSOvxhNlR
KUJkLTW9OnHsrAGIT2kuItb3hIPY6qvlxKjxj2Hhgg/F0gILz33maf73nCJbwYl8
AKbP6s9wt8Me9CQ1peyMNZsNrP4Bu+GuHsZQvl/R9B8yIwX4wIkgpcxxitrOGHGY
go8q6ClTjDzkM1b5bV9tCFBKcZsrXXarccDuVHZ35kHVIEW+R+dDiLnqHdDDdakX
f50jMYsMDGMQ/Bx/qwVFCM6T3ueyRy4AWmFBxR8BGI+dDlw/mYYyysCNo96zyCfe
SsJxapJ1maGB3F2ruOWqa1m/mhzkMEcdjD5U73BCXQTG53HBOxAo0Ta6kHkw4BUW
LimyzYmNT3hGVJagjvsDry/L9XuC2Lq2GW/ymRpDog0tlF8/RN8=
=RaV3
-----END PGP SIGNATURE-----
--=-=-=--

--===============0735843530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0735843530==--
