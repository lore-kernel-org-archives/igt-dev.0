Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C825C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA84910E5A9;
	Tue,  3 Jun 2025 15:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg+vIqwg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A610E5A9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748965099; x=1780501099;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J4gDXOCzMhi2cNTfxUootDUtOCnFBVI2cRm4kQdw/J8=;
 b=jg+vIqwgzY+O8TonwbR5SSm55aL0aIGXwCxI/KWRhQscjeF6TaESg+eK
 YW1ZSJRIVbyHRmXblLlsRzWkLkRO8SKiwnz+6DTQE4N1W8ZQjed7I3XNi
 GLuhcqE066LEaIBT5BAxNIG75YFTc+b2cT7Wo+0Ra00p0kxQj2JP6JnTb
 JZzEZFj1Xku6N6jENrr6KHtqgxGjp3LawKB3yjv/TUUgK5XRA+2wzCeZ7
 F5eCkM4YC/g0/6vHDBSU+S19H4oL3wJqrRvio8KziO6AwmpJn0OgRdzr6
 ziw2PAZAQ5hGpW01eN3rU05Bx55ExFGSUH2Z6LauLRz5Dhq1wGM0Tiea7 w==;
X-CSE-ConnectionGUID: EzZHlYfnRbOiT91j2j1kSQ==
X-CSE-MsgGUID: qDqa/wmvTFKuvzDrmnQwCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51012249"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51012249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:38:19 -0700
X-CSE-ConnectionGUID: I9rtyhikQuSSzwwwUAAxDw==
X-CSE-MsgGUID: njOMJX7sQ02Ucvsd0F6cDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="150053231"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:38:16 -0700
Date: Tue, 3 Jun 2025 17:38:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 04/11] lib: Include local igt glib header for
 Android
Message-ID: <20250603153814.5vhccp54hot4lu4m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-5-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250602192515.95309-5-jeevaka.badrappan@intel.com>
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
On 2025-06-02 at 19:25:08 +0000, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, added local igt glib header to
> build igt for Android.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_chamelium.c     | 4 ++++
>  lib/igt_core.c          | 4 ++++
>  lib/igt_rc.h            | 4 ++++
>  lib/intel_batchbuffer.c | 4 ++++
>  4 files changed, 16 insertions(+)
> 
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
