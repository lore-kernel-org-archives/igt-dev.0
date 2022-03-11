Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971BB10E84A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 21:19:49 +0000 (UTC)
Message-ID: <5fde7359-b6f8-b3c0-f523-cd37d9fe97f2@amd.com>
Date: Fri, 11 Mar 2022 16:19:42 -0500
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220311194452.291714-1-dingchen.zhang@amd.com>
 <20220311194452.291714-4-dingchen.zhang@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20220311194452.291714-4-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 3/4] lib/igt_amd: add helpers to check PSR
 state
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



On 2022-03-11 14:44, David Zhang wrote:
> [why]
> For AMDGPU devices, we'd check the PSR state via reading from the
> debugfs interface for a given eDP connector, where the debugfs
> interface path locates at
>    <debugfs_root>/dri/0/eDP-X/psr_state
> where 'X' is the eDP connector index.
> 
> [how]
> define and add the helper to check if PSR state debugfs interface
> is supported in driver, and the helper to read PSR state from the
> debugfs interface.
> 
> In addition, the helper to check debugfs supported is generic and
> can be used to replacing the existed redundant codes.

I'd recommend keeping any code refactor separate from feature related 
changes. This would come handy in case there is a regression. By 
reverting the feature related code, we dont need to lose out on the code 
refactor and vice versa.

Please split this code into two commits - one which does the refactor 
and the other for the PSR related change.

> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> ---
>   lib/igt_amd.c          | 142 +++++++++++++++++------------------------
>   lib/igt_amd.h          |   3 +
>   tests/amdgpu/amd_psr.c |  13 +---
>   3 files changed, 65 insertions(+), 93 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 577a8612..0e861ab1 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -251,11 +251,15 @@ bool igt_amd_is_tiled(uint64_t modifier)
>   }
>   
>   /**
> - * igt_amd_output_has_dsc: check if connector has dsc debugfs entry
> - * @drm_fd: DRM file descriptor
> - * @connector_name: The connector's name, on which we're reading the status
> + * @brief generic helper to check if the debugfs entry of given connector has the
> + *        debugfs interface defined.
> + * @param drm_fd: DRM file descriptor
> + * @param connector_name: The connector's name, on which we're reading the status
> + * @param interface_name: The debugfs interface name to check
> + * @return true if <debugfs_root>/connector_name/interface_name exists and defined
> + * @return false otherwise
>    */
> -static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
> +static bool igt_amd_output_has_debugfs(int drm_fd, char *connector_name, const char *interface_name)
>   {
>   	int fd;
>   	int res;
> @@ -267,9 +271,9 @@ static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
>   		return false;
>   	}
>   
> -	res = fstatat(fd, DEBUGFS_DSC_CLOCK_EN , &stat, 0);
> +	res = fstatat(fd, interface_name, &stat, 0);
>   	if (res != 0) {
> -		igt_info("%s debugfs not supported\n", DEBUGFS_DSC_CLOCK_EN);
> +		igt_info("output %s: %s debugfs not supported\n", connector_name, interface_name);
>   		close(fd);
>   		return false;
>   	}
> @@ -278,6 +282,16 @@ static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
>   	return true;
>   }
>   
> +/**
> + * igt_amd_output_has_dsc: check if connector has dsc debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +static bool igt_amd_output_has_dsc(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_DSC_CLOCK_EN);
> +}
> +
>   /**
>    * is_dp_dsc_supported: Checks if connector is DSC capable
>    * @display: A pointer to an #igt_display_t structure
> @@ -707,25 +721,7 @@ int igt_amd_read_dsc_param_slice_bpg(int drm_fd, char *connector_name)
>    */
>   static bool igt_amd_output_has_hpd(int drm_fd, char *connector_name)
>   {
> -        int fd;
> -        int res;
> -        struct stat stat;
> -
> -        fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> -        if (fd < 0) {
> -                igt_info("output %s: debugfs not found\n", connector_name);
> -                return false;
> -        }
> -
> -        res = fstatat(fd, DEBUGFS_HPD_TRIGGER, &stat, 0);
> -        if (res != 0) {
> -                igt_info("%s debugfs not supported\n", DEBUGFS_HPD_TRIGGER);
> -                close(fd);
> -                return false;
> -        }
> -
> -        close(fd);
> -        return true;
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_HPD_TRIGGER);
>   }
>   
>   /**
> @@ -872,25 +868,7 @@ void igt_amd_write_link_settings(
>    */
>   bool igt_amd_output_has_link_settings(int drm_fd, char *connector_name)
>   {
> -	int fd;
> -	int res;
> -	struct stat stat;
> -
> -	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> -	if (fd < 0) {
> -		igt_info("output %s: debugfs not found\n", connector_name);
> -		return false;
> -	}
> -
> -	res = fstatat(fd, DEBUGFS_DP_LINK_SETTINGS, &stat, 0);
> -	if (res != 0) {
> -		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_DP_LINK_SETTINGS);
> -		close(fd);
> -		return false;
> -	}
> -
> -	close(fd);
> -	return true;
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_DP_LINK_SETTINGS);;
>   }
>   
>   /*
> @@ -984,25 +962,7 @@ void igt_amd_write_ilr_setting(
>    */
>   bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>   {
> -	int fd;
> -	int res;
> -	struct stat stat;
> -
> -	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> -	if (fd < 0) {
> -		igt_info("output %s: debugfs not found\n", connector_name);
> -		return false;
> -	}
> -
> -	res = fstatat(fd, DEBUGFS_EDP_ILR_SETTING, &stat, 0);
> -	if (res != 0) {
> -		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_EDP_ILR_SETTING);
> -		close(fd);
> -		return false;
> -	}
> -
> -	close(fd);
> -	return true;
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);;
>   }
>   
>   /**
> @@ -1012,25 +972,7 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>    */
>   bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name)
>   {
> -	int fd;
> -	int res;
> -	struct stat stat;
> -
> -	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> -	if (fd < 0) {
> -		igt_info("output %s: debugfs not found\n", connector_name);
> -		return false;
> -	}
> -
> -	res = fstatat(fd, DEBUGFS_EDP_PSR_CAP, &stat, 0);
> -	if (res != 0) {
> -		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_EDP_PSR_CAP);
> -		close(fd);
> -		return false;
> -	}
> -
> -	close(fd);
> -	return true;
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_PSR_CAP);
>   }
>   
>   /**
> @@ -1097,3 +1039,39 @@ bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mod
>   	else
>   		return strstr(buf, "Driver support: yes [0x01]");
>   }
> +
> +/**
> + * igt_amd_output_has_psr_state: check if eDP connector has psr_state debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_PSR_STATE);
> +}
> +
> +/**
> + * @brief Read PSR State from debugfs interface
> + * @param drm_fd DRM file descriptor
> + * @param connector_name The connector's name, on which we're reading the status
> + * @return PSR state as integer
> + */
> +int igt_amd_read_psr_state(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_PSR_STATE, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		     DEBUGFS_EDP_PSR_STATE, connector_name);
> +
> +	return strtol(buf, NULL, 10);
> +}
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 6e465817..f87c1991 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -47,6 +47,7 @@
>   #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
>   #define MAX_SUPPORTED_ILR 8
>   #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
> +#define DEBUGFS_EDP_PSR_STATE	"psr_state"
>   
>   enum amd_dsc_clock_force {
>   	DSC_AUTOMATIC = 0,
> @@ -143,5 +144,7 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
>   bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
>   bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
>   bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
> +bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
> +int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
>   
>   #endif /* IGT_AMD_H */
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 732eab25..88e824c3 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -24,6 +24,7 @@
>   #include "igt.h"
>   #include "igt_core.h"
>   #include "igt_kms.h"
> +#include "igt_amd.h"

Please be mindful of the indentation. One way to fix it is to use 
clang-format to do it automatically for you. You can get the 
.clang-format file for the configuration from Linux kernel root.

>   #include <stdint.h>
>   #include <fcntl.h>
>   #include <xf86drmMode.h>
> @@ -34,7 +35,6 @@
>    */
>   IGT_TEST_DESCRIPTION("Basic test for enabling Panel Self Refresh for eDP displays");
>   
> -#define DEBUGFS_PSR_STATE "psr_state"
>   /* After a full update, a few fast updates are necessary for PSR to be enabled */
>   #define N_FLIPS 6
>   /* DMCUB takes some time to actually enable PSR. Worst case delay is 4 seconds */
> @@ -108,8 +108,6 @@ static int check_conn_type(data_t *data, uint32_t type) {
>   }
>   
>   static void run_check_psr(data_t *data, bool test_null_crtc) {
> -	char buf[8];
> -	char *connector_name;
>   	int fd, edp_idx, dp_idx, ret, i, psr_state;
>   	igt_fb_t ref_fb, ref_fb2;
>   	igt_fb_t *flip_fb;
> @@ -157,14 +155,7 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
>   		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>   			continue;
>   
> -		connector_name = output->name;
> -		fd = igt_debugfs_connector_dir(data->fd, connector_name, O_RDONLY);
> -		igt_assert(fd >= 0);
> -
> -		ret = igt_debugfs_simple_read(fd, DEBUGFS_PSR_STATE, buf, sizeof(buf));
> -		igt_require(ret > 0);
> -
> -		psr_state =  (int) strtol(buf, NULL, 10);
> +		psr_state = igt_amd_read_psr_state(data->fd, output->name);
>   		igt_fail_on_f(psr_state < 1, "PSR was not enabled for connector %s\n", output->name);
>   		igt_fail_on_f(psr_state == 0xff, "PSR is invalid for connector %s\n", output->name);
>   		igt_fail_on_f(psr_state != 5, "PSR state is expected to be at 5 on a "
