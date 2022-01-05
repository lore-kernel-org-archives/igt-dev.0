Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFB910F91A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jan 2022 06:44:04 +0000 (UTC)
Date: Wed, 5 Jan 2022 07:44:00 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YdU+MHP1gJvTPnfh@zkempczy-mobl2>
References: <20211230182613.35827-1-zbigniew.kempczynski@intel.com>
 <20211230182613.35827-2-zbigniew.kempczynski@intel.com>
 <87y23ubwu5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y23ubwu5.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/intel_memory_region: Add start
 offset and alignment detection
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

On Tue, Jan 04, 2022 at 09:00:50PM -0800, Dixit, Ashutosh wrote:
> On Thu, 30 Dec 2021 10:26:11 -0800, Zbigniew Kempczyński wrote:
> >
> 
> I am still trying to understand this patch so just some questions/comments
> for now.
> 
> I am not even looking at the caching part for now, it would have been
> better to keep caching as a separate patch since that is performance
> improvement but anyway leave as is. I will just review it later.
> 
> > With era of new gens we're enforced to use no-reloc (softpin). This
> > brings few problems like vm range limitations which were well solved
> > by the kernel. This can be handled also in userspace code by adding
> > gen related conditionals or by trying to detect the constraints.
> 
> So why not just do this since the information is static and gen dependent?

It may differ across gens/revisions regarding starting offset and alignment
between regions so I would like to detect is kernel supporting 64K or 2M or not.
Assuming it is constant from userspace is wrong - that's why detection code
here. Previously such adjustments were done in relocations, but we got single
system memory and world was a little bit simpler than now.

> 
> Also what does this offset/alignment really depend on? Is it the minimum
> page size supported by a particular gen for a region type? Or is there more
> to it?

No, on possible regions mixing within gtt as well as supporting grouping 
to 64K or 2M to decrease TLB eviction.

> 
> If we know the minimum page size for each region type per gen can we
> compute the min/safe offset/alignemnt values below or do we still need this
> dynamic detection?

See above, on ATS I'm not sure but starting offset can be 0x200000.

> 
> Also, as far as I see, here we are calculating how generated offsets from
> the allocator should be aligned. So rather than do this in the allocator
> itself (i.e. introduce a 'region' argument to the allocator) we have these
> functions to find the 'alignment' argument to allocator->alloc() function.

Objects within same region can be aligned to smaller alignment than max
of all regions. I would keep regioning away of allocator - it should just
do what you request of and nothing more.

On the very beginning Chris wanted to have "zones" within allocator but
I haven't decided to add this - adding allocator + fixing all tests were
time consuming and I skipped this request. Even now with single zone allocator
makes tests less readable. Introducing zones would introduce another layer
which at the moment we don't need to.

> 
> But it would be ok to do this inside the allocator itself and introduce a
> region argument to the allocator, i.e. generate an offset for this region
> or this set of regions? Anyway I see the allocator API at present takes the
> alignment argument so it is probably ok as is too.
> 
> So at a high level do we need to add these functions here or should we add
> them inside the allocator?

No, we should feed allocator with alignment we want. If you want to mix 
smem and lmem and you don't want to care of alignment between regions just
take "safe alignment". If you want to verify smem objects adhere with minimum
possible alignment use alignment for smem objects, same for lmem.

> 
> > +/**
> > + * gem_detect_min_start_offset_for_region:
> > + * @i915: drm fd
> > + * @region: memory region
> > + *
> > + * Returns: minimum start offset at which kernel allows placing objects
> > + *          for memory region.
> > + */
> > +uint64_t gem_detect_min_start_offset_for_region(int i915, uint32_t region)
> 
> Should this be static, that is should we only expose
> gem_detect_safe_start_offset() to the tests? Is there any reason why any
> test will call this directly?

I think this should be exported if requester want to put object at minimum
possible offset for region. You don't need to use allocator if you have 
one or two objects and you're able to assign those offsets manually.
For PPGTT this is correct attitude and there're some tests which are 
already written this way.

> 
> Also I suggest:
> 
> s/detect/get/ since 'detect' is an implementation detail (and with the
> cache we are not even detecting).

I've discussed this and "detect" is correct word in this case. Get would be 
appropriate if we would be able to have static mapping.

