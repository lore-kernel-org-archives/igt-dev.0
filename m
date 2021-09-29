Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471836E1ED
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Sep 2021 17:32:38 +0000 (UTC)
Date: Wed, 29 Sep 2021 13:32:31 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210929173231.cqg4j3nywx6gmo3b@outlook.office365.com>
References: <20210929052214.437157-1-stylon.wang@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929052214.437157-1-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] test/amdgpu: Test max-bpc fallback for
 4K modes on HDMI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, anson.jacob@amd.com, Nicholas Choi <nicholas.choi@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Stylon,

We tried this test in some ASICs, and it failed. Does it mean that our
driver has a regression?

Thanks
Siqueira


On 09/29, Stylon Wang wrote:
> [Why]
> There was a driver regression with which too high max-bpc setting
> causes 4K video modes failing stream validation and dropped from
> mode list.
> 
> [How]
> Add this test to catch the regression.
> 
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>  tests/amdgpu/amd_max_bpc.c | 190 +++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build   |   1 +
>  2 files changed, 191 insertions(+)
>  create mode 100644 tests/amdgpu/amd_max_bpc.c
> 
> diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
> new file mode 100644
> index 00000000..914034d3
> --- /dev/null
> +++ b/tests/amdgpu/amd_max_bpc.c
> @@ -0,0 +1,190 @@
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
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
> +#include "igt.h"
> +#include <fcntl.h>
> +
> +IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
> +
> +/* Common test data. */
> +typedef struct data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_pipe_t *pipe;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_pipe_crc_t *pipe_crc_dither;
> +	drmModeModeInfo *mode;
> +	enum pipe pipe_id;
> +	int fd;
> +	int w;
> +	int h;
> +} data_t;
> +
> +/* BPC connector state. */
> +typedef struct output_bpc {
> +	unsigned int current;
> +	unsigned int maximum;
> +} output_bpc_t;
> +
> +static drmModeModeInfo uhd_mode = {
> +	  594000,
> +	  3840, 4016, 4104, 4400, 0,
> +	  2160, 2168, 2178, 2250, 0,
> +	  60, 0x5|DRM_MODE_FLAG_PIC_AR_64_27,
> +	  0x40,
> +	  "3840x2160@60", /* VIC 107 */
> +	  };
> +
> +/* Returns the current and maximum bpc from the connector debugfs. */
> +static output_bpc_t get_output_bpc(data_t *data)
> +{
> +	char buf[256];
> +	char *start_loc;
> +	int fd, res;
> +	output_bpc_t info;
> +
> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +
> +	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> +
> +	igt_require(res > 0);
> +
> +	close(fd);
> +
> +	igt_assert(start_loc = strstr(buf, "Current: "));
> +	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
> +
> +	igt_assert(start_loc = strstr(buf, "Maximum: "));
> +	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
> +
> +	return info;
> +}
> +
> +/* Verifies that connector has the correct output bpc. */
> +static void assert_output_bpc(data_t *data, unsigned int bpc)
> +{
> +	output_bpc_t info = get_output_bpc(data);
> +
> +	igt_require_f(info.maximum >= bpc,
> +		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
> +		      info.maximum);
> +
> +	igt_assert_eq(info.current, bpc);
> +}
> +
> +/* Common test setup. */
> +static void test_init(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	/* It doesn't matter which pipe we choose on amdpgu. */
> +	data->pipe_id = PIPE_A;
> +	data->pipe = &data->display.pipes[data->pipe_id];
> +
> +	igt_display_reset(display);
> +
> +	/* find a connected HDMI output */
> +	data->output = NULL;
> +	for (int i=0; i < data->display.n_outputs; ++i) {
> +		drmModeConnector *connector = data->display.outputs[i].config.connector;
> +		if (connector->connection == DRM_MODE_CONNECTED &&
> +				(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA)) {
> +			data->output = &data->display.outputs[i];
> +		}
> +	}
> +	igt_assert_f(data->output, "Requires connected HDMI output\n");
> +
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +	igt_output_override_mode(data->output, &uhd_mode);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +	assert_output_bpc(data, 8);
> +
> +	data->primary =
> +		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
> +					  INTEL_PIPE_CRC_SOURCE_AUTO);
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +}
> +
> +/* Common test cleanup. */
> +static void test_fini(data_t *data)
> +{
> +	igt_pipe_crc_free(data->pipe_crc);
> +	igt_display_reset(&data->display);
> +}
> +
> +static void test_4k_mode_max_bpc(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_fb_t rfb;
> +	int max_bpc = 16;
> +
> +	test_init(data);
> +
> +	igt_info("Setting output max bpc to %d\n", max_bpc);
> +
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
> +
> +	igt_create_pattern_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
> +	igt_plane_set_fb(data->primary, &rfb);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	test_fini(data);
> +	igt_remove_fb(data->fd, &rfb);
> +}
> +
> +igt_main
> +{
> +	data_t data;
> +
> +	igt_skip_on_simulation();
> +
> +	memset(&data, 0, sizeof(data));
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Tests overly high 'max bpc' should not affect 4K modes on HDMI");
> +	igt_subtest("4k-mode-max-bpc") test_4k_mode_max_bpc(&data);
> +
> +	igt_fixture
> +	{
> +		igt_display_fini(&data.display);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index aec71cb5..b736c456 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -11,6 +11,7 @@ if libdrm_amdgpu.found()
>  			  'amd_hotplug',
>  			  'amd_info',
>  			  'amd_prime',
> +			  'amd_max_bpc',
>  			  'amd_module_load',
>  			  'amd_mem_leak',
>  			  'amd_link_settings',
> -- 
> 2.32.0
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
