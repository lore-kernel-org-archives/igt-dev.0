Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3548EC3ABB6
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 20:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBBE10E337;
	Mon,  5 May 2025 20:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2Juuw6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBFD10E337
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746478267; x=1778014267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5u0DXLcQRqBiHYGbK/6z7UEEJJlgrlx7DxKUhSEZb5U=;
 b=T2Juuw6PUChFrFzNTMcR7CyAy6C3U44s0/VOWjVu2taNCx4aQMVUw5cN
 uSFNhdEeD3MdNnhGZlKaj+MXFxPbGMQC3GlksaItTYA8nwd8jXoNvaCet
 6pgfTpBhH/AtUFpFqHr8erhl6955NBAl+fsz28UwatAlLBVANJVL1fKu5
 PSPwLE1b9V1YOgi2SRi4DPs/z/q3IKccEiI5F0b4sTpv8kr1iRLZRIn4F
 d0ZdLyFHMUI0obl0/UIwe3SpA158mc98aEBvUzIODheijhwxQFhWxpZmf
 KhBGyqmI65zuEKUqoyNLXRf4lVAx0tAFbMxDrCZcHTcANCpaXdmkImOS/ w==;
X-CSE-ConnectionGUID: gx8G45SFSxSak4AeVkDxtw==
X-CSE-MsgGUID: cgqHMdcISqa7yCmwvUCQXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="58769087"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="58769087"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 13:51:02 -0700
X-CSE-ConnectionGUID: +6/DTm9TRFSrSW7In7dpdw==
X-CSE-MsgGUID: V0LUTbjQRAS6trRe+wN6aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="139397550"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.47])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 13:50:59 -0700
Date: Mon, 5 May 2025 22:50:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com, 
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, 
 anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com, 
 ashutosh.dixit@intel.com
Subject: Re: [PATCH i-g-t v10 2/5] lib/igt_device_scan: Enable finding all
 matched IGT devices
Message-ID: <ft2rlltt3cvzk5njhla2pypvlxzyk4ps3f7ayab6okdm3bdjrw@zun3jgpqnlut>
References: <20250430070824.3012927-1-soham.purkait@intel.com>
 <20250430070824.3012927-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430070824.3012927-3-soham.purkait@intel.com>
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

On Wed, Apr 30, 2025 at 12:38:21PM +0530, Soham Purkait wrote:
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
> v9 : Fixed allocation in card match instead of
>      multiple realloc.            (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h |  1 +
>  2 files changed, 49 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 3c36ca3f2..949fff461 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -2142,6 +2142,54 @@ bool igt_device_card_match_pci(const char *filter,
>         return __igt_device_card_match(filter, card, true);
>  }
>  
> +/**
> + * igt_device_card_match_all
> + * @filter: filter string.
> + * @card: double pointer to igt_device_card structure, containing
> + * an array of igt_device_card structures upon successful return.
> + *
> + * Function applies filter to match device from device array.
> + *
> + * Returns: the number of cards found.
> + *
> + * Note: The caller is responsible for freeing the memory which is
> + * dynamically allocated for the array of igt_device_card structures
> + * upon successful return.
> + */
> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card)
> +{
> +	struct igt_device *dev = NULL;
> +	struct igt_device_card *crd = NULL;
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
> +		count++;
> +	}
> +
> +	crd = calloc(count, sizeof(struct igt_device_card));
> +	if (!crd)
> +		return 0;
> +
> +	count = 0;
> +
> +	igt_list_for_each_entry(dev, &igt_devs.filtered, link) {
> +		__copy_dev_to_card(dev, crd + count++);
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
> index f1cd3b1e9..e6e31e799 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -89,6 +89,7 @@ int igt_device_filter_pci(void);
>  bool igt_device_card_match(const char *filter, struct igt_device_card *card);
>  bool igt_device_card_match_pci(const char *filter,
>  	struct igt_device_card *card);
> +int igt_device_card_match_all(const char *filter, struct igt_device_card **card);
>  bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>  bool igt_device_find_integrated_card(struct igt_device_card *card);
>  bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
> -- 
> 2.34.1
> 
