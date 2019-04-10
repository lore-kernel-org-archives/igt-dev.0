Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721028940E
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 21:08:50 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 10 Apr 2019 21:08:48 +0000
Message-ID: <0462a407ea3c5f1271353648396b0ca5bffbda44.camel@intel.com>
References: <20190327200331.28602-1-jose.souza@intel.com>
 <20190327200331.28602-5-jose.souza@intel.com>
 <97795330-e588-dc83-98f4-d5413518444c@linux.intel.com>
In-Reply-To: <97795330-e588-dc83-98f4-d5413518444c@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/8] tests/fbcon_fbt: Add and use
 psr_long_wait_update() to test updates in PSR
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0338825727=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0338825727==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-7HmQTflnncuq2YzKNcJ6"

--=-7HmQTflnncuq2YzKNcJ6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-09 at 19:55 +0200, Maarten Lankhorst wrote:
> Op 27-03-2019 om 21:03 schreef Jos=C3=A9 Roberto de Souza:
> > After getting back to fbcon it tests if PSR had a update but since
> > fbcon can take a while it have some big sleep in place, so what it
> > is actualy testing is if fbcon is updating the screen.
> > In this test the update of the screen comes from the fbcon cursor
> > blinking, the problem is that 40ms is a small interval to detect
> > cursor blinking and the test can fail some times, so a bigger
> > timeout
> > to wait for a update is need.
> >=20
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c         | 5 +++++
> >  lib/igt_psr.h         | 1 +
> >  tests/kms_fbcon_fbt.c | 2 +-
> >  3 files changed, 7 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index b5847bfd..b92ea73f 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -54,6 +54,11 @@ bool psr_wait_update(int debugfs_fd, enum
> > psr_mode mode)
> >  	return igt_wait(!psr_active_check(debugfs_fd, mode), 40, 10);
> >  }
> > =20
> > +bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode)
> > +{
> > +	return igt_wait(!psr_active_check(debugfs_fd, mode), 500, 10);
> > +}
> > +
> >  static ssize_t psr_write(int debugfs_fd, const char *buf)
> >  {
> >  	return igt_sysfs_write(debugfs_fd, "i915_edp_psr_debug", buf,
> > diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> > index 49599cf8..ca385736 100644
> > --- a/lib/igt_psr.h
> > +++ b/lib/igt_psr.h
> > @@ -37,6 +37,7 @@ enum psr_mode {
> > =20
> >  bool psr_wait_entry(int debugfs_fd, enum psr_mode mode);
> >  bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
> > +bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode);
> >  bool psr_enable(int debugfs_fd, enum psr_mode);
> >  bool psr_disable(int debugfs_fd);
> >  bool psr_sink_support(int debugfs_fd, enum psr_mode);
> > diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> > index b57e5f51..0550034e 100644
> > --- a/tests/kms_fbcon_fbt.c
> > +++ b/tests/kms_fbcon_fbt.c
> > @@ -203,7 +203,7 @@ static bool psr_supported_on_chipset(int
> > debugfs_fd)
> > =20
> >  static bool psr_wait_until_update(int debugfs_fd)
> >  {
> > -	return psr_wait_update(debugfs_fd, PSR_MODE_1);
> > +	return psr_long_wait_update(debugfs_fd, PSR_MODE_1);
> >  }
> > =20
> >  static void disable_features(int debugfs_fd)
>=20
> This patch and 4/8 should be merged? maybe merged with 3/8 as well?

Done, can you give a review to the squashed patch?

>=20
> ~Maarten
>=20

--=-7HmQTflnncuq2YzKNcJ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyuW18ACgkQVenbO/mO
WkkU3AgAimQcDQYKPXHQmeAcGjEp2xgqbKg5xVvozYPqoQluRJ9+q9rzYxup6Bib
Jw97nuj9FSlhJ4Lj8INzYsqRPTJakkcWEJ0qgpd+0bw5jgI9M669d7qQEh6Zsfzg
8UlZHfv3fW/RzWXj1DpVLVcegnaATjeODxBmOlHiyNgkSyNf5w1dPBc9hyEHjz4z
WGEzUsHk5shNDq0Dqo91SW2T3KZmz9q2SiXPn/eyXTRziiwJH89K1cZEkIuDhzoP
gz/+kH1WqCmVZtFhh57U8Epz0Cz+HxxEOJK2eRgnaMY1ZmEEr8t4lt2qkr8Pmys0
/G2xqAz7ECYVXDyMp+F02UIfIildJw==
=eiO9
-----END PGP SIGNATURE-----

--=-7HmQTflnncuq2YzKNcJ6--

--===============0338825727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0338825727==--
