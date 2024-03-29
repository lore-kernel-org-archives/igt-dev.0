Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9C2CD1283
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 05:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2883510E361;
	Fri, 29 Mar 2024 05:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8PVkne1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46D910E361
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 05:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711688500; x=1743224500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=raMHU25x5FRUwKZUOOdXMfh915asgfSmnRLavy0OVR0=;
 b=g8PVkne1caECcr9QgbVObsB8wpxbVlEhl+mRWg/slPiuuWqgoRciSRUA
 awpiQ6/KKn5f/lBce4eBk5sk/2pwqffHcpwpPrqyo7fnePNbpp09ej0fO
 GbiGlkYmxlpx6AxYYkN4p3nfLeqhym9c3q3dhixD9X/PJbbr8QLotE1Ie
 wSwxpE1U3pAMNmTH3HoyJIFHiMhUj68a7m1w7my1TPJ05BRHqvBhIvhpV
 +o+ju7e0DhYtrhTDTelp6L4L0Xf9Q9nYrQWMlJigVRZaOMXmzy+ZYTveK
 VaaJiIvN3ECq7cR6mwy7CcVBDs9ER+l3qZGLi8Npt9sukpYlhtMD/o9vd g==;
X-CSE-ConnectionGUID: HpRAjKB7REqp5vIlPVaDZA==
X-CSE-MsgGUID: 91TDLStkQ1uZGvNNXfVrKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6708600"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6708600"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:01:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16703810"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.67])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:01:35 -0700
Date: Fri, 29 Mar 2024 06:01:32 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Subject: Re: [PATCH i-g-t v2 1/2] lib/intel_blt: Add helper function to
 ensure platform supports compression
Message-ID: <20240329050132.myk23se7d22cude6@zkempczy-mobl2>
References: <cover.1711729399.git.akshata.jahagirdar@intel.com>
 <6e857ec4a881f64a2cce7b3ec84cd4e1d74a55f3.1711729400.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e857ec4a881f64a2cce7b3ec84cd4e1d74a55f3.1711729400.git.akshata.jahagirdar@intel.com>
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

On Fri, Mar 29, 2024 at 09:30:12AM -0700, Akshata Jahagirdar wrote:
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
> index fe0a45cb8..0e569c5a2 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -464,6 +464,20 @@ bool blt_block_copy_supports_compression(int fd)
>  				    BLT_CMD_SUPPORTS_COMPRESSION);
>  }
>  
> +/**
> + * blt_platform_supports_compression
> + * @fd: drm fd
> + *
> + * Check if platform provided by @fd device supports compression.
> + *
> + * Returns:
> + * true if it does, false otherwise.
> + */
> +bool blt_platform_supports_compression(int fd)
> +{
> +	return igt_debugfs_search(fd, "info", "has_flat_ccs yes");
> +}

I would use 'blt_platform_has_flat_ccs_enabled' as the function name, as
this describes BIOS may have disabled it. Same I would update comment
because platform may support compression but it is not enabled.

--
Zbigniew

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
