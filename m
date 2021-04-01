Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3BA6ECAA
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 21:11:28 +0000 (UTC)
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Date: Thu, 1 Apr 2021 21:11:26 +0000
Message-ID: <35c3935b88ae45128d2eb5364568a2e2@intel.com>
References: <20210330035056.52019-1-ashutosh.dixit@intel.com>
 <CAM0jSHPXQZFJwa0DQOgyvK-Qjq9_meEzCL11joYqkve+MTS9cA@mail.gmail.com>
 <87eefwo2u6.wl-ashutosh.dixit@intel.com>
 <CAM0jSHMVxXuEAhO=GMaxTLqabqhyfKZu+mJzDG6nu98T6OMAUg@mail.gmail.com>
 <87czve6ddn.wl-ashutosh.dixit@intel.com>
 <0017f3d76967407f953f447414b9d3ae@intel.com>
 <878s61x0vy.wl-ashutosh.dixit@intel.com>
In-Reply-To: <878s61x0vy.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
MIME-Version: 1.0
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
>Sent: Thursday, April 1, 2021 3:26 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: Matthew Auld <matthew.william.auld@gmail.com>; igt-
>dev@lists.freedesktop.org
>Subject: Re: [igt-dev] [PATCH i-g-t] i915: Avoid set_domain -ENOMEM error
>with huge buffers
>
>On Thu, 01 Apr 2021 05:49:29 -0700, Ruhl, Michael J wrote:
>>
>> >-----Original Message-----
>> >From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
>> >Sent: Wednesday, March 31, 2021 8:46 PM
>> >To: Matthew Auld <matthew.william.auld@gmail.com>
>> >Cc: igt-dev@lists.freedesktop.org; Ruhl, Michael J
><michael.j.ruhl@intel.com>
>> >Subject: Re: [igt-dev] [PATCH i-g-t] i915: Avoid set_domain -ENOMEM
>error
>> >with huge buffers
>> >
>> >On Wed, 31 Mar 2021 02:02:45 -0700, Matthew Auld wrote:
>> >> On Tue, 30 Mar 2021 at 20:31, Dixit, Ashutosh
><ashutosh.dixit@intel.com>
>> >wrote:
>> >> >
>> >> > On Tue, 30 Mar 2021 03:28:01 -0700, Matthew Auld wrote:
>> >> > >
>> >> > > On Tue, 30 Mar 2021 at 04:51, Ashutosh Dixit
>> ><ashutosh.dixit@intel.com> wrote:
>> >> > > >
>> >> > > > When pread/pwrite are unavailable, the pread/pwrite replacement
>> >implemented
>> >> > > > in ad5eb02eb3f1 ("lib/ioctl_wrappers: Keep IGT working without
>> >pread/pwrite
>> >> > > > ioctls") uses gem_set_domain which pins all pages which have to be
>> >> > > > read/written. When the read/write size is large this causes
>> >gem_set_domain
>> >> > > > to return -ENOMEM with a trace such as:
>> >> > > >
>> >> > > > ioctl_wrappers-CRITICAL: Test assertion failure function
>> >gem_set_domain, file ../lib/ioctl_wrappers.c:563:
>> >> > > > ioctl_wrappers-CRITICAL: Failed assertion: __gem_set_domain(fd,
>> >handle, read, write) == 0
>> >> > > > ioctl_wrappers-CRITICAL: Last errno: 12, Cannot allocate memory
>> >> > > > ioctl_wrappers-CRITICAL: error: -12 != 0
>> >> > > > igt_core-INFO: Stack trace:
>> >> > > > igt_core-INFO:   #0 ../lib/igt_core.c:1746 __igt_fail_assert()
>> >> > > > igt_core-INFO:   #1 [gem_set_domain+0x44]
>> >> > > > igt_core-INFO:   #2 ../lib/ioctl_wrappers.c:367 gem_write()
>> >> > > > igt_core-INFO:   #3 ../tests/prime_mmap.c:67 test_aperture_limit()
>> >> > > > igt_core-INFO:   #4 ../tests/prime_mmap.c:578 __real_main530()
>> >> > > > igt_core-INFO:   #5 ../tests/prime_mmap.c:530 main()
>> >> > > >
>> >> > > > Therefore avoid using the pread/pwrite replacement for huge
>buffers,
>> >mmap
>> >> > > > and write instead. This fixes failures seen in
>> >> > > > prime_mmap@test_aperture_limit and
>gem_exec_params@larger-
>> >than-life-batch
>> >> > > > when pread/pwrite are unavailable.
>> >> > > >
>> >> > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> >> > > > ---
>> >> > > >  tests/i915/gem_exec_params.c |  5 ++++-
>> >> > > >  tests/prime_mmap.c           | 33 ++++++++++++++++++++++---------
>--
>> >> > > >  2 files changed, 26 insertions(+), 12 deletions(-)
>> >> > > >
>> >> > > > diff --git a/tests/i915/gem_exec_params.c
>> >b/tests/i915/gem_exec_params.c
>> >> > > > index 6840cf40ce..613bc26485 100644
>> >> > > > --- a/tests/i915/gem_exec_params.c
>> >> > > > +++ b/tests/i915/gem_exec_params.c
>> >> > > > @@ -254,9 +254,12 @@ static uint32_t batch_create_size(int fd,
>> >uint64_t size)
>> >> > > >  {
>> >> > > >         const uint32_t bbe = MI_BATCH_BUFFER_END;
>> >> > > >         uint32_t handle;
>> >> > > > +       char *ptr;
>> >> > > >
>> >> > > >         handle = gem_create(fd, size);
>> >> > > > -       gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>> >> > > > +       ptr = gem_mmap__device_coherent(fd, handle, 0,
>sizeof(bbe),
>> >PROT_WRITE);
>> >> > > > +       memcpy(ptr, &bbe, sizeof(bbe));
>> >> > > > +       munmap(ptr, sizeof(bbe));
>> >> > >
>> >> > > I thought mmap_offfset still just pins all the pages on fault, so
>> >> > > why don't we still hit -ENOMEM somewhere?
>> >> >
>> >> > Sorry I think this statement in the commit message is what has
>> >> > caused the confusion, it's just badly written: "gem_set_domain which
>> >> > pins all pages which have to be read/written". set_domain doesn't
>> >> > just pin all pages > >which have to read/written but actually pins
>> >> > the entire object. Does this explain the reason now?
>> >> >
>> >> > I would assume mmap_offset would only fault in the required pages.
>> >>
>> >> mmap_offset still calls pin_pages()/get_pages() somewhere in the fault
>> >> handler, which is for the entire object. In i915 all we currently have
>> >> is pin-all-the-pages when we need to touch the pages, but if it's a
>> >> shmem object then it's possible to use the page-cache underneath to
>> >> populate individual pages in the shmem file, like in the shmem_pwrite
>> >> backend, and gem_mmap__cpu/wc which uses shmem_fault IIRC.
>> >
>> >Thanks, I was not aware of this difference between mmap and
>mmap_offset
>> >but glancing through the code this indeed seems to be the case. I have
>> >changed to gem_mmap__wc in v3.
>>
>> Hi Ashutosh,
>>
>> All of the gem_mmap (_GTT, _WC, etc) functions map to a faulting routing
>> that will pin all the pages.
>
>Hi Mike, is that true? As Matt mentioned above and I glanced through the
>code too, it seems gem_mmap__cpu/wc will not pin the entire object
>whereas
>gem_mmap_offset__cpu/wc will (the pinning happens in vm_fault_cpu fault
>handler installed by gem_mmap_offset__cpu/wc). For the
>gem_mmap__cpu/wc to
>me it is not obvious what the fault handler is, all I see is the code in
>i915_gem_mmap_ioctl.

Hi Ashutosh,

Looking at the DII IGT source code, I see this:

All of the IGT mmap code does something like this:

if (gem_has_lmem(fd) && gem_has_mmap_offset(fd))
	return __gem_mmap_offset(fd, handle, offset, size, prot, I915_MMAP_OFFSET_WC);
else
	return __gem_mmap(fd, handle, offset, size, prot, 0);

The _OFFSET path will pin the pages, the non-offset path will not.

So if your card supports offset (gtt version which is hardwired to 4), you will
use the offset path.

Maybe the upstream code doesn't have this?  and you take the __gem_mmap
path?

>Of course Matt is discussing the gem_exec_params@larger-than-life-batch
>failure whereas below you are discussing prime_mmap@test_aperture_limit
>failure below.
>
>Also this patch /has/ resolved both the -ENOMEM errors which were seen
>with gem_exec_params@larger-than-life-batch and
>prime_mmap@test_aperture_limit.

Your fix is actually using the dma-buf mmap interface, not the gem mmap interface.

So you are going down a different path.  The dma-buf mmap has a mechanism similar
to the non-offset path for mmap.

Mike

>Thanks.
>--
>Ashutosh
>
>> I think that we need to find out where the ENOMEM is really coming from.
>>
>> Is it possible that the ENOMEM is occurring on the second BO because it
>> can't get enough pages to pin the buffer?  I.e. is the shrinker supposed
>> to come into play here and get enough pages from the first buffer, but
>> fails?  (or is that an ENOSPC error?)
>>
>> Mike
>>
>> >> >
>> >> > > I would have assumed we want gem_mmap__cpu/wc here,
>> >> >
>> >> > My intention is to gem_mmap__device_coherent as a shorthand for
>> >> > gem_mmap__wc (or gem_mmap_offset__wc).
>> >> >
>> >> > > which instead goes through the shmem/page-cache backend, and so
>> >only
>> >> > > needs to allocate the first few pages or so IIRC, similar to the tricks
>> >> > > in the shmem pwrite backend? Or I guess just move the igt_require()
>for
>> >> > > the memory requirements to earlier?
>> >> >
>> >> > Even if we did that I think we might still need to fix the issue with the
>> >> > set_domain pinning the entire object so that's what I'm trying to avoid
>> >> > here with this patch. Thanks.
>> >> >
>> >> > > Or maybe I am misunderstanding something?
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
