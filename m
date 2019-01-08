Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD6E6EF59
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jan 2019 13:52:36 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 8 Jan 2019 13:52:35 +0000
Message-ID: <f09a0b0790196a0d873698dce8dfe750d6628859.camel@intel.com>
References: <20190107191056.22759-1-jose.souza@intel.com>
 <154689350223.27300.14661004641004582835@skylake-alporthouse-com>
In-Reply-To: <154689350223.27300.14661004641004582835@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib/psr: Add a macro with the
 maximum lenght of i915_edp_psr_status and use it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0416391389=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0416391389==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-cKYkO7DVakLpBO9WRaYk"

--=-cKYkO7DVakLpBO9WRaYk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-01-07 at 20:38 +0000, Chris Wilson wrote:
> Quoting Jos=C3=A9 Roberto de Souza (2019-01-07 19:10:49)
> > So every function reading i915_edp_psr_status can allocate a buffer
> > long enough.
>=20
> Or just use=20
>=20
> char *buf =3D igt_sysfs_get(debugfs_fd, "i915_edp_psr_status");
> ...
> free(buf);

In some places we read the this debugfs several times per second, so
not a good a idea to do dynamic allocation.

> -Chris

--=-cKYkO7DVakLpBO9WRaYk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlw0qx0ACgkQVenbO/mO
WkkHTQgAk06UlTq3EExFKtbAmsfzjZ4y9/kmOpTEyFhYQCgBv0GeEt+l/AZ7cEDs
V/nWFR31VQdyYUz49B0WCg0usUUXOWbLKMU3tfvHUeZaeMF7ba3GEHTNLuWzd3wo
O75Ly3qd6C5bLw3kBZ2/LRBgNnzkdX7XHzZFWwCYaYAAt3Id82wjcFwn9GVl3fyP
uDTSTUJfPxE8oMok6d8l+Ch1zxwt0XrKkxheVL/GHOKUX9iuGtgdPQO1mPwW4ovm
4kQC3K4ch9509RMoQCYeiya6tg52GjkCAmJdgH7BcIRDuGj3PBjO1vpNeG5astYk
R/KQWBSqQrw66enT/ech2uXaY5/dHg==
=p4T4
-----END PGP SIGNATURE-----

--=-cKYkO7DVakLpBO9WRaYk--

--===============0416391389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0416391389==--
