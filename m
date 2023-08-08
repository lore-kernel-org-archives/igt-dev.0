Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453A410E3B3
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 07:54:42 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Aug 2023 07:54:38 +0000
Message-ID: <CY5PR11MB6211B45B5DA412CE196D7C92950DA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230804103111.21214-1-riana.tauro@intel.com>
 <20230804103111.21214-2-riana.tauro@intel.com>
In-Reply-To: <20230804103111.21214-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/4] lib/igt_device: Add a function
 to get the pci slot name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, August 4, 2023 4:01 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: [PATCH i-g-t v2 1/4] lib/igt_device: Add a function to get the p=
ci slot
> name
>=20
> The existing d3cold_allowed get/set functions in igt_pm uses igt_device_c=
ard as
> a function argument. Xe tests cannot use this function as they use pci_de=
vice.
> To have a common library function for both i915 and xe, use a common
> parameter between both igt_device_card and pci_device ie.pci_slot_name.
>=20
> Add a helper function to get this pci slot name.
>=20
> v2: Add justification for change in commit message (Anshuman)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  lib/igt_device.c | 20 ++++++++++++++++++++  lib/igt_device.h |  1 +
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/lib/igt_device.c b/lib/igt_device.c index 49b771221..ffb3f56=
ce
> 100644
> --- a/lib/igt_device.c
> +++ b/lib/igt_device.c
> @@ -23,6 +23,7 @@
>   */
>  #include <sys/types.h>
>  #include <fcntl.h>
> +#include <limits.h>
>=20
>  #include <sys/stat.h>
>  #ifdef __linux__
> @@ -287,3 +288,22 @@ igt_device_get_pci_root_port(int fd)
>=20
>  	return prev;
>  }
> +
> +/**
> + * igt_device_get_pci_slot_name:
> + * @fd: the device.
> + * @pci_slot_name: pci slot name
> + *
> + * Looks up the graphics pci device using libpciaccess
> + * and gets the slot name
> + */
> +void igt_device_get_pci_slot_name(int fd, char *pci_slot_name) {
> +	struct pci_device *pci_dev;
> +
> +	pci_dev =3D __igt_device_get_pci_device(fd, 0);
> +	igt_require(pci_dev);
> +
> +	snprintf(pci_slot_name, NAME_MAX, "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
Missing the pci_slot_name NULL check here ?
With that,
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>=20
> }
> diff --git a/lib/igt_device.h b/lib/igt_device.h index 800a0fcc3..dad7bb0=
47
> 100644
> --- a/lib/igt_device.h
> +++ b/lib/igt_device.h
> @@ -36,4 +36,5 @@ struct pci_device *igt_device_get_pci_device(int fd);
> struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id=
);  struct
> pci_device *igt_device_get_pci_root_port(int fd);
>=20
> +void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>  #endif /* __IGT_DEVICE_H__ */
> --
> 2.40.0
