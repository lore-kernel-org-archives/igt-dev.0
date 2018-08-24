Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8ECD6E645
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Aug 2018 08:00:17 +0000 (UTC)
Date: Fri, 24 Aug 2018 09:59:59 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180824075959.emietojbdme7d7tl@flea>
References: <cover.85e5bbe6ef5f0fd420e1fc21fc248471b98481e5.1532596850.git-series.maxime.ripard@bootlin.com>
 <2758e622f4a05d69f984bb3439af49823f43d4fc.1532596850.git-series.maxime.ripard@bootlin.com>
 <87r2j7rzuh.fsf@anholt.net>
MIME-Version: 1.0
In-Reply-To: <87r2j7rzuh.fsf@anholt.net>
Subject: Re: [igt-dev] [PATCH v4 10/13] chamelium: Change our pattern for a
 custom one
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0753488873=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0753488873==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gor7rmtrggvg57k6"
Content-Disposition: inline


--gor7rmtrggvg57k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Thu, Aug 09, 2018 at 02:31:50PM -0700, Eric Anholt wrote:
> Maxime Ripard <maxime.ripard@bootlin.com> writes:
>=20
> > The current pattern being used is the one generated through the
> > igt_create_color_pattern_fb.
> >
> > However, in order to deal with multiple formats and the upsampling /
> > downsampling issues that might arise from converting back and forth bet=
ween
> > formats, we will need to have a pattern with quite precise color values,
> > and without any shades or gradient of colors.
>=20
> 64x64 blocks of color seem pretty limited, and might miss tiling issues
> for people -- would the previous pattern be worth using for 1:1,
> possibly non-format-converted cases?

I've changed it to use the previous pattern if we have the same depth
(and therefore won't have any up/down sampling issues).

> > The easiest way to do that will be to only use values that would have t=
he
> > same part on the common most significant bits (5, to deal with the most
> > formats) and have the same bit repeated on the least significant bits t=
hat
> > are going to be dropped and / or padded when converting between formats.
> >
> > Pixman will fill the lowest bits with 1, and our hardware is able to
>=20
> Let's specify which hardware here :)

ACK :)

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--gor7rmtrggvg57k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlt/uv4ACgkQ0rTAlCFN
r3RG2xAAi30eJpVMEk/nNfCJTHSK9BO3oad0C6GG7nsxm4tM8pXVYtIoh5OQSLPR
vXYkvdXfNrFOypMl6TlxtvN00QTUBIwojp4Kr0gfT2etRB6IUZU6UWnMPy5kTS9l
lhMct0/sm5xTs4PyUGfIydCJmUB13IzT6rwtqJ5YkNuoLsxP5r68V+j0d4KZ82Mm
+RO5riJRuEPcNa8vMuy8yHxptTH30zvd1lgebFp5oq+/BKx4EQUfER2V8irMfTgG
L21KMCSGlxRrKHqxkjmYBW/dmcAzj/RDBkh8JSa+rzuNnD6jFdjmh8AwnP8tXKmD
RjshhH3ZNBEiNbRAvP5toUUvo/HLQNL9J5DN1UIP99K0TVP7gBRRORwOaTMr9KSO
NGpH8zEHYCr8yi438OqaQ8QMeWAfBeBdM1RKBni+K2OqOkgkSL5A8zNgj4jJgxCl
ZiRxZeCFMeOpXJ66IDZO/wFBthEVdOF3W7u6B6cpKkm3qpaclBgfIKWCVnubQEmu
tjzUPExS3N2Ed+Hp4z1xsOhA15uOnl7+6zDVFpEXE+7imwySsUjwFbkgJEZerqb/
ZjnYQZr6hdleNfyjd+xaL7Ao6Zh8x1eXPT4dX44GB66xP2ZR+u7YKemEHo5boacm
iOV1xGYFcb2sdNA6mAZbjoJDZuF3XkTQbESkf2rkXxTsffffb5Y=
=FEu/
-----END PGP SIGNATURE-----

--gor7rmtrggvg57k6--

--===============0753488873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0753488873==--
