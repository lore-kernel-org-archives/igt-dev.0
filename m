Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2562789192
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 02:07:29 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 17 Jan 2019 02:07:27 +0000
Message-ID: <586fcec8b35d9dfa501b8026a7a0412fc23f8e6c.camel@intel.com>
References: <20190112014607.13446-1-jose.souza@intel.com>
 <20190112014607.13446-7-jose.souza@intel.com>
 <1fefb333444bd5ad208445b4dcfacb85cb2cbc93.camel@intel.com>
In-Reply-To: <1fefb333444bd5ad208445b4dcfacb85cb2cbc93.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 07/10] lib/psr: Drop support to old
 kernels without new PSR debugfs interface
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0283863528=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0283863528==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-Dc7KNIeAy/lp4q7KaX2k"

--=-Dc7KNIeAy/lp4q7KaX2k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-01-15 at 21:21 -0800, Dhinakaran Pandiyan wrote:
> On Fri, 2019-01-11 at 17:46 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > The nexts patches will add PSR2 tests and for that we need the new
> > PSR debugfs interface that was released in kernel 4.20 so it will
> > not
> > break for any updated system and we can drop support to the old
> > debugsfs and the support to kernels without even a debugfs
> > interface.
>=20
> Can't we have psr_set(mode =3D=3D PSR_MODE_2) skip if the kernel does not
> support the new interface?

We could but why keep supporting old kernels? My experience of running
a newer IGT over a old kernel or on the contrary was always
problematic.
=09

>=20
>=20
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c | 35 +++++++----------------------------
> >  1 file changed, 7 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index c6638c2c..5cc0fbc2 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -73,27 +73,7 @@ static int has_psr_debugfs(int debugfs_fd)
> >  	 * -ENODEV is returned when PSR is unavailable.
> >  	 */
> >  	ret =3D psr_write(debugfs_fd, "0xf");
> > -	if (ret =3D=3D -EINVAL)
> > -		return 0;
> > -	else if (ret < 0)
> > -		return ret;
> > -
> > -	/* legacy debugfs api, we enabled irqs by writing, disable
> > them. */
> > -	psr_write(debugfs_fd, "0");
> > -	return -EINVAL;
> > -}
> > -
> > -static bool psr_modparam_set(int val)
> > -{
> > -	static int oldval =3D -1;
> > -
> > -	igt_set_module_param_int("enable_psr", val);
> > -
> > -	if (val =3D=3D oldval)
> > -		return false;
> > -
> > -	oldval =3D val;
> > -	return true;
> > +	return ret =3D=3D -EINVAL ? 0 : ret;
> >  }
> > =20
> >  static int psr_restore_debugfs_fd =3D -1;
> > @@ -109,16 +89,15 @@ static bool psr_set(int debugfs_fd, bool
> > enable)
> > =20
> >  	ret =3D has_psr_debugfs(debugfs_fd);
> >  	if (ret =3D=3D -ENODEV) {
> > -		igt_skip_on_f(enable, "PSR not available\n");
> > +		igt_skip("PSR not available\n");
> > +		return false;
> > +	} else if (ret) {
> > +		igt_skip("PSR debugfs interface not available\n");
> >  		return false;
> >  	}
> > =20
> > -	if (ret =3D=3D -EINVAL) {
> > -		ret =3D psr_modparam_set(enable);
> > -	} else {
> > -		ret =3D psr_write(debugfs_fd, enable ? "0x3" : "0x1");
> > -		igt_assert(ret > 0);
> > -	}
> > +	ret =3D psr_write(debugfs_fd, enable ? "0x3" : "0x1");
> > +	igt_assert(ret > 0);
> > =20
> >  	/* Restore original value on exit */
> >  	if (psr_restore_debugfs_fd =3D=3D -1) {

--=-Dc7KNIeAy/lp4q7KaX2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlw/410ACgkQVenbO/mO
Wknc+Af+JxAU2BUzShW736RvUBYDRLfokE3wiVXnXyZUkUSg/cJMlT+TOqRzPvBd
WtafB77gZpnNzIvamlkW0TwndTnugp8DuG55ycYSlFGNsoqcK3SGecgzmdh8GPUl
Z/tJF/QKVuOywcL/B5bes5D6UV+QzFEE20CEOhsrzYshmSJOe2XVy8Lho6/QPz66
EUcPzekeRjqKMey6mM5WA4hEIGMGdpwsb4Zox9i20UJ+gT9elWRIGd52NKGCHFuI
Vs7ckpJXdTw0hzwPNodVrPx0nkVR1J9cEFcti+0PpWdNwB7/hPhkOdNjgPZpn7x+
0EsBmC8E5Pe9MC0shiopHnh3oyuWHw==
=J4HX
-----END PGP SIGNATURE-----

--=-Dc7KNIeAy/lp4q7KaX2k--

--===============0283863528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0283863528==--
