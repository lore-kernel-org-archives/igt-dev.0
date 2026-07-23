Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489EDC531D2
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 14:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40D510E59E;
	Thu, 23 Jul 2026 14:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WK1tg6SJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3678E10E58E
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784818273; x=1816354273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zzn4NqwEJBwe3Fz2DkMlzJeKqbfml/fvANEKfcmpaI0=;
 b=WK1tg6SJqxvbzb68j8mLcDW8U+KEerE/LbTowUF9TlDO38z1NPMuWttf
 ORti0XO1SpWO9bnauzqocOmWwVLbaKvqr3M9to/azPuxEXqsw7bL8CE5Z
 kz3uPqLfa2+4nngu4sanREVdCC8c8HfINf918kpY521eEwZ4ljeN6BgxM
 0trhVdTIJAdYRx51/pe20+u6Z4IU7Dfp6te4VhoVmZwmeOMa2wKCD2+yJ
 7ZFeP2htQV+lnwaaqMikeCNjWsEV1sRIxqd7hfsRytY86tqvmBkXSk4vM
 ik/bpMc+Xb2dNK4vfISdmh2/tcW0To6C1NAZ/7wEaNP46U4/K446mpD+U A==;
X-CSE-ConnectionGUID: alAr3U7OT62jG/tNBX8qGw==
X-CSE-MsgGUID: fDslSf6ITcqZYLxsGgJlYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="103021543"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="103021543"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 07:51:13 -0700
X-CSE-ConnectionGUID: gYPqpNSgTX+GzbJ6uepX9w==
X-CSE-MsgGUID: 9UM/nrnuTjKmYTyoObe8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="261977941"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 07:51:12 -0700
Date: Thu, 23 Jul 2026 16:51:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
 timeout
Message-ID: <20260723145109.ua6kvrcrcnsawnqj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
References: <20260723023251.4522-1-himanshu.girotra@intel.com>
 <20260723142536.tygckacog3jdhqex@kamilkon-DESK.igk.intel.com>
 <CH0PR11MB556412533FD9663DA67D1C7B98C02@CH0PR11MB5564.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB556412533FD9663DA67D1C7B98C02@CH0PR11MB5564.namprd11.prod.outlook.com>
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

Hi Girotra,,
On 2026-07-23 at 14:41:28 +0000, Girotra, Himanshu wrote:
> 
> 
> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: 23 July 2026 19:56
> > To: Girotra, Himanshu <himanshu.girotra@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>; Dandamudi, Priyanka
> > <priyanka.dandamudi@intel.com>; Konieczny, Kamil
> > <kamil.konieczny@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_threads: ignore expected hang
> > timeout
> > 
> Hi Kamil,
> 
> > Hi Himanshu,
> > On 2026-07-23 at 08:02:51 +0530, himanshu.girotra@intel.com wrote:
> > > From: Himanshu Girotra <himanshu.girotra@intel.com>
> > >
> > > The hang subtests hang a queue and reset to recover. Jobs that were
> > > queued but never started are logged by the KMD at warn level as "Check
> > > job timeout: ... not started".
> > >
> > > This warn is expected, but CI flags warn-level dmesg lines and fails
> > > the subtest even though it passes. Whitelist it for the hang subtests.
> > 
> > s/Whitelist/Ignore/
> > 
> > >
> > > v2: Rework description and comment to be generic (Priyanka,Kamil)
> > >
> > > Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> > > ---
> > >  tests/intel/xe_exec_threads.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/tests/intel/xe_exec_threads.c
> > > b/tests/intel/xe_exec_threads.c index 0480df779..2974fc312 100644
> > > --- a/tests/intel/xe_exec_threads.c
> > > +++ b/tests/intel/xe_exec_threads.c
> > > @@ -1468,6 +1468,16 @@ static void threads(int fd, int flags)
> > >  	pthread_barrier_destroy(&barrier);
> > >  }
> > >
> > > +/*
> > > + * Hang subtests reset the GPU to recover, so jobs that never started
> > > +are
> > > + * logged as "Check job timeout: ... not started". This warn is
> > > +expected;
> > > + * whitelist it to avoid spurious dmesg-warn failures in CI.
> > 
> > s/whitelist/ignore/
> > 
> 
> will change whitelist to ignore
> > > + */
> > > +static void ignore_multi_queue_hang_warnings_in_dmesg(void)
> > > +{
> > > +	igt_emit_ignore_dmesg_regex("Check job timeout: .*not started"); }
> > > +
> > >  int igt_main()
> > >  {
> > >  	const struct section {
> > > @@ -1735,6 +1745,9 @@ int igt_main()
> > >  				igt_assert(!(s->flags & BALANCER));
> > >  			}
> > >
> > > +			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
> > 
> > Why not simpler:
> > 			if (s->flags & (MULTI_QUEUE | HANG))
> 
> The regex we're suppressing is only seen on multi-queue hang subtests, whereas s->flags & (MULTI_QUEUE | HANG) is an OR — it would set it up for every multi-queue subtest and every hang subtest. We need both flags together, hence &&.


You are right, mine check is not equvalent, it should be:

	if ((s->flags & (MULTI_QUEUE | HANG)) == (MULTI_QUEUE | HANG))

and looks longer than yours. So with those s/whitelist/ignore/
fixes in commit message and in comment, this is

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw these could be fixed at merge time, no need for
sending new version.

Regards,
Kamil

> > 
> > 
> > 
> > Regards,
> > Kamil
> > 
> > > +
> > 	ignore_multi_queue_hang_warnings_in_dmesg();
> > > +
> > >  			threads(fd, s->flags);
> > >  		}
> > >  	}
> > > --
> > > 2.50.1
> > >
