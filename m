Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E4EC54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 15:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5199A10E2B4;
	Mon,  2 Jun 2025 15:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdsrPKIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A2710E2B4
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748877424; x=1780413424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Bi5HgdiqXBg6nVJ4EK87OujQ6v97VQ18/ZEilW64shU=;
 b=FdsrPKIy5NQ+4YN79s8OHnPs2uk9DBqneIRhmNKQ4PUJDW6K6BGsgAmW
 zsI0kaq88kAmpoiV60BsIfCp9SEGk6KedNlZdi/J3Go35LEoYHcpc1qKm
 HAX+xNmBeiOCnb2We6EqsQqoBnYLqF25crEmLH1vStAG+TrRE0FX0/KA3
 hpbR7XMMl3MUsin0WWyejqx4oVeIOBVjU3UnlPjFNAMO9aso+ELsDpYPh
 HYnYoKC+1U0idNvgAmwRz2SAdAoAHjzI6Sg1drim14yIYmOF2CLRCC91G
 m4j/YosAbkF80I33QODoIWcHYsU1D04jrs5JmbCXhsOoDox4SL12Gn2He w==;
X-CSE-ConnectionGUID: dtdp4HzCQ7mVQtGXO8hWAA==
X-CSE-MsgGUID: 1MX+WE1yQ5e4CIvcfIjhfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61505619"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="61505619"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:17:04 -0700
X-CSE-ConnectionGUID: L1LdhKeZQIeEz2MnP9lP7Q==
X-CSE-MsgGUID: evahHpeIRIGXxpMnnfeE5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144866912"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:17:02 -0700
Date: Mon, 2 Jun 2025 17:17:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: igt-dev@lists.freedesktop.org,
	John Harrison <John.C.Harrison@Intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/xe_gt: Trigger forced GT reset using write
Message-ID: <20250602151700.k7ilygvornm3spiq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 igt-dev@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>
References: <20250528212618.373-1-michal.wajdeczko@intel.com>
 <20250528212618.373-3-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250528212618.373-3-michal.wajdeczko@intel.com>
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

Hi Michal,
On 2025-05-28 at 23:26:17 +0200, Michal Wajdeczko wrote:
> The newest Xe driver supports triggering a GT reset using a write
> operation and this is a preffered method. Update IGT code to comply
> with that and also start using existing helper functions to access
> exposed "force_reset" attribute instead of relying on system() call.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_gt.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index 8bceca10d..c911ca8e4 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -59,15 +59,14 @@ bool has_xe_gt_reset(int fd)
>  
>  static void xe_force_gt_reset(int fd, int gt, bool sync)
>  {
> -	char reset_string[128];
> -	struct stat st;
> +	const char *attr = sync ? "force_reset_sync" : "force_reset";
> +	int dir = igt_debugfs_gt_dir(fd, gt);
> +	int len;
>  
> -	igt_assert_eq(fstat(fd, &st), 0);
> -
> -	snprintf(reset_string, sizeof(reset_string),
> -		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
> -		 minor(st.st_rdev), gt, sync ? "_sync" : "");
> -	system(reset_string);
> +	igt_assert_neq(dir, -1);
> +	len = igt_sysfs_write(dir, attr, "1", 1);
> +	close(dir);
> +	igt_assert_eq(len, 1);
>  }
>  
>  /**
> -- 
> 2.47.1
> 
