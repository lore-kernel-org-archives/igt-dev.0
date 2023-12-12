Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26D110E5FD
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 12:24:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-548ce39b101so7932750a12.2
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 04:24:22 -0800 (PST)
Message-ID: <786fc325-9e26-4c6e-b6db-744076686760@gmail.com>
Date: Tue, 12 Dec 2023 14:24:13 +0200
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v8] tests/intel/xe_pm: Fix d3 subtest
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220421130704.934-2-mohammed.thasleem@intel.com>
 <20231211084918.45829-1-mohammed.thasleem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231211084918.45829-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mohammed,

On 11.12.2023 10.49, Mohammed Thasleem wrote:
> xe_pm d3 test requires to turn off all display in order to
> enter to d3 state therefore, adding the support to triggering
> "DRM_MODE_DPMS_OFF" in setup_d3() and "DRM_MODE_DPMS_ON" in
> cleanup_d3().
> 
> v2: Use IGT_CRTC_ACTIVE for displays On/Off.
> v3: -Update commit message and helper names.
>      -Update display on and off helpers.
> v4: Remove redundant code. (Bhanu)
> v5: Move helper calls to test file.
> v6: -Update function name as dpms_on_off. (Anshuman)
>      -Update subject and commit message. (Kamil)
> v7: -Update subjact. (Anshuman)
>      -Move device.res to dpms_on_off(). (Bhanu)
>      -Free device.res in igt_fixture. (Bhanu)
>      -Call kmstest_set_connector_dpms if DRM_MODE_CONNECTED is found. (Kamil)
> v8: Update if condition to fix dereferencing of NULL pointer. (Bhanu)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/xe_pm.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c899bd67a..3d6acfbab 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -16,6 +16,7 @@
>   
>   #include "igt.h"
>   #include "lib/igt_device.h"
> +#include "lib/igt_kms.h"

Is this include needed?

>   #include "lib/igt_pm.h"
>   #include "lib/igt_sysfs.h"
>   #include "lib/igt_syncobj.h"
> @@ -36,10 +37,32 @@ typedef struct {
>   	struct pci_device *pci_xe;
>   	struct pci_device *pci_root;
>   	char pci_slot_name[NAME_MAX];
> +	drmModeResPtr res;
>   } device_t;
>   
>   uint64_t orig_threshold;
>   
> +static void dpms_on_off(device_t device, int mode)
> +{
> +	int i;
> +
> +	if (!device.res)
> +		return;

When commit message said these dpms setting are required for the test, 
should this device.res be decorated here with igt_require() instead of 
checking against null?

> +
> +	for (i = 0; i < device.res->count_connectors; i++) {
> +		drmModeConnector *connector = drmModeGetConnectorCurrent(device.fd_xe,
> +					      device.res->connectors[i]);
                                               ^ indentation

Other than these couple of minor comments, things look ok to me.

/Juha-Pekka
> +
> +		if (!connector)
> +			continue;
> +
> +		if (connector->connection == DRM_MODE_CONNECTED)
> +			kmstest_set_connector_dpms(device.fd_xe, connector, mode);
> +
> +		drmModeFreeConnector(connector);
> +	}
> +}
> +
>   /* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
>   static bool runtime_usage_available(struct pci_device *pci)
>   {
> @@ -94,6 +117,8 @@ static void vram_d3cold_threshold_restore(int sig)
>   
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
> +	dpms_on_off(device, DRM_MODE_DPMS_OFF);
> +
>   	switch (state) {
>   	case IGT_ACPI_D3Cold:
>   		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> @@ -110,6 +135,11 @@ static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   	return false;
>   }
>   
> +static void cleanup_d3(device_t device)
> +{
> +	dpms_on_off(device, DRM_MODE_DPMS_ON);
> +}
> +
>   static bool in_d3(device_t device, enum igt_acpi_d_state state)
>   {
>   	uint16_t val;
> @@ -477,6 +507,7 @@ igt_main
>   		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>   		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>   		sysfs_fd = igt_sysfs_open(device.fd_xe);
> +		device.res = drmModeGetResources(device.fd_xe);
>   	}
>   
>   	for (const struct s_state *s = s_states; s->name; s++) {
> @@ -511,6 +542,7 @@ igt_main
>   				xe_for_each_engine(device.fd_xe, hwe)
>   					test_exec(device, hwe, 1, 2, s->state,
>   						  NO_RPM);
> +				cleanup_d3(device);
>   			}
>   		}
>   	}
> @@ -519,6 +551,7 @@ igt_main
>   		igt_subtest_f("%s-basic", d->name) {
>   			igt_assert(setup_d3(device, d->state));
>   			igt_assert(in_d3(device, d->state));
> +			cleanup_d3(device);
>   		}
>   
>   		igt_subtest_f("%s-basic-exec", d->name) {
> @@ -526,6 +559,7 @@ igt_main
>   			xe_for_each_engine(device.fd_xe, hwe)
>   				test_exec(device, hwe, 1, 1,
>   					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>   		}
>   
>   		igt_subtest_f("%s-multiple-execs", d->name) {
> @@ -533,6 +567,7 @@ igt_main
>   			xe_for_each_engine(device.fd_xe, hwe)
>   				test_exec(device, hwe, 16, 32,
>   					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>   		}
>   	}
>   
> @@ -547,6 +582,7 @@ igt_main
>   		close(sysfs_fd);
>   		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
>   		igt_restore_runtime_pm();
> +		drmModeFreeResources(device.res);
>   		drm_close_driver(device.fd_xe);
>   	}
>   }
