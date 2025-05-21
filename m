Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A485CC54E71
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 16:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7909D11A686;
	Wed, 21 May 2025 16:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFrP2SEi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F2511ABBE
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747845896; x=1779381896;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fTRumaEfbvbvxf1XH6Z5Jp7NDIpg95H2xvwt22IdaPA=;
 b=cFrP2SEiIcoFxvBjXTMEoyp9gdBby6KVQp1yZGvWPsLEacLmmyaQIg1j
 wJ7iNA6kVn4ez2UUmDXDdeTP7MJvJyoDTSle4Y8H4lDz8Su88cQH0Yuxy
 w/K4j0DCdGX8SVAEh4PVAiJdbLCqN18Lus+U0q3lgP64MfxhXn0N89zIy
 Om4Lfa3VAihNsDEPWbUVzLw4hAIXvf04N0oXDNDtmWbgmWZVP7ab4PKoW
 wXvoYIcRtkIWTB+nQRMNynhf7D2Bwj+KZpLxGNP+4pSJNNYkJg7cb9ZPq
 P6rdI5Son2aQ+9Y+U63Oirsb/4Lg2MHoIGGpxyNPUbRrjM0HR5PSQMV+R w==;
X-CSE-ConnectionGUID: lFIsNTP+SSKGOKHONzNgaQ==
X-CSE-MsgGUID: yIsB/yOOQ6+UoqNy+VZwDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="37456396"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="37456396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:44:55 -0700
X-CSE-ConnectionGUID: vzPqhN2UR4yBNZ2LexYk4Q==
X-CSE-MsgGUID: rkl8sSVhToiVAY2WDDUGGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="171152112"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:44:53 -0700
Date: Wed, 21 May 2025 18:44:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v9 09/14] lib/igt_core: Add a dummy workaround when
 libunwind is not present
Message-ID: <20250521164439.64cdwpgnsckcvib7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
 <20250519151135.43874-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519151135.43874-10-jeevaka.badrappan@intel.com>
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
On 2025-05-19 at 15:11:30 +0000, Jeevaka Prabu Badrappan wrote:
> If HAVE_LIBUNWIND is not defined, print a log message indicating
> "backtrace not implemented" in the print_backtrace* functions and
> return.
> 
> As xputch, xpow, printnum, xstrlcpy, xprintfmt, xprintf are used
> by backtrace functions, enabled those only if HAVE_LIBUNWIND is defined.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I will merge this and also few others:

lib/igt_device_scan: Replace rindex with strrchr
lib/igt_core: Add a dummy workaround when libunwind is not present
lib/igt_core: Conditionally define __noreturn
tools/intel_gpu_top: Replace index with strchr
tools/gputop: find program name from command line

Regards,
Kamil

> ---
>  lib/igt_core.c | 13 +++++++++++++
>  meson.build    |  3 +++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 2cea47214..679683958 100644
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
> @@ -2082,6 +2088,7 @@ static void write_stderr(const char *str)
>  	__write_stderr(str, strlen(str));
>  }
>  
> +#ifdef HAVE_LIBUNWIND
>  static const char hex[] = "0123456789abcdef";
>  
>  static void
> @@ -2234,9 +2241,14 @@ xprintf(const char *fmt, ...)
>  	xprintfmt(fmt, ap);
>  	va_end(ap);
>  }
> +#endif /* HAVE_LIBUNWIND */
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
> @@ -2256,6 +2268,7 @@ static void print_backtrace_sig_safe(void)
>  				(unsigned int) off);
>  
>  	}
> +#endif
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
