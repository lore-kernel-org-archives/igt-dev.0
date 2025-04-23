Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A498FC369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 06:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4174410E3FD;
	Wed, 23 Apr 2025 06:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/qxV4k1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4300510E3FD
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 06:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745389876; x=1776925876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0ZSGHCtkAOZ8mN1JALAbZsFtlpumMI6qpJ7pTbKXZq4=;
 b=a/qxV4k1Unm/oUUa7oNtZyGSC4l6PP9AdcOkhl5zDzLdEHIlRllCEXGz
 VBPNUAwU74oIOJRXJTOWbPOV757w4ReN1U9PAJfbE/wRoib7NG8FOrgcr
 rvX4lPb/5yLue1Yvp80VFeB0e0lsPqZeqV6dVo5BQe26hAVqzhlSB0Nyp
 GLuvCTSDE6bVBFg58IAUxBZbadcd3RYYNDigGe2XjyRx1fGPGL/Pp5dpe
 +VhBKi7v8Rpz0c/hERlqO9KJ/IYFc4tY+ogPwIUp7I9kpleGGufd3pbia
 8iyGm4O+4OSdlDYT2gxtxVQLRfa5gN0Jev4e5HiWywpDsBkaO3fxj5vn5 A==;
X-CSE-ConnectionGUID: 3rBd3pEkRLWp2U5qtmNk8A==
X-CSE-MsgGUID: y0OFbo1CR0OqChbEDPWI4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46203905"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46203905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 23:31:16 -0700
X-CSE-ConnectionGUID: swlUWQg+SZ226CdUbPYpzg==
X-CSE-MsgGUID: 7Vm0MWHqTnC+MpdRxk/z5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="163185837"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 23:31:12 -0700
Date: Wed, 23 Apr 2025 08:31:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v9 1/5] lib/igt_device_scan: Add support for the
 device filter
Message-ID: <20250423063109.gadkamns7yzcgy6e@zkempczy-mobl2>
References: <20250422171108.2170758-1-soham.purkait@intel.com>
 <20250422171108.2170758-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422171108.2170758-2-soham.purkait@intel.com>
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

On Tue, Apr 22, 2025 at 10:41:04PM +0530, Soham Purkait wrote:
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
> v9 : Render node enabled with 'device:' option
>      through iterating only pci subsystem
>      devices in filter.          (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/igt_device_scan.c | 74 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 3f26a1737..8859b9489 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1709,6 +1709,74 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
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
> +		if (!is_pci_subsystem(dev))
> +			continue;

For 'device' filter this condition should be removed. You contain
'subsystem' field in igt_device_card so you may skip cards which
are not pci on populate_devices().

> +
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
> @@ -1750,6 +1818,12 @@ static struct filter_class filter_definition_list[] = {
>  		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
>  		.detail = "find pf or vf\n",
>  	},
> +	{
> +		.name = "device",
> +		.filter_function = filter_device,
> +		.help = "device:[driver=name][,device=type][,card=%d|all]",

Or you may add 'bus=pci' in 'device:[driver=name][,bus=all(default)|pci|nonpci][,device=type][,card=all]'

and then use filter in gputop.c:

device:bus=pci,card=all

Another alternative is to fix 'pci' filter to collect all devices
like 'device' filter is doing now.

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
