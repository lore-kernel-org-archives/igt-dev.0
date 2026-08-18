Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18575C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 15:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B706210E04F;
	Tue, 18 Aug 2026 15:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLQXX8pi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFE410E00D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787065562; x=1818601562;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O1gzVhpWgkTwxtB4wAF+D8/88By2mLIGE39h1z9EprY=;
 b=kLQXX8piF2GVZk/gSpP4H4RvubP4+m/r3otjXnPY4cgsxV1iXUP0U+wA
 xFUx+Wi6mO0OYQs747BWLX2wHEjs2phZdPEygfCXSb4Eq3+XtBG1dpEQ8
 W0k74taCpkwzhlTanFJEcoOhtWtUmfxOOJV3sz4Vzi8hvMgqADy3EqfvP
 oZgK8CeLwartIwrkHojkoV7uFHhpE2z002KmZyPNSvWt4NYqUQP/zPduH
 cRj6BYAxZVfI3qkIFl6xwslr3FSQcpbu6zsa/nPDUzGTBkR3V2HC5wTwT
 aIOgRU8p3Em09jpfMAXR9HfiyZfi56X59O+Qb3IN3H7b9oTno1ZkGA3k0 Q==;
X-CSE-ConnectionGUID: fXTQLc6VT3mc327b1iM40w==
X-CSE-MsgGUID: SZJwskX+T1Koi2pl86BlyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105094283"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="105094283"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 08:06:01 -0700
X-CSE-ConnectionGUID: Bfqy7W7FReeLKvxTr7wLxA==
X-CSE-MsgGUID: 9inOO7KcQWKZaqy2Xfp3/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269552649"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.106])
 ([172.28.182.106])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 08:06:00 -0700
Message-ID: <1b4a6ce7-e862-4713-a943-b1df536a8e6b@linux.intel.com>
Date: Tue, 18 Aug 2026 17:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] tests/device_reset: Add Xe healthcheck to
 post-reset validation
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, raag.jadav@intel.com
References: <20260811141426.1642321-1-lukasz.laguna@intel.com>
 <20260811141426.1642321-3-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260811141426.1642321-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 8/11/2026 4:14 PM, Lukasz Laguna wrote:
> Extend the healthcheck for Xe devices to validate basic command
> submission after reset.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/device_reset.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index b281f4ece..70ca511e0 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -14,6 +14,8 @@
>   #include "igt_pci.h"
>   #include "igt_sysfs.h"
>   #include "igt_kmod.h"
> +#include "xe/xe_device.h"
> +
>   /**
>    * TEST: device reset
>    * Description: Examine behavior of a driver on device sysfs reset
> @@ -392,6 +394,8 @@ static bool is_i915_wedged(int i915)
>    */
>   static void healthcheck(struct device_fds *dev)
>   {
> +	int fd;
> +
>   	if (dev->fds.dev == -1) {
>   		/* give the kernel a breath for re-creating device nodes in devtmpfs */
>   		sleep(1);
> @@ -400,10 +404,13 @@ static void healthcheck(struct device_fds *dev)
>   		igt_debug("reopen the device\n");
>   		dev->fds.dev = __drm_open_driver(DRIVER_ANY);
>   	}
> -	igt_assert_fd(dev->fds.dev);
> +	fd = dev->fds.dev;
> +	igt_assert_fd(fd);
>   
> -	if (is_i915_device(dev->fds.dev))
> -		igt_assert(!is_i915_wedged(dev->fds.dev));
> +	if (is_i915_device(fd))
> +		igt_assert(!is_i915_wedged(fd));
> +	else if (is_xe_device(fd))
> +		xe_healthcheck(fd);
>   }
>   

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   /**
