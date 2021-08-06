Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C90B6EA50
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 05:35:50 +0000 (UTC)
Date: Fri, 6 Aug 2021 07:35:44 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210806053544.GA3285@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-3-zbigniew.kempczynski@intel.com>
 <87k0l2kztn.wl-ashutosh.dixit@intel.com>
 <87eebakqp3.wl-ashutosh.dixit@intel.com>
 <20210804061341.GA4891@zkempczy-mobl2>
 <87fsvnu3i5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fsvnu3i5.wl-ashutosh.dixit@intel.com>
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 05, 2021 at 11:53:54AM -0700, Dixit, Ashutosh wrote:

<cut>
 
> > Even if Simple is stateful we got some case in which its usage
> > is currently limited (so you can see using reloc in most of the
> > tests). Problem is with...  it is stateful. Most of tests creates batch
> > (gem object), use it and destroy it. From allocator perspective we alloc
> > offset, then we free it. In next round we got same offset for another batch
> > (gem object). So kernel serialize the execution until previous vma is freed.
> > This lead to non-pipelined execution.
> 
> Maybe I am wrong but to me it looks fixable. Maybe we need to keep track of
> the "last allocated offset" in simple so that next time we allocate a new
> offset even if the previous one has been freed (rather than reallocating
> the previous offset). Or we can allocate starting from a random offset?

Yes, strategy with shifting offset (like in reloc) but beeing stateful will
likely work in most cases. I'm going to experiment with adding this to 
Simple when we finish this series. It will be much easier to find out this
will work when we will replace reloc->simple after such change on all tests.
I don't think random is good choice, if we hit busy offset we need to iterate
one or more in lists. 

> 
> > You can see pattern in many tests - ahnd = get_reloc_ahnd(...),
> > get offset for scratch surface, then pass scratch_offset to some execution
> > function. This allows to keep us same offset for scratch and get new
> > offsets for batches. The best would be to have something hybrid which would
> > propose new (and not busy) bb, but that should happen in multiprocess env
> > so I haven't found how to write this yet. Libdrm handles pools of objects
> > and reuses them if they were not busy. But doing this in multiprocess
> > requires synchronization so some additional mechanism should be added
> > to allocator to handle this case.
> >
> > I still wonder to introduce .dependency_offset in creating spinner when
> > .dependency handle is passed. Currently we have to use Simple to ensure
> > we got same offset for .dependency. As spinners keep batch handles until
> > they are freed this likely is not a problem. But it may be in the future.
> 
> I am not following the above two paragraphs, maybe we can discuss more some
> time.

Ok.

> 
> > >
> > > > +static inline uint64_t get_offset(uint64_t ahnd, uint32_t handle,
> > > > +				  uint64_t size, uint64_t alignment)
> > > > +{
> > > > +	if (!ahnd)
> > > > +		return 0;
> > > > +
> > > > +	return intel_allocator_alloc(ahnd, handle, size, alignment);
> > > > +}
> > > > +
> > > > +static inline bool put_offset(uint64_t ahnd, uint32_t handle)
> > > > +{
> > > > +	if (!ahnd)
> > > > +		return 0;
> > > > +
> > > > +	return intel_allocator_free(ahnd, handle);
> > > > +}
> > > > +
> > >
> > > Also for the function names are too generic with potential for namespace
> > > conflicts, probably ahnd_get_offset/ahnd_put_offset?
> >
> > If there will be more voices to change it I'll do it. At the moment
> > I wanted to have few short functions. I thought about ahnd_get_offset(ahnd, ...)
> > but when ahnd would be valid allocator handle, asserting otherwise.
> > get_offset(ahnd, ...) would just return some offset, for relocations
> > it may be 0 (like currently is), allocating offset for valid ahnd.
> 
> No need to change, it's fine for now. Thanks for the long explanation.
> 
> -Ashutosh

I assume this is equal to r-b if not already applied.

--
Zbigniew
