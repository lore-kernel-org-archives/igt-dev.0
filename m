Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03716C27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EAD10E4C1;
	Mon, 10 Jun 2024 16:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8LOTieM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6393310E4C1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037609; x=1749573609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Nl1AZeqaJ3wurEZ7ZR6+MsvmaaPG1Ljx0ZPCCxUhVbM=;
 b=O8LOTieMBj9Oh1Re6E+e28UHsTjdafvyYpjJkzMuOB/h3UDRxQPvL0EY
 FRS0cKeun/MyI/3uk08R7DnTTEzSlrxF0z1Xi+jx1xesXq++DguIT5sd1
 cEatLn3D6sEdAvx5BiBcE0sBggmXxrmj2yjMDjrKrzGRgIvhfzWypfZGn
 G5ruLeoedXRQdx41PcUfsa+pCt+GmIyJlwcNU/3Ip8sNQu1D8ErQznyoY
 Y5sK1n1EUt47J7kpqOMdqSm9aBh2/unvDEWwWgxUoP6sVWkxNd/xaSGiw
 3BHMgf+B50uf05jqbdccGzd4LaWf9lyop2hfCWvKtuKNS8P7mFifyAnYW w==;
X-CSE-ConnectionGUID: l11SVZtAR16H4bMw7QOVmw==
X-CSE-MsgGUID: ShQgziSsQNOhFfVdITFpcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819331"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:40:08 -0700
X-CSE-ConnectionGUID: NqFq28o/Q+iuH0oB7UDLXA==
X-CSE-MsgGUID: bQxhCEa6TgWkq1ctZSK6OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43546168"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 09:40:07 -0700
Date: Mon, 10 Jun 2024 18:39:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/intel/xe_create: Don't assert on presi
 execution
Message-ID: <20240610163951.7j4c52qowi5p5dos@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
References: <20240610071320.1752770-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610071320.1752770-1-balasubramani.vivekanandan@intel.com>
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

Hi Balasubramani,
On 2024-06-10 at 12:43:20 +0530, Balasubramani Vivekanandan wrote:
> create_execqueues subtest is testing the time required for creating
> execqueues along with testing the functionality.
> Presi environments are not for testing performance. We can't use the
> same time limit set for silicon on presi environments as presi would be
> slow.
> Therefore the time limit check is skipped while executing on simulation.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_create.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index d41557c85..76ffdcef2 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -238,9 +238,14 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
>  	}
>  
>  	seconds = igt_seconds_elapsed(&tv);
> -	igt_assert_f(seconds < real_timeout,
> -		     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
> -		     MAXEXECQUEUES, seconds, real_timeout);
> +	if (seconds > real_timeout) {
> +		if (igt_run_in_simulation())
> +			igt_info("Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
> +				 MAXEXECQUEUES, seconds, real_timeout);
> +		else
> +			igt_assert_f(false, "Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
> +				     MAXEXECQUEUES, seconds, real_timeout);
> +	}
>  }
>  
>  /**
> -- 
> 2.25.1
> 
