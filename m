Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466B68997C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 15:56:40 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 12 Apr 2019 15:56:37 +0000
Message-ID: <99bbed347b6d143ac9d9e60d8fed9ce22927e4e7.camel@intel.com>
References: <20190410220716.19449-1-jose.souza@intel.com>
 <20190410220716.19449-3-jose.souza@intel.com>
 <d0f110e0b3d50a616726c7c286e7c31bed9a681f.camel@intel.com>
In-Reply-To: <d0f110e0b3d50a616726c7c286e7c31bed9a681f.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/6] tests/fbcon_fbt: Add and user
 psr_long_wait_update()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0158053381=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0158053381==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-h8YDCa33JABFFyZkpg4U"

--=-h8YDCa33JABFFyZkpg4U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-04-11 at 21:25 -0700, Dhinakaran Pandiyan wrote:
> On Wed, 2019-04-10 at 15:07 -0700, Jos=C3=A9 Roberto de Souza wrote:
> > When fbcon is enabled, PSR will be active between cursor blinks so
> > what it should really use to test PSR is psr_wait_entry(), so a new
> > feature callback was added.
> We could add a PSR only blinking subtest that verifies both entry and
> exit
> happen as the next step.
>=20
> > But the fbcon cursor blinks at 5hz what give us 200ms between each
> > screen update what make psr_wait_update() prone to fail the test
> > because it timed out before a blink could happen, so here adding
> > and
> > using psr_long_wait_update() that have a longer timeout.
>=20
> Patch 4 that sets up the test conditions should come before this
> patch that
> validates the kernel's response.

Okay reordering.

>=20
> Also, is there a way to read the blink rate?

There is no way, I found a old patch adding it but it was not merged.

>=20
> > v3:
> > - 3 previous patches squashed in this one (Maarten)
> > - Back to !feature->wait_until_enabled() to test feature state when
> > all CRTCS are disabled(Dhinakaran)
> >=20
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  lib/igt_psr.c         |  5 +++++
> >  lib/igt_psr.h         |  1 +
> >  tests/kms_fbcon_fbt.c | 17 +++++++++++++++--
> >  3 files changed, 21 insertions(+), 2 deletions(-)
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
> nit: We could reduce the debugfs read frequency as the timeout is
> also larger,
> haven't really given enough though into what's a sensible upper
> limit. But,
> something like 50 should be okay.
>=20
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
> > index a9d91839..a5340d85 100644
> > --- a/tests/kms_fbcon_fbt.c
> > +++ b/tests/kms_fbcon_fbt.c
> > @@ -130,6 +130,11 @@ static bool fbc_wait_until_enabled(int
> > debugfs_fd)
> >  	return r;
> >  }
> > =20
> > +static bool fbc_wait_until_update(int debugfs)
> > +{
> This warrants an explanation as to why fbc_wait_until_update =3D=3D
> !fbc_wait_until_enabled.
>=20

This was just moved from what it was doing before.

> My understanding is that we do not expect fbc to become active at all
> with
> fbcon. Can you confirm that?

It is not expected because fbcon do not uses a tiled framebuffer so a
fence can not be setup on the framebuffer and FBC code requires a fence
to accurate track frontbuffer modifications(what maybe is not necessary
anymore as we now have intel_fbc_invalidate()/flush()).

If one day fbcon starts to use a tiled framebuffer we would need to
check the 'Compressing' status as in each blink it would disable the
compressing but FBC would still be enabled.

Adding it.

>=20
> With an explanation included and patches re-ordered,=20
>=20
> Reviewed-by: Dhinkaran Pandiyan <dhinakaran.pandiyan@intel.com>
>=20
> > +	return !fbc_wait_until_enabled(debugfs);
> > +}
> > +
> >  typedef bool (*connector_possible_fn)(drmModeConnectorPtr
> > connector);
> > =20
> >  static void set_mode_for_one_screen(struct drm_info *drm, struct
> > igt_fb *fb,
> > @@ -196,6 +201,11 @@ static bool psr_supported_on_chipset(int
> > debugfs_fd)
> >  	return psr_sink_support(debugfs_fd, PSR_MODE_1);
> >  }
> > =20
> > +static bool psr_wait_until_update(int debugfs_fd)
> > +{
> > +	return psr_long_wait_update(debugfs_fd, PSR_MODE_1);
> > +}
> > +
> >  static void disable_features(int debugfs_fd)
> >  {
> >  	igt_set_module_param_int("enable_fbc", 0);
> > @@ -215,16 +225,19 @@ static inline void psr_debugfs_enable(int
> > debugfs_fd)
> >  struct feature {
> >  	bool (*supported_on_chipset)(int debugfs_fd);
> >  	bool (*wait_until_enabled)(int debugfs_fd);
> > +	bool (*wait_until_update)(int debugfs_fd);
> >  	bool (*connector_possible_fn)(drmModeConnectorPtr connector);
> >  	void (*enable)(int debugfs_fd);
> >  } fbc =3D {
> >  	.supported_on_chipset =3D fbc_supported_on_chipset,
> >  	.wait_until_enabled =3D fbc_wait_until_enabled,
> > +	.wait_until_update =3D fbc_wait_until_update,
> >  	.connector_possible_fn =3D connector_can_fbc,
> >  	.enable =3D fbc_modparam_enable,
> >  }, psr =3D {
> >  	.supported_on_chipset =3D psr_supported_on_chipset,
> >  	.wait_until_enabled =3D psr_wait_until_enabled,
> > +	.wait_until_update =3D psr_wait_until_update,
> >  	.connector_possible_fn =3D connector_can_psr,
> >  	.enable =3D psr_debugfs_enable,
> >  };
> > @@ -263,13 +276,13 @@ static void subtest(struct feature *feature,
> > bool
> > suspend)
> >  	sleep(3);
> > =20
> >  	wait_user("Back to fbcon.");
> > -	igt_assert(!feature->wait_until_enabled(drm.debugfs_fd));
> > +	igt_assert(feature->wait_until_update(drm.debugfs_fd));
> > =20
> >  	if (suspend) {
> >  		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> >  					      SUSPEND_TEST_NONE);
> >  		sleep(5);
> > -		igt_assert(!feature-
> > >wait_until_enabled(drm.debugfs_fd));
> > +		igt_assert(feature->wait_until_update(drm.debugfs_fd));
> >  	}
> >  }
> > =20

--=-h8YDCa33JABFFyZkpg4U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlywtTUACgkQVenbO/mO
Wkk3Hwf+OxMlf1Bs31k2VaI2BvL09wXb16u/4C9qsqovRwRH1ftPBi50GJj0ASW7
7QWlqTY5NIQtR51n7VVKBwMKFGRESn0+/zdVkHvJTepEoErVYeD5+t2wKJ4VUg2x
LR9plv5crpn5PTs2pJDV2scCVtQR0xD1LoHEEISVXGc5kBtQpNS3FPH9VXJN9qQH
A8Pow6UqauL7xWhqpLfDH6HLYhl6Lz8yy2sU6fIqSJWFcLGR43NOmqDcAVULLag6
xN7LkDuWb52UAUst0fRycGKBXLrMWhYaAVTEi6Kpl9ayfQxrxEablwpHZW3O1425
4Rci8eNkExVy0ftwhLm/hrW2cHNCNA==
=bjIz
-----END PGP SIGNATURE-----

--=-h8YDCa33JABFFyZkpg4U--

--===============0158053381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0158053381==--
