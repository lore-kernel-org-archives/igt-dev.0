Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2711C3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 14:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7573610E26A;
	Wed, 14 May 2025 14:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWERGBk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276AD10E26A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747232463; x=1778768463;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9mODRbsGBlWiRQ9lP6gNp4C3TI2WVMEvt0CnTMsNFUE=;
 b=mWERGBk0i8gZHOJentwYeXzQ0Kq8ZG/KvKw2zG7WADB2cji4M7XQdIMa
 ugqGOOwvR86HYF/drg74JdqdVOHFxpPwVwLxFXkJRt8z+QH/I6Clml2+p
 Ao7XnwNJg5TKrF29Bi27smwg5MXVu5dRsAO8oOLiwgNCuNsBjyrHyADvN
 6p6Sdv+lDaHr7FApMqsB2I1T4jMBRIbzamsw8BuNlDJtTiYJVeA57ixvD
 8Ux+equ+tObiXyOeSjyIGnFgumirT2+Z4fjTzhhWgGyJWqnxMZgPkrOVu
 gx8nxzezdw+iIpH1cm9yWo0bhMlv3r5QEJeTPLkJGf/2HcTCdgRh/xfhD w==;
X-CSE-ConnectionGUID: XDG+v2RDTUSPfbHpj2Ckrg==
X-CSE-MsgGUID: j0yRwgt5TWKdyVtD0oK0aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="74531555"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="74531555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:21:00 -0700
X-CSE-ConnectionGUID: D3vp8/I7RUGBkEG010Lp2w==
X-CSE-MsgGUID: y8UNSZqzR1SliNxJszCvbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="137927664"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:20:57 -0700
Date: Wed, 14 May 2025 16:20:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 14/15] lib/igt_device_scan: Replace rindex with strrchr
Message-ID: <20250514142045.6cojmoki7w3dowtd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-15-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507160148.53857-15-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-05-07 at 16:01:47 +0000, Jeevaka Prabu Badrappan wrote:
> As rindex is deprecated, replace index with strrchr.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> ---
>  lib/igt_device_scan.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 7e9614429..e23943a10 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1258,7 +1258,7 @@ igt_devs_print_user(struct igt_list_head *view,
>  		if (!dev->drm_card || dev->drm_render)
>  			continue;
>  
> -		drm_name = rindex(dev->drm_card, '/');
> +		drm_name = strrchr(dev->drm_card, '/');
>  		if (!drm_name || !*++drm_name)
>  			continue;
>  
> @@ -1306,7 +1306,7 @@ igt_devs_print_user(struct igt_list_head *view,
>  			if (strcmp(dev2->parent->syspath, dev->parent->syspath))
>  				continue;
>  
> -			drm_name = rindex(dev2->drm_render, '/');
> +			drm_name = strrchr(dev2->drm_render, '/');
>  			if (!drm_name || !*++drm_name)
>  				continue;
>  
> -- 
> 2.34.1
> 
