Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B1F6F2A4
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 01:59:47 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 17 Jan 2019 01:59:24 +0000
Message-ID: <bddb1d9319acf7242f706896f850a854e8c07794.camel@intel.com>
References: <20190112014607.13446-1-jose.souza@intel.com>
 <20190112014607.13446-6-jose.souza@intel.com>
 <bb0d335ad3e9f750c5bfb003b25b8d3fe2c7e83a.camel@intel.com>
In-Reply-To: <bb0d335ad3e9f750c5bfb003b25b8d3fe2c7e83a.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 06/10] lib/psr: Make psr_wait_entry and
 psr_wait_update aware of the PSR version tested
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0591298975=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0591298975==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-VP5LHrArN51UJOij/zL2"

--=-VP5LHrArN51UJOij/zL2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-01-15 at 21:19 -0800, Dhinakaran Pandiyan wrote:
> On Fri, 2019-01-11 at 17:46 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > This way we can test both PSR version separated.
> >=20
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c                    | 26 ++++++++++++++++++--------
> >  lib/igt_psr.h                    |  9 +++++++--
> >  tests/kms_frontbuffer_tracking.c |  4 ++--
> >  tests/kms_psr.c                  |  4 ++--
> >  4 files changed, 29 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index 5edec6a2..c6638c2c 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -25,26 +25,36 @@
> >  #include "igt_sysfs.h"
> >  #include <errno.h>
> > =20
> > -static bool psr_active(int debugfs_fd, bool check_active)
> > +static bool psr_state_check(int debugfs_fd, const char *state)
> nit: Is there a plan to use this function for anything else? Making
> this function check only for the active state is more straightforward
> IMO
>=20
> -static bool psr_state_check(int debugfs_fd, const char *state)
> +static bool psr_active_check(int debugfs_fd, enum psr_mode mode)
>  {
>         char buf[PSR_STATUS_MAX_LEN];
> +       char *state;
> =20
> +       state =3D mode =3D=3D PSR_MODE_1 ? "SRDENT" : "DEEP_SLEEP";
>         igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status",
> buf,
>                                 sizeof(buf));
> =20
>         return strstr(buf, state);
>  }

Yeah, I don't see other use than check for active state.
I will apply this change, thanks.

