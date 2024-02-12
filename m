Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA44C4829B
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 14:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EB410E126;
	Mon, 12 Feb 2024 14:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4KDVrN/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABB910E126
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2024 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707746701; x=1739282701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mdWpYSaxxoEQLPvI++INZemKQCMv5pr8HH/HNBtMh8s=;
 b=Z4KDVrN/CryUtklZbCYIkBaBsh7JYfjaH0qrl/hR0DOy1KIJh5h47og7
 BaNHV+Uik+W7uAJ7RT9SIhuUXDPMsykzqPaSpYtfWvD2YfkICfSRJQh9a
 iCbAhRrM9dv3ipmy6nLtKG4UV98Q0oHK99MlEtTfMcIY+ajhzuZW25Ii5
 1zjNyH8P/6StD8AJZJPf2b92F7Kx0jeqiNzcErM+SBAUvwAacPmUHDMHd
 fCsMhLU65yU6QdOXpHQ3vWtEXrPZRcbgbQvY4Ud79ePwifCvRHbAZTcXt
 unukuGMd5aw3dg+HpwZm0Mr6gNy7gcCKRx9EWccPxc9hk05nMk74kyV1O g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="13105724"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="13105724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="7250684"
Received: from unknown (HELO localhost) ([10.245.86.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:04:15 -0800
Date: Mon, 12 Feb 2024 15:04:12 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/8] lib/intel_bufops: repurpose
 intel_buf_create_using_handle_and_size()
Message-ID: <20240212140412.jbioewe7vu3aqha3@zkempczy-mobl2>
References: <20240209183433.375099-1-matthew.auld@intel.com>
 <20240209183433.375099-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240209183433.375099-3-matthew.auld@intel.com>
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

On Fri, Feb 09, 2024 at 06:34:28PM +0000, Matthew Auld wrote:
> From an api pov user this should be the same as intel_buf_create, except
> with existing buffer handle and bo_size. There are no current users for
> this, but in upcoming patch we will remove
> intel_buf_create_using_handle() and convert all users over to this api,
> such that we don't have to guess the bo_size deep in the lib code.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_bufops.c | 6 +++---
>  lib/intel_bufops.h | 3 +--
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 46eba3fb4..a299cdba7 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1120,6 +1120,7 @@ struct intel_buf *intel_buf_create(struct buf_ops *bops,
>   * @alignment: alignment of the stride for linear surfaces
>   * @tiling: surface tiling
>   * @compression: surface compression type
> + * @size: real bo size
>   *
>   * Function creates intel_buf with passed BO handle from the caller. Doesn't
>   * take ownership of the buffer. close()/destroy() paths doesn't close
> @@ -1151,11 +1152,10 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
>  							 int bpp, int alignment,
>  							 uint32_t req_tiling,
>  							 uint32_t compression,
> -							 uint64_t size,
> -							 int stride)
> +							 uint64_t size)
>  {
>  	return intel_buf_create_full(bops, handle, width, height, bpp, alignment,
> -				     req_tiling, compression, size, stride, -1,
> +				     req_tiling, compression, size, 0, -1,

I'm going to add some render-copy tests which exercise different
buffer sizes but I need to find out what changes I'll need here.
So that's not blocking your change and you may add:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
>  				     DEFAULT_PAT_INDEX);
>  }
>  
> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> index b6048402b..54a143c5b 100644
> --- a/lib/intel_bufops.h
> +++ b/lib/intel_bufops.h
> @@ -185,8 +185,7 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
>  							 int bpp, int alignment,
>  							 uint32_t req_tiling,
>  							 uint32_t compression,
> -							 uint64_t size,
> -							 int stride);
> +							 uint64_t size);
>  
>  struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
>  					uint32_t handle,
> -- 
> 2.43.0
> 
