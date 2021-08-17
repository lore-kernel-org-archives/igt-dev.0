Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22466E0F8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 05:21:06 +0000 (UTC)
Date: Tue, 17 Aug 2021 07:21:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210817052100.GB3283@zkempczy-mobl2>
References: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
 <20210816115626.22759-5-zbigniew.kempczynski@intel.com>
 <87o89wzub2.wl-ashutosh.dixit@intel.com>
 <87mtpgzp5a.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtpgzp5a.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] tests/gem_exec_schedule: Adopt to
 use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 16, 2021 at 09:11:29PM -0700, Dixit, Ashutosh wrote:
> On Mon, 16 Aug 2021 19:20:01 -0700, Dixit, Ashutosh wrote:
> >
> > > +		for (i = 0; i < GEM_MAX_ENGINES; i++)
> > > +			if (sema[i])
> > > +				igt_spin_free(i915, sema[i]);
> >
> > Did we create this array etc. to avoid the stall when the spin is freed and
> > the offset is reused? Or is there a different reason?
> 
> A one line comment about why this was done would be nice prior to merging.

Ok, I'm going to add this before merge.

--
Zbigniew

> 
> >
> > Otherwise this is:
> >
> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
