Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DCF6E187
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Oct 2021 03:31:08 +0000 (UTC)
Date: Fri, 15 Oct 2021 05:31:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211015033103.GB3607@zkempczy-mobl2>
References: <20211014081917.15977-1-zbigniew.kempczynski@intel.com>
 <20211014081917.15977-8-zbigniew.kempczynski@intel.com>
 <87r1cncquu.wl-ashutosh.dixit@intel.com>
 <20211015024905.GA3607@zkempczy-mobl2>
 <87mtnbc6ww.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mtnbc6ww.wl-ashutosh.dixit@intel.com>
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

On Thu, Oct 14, 2021 at 08:18:23PM -0700, Dixit, Ashutosh wrote:
> On Thu, 14 Oct 2021 19:49:05 -0700, Zbigniew Kempczyński wrote:
> >
> > On Thu, Oct 14, 2021 at 01:07:37PM -0700, Dixit, Ashutosh wrote:
> > > On Thu, 14 Oct 2021 01:19:17 -0700, Zbigniew Kempczyński wrote:
> > > >
> > > > @@ -127,9 +151,14 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
> > > >					obj.alignment = 0;
> > > >					gem_execbuf(fd, &execbuf);
> > > >
> > > > -					/* fault out */
> > > > -					obj.alignment = 1ull << 63;
> > > > -					__gem_execbuf(fd, &execbuf);
> > > > +					if (ahnd) {
> > > > +						obj.offset = get_offset(ahnd, obj.handle, size, 0);
> > > > +						obj.flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > > > +					} else {
> > > > +						/* fault out */
> > > > +						obj.alignment = 1ull << 63;
> > > > +						__gem_execbuf(fd, &execbuf);
> > > > +					}
> > >
> > > Bug above, __gem_execbuf should be moved out of the else {}.
> >
> > No, it shouldn't. Normal execbuf will lead to unbind/bind with new offset
> > and no 'alignment' fault-out execbuf is necessary.
> 
> Ah, you are right. Though in that case I think, if the loop has N
> iterations, the number of binds is N and the number of unbinds will be (N -
> 1). Is it worth fixing that? Basically I think we might need to add a bind
> outside the first iteration of the loop so that we have an unbind in the
> first iteration itself. Then we will have N binds and N unbinds I think.

You're right, for softpin case we got N-1. But I don't think we want to 
compare results between alignment / softpin paths but for dedicated changes
in the kernel. So then that missing unbind doesn't matter.

--
Zbigniew
