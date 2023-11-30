Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB99410E2FF
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 12:49:36 +0000 (UTC)
Date: Thu, 30 Nov 2023 13:49:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231130124911.3owtijmtffcvf4pk@kamilkon-desk.igk.intel.com>
References: <20231123150823.25862-1-marcin.bernatowicz@intel.com>
 <20231123150823.25862-3-marcin.bernatowicz@intel.com>
 <20231123172439.s6mnw54uny7mxphg@kamilkon-desk.igk.intel.com>
 <6d48e4f7-5bb0-4190-8755-d2cfc6bd3bfd@linux.intel.com>
 <20231129175648.2b37g62gqloxa3re@kamilkon-desk.igk.intel.com>
 <2fe0accf-c58c-4ce7-bf84-9daf23edc6c6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2fe0accf-c58c-4ce7-bf84-9daf23edc6c6@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v4 i-g-t 2/2] tests/intel/xe_create:
 create-big-vram subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adam.miszczak@intel.com, matthew.auld@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>, jakub1.kolakowski@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Marcin,

On 2023-11-30 at 11:11:21 +0100, Bernatowicz, Marcin wrote:
> Hi,
> 
> On 11/29/2023 6:56 PM, Kamil Konieczny wrote:
> > Hi Marcin,
> > 
> > On 2023-11-23 at 19:50:31 +0100, Bernatowicz, Marcin wrote:
> > > Hi,
> > > 
> > > On 11/23/2023 6:24 PM, Kamil Konieczny wrote:
> > > > Hi Marcin,
> > > > On 2023-11-23 at 16:08:23 +0100, Marcin Bernatowicz wrote:
> > > > > Validates the creation of significant Buffer Object (BO) within VRAM,
> > > > > considering the entire available CPU-visible VRAM size.
> > > > > The size of the created BO can be adjusted using command line
> > > > > parameters, with '-S' representing BO size in MB,
> > > > > and '-p' representing BO size as a percentage of the VRAM size.
> > > > > 
> > > > > v2: rebased, updated to uAPI changes (DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT),
> > > > >       after review corrections: 1024UL -> 1024ULL,
> > > > >       int -> unsigned int (Kamil)
> > > > > 
> > > > > v3: provided a flag to allocate the memory within the CPU-visible
> > > > >         portion of VRAM (Matt)
> > > > >       __create_bo replaced with xe_bo_create_flags (Lukasz)
> > > > >       removed the percent command line parameter (Lukasz)
> > > > >       renamed size_MB to size_mb (Lukasz)
> > > > >       added helper function to query available CPU-visible VRAM size,
> > > > >       renamed 'xe_vram_available' to 'xe_available_vram_size' for
> > > > >         consistency with other function names
> > > > > 
> > > > > v4: split lib and test changes into separate patches (Lukasz, Kamil)
> > > > >       added prefixes to titles (Kamil)
> > > > >       restored percent command line parameter (Kamil)
> > > > >       whitespace correction (Kamil)
> > > > > 
> > > > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > > Cc: Laguna, Lukasz <lukasz.laguna@intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> > > > > ---
> > > > >    tests/intel/xe_create.c | 84 ++++++++++++++++++++++++++++++++++++++++-
> > > > >    1 file changed, 83 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> > > > > index f4633cfb3..194c677ee 100644
> > > > > --- a/tests/intel/xe_create.c
> > > > > +++ b/tests/intel/xe_create.c
> > > > > @@ -18,6 +18,14 @@
> > > > >    #define PAGE_SIZE 0x1000
> > > > > +static struct param {
> > > > > +	unsigned int size_mb;
> > > > > +	unsigned int vram_percent;
> > > > > +} params = {
> > > > > +	.size_mb = 0,
> > > > > +	.vram_percent = 0,
> > > > > +};
> > > > > +
> > > > >    static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> > > > >    		       uint32_t *handlep)
> > > > >    {
> > > > > @@ -214,7 +222,78 @@ static void create_massive_size(int fd)
> > > > >    	}
> > > > >    }
> > > > > -igt_main
> > > > > +/**
> > > > > + * SUBTEST: create-big-vram
> > > > > + * Functionality: BO creation
> > > > > + * Test category: functionality test
> > > > > + * Description: Verifies the creation of substantial BO within VRAM,
> > > > > + *		constituting all available CPU-visible VRAM.
> > > > > + */
> > > > > +static void create_big_vram(int fd)
> > > > > +{
> > > > > +	uint64_t bo_size, size, visible_avail_size, alignment;
> > > > > +	uint32_t bo_handle;
> > > > > +	char *bo_ptr = NULL;
> > > > > +	uint64_t vm = 0;
> > > > > +	int gt;
> > > > > +
> > > > > +	igt_require(xe_has_vram(fd));
> > > > > +	alignment = xe_get_default_alignment(fd);
> > > > > +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> > > > > +
> > > > > +	xe_for_each_gt(fd, gt) {
> > > > > +		visible_avail_size = xe_visible_available_vram_size(fd, gt);
> > > > 
> > > > Skip (continue) if == 0?
> > > 
> > > Do we expect it to be zero ?
> > > 
> > 
> > It do not to be here, it can be added below.
> > 
> > > > 
> > > > > +		bo_size = params.size_mb
> > > > > +			  ? params.size_mb * 1024ULL * 1024ULL
> > > > > +			  : params.vram_percent
> > > > > +				? ALIGN(visible_avail_size * params.vram_percent / 100, alignment)
> > > > > +				: ALIGN_DOWN(visible_avail_size, alignment);
> 
> I'll simplify the bo_size to:
> 
> bo_size = params.size_mb ? params.size_mb * 1024ULL * 1024ULL
>           : ALIGN_DOWN(visible_avail_size * params.vram_percent / 100,
> 		       alignment);
> 
> with vram_percent defaulting to 100.
> 
> > > > > +		igt_info("gt%u bo_size=%lu visible_available_vram_size=%lu\n",
> > > > > +			gt, bo_size, visible_avail_size);
> > > > > +
> > > > 
> > > > Should it skip if calculated bo_size == 0?
> > > > In case of skips you can make it dynamic or count number
> > > > of performed tests (it should be > 0).
> > > 
> > > Is it expected to be zero ? I would just let it go (and fail).
> > > 
> > > --
> > > marcin
> > > > 
> > > > Regards,
> > > > Kamil
> > > > 
> > > > > +		bo_handle = xe_bo_create_flags(fd, vm, bo_size, visible_vram_memory(fd, gt));
> > > > > +		bo_ptr = xe_bo_map(fd, bo_handle, bo_size);
> > 
> > Please add assert here:
> >      igt_assert(bo_ptr);
> 
> xe_bo_map asserts if mmap fails
> 
> > 
> > > > > +
> > > > > +		size = bo_size - 1;
> > 
> > Here imho you should add
> >      igt_assert_lt_u64(SZ_64K, size);
> > 
> > Point is you will not test anything if size is too small.
> 
> There will be no write, but still we have a check for zero value read at
> index 0 (the assert after while).
> I think SZ_64K is the minimum page size for vram, so perhaps we would fail
> earlier on xe_bo_create (due to visible_vram_memory returning 0?).
> 
> I'll split the check per gt with dynamic subtests in case any gt's visible
> available vram returns 0. I'm contemplating using a skip instead of an
> assert in such cases, as it might be more appropriate. What are your
> thoughts on this approach?

Seems good, imho skip is better.

Regards,
Kamil

> 
> --
> marcin
> > 
> > Regards,
> > Kamil
> > 
> > > > > +		while (size > SZ_64K) {
> > > > > +			igt_assert_eq(0, READ_ONCE(bo_ptr[size]));
> > > > > +			WRITE_ONCE(bo_ptr[size], 'A');
> > > > > +			igt_assert_eq('A', READ_ONCE(bo_ptr[size]));
> > > > > +			size >>= 1;
> > > > > +		}
> > > > > +		igt_assert_eq(0, bo_ptr[0]);
> > > > > +
> > > > > +		munmap(bo_ptr, bo_size);
> > > > > +		gem_close(fd, bo_handle);
> > > > > +	}
> > > > > +
> > > > > +	xe_vm_destroy(fd, vm);
> > > > > +}
> > > > > +
> > > > > +static int opt_handler(int opt, int opt_index, void *data)
> > > > > +{
> > > > > +	switch (opt) {
> > > > > +	case 'S':
> > > > > +		params.size_mb = atoi(optarg);
> > > > > +		igt_debug("Size MB: %d\n", params.size_mb);
> > > > > +		break;
> > > > > +	case 'p':
> > > > > +		params.vram_percent = atoi(optarg);
> > > > > +		igt_debug("Percent of VRAM: %d\n", params.vram_percent);
> > > > > +		break;
> > > > > +	default:
> > > > > +		return IGT_OPT_HANDLER_ERROR;
> > > > > +	}
> > > > > +
> > > > > +	return IGT_OPT_HANDLER_SUCCESS;
> > > > > +}
> > > > > +
> > > > > +const char *help_str =
> > > > > +	"  -S\tBO size in MB\n"
> > > > > +	"  -p\tPercent of VRAM for BO\n"
> > > > > +	;
> > > > > +
> > > > > +igt_main_args("S:p:", NULL, help_str, opt_handler, NULL)
> > > > >    {
> > > > >    	int xe;
> > > > > @@ -253,6 +332,9 @@ igt_main
> > > > >    		igt_waitchildren();
> > > > >    	}
> > > > > +	igt_subtest("create-big-vram") {
> > > > > +		create_big_vram(xe);
> > > > > +	}
> > > > >    	igt_fixture
> > > > >    		drm_close_driver(xe);
> > > > > -- 
> > > > > 2.31.1
> > > > > 
