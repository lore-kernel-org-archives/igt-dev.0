Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3D46F580
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 21:17:20 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 17 Jan 2019 21:17:17 +0000
Message-ID: <9b1e8051d125b1ad20682c1db7c60ac9e493f4db.camel@intel.com>
References: <20190112014607.13446-1-jose.souza@intel.com>
 <20190112014607.13446-7-jose.souza@intel.com>
 <1fefb333444bd5ad208445b4dcfacb85cb2cbc93.camel@intel.com>
 <586fcec8b35d9dfa501b8026a7a0412fc23f8e6c.camel@intel.com>
 <d877a530d287ba083c265c3724baaf68e0c48771.camel@intel.com>
In-Reply-To: <d877a530d287ba083c265c3724baaf68e0c48771.camel@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1004770940=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1004770940==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-KNJQxX7jqxSUXM9Z84SH"

--=-KNJQxX7jqxSUXM9Z84SH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-01-16 at 18:16 -0800, Dhinakaran Pandiyan wrote:
> On Wed, 2019-01-16 at 18:07 -0800, Souza, Jose wrote:
> > On Tue, 2019-01-15 at 21:21 -0800, Dhinakaran Pandiyan wrote:
> > > On Fri, 2019-01-11 at 17:46 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > > > The nexts patches will add PSR2 tests and for that we need the
> > > > new
> > > > PSR debugfs interface that was released in kernel 4.20 so it
> > > > will
> > > > not
> > > > break for any updated system and we can drop support to the old
> > > > debugsfs and the support to kernels without even a debugfs
> > > > interface.
> > >=20
> > > Can't we have psr_set(mode =3D=3D PSR_MODE_2) skip if the kernel does
> > > not
> > > support the new interface?
> >=20
> > We could but why keep supporting old kernels? My experience of
> > running
> > a newer IGT over a old kernel or on the contrary was always
> > problematic.
>=20
> Downstream OS'es can package a newer IGT with an older kernel. In
> this
> case, it's not much of an effort to continue support for PSR1 tests
> from what I can tell.=20

Other problem here it that with the enable_psr parameter we don't
control what PSR version is going to be enabled, if possible PSR2 will
be enabled causing tests to fail in the first psr_wait_entry().

But okay, I will drop this patch.



> > =09
> >=20
> > >=20
> > > > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > > > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > > > ---
> > > >  lib/igt_psr.c | 35 +++++++----------------------------
> > > >  1 file changed, 7 insertions(+), 28 deletions(-)
> > > >=20
> > > > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > > > index c6638c2c..5cc0fbc2 100644
> > > > --- a/lib/igt_psr.c
> > > > +++ b/lib/igt_psr.c
> > > > @@ -73,27 +73,7 @@ static int has_psr_debugfs(int debugfs_fd)
> > > >  	 * -ENODEV is returned when PSR is unavailable.
> > > >  	 */
> > > >  	ret =3D psr_write(debugfs_fd, "0xf");
> > > > -	if (ret =3D=3D -EINVAL)
> > > > -		return 0;
> > > > -	else if (ret < 0)
> > > > -		return ret;
> > > > -
> > > > -	/* legacy debugfs api, we enabled irqs by writing,
> > > > disable
> > > > them. */
> > > > -	psr_write(debugfs_fd, "0");
> > > > -	return -EINVAL;
> > > > -}
> > > > -
> > > > -static bool psr_modparam_set(int val)
> > > > -{
> > > > -	static int oldval =3D -1;
> > > > -
> > > > -	igt_set_module_param_int("enable_psr", val);
> > > > -
> > > > -	if (val =3D=3D oldval)
> > > > -		return false;
> > > > -
> > > > -	oldval =3D val;
> > > > -	return true;
> > > > +	return ret =3D=3D -EINVAL ? 0 : ret;
> > > >  }
> > > > =20
> > > >  static int psr_restore_debugfs_fd =3D -1;
> > > > @@ -109,16 +89,15 @@ static bool psr_set(int debugfs_fd, bool
> > > > enable)
> > > > =20
> > > >  	ret =3D has_psr_debugfs(debugfs_fd);
> > > >  	if (ret =3D=3D -ENODEV) {
> > > > -		igt_skip_on_f(enable, "PSR not available\n");
> > > > +		igt_skip("PSR not available\n");
> > > > +		return false;
> > > > +	} else if (ret) {
> > > > +		igt_skip("PSR debugfs interface not
> > > > available\n");
> > > >  		return false;
> > > >  	}
> > > > =20
> > > > -	if (ret =3D=3D -EINVAL) {
> > > > -		ret =3D psr_modparam_set(enable);
> > > > -	} else {
> > > > -		ret =3D psr_write(debugfs_fd, enable ? "0x3" :
> > > > "0x1");
> > > > -		igt_assert(ret > 0);
> > > > -	}
> > > > +	ret =3D psr_write(debugfs_fd, enable ? "0x3" : "0x1");
> > > > +	igt_assert(ret > 0);
> > > > =20
> > > >  	/* Restore original value on exit */
> > > >  	if (psr_restore_debugfs_fd =3D=3D -1) {

--=-KNJQxX7jqxSUXM9Z84SH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxA8NwACgkQVenbO/mO
WkkP3wf+Kw5WYGv67MIPnQKRcPnZlMT7ehUdazOgNPMqqFDM3GpNPkpFnmJaS0Cl
NTpqE62tc2TmpFYQcoHgQ4V8W5HgTJR7GL7BH0DOL3K5HMd9+3puZPYU9iODWh8y
2qm7001KuaHFDQ6OqJnXjNFZ25Ujsu028RxEinKK0a7Tn0LTj5vqBNJUAfbS9exj
QA/CR3ivfH8hGAqudwy2/QN1xfYVX92zJpeqUjmsyx/4e9znxPnV/nnj2gvxApat
9z+3tTyciksQarXZYERnRjm7beGYM3/ChQ56GEDWLrJ8wEjXNAPB0Mc9XBCtjxsi
3hTE63AzV6DtFxvOpjhMgvFmEDyPuw==
=Ew+0
-----END PGP SIGNATURE-----

--=-KNJQxX7jqxSUXM9Z84SH--

--===============1004770940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1004770940==--
