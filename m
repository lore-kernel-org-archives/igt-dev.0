Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A614BCDB47F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 09:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554D210E1C6;
	Thu, 25 Jun 2026 09:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVzPmj0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E52010F1C5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782378005; x=1813914005;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1TEVuF5Ngz4DVUwT37YRP8PQZpVBdFv90u35ULYHTtg=;
 b=LVzPmj0nEmUViD4oZ0YxAors+GBjnO4ScsVdcfOWqOZWu1FJFX4HcEk0
 jOtdQDfVto3zxkg6OzhwvceOrttdPeto+mB9XPyewnyCIg9rFculAzeCl
 rnAfuKh6n0rwve9WaFAZ3kb9oVijz2yZ3/4LMI7TFDdCrAIVzyI0HacE3
 rcvVVXtmxNGlsTF00HkGp2kkALlRRaY2g6l9Ld3l6Yzz569aRFWLMoCzY
 nrdzjYIH+DuWEEcAPYql4GgaCSRWy3Y9tjNXeN08MYf7URh4IDqfysS40
 TbArFntLISnQ+2jjZFZX5QKQt7RLzLztz1/X9AJGOoccL1oEVDyV5xXK9 w==;
X-CSE-ConnectionGUID: om0qp+BDQmiDT7PVplIS0g==
X-CSE-MsgGUID: HEYYTZHWT2iDFvXbAQTf5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="94270592"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="94270592"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 02:00:04 -0700
X-CSE-ConnectionGUID: WGT1nPyyQ/iO/5x2pmhi3g==
X-CSE-MsgGUID: aBqV9lHIQ4SB8VdJVZwpzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="273939970"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.94])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 02:00:02 -0700
Date: Thu, 25 Jun 2026 11:00:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] benchmarks/gem_exec_trace: use
 hars_petruska_f54_1_random() from lib/rand
Message-ID: <3apgkow66ofonucapgl5ex55vjcjdbeofqktlrnzxavfexkldf@uorihbgw66oi>
References: <cover.1781791747.git.jani.nikula@intel.com>
 <c78b332ceeaa0c00b80e99f4e49765bc22abd0ab.1781791747.git.jani.nikula@intel.com>
 <f4zbjx4zch4c5c3m6ihqwkkw4ysm6rjkyjb24qkeoc6644lnhj@vk5kpqt4kljl>
 <af243a66da77bb294c3c985233f3decbf1b86b89@intel.com>
 <4ee63ffce8504cd794430e1cad3da6205b134cd0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ee63ffce8504cd794430e1cad3da6205b134cd0@intel.com>
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

On Wed, Jun 24, 2026 at 11:03:51AM +0300, Jani Nikula wrote:
> On Mon, 22 Jun 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Fri, 19 Jun 2026, Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> wrote:
> >> On Thu, Jun 18, 2026 at 05:09:52PM +0300, Jani Nikula wrote:
> >>> Remove the local duplicate of hars_petruska_f54_1_random() by switching
> >>> to use lib/rand.
> >>> 
> >>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>> ---
> >>>  benchmarks/gem_exec_trace.c | 12 +++---------
> >>>  1 file changed, 3 insertions(+), 9 deletions(-)
> >>> 
> >>> diff --git a/benchmarks/gem_exec_trace.c b/benchmarks/gem_exec_trace.c
> >>> index 4263ccb03dbd..c27639105903 100644
> >>> --- a/benchmarks/gem_exec_trace.c
> >>> +++ b/benchmarks/gem_exec_trace.c
> >>> @@ -42,6 +42,7 @@
> >>>  #include "drm.h"
> >>>  #include "drmtest.h"
> >>>  #include "i915/gem_create.h"
> >>> +#include "igt_rand.h"
> >>>  #include "igt_stats.h"
> >>>  #include "intel_io.h"
> >>>  #include "ioctl_wrappers.h"
> >>> @@ -92,14 +93,7 @@ struct trace_wait {
> >>>  	uint32_t handle;
> >>>  } __attribute__((packed));
> >>>  
> >>> -static uint32_t hars_petruska_f54_1_random(void)
> >>> -{
> >>> -	static uint32_t state = 0x12345678;
> >>> -
> >>> -#define rol(x,k) ((x << k) | (x >> (32-k)))
> >>> -	return state = (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37798849;
> >>> -#undef rol
> >>> -}
> >>> +static uint32_t random_state = 0x12345678;
> >>>  
> >>>  static double elapsed(const struct timespec *start, const struct timespec *end)
> >>>  {
> >>> @@ -277,7 +271,7 @@ static double replay(const char *filename, long nop, long range)
> >>>  				sizeof(*exec_objects)))->handle = bo[0];
> >>>  
> >>>  			if (nop > 0) {
> >>> -				eb.batch_start_offset = hars_petruska_f54_1_random();
> >>> +				eb.batch_start_offset = hars_petruska_f54_1_random(&random_state);
> >>
> >> With random_state as above this offset is not random. I think adding nop
> >> to random_state would do this.
> >
> > I'm only aiming to do a non-functional conversion to existing library
> > functions. Please explain how this patch changes behaviour; I don't see
> > it.
> 
> Zbigniew, ping?

I'm sorry for the delay.

I wondered to change offsets for each run, with same random_state on the
beginning we use same offsets sequence.

But it's fine to me, I mean your change doesn't change functionality
but code placement.

Pick my r-b for this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> >
> >
> > BR,
> > Jani.
> >
> >>
> >> --
> >> Zbigniew
> >>
> >>>  				eb.batch_start_offset =
> >>>  					((uint64_t)eb.batch_start_offset * range) >> 32;
> >>>  				eb.batch_start_offset = ALIGN(eb.batch_start_offset, 64);
> >>> -- 
> >>> 2.47.3
> >>> 
> 
> -- 
> Jani Nikula, Intel
