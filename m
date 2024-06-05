Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E453C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 15:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE0210E250;
	Wed,  5 Jun 2024 15:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xsm3wP9n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB4110E250
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717600623; x=1749136623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cf2WGzkDXead6ejfnp7DjGlsngPJ673/o8Bh4yzS0nQ=;
 b=Xsm3wP9nQE/pc7q+G7chR/TWQd8H3yDW4GmDYOJZc+S4h4ibRc9RZANK
 YhBwRInGp8wuO7cdzAICnIlmN4Lm8GGH142N6Ojhwf8jwxSI9O7xJcUfV
 vr74nwyHGKQw2heCt3xzLhjz8iVxJVzVMRXQm1xgwzwTHrRHkdvzk5ugL
 MC3tFKWqzK21hJ+bPdqx8ZOVofMC9PcIWKGr5MrWdLYJs3xFOBUOzsZ2g
 JjFgumtYMu0g4mhe4+YGjLWSSGZsRmcuKymNXUSOJKEobeMhz25CCbxc9
 BFbvpk+hZuH1g/go0tip/Zuj8sXqR+ZmyJVNJGVkdTH9HK2hHFrfmCKqL Q==;
X-CSE-ConnectionGUID: UNNkrh3tToiL5xYHctQDjQ==
X-CSE-MsgGUID: CjK/vSTwT/y09IyLKt1JJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14338328"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14338328"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 08:17:02 -0700
X-CSE-ConnectionGUID: SStMB6a1QzSKaZf3k40smA==
X-CSE-MsgGUID: 4HhQ5BBmRnSmejPZ6uzVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="42081262"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 08:17:00 -0700
Date: Wed, 5 Jun 2024 17:16:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com,
 peter.senna.tschudin@intel.com
Subject: Re: [PATCH] [PATCH i-g-t] tests/intel/gem_exec_capture: Reduce test
 size
Message-ID: <20240605151642.lrsenbtb5cfpurqe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 andi.shyti@linux.intel.com, peter.senna.tschudin@intel.com
References: <20240330145939.85030-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240330145939.85030-1-me@petersenna.com>
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

Hi Peter,
On 2024-03-30 at 15:59:34 +0100, Peter Senna Tschudin wrote:
> Before this patch, when using a chromebook-level CPU such as the N3150,
> with 8GB of RAM, the test `gem_exec_capture --run-subtest
> many-4K-incremental` could take 4 minutes to complete, and the
> `gem_exec_capture --run-subtest many-4K-zero` could take a minute.
> 
> This patch reduces the test size by half, reducing the time to run by
> half as well.
> 
> Signed-off-by: Peter Senna Tschudin <me@petersenna.com>

This is still running too long for almost all many-* subtests,
one of runs took almost 600s (around 9 minutes).

Could you lower it below 20 seconds?
Andi - do we need an option to make it longer if developer want it?

Regards,
Kamil

> ---
> 
> This patch is only "testable" after my other patch that fixes the test,
> in the first place. As I write this, the other patch is here:
> 
>   https://patchwork.freedesktop.org/series/131602/
> 
>  tests/intel/gem_exec_capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 2afb84283..3f454b897 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -700,7 +700,7 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
>  		  gtt, ram);
>  
> -	count = min(gtt, ram) / 4;
> +	count = min(gtt, ram) / 8;
>  	igt_require(count > 1);
>  
>  	igt_require_memory(count, size, CHECK_RAM);
> -- 
> 2.44.0
> 
