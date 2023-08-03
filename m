Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618F10E59B
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 06:44:22 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 3 Aug 2023 06:44:19 +0000
Message-ID: <CY5PR11MB62114B1DA867D262FEBDABAA9508A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230803050609.2835714-1-riana.tauro@intel.com>
 <20230803050609.2835714-2-riana.tauro@intel.com>
In-Reply-To: <20230803050609.2835714-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_device: Add a function to
 get the pci slot name
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
> Sent: Thursday, August 3, 2023 10:36 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: [PATCH i-g-t 1/4] lib/igt_device: Add a function to get the pci =
slot
> name
>=20
> Add a function that gets the pci slot name of the pci device
What is the justification of doing that, please add that in to commit-log.
Thanks,
Anshuman Gupta.
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
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev-
> >func); }
> diff --git a/lib/igt_device.h b/lib/igt_device.h index 800a0fcc3..dad7bb0=
47
> 100644
> --- a/lib/igt_device.h
> +++ b/lib/igt_device.h
> @@ -36,4 +36,5 @@ struct pci_device *igt_device_get_pci_device(int fd);
> struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id=
);
> struct pci_device *igt_device_get_pci_root_port(int fd);
>=20
> +void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
>  #endif /* __IGT_DEVICE_H__ */
> --
> 2.40.0
