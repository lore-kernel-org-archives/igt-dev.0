Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96BACD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 15:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAE210E265;
	Wed, 27 May 2026 15:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATPV1ktS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31F110E265
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779895931; x=1811431931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xzV4GSGPYwyIEk0yBJnZhwJ25A+Cev16WXdUFJ/gxA0=;
 b=ATPV1ktSIs3v1nnuQj4nESquzaovgnYzu4yz5+SUvz1+3FJp9MnwMuYc
 wRwGH6geftu94ynsXxGJkLsqj9MsQwiVLB9lh5Hm4tPqppfBZyehcWoNv
 90lgOTDb7QRVk7xHsu7QpfV/7S05adMB/n33TEVuqjPs34UyOc5x9+Hdf
 EXsfAZ0VE/C4gktxNg4lKMf+Bgwu3FJDHazfQi1HX3W/M/DiLI55mLAxZ
 gaWvCvyofJiOLgS7Q26LCa5PPw2o3s7O7MlBA+czXYB15l/d6Sc42czth
 diOeY2wX6+XwwKDxuqqveYm1Lz9lxCJbR0M6c0bQOmpHzs02sAK/DDZyo Q==;
X-CSE-ConnectionGUID: +9ze4Cq2Rim2RRltovkABQ==
X-CSE-MsgGUID: 6YO0DCVzS+qb1kn3krMBWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84354720"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="84354720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:32:10 -0700
X-CSE-ConnectionGUID: lyLiZrPbRn6mPKgTyw/W5w==
X-CSE-MsgGUID: Z7n71IbIRnyl3DmSvE6d3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="272610291"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 08:32:10 -0700
Date: Wed, 27 May 2026 17:32:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, jia.yao@intel.com, x.wang@intel.com
Subject: Re: [PATCH 2/3] tests/intel/xe_pat: drop redundant manual srand
 initialization
Message-ID: <20260527153206.in32utcmyrra22g7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org,
 jia.yao@intel.com, x.wang@intel.com
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <20260511233622.2074382-3-zongyao.bai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511233622.2074382-3-zongyao.bai@intel.com>
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
On 2026-05-11 at 23:36:21 +0000, Zongyao Bai wrote:
> Remove manual seed initialization and srand() call from igt_fixture().
> The IGT framework already handles random seed initialization via igt_srandom()

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel/xe_pat.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index e53e08877..79f9a87aa 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -2213,15 +2213,8 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  	int fd;
>  
>  	igt_fixture() {
> -		uint32_t seed;
> -
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
