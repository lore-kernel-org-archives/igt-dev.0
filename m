Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7957CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 05:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6961710E1B3;
	Mon, 18 Aug 2025 05:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8hI8cJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0750910E1B3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 05:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755495006; x=1787031006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3AOSAiDHpqC0UNSQgJZqbXezfAzx9dp/V9ygZpsZzB8=;
 b=G8hI8cJLQHO9c2mP7o6y1yK8JNrw1g/bcl9J+KTMNRFq4vWdiBu9dIjJ
 WE159446pabwMIXjiye8orH8muFgqBhnfUx2pJ9g6e1DwsCHdR+w0ZT+t
 eRhFR9flMh+Noc0QKiCDJQB9B8cNduMLeGnF24lPe+K6pfcV4k0U3nWc5
 yMCSIQTj+nJCXZzPrYv6FnXKHbEdu3xmGhCOdv19R0vD0tn2BvrPHEdKX
 bHfZ27aiVU6X9Hb5I46uy4KQphFSkNFZHtDjjCG66djpTTrNvRZd8brjQ
 lB5FGnch8JSlev+Yt/C0YJ+0PwIDI2K7VybIH/G1txzgL/A16GLBjjgWV A==;
X-CSE-ConnectionGUID: tCTZAb6wSHOdYbaz+5ko2w==
X-CSE-MsgGUID: hUQ1u73zRQOiT1fBwT4Utw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="56738530"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="56738530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 22:30:06 -0700
X-CSE-ConnectionGUID: Qbo2DmBZQVK4ob9wuAFIQg==
X-CSE-MsgGUID: x0ipwV53SmGv925yBUwLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="204652460"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 22:30:03 -0700
Date: Mon, 18 Aug 2025 07:29:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, 
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 sai gowtham <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Message-ID: <qdsmcgetys4fxgv5vgr2hml5lml5llnojsqtkrteys4uj4yltl@hzfd3ln5y3mt>
References: <20250814185009.52614-2-jonathan.cavitt@intel.com>
 <aJ4zZki709mmqtbV@lstrano-desk.jf.intel.com>
 <CH0PR11MB544476B570A9C0B2BB2CECA4E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aJ432wBs0B9fhINb@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ432wBs0B9fhINb@lstrano-desk.jf.intel.com>
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

On Thu, Aug 14, 2025 at 12:24:11PM -0700, Matthew Brost wrote:
> On Thu, Aug 14, 2025 at 01:11:39PM -0600, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com> 
> > Sent: Thursday, August 14, 2025 12:05 PM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> > Subject: Re: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to preemptable spin init
> > > 
> > > On Thu, Aug 14, 2025 at 06:50:10PM +0000, Jonathan Cavitt wrote:
> > > > Add an additional MI_ARB_CHECK to the spin initialization function,
> > > > just before the conditional batch buffer end, when preemption is
> > > > enabled.  The MI_ARB_CHECK forces a preemption in this case, which can
> > > > allow additionally scheduled exec queues to make independent progress
> > > > earlier than if we relied on the automatic timeout of the exec queue.
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5783
> > > > Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > > ---
> > > >  lib/xe/xe_spin.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> > > > index 25f7555e27..b3a937fe80 100644
> > > > --- a/lib/xe/xe_spin.c
> > > > +++ b/lib/xe/xe_spin.c
> > > > @@ -30,7 +30,6 @@
> > > >  
> > > >  enum { START_TS, NOW_TS };
> > > >  
> > > > -
> > > >  uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
> > > >  {
> > > >  	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
> > > > @@ -167,6 +166,9 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
> > > >  				   opts->mem_copy->dst->mocs_index;
> > > >  	}
> > > >  
> > > > +	if (opts->preempt)
> > > > +		spin->batch[b++] = MI_ARB_CHECK;
> > > 
> > > But we already have one these at the top of the loop:
> > > 
> > >  72         loop_addr = opts->addr + b * sizeof(uint32_t);
> > >  73
> > >  74         spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > >  75         spin->batch[b++] = start_addr;
> > >  76         spin->batch[b++] = start_addr >> 32;
> > >  77         spin->batch[b++] = 0xc0ffee;
> > >  78
> > >  79         if (opts->preempt)
> > >  80                 spin->batch[b++] = MI_ARB_CHECK;
> > > 
> > > Line 74 is here the ring loop restarts.
> > 
> > I tried removing the top MI_ARB_CHECK, but that caused the test to start
> > failing again, so it looks like both MI_ARB_CHECK calls are necessary.
> > -Jonathan Cavitt
> 
> It shouldn’t be, though. A couple of instructions later we should jump
> to loop_addr (that is line 73 ring instruction) and then execute the
> MI_ARB_CHECK programmed in the ring at line 80.
> 
> I’m all for fixing the tests, but I want to understand what’s going on
> here.

We (me and Sai) noticed that adding additional MI_ARB_CHECK increases
the preemption probability. I totally agree we already have one MI_ARB_CHECK
in a loop but from some unknown reason even it if is run in a loop it
mostly has no effect. Why I claim there's no effect? We tried to
increase preempt_timeout_us to 2000000, and preemption still didn't
happened during this period.

--
Zbigniew

> 
> Can you reliably reproduce this issue and confirm that it fails before
> this change and works after?
> 
> Matt
> 
> > 
> > > 
> > > Matt
> > > 
> > > > +
> > > >  	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
> > > >  	spin->batch[b++] = 0;
> > > >  	spin->batch[b++] = end_addr;
> > > > -- 
> > > > 2.43.0
> > > > 
> > > 
