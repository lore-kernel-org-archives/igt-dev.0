Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CD7C54754
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 07:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890F910E20E;
	Mon, 19 May 2025 07:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpW/40mC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BDA10E22D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747640297; x=1779176297;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UzUW1GSZhPEDm9cAkYnf1cy/St3LvwSp88TZHU4KidE=;
 b=kpW/40mCRzoA7NfbHENcr/yxKzRQcWpaSKrXcmTPGqzIGzmT2KIB6jzO
 3ymWIxAt6k2w18LG8gvZKp7xOxT2hTCch60krub8pLmwEpqA6Q0tr4qbI
 KZp0lN4LjihHaWULdtrkht0P+ARGDkkajmVE55r1NNM6+M8IVvEBTBc9F
 6ihtbP24SScXodU61wEugmV2ya+lqneIxsQU+KrjYdsLNiQ5rZf9/NHl7
 1VGWLfkkjsSS7zEXcNrTb+aPJgYNOSmwnDrI9NL9DzX3xCY1JgOldpVJN
 BduMJLi61DG8PpUip4gLnVgPmFwWC/80Fin4JPpoc7/nuJj2y6Y4VB7iH w==;
X-CSE-ConnectionGUID: b/gvVIMHR1mfL/5paIkdfw==
X-CSE-MsgGUID: ZHPvszPsTGipcC6gUBzR8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60920737"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="60920737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:38:15 -0700
X-CSE-ConnectionGUID: DdPRSPkrTWmq9pHLY8zGKQ==
X-CSE-MsgGUID: UomnhKhHTveMyhYh/oGlYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="170200705"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 00:38:11 -0700
Date: Mon, 19 May 2025 09:38:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com, 
 sapna1.singh@intel.com, adrinael@adrinael.net
Subject: Re: [PATCH i-g-t v8 09/14] lib/igt_core: Add a dummy workaround when
 libunwind is not present
Message-ID: <vsjqez5ftlaxyajsctndisxrk7qft47nkurvrhttbmp2a352h7@kdlrynckg7ot>
References: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
 <20250516182704.97912-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516182704.97912-10-jeevaka.badrappan@intel.com>
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

On Fri, May 16, 2025 at 06:26:59PM +0000, Jeevaka Prabu Badrappan wrote:
> If HAVE_LIBUNWIND is not defined, print a log message indicating
> "backtrace not implemented" in the print_backtrace* functions and
> return.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_core.c | 11 +++++++++++
>  meson.build    |  3 +++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 2cea47214..9d1d0fbd5 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -86,7 +86,9 @@
>  #include "runnercomms.h"
>  
>  #define UNW_LOCAL_ONLY
> +#ifdef HAVE_LIBUNWIND
>  #include <libunwind.h>
> +#endif
>  #include <elfutils/libdwfl.h>
>  
>  #ifdef HAVE_LIBGEN_H
> @@ -379,6 +381,9 @@ static int _igt_dynamic_tests_executed = -1;
>  
>  static void print_backtrace(void)
>  {
> +#ifndef HAVE_LIBUNWIND
> +	igt_info("backtrace not implemented\n");
> +#else
>  	unw_cursor_t cursor;
>  	unw_context_t uc;
>  	int stack_num = 0;
> @@ -436,6 +441,7 @@ static void print_backtrace(void)
>  
>  	if (dwfl)
>  		dwfl_end(dwfl);
> +#endif
>  }
>  
>  __attribute__((format(printf, 2, 3)))
> @@ -2237,6 +2243,10 @@ xprintf(const char *fmt, ...)
>  
>  static void print_backtrace_sig_safe(void)
>  {
> +
> +#ifndef HAVE_LIBUNWIND
> +	igt_info("backtrace not implemented\n");
> +#else
>  	unw_cursor_t cursor;
>  	unw_context_t uc;
>  	int stack_num = 0;
> @@ -2256,6 +2266,7 @@ static void print_backtrace_sig_safe(void)
>  				(unsigned int) off);
>  
>  	}
> +#endif

With libunwind-dev package not installed there're warnings:

[234/1981] Compiling C object lib/libigt-igt_core_c.a.p/igt_core.c.o
../lib/igt_core.c:2235:1: warning: ‘xprintf’ defined but not used [-Wunused-function]
 2235 | xprintf(const char *fmt, ...)
      | ^~~~~~~
../lib/igt_core.c:2130:1: warning: ‘xstrlcpy’ defined but not used [-Wunused-function]
 2130 | xstrlcpy(char *dst, const char *src, size_t size)
      | ^~~~~~~~

--
Zbigniew

>  }
>  
>  void __igt_fail_assert(const char *domain, const char *file, const int line,
> diff --git a/meson.build b/meson.build
> index 6a580bd7e..b88098234 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -147,6 +147,9 @@ else
>  endif
>  
>  libunwind = dependency('libunwind', required : get_option('libunwind'))
> +if libunwind.found()
> +	config.set('HAVE_LIBUNWIND', 1)
> +endif
>  build_info += 'With libunwind: @0@'.format(libunwind.found())
>  
>  libdw = dependency('libdw', required : true)
> -- 
> 2.49.0
> 
