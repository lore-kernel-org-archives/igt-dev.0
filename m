Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 9 Mar 2018 14:08:27 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180309130827.sylicmi5uuo6yzru@flea>
References: <20180305181416.12034-1-maarten.lankhorst@linux.intel.com>
 <20180306155702.2glbuoexynk2pn5w@flea.lan>
 <cffd6bd7-0292-8aeb-361d-5db449dea443@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cffd6bd7-0292-8aeb-361d-5db449dea443@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Make tests run
 without pipe color management support.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0128547035=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0128547035==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hiy2k2ys435njmzr"
Content-Disposition: inline


--hiy2k2ys435njmzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 09, 2018 at 12:55:24PM +0100, Maarten Lankhorst wrote:
> Op 06-03-18 om 16:57 schreef Maxime Ripard:
> > Hi,
> >
> > On Mon, Mar 05, 2018 at 07:14:16PM +0100, Maarten Lankhorst wrote:
> >> Only try to set those values if the properties are supported.
> >> This fixes the kms_chameium tests to run on vc4 again.
> >>
> >> Reported-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >> Cc: Eric Anholt <eric@anholt.net>
> >> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > This works like a charm now, thanks!
> > Tested-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > Maxime
> >
> Can you upgrade this to a reviewed-by so I can apply this change?

Yep, of course:
Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--hiy2k2ys435njmzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqihz0ACgkQ0rTAlCFN
r3ScERAAga7+6IfV5EFKwf8MjEd/nIVSCUZclfccYbNIcaiGvFkFjAvogpowN2Ja
wbTfHV0NRq+kojok4PqoDUOjQI4H5CT2kvffcRxz8QPM5Ls+2RapznRoL9yahyPT
lK23OhhQoD97u5KGUrGW12oZNW7ZFYHOYeFwjYI5Tf1bxFHapJr/eYO4mUNNaRSP
i+teivbg/aMhb/gKIvwSjKvO/9rkkbuYt20nPaIzMx0vOeYPTADcRUcockvn3Vlz
hH4WngKVax6UOzvsmLhGd51bxdrtEj3O98YOOzqDr41V8oVXOkmKo8USXbsukII/
6sc30+WDiZ+P9A2iaqDGJ41x6RGv+TxmfcQRsdWwfV4CUGwVVRzpvo0BZt4/etUg
DwHe0cPjKnjV9AnKS8Wne4jpZJPHSJFmT8jcA5iouMACJdYsGDW9lSjETth2DIeX
YJXFrzQoX+DwnHiWYV5CvQvMawIjOkWIe+3mKb/G4Vlgtp8edODOAjrs+Lcaw7nD
oJQm4zKyTB9PcJgVRF3wpAWLE0FlWD4gJV4ujHwOd5Ql7j9PRy9l9mwvyA3bI1Ro
Nf9/RmuALGUJXqBdPoSO2PKQyNFMvCaMR7xyuLsV4iuD7HES7yNjdE4jgpNv6uEb
Jwr3aFatddQck3VyiDPSsj5K6x0vyOLbicd/gk9mG/bRlh3aar8=
=3By+
-----END PGP SIGNATURE-----

--hiy2k2ys435njmzr--

--===============0128547035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0128547035==--
