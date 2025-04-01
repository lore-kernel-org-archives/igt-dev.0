Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3448AC36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 19:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D927010E0F0;
	Tue,  1 Apr 2025 19:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0TLWeyB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CD610E0F0
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 19:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743534541; x=1775070541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/ujBOMDbG3J4Exa7u/yrxOj+B6tRTkBIT3lbbvuT4CY=;
 b=L0TLWeyBTkkJYdTfpOkPo9otS85qJZdTR0PIvQCiUqOPRFHmi7JlId2o
 Vwk+1zA+txf3l19Kly5anARPMDkYDugGlmV36IRPWw3m0j94sR3qiOnKO
 SzTJrD/RIFfUrL65Azw+AXinXeUrJhSubrbGlPjraTr4mB3uFnwDAD3ie
 6cH3Ir9fH4kMQZBtGbukxK9vbbjjEXcjhlpW0PZdhR9coCzxopQzDNBLd
 yF79NmKIYXaFl2NZ3cVjKBLpSz+hknezg5i+AF6NunB+pkRSoBk3cPm4K
 bbE2G833C9ZleBNtJkdxiTYwnur4eTEv+exRjFOEP7fRJ5xpqS1+jZwA2 A==;
X-CSE-ConnectionGUID: QkpVWdF4TuKr1Mt1Gv7hCg==
X-CSE-MsgGUID: jWJME9c6RL6Gdd47ck5XUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44126674"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="44126674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:09:01 -0700
X-CSE-ConnectionGUID: P2KQhhE6QRGVLb8BeRIEEA==
X-CSE-MsgGUID: kruo3epUR8m+WdTyOG5s6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="126455579"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.192])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:08:59 -0700
Date: Tue, 1 Apr 2025 21:08:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v4 1/5] lib/intel_blt: Promote MEM_COPY_MOCS_SHIFT
Message-ID: <20250401190856.g44pgcoyuoil36ux@zkempczy-mobl2>
References: <20250401140510.38142-1-francois.dugast@intel.com>
 <20250401140510.38142-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401140510.38142-2-francois.dugast@intel.com>
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

On Tue, Apr 01, 2025 at 04:00:56PM +0200, Francois Dugast wrote:
> Move MEM_COPY_MOCS_SHIFT to the header to use it elsewhere without code
> duplication.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_blt.c | 1 -
>  lib/intel_blt.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index b2fb3151e..16e395c8f 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -21,7 +21,6 @@
>  
>  #define BITRANGE(start, end) (end - start + 1)
>  #define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
> -#define MEM_COPY_MOCS_SHIFT                     25
>  
>  /* Blitter tiling definitions sanity checks */
>  static_assert(T_LINEAR == I915_TILING_NONE, "Linear definitions have to match");
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 5d6191ac9..d0ee4172d 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -53,6 +53,7 @@
>  #include "intel_cmds_info.h"
>  
>  #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
> +#define MEM_COPY_MOCS_SHIFT                     25

I wondered to rename to XE2_MEM_COPY_MOCS_SHIFT to make it clear
and distinct from other gpus. But I won't oppose if you keep it
as it is.

--
Zbigniew

>  
>  enum blt_color_depth {
>  	CD_8bit,
> -- 
> 2.43.0
> 
