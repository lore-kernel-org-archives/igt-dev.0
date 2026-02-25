Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E34FCEE8F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 11:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6679410E0EE;
	Wed, 25 Feb 2026 11:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ty2lOJoH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF37A10E0EE
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 11:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772019885; x=1803555885;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sbmSktrTk/X2WlDwQt2llWbvOqc7oy8h462Qyb/wYSo=;
 b=Ty2lOJoHSSKHz1pIXU4Xp4B3IaWH2JWIEjWqiCulMAUaiZWx7Oc2r+wl
 WDk7W7y1Z2TjsEdvhM7iJ4GNGA1wP7pVieK7yLQ+e7Zy/5o6ymUWHFpNy
 scs1CJhS/Zp5/hcECKhRAQexSSnYMEjlzJhCl6ly2dIg/D9dUQvSUKr9E
 CT1lURigxj53nr0yOEUGAGh42BzNMpKQeHr4NyX9OBX3y3fZIFWwBFYda
 wBmkR9rrkBRfrNaXNqUG0b9k5HfrSiWHPvUCfX64RbHr4MfZo30Ct9uy+
 7RW82haqlR/eoshKuQ+0p2do2N2H1436pflIcms/72qfh44NXemOctu8i g==;
X-CSE-ConnectionGUID: t8qLrV8mQ+i905j9HQ+eBw==
X-CSE-MsgGUID: tY7syXO8Q5yIxq8azmeaBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73123498"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73123498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 03:44:45 -0800
X-CSE-ConnectionGUID: Scx6MgQzT3Cw1A3+WuQLRw==
X-CSE-MsgGUID: qTxYSAwFSraPRVLBut9QDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213907838"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 03:44:43 -0800
Date: Wed, 25 Feb 2026 12:44:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, sashamcintosh@google.com
Subject: Re: [PATCH i-g-t] tests/kms_colorop: Include local glib header for
 Android
Message-ID: <20260225114441.2ivopkhvxpgu5od4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 sashamcintosh@google.com
References: <20260223164151.3307217-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223164151.3307217-1-markyacoub@google.com>
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

Hi Mark,
On 2026-02-23 at 11:41:51 -0500, Mark Yacoub wrote:
> From: Sasha McIntosh <sashamcintosh@google.com>
> 
> igt-gpu-tools requires glib.h, which on Android is provided via a local
> header in the android/ directory.
> 
> Signed-off-by: Sasha McIntosh <sashamcintosh@google.com>

Thank you, I merged it.

Regards,
Kamil

> ---
>  tests/kms_colorop.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 876f089fd..bb15350ef 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -6,7 +6,11 @@
>  #include "sw_sync.h"
>  #include "kms_colorop_helper.h"
>  
> +#ifdef ANDROID
> +#include "android/glib.h"
> +#else
>  #include <glib.h>
> +#endif
>  
>  /**
>   * TEST: kms colorop
> -- 
> 2.53.0.345.g96ddfc5eaa-goog
> 
