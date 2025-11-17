Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C7CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 17:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BF510E105;
	Mon, 17 Nov 2025 17:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brqWKdCY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD5610E105
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763399737; x=1794935737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j7sPR6vWgz1lx/23zU+WGa123LakF67LseKwloJiIZM=;
 b=brqWKdCYedjSbFThZhe6FQCbf4DplAO+EMgrWKjiqmbtGTsZDqtsAUVy
 lAsyn44R1grNePk/xTJSZXCnkvDfUIRKiowiierG0cmYE1wVZKoCN7U1B
 7578kxsz1+Ar2bnB9VBtFsTRaLFzpaLNY3RFqx0pFhuehEEjlzognopap
 GzHWtUHCw24EpmUCKuSc5pPxCYXpwd9+calDhHHLZTM4AEu7bz2WxbR8b
 ofu9i3IUBHxUPDj2Xf5KmGEw+TeoXWBsGXSpR3sLsG6I13RRarxljFPs4
 NEckjhec9S7xBF+BwlJtk0nOsgSNdhQCKGs8z7YhTO4BPKOBi+b4O+RH9 Q==;
X-CSE-ConnectionGUID: xKKQb7JRTPG19GMASEh/AA==
X-CSE-MsgGUID: BVG2J8W4Si+dz6Mj8vSCGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90883026"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="90883026"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 09:15:36 -0800
X-CSE-ConnectionGUID: bOUrGShtQ1unW48ggJwGiQ==
X-CSE-MsgGUID: YnoFWiB/T+6tzd2JcyfEuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="221162638"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 09:15:36 -0800
Date: Mon, 17 Nov 2025 18:15:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Xin Wang <x.wang@intel.com>
Subject: Re: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
Message-ID: <20251117171520.mbh7upuhlud4eqd4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Xin Wang <x.wang@intel.com>
References: <20251115011730.3700391-1-zongyao.bai@intel.com>
 <20251115011730.3700391-2-zongyao.bai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251115011730.3700391-2-zongyao.bai@intel.com>
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

Hi Zongyao,
On 2025-11-15 at 01:17:29 +0000, Zongyao Bai wrote:
> For consistency with the igt framework, use igt_srandom() to generate
> random seed instead of srand().
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel/xe_pat.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 59dfb6b11..54bedefbb 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -1161,15 +1161,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  	int fd;
>  
>  	igt_fixture {
> -		uint32_t seed;
> -
> +		igt_srandom();

You could also remove this line, it is done by igt_core at
initialization so no need for repeating it here.

Regards,
Kamil

>  		fd = drm_open_driver(DRIVER_XE);
>  		dev_id = intel_get_drm_devid(fd);
> -
> -		seed = time(NULL);
> -		srand(seed);
> -		igt_debug("seed: %d\n", seed);
> -
>  		xe_device_get(fd);
>  	}
>  
> -- 
> 2.43.0
> 
