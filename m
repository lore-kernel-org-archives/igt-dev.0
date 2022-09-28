Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE0010EA15
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 15:36:40 +0000 (UTC)
Date: Wed, 28 Sep 2022 17:36:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YzRqBDptI8v/c8AG@kamilkon-desk1>
References: <20220918221535.3276922-1-jfree@freebsd.org>
 <YzQ/CnZyoBpgIfYM@kamilkon-desk1>
 <YzRBxjWDvvfTq3Yd@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YzRBxjWDvvfTq3Yd@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Replaced instances of mmap64() with
 mmap()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-09-28 at 15:44:54 +0300, Petri Latvala wrote:
> On Wed, Sep 28, 2022 at 02:33:14PM +0200, Kamil Konieczny wrote:
> > Hi Jake,
> > 
> > this patch is missing commit message. Please put here short
> > description of change and why you do it. Change looks resonable
> > as on 64-bit systems both functions are the same.
> > 
> > On 2022-09-18 at 17:15:35 -0500, Jake Freeland wrote:
> > > Signed-off-by: Jake Freeland <jfree@freebsd.org>
> > 
> > Adding Petri on cc as I do not know if anyone compiles this on
> > 32-bit platforms.
> 
> Aren't you supposed to use mmap() with _LARGEFILE_something even on
> 32-bit builds, instead of mmap64?
> 
> 
> -- 
> Petri Latvala
> 

imho _LARGEFILE_... is indeed needed on 32-bit builds, no need
for this on our current builds as Linux runs now on 64-bit
machines.

I was asking if you know of anyone compiling and using igt i915
code for 32-bit platform.

I see that this patch touches also igt_vgem lib so maybe we
should also ask arm igt users ?

--
Kamil

