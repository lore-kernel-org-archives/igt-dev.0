Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 29 Jul 2021 11:22:28 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YQJlRNd2On/lnBxH@platvala-desk.ger.corp.intel.com>
References: <20210726120310.1115522-1-matthew.auld@intel.com>
 <87fsvznqmj.wl-ashutosh.dixit@intel.com>
 <YQD0aEia7NCsBUrq@platvala-desk.ger.corp.intel.com>
 <87czr151ht.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czr151ht.wl-ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 1/7] lib/i915/gem_mman: add
 FIXED mmap mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 06:53:50PM -0700, Dixit, Ashutosh wrote:
> On Tue, 27 Jul 2021 23:08:40 -0700, Petri Latvala wrote:
> >
> > On Tue, Jul 27, 2021 at 07:01:24PM -0700, Dixit, Ashutosh wrote:
> > > On Mon, 26 Jul 2021 05:03:04 -0700, Matthew Auld wrote:
> > > >
> > > > diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> > > > index 4b4f2114..e2514f0c 100644
> > > > --- a/lib/i915/gem_mman.c
> > > > +++ b/lib/i915/gem_mman.c
> > > > @@ -497,6 +497,43 @@ void *gem_mmap_offset__cpu(int fd, uint32_t handle, uint64_t offset,
> > > >	return ptr;
> > > >  }
> > > >
> > > > +#define LOCAL_I915_MMAP_OFFSET_FIXED 4
> > >
> > > Cc: @Petri Latvala
> > >
> > > This use of LOCAL declarations is more related to the methodology we follow
> > > in IGT rather than this patch. We have seen in the past that such LOCAL's
> > > linger on in the code for months and years till someone decides to clean
> > > them so the question is can we prevent these LOCAL's from getting
> > > introduced in the first place.
> > >
> > > One reason for these is that we sync IGT headers with drm-next whereas IGT
> > > is used to test drm-tip. So the delta between the two results in such
> > > LOCAL's as in this case.
> > >
> > > My proposal is that even if we don't start sync'ing IGT headers with
> > > drm-tip (instead of drm-next) we allow direct modification of the headers
> > > when needed to avoid introducing such LOCAL's. So in the above case we
> > > would add:
> > >
> > > #define I915_MMAP_OFFSET_FIXED 4
> > >
> > > to i915_drm.h as part of this patch and then just use
> > > I915_MMAP_OFFSET_FIXED. If another sync happens from drm-next before this
> > > #define has appeared there, the compile will break and whoever syncs will
> > > need to add this again to i915_drm.h.
> >
> > I don't like that kind of a breakage at all. That enforces mandatory
> > fixups to some poor developer working on unrelated code who doesn't
> > necessarily know how to even fix it easily.
> >
> > Of course an argument can be made that it's an i915 token in an i915
> > header so it will be the i915 people doing it, but for a general case
> > that's going to cause more harm than it solves problems, I feel.
> 
> OK, let's not change anything with the headers we import for now.
> 
> > > What do people think about a scheme such as this? The other, perhaps
> > > better, option of course is to sync the headers directly with drm-tip
> > > (whenever and as often as needed). But the goal in both cases is to avoid
> > > LOCAL's, or other things like #ifndef's distributed throughout multiple
> > > source files which we also do in such cases. A centralized internal header
> > > to contain such declarations might not be so bad. Thanks.
> >
> > A separate manually written header for new tokens that are not yet in
> > drm-next might be the least bad of all options. Although now that I've
> > said it, the perfect world would have new tokens done like this:
> >
> > #ifndef I915_MMAP_OFFSET_FIXED
> > #define I915_MMAP_OFFSET_FIXED 4
> > #else
> > _Static_assert(I915_MMAP_OFFSET_FIXED == 4, "ABI broken, yikes");
> > #endif
> >
> > In a different language wrapping all that in a
> >
> > MAYBE_DECLARE(I915_MMAP_OFFSET_FIXED, 4)
> >
> > might be easier but with C preprocessor it's a bit more... involved. A
> > separate build-time script to generate that header maybe? Such a
> > script could also just completely omit the definition if header copies
> > already introduce the token.
> 
> IMO all this wouldn't do much more that what gcc already does. For example,
> for this:
> 
> #define I915_MMAP_OFFSET_FIXED 4
> #define I915_MMAP_OFFSET_FIXED 4
> 
> gcc silently ignores the second #define, whereas for:
> 
> #define I915_MMAP_OFFSET_FIXED 4
> #define I915_MMAP_OFFSET_FIXED 5
> 
> gcc will warn that second I915_MMAP_OFFSET_FIXED is redefined.
> 
> And gcc will error out on things like struct redeclaration.

Ah that's good then!

(For the record, C99 6.10.3 states this is even standard C behaviour)


> 
> > Recap:
> >
> > 1) We have kernel headers copied into IGT to ensure it builds fine
> > without latest-and-greatest headers installed on the system.
> >
> > 2) Copies are from drm-next to ensure the next person to copy the
> > headers doesn't accidentally drop definitions that originate from a
> > vendor-specific tree. (That same reason is also for why one shouldn't
> > edit the headers manually)
> >
> > 3) To get to drm-next, the kernel code needs to be tested with IGT
> > first, so we need new definitions to test that kernel code in some
> > form.
> 
> I guess it is possible to test with "Test-with:" and merge the kernel
> changes first and the IGT changes later with the correct headers but maybe
> it's inconvenient? But don't we merge the kernel changes before IGT?

Merge rules for kernel vs. userspace is like that, yes. But IGT
doesn't count as userspace for those rules and merging order can be
more relaxed.


> 
> > 4) LOCAL_* definitions that are cleaned up later when actual
> > definitions reach drm-next sounds good in theory but in practice the
> > cleaning part is often forgotten.
> >
> > Either way, I think the code using new definitions should use the
> > intended final names so we should just entirely drop the practice of
> > declaring anything LOCAL_*. That way the cleanup is limited to one
> > place.
> 
> In any case, any thoughts about the i915_drm_local.h patch I posted:
> 
> https://patchwork.freedesktop.org/series/93096/
> 
> I am not asking for any other changes to anything at this this point. I
> have also started asking people to not use the LOCAL_ or local_ prefix any
> more in code reviews. But I probably still prefer that these declarations
> move to a central place such as i915_drm_local.h if possible so it's easier
> to clean them up later. Thanks.

Going to reply on that patch in a bit.


-- 
Petri Latvala
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
