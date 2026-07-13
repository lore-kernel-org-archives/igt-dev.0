Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EA3C44507
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 14:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F9E10EA0C;
	Mon, 13 Jul 2026 14:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hezI8zCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7974A10E60C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783953951; x=1815489951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z09bPLXSBp/wBcEBsBUI7rTfcz5JiIIlRNPpahRI89E=;
 b=hezI8zCUqtNyDH3mTZacKeDgMkTp8HJEoqL4UrcXQ47+pHFzfwBojxfo
 aLJQfNYCo73i0eBTIKbAbqLR0DX+zlENnrGufJLFYSdawFTHNIwWdP7f8
 rXtgxLNe7JlB8hqmX9NElM25RhOvZ680Amx+svJ94z44Z2z9LWTFvhze+
 TqmYaDnjwdddCk0WUVEu8oEjh9Q8B93HzRWrNRU2qshhwkdQWkjA+5lHm
 PaimGo3hLxRKp7/BymPXVSaYlQ/zRwQ3hLIC/4cnKwkMi1J612HQwK8YF
 qr5R1oLQMPvnikVeFaNKlIr1oZcLGrWOwLAicajhbYv5oTMgJipSddXAF Q==;
X-CSE-ConnectionGUID: IqhgYgehRSqNLkaf0MgDUw==
X-CSE-MsgGUID: 1Mbk3dMaS+KSJdDG2g7o0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101989839"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="101989839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 07:45:50 -0700
X-CSE-ConnectionGUID: smg2k/MgRK+w4XCkkkAxRQ==
X-CSE-MsgGUID: Atp+cbZKQUynEVD+SLwYrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260463109"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 07:45:49 -0700
Date: Mon, 13 Jul 2026 16:45:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Cc: gustavo.sousa@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t v1] lib/igt_debugfs: Add "errno" to debug print
Message-ID: <20260713144531.ajtlp2n5nckzc7nc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 gustavo.sousa@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
References: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
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

Hi Ngai-Mint,
On 2026-07-08 at 15:52:12 -0700, Ngai-Mint Kwan wrote:
> When igt_debugfs_path() fails under igt_debugfs_dir(), add "errno" to the
> debug print for additional context of the failure.
> 
> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
> ---
>  lib/igt_debugfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index ed0a20773..a8c45945c 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -187,8 +187,12 @@ int igt_debugfs_dir(int device)
>  	int debugfs_dir_fd;
>  	char path[200];
>  
> -	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path))))
> +	errno = 0;
> +	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path)))) {
> +		igt_debug("Last errno: %i, %s\n", errno, strerror(errno));

Problem with this is that errno should be used in place where
the error occured, as any system function call after it occur
can change it. imho you should add more debug prints to
igt_debugfs_path() with errno printing there.

Regards,
Kamil

> +
>  		return -1;
> +	}
>  
>  	debugfs_dir_fd = open(path, O_RDONLY);
>  	igt_debug_on_f(debugfs_dir_fd < 0, "path: %s\n", path);
> -- 
> 2.43.0
> 
