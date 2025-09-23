Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C58CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 06:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0645010E1EC;
	Tue, 23 Sep 2025 06:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rmd2vukP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CD810E1EC
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758609298; x=1790145298;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6aJ8lYPP4vujZTP8ACj2tRw52NceEmOvfwbZ56PCZL0=;
 b=Rmd2vukPhUIqC1Eq//++CiHcG+0UO1pOfOYcWgBJK6MPLE7AV+2WvRDE
 zygzzB/OYdi3I5hWC3bhrc1Qwgh9GDnJ4vNvj32gC01zHH6ieM1J+i4fC
 vD2zly1Zwbp5g828A507E2McFPg+UGqVbPLPmrRie34ECdFIScOoWUoo5
 eJae7m9PBUZInbGuMDIlSLdvbZTdJJnymxPupB18F1S8l+eP/559k/hsQ
 YNgJY1iuyXY3c0ExpfcfB/TgQ3J4r9BJUUqfrVqFUH95+WQI8JPBo7vqo
 q66lQQ2JyU/Q46e6Yvef9fDpF04/rYxXPhClN3mweSJkGNNA5WoorYxFm A==;
X-CSE-ConnectionGUID: 0YHLIFzdR9G675S8LhxWlg==
X-CSE-MsgGUID: YPG34kKWR929MS9iQHNdTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71555534"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="71555534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:34:57 -0700
X-CSE-ConnectionGUID: gcADFs9aQDebCgaaEu6xUA==
X-CSE-MsgGUID: BX0ri7J9TCW2gvAJf2kvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="176522312"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.223])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:34:55 -0700
Date: Tue, 23 Sep 2025 08:34:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, gwan-gyeong.mun@intel.com, 
 andrzej.hajda@intel.com
Subject: Re: [PATCH 3/4] lib/xe/xe_query: add function to retrieve uint32_t
 value from hwconfig
Message-ID: <rufvyvh7y3gxz3qggmeuqzqkj5pjhxw7dcynxfc2zhi7vaz2nx@asvdgpakcbyo>
References: <20250917165541.85203-1-jan.maslak@intel.com>
 <20250917165541.85203-4-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917165541.85203-4-jan.maslak@intel.com>
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

On Wed, Sep 17, 2025 at 04:55:40PM +0000, Jan Maslak wrote:
> Adds helper function to xe_query which retrieves a single u32 value out of
> hwconfig.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  lib/xe/xe_query.c | 9 +++++++++
>  lib/xe/xe_query.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index da2788372..ae3d30b33 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -1035,6 +1035,15 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
>  	return NULL;
>  }
>  
> +uint32_t xe_hwconfig_lookup_value_u32(int fd, enum intel_hwconfig attribute)
> +{
> +	uint32_t len, *val;
> +
> +	val = xe_hwconfig_lookup_value(fd, attribute, &len);
> +	igt_assert(val && len == 1);
> +	return *val;
> +}
> +

Small nit, add documentation for above function as it is public API.
With this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  igt_constructor
>  {
>  	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 26535bb74..6404d800f 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -136,6 +136,7 @@ bool xe_is_media_gt(int fd, int gt);
>  bool xe_is_main_gt(int fd, int gt);
>  uint16_t xe_gt_get_tile_id(int fd, int gt);
>  uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
> +uint32_t xe_hwconfig_lookup_value_u32(int fd, enum intel_hwconfig attribute);
>  
>  struct xe_device *xe_device_get(int fd);
>  void xe_device_put(int fd);
> -- 
> 2.34.1
> 
