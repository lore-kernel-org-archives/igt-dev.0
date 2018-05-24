Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59D076E01C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 May 2018 09:48:36 +0000 (UTC)
Date: Thu, 24 May 2018 11:48:35 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180524094835.4e6outrb62q67rdw@flea>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
 <9f9547ff1e6c772b3d332991fe865fedb0fdf9d1.1524555464.git-series.maxime.ripard@bootlin.com>
 <8a805e2bbc23868e94d488536eff38889550ed0c.camel@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <8a805e2bbc23868e94d488536eff38889550ed0c.camel@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t 07/12] chamelium: Use preferred mode
 when testing a single mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1551261694=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1551261694==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="exjytyflrkvgp6py"
Content-Disposition: inline


--exjytyflrkvgp6py
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2018 at 04:00:53PM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> On Tue, 2018-04-24 at 09:46 +0200, Maxime Ripard wrote:
> > The current code is testing the first mode in the connector list when i=
t's
> > testing a single mode. While this is arbitrarily chosen, it makes more
> > sense to use the preferred mode reported by the display.
>=20
> The rationale behind this decision was to use the highest resolution,
> that is usually reported first, but I think your approach makes more
> sense.
>=20
> What happens when no mode is marked as preferred though? You put-in an
> assert here, but does the DRM API ensure that at least one is marked as
> preferred?

As far as I understood it from the EDID spec, a preferred mode is
mandatory in EDID 1.3, which is the version used by HDMI, so we don't
really need to worry about this.

> If not, we should probably fallback to selecting the first
> mode as before. This would also make things safer in case of a
> descructive interaction with the mode pruning code, where the
> recommended mode might get pruned (although that would be very
> unfortunate).

That part would be more troublesome, but I guess the current code is
just as vulnerable to this. If we prune all the modes, even the logic
to take the first one will fail.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--exjytyflrkvgp6py
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsGinIACgkQ0rTAlCFN
r3R7qxAAgzsog3J0tTLnM4G2aDMkk1swx33p6Mh7wtCEeN47slEVDgX1wDdns0XW
fS/3v5CpCgpw+xnkkPJp5lAwfGI02P0ssXsfBItD/teQTQShv4cs7QHGApAzKk5g
Ycda/hCkZBLcfGJGLudWcDBG9HzHGP5Y+hn/czaZGXoEnLe4X9MdVXeP0wil2mee
vfon0ogzxAHwj581MFkvOjMHu+vrLNR3fCDqVWqK+m03K3f9jg/HmxoU9kDtUkwB
dGk2tLCeTzF7kGN6T6beA20v15KaFw7PLnhJbCKrYwNORFUiR3eBy/MQ1Fe9j5t/
4kaPUJ40fXACq3RStWTGutnU9/Mvyefs3mNHXwyT8hblLYLXFQKngs1LyFFh72BN
JeX/JoGldzHuYfYcEbCNOn4yLj2bvGLklfXe1U82IdVt3TB631VjqozWmbAe5pvc
zYeM0w0SXF9qqDIQ+9pYDgk10BGO9HutX+ngAffvZQU6shG0uM4YHrsBxzXOuP3t
wPPjIOf0giGmWcShAMDgFno4fb38DmCsI6X+FclErJvQt0rAtgV1Y0pLhle0xsb2
pA1dvoASuM7lGW4qBiL+xMnVd4rITwBoCWwGAI3u34ja+DpkOJwkkZAxZ93uvIPj
1frHOn5beM/aYhG1FYchAyNwqxsl6SKH0IiUKSV5hjVHABayZ8E=
=p6PQ
-----END PGP SIGNATURE-----

--exjytyflrkvgp6py--

--===============1551261694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1551261694==--
