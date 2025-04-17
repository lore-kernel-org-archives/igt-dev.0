Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4DCC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 06:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA2810E091;
	Thu, 17 Apr 2025 06:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBpyMgaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA3910E091
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 06:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744872909; x=1776408909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=diBbc4lvpNC1S5CPQ10MoEYfOuC75ShSCKp+MM0w4hw=;
 b=KBpyMgaa+r0VO/+k8p1ygwCUycdOEfEtvNnrVj95HEp/XOqMxGTezE1q
 eTvE5wVQr/2jRdiQMiEpkFb1rZfjnZS37oNWOMqnW3dJO1AfHaUb2jso5
 7OIVNW6YkT2KEJDM6qCa+kNLO0pUCBtEyGSmYRfClVhvtLzQx9HFw1Ksj
 VC0nlRmkmRKPQMcLsNqwB0L8guHiOPeHPuZ39ZR/2eynschxcFSDs/z8i
 DV9t5EcNsoMwyu3v2yzwIMghJX69QukCOYFhrLfi5m7RlVZqzbb5gpWkk
 OHfdlRXQp1llXjmx3YZ6pZ2nde1ogqXqWwVkLN5gh8arEKZW+B48q+BSn w==;
X-CSE-ConnectionGUID: hVXKncLnTTeMtq0h3DVOUQ==
X-CSE-MsgGUID: rwSMn2I8Sme8/GkGTu2V0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46457655"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46457655"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 23:55:08 -0700
X-CSE-ConnectionGUID: s4CT0V4VRw2oa+C0g79CvQ==
X-CSE-MsgGUID: 1OvqmLtGQPWI9eKsMs+zew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131029141"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 23:55:06 -0700
Date: Thu, 17 Apr 2025 08:55:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v7 2/5] lib/igt_device_scan: Enable finding all
 matched IGT devices
Message-ID: <20250417065504.zuz5d3tce32waafd@zkempczy-mobl2>
References: <20250416105851.2048787-1-soham.purkait@intel.com>
 <20250416105851.2048787-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416105851.2048787-3-soham.purkait@intel.com>
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

On Wed, Apr 16, 2025 at 04:28:48PM +0530, Soham Purkait wrote:
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
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/igt_device_scan.c | 61 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h |  2 ++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 1613fc3ed..67a00f0ed 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -2133,6 +2133,67 @@ bool igt_device_card_match_pci(const char *filter,
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
> + * @drivers: this holds the list of supported driver string by
> + * the caller.
> + * Function applies filter to match device from device array.
> + *
> + * Returns: the number of cards found.
> + *
> + * Note: The caller is responsible for freeing the memory which is
> + * dynamically allocated for the array of igt_device_card structures
> + * upon successful return.
> + */
> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
> +			      bool request_pci_ss, const char * const drivers[])

I've mixed feelings about 'drivers' array. Filter should be enough to
limit the search to a specific driver. Here filter search is additionally
limited to 'drivers' array. I mean apart of device filter 'driver' field
you're limiting the search to drivers from the array. Avoiding calling
igt_devices_scan() may be the reason, but I don't like building double
filtering logic where first is in the device filter and second is in the
igt_device_card_match_all().

Moreover - logic in gputop main() iterates over drivers as well, I mean:

gputop.c:main()
	...
	for (int i = 0; drivers[i]; i++)
		populate_device_instances(NULL, i);
	...


then in populate_device_instances() you call igt_device_card_match_all()
preparing filter string with driver name:

	asprintf(&fltr, "device:driver=%s,card=all", drivers[i]);
	count = igt_device_card_match_all(fltr, &cards, true, drivers);

and finally in igt_device_card_match_all() you're iterating again over
'drivers' to match the driver again, even if filter already did it.

I think you should:

1. if user didn't pass device filter use:
	'device:'
   collecting all available devices, then filter out according to your
   drivers list in gputop.c populate_device_instances().

2. if user passed the filter, do the same as above, filtering out in
   populate_device_instances() as well.

If I'm not wrong both cases may be handled within single code, without
any conditionals.

--
Zbigniew


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
> +	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
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
> index f1cd3b1e9..c7ddccc57 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -89,6 +89,8 @@ int igt_device_filter_pci(void);
>  bool igt_device_card_match(const char *filter, struct igt_device_card *card);
>  bool igt_device_card_match_pci(const char *filter,
>  	struct igt_device_card *card);
> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card,
> +			      bool request_pci_ss, const char * const drivers[]);
>  bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_integrated_card(struct igt_device_card *card);
>  bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
> -- 
> 2.34.1
> 
