Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A30C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 17:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B7C10E118;
	Wed, 30 Apr 2025 17:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGky5K6M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A76210E118
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 17:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746034026; x=1777570026;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YEWwssVHD67oDMh13IA4D/x/3zbfCLZsh1ldU78J+AI=;
 b=RGky5K6MztlnzXEMIxUCRRyF8r2I4w1szBocNbruy6dvyqKHaSUNz2j+
 bX65idGyyjlewzQ1NVPpzuurphEgubThx7TK4V/XtmaFBL2H17uu22sMx
 nbuNYLugms/OQWWv/Ym8kNUXGFKJe3FcuAPOB42Hlng6hm+s3R0w3ZAiP
 cwFITN0+Qa2JgVo5tXiY4Nm+YUoeFBrYyYiW6cdziT0rDkvcSGXFTDpnt
 fotvEQWJKgujS3urxVUbtYIkZ1bEA6wYnv292MoiB7EuTHMwQ6MvAvUtM
 Tg+cZPX3AJ3vjqU68zDknwMbPN9w/vklzDgHEdJjzJb+TJRnIHZY1rWpv g==;
X-CSE-ConnectionGUID: bbxL2i/6S4mupST+I4mi3A==
X-CSE-MsgGUID: jRPAd3c9TF2NRwiJ151XKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="51371831"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="51371831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 10:27:05 -0700
X-CSE-ConnectionGUID: lFJOM2h9SK+JJU7FqBRQJg==
X-CSE-MsgGUID: zOtZnZHpTj6Mndfx7dqRng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="139360213"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 10:27:02 -0700
Date: Wed, 30 Apr 2025 19:26:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, sapna1.singh@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH 5/5] igt-gpu-tools: Changes to compile for Android
Message-ID: <20250430172659.i2wdud32l4hjggt2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, sapna1.singh@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
 <20250429204000.41537-6-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429204000.41537-6-jeevaka.badrappan@intel.com>
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
On 2025-04-29 at 20:40:00 +0000, Jeevaka Prabu Badrappan wrote:
> Changes done to compile for android:
> -  __noreturn and PAGE_SIZE are already defined in Android,
> undef and then define it.
> - define strchrnul for Android
> - Replace index with strchr

Please split this into patches for lib/igt_core, lib/igt_kmod,
tests/intel/xe_create and tools/intel_gpu_top

+cc Zbigniew

> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_core.c          |  4 ++++
>  lib/igt_core.h          |  1 +
>  lib/igt_kmod.c          | 10 ++++++++++
>  tests/intel/xe_create.c |  1 +
>  tools/intel_gpu_top.c   |  2 +-
>  5 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index e1061a2ed..519600dfa 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -373,6 +373,9 @@ static bool stderr_needs_sentinel = false;
>  
>  static int _igt_dynamic_tests_executed = -1;
>  
> +#ifdef ANDROID
> +static void print_backtrace(void) {}

Please print something like "backtrace not implemented\n"

> +#else
>  static void print_backtrace(void)
>  {
>  	unw_cursor_t cursor;
> @@ -433,6 +436,7 @@ static void print_backtrace(void)
>  	if (dwfl)
>  		dwfl_end(dwfl);
>  }
> +#endif // ANDROID

Use C-style comments /* ANDROID */

>  
>  __attribute__((format(printf, 2, 3)))
>  static void internal_assert(bool cond, const char *format, ...)
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 45170e215..7add65938 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -86,6 +86,7 @@
>  #define igt_assume(e) BUILD_BUG_ON_INVALID(e)
>  #endif
>  
> +#undef __noreturn

Either for ANDROID or use:

#ifndef __noreturn
...
#endif

>  #define __noreturn __attribute__((noreturn))
>  #define __maybe_unused __attribute__((unused))
>  
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 14b6b957a..d0a7372b8 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -765,6 +765,16 @@ igt_amdgpu_driver_unload(void)
>  	return IGT_EXIT_SUCCESS;
>  }
>  
> +#ifdef ANDROID
> +char *strchrnul(const char *s, int c)
> +{
> +	while (*s && *s != (char)c) {
> +		s++;
> +	}
> +	return (char *)s;
> +}
> +#endif
> +
>  static void kmsg_dump(int fd)
>  {
>  	char record[4096 + 1];
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index b22084c84..264b2ae37 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -18,6 +18,7 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#undef PAGE_SIZE
>  #define PAGE_SIZE 0x1000

Please add to Cc developer which added this. imho this should be:

int page_size = 0x1000;

and used in this test.

Or what about:

#define IGT_PAGE_SIZE 0x1000

or other name like GPU_PAGE_SIZE

There are many places in igt source where PAGE_SIZE is used so why
change is only here? If you will want to change more, please split
big patches to some smaller portions.

>  static struct param {
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 68d27089b..54e71e559 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -290,7 +290,7 @@ get_pmu_config(int dirfd, const char *name, const char *counter)
>  	if (ret <= 0)
>  		return -1;
>  
> -	p = index(buf, '0');
> +	p = strchr(buf, '0');

Good change, index is deprecated.

Regards,
Kamil

>  	if (!p)
>  		return -1;
>  
> -- 
> 2.49.0
> 
