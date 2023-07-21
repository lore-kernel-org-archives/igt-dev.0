Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351910E61A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 04:05:07 +0000 (UTC)
Message-ID: <ec3724e4-7512-6aae-d167-e07dc75385c0@intel.com>
Date: Fri, 21 Jul 2023 09:34:51 +0530
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230718110852.2965553-1-anshuman.gupta@intel.com>
 <20230718110852.2965553-4-anshuman.gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230718110852.2965553-4-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/3] test/xe_pm: Add
 vram_d3cold_threshold subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman,

On 18-07-2023 16:38, Anshuman Gupta wrote:
> Adding a vram_d3cold_threshold subtest, which creates a Xe bo and
> set the vram_d3cold_threshold according to vram used and bo size.
> Test setups the d3cold and expect card to be limited to d3hot.
> 
> v2:
> - Add subtest doc.
> v3:
> - skip the test on igfx. [Riana]
> - Test doc enhancement. [Riana]
> - Create the bo before vram query. [Riana]
> - Use xe_bo_map insead of xe_bo_mmap_offset and mmap. [Riana]
> - Close the bo handle. [Riana]
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/xe/xe_pm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
> 
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 11a4c3705..a8257b13c 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -20,6 +20,7 @@
>   #include "lib/igt_device.h"
>   #include "lib/igt_kms.h"
>   #include "lib/igt_pm.h"
> +#include "lib/igt_sysfs.h"
>   #include "lib/igt_syncobj.h"
>   #include "lib/intel_reg.h"
>   
> @@ -31,6 +32,8 @@
>   #define NO_SUSPEND -1
>   #define NO_RPM -1
>   
> +#define SIZE (4096 * 1024)
> +
>   typedef struct {
>   	int fd_xe;
>   	struct pci_device *pci_xe;
> @@ -77,6 +80,22 @@ static void set_d3cold_allowed(struct pci_device *pci,
>   	close(fd);
>   }
>   
> +static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
> +{
> +	char path[64];
> +	int ret;
> +
> +	sprintf(path, "device/vram_d3cold_threshold");
> +
> +	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
> +		ret = igt_sysfs_printf(sysfs, path, "%lu", threshold);
> +	else
> +		igt_warn("vram_d3cold_threshold is not present\n");
> +
> +	igt_info("ret value %d", ret);
> +	igt_assert(ret > 0);
> +}
> +
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
>   	igt_dpms_turn_off_display(device.fd_xe);
> @@ -349,6 +368,64 @@ NULL));
>   		igt_assert(in_d3(device, d_state));
>   }
>   
> +/**
> + * SUBTEST: vram-d3cold-threshold
> + * Description:
> + *	Validate whether card is limited to d3hot while vram used
> + *	is greater than vram_d3cold_threshold.
> + * Run type: FULL
> + */
> +static void test_vram_d3cold_threshold(device_t device)
> +{
> +	struct drm_xe_query_mem_usage *mem_usage;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_MEM_USAGE,
> +		.size = 0,
> +		.data = 0,
> +	};
> +	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
> +	uint32_t bo, flags;
> +	void *map;
> +	int i, sysfs_fd;
> +
> +	flags = vram_memory(device.fd_xe, 0);
> +	igt_require_f(flags, "Device doesn't support vram memory region\n");
> +
> +	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_assert_neq(query.size, 0);
> +
> +	mem_usage = malloc(query.size);
> +	igt_assert(mem_usage);
> +
> +	query.data = to_user_pointer(mem_usage);
> +	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	for (i = 0; i < mem_usage->num_regions; i++) {
> +		if (mem_usage->regions[i].mem_class == XE_MEM_REGION_CLASS_VRAM) {
> +			vram_used_mb +=  (mem_usage->regions[i].used / (1024 * 1024));
> +			vram_total_mb += (mem_usage->regions[i].total_size / (1024 * 1024));
> +		}
> +	}
> +
> +	threshold = vram_used_mb;
> +	igt_require(threshold < vram_total_mb);
> +
> +	bo = xe_bo_create_flags(device.fd_xe, 0, SIZE, flags);
> +	map = xe_bo_map(device.fd_xe, bo, SIZE);
> +	memset(map, 0, SIZE);
> +	munmap(map, SIZE);
> +	sysfs_fd = igt_sysfs_open(device.fd_xe);
> +	set_vram_d3cold_threshold(sysfs_fd, threshold);
> +	close(sysfs_fd);
> +
> +	/* Setup D3Cold but card should be in D3hot */
> +	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
> +	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	igt_assert(out_of_d3(device, IGT_ACPI_D3Cold));
> +	gem_close(device.fd_xe, bo);
Should original threshold be restored here to allow D3 cold?

Regards,
Badal
> +}
> +
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -449,6 +526,11 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Validate whether card is limited to d3hot, if vram used > vram threshold");
> +	igt_subtest("vram-d3cold-threshold") {
> +		test_vram_d3cold_threshold(device);
> +	}
> +
>   	igt_fixture {
>   		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
>   		igt_restore_runtime_pm();
