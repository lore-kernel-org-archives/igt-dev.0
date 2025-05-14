Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373FEC3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 11:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0CD10E61B;
	Wed, 14 May 2025 11:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjVXF8kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7FD10E61B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747223872; x=1778759872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ck8WoGc0Gr3lLErMplCsP/nPn+k5vrLnt0i2CF6TUcM=;
 b=FjVXF8knOtnCgozprovCE1wcsR0NGjY0HhNBDYP/hsKTts7mNB4KYbTQ
 Pu2hr0AbDbW/xswC0aTPtiHVAWMuRL6CWTBFiklbIIPYRYig/n+ZWM/ea
 2S/dHQ4ElIb9CIEno0z+eUzi4rysLVAerAlYdcAdgsgfLg1GMdkMUBDkp
 YraB7zg3PuBfDbtyjPHC6j1hYvROzfJKXyw9E3zBnZONkTcV58L0ojxLi
 RwApj6w3gpZSXLmzI1uH4ucGAu8ScqvCcs5xZ8qtKw7++ARvRH2Dugoa8
 Irs/MvBg2imT7734DHogQZiREL8P2kPuoFp1mo59QXf5/lLgFc+RlnIQC A==;
X-CSE-ConnectionGUID: UP4ShxSkRP6Im9pRlRLkmw==
X-CSE-MsgGUID: +37ggEv/TaadRtu5QDu4Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36739697"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="36739697"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:57:52 -0700
X-CSE-ConnectionGUID: 1ggMziRpT1yV6IZJIZbTGg==
X-CSE-MsgGUID: kQ+4JDgNQbWccrrQcBkIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138543130"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 04:57:49 -0700
Date: Wed, 14 May 2025 13:57:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 04/15] runner: Include local igt_glib header for Android
Message-ID: <fn5dp2xf5zlwkovnnujih3cehyjtyujicgb2emovyb7m2tpgp3@hoyaa5zs4yjc>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-5-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507160148.53857-5-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:37PM +0000, Jeevaka Prabu Badrappan wrote:
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  runner/executor.c | 4 ++++
>  runner/settings.h | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 41f521e56..7be02cea1 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1,7 +1,11 @@
>  #include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif

With comment from first patch addressed:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  #ifdef __linux__
>  #include <linux/watchdog.h>
>  #endif
> diff --git a/runner/settings.h b/runner/settings.h
> index 1f0b85318..36a69036c 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -5,7 +5,11 @@
>  #include <stddef.h>
>  #include <sys/types.h>
>  #include <stdio.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  
>  #include "igt_list.h"
>  #include "igt_vec.h"
> -- 
> 2.34.1
> 
