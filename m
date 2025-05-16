Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321BCC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD83810EB4B;
	Fri, 16 May 2025 17:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aL+oQotu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA93F10EB4B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415761; x=1778951761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Lzjrv3MwdcETrz6FscKZShn+4EpJiyaSeU26uvI4bKU=;
 b=aL+oQotu1hM13lgtwYkn/XBYiI26+bbiA6G0EOmbgfcIP+XRfY2o5lns
 YGCWxYy1yPL0hQUEXnKsC1tkRUwHsguUW0uksr4na/x+Qy8moGoMAk45L
 llqMC5ZlOksEWDDXoGksGhQoBW424MLdrKpvBjGUG5CZw1UlFhBMPankR
 vU4og1W3r4mqDV50aOA77PmB53vVp3UYsZIxfZ+bjOhgSZViPl82zACHv
 HWjHPFRG599fSqkIYynK7Y+ii1QlQ9UHMQlTIswjVfdQz9T2T/0bAU1oT
 DMKk/DDDsGzi4FiIyPFJOfECC1RC9iXcCHjGIEbxWKvnxoHNF11Y5ZtL2 g==;
X-CSE-ConnectionGUID: CnEy9bUUQZ2dhNqC/BKP0A==
X-CSE-MsgGUID: Oq39/1KOTUmUm+K9yQxMPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53212966"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="53212966"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:16:01 -0700
X-CSE-ConnectionGUID: cUCOHJTiRfON52wr/e3XcA==
X-CSE-MsgGUID: 33r8mvpkSZOCEI2aYvpmxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169787880"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:15:59 -0700
Date: Fri, 16 May 2025 19:15:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v6 02/14] lib: Include local igt procps, glib and
 unwind header for Android
Message-ID: <20250516171557.mqodeykooid2b7ju@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
 <20250516160551.58760-3-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516160551.58760-3-jeevaka.badrappan@intel.com>
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
On 2025-05-16 at 16:05:39 +0000, Jeevaka Prabu Badrappan wrote:

you need to add description to every patch.

From subject:
lib: Include local igt procps, glib and unwind header for Android
it seems you do not need unwind here as this was worked-around
in other patch with HAVE_LIBUNWIND. You could add it later if
anyone will write a replacement.

Can we replace glib with other alternatives? As I understand it
there are uses: hash and regex. Hash can be replaced with igt_map()
and for regex why not using pcre lib? See
https://en.wikipedia.org/wiki/Perl_Compatible_Regular_Expressions

+cc Petri Latvala <adrinael@adrinael.net>

Regards,
Kamil

> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_aux.c           | 4 ++++
>  lib/igt_chamelium.c     | 4 ++++
>  lib/igt_core.c          | 8 ++++++++
>  lib/igt_rc.h            | 4 ++++
>  lib/intel_batchbuffer.c | 4 ++++
>  5 files changed, 24 insertions(+)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index f5bf48da6..3eca09cd9 100644
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
> +#include "android/procps.h"
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
> index e1061a2ed..1d7402cb7 100644
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
> @@ -82,7 +86,11 @@
>  #include "runnercomms.h"
>  
>  #define UNW_LOCAL_ONLY
> +#ifndef ANDROID
>  #include <libunwind.h>
> +#else
> +#include "android/unwind.h"
> +#endif
>  #include <elfutils/libdwfl.h>
>  
>  #ifdef HAVE_LIBGEN_H
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
