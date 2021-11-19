Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B90B6EC28
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 15:49:12 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id l22so45036211lfg.7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 07:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20211116210020.2300334-1-Rodrigo.Siqueira@amd.com>
 <CAJUqKUo8CCxMyxJj5cfKT2DW2yOSU-qiDmn4420e8vuOSi7b3A@mail.gmail.com>
 <fcf0eaf3-72b0-7b48-5a90-d4c2b244e271@gmail.com>
 <f4f4e959-d43a-dc07-e0bc-08bc7f635f3b@amd.com>
In-Reply-To: <f4f4e959-d43a-dc07-e0bc-08bc7f635f3b@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 19 Nov 2021 10:48:58 -0500
Message-ID: <CAJUqKUrCQokbRbrJ47Evmg0U=XUKcun7U=77gNzyUag0PpXNOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] amdgpu/amd_mode_switch: Introduce mode
 switch test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, igt-dev@lists.freedesktop.org, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 9:47 AM Rodrigo Siqueira Jordao
<rjordrigo@amd.com> wrote:
>
> Hi,
>
> On 2021-11-16 5:05 p.m., Juha-Pekka Heikkil=C3=A4 wrote:
> > I was wondering how is this different from kms_plane_lowres? On
> > kms_plane_lowres is also used crc to check also what's on screen stay g=
ood.
>
> Afaik, we ignore kms_plane_lowres since most tests look related to
> tiling-[x|y], which I think is an Intel modifier (again, maybe I'm
> wrong). Anyway, I tried to run it on an AMD device, and most
> kms_plane_lowres subtest skips.
>
> > /Juha-Pekka
> >
> > Mark Yacoub kirjoitti 16.11.2021 klo 23.29:
> >> The test looks pretty generic to me, can we make it a kms_ instead of
> >> AMD only?
>
> Mark, Juha-Pekka,
>
> Tbh, right now, I prefer to keep this test as AMD-specific because we
> are trying to fully upstream all of our tests, so we can rely on igt
> from the upstream. I can create a README file for amdgpu tests and
> create a TODO section where I can highlight that we can make this test
> and other generic; how about that?
A TODO section sounds good to me on Chromium end.
>
> Hi Lakshmi,
>
> This test is specific to AMD, but CI is failing. I think it is another
> false-positive. Here is the patch:
>
> https://patchwork.freedesktop.org/series/96996/
>
> Thanks
> Siqueira
>
> >> On Tue, Nov 16, 2021 at 4:00 PM Rodrigo Siqueira
> >> <Rodrigo.Siqueira@amd.com> wrote:
> >>>
> >>> From: Aurabindo Pillai <aurabindo.pillai@amd.com>
> >>>
> >>> Switching between different modes could potentially create pstate
> >>> warnings if clocks are not being set correctly.
> >>>
> >>> The subtest gets the highest and lowest mode supported on the connect=
or
> >>> and switch between them.
> >>>
> >>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> >>> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> >>> ---
> >>>   tests/amdgpu/amd_mode_switch.c | 210 ++++++++++++++++++++++++++++++=
+++
> >>>   tests/amdgpu/meson.build       |   1 +
> >>>   2 files changed, 211 insertions(+)
> >>>   create mode 100644 tests/amdgpu/amd_mode_switch.c
> >>>
> >>> diff --git a/tests/amdgpu/amd_mode_switch.c
> >>> b/tests/amdgpu/amd_mode_switch.c
> >>> new file mode 100644
> >>> index 00000000..270b1b9f
> >>> --- /dev/null
> >>> +++ b/tests/amdgpu/amd_mode_switch.c
> >>> @@ -0,0 +1,210 @@
> >>> +/*
> >>> + * Copyright 2021 Advanced Micro Devices, Inc.
> >>> + *
> >>> + * Permission is hereby granted, free of charge, to any person
> >>> obtaining a
> >>> + * copy of this software and associated documentation files (the
> >>> "Software"),
> >>> + * to deal in the Software without restriction, including without
> >>> limitation
> >>> + * the rights to use, copy, modify, merge, publish, distribute,
> >>> sublicense,
> >>> + * and/or sell copies of the Software, and to permit persons to whom
> >>> the
> >>> + * Software is furnished to do so, subject to the following conditio=
ns:
> >>> + *
> >>> + * The above copyright notice and this permission notice shall be
> >>> included in
> >>> + * all copies or substantial portions of the Software.
> >>> + *
> >>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >>> EXPRESS OR
> >>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> >>> MERCHANTABILITY,
> >>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> >>> EVENT SHALL
> >>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
> >>> DAMAGES OR
> >>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> >>> OTHERWISE,
> >>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> >>> USE OR
> >>> + * OTHER DEALINGS IN THE SOFTWARE.
> >>> + */
> >>> +
> >>> +#include "igt.h"
> >>> +#include <xf86drmMode.h>
> >>> +
> >>> +#define MAX_PIPES 6
> >>> +
> >>> +/* Common test data. */
> >>> +typedef struct data {
> >>> +       igt_display_t display;
> >>> +       igt_plane_t *primary[MAX_PIPES];
> >>> +       igt_output_t *output[MAX_PIPES];
> >>> +       int fd;
> >>> +} data_t;
> >>> +
> >>> +static void test_init(data_t *data)
> >>> +{
> >>> +       igt_display_t *display =3D &data->display;
> >>> +       int i;
> >>> +
> >>> +       for_each_pipe(display, i) {
> >>> +               igt_output_t *output =3D &display->outputs[i];
> >>> +
> >>> +               data->primary[i] =3D igt_pipe_get_plane_type(
> >>> +                       &data->display.pipes[i],
> >>> DRM_PLANE_TYPE_PRIMARY);
> >>> +
> >>> +               data->output[i] =3D output;
> >>> +       }
> >>> +
> >>> +       igt_require(data->output[0]);
> >>> +       igt_display_reset(display);
> >>> +}
> >>> +
> >>> +static void test_fini(data_t *data)
> >>> +{
> >>> +       igt_display_t *display =3D &data->display;
> >>> +
> >>> +       igt_display_reset(display);
> >>> +       igt_display_commit_atomic(display,
> >>> DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> >>> +}
> >>> +
> >>> +/* Forces a mode for a connector. */
> >>> +static void force_output_mode(data_t *d, igt_output_t *output,
> >>> +                             const drmModeModeInfo *mode)
> >>> +{
> >>> +       /* This allows us to create a virtual sink. */
> >>> +       if (!igt_output_is_connected(output)) {
> >>> +               kmstest_force_edid(d->fd, output->config.connector,
> >>> +                                  igt_kms_get_4k_edid());
> >>> +
> >>> +               kmstest_force_connector(d->fd, output->config.connect=
or,
> >>> +                                       FORCE_CONNECTOR_DIGITAL);
> >>> +       }
> >>> +
> >>> +       igt_output_override_mode(output, mode);
> >>> +}
> >>> +
> >>> +static void run_mode_switch_first_last(data_t *data, int num_pipes)
> >>> +{
> >>> +       igt_output_t *output;
> >>> +       struct igt_fb *buffer1[MAX_PIPES] =3D { NULL };
> >>> +       struct igt_fb *buffer2[MAX_PIPES] =3D { NULL };
> >>> +       drmModeConnectorPtr conn;
> >>> +       drmModeModeInfoPtr kmode;
> >>> +       void *user_data =3D NULL;
> >>> +       int i =3D 0;
> >>> +       int j =3D 0;
> >>> +
> >>> +       test_init(data);
> >>> +
> >>> +       igt_skip_on_f(num_pipes >
> >>> igt_display_get_n_pipes(&data->display) ||
> >>> +                             num_pipes > data->display.n_outputs,
> >>> +                     "ASIC does not have %d outputs/pipes\n",
> >>> num_pipes);
> >>> +
> >>> +       /* First supported mode */
> >>> +
> >>> +       for (j =3D 0; j < num_pipes; j++) {
> >>> +               output =3D data->output[j];
> >>> +               if (!igt_output_is_connected(output))
> >>> +                       continue;
> >>> +
> >>> +               conn =3D drmModeGetConnector(
> >>> +                       data->fd,
> >>> output->config.connector->connector_id);
> >>> +
> >>> +               kmode =3D &conn->modes[0];
> >>> +               if (buffer1[j] =3D=3D NULL) {
> >>> +                       igt_fb_t fb;
> >>> +                       buffer1[j] =3D &fb;
> >>> +                       igt_create_color_fb(data->fd, kmode->hdisplay=
,
> >>> +                                           kmode->vdisplay,
> >>> +                                           DRM_FORMAT_XRGB8888,
> >>> +                                           DRM_FORMAT_MOD_NONE, 1.f,
> >>> 0.f,
> >>> +                                           0.f, buffer1[j]);
> >>> +               }
> >>> +               igt_output_set_pipe(output, j);
> >>> +               force_output_mode(data, output, kmode);
> >>> +               igt_plane_set_fb(data->primary[j], buffer1[j]);
> >>> +               drmModeFreeConnector(conn);
> >>> +       }
> >>> +
> >>> +       igt_display_commit_atomic(&data->display,
> >>> DRM_MODE_ATOMIC_ALLOW_MODESET,
> >>> +                                 user_data);
> >>> +
> >>> +       /* Last supported mode */
> >>> +
> >>> +       for (j =3D 0; j < num_pipes; j++) {
> >>> +               output =3D data->output[j];
> >>> +               if (!igt_output_is_connected(output))
> >>> +                       continue;
> >>> +
> >>> +               conn =3D drmModeGetConnector(
> >>> +                       data->fd,
> >>> output->config.connector->connector_id);
> >>> +
> >>> +               kmode =3D &conn->modes[conn->count_modes - 1];
> >>> +               if (buffer2[j] =3D=3D NULL) {
> >>> +                       igt_fb_t fb;
> >>> +                       buffer2[j] =3D &fb;
> >>> +                       igt_create_color_fb(data->fd, kmode->hdisplay=
,
> >>> +                                           kmode->vdisplay,
> >>> +                                           DRM_FORMAT_XRGB8888,
> >>> +                                           DRM_FORMAT_MOD_NONE, 1.f,
> >>> 0.f,
> >>> +                                           0.f, buffer2[j]);
> >>> +               }
> >>> +               force_output_mode(data, output, kmode);
> >>> +               igt_plane_set_fb(data->primary[j], buffer2[j]);
> >>> +               drmModeFreeConnector(conn);
> >>> +       }
> >>> +
> >>> +       igt_display_commit_atomic(&data->display,
> >>> DRM_MODE_ATOMIC_ALLOW_MODESET,
> >>> +                                 user_data);
> >>> +
> >>> +       /* First supported again */
> >>> +       for (j =3D 0; j < num_pipes; j++) {
> >>> +               output =3D data->output[j];
> >>> +               if (!igt_output_is_connected(output))
> >>> +                       continue;
> >>> +
> >>> +               conn =3D drmModeGetConnector(
> >>> +                       data->fd,
> >>> output->config.connector->connector_id);
> >>> +
> >>> +               kmode =3D &conn->modes[0];
> >>> +               force_output_mode(data, output, kmode);
> >>> +               igt_plane_set_fb(data->primary[j], buffer1[j]);
> >>> +               drmModeFreeConnector(conn);
> >>> +       }
> >>> +
> >>> +       igt_display_commit_atomic(&data->display,
> >>> DRM_MODE_ATOMIC_ALLOW_MODESET,
> >>> +                                 user_data);
> >>> +
> >>> +       test_fini(data);
> >>> +
> >>> +       for (i =3D 0; i <=3D num_pipes; i++) {
> >>> +               igt_remove_fb(data->fd, buffer1[i]);
> >>> +               igt_remove_fb(data->fd, buffer2[i]);
> >>> +       }
> >>> +}
> >>> +
> >>> +IGT_TEST_DESCRIPTION("Test switching between supported modes");
> >>> +igt_main
> >>> +{
> >>> +       data_t data;
> >>> +       int i =3D 0;
> >>> +
> >>> +       igt_skip_on_simulation();
> >>> +
> >>> +       memset(&data, 0, sizeof(data));
> >>> +
> >>> +       igt_fixture
> >>> +       {
> >>> +               data.fd =3D drm_open_driver_master(DRIVER_AMDGPU);
> >>> +
> >>> +               kmstest_set_vt_graphics_mode();
> >>> +
> >>> +               igt_display_require(&data.display, data.fd);
> >>> +               igt_require(&data.display.is_atomic);
> >>> +               igt_display_require_output(&data.display);
> >>> +       }
> >>> +
> >>> +       for (i =3D 0; i < MAX_PIPES; i++) {
> >>> +               igt_describe(
> >>> +                       "Test between switching highest and lowest
> >>> supported mode");
> >>> +               igt_subtest_f("mode-switch-first-last-pipe-%d", i)
> >>> +                       run_mode_switch_first_last(&data, i + 1);
> >>> +       }
> >>> +
> >>> +       igt_fixture
> >>> +       {
> >>> +               igt_display_fini(&data.display);
> >>> +       }
> >>> +}
> >>> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> >>> index b736c456..5216e194 100644
> >>> --- a/tests/amdgpu/meson.build
> >>> +++ b/tests/amdgpu/meson.build
> >>> @@ -16,6 +16,7 @@ if libdrm_amdgpu.found()
> >>>                            'amd_mem_leak',
> >>>                            'amd_link_settings',
> >>>                            'amd_vrr_range',
> >>> +                         'amd_mode_switch',
> >>>                          ]
> >>>          amdgpu_deps +=3D libdrm_amdgpu
> >>>   endif
> >>> --
> >>> 2.25.1
> >>>
>
