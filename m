Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id B42E26E3E3
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Nov 2018 22:04:15 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <87lg5da1ho.fsf@intel.com>
References: <20181127204603.24042-1-eric@anholt.net>
 <20181127204603.24042-2-eric@anholt.net> <87lg5da1ho.fsf@intel.com>
Date: Wed, 28 Nov 2018 14:04:13 -0800
Message-ID: <87k1kweu5e.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] v3d: Add tests for hanging V3D
 using an RCL.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1086360713=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1086360713==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Tue, 27 Nov 2018, Eric Anholt <eric@anholt.net> wrote:
>> +/** Creates a simple CL consisting of a single NOP instruction. */
>> +struct v3d_cl *
>> +igt_v3d_cl_create_nop(int fd)
>> +{
>> +	struct v3d_cl *cl = igt_v3d_cl_create(fd, 1);
>> +        uint8_t nop_opcode = 1;
>
> Not really reviewing this, the indents with spaces just caught my eyes.

Fixed.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlv/EN0ACgkQtdYpNtH8
nuh+KxAAr7BwRBOSFgq9aHCJMn2euJiN2c+rImuPsZoS06brLGoyydFnZYh2/rUd
JIdxkLpZosEJmNK3DZNASfeheCTh+5Y5H1nRHNnDBcRJ118mpokAVzdSE7FGQFVW
glStb8e1Ci56J0V4ZxqT24Wadg0HdHRqFXXySarlHaG+QDItfCAn1mjP24DaOAJE
ygX04FNRgcgT+Db5u9ixg+64TaA33aa1p7IlY5J/vo7fk37ogpbwv946odvjizrJ
+7LfD9rzHIfL7eB6ODZ2TlAVrWhJ6sc/r2R3SJAvZwakjfaG87jc4SYT2rDBl7q5
fFn5ZfSbitveKzWglYk7BhL910OFJaLSGvT4PcMDaL0wlg9EJwqU/JiHr9tVUn5E
kJHjtPj44lqgo4AWZ2pfJuGAyQKbFzrpJq+fo9SIFCGA9qAgK0CHghzq74ZYEUxO
5rKq4nQ1Q76VoWzITgIzjUp/QHwh09Nw/JxSc8RG5MCESJmFmOnb6ztjmZIE+66S
/W2Xa8/NhxjcWyL2DA1xCtCKoW9cNUfx2qw/upaEXL4kEyV4EZgKGL5eye8/rxDN
eLa90zVovsJsmQ2d5yzNjMN0ep4l9b7geO/ktcW3GXTzYwZZb2y6d7bbEHRAJRie
A+lSEqi2vReEH+FOZ3qk3lWFM+rqSu3ZzqnBcxA+e9rQjoneQyo=
=Pc4H
-----END PGP SIGNATURE-----
--=-=-=--

--===============1086360713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1086360713==--
