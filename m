Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 18 Mar 2019 19:05:29 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190318220529.jqbvi6amvfe3c7es@smtp.gmail.com>
References: <20190115174747.3138-1-liviu.dudau@arm.com>
 <20190115174747.3138-2-liviu.dudau@arm.com>
 <20190204133134.a6cpke3h6x53eeo3@DESKTOP-E1NTVVP.localdomain>
 <20190306213005.7hvbnwl7dohr3vuv@smtp.gmail.com>
 <20190318104128.GH26454@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
In-Reply-To: <20190318104128.GH26454@e110455-lin.cambridge.arm.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/6] lib/igt_kms: Add writeback
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0242599941=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Petri Latvala <petri.latvala@intel.com>, Intel GFX ML <intel-gfx@lists.freedesktop.org>, IGT GPU Tools <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, nd <nd@arm.com>, Brian Starkey <Brian.Starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0242599941==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwpmbe6upli32oec"
Content-Disposition: inline


--mwpmbe6upli32oec
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/18, Liviu Dudau wrote:
> On Wed, Mar 06, 2019 at 06:30:05PM -0300, Rodrigo Siqueira wrote:
> > Hi Liviu,
> >=20
> > I=E2=80=99m using your patchset to guide my implementation of writeback=
 in the
> > VKMS, so, first of all, thanks :)
> >=20
> > During my work, I noticed that you=E2=80=99re setting the drmSetClientC=
ap()
> > before drmModeGetResources() which make the writeback capability
>=20
> before? I believe your patchset moves it to be before, which makes
> sense, as the writeback applies to connectors, not planes (sorry for the
> confusion, I think I wrote the code when we were toying with the idea
> that writeback was going to be a plane property).
>=20
> > =E2=80=98invisible=E2=80=99 for drmModeGetResources(). I made the follo=
wing change, and
> > I could pass the igt_display_require():
> >=20
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index f4ff3a96..bb2d8e06 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -1912,6 +1912,12 @@ void igt_display_require(igt_display_t *display,=
 int drm_fd)
> > =20
> >         display->drm_fd =3D drm_fd;
> > =20
> > +       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> > +       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
> > +               display->is_atomic =3D 1;
> > +
> > +       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> > +
> >         resources =3D drmModeGetResources(display->drm_fd);
> >         if (!resources)
> >                 goto out;
> > @@ -1924,12 +1930,6 @@ void igt_display_require(igt_display_t *display,=
 int drm_fd)
> >         display->pipes =3D calloc(sizeof(igt_pipe_t), display->n_pipes);
> >         igt_assert_f(display->pipes, "Failed to allocate memory for %d =
pipes\n", display->n_pipes);
> > =20
> > -       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> > -       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
> > -               display->is_atomic =3D 1;
> > -
> > -       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
> > -
> >         plane_resources =3D drmModeGetPlaneResources(display->drm_fd);
> >         igt_assert(plane_resources);
> >=20
> > I'm not 100% confident about this issue, because of this I will send an
> > RFC and see if I can get more details about this issue.
>=20
> It actually looks correct to me, so=20
>=20
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>=20
> >=20
> > Additionally, if you need any help with this patchset I will be glad to
> > help since I=E2=80=99m using it \o/
>=20
> Well, I need to send an updated version and if you could review that
> then I can merge it into igt.

Sure! I will be glad to take some time to review your code :)

I can also try to test it on my current implementation of VKMS.
One question, I have a NanoPc-T1 device [1] which has a Mali GPU, can I
test the writeback feature in this device? All kind of Mali GPU has
support for the writeback feature?

1. http://wiki.friendlyarm.com/wiki/index.php/NanoPC-T1

Thanks!
Best Regards
=20
> Best regards,
> Liviu
>=20
> >=20
> > Best Regards
> > Rodrigo Siqueira
> >=20
> > On 02/04, Brian Starkey wrote:
> > > Hi Liviu,
> > >=20
> > > On Tue, Jan 15, 2019 at 05:47:42PM +0000, Liviu Dudau wrote:
> > > > From: Brian Starkey <brian.starkey@arm.com>
> > >=20
> > > [snip]
> > >=20
> > > > =20
> > > > +/**
> > > > + * igt_output_set_writeback_fb:
> > > > + * @output: Target output
> > > > + * @fb: Target framebuffer
> > > > + *
> > > > + * This function sets the given @fb to be used as the target frame=
buffer for the
> > > > + * writeback engine at the next atomic commit. It will also reques=
t a writeback
> > > > + * out fence that will contain the fd number of the out fence crea=
ted by KMS if
> > > > + * the given @fb is valid.
> > > > + */
> > > > +void igt_output_set_writeback_fb(igt_output_t *output, struct igt_=
fb *fb)
> > > > +{
> > > > +	igt_display_t *display =3D output->display;
> > > > +
> > > > +	LOG(display, "%s: output_set_writeback_fb(%d)\n", output->name, f=
b ? fb->fb_id : 0);
> > > > +
> > > > +	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, =
fb ? fb->fb_id : 0);
> > > > +	/* only request a writeback out fence if the framebuffer is valid=
 */
> > > > +	if (fb)
> > > > +		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FE=
NCE_PTR,
> > > > +					  (ptrdiff_t)&output->writeback_out_fence_fd);
> > >=20
> > > I'm still not sure (ptrdiff_t) is the right type here, (uintptr_t)
> > > seems better.
> > >=20
> > > Thanks,
> > > -Brian
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> >=20
> > --=20
> > Rodrigo Siqueira
> > https://siqueira.tech
> > Graduate Student
> > Department of Computer Science
> > University of S=C3=A3o Paulo
>=20
>=20
>=20
> --=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF

--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=C3=A3o Paulo

--mwpmbe6upli32oec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlyQFikACgkQWJzP/com
vP8SoA/9GVQsa63nESYj0UL4FVUHQ6Y2t0WURblHTZOWWdeB3yJA+4Qe7wzRqRnT
cx1pzBSnes4HpfwvP9/4txi2cCCoS/ifJUUCg6WMcC9kjrPsZAtslge/U/CD5ZBo
gBkY7RY4daSCPeFLAdwpupZPi7BPFYeWSF55WjGqPc14mtxMyfRC60m5P05ZVzip
BNH9JNUBxuMqacqBQQdioB+1N0FX5nxyY/mUbEa7lfcjG2nsF3czEOAKewzw38on
KWP2kT67z751a7bFqSX+4vIO6TK8fWdJQyib9LAzLmkmhir93kY91ecX4DvGezZt
U/xnvp83iiGXpI2gY/Iyxda0zcLxewM1Phtaow3cTWyu8987mRNyQa0BZJ8C38LW
HKynTaHHFEoKrYuQDvgNIC4s5qYAAtmU7eCte10N8Jor5+ZHPHPySBvBkthDfpSe
YpAOMdNd5wifvoMgUY8Y4SyMJ2Gj3ax1lcQwwroqug3LioQk3Hgv5fjkWXJli0ou
sTvjMCF0/Y5pq8ekGfPYsksgDIETbwAY9CCNwTcT0rjMoODEQFvq/6f3RFXf0ROG
xDd06MIAxw1ttXEz5OTpfmDcEUJoKs/fA5TWRgettGdzcZjDS90EIaImIuDXolOH
qmuvNiEuGKbB/ohqxCl5DBJc1NWiBEYM/tQO7Wbz71FqR0FoE2s=
=TRqh
-----END PGP SIGNATURE-----

--mwpmbe6upli32oec--

--===============0242599941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0242599941==--
