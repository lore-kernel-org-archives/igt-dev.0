Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71A9089B9E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 15:41:58 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20181029081030.4041-1-daniel.vetter@ffwll.ch>
References: <20181029081030.4041-1-daniel.vetter@ffwll.ch>
Date: Mon, 29 Oct 2018 08:41:54 -0700
Message-ID: <87zhuw3gl9.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib: Make libunwind optional again
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0145327472=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0145327472==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Apparently it's really not great to require it for a bunch of
> platforms. Requested by Sean and Eric.

This series looks good to me.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlvXKkIACgkQtdYpNtH8
nujn6w/9E/fTbkuet7O3KKsHnghmnZTdkLJdoApYI1eqB+a1s0ZGMd5gCiMgnbuQ
Z09/IdgxHz/QnLxnRouPsiM8FAvAhtevYsNRN1nGByharQ7i54VL6Lp4oulYGW91
NO/Onr6X9frOD5hp7XO+mkZJNcK12xNzAXNDSJ9S+WR6usR2uIkRCQqQBtEmPQVo
bGA4jk+eR5JUpK3HFYbZ1UDrIWapndbBDdnvTch62ugcnnBVYhpMgIFi8a6Obkoh
oUlFEVdM9Qx0PHJ6iymzla+729q84M+ATADUwi1xurhblX1Gfi3eJ7wPYfu3WQPj
rUjdbRZJvTZGZPCY4n3MVitrc8bc6+8RRbTke122V2o0ruu8nVFMRYzeylEa3afe
QsOQgHYg3se8a7kc+87F/Kn89iRF+3N4IQ/S0dZS/GxSj5VcZ5gHihAYb3fM8xkA
zti09hG050zQlgPKneG9gQbBwRDRaLO3AabE5gdJPGRQkQHAPonEI3Gkl1ibVHhp
F5D90S8UVjUJzWdk05nDTJHOpAhYQUnfyVoWMaw4WDEp7cZOqGO4+GgSDk8J/cGW
oi4aYAUpvEKR3zmNCGZHlHSQYCtT2Fd0e/7Dxq/M29saCRoQFgFQd7q7BziZlIyL
JqX5xaxv8Drvobm3QXjUe2hE9c2c4qRpe6tLfAldedSYLVNYtO0=
=6Gj5
-----END PGP SIGNATURE-----
--=-=-=--

--===============0145327472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0145327472==--
