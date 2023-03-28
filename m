Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6E110E9CA
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 19:34:21 +0000 (UTC)
Date: Tue, 28 Mar 2023 22:34:16 +0300
From: Imre Deak <imre.deak@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Message-ID: <ZCNBOG62rGF2o9RR@ideak-desk.fi.intel.com>
References: <20230315210147.19557-2-mohammed.thasleem@intel.com>
 <20230327193043.27678-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327193043.27678-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH v3 1/2] tests/i915/i915_pm_dc: Add DC6 DPMS
 test for mtl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 01:00:43AM +0530, Mohammed Thasleem wrote:
> The flow for DC6 validation has changed for MTL.
> DC6 state achieved based on PKGC10 entry.
> This test validates PKGC10 entry and confirm DC6 achieved
> 
> v2: - Removed varisable to store disp version. (Vinod)
> v3: - Used igt_debugfs_mount to open the path. (Imre)
>     - Updated string in igt_skip_on_f. (Imre)
>     - Removed redundant code. (Imre)
>     - Set test execution for display for version >=14. (Imre)
>     - Rename function read_pkc_state_value with pkgc. (Imre)
>     - Added runtime PM disabled and enable. (Imre).
>     - During testing the entry always happened in ~4.5ses, so
>       set max igt_wait to 5sec.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 1c695b50..2da415e8 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -45,6 +45,7 @@
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
>  #define RPM_STATUS "i915_runtime_pm_status"
>  #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
> +#define PACKAGE_STATE_PATH "pmc_core/package_cstate_show"
>  #define KMS_POLL_DISABLE 0
>  #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid)))
>  
> @@ -60,6 +61,7 @@ typedef struct {
>  	int drm_fd;
>  	int msr_fd;
>  	int debugfs_fd;
> +	int pmc_fd;

Should be int sysfs_fd;

>  	uint32_t devid;
>  	char *debugfs_dump;
>  	igt_display_t display;
> @@ -519,6 +521,34 @@ static int has_panels_without_dc_support(igt_display_t *display)
>  	return external_panel;
>  }
>  
> +static unsigned int pkgc(int pmc_fd)

The name should still reflect what the function does:

static unsigned int read_pkgc_counter(int sysfs_fd)

> +{
> +	char buf[4096];
> +	char *str;
> +
> +	pmc_fd = open(igt_debugfs_mount(), O_RDONLY);
> +	igt_debugfs_simple_read(pmc_fd, PACKAGE_STATE_PATH, buf, sizeof(buf));

It's a sysfs entry, so:
	len = igt_sysfs_read(sysfs_fd, PACKAGE_STATE_PATH, buf, sizeof(buf));
	igt_skip_on_f(len < 0, "PKGC state file not found\n");

> +	str = strstr(buf, "Package C10");
> +	igt_skip_on_f(!strstr(buf, "Package C10"), "PKGC10 is not supported.\n");

the above strstr() call is still redundant, should be:

	igt_skip_on_f(!str, "...");

> +	close(pmc_fd);
> +
> +	return get_dc_counter(str);
> +}
> +
> +static void test_pkc_state_dpms(data_t *data)
> +{
> +	unsigned int timeout_sec = 5;
> +	unsigned int prev_value = 0, cur_value = 0;
> +
> +	prev_value = pkgc(data->pmc_fd);

	prev_value = read_pkgc_counter(data->sysfs_fd);

> +	setup_dc_dpms(data);
> +	dpms_off(data);
> +	igt_wait((cur_value = pkgc(data->pmc_fd)) > prev_value, timeout_sec * 1000, 100);
> +	igt_assert_f(cur_value > prev_value, "PK10 is not achieived.\n");
> +	dpms_on(data);
> +	cleanup_dc_dpms(data);
> +}
> +
>  static void kms_poll_state_restore(int sig)
>  {
>  	int sysfs_fd;
> @@ -600,7 +630,11 @@ igt_main

After initing data.debugfs_fd under igt_fixture:

	data.sysfs_fd = igt_sysfs_open(data.drm_fd);
	igt_require(data.sysfs_fd != -1);

>  	igt_subtest("dc6-dpms") {
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
> -		test_dc_state_dpms(&data, CHECK_DC6);
> +		if (intel_display_ver(data.devid) >= 14)
> +			test_pkc_state_dpms(&data);
> +		else
> +			test_dc_state_dpms(&data, CHECK_DC6);
> +
>  	}
>  
>  	igt_describe("This test validates display engine entry to DC9 state");
> -- 
> 2.25.1
> 
