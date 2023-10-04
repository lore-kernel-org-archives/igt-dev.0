Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1846910E131
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 15:45:05 +0000 (UTC)
Date: Wed, 4 Oct 2023 11:44:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZR2IdFYQrSJ6mnVV@intel.com>
References: <20230929101155.614980-1-anshuman.gupta@intel.com>
 <20230929101155.614980-3-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929101155.614980-3-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/xe_pm: Add d3-mmap IGT test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 03:41:55PM +0530, Anshuman Gupta wrote:
> Adding a test to validate mmap memory mappings along with runtime
> suspend and resume for both xe device and it's pci parent bridge
> in device hierarchy.
> 
> v2:
> - Use 0xc00fee pattern. [Rodrigo]
> - Test the pagefault case on read and write the mapping. [Rodrigo]
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_pm.c | 88 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 48518a5e5..8656e2146 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -446,6 +446,77 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  	igt_assert(in_d3(device, IGT_ACPI_D3Cold));
>  }
>  
> +/**
> + * SUBTEST: d3-mmap-%s
> + * Description:
> + *	Validate mmap memory mapping with d3 state, for %arg[1] region,
> + *	if supported by device.
> + * arg[1]:
> + *
> + * @vram:	vram region
> + * @system:	system region
> + *
> + * Functionality: pm-d3
> + * Run type: FULL
> + */
> +static void test_mmap(device_t device, uint32_t flags)
> +{
> +	size_t bo_size = 8192;
> +	uint32_t *map = NULL;
> +	uint32_t bo;
> +	int i;
> +
> +	igt_require_f(flags, "Device doesn't support such memory region\n");
> +
> +	bo = xe_bo_create_flags(device.fd_xe, 0, bo_size, flags);
> +	map = xe_bo_map(device.fd_xe, bo, bo_size);
> +	igt_assert(map);
> +	memset(map, 0, bo_size);
> +
> +	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +
> +	igt_assert(fw_handle >= 0);
> +	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +
> +	for (i = 0; i < bo_size / 4; i++)
> +		map[i] = 0xc0ffee;
> +
> +	for (i = 0; i < bo_size / 4; i++)
> +		igt_assert(map[i] == 0xc0ffee);
> +
> +	/* Runtime suspend and validate the pattern and changed the pattern */
> +	close(fw_handle);
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +	for (i = 0; i < bo_size / 4; i++)
> +		igt_assert(map[i] == 0xc0ffee);
> +
> +	/* dgfx page-fault on mmaping should wake the gpu */
> +	if (xe_has_vram(device.fd_xe))
> +		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +	for (i = 0; i < bo_size / 4; i++)
> +		map[i] = 0xdeadbeef;
> +
> +	if (xe_has_vram(device.fd_xe))
> +		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +	/* Runtime resume and check the pattern */
> +	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +	igt_assert(fw_handle >= 0);
> +	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +	for (i = 0; i < bo_size / 4; i++)
> +		igt_assert(map[i] == 0xdeadbeef);
> +
> +	igt_assert(munmap(map, bo_size) == 0);
> +	gem_close(device.fd_xe, bo);
> +	close(fw_handle);
> +}
> +
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> @@ -556,6 +627,23 @@ igt_main
>  			igt_install_exit_handler(vram_d3cold_threshold_restore);
>  			test_vram_d3cold_threshold(device, sysfs_fd);
>  		}
> +
> +		igt_describe("Validate mmap memory mappings with system region,"
> +			     "when device along with parent bridge in d3");
> +		igt_subtest("d3-mmap-system") {
> +			test_mmap(device, system_memory(device.fd_xe));
> +		}
> +
> +		igt_describe("Validate mmap memory mappings with vram region,"
> +			     "when device along with parent bridge in d3");
> +		igt_subtest("d3-mmap-vram") {
> +			if (device.pci_root != device.pci_xe) {
> +				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
> +				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> +			}
> +
> +			test_mmap(device, visible_vram_memory(device.fd_xe, 0));
> +		}
>  	}
>  
>  	igt_fixture {
> -- 
> 2.25.1
> 
