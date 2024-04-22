Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A30C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 15:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC6C112C16;
	Mon, 22 Apr 2024 15:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YliNJM0i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F89112C23
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713800225; x=1745336225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fx1yg7/OTZR5ajQyq+KCiVEN4QGrZCUr4xMF1JjG+yM=;
 b=YliNJM0i3MFWjtsf/EkVSwpqX1AnMLOBMzNy0oHb1g4SY6UoUJd5jIOY
 npkQBbXGRVlUrIuA5o1iXNy5Gyfw3poBMg8W3JGduFbwWJEQNpThaZsem
 VWAEgA6w5xsgc9oXBrrZL676gMbyvDF23/EZl5RLbmm8bo560k7aW+NMR
 sY+1rp6LFO/5AxFCKbjdKVa46o3vLPybe3+uLwWZkm3BMeaZKaRdBUtuV
 H5NW+fxR9TKFtx4zRHe6GMKW9OdsI5Tu1VaZAaV4jtUeLG+fwa0F+Yiem
 tZ96zjBhcagtvc+C06lt0uZteIITuV8569ZggfG0Qa98TF5hv4PiBBlxj A==;
X-CSE-ConnectionGUID: pKpEXl9YRSmKHzWj48iPqw==
X-CSE-MsgGUID: xc6/8lwPR8yMcU2+Cw2l/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13134082"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="13134082"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 08:36:50 -0700
X-CSE-ConnectionGUID: Cz4ZgxN+Qf+tPT1QThLuOA==
X-CSE-MsgGUID: BUVPUDNdTQG5Hv1NXl1EPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28520349"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 08:36:49 -0700
Date: Mon, 22 Apr 2024 17:36:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Reagan Bohan <reagan@ourmail.work>, Reagan Bohan <xbjfk.github@gmail.com>
Subject: Re: [PATCH 1/3] Define _LARGEFILE64_SOURCE for musl libc
Message-ID: <20240422153633.nxt7bcjnznyiaglu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Reagan Bohan <reagan@ourmail.work>,
 Reagan Bohan <xbjfk.github@gmail.com>
References: <20240421232204.31704-1-reagan@ourmail.work>
 <20240421232204.31704-2-reagan@ourmail.work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240421232204.31704-2-reagan@ourmail.work>
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

Hi Reagan,
On 2024-04-21 at 23:20:46 +0000, Reagan Bohan wrote:
> From: Reagan Bohan <xbjfk.github@gmail.com>

Please subscribe to igt-dev mailinglist, also add here
description of the commit.


> 

Signed-off-by is missing here.

> ---
>  lib/i915/gem_engine_topology.c       | 2 ++
>  tools/i915-perf/i915_perf_recorder.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index afb576afb..9b8fb85e3 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -21,6 +21,8 @@
>   * IN THE SOFTWARE.
>   */
>  
> +#define _LARGEFILE64_SOURCE

Why only in these two files? Maybe better place whould be to
detect musl libc compilation and add it into meson define?

Regards,
Kamil

> +
>  #include <fcntl.h>
>  #include <sys/stat.h>
>  #include <sys/syscall.h>
> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
> index ca4354832..5e7c233dd 100644
> --- a/tools/i915-perf/i915_perf_recorder.c
> +++ b/tools/i915-perf/i915_perf_recorder.c
> @@ -20,6 +20,8 @@
>   * SOFTWARE.
>   */
>  
> +#define _LARGEFILE64_SOURCE
> +
>  #include <assert.h>
>  #include <dirent.h>
>  #include <errno.h>
> -- 
> 2.43.2
> 
