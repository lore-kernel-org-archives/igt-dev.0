Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE068C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 11:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F73010E85B;
	Thu, 13 Mar 2025 11:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nojy7uFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6760710E85B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741866689; x=1773402689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1V0JEvsU2xqxskxW6Sg/S6ici924m7UztPzwTnJ6aX4=;
 b=Nojy7uFONuuHdzL5xDimiLku8gOWYpy0PdGH2h0O7m62JQIxE2qIulV8
 Gr0vqE4hPI7v2zaPv5vYKid4i2a2bBZv//+nNefQuHWNVQki86Vgj9kUY
 frtqJTqYl/KG0FZLTcqX3YT8DkqX/PWQ47yl5b6M1GSw1+Q2rreJ0Pa5l
 GWB25ctL75fiSg0CO2ueF6+Zt9I4Lbzyb11ez2T8nZFA3aZwlIG9FZAnI
 9UCTim0Mup0qw6bQxDdOfK/Lo/oOhfBHhd6y/8IHlfVkGg04j+b/94+34
 jxJPFlcjYLST9T2zLK2cu7zYzjD2IP/xA0paKntIr58CE+jXH+uYnHmND g==;
X-CSE-ConnectionGUID: 0e1qAy0vRtyLboOVXxhrRg==
X-CSE-MsgGUID: JpjCCbZVRWCxP36xl/FUGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42885789"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="42885789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 04:51:29 -0700
X-CSE-ConnectionGUID: 6DSQfKH3RUK3jvI/wydfWg==
X-CSE-MsgGUID: 9mcRr4mjRlmXuCVo2xVjjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="144111109"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 04:51:26 -0700
Date: Thu, 13 Mar 2025 12:51:23 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jonathan.ming.jun.lui@intel.com
Subject: Re: [PATCH <i-g-t> v4 1/4] lib/igt_device_scan: Enable finding all
 IGT devices for a specific driver
Message-ID: <20250313115123.hmqfsacmt2szb4he@zkempczy-mobl2>
References: <20250313062154.1601701-1-soham.purkait@intel.com>
 <20250313062154.1601701-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313062154.1601701-2-soham.purkait@intel.com>
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

On Thu, Mar 13, 2025 at 11:51:51AM +0530, Soham Purkait wrote:
>     Add function to find all the available GPU
> cards by driver name and card type.
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
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/igt_device_scan.c | 58 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h |  3 +++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 711bedc5c..4d243126e 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -774,6 +774,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
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
> @@ -820,6 +824,60 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
>  	return false;
>  }
>  
> +/**
> + * Iterate over all igt_devices array and find all discrete/integrated cards.
> + * @card: double pointer to igt_device_card structure, containing
> + * an array of igt_device_card structures upon successful return.
> + * @card_type: flag to indicate whether to find discrete, integrated, or
> + * both types of cards. Use 0 for integrated, 1 for discrete, and 2 for both.
> + * @drv_name: name of the driver to match.
> + *
> + * Returns the number of cards found, or -1 on error.
> + */
> +int find_all_intel_card_by_driver_name(struct igt_device_card **card,
> +				       uint8_t card_type, const char *drv_name)
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
> +		if ((card_type == 1 && !is_integrated) ||
> +		    (card_type == 0 && is_integrated) ||
> +		    card_type == 2) {

This if doesn't look well, you should use enum for better readability.
Anyway, haven't you thought to provide new filter instead of function
which returns collection of matching devices? Lets say:

	device:driver=xe,card=0
	device:driver=xe,card=...

--
Zbigniew

> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
> +			if (!tmp) {
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
> +	if (!count) {
> +		if (!crd)
> +			free(crd);
> +		return 0;
> +	}
> +
> +	*card = crd;
> +	return count;
> +}
> +
>  bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
>  {
>  	igt_assert(card);
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 92741fe3c..4fbb11193 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -59,6 +59,7 @@ struct igt_device_card {
>  	char subsystem[NAME_MAX];
>  	char card[NAME_MAX];
>  	char render[NAME_MAX];
> +	char driver[NAME_MAX];
>  	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>  	uint16_t pci_vendor, pci_device;
>  };
> @@ -92,6 +93,8 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_integrated_card(struct igt_device_card *card);
>  bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
> +int find_all_intel_card_by_driver_name(struct igt_device_card **card,
> +				       uint8_t want_discrete, const char *drv_name);
>  char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
>  int igt_open_card(struct igt_device_card *card);
>  int igt_open_render(struct igt_device_card *card);
> -- 
> 2.34.1
> 
