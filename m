Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4968C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 04:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2700310E004;
	Thu,  3 Jul 2025 04:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxYrdeF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0A010E004
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 04:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751517388; x=1783053388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+RlPpZ3j/olTj104I5U7N6SwHFpCNWia0aLX99UcQqY=;
 b=YxYrdeF4kgOL4HdD5OJEbBS5GpltZNeBjJPW2FxVQogVE7QlpUueOpEw
 Q30/5E5YmjE74rLX95KECmZ0VM4GmzT3rUbs5fpqb7GDP1HsQGFIr/16u
 QFU2P80MhNlWy4+qiAh8v5TcuaYonkThBoYT5Y/ShgUUf/MXYULx878Kv
 +mjDvhYVIZVgYpL+0vjTQn5LZWb0wXUd8ZD4vsz7Ah25K8vU/QyLsmrAy
 ugX59ap0xZBHK2V7Bghw2B5HkGxvAoV67ACPRWZml4pEvvC1d+Dv1jzb5
 wbhJyYLUJ9+ZX3273uMWZQ0DXfmVGPEERmEwF5pIU1m+4xSyr9D0XzJcl Q==;
X-CSE-ConnectionGUID: RzsOzMqCQiWZrzYbI3HsDQ==
X-CSE-MsgGUID: aj3FQqHqQBqxZx/BwEPM0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53972699"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53972699"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 21:36:28 -0700
X-CSE-ConnectionGUID: xY+BxuhYTcmFefSCwc/ZOA==
X-CSE-MsgGUID: 6Uc4NDyOQ5661fVq6HOTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="158625987"
Received: from savramon-mobl1 (HELO localhost) ([10.245.244.83])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 21:36:26 -0700
Date: Thu, 3 Jul 2025 06:36:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 1/7] lib/xe: Track valid GT IDs
Message-ID: <cbxw2lp2q46qx3bv3nun4xmll2gmdh6gj5b3ifacwx5exvqb2z@i4s46zs4nugo>
References: <20250702193254.2613121-9-matthew.d.roper@intel.com>
 <20250702193254.2613121-10-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702193254.2613121-10-matthew.d.roper@intel.com>
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

On Wed, Jul 02, 2025 at 12:32:56PM -0700, Matt Roper wrote:
> Although current Intel platforms always have GTs with consecutive IDs,
> we should rely on this being true in the future.  During initial device
> query, build a bitmask of valid GT IDs that userspace may use.
> 
> v2:
>  - Switch bit assignment to (1ull << ...) to properly support up to
>    64 GTs even on 32-bit architectures.  (Zbigniew)
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/xe/xe_query.c | 5 +++++
>  lib/xe/xe_query.h | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 0d2e4805c..d7ca08f65 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -346,6 +346,11 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
>  	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
>  	xe_dev->gt_list = xe_query_gt_list_new(fd);
> +
> +	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
> +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
> +		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
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

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
