Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B40C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 16:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AD110FE2C;
	Tue,  2 Apr 2024 16:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeI0SOcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7193310FE2C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712073989; x=1743609989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iQkb6UNdHcnGLEbq6jg2WkDL0Ttqec/bh085SdAf8DY=;
 b=BeI0SOcWye/yUfUFumSGHq1hVKQFVeFH7vxM6bxLMpPujzzX9cCQFNdI
 gwuJvMHWuqvjCTbln0HEAiWNwZybmpS3raCkWCvjdDzSpHpubqVEtoF2S
 sQ5r+fwp2LJwKMrrTiCqRmrD57jB8a5jBNKSUbw1kQ4+eHwCgrCbRaS+l
 1t1xO8gkENIw027P3C0pnzILX7oSwts26kEVfX8BL84a4qNzfS+y7Tiwu
 WwYOD57PKgMshNaYcJRgBJCPTn9gBeRsrlCTktLITc1Z3NjzBuhamydl4
 Zrxiz8bQ7oWbe0fAwLjaXnqma3h8s+mlxa5hhvrFkL7cXIiH/OIB+exq9 g==;
X-CSE-ConnectionGUID: y2JOMwFWSDaUWMGmFqmphg==
X-CSE-MsgGUID: 2uospfskQrO34RIIvfieEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11091132"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="11091132"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 09:06:28 -0700
X-CSE-ConnectionGUID: Kl2dtQPhSquC0B1/c7IxDw==
X-CSE-MsgGUID: v0VTfPCMS/C2V+r0HgBq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="22575858"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 09:06:27 -0700
Date: Tue, 2 Apr 2024 18:06:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com
Subject: Re: [PATCH i-g-t v6 1/2] tests/intel/gem_exec_capture: Fix many-*
 subtests
Message-ID: <20240402160625.uj7owqpikixecjpw@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 andi.shyti@linux.intel.com
References: <20240327065928.5522-1-me@petersenna.com>
 <20240330141951.84598-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240330141951.84598-1-me@petersenna.com>
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
On 2024-03-30 at 15:19:31 +0100, Peter Senna Tschudin wrote:
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
> This patch fixes the issue in two steps:
>  1. Moves the call to configure_hangs() to inside the for loop, where
>     '*e' is valid because there are no issues with scope and lifetime of
>     'ed'.
>  2. Adds `e = &saved.engine;` to the end of
>     find_first_available_engine(). The reason why this works is twofold:
>     First 'saved' has the same content as e had when there were no
>     variable scope and lifetime issues. Second both '*e' and 'saved' are
>     defined in many() meaning that they both have the same scope and
>     lifetime.
> 
>  v6: new commit message; moves igt_assert(e); to before the call to
>      configure_hangs(). This check is there because '*e' is set by
>      intel_get_current_engine() which will return NULL if ed->n >=
>      ed->nengines.
> 
> Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> ---
>  tests/intel/gem_exec_capture.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 57b178f3e..a8348f21b 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -665,10 +665,12 @@ static bool needs_recoverable_ctx(int fd)
>  		ctx = intel_ctx_create_all_physical(fd); \
>  		igt_assert(ctx); \
>  		for_each_ctx_engine(fd, ctx, e) \
> -			for_each_if(gem_class_can_store_dword(fd, e->class)) \
> +			for_each_if(gem_class_can_store_dword(fd, e->class)) { \
> +				igt_assert(e); \
--------------- ^
Why do you assert here? If it will be NULL code would blow at line
above, where e->class is used.

Regards,
Kamil

> +				saved = configure_hangs(fd, e, ctx->id); \
>  				break; \
> -		igt_assert(e); \
> -		saved = configure_hangs(fd, e, ctx->id); \
> +			} \
> +		e = &saved.engine; \
>  	} while(0)
>  
>  static void many(int fd, int dir, uint64_t size, unsigned int flags)
> -- 
> 2.44.0
> 
