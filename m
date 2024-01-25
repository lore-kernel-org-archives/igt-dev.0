Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632CAC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 06:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5FD10F190;
	Thu, 25 Jan 2024 06:13:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9115210F190
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 06:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706163184; x=1737699184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7NnsUIFr4w7T2k4rlHCxlJDi5uoO36cdUxzq4MYFG6U=;
 b=Wxqs5FvCYiLWrGszVzBNCA5yWqZBbRzWYhL5hhhEPT/76tNM6Pw7rXum
 N/lZuOHuuiHjk7O2NrGyszq2+Yf80zLnwPvpw54jp2K2AwjWj9Pjq8Qq/
 bqxNGqXm+h0RpyXdKfC6Ebvr8v3LpmLoZubLxORjxiB6XjMIqdmtIrvAv
 poRkS4PVfe6h9sNEw6Evb+S3g1DENC7P3raOIBfBFrnr0a/meyzM7BGli
 eqVY274PJRBDTg4p8XSs5cv+d2iM0OlgsOvITEAQolckiqeM6bNzopysv
 GH0mzjp4/MQEZmqyVtrekfShk+hxQQWSIw7dlGpNcMiUQeobiEy1g1ZKV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1945839"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1945839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929916828"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="929916828"
Received: from unknown (HELO localhost) ([10.246.28.142])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:12:59 -0800
Date: Thu, 25 Jan 2024 07:12:56 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 4/5] lib/igt_fb: use xe_bb_size() helper
Message-ID: <20240125061256.ghxespdpq4tuyuil@zkempczy-mobl2>
References: <20240124180713.268843-1-matthew.auld@intel.com>
 <20240124180713.268843-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124180713.268843-4-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 06:07:12PM +0000, Matthew Auld wrote:
> No need to open code this anymore.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_fb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 2cf94013e..71c220a08 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2906,8 +2906,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
>  						 INTEL_ALLOCATOR_SIMPLE,
>  						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>  
> -		bb_size = ALIGN(bb_size + xe_cs_prefetch_size(dst_fb->fd),
> -				xe_get_default_alignment(dst_fb->fd));
> +		bb_size = xe_bb_size(dst_fb->fd, bb_size);
>  		xe_bb = xe_bo_create(dst_fb->fd, 0, bb_size, mem_region, 0);
>  	}
>  
> -- 
> 2.43.0
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
