Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105A2C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 19:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC47D10EA4D;
	Thu,  3 Apr 2025 19:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/WLZPY0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6223C10EA43
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 19:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743706955; x=1775242955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=46ZHYMbR9uOuD9azw2VAcL2ghJBpeJLm3ofI36e4cCo=;
 b=b/WLZPY0qrstMJ8gyqifPmO2jFwA5062KY5EFBhMu+Yj6AGBgw47+sDA
 UNdRuUoY/wJzsF3uVoZ+9WRmPXf49glcNaGfO2p+Q0+k6qYMX4dsfAr/U
 EW8xowu6v9/8DEyQtu/SSgYpbvrvV3Px1jlrExzVshxMp6SMeXeDoqDY6
 8bzQwyAgZ83wEl3A3St/zWvUEjy4elpRIER1CicbsOL2F294kAlSx7AqY
 6OM0cfTHV5OYNb0A2N+pF+bSoF/alk253eiPMGdbpainpPHWFi9fdhYeh
 bYU3pLtncEro47yi1Sp3PNDnWvjonov0V8o6+eNivRgC3TBymeiaBzXSP A==;
X-CSE-ConnectionGUID: 4eEQ3GITTN2wDv84Onu1PA==
X-CSE-MsgGUID: eUOJbURTQAyw1yuiGu3wOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="47851249"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="47851249"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 12:02:32 -0700
X-CSE-ConnectionGUID: HwUx8OX2S6uuGcpIWt48kg==
X-CSE-MsgGUID: mbz3Ig04Soi8CQub/awqbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127087089"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 12:02:30 -0700
Date: Thu, 3 Apr 2025 21:02:27 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jonathan.ming.jun.lui@intel.com
Subject: Re: [PATCH <i-g-t> v5 1/4] lib/igt_device_scan: Enable finding all
 IGT devices for a specific driver
Message-ID: <20250403190227.ybv7ytaa43n2nkvm@zkempczy-mobl2>
References: <20250325191230.1822979-1-soham.purkait@intel.com>
 <20250325191230.1822979-2-soham.purkait@intel.com>
 <20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2>
 <4292a1fd-d045-4a88-9978-047ef3d05aec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4292a1fd-d045-4a88-9978-047ef3d05aec@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, Apr 01, 2025 at 07:01:34PM +0530, Purkait, Soham wrote:
>    Hi Zbigniew,
> 
>    On 28-03-2025 13:36, Zbigniew Kempczyński wrote:
> 
>  On Wed, Mar 26, 2025 at 12:42:27AM +0530, Soham Purkait wrote:
> 
>  Add filter functions to find all the
>  available GPUs or few among them
>  by driver name and card type or card number.
>  Add driver field to igt_device_card structure
>  for storing driver names.
> 
>  v2 : fix for refactoring GPUTOP into a
>       vendor-agnostic tool (Lucas)
> 
>  v3 : Separate commit for lib (Kamil)
> 
>  v4 : Refactor to use composition strategy
>       for driver and device type filtering
>       Refactor code to improve memory
>       allocation and error handling (Lucas)
> 
>  v5 : Rename function name as per convention.
>       Use "dev_type" enum for card_type. (Krzysztof)
>       Add new filter to return collection
>       of matching devices.               (Zbigniew)
> 
>  Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>  ---
>   lib/igt_device_scan.c | 177 ++++++++++++++++++++++++++++++++++++++++--
>   lib/igt_device_scan.h |  12 +++
>   2 files changed, 183 insertions(+), 6 deletions(-)
> 
>  diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>  index 711bedc5c..452da2ee4 100644
>  --- a/lib/igt_device_scan.c
>  +++ b/lib/igt_device_scan.c
>  @@ -198,12 +198,6 @@
>   #define DBG(...) {}
>   #endif
>  
>  -enum dev_type {
>  -       DEVTYPE_ALL,
>  -       DEVTYPE_INTEGRATED,
>  -       DEVTYPE_DISCRETE,
>  -};
>  -
> 
>  I think you don't need to extern this dev_type.

Excuse me, I'm not able to properly read your answers. May I ask for use
email client which allows to reply in emails prepending with > ?

--
Zbigniew

