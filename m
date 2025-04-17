Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052DDC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 05:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0810EA34;
	Thu, 17 Apr 2025 05:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3XyBJF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EDC10EA34
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 05:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744869450; x=1776405450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RVVLwLbK+jRL6u+UMYVlwDCxI1hel9v31bI3k6DEp8s=;
 b=d3XyBJF59d7jvATTkc5qbdkO2AqsHu/NBXL4Ay/invTO1QZ6vgL8/54v
 3zLCWz8G/zbc7AavMQhEhNZmePKcoiyU0NcURQBCUqpNwc8dEHM7f/Ull
 yD4JR/Lbqadf3V0tmcfnHeIyL38CmcLH/WXt99B0krwxTgvVqNTkUIw9b
 3ywqBIa0miX0a7zlmJDE4s6gl7WXpLfZbzDKgh3sOWyaf52LfMadK9sVN
 CSc2KOw3o1HnFB+fkEVLwv82Avc7huQib2Up5i8waklOQ3FChP0OkiMkS
 MGQhQkdcW4UKswVY2glerNjVQL51VVszrY/n2MpU/xZtJThLTfdTBR78k w==;
X-CSE-ConnectionGUID: kutGDS4qSpafNp67hhD0Dw==
X-CSE-MsgGUID: lLrggXTPT12DOUwn2oUP/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46452817"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46452817"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:57:27 -0700
X-CSE-ConnectionGUID: nj2sojZIS2GZ/tEfyuKxHA==
X-CSE-MsgGUID: tCjlIQwDSMu0JEui1DAReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135677689"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 22:57:24 -0700
Date: Thu, 17 Apr 2025 07:57:21 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v7 1/5] lib/igt_device_scan: Add support for the
 device filter
Message-ID: <20250417055721.ftusozgwfouktfm5@zkempczy-mobl2>
References: <20250416105851.2048787-1-soham.purkait@intel.com>
 <20250416105851.2048787-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416105851.2048787-2-soham.purkait@intel.com>
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

On Wed, Apr 16, 2025 at 04:28:47PM +0530, Soham Purkait wrote:
> Add support for the device filter based on
> driver string, device type (integrated or discrete)
> and card number.
> 
> v5 : Add device filter to filter out
>      matching devices.           (Zbigniew)
> 
> v6 : Move device filter with Separate
>      commit.                     (Zbigniew)
> 
> v7 : Fix interpretation of card numbering
>      and add 'all' option for all the cards.
>                                  (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof gave you r-b before changes in this patch, you shouldn't
transfer r-b after that.

> ---
>  lib/igt_device_scan.c | 70 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 3f26a1737..1613fc3ed 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1709,6 +1709,70 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
>  	return &igt_devs.filtered;
>  }
>  
> +/*
> + * Find appropriate gpu device through matching driver, device type and
> + * card filter arguments.
> + */
> +static struct igt_list_head *filter_device(const struct filter_class *fcls,
> +					   const struct filter *filter)
> +{
> +	struct igt_device *dev;
> +	bool allcards = false;
> +	int card = 0;
> +	(void)fcls;
> +
> +	DBG("filter device\n");
> +
> +	if (filter->data.card) {
> +		char crdop[4] = {0};
> +
> +		if (sscanf(filter->data.card, "%d", &card) == 1) {
> +			if (card < 0)
> +				return &igt_devs.filtered;
> +		} else {
> +			card = 0;
> +			if (sscanf(filter->data.card, "%3s", crdop) == 1) {
> +				if (strcmp(crdop, "all"))
> +					allcards = true;

Generally everything goes toward the right direction, but running

	# ../tools/lsgpu -d device:device=integrated,card=buu
	Notice: Using filter supplied via --device
	=== Device filter ===
	device:device=integrated,card=dfa

	=== Testing device open ===
	Device detail:
	subsystem   : pci
	drm card    : /dev/dri/card0
	drm render  : /dev/dri/renderD128
	Device /dev/dri/card0 successfully opened
	Device /dev/dri/renderD128 successfully opened
	-------------------------------------------

is not correct behavior. For invalid card=string you shouldn't
find any card.

--
Zbigniew

> +			} else {
> +				return &igt_devs.filtered;
> +			}
> +		}
> +	} else {
> +		card = 0;
> +	}
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		/* Skip if 'driver' doesn't match */
> +		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
> +			continue;
> +
> +		/* Skip if 'device' doesn't match */
> +		if (filter->data.device && !is_device_matched(dev, filter->data.device))
> +			continue;
> +
> +		/* We get n-th card */
> +		if (!allcards && !card) {
> +			struct igt_device *dup = duplicate_device(dev);
> +
> +			igt_list_add_tail(&dup->link, &igt_devs.filtered);
> +			break;
> +		} else if (!allcards) {
> +			card--;
> +		}
> +		/* Include all the cards */
> +		else if (allcards) {
> +			struct igt_device *dup = duplicate_device(dev);
> +
> +			igt_list_add(&dup->link, &igt_devs.filtered);
> +		}
> +	}
> +
> +	DBG("Filter device filtered size: %d\n", igt_list_length(&igt_devs.filtered));
> +
> +	return &igt_devs.filtered;
> +}
> +
>  static bool sys_path_valid(const struct filter_class *fcls,
>  			   const struct filter *filter)
>  {
> @@ -1750,6 +1814,12 @@ static struct filter_class filter_definition_list[] = {
>  		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
>  		.detail = "find pf or vf\n",
>  	},
> +	{
> +		.name = "device",
> +		.filter_function = filter_device,
> +		.help = "device:[driver=name][,device=type][,card=%d|all]",
> +		.detail = "find device by driver name, device type and card number\n",
> +	},
>  	{
>  		.name = NULL,
>  	},
> -- 
> 2.34.1
> 
