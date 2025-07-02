Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83484C8303C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 11:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3588189CC4;
	Wed,  2 Jul 2025 11:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJ6IVxz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261A989CC4
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751454226; x=1782990226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FPV+LAYdxLH0FFYj1aNXH7X/L8WVPUMJ5GZtCA/S68w=;
 b=EJ6IVxz8m6PvS+gDeGnu4vQ0Fc6bJoJ22WIAxsSN7d3ShO7ngzmnI/tk
 Rbr9P/Q3mm8H3iKDn+v4AK+X7Rz0aY/e3VvpmcsmTWYcJzj3we8HQnVHC
 4k9twsdJzayacTs4uo49/975mwn+uiyHVp5ezPH/djlUGtQ93JRbA8UjM
 oXbmcmLDRppeo8pTwneqSwotAOk3RUuOL0IEQXyNfkWZzVd6wBRuWip9B
 wbrXO9Sj5KquF52wM6uQCuV0cVSpJaH1ZMw317H2KKEW7lPHKlapSpts+
 DjFUGMbNRiB21XXthoiXYtN789fJmJl9NW1tsqdM1IVg01Ifa2/lKVxOK A==;
X-CSE-ConnectionGUID: X4RXIzmhQe+/uTI3WR6R6w==
X-CSE-MsgGUID: dTNBZUbEROWchCJAlMZFQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53610622"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53610622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:03:46 -0700
X-CSE-ConnectionGUID: zTxAVmTnRbCSbSm1VV1RSw==
X-CSE-MsgGUID: kWL9A+SKRIe1amRfFoBQ8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153817042"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:03:45 -0700
Date: Wed, 2 Jul 2025 13:03:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/7] lib/xe: Track valid GT IDs
Message-ID: <pmicjhhs2q3eplg76opai2uquew2kfgouegnmdvbtsp3cuzzcn@57svuxnvx2s4>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
 <20250630163529.2096664-10-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630163529.2096664-10-matthew.d.roper@intel.com>
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

On Mon, Jun 30, 2025 at 09:35:31AM -0700, Matt Roper wrote:
> Although current Intel platforms always have GTs with consecutive IDs,
> we should rely on this being true in the future.  During initial device
> query, build a bitmask of valid GT IDs that userspace may use.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/xe/xe_query.c | 5 +++++
>  lib/xe/xe_query.h | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 0d2e4805c..ac7b3110b 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -346,6 +346,11 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
>  	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
>  	xe_dev->gt_list = xe_query_gt_list_new(fd);
> +
> +	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
> +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> +		xe_dev->gt_mask |= (1 << xe_dev->gt_list->gt_list[gt].gt_id);

gt_id is __u16 so if I'm not wrong (1 << ...) won't exceed 32 bit.
I would cast it to 1ULL for safety.

--
Zbigniew

> +
>  	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
>  	xe_dev->engines = xe_query_engines(fd);
>  	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 1224a723a..37b0cf31e 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -36,6 +36,9 @@ struct xe_device {
>  	/** @gt_list: gt info */
>  	struct drm_xe_query_gt_list *gt_list;
>  
> +	/** @gt_mask: bitmask of GT IDs */
> +	uint64_t gt_mask;
> +
>  	/** @memory_regions: bitmask of all memory regions */
>  	uint64_t memory_regions;
>  
> -- 
> 2.49.0
> 
