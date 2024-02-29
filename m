Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1A2C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 11:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ACA10E45D;
	Thu, 29 Feb 2024 11:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cP7xAvCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F5F10E45D
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709204826; x=1740740826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A/UKS2GzDSjxePsqhTvuU5DzcgN/QpGWC3MOl860yeg=;
 b=cP7xAvCfF8LOR0M02vGCeVCDpBNmjXrTDQ9VkiFZx4DMbsBZprz2AVf6
 awVlVi6FQRkie+RL9nXXSy+jfqKU21Z9NBJ+G/8L3iG6x6eh6tol7QqqY
 3CDFdr+NQ7yTgQr6d/JM3RPpWPg9m5cGyOYD8xdI2gICR6bRLGI1dAJIg
 e8LPLYclvz+lSun+zq533TCXaPbtWU5SXLiQDCHjRK/95DiBTiRCkzr68
 mwN98LKj60J0nxdlpUwmZX1alS+B3TYqNkuja/aYWipAx6uUBUFjrX5ZL
 4JSCbYs8VUKOUCJiprn8XbgtF8JESAr0vVmCagSX/b+ALm7pzTs8DKeoF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7495106"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7495106"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:07:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8150610"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.24.92])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:07:04 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v4 3/4] lib/igt_sysfs: Fix off-by-one in buffer size
Date: Thu, 29 Feb 2024 12:07:01 +0100
Message-ID: <3709752.RUnXabflUD@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240228223134.3908035-3-lucas.demarchi@intel.com>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <20240228223134.3908035-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Lucas,

On Wednesday, 28 February 2024 23:31:33 CET Lucas De Marchi wrote:
> vsnprintf() should receive the buffer size as argument, here called `len`,
> including the trailing '\0'. There was truncation if the return is "size
> or more". In this second call to vsnprintf() the value should be exactly
> the same as in the first call, otherwise something really unexpected
> happened.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2997925e5..a1ff5655d 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -529,8 +529,8 @@ int igt_sysfs_vprintf(int dir, const char *attr, const 
char *fmt, va_list ap)
>  			goto end;
>  		}
>  
> -		ret = vsnprintf(buf, ret, fmt, ap);
> -		if (igt_debug_on(ret > len)) {
> +		ret = vsnprintf(buf, len, fmt, ap);

Oh, so I missed that we didn't use the len variable, initialized with a 
calculated value of required buffer length, when allocating that buffer -- 
good catch.  OTOH, since we then pass the buffer to a function that doesn't 
care for a terminating null char, a buffer of ret length, with no room for 
that terminating null char, should be sufficient.  But anyway, let's request 
that extra byte so the code is less confusing.

> +		if (igt_debug_on(ret != len - 1)) {

OK, let's also take care of strict consistency of the result with that from 
the initial vsnprintf().

But then, the len variable is really needed only for that comparison with the 
new result  The required size of the buffer doesn't need to be calculated from 
ret as ret + 1 in advance, only just when passing it as an argument to 
malloc().  Under such circumstances, wouldn't that be more clear if we changed 
semantics of len to always carry an initially detected length of the data to 
be printed, not the required buffer length, and then compare it directly with 
the new result, without recalculating that initial value back from the buffer 
length?

Thanks,
Janusz

>  			ret = -EINVAL;
>  			goto free_buf;
>  		}
> 




