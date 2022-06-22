Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637E511243B
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 11:39:27 +0000 (UTC)
Date: Wed, 22 Jun 2022 14:37:33 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Message-ID: <YrL+/TR3NY/fxhua@platvala-desk.ger.corp.intel.com>
References: <20220620091052.16625-1-nidhi1.gupta@intel.com>
 <20220620091052.16625-2-nidhi1.gupta@intel.com>
 <YrLjkQkSIDP2oT92@platvala-desk.ger.corp.intel.com>
 <PH7PR11MB6006FDE4EFB19FCA6C68F478C5B29@PH7PR11MB6006.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB6006FDE4EFB19FCA6C68F478C5B29@PH7PR11MB6006.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_invalid_mode.c: Convert
 tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 02:06:54PM +0300, Gupta, Nidhi1 wrote:
> Hi Petri,
> 
> Thanks for the review,
> 
> -----Original Message-----
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: Wednesday, June 22, 2022 3:11 PM
> To: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: Re: [PATCH i-g-t 1/2] tests/kms_invalid_mode.c: Convert tests to dynamic
> 
> On Mon, Jun 20, 2022 at 02:40:50PM +0530, Nidhi Gupta wrote:
> > Convert the existing subtests to dynamic subtests at pipe level.
> >
> > Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> > ---
> >  tests/kms_invalid_mode.c | 53
> > +++++++++++++++++-----------------------
> >  1 file changed, 23 insertions(+), 30 deletions(-)
> >
> > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
> > 630798d8..3d583202 100644
> > --- a/tests/kms_invalid_mode.c
> > +++ b/tests/kms_invalid_mode.c
> > @@ -32,6 +32,7 @@ typedef struct _data data_t;
> >
> >  struct _data {
> >       int drm_fd;
> > +     enum pipe pipe;
> >       igt_display_t display;
> >       igt_output_t *output;
> >       drmModeResPtr res;
> > @@ -177,21 +178,21 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
> >       return true;
> >  }
> >
> > -static int
> > +static void
> >  test_output(data_t *data)
> >  {
> >       igt_output_t *output = data->output;
> >       drmModeModeInfo mode;
> >       struct igt_fb fb;
> > -     int i;
> > +     int ret;
> > +     uint32_t crtc_id;
> >
> >       /*
> >        * FIXME test every mode we have to be more
> >        * sure everything is really getting rejected?
> >        */
> >       mode = *igt_output_get_mode(output);
> > -     if (!data->adjust_mode(data, &mode))
> > -             return 0;
> > +     igt_skip_on(!data->adjust_mode(data, &mode));
> 
> This may be a nitpick but prefer fail/skip constructs that don't need negation. Here that would be
> 
> igt_require(data->adjust_mode(data, &mode));
> 
> 
> >
> >       igt_create_fb(data->drm_fd,
> >                     max_t(uint16_t, mode.hdisplay, 64),
> 
> Previously this fb allocation was done once for all pipes, now it's done once per pipe. What's the effect on total runtime?
> 
> Without this patch time taken was 0.001s and with this patch time taken is 0.009s.
> Full subtest execution will take 0.009s.
> Overall it's a very small test.

Alright, that's an acceptable runtime.


-- 
Petri Latvala


> 
> 
> 
> > @@ -202,32 +203,14 @@ test_output(data_t *data)
> >
> >       kmstest_unset_all_crtcs(data->drm_fd, data->res);
> >
> > -     for (i = 0; i < data->res->count_crtcs; i++) {
> > -             int ret;
> > -
> > -             igt_info("Checking pipe %c connector %s with mode %s\n",
> > -                      'A'+i, output->name, mode.name);
> > +     crtc_id = data->display.pipes[data->pipe].crtc_id;
> >
> > -             ret = drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
> > -                                  fb.fb_id, 0, 0,
> > -                                  &output->id, 1, &mode);
> > -             igt_assert_lt(ret, 0);
> > -     }
> > +     ret = drmModeSetCrtc(data->drm_fd, crtc_id,
> > +                          fb.fb_id, 0, 0,
> > +                          &output->id, 1, &mode);
> > +     igt_assert_lt(ret, 0);
> >
> >       igt_remove_fb(data->drm_fd, &fb);
> > -
> > -     return 1;
> > -}
> > -
> > -static void test(data_t *data)
> > -{
> > -     int valid_connectors = 0;
> > -
> > -     for_each_connected_output(&data->display, data->output) {
> > -             valid_connectors += test_output(data);
> > -     }
> > -
> > -     igt_require_f(valid_connectors, "No suitable connectors found\n");
> >  }
> >
> >  static int i915_max_dotclock(data_t *data) @@ -297,6 +280,10 @@
> > static data_t data;
> >
> >  igt_main
> >  {
> > +
> > +     enum pipe pipe;
> > +        igt_output_t *output;
> > +
> 
> Something's off with this indentation.
> 
> 
> --
> Petri Latvala
> 
> 
> >       igt_fixture {
> >               data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> >
> > @@ -311,9 +298,15 @@ igt_main
> >       }
> >
> >       for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
> > -             igt_subtest(subtests[i].name) {
> > -                     data.adjust_mode = subtests[i].adjust_mode;
> > -                     test(&data);
> > +             igt_subtest_with_dynamic(subtests[i].name) {
> > +                     for_each_pipe_with_valid_output(&data.display, pipe, output) {
> > +                             igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
> > +                                     data.output = output;
> > +                                     data.pipe = pipe;
> > +                                     data.adjust_mode = subtests[i].adjust_mode;
> > +                                     test_output(&data);
> > +                             }
> > +                     }
> >               }
> >       }
> >
> > --
> > 2.26.2
> >
