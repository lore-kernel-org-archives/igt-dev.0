Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC62CAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 18:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9975710E47B;
	Mon, 29 Sep 2025 18:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6yGztsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3193A10E47B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 18:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759169946; x=1790705946;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1Qa40reDQUAZv/jxO52RiBYc/8cMK6KUI5MYh+rbNeg=;
 b=N6yGztsWyOy6Fxtx7c9BU7/NG7NB1vQGYU/zg1CiiJFMiSlRCHQdSSi2
 bzmndouaXGyqo9UVWZmtTg/ZlHnVhlxlhL3FboxSSaQz+NV9VBeTQLrrD
 C7Pso/GBNlRMF7//PN79XNfVf/MKiEhw+t+4d4IVkDLVL+HaPQaUPK8ZA
 KWAWhVHTQBOIxSx1UWpDkUWWojl4KRg9GWCyCG3Kopa4LF1IGlTEDmGCI
 /1TvyWhbbCQbKJNqSAYFuRcNMNfS6gHz9DiuOR3h/V7Oh73zHzRDLS1hr
 4xetKMY+S6XVuT2Cpcj/8mmHOYhBnllOzJRNQJJimQOkFinVWgHT9TvIu A==;
X-CSE-ConnectionGUID: 6SKcSAqGRUSudK2ll/7TPQ==
X-CSE-MsgGUID: u2T8ygmbTzOW5e6C2qeUkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65274439"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="65274439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 11:19:06 -0700
X-CSE-ConnectionGUID: xPqdQoYiRN6Gtqh0gpW+zg==
X-CSE-MsgGUID: bIxkt7f+SMiSuVJRM8jt8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="182586357"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 11:19:03 -0700
Date: Mon, 29 Sep 2025 20:19:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t v8 2/2] lib/intel_compute: Adjust long kernel usage
 for WMTP
Message-ID: <eiofxu35r2d6ao3ewxovff4rku2auzhmvbxtiqjuvlxujxeisr@f7tgwybzdsrq>
References: <20250925113705.414943-1-sobin.thomas@intel.com>
 <20250925113705.414943-3-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925113705.414943-3-sobin.thomas@intel.com>
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

On Thu, Sep 25, 2025 at 11:36:59AM +0000, Sobin Thomas wrote:
> WMTP uses different shaders SIP and loop kernel and does not
> require a separate long_kernel; This will make long kernel test to
> be enabled or Thread group preemption tests.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  lib/intel_compute.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 89a2ff566..ce41deeca 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2133,8 +2133,6 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  
>  	if (threadgroup_preemption)
>  		long_kernel_loop_count = TGP_long_kernel_loop_count;
> -	else
> -		long_kernel_loop_count = WMTP_long_kernel_loop_count;

Remove #define in the beginning of the file as well. With this nit
addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  	for (int i = 0; i < entries; ++i)
>  		bo_dict_short[i] = bo_dict_long[i];
> -- 
> 2.51.0
> 
