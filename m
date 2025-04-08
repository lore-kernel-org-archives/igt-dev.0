Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E377C3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 05:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E475F10E5C6;
	Tue,  8 Apr 2025 05:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdcNlM+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B0210E0B1
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744091082; x=1775627082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hEDlGKRLIwcFHcNCf6Wv5UaVjzRGaZDgTfMA9vGgj0w=;
 b=ZdcNlM+zW/If0zlnwKZZb+FK0JErwJUnF4EqNAJP33ES6npw9p/tlf02
 b7v5ZRPbnVnLN9URowjYxzQ1pCJt6w7Som4t/mk5IN4PnAzvFA8tip5xB
 jw6MqyLLsozWgv/AgTXM0hAHjMphOZxBVhzcQIRq0t+bnZA9liGbV+MLp
 IX7KypYUV+WO1atcnrCad7+du/HBO2VibGkxlJq/VinPMeOtFEZzC9x68
 fVDwNWYN8ne86wdIuAc/5pMWYhff0WdwIsGpv2Ry5kD2aY/9u6iOvGCgX
 3PeDH5/bbktMfqOrBZw2TLYzXM60MYALdLGOVD5J1tWBcPQxGNzik4ZNV g==;
X-CSE-ConnectionGUID: OxmIHS2rSIK9duuIJYO4rg==
X-CSE-MsgGUID: /SSFCIaMST64MWbpwovHsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45518231"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="45518231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:44:42 -0700
X-CSE-ConnectionGUID: KUz+R+JJQzy99gHfAaZRLA==
X-CSE-MsgGUID: 9S1fJikQThOWleBiU6gRaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128158019"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:44:38 -0700
Date: Tue, 8 Apr 2025 07:44:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v6 1/5] lib/igt_device_scan: Add support for the
 device filter
Message-ID: <20250408054436.mr7qvq7wj5vu3xmn@zkempczy-mobl2>
References: <20250404132421.1920451-1-soham.purkait@intel.com>
 <20250404132421.1920451-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404132421.1920451-2-soham.purkait@intel.com>
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

On Fri, Apr 04, 2025 at 06:54:17PM +0530, Soham Purkait wrote:
>      Add support for the device filter based on
> driver string, device type (integrated or discrete)
> and card number.
> 
> v5 : Add device filter to filter out
>      matching devices.           (Zbigniew)
> 
> v6 : Move device filter with Separate 
>      commit.                     (Zbigniew)

Drop versioning in final version of your series.

> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/igt_device_scan.c | 58 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 3f26a1737..ea14d8e23 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1709,6 +1709,58 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
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

I would change this a little bit to be consistent with other
filters which assumes if you don't pass card=n it means n == 0.

Consider to introduce card=all. Add some bool like 'allcards=false',
then if there's successful 'all' string scan collect all cards like
you're doing this now for -1. Then scan card=%d, finally assuming 0
if there's filter->data.card was passed.

> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +

Unnecessary blank line.

> +		/* Skip if 'driver' doesn't match */
> +		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
> +			continue;
> +
> +		/* Skip if 'device' doesn't match */
> +		if (filter->data.device && !is_device_matched(dev, filter->data.device))
> +			continue;
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
> +			igt_list_add(&dup->link, &igt_devs.filtered);
> +		} else
> +			card--;
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
> @@ -1750,6 +1802,12 @@ static struct filter_class filter_definition_list[] = {
>  		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
>  		.detail = "find pf or vf\n",
>  	},
> +	{
> +		.name = "device",
> +		.filter_function = filter_device,
> +		.help = "device:[driver=name][,device=type][,card=%d]",

.help = "device:[driver=name][,device=type][,card=%d|all]",

--
Zbigniew

> +		.detail = "find device by driver name, device type and card number\n",
> +	},
>  	{
>  		.name = NULL,
>  	},
> -- 
> 2.34.1
> 
