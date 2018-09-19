Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FE8689259
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Sep 2018 12:46:00 +0000 (UTC)
Date: Wed, 19 Sep 2018 14:45:48 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180919124548.3p2shm6qarmibpv3@flea>
References: <cover.cafc7aee9c887562e8432741cd1f0543ff92121a.1536655647.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <cover.cafc7aee9c887562e8432741cd1f0543ff92121a.1536655647.git-series.maxime.ripard@bootlin.com>
Subject: Re: [igt-dev] [PATCH v7 00/14] chamelium: Test the plane formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1686007756=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1686007756==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s4ss2bh2bkzq4hzl"
Content-Disposition: inline


--s4ss2bh2bkzq4hzl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2018 at 10:47:27AM +0200, Maxime Ripard wrote:
> Here is another attempt at a serie that aims at starting to test the plane
> formats using the Chamelium over the HDMI. This was tested using the vc4
> DRM driver found on the RaspberryPi.
>=20
> There's been a number of changes from the RFC thanks to the feedback from
> Eric Anholt, Paul Kocialkowski and Ville Syrj=E4l=E4.
>=20
> The series now relies mostly on igt_fb, with some decoupling from cairo a=
nd
> a bunch of new helpers to aim at being able to convert igt_fb to arbitrary
> DRM formats. The list of formats have been extended a bit, but is quite
> small at this point. We also rely solely on either pixman or the existing
> format conversions functions at them moment, and we allow cairo surfaces =
to
> be created for framebuffers in a format not supported by cairo, through an
> intermediate conversion to RGB24.
>=20
> However, since it's now abstracted away from the igt_fb users, we can
> easily add some routines to convert to additional formats if needed. And
> since the code was so close now, it's been integrated into kms_chamelium.

Can we make any progress on this?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--s4ss2bh2bkzq4hzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluiRPsACgkQ0rTAlCFN
r3SwcQ/8D6afznYKOLcUg8baA896KzRKBl0HUkWXwOGPLPRsTMyOpttdAkZbwvFo
GrDvuGAtfk4VIRznHugtQ0n5Fwu5ChZsAk27IqvnoVFRv3KzzTBcbNJo9Ihjfx3/
bZRRyaWFUB0CsokNEH7cwvp3cCmJ7DWEE7bhvKnL4+o5YdyRlZylF9BapJuvXlWz
z4omkVAyaTh6pzTA8l2CvYke0q2goHhFA6SnOj49yuTAwcpbsi47v0tv+33A91GO
mlWw2zw74qsBQ23XWRNGU4eVlzKDAysRwR5vAq+XZHJSKVhLwEPl6POSr0kkyowD
Xfr4VLgfGK4ahkfPfcYdF3e8OsrjnrQ8pYN3eJnl+KrCcLwBM5q1EdAjCfn0AiKk
JbVGXBXebeho01hS1/gwIK+Za/spokH8Qlx/m0NGXg/qI2oeijWgzj3XwsVX1ZSg
++Qv63yh9kvdLLHZoO8PuTJNNHqYvBjbKbi408NVYkySLOp0kooKbFc2KDM6PapO
9Sdgc2a1fevVxxvayAP27bz+1fR0cKZUpGZFetGrkMl2e0wfWuLryThcsjETNOTi
TqmSj6rmD4lATv4va1VzcyMrlcqgOYjnP/7xr1gfFQN4SoDPjyd+TObk8ugMe3O6
4z5XHVZu9zXHGMG8R11ExAqPTkdCpgF49uy85UCoerrMTP1+47w=
=VKPq
-----END PGP SIGNATURE-----

--s4ss2bh2bkzq4hzl--

--===============1686007756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1686007756==--
