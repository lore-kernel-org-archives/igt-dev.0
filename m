Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D70C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 07:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2D710E9C1;
	Fri, 11 Jul 2025 07:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnLpSBvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AB410E9C1
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 07:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752220235; x=1783756235;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+2VjXwS+/q5/dRsXGrxBftC38HTokFBekbYkBF2CCXI=;
 b=UnLpSBvsUb0sGlwl4hgmLJ45VSYYt5BtkHloi031b6XpaZdbzrr24A+5
 l5JegvnGlpILg3eMHeThXGONf6msfoqyxJIzNvTLzShkUhhIGuAWpTtij
 O8sB8ku1JUUkohuIgi0ccUh4V5d6OI9IoGzVHSlWpkaZGXFzWUISZ+no/
 bgicGH/RLrLBLXBfVszmwg+ELZNnfRUCgBxjHaTyAQ7zpKsGSrhovj2ZX
 p8xoO+31Jzvu27LOR2GNR2p2UNm/qoZB2l8taw9Bgzfxg8glJhMpvVmr0
 GwWfwGOBuB6HJlvbRZTt14gAVLcZZIKVfMEJ9WqgAR3jjcPhJ8Kblwitu g==;
X-CSE-ConnectionGUID: dzyc+1UuRm2AgvgYR0praQ==
X-CSE-MsgGUID: LkEokVEBSvus+tYuGm/GOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79947591"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="79947591"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:50:35 -0700
X-CSE-ConnectionGUID: zSmwyxwgRjuJIJ0WgNBJZA==
X-CSE-MsgGUID: ulUxq9VQT8GmE4lrykWFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="180005998"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:50:34 -0700
Message-ID: <20151409-d7d7-4517-ad96-8f65d54f749e@linux.intel.com>
Date: Fri, 11 Jul 2025 09:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: Update igt_fit_modes_in_bw to add
 legacy commit check
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com
References: <20250710194643.977386-1-karthik.b.s@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250710194643.977386-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Karthik,

On 7/10/2025 9:46 PM, Karthik B S wrote:
> Currently igt_fit_modes_in_bw is only checking for atomic commit but the
> igt_override_all_active_output_modes_to_fit_bw function which it is
> wrapping actually has support for legacy commit as well.
> 
> To handle this, add support for legacy commit check as well.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  lib/igt_kms.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 84ba1635c..7dee8ab2c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5061,9 +5061,13 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
>  {
>  	int ret;
>  
> -	ret = igt_display_try_commit_atomic(display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (display->is_atomic)
> +		ret = igt_display_try_commit_atomic(display,
> +						    DRM_MODE_ATOMIC_TEST_ONLY |
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	else
> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
> +
>  	if (ret != 0) {
>  		bool found;
>  

I guess the function description needs attention. Currently it is "Tries
atomic TEST_ONLY commit; if it fails, overrides output modes to fit
bandwidth."

Now that it also tries the COMMIT_LEGACY, what about:

"Attempts to commit the current display configuration. For atomic
displays, performs an atomic TEST_ONLY commit; for legacy non-atomic
displays, performs a legacy commit. If the commit fails, attempts to
override all active output modes to fit within available bandwidth."

Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
