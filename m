Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <2cfd56bbd82abeba251ad38d7dd9830f8e503e68.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 25 Feb 2020 16:41:28 +0100
In-Reply-To: <158229528380.6499.10205591790332300594@skylake-alporthouse-com>
References: <20200221111701.30006-1-janusz.krzysztofik@linux.intel.com>
 <20200221111701.30006-3-janusz.krzysztofik@linux.intel.com>
 <158229528380.6499.10205591790332300594@skylake-alporthouse-com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [RFC PATCH i-g-t v2 2/2]
 tests/gem_userptr_blits: Exercise mmap-offset mapping to userptr
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

On Fri, 2020-02-21 at 14:28 +0000, Chris Wilson wrote:
> Quoting Janusz Krzysztofik (2020-02-21 11:17:01)
> > Currently unavoidable lockedp loop related to userptr MMU notifier
> > exists in the i915 driver.  For that reason, attempts to set up a
> > mmap-offset (or mmap-gtt) mapping to a userptr object may be now
> > preventively rejected by the driver.
> > 
> > A test should exists which checks for that.  Would a mapping
> > attempt
> > succeed, the test should trigger the MMU notifier in a way that is
> > proven to result in the lockdep slpat.
> > 
> > As that exercise is strictly userptr related, it has been decided
> > to
> > add it as a new subtest to gem_userptr_blits.  The new subtest
> > examines
> > userptr interaction with every supported mmap-offset type mapping
> > on
> > top of it.
> > 
> > v2: Move the subtest from gem_mmap_offset to gem_userptr_blits,
> >   - use dynamic subtests (Chris),
> >   - don't FAIL but SKIP on mmap-offset attempt failure (Chris),
> >   - on success, try to anger lockdep (Chris).
> > 
> > Suggested-by: Chris Wilson <chris@chris-wilson.co.uk
> > Signed-off-by: Janusz Krzysztofik <
> > janusz.krzysztofik@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> > In order to be able to prove the proposed method of angering
> > lockdep
> > actually works,  I'm going to submit a kernel patch that reverts
> > commit
> > f6c26b555e14 ("drm/i915: Never allow userptr into the new mapping
> > types") to be tested on Trybot together with this one, so at least
> > non-GTT mmap-offset attempts succeed and the MMU notifier is
> > triggered.
> > 
> > Thanks,
> > Janusz
> > 
> >  tests/i915/gem_userptr_blits.c | 42
> > ++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/tests/i915/gem_userptr_blits.c
> > b/tests/i915/gem_userptr_blits.c
> > index fcad374ef..5f716a3ea 100644
> > --- a/tests/i915/gem_userptr_blits.c
> > +++ b/tests/i915/gem_userptr_blits.c
> > @@ -797,6 +797,42 @@ static int test_map_fixed_invalidate(int fd,
> > uint32_t flags)
> >         return 0;
> >  }
> >  
> > +static void test_mmap_offset_invalidate(int fd, const struct
> > mmap_offset *t)
> > +{
> > +       void *ptr, *map;
> > +       uint32_t handle;
> > +
> > +       /* check if mmap_offset type is supported by hardware, skip
> > if not */
> > +       handle = gem_create(fd, PAGE_SIZE);
> > +       map = __gem_mmap_offset(fd, handle, 0, PAGE_SIZE,
> > +                               PROT_READ | PROT_WRITE, t->type);
> > +       igt_require_f(map,
> > +                     "HW & kernel support for mmap_offset(%s)\n",
> > t->name);
> > +       munmap(map, PAGE_SIZE);
> > +       gem_close(fd, handle);
> > +
> > +       /* create userptr object */
> > +       igt_assert_eq(posix_memalign(&ptr, PAGE_SIZE, PAGE_SIZE),
> > 0);
> > +       gem_userptr(fd, ptr, PAGE_SIZE, 0, userptr_flags, &handle);
> > +
> > +       /* set up mmap-offset mapping on top of the object, skip if
> > refused */
> > +       map = __gem_mmap_offset(fd, handle, 0, PAGE_SIZE,
> > +                               PROT_READ | PROT_WRITE, t->type);
> > +       igt_skip_on_f(!map && errno == -ENODEV,

errno should be compared against a positive value, sorry for that bug.
Thanks for fixing it and merging.

Janusz


> > +                     "lockdep loop preventive failure possibly
> > occurred\n");
> 
> s/possibly occurred//
> 
> It's taken for granted that we don't know exactly why the kernel
> rejected the call (though if we had tracefs hooked up, we should be
> including that information there) just that it falls under our
> blanket
> incompatible device errno.
> 
> > +       igt_assert(map);
> 
> Ok, looks future proof.
> 
> > +       /* set object pages in order to activate MMU notifier for
> > it */
> > +       gem_set_domain(fd, handle, t->domain, t->domain);
> 
> I would suggest (a variant?) that also attached a igt_spin_t to the
> userptr,
> waited for it to start executing, call igt_spin_set_timeout and then
> do
> the munmap.
> 
> > +       /* trigger the notifier */
> > +       munmap(ptr, PAGE_SIZE);
> > +
> > +       /* cleanup */
> > +       munmap(map, PAGE_SIZE);
> > +       gem_close(fd, handle);
> > +}
> 
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> -Chris

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
