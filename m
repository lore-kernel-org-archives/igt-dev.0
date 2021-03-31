Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6392D6EA02
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 09:03:13 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id u8so13901332qtq.12
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 02:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210330035056.52019-1-ashutosh.dixit@intel.com>
 <CAM0jSHPXQZFJwa0DQOgyvK-Qjq9_meEzCL11joYqkve+MTS9cA@mail.gmail.com>
 <87eefwo2u6.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87eefwo2u6.wl-ashutosh.dixit@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 31 Mar 2021 10:02:45 +0100
Message-ID: <CAM0jSHMVxXuEAhO=GMaxTLqabqhyfKZu+mJzDG6nu98T6OMAUg@mail.gmail.com>
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 30 Mar 2021 at 20:31, Dixit, Ashutosh <ashutosh.dixit@intel.com> wrote:
>
> On Tue, 30 Mar 2021 03:28:01 -0700, Matthew Auld wrote:
> >
> > On Tue, 30 Mar 2021 at 04:51, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> > >
> > > When pread/pwrite are unavailable, the pread/pwrite replacement implemented
> > > in ad5eb02eb3f1 ("lib/ioctl_wrappers: Keep IGT working without pread/pwrite
> > > ioctls") uses gem_set_domain which pins all pages which have to be
> > > read/written. When the read/write size is large this causes gem_set_domain
> > > to return -ENOMEM with a trace such as:
> > >
> > > ioctl_wrappers-CRITICAL: Test assertion failure function gem_set_domain, file ../lib/ioctl_wrappers.c:563:
> > > ioctl_wrappers-CRITICAL: Failed assertion: __gem_set_domain(fd, handle, read, write) == 0
> > > ioctl_wrappers-CRITICAL: Last errno: 12, Cannot allocate memory
> > > ioctl_wrappers-CRITICAL: error: -12 != 0
> > > igt_core-INFO: Stack trace:
> > > igt_core-INFO:   #0 ../lib/igt_core.c:1746 __igt_fail_assert()
> > > igt_core-INFO:   #1 [gem_set_domain+0x44]
> > > igt_core-INFO:   #2 ../lib/ioctl_wrappers.c:367 gem_write()
> > > igt_core-INFO:   #3 ../tests/prime_mmap.c:67 test_aperture_limit()
> > > igt_core-INFO:   #4 ../tests/prime_mmap.c:578 __real_main530()
> > > igt_core-INFO:   #5 ../tests/prime_mmap.c:530 main()
> > >
> > > Therefore avoid using the pread/pwrite replacement for huge buffers, mmap
> > > and write instead. This fixes failures seen in
> > > prime_mmap@test_aperture_limit and gem_exec_params@larger-than-life-batch
> > > when pread/pwrite are unavailable.
> > >
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >  tests/i915/gem_exec_params.c |  5 ++++-
> > >  tests/prime_mmap.c           | 33 ++++++++++++++++++++++-----------
> > >  2 files changed, 26 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> > > index 6840cf40ce..613bc26485 100644
> > > --- a/tests/i915/gem_exec_params.c
> > > +++ b/tests/i915/gem_exec_params.c
> > > @@ -254,9 +254,12 @@ static uint32_t batch_create_size(int fd, uint64_t size)
> > >  {
> > >         const uint32_t bbe = MI_BATCH_BUFFER_END;
> > >         uint32_t handle;
> > > +       char *ptr;
> > >
> > >         handle = gem_create(fd, size);
> > > -       gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> > > +       ptr = gem_mmap__device_coherent(fd, handle, 0, sizeof(bbe), PROT_WRITE);
> > > +       memcpy(ptr, &bbe, sizeof(bbe));
> > > +       munmap(ptr, sizeof(bbe));
> >
> > I thought mmap_offfset still just pins all the pages on fault, so why
> > don't we still hit -ENOMEM somewhere?
>
> Sorry I think this statement in the commit message is what has caused the
> confusion, it's just badly written: "gem_set_domain which pins all pages
> which have to be read/written". set_domain doesn't just pin all pages which
> have to read/written but actually pins the entire object. Does this explain
> the reason now?
>
> I would assume mmap_offset would only fault in the required pages.

mmap_offset still calls pin_pages()/get_pages() somewhere in the fault
handler, which is for the entire object. In i915 all we currently have
is pin-all-the-pages when we need to touch the pages, but if it's a
shmem object then it's possible to use the page-cache underneath to
populate individual pages in the shmem file, like in the shmem_pwrite
backend, and gem_mmap__cpu/wc which uses shmem_fault IIRC.

>
> > I would have assumed we want gem_mmap__cpu/wc here,
>
> My intention is to gem_mmap__device_coherent as a shorthand for
> gem_mmap__wc (or gem_mmap_offset__wc).
>
> > which instead goes through the shmem/page-cache backend, and so only
> > needs to allocate the first few pages or so IIRC, similar to the tricks
> > in the shmem pwrite backend? Or I guess just move the igt_require() for
> > the memory requirements to earlier?
>
> Even if we did that I think we might still need to fix the issue with the
> set_domain pinning the entire object so that's what I'm trying to avoid
> here with this patch. Thanks.
>
> > Or maybe I am misunderstanding something?
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
