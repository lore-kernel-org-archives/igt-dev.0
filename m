Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDB7C83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 13:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BF110EA56;
	Fri, 11 Jul 2025 13:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+/uU4sK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01A310EA56
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752240406; x=1783776406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7E8Dz8IrVP9iTdJSCUGVk+PCLlZkVOiTpVeDm1h9HPc=;
 b=L+/uU4sKfAanphcy7Vv64JDz7GXqnmEj5RRXlXBc4blY51qRyNcVaMFD
 GxBKMjzrvPjbDLR4FTQAp3IbYXIdQ1/dhvF+lCwHADTn1eRhscNHoSbhl
 Vof395OboAsNiG7QfSR05AnDvXKB79IAGtPabua1JvGccYQYB24nybpbW
 0FYABbE/x/cTrAahn/QOJ6awN/YVpfVLhJBeb8BtrkPjFLri+PaGV7DT8
 wWWWTrzZQcowVunCh5hEdFQUu808JRB8N0/KVeHg6UGFQPRoTegUw5mwI
 PcKat++2Pr2P6LJb1yzB4PXVtAFyZbHQSfXaUNVBz0QCL90IwuVUYrHIK A==;
X-CSE-ConnectionGUID: c/yNiGxOTYOIpIHmnUviWQ==
X-CSE-MsgGUID: ou7c3U/aST+IfshVemrtlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54510197"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54510197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 06:26:46 -0700
X-CSE-ConnectionGUID: FJIE4t86Q/Wb0qMPR1Gykw==
X-CSE-MsgGUID: Bjvzn4wjTfiGLQy40gypNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="155999651"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 06:26:44 -0700
Date: Fri, 11 Jul 2025 15:26:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe: Fix allocation for vram_size and
 visible_vram_size based on max_gt
Message-ID: <20250711132626.6vyotlipmwa5webn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250710-fix-allocation-of-vram_size-and-visible_vram_size-v1-1-cee73305db60@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710-fix-allocation-of-vram_size-and-visible_vram_size-v1-1-cee73305db60@intel.com>
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

Hi Gustavo,
On 2025-07-10 at 19:12:27 -0300, Gustavo Sousa wrote:
> The current allocation for vram_size and visible_vram_size has two
> issues:
> 
> * The expression (max_gt = ffsll(xe_dev->gt_mask) - 1) gives us the
>   zero-based index of the first bit set in the mask, which does not give
>   us the maximum GT ID, but the minimum.
> 
> * Since max_gt is zero-based, even if its value was right, we would
>   still be allocating not enough entries for the array.
> 
> Fix that by calculating max_gt in the same way that xe_dev_max_gt() does
> and using (max_gt + 1) as argument to calloc().
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Fixes: 3a39a6e51b18 ("lib/xe: Populate vram_size[] and visible_vram_size[] by GT ID")
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/xe/xe_query.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 3d628cb3fe59ddc390684941452ca04fd735b212..c0dba018244e8a47c8f1b305cf43ec3d4ffdc575 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -361,9 +361,9 @@ struct xe_device *xe_device_get(int fd)
>  	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
>  	 * the allocation is large enough to hold the highest GT ID
>  	 */
> -	max_gt = ffsll(xe_dev->gt_mask) - 1;
> -	xe_dev->vram_size = calloc(max_gt, sizeof(*xe_dev->vram_size));
> -	xe_dev->visible_vram_size = calloc(max_gt, sizeof(*xe_dev->visible_vram_size));
> +	max_gt = igt_fls(xe_dev->gt_mask) - 1;
> +	xe_dev->vram_size = calloc(max_gt + 1, sizeof(*xe_dev->vram_size));
> +	xe_dev->visible_vram_size = calloc(max_gt + 1, sizeof(*xe_dev->visible_vram_size));

It could also just use value from below for loop?
For example:
	max_gt = xe_dev->gt_list->num_gt - 1;

If yes this could be someting for future change.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  	for (int idx = 0; idx < xe_dev->gt_list->num_gt; idx++) {
>  		struct drm_xe_gt *gt = &xe_dev->gt_list->gt_list[idx];
> 
> ---
> base-commit: eacde5c2acc37c1570e27b68b8b6c39d8b61fb32
> change-id: 20250710-fix-allocation-of-vram_size-and-visible_vram_size-f194f0e55610
> 
> Best regards,
> -- 
> Gustavo Sousa <gustavo.sousa@intel.com>
> 
