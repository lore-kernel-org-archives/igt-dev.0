Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE716E107
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 10:40:59 +0000 (UTC)
Date: Thu, 18 Mar 2021 11:40:53 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210318104053.GA12222@zkempczy-mobl2>
References: <20210317144610.108372-1-zbigniew.kempczynski@intel.com>
 <20210317144610.108372-6-zbigniew.kempczynski@intel.com>
 <CAOFGe97V716nqQHiM1Vh0kpz5kws6-dTQo7dMXNbt5Z5uHf0aA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe97V716nqQHiM1Vh0kpz5kws6-dTQo7dMXNbt5Z5uHf0aA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v26 05/35] lib/intel_allocator_simple:
 Add simple allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 02:38:35PM -0500, Jason Ekstrand wrote:

<cut>

I've addressed all that weird indentations you've noticed.
I've seen that code a lot of times so definitely fresh 
look was refreshing.

> +
> > +static bool intel_allocator_simple_is_allocated(struct intel_allocator *ial,
> > +                                               uint32_t handle, uint64_t size,
> > +                                               uint64_t offset)
> > +{
> > +       struct intel_allocator_record *rec;
> > +       struct intel_allocator_simple *ials;
> > +       bool same = false;
> > +
> > +       igt_assert(ial);
> > +       ials = (struct intel_allocator_simple *) ial->priv;
> > +       igt_assert(ials);
> > +       igt_assert(handle);
> > +
> > +       rec = igt_map_find(&ials->objects, &handle);
> > +       if (rec && __same(rec, handle, size, offset))
> > +               same = true;
> > +
> > +       return same;
> > +}
> > +
> > +static bool intel_allocator_simple_reserve(struct intel_allocator *ial,
> > +                                          uint32_t handle,
> > +                                          uint64_t start, uint64_t end)
> > +{
> > +       uint64_t size = end - start;
> 
> With canonical addresses, our size calculations aren't going to be
> correct if start and end are on different sides of the 47-bit
> boundary.  I'm not sure how to deal with that, TBH.  Most of the time,
> I think you get saved by the fact that you're only really likely to
> hit that if you have a > 128 TB range which never happens.  One simple
> thing we could do is
> 
> igt_assert(end >> GEN8_GT_ADDRESS_WIDTH == start >> GEN8_GT_ADDRESS_WIDTH);
> 
> or similar.  Same goes for the 3-4 other cases below.

What do you say about:

static uint64_t get_size(uint64_t start, uint64_t end)
{
	end = end ? end : 1ull << GEN8_GTT_ADDRESS_WIDTH;

	return end - start;
}

then

	igt_assert(end > start || end == 0);
	size = get_size(start, end);

> 
> > +       struct intel_allocator_record *rec = NULL;
> > +       struct intel_allocator_simple *ials;
> > +
> > +       igt_assert(ial);
> > +       ials = (struct intel_allocator_simple *) ial->priv;
> > +       igt_assert(ials);
> > +
> > +       /* clear [63:48] bits to get rid of canonical form */
> > +       start = DECANONICAL(start);
> > +       end = DECANONICAL(end);
> > +       igt_assert(end > start || end == 0);
> 
> With always reserving the top 4K, end = 0 should never happen.

That's true, but limit us from catching problems with last page
- gpu can hang when using 3d pipeline with batch on that page.
Take a look to:

https://patchwork.freedesktop.org/patch/424031/?series=82954&rev=26

Daniel requested to remove that test because it hangs gpu
on glk/kbl/skl so we likely want to check that in the future
in other cases. So totally excluding last page is not we want imo.
For "normal" usage I want to skip that page from default but 
I still want to have a possibility to use it in "full" version.

--
Zbigniew

> 
> > +
> > +       if (simple_vma_heap_alloc_addr(ials, start, size)) {
> > +               rec = malloc(sizeof(*rec));
> > +               rec->handle = handle;
> > +               rec->offset = start;
> > +               rec->size = size;
> > +
> > +               igt_map_add(&ials->reserved, &rec->offset, rec);
> > +
> > +               ials->reserved_areas++;
> > +               ials->reserved_size += rec->size;
> > +               return true;
> > +       }
> > +
> > +       igt_debug("Failed to reserve %llx + %llx\n", (long long)start, (long long)size);
> > +       return false;
> > +}
> > +
> > +static bool intel_allocator_simple_unreserve(struct intel_allocator *ial,
> > +                                            uint32_t handle,
> > +                                            uint64_t start, uint64_t end)
> > +{
> > +       uint64_t size = end - start;
> > +       struct intel_allocator_record *rec = NULL;
> > +       struct intel_allocator_simple *ials;
> > +
> > +       igt_assert(ial);
> > +       ials = (struct intel_allocator_simple *) ial->priv;
> > +       igt_assert(ials);
> > +
> > +       /* clear [63:48] bits to get rid of canonical form */
> > +       start = DECANONICAL(start);
> > +       end = DECANONICAL(end);
> > +
> > +       igt_assert(end > start || end == 0);
> > +
> > +       rec = igt_map_find(&ials->reserved, &start);
> > +
> > +       if (!rec) {
> > +               igt_debug("Only reserved blocks can be unreserved\n");
> > +               return false;
> > +       }
> > +
> > +       if (rec->size != size) {
> > +               igt_debug("Only the whole block unreservation allowed\n");
> > +               return false;
> > +       }
> > +
> > +       if (rec->handle != handle) {
> > +               igt_debug("Handle %u doesn't match reservation handle: %u\n",
> > +                        rec->handle, handle);
> > +               return false;
> > +       }
> > +
> > +       igt_map_del(&ials->reserved, &start);
> > +
> > +       ials->reserved_areas--;
> > +       ials->reserved_size -= rec->size;
> > +       free(rec);
> > +       simple_vma_heap_free(&ials->heap, start, size);
> > +
> > +       return true;
> > +}
> > +
> > +static bool intel_allocator_simple_is_reserved(struct intel_allocator *ial,
> > +                                              uint64_t start, uint64_t end)
> > +{
> > +       uint64_t size = end - start;
> > +       struct intel_allocator_record *rec = NULL;
> > +       struct intel_allocator_simple *ials;
> > +
> > +       igt_assert(ial);
> > +       ials = (struct intel_allocator_simple *) ial->priv;
> > +       igt_assert(ials);
> > +
> > +       /* clear [63:48] bits to get rid of canonical form */
> > +       start = DECANONICAL(start);
> > +       end = DECANONICAL(end);
> > +
> > +       igt_assert(end > start || end == 0);
> > +
> > +       rec = igt_map_find(&ials->reserved, &start);
> > +
> > +       if (!rec)
> > +               return false;
> > +
> > +       if (rec->offset == start && rec->size == size)
> > +               return true;
> > +
> > +       return false;
> > +}
> > +
> > +static bool equal_8bytes(const void *key1, const void *key2)
> > +{
> > +       const uint64_t *k1 = key1, *k2 = key2;
> > +       return *k1 == *k2;
> > +}
> > +
> > +static void intel_allocator_simple_destroy(struct intel_allocator *ial)
> > +{
> > +       struct intel_allocator_simple *ials;
> > +       struct igt_map_entry *pos;
> > +       struct igt_map *map;
> > +       int i;
> > +
> > +       igt_assert(ial);
> > +       ials = (struct intel_allocator_simple *) ial->priv;
> > +       simple_vma_heap_finish(&ials->heap);
> > +
> > +       map = &ials->objects;
> > +       igt_map_for_each(map, i, pos)
> > +               free(pos->value);
> > +       igt_map_free(&ials->objects);
> > +
> > +       map = &ials->reserved;
> > +       igt_map_for_each(map, i, pos)
> > +               free(pos->value);
> > +       igt_map_free(&ials->reserved);
> > +
> > +       free(ial->priv);
> > +       free(ial);
> > +}
> > +
> > +static bool intel_allocator_simple_is_empty(struct intel_allocator *ial)
> > +{
> > +       struct intel_allocator_simple *ials = ial->priv;
> > +
> > +       igt_debug("<ial: %p, fd: %d> objects: %" PRId64
> > +                 ", reserved_areas: %" PRId64 "\n",
> > +                 ial, ial->fd,
> > +                 ials->allocated_objects, ials->reserved_areas);
> > +
> > +       return !ials->allocated_objects && !ials->reserved_areas;
> > +}
> > +
> > +static void intel_allocator_simple_print(struct intel_allocator *ial, bool full)
> > +{
> > +       struct intel_allocator_simple *ials;
> > +       struct simple_vma_hole *hole;
> > +       struct simple_vma_heap *heap;
> > +       struct igt_map_entry *pos;
> > +       struct igt_map *map;
> > +       uint64_t total_free = 0, allocated_size = 0, allocated_objects = 0;
> > +       uint64_t reserved_size = 0, reserved_areas = 0;
> > +       int i;
> > +
> > +       igt_assert(ial);
> > +       ials = (struct intel_allocator_simple *) ial->priv;
> > +       igt_assert(ials);
> > +       heap = &ials->heap;
> > +
> > +       igt_info("intel_allocator_simple <ial: %p, fd: %d> on "
> > +                "[0x%"PRIx64" : 0x%"PRIx64"]:\n", ial, ial->fd,
> > +                ials->start, ials->end);
> > +
> > +       if (full) {
> > +               igt_info("holes:\n");
> > +               simple_vma_foreach_hole(hole, heap) {
> > +                       igt_info("offset = %"PRIu64" (0x%"PRIx64", "
> > +                                "size = %"PRIu64" (0x%"PRIx64")\n",
> > +                                hole->offset, hole->offset, hole->size,
> > +                                hole->size);
> > +                       total_free += hole->size;
> > +               }
> > +               igt_assert(total_free <= ials->total_size);
> > +               igt_info("total_free: %" PRIx64
> > +                        ", total_size: %" PRIx64
> > +                        ", allocated_size: %" PRIx64
> > +                        ", reserved_size: %" PRIx64 "\n",
> > +                        total_free, ials->total_size, ials->allocated_size,
> > +                        ials->reserved_size);
> > +               igt_assert(total_free ==
> > +                          ials->total_size - ials->allocated_size - ials->reserved_size);
> > +
> > +               igt_info("objects:\n");
> > +               map = &ials->objects;
> > +               igt_map_for_each(map, i, pos) {
> > +                       struct intel_allocator_record *rec = pos->value;
> > +
> > +                       igt_info("handle = %d, offset = %"PRIu64" "
> > +                               "(0x%"PRIx64", size = %"PRIu64" (0x%"PRIx64")\n",
> > +                                rec->handle, rec->offset, rec->offset,
> > +                                rec->size, rec->size);
> > +                       allocated_objects++;
> > +                       allocated_size += rec->size;
> > +               }
> > +               igt_assert(ials->allocated_size == allocated_size);
> > +               igt_assert(ials->allocated_objects == allocated_objects);
> > +
> > +               igt_info("reserved areas:\n");
> > +               map = &ials->reserved;
> > +               igt_map_for_each(map, i, pos) {
> > +                       struct intel_allocator_record *rec = pos->value;
> > +
> > +                       igt_info("offset = %"PRIu64" (0x%"PRIx64", "
> > +                                "size = %"PRIu64" (0x%"PRIx64")\n",
> > +                                rec->offset, rec->offset,
> > +                                rec->size, rec->size);
> > +                       reserved_areas++;
> > +                       reserved_size += rec->size;
> > +               }
> > +               igt_assert(ials->reserved_areas == reserved_areas);
> > +               igt_assert(ials->reserved_size == reserved_size);
> > +       } else {
> > +               simple_vma_foreach_hole(hole, heap)
> > +                       total_free += hole->size;
> > +       }
> > +
> > +       igt_info("free space: %"PRIu64"B (0x%"PRIx64") (%.2f%% full)\n"
> > +                "allocated objects: %"PRIu64", reserved areas: %"PRIu64"\n",
> > +                total_free, total_free,
> > +                ((double) (ials->total_size - total_free) /
> > +                 (double) ials->total_size) * 100,
> > +                ials->allocated_objects, ials->reserved_areas);
> > +}
> > +
> > +static struct intel_allocator *
> > +__intel_allocator_simple_create(int fd, uint64_t start, uint64_t end,
> > +                               enum allocator_strategy strategy)
> > +{
> > +       struct intel_allocator *ial;
> > +       struct intel_allocator_simple *ials;
> > +
> > +       igt_debug("Using simple allocator\n");
> > +
> > +       ial = calloc(1, sizeof(*ial));
> > +       igt_assert(ial);
> > +
> > +       ial->fd = fd;
> > +       ial->get_address_range = intel_allocator_simple_get_address_range;
> > +       ial->alloc = intel_allocator_simple_alloc;
> > +       ial->free = intel_allocator_simple_free;
> > +       ial->is_allocated = intel_allocator_simple_is_allocated;
> > +       ial->reserve = intel_allocator_simple_reserve;
> > +       ial->unreserve = intel_allocator_simple_unreserve;
> > +       ial->is_reserved = intel_allocator_simple_is_reserved;
> > +       ial->destroy = intel_allocator_simple_destroy;
> > +       ial->is_empty = intel_allocator_simple_is_empty;
> > +       ial->print = intel_allocator_simple_print;
> > +       ials = ial->priv = malloc(sizeof(struct intel_allocator_simple));
> > +       igt_assert(ials);
> > +
> > +       igt_map_init(&ials->objects);
> > +       /* Reserved addresses hashtable is indexed by an offset */
> > +       __igt_map_init(&ials->reserved, equal_8bytes, NULL, 3);
> 
> We have this same problem with Mesa.  Maybe just make the hash map
> take a uint64_t key instead of a void*.  Then it'll work for both
> cases easily at the cost of a little extra memory on 32-bit platforms.
> 
> Looking a bit more, I guess it's not quite as bad as the Mesa case
> because you have the uint64_t key in the object you're adding so you
> don't have to malloc a bunch of uint64_t's just to use as keys.
> 
> > +
> > +       ials->start = start;
> > +       ials->end = end;
> > +       ials->total_size = end - start;
> > +       simple_vma_heap_init(&ials->heap, ials->start, ials->total_size,
> > +                            strategy);
> > +
> > +       ials->allocated_size = 0;
> > +       ials->allocated_objects = 0;
> > +       ials->reserved_size = 0;
> > +       ials->reserved_areas = 0;
> > +
> > +       return ial;
> > +}
> > +
> > +struct intel_allocator *
> > +intel_allocator_simple_create(int fd)
> > +{
> > +       uint64_t gtt_size = gem_aperture_size(fd);
> > +
> > +       if (!gem_uses_full_ppgtt(fd))
> > +               gtt_size /= 2;
> > +       else
> > +               gtt_size -= RESERVED;
> > +
> > +       return __intel_allocator_simple_create(fd, 0, gtt_size,
> > +                                              ALLOC_STRATEGY_HIGH_TO_LOW);
> > +}
> > +
> > +struct intel_allocator *
> > +intel_allocator_simple_create_full(int fd, uint64_t start, uint64_t end,
> > +                                  enum allocator_strategy strategy)
> > +{
> > +       uint64_t gtt_size = gem_aperture_size(fd);
> > +
> > +       igt_assert(end <= gtt_size);
> > +       if (!gem_uses_full_ppgtt(fd))
> > +               gtt_size /= 2;
> > +       igt_assert(end - start <= gtt_size);
> 
> Don't you want just `end <= gtt_size`?  When is something only going
> to use the top half?
> 
> > +
> > +       return __intel_allocator_simple_create(fd, start, end, strategy);
> > +}
> > --
> > 2.26.0
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
