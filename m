Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FCA10E3B2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 07:24:10 +0000 (UTC)
Date: Wed, 18 Oct 2023 09:24:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
Message-ID: <20231018072406.iu73x5omp3spytmj@zkempczy-mobl2>
References: <20231013112848.68164-1-zbigniew.kempczynski@intel.com>
 <20231013112848.68164-3-zbigniew.kempczynski@intel.com>
 <20231017105852.e5rcnlesqd6pw4ol@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017105852.e5rcnlesqd6pw4ol@kamilkon-desk.igk.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] lib/igt_sizes: Add common SZ_*
 header
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

On Tue, Oct 17, 2023 at 12:58:52PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> On 2023-10-13 at 13:28:46 +0200, Zbigniew Kempczyński wrote:
> > We're often use SZ_.* macros so add this globally to IGTs.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/igt.h                       |  1 +
> >  lib/igt_sizes.h                 | 44 +++++++++++++++++++++++++++++++++
> >  lib/xe/xe_query.h               |  4 +--
> >  tests/intel/gem_exec_async.c    |  2 --
> >  tests/intel/gem_lmem_swapping.c |  1 -
> >  tests/intel/i915_query.c        |  1 -
> >  tests/intel/xe_evict.c          |  3 ---
> >  tests/msm/msm_shrink.c          |  2 --
> >  8 files changed, 46 insertions(+), 12 deletions(-)
> >  create mode 100644 lib/igt_sizes.h
> > 
> > diff --git a/lib/igt.h b/lib/igt.h
> > index 73b6f77272..7af3d10cbc 100644
> > --- a/lib/igt.h
> > +++ b/lib/igt.h
> > @@ -39,6 +39,7 @@
> >  #include "igt_params.h"
> >  #include "igt_pipe_crc.h"
> >  #include "igt_pm.h"
> > +#include "igt_sizes.h"
> >  #include "igt_stats.h"
> >  #include "igt_dsc.h"
> >  #ifdef HAVE_CHAMELIUM
> > diff --git a/lib/igt_sizes.h b/lib/igt_sizes.h
> > new file mode 100644
> > index 0000000000..a3bc93cdd7
> > --- /dev/null
> > +++ b/lib/igt_sizes.h
> > @@ -0,0 +1,44 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> 
> We should use MIT licence, adding Petri on Cc.
> Sometimes it can be MIT or GPL but GPL-only is excluding this.

I'm not sure what license should be in this file.

> 
> > +/*
> > + * Taken and adopted to IGT from kernel include/linux/sizes.h
> > + */
> > +#ifndef __IGT_SIZES_H__
> > +#define __IGT_SIZES_H__
> > +
> > +#define SZ_1				0x00000001
> 
> Why not simple numbers here?

This is verbatim copy and I have nothing against it has SZ_x
defined as direct hex. Looks consistent for me.

> 
> > +#define SZ_2				0x00000002
> > +#define SZ_4				0x00000004
> > +#define SZ_8				0x00000008
> > +#define SZ_16				0x00000010
> > +#define SZ_32				0x00000020
> > +#define SZ_64				0x00000040
> > +#define SZ_128				0x00000080
> > +#define SZ_256				0x00000100
> > +#define SZ_512				0x00000200
> > +
> > +#define SZ_1K				0x00000400
> 
> imho better just 1024

What for we should mix this?

