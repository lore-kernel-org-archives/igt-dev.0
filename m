Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499756F031
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Dec 2018 19:47:38 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 13 Dec 2018 19:47:36 +0000
Message-ID: <ecbd57d3fbce574928208d3b0c86238e72dc2193.camel@intel.com>
References: <20181204230944.7753-1-jose.souza@intel.com>
 <20181204230944.7753-4-jose.souza@intel.com>
 <6ce3aaad562f8e3242dc7921de4baeab1f3f98ad.camel@intel.com>
In-Reply-To: <6ce3aaad562f8e3242dc7921de4baeab1f3f98ad.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] lib/psr: Make psr_active() only
 cares about PSR1
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1975713811=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1975713811==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-54er2YDe3pqg2Fcv2klk"

--=-54er2YDe3pqg2Fcv2klk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-12-11 at 16:16 -0800, Dhinakaran Pandiyan wrote:
> On Tue, 2018-12-04 at 15:09 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > PSR2 will have it own function to detect if is active so we can
> > drop
> > the sleep state search and also to make sure that PSR1 is active
> > lets
> > search for "PSR1 enabled".
>=20
> How do you plan to handle PSR2 in kms_frontbuffer_tracking or
> fbt_fbcon? Have new PSR2 sub tests for them?

My plan is have a PSR and PSR2 function to make functions really simple
and easy to read.

>=20
>=20
> Would it be better to have some sort of PSR state maintained in the
> psr
> library so that the functions know whether to test for PSR1 or PSR2?
>=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index eecee459..c6d6390f 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -37,7 +37,8 @@ static bool psr_active(int debugfs_fd, bool
> > check_active)
> > =20
> >  	active =3D strstr(buf, "HW Enabled & Active bit: yes\n") ||
> >  		 strstr(buf, "Source PSR ctl: enabled");
> > -	active &=3D !!(strstr(buf, "SRDENT") || strstr(buf, "SLEEP"));
> > +	active &=3D !!strstr(buf, "SRDENT");
> > +	active &=3D !!strstr(buf, "Status: PSR1 enabled");
> >  	return check_active ? active : !active;
> >  }
> > =20

--=-54er2YDe3pqg2Fcv2klk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlwSt1QACgkQVenbO/mO
Wkn2sgf9E1NUhWitRws6BMSOoPYuRdqBT+187Q07x4I+SPmKelZxUL0cV7gvDGOI
EqtW/uvD3fYHbRzit39KnrBTBCWypj13tUn65h3MUqxtZ9hQqqHAcZBo3mGFqfOt
59fBX3sM7pI/K4b7dVWKWjBWr6wdfIyay6Gt+T+dAuBmAJ3rCfwVkmsKvNPMs6Mx
RNihqplRIbpa4nxd3BSXk4jpETpVEt9YuQVSi8VRvKmAzaC8i0G5DzSmOTcO1SB1
TDz//ZCyclB4vpCgPqFOCroNpg2S9xc9qvLypx4O+Ef0lI8ZRkakQaANaymrbuYZ
TUznq0sHRSDfxSlF12KewmBvViM+kQ==
=XvIG
-----END PGP SIGNATURE-----

--=-54er2YDe3pqg2Fcv2klk--

--===============1975713811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1975713811==--
