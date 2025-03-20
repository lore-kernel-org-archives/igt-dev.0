Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FAFC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 13:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFC010E3A2;
	Thu, 20 Mar 2025 13:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFkd2I3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A577710E3A2
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742477058; x=1774013058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5+/VOqIHi17CwwOHlIxeOE8CFWBEgT3kqs/KnA0HR+A=;
 b=LFkd2I3QMXU6gxpSpFcoK82yGJDMAUreGsdj+bPEuFkdo6YyegNKKX+E
 Es/pesSKjq5pW64Rips9FkHj9zazlKQN+HAgPZZz9Si3sV1C4f74UmgkD
 Gv0ff+ES9O40y/pJxemWYs5V6HaGIiRjRECWyDCc+JnlmQERWRFo+ARqp
 Rs+CI5brQ9IdpVo3Weo7r+J2gLHMsZ8vyuU/TLlidAYN9eRWMZ8RQ5AXm
 63Rq49RVwdD2Q//pc7B0ZWTxHn5MaVhr7A+iIsz7mm8hPotyWZ2aM2/gY
 ii34kDVw4OnvJvTN+8CAL+LZMT7QLp0G4MjamcnBBum5my6KOOd8cfEIU w==;
X-CSE-ConnectionGUID: x8jE+77rQ2S3yNntj08yGg==
X-CSE-MsgGUID: n7FxpfsGT8mNWiG/RIKTpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="61097969"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="61097969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 06:24:17 -0700
X-CSE-ConnectionGUID: VLF6wJuFT0WY8j+c4sk8fw==
X-CSE-MsgGUID: YhbPm6F7T2GKpjMWDQ9p9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="127262934"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 06:24:15 -0700
Date: Thu, 20 Mar 2025 14:24:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v2] i915/gt/selftest_lrc: Disable timestamp test
Message-ID: <20250320132413.ita6yn25tzcydzjj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mikolaj Wasiak <mikolaj.wasiak@intel.com>,
 igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
References: <n2dpynxo4qh2x6k4gum7ivl4ueb6dotssklafko7fktnebmjgv@eiqftxjmgkg2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n2dpynxo4qh2x6k4gum7ivl4ueb6dotssklafko7fktnebmjgv@eiqftxjmgkg2>
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

Hi Mikolaj,
On 2025-03-07 at 11:21:25 +0100, Mikolaj Wasiak wrote:

you sent this to i-g-t only, I guess you wanted to send this for
drm-i915 mailing list.

Regards,
Kamil

> This test was supposed to show bug in tigerlake and dg2 hardware.
> The bug was found and fixed in newer generations.
> Since we won't support any new hardware with this driver, the test
> should now be turned off in the CI to not polute it with random failures
> on previous hardware.
> 
> Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
> ---
> 
> Fixes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13697
> 
> v1 -> v2: Disabled the test instead of removing it,
> 					Change name from 'remove' to 'disable'
> 
>  drivers/gpu/drm/i915/gt/selftest_lrc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index 22e750108c5f..419a7cd61b65 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2018 Intel Corporation
>   */
>  
> +#include "linux/kconfig.h"
>  #include <linux/prime_numbers.h>
>  
>  #include "gem/i915_gem_internal.h"
> @@ -858,6 +859,16 @@ static int live_lrc_timestamp(void *arg)
>  		U32_MAX,
>  	};
>  
> +	/*
> +	 * This test was created to show existence of hardware bug.
> +	 * The bug was found and fixed in further generations but
> +	 * now this test polutes our CI on previous generations.
> +	 *
> +	 * https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13697
> +	 */
> +	if (!IS_ENABLED(CONFIG_DRM_I915_SELFTEST_BROKEN))
> +		return 0;
> +
>  	/*
>  	 * We want to verify that the timestamp is saved and restore across
>  	 * context switches and is monotonic.
> -- 
> 2.48.1
> 
