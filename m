Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39D9C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 18:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB8C10FF3F;
	Wed, 27 Mar 2024 18:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJbFXmhX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBDB10FF3F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711565030; x=1743101030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g56jWZJ8jV+o7unzo/pnR6k0uyoMjPjo58Zs04FIMe4=;
 b=nJbFXmhXRFC63Q5Qeee8WqG6P3zp5+ArFMZ9ynyVCBNR7ZWg6vCV8lic
 BZvLnQPRzWzfL3oF15vW5I0thyVLpum1fbvsnDBEETdFil8vv+J6msNXk
 Flrx0UxqQBYKNJ4jXE5xnuBU/FU5PWB267z3Q6hDidqpyiGajYt0vIWXj
 +xKe4uvqfzqoAAwvZlMsoYEhvQt9YN/yRRzikI9x8m1rIdFyvVtPztrM3
 S4zKPDSVzpfqJiG8DjHBJXlkZQwKuaadq7OGhVuC8B6ld9epRIcc8Atxr
 +R5nhy8vaZxWax4E7jo0t4IjulGmG6Uw3z6U27ht3SyXTvH1MHY7IUgzZ g==;
X-CSE-ConnectionGUID: wxdDsaXETbq3kVZ5ReB+Ow==
X-CSE-MsgGUID: 0NYLjYR2Qg+4hCKCNo1kjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17324819"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="17324819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="21097294"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 11:43:49 -0700
Date: Wed, 27 Mar 2024 19:43:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com
Subject: Re: [PATCH i-g-t v4] Fix memory access issue due to variable block
 scope
Message-ID: <20240327184330.a3be36wl6tzveqrq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 andi.shyti@linux.intel.com
References: <20240327065928.5522-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240327065928.5522-1-me@petersenna.com>
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
On 2024-03-27 at 07:59:27 +0100, Peter Senna Tschudin wrote:

One nit about subject, as you can see on patchwork
https://patchwork.freedesktop.org/project/igt/series/?ordering=-last_updated

we use test name as prefix for a patch, so instead of:

[PATCH i-g-t v4] Fix memory access issue due to variable block

it should be:

[PATCH i-g-t v4] tests/intel/gem_exec_capture: Fix many-* subtests

> This patch fixes the tests many-4k-incremental and many-4k-zero from
> gem_exec_capture that are currently failing with an invalid file
> descriptor error.
> 
> tests/intel/gem_exec_capture.c
>     many(), userptr(), capture_invisible()
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
> region, to avoid the block scope of ed.
> 
> v4: Move `saved = configure_hangs(fd, e, ctx->id);` to inside the for
> loop where it is safe to use 'e'. This is because 'e' points to an
> element of a variable that is defined with the block scope of the for
> loop.

Yes, this way it works but I still think it would be better
to use function for it.

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

Yes, it is a fix for a problem but something strange is
happening here, imho we need to debug it more.

>  				break; \
>               } \
>               e = &saved.engine; \
>       		igt_assert(e); \

Two above lines are not needed, 'e' will always be != NULL.

Regards,
Kamil

> -		saved = configure_hangs(fd, e, ctx->id); \
>  	} while(0)
>  
>  static void many(int fd, int dir, uint64_t size, unsigned int flags)
> -- 
> 2.44.0
> 
