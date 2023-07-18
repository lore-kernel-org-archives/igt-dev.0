Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CAF10E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 19:04:21 +0000 (UTC)
Date: Tue, 18 Jul 2023 15:04:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZLbiLR2cdjclMvpW@intel.com>
References: <20230718110852.2965553-1-anshuman.gupta@intel.com>
 <20230718110852.2965553-3-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230718110852.2965553-3-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/3] tests/xe_pm : Add support to
 disable all crtc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 04:38:51PM +0530, Anshuman Gupta wrote:
> xe_pm d3 test requires to turn off all crtc in order to enter
> to d3 state therefore, adding the support to triggering
> "DPMS OFF" in setup_d3() and "DPMS ON" in cleanup_d3().
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/xe/xe_pm.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 23b8246ed..11a4c3705 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -18,6 +18,7 @@
>  
>  #include "igt.h"
>  #include "lib/igt_device.h"
> +#include "lib/igt_kms.h"
>  #include "lib/igt_pm.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> @@ -78,6 +79,8 @@ static void set_d3cold_allowed(struct pci_device *pci,
>  
>  static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>  {
> +	igt_dpms_turn_off_display(device.fd_xe);
> +
>  	switch (state) {
>  	case IGT_ACPI_D3Cold:
>  		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> @@ -94,6 +97,11 @@ static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>  	return false;
>  }
>  
> +static void cleanup_d3(device_t device)
> +{
> +	igt_dpms_turn_on_display(device.fd_xe);
> +}
> +
>  static bool in_d3(device_t device, enum igt_acpi_d_state state)
>  {
>  	uint16_t val;
> @@ -412,6 +420,7 @@ igt_main
>  				xe_for_each_hw_engine(device.fd_xe, hwe)
>  					test_exec(device, hwe, 1, 2, s->state,
>  						  NO_RPM);
> +				cleanup_d3(device);
>  			}
>  		}
>  	}
> @@ -420,6 +429,7 @@ igt_main
>  		igt_subtest_f("%s-basic", d->name) {
>  			igt_assert(setup_d3(device, d->state));
>  			igt_assert(in_d3(device, d->state));
> +			cleanup_d3(device);
>  		}
>  
>  		igt_subtest_f("%s-basic-exec", d->name) {
> @@ -427,6 +437,7 @@ igt_main
>  			xe_for_each_hw_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 1,
>  					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", d->name) {
> @@ -434,6 +445,7 @@ igt_main
>  			xe_for_each_hw_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32,
>  					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>  		}
>  	}
>  
> -- 
> 2.25.1
> 
