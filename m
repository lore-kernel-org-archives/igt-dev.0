Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1C6EA9F
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2020 22:57:42 +0000 (UTC)
Date: Thu, 13 Aug 2020 15:58:48 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20200813225847.GA29525@labuser-Z97X-UD5H>
References: <20200624094238.1719-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624094238.1719-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_joiner: Add test to
 validate big joiner
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 03:12:38PM +0530, Karthik B S wrote:
> Added negative test to verify the different scenarios for big joiner.
> In the test, modeset is done on Pipe A for a big joiner mode and
> a second modeset is attempted on Pipe B which is expected to fail.
> Same functionality is validated for other pipes as well.
> =

> Secondly, the reverse is tested where a modeset is done on Pipe B
> and then a second big joiner modeset is attempted on Pipe A which is
> expected to fail. Same functionality is validated for other pipes as well.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/Makefile.sources |   1 +
>  tests/kms_big_joiner.c | 171 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  3 files changed, 173 insertions(+)
>  create mode 100644 tests/kms_big_joiner.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index af900bcf..c761eb92 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -35,6 +35,7 @@ TESTS_progs =3D \
>  	kms_atomic_transition \
>  	kms_available_modes_crc \
>  	kms_big_fb \
> +	kms_big_joiner \
>  	kms_busy \
>  	kms_ccs \
>  	kms_concurrent \
> diff --git a/tests/kms_big_joiner.c b/tests/kms_big_joiner.c
> new file mode 100644
> index 00000000..125ea0b1
> --- /dev/null
> +++ b/tests/kms_big_joiner.c
> @@ -0,0 +1,171 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + * Author:
> + *  Karthik B S <karthik.b.s@intel.com>
> + */
> +
> +#include "igt.h"
> +
> +#define HDISPLAY_5K 5120

So here HDISPLAY_5K indicates the max per pipe plane hwidth limitation righ=
t?
May be rename this to something like MAX_HDISPLAY_PER_PIPE so that we dont =
confuse this with some 5K test?

> +
> +IGT_TEST_DESCRIPTION("Test big joiner");
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	struct igt_fb fb;
> +} data_t;
> +
> +static void test_invalid_modeset(data_t *data)
> +{
> +	drmModeModeInfo *mode;
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output, *big_joiner_output =3D NULL, *second_output =3D N=
ULL;
> +	int width =3D 0, height =3D 0, i, ret;
> +	igt_pipe_t *pipe;
> +	igt_plane_t *plane;
> +
> +	for_each_connected_output(display, output) {
> +		mode =3D &output->config.connector->modes[0];

So here the assumption is that mode[0] is always the highest mode or in 8K =
display
case the assumption that mode[0] will be the 8K mode.
While in most cases that is true, some displays might actual advertise stab=
le modes as
preferred mode and 8K mode somewhere lower in the list.
May be before even calling this test, in main(), loop through all modes to =
find mode > 5K and pass
its mode number?

Everything else does look good.

Manasi

> +
> +		width =3D max(width, mode->hdisplay);
> +		height =3D max(height, mode->vdisplay);
> +
> +		if (mode->hdisplay >=3D HDISPLAY_5K && big_joiner_output =3D=3D NULL)
> +			big_joiner_output =3D output;
> +		else if (second_output =3D=3D NULL)
> +			second_output =3D output;
> +
> +		igt_output_set_pipe(output, PIPE_NONE);
> +	}
> +
> +	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +			      LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
> +
> +	for_each_pipe(display, i) {
> +		if (i < (data->display.n_pipes - 1)) {
> +			igt_output_set_pipe(big_joiner_output, i);
> +
> +			mode =3D &big_joiner_output->config.connector->modes[0];
> +
> +			pipe =3D &display->pipes[i];
> +			plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(plane, &data->fb);
> +			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			igt_output_set_pipe(second_output, i + 1);
> +
> +			mode =3D igt_output_get_mode(second_output);
> +
> +			pipe =3D &display->pipes[i + 1];
> +			plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(plane, &data->fb);
> +			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +			/* This commit is expectd to fail as this pipe is being used for big =
joiner */
> +			ret =3D igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC=
_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +			igt_assert_lt(ret, 0);
> +
> +			igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> +			igt_output_set_pipe(second_output, PIPE_NONE);
> +		}
> +	}
> +
> +	for_each_pipe(display, i) {
> +		if (i < (data->display.n_pipes - 1)) {
> +			igt_output_set_pipe(second_output, i + 1);
> +
> +			mode =3D igt_output_get_mode(second_output);
> +
> +			pipe =3D &display->pipes[i + 1];
> +			plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(plane, &data->fb);
> +			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +			igt_output_set_pipe(big_joiner_output, i);
> +
> +			mode =3D &big_joiner_output->config.connector->modes[0];
> +
> +			pipe =3D &display->pipes[i];
> +			plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(plane, &data->fb);
> +			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +			/* This commit is expected to fail as the adjacent pipe is already in=
 use*/
> +			ret =3D igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC=
_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +			igt_assert_lt(ret, 0);
> +
> +			igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> +			igt_output_set_pipe(second_output, PIPE_NONE);
> +		}
> +	}
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +}
> +
> +igt_main
> +{
> +	data_t data;
> +	bool big_joiner_mode_found =3D false;
> +	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	int valid_output =3D 0;
> +
> +	igt_fixture {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +
> +		for_each_connected_output(&data.display, output) {
> +			mode =3D &output->config.connector->modes[0];
> +			if (mode->hdisplay >=3D HDISPLAY_5K)
> +				big_joiner_mode_found =3D true;
> +
> +			valid_output++;
> +		}
> +
> +		igt_require_f(big_joiner_mode_found, "No output with 5k+ mode found\n"=
);
> +		igt_require_f(valid_output > 1, "No valid Second output found\n");
> +	}
> +
> +	igt_describe("Verify if the modeset on the adjoining pipe is rejected"
> +		     "when the pipe is active with a big joiner modeset");
> +	igt_subtest("invalid-modeset")
> +		test_invalid_modeset(&data);
> +
> +	igt_fixture
> +		igt_display_fini(&data.display);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 28091794..430b43de 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -19,6 +19,7 @@ test_progs =3D [
>  	'kms_atomic_transition',
>  	'kms_available_modes_crc',
>  	'kms_big_fb',
> +	'kms_big_joiner' ,
>  	'kms_busy',
>  	'kms_ccs',
>  	'kms_concurrent',
> -- =

> 2.22.0
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
