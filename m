Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F5810E11F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 16:24:34 +0000 (UTC)
Date: Thu, 5 Jan 2023 17:24:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y7b5saKiOFwigjmg@kamilkon-desk1>
References: <20230105005320.157831-1-vitaly.prosyak@amd.com>
 <20230105005320.157831-2-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105005320.157831-2-vitaly.prosyak@amd.com>
Subject: Re: [igt-dev] [PATCH 2/4] lib/amdgpu: move function to another file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vitaly,

On 2023-01-04 at 19:53:18 -0500, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> No functional change just cosmetic.

Please do not mix in adding some debug printing with code moving.

> Move function amdgpu_open_devices to the shared file
> since other tests will also use it.
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>  lib/amdgpu/amd_ip_blocks.c  | 94 ++++++++++++++++++++++++++++++++++---
>  lib/amdgpu/amd_ip_blocks.h  |  5 ++
>  lib/amdgpu/amd_pci_unplug.c | 69 ---------------------------
>  lib/amdgpu/amd_pci_unplug.h |  3 +-
>  4 files changed, 93 insertions(+), 78 deletions(-)
> 
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 3331c40bd..ce1bddffc 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -22,6 +22,8 @@
>   *
>   *
>   */
> +#include <fcntl.h>
> +
>  #include "amd_memory.h"
>  #include "amd_ip_blocks.h"
>  #include "amd_PM4.h"
> @@ -616,21 +618,30 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
>  			 amdinfo->family_id, amdinfo->chip_external_rev);
>  		return -1;
> +	} else {
> +		igt_info("amdgpu: %s (family_id, chip_external_rev): (%u, %u)\n",
> +				info->name, amdinfo->family_id, amdinfo->chip_external_rev);
>  	}
>  
> -	if (info->family >= CHIP_SIENNA_CICHLID)
> +	if (info->family >= CHIP_SIENNA_CICHLID) {
>  		info->chip_class = GFX10_3;
> -	else if (info->family >= CHIP_NAVI10)
> +		igt_info("amdgpu: chip_class GFX10_3\n");
--------------- ^
Do you really want that at every function use ? Maybe better
to use igt_debug and have separate function for printing ?

> +	} else if (info->family >= CHIP_NAVI10) {
>  		info->chip_class = GFX10;
> -	else if (info->family >= CHIP_VEGA10)
> +		igt_info("amdgpu: chip_class GFX10\n");
> +	} else if (info->family >= CHIP_VEGA10) {
>  		info->chip_class = GFX9;
> -	else if (info->family >= CHIP_TONGA)
> +		igt_info("amdgpu: chip_class GFX9\n");
> +	} else if (info->family >= CHIP_TONGA) {
>  		info->chip_class = GFX8;
> -	else if (info->family >= CHIP_BONAIRE)
> +		igt_info("amdgpu: chip_class GFX8\n");
> +	} else if (info->family >= CHIP_BONAIRE) {
>  		info->chip_class = GFX7;
> -	else if (info->family >= CHIP_TAHITI)
> +		igt_info("amdgpu: chip_class GFX7\n");
> +	} else if (info->family >= CHIP_TAHITI) {
>  		info->chip_class = GFX6;
> -	else {
> +		igt_info("amdgpu: chip_class GFX6\n");
> +	} else {
>  		igt_info("amdgpu: Unknown family.\n");

Here you can print detailed info.

>  		return -1;
>  	}
> @@ -663,3 +674,72 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
>  
>  	return 0;
>  }
> +

Please write description of each new library function.

