Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F0FC3ABD9
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 11:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E565610E612;
	Wed, 14 May 2025 11:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7FmE47d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E6710E612
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747223630; x=1778759630;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O90wRkrf28RJgtPACJMmCbJB0ghWl9j4RyVrA+7OZrg=;
 b=L7FmE47dza8y+vHttd5g/6IUDjno/xsw7+mC4ybkQaOiJ1zoUgoQH7Fk
 o195ae0193Y/nYyqZW8UZujtXbVoOpgiJY6nAY9ctAWSGaaV19xnJhOyR
 /X4LVr8Jmj/lNM+FvfZTiWmK0q/9DklBmH5+nxUDuwEFN76As3H7D6MA7
 p1rux12Xrp6++equm1KbdWEftdPuBX18cgw4A81IrijyA6lbjNecxe5Wo
 k0PKNX6Qw77uds9RktPrR+LBr0hEKrzN2zpEg/PubdnUzONiq+aUUwZ2B
 7DFa4/oCJ/qkmp+foVFGbsPq9CkwJMeZD+emw31vpjEXAiwkNuazQ9kFB g==;
X-CSE-ConnectionGUID: wYI8xGp4QgaPeiwn3y8blA==
X-CSE-MsgGUID: S2twD46xQC2BNTT5onD2ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36739505"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="36739505"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:53:50 -0700
X-CSE-ConnectionGUID: QuDtA4UASwGeitZ1Inj45w==
X-CSE-MsgGUID: K8Ub7nHEQ329kylKy2I0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138542560"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:53:48 -0700
Date: Wed, 14 May 2025 13:53:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 03/15] tests: Include local igt_glib header for Android
Message-ID: <rg4a4xva2mrhh6gbayt7nlg6iv33wdcv5qauxvicmh5znjlk5q@b47kskgoq2cu>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-4-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507160148.53857-4-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:36PM +0000, Jeevaka Prabu Badrappan wrote:
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  tests/intel/api_intel_bb.c | 4 ++++
>  tests/intel/gem_ccs.c      | 4 ++++
>  tests/intel/xe_ccs.c       | 4 ++++
>  tests/intel/xe_intel_bb.c  | 4 ++++
>  tests/testdisplay.h        | 4 ++++
>  5 files changed, 20 insertions(+)
> 
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 4a1c9be91..3e6c5d632 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -35,7 +35,11 @@
>  #include <errno.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif

With comment from first patch addressed:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  #include <zlib.h>
>  #include "intel_bufops.h"
>  #include "i915/gem_vm.h"
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index af1e85f6a..a18418753 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -4,7 +4,11 @@
>   */
>  
>  #include <errno.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <malloc.h>
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index e154bf4dc..9e42a0859 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -4,7 +4,11 @@
>   */
>  
>  #include <errno.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <malloc.h>
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index d8bd7b519..e0d1e8016 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -6,7 +6,11 @@
>  #include <cairo.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  #include <inttypes.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> diff --git a/tests/testdisplay.h b/tests/testdisplay.h
> index 27f8209e2..2725637fe 100644
> --- a/tests/testdisplay.h
> +++ b/tests/testdisplay.h
> @@ -24,7 +24,11 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdlib.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  
>  extern int drm_fd;
>  
> -- 
> 2.34.1
> 
