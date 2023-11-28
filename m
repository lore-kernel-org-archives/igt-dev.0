Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6480110E188
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 20:32:37 +0000 (UTC)
Date: Tue, 28 Nov 2023 21:31:03 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Message-ID: <ZWZOB-3G9R0WEifr@fdugast-desk.home>
References: <20231116145348.7-1-francois.dugast@intel.com>
 <20231116145348.7-10-francois.dugast@intel.com>
 <20231117184416.armzwzb3bxxwacjc@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117184416.armzwzb3bxxwacjc@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v1 09/13] drm-uapi/xe: Reject bo creation of
 unaligned size
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

On Fri, Nov 17, 2023 at 07:44:16PM +0100, Kamil Konieczny wrote:
> Hi Francois,
> On 2023-11-16 at 14:53:44 +0000, Francois Dugast wrote:
> > Align with kernel commit ("drm/xe/uapi: Reject bo creation of unaligned size")
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  include/drm-uapi/xe_drm.h          | 17 +++++++++--------
> >  tests/intel/xe_mmap.c              | 22 ++++++++++++----------
> >  tests/intel/xe_prime_self_import.c | 26 +++++++++++++++++++++++++-
> 
> There are now compilation warnings:
> 
> [1315/1777] Compiling C object tests/xe_prime_self_import.p/intel_xe_prime_self_import.c.o
> ../tests/intel/xe_prime_self_import.c: In function 'check_bo':
> ../tests/intel/xe_prime_self_import.c:73:16: warning: declaration of 'bo_size' shadows a global declaration [-Wshadow]
>    73 |         size_t bo_size = get_min_bo_size(fd1, fd2);
>       |                ^~~~~~~
> 
> so please delete global var bo_size and remove it also from fixup.

It will be removed in the next revision, thanks.

Francois

