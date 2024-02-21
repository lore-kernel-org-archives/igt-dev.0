Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47110C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 11:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC97E10E6F5;
	Wed, 21 Feb 2024 11:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNU4vZUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEDB10E6F5
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708515908; x=1740051908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PcqLZjHQNc9gwWrm6B9M9nqhjSvTnKbdfjjyIamCFcg=;
 b=JNU4vZUweXlTP+uOEZjibgYPZ5HUIKONM7gE6Yvk9KDkW86hQ3AAsi7A
 vFj/Jre9BllgUDaPSEFfe2D0AdR+e6ZDoLfay+FVzw7muZIR/HlMZmKdt
 HhYbOX4vYYZP80MAef2Snd5nz73rHNYW6+MB1asm/2pojVFoCbl0t5bsU
 tFJA20zB4WbGEFeIVkTbEzWWUdxrXI+FxllyvuNXk8ZLfBJLRw5SB8CAQ
 7QI4KMIy67JqZVWcMA189IZl09ZYTAwvqZEyLp6c9atzob9KEjHSHGNfY
 FDEfIo4Fvn6ebujhnYu1iPx0sZaQxO0SPitjR4sp8aoi89xJC2Xy9xiaE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13289187"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="13289187"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:45:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="913291334"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="913291334"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:45:05 -0800
Date: Wed, 21 Feb 2024 12:45:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, rodrigo.siqueira@amd.com,
 aurabindo.pillai@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com,
 wayne.lin@amd.com, markyacoub@google.com
Subject: Re: [PATCH] [i-g-t] tests/amdgpu/amd_multidisplay_modeset: Run mode
 set and display enable for multidisplays
Message-ID: <20240221114502.oabac5tbwshyn5pj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Hersen Wu <hersenxs.wu@amd.com>,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com,
 alex.hung@amd.com, hamza.mahfooz@amd.com, wayne.lin@amd.com,
 markyacoub@google.com
References: <20240220175612.80849-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220175612.80849-1-hersenxs.wu@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Hersen,
On 2024-02-20 at 12:56:12 -0500, Hersen Wu wrote:
> Run mode set, display enable and disable for multiple
> displays.

Few more nits, see below.

> 
> Loop all display modes. Loop all display combinations.
> For DP display(eDP, SST DP, displays connected to
> outputs of MST hub), if it supports DP rx crc test, IGT
> will read DP rx crc and compare with pipe crc. If DSC
> is not enabled for display, DP rx crc should equal to
> pipe crc.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>  tests/amdgpu/amd_multidisplay_modeset.c | 449 ++++++++++++++++++++++++
>  tests/amdgpu/meson.build                |  11 +-
>  2 files changed, 455 insertions(+), 5 deletions(-)
>  create mode 100644 tests/amdgpu/amd_multidisplay_modeset.c
> 
> diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
> new file mode 100644
> index 000000000..30c78c5e2
> --- /dev/null
> +++ b/tests/amdgpu/amd_multidisplay_modeset.c
> @@ -0,0 +1,449 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR

Drop this text, it is replaced by SPDX.

> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include "igt.h"
------------ ^
Should be after system includes.

> +#include "igt_amd.h"
------------ ^
Should be after system includes.

> +#include <sys/types.h>
> +#include <sys/stat.h>

Sort alphabetically, first system ones, next after newline igt's.

