Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AFBCD1284
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 13:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D05112D73;
	Tue,  9 Apr 2024 13:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDr8lssu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7D5112D74
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712667735; x=1744203735;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6hrEgFJrl+fRDVoERleK3wO7cYugsjz/PwCENDqXg00=;
 b=bDr8lssuYRlyG+f5heIS224daMy0Vrv9kNlmTpd2zaqLgYEXnlq+osfu
 6C8Nlt5OzO4PpFkQVIqenNZeFGZhYN03xmuYbxcjED+5+EX/vs58Urrg/
 GAQB8rrZOG2bxVRpFJlHyJM9ybhTwZIlHVtIgfDD1XyY9DwNlU5QR4M0V
 b7YAh/sPqQcQdO1vco1eiXDh8MR5E20Ts4rY4hse/JrSavdGvG0rSxIvR
 4Y2KiKCNDtiCAUm4wGvYCtufiJ68UhNY/qkx/2fogfXCTK4bfvjc22KEl
 to45MBt9XX5aCiBO8W6Nsyo2Tbcfa2LHOOGFg0AL9+DixQb7pMin5eDoD g==;
X-CSE-ConnectionGUID: hnDo6VLASkqe/n6gASgBFg==
X-CSE-MsgGUID: jRBsVtqMTbe3j6w/41ylXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8156876"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8156876"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:02:15 -0700
X-CSE-ConnectionGUID: e1KdPGQXQ0GDHMz5KDsliQ==
X-CSE-MsgGUID: 6w/GC7NLTTiIhRQR+Pq9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20673253"
Received: from unknown (HELO intel.com) ([10.247.118.252])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:02:12 -0700
Date: Tue, 9 Apr 2024 15:02:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Peter Senna Tschudin <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: Re: [PATCH] [PATCH i-g-t] tests/intel/gem_exec_capture: Reduce test
 size
Message-ID: <ZhU8TXtNsfE5srRp@ashyti-mobl2.lan>
References: <20240330145939.85030-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Sat, Mar 30, 2024 at 03:59:34PM +0100, Peter Senna Tschudin wrote:
> Before this patch, when using a chromebook-level CPU such as the N3150,
> with 8GB of RAM, the test `gem_exec_capture --run-subtest
> many-4K-incremental` could take 4 minutes to complete, and the
> `gem_exec_capture --run-subtest many-4K-zero` could take a minute.
> 
> This patch reduces the test size by half, reducing the time to run by
> half as well.
> 
> Signed-off-by: Peter Senna Tschudin <me@petersenna.com>

Acked-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

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
