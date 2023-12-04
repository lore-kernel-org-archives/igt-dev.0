Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D828C10E22D
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 05:25:54 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 4 Dec 2023 05:25:42 +0000
Message-ID: <CY5PR11MB6211BC465656FE46BB6C5C929586A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220421130704.934-1-mohammed.thasleem@intel.com>
 <20220421130704.934-2-mohammed.thasleem@intel.com>
In-Reply-To: <20220421130704.934-2-mohammed.thasleem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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



> -----Original Message-----
> From: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Sent: Thursday, April 21, 2022 6:37 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t,v5 1/1] tests/intel/xe_pm: Fix d3cold subtests
Please correct he subtest, it is about fixing d3 subtest
Thanks,
Anshuman.
>=20
> xe_pm d3 test requires to turn off all display in order to enter to d3 st=
ate
> therefore, adding the support to triggering "DRM_MODE_DPMS_OFF" in
> setup_d3() and "DRM_MODE_DPMS_ON" in cleanup_d3().
>=20
> v2: Use IGT_CRTC_ACTIVE for displays On/Off.
> v3: -Update commit message and helper names.
>     -Update display on and off helpers.
> v4: Remove redundant code. (Bhanu)
> v5: Move helper calls to test file.
> v6: -Update function name as dpms_on_off. (Anshuman)
>     -Update subject and commit message. (Kamil)
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/xe_pm.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> 9423984cc..42e00abb3 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -16,6 +16,7 @@
>=20
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
>=20
>  uint64_t orig_threshold;
>=20
> +static void dpms_on_off(device_t device, int mode) {
> +	int i;
> +
> +	for (i =3D 0; i < device.res->count_connectors; i++) {
> +		drmModeConnector *connector =3D
> drmModeGetConnectorCurrent(device.fd_xe,
> +					      device.res->connectors[i]);
> +
> +		if (!connector)
> +			continue;
> +
> +		if (connector->connection !=3D DRM_MODE_CONNECTED)
> +			continue;
> +
> +		kmstest_set_connector_dpms(device.fd_xe, connector,
> mode);
> +
> +		drmModeFreeConnector(connector);
> +	}
> +}
> +
>  /* runtime_usage is only available if kernel build
> CONFIG_PM_ADVANCED_DEBUG */  static bool
> runtime_usage_available(struct pci_device *pci)  { @@ -94,6 +116,9 @@
> static void vram_d3cold_threshold_restore(int sig)
>=20
>  static bool setup_d3(device_t device, enum igt_acpi_d_state state)  {
> +	if (device.res)
> +		dpms_on_off(device, DRM_MODE_DPMS_OFF);
> +
>  	switch (state) {
>  	case IGT_ACPI_D3Cold:
>  		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> @@ -110,6 +135,14 @@ static bool setup_d3(device_t device, enum
> igt_acpi_d_state state)
>  	return false;
>  }
>=20
> +static void cleanup_d3(device_t device) {
> +	if (device.res) {
> +		dpms_on_off(device, DRM_MODE_DPMS_ON);
> +		drmModeFreeResources(device.res);
> +	}
> +}
> +
>  static bool in_d3(device_t device, enum igt_acpi_d_state state)  {
>  	uint16_t val;
> @@ -476,6 +509,7 @@ igt_main
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name,
> &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>  		sysfs_fd =3D igt_sysfs_open(device.fd_xe);
> +		device.res =3D drmModeGetResources(device.fd_xe);
>  	}
>=20
>  	for (const struct s_state *s =3D s_states; s->name; s++) { @@ -510,6
> +544,7 @@ igt_main
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
>=20
>  		igt_subtest_f("%s-basic-exec", d->name) { @@ -525,6 +561,7
> @@ igt_main
>  			xe_for_each_hw_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 1,
>  					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>  		}
>=20
>  		igt_subtest_f("%s-multiple-execs", d->name) { @@ -532,6
> +569,7 @@ igt_main
>  			xe_for_each_hw_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32,
>  					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>  		}
>  	}
>=20
> --
> 2.25.1
