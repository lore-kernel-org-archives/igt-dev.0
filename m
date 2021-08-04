Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4D56E11A
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Aug 2021 06:13:47 +0000 (UTC)
Date: Wed, 4 Aug 2021 08:13:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210804061341.GA4891@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-3-zbigniew.kempczynski@intel.com>
 <87k0l2kztn.wl-ashutosh.dixit@intel.com>
 <87eebakqp3.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87eebakqp3.wl-ashutosh.dixit@intel.com>
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

On Tue, Aug 03, 2021 at 05:18:32PM -0700, Dixit, Ashutosh wrote:
> On Tue, 03 Aug 2021 14:01:24 -0700, Dixit, Ashutosh wrote:
> >
> > On Mon, 26 Jul 2021 12:59:36 -0700, Zbigniew Kempczyński wrote:
> > >
> > > +static inline uint64_t get_simple_ahnd(int fd, uint32_t ctx)
> > > +{
> > > +	bool do_relocs = gem_has_relocations(fd);
> > > +
> > > +	return do_relocs ? 0 : intel_allocator_open(fd, ctx, INTEL_ALLOCATOR_SIMPLE);
> >
> > Should this function be e.g.
> >
> >     return intel_allocator_open(fd, 0, do_relocs ?
> >                                 INTEL_ALLOCATOR_RELOC : INTEL_ALLOCATOR_SIMPLE);
> >
> > Similarly for others.
> 
> The patch is fine but there was the above code (which I wrote) in
> gem_linear_blits.c, hence I was wondering.

On the beginning - I'm sorry for email length. It may give some light how
things were designed, why and what issues with that we got.

Regarding gem_linear_blits - in this case doesn't matter which allocator
you'll use. There's summary:

1. Reloc allocator just increments offsets but is doing this in multiprocess
   environment. It doesn't track which offsets are occupied.

2. Simple takes care of which offsets are occupied.

For gem_linear_blits on older gens kernel will propose its own offsets
if we pass something it don't like. For simple we're on newer gens 
and we got full ppgtt so we don't overlap with offsets.

Even if Simple is stateful we got some case in which its usage
is currently limited (so you can see using reloc in most of the
tests). Problem is with...  it is stateful. Most of tests creates batch
(gem object), use it and destroy it. From allocator perspective we alloc
offset, then we free it. In next round we got same offset for another batch
(gem object). So kernel serialize the execution until previous vma is freed.
This lead to non-pipelined execution.

You can see pattern in many tests - ahnd = get_reloc_ahnd(...), 
get offset for scratch surface, then pass scratch_offset to some execution
function. This allows to keep us same offset for scratch and get new
offsets for batches. The best would be to have something hybrid which would
propose new (and not busy) bb, but that should happen in multiprocess env
so I haven't found how to write this yet. Libdrm handles pools of objects
and reuses them if they were not busy. But doing this in multiprocess
requires synchronization so some additional mechanism should be added
to allocator to handle this case. 

I still wonder to introduce .dependency_offset in creating spinner when
.dependency handle is passed. Currently we have to use Simple to ensure
we got same offset for .dependency. As spinners keep batch handles until
they are freed this likely is not a problem. But it may be in the future.

> 
> > +static inline uint64_t get_offset(uint64_t ahnd, uint32_t handle,
> > +				  uint64_t size, uint64_t alignment)
> > +{
> > +	if (!ahnd)
> > +		return 0;
> > +
> > +	return intel_allocator_alloc(ahnd, handle, size, alignment);
> > +}
> > +
> > +static inline bool put_offset(uint64_t ahnd, uint32_t handle)
> > +{
> > +	if (!ahnd)
> > +		return 0;
> > +
> > +	return intel_allocator_free(ahnd, handle);
> > +}
> > +
> 
> Also for the function names are too generic with potential for namespace
> conflicts, probably ahnd_get_offset/ahnd_put_offset?

If there will be more voices to change it I'll do it. At the moment
I wanted to have few short functions. I thought about ahnd_get_offset(ahnd, ...) 
but when ahnd would be valid allocator handle, asserting otherwise. 
get_offset(ahnd, ...) would just return some offset, for relocations
it may be 0 (like currently is), allocating offset for valid ahnd.

--
Zbigniew 

> 
> In any case, this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
