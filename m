Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE84A10E21D
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 10:50:55 +0000 (UTC)
Date: Tue, 29 Aug 2023 09:50:31 -0100
From: Melissa Wen <mwen@igalia.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230829105031.bezfwml6ksyks3hy@mail.igalia.com>
References: <20230824163302.15121-1-mwen@igalia.com>
 <20230828153954.vnozovo4fdxara5b@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sahpvladn74qq4am"
Content-Disposition: inline
In-Reply-To: <20230828153954.vnozovo4fdxara5b@kamilkon-desk.igk.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic: check zpos is mutable
 before test mutable zpos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--sahpvladn74qq4am
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/28, Kamil Konieczny wrote:
> Hi Melissa,
>=20
> tests/kms_atomic: check zpos is mutable before test mutable zpos
> ----------------- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> imho better:
>=20
> tests/kms_atomic: skip zpos test on non-mutable planes

Looks better to me too. I'd just add that it's specific for mutable zpos:
`tests/kms_atomic: skip mutable zpos test on non-mutable planes`

>=20
> On 2023-08-24 at 15:33:02 -0100, Melissa Wen wrote:
> > plane-primary-overlay-mutable-zpos only works if both plane types have
> > mutable zpos property. However, drivers usually set primary zpos as
> > immutable and the test case just fails. Create a helper to check if a
> > plane have mutable zpos and skip the test case if zpos changes are not
> > allowed.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >=20
> > Hi,
> >=20
> > I don't know what drivers currently use this test case (imx?), but
> > besides this requirement check, the test case seems to use an uncommon
> > format for overlay plane (ARGB1555). From drm_info[1], I think a more
> > generic option would be ARGB8888 for alpha blending tests, but a primary
> > plane with mutable zpos doesn't seem a common case too.
> >=20
> > Let me know your thoughts
> >=20
> > [1] https://drmdb.emersion.fr/formats?plane=3D0
> >=20
> >  lib/igt_kms.c      | 17 +++++++++++++++++
> >  lib/igt_kms.h      |  2 ++
> >  tests/kms_atomic.c |  3 +++
> >  3 files changed, 22 insertions(+)
> >=20
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index e0959ccff..42dc66fcd 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -3827,6 +3827,23 @@ void igt_plane_set_prop_enum(igt_plane_t *plane,
> >  	igt_assert(igt_plane_try_prop_enum(plane, prop, val));
> >  }
> > =20
>=20
> Please document public functions.

ACK. I'll address it in the next version.

Thanks for the feedback,

Melissa

>=20
> Regards,
> Kamil
>=20
> > +bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
> > +				     enum igt_atomic_plane_properties igt_prop)
> > +{
> > +	drmModePropertyPtr prop;
> > +	uint64_t value;
> > +	bool has_prop;
> > +
> > +	has_prop =3D kmstest_get_property(plane->pipe->display->drm_fd,
> > +					plane->drm_plane->plane_id,
> > +					DRM_MODE_OBJECT_PLANE,
> > +				        igt_plane_prop_names[igt_prop], NULL,
> > +					&value, &prop);
> > +	igt_assert(has_prop);
> > +
> > +	return !(prop->flags & DRM_MODE_PROP_IMMUTABLE);
> > +}
> > +
> >  /**
> >   * igt_plane_replace_prop_blob:
> >   * @plane: plane to set property on.
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 91355c910..4b4ec6c5a 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -734,6 +734,8 @@ extern void igt_plane_replace_prop_blob(igt_plane_t=
 *plane,
> >  					enum igt_atomic_plane_properties prop,
> >  					const void *ptr, size_t length);
> > =20
> > +extern bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
> > +					    enum igt_atomic_plane_properties igt_prop);
> >  /**
> >   * igt_output_has_prop:
> >   * @output: Output to check.
> > diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> > index 3289219f9..22ddf5633 100644
> > --- a/tests/kms_atomic.c
> > +++ b/tests/kms_atomic.c
> > @@ -1463,7 +1463,10 @@ igt_main
> >  		igt_require(overlay);
> > =20
> >  		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
> > +		igt_require(igt_plane_check_prop_is_mutable(primary, IGT_PLANE_ZPOS)=
);
> > +
> >  		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
> > +		igt_require(igt_plane_check_prop_is_mutable(overlay, IGT_PLANE_ZPOS)=
);
> > =20
> >  		igt_require(igt_plane_has_format_mod(primary, format_primary, 0x0));
> >  		igt_require(igt_plane_has_format_mod(overlay, format_overlay, 0x0));
> > --=20
> > 2.40.1
> >=20

--sahpvladn74qq4am
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTtzXcACgkQwqF3j0dL
ehzyaxAAv8YOMzrljkX6flT8mBxVj7jVL2lUyamlAjdvlguDi3cUM7YFok1reB/E
32P5L2KY095RHM4BBvW7HEYwlnEuMHqkQL9j7nb4Uz3E0+8d4rIxUdrAC/Mlzg4H
EveC8CpAFB5GC6i9OBYHCTopMR9OIo/lge9HuvUvJZ9W/PYuhGPmaWcH39HZU9hY
7/vTwffZlwemwlbLXlrBHJwUagprXN68jfNrxfgKF9oss75C0I3sRJF06GVci0kr
91ghB0+wxSjRiU9CHTUcis9MVOBKRaB3OlXstjFyoTd0kXsQrAf+Sil94yYUQmz6
wIoyjw9+OblustZwhe/IctyoOunG4qHDfeafHZ8xbgua7ohjLi7JBv7ec292cynE
t7sZQo83e0j1IE91zeMoK5ReZBTxBGeKkjJ97m4hy4y5qK496pNG121iUc8jn6Wg
fEbAPk77xKPA/DLBe5THuz8R9jzPg5ksy+3r9p204avumSm30tCDM9Byq0Cj16v4
bzV/4PlQRswBznwtpULmgmobKNdVkgNhSlTfsbhpRKb2xR7V7u3lPsHLqb2I2ICO
KrtPGV9sJyVv6jUlMAdbuwbObZQdY5OaVbtphK1nTjN5bxsiHmt0j7C90QM9UcHe
EzE8eCr1q0tZoS8XOECsz6GnGKAQOqqpjcTkG9KkASPSi60bMdQ=
=nLM6
-----END PGP SIGNATURE-----

--sahpvladn74qq4am--