> 
> 
> > 
> > Regards,
> > Kamil
> > 
> > > ---
> > >  lib/i915/gem_mman.c          |  4 ++--
> > >  lib/igt_vgem.c               |  2 +-
> > >  tests/i915/gem_mmap_gtt.c    | 22 +++++++++++-----------
> > >  tests/i915/gem_mmap_offset.c | 14 +++++++-------
> > >  4 files changed, 21 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> > > index aa9ac6f3..0b41ba70 100644
> > > --- a/lib/i915/gem_mman.c
> > > +++ b/lib/i915/gem_mman.c
> > > @@ -118,7 +118,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned prot)
> > >  	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
> > >  		return NULL;
> > >  
> > > -	ptr = mmap64(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> > > +	ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> > >  	if (ptr == MAP_FAILED)
> > >  		ptr = NULL;
> > >  	else
> > > @@ -331,7 +331,7 @@ void *__gem_mmap_offset(int fd, uint32_t handle, uint64_t offset, uint64_t size,
> > >  	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg))
> > >  		return NULL;
> > >  
> > > -	ptr = mmap64(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
> > > +	ptr = mmap(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
> > >  
> > >  	if (ptr == MAP_FAILED)
> > >  		ptr = NULL;
> > > diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
> > > index 7f933b23..468383c7 100644
> > > --- a/lib/igt_vgem.c
> > > +++ b/lib/igt_vgem.c
> > > @@ -76,7 +76,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo, unsigned prot)
> > >  	if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &arg))
> > >  		return NULL;
> > >  
> > > -	ptr = mmap64(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> > > +	ptr = mmap(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> > >  	if (ptr == MAP_FAILED)
> > >  		return NULL;
> > >  
> > > diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> > > index 4f05eb18..683eaf16 100644
> > > --- a/tests/i915/gem_mmap_gtt.c
> > > +++ b/tests/i915/gem_mmap_gtt.c
> > > @@ -113,11 +113,11 @@ test_access(int fd)
> > >  	mmap_arg.handle = handle;
> > >  	do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
> > >  
> > > -	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > +	igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > >  			  MAP_SHARED, fd, mmap_arg.offset));
> > >  
> > >  	/* Check that the same offset on the other fd doesn't work. */
> > > -	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > +	igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > >  			  MAP_SHARED, fd2, mmap_arg.offset) == MAP_FAILED);
> > >  	igt_assert(errno == EACCES);
> > >  
> > > @@ -128,7 +128,7 @@ test_access(int fd)
> > >  
> > >  	/* Recheck that it works after flink. */
> > >  	/* Check that the same offset on the other fd doesn't work. */
> > > -	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > > +	igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> > >  			  MAP_SHARED, fd2, mmap_arg.offset));
> > >  }
> > >  
> > > @@ -159,11 +159,11 @@ test_short(int fd)
> > >  	for (pages = 1; pages <= OBJECT_SIZE / PAGE_SIZE; pages <<= 1) {
> > >  		uint8_t *r, *w;
> > >  
> > > -		w = mmap64(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
> > > +		w = mmap(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
> > >  			   MAP_SHARED, fd, mmap_arg.offset);
> > >  		igt_assert(w != MAP_FAILED);
> > >  
> > > -		r = mmap64(0, pages * PAGE_SIZE, PROT_READ,
> > > +		r = mmap(0, pages * PAGE_SIZE, PROT_READ,
> > >  			   MAP_SHARED, fd, mmap_arg.offset);
> > >  		igt_assert(r != MAP_FAILED);
> > >  
> > > @@ -384,13 +384,13 @@ test_isolation(int i915)
> > >  
> > >  	close(B);
> > >  
> > > -	ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > +	ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > >  	igt_assert(ptr != MAP_FAILED);
> > >  	munmap(ptr, 4096);
> > >  
> > >  	close(A);
> > >  
> > > -	ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > +	ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > >  	igt_assert(ptr == MAP_FAILED);
> > >  }
> > >  
> > > @@ -400,7 +400,7 @@ test_close_race(int i915)
> > >  	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> > >  	_Atomic uint32_t *handles;
> > >  
> > > -	handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > > +	handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > >  	igt_assert(handles != MAP_FAILED);
> > >  
> > >  	igt_fork(child, ncpus + 1) {
> > > @@ -418,7 +418,7 @@ test_close_race(int i915)
> > >  				  &mmap_arg) != -1) {
> > >  				void *ptr;
> > >  
> > > -				ptr = mmap64(0, 4096,
> > > +				ptr = mmap(0, 4096,
> > >  					     PROT_WRITE, MAP_SHARED, i915,
> > >  					     mmap_arg.offset);
> > >  				if (ptr != MAP_FAILED) {
> > > @@ -444,7 +444,7 @@ test_flink_race(int i915)
> > >  	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> > >  	_Atomic uint32_t *handles;
> > >  
> > > -	handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > > +	handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > >  	igt_assert(handles != MAP_FAILED);
> > >  
> > >  	igt_fork(child, ncpus + 1) {
> > > @@ -469,7 +469,7 @@ test_flink_race(int i915)
> > >  				  &mmap_arg) != -1) {
> > >  				void *ptr;
> > >  
> > > -				ptr = mmap64(0, 4096,
> > > +				ptr = mmap(0, 4096,
> > >  					     PROT_WRITE, MAP_SHARED, fd,
> > >  					     mmap_arg.offset);
> > >  				if (ptr != MAP_FAILED) {
> > > diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> > > index 5781b2fb..0933ed94 100644
> > > --- a/tests/i915/gem_mmap_offset.c
> > > +++ b/tests/i915/gem_mmap_offset.c
> > > @@ -66,7 +66,7 @@ __mmap_offset(int i915, uint32_t handle, uint64_t offset, uint64_t size,
> > >  	if (mmap_offset_ioctl(i915, &arg))
> > >  		return NULL;
> > >  
> > > -	ptr = mmap64(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
> > > +	ptr = mmap(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
> > >  	if (ptr == MAP_FAILED)
> > >  		ptr = NULL;
> > >  	else
> > > @@ -214,12 +214,12 @@ static void isolation(int i915)
> > >  			 t->name, B, b, offset_b);
> > >  
> > >  		errno = 0;
> > > -		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
> > > +		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
> > >  		igt_assert(ptr == MAP_FAILED);
> > >  		igt_assert_eq(errno, EACCES);
> > >  
> > >  		errno = 0;
> > > -		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
> > > +		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
> > >  		igt_assert(ptr == MAP_FAILED);
> > >  		igt_assert_eq(errno, EACCES);
> > >  
> > > @@ -237,13 +237,13 @@ static void isolation(int i915)
> > >  
> > >  		close(B);
> > >  
> > > -		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > +		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > >  		igt_assert(ptr != MAP_FAILED);
> > >  		munmap(ptr, 4096);
> > >  
> > >  		close(A);
> > >  
> > > -		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > > +		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> > >  		igt_assert(ptr == MAP_FAILED);
> > >  	}
> > >  }
> > > @@ -401,7 +401,7 @@ static void close_race(int i915, int timeout)
> > >  	_Atomic uint32_t *handles;
> > >  	size_t len = ALIGN((ncpus + 1) * sizeof(uint32_t), 4096);
> > >  
> > > -	handles = mmap64(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > > +	handles = mmap(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> > >  	igt_assert(handles != MAP_FAILED);
> > >  
> > >  	igt_fork(child, ncpus + 1) {
> > > @@ -420,7 +420,7 @@ static void close_race(int i915, int timeout)
> > >  				  &mmap_arg) != -1) {
> > >  				void *ptr;
> > >  
> > > -				ptr = mmap64(0, 4096,
> > > +				ptr = mmap(0, 4096,
> > >  					     PROT_WRITE, MAP_SHARED, i915,
> > >  					     mmap_arg.offset);
> > >  				if (ptr != MAP_FAILED) {
> > > -- 
> > > 2.37.3
> > > 
