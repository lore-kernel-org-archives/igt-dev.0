Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B44DC5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 16:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74C910E32E;
	Mon, 26 May 2025 16:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsaX0EpI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5024C10E32E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 16:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748275666; x=1779811666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xUk90Whjea1qzUo8S6zpoxozr+78rp6ktI+YZyA1cdk=;
 b=jsaX0EpIesRVg1R9yX+30NQpXJwjCjBNPvMRkVvwKs6+uwCpqUhR8rRN
 UupZ7yIBddbMsRJlpK3vq36fvpRbERuyHfyy2YwviFR6KoKlndVCF8niF
 gd6H42VesPg2VA7XQ8nTT7dpvR3iN8es3Nx/XA3SDR4C9JJMhUrwDpRgI
 xKW6MI9IMzqQDhUspAVVgUzE9nUU6le52UaksgD71XyRNA7cN6Kp0zv6j
 1kgNnEaeS33Ctjz8LQOM2y72T7q0I4QlHu3cLdpZ62951DAb979oAng5a
 BAv5SpjfQsn4CkdyZmgMvJTJ+gpsD1jHdrvWudPYt31OAeS4HiTKrofIp w==;
X-CSE-ConnectionGUID: KI9pDsyTQ4O3JSdKFsuu1Q==
X-CSE-MsgGUID: HFQMcIlESoyK+1yrmVruxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60513653"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="60513653"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 09:07:45 -0700
X-CSE-ConnectionGUID: RmucKepjSPeV6Rx8Rn1A1g==
X-CSE-MsgGUID: Jf3pFYaeSQaN+MXEARUKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="173357878"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 09:07:42 -0700
Date: Mon, 26 May 2025 18:07:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v10 2/7] lib: Include local igt procps, glib header
 for Android
Message-ID: <20250526160739.lqdwg5tcoce65ovy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
 <20250522143419.28888-3-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250522143419.28888-3-jeevaka.badrappan@intel.com>
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
On 2025-05-22 at 14:34:14 +0000, Jeevaka Prabu Badrappan wrote:
> As procps, glib are not available in Android, added local stub
> procps, glib headers to build igt for Android.

Some of glib functions could be easily implemented, like reading
.rc files, but some are essential for igt tests or igt_runner,
like regex.

There are following uses of glib: hash, rc file parsing,
GIOChannel, regex (or more?)

Are you ok with igt_runner not (fully) functional?
Regex looks like could be replaced with pcre (or pcre2),
I am not sure about GIOChannel.

One more nit, see below.

> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_aux.c           | 4 ++++
>  lib/igt_chamelium.c     | 4 ++++
>  lib/igt_core.c          | 4 ++++
>  lib/igt_rc.h            | 4 ++++
>  lib/intel_batchbuffer.c | 4 ++++
>  5 files changed, 20 insertions(+)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 2905824a5..9ea37ebc6 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -53,11 +53,15 @@
>  #include <assert.h>
>  #include <grp.h>
>  
> +#ifndef ANDROID
>  #ifdef HAVE_LIBPROCPS
>  #  include <proc/readproc.h>

Or it is time for  #ifdef HAVE_LIBPROC2

>  #else
>  #  include <libproc2/pids.h>
>  #endif
> +#else
> +#include "android/procps.h"

Why not lib/igt_procps.h and lets have it there
instead of in android/ ?

Regards,
Kamil

> +#endif
>  
>  #include <dirent.h>
>  #ifdef __linux__
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
> index f7569e768..caf142949 100644
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
