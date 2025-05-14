Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C634C3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 11:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC40B10E620;
	Wed, 14 May 2025 11:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9YXT/hn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E445910E628
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747223559; x=1778759559;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JP8kh1h50OHeLVUUbfqvT53dftTV04aiN73i/PvnMAs=;
 b=b9YXT/hnSbukVlBWc8njvVov+P+Nwzd0/7xUQAoIJkkqUDrvChUy7+5Z
 s7ZdaiExoJkvZJasqf8MDAyMN2bzMOijbO55o9vriNj+n7aN1wgb1yH9B
 ANMNtIwBRpf7nmquJ762ibFfqVlN3jo+p2WUZsxXBmHo7x4/Hh+tYa5+S
 1ciDO2786WcqAnei8+MFssQwXaGm7NEmgF7nBZyUqQ2ja20OUnXLRsojp
 Bl7NxLK2hwb36VcDObqYJYrIDM0iFUCmqaQdspqThG+rnHLmbJXP1gBXA
 //eWdKFPHSlLklAyBMzHTitY9uSywAfu9B9Vi2F8/AvC1XqwEhuMsaljy Q==;
X-CSE-ConnectionGUID: 7xTbbNoXR82ur3+R6e1Fqw==
X-CSE-MsgGUID: sJ34nLs8SaGzKQaTeSv7WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36739427"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="36739427"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:52:38 -0700
X-CSE-ConnectionGUID: IpS9ahxdQ7uPB1o0SOJHNg==
X-CSE-MsgGUID: wo3ZMIxCQ42yivoHrGpMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138542483"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:52:36 -0700
Date: Wed, 14 May 2025 13:52:32 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 02/15] lib: Include local igt procps, glib and unwind
 header for Android
Message-ID: <v62pnefbrmmgqnly72adkmw2pdaelrajesljlvinzz3djz3vce@kv5br7rbx7fv>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-3-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507160148.53857-3-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:35PM +0000, Jeevaka Prabu Badrappan wrote:
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_aux.c           | 4 ++++
>  lib/igt_chamelium.c     | 4 ++++
>  lib/igt_core.c          | 8 ++++++++
>  lib/igt_rc.h            | 4 ++++
>  lib/intel_batchbuffer.c | 4 ++++
>  5 files changed, 24 insertions(+)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index f5bf48da6..d8f76137b 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -53,11 +53,15 @@
>  #include <assert.h>
>  #include <grp.h>
>  
> +#ifndef ANDROID
>  #ifdef HAVE_LIBPROCPS
>  #  include <proc/readproc.h>
>  #else
>  #  include <libproc2/pids.h>
>  #endif
> +#else
> +#include "igt_procps.h"

According to my comment to first patch with directory changed:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +#endif
>  
>  #include <dirent.h>
>  #ifdef __linux__
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index a96e36b5b..de7649170 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -33,7 +33,11 @@
>  #include <xmlrpc-c/base.h>
>  #include <xmlrpc-c/client.h>
>  #include <pthread.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  #include <pixman.h>
>  #include <cairo.h>
>  
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index e1061a2ed..6c89e136b 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -55,7 +55,11 @@
>  #include <limits.h>
>  #include <locale.h>
>  #include <uwildmat/uwildmat.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  
>  #include "drmtest.h"
>  #include "i915/gem_create.h"
> @@ -82,7 +86,11 @@
>  #include "runnercomms.h"
>  
>  #define UNW_LOCAL_ONLY
> +#ifndef ANDROID
>  #include <libunwind.h>
> +#else
> +#include "igt_unwind.h"
> +#endif
>  #include <elfutils/libdwfl.h>
>  
>  #ifdef HAVE_LIBGEN_H
> diff --git a/lib/igt_rc.h b/lib/igt_rc.h
> index 53e5ce669..9811d0408 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -25,7 +25,11 @@
>  #ifndef IGT_RC_H
>  #define IGT_RC_H
>  
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  
>  extern GKeyFile *igt_key_file;
>  
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index f7569e768..497fe0e08 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -26,7 +26,11 @@
>   **************************************************************************/
>  
>  #include <search.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  
>  #include "gpgpu_fill.h"
>  #include "huc_copy.h"
> -- 
> 2.34.1
> 
