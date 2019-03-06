Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 6 Mar 2019 18:30:05 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190306213005.7hvbnwl7dohr3vuv@smtp.gmail.com>
References: <20190115174747.3138-1-liviu.dudau@arm.com>
 <20190115174747.3138-2-liviu.dudau@arm.com>
 <20190204133134.a6cpke3h6x53eeo3@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
In-Reply-To: <20190204133134.a6cpke3h6x53eeo3@DESKTOP-E1NTVVP.localdomain>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t v5 1/6] lib/igt_kms: Add
 writeback support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1552729131=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Brian Starkey <Brian.Starkey@arm.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Intel GFX ML <intel-gfx@lists.freedesktop.org>, IGT GPU Tools <igt-dev@lists.freedesktop.org>, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1552729131==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x4gqla6hfukfpgju"
Content-Disposition: inline


--x4gqla6hfukfpgju
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Liviu,

I=E2=80=99m using your patchset to guide my implementation of writeback in =
the
VKMS, so, first of all, thanks :)

During my work, I noticed that you=E2=80=99re setting the drmSetClientCap()
before drmModeGetResources() which make the writeback capability
=E2=80=98invisible=E2=80=99 for drmModeGetResources(). I made the following=
 change, and
I could pass the igt_display_require():

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f4ff3a96..bb2d8e06 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1912,6 +1912,12 @@ void igt_display_require(igt_display_t *display, int=
 drm_fd)
=20
        display->drm_fd =3D drm_fd;
=20
+       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
+       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
+               display->is_atomic =3D 1;
+
+       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+
        resources =3D drmModeGetResources(display->drm_fd);
        if (!resources)
                goto out;
@@ -1924,12 +1930,6 @@ void igt_display_require(igt_display_t *display, int=
 drm_fd)
        display->pipes =3D calloc(sizeof(igt_pipe_t), display->n_pipes);
        igt_assert_f(display->pipes, "Failed to allocate memory for %d pipe=
s\n", display->n_pipes);
=20
-       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
-       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
-               display->is_atomic =3D 1;
-
-       drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
-
        plane_resources =3D drmModeGetPlaneResources(display->drm_fd);
        igt_assert(plane_resources);

I'm not 100% confident about this issue, because of this I will send an
RFC and see if I can get more details about this issue.

Additionally, if you need any help with this patchset I will be glad to
help since I=E2=80=99m using it \o/

Best Regards
Rodrigo Siqueira

On 02/04, Brian Starkey wrote:
> Hi Liviu,
>=20
> On Tue, Jan 15, 2019 at 05:47:42PM +0000, Liviu Dudau wrote:
> > From: Brian Starkey <brian.starkey@arm.com>
>=20
> [snip]
>=20
> > =20
> > +/**
> > + * igt_output_set_writeback_fb:
> > + * @output: Target output
> > + * @fb: Target framebuffer
> > + *
> > + * This function sets the given @fb to be used as the target framebuff=
er for the
> > + * writeback engine at the next atomic commit. It will also request a =
writeback
> > + * out fence that will contain the fd number of the out fence created =
by KMS if
> > + * the given @fb is valid.
> > + */
> > +void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *=
fb)
> > +{
> > +	igt_display_t *display =3D output->display;
> > +
> > +	LOG(display, "%s: output_set_writeback_fb(%d)\n", output->name, fb ? =
fb->fb_id : 0);
> > +
> > +	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, fb ?=
 fb->fb_id : 0);
> > +	/* only request a writeback out fence if the framebuffer is valid */
> > +	if (fb)
> > +		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_=
PTR,
> > +					  (ptrdiff_t)&output->writeback_out_fence_fd);
>=20
> I'm still not sure (ptrdiff_t) is the right type here, (uintptr_t)
> seems better.
>=20
> Thanks,
> -Brian
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=C3=A3o Paulo

--x4gqla6hfukfpgju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlyAO90ACgkQWJzP/com
vP9jLg//R8rXDuPRu4kq3JcGyFsfzPprGz0n3ZqYfN2GEgiMSBDm6rAdKtkEwF/o
WMxgE7y8Yze+EeDEG1ERpofgmbaPwG2KXAdMye1ZRMTmHRx0pVwzdL3EE8EtLNg+
aqPQ1xWtiWVbUYKjqkgN7uTfW4TnXcJKQI2Hv/pYNq25wqLVqVMpWaZ27NyzkzS5
F+FIzJxcXcrsT4BLgwz8CArBa5CDV/GbFm/cSAHrOAVC2gHT1ilpp/oZQHAWBKAT
FZBjo/b4UwFptPuBW3q3Z9gJ3DrjRAO6z6DURXm+hqkQWl3h6dw0g5xeAy+Px4of
PFOKfwsZVp7r1WujdbNndKfYHQVJZJmW6oAv28MagC1U7pKQMRJu1EK/wvhBXErh
v9q6KhZKaLU6iDlo/sB8KmV3W5G9BdhETtZdpKuyJLOZ8UlVNYtPQZpdzHO9+88i
qvhlRGo4VcK73XG1hGCnJyCtlCl5VdKaS9c9N9dnCMJnZyHSiOg8taFwRf9ipSbg
UMxEHqzIjfFYywD69263dBuU6NLZCPEgZUH+jdIsHkXi3hSjon0b8FNCnTMmlh7S
04ugZtvwVGLyUPo6t51jBJlwzBIQXcyx9v//MHXtAcE7Y46L/gLk0572hnrCYdwC
vlw/wMUDq4TTTi6Wf0I9rgVr76P7l2S1qJmL9HRI7rBEgJQ53/s=
=ecyz
-----END PGP SIGNATURE-----

--x4gqla6hfukfpgju--

--===============1552729131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============1552729131==--
