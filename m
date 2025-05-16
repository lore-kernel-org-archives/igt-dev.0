Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E0FC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C908110EB24;
	Fri, 16 May 2025 16:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SP0lNLeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC73C10EB24
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747414010; x=1778950010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SvUKACaaeGFs8xj5ZNiTxjw0Pw084hLfpv+DJaa5lmU=;
 b=SP0lNLeTk+tD7za65bc7xpq8fHCq2a9JSgt2CtYO7SLR5PdH5qniq4b6
 T/4NU/7bkDYx6AfdFk1K/TjKlqBmTgJiZBcpCOhZJSjPPbD5FI95fEm/L
 2hRYUg+mgmXAp7WsZeIsYeRi0TVLt7xkyDczN8STx6ArANs3/+Rmm5fOb
 rDjrOUWQkpBYDUfOxzYFTpy9fWwLLBAj384RaTA2wgUtbKJJOmiThz1b3
 f5DglLvVoil7B/DZmTrG5msKJJyVzI7XVH9QXMTs/Df0552gw1Mc79a5t
 RLTCRG8tX8POihKEa16JU95WjYjf/OLi9LYAG1LqKLrxksmUCqMcLVmMe w==;
X-CSE-ConnectionGUID: +8BbmZn+RU2UOMbeSq9jKQ==
X-CSE-MsgGUID: 5401eW5RS4+AqJgpQkAS3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66797689"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66797689"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:46:50 -0700
X-CSE-ConnectionGUID: ad+wI2pWQ4OO+Xh9qv2QQQ==
X-CSE-MsgGUID: tPvoAH2IRgiT5fP3rrnB6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138481245"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 09:46:48 -0700
Date: Fri, 16 May 2025 18:46:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v6 09/14] lib/igt_core: Implement conditional
 backtrace support using HAVE_LIBUNWIND
Message-ID: <20250516164645.h4vn4h7mmmza2cej@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
 <20250516160551.58760-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516160551.58760-10-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-05-16 at 16:05:46 +0000, Jeevaka Prabu Badrappan wrote:
> Add a log message indicating "backtrace not implemented" in the
> print_backtrace function and return when HAVE_LIBUNWIND is not defined.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 1d7402cb7..097a556c9 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -383,6 +383,9 @@ static int _igt_dynamic_tests_executed = -1;
>  
>  static void print_backtrace(void)
>  {
> +#ifndef HAVE_LIBUNWIND

I added here

#error "an error"

and this did not compile on my machine. You need to add HAVE_LIBUNWIND
into lib/meson.build
For example how to do it please grep for HAVE_VALGRIND
and make similar change.

Regards,
Kamil

> +	igt_info("backtrace not implemented\n");
> +#else
>  	unw_cursor_t cursor;
>  	unw_context_t uc;
>  	int stack_num = 0;
> @@ -440,6 +443,7 @@ static void print_backtrace(void)
>  
>  	if (dwfl)
>  		dwfl_end(dwfl);
> +#endif
>  }
>  
>  __attribute__((format(printf, 2, 3)))
> -- 
> 2.49.0
> 
