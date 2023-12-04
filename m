Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508A410E2B6
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 09:32:54 +0000 (UTC)
Date: Mon, 4 Dec 2023 10:32:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231204093238.xl776blxtttdovnr@kamilkon-desk.igk.intel.com>
References: <20231201192134.40927-1-mohammed.thasleem@intel.com>
 <20231201192134.40927-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201192134.40927-2-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v5 1/1] tests/intel/xe_pm: Fix d3cold subtests
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

Hi Mohammed,
On 2023-12-02 at 00:51:34 +0530, Mohammed Thasleem wrote:
> From: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> xe_pm d3 test requires to turn off all display in order to
> enter to d3 state therefore, adding the support to triggering
> "DRM_MODE_DPMS_OFF" in setup_d3() and "DRM_MODE_DPMS_ON" in
> cleanup_d3().
> 
> tests/intel/xe_pm: Add helper to turn on and off the displays
> 
> v2: Use IGT_CRTC_ACTIVE for displays On/Off.
> v3: -Update commit message and helper names.
>     -Update display on and off helpers.
> v4: Remove redundant code. (Bhanu)
> v5: Move helper calls to test file.
> v6: -Update function name as dpms_on_off. (Anshuman)
>     -Update subject and commit message. (Kamil)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/xe_pm.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 9423984cc..42e00abb3 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -16,6 +16,7 @@
>  
>  #include "igt.h"
>  #include "lib/igt_device.h"
> +#include "lib/igt_kms.h"
>  #include "lib/igt_pm.h"
>  #include "lib/igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
> @@ -36,10 +37,31 @@ typedef struct {
>  	struct pci_device *pci_xe;
>  	struct pci_device *pci_root;
>  	char pci_slot_name[NAME_MAX];
> +	drmModeResPtr res;
>  } device_t;
>  
>  uint64_t orig_threshold;
>  
> +static void dpms_on_off(device_t device, int mode)
> +{
> +	int i;
> +
> +	for (i = 0; i < device.res->count_connectors; i++) {
> +		drmModeConnector *connector = drmModeGetConnectorCurrent(device.fd_xe,
> +					      device.res->connectors[i]);
> +
> +		if (!connector)
> +			continue;
> +
> +		if (connector->connection != DRM_MODE_CONNECTED)
> +			continue;

This will skip free below, imho revert this condition into:

		if (connector->connection == DRM_MODE_CONNECTED)
    		kmstest_set_connector_dpms(device.fd_xe, connector, mode);

so that below free(connector) will be called.

Regards,
Kamil

> +
> +		kmstest_set_connector_dpms(device.fd_xe, connector, mode);
> +
> +		drmModeFreeConnector(connector);
> +	}
> +}
> +
>  /* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
>  static bool runtime_usage_available(struct pci_device *pci)
>  {
> @@ -94,6 +116,9 @@ static void vram_d3cold_threshold_restore(int sig)
>  
>  static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>  {
> +	if (device.res)
> +		dpms_on_off(device, DRM_MODE_DPMS_OFF);
> +
>  	switch (state) {
>  	case IGT_ACPI_D3Cold:
>  		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> @@ -110,6 +135,14 @@ static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>  	return false;
>  }
>  
> +static void cleanup_d3(device_t device)
> +{
> +	if (device.res) {
> +		dpms_on_off(device, DRM_MODE_DPMS_ON);
> +		drmModeFreeResources(device.res);
> +	}
> +}
> +
>  static bool in_d3(device_t device, enum igt_acpi_d_state state)
>  {
>  	uint16_t val;
> @@ -476,6 +509,7 @@ igt_main
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>  		sysfs_fd = igt_sysfs_open(device.fd_xe);
> +		device.res = drmModeGetResources(device.fd_xe);
>  	}
>  
>  	for (const struct s_state *s = s_states; s->name; s++) {
> @@ -510,6 +544,7 @@ igt_main
>  				xe_for_each_hw_engine(device.fd_xe, hwe)
>  					test_exec(device, hwe, 1, 2, s->state,
>  						  NO_RPM);
> +				cleanup_d3(device);
>  			}
>  		}
>  	}
> @@ -518,6 +553,7 @@ igt_main
>  		igt_subtest_f("%s-basic", d->name) {
>  			igt_assert(setup_d3(device, d->state));
>  			igt_assert(in_d3(device, d->state));
> +			cleanup_d3(device);
>  		}
>  
>  		igt_subtest_f("%s-basic-exec", d->name) {
> @@ -525,6 +561,7 @@ igt_main
>  			xe_for_each_hw_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 1,
>  					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", d->name) {
> @@ -532,6 +569,7 @@ igt_main
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
