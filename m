Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD1B10E6C8
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jan 2022 09:45:11 +0000 (UTC)
Date: Thu, 6 Jan 2022 10:45:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Yda6Ih7SmImriBoD@zkempczy-mobl2>
References: <20220105064945.9640-1-zbigniew.kempczynski@intel.com>
 <20220105064945.9640-2-zbigniew.kempczynski@intel.com>
 <87tueha9gm.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tueha9gm.wl-ashutosh.dixit@intel.com>
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

On Wed, Jan 05, 2022 at 06:23:21PM -0800, Dixit, Ashutosh wrote:
> On Tue, 04 Jan 2022 22:49:43 -0800, Zbigniew Kempczyński wrote:
> >
> > With era of new gens we're enforced to use no-reloc (softpin). This
> > brings few problems like vm range limitations which were well solved
> > by the kernel. This can be handled also in userspace code by adding
> > gen related conditionals or by trying to detect the constraints.
> >
> > Lets try to do this dynamically and detect safe start offset and
> > alignment for each memory region we got. This should be universal solution
> > regardless hw limitations and bugs. As such detection is not lightweight
> > technique add also some caching structures to handle consequtive calls
> > about same data.
> 
> I have a few more comments and suggestions below. However, since these are
> non-blocking this patch is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks for the review.

> 
> > +static IGT_LIST_HEAD(cache);
> > +static pthread_mutex_t cache_mutex = PTHREAD_MUTEX_INITIALIZER;
> 
> The caching will help for multiple calls to the code within a single
> process, but in CI each process will still need to build up the cache.

Each code which will be called during single execution will need to build
the cache. That's the cost of softpinning and differences in hw / i915 paths.
Some panacea would be to expose some queries from i915 but this adds new uAPI
and requires to be handled forever. Detection generates few extra calls on the
very beginning where only one bb really touches hardware.

> 
> > +uint64_t gem_detect_min_start_offset_for_region(int i915, uint32_t region)
> > +{
> > +	struct drm_i915_gem_exec_object2 obj;
> > +	struct drm_i915_gem_execbuffer2 eb;
> > +	uint64_t start_offset = 0;
> > +	uint64_t bb_size = PAGE_SIZE;
> > +	uint32_t *batch;
> > +	uint16_t devid = intel_get_drm_devid(i915);
> > +	struct cache_entry *entry, *newentry;
> > +
> > +	pthread_mutex_lock(&cache_mutex);
> > +	entry = find_entry_unlocked(MIN_START_OFFSET, devid, region, 0);
> > +	if (entry)
> > +		goto out;
> > +	pthread_mutex_unlock(&cache_mutex);
> 
> I think it would be better to add the locking to find_entry_unlocked(). And
> also add a list_add_entry() kind of function with the locking. This will
> associate the mutex directly with the list and get it out of the
> callers. The check if the entry has been previously added would also need
> to move to list_add_entry().
> 
> Anyway if this is complicated leave as is.

find_entry_unlocked() is used also in adding to cache path, where you need to
do following ops within single mutex locked:

1. mutex_lock()
2. find_entry_unlocked()
3. if found skip adding to cache (goto out)
4. add_to_cache_unlocked()
5. mutex_unlock()

That's why I couldn't add find()/add() functions to lock mutex themselves
because if I would drop mutex after find noone prevents for adding same
entry to cache twice (or more if there will be more threads).
 
> 
> > +	newentry = malloc(sizeof(*newentry));
> > +	if (!newentry)
> > +		return start_offset;
> 
> I'd suggest just do 'igt_assert(newentry)' in all these functions to keep
> things simple.

Primary code has assert here, but we don't need it. At least we won't 
expose memory problem here. I got heavy discussion about this on irc 
and I was convinced that if we got value already established we can
return it (in hope some memory can be reclaimed in the meantime).

> 
> > +/**
> > + * gem_detect_min_alignment_for_regions:
> > + * @i915: drm fd
> > + * @region1: first region
> > + * @region2: second region
> > + *
> > + * Returns: minimum alignment which must be used when objects from @region1 and
> > + * @region2 are going to interact.
> 
> Here actually it is not obvious why the code below in this function is
> needed. Page sizes for different memory regions can be different. From
> discussions with people here, it seems what happens is that different page
> sizes cannot be included as part of the same page table structure level (in
> the multi-level page table structure hierarchy). That is why offsets for
> memory regions with different page sizes cannot be adjacent.
> 
> Can we add some explanation of this sort here as a hint as to why the code
> below is needed?

I haven't found better idea how to properly align objects from different 
regions than use some detection on the very beginning. If you have better
idea how to solve this I won't insist to merge my code. 

> 
> There is still the question in my mind whether the situation is "dynamic"
> when a memory region has multiple page sizes, say 64 K and 2 MiB. In this
> case when we run the detection we get one safe alignemnt value which is
> cached, but "later" because of memory use, this cached value proves
> insufficient (so when we detect say we get 64 K but actually later the 2
> MiB value is needed). This could happen because of different code paths
> taken in the kernel.

If kernel will change alignment during runtime detection and caching is wrong
and almost all of that code should looks:

uint64_t gem_get_safe_alignment() {
	return SIZE_2M; /* or SIZE_1G */
}

Only start offset should be still detected as we've no idea what is first
offset we can use. I wondered to add same for end offset but it can be
tricky as if I good remember last page can be problematic but it is not
easily detectable and can depend on engine (likely there're problems on
rcs0 if my memory is not failing too much).

> 
> Any case, I think what we have is good enough for now and worth
> trying. Let's see if we hit this issue later.
> 
> > +	/* Establish bb offset first */
> > +	eb.buffers_ptr = to_user_pointer(obj);
> > +	eb.buffer_count = 1;
> 
> Looks like this line is not needed, eb.buffer_count is set again below.

Good catch. This is remnant where I've detected min start offset here.

If you think there's better way how to solve problems regarding alignment
/ start offset please propose. I focused on detecton but maybe there's 
different technique we can use for those problems.

Thank you for the comments and debug session :)
--
Zbigniew


> 
> > +	eb.flags = I915_EXEC_BATCH_FIRST | I915_EXEC_DEFAULT;
> > +	igt_assert(__gem_create_in_memory_regions(i915, &obj[0].handle,
> > +						  &bb_size, region1) == 0);
> > +	obj[0].flags = EXEC_OBJECT_PINNED;
> > +
> > +	batch = gem_mmap__device_coherent(i915, obj[0].handle, 0, bb_size,
> > +					  PROT_WRITE);
> > +	*batch = MI_BATCH_BUFFER_END;
> > +	munmap(batch, bb_size);
> > +
> > +	obj[0].offset = gem_detect_min_start_offset_for_region(i915, region1);
> > +
> > +	/* Find appropriate alignment of object */
> > +	eb.buffer_count = ARRAY_SIZE(obj);