> 
> > +	batch = gem_mmap__device_coherent(i915, obj.handle, 0, bb_size, PROT_WRITE);
> > +	*batch = MI_BATCH_BUFFER_END;
> > +	munmap(batch, bb_size);
> 
> I prefer gem_write() everywhere since it's a single statement but ok as is too.
> 
> > +
> > +	while (1) {
> > +		obj.offset = start_offset;
> > +
> > +		if (__gem_execbuf(i915, &eb) == 0)
> > +			break;
> > +
> > +		if (start_offset)
> > +			start_offset <<= 1;
> > +		else
> > +			start_offset = PAGE_SIZE;
> > +
> > +		igt_assert(start_offset <= 1ull << 48);
> 
> s/48/GEN8_GTT_ADDRESS_WIDTH/ or something like that?

That value really doesn't matter if is big enough. If we're not be able to
place object up to 48bit I guess such HW won't work at all.

> 
> > +/**
> > + * gem_detect_safe_start_offset:
> > + * @i915: drm fd
> > + *
> > + * Returns: finds start offset which can be used as first one regardless
> > + *          memory region. Useful if for some reason some regions don't allow
> > + *          starting from 0x0 offset.
> > + */
> > +uint64_t gem_detect_safe_start_offset(int i915)
> 
> Overall I am ok with gem_detect_safe_start_offset() and
> gem_detect_min_start_offset_for_region() and understand that we need them.
> 
> > +/**
> > + * gem_detect_min_alignment_for_regions:
> > + * @i915: drm fd
> > + * @region1: first region
> > + * @region2: second region
> > + *
> > + * Returns: minimum alignment which must be used when objects from @region1 and
> > + * @region2 are going to interact.
> > + */
> > +uint64_t gem_detect_min_alignment_for_regions(int i915,
> 
> Once again can this be static, that is we don't expose to the tests?

Currently probably noone will use it, but discrete are on the way so some 
tests maybe will need it.

> 
> > +					      uint32_t region1,
> > +					      uint32_t region2)
> 
> Also we can probably pass the list of all regions here (similar to what we
> do for gem_create_in_memory_regions()) but probably ok as is too the way
> it's done in gem_detect_safe_alignment().

I decided to export this if test writer want to exercise exact interaction
between this two regions. I would extend this to region array if it will be
really needed. 

> 
> > +	obj[0].offset = gem_detect_min_start_offset_for_region(i915, region1);
> > +
> > +	/* Find appropriate alignment of object */
> > +	eb.buffer_count = ARRAY_SIZE(obj);
> > +	igt_assert(__gem_create_in_memory_regions(i915, &obj[1].handle,
> > +						  &obj_size, region2) == 0);
> > +	obj[1].handle = gem_create_in_memory_regions(i915, PAGE_SIZE, region2);
> > +	obj[1].flags = EXEC_OBJECT_PINNED;
> > +	while (1) {
> > +		obj[1].offset = ALIGN(obj[0].offset + bb_size, min_alignment);
> > +		igt_assert(obj[1].offset <= 1ull << 32);
> > +
> > +		if (__gem_execbuf(i915, &eb) == 0)
> > +			break;
> > +
> > +		min_alignment <<= 1;
> > +	}
> 
> With this loop above I get very lost and don't clearly understand the
> reason for it (taking the regions pairwise). Why do we need to do it this
> way? Why is the value returned by gem_detect_safe_start_offset() (that is
> the max offset over all regions) or even
> gem_detect_min_start_offset_for_region() sufficient? Is this algorithm
> above always guaranteed to return a value which will work?

If you're able to properly place two objects and kernel doesn't complain 
(-ENOSPC) yes, this guarantees you got alignment which you can use for 
both regions.

Loop exercises this with left shifting the alignment until it will hit
valid offset at which second (obj[1]) object can interact with first one.

> 
> Also, do we even need to expose gem_detect_safe_start_offset() to the tests
> or all the tests will ever need to call is gem_detect_safe_alignment() so
> everything else can be static?

Yes, think about ATS and first 2M which is not accessible if I good remember
(maybe something changed, but this limitation comes to my mind when I started
writing this patch).

> 
> > +/**
> > + * gem_get_safe_alignment:
> 
> Comment mismatches function name below.

Good catch, I thought I've fixed all issues before.

Thank you for the review.

--
Zbigniew

> 
> > + * @i915: drm fd
> > + *
> > + * Returns: safe alignment for all memory regions on @i915 device.
> > + * Safe in this case means max() from all minimum alignment for each
> > + * region.
> > + */
> > +uint64_t gem_detect_safe_alignment(int i915)