> >  {
> > -	bool active;
> >  	char buf[PSR_STATUS_MAX_LEN];
> > =20
> >  	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
> >  				sizeof(buf));
> > =20
> > -	active =3D strstr(buf, "SRDENT") || strstr(buf, "DEEP_SLEEP");
> > -	return check_active ? active : !active;
> > +	return strstr(buf, state);
> >  }
> > =20
> > -bool psr_wait_entry(int debugfs_fd)
> > +static inline const char *psr_active_state_get(enum psr_mode mode)
> >  {
> > -	return igt_wait(psr_active(debugfs_fd, true), 500, 20);
> > +	return mode =3D=3D PSR_MODE_1 ? "SRDENT" : "DEEP_SLEEP";
> >  }
> > =20
> > -bool psr_wait_update(int debugfs_fd)
> > +/*
> > + * For PSR1, we wait until PSR is active. We wait until DEEP_SLEEP
> > for PSR2.
> > + */
> > +bool psr_wait_entry(int debugfs_fd, enum psr_mode mode)
> >  {
> > -	return igt_wait(psr_active(debugfs_fd, false), 40, 10);
> > +	const char *state =3D psr_active_state_get(mode);
> > +
> > +	return igt_wait(psr_state_check(debugfs_fd, state), 500, 20);
> > +}
> > +
> > +bool psr_wait_update(int debugfs_fd, enum psr_mode mode)
> > +{
> > +	const char *state =3D psr_active_state_get(mode);
> > +
> > +	return igt_wait(!psr_state_check(debugfs_fd, state), 40, 10);
> >  }
> > =20
> >  static ssize_t psr_write(int debugfs_fd, const char *buf)
> > diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> > index 62c680ee..4fff77ec 100644
> > --- a/lib/igt_psr.h
> > +++ b/lib/igt_psr.h
> > @@ -30,8 +30,13 @@
> > =20
> >  #define PSR_STATUS_MAX_LEN 512
> > =20
> > -bool psr_wait_entry(int debugfs_fd);
> > -bool psr_wait_update(int debugfs_fd);
> > +enum psr_mode {
> Add a=20
> 	PSR_MODE_DISABLE, too?

To keep all functions simple we should not add this, otherwise we would
need to earlier return in psr_wait_entry(), psr_wait_update() and
psr_sink_support() when PSR_MODE_DISABLE is set? Or calling those
funciton with PSR_MODE_DISABLE mean that we should call psr_disable()?!

I guess is better just keep PSR_MODE_1 and PSR_MODE_2.

> > +	PSR_MODE_1,
> > +	PSR_MODE_2
> > +};
> > +
> > +bool psr_wait_entry(int debugfs_fd, enum psr_mode mode);
> > +bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
> >  bool psr_enable(int debugfs_fd);
> >  bool psr_disable(int debugfs_fd);
> >  bool psr_sink_support(int debugfs_fd);
> > diff --git a/tests/kms_frontbuffer_tracking.c
> > b/tests/kms_frontbuffer_tracking.c
> > index cd7dda91..ed9a039a 100644
> > --- a/tests/kms_frontbuffer_tracking.c
> > +++ b/tests/kms_frontbuffer_tracking.c
> > @@ -1622,10 +1622,10 @@ static void do_status_assertions(int flags)
> >  	}
> > =20
> >  	if (flags & ASSERT_PSR_ENABLED)
> > -		igt_assert_f(psr_wait_entry(drm.debugfs),
> > +		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1),
> >  			     "PSR still disabled\n");
> >  	else if (flags & ASSERT_PSR_DISABLED)
> > -		igt_assert_f(psr_wait_update(drm.debugfs),
> > +		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1),
> >  			     "PSR still enabled\n");
> >  }
> > =20
> > diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> > index fb3bd7a4..23d000bd 100644
> > --- a/tests/kms_psr.c
> > +++ b/tests/kms_psr.c
> > @@ -199,7 +199,7 @@ static bool psr_wait_entry_if_enabled(data_t
> > *data)
> >  	if (data->with_psr_disabled)
> >  		return true;
> > =20
> > -	return psr_wait_entry(data->debugfs_fd);
> > +	return psr_wait_entry(data->debugfs_fd, PSR_MODE_1);
> >  }
> > =20
> >  static inline void manual(const char *expected)
> > @@ -289,7 +289,7 @@ static void run_test(data_t *data)
> >  		expected =3D "screen GREEN";
> >  		break;
> >  	}
> > -	igt_assert(psr_wait_update(data->debugfs_fd));
> > +	igt_assert(psr_wait_update(data->debugfs_fd, PSR_MODE_1));
> >  	manual(expected);
> >  }
> > =20

--=-VP5LHrArN51UJOij/zL2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlw/4XoACgkQVenbO/mO
WkkjEwf9FFwHXk9LesaQ8QvpLO5qeGc8dAf+cccix9lMWVS8+XezS3qlFjxUeasN
LspGcHWIcwO186T0PR28XqBJW5kKbgdtzGdxR8ck3CGJgDecn8PQsulIZdGiYy1s
xMZ+j7g94p3kkHevhf7XuhBoSXMr3bW1YGkb/DtUROWoTcpaHvfqN6H3j6gPXU+9
JE75PGEEkKb7HZlPllh4KSCgpYfCayApCcX46TcoOqQTvUV9Mx1WusK9sSksnlDL
VH/n+bT/DW25bvO7A0OSZQCUic9HJFnXAja0Yt9+Z63OV745IGpbuiOEujQoULDI
KiPfoF4R7/fX1lybXwOTuUm6vP7Rcg==
=jr32
-----END PGP SIGNATURE-----

--=-VP5LHrArN51UJOij/zL2--

--===============0591298975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0591298975==--
