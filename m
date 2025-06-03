Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A576EC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE7010E5A9;
	Tue,  3 Jun 2025 15:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6v/dtyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D680A10E5A9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748965294; x=1780501294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iM2o+YgMIIEkMM1FKPribHgI9e2ZWu7/mfNRGwvv0mA=;
 b=F6v/dtyn/fY69uX3EHRShpOKfIVote03CZIGEDUfZ6DFPKvGR0GBkyIO
 RQbMDciSWNCoOM2uf/vPIhBBVJW5wNFkmgNL+VvvNZyIOl77McrhFy9Cz
 M9a2uRsDytY73WoPhzZ0DO4HYF2Dutp5hbvijNJvT0bw5PrhwDAZg4qa3
 5CXmz9+XaWWZXrlz82wuJd3Eh3876xs9HfnknQxN0ZgaCEHigifNqulH2
 Zy6tV5VrPksdMrV83t4w5xFua7HnXgbtLMkwAAQW4B6XIQH4D4B3+wnY8
 SWSZuroNx3TMq0GbZj74uHoah9L2Qk8HrF4dvqabc+lnZM71OBgiaXXZS g==;
X-CSE-ConnectionGUID: Y57IwIu2TW6WXKgi1EP6Cw==
X-CSE-MsgGUID: 7Iw+brZ8QECMZ7N/QOs4Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62403872"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62403872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:41:34 -0700
X-CSE-ConnectionGUID: DMMp71OaRNKGOxrjVMKiJQ==
X-CSE-MsgGUID: /mudMmBJR5K2itPFvCBO4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145516587"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:41:31 -0700
Date: Tue, 3 Jun 2025 17:41:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 09/11] tools: Include local glib header for
 Android
Message-ID: <20250603154129.642dyzcdhuz3sz73@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-10-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250602192515.95309-10-jeevaka.badrappan@intel.com>
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
On 2025-06-02 at 19:25:13 +0000, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, added local glib stub header to
> build igt for Android.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tools/igt_dp_compliance.h | 4 ++++
>  tools/intel_pm_rpm.c      | 4 ++++
>  tools/lsgpu.c             | 4 ++++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
> index 5b1688039..226a13662 100644
> --- a/tools/igt_dp_compliance.h
> +++ b/tools/igt_dp_compliance.h
> @@ -28,7 +28,11 @@
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
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 9622f0552..c1cc54b82 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -24,7 +24,11 @@
>  
>  #include <errno.h>
>  #include <getopt.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index e68390083..6cfbf3142 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -24,7 +24,11 @@
>  
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #include <libudev.h>
>  #include <string.h>
>  #include <signal.h>
> -- 
> 2.49.0
> 
