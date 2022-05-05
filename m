Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF6610E301
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 16:24:11 +0000 (UTC)
Date: Thu, 5 May 2022 12:22:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <YnP53roC16A8iS0Q@intel.com>
References: <20220505110354.30768-1-anshuman.gupta@intel.com>
 <20220505110354.30768-5-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220505110354.30768-5-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 4/9] tools: Add intel_pm_rpm tool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org,
 badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 05, 2022 at 04:33:49PM +0530, Anshuman Gupta wrote:
> intel_pm_rpm tool is a debug tool. It can be use to setup
> and prepare the gfx card to go to D3Cold.
> It also provide the debug option to disable all display and
> prepare device to enter to runtime suspend.
> 
> v2:
> - Removed IS_DGFX() condition.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tools/intel_pm_rpm.c | 206 +++++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build    |   1 +
>  2 files changed, 207 insertions(+)
>  create mode 100644 tools/intel_pm_rpm.c
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> new file mode 100644
> index 000000000..bf8212b3c
> --- /dev/null
> +++ b/tools/intel_pm_rpm.c
> @@ -0,0 +1,206 @@
> +/*
> + * Copyright © 2022 Intel Corporation
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
> +#include <getopt.h>
> +#include <glib.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdbool.h>
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_device_scan.h"
> +#include "igt_pm.h"
> +
> +typedef struct {
> +	int drm_fd;
> +	int debugfs_fd;
> +	uint32_t devid;
> +	drmModeResPtr res;
> +	igt_display_t display;
> +} data_t;
> +
> +const char *help_str =
> +	"  --disable-display\t\tDisable all screen and try to go into runtime pm.\n"
> +	"  --setup-d3cold\t\tPrepare dgfx gfx card to enter runtime D3Cold.\n"
> +	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
> +static struct option long_options[] = {
> +	{"disable-display", 0, 0, 'd'},
> +	{"setup-d3cold", 0, 0, 's'},
> +	{"help", 0, 0, 'h'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +const char *optstr = "dsh";
> +
> +static void usage(const char *name)
> +{
> +	igt_info("Usage: %s [options]\n", name);
> +	igt_info("%s\n", help_str);
> +}
> +
> +static void disable_all_displays(data_t *data)
> +{
> +	igt_output_t *output;
> +
> +	for (int i = 0; i < data->display.n_outputs; i++) {
> +		output = &data->display.outputs[i];
> +		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_display_commit(&data->display);
> +	}
> +}
> +
> +static void setup_gfx_card_d3cold(data_t *data)
> +{
> +	struct pci_device *root;
> +	int d_state;
> +
> +	root = igt_device_get_pci_root_port(data->drm_fd);
> +
> +	if (!igt_pm_acpi_d3cold_supported(root)) {
> +		igt_info("D3Cold isn't supported on Root port %04x:%02x:%02x.%01x\n",
> +			 root->domain, root->bus, root->dev, root->func);
> +		return;
> +	}
> +
> +	disable_all_displays(data);
> +	igt_pm_setup_pci_card_runtime_pm(root);
> +	sleep(1);
> +	d_state = igt_pm_get_acpi_real_d_state(root);
> +
> +	if (d_state == IGT_ACPI_D3Cold) {
> +		igt_info("D3Cold achieved for root port %04x:%02x:%02x.%01x\n",
> +			 root->domain, root->bus, root->dev, root->func);
> +	} else {
> +		igt_pm_print_pci_card_runtime_status();
> +		igt_info("D3Cold not achieved yet. Please monitor %04x:%02x:%02x.%01x real_power_state\n",
> +			 root->domain, root->bus, root->dev, root->func);
> +	}

wait... I'm confused now...
I just realized that here we don't have the while(1) with the ctrl+c for exit like we have on the disable-display.

With that right after this line aren't we restoring all the runtime_pm control states?

Shouldn't we keep in loop here as well?

> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	bool disable_display = false, setup_d3cold = false;
> +	struct igt_device_card card;
> +	char *env_device = NULL;
> +	int c, option_index = 0;
> +	data_t data = {};
> +	int ret = 0;
> +
> +	if (argc <= 1) {
> +		usage(argv[0]);
> +		return EXIT_SUCCESS;
> +	}
> +
> +	env_device = getenv("IGT_DEVICE");
> +	igt_devices_scan(false);
> +
> +	if (env_device) {
> +		if (!igt_device_card_match(env_device, &card)) {
> +			igt_warn("No device found for the env_device\n");
> +			ret = EXIT_FAILURE;
> +			goto exit;
> +		}
> +	} else {
> +		if (!igt_device_find_first_i915_discrete_card(&card)) {
> +			igt_warn("No discrete gpu found\n");
> +			ret = EXIT_FAILURE;
> +			goto exit;
> +		}
> +	}
> +
> +	while ((c = getopt_long(argc, argv, optstr,
> +				long_options, &option_index)) != -1) {
> +		switch (c) {
> +		case 'd':
> +			disable_display = true;
> +			break;
> +		case 's':
> +			setup_d3cold = true;
> +			break;
> +		default:
> +		case 'h':
> +			usage(argv[0]);
> +			ret = EXIT_SUCCESS;
> +			goto exit;
> +		}
> +	}
> +
> +	data.drm_fd = igt_open_card(&card);
> +	if (data.drm_fd  >= 0) {
> +		igt_info("Device %s successfully opened\n", card.card);
> +	} else {
> +		igt_warn("Cannot open card %s device\n", card.card);
> +		ret = EXIT_FAILURE;
> +		goto exit;
> +	}
> +
> +	data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
> +	data.devid = intel_get_drm_devid(data.drm_fd);
> +	igt_setup_runtime_pm(data.drm_fd);
> +
> +	data.res = drmModeGetResources(data.drm_fd);
> +	if (data.res) {
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +
> +		/* i915 disables RPM in case DMC is not loaded on kms supported cards */
> +		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
> +			igt_warn("dmc fw is not loaded, no runtime pm\n");
> +			ret = EXIT_FAILURE;
> +			goto exit;
> +		}
> +	}
> +
> +	if (disable_display) {
> +		disable_all_displays(&data);
> +		if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
> +			__igt_debugfs_dump(data.drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
> +			ret = EXIT_FAILURE;
> +			goto exit;
> +		}
> +
> +		igt_info("Device runtime suspended, Useful for debugging.\n"
> +			 "Hit CTRL-C to exit\n");
> +		/* Don't return useful for debugging */
> +		while (1)
> +			sleep(600);
> +	}
> +
> +	if (setup_d3cold)
> +		setup_gfx_card_d3cold(&data);
> +
> +exit:
> +	igt_restore_runtime_pm();
> +
> +	if (data.res)
> +		igt_display_fini(&data.display);
> +
> +	close(data.debugfs_fd);
> +	close(data.drm_fd);
> +	igt_devices_free();
> +
> +	return ret;
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 771d0b9e3..24d0ea714 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -28,6 +28,7 @@ tools_progs = [
>  	'intel_lid',
>  	'intel_opregion_decode',
>  	'intel_panel_fitter',
> +	'intel_pm_rpm',
>  	'intel_reg_checker',
>  	'intel_residency',
>  	'intel_stepping',
> -- 
> 2.26.2
> 