> +
> +#define MAX_PIPES 6
> +
> +/* Common test data. */
> +struct data_t {
> +	igt_display_t display;
> +	igt_plane_t *primary[MAX_PIPES];
> +	igt_output_t *output[MAX_PIPES];
> +	int fd;
> +	igt_pipe_crc_t *pipe_crc_dprx[MAX_PIPES];
> +	igt_crc_t crc_fb[MAX_PIPES];
> +	igt_crc_t crc_dprx[MAX_PIPES];
> +	igt_pipe_crc_t *pipe_crc_otg[MAX_PIPES];
> +	igt_crc_t crc_otg[MAX_PIPES];
> +};
> +
> +enum sub_test {
> +	MODE_SET,
> +	DISPLAY_ENABLE_DISABLE
> +};
> +
> +/* DP DPCD offset */
> +#define DPCD_TEST_SINK_MISC 0x246
> +
> +static bool is_mst_connector(int drm_fd, uint32_t connector_id)
> +{
> +	return kmstest_get_property(drm_fd, connector_id,
> +				    DRM_MODE_OBJECT_CONNECTOR,
> +				    "PATH", NULL,
> +				    NULL, NULL);
> +}
> +
> +static bool sink_detect_error(int drm_fd, uint32_t connector_id, int error_code)
> +{
> +	switch (error_code) {
> +	case ETIMEDOUT:
> +	case ENXIO:
> +		return true;
> +	case EIO:
> +		return is_mst_connector(drm_fd, connector_id);
> +	default:
> +		return false;
> +	};
> +}
> +
> +/* Read from /dev/drm_dp_aux
> + * addr: DPCD offset
> + * val:  Read value of DPCD register
> + */
> +static bool dpcd_read_byte(int drm_fd,
> +	drmModeConnector *connector, uint32_t addr, uint8_t *val)
> +{
> +	DIR *dir;
> +	int dir_fd;
> +	uint8_t buf[16] = {0};
> +	*val = 0;
> +
> +	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
> +	igt_assert(dir_fd >= 0);
> +
> +	if (connector->connection != DRM_MODE_CONNECTED &&
> +	    is_mst_connector(drm_fd, connector->connector_id)) {
> +		close(dir_fd);
> +		return false;
> +	}
> +
> +	dir = fdopendir(dir_fd);
> +	igt_assert(dir);
> +
> +	for (;;) {
> +		struct dirent *ent;
> +		char path[5 + sizeof(ent->d_name)];
> +		int fd, ret, i, j, k;
> +
> +		ent = readdir(dir);
> +		if (!ent)
> +			break;
> +
> +		if (strncmp(ent->d_name, "drm_dp_aux", 10))
> +			continue;
> +
> +		snprintf(path, sizeof(path), "/dev/%s", ent->d_name);
> +
> +		fd = open(path, O_RDONLY);
> +		igt_assert(fd >= 0);
> +
> +		k = (addr / 16) + 1;
> +		j = addr % 16;
> +
> +		/* read 16 bytes each loop */
> +		for (i = 0; i < k; i++) {
> +			ret = read(fd, buf, sizeof(buf));
> +			if (ret < 0)
> +				break;
> +			if (ret != sizeof(buf))
> +				break;
> +		}
> +
> +		igt_info("%s: %s\n", path,
> +			 ret > 0 ? "success" : strerror(errno));
> +
> +		igt_assert(ret == sizeof(buf) ||
> +			   sink_detect_error(drm_fd, connector->connector_id, errno));
> +
> +		close(fd);
> +
> +		closedir(dir);
> +		close(dir_fd);
> +
> +		if (ret > 0)
> +			*val = buf[j];
> +
> +		return (ret > 0);
> +	}
> +
> +	closedir(dir);
> +	close(dir_fd);
> +	return false;
> +}
> +
> +static void set_all_output_pipe_to_none(struct data_t *data)
> +{
> +	igt_output_t *output;
> +
> +	for_each_connected_output(&data->display, output) {
> +		igt_output_set_pipe(output, PIPE_NONE);
> +	}
> +
> +	igt_display_commit_atomic(&data->display,
> +		DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +}
> +
> +static void test_init(struct data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	int i;
> +	bool ret = false;
> +	uint8_t dpcd_246h = 0;
> +
> +	for (i = 0; i < MAX_PIPES; i++)
> +		data->pipe_crc_dprx[i] = NULL;
> +
> +	for_each_pipe(display, i) {
> +		igt_output_t *output;
> +		igt_pipe_t *pipes;
> +
> +		/* For each valid pipe, get one connected display.
> +		 * This will let displays connected to MST hub be
> +		 * tested
> +		 */
> +		output = igt_get_single_output_for_pipe(display, i);
> +		pipes = &display->pipes[i];
> +		data->primary[i] = igt_pipe_get_plane_type(
> +			&data->display.pipes[i], DRM_PLANE_TYPE_PRIMARY);
> +		data->output[i] = output;
> +
> +		/* dp rx crc only available for eDP, SST DP, MST DP */
> +		if ((output->config.connector->connector_type ==
> +			DRM_MODE_CONNECTOR_eDP ||
> +			output->config.connector->connector_type ==
> +				DRM_MODE_CONNECTOR_DisplayPort)) {
> +			/* DPCD 0x246 bit5: 1 -- sink device support CRC test */
> +			ret = dpcd_read_byte(data->fd, output->config.connector,
> +				DPCD_TEST_SINK_MISC, &dpcd_246h);
> +			if (ret && ((dpcd_246h & 0x20) != 0x0))
> +				data->pipe_crc_dprx[i] = igt_pipe_crc_new(
> +					data->fd, pipes->pipe,
> +					AMDGPU_PIPE_CRC_SOURCE_DPRX);
> +		}
> +
> +		data->pipe_crc_otg[i] = igt_pipe_crc_new(data->fd, pipes->pipe,
> +						IGT_PIPE_CRC_SOURCE_AUTO);
> +		/* disable eDP PSR */
> +		if (data->output[i]->config.connector->connector_type ==
> +				DRM_MODE_CONNECTOR_eDP) {
> +			kmstest_set_connector_dpms(display->drm_fd,
> +				data->output[i]->config.connector,
> +				DRM_MODE_DPMS_OFF);
> +
> +			igt_amd_disallow_edp_enter_psr(data->fd,
> +				data->output[i]->name, true);
> +
> +			kmstest_set_connector_dpms(display->drm_fd,
> +				data->output[i]->config.connector,
> +				DRM_MODE_DPMS_ON);
> +		}
> +	}
> +
> +	igt_require(data->output[0]);
> +	igt_display_reset(display);
> +}
> +
> +static void test_fini(struct data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	int i = 0;
> +
> +	for_each_pipe(display, i) {
> +		if (data->pipe_crc_dprx[i])
> +			igt_pipe_crc_free(data->pipe_crc_dprx[i]);
> +		igt_pipe_crc_free(data->pipe_crc_otg[i]);
> +	}
> +
> +	igt_display_reset(display);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
> +{
> +	igt_output_t *output;
> +	struct igt_fb *buf;
> +	drmModeConnectorPtr conn;
> +	drmModeModeInfoPtr kmode;
> +	igt_display_t *display = &data->display;
> +	int i, j, ret, num_disps, count_modes_disp_config, bitmap_disps;
> +	char *crc_str, *crc_str_1, *crc_str_2;
> +	bool any_mst = false;
> +
> +	test_init(data);
> +
> +	num_disps = 0;
> +	for_each_connected_output(display, output)
> +		num_disps++;
> +
> +	igt_info("Connected num_disps:%d\n", num_disps);
> +
> +	igt_skip_on_f(num_disps > igt_display_get_n_pipes(&data->display) ||
> +			      num_disps > data->display.n_outputs,
> +		      "ASIC does not have %d outputs/pipes\n", num_disps);
> +
> +	buf = calloc(sizeof(struct igt_fb), num_disps);
> +	igt_assert_f(buf, "Failed to allocate memory\n");
> +
> +	/* For mode test, it is max number of modes for
> +	 * all connected displays. For enable/disable test,
> +	 * it is number of connected display combinations
> +	 */
> +	count_modes_disp_config = 0;
> +	for_each_connected_output(display, output) {
> +		conn = output->config.connector;
> +		if (count_modes_disp_config < conn->count_modes)
> +			count_modes_disp_config = conn->count_modes;
> +		if  (is_mst_connector(data->fd, conn->connector_id))
> +			any_mst = true;
> +	}
> +
> +	if (test_mode == DISPLAY_ENABLE_DISABLE)
> +		count_modes_disp_config = (1 << num_disps) - 1;
> +
> +	/* display combination bitmap for mode set or enable display
> +	 * bit 0: display 0
> +	 * bit 1: display 1
> +	 * bit 2: display 2, etc.
> +	 *
> +	 * bitmap_disps:0x5 means display 0,2 light up
> +	 */
> +	bitmap_disps = (1 << num_disps) - 1;
> +	igt_info("count_modes_disp_config:%d bitmap_disps:%x\n\n\n",
> +		count_modes_disp_config, bitmap_disps);
> +
> +	for (i = 0; i < count_modes_disp_config; i++) {
> +		if (test_mode == DISPLAY_ENABLE_DISABLE) {
> +			bitmap_disps = i + 1;
> +			igt_info("\n\ndispconfig loop:%d disp bitmap:%x -----\n",
> +				i, bitmap_disps);
> +
> +			/* disable all displays */
> +			set_all_output_pipe_to_none(data);
> +		} else
> +			igt_info("\n\nnmode loop:%d -----\n", i);
> +		j = 0;
> +		for_each_connected_output(display, output) {
> +			if (test_mode == DISPLAY_ENABLE_DISABLE) {
> +				/* only enable display mapping to
> +				 * bitmap_disps with value 1
> +				 */
> +				if (!(bitmap_disps & (1 << j))) {
> +					j++;
> +					continue;
> +				}
> +				kmode = igt_output_get_mode(output);
> +				igt_assert(kmode);
> +				igt_info("pipe:%d %s mode:%s\n",
> +					j, output->name, kmode->name);
> +				igt_info("clk:%d ht:%d vt:%d hz:%d\n",
> +					kmode->clock, kmode->htotal,
> +					kmode->vtotal, kmode->vrefresh);
> +			} else {
> +				conn = output->config.connector;
> +
> +				if (i < conn->count_modes)
> +					kmode = &conn->modes[i];
> +				else
> +					kmode = &conn->modes[0];
> +
> +				igt_info("pipe:%d %s mode:%s\n", j, output->name, kmode->name);
> +				igt_info("clk:%d ht:%d vt:%d hz:%d\n", kmode->clock,
> +					kmode->htotal, kmode->vtotal, kmode->vrefresh);
> +
> +				if  (is_mst_connector(data->fd, conn->connector_id)) {
> +					/* mst hub may not support mode with high clk
> +					 * more than 4k@60hz or high refresh rate
> +					 */
> +					if (kmode->clock > 596000 || kmode->vrefresh > 120) {
> +						kmode = &conn->modes[0];
> +						igt_info("Mode may not be supported by mst hub.	Use default mode from monitor!\n");
> +						igt_info("clk:%d ht:%d vt:%d hz:%d\n",
> +							kmode->clock, kmode->htotal,
> +							kmode->vtotal, kmode->vrefresh);
> +					}
> +				}
> +
> +				/* memory for output->config.connector will be re-alloacted */
> +				igt_output_override_mode(output, kmode);
> +			}
> +
> +			igt_create_pattern_fb(data->fd, kmode->hdisplay,
> +					kmode->vdisplay, DRM_FORMAT_XRGB8888,
> +					0, (buf + j));
> +
> +			igt_output_set_pipe(output, j);
> +			igt_plane_set_fb(data->primary[j], (buf + j));
> +			j++;
> +		}
> +
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +		/* MST hub may take longer time for mode change or display
> +		 * enable/disable. Wait for MST stable before CRC check.
> +		 * TODO: check if there is a better way to check MST stable
> +		 */
> +		if (any_mst)
> +			sleep(20);
> +
> +		j = 0;
> +		for_each_connected_output(display, output) {
> +			bool dsc_on = false;
> +
> +			/* For test_mode:MODE_SET, bitmap_disps =
> +			 * (1 << num_disps) - 1. All connected
> +			 * displays will be checked.
> +			 */
> +			if (!(bitmap_disps & (1 << j))) {
> +				j++;
> +				continue;
> +			}
> +
> +			if (data->pipe_crc_dprx[j]) {
> +				igt_pipe_crc_collect_crc(data->pipe_crc_dprx[j],
> +					&data->crc_dprx[j]);
> +				crc_str = igt_crc_to_string(&data->crc_dprx[j]);
> +				igt_info("pipe:%d %s dprx crc:%s\n",
> +					j, output->name, crc_str);
> +			} else
> +				igt_info("pipe:%d %s monitor dprx not available\n",
> +					j, output->name);
> +
> +			igt_pipe_crc_collect_crc(data->pipe_crc_otg[j],
> +				&data->crc_otg[j]);
> +			igt_fb_calc_crc((buf + j), &data->crc_fb[j]);
> +
> +			crc_str_1 = igt_crc_to_string(&data->crc_otg[j]);
> +			igt_info("pipe:%d %s otg crc:%s\n",
> +				j, output->name, crc_str_1);
> +
> +			crc_str_2 = igt_crc_to_string(&data->crc_fb[j]);
> +			igt_info("pipe:%d %s fb crc:%s\n",
> +				j, output->name, crc_str_2);
> +
> +			if (data->pipe_crc_dprx[j]) {
> +				ret = strcmp(crc_str, crc_str_1);
> +				dsc_on = igt_amd_read_dsc_clock_status(
> +						data->fd, output->name);
> +				if (ret != 0 && dsc_on)
> +					igt_info("pipe:%d %s otg crc != dprx crc due to dsc on\n",
> +					j, output->name);
> +
> +				igt_assert_f(((ret == 0) || (dsc_on)),
> +					"ERROR! OTG CRC != DPRX and DSC off\n");
> +			}
> +			j++;
> +		}
> +
> +		j = 0;
> +		for_each_connected_output(display, output) {
> +			igt_remove_fb(data->fd, (buf + j));
> +			j++;
> +		}
> +
> +		set_all_output_pipe_to_none(data);
> +	}
> +
> +	test_fini(data);
> +	free(buf);
> +}
> +
> +IGT_TEST_DESCRIPTION("Test multi-display mode set, display enable and disable");
> +igt_main
> +{
> +	struct data_t data;
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
> +		igt_require(&data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Loop through all supported modes and check DP RX CRC and Pipe CRC");
> +	igt_subtest("multiple-display-mode-switch")
> +		multiple_display_test(&data, MODE_SET);
> +	igt_describe("Enable and Disable displays and check DP RX CRC and Pipe CRC");
> +	igt_subtest("multiple-display-enable-disable")
> +		multiple_display_test(&data, DISPLAY_ENABLE_DISABLE);
> +
> +
> +	igt_fixture
> +	{
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 5bd502496..af1d80b6b 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -13,32 +13,33 @@ if libdrm_amdgpu.found()
>  			  'amd_deadlock',
>  			  'amd_dp_dsc',
>  			  'amd_freesync_video_mode',
> -			  'amd_hotplug',
>  			  'amd_gang_cs' ,
> +			  'amd_hotplug',
>  			  'amd_ilr',
>  			  'amd_info',
>  			  'amd_jpeg_dec',
>  			  'amd_link_settings',
> +			  'amd_mall',
>  			  'amd_max_bpc',
>  			  'amd_mem_leak',
>  			  'amd_mode_switch',
>  			  'amd_module_load',
> +			  'amd_multidisplay_modeset',

Add only this one here, make cleanup in separate patch.

Regards,
Kamil

> +			  'amd_odm',
>  			  'amd_pci_unplug',
>  			  'amd_plane',
>  			  'amd_prime',
>  			  'amd_psr',
>  			  'amd_ras',
>  			  'amd_security',
> +			  'amd_subvp',
>  			  'amd_uvd_dec',
>  			  'amd_uvd_enc',
>  			  'amd_vce_dec',
>  			  'amd_vcn',
>  			  'amd_vm',
> -			  'amd_vrr_range',
> -			  'amd_mall',
> -			  'amd_odm',
> -			  'amd_subvp',
>  			  'amd_vpe',
> +			  'amd_vrr_range',
>  			]
>  	if libdrm_amdgpu.version().version_compare('> 2.4.97')
>  		amdgpu_progs +=[ 'amd_syncobj', ]
> -- 
> 2.25.1
> 
