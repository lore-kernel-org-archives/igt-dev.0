Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DC4CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 08:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FAC10E650;
	Tue,  9 Sep 2025 08:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZQnOxYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB8810E650
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757406215; x=1788942215;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=g9inY+Icv/Wz6yRGpebtt4ykTq2W2N6fjjYd6iqOX40=;
 b=kZQnOxYDoScoq0ZJDKOUeoQ4bdtr7Xwf6F+hDUAlMVsqhlL2eQ1QvNuz
 bgsPraIN1xQVe/E+10ubdbsQYR9OGSFwXYqrfyTwW2ABUqASxkMrrNF6v
 zTDyFoL8w4yluz5N6e17kgUut0+j1fHijzQr9vuj13HcAV1a54+glY/KZ
 W4YqsABQNQCyOec3uZPmqNCT9XfdbYb+/jerBUzGZvsqSr+6jbrNz+lWv
 NSa2dgkgheBjRHd6G3PyoeZLnOQUfuzhiXvtbKP19342mx0tPJSnMqmmn
 sjV2hSMDsrhXLfwDyW9g0TGsDgLy+9vtKjI/pBnRPC0JV8gK2W4DQHzFP w==;
X-CSE-ConnectionGUID: a3asLa3/Q4yzf+31bacijw==
X-CSE-MsgGUID: NALQ1VzKSW214nROnULRog==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62308602"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="62308602"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:23:33 -0700
X-CSE-ConnectionGUID: yMapBF08TGyrl652qcSoFg==
X-CSE-MsgGUID: LwztIKaFQqSKe6gobxr4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="196685888"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:23:31 -0700
Date: Tue, 9 Sep 2025 10:23:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_query: =?utf-8?B?RG9u4oCZ?=
 =?utf-8?Q?t?= assume sequential GT IDs in xe_gt_type()
Message-ID: <20250909082316.3nti5skkfetlir5l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
 <20250908160723.1723178-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908160723.1723178-2-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-09-08 at 18:07:22 +0200, Marcin Bernatowicz wrote:
> Replace direct gt_list indexing with drm_xe_get_gt() and check
> gt_mask before use. This ensures xe_gt_type() works with real
> GT IDs instead of assuming list index == uapi ID, consistent
> with other helpers.
> 
> Fixes: 3bb0c49ac668 ("lib/xe/xe_query: Add xe_gt_type() and xe_is_main_gt() helpers")
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  lib/xe/xe_query.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 9b88cce8d..17045f3fb 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -927,12 +927,15 @@ bool xe_has_media_gt(int fd)
>  uint16_t xe_gt_type(int fd, int gt)
>  {
>  	struct xe_device *xe_dev = find_in_cache(fd);
> +	const struct drm_xe_gt *xe_gt;
>  
>  	igt_assert(xe_dev);
> -	igt_assert_f(gt >= 0 && gt < xe_number_gt(fd),
> -		     "gt %d out of range [0..%d)\n", gt, xe_number_gt(fd));
> +	igt_assert(xe_dev->gt_mask & BIT(gt));

Remove this assert, next one below is enough.
With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +
> +	xe_gt = drm_xe_get_gt(xe_dev, gt);
> +	igt_assert(xe_gt);
>  
> -	return xe_dev->gt_list->gt_list[gt].type;
> +	return xe_gt->type;
>  }
>  
>  /**
> -- 
> 2.31.1
> 
