Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B6C54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 15:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAFD10E2A9;
	Mon,  2 Jun 2025 15:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oyfkyn9C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5F010E2A9
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748877200; x=1780413200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Bo1t4G2+wkNlOXKmL7qguNISwfBDijB/YpF1J6cyPU=;
 b=Oyfkyn9CXdiMsNife1mEcjEfmxkuRvpr75l0YsDd89JsDcVyLdhoNmzT
 4l5vu7yeSLemmEe0afeM4JHZgXuEgp8ZHoUhs2WeBjcskKD8ukE9d8Jzy
 ojRWU/evoanpMc9ChDYDizT28AHc5bujhOJ3yCIzGFplpP+YvJ+9ml8CE
 CTCzIGYK1KTh+yxy1AFMYK3iGxNvmNPHAIZeVu1KImJ7oIb3kIwB8cZzG
 Z1ijwUgOVWGWlGFbLLjUuVp82PVUEDUwKZGlQk2+8k4OqxOSNo5W6I8Y4
 TaFqehWuwtD8So5cSGixRdJTxxv/jpQqpfTS6a7DqDhboRo2GeEVGR7eX g==;
X-CSE-ConnectionGUID: X7eJTyxvRCCc7YsaGIMb/g==
X-CSE-MsgGUID: HkrfheVCQBm444eGJcOJ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50988268"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="50988268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:13:01 -0700
X-CSE-ConnectionGUID: e4NQTr82R8m8oiFRurcJmg==
X-CSE-MsgGUID: 4Wa9cbgbRQquAwkjOC/2jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="175420098"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:13:00 -0700
Date: Mon, 2 Jun 2025 17:12:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] lib/xe_gt: Update has_xe_gt_reset function
Message-ID: <20250602151256.kvp3pfzqvbhqon3y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250528212618.373-1-michal.wajdeczko@intel.com>
 <20250528212618.373-4-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250528212618.373-4-michal.wajdeczko@intel.com>
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
On 2025-05-28 at 23:26:18 +0200, Michal Wajdeczko wrote:
> We should look for the write-only "force_reset" attribute.
> While around simplify code by using existing helper functions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  lib/xe/xe_gt.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index c911ca8e4..afb757bfa 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -30,31 +30,17 @@
>   */
>  bool has_xe_gt_reset(int fd)
>  {
> -	char reset_sysfs_path[100];
> -	struct stat st;
> +	int reset_fd;
>  	int gt;
> -	int reset_sysfs_fd = -1;
> -	int sysfs_fd = -1;
>  
> -	igt_assert_eq(fstat(fd, &st), 0);
> -	sysfs_fd = igt_sysfs_open(fd);
> -
> -	igt_assert(sysfs_fd != -1);

Note that this function asserts only in case of no sysfs,
will this behaviour be retained?

Reusing code is always good so
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	xe_for_each_gt(fd, gt) {
> -		sprintf(reset_sysfs_path, "/sys/kernel/debug/dri/%d/gt%d/force_reset",
> -				minor(st.st_rdev), gt);
> -		reset_sysfs_fd = openat(sysfs_fd, reset_sysfs_path, O_RDONLY);
> -
> -		if (reset_sysfs_fd == -1) {
> -			close(sysfs_fd);
> -			return 0;
> -		}
> -
> -		close(reset_sysfs_fd);
> +		reset_fd = igt_debugfs_gt_open(fd, gt, "force_reset", O_WRONLY);
> +		if (reset_fd == -1)
> +			return false;
> +		close(reset_fd);
>  	}
>  
> -	close(sysfs_fd);
> -	return 1;
> +	return true;
>  }
>  
>  static void xe_force_gt_reset(int fd, int gt, bool sync)
> -- 
> 2.47.1
> 
