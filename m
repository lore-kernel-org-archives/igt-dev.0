Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28556E77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB10410EAE9;
	Wed, 18 Dec 2024 08:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvgDlqwi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE7110EAE9
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734510036; x=1766046036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IOfTPk88FrCxoLRXnv9BTgjIh1opFXLREDI8q5G9awU=;
 b=DvgDlqwi+v3VfUIQ8BN/Pxk0zar3mdNhK5b52uibGZ3s6IAvrK1KpS5N
 qkyWUHr+jgKXkcZQboP4blX0DKZJNI+W4uzNhy42r909jiI7cG8EoWYee
 16k6pwLcQ3JlIeCjzD1yy0CBR8XSqdd89xwfc57cwJgJqbi68qHR+Mo6B
 UOUwLd57bMeguZPfIuUdLWcajWb+NTpI8Q+Dpnkrtd6blhzlgHHuDOWDM
 M8V8Y2GO0QPm8FoIy6DuZ++hVT7k8uJswJfLJ6h8F4nVSUgv6XvLhD5Ot
 TxBQG/pZ+HokOnAr9mRHVMhSulLOCIPU2eERzcbBt4EVSYkGOCSNOb5uz g==;
X-CSE-ConnectionGUID: rhT4Z6elT8OHWu81fZfBNQ==
X-CSE-MsgGUID: YZG6n0ACQuW36ncoyTfQGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38649259"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="38649259"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:20:36 -0800
X-CSE-ConnectionGUID: mOEd4nelQT+5jn2UTedjDw==
X-CSE-MsgGUID: 5qZCyG87Sa6eXVn7pY8oDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="102789808"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 00:20:35 -0800
Date: Wed, 18 Dec 2024 09:20:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 4/4] lib/igt_device_scan: Fix scan vs
 bind/unbind/reload
Message-ID: <20241218082016.vfjvsnivjklsehow@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
 <20241218051324.2696557-5-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218051324.2696557-5-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-12-17 at 21:13:24 -0800, Lucas De Marchi wrote:
> There's no guarantee a card will end up with the same device node when
> modules are loaded/unloaded and drivers bound/unbound. There's some
> fundamental issue with the igt's the way it is and it's also puzzling
> from the logs it looks like the device vanished from the bus, when in
> reality is just the SW state out of sync with what the kernel is
> exporting.
> 
> Re-scanning when trying to match a device is not expensive compared to
> what most tests are doing, so simply force it to occur whenever trying
> to match a card.
> 
> Example for xe_wedged:
> 
> 	$ sudo ./build/tests/xe_wedged --device pci:0000:03:00.0 --r wedged-at-any-timeout
> 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
> 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card1 | /dev/dri/renderD129
> 
> 	... [ wedge and rebind here ]
> 
> 	(xe_wedged:11173) drmtest-DEBUG: Looking for devices to open using filter 0: pci:0000:03:00.0
> 	(xe_wedged:11173) drmtest-DEBUG: Filter matched /dev/dri/card2 | /dev/dri/renderD130

I tried to tackle this problem in patch here:
https://patchwork.freedesktop.org/patch/626243/?series=140511&rev=6
[i-g-t,v4,3/4] lib/drmtest: invalidate cached fds after unbind

so next call to drm_open_driver() will start anew, like
after test just starts.

Regards,
Kamil

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_device_scan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 8e2297087..956719fba 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1983,7 +1983,7 @@ static bool __igt_device_card_match(const char *filter,
>  	 * Scan devices in case the user hasn't yet,
>  	 * but leave a decision on forced rescan on the user side.
>  	 */
> -	igt_devices_scan(false);
> +	igt_devices_scan(true);
>  
>  	if (igt_device_filter_apply(filter) == false)
>  		return false;
> -- 
> 2.47.0
> 
