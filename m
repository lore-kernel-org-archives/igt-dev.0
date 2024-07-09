Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77945C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 12:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3746F10E52B;
	Tue,  9 Jul 2024 12:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FM5RtLE1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A040110E52B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720527184; x=1752063184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QTmvK616o7ifxd+W01+JlVbTgbfLcRXwbnzfkij7ImY=;
 b=FM5RtLE1iZ4JeNMfwVOJ/ZYogY5ZYsIKqg1DGHCjwPLr/EMYc/KaezFn
 jXhEMhbbQkwlwoOc0KwePosYJYrUpdxdjFArlCFfbWEeMJC9pcr63zeY5
 p3SNQkproHSqClk+zTzMPjzYf3Qw5w0iZ9ZpD1/C3cAgC7GC7tvq/FwUh
 18MRdPTQ8fG+rJkWJZLROHza6KooaTm6zwt/7Dc4AOCua+NOuKpuG3S6p
 lF3KmnkoM7rT0Ho8hrMast6AkREL1RWQBAt7QlCT3z+kXyi1Uk84F/0bN
 kaDmdhwCeWyY95JylzitZZCC8MYUrST815ocxcYNxI4kSpNLtD6ph8/1R g==;
X-CSE-ConnectionGUID: MZOCfmscTC69UpSG7YQZcA==
X-CSE-MsgGUID: hdvR2K1/Ty+0jM6EvvTEvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17882026"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17882026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:13:04 -0700
X-CSE-ConnectionGUID: twen2IE6SiyZlIVDnN1d3g==
X-CSE-MsgGUID: w7KKHCriSbGXSHAEuB9hUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="47725376"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:13:02 -0700
Date: Tue, 9 Jul 2024 14:12:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Yureka <yuka@yuka.dev>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/kms_pm_backlight: add include for POSIX
 basename
Message-ID: <20240709121245.nvdrizivf56gtmjh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Yureka <yuka@yuka.dev>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
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

Hi Yureka,
On 2024-07-07 at 12:54:11 +0200, Yureka wrote:
> fixes build on musl

For a patch to be accepted we need your Signed-off-by
with your full name, see some other patches, for example

[i-g-t,04/37] tests/kms_frontbuffer_tracking: Use igt_create_fb()
https://patchwork.freedesktop.org/patch/601865/?series=135670&rev=2

from a series: https://patchwork.freedesktop.org/series/135670/

So here it should be:

Signed-off-by: First_name Last_name <yuka@yuka.dev>

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

This should be before time.h

Please fix and resend with your s-o-b.

Regards,
Kamil

>  #include "igt_device.h"
>  #include "igt_device_scan.h"
>  
> -- 
> 2.45.2
> 
