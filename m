Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44336EB70
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 05:51:22 +0000 (UTC)
Date: Fri, 6 Aug 2021 07:51:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210806055112.GB3285@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-3-zbigniew.kempczynski@intel.com>
 <87k0l2kztn.wl-ashutosh.dixit@intel.com>
 <87eebakqp3.wl-ashutosh.dixit@intel.com>
 <20210804061341.GA4891@zkempczy-mobl2>
 <87fsvnu3i5.wl-ashutosh.dixit@intel.com>
 <875ywjtlu1.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875ywjtlu1.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 02/52] lib/intel_allocator: Add few
 helper functions for common use
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

On Thu, Aug 05, 2021 at 06:15:34PM -0700, Dixit, Ashutosh wrote:
> On Thu, 05 Aug 2021 11:53:54 -0700, Dixit, Ashutosh wrote:
> >
> > On Tue, 03 Aug 2021 23:13:41 -0700, Zbigniew Kempczyński wrote:
> > >
> > > Even if Simple is stateful we got some case in which its usage
> > > is currently limited (so you can see using reloc in most of the
> > > tests). Problem is with...  it is stateful. Most of tests creates batch
> > > (gem object), use it and destroy it. From allocator perspective we alloc
> > > offset, then we free it. In next round we got same offset for another batch
> > > (gem object). So kernel serialize the execution until previous vma is freed.
> > > This lead to non-pipelined execution.
> >
> > Maybe I am wrong but to me it looks fixable. Maybe we need to keep track of
> > the "last allocated offset" in simple so that next time we allocate a new
> > offset even if the previous one has been freed (rather than reallocating
> > the previous offset). Or we can allocate starting from a random offset?
> >
> > > You can see pattern in many tests - ahnd = get_reloc_ahnd(...),
> > > get offset for scratch surface, then pass scratch_offset to some execution
> > > function. This allows to keep us same offset for scratch and get new
> > > offsets for batches.
> 
> So I think I see this in e.g. the gem_exec_async patch. Allocating new
> offsets for batches helps to avoid the stalls mentioned above, correct?

Yes, but here we use id to "generate" offset for bb. That's corner case
where we need same scratch_offset in store_dword as well as in spinner
(.dependency), so stateful allocator must be passed. Btw as there's
simple allocator I could also pass ahnd and get_offset(..., scratch,
...) one time in store_dword, but I still need to pass scratch size at
least or define it outside of function.

> 
> > > The best would be to have something hybrid which would propose new (and
> > > not busy) bb, but that should happen in multiprocess env so I haven't
> > > found how to write this yet. Libdrm handles pools of objects and reuses
> > > them if they were not busy. But doing this in multiprocess requires
> > > synchronization so some additional mechanism should be added to
> > > allocator to handle this case.
> 
> What I proposed above using "last allocated offset" will not work in the
> multiprocess env?

It will work. Strange things can happen when we wrap around gtt size, what
for ppgtt likely shouldn't be big deal (size is big so risk we hit busy 
offset is small, same like in reloc right now).

--
Zbigniew

> 
> > > I still wonder to introduce .dependency_offset in creating spinner when
> > > .dependency handle is passed. Currently we have to use Simple to ensure
> > > we got same offset for .dependency. As spinners keep batch handles until
> > > they are freed this likely is not a problem. But it may be in the
> > > future.
> 
> OK.
> 
> > I am not following the above two paragraphs, maybe we can discuss more some
> > time.
> 
> I do follow what you are saying now somewhat. Thank you.
