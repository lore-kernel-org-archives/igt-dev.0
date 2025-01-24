Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF489C0218C
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 16:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982BD10E9E7;
	Fri, 24 Jan 2025 16:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fx/7nUv1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEBE10E9E7
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737736002; x=1769272002;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G3wKtMj/W1FaenWmPoI09sk5xGyUtp0cvvbgeh6ov1E=;
 b=fx/7nUv1zH//+dNNFmcAJ9mrtz2ziFzQH0udTUgJdIHxQmMK4/iQwiF/
 vziOLZUhPDT3IvNlmIqe96cxGAg3w/JB2oDUl74WyO7acEO29TvPEiuVM
 0T++rOEGl16qGVoPcdKJo+szTzRhkPCBAQNXM5lqUP9tZk7ravf8U0hvU
 kpjz4VUeHkIrtZzMaPbdaoptJhAb5O496gsu1HLwRIITbmt1QVIzmJ2sU
 SpRomEGmG1E6ecRrI0xyZmbQODCktKRmkZoRw+Qa8IfxcRmkmZHjd4CsD
 4liegPV88LC977EWOg4SdFKm+ArahkVf+t8uvpTCoH3r3XUMkx99yMEH7 g==;
X-CSE-ConnectionGUID: PzQOEV3UQ5OTdy0+ud/iMg==
X-CSE-MsgGUID: 9Pto/koSQBGzcWnDuoFn4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="55688562"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="55688562"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 08:26:42 -0800
X-CSE-ConnectionGUID: suWIh6bjQCSggq8aINdKWg==
X-CSE-MsgGUID: RpXDUgF8TP2mclBqPiECrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="107721395"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 08:26:40 -0800
Date: Fri, 24 Jan 2025 17:26:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] lib/igt_device_scan: change device list
 variable visibility
Message-ID: <20250124162625.2lz3spps6vgfmie6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <20250123095208.72984-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123095208.72984-3-zbigniew.kempczynski@intel.com>
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
On 2025-01-23 at 10:52:07 +0100, Zbigniew Kempczyński wrote:

could you improve subject? something like:

lib/igt_device_scan: Fix multithreading for Xe

> In commit: 2e8f3e06fb (tests/xe_evict|exec_threads: Use fd reopen
> to avoid corrupting global data) I simply changed tests which
> corrupted device list global variable. i915 didn't use opening
> devices in multithreaded tests but this changed with xe.
> 
> Device scan is now unconditional so we may change device list
> variable visibility to TLS. With this reverting of above commit
> should be safe (but I'm not sure is it worth to do this).
> 

What about adding Fixes: tag? It is not a kernel so no strict
rules here, up to you.

> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

You forgot about:
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM so also:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_device_scan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 44b632008b..c36b0efa90 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -247,7 +247,7 @@ struct igt_device {
>  };
>  
>  /* Scanned devices */
> -static struct {
> +static __thread struct {
>  	struct igt_list_head all;
>  	struct igt_list_head filtered;
>  	bool devs_scanned;
> -- 
> 2.34.1
> 