> 
> > +#define SZ_2K				0x00000800
> 
> imho better:
> 
> #define SZ_2K				(2 * SZ_1K)
> 
> > +#define SZ_4K				0x00001000
> > +#define SZ_8K				0x00002000
> > +#define SZ_16K				0x00004000
> > +#define SZ_32K				0x00008000
> > +#define SZ_64K				0x00010000
> > +#define SZ_128K				0x00020000
> > +#define SZ_256K				0x00040000
> > +#define SZ_512K				0x00080000
> > +
> > +#define SZ_1M				0x00100000
> 
> What about:
> #define SZ_1M			(1024 * SZ_1K)
> 
> > +#define SZ_2M				0x00200000
> > +#define SZ_4M				0x00400000
> > +#define SZ_8M				0x00800000
> > +#define SZ_16M				0x01000000
> > +#define SZ_32M				0x02000000
> > +#define SZ_64M				0x04000000
> > +#define SZ_128M				0x08000000
> > +#define SZ_256M				0x10000000
> > +#define SZ_512M				0x20000000
> > +
> > +#define SZ_1G				0x40000000
> 
> What about:
> #define SZ_1G			(1024 * SZ_1M)
> 
> Btw for big numbers we may need to define ULL types,
> see below.
> 
> > +#define SZ_2G				0x80000000
> > +
> > +#endif /* __IGT_SIZES_H__ */
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > index 20dbfa12c4..a21c419fb5 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -12,9 +12,7 @@
> >  #include <stdint.h>
> >  #include <xe_drm.h>
> >  #include "igt_list.h"
> > -
> > -#define SZ_4K	0x1000
> > -#define SZ_64K	0x10000
> > +#include "igt_sizes.h"
> >  
> >  #define XE_DEFAULT_ALIGNMENT           SZ_4K
> >  #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
> > diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
> > index 8c131d8e13..1497c5c6c8 100644
> > --- a/tests/intel/gem_exec_async.c
> > +++ b/tests/intel/gem_exec_async.c
> > @@ -41,8 +41,6 @@
> >  
> >  IGT_TEST_DESCRIPTION("Check that we can issue concurrent writes across the engines.");
> >  
> > -#define SZ_1M (1024 * 1024)
> > -
> >  static void store_dword(int fd, int id, const intel_ctx_t *ctx,
> >  			 unsigned ring, uint32_t target, uint64_t target_offset,
> >  			 uint32_t offset, uint32_t value)
> > diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> > index 2e0ba07935..6aed806294 100644
> > --- a/tests/intel/gem_lmem_swapping.c
> > +++ b/tests/intel/gem_lmem_swapping.c
> > @@ -198,7 +198,6 @@ IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
> >  #define round_up(x, y) ((((x) - 1) | __round_mask(x, y)) + 1)
> >  
> >  #define PAGE_SIZE  (1ULL << 12)
> > -#define SZ_64K	   (16 * PAGE_SIZE)
> 
> Here it is not the same type ULL.

SZ_64K is unused in this test thus removed.

> 
> >  
> >  static const char *readable_unit(uint64_t size)
> >  {
> > diff --git a/tests/intel/i915_query.c b/tests/intel/i915_query.c
> > index f97379b83b..e9cc495973 100644
> > --- a/tests/intel/i915_query.c
> > +++ b/tests/intel/i915_query.c
> > @@ -863,7 +863,6 @@ static void test_query_regions_sanity_check(int fd)
> >  }
> >  
> >  #define rounddown(x, y) (x - (x % y))
> > -#define SZ_64K (1ULL << 16)
> 
> Same here, what about SULL_64K ? or SZ_ULL_64K ?

I've check usage of SZ_64K here. It is used in arithmetic along with
uint64_t so compiler will promote whole expression to 64bit.  I think
there's useless to add SULL suffix/prefix. I think SZ_x defined like
now are safe - you can use them in 32bit or 64bit expressions. Of
course if you try sth like this:

uint32_t v = 0xffffffff;
uint64_t x = v + SZ_4K;

you're shooting to your foot on your own. But I believe user
should use explicit casting here.

--
Zbigniew

> 
> Regards,
> Kamil
> 
> >  
> >  static void fill_unallocated(int fd, struct drm_i915_query_item *item, int idx,
> >  			     bool cpu_access)
> > diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> > index 5b64e56b45..d0c7e93e1c 100644
> > --- a/tests/intel/xe_evict.c
> > +++ b/tests/intel/xe_evict.c
> > @@ -453,9 +453,6 @@ threads(int fd, struct drm_xe_engine_class_instance *eci,
> >  		pthread_join(threads_data[i].thread, NULL);
> >  }
> >  
> > -#define SZ_256M 0x10000000
> > -#define SZ_1G   0x40000000
> > -
> >  static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
> >  {
> >  	if (vram_size >= SZ_1G)
> > diff --git a/tests/msm/msm_shrink.c b/tests/msm/msm_shrink.c
> > index d0b098aaf3..8e6c582ffc 100644
> > --- a/tests/msm/msm_shrink.c
> > +++ b/tests/msm/msm_shrink.c
> > @@ -30,8 +30,6 @@
> >  #include "igt_os.h"
> >  #include "igt_sysfs.h"
> >  
> > -#define SZ_1M (1024 * 1024)
> > -
> >  static void leak(uint64_t alloc)
> >  {
> >  	char *ptr;
> > -- 
> > 2.34.1
> > 
