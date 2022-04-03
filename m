Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D1A10E536
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Apr 2022 09:13:41 +0000 (UTC)
Date: Sun, 3 Apr 2022 11:13:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YkllQSaw7iPvHfDc@zkempczy-mobl2>
References: <20220401113850.78872-1-zbigniew.kempczynski@intel.com>
 <164881851588.27152.582935018336090847@build.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <164881851588.27152.582935018336090847@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_gttfill: Reenable
 test for discrete
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

On Fri, Apr 01, 2022 at 02:08:35PM +0100, Chris Wilson wrote:
> Quoting Zbigniew Kempczyński (2022-04-01 12:38:50)
> > Test was turned off unnecessarily for discrete so add softpinning to
> > it and enable it again. Parallel execution on different engines and
> > same vm is thus limited to 4GiB (in userspace we don't have control
> > when same offset would be used for different handles on different
> > engines so we don't want to get -ENOSPC for such situation).
> > 
> > Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4086
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/i915/gem_exec_gttfill.c | 40 +++++++++++++++++++++++++++++------
> >  1 file changed, 34 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> > index f16428714d..74974d324e 100644
> > --- a/tests/i915/gem_exec_gttfill.c
> > +++ b/tests/i915/gem_exec_gttfill.c
> > @@ -33,6 +33,7 @@ IGT_TEST_DESCRIPTION("Fill the GTT with batches.");
> >  struct batch {
> >         uint32_t handle;
> >         void *ptr;
> > +       uint64_t offset;
> >  };
> >  
> >  static void xchg_batch(void *array, unsigned int i, unsigned int j)
> > @@ -45,7 +46,7 @@ static void xchg_batch(void *array, unsigned int i, unsigned int j)
> >         batches[j] = tmp;
> >  }
> >  
> > -static void submit(int fd, int gen,
> > +static void submit(int fd, uint64_t ahnd, int gen,
> >                    struct drm_i915_gem_execbuffer2 *eb,
> >                    struct drm_i915_gem_relocation_entry *reloc,
> >                    struct batch *batches, unsigned int count)
> > @@ -56,7 +57,7 @@ static void submit(int fd, int gen,
> >  
> >         memset(&obj, 0, sizeof(obj));
> >         obj.relocs_ptr = to_user_pointer(reloc);
> > -       obj.relocation_count = 2;
> > +       obj.relocation_count = !ahnd ? 2 : 0;
> >  
> >         memset(reloc, 0, 2*sizeof(*reloc));
> >         reloc[0].offset = eb->batch_start_offset;
> > @@ -93,7 +94,17 @@ static void submit(int fd, int gen,
> >                 reloc[0].target_handle = obj.handle;
> >                 reloc[1].target_handle = obj.handle;
> >  
> > -               obj.offset = 0;
> > +               if (ahnd) {
> > +                       uint32_t *delta_ptr = batches[i].ptr + reloc[0].delta;
> > +
> > +                       *delta_ptr = batches[i].offset;
> > +                       batch[1] = batches[i].offset + reloc[0].delta;
> > +                       obj.flags = EXEC_OBJECT_PINNED;
> > +                       obj.offset = batches[i].offset;
> > +                       batch[3] = batches[i].offset;
> > +               } else {
> > +                       obj.offset = 0;
> 
> What is this code?
> 
> You are missing out on
> 
> commit ab0a539f0c723fd86a4d1440ec82004532b0ba22
> Author: Chris Wilson <chris.p.wilson@intel.com>
> Date:   Sat Jul 3 10:12:19 2021 +0000
> 
>     i915/gem_exec_gttfill: Apply relocations inline
> 
>     The goal of gem_exec_gttfill is to watch what happens when we
>     oversaturate the available GTT, and force the kernel to perform buffer
>     evictions from the virtual address space. We do this by submitting a
>     larger working set than we can possibly make resident, but we can still
>     provide locations hints to the kernel for placing the objects, as the
>     addresses will get reused and eviction occur. The eviction will remain
>     randomised on both a single engine, and across the engines, improving
>     our chance of spotting issues, but we will no long require as many
>     relocations.
> 
>     Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
>     Reviewed-by: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>

You're right, I've limited this unnecessarily. Cutting down by 
casting to uint32_t is wrong, because depending on allocator starting
offset I can go beyond 4GiB. 

--
Zbigniew
