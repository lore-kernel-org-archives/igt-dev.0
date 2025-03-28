Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C21CC36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90EF10E98C;
	Fri, 28 Mar 2025 08:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/if5oyW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8AA10E98C
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743149190; x=1774685190;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AUZcm67tDjd0vEZboerGdA6H4knC8LVUGnJCz2Ps3LE=;
 b=N/if5oyWTmfrbflLmHx3p49FyrXAj9+dPd3Z+EpotdECFwNePIJ03fZg
 mE1E29/BFkBp2jFuGFe/UqIe6ZHf+BFUUHKZ5fbLkh+xmrppT0yGR8ssn
 64Az1Cxaoxqdav2qYAgCBA3jhnel+qJ9OXXeGl6cC8YZm+M9VIiKN1pye
 eJtr93bm9/SjjRkcuFgJgFyX3m5xDaibo0sgbHQ5crlbNLHdSC+BRQ68q
 lDsMbI8AwcZ/idUXcA48dP6JGEJzXva6L+zN/inV7BAQNUECKVu9Do3Cp
 EFOezIomDBdvyyqYjScQWHNuBfuSE474M8fkdKVmgtOYUTu+C3mjn/8Qj w==;
X-CSE-ConnectionGUID: Rii/HA4jStyt+8yrJxhFLg==
X-CSE-MsgGUID: QrK2c59LQyGDevj5j9qa3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55872819"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="55872819"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:06:30 -0700
X-CSE-ConnectionGUID: 0nfF4W1+QZu+BSJ+NyuseA==
X-CSE-MsgGUID: VffKkx3NTO6AQj9+ClUSkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="156369232"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:06:27 -0700
Date: Fri, 28 Mar 2025 09:06:24 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jonathan.ming.jun.lui@intel.com
Subject: Re: [PATCH <i-g-t> v5 1/4] lib/igt_device_scan: Enable finding all
 IGT devices for a specific driver
Message-ID: <20250328080624.73bhyl3ygvzc2bkk@zkempczy-mobl2>
References: <20250325191230.1822979-1-soham.purkait@intel.com>
 <20250325191230.1822979-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325191230.1822979-2-soham.purkait@intel.com>
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

