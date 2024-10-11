Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFEFD24470
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 17:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABED10EBA7;
	Fri, 11 Oct 2024 17:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/SBSZ9i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7932F10EBA7
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728666712; x=1760202712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fmmvAhuoyi7TYdYU52A/BBwV43Rsr0AZQg2LDLCWpmQ=;
 b=S/SBSZ9ixtod+uVmepz8Tq8dwmTcGJhpVsv/fuXkoz5oM/PaABRf5ufc
 v095AK42Dr/cgKiUcm40pgA+//H54HFHhhVzn/Vr5CvsCfkUdBgeeb4+L
 Qluc0A0bCMQVomnla4aLsYE/tTQZ7O88z69yoUJOyla0EjJgosCEQvgoN
 dyHl2PsXLRJpLVxBMxZvX+duuHFishSoi77tP3GPNw8kSUgEgnwKCW1/T
 7j00ytHapO2sbXhpfoms5VKl1a1fub3M/FJr2mPWAIICpWyeqWTgS9674
 a1Kc2YXsGcwQnqOJpVFLup/kwH228ppFGqSRcpXTvHRBSixS8L/NQxweo g==;
X-CSE-ConnectionGUID: MQsifYxHTNuC0LHTttXa3w==
X-CSE-MsgGUID: makMgA3LTumubDJisgKucA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39467937"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="39467937"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 10:11:52 -0700
X-CSE-ConnectionGUID: A+cd8QLPRWuCuEzuxHZqag==
X-CSE-MsgGUID: Qt7Ak6ieR6SUDCNSUZSnkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="77437955"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 10:11:51 -0700
Date: Fri, 11 Oct 2024 19:11:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_query: Clarify delta
 engine_cycles calculation
Message-ID: <20241011171148.zaro5ivq57dr3xkt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241011030507.321961-1-lucas.demarchi@intel.com>
 <20241011030507.321961-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011030507.321961-3-lucas.demarchi@intel.com>
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
On 2024-10-10 at 22:05:07 -0500, Lucas De Marchi wrote:
> Let the compiler do the wrap around width instead of doing different
> calculations depending on if the second value is lower than the first.
> 
> The only reason for ts2.engine_cycles to be lower than ts1.engine_cycles
> is if a wrap around ocurred. The wrap around should happen
> wrt the width reported by the kernel. However that is not really true
> and kernel simply reports the value "as is". With Xe2, the value is
> actually 64-bits and width is currently reported as 36 (that's being
> changed in the kernel side). So, if engine_cycles would have to wrap
> around 64 bits for that condition to hold true, and in that case we'd
> calculate the delta by shifting (1 << ts2.width), giving a wrong result.
> 
> Luckly, wrapping 64 bits means at 19.2Mhz takes forever and is not a
> problem in real life.
> 
> Anyway, fix the math which also removes the ugly check by b >= a.
> Example:
> 
> 	#include <stdio.h>
> 	#include <inttypes.h>
> 
> 	int main(void)
> 	{
> 		uint64_t mask = (1ull << 36) - 1;
> 		uint64_t a, b;
> 
> 		a = mask - 1;
> 		b = mask;
> 		printf("%"PRIu64"\n", (b - a) & mask);
> 
> 		a = mask;
> 		b = (mask + 1) & mask;
> 		printf("%"PRIu64"\n", (b - a) & mask);
> 
> 		a = UINT64_MAX & mask;
> 		b = 0 & mask;

Just zero is enough.

> 		printf("%"PRIu64"\n", (b - a) & mask);

Instead of repetition here, why not call a function?

void delta(uint64_t a, uint64 b, uint64 mask) {
	printf("%"PRIu64"\n", ((b & mask) - (a & mask)) & mask);
}

	delta(mask - 1,   mask,     mask);
	delta(mask,       mask + 1, mask);
	delta(UINT64_MAX, 0,        mask);

> 
> 		return 0;
> 	}
> 
> which does the correct wrap around and prints 1 in all cases.

Do we need this example code in commit message?

With or without it

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_query.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 87ddb58bb..1566680e7 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -15,6 +15,7 @@
>  #include <string.h>
>  
>  #include "igt.h"
> +#include "linux_scaffold.h"
>  #include "xe_drm.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -738,6 +739,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  #define NUM_SNAPSHOTS 10
>  	for (i = 0; i < NUM_SNAPSHOTS * ARRAY_SIZE(clock); i++) {
>  		int index = i / NUM_SNAPSHOTS;
> +		uint64_t width_mask;
>  
>  		ts1.eci = *hwe;
>  		ts1.clockid = clock[index].id;
> @@ -763,12 +765,12 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
>  
>  		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
>  
> -		if (ts2.engine_cycles >= ts1.engine_cycles)
> -			delta_cs = (ts2.engine_cycles - ts1.engine_cycles) *
> -				   NSEC_PER_SEC / eng_ref_clock;
> -		else
> -			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
> -				   NSEC_PER_SEC / eng_ref_clock;
> +		igt_assert_eq(ts1.width, ts2.width);
> +		width_mask = GENMASK_ULL(ts1.width - 1, 0);
> +		ts1.engine_cycles &= width_mask;
> +		ts2.engine_cycles &= width_mask;
> +		delta_cs = ((ts2.engine_cycles - ts1.engine_cycles) & width_mask) *
> +			NSEC_PER_SEC / eng_ref_clock;
>  
>  		calc_freq = (ts2.engine_cycles - ts1.engine_cycles) * NSEC_PER_SEC / delta_cpu;
>  
> -- 
> 2.46.2
> 
