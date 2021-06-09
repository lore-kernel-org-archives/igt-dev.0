Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A196EADC
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 19:24:33 +0000 (UTC)
Date: Wed, 9 Jun 2021 15:23:35 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210609192335.6mqb2l66fx2d2nec@outlook.office365.com>
References: <20210524184252.1320366-1-markyacoub@chromium.org>
 <016acc5c-c171-28eb-2e88-e735ca1647d7@amd.com>
 <CAJUqKUoKTMbngQ8ugsy_sZwU2cAZ0X6qgE0hr=nCdYvZPeabVg@mail.gmail.com>
In-Reply-To: <CAJUqKUoKTMbngQ8ugsy_sZwU2cAZ0X6qgE0hr=nCdYvZPeabVg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic: Match overlay size with
 primary plane on amdgpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2136951889=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, Petri Latvala <petri.latvala@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2136951889==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zn7vztbu7tdvmhed"
Content-Disposition: inline

--zn7vztbu7tdvmhed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/07, Mark Yacoub wrote:
> On Mon, May 31, 2021 at 4:03 PM Rodrigo Siqueira Jordao
> <Rodrigo.Siqueira@amd.com> wrote:
> >
> >
> >
> > On 2021-05-24 2:42 p.m., Mark Yacoub wrote:
> > > From: Mark Yacoub <markyacoub@google.com>
> > >
> > > [Why]
> > > AMDGPU has a restriction of not allowing overlay planes that do
> > > not fully cover the primary plane when the cursor is enabled.
> > > Testing with an overlay smaller than primary fails the commit.
> > >
> > > [How]
> > > On amdgpu, force the overlay size and src to match the primary plane,=
 but
> > > test with a smaller size on all other platforms.
> >
> > Hi Mark,
> >
> > That's a nice patch, and I understand the background behind it. However,
> > I don't think we need to change kms_atomic, mainly because we are not
> > enabling cursor in this test. Also, I recently applied a patch for
> > dealing with cursors in this situation; this test does not fail in the
> > latest amd-staging-drm-next.
> >
> > Thanks
> > Siqueira
> >
> Hi Siqueira, Thanks for letting me know. Would you mind backporting
> this patch that fixes it on ChromeOS? or just point me to the right
> commit and I can do that on my end. Thanks!

Hi Mark,

Tbh, I'm still not sure if ChromeOS wants my fix. We are discussing it
in a thread named:

  [PATCH] drm/amd/display: Fix overlay validation by considering cursors

If we decide to go ahead with that, I'll be glad to backport it to
ChromeOS for learn about the backport process.

Thanks
Siqueira

