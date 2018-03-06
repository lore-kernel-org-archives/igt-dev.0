Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 6 Mar 2018 16:57:02 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180306155702.2glbuoexynk2pn5w@flea.lan>
References: <20180305181416.12034-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20180305181416.12034-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Make tests run
 without pipe color management support.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0437835139=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0437835139==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="exlmx5nti7pfrpze"
Content-Disposition: inline


--exlmx5nti7pfrpze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 05, 2018 at 07:14:16PM +0100, Maarten Lankhorst wrote:
> Only try to set those values if the properties are supported.
> This fixes the kms_chameium tests to run on vc4 again.
>=20
> Reported-by: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

This works like a charm now, thanks!
Tested-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--exlmx5nti7pfrpze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqeuk0ACgkQ0rTAlCFN
r3S6Rw//e1adqvQZW52D1CUwc1MLbiXY3JlsqpqUTfJ8Uq4oZQ/wLuJn+Xe375Kx
Dvr2ONbL9aZQWICbE+xWJ7Vv8Z/coc3Il+2uxDYexP7afVgULTORZi08YguGnRH4
Y7hSb826pK+KlFKC3m82M5B2w89xunnqMCoqYsLQv1LpPzPFDqou/5fgWWF/1Pgu
cKaIMvNl086Y3lsicLw74T6P0kt+GgZbfnfTthT6cmVHZhl26BS5OAyYUqqSazbe
s2mz/miT4oDUmkmBxOFb77R0rwfJusue8xTxHWQp77+jyUtbgTXL0HxZnHrs5MKC
XTV/x7O46xhw2IGtKreknLN5g+jCnlU+J4D2eQ5UjC0braXwRzswi0bLu037AitY
T8QA+72vdDx8LmokUtUSerfqNXjyZO3+htAmg0aURF6+n/FMYS5wS8rZpAecpmEN
S9rSaiL65AZGuNSW8ZhhM7ztLTm3/IO9op9KI5/P6M7rULPg3JMRCcbqMSvUSY9J
o103LdANUCcZmJ+nP+2V7XozSbvqmW56Xdv83oNc8OGNX0jDP7GRXphNQvyqTah8
VwZxQ50AR4sJt7CWL8UiAyZw6nAqJ1A4i/FmNJX4u23seYim1qaw1bRWzI5+Pd67
gA73BJvzTduLIgPj/zsGyXuOqFamwMEuCbK6YmdFs9sTZmsLeu0=
=wQVh
-----END PGP SIGNATURE-----

--exlmx5nti7pfrpze--

--===============0437835139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0437835139==--
