Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94CE10ECFA
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 14:22:11 +0000 (UTC)
Date: Fri, 22 Apr 2022 16:22:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmK6D2iiWseVOsIh@kamilkon-DESK1>
References: <20220418125048.7969-1-anshuman.gupta@intel.com>
 <20220418125048.7969-7-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220418125048.7969-7-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/9] i915_pm_rpm: Add D3Cold basic
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman,

On 2022-04-18 at 18:20:45 +0530, Anshuman Gupta wrote:
> Add support for D3Cold basic subtest.
> It setup and prepares the gfx PCI card for D3Cold
> and checks the ACPI D3Cold state.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_pm_rpm.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index d2bce5826..c30862dc4 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -1534,6 +1534,31 @@ __noreturn static void stay_subtest(void)
>  		sleep(600);
>  }
>  
> +static void d3cold_basic_subtest(void)
> +{
> +	struct pci_device *root;
> +	bool result;
> +
> +	/* igfx does not support d3cold */
> +	igt_require(IS_DGFX(ms_data.devid));
> +
> +	root = igt_device_get_pci_root_port(drm_fd);
> +	disable_all_screens_and_wait(&ms_data);
> +	igt_require(igt_pm_acpi_d3cold_supported(root));
> +	igt_pm_setup_pci_card_runtime_pm(root);
> +
> +	result = igt_wait(igt_pm_get_acpi_real_d_state(root) == IGT_ACPI_D3Cold, 10000, 500);
> +
> +	if (!result) {
> +		igt_info("D3Cold not achieved for root port %04x:%02x:%02x.%01x\n",
> +			 root->domain, root->bus, root->dev, root->func);
> +		igt_pm_print_pci_card_runtime_status();
> +	}
> +
> +	igt_assert(result);
> +	igt_pm_restore_pci_card_runtime_pm();
> +}
> +
>  static void system_suspend_subtest(int state, int debug)
>  {
>  	disable_all_screens_and_wait(&ms_data);
> @@ -2065,6 +2090,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		igt_subtest("stay")
>  			stay_subtest();
>  

For each new added subtest add description before, like:

	igt_describe("Describe your subtest here");

Run you test with --describe option and see where you need to
add it (do this only to new subtests you are adding).

Regards,
Kamil

> +	igt_subtest("d3cold-basic")
> +		d3cold_basic_subtest();
> +
>  	/* Essential things */
>  	igt_subtest("drm-resources-equal")
>  		drm_resources_equal_subtest();
> -- 
> 2.26.2
> 
