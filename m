Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4696E066
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 22:11:48 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 22 Jan 2019 22:11:45 +0000
Message-ID: <ed3e40375be2ba58bd280dd8ba972f3c8853a484.camel@intel.com>
References: <20190117235949.20026-1-jose.souza@intel.com>
 <20190117235949.20026-7-jose.souza@intel.com>
 <6de30fbf346d26d7b2b44e600add70a972962407.camel@intel.com>
In-Reply-To: <6de30fbf346d26d7b2b44e600add70a972962407.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 7/7] tests/psr: Add the same test
 coverage that we have for PSR1 to PSR2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1815235206=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1815235206==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-0wVo+oisb9i05VF41h9o"

--=-0wVo+oisb9i05VF41h9o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-01-22 at 14:02 -0800, Dhinakaran Pandiyan wrote:
> On Thu, 2019-01-17 at 15:59 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > The main tests for PSR1 check if hardware tracking is detecting
> > changes in planes when modifing it in different ways and now
> > those tests will also run for PSR2 if supported by source and sink.
> >=20
> > v4: Dynamic generating PSR1 and PSR2 tests instead of copy and
> > paste
> > tests twice.
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
>=20
> Series Reviewed-by: Dhinakaran Pandiyan <
> dhinakaran.pandiyan@intel.com>
>=20

Thanks for all the reviews DK.

Pushed.

--=-0wVo+oisb9i05VF41h9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxHlR8ACgkQVenbO/mO
WklsNgf/TSL8P0QCJ1HNAbR4ARRBXy0wz2lFlT/VN15APD0ujykfnzZZHl4y2gTT
lt0zLbebky3sMkov2D+nwxN2dqE3yvRgjqVA1BCH/AdXc2ZlcNHCXIEIGxALDTiu
lWpbSSUn48dK8AnpdNvORA7aPpKn4LPfsKPr32Dnlwamyv3ACSyw213l2ymD7ygH
6XxS5SEi/X80zsTr9fNcKdNofcOcrf5YSTgE+kvnYyM2Dvgbe03169jJKVo1LIu4
3oVFr0sFHxu4oT9LUNBYckE++UZ2TTakGh+mGZko5v9+916AKR5Qq49vip12AnHQ
9qdp5IykTSZfRhU5APhuWoaM5Yjr5g==
=XFEg
-----END PGP SIGNATURE-----

--=-0wVo+oisb9i05VF41h9o--

--===============1815235206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1815235206==--
