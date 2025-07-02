Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5468FC8303F
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 11:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26810E6F0;
	Wed,  2 Jul 2025 11:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckrf6sp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0818F10E6F0
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751456165; x=1782992165;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=M7ApETbmjhxO3evolfoq9ux4joV1FDOYSHaxH8eMtpQ=;
 b=ckrf6sp4PuI0TdiXAjP02kHHaG4OMnQLq6tdgKnEhI3MYaD0XSCPoEUT
 Fzr+Tq4Z/mMkVzeE4u3DHCIoMnXGRqX4k+YY18rNMrlmgVuvSDRrU5qrl
 HibVgg3CWdZX6gCKznw4KwaH4fv4L/MVzsh7MMszStOLPJ9PMLB7a3L1N
 wRPglO3vxqujgB6+SEDsA1PKgTmO8j3hUATOv0+mX4nboEnA7zgJ9loVW
 rcmSBDPZ+4CsAZGtQvU6xOUtp5KDbt+v1cwEeAmdrtdgNphvbbrYgliLy
 b8OKCztn5SSJkzb07yC3Li7oi9ZwxrpnAMws/5nufi6nRVk1FOYdN1jBy w==;
X-CSE-ConnectionGUID: /yIixe8ETOGsZ52xd4jr4g==
X-CSE-MsgGUID: PCpHtEPjSzajxQ4ZWo2DVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53839277"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53839277"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:36:04 -0700
X-CSE-ConnectionGUID: 5Om8V2lYSKG8NTx5UukDJg==
X-CSE-MsgGUID: sYimjptATvOabraeH2pYgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="184997928"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:36:04 -0700
Date: Wed, 2 Jul 2025 13:36:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/7] lib/xe: Add xe_dev_max_gt()
Message-ID: <gdn63lr3d7hvv5ccqnxh3nifttegac63g2r3q2vnpyowirihjo@5mcmcyptgzai>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
 <20250630163529.2096664-15-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630163529.2096664-15-matthew.d.roper@intel.com>
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

On Mon, Jun 30, 2025 at 09:35:36AM -0700, Matt Roper wrote:
> Tests may need to allocate storage space to hold data by GT ID.  Add a
> helper function to ensure they can easily determine the maximum possible
> ID (which may be higher than the number of GTs reported by
> xe_number_gt()).
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  lib/xe/xe_query.c | 14 ++++++++++++++
>  lib/xe/xe_query.h |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 9bfad0cc2..6f2edf0de 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -469,6 +469,20 @@ _TYPE _NAME(int fd)			\
>   */
>  xe_dev_FN(xe_number_gt, gt_list->num_gt, unsigned int);
>  
> +/**
> + * xe_max_gt:
> + * @fd: xe device fd
> + *
> + * Return maximum GT ID in xe device's GT list.
> + */
> +unsigned int xe_dev_max_gt(int fd)
> +{
> +	struct xe_device *xe_dev = find_in_cache(fd);
> +
> +	igt_assert(xe_dev);
> +	return igt_fls(xe_dev->gt_mask) - 1;
> +}
> +
>  /**
>   * all_memory_regions:
>   * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 4aeff639a..5ba481c63 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -94,6 +94,7 @@ struct xe_device {
>  #define XE_MAX_ENGINE_INSTANCE	9
>  
>  unsigned int xe_number_gt(int fd);
> +unsigned int xe_dev_max_gt(int fd);
>  uint64_t all_memory_regions(int fd);
>  uint64_t system_memory(int fd);
>  const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
> -- 
> 2.49.0
>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
