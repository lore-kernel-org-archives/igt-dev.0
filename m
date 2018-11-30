Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id D63366E604
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Nov 2018 14:03:03 +0000 (UTC)
Message-ID: <d2ebd9a66c096db3ca8f64f0637b656790f5a4fc.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 30 Nov 2018 15:02:52 +0100
In-Reply-To: <21027818b010f3322de3717cd0c653079cb279f9.camel@redhat.com>
References: <20181114152918.14692-1-paul.kocialkowski@bootlin.com>
 <21027818b010f3322de3717cd0c653079cb279f9.camel@redhat.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] chamelium: Fix analog bridge detection
 memory leak
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0388404111=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0388404111==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NCDRGQGWZR3BkEajYxTq"


--=-NCDRGQGWZR3BkEajYxTq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2018-11-20 at 20:44 -0500, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Do you need me to push this? Or do you have push access for igt nowadays?

Sorry for the delayed answer. I don't have commit access, so feel free
to push this!

Thanks,

Paul

> On Wed, 2018-11-14 at 16:29 +0100, Paul Kocialkowski wrote:
> > The connector and EDID blob retrieved when checking for analog bridges
> > need to be freed before returning from the associated function.
> >=20
> > Fixes: f8d6afa67 ("tests/chamelium: Detect analog bridges and handle
> > EDID accordingly")
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  tests/kms_chamelium.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > index e0e3e3f1..55b346a9 100644
> > --- a/tests/kms_chamelium.c
> > +++ b/tests/kms_chamelium.c
> > @@ -175,8 +175,10 @@ check_analog_bridge(data_t *data, struct chamelium=
_port
> > *port)
> >  	unsigned char *edid;
> >  	char edid_vendor[3];
> > =20
> > -	if (chamelium_port_get_type(port) !=3D DRM_MODE_CONNECTOR_VGA)
> > +	if (chamelium_port_get_type(port) !=3D DRM_MODE_CONNECTOR_VGA) {
> > +		drmModeFreeConnector(connector);
> >  		return false;
> > +	}
> > =20
> >  	igt_assert(kmstest_get_property(data->drm_fd, connector->connector_id=
,
> >  					DRM_MODE_OBJECT_CONNECTOR, "EDID",
> > NULL,
> > @@ -191,14 +193,14 @@ check_analog_bridge(data_t *data, struct
> > chamelium_port *port)
> >  			  ((edid[9] & 0xe0) >> 5)) + '@';
> >  	edid_vendor[2] =3D (edid[9] & 0x1f) + '@';
> > =20
> > +	drmModeFreePropertyBlob(edid_blob);
> > +	drmModeFreeConnector(connector);
> > +
> >  	/* Analog bridges provide their own EDID */
> >  	if (edid_vendor[0] !=3D 'I' || edid_vendor[1] !=3D 'G' ||
> >  	    edid_vendor[0] !=3D 'T')
> >  		return true;
> > =20
> > -	drmModeFreePropertyBlob(edid_blob);
> > -	drmModeFreeConnector(connector);
> > -
> >  	return false;
> >  }
> > =20
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com

--=-NCDRGQGWZR3BkEajYxTq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlwBQwwACgkQ3cLmz3+f
v9ENjQgAmpU9exwAGAS0oHEM0hsXA1iSV1U2zpjy9bdUwanJFZXYYfX0Dti2+P2m
SBzwvzLOzy/Hp1thNz1gK+l0vRZ07xxVNTnSE/Id+vD4ZzvTrFYKRyA1LWweE8N0
oxc72xA98EpoE1sYaRKUfJ0MWF4JdoFHQKfBEQdTgVR2zRjFwsJf9cc190CMEe25
vs0n4xBim5aL0RMOKn/Wl+FhrkAZ4uTKlwR4AqROJvRpSiKdOfbZXzYrewMYNaTd
fL/7okZ6Ft+k8c/9RjK4pjdTVj6HbacnqNNCGpj8zxfxApCLku7d1F22ypsTdGnU
QAIqkvduwz/AuRJ5TsnNSJnnbFw2Ug==
=qjbv
-----END PGP SIGNATURE-----

--=-NCDRGQGWZR3BkEajYxTq--


--===============0388404111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0388404111==--
