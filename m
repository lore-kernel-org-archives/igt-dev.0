Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3B2C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A56710E5A9;
	Tue,  3 Jun 2025 15:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoXJqSve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE5C10E5A9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748965224; x=1780501224;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Xy7SadfXa9ugnrqj/F52BharKQglBhI0yn6WOc98p04=;
 b=OoXJqSveTPeI525uUmC/R8m4QmEiUz6wDrgVJMqoD3v8ofaJuf6rBLE8
 Y0myDEWgvwp0b6G3H4rsNKJeyPQODM03ZlJIfQU6ZfKLpwS4tYIj3aWcj
 iVjCEYRR+Sdi9Gq7K/FehTKBAO16NB8WXHk2HzEjuMiAj4EsChWoKcpkN
 YAQaH1+YbD3+AI+zYCBD0ZmsHJS9v6mD+Bocew6Drslq2WtMxb/4uh34N
 J0rdiMI973634qhNk88zAIJtuJwqSWhDrGX6+0Dw9aIdaUYY6b2E1ul4/
 um6S1dUW9zGOSvradYtKLKRlUAE8y2FhbH0nqFdq5ElBkaTn1KMiF8keX Q==;
X-CSE-ConnectionGUID: iE0nVAYHQE+DtsHfWxqQwQ==
X-CSE-MsgGUID: bMBktKVPSE2GfSjb7hwicA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62403725"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62403725"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:40:24 -0700
X-CSE-ConnectionGUID: 5NBwiB6pTFGHFDg8WalvIA==
X-CSE-MsgGUID: g1KOC7oFRf2oSd/y+Cncyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149779077"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:40:22 -0700
Date: Tue, 3 Jun 2025 17:40:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 06/11] tests/intel: Include local glib header
 for Android
Message-ID: <20250603154020.6e62ftwenyoifa4b@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-7-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250602192515.95309-7-jeevaka.badrappan@intel.com>
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
On 2025-06-02 at 19:25:10 +0000, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, added local stub header to build
> igt for Android.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/api_intel_bb.c | 4 ++++
>  tests/intel/gem_ccs.c      | 4 ++++
>  tests/intel/xe_ccs.c       | 4 ++++
>  tests/intel/xe_intel_bb.c  | 4 ++++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 13b1091d8..30bc8a774 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -35,7 +35,11 @@
>  #include <errno.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #include <zlib.h>
>  #include "intel_bufops.h"
>  #include "i915/gem_vm.h"
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index af1e85f6a..a84a47cc4 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -4,7 +4,11 @@
>   */
>  
>  #include <errno.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <malloc.h>
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index e154bf4dc..bff5b5772 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -4,7 +4,11 @@
>   */
>  
>  #include <errno.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <malloc.h>
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index ef95b4a2a..95a49af6d 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -6,7 +6,11 @@
>  #include <cairo.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #include <inttypes.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -- 
> 2.49.0
> 
