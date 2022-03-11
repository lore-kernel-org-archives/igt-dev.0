Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C25910E30C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 16:58:34 +0000 (UTC)
Message-ID: <38b75b8c-1dcc-9296-5233-bae5684125a6@amd.com>
Date: Fri, 11 Mar 2022 11:58:29 -0500
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220310223046.578910-1-dingchen.zhang@amd.com>
 <20220310223046.578910-3-dingchen.zhang@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20220310223046.578910-3-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/4] lib/igt_amd: add helpers to check PSR
 capibility
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-03-10 17:30, David Zhang wrote:
> [why]
> For AMDGPU devices, the debugfs interface to check sink PSR cap
> is a bit different from that of i915, i.e. the interface is located
> in the path
> <debugfs_root>/dri/0/eDP-X/psr_capability
> where 'X' is eDP connector index.
> 
> We need such debugfs interface to check if the sink device and the
> x86 driver supports PSR or PSR-SU capabilities.
> 
> [how]
> define and add the helpers to read from connector debugfs interface
> 
> For sink device PSR cap check:
> - for PSR1 device, the psr version DPCD be 0x1
> - for PSR-SU device, the psr version DPCD be either 0x3 or 0x4.
> 
> For amdgpu x86 driver PSR support check:
> - for PSR1, expect to contain sub-string "yes"
> - for PSR-SU, expect to contain sub-string "yes [0x1]"
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> ---
>   lib/igt_amd.c | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_amd.h |  8 +++++
>   2 files changed, 101 insertions(+)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index ae94fb99..7f52803b 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1004,3 +1004,96 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>   	close(fd);
>   	return true;
>   }
> +
> +/**
> + * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name)
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
> +	res = fstatat(fd, DEBUGFS_EDP_PSR_CAP, &stat, 0);
> +	if (res != 0) {
> +		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_EDP_PSR_CAP);
> +		close(fd);
> +		return false;
> +	}
> +
> +	close(fd);
> +	return true;
> +}
> +
> +/**
> + * igt_amd_psr_support_sink: check if sink device support PSR
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + * @mode: expected PSR mode, either PSR1 or PSR2
> + */
> +bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode)
> +{
> +	char buf[PSR_STATUS_MAX_LEN];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_PSR_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_EDP_PSR_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	if (mode == PSR_MODE_1)
> +		return strstr(buf, "Sink_Support: yes [0x01]");
> +	else
> +		return strstr(buf, "Sink support: yes [0x03]") ||
> +		       strstr(buf, "Sink support: yes [0x04]");

Looks like a typo here Sink_Support vs Sink support ?
Besides, I dont see any code in debugfs that prints either of these. Is 
there an associated unmerged patch for kernel ?

> +}
> +
> +/**
> + * igt_amd_psr_support_drv: check if AMDGPU kernel driver support PSR
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + * @mode: expected PSR mode, either PSR1 or PSR2
> + */
> +bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode)
> +{
> +	char buf[PSR_STATUS_MAX_LEN];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_PSR_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_EDP_PSR_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	if (mode == PSR_MODE_1)
> +		return strstr(buf, "Driver support: yes");
> +	else
> +		return strstr(buf, "Driver support: yes [0x01]");
> +}
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index f11e36b2..6e465817 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -26,6 +26,7 @@
>   #include <stdint.h>
>   #include "igt.h"
>   #include "igt_fb.h"
> +#include "igt_psr.h"
>   
>   /* Read & Write DSC parameters */
>   #define DEBUGFS_DSC_CLOCK_EN "dsc_clock_en"
> @@ -42,8 +43,10 @@
>   #define DEBUGFS_DP_LINK_SETTINGS "link_settings"
>   #define DEBUGFS_HPD_TRIGGER "trigger_hotplug"
>   
> +/* eDP related */
>   #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
>   #define MAX_SUPPORTED_ILR 8
> +#define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>   
>   enum amd_dsc_clock_force {
>   	DSC_AUTOMATIC = 0,
> @@ -129,11 +132,16 @@ void igt_amd_write_link_settings(
>   	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
>   	enum dc_link_rate link_rate, enum dc_link_training_type training_type);
>   bool igt_amd_output_has_link_settings(int drm_fd, char *connector_name);
> +
> +/* eDP debugfs helpers */
>   void igt_amd_read_ilr_setting(
>   	int drm_fd, char *connector_name, int *supported_ilr);
>   void igt_amd_write_ilr_setting(
>   	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
>   	uint8_t link_rate_set);
>   bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
> +bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
> +bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
>   
>   #endif /* IGT_AMD_H */
