Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096AC89D6C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Dec 2020 15:21:49 +0000 (UTC)
Date: Wed, 2 Dec 2020 20:47:33 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20201202151733.GA12107@arjun-NUC8i7BEH>
References: <20201130020302.24843-1-arjun.melkaveri@intel.com>
 <b9ce71e8-ef37-1b8d-094a-3f43a813089f@linux.intel.com>
 <160673117719.5723.1339994628703260139@build.alporthouse.com>
 <4cb91c29-13d0-3e6c-0270-aee74a2189bb@linux.intel.com>
 <20201202110522.GA8104@arjun-NUC8i7BEH>
 <160690855195.15588.13284261108008757864@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160690855195.15588.13284261108008757864@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] gem_exec_reloc & gem_shrink: Added
 gem_require_mappable_ggtt to check mappable aperture
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, tvrtko.ursulin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 02, 2020 at 11:29:11AM +0000, Chris Wilson wrote:
> Quoting Melkaveri, Arjun (2020-12-02 11:05:23)
> > On Mon, Nov 30, 2020 at 12:09:10PM +0000, Tvrtko Ursulin wrote:
> > > 
> > > On 30/11/2020 10:12, Chris Wilson wrote:
> > > > Quoting Tvrtko Ursulin (2020-11-30 10:04:17)
> > > > > On 30/11/2020 02:03, Arjun Melkaveri wrote:
> > > > > > Added gem_require_mappable_ggtt to check mappable aperture.
> > > > > > This is to avoid any test crash that might happen
> > > > > > if mappable aperture is not avilable.
> > > > > > 
> > > > > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > > > > > ---
> > > > > >    tests/i915/gem_exec_reloc.c | 3 +++
> > > > > >    tests/i915/gem_shrink.c     | 2 ++
> > > > > >    2 files changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> > > > > > index 8dcb24a6..596b1157 100644
> > > > > > --- a/tests/i915/gem_exec_reloc.c
> > > > > > +++ b/tests/i915/gem_exec_reloc.c
> > > > > > @@ -1217,6 +1217,7 @@ igt_main
> > > > > >                        if (!(f->flags & NORELOC)) {
> > > > > >                                igt_subtest_f("%srange%s",
> > > > > >                                              f->basic ? "basic-" : "", f->name) {
> > > > > > +                                     gem_require_mappable_ggtt(fd);
> > > > > 
> > > > >   From the code and commit message it is not immediately obvious to me
> > > > > why basic_range needs the aperture, Chris? Answer to that will drive the
> > > > > solution.
> > > > 
> > > > It does not.
> > > 
> > > Okay, so the plan for this one should be to stop probing aperture size and
> > > instead probe the size of the address space in use. This will be ggtt on old
> > > gens and ppgtt on new ones. And to keep object count in check with regards
> > > to available backing store, if required (not sure right now).
> > Let me know if this is okay 
> > #define MAX_47b ((1ull << 47)) // address range's most signifcant bit. 
> > const uint64_t max = (AT_LEAST_GEN(devid, 8) ? MAX_47b : gem_aperture_size(i915) / 2); 
> > instead of checking gem_require_mappable_ggtt in subtest .
> 
> Where are you getting the impression that basic_range() uses the
> mappable aperture?
my bad , i'll send  patch only for gem_shrink that uses
gem_require_mappable_ggtt.

I was in doubt if aperture is not supported ,  gem_aperture_size would
return 0 . something like on dg1.

I got to know that gem_aperture_size, it would return gtt address space size.
Will withdraw this changes .

Thanks 
-Arjun 

> 
> > > > > > diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> > > > > > index dba62c8f..094975af 100644
> > > > > > --- a/tests/i915/gem_shrink.c
> > > > > > +++ b/tests/i915/gem_shrink.c
> > > > > > @@ -432,6 +432,8 @@ igt_main
> > > > > >                fd = drm_open_driver(DRIVER_INTEL);
> > > > > >                igt_require_gem(fd);
> > > > > > +             gem_require_mappable_ggtt(fd);
> > > > > > +
> > > > > >                /*
> > > > > >                 * Spawn enough processes to use all memory, but each only
> > > > > >                 * uses half the available mappable aperture ~128MiB.
> > > > > > 
> > > > > 
> > > > > And for this one the same I think. Apart from the subtests using
> > > > > mmap-gtt other ones could probably be made work by calculating the
> > > > > working set in a different way. Possibly just use the ggtt size and skip
> > > > > tests which need aperture if no aperture. Chris would that be acceptable
> > > > > or there is a special reason to have N clients with each using an
> > > > > aperture sized amount of memory, to total RAM size?
> > > > 
> > > > shrink is system memory limits.
> > > 
> > > Yes, I was ignoring that aspect for now and focusing on the aperture size
> > > misuse. But yes, making gem_shrink falsely pass on dg1 is not what we really
> > > want. Probably make it explicitly use system memory objects once that API is
> > > available.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > Any suggestion for this ?  can we use gem_require_mappable_ggtt as all
> > tests use size from gem_mappable_aperture_size. or can i modify code 
> > something like this 
> > #define MAX_32b ((1ull << 32))
> 
> More conservative; use the 128MiB that I mention in the comments.
> The goal is to have many processes pushing the system to the edge so
> that there is plenty of contention on the shrinker. Being specifically a
> shrinker test, they should remain smem objects.
> -Chris
Will modify this to use 128 MiB .
Thanks 
Arjun 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
