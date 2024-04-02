Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AD5C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 16:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4123210E7B7;
	Tue,  2 Apr 2024 16:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKJVi4Z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7399B10E7B7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712074650; x=1743610650;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DdUzZF9bkBcJ0dM1AmDe50+uZbZCUNtVQbCQfav88PQ=;
 b=dKJVi4Z+l7481IYS8DqEuY+eXWBf4VPj3zDTaJdjgdGXIA9viDXkuorY
 rM9qPbkm1jyfdqH4uNMMjZTQi+fWFTqb1XlhS7sRxJTioXcZH4bjBBuVh
 bqGgw1GQC4uOdhwjhdZl5m3fJscO4yLIUyKSqOHNbaSfamiEaxwzdndy5
 WYCHo18h/Jeyi9VueiH1aXaAegPSvyKs9nAhv3W2ku2vLubv0IlPJ8tkp
 NYhMwnSwah2IDQOwPHOv6zcU/qkrn9rXUh1hUZmcQtjeM/bzatYcCvLXO
 9QoSoeCfg3dFqSpU8Dh9u87FpXjeauHPLjSRxbc9BRNKa7C7YkcF1MwFI g==;
X-CSE-ConnectionGUID: HeO33KzzSS+ii73+m3NUQw==
X-CSE-MsgGUID: spXjetPqTV2Nj1VdY0oZTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32657451"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="32657451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 09:17:29 -0700
X-CSE-ConnectionGUID: Ra5e62yUSBqhVP0aHuUYdA==
X-CSE-MsgGUID: LgMPa0sET82nts7tisY5Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="22767076"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 09:17:28 -0700
Date: Tue, 2 Apr 2024 18:17:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com
Subject: Re: [PATCH i-g-t v6 2/2] Skip the test when no engines are found
Message-ID: <20240402161725.sdoizdpsm73yj47a@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 andi.shyti@linux.intel.com
References: <20240327065928.5522-1-me@petersenna.com>
 <20240330141951.84598-1-me@petersenna.com>
 <20240330141951.84598-2-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240330141951.84598-2-me@petersenna.com>
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
On 2024-03-30 at 15:19:32 +0100, Peter Senna Tschudin wrote:
> This patch calls igt_skip() when no engines are found by
> find_first_available_engine() preventing downstream code from crashing.

I would prefer to have this change in one patch.

> 
> Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> ---
>  tests/intel/gem_exec_capture.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index a8348f21b..2afb84283 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -665,10 +665,12 @@ static bool needs_recoverable_ctx(int fd)
>  		ctx = intel_ctx_create_all_physical(fd); \
>  		igt_assert(ctx); \

If 'e' is causing problems here, maybe introduce new var 'tmpe'?
So you can start with:

        e = NULL;
  		for_each_ctx_engine(fd, ctx, tmpe) \

then use tmpe->engine and after for_each... loop you may add
igt_skip_on_f(e == NULL, "no capable engine found\n");

> -			for_each_if(gem_class_can_store_dword(fd, e->class)) { \
> +			if(gem_class_can_store_dword(fd, e->class)) { \

This looks much better, you replaced confusing macro with if()

>  				igt_assert(e); \
>  				saved = configure_hangs(fd, e, ctx->id); \
>  				break; \
> +			} else { \
> +				igt_skip("find_first_available_engine(): No engine available\n"); \

This do not solve a problem, you may have capable engine later on
as there is for_each... loop.

>  			} \
>  		e = &saved.engine; \

If using 'tmpe' this should be before 'break;' line and here
you should place igt_skip_on_f()

Regards,
Kamil

>  	} while(0)
> -- 
> 2.44.0
> 
