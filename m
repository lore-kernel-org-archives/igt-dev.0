Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA945CF9C71
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 08:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8197510E636;
	Tue, 24 Sep 2024 08:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFG/zdjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D3E10E636
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727166344; x=1758702344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tLqwPuZBqdAyQiXiXalrWGQyS2WRcyrSTkY7iRSlhrw=;
 b=IFG/zdjl9PRQhUre06vxr9SG2EBguEdPXAT3BbOh2iZHVC2kQ10IOUic
 qU9+QuPW7zF/wqWsOwPe+pfs3r5OeVSkJEgOz+YvY8k/3+ZZzhiU1zCVC
 zd6z+E44rSWtuwTIMl5jeyBxdYZLcSmMlWq1lSTUXHLBuRCEZ2us/jWCC
 UaYgLxL3QMQPQDfe2KMcYrr4xjurr9TQvwNep/R2tadRVeUR8zvZhJXY7
 vlGaqLrGxZtbN9B8NtKJXfEbOFbp48Snme7EX8CUbtczx/IZwacwzRY1y
 yguhpnucTQfiCiQY771HTHNS5zyFN23tLXozXUJOVSG5+wLIvTXBtmPXE A==;
X-CSE-ConnectionGUID: HRT/YZI/S5qgH18FcdV40g==
X-CSE-MsgGUID: 4DrwIDQ/SYmrPTxPb6xO0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26264996"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="26264996"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:25:42 -0700
X-CSE-ConnectionGUID: TSi4Gm4LSIWvC/2e1daQFA==
X-CSE-MsgGUID: J+qUteUoSpiVu20JZQs+aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="71483672"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 24 Sep 2024 01:25:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Sep 2024 11:25:39 +0300
Date: Tue, 24 Sep 2024 11:25:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 5/5] lib/igt_gt: Stop passing fd == -1 in
 igt_open_forcewake_handle()
Message-ID: <ZvJ3gzmKotF7u6lH@intel.com>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
 <20240923221146.125848-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923221146.125848-6-lucas.demarchi@intel.com>
X-Patchwork-Hint: comment
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

On Mon, Sep 23, 2024 at 05:11:46PM -0500, Lucas De Marchi wrote:
> If something like -1 is needed, then
> igt_open_forcewake_handle_for_pcidev() should be used.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  lib/igt_gt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index c9fd9164f..ba4163c97 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -493,6 +493,7 @@ void igt_stop_hang_helper(void)
>  
>  /**
>   * igt_open_forcewake_handle:
> + * @fd: drm fd - i915 or xe
>   *
>   * This functions opens the debugfs forcewake file and so prevents the GT from
>   * suspending. The reference is automatically dropped when the is closed.
> @@ -509,8 +510,10 @@ int igt_open_forcewake_handle(int fd)
>  
>  	if (is_xe_device(fd))
>  		fn = "forcewake_all";
> -	else
> +	else if (is_i915_device(fd))
>  		fn = "i915_forcewake_user";
> +	else
> +		return -1;
>  
>  	return igt_debugfs_open(fd, fn, O_RDONLY);
>  }
> -- 
> 2.46.1

-- 
Ville Syrjälä
Intel
