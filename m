Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id C80786F18D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2018 14:52:04 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20180223111058.30973-1-petri.latvala@intel.com>
References: <20180223111058.30973-1-petri.latvala@intel.com>
Date: Fri, 23 Feb 2018 06:51:58 -0800
Message-ID: <87zi3zlpwx.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] meson: Don't build docs when
 cross-compiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1554998756=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1554998756==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Petri Latvala <petri.latvala@intel.com> writes:

> Building documentation requires executing all test binaries to produce
> their respective description texts. This can be a very time-consuming
> process, if viable at all, when the target arch differs from the
> host.
>
> Don't process the doc directory at all when an exe wrapper is
> setup. This avoids the runtime penalty when the target binaries are
> executed through qemu, but leaves everything as-is when the target
> binaries can be directly executed, like when cross-compiling to x86
> from x86_64 host.
>
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Eric Anholt <eric@anholt.net>

Reviewed-by: Eric Anholt <eric@anholt.net>

Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqQKo8ACgkQtdYpNtH8
nuj5IQ/9HTCZAEstf6zN8++/3lCFf0HvdsZo/CTxKN2q3UO5pNa05VRLVA53Y5qz
AllBZFuw7Jbd1n59hDK5FnsKVL4ZuT4WZuP0Ck0xzRCvzYlH9pkweGMQCRqSZzvK
NH4+C7KbXN2TiYL7lCvRuRqef+0cWVJUecKhBa92XD6+UoacPKzfV4PJFyQzh4Cl
9TXoa/vDSI4LwWB/OZuN5f662sqrOfSRGKKuiLVjj/lg+GamZW1tXJx4CtxRm4qr
qzAfna2TvQj0CytoP4z2S1xZgRNPpFVmXVyDezGfUHoCAqNu5auUSDOZSAGRvkZR
BiBDjwpCYk1PoFx4VkTydpL7X9zuIMEJCQr0aqALq9vh6OA1sRsV9N4I3MzRs6ol
a8rcjpEKBTfWMFZyOWchR7LIrkehCwv4+++qVrSuhd++xVyW4T/MH0QySV1C91v+
uoXUZVtvJz4OpxQCe4oydkRH+SsnCGa7QWDCpmEpmGb/1dqm0OddZeNoLXWTom01
GjfXpt1AIXPw8Ae4A2T87ymGLlf05mxeoUfvMELlm7V/yBkNVEKOBR+hlitjom59
AU49ByWZZXeN9r4En4pxNcENyEgzTh74uwUvQQpG+dN0eBPJnMRbU014/oHJk1eJ
U1JLdY9NKHOkunIpld1rSVRKMBjCX5QTtm60OBGG8FAv77Vj+Kg=
=ZRHe
-----END PGP SIGNATURE-----
--=-=-=--

--===============1554998756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1554998756==--
