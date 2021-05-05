Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83AD6E125
 for <igt-dev@lists.freedesktop.org>; Wed,  5 May 2021 11:58:34 +0000 (UTC)
Date: Wed, 5 May 2021 14:58:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YJKIZmqQ2CfA1d70@intel.com>
References: <20210304155018.12745-1-ville.syrjala@linux.intel.com>
 <1b64c045-1f80-0e24-c707-7e522f861450@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b64c045-1f80-0e24-c707-7e522f861450@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Add CRC test to
 make sure the correct fb is being scanned out
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
To: Karthik B S <karthik.b.s@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 05, 2021 at 09:02:42AM +0530, Karthik B S wrote:
> On 3/4/2021 9:20 PM, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > Use CRC to confirm that the old fb is no longer being scanned
> > out after the async flip completes. We do this by immediately
> > rendering garbage into the old fb after receiving the flip
> > event. Should fail if someone is improperly using mailbox style
> > flips while claiming to do async flips.
> >
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >   tests/kms_async_flips.c | 135 ++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 135 insertions(+)
> >
> > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> > index e397a54b874f..bc0f95b9ebf6 100644
> > --- a/tests/kms_async_flips.c
> > +++ b/tests/kms_async_flips.c
> > @@ -52,6 +52,11 @@ typedef struct {
> >          drmModeConnectorPtr connector;
> >          unsigned long flip_timestamp_us;
> >          double flip_interval;
> > +       igt_pipe_crc_t *pipe_crc;
> > +       igt_crc_t ref_crc;
> > +       int flip_count;
> > +       int frame_count;
> > +       bool flip_pending;
> >   } data_t;
> >
> >   static drmModeConnectorPtr find_connector_for_modeset(data_t *data)
> > @@ -379,6 +384,132 @@ static void test_init(data_t *data)
> >          drmModeFreeResources(res);
> >   }
> >
> > +static void queue_vblank(data_t *data)
> > +{
> > +       drmVBlank wait_vbl =3D {
> > +               .request.type =3D DRM_VBLANK_RELATIVE | DRM_VBLANK_EVEN=
T |
> > +                       kmstest_get_pipe_from_crtc_id(data->drm_fd, dat=
a->crtc_id),
> > +               .request.sequence =3D 1,
> > +               .request.signal =3D (long)data,
> > +       };
> > +
> > +       igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_=
vbl) =3D=3D 0);
> > +}
> > +
> > +static void vblank_handler_crc(int fd_, unsigned int sequence, unsigne=
d int tv_sec,
> > +                              unsigned int tv_usec, void *_data)
> > +{
> > +       data_t *data =3D _data;
> > +       igt_crc_t crc;
> > +
> > +       data->frame_count++;
> > +
> > +       igt_pipe_crc_get_single(data->pipe_crc, &crc);
> > +       igt_assert_crc_equal(&data->ref_crc, &crc);
> > +
> > +       /* check again next vblank */
> > +       queue_vblank(data);
> > +}
> > +
> > +static void flip_handler_crc(int fd_, unsigned int sequence, unsigned =
int tv_sec,
> > +                            unsigned int tv_usec, void *_data)
> > +{
> > +       data_t *data =3D _data;
> > +
> > +       data->flip_pending =3D false;
> > +       data->flip_count++;
> > +}
> > +
> > +static void wait_events_crc(data_t *data)
> > +{
> > +       drmEventContext evctx =3D {
> > +               .version =3D 2,
> > +               .vblank_handler =3D vblank_handler_crc,
> > +               .page_flip_handler =3D flip_handler_crc,
> > +       };
> > +
> > +       while (data->flip_pending) {
> > +               struct pollfd pfd =3D {
> > +                       .fd =3D data->drm_fd,
> > +                       .events =3D POLLIN,
> > +               };
> > +               int ret;
> > +
> > +               ret =3D poll(&pfd, 1, 2000);
> > +
> > +               switch (ret) {
> > +               case 0:
> > +                       igt_assert_f(0, "Flip Timeout\n");
> > +                       break;
> > +               case 1:
> > +                       ret =3D drmHandleEvent(data->drm_fd, &evctx);
> > +                       igt_assert(ret =3D=3D 0);
> > +                       break;
> > +               default:
> > +                       /* unexpected */
> > +                       igt_assert(0);
> > +               }
> > +       }
> > +}
> > +
> > +static unsigned int clock_ms(void)
> > +{
> > +       struct timespec ts;
> > +
> > +       clock_gettime(CLOCK_MONOTONIC, &ts);
> > +
> > +       return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
> > +}
> > +
> > +static void test_crc(data_t *data)
> > +{
> > +       unsigned int frame =3D 0;
> > +       unsigned int start;
> > +       int ret;
> > +
> > +       data->flip_count =3D 0;
> > +       data->frame_count =3D 0;
> > +       data->flip_pending =3D false;
> > +
> > +       igt_draw_fill_fb(data->drm_fd, &data->bufs[frame], 0xff0000ff);
> > +       ret =3D drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[=
frame].fb_id, 0, 0,
> > +                            &data->connector->connector_id, 1, &data->=
connector->modes[0]);
> > +       igt_assert_eq(ret, 0);
> > +
> > +       data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd,
> > +                                         kmstest_get_pipe_from_crtc_id=
(data->drm_fd, data->crtc_id),
> > +                                         INTEL_PIPE_CRC_SOURCE_AUTO);
> > +
> > +       igt_pipe_crc_start(data->pipe_crc);
> > +       igt_pipe_crc_get_single(data->pipe_crc, &data->ref_crc);
> > +
> > +       queue_vblank(data);
> > +
> > +       start =3D clock_ms();
> > +
> > +       while (clock_ms() - start < 2000) {
> > +               /* fill the next fb with the expected color */
> > +               igt_draw_fill_fb(data->drm_fd, &data->bufs[frame], 0xff=
0000ff);
> > +
> > +               data->flip_pending =3D true;
> > +               ret =3D drmModePageFlip(data->drm_fd, data->crtc_id, da=
ta->bufs[frame].fb_id,
> > +                                     DRM_MODE_PAGE_FLIP_ASYNC | DRM_MO=
DE_PAGE_FLIP_EVENT, data);
> > +               igt_assert_eq(ret, 0);
> > +
> > +               wait_events_crc(data);
> > +
> > +               /* clobber the previous fb which should no longer be sc=
anned out */
> > +               frame =3D !frame;
> =

> Hi,
> =

> As mentioned in the commit message, we are trying to render garbage to =

> the old fb after flip events are completed.
> But here the frame variable is already updated before filling it with =

> garbage.
> This means we're filling this garbage on new fb and then we again fill =

> the same fb with green in the start of the while loop before submitting =

> the next flip?
> Is my understanding above correct? If not, could you please let me know =

> what I'm missing here?

We're trying to see if writing garbage to the fb which is not
supposedly being scanned out results in a crc change. And
before we actually flip back to that fb we need to get rid of
the garbage again and replace it with the correct color.

This should fail if the hardware/driver lies about supporting
async flips and actually fakes it using mailbox flips because
we will end up writing garbage into the current scanout buffer.

> =

> I tried to run it on my local setup by moving the the frame variable =

> update after the fill_fb below, but we see a CRC mismatch in that case.
> So I think I'm missing something here. But not sure what I'm missing.
> =

> Thanks,
> =

> Karthik.B.S
> =

> > +               igt_draw_fill_fb(data->drm_fd, &data->bufs[frame], rand=
());
> > +       }
> > +
> > +       igt_pipe_crc_stop(data->pipe_crc);
> > +       igt_pipe_crc_free(data->pipe_crc);
> > +
> > +       /* make sure we got at a reasonable number of async flips done =
*/
> > +       igt_assert_lt(data->frame_count * 2, data->flip_count);
> > +}
> > +
> >   igt_main
> >   {
> >          static data_t data;
> > @@ -419,6 +550,10 @@ igt_main
> >                  igt_subtest("invalid-async-flip")
> >                          test_invalid(&data);
> >
> > +               igt_describe("Use CRC to verify async flip scans out th=
e correct framebuffer");
> > +               igt_subtest("crc")
> > +                       test_crc(&data);
> > +
> >                  igt_fixture {
> >                          for (i =3D 0; i < ARRAY_SIZE(data.bufs); i++)
> >                                  igt_remove_fb(data.drm_fd, &data.bufs[=
i]);
> > --
> > 2.26.2
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
