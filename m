Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED2ECD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC3310EA85;
	Thu, 11 Apr 2024 12:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC3ocX1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913B10EA85
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712837374; x=1744373374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C7r86fLDTbORTtjnIpraFytSqb+UAEn3EpJMV8NRKt0=;
 b=DC3ocX1mRYJkGapgs7FYNpmoq6mI/o0tLEDzEmrkpHz2k3SwFCKffsu7
 bFW1JUF0GU3c2V7P4LLFZgLX+JQpMFNd80PFLG8/SPTTZoMD551XEgo9i
 hhj5u74bkNY8BoXX2I8fpuKW+XqqNiZP3u0+/PYk9dRCfT12o3y2qg2we
 UUQ/rHb6erns7NMQCW0Nb/NUuVFq0RwIwokUlmsifN6PBP8xd2GzAdQC7
 UDjaGx0/jujovm5sUvYQFAZ1L0WybFfZxOs/l26U278IJ7+UdChsXSiLc
 9vTOYdm9FQcXdyiHwWNXOTPXjo0b1H/MLhGNHb9uJclkpbbh4KTFCw7LB Q==;
X-CSE-ConnectionGUID: 0zp6fSJQTkSpLbeNqma5rw==
X-CSE-MsgGUID: csQjmgIdR/uMX0xc90AtnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11203839"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="11203839"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:09:33 -0700
X-CSE-ConnectionGUID: +OSmuWeOQhCzUiqZCeyi4Q==
X-CSE-MsgGUID: HSwcwnYlS7GXxCk0pn1odA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21378394"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 05:09:33 -0700
Date: Thu, 11 Apr 2024 14:09:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org, andi.shyti@linux.intel.com
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_capture: Fix many-* subtests
Message-ID: <20240411120929.2ndnxsbogbtoki4g@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <me@petersenna.com>,
 igt-dev@lists.freedesktop.org, andi.shyti@linux.intel.com
References: <20240410174031.5840-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240410174031.5840-1-me@petersenna.com>
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
On 2024-04-10 at 19:40:22 +0200, Peter Senna Tschudin wrote:
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
> Using 'e' outside for_each_ctx_engine() is incorrect and this patch
> fixes it. Additionally, this patch moves the 'igt_assert(tmpe);' to
------------------------------------ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Drop this description, that assert should be removed (see below).
Instead, write about a change from assert to skip.

> between the assignment and first use of 'tmpe' to prevent code
> from trying to use a NULL 'tmpe'.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> ---
> 
> Sending as a new patch instead of v8 of the following series:
>  https://patchwork.freedesktop.org/series/131602/
> 
>  tests/intel/gem_exec_capture.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 57b178f3e..8800fa586 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -662,13 +662,20 @@ static bool needs_recoverable_ctx(int fd)
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
> +		for_each_ctx_engine(fd, ctx, tmpe) { \
> +			igt_assert(tmpe); \
------------ ^^^^^^^^^^^^^^^^
Remove this line, it is not needed, when tmpe reaches end then 'for'
loop just stops.

> +			if(gem_class_can_store_dword(fd, tmpe->class)) { \
> +				saved = configure_hangs(fd, tmpe, ctx->id); \
> +				e = &saved.engine; \
>  				break; \
> -		igt_assert(e); \
> -		saved = configure_hangs(fd, e, ctx->id); \
> +			} \
> +		} \
> +		igt_skip_on_f(e == NULL, "no capable engine found\n"); \

You didn't describe this change, please describe functional changes
like this.

You can keep my r-b.

Regards,
Kamil

>  	} while(0)
>  
>  static void many(int fd, int dir, uint64_t size, unsigned int flags)
> -- 
> 2.44.0
> 
