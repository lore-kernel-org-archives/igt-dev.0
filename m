Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5067C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 15:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEE110EE70;
	Fri, 19 Apr 2024 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DagFGght";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8959210EE70
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713539209; x=1745075209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mAasHi2ugbar3q3HvcX/45H81+wVvZ+tA5bzpIufnfI=;
 b=DagFGght7CiebJoBZiVIvbsh/lSg+SQNCsQ0MW7xZ52IZoThJKU4mdn0
 2ZxZjWMgrVh1rSVJYoT9jgkJ2vyJRa257gu3ofglz55BXjRcpvbmeFzT2
 +ceijDaonmCBDvyT56QxVzqwSC6sUao/NoIJyMHYDfHgpBTQMPOU/+GXY
 aRacJLlFDDKFtGh5OdYRwwddgr9AuRRHTqe0ycJRfG2doxtiDpIWrcbO9
 DI5BwHA9V5okRxRTrGT9vwTZXUs7sid/LvOzOO64VGxcT4g3OSOojspQm
 Yu2yuV3NnJ4uky9nJeUYTsoPFxj24EoZCt2Gs/URlDYgho2lfYsOwwdtl w==;
X-CSE-ConnectionGUID: +j3AbXFBT7uFUs7uDt97gQ==
X-CSE-MsgGUID: qdzW7ifdRGmt6xZ7WvBF9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20535429"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20535429"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:05:57 -0700
X-CSE-ConnectionGUID: GAkDdUM8QK2x5vZma0n4Fw==
X-CSE-MsgGUID: gcixcP8tQsqzMNkbPf0zGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="27988611"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 08:05:56 -0700
Date: Fri, 19 Apr 2024 17:05:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_capture: Fix many-* subtests
Message-ID: <20240419150553.gpb33q7tw4absj3m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 andi.shyti@linux.intel.com
References: <20240410174031.5840-1-me@petersenna.com>
 <20240411195348.10881-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240411195348.10881-1-me@petersenna.com>
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
On 2024-04-11 at 21:53:34 +0200, Peter Senna Tschudin wrote:
> Currently trying to run `gem_exec_capture --run-subtest
> many-4K-incremental` or `gem_exec_capture --run-subtest many-4K-zero`
> will fail with:
> 
>  (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Test
>  assertion failure function gem_engine_properties_configure, file
>  ../lib/i915/gem_engine_topology.c:577:
>  (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Failed assertion: ret == 1
>  (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: Last errno: 9, Bad file descriptor
>  (gem_exec_capture:81999) i915/gem_engine_topology-CRITICAL: error: -1 != 1
> 
> This problem happens inside the macro find_first_available_engine()
> when:
>  1. for_each_ctx_engine() allocates an struct intel_engine_data 'ed'
>     inside a for loop. The core of the issue is that ed only exists
>     inside the for loop. As soon as the for loop ends, ed is out of scope
>     and after it's lifetime.
>  2. intel_get_current_engine() sets '*e' to an address of ed. This is ok
>     while inside the for loop, and is undefined behavior after the for
>     loop ends.
>  3. configure_hangs() uses '*e' after the lifetime of 'ed' has ended
>     leading to undefined behavior
>  4. After the call to find_first_available_engine() __captureN() will
>     fail as it expects '*e' to be valid. This is also undefined
>     behavior.
> 
> Additionally, this patch sets 'e' to NULL early on at the macro, and at
> the end check if it is still NULL. If so it will skip the test to
> prevent downstream code from crashing.

Strictly speaking we are not preventing crash but catch a case
when test cannot proceed (as it needs capable engine),
so then we skip it. Btw I plan on re-testing it on Monday and
merge it next week with that small description correction.

Regards,
Kamil

> 
>  v2: removed the 'igt_assert(tmpe)'; added the explanation about
>      checking if e is still NULL by the end of the macro to decide to skip
>      the test or not.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> ---
>  tests/intel/gem_exec_capture.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 57b178f3e..e6598ec42 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -662,13 +662,18 @@ static bool needs_recoverable_ctx(int fd)
>  
>  #define find_first_available_engine(fd, ctx, e, saved) \
>  	do { \
> +		struct intel_execution_engine2 *tmpe = NULL; \
> +		e = NULL; \
> +		\
>  		ctx = intel_ctx_create_all_physical(fd); \
>  		igt_assert(ctx); \
> -		for_each_ctx_engine(fd, ctx, e) \
> -			for_each_if(gem_class_can_store_dword(fd, e->class)) \
> +		for_each_ctx_engine(fd, ctx, tmpe) \
> +			if(gem_class_can_store_dword(fd, tmpe->class)) { \
> +				saved = configure_hangs(fd, tmpe, ctx->id); \
> +				e = &saved.engine; \
>  				break; \
> -		igt_assert(e); \
> -		saved = configure_hangs(fd, e, ctx->id); \
> +			} \
> +		igt_skip_on_f(e == NULL, "no capable engine found\n"); \
>  	} while(0)
>  
>  static void many(int fd, int dir, uint64_t size, unsigned int flags)
> -- 
> 2.44.0
> 
