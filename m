Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F7696EDAE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 18:50:33 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20190122134215.28396-7-daniel.vetter@ffwll.ch>
References: <20190122134215.28396-1-daniel.vetter@ffwll.ch>
 <20190122134215.28396-7-daniel.vetter@ffwll.ch>
Date: Tue, 22 Jan 2019 10:50:31 -0800
Message-ID: <87o988zfuw.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] automake: Remove VC4/V3D build
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1908770937=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1908770937==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Eric is using meson nowadays.
>
> Cc: Eric Anholt <eric@anholt.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Eric Anholt <eric@anholt.net>

But, why keep autotools around at this point?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlxHZfcACgkQtdYpNtH8
nuittA//UxnEM6piwjaudzJntJGhTDTmw6iTOFPafNLlrq7+ho225VM/wjwTjWBa
5f29rScehznR0Rxb+uk/db3VBh6dJ7KqrnJgtCclBbZaXGwXzvNnNX6WBOSkEDut
7OFYJQtpxDUHtJ4sn3qMuW24JRJY9KFGkl2ZKtVvz1vSPkKIUyMgFlwaMccmB0AR
ZM2KSGTMp/Sbg7qZkH/kfe9l+qk4xO28Ihfj+CC4vwx+OMtg86gd1k/25F3avap6
T0PSYCWNjH/HqkoB/yoXR6gzsph4QDbKft58WcD0zpTAwoghkMFncFeF0hmlEhq7
btCfzjJWSd/mdr5+bDGYRIO3wTAnfUtAWAQ1Atl25PQmqZkoxXiB6tpoEmn6e35b
QVM2o6nIcn2Eby6k1JsV8aDgPIJFHfcNyQAY4TLJBM5ZBj5eBo6ykV1X1AGrJ8VL
TTK7sq9yRKyWI5KEH2z9msaaWN999l4s4IP617MNlAzgvR/th+BRmvixPpNMGuzm
EUY1nae91M6T1XdqYwwJaFUqCJ3wcJc73w83XT/ZEppxopj6G/VZzU3eGOloHeZw
s5pRgDUWy+uVMEvHM9PLrr/Z4n2pfYhY1HMsFfkr0coTHBWuEmcZhBQ70SBOeHlS
unErtp6HmR5kC2whSE/UIWp/9eQ+XWEOgsJZEd6RtI9k1KiC5O4=
=+YeE
-----END PGP SIGNATURE-----
--=-=-=--

--===============1908770937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1908770937==--
