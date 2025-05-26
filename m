Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B484AC54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 15:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CCA10E34F;
	Mon, 26 May 2025 15:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7MP53Xw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0111B10E33F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748274385; x=1779810385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OgdRd4eALKCBSJTjkX+MhIl611oE//J9ZlSSATFUjuI=;
 b=D7MP53XwoyYy9eq0Zd9Dglu7Y91DONO21snrubix9cdtb8SSEVn7CHoV
 nK2xV4Z8IbotqyLOnl71/t90OK6JoMgcgKzan4HR0eOZqv+oY4b/zx5B/
 ICyCoaMyvXhaE0bhAPUxOMvBpGzSuKVvY4N9Si1g3nxMf5R7wBcIjXL7X
 hOxFvre8pJWGwFPk6KVt0YRg4TPx/2jKeRosamU/WqRgfaK+os49Bpx4M
 FWDPRcW+3HJ/eSt3SE2aQNXBThi5WY1VDrJZ2rLNbDnODn5MXuscJjCj4
 O0Ju59k4QGGZG2Sn1E/5cUSf1JhWlrx/nJ0htc7xY9olm49bZJOZ/LBcE w==;
X-CSE-ConnectionGUID: U//yMxOoTyifK2v0qppIiQ==
X-CSE-MsgGUID: 8B6SsvxuRw6oJRNVi8NJNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="72786064"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="72786064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 08:46:23 -0700
X-CSE-ConnectionGUID: o0ZbI774TNaFH1EKxzZqFQ==
X-CSE-MsgGUID: b2RVCdWjSUCBNk9bB0mVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="147291458"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 08:46:21 -0700
Date: Mon, 26 May 2025 17:46:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 jakub1.kolakowski@intel.com
Subject: Re: [PATCH i-g-t] tests/intel: skip subtests using "mocs" debugfs if
 it's not present
Message-ID: <20250526154602.zhgzid5q6luwn53p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 jakub1.kolakowski@intel.com
References: <20250526072723.7704-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526072723.7704-1-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2025-05-26 at 09:27:23 +0200, Lukasz Laguna wrote:
> The "mocs" debugfs entry is expected to be missing on VFs, so instead of
> asserting its presence, skip the subtests if it is not available.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 11 +++++++----
>  tests/intel/xe_pm.c         |  4 +++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 67b7bb826..e757141cb 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -597,19 +597,22 @@ static void
>  gt_mocs_reset(int fd, int gt)
>  {
>  	char path[256];
> +	char *mocs_content_pre, *mocs_contents_post;
> +
> +	sprintf(path, "gt%d/mocs", gt);
> +	igt_require_f(igt_debugfs_exists(fd, path, O_RDONLY),
> +		      "Failed to open required \"mocs\" debugfs entry\n");

Good idea, imho just print which one you couldn't open:
		      "Failed to open required debugfs entry: %s\n", path);

Same apply below.

Regards,
Kamil

>  
>  	/* Mocs debugfs contents before and after GT reset.
>  	 * Allocate memory to store 10k characters sufficient enough
>  	 * to store global mocs and lncf mocs data.
>  	 */
> -	char *mocs_content_pre = (char *)malloc(10000 * sizeof(char));
> -	char *mocs_contents_post = (char *)malloc(10000 * sizeof(char));
> +	mocs_content_pre = (char *)malloc(10000 * sizeof(char));
> +	mocs_contents_post = (char *)malloc(10000 * sizeof(char));
>  
>  	igt_assert(mocs_content_pre);
>  	igt_assert(mocs_contents_post);
>  
> -	sprintf(path, "gt%d/mocs", gt);
> -	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
>  	igt_debugfs_dump(fd, path);
>  	igt_debugfs_read(fd, path, mocs_content_pre);
>  
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 6eb21d5ec..6cf532a88 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -743,7 +743,9 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
>  		igt_debug("Running on GT%d\n", gt);
>  
>  		sprintf(path, "gt%d/mocs", gt);
> -		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> +		igt_require_f(igt_debugfs_exists(device.fd_xe, path, O_RDONLY),
> +			      "Failed to open required \"mocs\" debugfs entry\n");
> +
>  		igt_debugfs_dump(device.fd_xe, path);
>  		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
>  
> -- 
> 2.40.0
> 
