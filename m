Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34D0C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 08:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EC810E13B;
	Mon, 14 Jul 2025 08:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLK1THsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAFF10E13B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752483268; x=1784019268;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ha4//ajBc1vuvNj89vsZIGWPlasYyjCN6wGBb/7gTm8=;
 b=JLK1THsJeMuSb8S4SM5TmyleQEUKs+dGMPVg6tFRDQM5rTBeFvzEAWdB
 xUcuri7n3fY9SHqamrZQSKI+APVADvz1MugvM9Xn/IuSqFDzESUxUIp0a
 1UqP90+HNi3TtFU621cjOy471BnQjWq+KwKn/JhBJ6G4l+UrwFtTkob+Z
 wVlKjayI6c58vjjb6kznULFil1n4CEkuqRryqW/PGYcYx6VcjUIlWqMyq
 g3Ucr81jbA3CrXdnQX5s6O/iiwcOXldJLMBz8KEvv7nCSl+jZQsCNRMY8
 kLzgPiy6vei3txEUuGDysaqFUVcBR3gFndsBJhMkI3T6KkWWmEGWSNTsq w==;
X-CSE-ConnectionGUID: 9vdzKj5nTP2U911rGFPxww==
X-CSE-MsgGUID: TR2g1YjwQ46ZJts+aoNMSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58331188"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="58331188"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 01:54:27 -0700
X-CSE-ConnectionGUID: dkDvJah6TwuGkVGyBOCQ4Q==
X-CSE-MsgGUID: By125TkQSNymirUszPPa7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="162547957"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 01:54:27 -0700
Message-ID: <ca460a94-4941-431b-a53d-915863ab8ce0@linux.intel.com>
Date: Mon, 14 Jul 2025 10:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/intel/xe_eudebug: Reduce debug loglevel
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
References: <20250710080929.412509-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250710080929.412509-1-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 7/10/2025 10:09 AM, Jan Sokolowski wrote:
> This test exceeds disk usage limit on CI environment
> due to logging too many logs.
> 
> Reduce the debug log level to a CI-friendly value
> if it's bigger than that.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>> ---
>  tests/intel/xe_eudebug.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index d2a1932fb..4a2c43635 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -20,6 +20,7 @@
>  #include <sys/prctl.h>
>  
>  #include "igt.h"
> +#include "igt_sysfs.h"
>  #include "intel_pat.h"
>  #include "lib/igt_syncobj.h"
>  #include "xe/xe_eudebug.h"
> @@ -2800,6 +2801,9 @@ igt_main
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
>  		was_enabled = xe_eudebug_enable(fd, true);
> +
> +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> +		update_debug_mask_if_ci(DRM_UT_KMS);
>  	}
>  
>  	igt_subtest("sysfs-toggle")

