Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65D8C48297
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 15:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6177310E7D6;
	Mon, 12 Feb 2024 15:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0B3tSoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECAD10E7E4
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2024 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707750389; x=1739286389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SrIVH4Hp3WdY7s/hSVOsRXL06TmajuIwA/SnRrjjp2A=;
 b=B0B3tSoIMbVgOJJmeAbCU8JdPz/MfzDYwze3thYgNpPWaepklWmSfFzV
 Mg1BCCuehfTWA3VcWZBoiIpRlL4Sg9KVxmwwwn6enWSJ5If6eeOY5TNIs
 Co/ERMTWJ6dlH46JRCqribWPaEOzE3C6O28DGkXskCMNstR4yu2i1sTyo
 W+Gs68wyGX7cxFiGttlFR9OZ/6kLEKoT4klOQAHma/iEAiR7rIwBT3JL0
 kuJR1DR8GNhuKXijZl9QQKV3AodsQ/oK8AGrLJkel3cWNfPjOHUZzYzRk
 NRZLG3E81lgdpiiZyU5f1O2QBoAI9D5ADNkja/a9hQLtTugOOkVL7CWYb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24198205"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="24198205"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:06:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2907684"
Received: from unknown (HELO localhost) ([10.245.86.45])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:06:26 -0800
Date: Mon, 12 Feb 2024 16:06:23 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 7/8] lib/intel_bufops: keep bo_size separate
Message-ID: <20240212150623.dcm73ozlidz5ndjw@zkempczy-mobl2>
References: <20240209183433.375099-1-matthew.auld@intel.com>
 <20240209183433.375099-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240209183433.375099-7-matthew.auld@intel.com>
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

On Fri, Feb 09, 2024 at 06:34:32PM +0000, Matthew Auld wrote:
> If the caller provides some bo_size, like for an existing object handle,
> then we currently trample the buf->size here, which seems quite
> inconsistent. Rather treat bo_size and size separate, just ensuring that
> bo_size is large enough.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_bufops.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 7f72f4762..2ef2c1c70 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -903,11 +903,6 @@ static void __intel_buf_init(struct buf_ops *bops,
>  		size = buf->surface[0].stride * ALIGN(height, align_h);
>  	}
>  
> -	if (bo_size > 0) {
> -		igt_assert(bo_size >= size);
> -		size = bo_size;
> -	}
> -
>  	/* Store buffer size to avoid mistakes in calculating it again */
>  	buf->size = size;
>  	buf->handle = handle;
> @@ -918,17 +913,22 @@ static void __intel_buf_init(struct buf_ops *bops,
>  	buf->region = region;
>  
>  	if (!handle) {
> +		if (!bo_size)
> +			bo_size = size;
> +
>  		if (bops->driver == INTEL_DRIVER_I915) {
> -			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
> -				igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
> +			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &bo_size, region))
> +				igt_assert_eq(__gem_create(bops->fd, &bo_size, &buf->handle), 0);
>  		} else {
> -			size = ALIGN(size, xe_get_default_alignment(bops->fd));
> -			buf->handle = xe_bo_create(bops->fd, 0, size, region, 0);
> +			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
> +			buf->handle = xe_bo_create(bops->fd, 0, bo_size, region, 0);
>  		}
> +	} else {
> +		igt_assert(bo_size >= size);

I think this assertion should be outside and cover all cases.
If user will pass handle and due to bug some positive bo_size
we still can catch situation where according to size calculation
it will be bigger than bo_size what's wrong.

With this minor nits above:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	}
>  
>  	/* Store gem bo size */
> -	buf->bo_size = size;
> +	buf->bo_size = bo_size;
>  
>  	if (bops->driver == INTEL_DRIVER_I915)
>  		set_hw_tiled(bops, buf);
> -- 
> 2.43.0
> 
