Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0664CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 09:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2345910E2EF;
	Thu, 16 Oct 2025 09:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6KS6o9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B168310E2EF
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760606490; x=1792142490;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fIKDFJS2bl207k3Jo0qygbfi7EiixN+IQu8e3cZkUG0=;
 b=I6KS6o9OmgblVWSCFhOa6h38oP9ttYkKwIE/795br5717UEo+EDPNr6J
 bstUDYLvQMa3wUXhs21Rl9ajeVtzh7X5UaZOy4RU61V3jlYsYh7LGtjDM
 IoW9jEtD0y8ntBcjDbsT7rHlrBTYsD3Wp28t5/FaT2lOSHXx6pNJC5rvO
 0y7SFHTulP1HWglAiWKW58PZMENU/kYv9quwmMJEZcdW2zAlzfTZx1QvZ
 jnhBIm3fjxjtxViiR0XmX+E1jQn3TBPV4C/H97SNQdwY5FGkPRZZau+r/
 e7oOiPNhsM+2IGgP7yf1HUAzMqwpCgag8kn8kt5JQR1HXAENGtanIuSea w==;
X-CSE-ConnectionGUID: t9Sg44B8TMe4UJjRdpqweg==
X-CSE-MsgGUID: V1Z6N1McRjm91ZboaLu00g==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74138341"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="74138341"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 02:21:29 -0700
X-CSE-ConnectionGUID: fqpntNTGSsa6nAjNTCoXzw==
X-CSE-MsgGUID: DNOqRJliSvyrxwdisa80UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="206112029"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.160])
 ([172.28.182.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 02:21:25 -0700
Message-ID: <4216c4d2-d862-4f38-b263-b10eb01e61b3@linux.intel.com>
Date: Thu, 16 Oct 2025 11:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] benchmarks/gem_wsim: Fail on thread assertions
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250924110607.563913-1-marcin.bernatowicz@linux.intel.com>
 <20250924110607.563913-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: Adam Miszczak <adam.miszczak@linux.intel.com>
In-Reply-To: <20250924110607.563913-2-marcin.bernatowicz@linux.intel.com>
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

On 9/24/2025 1:06 PM, Marcin Bernatowicz wrote:
> Call igt_thread_assert_no_failures() before returning so thread errors
> affect the exit status.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   benchmarks/gem_wsim.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 7a6b10028..098415b53 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -63,6 +63,7 @@
>   #include "i915/gem_mman.h"
>   
>   #include "igt_syncobj.h"
> +#include "igt_thread.h"
>   #include "intel_allocator.h"
>   #include "xe_drm.h"
>   #include "xe/xe_ioctl.h"
> @@ -3362,5 +3363,7 @@ err:
>   	if (is_xe)
>   		xe_device_put(fd);
>   
> +	igt_thread_assert_no_failures();
> +
>   	return exitcode;
>   }

LGTM,
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>

