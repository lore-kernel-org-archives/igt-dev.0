Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113766E8EF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Nov 2021 17:39:15 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y26so15846258lfa.11
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Nov 2021 09:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20211110195302.2487455-1-markyacoub@chromium.org>
 <YY0MtiNsyqp/QoJO@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YY0MtiNsyqp/QoJO@platvala-desk.ger.corp.intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 11 Nov 2021 12:39:02 -0500
Message-ID: <CAJUqKUoWUDpQg6bMCoGJMFv4iqG=FeS9=T2zBBo6RtSSvYn8-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests: Remove restrictions on tests running
 only DRIVER_INTEL and DRIVER_AMDGPU
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: robdclark@chromium.org, igt-dev@lists.freedesktop.org, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Applied. Thanks!

On Thu, Nov 11, 2021 at 7:30 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Wed, Nov 10, 2021 at 02:53:02PM -0500, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > Drivers such as MSM are able to run tests that are made generic through
> > supporting another driver that's not i915. Removing the restriction that
> > enables the test on a 2 drivers only allow the tests to run on other
> > drivers.
> >
> > [How]
> > 1. Replace DRIVER_INTEL | DRIVER_AMDGPU by DRIVER_ANY
> > 2. Make the checks more broad to allow intel generic implementation to
> > work on all drivers while keeping special amdgpu's quirks.
> >
> > Tested on Trogdor (MSM)
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
>
> Thanks for this!
>
>
> > ---
> >  tests/kms_hdr.c            |  2 +-
> >  tests/kms_plane_multiple.c |  2 +-
> >  tests/kms_plane_scaling.c  |  2 +-
> >  tests/kms_rotation_crc.c   | 52 +++++++++++++++++++++++---------------
> >  4 files changed, 34 insertions(+), 24 deletions(-)
> >
> > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> > index 5b8529c8..2a76c7ec 100644
> > --- a/tests/kms_hdr.c
> > +++ b/tests/kms_hdr.c
> > @@ -643,7 +643,7 @@ igt_main
> >       data_t data = {};
> >
> >       igt_fixture {
> > -             data.fd = drm_open_driver_master(DRIVER_AMDGPU | DRIVER_INTEL);
> > +             data.fd = drm_open_driver_master(DRIVER_ANY);
> >
> >               kmstest_set_vt_graphics_mode();
> >
> > diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> > index 45cabb50..e3aa2e7c 100644
> > --- a/tests/kms_plane_multiple.c
> > +++ b/tests/kms_plane_multiple.c
> > @@ -445,7 +445,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
> >       enum pipe pipe;
> >
> >       igt_fixture {
> > -             data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
> > +             data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> >               kmstest_set_vt_graphics_mode();
> >               igt_require_pipe_crc(data.drm_fd);
> >               igt_display_require(&data.display, data.drm_fd);
> > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > index 4c517a43..270f7615 100644
> > --- a/tests/kms_plane_scaling.c
> > +++ b/tests/kms_plane_scaling.c
> > @@ -709,7 +709,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
> >       enum pipe pipe;
> >
> >       igt_fixture {
> > -             data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
> > +             data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> >               igt_display_require(&data.display, data.drm_fd);
> >               data.devid = is_i915_device(data.drm_fd) ?
> >                       intel_get_drm_devid(data.drm_fd) : 0;
> > diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> > index 11401a6d..71525f95 100644
> > --- a/tests/kms_rotation_crc.c
> > +++ b/tests/kms_rotation_crc.c
> > @@ -295,15 +295,15 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
> >                       igt_plane_set_position(plane, data->pos_x, data->pos_y);
> >               igt_display_commit2(display, COMMIT_ATOMIC);
> >
> > -             if (is_i915_device(data->gfx_fd)) {
> > +             if (is_amdgpu_device(data->gfx_fd)) {
> > +                     igt_pipe_crc_collect_crc(
> > +                             data->pipe_crc,
> > +                             &data->crc_rect[data->output_crc_in_use][rect].flip_crc);
> > +             } else {
> >                       igt_pipe_crc_get_current(
> >                               display->drm_fd, data->pipe_crc,
> >                               &data->crc_rect[data->output_crc_in_use][rect].flip_crc);
> >                       igt_remove_fb(data->gfx_fd, &data->fb_flip);
> > -             } else if (is_amdgpu_device(data->gfx_fd)) {
> > -                     igt_pipe_crc_collect_crc(
> > -                             data->pipe_crc,
> > -                             &data->crc_rect[data->output_crc_in_use][rect].flip_crc);
> >               }
> >
> >               /*
> > @@ -318,13 +318,15 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
> >                       igt_plane_set_position(plane, data->pos_x, data->pos_y);
> >               igt_display_commit2(display, COMMIT_ATOMIC);
> >
> > -             if (is_i915_device(data->gfx_fd)) {
> > -                     igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> > -                                     &data->crc_rect[data->output_crc_in_use][rect].ref_crc);
> > -             } else if (is_amdgpu_device(data->gfx_fd)) {
> > -                     igt_pipe_crc_collect_crc(data->pipe_crc,
> > -                                     &data->crc_rect[data->output_crc_in_use][rect].ref_crc);
> > +             if (is_amdgpu_device(data->gfx_fd)) {
> > +                     igt_pipe_crc_collect_crc(
> > +                             data->pipe_crc,
> > +                             &data->crc_rect[data->output_crc_in_use][rect].ref_crc);
> >                       igt_remove_fb(data->gfx_fd, &data->fb_flip);
> > +             } else {
> > +                     igt_pipe_crc_get_current(
> > +                             display->drm_fd, data->pipe_crc,
> > +                             &data->crc_rect[data->output_crc_in_use][rect].ref_crc);
> >               }
> >               data->crc_rect[data->output_crc_in_use][rect].valid = true;
> >       }
> > @@ -383,12 +385,15 @@ static void test_single_case(data_t *data, enum pipe pipe,
> >       igt_assert_eq(ret, 0);
> >
> >       /* Check CRC */
> > -     if (is_i915_device(data->gfx_fd))
> > -             igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> > -     else if (is_amdgpu_device(data->gfx_fd))
> > +     if (is_amdgpu_device(data->gfx_fd)) {
> >               igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
> > -     igt_assert_crc_equal(&data->crc_rect[data->output_crc_in_use][rect].ref_crc,
> > -                          &crc_output);
> > +     } else {
> > +             igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> > +                                                              &crc_output);
> > +     }
> > +     igt_assert_crc_equal(
> > +             &data->crc_rect[data->output_crc_in_use][rect].ref_crc,
> > +             &crc_output);
> >
> >       /*
> >        * If flips are requested flip to a different fb and
> > @@ -410,10 +415,13 @@ static void test_single_case(data_t *data, enum pipe pipe,
> >                       igt_assert_eq(ret, 0);
> >               }
> >               kmstest_wait_for_pageflip(data->gfx_fd);
> > -             if (is_i915_device(data->gfx_fd))
> > -                     igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> > -             else if (is_amdgpu_device(data->gfx_fd))
> > +
> > +             if (is_amdgpu_device(data->gfx_fd)) {
> >                       igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
> > +             } else {
> > +                     igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> > +                                                                      &crc_output);
> > +             }
> >               igt_assert_crc_equal(&data->crc_rect[data->output_crc_in_use][rect].flip_crc,
> >                                    &crc_output);
> >       }
> > @@ -519,7 +527,9 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
> >                       /* Only support partial covering primary plane on gen9+ */
> >                       if (is_amdgpu_device(data->gfx_fd) ||
> >                               (plane_type == DRM_PLANE_TYPE_PRIMARY &&
> > -                         intel_display_ver(intel_get_drm_devid(data->gfx_fd)) < 9)) {
> > +                              is_i915_device(data->gfx_fd) &&
> > +                              intel_display_ver(
> > +                                      intel_get_drm_devid(data->gfx_fd)) < 9)) {
> >                               if (i != rectangle)
> >                                       continue;
> >                               else
> > @@ -1033,7 +1043,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
> >       int gen = 0;
> >
> >       igt_fixture {
> > -             data.gfx_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
> > +             data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
> >               if (is_i915_device(data.gfx_fd)) {
> >                       data.devid = intel_get_drm_devid(data.gfx_fd);
> >                       gen = intel_display_ver(data.devid);
> > --
> > 2.34.0.rc0.344.g81b53c2807-goog
> >
