Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854F0C52D71
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 16:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4769A10E3BA;
	Tue,  6 Aug 2024 16:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9AkSiS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6C010E3BA
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722961529; x=1754497529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sAmyMPqE4K0WoGMH/pazK758K+YWmrGMtenaoQZ+9os=;
 b=T9AkSiS4h7p01e0AC9Wna1OTJKFbaqH/Xe6FPchZN4piQQqYQM4oyh0g
 VwQbH6O/XHfIBiVH/L5vsIc9cZQguhk86bMmdbk3wbqjvAOFD6Klnzldq
 /dtRuAsV3s4p07hwWcO1MjIs5HPvta42QWBR1ZnClZqF/QLLIAiaXvoId
 XythzAVEthvgk36D5YueGKGlMOaZ1uLjtp9MjJoNTtR7U1cTJqlZmU7Qk
 JnJAWlLFa7eQle5G2PvzVWFCCy8YUsWBte6vwKImBa0MvrjZ5jtYKQ7lS
 yWPEHgI9U7AoZcJXIYItoNx6ZnMSoJ+BXgV27CVQrbzgmsBcUC5APAmf1 g==;
X-CSE-ConnectionGUID: 1a3KjWiOR9KJm8ymQKMv1A==
X-CSE-MsgGUID: H/cJ+UlyRxiOHcbkWk2usw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20805767"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="20805767"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 09:25:28 -0700
X-CSE-ConnectionGUID: TeoD0ZW4Q3G7OABrRNnCKg==
X-CSE-MsgGUID: ay3IoL3hS+CUAAKWa0mIww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56538097"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 09:25:27 -0700
Date: Tue, 6 Aug 2024 18:25:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Yureka <yuka@yuka.dev>, Bernd Kuhls <bernd@kuhls.net>,
 Mohammed Anas <triallax@tutanota.com>
Subject: Re: [PATCH] tests/intel/kms_pm_backlight: add include for POSIX
 basename
Message-ID: <20240806162506.5x5cm5q7b55evdgj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Yureka <yuka@yuka.dev>, Bernd Kuhls <bernd@kuhls.net>,
 Mohammed Anas <triallax@tutanota.com>
References: <20240707105417.1288665-1-yuka@yuka.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240707105417.1288665-1-yuka@yuka.dev>
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

Hi,
On 2024-07-07 at 12:54:11 +0200, Yureka wrote:

imho subject could be better:

[PATCH] tests/intel/kms_pm_backlight: Fixed build on musl

> fixes build on musl

In description you could write what kind of fix it is,
was it a compilation error? Or a warning?

Bernd, could you take it over and resend with your signed-off-by?
Any other compilation break/warnings missing on musl libc?

Regards,
Kamil

> ---
>  tests/intel/kms_pm_backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 8672afa7a..c4006b8be 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -44,6 +44,7 @@
>  #include <errno.h>
>  #include <unistd.h>
>  #include <time.h>
> +#include <libgen.h> /* for POSIX basename */

Put it after eerno.h

>  #include "igt_device.h"
>  #include "igt_device_scan.h"
>  
> -- 
> 2.45.2
> 
