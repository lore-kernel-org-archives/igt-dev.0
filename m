Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5516210E3EC
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 05:17:40 +0000 (UTC)
Date: Thu, 6 Jul 2023 07:17:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230706051735.5uom76c3y3wcbqr2@zkempczy-mobl2>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
 <20230704090104.120219-5-zbigniew.kempczynski@intel.com>
 <034750c6-c4f4-513b-bff3-6882b4d0193a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <034750c6-c4f4-513b-bff3-6882b4d0193a@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 04/12] lib/xe_util: Return dynamic
 subtest name for Xe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 05, 2023 at 02:54:44PM +0200, Karolina Stolarek wrote:
> On 4.07.2023 11:00, Zbigniew Kempczyński wrote:
> > For tests which are working on more than one region using name suffix
> > like "vram01-system" etc. is common thing. Instead handcrafting this
> > naming add xe_memregion_dynamic_subtest_name() function which is
> > similar to memregion_dynamic_subtest_name() for i915.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   lib/meson.build  |   3 +-
> >   lib/xe/xe_util.c | 104 +++++++++++++++++++++++++++++++++++++++++++++++
> >   lib/xe/xe_util.h |  33 +++++++++++++++
> >   3 files changed, 139 insertions(+), 1 deletion(-)
> >   create mode 100644 lib/xe/xe_util.c
> >   create mode 100644 lib/xe/xe_util.h
> > 
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 3e1ecdee2b..1d5b81ac8f 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -105,7 +105,8 @@ lib_sources = [
> >   	'xe/xe_compute_square_kernels.c',
> >   	'xe/xe_ioctl.c',
> >   	'xe/xe_query.c',
> > -	'xe/xe_spin.c'
> > +	'xe/xe_spin.c',
> > +	'xe/xe_util.c',
> >   ]
> >   lib_deps = [
> > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > new file mode 100644
> > index 0000000000..448b3a3d27
> > --- /dev/null
> > +++ b/lib/xe/xe_util.c
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include "igt.h"
> > +#include "igt_syncobj.h"
> > +#include "xe/xe_ioctl.h"
> > +#include "xe/xe_query.h"
> > +#include "xe/xe_util.h"
> > +
> > +static bool __region_belongs_to_regions_type(struct drm_xe_query_mem_region *region,
> > +					     uint32_t *mem_regions_type,
> > +					     int num_regions)
> > +{
> > +	for (int i = 0; i < num_regions; i++)
> > +		if (mem_regions_type[i] == region->mem_class)
> > +			return true;
> > +	return false;
> > +}
> > +
> > +struct igt_collection *
> > +__xe_get_memory_region_set(int xe, uint32_t *mem_regions_type, int num_regions)
> > +{
> > +	struct drm_xe_query_mem_region *memregion;
> > +	struct igt_collection *set = NULL;
> > +	uint64_t memreg = all_memory_regions(xe), region;
> > +	int count = 0, pos = 0;
> > +
> > +	xe_for_each_mem_region(xe, memreg, region) {
> > +		memregion = xe_mem_region(xe, region);
> > +		if (__region_belongs_to_regions_type(memregion,
> > +						     mem_regions_type,
> > +						     num_regions))
> > +			count++;
> > +	}
> > +
> > +	set = igt_collection_create(count);
> > +
> > +	xe_for_each_mem_region(xe, memreg, region) {
> > +		memregion = xe_mem_region(xe, region);
> > +		igt_assert(region < (1ull << 31));
> > +		if (__region_belongs_to_regions_type(memregion,
> > +						     mem_regions_type,
> > +						     num_regions)) {
> > +			igt_collection_set_value(set, pos++, (int)region);
> > +		}
> > +	}
> > +
> > +	igt_assert(count == pos);
> > +
> > +	return set;
> > +}
> > +
> > +/**
> > +  * xe_memregion_dynamic_subtest_name:
> > +  * @xe: drm fd of Xe device
> > +  * @igt_collection: memory region collection
> > +  *
> > +  * Function iterates over all memory regions inside the collection (keeped
> > +  * in the value field) and generates the name which can be used during dynamic
> > +  * subtest creation.
> > +  *
> > +  * Returns: newly allocated string, has to be freed by caller. Asserts if
> > +  * caller tries to create a name using empty collection.
> > +  */
> > +char *xe_memregion_dynamic_subtest_name(int xe, struct igt_collection *set)
> 
> I'm aware that most functions here based on their i915 versions, but I'm not
> sure about this one. Having xe_memregion_dynamic_subtest_name and
> memregion_dynamic_subtest_name seems confusing to me.
> 
> Ideally, we would have a core function that does the formatting and wrappers
> that use it. I know that the need for fd in xe_region_class() complicated
> things, but I wonder if we could work around it. For example, why can we
> only store ints in igt_collection_data, and not something more generic?
> Could we switch to a generic pointer, for example? That would require more
> work, I'm aware of it, I'm just thinking about potential solutions here.

Thank you for the review.

Yes, I thought about unifying these wrappers but for this series my main
target is to address allocator support for Xe. I've noticed other helpers
which might be handy (like bo create, bo map, etc) but this series is long
enough to review. I was tempted to put xe code to gem_ccs and gem_exercise_blt
but I resisted and created separate xe_ccs and xe_exercise_blt. Most of the
code is common there but there's no reference code which shows how to use
allocator along with xe so I decided to add new tests without i915 accretions.

--
Zbigniew

> 
> All the best,
> Karolina
> 
> > +{
> > +	struct igt_collection_data *data;
> > +	char *name, *p;
> > +	uint32_t region, len;
> > +
> > +	igt_assert(set && set->size);
> > +	/* enough for "name%d-" * n */
> > +	len = set->size * 8;
> > +	p = name = malloc(len);
> > +	igt_assert(name);
> > +
> > +	for_each_collection_data(data, set) {
> > +		struct drm_xe_query_mem_region *memreg;
> > +		int r;
> > +
> > +		region = data->value;
> > +		memreg = xe_mem_region(xe, region);
> > +
> > +		if (XE_IS_CLASS_VRAM(memreg))
> > +			r = snprintf(p, len, "%s%d-",
> > +				     xe_region_name(region),
> > +				     memreg->instance);
> > +		else
> > +			r = snprintf(p, len, "%s-",
> > +				     xe_region_name(region));
> > +
> > +		igt_assert(r > 0);
> > +		p += r;
> > +		len -= r;
> > +	}
> > +
> > +	/* remove last '-' */
> > +	*(p - 1) = 0;
> > +
> > +	return name;
> > +}
> > +
> > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > new file mode 100644
> > index 0000000000..46b7e0d46b
> > --- /dev/null
> > +++ b/lib/xe/xe_util.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + *
> > + */
> > +
> > +#ifndef XE_UTIL_H
> > +#define XE_UTIL_H
> > +
> > +#include <stdbool.h>
> > +#include <stddef.h>
> > +#include <stdint.h>
> > +#include <xe_drm.h>
> > +
> > +#define XE_REGION_SMEM XE_MEM_REGION_CLASS_SYSMEM
> > +#define XE_REGION_LMEM XE_MEM_REGION_CLASS_VRAM
> > +
> > +#define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
> > +	(xe_region_class(fd, region) == XE_MEM_REGION_CLASS_SYSMEM)
> > +#define XE_IS_VRAM_MEMORY_REGION(fd, region) \
> > +	(xe_region_class(fd, region) == XE_MEM_REGION_CLASS_VRAM)
> > +
> > +struct igt_collection *
> > +__xe_get_memory_region_set(int xe, uint32_t *mem_regions_type, int num_regions);
> > +
> > +#define xe_get_memory_region_set(regions, mem_region_types...) ({ \
> > +	unsigned int arr__[] = { mem_region_types }; \
> > +	__xe_get_memory_region_set(regions, arr__, ARRAY_SIZE(arr__)); \
> > +})
> > +
> > +char *xe_memregion_dynamic_subtest_name(int xe, struct igt_collection *set);
> > +
> > +#endif /* XE_UTIL_H */
