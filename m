Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF78BC5AD49
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 18:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C9A10E1FD;
	Fri, 30 May 2025 18:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUv90hps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C3E10E1FD
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748630302; x=1780166302;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nLtUQEzCAxUd2loLkMutPupsOnVGT7u/YL1IOd3UfwQ=;
 b=XUv90hps00tcbmie181ilFApR+K5cC+qAF/iPYpGuvizbdju3gF0sziL
 Xy5EjfyC5MuHZo9XfbAzs4rDHtaGj0iwMFK35Pi88926aNxJ6GQNOoSw4
 72BrMvNTep/giAP99LbXiVspMQO87g24IUxotilK/Kw8mo0c1tYjTD/08
 eL6CNwzRLEImrn8Nk0hldfXx2JBjdlsg+0pgA2v7Yb611b3tg19ogbi1C
 thWuKi4K2U7K0H4nvzKXpL9PwW1wnXlXkd7hE16PPmlzMKOgMP2TuAOj7
 NMZMoYjClqosm6oh7iYxJu3xP0AbEU0ZN1VopvsxAimDXmk7eT8XffU18 A==;
X-CSE-ConnectionGUID: BETvSsU2RI6ab1zvWiyaYA==
X-CSE-MsgGUID: k4RDq6+pRI6Cp7hwiBWLXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="73262634"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="73262634"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 11:38:22 -0700
X-CSE-ConnectionGUID: mwb6Dt6aTMu2Uhq/ezxH/Q==
X-CSE-MsgGUID: 2YIqGmRUTCG+RvICXNsK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149222153"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:38:20 -0700
Date: Fri, 30 May 2025 20:38:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v11 4/7] runner: Include local glib header for
 Android
Message-ID: <20250530183817.ki6oxkiw3qp4mghw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
 <20250529171246.74375-5-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250529171246.74375-5-jeevaka.badrappan@intel.com>
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
On 2025-05-29 at 17:12:43 +0000, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, added local stub header to build
> igt for Android.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  runner/executor.c | 4 ++++
>  runner/settings.h | 4 ++++
>  2 files changed, 8 insertions(+)

Should you also add some NULL handling there?

Regards,
Kamil

> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 41f521e56..784d9eb5f 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1,7 +1,11 @@
>  #include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  #ifdef __linux__
>  #include <linux/watchdog.h>
>  #endif
> diff --git a/runner/settings.h b/runner/settings.h
> index 1f0b85318..ccdc7281b 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -5,7 +5,11 @@
>  #include <stddef.h>
>  #include <sys/types.h>
>  #include <stdio.h>
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  
>  #include "igt_list.h"
>  #include "igt_vec.h"
> -- 
> 2.49.0
> 
