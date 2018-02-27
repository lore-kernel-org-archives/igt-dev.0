Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E9E06E0FD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2018 23:29:07 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20180227215040.11297-1-chris@chris-wilson.co.uk>
References: <20180227215040.11297-1-chris@chris-wilson.co.uk>
Date: Tue, 27 Feb 2018 15:29:04 -0800
Message-ID: <87muzut3jz.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt] lib: Provide an accelerated routine for
 readback from WC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1807891086=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1807891086==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Reading from WC is awfully slow as each access is uncached and so
> performed synchronously, stalling for the memory load. x86 did introduce
> some new instructions in SSE 4.1 to provide a small internal buffer to
> accelerate reading back a cacheline at a time from uncached memory, for
> this purpose.

I think without a _mm_mfence() before the movntdqas, you can get stale
results from movntdqa's little cache.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqV6cAACgkQtdYpNtH8
nujMZQ//WoTmzbZZR1AqbyfJzYCFDODXT0Iz8GfNEZlzceoY7P1//7o6IN1IBmH0
7HtrWQ6NcOF+l6iINxUGd8jAppXAp3we8y5zTY27xhR4hJUfMLD3Sy/GsY9g95U9
bwGcvfSF9jCQGH8H3K0zkLAGdBErNbjEWJL/jSTD1IB9BL+KOq2fLQI/7rFNDgSG
Hu5D5tuLD47ZPHIAsSVy/e9rRWBvwLSkKFZ/bO3u6D4wQ+Ws5rJSOJ34TWThEWeO
xCLmt9TmlERuQzTW2dqh7IpTue/ZGcXfKvrswuqxpi/pTRb9bUSSjxNZCI+62NKl
+iWmm7ApHfr93PNsOOZMM7huKX9zf6LriidJJLBKxOcoRC/j8Qu/Nsu25aGFADCR
nohFL6l8jrf5kkcxRoLZWO9j9iBxlkx55PBibI8C060ajzlYYWu6RXSAR2St5ySd
RmBZauAiV6FMFYx9ejTS343xyyd/RQEd+kyN3Vb5jGF++M9uT/QVXiLacVVMGPJ2
jDVQ/fasaN175kOoguncmTLS4sBx9x7BEE2+zdNBeOLaaDnMT/y+SpUVSlmFhNpk
VBnfRb9OFukdwQLYPqGFJXhwvCqdrWDZ8PceGdkItQvdqXY5KtiX43g11mUprL2F
YRdNZNits5qP+2eAFrGaEfTQB+2RVjh1kotbwQAjrR/XdUGh/TY=
=rHtF
-----END PGP SIGNATURE-----
--=-=-=--

--===============1807891086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1807891086==--