> 
> Regards,
> Kamil
> 
> >  tests/intel/xe_vm.c                | 13 ++++++-------
> >  4 files changed, 52 insertions(+), 26 deletions(-)
> > 
> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > index 7aff66830..aa66b62e2 100644
> > --- a/include/drm-uapi/xe_drm.h
> > +++ b/include/drm-uapi/xe_drm.h
> > @@ -206,11 +206,13 @@ struct drm_xe_query_mem_region {
> >  	 *
> >  	 * When the kernel allocates memory for this region, the
> >  	 * underlying pages will be at least @min_page_size in size.
> > -	 *
> > -	 * Important note: When userspace allocates a GTT address which
> > -	 * can point to memory allocated from this region, it must also
> > -	 * respect this minimum alignment. This is enforced by the
> > -	 * kernel.
> > +	 * Buffer objects with an allowable placement in this region must be
> > +	 * created with a size aligned to this value.
> > +	 * GPU virtual address mappings of (parts of) buffer objects that
> > +	 * may be placed in this region must also have their GPU virtual
> > +	 * address and range aligned to this value.
> > +	 * Affected IOCTLS will return %-EINVAL if alignment restrictions are
> > +	 * not met.
> >  	 */
> >  	__u32 min_page_size;
> >  	/**
> > @@ -515,9 +517,8 @@ struct drm_xe_gem_create {
> >  	__u64 extensions;
> >  
> >  	/**
> > -	 * @size: Requested size for the object
> > -	 *
> > -	 * The (page-aligned) allocated size for the object will be returned.
> > +	 * @size: Size of the object to be created, must match region
> > +	 * (system or vram) minimum alignment (&min_page_size).
> >  	 */
> >  	__u64 size;
> >  
> > diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> > index 965644e22..d6c8d5114 100644
> > --- a/tests/intel/xe_mmap.c
> > +++ b/tests/intel/xe_mmap.c
> > @@ -47,17 +47,18 @@
> >  static void
> >  test_mmap(int fd, uint32_t placement, uint32_t flags)
> >  {
> > +	size_t bo_size = xe_get_default_alignment(fd);
> >  	uint32_t bo;
> >  	void *map;
> >  
> >  	igt_require_f(placement, "Device doesn't support such memory region\n");
> >  
> > -	bo = xe_bo_create(fd, 0, 4096, placement, flags);
> > +	bo = xe_bo_create(fd, 0, bo_size, placement, flags);
> >  
> > -	map = xe_bo_map(fd, bo, 4096);
> > +	map = xe_bo_map(fd, bo, bo_size);
> >  	strcpy(map, "Write some data to the BO!");
> >  
> > -	munmap(map, 4096);
> > +	munmap(map, bo_size);
> >  
> >  	gem_close(fd, bo);
> >  }
> > @@ -156,13 +157,14 @@ static void trap_sigbus(uint32_t *ptr)
> >   */
> >  static void test_small_bar(int fd)
> >  {
> > +	size_t page_size = xe_get_default_alignment(fd);
> >  	uint32_t visible_size = xe_visible_vram_size(fd, 0);
> >  	uint32_t bo;
> >  	uint64_t mmo;
> >  	uint32_t *map;
> >  
> >  	/* 2BIG invalid case */
> > -	igt_assert_neq(__xe_bo_create(fd, 0, visible_size + 4096,
> > +	igt_assert_neq(__xe_bo_create(fd, 0, visible_size + page_size,
> >  				      vram_memory(fd, 0),
> >  				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> >  				      &bo),
> > @@ -172,12 +174,12 @@ static void test_small_bar(int fd)
> >  	bo = xe_bo_create(fd, 0, visible_size / 4, vram_memory(fd, 0),
> >  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> >  	mmo = xe_bo_mmap_offset(fd, bo);
> > -	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
> > +	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo);
> >  	igt_assert(map != MAP_FAILED);
> >  
> >  	map[0] = 0xdeadbeaf;
> >  
> > -	munmap(map, 4096);
> > +	munmap(map, page_size);
> >  	gem_close(fd, bo);
> >  
> >  	/* Normal operation with system memory spilling */
> > @@ -186,18 +188,18 @@ static void test_small_bar(int fd)
> >  			  system_memory(fd),
> >  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> >  	mmo = xe_bo_mmap_offset(fd, bo);
> > -	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
> > +	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo);
> >  	igt_assert(map != MAP_FAILED);
> >  
> >  	map[0] = 0xdeadbeaf;
> >  
> > -	munmap(map, 4096);
> > +	munmap(map, page_size);
> >  	gem_close(fd, bo);
> >  
> >  	/* Bogus operation with SIGBUS */
> > -	bo = xe_bo_create(fd, 0, visible_size + 4096, vram_memory(fd, 0), 0);
> > +	bo = xe_bo_create(fd, 0, visible_size + page_size, vram_memory(fd, 0), 0);
> >  	mmo = xe_bo_mmap_offset(fd, bo);
> > -	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
> > +	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo);
> >  	igt_assert(map != MAP_FAILED);
> >  
> >  	trap_sigbus(map);
> > diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
> > index 9a263d326..504e6a13d 100644
> > --- a/tests/intel/xe_prime_self_import.c
> > +++ b/tests/intel/xe_prime_self_import.c
> > @@ -61,13 +61,19 @@ static int g_time_out = 5;
> >  static pthread_barrier_t g_barrier;
> >  static size_t bo_size;
> >  
> > +static size_t get_min_bo_size(int fd1, int fd2)
> > +{
> > +	return 4 * max(xe_get_default_alignment(fd1),
> > +		       xe_get_default_alignment(fd2));
> > +}
> > +
> >  static void
> >  check_bo(int fd1, uint32_t handle1, int fd2, uint32_t handle2)
> >  {
> > +	size_t bo_size = get_min_bo_size(fd1, fd2);
> >  	char *ptr1, *ptr2;
> >  	int i;
> >  
> > -
> >  	ptr1 = xe_bo_map(fd1, handle1, bo_size);
> >  	ptr2 = xe_bo_map(fd2, handle2, bo_size);
> >  
> > @@ -97,6 +103,7 @@ check_bo(int fd1, uint32_t handle1, int fd2, uint32_t handle2)
> >  static void test_with_fd_dup(void)
> >  {
> >  	int fd1, fd2;
> > +	size_t bo_size;
> >  	uint32_t handle, handle_import;
> >  	int dma_buf_fd1, dma_buf_fd2;
> >  
> > @@ -105,6 +112,8 @@ static void test_with_fd_dup(void)
> >  	fd1 = drm_open_driver(DRIVER_XE);
> >  	fd2 = drm_open_driver(DRIVER_XE);
> >  
> > +	bo_size = get_min_bo_size(fd1, fd2);
> > +
> >  	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
> >  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> >  
> > @@ -131,6 +140,7 @@ static void test_with_fd_dup(void)
> >  static void test_with_two_bos(void)
> >  {
> >  	int fd1, fd2;
> > +	size_t bo_size;
> >  	uint32_t handle1, handle2, handle_import;
> >  	int dma_buf_fd;
> >  
> > @@ -139,6 +149,8 @@ static void test_with_two_bos(void)
> >  	fd1 = drm_open_driver(DRIVER_XE);
> >  	fd2 = drm_open_driver(DRIVER_XE);
> >  
> > +	bo_size = get_min_bo_size(fd1, fd2);
> > +
> >  	handle1 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
> >  			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> >  	handle2 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
> > @@ -171,12 +183,15 @@ static void test_with_two_bos(void)
> >  static void test_with_one_bo_two_files(void)
> >  {
> >  	int fd1, fd2;
> > +	size_t bo_size;
> >  	uint32_t handle_import, handle_open, handle_orig, flink_name;
> >  	int dma_buf_fd1, dma_buf_fd2;
> >  
> >  	fd1 = drm_open_driver(DRIVER_XE);
> >  	fd2 = drm_open_driver(DRIVER_XE);
> >  
> > +	bo_size = get_min_bo_size(fd1, fd2);
> > +
> >  	handle_orig = xe_bo_create(fd1, 0, bo_size,
> >  				   vram_if_possible(fd1, 0),
> >  				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > @@ -205,12 +220,15 @@ static void test_with_one_bo_two_files(void)
> >  static void test_with_one_bo(void)
> >  {
> >  	int fd1, fd2;
> > +	size_t bo_size;
> >  	uint32_t handle, handle_import1, handle_import2, handle_selfimport;
> >  	int dma_buf_fd;
> >  
> >  	fd1 = drm_open_driver(DRIVER_XE);
> >  	fd2 = drm_open_driver(DRIVER_XE);
> >  
> > +	bo_size = get_min_bo_size(fd1, fd2);
> > +
> >  	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
> >  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> >  
> > @@ -279,6 +297,7 @@ static void *thread_fn_reimport_vs_close(void *p)
> >  	pthread_t *threads;
> >  	int r, i, num_threads;
> >  	int fds[2];
> > +	size_t bo_size;
> >  	int obj_count;
> >  	void *status;
> >  	uint32_t handle;
> > @@ -298,6 +317,8 @@ static void *thread_fn_reimport_vs_close(void *p)
> >  
> >  	fds[0] = drm_open_driver(DRIVER_XE);
> >  
> > +	bo_size = xe_get_default_alignment(fds[0]);
> > +
> >  	handle = xe_bo_create(fds[0], 0, bo_size,
> >  			      vram_if_possible(fds[0], 0),
> >  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > @@ -336,6 +357,7 @@ static void *thread_fn_export_vs_close(void *p)
> >  	struct drm_prime_handle prime_h2f;
> >  	struct drm_gem_close close_bo;
> >  	int fd = (uintptr_t)p;
> > +	size_t bo_size = xe_get_default_alignment(fd);
> >  	uint32_t handle;
> >  
> >  	pthread_barrier_wait(&g_barrier);
> > @@ -463,6 +485,7 @@ static void test_llseek_size(void)
> >  static void test_llseek_bad(void)
> >  {
> >  	int fd;
> > +	size_t bo_size;
> >  	uint32_t handle;
> >  	int dma_buf_fd;
> >  
> > @@ -470,6 +493,7 @@ static void test_llseek_bad(void)
> >  
> >  	fd = drm_open_driver(DRIVER_XE);
> >  
> > +	bo_size = 4 * xe_get_default_alignment(fd);
> >  	handle = xe_bo_create(fd, 0, bo_size,
> >  			      vram_if_possible(fd, 0),
> >  			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index ea93d7b2e..2c563c64f 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -1310,11 +1310,10 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
> >  	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
> >  		t.fd = fd;
> >  		t.vm = vm;
> > -#define PAGE_SIZE	4096
> > -		t.addr = addr + PAGE_SIZE / 2;
> > +		t.addr = addr + page_size / 2;
> >  		t.eci = eci;
> >  		t.exit = &exit;
> > -		t.map = map + PAGE_SIZE / 2;
> > +		t.map = map + page_size / 2;
> >  		t.barrier = &barrier;
> >  		pthread_barrier_init(&barrier, NULL, 2);
> >  		pthread_create(&t.thread, 0, hammer_thread, &t);
> > @@ -1367,8 +1366,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
> >  		igt_assert_eq(data->data, 0xc0ffee);
> >  	}
> >  	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
> > -		memset(map, 0, PAGE_SIZE / 2);
> > -		memset(map + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
> > +		memset(map, 0, page_size / 2);
> > +		memset(map + page_size, 0, bo_size - page_size);
> >  	} else {
> >  		memset(map, 0, bo_size);
> >  	}
> > @@ -1417,8 +1416,8 @@ try_again_after_invalidate:
> >  		}
> >  	}
> >  	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
> > -		memset(map, 0, PAGE_SIZE / 2);
> > -		memset(map + PAGE_SIZE, 0, bo_size - PAGE_SIZE);
> > +		memset(map, 0, page_size / 2);
> > +		memset(map + page_size, 0, bo_size - page_size);
> >  	} else {
> >  		memset(map, 0, bo_size);
> >  	}
> > -- 
> > 2.34.1
> > 
