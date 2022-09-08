Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9B110E502
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 15:09:13 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 8 Sep 2022 15:09:05 +0000
Message-ID: <CY5PR11MB6211553D4B4BD71BF84D967C95409@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220908144609.2878575-1-riana.tauro@intel.com>
 <20220908144609.2878575-2-riana.tauro@intel.com>
In-Reply-To: <20220908144609.2878575-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_pm : Add pm functions for
 d3cold_allowed
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
> Sent: Thursday, September 8, 2022 8:16 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH i-g-t 1/2] lib/igt_pm : Add pm functions for d3cold_allow=
ed
>=20
> Add functions to set/get d3cold_allowed attribute of the pci_device
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  lib/igt_pm.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |  4 ++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 99251b40..ce34a0a4 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1122,6 +1122,52 @@ void igt_pm_setup_pci_card_runtime_pm(struct
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
..d9db8100
> 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -24,6 +24,8 @@
>  #ifndef IGT_PM_H
>  #define IGT_PM_H
>=20
> +#include "igt_device_scan.h"
Please include this from c file, where it is needed.
Thanks,
Anshuman.
> +
>  void igt_pm_enable_audio_runtime_pm(void);
>  void igt_pm_enable_sata_link_power_management(void);
>  void igt_pm_restore_sata_link_power_management(void);
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
