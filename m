Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB28C8303F
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 11:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C499510E6F3;
	Wed,  2 Jul 2025 11:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaN8oiCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B60F10E6F3
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751455450; x=1782991450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MEze61+ABQuQw02Sq99I82ctH6vffWNMAnXsqXQzdRM=;
 b=RaN8oiCBo5x2LouPzufJca6vj9nW3sbINasmtELCPjP7046DyKAItRAs
 c2NmWA/HKAZx/khaLOAnD7DdxQdzlulDKMxbYQDN1S8w+4L2wVC05OXDe
 y1y5PAvFozb6olg5GVjN1ka6HZMLHoLVhtQaUMB3nJttmjIX5yKqp5EeQ
 tRoNKkgvKxQEJdeyz6VlYV/n8razV0t1bEiHqXS9g/90IkyxVm1MbSLOo
 gWIO8WH4EE9K+4WYAp+eannkdoVjheJ0od0bDt2WnTe7LMYKXCxmC5AF+
 hw8qPJv2j2l5Gc9EMIvCmIWvcCwkfNCJTOCiqiuryQ4qasqDENAGTHoVF A==;
X-CSE-ConnectionGUID: UYeRp7yCQ6mIh2bxYa4s3w==
X-CSE-MsgGUID: MoWimXu+SQ628jgi7S0kXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53838022"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53838022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:24:10 -0700
X-CSE-ConnectionGUID: 6IuYBtVHROKUKVTPpoc34g==
X-CSE-MsgGUID: OSqwgPMwT1K5fHIYEF46jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153675533"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:24:09 -0700
Date: Wed, 2 Jul 2025 13:24:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/7] lib/xe: Populate vram_size[] and
 visible_vram_size[] by GT ID
Message-ID: <mpkr7tj6qiuixktxmqgd3shkh3vaumnost4jwhm3vcxm3wbj2s@lf5n7ls7ub4j>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
 <20250630163529.2096664-12-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630163529.2096664-12-matthew.d.roper@intel.com>
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

On Mon, Jun 30, 2025 at 09:35:33AM -0700, Matt Roper wrote:
> vram_size[] and visible_vram_size[] are used to lookup VRAM information
> by uapi GT ID.  Ensure that they're populated according to these IDs
> rather than by the GT's index in the query list; on future platforms
> these two may not be the same.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/xe/xe_query.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index ef4034185..9bfad0cc2 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -332,6 +332,7 @@ static void xe_device_free(struct xe_device *xe_dev)
>  struct xe_device *xe_device_get(int fd)
>  {
>  	struct xe_device *xe_dev, *prev;
> +	int max_gt;
>  
>  	xe_dev = find_in_cache(fd);
>  	if (xe_dev)
> @@ -355,14 +356,22 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->engines = xe_query_engines(fd);
>  	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
>  	xe_dev->oa_units = xe_query_oa_units_new(fd);
> -	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
> -	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
> -	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
> -		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_regions,
> -						     &xe_dev->gt_list->gt_list[gt]);
> -		xe_dev->visible_vram_size[gt] =
> -			gt_visible_vram_size(xe_dev->mem_regions,
> -					     &xe_dev->gt_list->gt_list[gt]);
> +
> +	/*
> +	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
> +	 * the allocation is large enough to hold the highest GT ID
> +	 */
> +	max_gt = ffs(xe_dev->gt_mask) - 1;

If I checked correctly, ffsl() is enough on 64bit arch, whereas on 32bit
we should use ffsll(). Rest looks good to me. With this fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +	xe_dev->vram_size = calloc(max_gt, sizeof(*xe_dev->vram_size));
> +	xe_dev->visible_vram_size = calloc(max_gt, sizeof(*xe_dev->visible_vram_size));
> +
> +	for (int idx = 0; idx < xe_dev->gt_list->num_gt; idx++) {
> +		struct drm_xe_gt *gt = &xe_dev->gt_list->gt_list[idx];
> +
> +		xe_dev->vram_size[gt->gt_id] =
> +			gt_vram_size(xe_dev->mem_regions, gt);
> +		xe_dev->visible_vram_size[gt->gt_id] =
> +			gt_visible_vram_size(xe_dev->mem_regions, gt);
>  	}
>  	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>  	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
> -- 
> 2.49.0
> 
