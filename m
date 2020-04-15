Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 15 Apr 2020 11:46:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20200415094649.2tgelyotjliao2dk@gilmour.lan>
References: <20191022005910.siuiwfikmr76qpg3@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191022005910.siuiwfikmr76qpg3@smtp.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 i-g-t 2/4] kms_writeback: Add initial
 writeback tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1878572899=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1878572899==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2rjj2ptmraoivge"
Content-Disposition: inline


--y2rjj2ptmraoivge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 21, 2019 at 09:59:17PM -0300, Brian Starkey wrote:
> Add tests for the WRITEBACK_PIXEL_FORMATS, WRITEBACK_OUT_FENCE_PTR and
> WRITEBACK_FB_ID properties on writeback connectors, ensuring their
> behaviour is correct.
>
> V6: Simon Ser
>  - Add igt documentation with igt_describe and IGT_TEST_DESCRIPTION
>  - Drop kmstest_force_connector with FORCE_CONNECTOR_ON in
> kms_writeback_get_output since userspace won't do this operation
>  - Add an igt_debug statement in case we don't use writeback output
>  - Drop flags parameter from do_writeback_test
>  - Remove do_writeback_test "igt_assert(*out_fence_ptr == -1)" after
> igt_display_try_commit_atomic
>  - Rename writeback_fb_id to writeback_test_fb
>  - Rework writeback_test_fb for checking buffer
>  - Move some tests from invalid_out_fence to writeback_test_fb
>  - Replace ret != 0 checking by ret == -EINVAL after invoke
> do_writeback_test
>  - Assert on igt_output_get_plane_type()
>  - Replace igt_fb_mod_to_tiling to DRM_FORMAT_MOD_LINEAR
>  - Rename tests
>  - Replace int ret by unsigned int fd_id when calling igt_create_fb
>
> Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> [rebased and updated do_writeback_test() function to address feedback]
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> [rebased and updated the patch to address feedback]
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  tests/Makefile.sources |   1 +
>  tests/kms_writeback.c  | 290 +++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build      |   1 +
>  3 files changed, 292 insertions(+)
>  create mode 100644 tests/kms_writeback.c
>
> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index 343be050..331270ae 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -81,6 +81,7 @@ TESTS_progs = \
>  	kms_universal_plane \
>  	kms_vblank \
>  	kms_vrr \
> +	kms_writeback \
>  	meta_test \
>  	perf \
>  	perf_pmu \
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> new file mode 100644
> index 00000000..a373ec4d
> --- /dev/null
> +++ b/tests/kms_writeback.c
> @@ -0,0 +1,290 @@
> +/*
> + * (C) COPYRIGHT 2017 ARM Limited. All rights reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_fb.h"
> +
> +IGT_TEST_DESCRIPTION("Exercise writeback feature.");
> +
> +static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
> +{
> +	drmModePropertyBlobRes *blob = NULL;
> +	uint64_t blob_id;
> +	int ret;
> +
> +	ret = kmstest_get_property(output->display->drm_fd,
> +				   output->config.connector->connector_id,
> +				   DRM_MODE_OBJECT_CONNECTOR,
> +				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
> +				   NULL, &blob_id, NULL);
> +	if (ret)
> +		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
> +
> +	igt_assert(blob);
> +
> +	return blob;
> +}
> +
> +static bool check_writeback_config(igt_display_t *display, igt_output_t *output)
> +{
> +	igt_fb_t input_fb, output_fb;
> +	igt_plane_t *plane;
> +	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
> +	int width, height, ret;
> +	unsigned int fb_id;
> +	drmModeModeInfo override_mode = {
> +		.clock = 25175,
> +		.hdisplay = 640,
> +		.hsync_start = 656,
> +		.hsync_end = 752,
> +		.htotal = 800,
> +		.hskew = 0,
> +		.vdisplay = 480,
> +		.vsync_start = 490,
> +		.vsync_end = 492,
> +		.vtotal = 525,
> +		.vscan = 0,
> +		.vrefresh = 60,
> +		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +		.name = {"640x480-60"},
> +	};
> +	igt_output_override_mode(output, &override_mode);
> +
> +	width = override_mode.hdisplay;
> +	height = override_mode.vdisplay;
> +
> +	fb_id = igt_create_fb(display->drm_fd, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &input_fb);
> +	igt_assert(fb_id >= 0);
> +
> +	fb_id = igt_create_fb(display->drm_fd, width, height, writeback_format, DRM_FORMAT_MOD_LINEAR, &output_fb);
> +	igt_assert(fb_id >= 0);
> +
> +	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(plane, &input_fb);
> +	igt_output_set_writeback_fb(output, &output_fb);
> +
> +	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_plane_set_fb(plane, NULL);
> +	igt_remove_fb(display->drm_fd, &input_fb);
> +	igt_remove_fb(display->drm_fd, &output_fb);
> +
> +	return !ret;
> +}
> +
> +static igt_output_t *kms_writeback_get_output(igt_display_t *display)
> +{
> +	int i;
> +
> +	for (i = 0; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +		int j;
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
> +			continue;
> +
> +		for (j = 0; j < igt_display_get_n_pipes(display); j++) {
> +			igt_output_set_pipe(output, j);
> +
> +			if (check_writeback_config(display, output)) {
> +				igt_debug("Using connector %u:%s on pipe %d\n",
> +					  output->config.connector->connector_id,
> +					  output->name, j);
> +				return output;
> +			}
> +		}
> +
> +		/* Restore any connectors we don't use, so we don't trip on them later */
> +		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
> +	}
> +
> +	igt_debug("The device does not enable writeback\n");
> +
> +	return NULL;
> +}
> +
> +static void check_writeback_fb_id(igt_output_t *output)
> +{
> +	uint64_t check_fb_id;
> +
> +	check_fb_id = igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
> +	igt_assert(check_fb_id == 0);
> +}
> +
> +static int do_writeback_test(igt_output_t *output, uint32_t fb_id,
> +			      int32_t *out_fence_ptr, bool ptr_valid)
> +{
> +	int ret;
> +	int flags = DRM_MODE_ATOMIC_ALLOW_MODESET;
> +	igt_display_t *display = output->display;
> +	struct kmstest_connector_config *config = &output->config;
> +
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, config->crtc->crtc_id);
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, fb_id);
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR, (uint64_t)out_fence_ptr);

On ARM (32bits), this cast creates a compilation error since the
pointer size isn't an uint64_t.

Maxime

--y2rjj2ptmraoivge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpbYCQAKCRDj7w1vZxhR
xfVVAQDAJe1dtrwcFeM6n55kpvOca8aIA9cM/5+SDl7tFwO/zQD+L0MNe/jM+xLV
b++2gKbSmYTxhPEqr26mYxMh2b6/gwc=
=EPZv
-----END PGP SIGNATURE-----

--y2rjj2ptmraoivge--

--===============1878572899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1878572899==--