On Wed, Mar 26, 2025 at 12:42:27AM +0530, Soham Purkait wrote:
> Add filter functions to find all the
> available GPUs or few among them
> by driver name and card type or card number.
> Add driver field to igt_device_card structure 
> for storing driver names.
> 
> v2 : fix for refactoring GPUTOP into a
>      vendor-agnostic tool (Lucas)
> 
> v3 : Separate commit for lib (Kamil)
> 
> v4 : Refactor to use composition strategy
>      for driver and device type filtering
>      Refactor code to improve memory
>      allocation and error handling (Lucas)
> 
> v5 : Rename function name as per convention.
>      Use "dev_type" enum for card_type. (Krzysztof)
>      Add new filter to return collection
>      of matching devices.               (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/igt_device_scan.c | 177 ++++++++++++++++++++++++++++++++++++++++--
>  lib/igt_device_scan.h |  12 +++
>  2 files changed, 183 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 711bedc5c..452da2ee4 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -198,12 +198,6 @@
>  #define DBG(...) {}
>  #endif
>  
> -enum dev_type {
> -	DEVTYPE_ALL,
> -	DEVTYPE_INTEGRATED,
> -	DEVTYPE_DISCRETE,
> -};
> -

I think you don't need to extern this dev_type.

>  #define STR_INTEGRATED "integrated"
>  #define STR_DISCRETE "discrete"
>  
> @@ -774,6 +768,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
>  		safe_strncpy(card->render, dev->drm_render,
>  			     sizeof(card->render));
>  
> +	if (dev->driver != NULL)
> +		safe_strncpy(card->driver, dev->driver,
> +			     sizeof(card->driver));
> +
>  	if (dev->pci_slot_name != NULL)
>  		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
>  			     sizeof(card->pci_slot_name));
> @@ -820,6 +818,58 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
>  	return false;
>  }
>  
> +/**
> + * Iterate over all igt_devices array and find all discrete/integrated cards.

This sentence is misleading, otherwise what for is card_type argument?

> + * @card: double pointer to igt_device_card structure, containing
> + * an array of igt_device_card structures upon successful return.
> + * @card_type: flag of type "enum igt_devices_card_type" to indicate
> + * whether to find discrete, integrated, or both types of cards.
> + * @drv_name: name of the driver to match.
> + *
> + * Returns the number of cards found, or -1 on error.

You should add some note about freeing the memory allocated for the
returned array.

> + */
> +int igt_device_find_all_intel_card_by_driver_name(struct igt_device_card **card,
> +						  enum dev_type card_type,
> +						  const char *drv_name)
> +{
> +	int count = 0;
> +	struct igt_device *dev;
> +	int is_integrated;
> +	struct igt_device_card *tmp;
> +	struct igt_device_card *crd = NULL;
> +
> +	igt_assert(drv_name);
> +	*card = NULL;
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
> +			continue;
> +
> +		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
> +						PCI_SLOT_NAME_SIZE);
> +
> +		if ((card_type == DEVTYPE_INTEGRATED && !is_integrated) ||
> +		    (card_type == DEVTYPE_DISCRETE && is_integrated) ||
> +		    card_type == DEVTYPE_ALL) {

Shouldn't this be:

if ((card_type == DEVTYPE_INTEGRATED && is_integrated) ||
    (card_type == DEVTYPE_DISCRETE && !is_integrated) ||
    card_type == DEVTYPE_ALL) {

?

Do you really need this function? I think according to device filter you
could use:

igt_device_card_match_all("device:driver=intel", &cards);
igt_device_card_match_all("device:driver=intel,device=integrated", &cards);
igt_device_card_match_all("device:driver=intel,device=discrete", &cards);
igt_device_card_match_all("device:driver=xe", &cards);
igt_device_card_match_all("device:driver=i915", &cards);

(see explanation below)

> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
> +			if (!tmp && crd) {
> +				free(crd);
> +				return -1;
> +			}
> +
> +			crd = tmp;
> +			__copy_dev_to_card(dev, &crd[count]);
> +			count++;
> +		}
> +	}
> +
> +	if (!count)
> +		return 0;
> +
> +	*card = crd;
> +	return count;
> +}
> +
>  bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
>  {
>  	igt_assert(card);
> @@ -1705,6 +1755,55 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
>  	return &igt_devs.filtered;
>  }
>  
> +/*
> + * Find appropriate gpu device matching driver/card filter arguments.
> + */
> +static struct igt_list_head *filter_device(const struct filter_class *fcls,
> +					   const struct filter *filter)
> +{
> +	struct igt_device *dev;
> +	int card = -1;
> +	(void)fcls;
> +
> +	DBG("filter device\n");
> +
> +	if (filter->data.card) {
> +		sscanf(filter->data.card, "%d", &card);
> +		if (card < 0)
> +			return &igt_devs.filtered;
> +	} else {
> +		card = -1;
> +	}
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		if (!is_pci_subsystem(dev))
> +			continue;

Why there's limitation to pci devices only?

> +
> +		/* Skip if 'driver' doesn't match */
> +		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
> +			continue;

Use may introduce 'driver=intel' which would match i915 and xe. See
is_device_matched() function.

> +
> +		/* We get n-th card */
> +		if (!card) {
> +			struct igt_device *dup = duplicate_device(dev);
> +
> +			igt_list_add_tail(&dup->link, &igt_devs.filtered);
> +			break;
> +		}
> +		/* Include all the card */
> +		else if (card == -1) {
> +			struct igt_device *dup = duplicate_device(dev);
> +
> +			igt_list_add_tail(&dup->link, &igt_devs.filtered);
> +		} else
> +			card--;
> +	}
> +
> +	DBG("Filter device filtered size: %d\n", igt_list_length(&igt_devs.filtered));
> +
> +	return &igt_devs.filtered;
> +}

