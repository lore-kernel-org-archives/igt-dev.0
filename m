Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12AD6E048
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2020 16:27:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h4so133385wmb.4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2020 09:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200526122417.779145-1-arkadiusz.hiler@intel.com>
 <20200526122417.779145-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20200526122417.779145-3-arkadiusz.hiler@intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Tue, 26 May 2020 09:26:57 -0700
Message-ID: <CAKi4VAJR1JvX8JM0dgZ+8NK6LMFg4WYBxm0C0bQeRc0jUvj3qQ@mail.gmail.com>
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
Cc: igt-dev@lists.freedesktop.org, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 26, 2020 at 5:25 AM Arkadiusz Hiler
<arkadiusz.hiler@intel.com> wrote:
>
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
> index be854b01..4daabbd9 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -164,6 +164,7 @@ struct igt_device {
>         /* For pci subsystem */
>         char *vendor;
>         char *device;
> +       char *pci_slot_name;
>
>         struct igt_list_head link;
>  };
> @@ -337,7 +338,21 @@ static void get_attrs(struct udev_device *dev, struct igt_device *idev)
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
> +       const char *pci_slot_name = get_prop(dev, "PCI_SLOT_NAME");
> +
> +       if (!pci_slot_name || (strlen(pci_slot_name) != PCI_SLOT_NAME_SIZE))
> +               return;
> +       dev->pci_slot_name = strdup(pci_slot_name);
> +}
> +
> +/*
> + * Gets PCI_ID property, splits to xxxx:yyyy and stores
>   * xxxx to dev->vendor and yyyy to dev->device for
>   * faster access.
>   */
> @@ -410,6 +425,45 @@ static struct igt_device *igt_device_find(const char *subsystem,
>         return NULL;
>  }
>
> +static void
> +__copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
> +{
> +       if (dev->subsystem != NULL)
> +               strncpy(card->subsystem, dev->subsystem,
> +                       sizeof(card->subsystem) - 1);
> +
> +       if (dev->drm_card != NULL)
> +               strncpy(card->card, dev->drm_card, sizeof(card->card) - 1);
> +
> +       if (dev->drm_render != NULL)
> +               strncpy(card->render, dev->drm_render,
> +                       sizeof(card->render) - 1);
> +
> +       if (dev->pci_slot_name != NULL)
> +               strncpy(card->pci_slot_name, dev->pci_slot_name,
> +                       PCI_SLOT_NAME_SIZE + 1);
> +}
> +
> +/*
> + * Iterate over all igt_devices array and find first discrete card.
> + * card->pci_slot_name will be updated only if a discrete card is present.
> + */
> +void igt_device_find_first_discrete_card(struct igt_device_card *card)
> +{
> +       struct igt_device *dev;
> +
> +       igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +
> +               if (!is_pci_subsystem(dev))
> +                       continue;
> +
> +               if ((strncmp(dev->pci_slot_name, INTEGRATED_GPU_PCI_ID, PCI_SLOT_NAME_SIZE)) != 0) {
> +                       __copy_dev_to_card(dev, card);

why do we need to make it prefer discrete? rather than "use the first
one if no one was specified"?

Lucas De Marchi

> +                       break;
> +               }
> +       }
> +}
> +
>  static struct igt_device *igt_device_from_syspath(const char *syspath)
>  {
>         struct igt_device *dev;
> @@ -445,6 +499,7 @@ static void update_or_add_parent(struct udev_device *dev,
>                 parent_idev = igt_device_new_from_udev(parent_dev);
>                 if (is_pci_subsystem(parent_idev)) {
>                         set_vendor_device(parent_idev);
> +                       set_pci_slot_name(parent_idev);
>                 }
>                 igt_list_add_tail(&parent_idev->link, &igt_devs.all);
>         }
> @@ -573,10 +628,21 @@ static void igt_device_free(struct igt_device *dev)
>         free(dev->drm_render);
>         free(dev->vendor);
>         free(dev->device);
> +       free(dev->pci_slot_name);
>         g_hash_table_destroy(dev->attrs_ht);
>         g_hash_table_destroy(dev->props_ht);
>  }
>
> +void igt_devices_free(void)
> +{
> +       struct igt_device *dev, *tmp;
> +
> +       igt_list_for_each_entry_safe(dev, tmp, &igt_devs.all, link) {
> +               igt_device_free(dev);
> +               free(dev);
> +       }
> +}
> +
>  /**
>   * igt_devices_scan
>   * @force: enforce scanning devices
> @@ -1196,17 +1262,7 @@ bool igt_device_card_match(const char *filter, struct igt_device_card *card)
>         /* We take first one if more than one card matches filter */
>         dev = igt_list_first_entry(&igt_devs.filtered, dev, link);
>
> -       if (dev->subsystem != NULL)
> -               strncpy(card->subsystem, dev->subsystem,
> -                            sizeof(card->subsystem) - 1);
> -
> -       if (dev->drm_card != NULL)
> -               strncpy(card->card, dev->drm_card,
> -                            sizeof(card->card) - 1);
> -
> -       if (dev->drm_render != NULL)
> -               strncpy(card->render, dev->drm_render,
> -                            sizeof(card->render) - 1);
> +       __copy_dev_to_card(dev, card);
>
>         return true;
>  }
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index ad632145..16d75320 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -39,10 +39,13 @@ enum igt_devices_print_type {
>         IGT_PRINT_DETAIL,
>  };
>
> +#define INTEGRATED_GPU_PCI_ID "0000:00:02.0"
> +#define PCI_SLOT_NAME_SIZE 12
>  struct igt_device_card {
>         char subsystem[NAME_MAX];
>         char card[NAME_MAX];
>         char render[NAME_MAX];
> +       char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>  };
>
>  void igt_devices_scan(bool force);
> @@ -51,6 +54,8 @@ void igt_devices_print(enum igt_devices_print_type printtype);
>  void igt_devices_print_vendors(void);
>  void igt_device_print_filter_types(void);
>
> +void igt_devices_free(void);
> +
>  /*
>   * Handle device filter collection array.
>   * IGT can store/retrieve filters passed by user using '--device' args.
> @@ -63,7 +68,7 @@ const char *igt_device_filter_get(int num);
>
>  /* Use filter to match the device and fill card structure */
>  bool igt_device_card_match(const char *filter, struct igt_device_card *card);
> -
> +void igt_device_find_first_discrete_card(struct igt_device_card *card);
>  int igt_open_card(struct igt_device_card *card);
>  int igt_open_render(struct igt_device_card *card);
>
> --
> 2.25.4
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev



-- 
Lucas De Marchi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
