Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96EAC6E01C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 May 2018 09:38:53 +0000 (UTC)
Date: Thu, 24 May 2018 11:38:51 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180524093851.fxahblwahwksoxz4@flea>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <67ca95b67e6943d484521f98bbcf30290ad303ba.1524555464.git-series.maxime.ripard@bootlin.com>
 <355775d688f6e129c305d901f8d7b24ff465dc82.camel@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <355775d688f6e129c305d901f8d7b24ff465dc82.camel@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t 05/12] chamelium: Make
 chamelium_calculate_fb_crc private
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0690518033=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0690518033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7fjhlodju5ibkuqw"
Content-Disposition: inline


--7fjhlodju5ibkuqw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2018 at 03:50:33PM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> > The function chamelium_calculate_fb_crc has no user outside of
> > lib/igt_chamelium.c, but is still part of the global functions exposed =
in
> > lib/igt_chamelium.h.
>=20
> I don't think the fact that it has no immediate user within IGT is a
> reason to move this function out of the public API. Is there a specific
> use case that justifies the need for this?
>=20
> The way I see it, chamelium_calculate_fb_crc is simply the synchronous
> version of chamelium_calculate_fb_crc_async and although its use is
> simplified with helpers, I think both functions should be public on the
> same grounds.
>=20
> What do you think?

Fair enough :)

This was a spurious attempt at cleaning up, I'm fine either way.

I'll drop this patch.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--7fjhlodju5ibkuqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsGiCsACgkQ0rTAlCFN
r3QGcBAAiESEIJcUbaKbCph73xGAKJC2lP8juM84S0jB1pQncLjvQQvvl2PEhlhB
COQVY97qHA+anJTDHgW1J5s5CqA4ptoDZCbIvDt8xlXDCiWDIbdLRqPmOHm+vDxL
UyLFbzDa7dLij/08WDA2MS+wKg/qD7BJt7b4RI/Et+o6K717nOBVGL/jqlliMeGo
X9PAt4OaH1mOGJUb7OxaEqBl9wGme6R8il7Lo9mRbgV9naP1xoEtkzuvHqS9xm47
SuMDb2/XpsNrBZH76UeLRYLZW/6f1rfP0If1RGzMeWnBuw3Mxs+d4kY3alr9Kupm
dm9x3nCkmSOgZ2NrqR6CDvyoKcg5aeyS61XWrOKtXXWBOccYiK2rGhQIc5uYV3qu
FHpNbLHnQ6NuQNYecc7Jz2pCxOPakVW3r25hwlzPSIlKEKlm9yfG2e1Oehcmd5RV
sZkeTP2LVLI4NZxvCnh0OwLC+bgRBbLdGqA+bgoiBZYsVR1owunFedTI2TK2kyA1
NIeE40/cntaIRdlzIlYKESQWgUA02OyQsPykxN5oqQDRF4YOl3MupOIY/YeRdrWm
Lx+e7HGs/PY1axT3mp+hUaOJ+BtBUv4hKUPVU8yrcOfNME8V8e/eEh5YVzP9DLux
McxcHEflqDeVXaOO91RNfOnZhgShSAN4P9pori1DhI6OjsnUlyg=
=fR/i
-----END PGP SIGNATURE-----

--7fjhlodju5ibkuqw--

--===============0690518033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0690518033==--
