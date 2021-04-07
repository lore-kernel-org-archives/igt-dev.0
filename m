Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792C889C9C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Apr 2021 07:51:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a6so10829087wrw.8
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Apr 2021 00:51:13 -0700 (PDT)
Date: Wed, 7 Apr 2021 09:51:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YG1kbUfW1QDGSD38@phenom.ffwll.local>
References: <20210330035056.52019-1-ashutosh.dixit@intel.com>
 <CAM0jSHPXQZFJwa0DQOgyvK-Qjq9_meEzCL11joYqkve+MTS9cA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM0jSHPXQZFJwa0DQOgyvK-Qjq9_meEzCL11joYqkve+MTS9cA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915: Avoid set_domain -ENOMEM error
 with huge buffers
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
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 11:28:01AM +0100, Matthew Auld wrote:
> On Tue, 30 Mar 2021 at 04:51, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> >
> > When pread/pwrite are unavailable, the pread/pwrite replacement implemented
> > in ad5eb02eb3f1 ("lib/ioctl_wrappers: Keep IGT working without pread/pwrite
> > ioctls") uses gem_set_domain which pins all pages which have to be
> > read/written. When the read/write size is large this causes gem_set_domain
> > to return -ENOMEM with a trace such as:
> >
> > ioctl_wrappers-CRITICAL: Test assertion failure function gem_set_domain, file ../lib/ioctl_wrappers.c:563:
> > ioctl_wrappers-CRITICAL: Failed assertion: __gem_set_domain(fd, handle, read, write) == 0
> > ioctl_wrappers-CRITICAL: Last errno: 12, Cannot allocate memory
> > ioctl_wrappers-CRITICAL: error: -12 != 0
> > igt_core-INFO: Stack trace:
> > igt_core-INFO:   #0 ../lib/igt_core.c:1746 __igt_fail_assert()
> > igt_core-INFO:   #1 [gem_set_domain+0x44]
> > igt_core-INFO:   #2 ../lib/ioctl_wrappers.c:367 gem_write()
> > igt_core-INFO:   #3 ../tests/prime_mmap.c:67 test_aperture_limit()
> > igt_core-INFO:   #4 ../tests/prime_mmap.c:578 __real_main530()
> > igt_core-INFO:   #5 ../tests/prime_mmap.c:530 main()
> >
> > Therefore avoid using the pread/pwrite replacement for huge buffers, mmap
> > and write instead. This fixes failures seen in
> > prime_mmap@test_aperture_limit and gem_exec_params@larger-than-life-batch
> > when pread/pwrite are unavailable.
> >
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  tests/i915/gem_exec_params.c |  5 ++++-
> >  tests/prime_mmap.c           | 33 ++++++++++++++++++++++-----------
> >  2 files changed, 26 insertions(+), 12 deletions(-)
> >
> > diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> > index 6840cf40ce..613bc26485 100644
> > --- a/tests/i915/gem_exec_params.c
> > +++ b/tests/i915/gem_exec_params.c
> > @@ -254,9 +254,12 @@ static uint32_t batch_create_size(int fd, uint64_t size)
> >  {
> >         const uint32_t bbe = MI_BATCH_BUFFER_END;
> >         uint32_t handle;
> > +       char *ptr;
> >
> >         handle = gem_create(fd, size);
> > -       gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> > +       ptr = gem_mmap__device_coherent(fd, handle, 0, sizeof(bbe), PROT_WRITE);
> > +       memcpy(ptr, &bbe, sizeof(bbe));
> > +       munmap(ptr, sizeof(bbe));
> 
> I thought mmap_offfset still just pins all the pages on fault, so why
> don't we still hit -ENOMEM somewhere? I would have assumed we want
> gem_mmap__cpu/wc here, which instead goes through the shmem/page-cache
> backend, and so only needs to allocate the first few pages or so IIRC,
> similar to the tricks in the shmem pwrite backend? Or I guess just
> move the igt_require() for the memory requirements to earlier? Or
> maybe I am misunderstanding something?

What I'm more confused about is that we immediately do an execbuf
afterwards. So what exactly makes this patch here work, because we still
do the full pinning of all the memory.

Something is definitely not quite understood here.

I'd expect that if we use the ggtt system agent mmapings, then maybe we
have trouble fitting it. But we're doing slice-by-slice mmap for that,
plus really the error code if we fail to find ggtt should be ENOSP. So
probably something else.

Also I think this should be split so that each testcase has its own
bugfix, with explanation why.
-Daniel

> 
> >
> >         return handle;
> >  }
> > diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
> > index cdf2d51497..4f46b1ee62 100644
> > --- a/tests/prime_mmap.c
> > +++ b/tests/prime_mmap.c
> > @@ -68,9 +68,13 @@ fill_bo(uint32_t handle, size_t size)
> >  }
> >
> >  static void
> > -fill_bo_cpu(char *ptr)
> > +fill_bo_cpu(char *ptr, size_t size)
> >  {
> > -       memcpy(ptr, pattern, sizeof(pattern));
> > +       off_t i;
> > +       for (i = 0; i < size; i += sizeof(pattern))
> > +       {
> > +               memcpy(ptr + i, pattern, sizeof(pattern));
> > +       }
> >  }
> >
> >  static void
> > @@ -208,7 +212,7 @@ test_correct_cpu_write(void)
> >         igt_assert(ptr != MAP_FAILED);
> >
> >         /* Fill bo using CPU */
> > -       fill_bo_cpu(ptr);
> > +       fill_bo_cpu(ptr, BO_SIZE);
> >
> >         /* Check pattern correctness */
> >         igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
> > @@ -236,7 +240,7 @@ test_forked_cpu_write(void)
> >         igt_fork(childno, 1) {
> >                 ptr = mmap(NULL, BO_SIZE, PROT_READ | PROT_WRITE , MAP_SHARED, dma_buf_fd, 0);
> >                 igt_assert(ptr != MAP_FAILED);
> > -               fill_bo_cpu(ptr);
> > +               fill_bo_cpu(ptr, BO_SIZE);
> >
> >                 igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
> >                 munmap(ptr, BO_SIZE);
> > @@ -452,20 +456,27 @@ test_aperture_limit(void)
> >         uint64_t size2 = (gem_mappable_aperture_size(fd) * 3) / 8;
> >
> >         handle1 = gem_create(fd, size1);
> > -       fill_bo(handle1, BO_SIZE);
> > -
> > -       dma_buf_fd1 = prime_handle_to_fd(fd, handle1);
> > +       dma_buf_fd1 = prime_handle_to_fd_for_mmap(fd, handle1);
> >         igt_assert(errno == 0);
> > -       ptr1 = mmap(NULL, size1, PROT_READ, MAP_SHARED, dma_buf_fd1, 0);
> > +       ptr1 = mmap(NULL, size1, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd1, 0);
> >         igt_assert(ptr1 != MAP_FAILED);
> > +       /* Prevent gem_set_domain -ENOMEM failures when pwrite is not available */
> > +       if (gem_has_pwrite(fd))
> > +               fill_bo(handle1, BO_SIZE);
> > +       else
> > +               fill_bo_cpu(ptr1, BO_SIZE);
> >         igt_assert(memcmp(ptr1, pattern, sizeof(pattern)) == 0);
> >
> >         handle2 = gem_create(fd, size1);
> > -       fill_bo(handle2, BO_SIZE);
> > -       dma_buf_fd2 = prime_handle_to_fd(fd, handle2);
> > +       dma_buf_fd2 = prime_handle_to_fd_for_mmap(fd, handle2);
> >         igt_assert(errno == 0);
> > -       ptr2 = mmap(NULL, size2, PROT_READ, MAP_SHARED, dma_buf_fd2, 0);
> > +       ptr2 = mmap(NULL, size2, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd2, 0);
> >         igt_assert(ptr2 != MAP_FAILED);
> > +       /* Prevent gem_set_domain -ENOMEM failures when pwrite is not available */
> > +       if (gem_has_pwrite(fd))
> > +               fill_bo(handle2, BO_SIZE);
> > +       else
> > +               fill_bo_cpu(ptr2, BO_SIZE);
> >         igt_assert(memcmp(ptr2, pattern, sizeof(pattern)) == 0);
> >
> >         igt_assert(memcmp(ptr1, ptr2, BO_SIZE) == 0);
> > --
> > 2.31.1
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
