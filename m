Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E709CD1284
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 15:49:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200271124A5;
	Thu, 28 Mar 2024 15:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGiVw1Lr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB5D1124A5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711640987; x=1743176987;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MT/ZHHju6TJbFHp6GVsuUAUAHwbV4PftI4B9vDtCJyo=;
 b=jGiVw1LrSbQYDrJnzNX3tfke33oAY6C6Og/jft7PFPUF6c79Xs0OQsfA
 i8/IpFmilNYH54QMaYlrNV+zezjxuMmpGD07fvCvTySqeXDzR1BkT9RI7
 /JhE7FF/8UyapM40eGt4a7n+GrYjhSxkBKYuHLmEtuQ7V8nFbVjFeoITq
 ytallVmGAfESlZf8y683pQ2dGOv4Zu57LW9GYl9AhezLbHzLpt/60msKS
 JDSL8gaq/2JO1Crz1Szuj2lZeivaFgrzIjuaHcK8DiY/g1w0LMmaDZ9hR
 9a6FIwPE4H5WZKlG136TnpfKOjNnmqIJnoUXpPaJG4VEeUSYXX/WtowfC g==;
X-CSE-ConnectionGUID: efsHpArNQCqhhrqihSta8w==
X-CSE-MsgGUID: xFak418bT8iTmB9gahktiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24288029"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="24288029"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 08:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16710467"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 08:49:45 -0700
Date: Thu, 28 Mar 2024 16:49:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com
Subject: Re: [PATCH i-g-t v5] tests/intel/gem_exec_capture: Fix many-* subtests
Message-ID: <20240328154923.bpwkpi5u3lfek4wj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 andi.shyti@linux.intel.com
References: <20240327065928.5522-1-me@petersenna.com>
 <20240328124335.6109-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240328124335.6109-1-me@petersenna.com>
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
On 2024-03-28 at 13:42:51 +0100, Peter Senna Tschudin wrote:
> This patch fixes the tests many-4k-incremental and many-4k-zero from
> gem_exec_capture that are currently failing with an invalid file
> descriptor error.
> 
> tests/intel/gem_exec_capture.c
>     many(), userptr(), capture_invisible()

Please cite error log, delete two above lines and write that problem
is with macro find_first_available_engine() (you later describe in datails).

>         find_first_available_engine()
>             for_each_ctx_engine()
>                 for_each_ctx_cfg_engine()
> 
> find_first_available_engine() expects a struct intel_execution_engine2
> *e as parameter. for_each_ctx_cfg_engine() allocates a struct
> intel_engine_data ed inside a for loop and then update e to point to an
> element of ed.
> 
> The problem is that ed has the block scope of the for loop, and trying
> to access its content through e after the for loop has ended creates
> undefined behavior.
> 
> This patch updates e to point to the same content at a different memory
> region, to avoid the block scope of ed. `e = &saved.engine;` updates e
> to point to the same content but without scope restrictions as both
> saved and e have the scope of the calling function.
> 
> v5: Update subject and commit message.
> 
> Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> ---
>  tests/intel/gem_exec_capture.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 57b178f3e..f7b10bdd4 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -665,10 +665,12 @@ static bool needs_recoverable_ctx(int fd)
>  		ctx = intel_ctx_create_all_physical(fd); \
>  		igt_assert(ctx); \
>  		for_each_ctx_engine(fd, ctx, e) \
> -			for_each_if(gem_class_can_store_dword(fd, e->class)) \
> +			for_each_if(gem_class_can_store_dword(fd, e->class)) { \
> +				saved = configure_hangs(fd, e, ctx->id); \
>  				break; \
> +			}  \
> +		e = &saved.engine; \

Ok, we need 'e' later on, so it is ok.

>  		igt_assert(e); \

But this assert do no work, it will always succeed. Imho here
code should check if it actually saved anything, so what about:

#define find_first_available_engine(fd, ctx, e, saved) \
    do { \
        bool no_dw_store_engine = true; \
        \
        ctx = intel_ctx_create_all_physical(fd); \
        igt_assert(ctx); \
        for_each_ctx_engine(fd, ctx, e) \
            for_each_if(gem_class_can_store_dword(fd, e->class)) { \
                saved = configure_hangs(fd, e, ctx->id); \
                no_dw_store_engine = false; \
                break; \
            }  \
        e = &saved.engine; \
        igt_skip_on(no_dw_store_engine); \
    } while(0)


Regards,
Kamil

> -		saved = configure_hangs(fd, e, ctx->id); \
>  	} while(0)
>  
>  static void many(int fd, int dir, uint64_t size, unsigned int flags)
> -- 
> 2.44.0
> 
