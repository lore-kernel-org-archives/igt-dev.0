Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9724C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9237E10E5A9;
	Tue,  3 Jun 2025 15:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mlcf0tEp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B911410E5A9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748965268; x=1780501268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hnOx4QI4BhM2LamqOoRyz5h1VM2KyTaJ/j6JhoAOvc8=;
 b=Mlcf0tEph1GZwx7fRPFIkqIiTE3rEOR5m3twLmkzvZUjaxtgDnXKBRO0
 BPI0rwUKO5MlPihvmfznetn6462MgqMKJe+eo2Xy3494ctlCuGbQu96bL
 hRUslT6B6UnsLVFecw0nhsunxFmtYO5Xi1oxsAt1Xp4NISHg5jMUDaoHe
 8pXzQHPUcHZH15E8j05rwNug+CpnnLj24AA4372YOqXgtXD8ZrLXbNjPB
 2IkCo6f1xc8rUoEkhURLXB0vuaOA09qlQOgOo/Wk8dulv+lfQVTHuQoQI
 PzGlshkePFKEuJwoxv7Kxk5gpodmzlYvBHuPkdiAgFdt3EZEGTzilniD3 Q==;
X-CSE-ConnectionGUID: R/vljvG5RjqeRAcpXAPxzg==
X-CSE-MsgGUID: Thz5fnOaSYSUMOTVJ9bvPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62403828"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="62403828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:41:07 -0700
X-CSE-ConnectionGUID: /E32nYmwRzCavX1CsdIRPw==
X-CSE-MsgGUID: uKNelrf7TA2TC4bw8P6nxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145516522"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:41:05 -0700
Date: Tue, 3 Jun 2025 17:41:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 08/11] runner: Include local glib header for
 Android
Message-ID: <20250603154103.pjzby6akpwf3xj6t@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-9-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250602192515.95309-9-jeevaka.badrappan@intel.com>
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
On 2025-06-02 at 19:25:12 +0000, Jeevaka Prabu Badrappan wrote:
> As glib is not available in Android, added local stub header to build
> igt for Android.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/executor.c | 4 ++++
>  runner/settings.h | 4 ++++
>  2 files changed, 8 insertions(+)
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
