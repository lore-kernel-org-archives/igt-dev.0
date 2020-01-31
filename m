Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 31 Jan 2020 15:56:16 +0100
Message-ID: <8594269.vUTOBfTAz2@jkrzyszt-desk.ger.corp.intel.com>
In-Reply-To: <158048142584.2430.6713808810476573778@skylake-alporthouse-com>
References: <20200131131234.23058-1-janusz.krzysztofik@linux.intel.com>
 <20200131131234.23058-2-janusz.krzysztofik@linux.intel.com>
 <158048142584.2430.6713808810476573778@skylake-alporthouse-com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC PATCH i-g-t 1/1] tests/gem_mmap_offset: Exercise
 mapping to userptr
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, January 31, 2020 3:37:05 PM CET Chris Wilson wrote:
> Quoting Janusz Krzysztofik (2020-01-31 13:12:34)
> > Creating a mapping to a userptr backed GEM object may cause a currently
> > unavoidable lockdep splat inside the i915 driver.  Then, such operation
> > is expected to fail to prevent from that badness to happen.
> > 
> > Add a respective subtest for each mapping type.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  tests/i915/gem_mmap_offset.c | 55 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> > 
> > diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> > index 7c4088cdf..a5f28328b 100644
> > --- a/tests/i915/gem_mmap_offset.c
> > +++ b/tests/i915/gem_mmap_offset.c
> > @@ -141,6 +141,36 @@ static void bad_extensions(int i915)
> >         gem_close(i915, arg.handle);
> >  }
> >  
> > +static bool has_userptr(int i915)
> > +{
> > +       uint32_t handle = 0;
> > +       void *ptr;
> > +
> > +       igt_assert_eq(posix_memalign(&ptr, 4096, 4096), 0);
> > +       if (__gem_userptr(i915, ptr, 4096, 0, 0, &handle) == 0)
> > +               gem_close(i915, handle);
> > +       free(ptr);
> > +
> > +       return handle;
> > +}
> > +
> > +static void userptr(int i915, uint64_t flags)
> > +{
> > +       struct drm_i915_gem_mmap_offset arg = {
> > +               .flags = flags,
> > +       };
> > +       void *ptr;
> > +
> > +       igt_assert_eq(posix_memalign(&ptr, 4096, 4096), 0);
> > +
> > +       gem_userptr(i915, ptr, 4096, 0, 0, &arg.handle);
> > +
> > +       igt_assert_eq(mmap_offset_ioctl(i915, &arg), -EINVAL);
> 
> Not quite. The only reason it doesn't work is because the implementation
> ties itself into knots, not that it is meant to not work. :|

Are you suggesting the test should fail if the IOCTL fails?  That would be 
fair, but how are we going to have that accepted by CI then, and merged?

Skipping also doesn't seem a good option to me.

I can add some more exhaustive examination should the IOCTL succeed, but that 
won't help to make CI happy.

From your long experience, what approach should we take?

Thanks,
Janusz


> -Chris
> 




_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
