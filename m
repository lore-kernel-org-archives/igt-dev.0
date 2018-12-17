Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 17 Dec 2018 14:45:55 -0200
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20181217164555.nfpkflnfay2mqlje@smtp.gmail.com>
References: <20180905203827.n7vpugbs6bjvijpg@smtp.gmail.com>
 <20181217154930.GH21184@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20181217154930.GH21184@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t v2] Add support for forcing specific
 module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0748431908=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, gustavo@padovan.org, intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0748431908==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b6ni3p7dc6eeudg5"
Content-Disposition: inline


--b6ni3p7dc6eeudg5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/17, Daniel Vetter wrote:
> On Wed, Sep 05, 2018 at 05:38:27PM -0300, Rodrigo Siqueira wrote:
> > This commit adds a new option for forcing the use of a specific driver
> > indicated via an environment variable.
> >=20
> > Changes since V1:
> >  Petri:
> >  - Use an environment variable instead of command line
> >  - Refactor the loop in __search_and_open to accept forced module
> >  - Don't try to load kernel modules
> >=20
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>=20
> Note: You can't drop the s-o-b line if your patch contains work by other
> people, like from Petri here. Proper way to resend a patch by someone else
> is to just add a subject prefix of "PATCH RESEND" and otherwise keep
> everything unchanged (including author and everything).
>=20
> https://patchwork.freedesktop.org/patch/245532/

Hi,

Thanks for your feedback.
Next time I will take care for not make this mistake again.

Best Regards
Rodrigo Siqueira
=20
> Cheers, Daniel
>=20
> > ---
> >  lib/drmtest.c  | 44 ++++++++++++++++++++++++++++++++++++++++++--
> >  lib/drmtest.h  |  2 ++
> >  lib/igt_core.c |  5 +++++
> >  3 files changed, 49 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index bfa2e0f0..6e35d1be 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -123,6 +123,36 @@ static bool has_known_intel_chipset(int fd)
> >  	return true;
> >  }
> > =20
> > +static char _forced_driver[5] =3D "";
> > +
> > +/**
> > + * __set_forced_driver:
> > + * @name: name of driver to forcibly use
> > + *
> > + * Set the name of a driver to use when calling #drm_open_driver with
> > + * the #DRIVER_ANY flag.
> > + */
> > +void __set_forced_driver(const char *name)
> > +{
> > +	if (!strcmp(name, "")) {
> > +		igt_warn("IGT_FORCE_DRIVER flag specified without a value,"
> > +			 "ignoring force option\n");
> > +		return;
> > +	}
> > +
> > +	igt_info("Attempt to force module %s\n", name);
> > +
> > +	strncpy(_forced_driver, name, 4);
> > +}
> > +
> > +static const char *forced_driver(void)
> > +{
> > +	if (_forced_driver[0])
> > +		return _forced_driver;
> > +
> > +	return NULL;
> > +}
> > +
> >  #define LOCAL_I915_EXEC_VEBOX	(4 << 0)
> >  /**
> >   * gem_quiescent_gpu:
> > @@ -250,8 +280,18 @@ static int __search_and_open(const char *base, int=
 offset, unsigned int chipset)
> > =20
> >  		sprintf(name, "%s%u", base, i + offset);
> >  		fd =3D open_device(name, chipset);
> > -		if (fd !=3D -1)
> > -			return fd;
> > +		if (fd =3D=3D -1)
> > +			continue;
> > +
> > +		// Force module
> > +		if (chipset =3D=3D DRIVER_ANY && forced_driver()) {
> > +			if (__is_device(fd, forced_driver()))
> > +				return fd;
> > +			close(fd);
> > +			continue;
> > +		}
> > +
> > +		return fd;
> >  	}
> > =20
> >  	return -1;
> > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > index 949865ee..62f53ec3 100644
> > --- a/lib/drmtest.h
> > +++ b/lib/drmtest.h
> > @@ -51,6 +51,8 @@
> >   */
> >  #define DRIVER_ANY 	~(DRIVER_VGEM)
> > =20
> > +void __set_forced_driver(const char *name);
> > +
> >  /**
> >   * ARRAY_SIZE:
> >   * @arr: static array
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index 23bb858f..8e65b5e3 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -647,6 +647,11 @@ static void common_init_env(void)
> >  	igt_frame_dump_path =3D getenv("IGT_FRAME_DUMP_PATH");
> > =20
> >  	stderr_needs_sentinel =3D getenv("IGT_SENTINEL_ON_STDERR") !=3D NULL;
> > +
> > +	env =3D getenv("IGT_FORCE_DRIVER");
> > +	if (env) {
> > +		__set_forced_driver(env);
> > +	}
> >  }
> > =20
> >  static int common_init(int *argc, char **argv,
> > --=20
> > 2.18.0
> >=20
> >=20
> > --=20
> > Rodrigo Siqueira
> > http://siqueira.tech
> > Graduate Student
> > Department of Computer Science
> > University of S=E3o Paulo
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--b6ni3p7dc6eeudg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlwX0sMACgkQWJzP/com
vP9k7xAAsZwL4GE5IZCcx356LZaB+3L/bTRimtUB3d5djSOdkGCrjcMpZsmmF/A6
KNdXXU0p4CwpuB+TwCEcI/h0k2gJrEVQKz/HSaiFyUTcJ+ijoKL+oESaHwWPdWzZ
G/1319r2D8P1lyTj3qjcN7NfMksWoFeNVVtz5g9ARq8UZybRFPzlg8Fe5XHGiSTO
7ZYpxGADJSnkNAxUkZK1F5/o91A7vREL7RLBNyYTGDzduvHh5qudlUF7EX+dvvAN
O2aH4AzxZb24/eN2K7njuRk9113mq2aqUUbW//g72fL3xpRSfjSR7qBcPfz+Z7Wt
HPNqismZq0IhiGkHESFUM0nLzeOtvqF6LSEYNNcj6tPbeLEZmNl2cz3Krc2x1Ius
UHTZV1HAy5//FbYS5AWfsBN1nJE55MXjLOsjFDlty6jA2FZYTfGXranwIYf6QyLD
II17FZIBkIL86lJjxAXo5OQ666TtWh+E1iJFSyJMKh56ZvTg3tk870wSzpustFS2
pd2B+oAG3vXxQVj3rmJST2XpNaw2gzxicrP9iWvMZ4krFUJpuG3oENLOs1eY81Fn
AKpq6WJPy1R+NTGi9DhCj6iP+ccOyNHm547QBlw61hZNmG1/FK0Vq6pTG8gRkeSP
NGx6mRaIw5biqnoJvhIhW9LP4nL+cpyy1YVA75bWhpBW0D/ATFo=
=R1pW
-----END PGP SIGNATURE-----

--b6ni3p7dc6eeudg5--

--===============0748431908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0748431908==--
