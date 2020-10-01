Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791E26E226
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2020 21:18:35 +0000 (UTC)
Date: Thu, 1 Oct 2020 14:19:40 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20201001211939.GA22709@labuser-Z97X-UD5H>
References: <20201001073840.20785-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001073840.20785-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_big_joiner: Add test to
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

On Thu, Oct 01, 2020 at 01:08:40PM +0530, Karthik B S wrote:
> Added negative test to verify the different scenarios for big joiner.
> In the test, modeset is done on Pipe A for a big joiner mode and
> a second modeset is attempted on Pipe B which is expected to fail.
> Same functionality is validated for other pipes as well.
> =

> Secondly, the reverse is tested where a modeset is done on Pipe B
> and then a second big joiner modeset is attempted on Pipe A which is
> expected to fail. Same functionality is validated for other pipes as well.
> =

> v2: -Rename HDISPLAY_5K to MAX_HDISPLAY_PER_PIPE. (Manasi)
>     -Do not assume mode[0] will be the highest mode.
>      Loop through the mode list to find the 8k mode. (Manasi)
>     -Add a subtest for verifying basic 8k modeset on all pipes. (Manasi)
> =

> v3: -Add break after big joiner output is found in basic subtest. (Manasi)
>     -Fix the clean up part in the invalid-modeset subtest.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/Makefile.sources |   1 +
>  tests/kms_big_joiner.c | 257 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  3 files changed, 259 insertions(+)
>  create mode 100644 tests/kms_big_joiner.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index f32ea9cf..f59ac150 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -38,6 +38,7 @@ TESTS_progs =3D \
>  	kms_atomic_transition \
>  	kms_available_modes_crc \
>  	kms_big_fb \
> +	kms_big_joiner \
>  	kms_busy \
>  	kms_ccs \
>  	kms_concurrent \
> diff --git a/tests/kms_big_joiner.c b/tests/kms_big_joiner.c
> new file mode 100644
> index 00000000..58171ce8
> --- /dev/null
> +++ b/tests/kms_big_joiner.c
> @@ -0,0 +1,257 @@
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
> +#define MAX_HDISPLAY_PER_PIPE 5120
> +
> +IGT_TEST_DESCRIPTION("Test big joiner");
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	struct igt_fb fb;
> +	int mode_number;
> +	int n_pipes;
> +	uint32_t big_joiner_output_id;
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
> +
> +		if (data->big_joiner_output_id =3D=3D output->id) {
> +			mode =3D &output->config.connector->modes[data->mode_number];
> +			big_joiner_output =3D output;
> +		} else if (second_output =3D=3D NULL) {
> +			second_output =3D output;
> +		}
> +
> +		width =3D max(width, mode->hdisplay);
> +		height =3D max(height, mode->vdisplay);
> +	}
> +
> +	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +			      LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
> +
> +	for_each_pipe(display, i) {
> +		if (i < (data->n_pipes - 1)) {
> +			igt_output_set_pipe(big_joiner_output, i);
> +
> +			mode =3D &big_joiner_output->config.connector->modes[data->mode_numbe=
r];
> +			igt_output_override_mode(big_joiner_output, mode);
> +
> +			pipe =3D &display->pipes[i];
> +			plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(plane, &data->fb);
> +			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +
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
> +			ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_O=
NLY |
> +							    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +			igt_assert_lt(ret, 0);
> +
> +			igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> +			igt_output_set_pipe(second_output, PIPE_NONE);
> +
> +			pipe =3D &display->pipes[i];

So here you fixed this to get the plane only for big joiner master pipe
and set fb for that to NULL
Is that what fixed the NULL pointer dereferencing?

> +			plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(plane, NULL);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			igt_output_override_mode(big_joiner_output, NULL);
> +		}
> +	}
> +
> +	for_each_pipe(display, i) {
> +		if (i < (data->n_pipes - 1)) {
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
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +			igt_output_set_pipe(big_joiner_output, i);
> +
> +			mode =3D &big_joiner_output->config.connector->modes[data->mode_numbe=
r];
> +			igt_output_override_mode(big_joiner_output, mode);
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
> +			ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_O=
NLY |
> +							    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +			igt_assert_lt(ret, 0);
> +
> +			igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> +			igt_output_set_pipe(second_output, PIPE_NONE);
> +			igt_plane_set_fb(plane, NULL);
> +
> +			pipe =3D &display->pipes[i + 1];

But here we basically obtain the plane for pipes[i+1] which is for eDP in o=
ur test and
set the fb for that to NULL, how does that fix the issue?

May be for clarificatio on cleanup, add comments on why only particular fb =
needs to be set to NULL
so that its clear.

Manasi

> +			plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +			igt_plane_set_fb(plane, NULL);
> +
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +			igt_output_override_mode(big_joiner_output, NULL);
> +		}
> +	}
> +
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +}
> +
> +static void test_basic_modeset(data_t *data)
> +{
> +	drmModeModeInfo *mode;
> +	igt_output_t *output, *big_joiner_output =3D NULL;
> +	igt_display_t *display =3D &data->display;
> +	int width =3D 0, height =3D 0, i;
> +	igt_pipe_t *pipe;
> +	igt_plane_t *plane;
> +
> +	for_each_connected_output(display, output) {
> +		if (data->big_joiner_output_id =3D=3D output->id) {
> +			mode =3D &output->config.connector->modes[data->mode_number];
> +			big_joiner_output =3D output;
> +			width =3D mode->hdisplay;
> +			height =3D mode->vdisplay;
> +			break;
> +		}
> +	}
> +
> +	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +			      LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
> +
> +	for_each_pipe(display, i) {
> +		if (i < (data->n_pipes - 1)) {
> +			igt_output_set_pipe(big_joiner_output, i);
> +
> +			mode =3D &big_joiner_output->config.connector->modes[data->mode_numbe=
r];
> +			igt_output_override_mode(big_joiner_output, mode);
> +
> +			pipe =3D &display->pipes[i];
> +			plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_plane_set_fb(plane, &data->fb);
> +			igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +			igt_output_set_pipe(big_joiner_output, PIPE_NONE);
> +			igt_plane_set_fb(plane, NULL);
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +		}
> +	}
> +
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +}
> +
> +igt_main
> +{
> +	data_t data;
> +	bool big_joiner_mode_found =3D false;
> +	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	int valid_output =3D 0, i;
> +
> +	igt_fixture {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +
> +		for_each_connected_output(&data.display, output) {
> +			if (!big_joiner_mode_found) {
> +				for (i =3D 0; i < output->config.connector->count_modes; i++) {
> +					mode =3D &output->config.connector->modes[i];
> +					if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
> +						big_joiner_mode_found =3D true;
> +						data.mode_number =3D i;
> +						data.big_joiner_output_id =3D output->id;
> +						break;
> +					}
> +				}
> +			}
> +			valid_output++;
> +		}
> +
> +		data.n_pipes =3D 0;
> +		for_each_pipe(&data.display, i)
> +			data.n_pipes++;
> +
> +		igt_require_f(big_joiner_mode_found, "No output with 5k+ mode found\n"=
);
> +	}
> +
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes"=
);
> +	igt_subtest("basic")
> +		test_basic_modeset(&data);
> +
> +	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> +		     "when the pipe is active with a big joiner modeset");
> +	igt_subtest("invalid-modeset") {
> +		igt_require_f(valid_output > 1, "No valid Second output found\n");
> +		test_invalid_modeset(&data);
> +	}
> +
> +	igt_fixture
> +		igt_display_fini(&data.display);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 32f011e9..aea7d7f8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -22,6 +22,7 @@ test_progs =3D [
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
