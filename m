Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F2C6E138
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 08:12:05 +0000 (UTC)
Date: Thu, 14 Oct 2021 10:11:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211014081159.GE3617@zkempczy-mobl2>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
 <20211008065432.15482-8-zbigniew.kempczynski@intel.com>
 <871r4oi4il.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871r4oi4il.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] benchmarks/gem_exec_fault: Add
 softpin mode to support gens with ppgtt
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 10:01:22PM -0700, Dixit, Ashutosh wrote:
> On Thu, 07 Oct 2021 23:54:32 -0700, Zbigniew Kempczyński wrote:
> >
> > +	/*
> > +	 * For older gens .alignment = 1ull << 63 lead do bind/unbind,
> > +	 * what doesn't work for newer gens with ppgtt.
> > +	 * For ppgtt case we use reloc allocator which would just assigns
> > +	 * new offset for each batch. This way we enforce bind/unbind vma
> > +	 * for each execbuf.
> 
> So assigning a new offset will cause a new fault-in (bind) but not sure if
> it will cause an actual fault-out (unbind). Though I am not sure if there
> is actually a way to force it to happen if this doesn't work? Is there a
> way to verify that the unbind is actually happening?
> 
> Neither I am sure how setting the 'alignment = 1ull << 63' caused a fault
> out in the older code.

I got no access to !ppgtt gen but for my understanding in __gem_execbuf()
we will enforce unbind (trying to get offset at 1ull << 63) what is impossible
so unbind path will occur and some error code will be returned. But after
this we got object unbound so next time on !ppgtt gens when we set 0 alignment
kernel will choose some free offset for us. 

> 
> > +	 */
> > +	has_ppgtt = gem_uses_full_ppgtt(fd);
> > +	if (has_ppgtt) {
> > +		igt_info("Using softpin mode\n");
> > +		intel_allocator_multiprocess_start();
> > +	} else {
> > +		igt_assert(gem_allows_passing_alignment(fd));
> 
> I think this should be igt_require for the test to skip rather than fail.

I would not, I think for !ppgtt we want to have possibility passing 
alignment and benchmark requires that. Fail is much better imo because 
it will show something wrong has happened in the kernel we don't support.
And it requires attention from our side whereas skip may suggest it is 
expected while is not.

> 
> > +/*
> > + * NOTE: Ensure prove locking in the kernel is off, otherwise results
> > + * would be inaccurate.
> > + */
> 
> This is really a debug setting, any such setting (say lockdep, kmemchek
> etc.) will affect benchmarks. So not sure if this specifically needs to be
> called out.

You're right - this comment is unnecessary here. Any debugging options
in the kernel will have influence on benchmarking so we shouldn't run
benchmarks there.

--
Zbigniew