> > > Signed-off-by: markyacoub@chromium.org
> > > ---
> > >   tests/kms_atomic.c | 26 ++++++++++++++++++++------
> > >   1 file changed, 20 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> > > index df9c9df7..d5bfd38c 100644
> > > --- a/tests/kms_atomic.c
> > > +++ b/tests/kms_atomic.c
> > > @@ -491,13 +491,27 @@ plane_immutable_zpos(igt_display_t *display, ig=
t_pipe_t *pipe,
> > >       igt_remove_fb(display->drm_fd, &fb_upper);
> > >   }
> > >
> > > -static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, ig=
t_plane_t *plane)
> > > +static void plane_overlay(igt_pipe_t* pipe, igt_output_t* output, ig=
t_plane_t* plane, int drm_fd)
> > >   {
> > >       drmModeModeInfo *mode =3D igt_output_get_mode(output);
> > >       uint32_t format =3D plane_get_igt_format(plane);
> > >       struct igt_fb fb;
> > > -     uint32_t w =3D mode->hdisplay / 2;
> > > -     uint32_t h =3D mode->vdisplay / 2;
> > > +     uint32_t w, h, x, y;
> > > +
> > > +     /* On AMD, with hardware cursor, overlay plane must fully cover=
 the primary plane.
> > > +      * Test with smaller overlays on all other platforms. */
> > > +     if (is_amdgpu_device(drm_fd)) {
> > > +             w =3D mode->hdisplay;
> > > +             h =3D mode->vdisplay;
> > > +             x =3D 0;
> > > +             y =3D 0;
> > > +     }
> > > +     else {
> > > +             w =3D mode->hdisplay / 2;
> > > +             h =3D mode->vdisplay / 2;
> > > +             x =3D w / 2;
> > > +             y =3D h / 2;
> > > +     }
> > >
> > >       igt_require(format !=3D 0);
> > >
> > > @@ -505,7 +519,7 @@ static void plane_overlay(igt_pipe_t *pipe, igt_o=
utput_t *output, igt_plane_t *p
> > >                             format, I915_TILING_NONE, &fb);
> > >
> > >       igt_plane_set_fb(plane, &fb);
> > > -     igt_plane_set_position(plane, w/2, h/2);
> > > +     igt_plane_set_position(plane, x, y);
> > >
> > >       /* Enable the overlay plane using the atomic API, and double-ch=
eck
> > >        * state is what we think it should be. */
> > > @@ -519,7 +533,7 @@ static void plane_overlay(igt_pipe_t *pipe, igt_o=
utput_t *output, igt_plane_t *p
> > >       /* Re-enable the plane through the legacy plane API, and verify=
 through
> > >        * atomic. */
> > >       igt_plane_set_fb(plane, &fb);
> > > -     igt_plane_set_position(plane, w/2, h/2);
> > > +     igt_plane_set_position(plane, x, y);
> > >       plane_commit(plane, COMMIT_LEGACY, ATOMIC_RELAX_NONE);
> > >
> > >       /* Restore the plane to its original settings through the legac=
y plane
> > > @@ -1113,7 +1127,7 @@ igt_main
> > >               igt_require(overlay);
> > >
> > >               atomic_setup(&display, pipe, output, primary, &fb);
> > > -             plane_overlay(pipe_obj, output, overlay);
> > > +             plane_overlay(pipe_obj, output, overlay, display.drm_fd=
);
> > >       }
> > >
> > >       igt_describe("Test for KMS atomic modesetting on primary plane =
and ensure coherency between "
> > >
> >

--=20
Rodrigo Siqueira
https://siqueira.tech

--zn7vztbu7tdvmhed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDBFTcACgkQWJzP/com
vP/1Vw//e0uf5uiTP79ztCe3xvX0BmvCV/q51Rd9BsAelzvKGxrPlsqIuFXVzY1v
ROkpwDAZglEqy4Xc7kDus1oFxZa9YILQAkZCevXIruCFtFl5WZTe3xUsqQkGwWeJ
rCpSJIka3sHsgKVO3KcyyDfrZXBSdP8J62Lvr3pFfGKxwBBJ9Lrx/AH9RInW4Kos
1K0Onxwh2gOOHBqZv09UqBGix0zeQxrZ+e6QF8wqM93F7BG84wYMhLbMgXGbk/19
oc3Y5ldx5fMXQv+BDIF2IGCC/0IDIegoEVo6k1Ybqjf2R5gi2lSYgCpi6W0Z6ePc
6yf6pQT7SQuwMTuLnlVvGGCgOyHpbANxUqhd+DBAlDCYBhKHc0gZxSoi3tFkI6ge
5j+8B+Crm+gNioRWh1nzwW2zynS9Wyv6wiNTrZ79tm8Z/4dFLWFCTOWA0byoYlfZ
5ogOgMAkF54Pt6WeGfm35r3gyQw9heoDc/dwMmLhheonIgn8KmpbUSGGuwBqCLgb
n38iZqHYuIqudRdmfi49u93VV9e/2hOqvPatGGwdzupXiGKHdWV+jgvuG6HAtki3
84pa1l3+zmGpi8w8JbUC+3+0iPHNNdVN+ZwnHOJnAeLpY0qYOD1nPzj1w53VM2NN
eHVF9QmKl2lCqhjt8rgeG4FIguZuQB6rv0U9pFRs+vN+QIX1YEA=
=2r0T
-----END PGP SIGNATURE-----

--zn7vztbu7tdvmhed--

--===============2136951889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2136951889==--
