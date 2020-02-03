Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0AF6E35D
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 13:58:31 +0000 (UTC)
Date: Mon, 3 Feb 2020 15:58:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200203135826.GC13686@intel.com>
References: <20200129135520.20336-1-swati2.sharma@intel.com>
 <20200129135520.20336-5-swati2.sharma@intel.com>
 <c97ce9f9-9eb9-5356-ccb2-3fcbbf26ae1b@intel.com>
 <761264bd-2ded-634c-ae52-cb173f5ac52c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <761264bd-2ded-634c-ae52-cb173f5ac52c@amd.com>
Subject: Re: [igt-dev] [PATCH 4/7] tests/kms_hdr: Add bpc switch subtests
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
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 03, 2020 at 08:25:40AM -0500, Kazlauskas, Nicholas wrote:
> Drawing on 10-bit framebuffers in IGT is incredibly slow, especially for =

> buffers larger than 1080p. I think it was a few seconds of overhead per =

> test.
> =

> AMD hardware can handle unscaled vs scaled without issue so changing it =

> to the full resolution is fine by me if it helps maintain compatibility =

> across vendors.

In kms_plane we use TEST_ONLY to probe whether we can use a smaller than
fullscreen plane.

> =

> Regards,
> Nicholas Kazlauskas
> =

> On 2020-02-03 3:49 a.m., Sharma, Swati2 wrote:
> > Hi Nicholas,
> > =

> > With this patch we are seeing regression on HSW.
> > Earlier we were getting scaler issue, I tried fixing it by having plane =

> > size to 512x512.
> > Now, in dmesg we can see "Plane must cover entire CRTC". For this to fi=
x =

> > i need to change the plane size to CRTC size; which will give scaler =

> > issue as earlier. Ultimately i have to change FB size to mode->w, mode-=
>h.
> > But according to comment its written "10-bit formats are slow, so limit =

> > the size"; so what you think is the right way to proceed? Should i =

> > change FB size? How much slowness is "slow" here?
> > =

> > @Ville what you think?
> > =

