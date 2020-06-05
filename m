Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998CD6E849
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2020 12:11:31 +0000 (UTC)
Date: Fri, 5 Jun 2020 15:11:28 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200605121128.GB9497@platvala-desk.ger.corp.intel.com>
References: <20200602111330.910039-1-arkadiusz.hiler@intel.com>
 <20200602111330.910039-3-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602111330.910039-3-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/igt_device_scan: Add extra
 helpers for intel_gpu_top
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 02:13:29PM +0300, Arkadiusz Hiler wrote:
> From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> 
> Will be used in the next patch.
> 
> 1. set_pci_slot_name(): stores PCI_SLOT_NAME from prop to device
> 2. igt_device_find_first_discrete_card(): try to find first discrete GPU
> 3. igt_devices_free(): Free device buffers created during scan
> 
> Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  lib/igt_device_scan.c | 80 ++++++++++++++++++++++++++++++++++++-------
>  lib/igt_device_scan.h |  7 +++-
>  2 files changed, 74 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index d4c5cfdf..12fbd241 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -165,6 +165,7 @@ struct igt_device {
>  	/* For pci subsystem */
>  	char *vendor;
>  	char *device;
> +	char *pci_slot_name;
>  
>  	struct igt_list_head link;
>  };
> @@ -338,7 +339,21 @@ static void get_attrs(struct udev_device *dev, struct igt_device *idev)
>  #define is_drm_subsystem(dev)  (strequal(get_prop_subsystem(dev), "drm"))
>  #define is_pci_subsystem(dev)  (strequal(get_prop_subsystem(dev), "pci"))
>  
> -/* Gets PCI_ID property, splits to xxxx:yyyy and stores
> +/*
> + * Get PCI_SLOT_NAME property, it should be in format of
> + * xxxx:yy:zz.z
> + */
> +static void set_pci_slot_name(struct igt_device *dev)
> +{
> +	const char *pci_slot_name = get_prop(dev, "PCI_SLOT_NAME");
> +
> +	if (!pci_slot_name || (strlen(pci_slot_name) != PCI_SLOT_NAME_SIZE))
> +		return;
> +	dev->pci_slot_name = strdup(pci_slot_name);
> +}
> +
> +/*
> + * Gets PCI_ID property, splits to xxxx:yyyy and stores
>   * xxxx to dev->vendor and yyyy to dev->device for
>   * faster access.
>   */
> @@ -411,6 +426,45 @@ static struct igt_device *igt_device_find(const char *subsystem,
>  	return NULL;
>  }
>  
> +static void
> +__copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
> +{
> +	if (dev->subsystem != NULL)
> +		strncpy(card->subsystem, dev->subsystem,
> +			sizeof(card->subsystem) - 1);
> +
> +	if (dev->drm_card != NULL)
> +		strncpy(card->card, dev->drm_card, sizeof(card->card) - 1);
> +
> +	if (dev->drm_render != NULL)
> +		strncpy(card->render, dev->drm_render,
> +			sizeof(card->render) - 1);
> +
> +	if (dev->pci_slot_name != NULL)
> +		strncpy(card->pci_slot_name, dev->pci_slot_name,
> +			PCI_SLOT_NAME_SIZE + 1);
> +}
> +
> +/*
> + * Iterate over all igt_devices array and find first discrete card.
> + * card->pci_slot_name will be updated only if a discrete card is present.
> + */
> +void igt_device_find_first_discrete_card(struct igt_device_card *card)
> +{
> +	struct igt_device *dev;
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +
> +		if (!is_pci_subsystem(dev))
> +			continue;
> +
> +		if ((strncmp(dev->pci_slot_name, INTEGRATED_GPU_PCI_ID, PCI_SLOT_NAME_SIZE)) != 0) {
> +			__copy_dev_to_card(dev, card);
> +			break;
> +		}
> +	}
> +}

Having read the intel_gpu_top patch already, I know this function is
so it can prefer discrete over integrated i915 device if one exists
but this is more global code. Having intel or i915 somewhere in the
name of this function and the pci id macro would make it more clear
what is assumed and where the assumption holds.

Otherwise LGTM, so with that
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
