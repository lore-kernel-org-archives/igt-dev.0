Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B539B10E594
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 16:11:38 +0000 (UTC)
Date: Tue, 28 Nov 2023 17:11:28 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZWYRMAcZrx4IIVe5@fdugast-desk.home>
References: <20231116145348.7-1-francois.dugast@intel.com>
 <20231116145348.7-3-francois.dugast@intel.com>
 <20231121171308.bxk6cygpivso2t7p@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231121171308.bxk6cygpivso2t7p@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v1 02/13] xe_ioctl: Converge bo_create to the
 most used version
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

On Tue, Nov 21, 2023 at 06:13:08PM +0100, Kamil Konieczny wrote:
> Hi Francois,
> On 2023-11-16 at 14:53:37 +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Let's unify the call instead of having 2 separated
> > options for the same goal.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/xe/xe_ioctl.c           | 15 ---------------
> >  lib/xe/xe_ioctl.h           |  1 -
> >  tests/intel/xe_perf_pmu.c   |  4 ++--
> >  tests/intel/xe_spin_batch.c |  2 +-
> >  tests/intel/xe_vm.c         |  9 +++++----
> >  5 files changed, 8 insertions(+), 23 deletions(-)
> > 
> > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> > index 738c4ffdb..78d431ab2 100644
> > --- a/lib/xe/xe_ioctl.c
> > +++ b/lib/xe/xe_ioctl.c
> > @@ -253,21 +253,6 @@ uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
> >  	return handle;
> >  }
> >  
> > -uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
> > -{
> > -	struct drm_xe_gem_create create = {
> > -		.vm_id = vm,
> > -		.size = size,
> > -		.flags = vram_if_possible(fd, gt),
> > -	};
> > -	int err;
> > -
> > -	err = igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create);
> > -	igt_assert_eq(err, 0);
> > -
> > -	return create.handle;
> > -}
> > -
> >  uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async)
> >  {
> >  	struct drm_xe_engine_class_instance instance = {
> > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> > index a9171bcf7..fb191d98f 100644
> > --- a/lib/xe/xe_ioctl.h
> > +++ b/lib/xe/xe_ioctl.h
> > @@ -67,7 +67,6 @@ void xe_vm_destroy(int fd, uint32_t vm);
> >  uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
> >  			      uint32_t *handle);
> >  uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags);
> > -uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
> >  uint32_t xe_exec_queue_create(int fd, uint32_t vm,
> >  			  struct drm_xe_engine_class_instance *instance,
> >  			  uint64_t ext);
> > diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
> > index e9d05cf2b..2c549f778 100644
> > --- a/tests/intel/xe_perf_pmu.c
> > +++ b/tests/intel/xe_perf_pmu.c
> > @@ -103,7 +103,7 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> >  			xe_get_default_alignment(fd));
> >  
> > -	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> > +	bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, 0));
> ----------------------------------------------------------------- ^
> s/fd, 0/fd, eci->gt_id/
> 
> >  	spin = xe_bo_map(fd, bo, bo_size);
> >  
> >  	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > @@ -223,7 +223,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
> >  	bo_size = sizeof(*data) * num_placements;
> >  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
> >  
> > -	bo = xe_bo_create(fd, gt, vm, bo_size);
> > +	bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, 0));
> ----------------------------------------------------------------- ^
> s/fd, 0/fd, gt/
> 
> >  	data = xe_bo_map(fd, bo, bo_size);
> >  
> >  	for (i = 0; i < num_placements; i++) {
> > diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> > index 6ab604d9b..261fde9af 100644
> > --- a/tests/intel/xe_spin_batch.c
> > +++ b/tests/intel/xe_spin_batch.c
> > @@ -169,7 +169,7 @@ static void xe_spin_fixed_duration(int fd)
> >  	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
> >  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> >  	bo_size = ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
> > -	bo = xe_bo_create(fd, 0, vm, bo_size);
> > +	bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, 0));
> >  	spin = xe_bo_map(fd, bo, bo_size);
> >  	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
> >  							ALLOC_STRATEGY_LOW_TO_HIGH);
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index 05e8e7516..eedd05b57 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -267,7 +267,7 @@ static void test_partial_unbinds(int fd)
> >  {
> >  	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> >  	size_t bo_size = 3 * xe_get_default_alignment(fd);
> > -	uint32_t bo = xe_bo_create(fd, 0, vm, bo_size);
> > +	uint32_t bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, 0));
> >  	uint64_t unbind_size = bo_size / 3;
> >  	uint64_t addr = 0x1a0000;
> >  
> > @@ -316,7 +316,7 @@ static void unbind_all(int fd, int n_vmas)
> >  	};
> >  
> >  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> > -	bo = xe_bo_create(fd, 0, vm, bo_size);
> > +	bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, 0));
> >  
> >  	for (i = 0; i < n_vmas; ++i)
> >  		xe_vm_bind_async(fd, vm, 0, bo, 0, addr + i * bo_size,
> > @@ -362,6 +362,7 @@ static void userptr_invalid(int fd)
> >  	xe_vm_destroy(fd, vm);
> >  }
> >  
> > +
> 
> Remove this newline.
> 
> Regards,
> Kamil

Sorry for the delay while finalizing the content of the kernel series. Many
thanks for the review and for catching those. It will be fixed in the next
revision.

Francois

> 
> >  /**
> >   * SUBTEST: shared-%s-page
> >   * Description: Test shared arg[1] page
> > @@ -1575,9 +1576,9 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
> >  		igt_assert(map0 != MAP_FAILED);
> >  		igt_assert(map1 != MAP_FAILED);
> >  	} else {
> > -		bo0 = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> > +		bo0 = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
> >  		map0 = xe_bo_map(fd, bo0, bo_size);
> > -		bo1 = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> > +		bo1 = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
> >  		map1 = xe_bo_map(fd, bo1, bo_size);
> >  	}
> >  	memset(map0, 0, bo_size);
> > -- 
> > 2.34.1
> > 
