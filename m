Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48229C5AD49
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 18:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CA410E878;
	Fri, 30 May 2025 18:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRihNKwP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADE710E878
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748630209; x=1780166209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=oM9OQeVSqBatiKDyypLm3EEPnIYyInIWM/SKGYnAu0M=;
 b=QRihNKwPEC14Ui/m8/dB4NhkfNmgqPiALsb6PWs9aK9OEO6x55H+Q/8p
 8phia+O5QNEAB4A4azWTEDs4k703wrA5SoSd7hE/ibWPN/kJw+3aP2jTb
 xvMuSHWJjYWqCYbKFBG/nuzHqVCxTE6v2rNbghDejwx63px16oXxANfWp
 BOjBGKcMB/S8u+lTl3ew17uw8CUFphzLCkG+ThCuoc643gNSIj71zLMDM
 OwwXbtU69hCcvcxywwFtQnoVVWhDE+dmnz7w4mrk6W5oMYl8OHh/v7BO5
 AGD6Nl/OU/c/5ksR+tNq454b8ocaUOmUts2GfiJXur3dNotntaZDjQB1q w==;
X-CSE-ConnectionGUID: gXGJUSCERYKFGJJXk/IdFA==
X-CSE-MsgGUID: GmpFhTGzSUC+9al11LnQ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="38361809"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="38361809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 11:36:48 -0700
X-CSE-ConnectionGUID: lMmoOYiqQRy0VBaVlbaq1g==
X-CSE-MsgGUID: iVl+fUtRSL+HG5Y6JWkuEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="174951787"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:36:45 -0700
Date: Fri, 30 May 2025 20:36:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v11 3/7] tests: Include local glib header for Android
Message-ID: <20250530183643.qnnpishz3sac7h42@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
 <20250529171246.74375-4-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250529171246.74375-4-jeevaka.badrappan@intel.com>
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
On 2025-05-29 at 17:12:42 +0000, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, added local stub header to build
> igt for Android.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/api_intel_bb.c | 4 ++++
>  tests/intel/gem_ccs.c      | 4 ++++
>  tests/intel/xe_ccs.c       | 4 ++++
>  tests/intel/xe_intel_bb.c  | 4 ++++

Split above into:
[PATCH i-g-t v11 3/7] tests/intel: Include local glib header for Android

>  tests/testdisplay.h        | 4 ++++

and this change into separate one. For this last one, please
add KMS devs:

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

Regards,
Kamil

>  5 files changed, 20 insertions(+)
> 
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 39bc2525c..8393b8661 100644
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
> index caa17498f..cae5db09b 100644
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
> diff --git a/tests/testdisplay.h b/tests/testdisplay.h
> index 27f8209e2..0f606c028 100644
> --- a/tests/testdisplay.h
> +++ b/tests/testdisplay.h
> @@ -24,7 +24,11 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdlib.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  
>  extern int drm_fd;
>  
> -- 
> 2.49.0
> 
