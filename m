Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0076E357
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 08:17:05 +0000 (UTC)
Date: Wed, 22 Apr 2020 11:17:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200422081701.GB9497@platvala-desk.ger.corp.intel.com>
References: <20200413102144.19302-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413102144.19302-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_multipipe_modeset: Add test
 to validate max pipe configuration
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

On Mon, Apr 13, 2020 at 03:51:44PM +0530, Karthik B S wrote:
> Added test to validate max pipe configuration for a platform.
> In the test, the reference CRC is collected first by doing modeset
> on all the outputs individually.Then a simultaneous modeset is
> done on all the outputs and the CRC is collected. This is compared
> with the reference CRC.
> =

> If the number of outputs connected is less than the number of pipes
> supported by the platform, then the test skips.
> =

> This test is added to verify if the max pipe configuration for a
> given platform is working fine. Even though there are other tests
> which test multipipe configuration, they test some other functionalities
> as well together with multipipe. This is a stand alone test that
> intends to only verify simultaneous modeset at the max pipe configuration.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/Makefile.sources        |   1 +
>  tests/kms_multipipe_modeset.c | 180 ++++++++++++++++++++++++++++++++++
>  tests/meson.build             |   1 +
>  3 files changed, 182 insertions(+)
>  create mode 100644 tests/kms_multipipe_modeset.c
> =

> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 4e44c98c..903c5671 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -60,6 +60,7 @@ TESTS_progs =3D \
>  	kms_lease \
>  	kms_legacy_colorkey \
>  	kms_mmap_write_crc \
> +	kms_multipipe_modeset \
>  	kms_panel_fitting \
>  	kms_pipe_b_c_ivb \
>  	kms_pipe_crc_basic \
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> new file mode 100644
> index 00000000..11328165
> --- /dev/null
> +++ b/tests/kms_multipipe_modeset.c
> @@ -0,0 +1,180 @@
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
> +IGT_TEST_DESCRIPTION("Test simultaneous modeset on all the supported pip=
es");
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	struct igt_fb fb;
> +} data_t;
> +
> +static void run_test(data_t *data, int valid_outputs)
> +{
> +	igt_output_t *output;
> +	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] =3D { 0 };
> +	igt_crc_t ref_crcs[IGT_MAX_PIPES], new_crcs[IGT_MAX_PIPES];
> +	igt_display_t *display =3D &data->display;
> +	int width =3D 0, height =3D 0, i, count =3D 0;
> +	int output_to_pipe[valid_outputs];
> +	igt_pipe_t *pipe;
> +	igt_plane_t *plane;
> +	drmModeModeInfo *mode;
> +
> +	for_each_connected_output(display, output) {
> +		mode =3D igt_output_get_mode(output);
> +		igt_assert(mode);
> +
> +		igt_output_set_pipe(output, PIPE_NONE);
> +
> +		width =3D max(width, mode->hdisplay);
> +		height =3D max(height, mode->vdisplay);
> +	}
> +
> +	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +			      LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
> +
> +	/* Make pipe-ouput mapping which will be used unchanged across the test=
 */

Typo, pipe-output


> +	for_each_pipe(display, i) {
> +		count =3D 0;
> +		for_each_connected_output(display, output) {
> +			if (igt_pipe_connector_valid(i, output) &&
> +			    output->pending_pipe =3D=3D PIPE_NONE) {
> +				igt_output_set_pipe(output, i);
> +				output_to_pipe[count] =3D i;
> +				break;
> +			}
> +			count++;
> +		}
> +	}
> +
> +	/* Collect reference CRC by Committing individually on all outputs*/
> +	for_each_pipe(display, i) {
> +		pipe =3D &display->pipes[i];
> +		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +		mode =3D NULL;
> +
> +		if (is_i915_device(display->drm_fd))
> +			pipe_crcs[i] =3D igt_pipe_crc_new(display->drm_fd, i,
> +							INTEL_PIPE_CRC_SOURCE_AUTO);
> +
> +		count =3D 0;
> +		for_each_connected_output(display, output) {
> +			if (output_to_pipe[count] =3D=3D pipe->pipe) {
> +				igt_output_set_pipe(output, i);
> +				mode =3D igt_output_get_mode(output);
> +				igt_assert(mode);
> +			} else
> +				igt_output_set_pipe(output, PIPE_NONE);
> +			count++;
> +		}
> +
> +		igt_plane_set_fb(plane, &data->fb);
> +		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +		igt_pipe_crc_collect_crc(pipe_crcs[i], &ref_crcs[i]);

This will crash on non-i915. igt_pipe_crc_collect_crc needs a non-NULL pipe=
_crc.


> +	}
> +
> +	/* Simultaneously commit on all outputs */
> +	for_each_pipe(display, i) {
> +		pipe =3D &display->pipes[i];
> +		plane =3D igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +		mode =3D NULL;
> +
> +		count =3D 0;
> +		for_each_connected_output(display, output) {
> +			if (output_to_pipe[count] =3D=3D pipe->pipe) {
> +				igt_output_set_pipe(output, i);
> +				mode =3D igt_output_get_mode(output);
> +				igt_assert(mode);
> +				break;
> +			}
> +			count++;
> +		}
> +
> +		igt_plane_set_fb(plane, &data->fb);
> +		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
> +		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +	}
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/* CRC Verification */
> +	for (count =3D 0; count < valid_outputs; count++) {
> +		igt_pipe_crc_collect_crc(pipe_crcs[count], &new_crcs[count]);
> +		igt_assert_crc_equal(&ref_crcs[count], &new_crcs[count]);
> +	}
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +}
> +
> +static void test_multipipe(data_t *data)
> +{
> +	igt_output_t *output;
> +	int valid_outputs =3D 0, num_pipes;
> +
> +	num_pipes =3D igt_display_get_n_pipes(&data->display);
> +	for_each_connected_output(&data->display, output)
> +		valid_outputs++;
> +
> +	igt_require_f(valid_outputs =3D=3D num_pipes,
> +		      "Number of connected outputs not equal to the "
> +		      "number of pipes supported\n");

For debugging aid, please print the numbers as well.




-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
