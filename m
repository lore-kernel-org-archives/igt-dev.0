Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F60110E034
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 20:09:54 +0000 (UTC)
Date: Fri, 13 Oct 2023 16:09:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <ZSmkC54YtjTWWlqw@intel.com>
References: <20231012061444.78748-1-swati2.sharma@intel.com>
 <20231012061444.78748-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231012061444.78748-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add XE
 support
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

On Thu, Oct 12, 2023 at 11:44:44AM +0530, Swati Sharma wrote:
> Add XE driver support.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index a46735875..14f34d904 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -11,7 +11,7 @@
>   * TEST: kms pm rpm
>   * Category: Display
>   * Description: Test to validate Runtime PM
> - * Driver requirement: i915
> + * Driver requirement: i915, xe
>   * Functionality: pm_rpm
>   * Mega feature: Display Power Management
>   * Test category: functionality test
> @@ -37,6 +37,8 @@
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  #include "intel_blt.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>  
>  /**
>   * SUBTEST: basic-pci-d3-state
> @@ -738,7 +740,7 @@ static bool setup_environment(void)
>  	if (has_runtime_pm)
>  		goto out;
>  
> -	drm_fd = __drm_open_driver(DRIVER_INTEL);
> +	drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
>  	igt_require(drm_fd != -1);
>  	igt_device_set_master(drm_fd);
>  
> @@ -1108,6 +1110,7 @@ static bool device_in_pci_d3(struct pci_device *pci_dev)
>  static void pci_d3_state_subtest(void)
>  {
>  	struct pci_device *pci_dev, *bridge_pci_dev;
> +	bool is_dgfx;
>  
>  	igt_require(has_runtime_pm);
>  
> @@ -1117,7 +1120,8 @@ static void pci_d3_state_subtest(void)
>  	disable_all_screens_and_wait(&ms_data);
>  	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
>  
> -	if (gem_has_lmem(drm_fd))
> +	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);

we should probably modify gem_has_lmem to take care of xe instead of this line here;
but anyway, the approach seems right for now and we can improve later

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	if (is_dgfx)
>  		igt_require_f(pci_device_has_kernel_driver(bridge_pci_dev),
>  			      "pci bridge device does not bind with pcieport driver\n");
>  
> @@ -1164,7 +1168,11 @@ static void fill_igt_fb(struct igt_fb *fb, uint32_t color)
>  	int i;
>  	uint32_t *ptr;
>  
> -	ptr = gem_mmap__device_coherent(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
> +	if (is_xe_device(fb->fd))
> +		ptr = xe_bo_mmap_ext(drm_fd, fb->gem_handle, fb->size, PROT_WRITE);
> +	else
> +		ptr = gem_mmap__device_coherent(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
> +
>  	for (i = 0; i < fb->size/sizeof(uint32_t); i++)
>  		ptr[i] = color;
>  	igt_assert(munmap(ptr, fb->size) == 0);
> @@ -1654,10 +1662,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	igt_subtest("dpms-mode-unset-non-lpsp")
>  		dpms_mode_unset_subtest(SCREEN_TYPE_NON_LPSP);
>  	igt_subtest("fences") {
> +		igt_require_i915(drm_fd);
>  		gem_require_mappable_ggtt(drm_fd);
>  		fences_subtest(false);
>  	}
>  	igt_subtest("fences-dpms") {
> +		igt_require_i915(drm_fd);
>  		gem_require_mappable_ggtt(drm_fd);
>  		fences_subtest(true);
>  	}
> @@ -1685,10 +1695,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  
>  	/* power-wake reference tests */
>  	igt_subtest("pm-tiling") {
> +		igt_require_i915(drm_fd);
>  		gem_require_mappable_ggtt(drm_fd);
>  		pm_test_tiling();
>  	}
>  	igt_subtest("pm-caching") {
> +		igt_require_i915(drm_fd);
>  		gem_require_mappable_ggtt(drm_fd);
>  		pm_test_caching();
>  	}
> -- 
> 2.25.1
> 
