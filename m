Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A0CCAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 12:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B0710E2C7;
	Thu, 25 Sep 2025 12:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clJBDYkH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF24310E2C7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 12:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758804127; x=1790340127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0wBGYwP+xOdmAQuvWqGjr/GusWSTfMdm9kwBpMfxp/Q=;
 b=clJBDYkHDw92cVTtZaSr+mkddBzxeXy6RwY8VlXbrAfsyaraaAn/Zlrv
 i0CLt5qo5KF+nzVZ+Ai6e82tYS+F4sQmYpYHC8c8qt5SVyDvdg/p23wMy
 cYUXvtZqzlJcIZNMdVV1EjPS95595fWt9pLSFdFV5ol+F+uLZM3cFK5KE
 rgdAuevJbqLydTC+xgLRe93i2blKyNzDNO5LqJgW89TDOyrBXC2O7lEHl
 YTpOLsDIJ5CjRDOYVir1QDg6yM6HKsHuseaLLJ0Vk9jJYm1Q9DnsKZ3Dn
 vCflWTmIzLIJBbdG/ZhdjE+xchzoQL4/W39BryNc/1eAY08dscfaqq+Mn w==;
X-CSE-ConnectionGUID: zLWPZ1MfSIeA9/+6e6bGGQ==
X-CSE-MsgGUID: pIVCgKyZRAK82h9ED0nhnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60819474"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="60819474"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:42:06 -0700
X-CSE-ConnectionGUID: pcirNgMiT22dxXmXdC4AMw==
X-CSE-MsgGUID: VW1L8R60TCmC7EsT6CrJ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="181330309"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 05:42:05 -0700
Date: Thu, 25 Sep 2025 14:41:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tools/lsgpu: iterate over all matching devices
Message-ID: <20250925124148.lohnirhf3gruqg35@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
References: <20250925091847.134577-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925091847.134577-2-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2025-09-25 at 11:18:48 +0200, Zbigniew Kempczyński wrote:
> At the moment only 'device:' filter allows to collect all matching
> cards in the igt_devs.filtered view. Before this filter was introduced
> we were mostly using 'pci:' which doesn't allow to put 'card=all'
> and filter out all matching devices. Another limitation was in lsgpu,

I am not sure but 'filter out' seams a little off, what about s/out//
or s/filter out/fill in/

> which allows to display only single matching device.
> 
> Add loop around all matching cards and try to open them in lsgpu.
> This allows testing filters which supports 'card=all' argument.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I got strange results with 'Cannot open' prints, is this intended?

-------------------------------------------
Device detail:
subsystem   : drm
drm card    : 
drm render  : /dev/dri/renderD128
Cannot open card device, empty name
Device /dev/dri/renderD128 successfully opened
-------------------------------------------
Device detail:
subsystem   : drm
drm card    : /dev/dri/card1
drm render  : 
Device /dev/dri/card1 successfully opened
Cannot open render device, empty name
-------------------------------------------

imho this should be combined:
-------------------------------------------
Device detail:
subsystem   : drm
drm card    : /dev/dri/card1
drm render  : /dev/dri/renderD128
-------------------------------------------

btw do we need info about un/successfull open?

Regards,
Kamil

> ---
>  tools/lsgpu.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index 6cfbf31420..935371dea5 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -369,28 +369,32 @@ int main(int argc, char *argv[])
>  	igt_devices_scan_all_attrs();
>  
>  	if (igt_device != NULL) {
> -		struct igt_device_card card;
> +		struct igt_device_card *cards;
> +		int matched;
>  
>  		printf("=== Device filter ===\n");
>  		printf("%s\n\n", igt_device);
>  
>  		printf("=== Testing device open ===\n");
>  
> -		if (!igt_device_card_match(igt_device, &card)) {
> +		matched = igt_device_card_match_all(igt_device, &cards);
> +		if (!matched) {
>  			printf("No device found for the filter\n\n");
>  			ret = -1;
>  			goto out;
>  		}
>  
> -		printf("Device detail:\n");
> -		print_card(&card);
> -		test_device_open(&card);
> -		if (fmt.type == IGT_PRINT_DETAIL) {
> -			printf("\n");
> -			igt_devices_print(&fmt);
> +		for (int i = 0; i < matched; i++) {
> +			printf("Device detail:\n");
> +			print_card(&cards[i]);
> +			test_device_open(&cards[i]);
> +			if (fmt.type == IGT_PRINT_DETAIL) {
> +				printf("\n");
> +				igt_devices_print(&fmt);
> +			}
> +			printf("-------------------------------------------\n");
>  		}
> -		printf("-------------------------------------------\n");
> -
> +		free(cards);
>  	} else {
>  		igt_devices_print(&fmt);
>  	}
> -- 
> 2.43.0
> 
