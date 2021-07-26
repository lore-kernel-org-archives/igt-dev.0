Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CA06E156
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 14:55:04 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a26so15871381lfr.11
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 07:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210722215448.654382-1-bindu.r@amd.com>
 <20210723133304.u5zwqu2q7nigoewt@outlook.office365.com>
 <DM4PR12MB512068E13A4DF62D80C339D5F5E59@DM4PR12MB5120.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB512068E13A4DF62D80C339D5F5E59@DM4PR12MB5120.namprd12.prod.outlook.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 26 Jul 2021 10:54:51 -0400
Message-ID: <CAJUqKUqYDFtiL5-nvgeQzEvLkS-s4d5nbiM8iCtdZbgKQXTbvg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH v2] tests/kms_bw: New test for bandwidth
 validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "R, Bindu" <Bindu.R@amd.com>
Cc: "petri.latvala@intel.com" <petri.latvala@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Jacob,
 Anson" <Anson.Jacob@amd.com>, "Choi, Nicholas" <Nicholas.Choi@amd.com>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

 i

On Sat, Jul 24, 2021 at 5:17 AM R, Bindu <Bindu.R@amd.com> wrote:
>
> [AMD Official Use Only]
>
>
> This is awaiting moderators' review, after the approval may be the CI would be triggered.
>
> Thanks,
> Bindu
> ________________________________
> From: Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> Sent: Friday, July 23, 2021 9:33 AM
> To: R, Bindu <Bindu.R@amd.com>; petri.latvala@intel.com <petri.latvala@intel.com>; arek@hiler.eu <arek@hiler.eu>
> Cc: markyacoub@google.com <markyacoub@google.com>; igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Wentland, Harry <Harry.Wentland@amd.com>; Jacob, Anson <Anson.Jacob@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Choi, Nicholas <Nicholas.Choi@amd.com>
> Subject: Re: [PATCH v2] tests/kms_bw: New test for bandwidth validation
>
> For some reason, I don't see this patch in the patchwork and in the
> igt-dev mailing list. Did the CI run in this patch? Any idea on what
> happened here?
>
> Thanks
> Siqueira
>
> On 07/22, Bindu Ramamurthy wrote:
> > From: Aurabindo Pillai <aurabindo.pillai@amd.com>
> >
> > Add linear tiling mode tests
> >
> > Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > Acked-by: Bindu Ramamurthy <bindu.r@amd.com>
> > ---
> >
> > Changes since v2:
> >    Test added as generic IGT.
> >
> >
> >  tests/kms_bw.c    | 250 ++++++++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build |   1 +
> >  2 files changed, 251 insertions(+)
> >  create mode 100644 tests/kms_bw.c
> >
> > diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> > new file mode 100644
> > index 00000000..65b97c98
> > --- /dev/null
> > +++ b/tests/kms_bw.c
> > @@ -0,0 +1,250 @@
> > +/*
> > + * Copyrights 2021 Advanced Micro Devices, Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the "Software"),
> > + * to deal in the Software without restriction, including without limitation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom the
> > + * Software is furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + * OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#include "drm_mode.h"
> > +#include "igt.h"
> > +#include "drm.h"
> > +#include <stdio.h>
> > +#include <xf86drmMode.h>
> > +
> > +/* Maximum pipes on any ASIC. */
> > +#define MAX_PIPES 6
you can use the global IGT_MAX_PIPES instead. (lib/igt_kms.h)
> > +
> > +/* Common test data. */
> > +typedef struct data {
> > +        igt_display_t display;
> > +        igt_plane_t *primary[MAX_PIPES];
> > +        igt_output_t *output[MAX_PIPES];
> > +        igt_pipe_t *pipe[MAX_PIPES];
> > +        igt_pipe_crc_t *pipe_crc[MAX_PIPES];
> > +        drmModeModeInfo mode[MAX_PIPES];
> > +        enum pipe pipe_id[MAX_PIPES];
> > +        int w[MAX_PIPES];
> > +        int h[MAX_PIPES];
> > +        int fd;
> > +} data_t;
> > +
> > +static const drmModeModeInfo test_mode_1 = {
> > +     .name = "1920x1080p\0",
> > +     .vrefresh = 60,
> > +     .clock = 173000,
> > +     .hdisplay = 1920,
> > +     .hsync_start = 2048,
> > +     .hsync_end = 2248,
> > +     .htotal = 2576,
> > +     .vdisplay = 1080,
> > +     .vsync_start = 1083,
> > +     .vsync_end = 1088,
> > +     .vtotal = 1120,
> > +     .type = 0x40,
> > +     .flags = DRM_MODE_FLAG_NHSYNC,
> > +     .hskew = 0,
> > +     .vscan = 0,
> > +};
> > +
> > +static const drmModeModeInfo test_mode_2 = {
> > +     .name = "2560x1440p\0",
> > +     .vrefresh = 60,
> > +     .clock = 312250,
> > +     .hdisplay = 2560,
> > +     .hsync_start = 2752,
> > +     .hsync_end = 3024,
> > +     .htotal = 3488,
> > +     .vdisplay = 1440,
> > +     .vsync_start = 1443,
> > +     .vsync_end = 1448,
> > +     .vtotal = 1493,
> > +     .type = 0x40,
> > +     .flags = DRM_MODE_FLAG_NHSYNC,
> > +     .hskew = 0,
> > +     .vscan = 0,
> > +};
> > +
> > +static const drmModeModeInfo test_mode_3 = {
> > +     .name = "3840x2160p\0",
> > +     .vrefresh = 60,
> > +     .clock = 533000,
> > +     .hdisplay = 3840,
> > +     .hsync_start = 3888,
> > +     .hsync_end = 3920,
> > +     .htotal = 4000,
> > +     .vdisplay = 2160,
> > +     .vsync_start = 2163,
> > +     .vsync_end = 2168,
> > +     .vtotal = 2222,
> > +     .type = 0x40,
> > +     .flags = DRM_MODE_FLAG_NHSYNC,
> > +     .hskew = 0,
> > +     .vscan = 0,
> > +};
> > +
> > +static void test_init(data_t *data)
> > +{
> > +     igt_display_t *display = &data->display;
> > +     int i, max_pipes = display->n_pipes;
> > +
> > +     for_each_pipe(display, i) {
> > +             data->pipe_id[i] = PIPE_A + i;
> > +             data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
> > +             data->primary[i] = igt_pipe_get_plane_type(
> > +                     data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> > +             data->pipe_crc[i] =
> > +                     igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
> > +     }
> > +
> > +     for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
> > +             igt_output_t *output = &display->outputs[i];
> > +
> > +             data->output[i] = output;
> > +
> > +             /* Only allow physically connected displays for the tests. */
> > +             if (!igt_output_is_connected(output))
> > +                     continue;
> > +
> > +             igt_assert(kmstest_get_connector_default_mode(
> > +                     data->fd, output->config.connector, &data->mode[i]));
> > +
> > +             data->w[i] = data->mode[i].hdisplay;
> > +             data->h[i] = data->mode[i].vdisplay;
> > +     }
> > +
> > +
> > +     igt_require(data->output[0]);
> > +     igt_display_reset(display);
> > +}
> > +
> > +static void test_fini(data_t *data)
> > +{
> > +     igt_display_t *display = &data->display;
> > +     int i;
> > +
> > +     for_each_pipe(display, i) {
> > +             igt_pipe_crc_free(data->pipe_crc[i]);
> > +     }
> > +
> > +     igt_display_reset(display);
> > +     igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> > +}
> > +
> > +/* Forces a mode for a connector. */
> > +static void force_output_mode(data_t *d, igt_output_t *output,
> > +                           const drmModeModeInfo *mode)
> > +{
> > +     /* This allows us to create a virtual sink. */
> > +     if (!igt_output_is_connected(output)) {
> > +             kmstest_force_edid(d->fd, output->config.connector,
> > +                                igt_kms_get_4k_edid());
> > +
> > +             kmstest_force_connector(d->fd, output->config.connector,
> > +                                     FORCE_CONNECTOR_DIGITAL);
> > +     }
> > +
> > +     igt_output_override_mode(output, mode);
> > +}
> > +
> > +static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
> > +     igt_display_t *display = &data->display;
> > +     igt_output_t *output;
> > +     struct igt_fb buffer[MAX_PIPES];
> > +     igt_crc_t zero, captured[MAX_PIPES];
> > +     void *user_data = NULL;
> > +     int ret;
> > +     int i = 0;
> > +
> > +     test_init(data);
> > +
> > +     igt_skip_on_f(pipe >= igt_display_get_n_pipes(display),
> > +                   "ASIC does not have %d pipes\n", pipe);
Should this go above test_init?
> > +
> > +     /* create buffers */
> > +     for (i = 0; i <= pipe; i++) {
> > +
> > +             output = data->output[i];
> > +             if (!output) {
> > +                     continue;
> > +             }
> > +
> > +             force_output_mode(data, output, mode);
> > +
> > +             igt_create_color_fb(display->drm_fd, test_mode_1.hdisplay,
> > +                                 test_mode_1.vdisplay, DRM_FORMAT_XRGB8888,
> > +                                 DRM_FORMAT_MOD_NONE, 1.f, 0.f, 0.f,
> > +                                 &buffer[i]);
> > +
> > +             igt_output_set_pipe(output, i);
> > +
> > +             igt_plane_set_fb(data->primary[i], &buffer[i]);
> > +     }
> > +
> > +     ret = igt_display_try_commit_atomic(
> > +             display, DRM_MODE_ATOMIC_ALLOW_MODESET, user_data);
> > +
> > +     igt_assert_f(ret >= 0, "Modeset failed\n");
if you're gonna fail here anyway, why not use igt_display_commit_atomic instead?
> > +
> > +     for (i = 0; i <= pipe; i++) {
> > +             igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
> > +             igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
> > +                          "CRC is zero\n");
> > +             igt_remove_fb(display->drm_fd, &buffer[i]);
> > +     }
> > +
> > +     test_fini(data);
> > +}
> > +
> > +igt_main
> > +{
> > +     data_t data;
> > +     int i = 0;
> > +
> > +     igt_skip_on_simulation();
> > +
> > +     memset(&data, 0, sizeof(data));
> > +
> > +     igt_fixture
> > +     {
> > +             data.fd = drm_open_driver_master(DRIVER_ANY);
> > +
> > +             kmstest_set_vt_graphics_mode();
> > +
> > +             igt_display_require(&data.display, data.fd);
> > +             igt_require(&data.display.is_atomic);
> > +             igt_display_require_output(&data.display);
> > +
> > +     }
> > +
> > +     for (i = 0; i < MAX_PIPES; i++) {
> > +             igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> > +                           test_mode_1.name)
> > +                     run_test_linear_tiling(&data, i, &test_mode_1);
> > +             igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> > +                           test_mode_2.name)
> > +                     run_test_linear_tiling(&data, i, &test_mode_2);
instead of different struct per mode the testing each of them in an
identical way, you can make it more compact and robust by creating
instead an array of modes and loop over it inside the MAX_PIPES loop.
Should make it easy if you wanna add more modes, and will guarantee
they're tested identically. identical fields between modes such as
flags, vsync, hskew, ... can even be set with default value within the
struct definition.
> > +             igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> > +                           test_mode_3.name)
> > +                     run_test_linear_tiling(&data, i, &test_mode_3);
> > +     }
> > +
> > +     igt_fixture
> > +     {
> > +             igt_display_fini(&data.display);
> > +     }
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 1bdfddbb..6d1ebe42 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -22,6 +22,7 @@ test_progs = [
> >        'kms_big_fb',
> >        'kms_big_joiner' ,
> >        'kms_busy',
> > +     'kms_bw',
> >        'kms_ccs',
> >        'kms_cdclk',
> >        'kms_concurrent',
> > --
> > 2.25.1
> >
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
