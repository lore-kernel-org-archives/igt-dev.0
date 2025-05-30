Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79280C5B543
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 18:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1445810E1FD;
	Fri, 30 May 2025 18:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGklWETE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CA010E1FD
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 18:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748630358; x=1780166358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r3oNWmAYqlWlkUTEfFW0zYxNcTzKpjPmTJNlDSlsAMA=;
 b=EGklWETEUOXMxZiB7/MDjsScgdhSsV/gS/R3b8sMoZWIPqbVjC5bn/nn
 vh+hOh2SkSe1Ki48xMW8U4s3EcPWSk67zr7/iP2LJn5Wqe7zaHDhH9NwI
 A+uybWSyEXq69zi/vfyu4l8DbH/yXaA9IvYIwB1fOBMzJ5DHgcP0ypBkV
 ThgFYBzafTAQN0RxXvUbaOyjCPoXlY9kswSlwfIko8qReLG9n288tJhLz
 N3C0ZG5l4l/ntDWD1RRGtgn+fs8S5db5xcaG0m4TWK4il7JxiIzL+Y3ja
 cB640uOpJInsVmT3tsP5P9rdpCv/cd1F8J7hR4WvjZBZtmG3XLA4yvvLJ g==;
X-CSE-ConnectionGUID: NhhjE8xMTHisnRNsAav9WA==
X-CSE-MsgGUID: Ba0Go0nuQKm8LtJ2BDcrgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54527710"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="54527710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 11:39:18 -0700
X-CSE-ConnectionGUID: 0fBJmQjxTc6H61mdss7cww==
X-CSE-MsgGUID: fVAJuUUnQqWHy/bLMkpvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="144925522"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:39:15 -0700
Date: Fri, 30 May 2025 20:39:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v11 5/7] tools: Include local glib header for Android
Message-ID: <20250530183913.hs7xotbhraap2pi5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
 <20250529171246.74375-6-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250529171246.74375-6-jeevaka.badrappan@intel.com>
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
On 2025-05-29 at 17:12:44 +0000, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, added local glib stub header to
> build igt for Android.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tools/igt_dp_compliance.h | 4 ++++
>  tools/intel_pm_rpm.c      | 4 ++++
>  tools/lsgpu.c             | 4 ++++
>  3 files changed, 12 insertions(+)

Same here, add some NULL handling to avoid NULL deref errors.

Regards,
Kamil

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
