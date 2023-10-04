Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405A010E10B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 15:42:20 +0000 (UTC)
Date: Wed, 4 Oct 2023 11:42:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZR2H06FbCliiInNP@intel.com>
References: <20230929101155.614980-1-anshuman.gupta@intel.com>
 <20230929101155.614980-2-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929101155.614980-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] test/xe_pm: Add exit handler to
 close fw handle
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

On Fri, Sep 29, 2023 at 03:41:54PM +0530, Anshuman Gupta wrote:
> Adding an exit handler to close the fw handle to make sure we don't
> leak the fw in CI environment. Adding a IGT subtest group for the
> test using the fw handle to runtime wake the device.
> Scaling forcewake close exit handler for vram-d3cold-threshold
> subtest, while doing so add the missing subtest Functionality
> as well.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_pm.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index fd28d5630..48518a5e5 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -39,6 +39,7 @@ typedef struct {
>  } device_t;
>  
>  uint64_t orig_threshold;
> +int fw_handle = -1;
>  
>  /* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
>  static bool runtime_usage_available(struct pci_device *pci)
> @@ -166,6 +167,14 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
>  	return true;
>  }
>  
> +static void close_fw_handle(int sig)
> +{
> +	if (fw_handle < 0)
> +		return;
> +
> +	close(fw_handle);
> +}
> +
>  /**
>   * SUBTEST: %s-basic
>   * Description: set GPU state to %arg[1] and test suspend/autoresume
> @@ -381,7 +390,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  	};
>  	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
>  	uint32_t bo, flags;
> -	int handle, i;
> +	int i;
>  	bool active;
>  	void *map;
>  
> @@ -427,10 +436,10 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  	 * the device from runtime suspend.
>  	 * Therefore open and close fw handle to wake the device.
>  	 */
> -	handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> -	igt_assert(handle >= 0);
> +	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +	igt_assert(fw_handle >= 0);
>  	active = igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE;
> -	close(handle);
> +	close(fw_handle);
>  	igt_assert(active);
>  
>  	/* Test D3Cold again after freeing up the Xe BO */
> @@ -535,11 +544,18 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Validate whether card is limited to d3hot, if vram used > vram threshold");
> -	igt_subtest("vram-d3cold-threshold") {
> -		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
> -		igt_install_exit_handler(vram_d3cold_threshold_restore);
> -		test_vram_d3cold_threshold(device, sysfs_fd);
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_install_exit_handler(close_fw_handle);
> +		}
> +
> +		igt_describe("Validate whether card is limited to d3hot,"
> +			     "if vram used > vram threshold");
> +		igt_subtest("vram-d3cold-threshold") {
> +			orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
> +			igt_install_exit_handler(vram_d3cold_threshold_restore);
> +			test_vram_d3cold_threshold(device, sysfs_fd);
> +		}
>  	}
>  
>  	igt_fixture {
> -- 
> 2.25.1
> 
