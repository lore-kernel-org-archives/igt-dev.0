Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2079.outbound.protection.outlook.com [40.107.102.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FA26F3A1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 13:33:09 +0000 (UTC)
Date: Fri, 23 Jul 2021 09:33:04 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210723133304.u5zwqu2q7nigoewt@outlook.office365.com>
References: <20210722215448.654382-1-bindu.r@amd.com>
Content-Disposition: inline
In-Reply-To: <20210722215448.654382-1-bindu.r@amd.com>
MIME-Version: 1.0
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
To: Bindu Ramamurthy <bindu.r@amd.com>, petri.latvala@intel.com, arek@hiler.eu
Cc: Anson.Jacob@amd.com, igt-dev@lists.freedesktop.org, nicholas.choi@amd.com, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

For some reason, I don't see this patch in the patchwork and in the
igt-dev mailing list. Did the CI run in this patch? Any idea on what
happened here?

Thanks
Siqueira

On 07/22, Bindu Ramamurthy wrote:
> From: Aurabindo Pillai <aurabindo.pillai@amd.com>
> 
> Add linear tiling mode tests
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Acked-by: Bindu Ramamurthy <bindu.r@amd.com>
> ---
> 
> Changes since v2:
>    Test added as generic IGT. 
> 
> 
>  tests/kms_bw.c    | 250 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build |   1 +
>  2 files changed, 251 insertions(+)
>  create mode 100644 tests/kms_bw.c
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> new file mode 100644
> index 00000000..65b97c98
> --- /dev/null
> +++ b/tests/kms_bw.c
> @@ -0,0 +1,250 @@
> +/*
> + * Copyrights 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "drm_mode.h"
> +#include "igt.h"
> +#include "drm.h"
> +#include <stdio.h>
> +#include <xf86drmMode.h>
> +
> +/* Maximum pipes on any ASIC. */
> +#define MAX_PIPES 6
> +
> +/* Common test data. */
> +typedef struct data {
> +        igt_display_t display;
> +        igt_plane_t *primary[MAX_PIPES];
> +        igt_output_t *output[MAX_PIPES];
> +        igt_pipe_t *pipe[MAX_PIPES];
> +        igt_pipe_crc_t *pipe_crc[MAX_PIPES];
> +        drmModeModeInfo mode[MAX_PIPES];
> +        enum pipe pipe_id[MAX_PIPES];
> +        int w[MAX_PIPES];
> +        int h[MAX_PIPES];
> +        int fd;
> +} data_t;
> +
> +static const drmModeModeInfo test_mode_1 = {
> +	.name = "1920x1080p\0",
> +	.vrefresh = 60,
> +	.clock = 173000,
> +	.hdisplay = 1920,
> +	.hsync_start = 2048,
> +	.hsync_end = 2248,
> +	.htotal = 2576,
> +	.vdisplay = 1080,
> +	.vsync_start = 1083,
> +	.vsync_end = 1088,
> +	.vtotal = 1120,
> +	.type = 0x40,
> +	.flags = DRM_MODE_FLAG_NHSYNC,
> +	.hskew = 0,
> +	.vscan = 0,
> +};
> +
> +static const drmModeModeInfo test_mode_2 = {
> +	.name = "2560x1440p\0",
> +	.vrefresh = 60,
> +	.clock = 312250,
> +	.hdisplay = 2560,
> +	.hsync_start = 2752,
> +	.hsync_end = 3024,
> +	.htotal = 3488,
> +	.vdisplay = 1440,
> +	.vsync_start = 1443,
> +	.vsync_end = 1448,
> +	.vtotal = 1493,
> +	.type = 0x40,
> +	.flags = DRM_MODE_FLAG_NHSYNC,
> +	.hskew = 0,
> +	.vscan = 0,
> +};
> +
> +static const drmModeModeInfo test_mode_3 = {
> +	.name = "3840x2160p\0",
> +	.vrefresh = 60,
> +	.clock = 533000,
> +	.hdisplay = 3840,
> +	.hsync_start = 3888,
> +	.hsync_end = 3920,
> +	.htotal = 4000,
> +	.vdisplay = 2160,
> +	.vsync_start = 2163,
> +	.vsync_end = 2168,
> +	.vtotal = 2222,
> +	.type = 0x40,
> +	.flags = DRM_MODE_FLAG_NHSYNC,
> +	.hskew = 0,
> +	.vscan = 0,
> +};
> +
> +static void test_init(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	int i, max_pipes = display->n_pipes;
> +
> +	for_each_pipe(display, i) {
> +		data->pipe_id[i] = PIPE_A + i;
> +		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
> +		data->primary[i] = igt_pipe_get_plane_type(
> +			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> +		data->pipe_crc[i] =
> +			igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
> +	}
> +
> +	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +
> +		data->output[i] = output;
> +
> +		/* Only allow physically connected displays for the tests. */
> +		if (!igt_output_is_connected(output))
> +			continue;
> +
> +		igt_assert(kmstest_get_connector_default_mode(
> +			data->fd, output->config.connector, &data->mode[i]));
> +
> +		data->w[i] = data->mode[i].hdisplay;
> +		data->h[i] = data->mode[i].vdisplay;
> +	}
> +
> +
> +	igt_require(data->output[0]);
> +	igt_display_reset(display);
> +}
> +
> +static void test_fini(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	int i;
> +
> +	for_each_pipe(display, i) {
> +		igt_pipe_crc_free(data->pipe_crc[i]);
> +	}
> +
> +	igt_display_reset(display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +/* Forces a mode for a connector. */
> +static void force_output_mode(data_t *d, igt_output_t *output,
> +			      const drmModeModeInfo *mode)
> +{
> +	/* This allows us to create a virtual sink. */
> +	if (!igt_output_is_connected(output)) {
> +		kmstest_force_edid(d->fd, output->config.connector,
> +				   igt_kms_get_4k_edid());
> +
> +		kmstest_force_connector(d->fd, output->config.connector,
> +					FORCE_CONNECTOR_DIGITAL);
> +	}
> +
> +	igt_output_override_mode(output, mode);
> +}
> +
> +static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	struct igt_fb buffer[MAX_PIPES];
> +	igt_crc_t zero, captured[MAX_PIPES];
> +	void *user_data = NULL;
> +	int ret;
> +	int i = 0;
> +
> +	test_init(data);
> +
> +	igt_skip_on_f(pipe >= igt_display_get_n_pipes(display),
> +		      "ASIC does not have %d pipes\n", pipe);
> +
> +	/* create buffers */
> +	for (i = 0; i <= pipe; i++) {
> +
> +		output = data->output[i];
> +		if (!output) {
> +			continue;
> +		}
> +
> +		force_output_mode(data, output, mode);
> +
> +		igt_create_color_fb(display->drm_fd, test_mode_1.hdisplay,
> +				    test_mode_1.vdisplay, DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_NONE, 1.f, 0.f, 0.f,
> +				    &buffer[i]);
> +
> +		igt_output_set_pipe(output, i);
> +
> +		igt_plane_set_fb(data->primary[i], &buffer[i]);
> +	}
> +
> +	ret = igt_display_try_commit_atomic(
> +		display, DRM_MODE_ATOMIC_ALLOW_MODESET, user_data);
> +
> +	igt_assert_f(ret >= 0, "Modeset failed\n");
> +
> +	for (i = 0; i <= pipe; i++) {
> +		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
> +		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
> +			     "CRC is zero\n");
> +		igt_remove_fb(display->drm_fd, &buffer[i]);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +igt_main
> +{
> +	data_t data;
> +	int i = 0;
> +
> +	igt_skip_on_simulation();
> +
> +	memset(&data, 0, sizeof(data));
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(&data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +
> +	}
> +
> +	for (i = 0; i < MAX_PIPES; i++) {
> +		igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> +			      test_mode_1.name)
> +			run_test_linear_tiling(&data, i, &test_mode_1);
> +		igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> +			      test_mode_2.name)
> +			run_test_linear_tiling(&data, i, &test_mode_2);
> +		igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> +			      test_mode_3.name)
> +			run_test_linear_tiling(&data, i, &test_mode_3);
> +	}
> +
> +	igt_fixture
> +	{
> +		igt_display_fini(&data.display);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1bdfddbb..6d1ebe42 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -22,6 +22,7 @@ test_progs = [
>  	'kms_big_fb',
>  	'kms_big_joiner' ,
>  	'kms_busy',
> +	'kms_bw',
>  	'kms_ccs',
>  	'kms_cdclk',
>  	'kms_concurrent',
> -- 
> 2.25.1
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
