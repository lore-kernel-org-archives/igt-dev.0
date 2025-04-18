Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45C7C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 06:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9606D10E417;
	Fri, 18 Apr 2025 06:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgQwEC7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D7B10E417
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744959424; x=1776495424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Pp/9AZPBrGS4BfRa46SGT7ZRtcTb1a4vBA11QJIk01E=;
 b=UgQwEC7KXT8SqUYSN8NoOeQbadz4fmitp2JmTbgPyhCyCwkiXC/OMfUA
 yTnmpayHqqTM+05d/4mRZBLfyPdFjZ88nVR1Itbimcz9/wrY5I7heg7h+
 9jgalaB+EJlBmlmLv/+TALHoFK3TUrxR4+ud+CzJkp66/CyD5sAGmkUaX
 jFOXxODROp1y9CeZvRr8QRpAbm//7Jo/o/ub9kkYn2ddSDWDoBs72rfIf
 6U2HVNcAgWK9mMK++Pt54/QYWIozjcfwVEfIh6aPul+MiF26iBu7iHfvo
 y83Dw7MZFfifq6wk+JrRT0yky47gzYHFzDJsaP3rhAKVaaAwODRIecF3X Q==;
X-CSE-ConnectionGUID: z4sM+IFgTc2M+Kb7B6k+Fw==
X-CSE-MsgGUID: CpJ6mbYqSISc/siIHMDTmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57574912"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="57574912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 23:57:03 -0700
X-CSE-ConnectionGUID: bbtyg8sMQFmNfRItI99MAg==
X-CSE-MsgGUID: 4moKwHaNTzaWsddY2S0PbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="131947251"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.208])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 23:57:00 -0700
Date: Fri, 18 Apr 2025 08:56:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v8 2/5] lib/igt_device_scan: Enable finding all
 matched IGT devices
Message-ID: <20250418065657.rpenmushdwsh5jpu@zkempczy-mobl2>
References: <20250417135941.2083761-1-soham.purkait@intel.com>
 <20250417135941.2083761-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417135941.2083761-3-soham.purkait@intel.com>
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

On Thu, Apr 17, 2025 at 07:29:38PM +0530, Soham Purkait wrote:
> Use filter to find all the available
> GPUs or few among them by driver name
> and card type or card number.
> 
> v2 : Fix for refactoring GPUTOP into a
>      vendor-agnostic tool. (Lucas)
> 
> v3 : Separate commit for lib. (Kamil)
> 
> v4 : Refactor to use composition strategy
>      for driver and device type filtering.
>      Refactor code to improve memory
>      allocation and error handling. (Lucas)
> 
> v5 : Introduce device card match function
>      to return collection of matching
>      devices using device filter.
> 
> v6 : Separate commit for device card match
>      function.                     (Zbigniew)
>      Function description modification for device
>      card match function.          (Zbigniew)
> 
> v7 : Single return for card match function.
>                                   (Krzysztof)
> 
> v8 : Removed 'drivers' array as card match
>      function parameter.          (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/igt_device_scan.c | 56 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h |  2 ++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 3dbe06812..fd299d6ab 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -2134,6 +2134,62 @@ bool igt_device_card_match_pci(const char *filter,
>         return __igt_device_card_match(filter, card, true);
>  }
>  
> +/**
> + * igt_device_card_match_all
> + * @filter: filter string.
> + * @card: double pointer to igt_device_card structure, containing
> + * an array of igt_device_card structures upon successful return.
> + * @request_pci_ss: a boolean parameter determines whether to
> + * consider PCI subsystem information during this process.
> + *
> + * Function applies filter to match device from device array.
> + *
> + * Returns: the number of cards found.
> + *
> + * Note: The caller is responsible for freeing the memory which is
> + * dynamically allocated for the array of igt_device_card structures
> + * upon successful return.
> + */
> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
> +			      bool request_pci_ss)
> +{
> +	struct igt_device *dev = NULL;
> +	struct igt_device_card *crd = NULL;
> +	struct igt_device_card *tmp;
> +	int count = 0;
> +
> +	igt_devices_scan();
> +
> +	if (igt_device_filter_apply(filter) == false)
> +		return 0;
> +
> +	if (igt_list_empty(&igt_devs.filtered))
> +		return 0;
> +

I would probably iterate over the list counting number of devices
which matches request_pci_ss value then allocate crd array once.
Finally iterate second time to fill it. Costs less than realloc
for each element (more elements, more memcpy inside costs).

Anyway I may accept this as is. Decision fix or not is up to you.

If you decide to change I'll review it again. But for this shape

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> +	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
> +		tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
> +		if (!tmp) {
> +			if (crd)
> +				free(crd);
> +			return 0;
> +		}
> +
> +		crd = tmp;
> +
> +		if (request_pci_ss && !is_pci_subsystem(dev) &&
> +		    dev->parent && is_pci_subsystem(dev->parent))
> +			__copy_dev_to_card(dev->parent, crd);
> +		else
> +			__copy_dev_to_card(dev, crd);
> +		count++;
> +	}
> +
> +	if (count)
> +		*card = crd;
> +
> +	return count;
> +}
> +
>  /**
>   * igt_device_get_pretty_name
>   * @card: pointer to igt_device_card struct
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index f1cd3b1e9..7bee65881 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -89,6 +89,8 @@ int igt_device_filter_pci(void);
>  bool igt_device_card_match(const char *filter, struct igt_device_card *card);
>  bool igt_device_card_match_pci(const char *filter,
>  	struct igt_device_card *card);
> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
> +			      bool request_pci_ss);
>  bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_integrated_card(struct igt_device_card *card);
>  bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
> -- 
> 2.34.1
> 
