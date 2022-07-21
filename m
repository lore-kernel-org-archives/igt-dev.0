Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6FE113092
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jul 2022 04:35:34 +0000 (UTC)
Date: Thu, 21 Jul 2022 06:35:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <YtjXkqbDQXNuZbhI@zkempczy-mobl2>
References: <20220719115141.35236-1-zbigniew.kempczynski@intel.com>
 <20220719115141.35236-3-zbigniew.kempczynski@intel.com>
 <YtflF9TyQlM7sSNy@kamilkon-desk1> <YtfqeucDbMYJLHhq@zkempczy-mobl2>
 <YtfwKJDkURqSHeHU@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtfwKJDkURqSHeHU@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/i915/perf_pmu: Add second
 store dword for looping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 20, 2022 at 02:08:08PM +0200, Kamil Konieczny wrote:

<cut>
> > > > -	map = gem_mmap__device_coherent(gem_fd, obj.handle, 0, 4096, PROT_WRITE);
> > > > +	map = gem_mmap__device_coherent(gem_fd, obj.handle, 0, 4096, PROT_READ | PROT_WRITE);
> > > >  	gem_execbuf(gem_fd, &eb);
> > > > +	igt_assert(gem_bo_busy(gem_fd, obj.handle));
> > > 
> > > This assert here prevents your warnings below to happen, maybe
> > > just store this as boolean for later ?
> > 
> > Execbuf changed that object is busy, so for normal condition it would
> > never assert. If it asserts here that means wait is already completed
> > so that means semaphore wait didn't happen.
> 
> But it is exactly what you wrote above about reading from scratch
> so why not remember it here and dump debugs later ?

Ok, lets do igt_debug() before and after loop. More info is better than
less info. Maybe it will be some clue what's wrong sometimes.

--
Zbigniew

> 
> > > >  	spin = igt_spin_new(gem_fd, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
> > > >  
> > > > -	/* Wait until the batch is executed and the semaphore is busy-waiting */
> > > > -	while (!READ_ONCE(*map) && gem_bo_busy(gem_fd, obj.handle))
> > > > +	/*
> > > > +	 * Wait until the batch is executed and the semaphore is busy-waiting.
> > > > +	 * Also stop on timeout.
> > > > +	 */
> > > > +	igt_nsec_elapsed(&tv);
> > > > +	while (READ_ONCE(map[1]) != 2 && gem_bo_busy(gem_fd, obj.handle) &&
> > > > +	       igt_seconds_elapsed(&tv) < timeout)
> > > >  		;
> > > > +	if (igt_seconds_elapsed(&tv) >= timeout)
> > > > +		igt_warn("timeout: [%u/%u]\n", igt_seconds_elapsed(&tv), timeout);
> 
> Hmm, maybe igt_debug here ?
> 
> > > > +	if (!gem_bo_busy(gem_fd, obj.handle))
> > > > +		igt_warn("Bo != busy, map[0] = %u, map[1] = %u\n", map[0], map[1]);
> 
> This will not warn if it asserts before.
> 
> --
> Kamil
> 
> > > > +	igt_assert(map[0] == 1);
> > > >  	igt_assert(gem_bo_busy(gem_fd, obj.handle));
> > > >  	gem_close(gem_fd, obj.handle);
> > > >  
> > > > -- 
> > > > 2.34.1
> > > > 
