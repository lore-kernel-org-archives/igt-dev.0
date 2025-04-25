Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED828C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 14:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AD010E312;
	Fri, 25 Apr 2025 14:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EqjoJwOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E1A10E312
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745592491; x=1777128491;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=09aFyA5VNTzF+dVAnNcdrZmFnKDaCqj4Md3C/Evmw0Q=;
 b=EqjoJwOt23f7BrlUXwaHplmre4JJzXUKCrrTF2Rj8YhEv1pSy7qqmbNN
 PDFLkoT+bqbE9fVEgdYeIZjL0YbsUEjtO6TzBhKg2Edb9b0TgKNKLr0Al
 RO5ibpQYwu3gwRdmPrNepwaCQBL0JKrh8dKT3vV907yTYxstejTAZhrt6
 PNPbD/XV18j/h9iuo1d6JLzOhnaddk5xSHbY3SfWuPoEHPcmNVmOxtQha
 TKIMmnR6Kz/4+TYT/lASQVFkDYajvEfk/pSgIea84eMVhx9sVjnVnPk/4
 NvVHAModeWNz0XIdrN8m6n4QOMCGOcjwePbabmytF9ZXVRpd5jpk3fKTc A==;
X-CSE-ConnectionGUID: SPODVGQcRG+/8ZcY6wh8tQ==
X-CSE-MsgGUID: YiwYNXDZQ7ODR84aAgLBJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47130299"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47130299"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:48:10 -0700
X-CSE-ConnectionGUID: lH+eUB9JRmStVHJaaRAsBQ==
X-CSE-MsgGUID: O95qd1eKStaa+W7/+AWECg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="137752686"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 07:48:09 -0700
Date: Fri, 25 Apr 2025 16:48:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/xe: replace div64_u64_round_up() with
 DIV_ROUND_UP
Message-ID: <20250425144806.bqpl67lsdpmfabzj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20250416163053.117425-1-shuicheng.lin@intel.com>
 <20250416163053.117425-3-shuicheng.lin@intel.com>
 <20250424173944.s35q2xkfk3ltik4d@kamilkon-DESK.igk.intel.com>
 <DM4PR11MB54564522C4B40D776C9AD614EA842@DM4PR11MB5456.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54564522C4B40D776C9AD614EA842@DM4PR11MB5456.namprd11.prod.outlook.com>
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

Hi Lin,,
On 2025-04-25 at 03:35:08 +0000, Lin, Shuicheng wrote:
> On Thu, April 24, 2025 10:40 AM Kamil Konieczny wrote:
> > Hi Shuicheng,
> > On 2025-04-16 at 16:30:52 +0000, Shuicheng Lin wrote:
> > > DIV_ROUND_UP is defined in igt_aux.h with the same function as
> > > div64_u64_round_up().
> > 
> > Version in igt_aux.h is different then one below.
> > 
> > >
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >  lib/xe/xe_util.c | 10 +---------
> > >  1 file changed, 1 insertion(+), 9 deletions(-)
> > >
> > > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c index
> > > 06b378ce0..9907c8b16 100644
> > > --- a/lib/xe/xe_util.c
> > > +++ b/lib/xe/xe_util.c
> > > @@ -253,14 +253,6 @@ static uint32_t reference_clock(int fd, int gt_id)
> > >  	return refclock;
> > >  }
> > >
> > > -static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t
> > > y) -{
> > > -	igt_assert(y > 0);
> > > -	igt_assert_lte_u64(x, UINT64_MAX - (y - 1));
> > 
> > I like those two asserts here, why not moving this function to lib igt_aux.c and
> > creating new macro for it?
> > 
> > #define DIV64_ROUND_UP(n, d) div64_u64_round_up((uint64_t)(n),
> > (uint64_t)(d))
> > 
> > or make it a multi-line macro with do { ... } while(0)
> > 
> > Regards,
> > Kamil
> 
> Since there is DIV_ROUND_UP already, I don't want to add DIV64_ROUND_UP.
> DIV_ROUND_UP doesn't require the data type. Although there is no harm
> to do the data conversion, I just think it is not necessary here.
> I agree the assert is more secure.
> Since my change is just a cleanup, no real functional changes.

If you want real cleanup without functional changes move this function
to igt_aux.c and use it instead of using a macro.

Btw all macros are error prone, why not just a function with a little
more safety like:

	r = x % y;
	x /= y;
	if (r)
		++x;

so second assert becomes unnecessery except a new check:

	igt_assert(y > 1);

> Let me drop this patch. Thanks.
> 
> BTW, I just found there is _DIV_ROUND_UP definition in the code also. Maybe we
> could do more cleanup later.

Another almost identical macro will not solve a problem.

Regards,
Kamil

> 
> Shuicheng
> 
> > 
> > > -
> > > -	return (x + y - 1) / y;
> > > -}
> > > -
> > >  /**
> > >   * xe_nsec_to_ticks: convert time in nanoseconds to timestamp ticks
> > >   * @fd: opened device
> > > @@ -273,5 +265,5 @@ uint32_t xe_nsec_to_ticks(int fd, int gt_id,
> > > uint64_t nsec)  {
> > >  	uint32_t refclock = reference_clock(fd, gt_id);
> > >
> > > -	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
> > > +	return DIV_ROUND_UP(nsec * refclock, NSEC_PER_SEC);
> > >  }
> > > --
> > > 2.25.1
> > >
