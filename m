Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 19 Mar 2021 23:21:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YFUV3LNYs/DUEzsV@intel.com>
References: <20210318222124.970997-1-lyude@redhat.com>
 <20210318222124.970997-2-lyude@redhat.com>
 <YFS8vuuArWJtH9Mb@intel.com>
 <19ee182cd7965f3a250062dac927eccc7ae31a91.camel@redhat.com>
 <YFTmxXGL4qF9Z41X@intel.com>
 <51b473f2905a444868a1878bbbd0578ad888963c.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51b473f2905a444868a1878bbbd0578ad888963c.camel@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_cursor_crc: Probe
 kernel for cursor size support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 02:43:56PM -0400, Lyude Paul wrote:
> On Fri, 2021-03-19 at 20:00 +0200, Ville Syrj=E4l=E4 wrote:
> > On Fri, Mar 19, 2021 at 01:40:52PM -0400, Lyude Paul wrote:
> > > On Fri, 2021-03-19 at 17:01 +0200, Ville Syrj=E4l=E4 wrote:
> > > > On Thu, Mar 18, 2021 at 06:21:23PM -0400, Lyude wrote:
> > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > =

> > > > > Currently we just assume that every cursor size up to data-
> > > > > >cursor_max_w/h
> > > > > will
> > > > > be supported by the driver, and check for support of nonsquare cu=
rsors
> > > > > by
> > > > > checking if we're running on u815 and if so, which variant of int=
el
> > > > > hardware
> > > > > we're running on. This isn't really ideal as we're about to enabl=
e 32x32
> > > > > cursor
> > > > > size tests for nouveau, and Intel hardware doesn't support cursor=
 sizes
> > > > > that
> > > > > small.
> > > > > =

> > > > > So, fix this by removing has_nonsquare_cursors() and replacing it=
 with a
> > > > > more
> > > > > generic require_cursor_size() function which checks whether or no=
t the
> > > > > driver
> > > > > we're using supports a given cursor size by attempting a test-only
> > > > > atomic
> > > > > commit.
> > > > > =

> > > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > > Cc: Martin Peres <martin.peres@free.fr>
> > > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > > Cc: Jeremy Cline <jcline@redhat.com>
> > > > > ---
> > > > > =A0tests/kms_cursor_crc.c | 131 ++++++++++++++++++++++++---------=
--------
> > > > > =A01 file changed, 76 insertions(+), 55 deletions(-)
> > > > > =

> > > > > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > > > > index 3541ea06..b9c05472 100644
> > > > > --- a/tests/kms_cursor_crc.c
> > > > > +++ b/tests/kms_cursor_crc.c
> > > > > @@ -523,26 +523,43 @@ static void create_cursor_fb(data_t *data, =
int
> > > > > cur_w,
> > > > > int cur_h)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0igt_put_cairo_ctx(cr);
> > > > > =A0}
> > > > > =A0
> > > > > -static bool has_nonsquare_cursors(data_t *data)
> > > > > +static void require_cursor_size(data_t *data, int w, int h)
> > > > > =A0{
> > > > > -=A0=A0=A0=A0=A0=A0=A0uint32_t devid;
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_fb_t primary_fb;
> > > > > +=A0=A0=A0=A0=A0=A0=A0drmModeModeInfo *mode;
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_display_t *display =3D &data->display;
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_output_t *output =3D data->output;
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_t *primary, *cursor;
> > > > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > > > =A0
> > > > > -=A0=A0=A0=A0=A0=A0=A0if (!is_i915_device(data->drm_fd))
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_output_set_pipe(output, data->pipe);
> > > > > =A0
> > > > > -=A0=A0=A0=A0=A0=A0=A0devid =3D intel_get_drm_devid(data->drm_fd);
> > > > > +=A0=A0=A0=A0=A0=A0=A0mode =3D igt_output_get_mode(output);
> > > > > +=A0=A0=A0=A0=A0=A0=A0primary =3D igt_output_get_plane_type(outpu=
t,
> > > > > DRM_PLANE_TYPE_PRIMARY);
> > > > > +=A0=A0=A0=A0=A0=A0=A0cursor =3D igt_output_get_plane_type(output,
> > > > > DRM_PLANE_TYPE_CURSOR);
> > > > > =A0
> > > > > -=A0=A0=A0=A0=A0=A0=A0/*
> > > > > -=A0=A0=A0=A0=A0=A0=A0 * Test non-square cursors a bit on the pla=
tforms
> > > > > -=A0=A0=A0=A0=A0=A0=A0 * that support such things.
> > > > > -=A0=A0=A0=A0=A0=A0=A0 */
> > > > > -=A0=A0=A0=A0=A0=A0=A0if (devid =3D=3D PCI_CHIP_845_G || devid =
=3D=3D PCI_CHIP_I865_G)
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return true;
> > > > > +=A0=A0=A0=A0=A0=A0=A0/* Create temporary primary fb for testing =
*/
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_assert(igt_create_fb(data->drm_fd, mode=
->hdisplay, mode-
> > > > > > vdisplay, DRM_FORMAT_XRGB8888,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 LOCAL_DRM_FORMAT_MOD_NONE,
> > > > > &primary_fb));
> > > > > =A0
> > > > > -=A0=A0=A0=A0=A0=A0=A0if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(d=
evid))
> > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(primary, &primary_fb);
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(cursor, &data->fb);
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_size(cursor, w, h);
> > > > > +=A0=A0=A0=A0=A0=A0=A0igt_fb_set_size(&data->fb, cursor, w, h);
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0/* Test if the kernel supports the given cu=
rsor size or not */
> > > > > +=A0=A0=A0=A0=A0=A0=A0ret =3D igt_display_try_commit_atomic(displ=
ay,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_MODE_AT=
OMIC_TEST_ONLY |
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
> > > > > DRM_MODE_ATOMIC_ALLOW_MODESET,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NULL);
> > > > =

> > > > Would be better to not depend on atomic. We have platforms
> > > > that don't expose it yet.
> > > =

> > > Do you have any other ideas how we could probe for this then? it seem=
s like
> > > the
> > > only alternative would be to add intel-specific checks to fix that, o=
r add
> > > some
> > > ioctl for querying the minimum cursor size (which sounds preferable i=
mo).
> > > would
> > > the latter work for you, or do you have another idea?
> > =

> > Just do it for real instead of TEST_ONLY.
> =

> ah-and it'll still fail in that case I assume?

Yeah, should fail just the same if the driver doesn't like it.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
