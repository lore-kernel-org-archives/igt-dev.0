Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B049E10E090
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 22:56:31 +0000 (UTC)
Date: Wed, 22 Mar 2023 00:56:26 +0200
From: Imre Deak <imre.deak@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Message-ID: <ZBo2Gsxrp6SKDtKC@ideak-desk.fi.intel.com>
References: <20230315210147.19557-1-mohammed.thasleem@intel.com>
 <20230315210147.19557-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315210147.19557-2-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/i915_pm_dc: Add DC6 DPMS
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

On Thu, Mar 16, 2023 at 02:31:46AM +0530, Mohammed Thasleem wrote:
> The flow for DC6 validation has changed for MTL.
> DC6 state achieved based on PKGC10 entry.
> This test validates PKGC10 entry and confirm DC6 achieved
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 1c695b50..322a0c60 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -45,6 +45,7 @@
>  #define PWR_DOMAIN_INFO "i915_power_domain_info"
>  #define RPM_STATUS "i915_runtime_pm_status"
>  #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
> +#define PACKAGE_STATE_PATH "/sys/kernel/debug/pmc_core/"
>  #define KMS_POLL_DISABLE 0
>  #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid)))
>  
> @@ -60,6 +61,7 @@ typedef struct {
>  	int drm_fd;
>  	int msr_fd;
>  	int debugfs_fd;
> +	int pmc_fd;
>  	uint32_t devid;
>  	char *debugfs_dump;
>  	igt_display_t display;
> @@ -519,6 +521,36 @@ static int has_panels_without_dc_support(igt_display_t *display)
>  	return external_panel;
>  }
>  
> +static unsigned int read_pkc_state_value(int pmc_fd)

A more usual name for the power state is pkgc.

> +{
> +	char buf[4096];
> +	char *str;
> +
> +	igt_require((pmc_fd = open(PACKAGE_STATE_PATH, O_RDONLY)) >= 0);

Better to make the assignment a separate expression and use
igt_debugfs_mount().

> +
> +	igt_debugfs_simple_read(pmc_fd, "package_cstate_show",
> +				buf, sizeof(buf));
> +	igt_skip_on_f(!strstr(buf, "Package C10"),
> +		      "PK10 will be not supported.\n");

Could be simply "PKGC10 is not supported".

> +	str = strstr(buf, "Package C10");

Could move the above before igt_skip_on_f() and reuse str instead of
calling strstr() again.

> +	igt_assert_f(str, "PKC10 value not available\n");

This looks redundant after the skip().

> +
> +	return get_dc_counter(str);
> +}
> +
> +static void test_pkc_state_dpms(data_t *data)
> +{
> +	unsigned int timeout_msec = 30;
> +	unsigned int prev_value = 0, cur_value = 0;
> +
> +	prev_value = read_pkc_state_value(data->pmc_fd);
> +	dpms_off(data);

Outputs will be off here and the device runtime suspends. That measures
the PKGC10 residency in a deeper power state (S0ix), but we want here to
measure only DC6. Should runtime PM be disabled accordingly as on other
platforms (done in setup_dc_dpms())?

> +	igt_wait((cur_value = read_pkc_state_value(data->pmc_fd)),
> +		  timeout_msec * 1000, 100);

igt_wait() accepts msec, so the '* 1000' conversion isn't correct.
A 30 sec timeout looks too long, was it meant to be 3 sec?

> +	igt_assert_f(cur_value > prev_value, "PK10 is not achieived.\n");
> +	dpms_on(data);
> +}
> +
>  static void kms_poll_state_restore(int sig)
>  {
>  	int sysfs_fd;
> @@ -600,7 +632,11 @@ igt_main
>  	igt_subtest("dc6-dpms") {
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
> -		test_dc_state_dpms(&data, CHECK_DC6);
> +		if (intel_display_ver(data.devid) == 14)

Checking for >= 14 makes it future proof.

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