I wondered to alter a little bit pci filter, which currently limits
filtered view to have single element, but that's not a problem to
change it and keep matching card first in this view (I mean using
igt_list_add() instead igt_list_add_tail().

> +
>  static bool sys_path_valid(const struct filter_class *fcls,
>  			   const struct filter *filter)
>  {
> @@ -1746,6 +1845,12 @@ static struct filter_class filter_definition_list[] = {
>  		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
>  		.detail = "find pf or vf\n",
>  	},
> +	{
> +		.name = "device",
> +		.filter_function = filter_device,
> +		.help = "device:[driver=name][,card=%d]",
> +		.detail = "find device by driver name and card number\n",
> +	},
>  	{
>  		.name = NULL,
>  	},
> @@ -2059,6 +2164,66 @@ bool igt_device_card_match_pci(const char *filter,
>         return __igt_device_card_match(filter, card, true);
>  }
>  
> +/**
> + * igt_device_card_match_all
> + * @filter: filter string
> + * @card: double pointer to igt_device_card structure, containing
> + * an array of igt_device_card structures upon successful return.
> + * @request_pci_ss: a boolean parameter determines whether to
> + * consider PCI subsystem information during this process.
> + * Function applies filter to match device from device array.

Describe what drivers[] array is for. But according to my comment
above consider to have meta driver 'intel' for both drivers.

> + *
> + * Returns: the number of cards found.
> + */
> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
> +			      bool request_pci_ss, const char * const drivers[])
> +{
> +	struct igt_device *dev = NULL;
> +	struct igt_device_card *crd = NULL;
> +	struct igt_device_card *tmp;
> +	int count = 0;
> +
> +	/*
> +	 * Scan devices in case the user hasn't yet,
> +	 * but leave a decision on forced rescan on the user side.
> +	 */

It seems this comment is not relevant anymore.

> +	igt_devices_scan();
> +
> +	if (igt_device_filter_apply(filter) == false)
> +		return 0;
> +
> +	if (igt_list_empty(&igt_devs.filtered))
> +		return 0;
> +
> +	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {

Having device= and driver= you could just simply iterate over
this list and build igt_device_card array without any additional
logic here.

Resume and some other nit:

Divide this patch to at least two:
  a) in first introduce device_filter
  b) in second add igt_device_card_match_all()

--
Zbigniew

> +		for (int i = 0;
> +		     drivers && drivers[i] && !strcmp(drivers[i],
> +		     dev->driver); i++) {
> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
> +			if (!tmp && crd) {
> +				free(crd);
> +				return 0;
> +			}
> +
> +			crd = tmp;
> +
> +			if (request_pci_ss && !is_pci_subsystem(dev) &&
> +			    dev->parent && is_pci_subsystem(dev->parent))
> +				__copy_dev_to_card(dev->parent, crd);
> +			else
> +				__copy_dev_to_card(dev, crd);
> +			count++;
> +			break;
> +		}
> +	}
> +
> +	if (!count)
> +		return 0;
> +
> +	*card = crd;
> +	return count;
> +}
> +
>  /**
>   * igt_device_get_pretty_name
>   * @card: pointer to igt_device_card struct
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 92741fe3c..62e7a1737 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -59,10 +59,17 @@ struct igt_device_card {
>  	char subsystem[NAME_MAX];
>  	char card[NAME_MAX];
>  	char render[NAME_MAX];
> +	char driver[NAME_MAX];
>  	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>  	uint16_t pci_vendor, pci_device;
>  };
>  
> +enum dev_type {
> +	DEVTYPE_ALL,
> +	DEVTYPE_INTEGRATED,
> +	DEVTYPE_DISCRETE,
> +};
> +
>  void igt_devices_scan(void);
>  void igt_devices_scan_all_attrs(void);
>  
> @@ -88,10 +95,15 @@ int igt_device_filter_pci(void);
>  bool igt_device_card_match(const char *filter, struct igt_device_card *card);
>  bool igt_device_card_match_pci(const char *filter,
>  	struct igt_device_card *card);
> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
> +			      bool request_pci_ss, const char * const drivers[]);
>  bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_integrated_card(struct igt_device_card *card);
>  bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
> +int igt_device_find_all_intel_card_by_driver_name(struct igt_device_card **card,
> +						  enum dev_type card_type,
> +						  const char *drv_name);
>  char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
>  int igt_open_card(struct igt_device_card *card);
>  int igt_open_render(struct igt_device_card *card);
> -- 
> 2.34.1
> 
