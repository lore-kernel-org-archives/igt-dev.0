Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F83899F0
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 16:58:26 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 12 Apr 2019 16:58:24 +0000
Message-ID: <9020f574feb271982222b8b0c418a2fccfcbf2dc.camel@intel.com>
References: <20190410220716.19449-1-jose.souza@intel.com>
 <20190410220716.19449-4-jose.souza@intel.com>
 <e3b0b4ae72369676f08d1c5a9020706805eab8dd.camel@intel.com>
In-Reply-To: <e3b0b4ae72369676f08d1c5a9020706805eab8dd.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/6] tests/fbcon_fbt: Enable cursor
 blinking
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1704905766=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1704905766==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-9c0uyo8HE+sW/0eRFutC"

--=-9c0uyo8HE+sW/0eRFutC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-04-11 at 22:01 -0700, Dhinakaran Pandiyan wrote:
> On Wed, 2019-04-10 at 15:07 -0700, Jos=C3=A9 Roberto de Souza wrote:
> > If cursor blinking is disabled no screen updates will happen and
> > fbcon_fbt subtests will fail, so lets enable cursor blink while
> > running this test and restore to the previous value when exiting
> > it.
>=20
> I'd also prefer the test doing a cursor update instead, but don't
> want to block
> this change as it is an improvement.
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_sysfs.c       | 46
> > +++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_sysfs.h       |  1 +
> >  tests/kms_fbcon_fbt.c |  1 +
> >  3 files changed, 48 insertions(+)
> >=20
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> > index f806f4fc..904fbd17 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -610,3 +610,49 @@ void kick_snd_hda_intel(void)
> >  out:
> >  	close(fd);
> >  }
> > +
> > +static int fbcon_blink_restore_debugfs_fd =3D -1;
> fbcon_cursor_blink_fd? A bit shorter and matches the file name.

Okay

>=20
> > +static uint8_t fbcon_blink_restore_value;
> > +
> > +static void fbcon_blink_restore(int sig)
> > +{
> > +	char buffer[4];
> > +	int r;
> > +
> > +	r =3D snprintf(buffer, sizeof(buffer), "%u",
> > fbcon_blink_restore_value);
> > +	write(fbcon_blink_restore_debugfs_fd, buffer, r + 1);
> Add an assert here too.

Assert during test exit?

>=20
> Missing
> 	close(fbcon_blink_restore_debugfs_fd);

Done

>=20
> > +}
> > +
> > +/**
> > + * fbcon_blink_enable:
> > + * @enable: if true enables the fbcon cursor blinking otherwise
> > disables it
> > + *
> > + * Enables or disables the cursor blinking in fbcon, it also
> > restores the
> > + * previous blinking state when exiting test.
> > + *
> > + */
> > +void fbcon_blink_enable(bool enable)
> Having the enable parameter is neat, we can add subtest disabling
> cursor and
> check if PSR remains active.
>=20
> What'd be really cool though is to verify the blink rate against PSR
> exit rate.
>=20
> > +{
> > +	const char *cur_blink_path =3D
> > "/sys/class/graphics/fbcon/cursor_blink";
> > +	char buffer[4];
> > +	int fd, r;
> > +
> > +	fd =3D open(cur_blink_path, O_RDWR);
> > +	igt_assert(fd >=3D 0);
> igt_require()
> This is a test requirement than a failure of the test itself.

Done

>=20
>=20
> > +
> > +	/* Restore original value on exit */
> > +	if (fbcon_blink_restore_debugfs_fd =3D=3D -1) {
> > +		r =3D read(fd, buffer, sizeof(buffer));
> > +		if (r > 0) {
> > +			fbcon_blink_restore_value =3D
> > (uint8_t)strtol(buffer,
> > +								    NUL
> > L, 10);
> What is the point of this conversion if we are going to blindly write
> it back?
> Make buffer static instead.

saving one byte?!
but okay changing fbcon_blink_restore_value to char[2]

>=20
> > +			fbcon_blink_restore_debugfs_fd =3D dup(fd);
> > +			igt_assert(fbcon_blink_restore_debugfs_fd >=3D
> > 0);
> > +			igt_install_exit_handler(fbcon_blink_restore);
> > +		}
> > +	}
> > +
> > +	r =3D snprintf(buffer, sizeof(buffer), enable ? "1" : "0");
> > +	write(fd, buffer, r + 1);
> Assert the return here?

Done

>=20
> > +	close(fd);
> > +}
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> > index c12e36d1..b646df30 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -57,5 +57,6 @@ bool igt_sysfs_set_boolean(int dir, const char
> > *attr, bool
> > value);
> > =20
> >  void bind_fbcon(bool enable);
> >  void kick_snd_hda_intel(void);
> > +void fbcon_blink_enable(bool enable);
> > =20
> >  #endif /* __IGT_SYSFS_H__ */
> > diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> > index a5340d85..5e510db0 100644
> > --- a/tests/kms_fbcon_fbt.c
> > +++ b/tests/kms_fbcon_fbt.c
> > @@ -299,6 +299,7 @@ static void setup_environment(void)
> >  	 * is necessary enable it again
> >  	 */
> >  	bind_fbcon(true);
> > +	fbcon_blink_enable(true);
> >  }
> > =20
> >  static void teardown_environment(void)

--=-9c0uyo8HE+sW/0eRFutC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyww68ACgkQVenbO/mO
Wklf8Af/clRiSAiLtOlS/zi4Wtel4pT3i6NF8l3OvKz3x8QOrGPs6LV/N27Eh4B2
l+GiZE4zkve8wz7AFSXPx1gWw/sw8o/K97gqL1CgaUaxfZH1ILqLOOAqCgOY1Hw5
ECZwZZzWn/bI9Cul3mKTS6iQuhPZ72BLyZrDIsfL/8ZStAIwxwz95vthl0dAx34R
WAp6KUwuG6dQK+vlUfk0xJpAj0s0v7hRZQRBNDMLW60Va2QcgLTyMyNiIkkdM7Ep
q2+E4UxCgGeE75GT86oYa7x1vCIhO+whB03iGnwxHTNwwIqW06PuBIR+lFpdC1ev
g7f33pEFedWSgsYZjqmwWxwX6839LQ==
=unN2
-----END PGP SIGNATURE-----

--=-9c0uyo8HE+sW/0eRFutC--

--===============1704905766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1704905766==--
