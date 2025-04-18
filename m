Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F98CC369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 07:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D703510EB86;
	Fri, 18 Apr 2025 07:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Waqen0fi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD5310EB86
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744963026; x=1776499026;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7gO7H9Qa5eu+DgxbOfZduoxMpXiYDcW7k7taQWMpvtY=;
 b=Waqen0fi26GX8Vg8Bt38tzAUL2RANEl/lbR6QaHvY+q5F9SuZrSjRzta
 Fa56gtxMMBDTAaHG2EYtqNMy1QbYSh9ygoSR5W/Iz0kDA2kjkz+JnqyBB
 hduatEwpfQxJcvWlDExT3pcggklXcN/ZXTOFv6ss2CYQo8hnhiSCmvW0q
 GG9cBej3eXxGSBPYPebs5Hf97LKEPHi5/Tv2DUODO/rEaLVlYq6kdJ79V
 7ZjgjHu7DXGgX1c9oEixjIBY3UrsbKCNDLG6WGmr7zf9ELpwqfumixByx
 8HmH5f6m8xhC2r7ZWBCrF0zYP8z2fApId4zyG7i+Ng5SqrZ+73KzeSUtv g==;
X-CSE-ConnectionGUID: 7ztgiof7S9Kf4hvQl2Nr7w==
X-CSE-MsgGUID: Ig3TTrDBQVqPpc8Njhgnng==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="45823460"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="45823460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 00:56:53 -0700
X-CSE-ConnectionGUID: LD5EFh5fRsCC/TZVuvlB6Q==
X-CSE-MsgGUID: vXDI4jilSm6lyW2b9CoIUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="135904286"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.208])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 00:56:49 -0700
Date: Fri, 18 Apr 2025 09:56:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v8 1/5] lib/igt_device_scan: Add support for the
 device filter
Message-ID: <20250418075646.dsongvgol3cl7pjb@zkempczy-mobl2>
References: <20250417135941.2083761-1-soham.purkait@intel.com>
 <20250417135941.2083761-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417135941.2083761-2-soham.purkait@intel.com>
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

On Thu, Apr 17, 2025 at 07:29:37PM +0530, Soham Purkait wrote:
> Add support for the device filter based on
> driver string, device type (integrated or discrete)
> and card number.
> 
> v5 : Add device filter to filter out
>      matching devices.           (Zbigniew)
> 
> v6 : Move device filter with Separate
>      commit.                     (Zbigniew)
> 
> v7 : Fix interpretation of card numbering
>      and add 'all' option for all the cards.
>                                  (Zbigniew)
> 
> v8 : Fix for card filter output. (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

This filter still doesn't behave as I expect (lsgpu -d device:
doesn't open render node). List of device filter examples and
their results are:

1. device:card=all
   collects all drm devices

2. device:driver=xe,card=all
   collects all drm devices for xe driver

3. device:driver=xe
   picks first (implicit card=0) device of xe driver

4. device:driver=xe,card=1
   picks second (explicit card=0) device of xe driver

device=type stays as it is.

With your igt_device_card_match_all() we may extend lsgpu
to handle multiple cards (currently it is limited to open
first one).

In the review of 5/5 (gputop) I put 'device:' filter for
populate_devices(), but it should be 'device:card=all'.

--
Zbigniew

> ---
>  lib/igt_device_scan.c | 71 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 3f26a1737..3dbe06812 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1709,6 +1709,71 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
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
> @@ -1750,6 +1815,12 @@ static struct filter_class filter_definition_list[] = {
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
