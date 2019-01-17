Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D78F6E288
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 02:14:16 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 17 Jan 2019 02:14:13 +0000
Message-ID: <7cdbac7ba93f447f2bd1a28a5e97fa010cecea75.camel@intel.com>
References: <20190112014607.13446-1-jose.souza@intel.com>
 <20190112014607.13446-8-jose.souza@intel.com>
 <06761ec3764ef20700119539be30fbf3c859e484.camel@intel.com>
In-Reply-To: <06761ec3764ef20700119539be30fbf3c859e484.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 08/10] lib/psr: Add PSR2 support to the
 remaning psr functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0342323680=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0342323680==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-NYieK2Youyi8jzqBzmlO"

--=-NYieK2Youyi8jzqBzmlO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-01-15 at 21:33 -0800, Dhinakaran Pandiyan wrote:
> On Fri, 2019-01-11 at 17:46 -0800, Jos=C3=A9 Roberto de Souza wrote:
> > Add the mode parameter to psr_enable() and psr_sink_support() so
> > PSR1
> > and PSR2 can be tested separated.
> > For now all PSR tests will run only with PSR1 and the tests for
> > PSR2
> > will come in the future.
> >=20
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c                    | 39 +++++++++++++++++++++++++---
> > --
> > --
> >  lib/igt_psr.h                    |  4 ++--
> >  tests/kms_fbcon_fbt.c            |  9 ++++++--
> >  tests/kms_frontbuffer_tracking.c |  4 ++--
> >  tests/kms_psr.c                  |  5 ++--
> >  5 files changed, 45 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index 5cc0fbc2..d7028f6c 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -83,9 +83,10 @@ static void restore_psr_debugfs(int sig)
> >  	psr_write(psr_restore_debugfs_fd, "0");
> >  }
> > =20
> > -static bool psr_set(int debugfs_fd, bool enable)
> > +static bool psr_set(int debugfs_fd, enum psr_mode mode)
> >  {
> >  	int ret;
> > +	const char *debug_val;
> > =20
> >  	ret =3D has_psr_debugfs(debugfs_fd);
> >  	if (ret =3D=3D -ENODEV) {
> > @@ -96,7 +97,18 @@ static bool psr_set(int debugfs_fd, bool enable)
> >  		return false;
> >  	}
> > =20
> > -	ret =3D psr_write(debugfs_fd, enable ? "0x3" : "0x1");
> > +	switch (mode) {
> > +	case PSR_MODE_1:
> > +		debug_val =3D "0x3";
> > +		break;
> > +	case PSR_MODE_2:
> > +		debug_val =3D "0x2";
> > +		break;
> > +	default:
> > +		debug_val =3D "0x1";
> > +	}
> > +
> > +	ret =3D psr_write(debugfs_fd, debug_val);
> >  	igt_assert(ret > 0);
> > =20
> >  	/* Restore original value on exit */
> > @@ -109,23 +121,34 @@ static bool psr_set(int debugfs_fd, bool
> > enable)
> >  	return ret;
> >  }
> > =20
> > -bool psr_enable(int debugfs_fd)
> > +bool psr_enable(int debugfs_fd, enum psr_mode mode)
> >  {
> > -	return psr_set(debugfs_fd, true);
> > +	return psr_set(debugfs_fd, mode);
> >  }
> > =20
> >  bool psr_disable(int debugfs_fd)
> >  {
> > -	return psr_set(debugfs_fd, false);
> > +	/* Any mode different than PSR_MODE_1/2 will disable PSR */
> Please consider adding PSR_MODE_DISABLE to get rid of this comment.

I have commented in the previous patch, my opinion is that is better
have this comments and handle this way than let user call all other
functions with PSR_MODE_DISABLE.

>=20
> > +	return psr_set(debugfs_fd, PSR_MODE_2 + 1);
> >  }
> > =20
> > -bool psr_sink_support(int debugfs_fd)
> > +bool psr_sink_support(int debugfs_fd, enum psr_mode mode)
> >  {
> >  	char buf[PSR_STATUS_MAX_LEN];
> >  	int ret;
> > =20
> >  	ret =3D igt_debugfs_simple_read(debugfs_fd,
> > "i915_edp_psr_status", buf,
> >  				      sizeof(buf));
> > -	return ret > 0 && (strstr(buf, "Sink_Support: yes\n") ||
> > -			   strstr(buf, "Sink support: yes"));
> > +	if (ret < 1)
> > +		return false;
> > +
> > +	if (mode =3D=3D PSR_MODE_1)
> > +		return strstr(buf, "Sink_Support: yes\n") ||
> > +		       strstr(buf, "Sink support: yes");
> > +	else
> > +		/*
> > +		 * i915 requires PSR version 0x03 that is PSR2 + SU
> > with
> > +		 * Y-coordinate to support PSR2
> > +		 */
> > +		return strstr(buf, "Sink support: yes [0x03]");
> For some reason, I thought we also print whether the sink supports
> PSR1
> or PSR2 in debugfs. Hope it's not too late, did we ever consider
>=20
> Sink support: {No, PSR1, PSR2} [<PSR dpcd version>]?

Okay, I will change kernel and IGT to have this debugfs output.
We should print it just based on the DPCD version? Like version 0x2 is
PSR2 but we don't support PSR2 in that version of panel, same as a
version 0x3 that do not require the Y-coordinate.

>=20
> >  }
> > diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> > index 4fff77ec..7e7017bf 100644
> > --- a/lib/igt_psr.h
> > +++ b/lib/igt_psr.h
> > @@ -37,8 +37,8 @@ enum psr_mode {
> > =20
> >  bool psr_wait_entry(int debugfs_fd, enum psr_mode mode);
> >  bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
> > -bool psr_enable(int debugfs_fd);
> > +bool psr_enable(int debugfs_fd, enum psr_mode);
> >  bool psr_disable(int debugfs_fd);
> > -bool psr_sink_support(int debugfs_fd);
> > +bool psr_sink_support(int debugfs_fd, enum psr_mode);
> > =20
> >  #endif
> > diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
> > index 2823b47a..9d0d5a36 100644
> > --- a/tests/kms_fbcon_fbt.c
> > +++ b/tests/kms_fbcon_fbt.c
> > @@ -199,6 +199,11 @@ static bool psr_wait_until_enabled(int
> > debugfs_fd)
> >  	return r;
> >  }
> > =20
> > +static bool psr_supported_on_chipset(int debugfs_fd)
> > +{
> > +	return psr_sink_support(debugfs_fd, PSR_MODE_1);
> > +}
> > +
> >  static void disable_features(int debugfs_fd)
> >  {
> >  	igt_set_module_param_int("enable_fbc", 0);
> > @@ -212,7 +217,7 @@ static inline void fbc_modparam_enable(int
> > debugfs_fd)
> > =20
> >  static inline void psr_debugfs_enable(int debugfs_fd)
> >  {
> > -	psr_enable(debugfs_fd);
> > +	psr_enable(debugfs_fd, PSR_MODE_1);
> >  }
> > =20
> >  struct feature {
> > @@ -226,7 +231,7 @@ struct feature {
> >  	.connector_possible_fn =3D connector_can_fbc,
> >  	.enable =3D fbc_modparam_enable,
> >  }, psr =3D {
> > -	.supported_on_chipset =3D psr_sink_support,
> > +	.supported_on_chipset =3D psr_supported_on_chipset,
> >  	.wait_until_enabled =3D psr_wait_until_enabled,
> >  	.connector_possible_fn =3D connector_can_psr,
> >  	.enable =3D psr_debugfs_enable,
> > diff --git a/tests/kms_frontbuffer_tracking.c
> > b/tests/kms_frontbuffer_tracking.c
> > index ed9a039a..609f7b41 100644
> > --- a/tests/kms_frontbuffer_tracking.c
> > +++ b/tests/kms_frontbuffer_tracking.c
> > @@ -1425,7 +1425,7 @@ static void setup_psr(void)
> >  		return;
> >  	}
> > =20
> > -	if (!psr_sink_support(drm.debugfs)) {
> > +	if (!psr_sink_support(drm.debugfs, PSR_MODE_1)) {
> >  		igt_info("Can't test PSR: not supported by sink.\n");
> >  		return;
> >  	}
> > @@ -1722,7 +1722,7 @@ static bool enable_features_for_test(const
> > struct test_mode *t)
> >  	if (t->feature & FEATURE_FBC)
> >  		fbc_enable();
> >  	if (t->feature & FEATURE_PSR)
> > -		ret =3D psr_enable(drm.debugfs);
> > +		ret =3D psr_enable(drm.debugfs, PSR_MODE_1);
> >  	if (t->feature & FEATURE_DRRS)
> >  		drrs_enable();
> > =20
> > diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> > index 23d000bd..c31dc317 100644
> > --- a/tests/kms_psr.c
> > +++ b/tests/kms_psr.c
> > @@ -191,7 +191,8 @@ static void fill_render(data_t *data, uint32_t
> > handle, unsigned char color)
> > =20
> >  static bool sink_support(data_t *data)
> >  {
> > -	return data->with_psr_disabled || psr_sink_support(data-
> > > debugfs_fd);
> > +	return data->with_psr_disabled ||
> > +	       psr_sink_support(data->debugfs_fd, PSR_MODE_1);
> >  }
> > =20
> >  static bool psr_wait_entry_if_enabled(data_t *data)
> > @@ -410,7 +411,7 @@ int main(int argc, char *argv[])
> >  		data.devid =3D intel_get_drm_devid(data.drm_fd);
> > =20
> Store it in struct data so that the value stays consistent throughout
> the test case?
> >  		if (!data.with_psr_disabled)
> > -			psr_enable(data.debugfs_fd);
> > +			psr_enable(data.debugfs_fd, PSR_MODE_1);
> > =20
> >  		igt_require_f(sink_support(&data),
> >  			      "Sink does not support PSR\n");

--=-NYieK2Youyi8jzqBzmlO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlw/5PQACgkQVenbO/mO
WkmmoQf/U06+gHU4xR+r3werUNLcu6vt1irx2E5N48DJYVXZ8OOdJZkWY9YWa3Po
kbZxFiDkul3v7yHZrj2KdzTBhPL5Mec9G8mxfhGEr7cj93tXot2PBks+zddwqJmR
P6HSSaKNrwp7H4L235efMVCYO415diQjJ/CNPIQ1BOB3fDac5cVgojxXgxJ270F+
NNwTbGKOKguuLZ1Ci8atJnN3lk0nhQnPjS19UYyF9yWce9Yuz/myUEtcrSAtkEJz
LTx1s6v05QlIrzluxKyjzFgbS4QbGRwB/EjxaNqZRfSkG9Q5uYtzVXTmhLcOYnqy
3Ln75D7PR/qKGR9GhkriRKRiPI5rqg==
=S/x4
-----END PGP SIGNATURE-----

--=-NYieK2Youyi8jzqBzmlO--

--===============0342323680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0342323680==--
