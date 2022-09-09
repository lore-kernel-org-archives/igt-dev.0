Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6FA10EC2C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 07:36:37 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 9 Sep 2022 07:36:07 +0000
Message-ID: <CY5PR11MB6211E87A29A1F08B9ED0D6CE95439@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220909072744.2919983-1-riana.tauro@intel.com>
 <20220909072744.2919983-2-riana.tauro@intel.com>
In-Reply-To: <20220909072744.2919983-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_pm : Add pm functions
 for d3cold_allowed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, September 9, 2022 12:58 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH i-g-t v2 1/2] lib/igt_pm : Add pm functions for d3cold_al=
lowed
>=20
> Add functions to set/get d3cold_allowed attribute of the pci_device
>=20
> v2 :  Add forward declaration in header (Anshuman)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  lib/igt_pm.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |  4 ++++
>  2 files changed, 51 insertions(+)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 99251b40..edebfdec 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -38,6 +38,7 @@
>  #include <dirent.h>
>=20
>  #include "drmtest.h"
> +#include "igt_device_scan.h"
>  #include "igt_kms.h"
>  #include "igt_pm.h"
>  #include "igt_aux.h"
> @@ -1122,6 +1123,52 @@ void igt_pm_setup_pci_card_runtime_pm(struct
> pci_device *pci_dev)
>  	igt_pm_setup_pci_card_power_attrs(pci_dev, true, 0);  }
>=20
> +/**
> + * igt_pm_get_d3cold_allowed:
> + * @igt_device_card: device card
> + * @val: value to be read into
> + *
> + * Reads the value of d3cold_allowed attribute
> + * of the pci device
> + */
> +void igt_pm_get_d3cold_allowed(struct igt_device_card *card, char *val)
> +{
> +	char name[PATH_MAX];
> +	int fd;
> +
> +	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%s",
> +		 card->pci_slot_name);
> +
> +	fd =3D open(name, O_RDONLY);
> +	igt_assert_f(fd >=3D 0, "Can't open %s\n", name);
> +
> +	igt_sysfs_read(fd, "d3cold_allowed", val, sizeof(val));
> +
> +	close(fd);
> +}
> +
> +/**
> + * igt_pm_get_d3cold_allowed:
> + * @igt_device_card: device card
> + * @val: value to be written
> + *
> + * writes the value to d3cold_allowed attribute of pci device  */ void
> +igt_pm_set_d3cold_allowed(struct igt_device_card *card, const char
> +*val) {
> +	char name[PATH_MAX];
> +	int fd;
> +
> +	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%s",
> +		 card->pci_slot_name);
> +
> +	fd =3D open(name, O_RDONLY);
> +	igt_assert_f(fd >=3D 0, "Can't open %s\n", name);
> +
> +	igt_sysfs_write(fd, "d3cold_allowed", val, sizeof(val));
> +	close(fd);
> +}
> +
>  static void
>  igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, =
char
> *val, int len)  { diff --git a/lib/igt_pm.h b/lib/igt_pm.h index cbbde12b=
..52c03cc5
> 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -63,6 +63,8 @@ struct	igt_pm_pci_dev_pwrattr {
>  	char autosuspend_delay[64];
>  };
>=20
> +struct igt_device_card;
> +
>  bool igt_setup_runtime_pm(int device);
>  void igt_disable_runtime_pm(void);
>  void igt_restore_runtime_pm(void);
> @@ -76,6 +78,8 @@ enum igt_acpi_d_state
>  igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);  void
> igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
>  				       struct pci_device *i915);
> +void igt_pm_get_d3cold_allowed(struct igt_device_card *card, char
> +*val); void igt_pm_set_d3cold_allowed(struct igt_device_card *card,
> +const char *val);
>  void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);  void
> igt_pm_restore_pci_card_runtime_pm(void);
>  void igt_pm_print_pci_card_runtime_status(void);
> --
> 2.25.1
