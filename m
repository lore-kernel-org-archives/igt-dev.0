Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DD76E0E3
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Sep 2021 18:02:15 +0000 (UTC)
Date: Thu, 23 Sep 2021 14:02:09 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210923180209.hr27tk3aciwqq3ny@outlook.office365.com>
References: <20210916132716.75963-1-stylon.wang@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916132716.75963-1-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: Add amd_link_settings test
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
Cc: igt-dev@lists.freedesktop.org, nicholas.kazlauskas@amd.com, sunpeng.li@amd.com, Eryk Brol <eryk.brol@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

I did not review all the details about this test, but we checked it in
our ASICs, and it works well. For this reason:

Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Tested-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Thanks
Siqueira

On 09/16, Stylon Wang wrote:
> From: Eryk Brol <eryk.brol@amd.com>
> 
> [Why]
> Having a test that iterates through different link
> settings and performs link training with them is useful
> and currently missing from IGT.
> 
> [How]
> Add a link settings test and its required helper functions.
> 
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>  lib/igt_amd.c                    | 119 +++++++++++++
>  lib/igt_amd.h                    |  44 +++++
>  tests/amdgpu/amd_link_settings.c | 280 +++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build         |   1 +
>  4 files changed, 444 insertions(+)
>  create mode 100644 tests/amdgpu/amd_link_settings.c
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 4ffe7cf2..f1bfb421 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -323,3 +323,122 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
>  
>  	return 0;
>  }
> +
> +/*
> + * igt_amd_read_link_settings:
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The name of the connector to read the link_settings
> + * @lane_count: Lane count
> + * @link_rate: Link rate
> + * @link_spread: Spread spectrum
> + *
> + * The indices of @lane_count, @link_rate, and @link_spread correspond to the
> + * values of "Current", "Verified", "Reported", and "Preferred", respectively.
> + */
> +void igt_amd_read_link_settings(
> +	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread)
> +{
> +	int fd, ret;
> +	char buf[101];
> +	int i = 0;
> +	char *token_end, *val_token;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Could not open connector %s debugfs directory\n",
> +			 connector_name);
> +		return;
> +	}
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_DP_LINK_SETTINGS, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_DP_LINK_SETTINGS, connector_name);
> +
> +	close(fd);
> +
> +	/* Between current, verified, reported, and preferred are null terminators,
> +	 * replace them with ';' to use as the delimiter for strtok. */
> +	while (strlen(buf) < sizeof(buf) - 1 && buf[strlen(buf)] == '\0')
> +		buf[strlen(buf)] = ';';
> +
> +	/* Parse values read from file. */
> +	for (char *token = strtok_r(buf, ";", &token_end);
> +	     token != NULL;
> +	     token = strtok_r(NULL, ";", &token_end))
> +	{
> +		strtok_r(token, ": ", &val_token);
> +		lane_count[i] = strtol(val_token, &val_token, 10);
> +		link_rate[i] = strtol(val_token, &val_token, 10);
> +		link_spread[i] = strtol(val_token, &val_token, 10);
> +		i++;
> +
> +		if (i > 3) return;
> +	}
> +}
> +
> +/*
> + * igt_amd_write_link_settings:
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The name of the connector to write the link_settings
> + * @lane_count: Lane count
> + * @link_rate: Link rate
> + * @training_type: Link training type
> + */
> +void igt_amd_write_link_settings(
> +	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
> +	enum dc_link_rate link_rate, enum dc_link_training_type training_type)
> +{
> +	int ls_fd, fd;
> +	const int buf_len = 40;
> +	char buf[buf_len];
> +	int wr_len = 0;
> +
> +	memset(buf, '\0', sizeof(char) * buf_len);
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	ls_fd = openat(fd, DEBUGFS_DP_LINK_SETTINGS, O_WRONLY);
> +	close(fd);
> +	igt_assert(ls_fd >= 0);
> +
> +	/* dp_link_settings_write expects a \n at the end or else it will
> +	 * dereference a null pointer.
> +	 */
> +	if (training_type == LINK_TRAINING_DEFAULT)
> +		snprintf(buf, sizeof(buf), "%02x %02x \n", lane_count, link_rate);
> +	else
> +		snprintf(buf, sizeof(buf), "%02x %02x %02x \n", lane_count,
> +			 link_rate, training_type);
> +
> +	wr_len = write(ls_fd, buf, strlen(buf));
> +	igt_assert_eq(wr_len, strlen(buf));
> +
> +	close(ls_fd);
> +}
> +
> +/**
> + * igt_amd_output_has_link_settings: check if connector has link_settings debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_link_settings(int drm_fd, char *connector_name)
> +{
> +	int fd;
> +	int res;
> +	struct stat stat;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +		return false;
> +	}
> +
> +	res = fstatat(fd, DEBUGFS_DP_LINK_SETTINGS, &stat, 0);
> +	if (res != 0) {
> +		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_DP_LINK_SETTINGS);
> +		close(fd);
> +		return false;
> +	}
> +
> +	close(fd);
> +	return true;
> +}
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index d333ad9c..e5bdbf33 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -27,8 +27,44 @@
>  #include "igt.h"
>  #include "igt_fb.h"
>  
> +#define DEBUGFS_DP_LINK_SETTINGS "link_settings"
>  #define DEBUGFS_HPD_TRIGGER "trigger_hotplug"
>  
> +enum dc_lane_count {
> +	LANE_COUNT_UNKNOWN = 0,
> +	LANE_COUNT_ONE = 1,
> +	LANE_COUNT_TWO = 2,
> +	LANE_COUNT_FOUR = 4,
> +	LANE_COUNT_EIGHT = 8,
> +	LANE_COUNT_DP_MAX = LANE_COUNT_FOUR
> +};
> +
> +/* This is actually a reference clock (27MHz) multiplier
> + * 162MBps bandwidth for 1.62GHz like rate,
> + * 270MBps for 2.70GHz,
> + * 324MBps for 3.24Ghz,
> + * 540MBps for 5.40GHz
> + * 810MBps for 8.10GHz
> + */
> +enum dc_link_rate {
> +	LINK_RATE_UNKNOWN = 0,
> +	LINK_RATE_LOW = 0x06,		// Rate_1 (RBR)	- 1.62 Gbps/Lane
> +	LINK_RATE_RATE_2 = 0x08,	// Rate_2		- 2.16 Gbps/Lane
> +	LINK_RATE_RATE_3 = 0x09,	// Rate_3		- 2.43 Gbps/Lane
> +	LINK_RATE_HIGH = 0x0A,		// Rate_4 (HBR)	- 2.70 Gbps/Lane
> +	LINK_RATE_RBR2 = 0x0C,		// Rate_5 (RBR2)- 3.24 Gbps/Lane
> +	LINK_RATE_RATE_6 = 0x10,	// Rate_6		- 4.32 Gbps/Lane
> +	LINK_RATE_HIGH2 = 0x14,		// Rate_7 (HBR2)- 5.40 Gbps/Lane
> +	LINK_RATE_HIGH3 = 0x1E		// Rate_8 (HBR3)- 8.10 Gbps/Lane
> +};
> +
> +enum dc_link_training_type {
> +	LINK_TRAINING_DEFAULT = 0,
> +	LINK_TRAINING_SLOW = 0,
> +	LINK_TRAINING_FAST,
> +	LINK_TRAINING_NO_PATTERN
> +};
> +
>  uint32_t igt_amd_create_bo(int fd, uint64_t size);
>  void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
>  unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
> @@ -48,4 +84,12 @@ bool igt_amd_is_tiled(uint64_t modifier);
>  void igt_amd_require_hpd(igt_display_t *display, int drm_fd);
>  int igt_amd_trigger_hotplug(int drm_fd, char *connector_name);
>  
> +/* IGT link helper functions */
> +void igt_amd_read_link_settings(
> +	int drm_fd, char *connector_name, int *lane_count, int *link_rate, int *link_spread);
> +void igt_amd_write_link_settings(
> +	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
> +	enum dc_link_rate link_rate, enum dc_link_training_type training_type);
> +bool igt_amd_output_has_link_settings(int drm_fd, char *connector_name);
> +
>  #endif /* IGT_AMD_H */
> diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
> new file mode 100644
> index 00000000..7822683d
> --- /dev/null
> +++ b/tests/amdgpu/amd_link_settings.c
> @@ -0,0 +1,280 @@
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.
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
> +#include "igt_amd.h"
> +
> +typedef struct
> +{
> +	int drm_fd;
> +        igt_display_t display;
> +        igt_plane_t *primary;
> +        igt_output_t *output;
> +	igt_fb_t fb;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_pipe_t *pipe;
> +        enum pipe pipe_id;
> +	int connector_type;
> +	int w, h;
> +	igt_crc_t crc_640_480;
> +} data_t;
> +
> +drmModeModeInfo mode_640_480 = {
> +	.name		= "640x480",
> +	.vrefresh	= 60,
> +	.clock		= 25200,
> +
> +	.hdisplay	= 640,
> +	.hsync_start	= 656,
> +	.hsync_end	= 752,
> +	.htotal		= 800,
> +
> +	.vdisplay	= 480,
> +	.vsync_start	= 490,
> +	.vsync_end	= 492,
> +	.vtotal		= 525,
> +
> +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +const enum dc_lane_count lane_count_values[] =
> +{
> +	LANE_COUNT_ONE,
> +	LANE_COUNT_TWO,
> +	LANE_COUNT_FOUR,
> +};
> +
> +const enum dc_link_rate dp_link_rate_values[] =
> +{
> +	LINK_RATE_LOW,
> +	LINK_RATE_HIGH,
> +	LINK_RATE_HIGH2,
> +	LINK_RATE_HIGH3
> +};
> +
> +const enum dc_link_rate edp_link_rate_values[] =
> +{
> +	LINK_RATE_LOW,
> +	LINK_RATE_HIGH,
> +	LINK_RATE_RBR2,
> +	LINK_RATE_HIGH2
> +};
> +
> +static void test_fini(data_t *data)
> +{
> +	igt_pipe_crc_free(data->pipe_crc);
> +	igt_display_reset(&data->display);
> +}
> +
> +static void set_all_output_pipe_to_none(data_t *data)
> +{
> +	igt_output_t *output;
> +
> +	for_each_connected_output(&data->display, output) {
> +		igt_output_set_pipe(output, PIPE_NONE);
> +	}
> +
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +}
> +
> +static void test_init(data_t *data, igt_output_t *output)
> +{
> +	enum pipe pipe;
> +
> +	igt_require(output->config.connector->count_modes >= 1);
> +
> +	set_all_output_pipe_to_none(data);
> +
> +	for_each_pipe(&data->display, pipe) {
> +		if (igt_pipe_connector_valid(pipe, output)) {
> +			data->pipe_id = pipe;
> +			break;
> +		}
> +	}
> +
> +	data->connector_type = output->config.connector->connector_type;
> +
> +	igt_require(data->pipe_id != PIPE_NONE);
> +
> +	data->pipe = &data->display.pipes[data->pipe_id];
> +	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id, "auto");
> +
> +	igt_output_set_pipe(output, data->pipe_id);
> +
> +	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +}
> +
> +static void run_link_training_config(data_t *data, igt_output_t *output)
> +{
> +	int lane_count[4], link_rate[4], link_spread[4];
> +	int max_lc, max_lr;
> +	const int current = 0;
> +	const int verified = 1;
> +	char *connector_name = output->name;
> +	igt_crc_t crc;
> +	const enum dc_link_rate *link_rate_values;
> +	int num_link_rates;
> +	if (data->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> +		link_rate_values = dp_link_rate_values;
> +		num_link_rates = ARRAY_SIZE(dp_link_rate_values);
> +	} else if (data->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		link_rate_values = edp_link_rate_values;
> +		num_link_rates = ARRAY_SIZE(edp_link_rate_values);
> +	} else {
> +		igt_info("Not a DP or eDP connector\n");
> +		return;
> +	}
> +
> +	igt_amd_read_link_settings(data->drm_fd, connector_name, lane_count,
> +			           link_rate, link_spread);
> +
> +	max_lc = lane_count[verified];
> +	max_lr = link_rate[verified];
> +
> +	for (int i = 0; i < ARRAY_SIZE(lane_count_values); i++)
> +	{
> +		if (lane_count_values[i] > max_lc)
> +			continue;
> +
> +		for (int j = 0; j < num_link_rates; j++)
> +		{
> +			if (link_rate_values[j] > max_lr)
> +				continue;
> +
> +			/* Write link settings */
> +			igt_info("Applying lane count: %d, link rate 0x%02x, on default training\n",
> +				  lane_count_values[i], link_rate_values[j]);
> +			igt_amd_write_link_settings(data->drm_fd, connector_name,
> +						    lane_count_values[i],
> +						    link_rate_values[j],
> +						    LINK_TRAINING_DEFAULT);
> +
> +			/* Commit */
> +			igt_create_pattern_fb(data->drm_fd, mode_640_480.hdisplay,
> +					      mode_640_480.vdisplay, DRM_FORMAT_XRGB8888,
> +					      0, &data->fb);
> +			igt_plane_set_fb(data->primary, &data->fb);
> +			igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +			/* Verify */
> +			igt_amd_read_link_settings(data->drm_fd, connector_name,
> +						   lane_count, link_rate,
> +						   link_spread);
> +
> +			/* Collect CRC after writing settings */
> +			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
> +			igt_assert_crc_equal(&crc, &data->crc_640_480);
> +
> +			igt_assert(lane_count[current] == lane_count_values[i]);
> +			igt_assert(link_rate[current] == link_rate_values[j]);
> +
> +		}
> +	}
> +}
> +
> +static void test_link_training_configs(data_t *data)
> +{
> +	const drmModeModeInfo *orig_mode;
> +	igt_output_t *output;
> +	int lane_count[4], link_rate[4], link_spread[4];
> +	int orig_lc, orig_lr;
> +	const int current = 0;
> +
> +	igt_enable_connectors(data->drm_fd);
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (!igt_amd_output_has_link_settings(data->drm_fd, output->name)) {
> +			igt_info("Skipping output: %s\n", output->name);
> +			continue;
> +		}
> +
> +		igt_info("Testing on output: %s\n", output->name);
> +
> +		/* Init only if display supports link_settings */
> +		test_init(data, output);
> +
> +		orig_mode = igt_output_get_mode(output);
> +		igt_assert(orig_mode);
> +
> +		/* Collect original mode's LC and LR */
> +		igt_amd_read_link_settings(data->drm_fd, output->name, lane_count,
> +					   link_rate, link_spread);
> +		orig_lc = lane_count[current];
> +		orig_lr = link_rate[current];
> +
> +		/* Collect 640x480 CRC */
> +		igt_create_pattern_fb(data->drm_fd, mode_640_480.hdisplay,
> +				      mode_640_480.vdisplay, DRM_FORMAT_XRGB8888,
> +				      0, &data->fb);
> +		igt_plane_set_fb(data->primary, &data->fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		igt_pipe_crc_collect_crc(data->pipe_crc, &data->crc_640_480);
> +
> +		/* Change link settings. */
> +		run_link_training_config(data, output);
> +
> +		/* Revert mode back. */
> +		igt_output_override_mode(output, orig_mode);
> +		igt_info("%s: Reverting to lane count: %d, link rate: 0x%02x\n", output->name, orig_lc, orig_lr);
> +		igt_amd_write_link_settings(data->drm_fd, output->name, orig_lc, orig_lr,
> +					    LINK_TRAINING_DEFAULT);
> +
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		igt_remove_fb(data->drm_fd, &data->fb);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +igt_main
> +{
> +	data_t data;
> +	memset(&data, 0, sizeof(data));
> +
> +	igt_skip_on_simulation();
> +
> +	igt_fixture
> +	{
> +		data.drm_fd = drm_open_driver_master(DRIVER_AMDGPU);
> +		if (data.drm_fd == -1)
> +			igt_skip("Not an amdgpu driver.\n");
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Retrieves all link settings configurations and retrains "
> +		     "links on all possible configurations with different "
> +		     "types of link training.");
> +	igt_subtest("link-training-configs")
> +		test_link_training_configs(&data);
> +
> +	igt_fixture
> +	{
> +		igt_display_fini(&data.display);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 805eb299..aec71cb5 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -13,6 +13,7 @@ if libdrm_amdgpu.found()
>  			  'amd_prime',
>  			  'amd_module_load',
>  			  'amd_mem_leak',
> +			  'amd_link_settings',
>  			  'amd_vrr_range',
>  			]
>  	amdgpu_deps += libdrm_amdgpu
> -- 
> 2.32.0
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
