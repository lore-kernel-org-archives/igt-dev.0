Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4202C5AD49
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 18:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821510E1BF;
	Fri, 30 May 2025 18:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQkYkm07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993C010E1BF
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748629906; x=1780165906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Jl1mY2xmNBC7KXXGPMzLTWblKFdujHa92K2HlNq7i9Q=;
 b=bQkYkm07dQTwoYnr2NzJGOFhacCi9l3KQ2uQf3hja66zLb9/aOYlLS15
 UUzoWTj81vEERdMxA/TdsDX5dG2dN/tEgTfE3x93EQUqZm+53wIJes+yS
 E/LUjMeyrc8RDCzBRjQYc+tM1Nj3N9B2lWG+PJodWPblNb67SIXWqroWW
 uuD1mFZzTC4z1pMRhweg3lt4EAHxrSxhZMZFAj8rW6RssBXt4BbOxM1/Q
 UGi45a8UCe8FO1EKlGtNHwGUH+zN/KE8eldfIiOw0QLYa2VPIRsgLegfv
 JA2HRyLhfh2SKthXllMJlB4PDpV1dqgxL5FLqfr8+U3LK3ctV7jDf/jj9 A==;
X-CSE-ConnectionGUID: 11+0VgPpTtmJe5e7ezjBJw==
X-CSE-MsgGUID: /vIWY693QQmGrfkYIPv6VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61785057"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="61785057"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 11:31:45 -0700
X-CSE-ConnectionGUID: 4BAd27QSRDW+jH8q7zQDug==
X-CSE-MsgGUID: FS/YVOrURXWyJ1nIoe6i0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="143914268"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:31:43 -0700
Date: Fri, 30 May 2025 20:31:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v11 2/7] lib: Include local igt procps, glib header
 for Android
Message-ID: <20250530183140.4t62wd2lbclx2zxe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
 <20250529171246.74375-3-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250529171246.74375-3-jeevaka.badrappan@intel.com>
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
On 2025-05-29 at 17:12:41 +0000, Jeevaka Prabu Badrappan wrote:
> As procps, glib are not available in Android, added local stub
> procps, glib headers to build igt for Android.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_aux.c           | 6 +++++-

Please split this into separate patch.

[PATCH i-g-t vNN x/y] lib/igt_aux: Include local igt procps header for Android

>  lib/igt_chamelium.c     | 4 ++++
>  lib/igt_core.c          | 4 ++++
>  lib/igt_rc.h            | 4 ++++
>  lib/intel_batchbuffer.c | 4 ++++

Split rest changes into:

[PATCH i-g-t vNN x/y] lib: Include local igt glib header for Android

>  5 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 2905824a5..92adcf70b 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -55,10 +55,14 @@
>  
>  #ifdef HAVE_LIBPROCPS
>  #  include <proc/readproc.h>
> -#else
> +#elif HAVE_LIBPROC2
>  #  include <libproc2/pids.h>
>  #endif
>  
> +#ifdef ANDROID
> +#include "android/procps.h"
> +#endif
> +

Please move it inside HAVE_LIBPROC... like:

#elif HAVE_LIBPROC2
#  include <libproc2/pids.h>
#else
#  ifdef ANDROID
#    include "android/procps.h"
#  endif
#endif

Regards,
Kamil

>  #endif

>  #include <dirent.h>
>  #ifdef __linux__
>  #  include <libudev.h>
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index a96e36b5b..d19a78ffa 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -33,7 +33,11 @@
>  #include <xmlrpc-c/base.h>
>  #include <xmlrpc-c/client.h>
>  #include <pthread.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "android/glib.h"
> +#endif
>  #include <pixman.h>
>  #include <cairo.h>
>  
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index b06cdfd89..c2674a272 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -55,7 +55,11 @@
>  #include <limits.h>
>  #include <locale.h>
>  #include <uwildmat/uwildmat.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "android/glib.h"
> +#endif
>  
>  #include "drmtest.h"
>  #include "i915/gem_create.h"
> diff --git a/lib/igt_rc.h b/lib/igt_rc.h
> index 53e5ce669..d871b3b26 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -25,7 +25,11 @@
>  #ifndef IGT_RC_H
>  #define IGT_RC_H
>  
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "android/glib.h"
> +#endif
>  
>  extern GKeyFile *igt_key_file;
>  
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 03ce65ded..af0547281 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -26,7 +26,11 @@
>   **************************************************************************/
>  
>  #include <search.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "android/glib.h"
> +#endif
>  
>  #include "gpgpu_fill.h"
>  #include "huc_copy.h"
> -- 
> 2.49.0
> 
