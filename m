Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810D6C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 09:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D55610E084;
	Fri, 29 Mar 2024 09:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+npv7RZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563F81125FE
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711704772; x=1743240772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HbSCbi3VTO6sELQeMKt26qIv6ji53l8V1iYG5ZNFJkU=;
 b=Z+npv7RZBL9vmKQCFr984lxDrXgp4YXlY3Lq0H6lGk4YSWb9jOJlfYq1
 CuiZD1bSELuT4Vk10V/ib0kn5x4DNGdlgiLEGQokdD7+KbDExZossdZCe
 MY2DFtRF82aqrBYOpOCTi5JPIA0G6v0Eu29I983OET5F/B5aYY/YjRS0W
 LhKxRkFEi/67TcD4WUTo2sFfKMgijlt6EiPJHXQZlDFwMVz79V75+2ipt
 BZVzFO05YI3DnXdQSV8H1vkVRPsk8LPkhnydoeESqHBhcjMrwQ8LSZJ3F
 j6fLLO+uQRNBpffN5eH6gULgPQkZsojd71HS+nDutI0dcvpk+eAMV+QqE g==;
X-CSE-ConnectionGUID: TZ0+Iy6pQlyQQ+RrrPVGiw==
X-CSE-MsgGUID: 4inuBx11SXKBq3unSjx/Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7081931"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="7081931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="16960901"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.67])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:32:49 -0700
Date: Fri, 29 Mar 2024 10:32:47 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Subject: Re: [PATCH i-g-t v3 1/2] lib/intel_blt: Add helper function to
 ensure platform has flat-ccs enabled
Message-ID: <20240329093247.3lwz7qadmru7tumb@zkempczy-mobl2>
References: <cover.1711733054.git.akshata.jahagirdar@intel.com>
 <57d5987823217cc0032820e5455fef519ed530eb.1711733054.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57d5987823217cc0032820e5455fef519ed530eb.1711733054.git.akshata.jahagirdar@intel.com>
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

On Fri, Mar 29, 2024 at 10:27:00AM -0700, Akshata Jahagirdar wrote:
> Add helper function to check if platform has flat-ccs enabled  by
> reading from debugfs entry.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  lib/intel_blt.c | 14 ++++++++++++++
>  lib/intel_blt.h |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index fe0a45cb8..a5ee302c4 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -464,6 +464,20 @@ bool blt_block_copy_supports_compression(int fd)
>  				    BLT_CMD_SUPPORTS_COMPRESSION);
>  }
>  
> +/**
> + * blt_platform_has_flat_ccs_enabled
> + * @fd: drm fd
> + *
> + * Check if platform provided by @fd device has flat-ccs enabled.
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool blt_platform_has_flat_ccs_enabled(int fd)
> +{
> +	return igt_debugfs_search(fd, "info", "has_flat_ccs yes");
> +}
> +
>  /**
>   * blt_uses_extended_block_copy
>   * @fd: drm fd
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 1f6c71359..a2c4a4adb 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -209,6 +209,7 @@ bool blt_fast_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>  bool blt_block_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>  bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>  bool blt_block_copy_supports_compression(int fd);
> +bool blt_platform_supports_compression(int fd);
>  bool blt_uses_extended_block_copy(int fd);
>  
>  const char *blt_tiling_name(enum blt_tiling_type tiling);
> -- 
> 2.34.1
> 

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