> > On 29-Jan-20 7:25 PM, Swati Sharma wrote:
> >> From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >>
> >> Add subtests to validate transitions between 8bpc and 10bpc. Test is
> >> made compatible for both amd and intel drivers. The test requires
> >> the "output_bpc" debugfs entry to read current and maximum bpc.
> >> This is exposed by amd driver, however intel driver doesn't expose it,
> >> so made that restriction to assert output bpc only for amd driver.
> >>
> >> v2: -Limiting plane size to 512x512 since regression observed in hsw
> >> =A0=A0=A0=A0=A0 because of plane scaling restriction.
> >> =A0=A0=A0=A0 -Minor alignment fix [Uma]
> >> v3: -Small fix
> >>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Leo Li <sunpeng.li@amd.com>
> >> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> >> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> >> ---
> >> =A0 tests/Makefile.sources |=A0=A0 1 +
> >> =A0 tests/kms_hdr.c=A0=A0=A0=A0=A0=A0=A0 | 295 +++++++++++++++++++++++=
++++++++++++++++++
> >> =A0 tests/meson.build=A0=A0=A0=A0=A0 |=A0=A0 1 +
> >> =A0 3 files changed, 297 insertions(+)
> >> =A0 create mode 100644 tests/kms_hdr.c
> >>
> >> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> >> index 4582f656..98411172 100644
> >> --- a/tests/Makefile.sources
> >> +++ b/tests/Makefile.sources
> >> @@ -54,6 +54,7 @@ TESTS_progs =3D \
> >> =A0=A0=A0=A0=A0 kms_frontbuffer_tracking \
> >> =A0=A0=A0=A0=A0 kms_getfb \
> >> =A0=A0=A0=A0=A0 kms_hdmi_inject \
> >> +=A0=A0=A0 kms_hdr \
> >> =A0=A0=A0=A0=A0 kms_invalid_dotclock \
> >> =A0=A0=A0=A0=A0 kms_lease \
> >> =A0=A0=A0=A0=A0 kms_legacy_colorkey \
> >> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> >> new file mode 100644
> >> index 00000000..ff21335a
> >> --- /dev/null
> >> +++ b/tests/kms_hdr.c
> >> @@ -0,0 +1,295 @@
> >> +/*
> >> + * Copyright 2019 Advanced Micro Devices, Inc.
> >> + *
> >> + * Permission is hereby granted, free of charge, to any person =

> >> obtaining a
> >> + * copy of this software and associated documentation files (the =

> >> "Software"),
> >> + * to deal in the Software without restriction, including without =

> >> limitation
> >> + * the rights to use, copy, modify, merge, publish, distribute, =

> >> sublicense,
> >> + * and/or sell copies of the Software, and to permit persons to whom =
the
> >> + * Software is furnished to do so, subject to the following condition=
s:
> >> + *
> >> + * The above copyright notice and this permission notice shall be =

> >> included in
> >> + * all copies or substantial portions of the Software.
> >> + *
> >> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, =

> >> EXPRESS OR
> >> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF =

> >> MERCHANTABILITY,
> >> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=A0 IN NO EVE=
NT =

> >> SHALL
> >> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, =

> >> DAMAGES OR
> >> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWI=
SE,
> >> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR
> >> + * OTHER DEALINGS IN THE SOFTWARE.
> >> + */
> >> +
> >> +#include "igt.h"
> >> +#include <fcntl.h>
> >> +#include <termios.h>
> >> +#include <unistd.h>
> >> +
> >> +IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
> >> +
> >> +/* Test flags. */
> >> +enum {
> >> +=A0=A0=A0 TEST_NONE =3D 1 << 0,
> >> +=A0=A0=A0 TEST_DPMS =3D 1 << 1,
> >> +=A0=A0=A0 TEST_SUSPEND =3D 1 << 2,
> >> +};
> >> +
> >> +/* BPC connector state. */
> >> +typedef struct output_bpc {
> >> +=A0=A0=A0 unsigned int current;
> >> +=A0=A0=A0 unsigned int maximum;
> >> +} output_bpc_t;
> >> +
> >> +/* Common test data. */
> >> +typedef struct data {
> >> +=A0=A0=A0 igt_display_t display;
> >> +=A0=A0=A0 igt_plane_t *primary;
> >> +=A0=A0=A0 igt_output_t *output;
> >> +=A0=A0=A0 igt_pipe_t *pipe;
> >> +=A0=A0=A0 igt_pipe_crc_t *pipe_crc;
> >> +=A0=A0=A0 drmModeModeInfo *mode;
> >> +=A0=A0=A0 enum pipe pipe_id;
> >> +=A0=A0=A0 int fd;
> >> +=A0=A0=A0 int w;
> >> +=A0=A0=A0 int h;
> >> +} data_t;
> >> +
> >> +/* Common test cleanup. */
> >> +static void test_fini(data_t *data)
> >> +{
> >> +=A0=A0=A0 igt_pipe_crc_free(data->pipe_crc);
> >> +=A0=A0=A0 igt_display_reset(&data->display);
> >> +}
> >> +
> >> +static void test_cycle_flags(data_t *data, uint32_t test_flags)
> >> +{
> >> +=A0=A0=A0 if (test_flags & TEST_DPMS) {
> >> +=A0=A0=A0=A0=A0=A0=A0 kmstest_set_connector_dpms(data->fd,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 da=
ta->output->config.connector,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DR=
M_MODE_DPMS_OFF);
> >> +=A0=A0=A0=A0=A0=A0=A0 kmstest_set_connector_dpms(data->fd,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 da=
ta->output->config.connector,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DR=
M_MODE_DPMS_ON);
> >> +=A0=A0=A0 }
> >> +
> >> +=A0=A0=A0 if (test_flags & TEST_SUSPEND)
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 SUSPEND_TEST_NONE);
> >> +}
> >> +
> >> +/* Returns the current and maximum bpc from the connector debugfs. */
> >> +static output_bpc_t get_output_bpc(data_t *data)
> >> +{
> >> +=A0=A0=A0 char buf[256];
> >> +=A0=A0=A0 char *start_loc;
> >> +=A0=A0=A0 int fd, res;
> >> +=A0=A0=A0 output_bpc_t info;
> >> +
> >> +=A0=A0=A0 fd =3D igt_debugfs_connector_dir(data->fd, data->output->na=
me, =

> >> O_RDONLY);
> >> +=A0=A0=A0 igt_assert(fd >=3D 0);
> >> +
> >> +=A0=A0=A0 res =3D igt_debugfs_simple_read(fd, "output_bpc", buf, size=
of(buf));
> >> +
> >> +=A0=A0=A0 igt_require(res > 0);
> >> +
> >> +=A0=A0=A0 close(fd);
> >> +
> >> +=A0=A0=A0 igt_assert(start_loc =3D strstr(buf, "Current: "));
> >> +=A0=A0=A0 igt_assert_eq(sscanf(start_loc, "Current: %u", &info.curren=
t), 1);
> >> +
> >> +=A0=A0=A0 igt_assert(start_loc =3D strstr(buf, "Maximum: "));
> >> +=A0=A0=A0 igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximu=
m), 1);
> >> +
> >> +=A0=A0=A0 return info;
> >> +}
> >> +
> >> +/* Verifies that connector has the correct output bpc. */
> >> +static void assert_output_bpc(data_t *data, unsigned int bpc)
> >> +{
> >> +=A0=A0=A0 output_bpc_t info =3D get_output_bpc(data);
> >> +
> >> +=A0=A0=A0 igt_require_f(info.maximum >=3D bpc,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Monitor doesn't support %u b=
pc, max is %u\n", bpc,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info.maximum);
> >> +
> >> +=A0=A0=A0 igt_assert_eq(info.current, bpc);
> >> +}
> >> +
> >> +/* Fills the FB with a test HDR pattern. */
> >> +static void draw_hdr_pattern(igt_fb_t *fb)
> >> +{
> >> +=A0=A0=A0 cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
> >> +
> >> +=A0=A0=A0 igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, =
1.0);
> >> +=A0=A0=A0 igt_paint_test_pattern(cr, fb->width, fb->height);
> >> +
> >> +=A0=A0=A0 igt_put_cairo_ctx(fb->fd, fb, cr);
> >> +}
> >> +
> >> +/* Prepare test data. */
> >> +static void prepare_test(data_t *data, igt_output_t *output, enum =

> >> pipe pipe)
> >> +{
> >> +=A0=A0=A0 igt_display_t *display =3D &data->display;
> >> +
> >> +=A0=A0=A0 data->pipe_id =3D pipe;
> >> +=A0=A0=A0 data->pipe =3D &data->display.pipes[data->pipe_id];
> >> +=A0=A0=A0 igt_assert(data->pipe);
> >> +
> >> +=A0=A0=A0 igt_display_reset(display);
> >> +
> >> +=A0=A0=A0 data->output =3D output;
> >> +=A0=A0=A0 igt_assert(data->output);
> >> +
> >> +=A0=A0=A0 data->mode =3D igt_output_get_mode(data->output);
> >> +=A0=A0=A0 igt_assert(data->mode);
> >> +
> >> +=A0=A0=A0 data->primary =3D
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_T=
YPE_PRIMARY);
> >> +
> >> +=A0=A0=A0 data->pipe_crc =3D igt_pipe_crc_new(data->fd, data->pipe_id,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 INTEL=
_PIPE_CRC_SOURCE_AUTO);
> >> +
> >> +=A0=A0=A0 igt_output_set_pipe(data->output, data->pipe_id);
> >> +
> >> +=A0=A0=A0 data->w =3D data->mode->hdisplay;
> >> +=A0=A0=A0 data->h =3D data->mode->vdisplay;
> >> +}
> >> +
> >> +static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
> >> +{
> >> +=A0=A0=A0 int i;
> >> +
> >> +=A0=A0=A0 for (i =3D 0; i < display->n_outputs; i++)
> >> +=A0=A0=A0=A0=A0=A0=A0 if (display->outputs[i].pending_pipe =3D=3D pip=
e)
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return false;
> >> +
> >> +=A0=A0=A0 return true;
> >> +}
> >> +
> >> +static void test_bpc_switch_on_output(data_t *data, igt_output_t =

> >> *output,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint3=
2_t flags)
> >> +{
> >> +=A0=A0=A0 igt_display_t *display =3D &data->display;
> >> +=A0=A0=A0 igt_crc_t ref_crc, new_crc;
> >> +=A0=A0=A0 enum pipe pipe;
> >> +=A0=A0=A0 igt_fb_t afb;
> >> +=A0=A0=A0 int afb_id;
> >> +
> >> +=A0=A0=A0 for_each_pipe(display, pipe) {
> >> +=A0=A0=A0=A0=A0=A0=A0 if (!igt_pipe_connector_valid(pipe, output))
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> >> +=A0=A0=A0=A0=A0=A0=A0 /*
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * If previous subtest of connector failed, p=
ipe
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * attached to that connector is not released.
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * Because of that we have to choose the non
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * attached pipe for this subtest.
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 */
> >> +=A0=A0=A0=A0=A0=A0=A0 if (!igt_pipe_is_free(display, pipe))
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 prepare_test(data, output, pipe);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 /* 10-bit formats are slow, so limit the size. =
*/
> >> +=A0=A0=A0=A0=A0=A0=A0 afb_id =3D igt_create_fb(data->fd, 512, 512, =

> >> DRM_FORMAT_XRGB2101010, 0, &afb);
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_assert(afb_id);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 draw_hdr_pattern(&afb);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 /* Start in 8bpc. */
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_set_fb(data->primary, &afb);
> >> +=A0=A0=A0=A0=A0=A0=A0 /*
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * Limiting plane size aswell, since most of =
gen7 and all of
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * gen8 doesn't support plane scaling at all.
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 */
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_plane_set_size(data->primary, 512, 512);
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_output_set_prop_value(data->output, =

> >> IGT_CONNECTOR_MAX_BPC, 8);
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_display_commit_atomic(display, =

> >> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> >> +=A0=A0=A0=A0=A0=A0=A0 /*
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * i915 driver doesn't expose max bpc as debu=
gfs entry,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * so limiting assert only for amd driver.
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 */
> >> +=A0=A0=A0=A0=A0=A0=A0 if (is_amdgpu_device(data->fd))
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assert_output_bpc(data, 8);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 /* Switch to 10bpc. */
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_output_set_prop_value(data->output, =

> >> IGT_CONNECTOR_MAX_BPC, 10);
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_display_commit_atomic(display, =

> >> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> >> +=A0=A0=A0=A0=A0=A0=A0 if (is_amdgpu_device(data->fd))
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assert_output_bpc(data, 10);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 /* Verify that the CRC are equal after DPMS or =
suspend. */
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_pipe_crc_collect_crc(data->pipe_crc, &ref_c=
rc);
> >> +=A0=A0=A0=A0=A0=A0=A0 test_cycle_flags(data, flags);
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_pipe_crc_collect_crc(data->pipe_crc, &new_c=
rc);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 /* Drop back to 8bpc. */
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_output_set_prop_value(data->output, =

> >> IGT_CONNECTOR_MAX_BPC, 8);
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_display_commit_atomic(display, =

> >> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> >> +=A0=A0=A0=A0=A0=A0=A0 if (is_amdgpu_device(data->fd))
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 assert_output_bpc(data, 8);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 /* CRC capture is clamped to 8bpc, so capture s=
hould match. */
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_assert_crc_equal(&ref_crc, &new_crc);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 test_fini(data);
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_remove_fb(data->fd, &afb);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 /*
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * Testing a output with a pipe is enough for=
 HDR
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * testing. No ROI in testing the connector w=
ith other
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 * pipes. So break the loop on pipe.
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 */
> >> +=A0=A0=A0=A0=A0=A0=A0 break;
> >> +=A0=A0=A0 }
> >> +}
> >> +
> >> +/* Returns true if an output supports max bpc property. */
> >> +static bool has_max_bpc(igt_output_t *output)
> >> +{
> >> +=A0=A0=A0 return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_output_get_prop(output, IGT_CONNEC=
TOR_MAX_BPC);
> >> +}
> >> +
> >> +static void test_bpc_switch(data_t *data, uint32_t flags)
> >> +{
> >> +=A0=A0=A0 igt_output_t *output;
> >> +=A0=A0=A0 int valid_tests =3D 0;
> >> +
> >> +=A0=A0=A0 for_each_connected_output(&data->display, output) {
> >> +=A0=A0=A0=A0=A0=A0=A0 if (!has_max_bpc(output))
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_info("BPC switch test execution on %s\n", o=
utput->name);
> >> +=A0=A0=A0=A0=A0=A0=A0 test_bpc_switch_on_output(data, output, flags);
> >> +=A0=A0=A0=A0=A0=A0=A0 valid_tests++;
> >> +=A0=A0=A0 }
> >> +
> >> +=A0=A0=A0 igt_require_f(valid_tests, "No connector found with MAX BPC =

> >> connector property\n");
> >> +}
> >> +
> >> +igt_main
> >> +{
> >> +=A0=A0=A0 data_t data =3D { 0 };
> >> +
> >> +=A0=A0=A0 igt_fixture {
> >> +=A0=A0=A0=A0=A0=A0=A0 data.fd =3D drm_open_driver_master(DRIVER_AMDGP=
U | DRIVER_INTEL);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 kmstest_set_vt_graphics_mode();
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_display_require(&data.display, data.fd);
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_require(data.display.is_atomic);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_display_require_output(&data.display);
> >> +=A0=A0=A0 }
> >> +
> >> +=A0=A0=A0 igt_describe("Tests switching between different display out=
put =

> >> bpc modes");
> >> +=A0=A0=A0 igt_subtest("bpc-switch") test_bpc_switch(&data, TEST_NONE);
> >> +=A0=A0=A0 igt_describe("Tests bpc switch with dpms");
> >> +=A0=A0=A0 igt_subtest("bpc-switch-dpms") test_bpc_switch(&data, TEST_=
DPMS);
> >> +=A0=A0=A0 igt_describe("Tests bpc switch with suspend");
> >> +=A0=A0=A0 igt_subtest("bpc-switch-suspend") test_bpc_switch(&data, =

> >> TEST_SUSPEND);
> >> +
> >> +=A0=A0=A0 igt_fixture {
> >> +=A0=A0=A0=A0=A0=A0=A0 igt_display_fini(&data.display);
> >> +=A0=A0=A0 }
> >> +}
> >> diff --git a/tests/meson.build b/tests/meson.build
> >> index bc8652aa..6ac2c830 100644
> >> --- a/tests/meson.build
> >> +++ b/tests/meson.build
> >> @@ -38,6 +38,7 @@ test_progs =3D [
> >> =A0=A0=A0=A0=A0 'kms_frontbuffer_tracking',
> >> =A0=A0=A0=A0=A0 'kms_getfb',
> >> =A0=A0=A0=A0=A0 'kms_hdmi_inject',
> >> +=A0=A0=A0 'kms_hdr',
> >> =A0=A0=A0=A0=A0 'kms_invalid_dotclock',
> >> =A0=A0=A0=A0=A0 'kms_lease',
> >> =A0=A0=A0=A0=A0 'kms_legacy_colorkey',
> >>
> > =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
