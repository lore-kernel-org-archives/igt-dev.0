Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CC010E959
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 10:16:06 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v8] tests/intel/xe_pm: Fix d3 subtest
Date: Thu, 14 Dec 2023 10:16:00 +0000
Message-ID: <CY5PR11MB6211B9AA43983074148BE0E7958CA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220421130704.934-2-mohammed.thasleem@intel.com>
 <20231211084918.45829-1-mohammed.thasleem@intel.com>
In-Reply-To: <20231211084918.45829-1-mohammed.thasleem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> Sent: Monday, December 11, 2023 2:19 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t v8] tests/intel/xe_pm: Fix d3 subtest
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
> v7: -Update subjact. (Anshuman)
>     -Move device.res to dpms_on_off(). (Bhanu)
>     -Free device.res in igt_fixture. (Bhanu)
>     -Call kmstest_set_connector_dpms if DRM_MODE_CONNECTED is found.
> (Kamil)
> v8: Update if condition to fix dereferencing of NULL pointer. (Bhanu)
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Acked-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/xe_pm.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> c899bd67a..3d6acfbab 100644
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
> @@ -36,10 +37,32 @@ typedef struct {
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
> +	if (!device.res)
> +		return;
> +
> +	for (i =3D 0; i < device.res->count_connectors; i++) {
> +		drmModeConnector *connector =3D
> drmModeGetConnectorCurrent(device.fd_xe,
> +					      device.res->connectors[i]);
> +
> +		if (!connector)
> +			continue;
> +
> +		if (connector->connection =3D=3D DRM_MODE_CONNECTED)
> +			kmstest_set_connector_dpms(device.fd_xe, connector,
> mode);
> +
> +		drmModeFreeConnector(connector);
> +	}
> +}
> +
>  /* runtime_usage is only available if kernel build
> CONFIG_PM_ADVANCED_DEBUG */  static bool runtime_usage_available(struct
> pci_device *pci)  { @@ -94,6 +117,8 @@ static void
> vram_d3cold_threshold_restore(int sig)
>=20
>  static bool setup_d3(device_t device, enum igt_acpi_d_state state)  {
> +	dpms_on_off(device, DRM_MODE_DPMS_OFF);
> +
>  	switch (state) {
>  	case IGT_ACPI_D3Cold:
>  		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
> @@ -110,6 +135,11 @@ static bool setup_d3(device_t device, enum
> igt_acpi_d_state state)
>  	return false;
>  }
>=20
> +static void cleanup_d3(device_t device) {
> +	dpms_on_off(device, DRM_MODE_DPMS_ON); }
> +
>  static bool in_d3(device_t device, enum igt_acpi_d_state state)  {
>  	uint16_t val;
> @@ -477,6 +507,7 @@ igt_main
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name,
> &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>  		sysfs_fd =3D igt_sysfs_open(device.fd_xe);
> +		device.res =3D drmModeGetResources(device.fd_xe);
>  	}
>=20
>  	for (const struct s_state *s =3D s_states; s->name; s++) { @@ -511,6 +5=
42,7
> @@ igt_main
>  				xe_for_each_engine(device.fd_xe, hwe)
>  					test_exec(device, hwe, 1, 2, s->state,
>  						  NO_RPM);
> +				cleanup_d3(device);
>  			}
>  		}
>  	}
> @@ -519,6 +551,7 @@ igt_main
>  		igt_subtest_f("%s-basic", d->name) {
>  			igt_assert(setup_d3(device, d->state));
>  			igt_assert(in_d3(device, d->state));
> +			cleanup_d3(device);
>  		}
>=20
>  		igt_subtest_f("%s-basic-exec", d->name) { @@ -526,6 +559,7
> @@ igt_main
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 1,
>  					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>  		}
>=20
>  		igt_subtest_f("%s-multiple-execs", d->name) { @@ -533,6
> +567,7 @@ igt_main
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 16, 32,
>  					  NO_SUSPEND, d->state);
> +			cleanup_d3(device);
>  		}
>  	}
>=20
> @@ -547,6 +582,7 @@ igt_main
>  		close(sysfs_fd);
>  		igt_pm_set_d3cold_allowed(device.pci_slot_name,
> d3cold_allowed);
>  		igt_restore_runtime_pm();
> +		drmModeFreeResources(device.res);
>  		drm_close_driver(device.fd_xe);
>  	}
>  }
> --
> 2.25.1