> +int
> +amdgpu_open_devices(bool open_render_node, int  max_cards_supported, int drm_amdgpu_fds[])
> +{
> +	drmDevicePtr devices[MAX_CARDS_SUPPORTED];
> +	int i;
> +	int drm_node;
> +	int amd_index = 0;
> +	int drm_count;
> +	int fd;
> +	drmVersionPtr version;
> +
> +	for (i = 0; i < max_cards_supported && i < MAX_CARDS_SUPPORTED; i++)
> +		drm_amdgpu_fds[i] = -1;
> +
> +	drm_count = drmGetDevices2(0, devices, MAX_CARDS_SUPPORTED);
> +
> +	if (drm_count < 0) {
> +		fprintf(stderr, "drmGetDevices2() returned an error %d\n", drm_count);
--------------- ^
We have igt_info() and igt_debug() messages, please use them.

> +		return 0;
> +	}
> +
> +	for (i = 0; i < drm_count; i++) {
> +		/* If this is not PCI device, skip*/
> +		if (devices[i]->bustype != DRM_BUS_PCI)
> +			continue;
> +
> +		/* If this is not AMD GPU vender ID, skip*/
> +		if (devices[i]->deviceinfo.pci->vendor_id != 0x1002)
> +			continue;
> +
> +		if (open_render_node)
> +			drm_node = DRM_NODE_RENDER;
> +		else
> +			drm_node = DRM_NODE_PRIMARY;
> +
> +		fd = -1;
> +		if (devices[i]->available_nodes & 1 << drm_node)
> +			fd = open(
> +				devices[i]->nodes[drm_node],
> +				O_RDWR | O_CLOEXEC);
> +
> +		/* This node is not available. */
> +		if (fd < 0) continue;
--------------------------- ^
This should be at line below.

> +
> +		version = drmGetVersion(fd);
> +		if (!version) {
> +			fprintf(stderr, "Warning: Cannot get version for %s." "Error is %s\n",
---------------------------------------------------------------------------- ^^
Did you mean putting this at line below ?

Please use checkpatch script from linux kernel before sending
patches, it can find some problems with formatting and spelling.

If that was in original code then mention that corrections in
patch message.

> +				devices[i]->nodes[drm_node], strerror(errno));
> +			close(fd);
> +			continue;
> +		}
> +
> +		if (strcmp(version->name, "amdgpu")) {
> +			/* This is not AMDGPU driver, skip.*/
> +			drmFreeVersion(version);
> +			close(fd);
> +			continue;
> +		}
> +
> +		drmFreeVersion(version);
> +
> +		drm_amdgpu_fds[amd_index] = fd;
> +		amd_index++;
> +	}
> +
> +	drmFreeDevices(devices, drm_count);
> +	return amd_index;
> +}
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 908aacde0..b3620c00f 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -27,6 +27,8 @@
>  
>  #include "amd_registers.h"
>  
> +#define MAX_CARDS_SUPPORTED 4
> +
>  enum amd_ip_block_type {
>  	AMD_IP_GFX,
>  	AMD_IP_COMPUTE,
> @@ -136,4 +138,7 @@ struct amdgpu_cmd_base* get_cmd_base(void);
>  
>  void free_cmd_base(struct amdgpu_cmd_base *base);
>  
> +int
> +amdgpu_open_devices(bool open_render_node, int  max_cards_supported, int drm_amdgpu_fds[]);
------------------------------------------------ ^^
Two spaces, one is enough.

Regards,
Kamil

> +
>  #endif
> diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
> index 28b3ae393..078398b5e 100644
> --- a/lib/amdgpu/amd_pci_unplug.c
> +++ b/lib/amdgpu/amd_pci_unplug.c
> @@ -21,7 +21,6 @@
>   *
>  */
>  #include <linux/limits.h>
> -#include <sys/types.h>
>  #include <fcntl.h>
>  #include <sys/stat.h>
>  #include <pthread.h>
> @@ -35,74 +34,6 @@
>  #include "xalloc.h"
>  #include "amd_ip_blocks.h"
>  
> -static int
> -amdgpu_open_devices(bool open_render_node, int  max_cards_supported, int drm_amdgpu_fds[])
> -{
> -	drmDevicePtr devices[MAX_CARDS_SUPPORTED];
> -	int i;
> -	int drm_node;
> -	int amd_index = 0;
> -	int drm_count;
> -	int fd;
> -	drmVersionPtr version;
> -
> -	for (i = 0; i < max_cards_supported && i < MAX_CARDS_SUPPORTED; i++)
> -		drm_amdgpu_fds[i] = -1;
> -
> -	drm_count = drmGetDevices2(0, devices, MAX_CARDS_SUPPORTED);
> -
> -	if (drm_count < 0) {
> -		fprintf(stderr, "drmGetDevices2() returned an error %d\n", drm_count);
> -		return 0;
> -	}
> -
> -	for (i = 0; i < drm_count; i++) {
> -		/* If this is not PCI device, skip*/
> -		if (devices[i]->bustype != DRM_BUS_PCI)
> -			continue;
> -
> -		/* If this is not AMD GPU vender ID, skip*/
> -		if (devices[i]->deviceinfo.pci->vendor_id != 0x1002)
> -			continue;
> -
> -		if (open_render_node)
> -			drm_node = DRM_NODE_RENDER;
> -		else
> -			drm_node = DRM_NODE_PRIMARY;
> -
> -		fd = -1;
> -		if (devices[i]->available_nodes & 1 << drm_node)
> -			fd = open(
> -				devices[i]->nodes[drm_node],
> -				O_RDWR | O_CLOEXEC);
> -
> -		/* This node is not available. */
> -		if (fd < 0) continue;
> -
> -		version = drmGetVersion(fd);
> -		if (!version) {
> -			fprintf(stderr, "Warning: Cannot get version for %s." "Error is %s\n",
> -				devices[i]->nodes[drm_node], strerror(errno));
> -			close(fd);
> -			continue;
> -		}
> -
> -		if (strcmp(version->name, "amdgpu")) {
> -			/* This is not AMDGPU driver, skip.*/
> -			drmFreeVersion(version);
> -			close(fd);
> -			continue;
> -		}
> -
> -		drmFreeVersion(version);
> -
> -		drm_amdgpu_fds[amd_index] = fd;
> -		amd_index++;
> -	}
> -
> -	drmFreeDevices(devices, drm_count);
> -	return amd_index;
> -}
>  static bool
>  amdgpu_node_is_drm(int maj, int min)
>  {
> diff --git a/lib/amdgpu/amd_pci_unplug.h b/lib/amdgpu/amd_pci_unplug.h
> index 509b6ec4c..35d4dce3a 100644
> --- a/lib/amdgpu/amd_pci_unplug.h
> +++ b/lib/amdgpu/amd_pci_unplug.h
> @@ -26,8 +26,7 @@
>  
>  #include <amdgpu.h>
>  #include <amdgpu_drm.h>
> -
> -#define MAX_CARDS_SUPPORTED 4
> +#include "amd_ip_blocks.h"
>  
>  struct amd_pci_unplug_setup {
>  	uint32_t  major_version_req;
> -- 
> 2.25.1
> 
