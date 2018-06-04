Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA3A56E00B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jun 2018 22:20:28 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <d45f97fbbbe55be0af14abbeb65079464b000cb3.1527171699.git-series.maxime.ripard@bootlin.com>
References: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
 <d45f97fbbbe55be0af14abbeb65079464b000cb3.1527171699.git-series.maxime.ripard@bootlin.com>
Date: Mon, 04 Jun 2018 15:20:25 -0700
Message-ID: <87o9gq6vo6.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 01/11] tests: Add vc4 test suite
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1795845638=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Maxime Ripard <maxime.ripard@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1795845638==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Maxime Ripard <maxime.ripard@bootlin.com> writes:

> Add some various test suites relevant for the vc4 drm driver.
>
> Acked-by: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

It sounds like there were concerns about the format conversion
functions.  I've merged this patch in the meantime.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsVuykACgkQtdYpNtH8
nug6zQ/+NayHlFPYYBmGVItdESsjwTahya/fI206rnLAjBVXrxXB08hcfqpKilIQ
67qdf3BAu5yGkWN8lvp1SaDHXaO/I8TPaZZmmmml3KbK10PBSTawswlCWXbve5wi
u2EGv2OjX+LDZ7bL1X3Er+YQxTwFJDPO0LOmeyob6GnnUPdgsojwBhDvBJyy4dTw
PHbwgCyZFKmbK8Dz5o9zljhyBPtNSjPVLt7B7rV0SdmXVFN/TrHFeqzxGqdQQQjz
IpLo0MD50nWjsrW1Xo2D5Cq130ww7rdnyPf+6r6JHmFYDWp/CcK2MKYYNAlI7m11
J7O3j63w7tKFrojo1FLVeKD8+SBFto6SQ4M1ZNF1qKeDjgL9kzeuzjXUf/Bl5Cr/
Hd+v0/wMPO6uZfW6Rmfgd9AjYVwZYOA3lQsvWtHjW/X3sBNiBocawElgxjP+M5iG
P7e1KieHP5pojT0Mdvbj7yhfy4CvNpx2MmFiQhd15sm2+HoiKJEeWD/ZCeqIqcUd
ttl69WnSq6SLANaztn9ua9R0qWQB2lmuwra1Akld6NcU1nE+aPjN9R+fGlha2h7E
ok7ZEBAIk7CrNYFAtLPCJHQNJ+ftg8dYqXvPwPi496aSpvbAQrdDXavcF7x7+ETr
O90mmfpAKb48xKCf+er4DGzOit+OO4U9LF7fp566NWEv31FuJJs=
=DBaO
-----END PGP SIGNATURE-----
--=-=-=--

--===============1795845638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1795845638==--
