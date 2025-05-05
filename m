Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871C5C3ABAA
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 20:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ED610E337;
	Mon,  5 May 2025 20:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lg0EyMcJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A88F10E337
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746478230; x=1778014230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ApHKaoFSzL1GtBj0gg0AJ4m8jmOJLECRBysw9cg3nuE=;
 b=Lg0EyMcJoE8Ye6rKaTp00O6vJStJKjtdGz8zpA3AYSn+NSAr5QgyzqWy
 3oTa+M6hMTQmo2hvCY9beFklsU8jXa4D71v4UEo+SM+6vztQvJ64YVfR9
 u6PFpOyrCm/3bkQ6ga7uE1ivu3j9F3Y0tTGiXKLj7h/1XEU5WOcZiniN1
 24Ig4crZtzQS+tvtCXVE61RSBmSWuuOo8ay8JCtiHhhX5XVOJuhVafKx7
 RIcXLCIKZaP6FBVenQFH8VmlQXAunjV8SFZk7N0Udx1J6rECoEBa8YbYR
 8i9epv+Xrx5GbTFUP3Wmv4bvKXWjExuenf8a41NWA0uRJ2xG94vLIiJiJ Q==;
X-CSE-ConnectionGUID: cKuee5iXQu6CwB3y+KsY0Q==
X-CSE-MsgGUID: +h/zYysdRIOKHKbklbOakg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48247894"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="48247894"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 13:50:29 -0700
X-CSE-ConnectionGUID: UnjDZyuTQwS3avR6Lv9Dmw==
X-CSE-MsgGUID: OO3kCUJ/TYes14BYOfywcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="136327010"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.47])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 13:50:25 -0700
Date: Mon, 5 May 2025 22:50:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com, 
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, 
 anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v10 1/5] lib/igt_device_scan: Add support for the
 device filter
Message-ID: <xempdkhkmadbzioiwgxhzfyidr6fn2f2x5nsjvnjjaz64qlnid@reioijr7ctu6>
References: <20250430070824.3012927-1-soham.purkait@intel.com>
 <20250430070824.3012927-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430070824.3012927-2-soham.purkait@intel.com>
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

On Wed, Apr 30, 2025 at 12:38:20PM +0530, Soham Purkait wrote:
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
> v8 : Fix for card filter output. (Zbigniew)
> 
> v10 : Fix render node issue with 'subsystem' filter
>       option.                    (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

Drop history and for this patch pick my:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/igt_device_scan.c | 79 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 3f26a1737..3c36ca3f2 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1434,6 +1434,7 @@ struct filter {
>  		char *driver;
>  		char *pf;
>  		char *vf;
> +		char *subsystem;
>  	} data;
>  };
>  
> @@ -1453,6 +1454,7 @@ static void fill_filter_data(struct filter *filter, const char *key, const char
>  	__fill_key(driver);
>  	__fill_key(pf);
>  	__fill_key(vf);
> +	__fill_key(subsystem);
>  #undef __fill_key
>  
>  }
> @@ -1709,6 +1711,76 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
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
> +	if (filter->data.card) {
> +		char crdop[5] = {0};
> +
> +		if (sscanf(filter->data.card, "%d", &card) == 1) {
> +			if (card < 0)
> +				return &igt_devs.filtered;
> +		} else {
> +			card = 0;
> +			if (sscanf(filter->data.card, "%4s", crdop) == 1) {
> +				if (!strcmp(crdop, "all"))
> +					allcards = true;
> +				else
> +					return &igt_devs.filtered;
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
> +		if (filter->data.subsystem && strcmp(filter->data.subsystem, "all")) {
> +			if (strcmp(filter->data.subsystem, get_prop_subsystem(dev)))
> +				continue;
> +		}
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
> @@ -1750,6 +1822,13 @@ static struct filter_class filter_definition_list[] = {
>  		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
>  		.detail = "find pf or vf\n",
>  	},
> +	{
> +		.name = "device",
> +		.filter_function = filter_device,
> +		.help =
> +		"device:[driver=name][,subsystem=all|<subsystem>][,device=type][,card=%d|all]",
> +		.detail = "find device by driver name, subsystem, device type and card number\n",
> +	},
>  	{
>  		.name = NULL,
>  	},
> -- 
> 2.34.1
> 
