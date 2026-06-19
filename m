Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6A3CD98E6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 05:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E5A10E021;
	Fri, 19 Jun 2026 05:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoiKtzEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB7E10E021
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 05:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781846239; x=1813382239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qExZZ09U3cMkYoF3Fc68w5KQLDmO8IsPNxs2Irbpvco=;
 b=HoiKtzEFnDGBnDRnc9UH5AvaD9yZCIVDN4W+ThZkwcojFTU/l+aWD1i8
 GJyyvLaXVal3mfIbQ7WvEuRdCOkMwYjhZLYNBLhmvPLynprBeGmrEnbCb
 PDUlm4tL3+3Fi7Nsbqbsw0tjG8jCTjnq0kaudGTbNafLzatjPcHFnbYdU
 drQ9sY8p35ZWuHLgVBzmcetnnlycchDvxreqfwF+IhPSzcDWCQqSa0G8P
 lt7hR0xYodn0M4B1kEWboj/F/t6OmX50a8Zeoj1TDp8nKLd+oLqE0DfYj
 gteU1dJt/MtAxkBSEKxZeOKAXBRgtsbwmCSq5tP5v6Att2HapNCTct1/7 g==;
X-CSE-ConnectionGUID: nFGSyjKzTUyWNVtiG+FFTg==
X-CSE-MsgGUID: oSOPbJmsQxmv+jfLkMS8nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82586072"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82586072"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:17:19 -0700
X-CSE-ConnectionGUID: 35LRYUHBQAmHLwHmJLmmaw==
X-CSE-MsgGUID: jWUJ2lcLT3yY00tjhMDYrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="248409279"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.156])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:17:19 -0700
Date: Fri, 19 Jun 2026 07:17:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] benchmarks/gem_exec_trace: use
 hars_petruska_f54_1_random() from lib/rand
Message-ID: <f4zbjx4zch4c5c3m6ihqwkkw4ysm6rjkyjb24qkeoc6644lnhj@vk5kpqt4kljl>
References: <cover.1781791747.git.jani.nikula@intel.com>
 <c78b332ceeaa0c00b80e99f4e49765bc22abd0ab.1781791747.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c78b332ceeaa0c00b80e99f4e49765bc22abd0ab.1781791747.git.jani.nikula@intel.com>
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

On Thu, Jun 18, 2026 at 05:09:52PM +0300, Jani Nikula wrote:
> Remove the local duplicate of hars_petruska_f54_1_random() by switching
> to use lib/rand.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  benchmarks/gem_exec_trace.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/benchmarks/gem_exec_trace.c b/benchmarks/gem_exec_trace.c
> index 4263ccb03dbd..c27639105903 100644
> --- a/benchmarks/gem_exec_trace.c
> +++ b/benchmarks/gem_exec_trace.c
> @@ -42,6 +42,7 @@
>  #include "drm.h"
>  #include "drmtest.h"
>  #include "i915/gem_create.h"
> +#include "igt_rand.h"
>  #include "igt_stats.h"
>  #include "intel_io.h"
>  #include "ioctl_wrappers.h"
> @@ -92,14 +93,7 @@ struct trace_wait {
>  	uint32_t handle;
>  } __attribute__((packed));
>  
> -static uint32_t hars_petruska_f54_1_random(void)
> -{
> -	static uint32_t state = 0x12345678;
> -
> -#define rol(x,k) ((x << k) | (x >> (32-k)))
> -	return state = (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37798849;
> -#undef rol
> -}
> +static uint32_t random_state = 0x12345678;
>  
>  static double elapsed(const struct timespec *start, const struct timespec *end)
>  {
> @@ -277,7 +271,7 @@ static double replay(const char *filename, long nop, long range)
>  				sizeof(*exec_objects)))->handle = bo[0];
>  
>  			if (nop > 0) {
> -				eb.batch_start_offset = hars_petruska_f54_1_random();
> +				eb.batch_start_offset = hars_petruska_f54_1_random(&random_state);

With random_state as above this offset is not random. I think adding nop
to random_state would do this.

--
Zbigniew

>  				eb.batch_start_offset =
>  					((uint64_t)eb.batch_start_offset * range) >> 32;
>  				eb.batch_start_offset = ALIGN(eb.batch_start_offset, 64);
> -- 
> 2.47.3
> 