> 
>    As the function (igt_device_find_all_intel_card_by_driver_name) need to
>    call with the device type as argument from gputop.c so it has been made
>    extern to access enum dev_type from outside.
> 
> 
> 
>   #define STR_INTEGRATED "integrated"
>   #define STR_DISCRETE "discrete"
>  
>  @@ -774,6 +768,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
>                  safe_strncpy(card->render, dev->drm_render,
>                               sizeof(card->render));
>  
>  +       if (dev->driver != NULL)
>  +               safe_strncpy(card->driver, dev->driver,
>  +                            sizeof(card->driver));
>  +
>          if (dev->pci_slot_name != NULL)
>                  safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
>                               sizeof(card->pci_slot_name));
>  @@ -820,6 +818,58 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
>          return false;
>   }
>  
>  +/**
>  + * Iterate over all igt_devices array and find all discrete/integrated cards.
> 
>  This sentence is misleading, otherwise what for is card_type argument?
> 
> 
>  + * @card: double pointer to igt_device_card structure, containing
>  + * an array of igt_device_card structures upon successful return.
>  + * @card_type: flag of type "enum igt_devices_card_type" to indicate
>  + * whether to find discrete, integrated, or both types of cards.
>  + * @drv_name: name of the driver to match.
>  + *
>  + * Returns the number of cards found, or -1 on error.
> 
>  You should add some note about freeing the memory allocated for the
>  returned array.
> 
> 
>  + */
>  +int igt_device_find_all_intel_card_by_driver_name(struct igt_device_card **card,
>  +                                                 enum dev_type card_type,
>  +                                                 const char *drv_name)
>  +{
>  +       int count = 0;
>  +       struct igt_device *dev;
>  +       int is_integrated;
>  +       struct igt_device_card *tmp;
>  +       struct igt_device_card *crd = NULL;
>  +
>  +       igt_assert(drv_name);
>  +       *card = NULL;
>  +
>  +       igt_list_for_each_entry(dev, &igt_devs.all, link) {
>  +               if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
>  +                       continue;
>  +
>  +               is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
>  +                                               PCI_SLOT_NAME_SIZE);
>  +
>  +               if ((card_type == DEVTYPE_INTEGRATED && !is_integrated) ||
>  +                   (card_type == DEVTYPE_DISCRETE && is_integrated) ||
>  +                   card_type == DEVTYPE_ALL) {
> 
>  Shouldn't this be:
> 
>  if ((card_type == DEVTYPE_INTEGRATED && is_integrated) ||
>      (card_type == DEVTYPE_DISCRETE && !is_integrated) ||
>      card_type == DEVTYPE_ALL) {
> 
>  ?
> 
>  Do you really need this function? I think according to device filter you
>  could use:
> 
>  igt_device_card_match_all("device:driver=intel", &cards);
>  igt_device_card_match_all("device:driver=intel,device=integrated", &cards);
>  igt_device_card_match_all("device:driver=intel,device=discrete", &cards);
>  igt_device_card_match_all("device:driver=xe", &cards);
>  igt_device_card_match_all("device:driver=i915", &cards);
> 
>  (see explanation below)
> 
> 
>  +                       tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
>  +                       if (!tmp && crd) {
>  +                               free(crd);
>  +                               return -1;
>  +                       }
>  +
>  +                       crd = tmp;
>  +                       __copy_dev_to_card(dev, &crd[count]);
>  +                       count++;
>  +               }
>  +       }
>  +
>  +       if (!count)
>  +               return 0;
>  +
>  +       *card = crd;
>  +       return count;
>  +}
>  +
>   bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
>   {
>          igt_assert(card);
>  @@ -1705,6 +1755,55 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
>          return &igt_devs.filtered;
>   }
>  
>  +/*
>  + * Find appropriate gpu device matching driver/card filter arguments.
>  + */
>  +static struct igt_list_head *filter_device(const struct filter_class *fcls,
>  +                                          const struct filter *filter)
>  +{
>  +       struct igt_device *dev;
>  +       int card = -1;
>  +       (void)fcls;
>  +
>  +       DBG("filter device\n");
>  +
>  +       if (filter->data.card) {
>  +               sscanf(filter->data.card, "%d", &card);
>  +               if (card < 0)
>  +                       return &igt_devs.filtered;
>  +       } else {
>  +               card = -1;
>  +       }
>  +
>  +       igt_list_for_each_entry(dev, &igt_devs.all, link) {
>  +               if (!is_pci_subsystem(dev))
>  +                       continue;
> 
>  Why there's limitation to pci devices only?
> 
>    Once the array of cards of type struct igt_device_card are prepared and
>    populated,
>    it is matched with the respective supported drivers . Seems like this
>    field is not present in case of non PCI  devices.
> 
>  +
>  +               /* Skip if 'driver' doesn't match */
>  +               if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
>  +                       continue;
> 
>  Use may introduce 'driver=intel' which would match i915 and xe. See
>  is_device_matched() function.
> 
> 
>  +
>  +               /* We get n-th card */
>  +               if (!card) {
>  +                       struct igt_device *dup = duplicate_device(dev);
>  +
>  +                       igt_list_add_tail(&dup->link, &igt_devs.filtered);
>  +                       break;
>  +               }
>  +               /* Include all the card */
>  +               else if (card == -1) {
>  +                       struct igt_device *dup = duplicate_device(dev);
>  +
>  +                       igt_list_add_tail(&dup->link, &igt_devs.filtered);
>  +               } else
>  +                       card--;
>  +       }
>  +
>  +       DBG("Filter device filtered size: %d\n", igt_list_length(&igt_devs.filtered));
>  +
>  +       return &igt_devs.filtered;
>  +}
> 
>  I wondered to alter a little bit pci filter, which currently limits
>  filtered view to have single element, but that's not a problem to
>  change it and keep matching card first in this view (I mean using
>  igt_list_add() instead igt_list_add_tail().
> 
> 
>  +
>   static bool sys_path_valid(const struct filter_class *fcls,
>                             const struct filter *filter)
>   {
>  @@ -1746,6 +1845,12 @@ static struct filter_class filter_definition_list[] = {
>                  .help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
>                  .detail = "find pf or vf\n",
>          },
>  +       {
>  +               .name = "device",
>  +               .filter_function = filter_device,
>  +               .help = "device:[driver=name][,card=%d]",
>  +               .detail = "find device by driver name and card number\n",
>  +       },
>          {
>                  .name = NULL,
>          },
>  @@ -2059,6 +2164,66 @@ bool igt_device_card_match_pci(const char *filter,
>          return __igt_device_card_match(filter, card, true);
>   }
>  
>  +/**
>  + * igt_device_card_match_all
>  + * @filter: filter string
>  + * @card: double pointer to igt_device_card structure, containing
>  + * an array of igt_device_card structures upon successful return.
>  + * @request_pci_ss: a boolean parameter determines whether to
>  + * consider PCI subsystem information during this process.
>  + * Function applies filter to match device from device array.
> 
>  Describe what drivers[] array is for. But according to my comment
>  above consider to have meta driver 'intel' for both drivers.
> 
>    Via parameter drivers[] array, this function checks if devices of a few
>    specific driver is found whose implantation is available in GPUTOP.
>    Even if driver 'intel' as a group is implemented for filtering,  manually
>    the cards/ devices need to check against all supported  intel drivers (in
>    GPUTOP).  
> 
> 
> 
>  + *
>  + * Returns: the number of cards found.
>  + */
>  +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
>  +                             bool request_pci_ss, const char * const drivers[])
>  +{
>  +       struct igt_device *dev = NULL;
>  +       struct igt_device_card *crd = NULL;
>  +       struct igt_device_card *tmp;
>  +       int count = 0;
>  +
>  +       /*
>  +        * Scan devices in case the user hasn't yet,
>  +        * but leave a decision on forced rescan on the user side.
>  +        */
> 
>  It seems this comment is not relevant anymore.
> 
> 
>  +       igt_devices_scan();
>  +
>  +       if (igt_device_filter_apply(filter) == false)
>  +               return 0;
>  +
>  +       if (igt_list_empty(&igt_devs.filtered))
>  +               return 0;
>  +
>  +       igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
> 
>  Having device= and driver= you could just simply iterate over
>  this list and build igt_device_card array without any additional
>  logic here.
> 
>    As already mentioned, the drivers of the respective devices need to check
>    against the supported drivers[] array in the GPUTOP
>    to build igt_device_card array. Regards, Soham
> 
> 
>  Resume and some other nit:
> 
>  Divide this patch to at least two:
>    a) in first introduce device_filter
>    b) in second add igt_device_card_match_all()
> 
>  --
>  Zbigniew
> 
> 
>  +               for (int i = 0;
>  +                    drivers && drivers[i] && !strcmp(drivers[i],
>  +                    dev->driver); i++) {
>  +                       tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
>  +                       if (!tmp && crd) {
>  +                               free(crd);
>  +                               return 0;
>  +                       }
>  +
>  +                       crd = tmp;
>  +
>  +                       if (request_pci_ss && !is_pci_subsystem(dev) &&
>  +                           dev->parent && is_pci_subsystem(dev->parent))
>  +                               __copy_dev_to_card(dev->parent, crd);
>  +                       else
>  +                               __copy_dev_to_card(dev, crd);
>  +                       count++;
>  +                       break;
>  +               }
>  +       }
>  +
>  +       if (!count)
>  +               return 0;
>  +
>  +       *card = crd;
>  +       return count;
>  +}
>  +
>   /**
>    * igt_device_get_pretty_name
>    * @card: pointer to igt_device_card struct
>  diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
>  index 92741fe3c..62e7a1737 100644
>  --- a/lib/igt_device_scan.h
>  +++ b/lib/igt_device_scan.h
>  @@ -59,10 +59,17 @@ struct igt_device_card {
>          char subsystem[NAME_MAX];
>          char card[NAME_MAX];
>          char render[NAME_MAX];
>  +       char driver[NAME_MAX];
>          char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>          uint16_t pci_vendor, pci_device;
>   };
>  
>  +enum dev_type {
>  +       DEVTYPE_ALL,
>  +       DEVTYPE_INTEGRATED,
>  +       DEVTYPE_DISCRETE,
>  +};
>  +
>   void igt_devices_scan(void);
>   void igt_devices_scan_all_attrs(void);
>  
>  @@ -88,10 +95,15 @@ int igt_device_filter_pci(void);
>   bool igt_device_card_match(const char *filter, struct igt_device_card *card);
>   bool igt_device_card_match_pci(const char *filter,
>          struct igt_device_card *card);
>  +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
>  +                             bool request_pci_ss, const char * const drivers[]);
>   bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>   bool igt_device_find_integrated_card(struct igt_device_card *card);
>   bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
>   bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
>  +int igt_device_find_all_intel_card_by_driver_name(struct igt_device_card **card,
>  +                                                 enum dev_type card_type,
>  +                                                 const char *drv_name);
>   char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
>   int igt_open_card(struct igt_device_card *card);
>   int igt_open_render(struct igt_device_card *card);
>  --
>  2.34.1
