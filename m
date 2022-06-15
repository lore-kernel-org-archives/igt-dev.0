Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28F010E80A
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 14:29:13 +0000 (UTC)
Date: Wed, 15 Jun 2022 17:27:06 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Message-ID: <YqnsOsLTZzHOZnQW@platvala-desk.ger.corp.intel.com>
References: <20220615054146.1175662-1-priyanka.dandamudi@intel.com>
 <Yql+c50Ppwc8j0SH@platvala-desk.ger.corp.intel.com>
 <DM6PR11MB4492BA2AA8E5F425989AA80C8DAD9@DM6PR11MB4492.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4492BA2AA8E5F425989AA80C8DAD9@DM6PR11MB4492.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH] tests/i915/i915_module_load: Test resizable
 bar support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 02:20:17PM +0300, Dandamudi, Priyanka wrote:
> 
> 
> > -----Original Message-----
> > From: Latvala, Petri <petri.latvala@intel.com>
> > Sent: 15 June 2022 12:09 PM
> > To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Cc: Auld, Matthew <matthew.auld@intel.com>; igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH] tests/i915/i915_module_load: Test resizable bar
> > support
> >
> > On Wed, Jun 15, 2022 at 11:11:46AM +0530, priyanka.dandamudi@intel.com
> > wrote:
> > > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > >
> > > New test named resize bar has been added which tests whether bar gets
> > > resized with different supported sizes.
> > >
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > ---
> > >  tests/i915/i915_module_load.c | 64
> > > +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 64 insertions(+)
> > >
> > > diff --git a/tests/i915/i915_module_load.c
> > > b/tests/i915/i915_module_load.c index f5f98acc2..b334ef612 100644
> > > --- a/tests/i915/i915_module_load.c
> > > +++ b/tests/i915/i915_module_load.c
> > > @@ -37,6 +37,9 @@
> > >  #include "igt_sysfs.h"
> > >  #include "igt_core.h"
> > >
> > > +#define BAR_SIZE_SHIFT 20
> > > +#define BYTE 1024
> > > +
> > >  IGT_TEST_DESCRIPTION("Tests the i915 module loading.");
> > >
> > >  static void store_all(int i915)
> > > @@ -236,6 +239,28 @@ hda_dynamic_debug(bool enable)
> > >     fclose(fp);
> > >  }
> > >
> > > +static int driver_load_unload(struct drm_i915_query_memory_regions
> > > +**regions, uint32_t lmem_bar_size) {
> > > +   int i915 = -1;
> > > +   char lmem_bar[64];
> > > +
> > > +   igt_i915_driver_unload();
> > > +   if (lmem_bar_size == 0)
> > > +           igt_assert_eq(igt_i915_driver_load(NULL), 0);
> > > +   else {
> > > +           sprintf(lmem_bar, "lmem_bar_size=%u", lmem_bar_size);
> > > +           igt_assert_eq(igt_i915_driver_load(lmem_bar), 0);
> > > +   }
> > > +
> > > +   i915 = __drm_open_driver(DRIVER_INTEL);
> > > +   igt_require_fd(i915);
> > > +   igt_require(gem_has_lmem(i915));
> > > +   *regions = gem_get_query_memory_regions(i915);
> > > +   igt_require(*regions);
> > > +
> > > +   return i915;
> > > +}
> > > +
> > >  igt_main
> > >  {
> > >     igt_describe("Verify the basic functionality of i915 driver after
> > > it's reloaded."); @@ -286,5 +311,44 @@ igt_main
> > >             /* inject_fault() leaves the module unloaded */
> > >     }
> > >
> > > +   igt_subtest("resize-bar") {
> > > +           struct drm_i915_query_memory_regions *regions;
> > > +           struct drm_i915_memory_region_info *region;
> > > +           uint32_t lmem_bar_size;
> > > +           uint32_t small_bar;
> > > +           bool bar_check = false;
> > > +           int i915 = -1;
> > > +
> > > +           i915 = driver_load_unload(&regions, 0);
> >
> > Before the unload, do this:
> >
> > i915 = drm_open_driver(DRIVER_INTEL);
> > igt_require(gem_has_lmem(i915);
> > close(i915);
> >
> [Dandamudi, Priyanka]
> The above work iam doing in driver_load_unload method.

There the check is done after the unload. What I want is checking for
lmem before unload so we can avoid the unload, on integrated.

> 
> > That way we can avoid an unnecessary reload cycle on integrated.
> >
> > Which kernel version has the lmem_bar_size parameter? You might want to
> > check its existence too. gem_lmem_swapping has an example of how it's done,
> > with the param "lmem_size".
> >
> >
> > --
> > Petri Latvala
> >
> [Dandamudi, Priyanka]
> lmem_size will also allow to resize the bar eg:62MB which is not expected as 256MB is the minimum size.
> lmem_bar_size is a new modparam which is being added from the driver side to test different supported sizes.

Yes, I didn't mean to use the same modparam. I meant to handle
checking for existence in the same way it's done for that other param.


-- 
Petri Latvala


> >
> >
> > > +
> > > +           for (unsigned int i = 0; i < (regions)->num_regions; i++)
> > > +                   for_each_if(((region) = &(regions)->regions[i])-
> > >region.memory_class == I915_MEMORY_CLASS_DEVICE) {
> > > +                           lmem_bar_size = ceil((float)(region-
> > >probed_size >> BAR_SIZE_SHIFT)/BYTE)*BYTE;
> > > +                           small_bar = (region->rsvd1[0] >>
> > BAR_SIZE_SHIFT);
> > > +                           if (small_bar < lmem_bar_size)
> > > +                                   bar_check = true;
> > > +                   }
> > > +           while (lmem_bar_size >= 256) {
> > > +
> > > +                   close(i915);
> > > +
> > > +                   i915 = driver_load_unload(&regions, lmem_bar_size);
> > > +
> > > +                   for (unsigned int i = 0; i < (regions)->num_regions; i++)
> > > +                           for_each_if(((region) = &(regions)->regions[i])-
> > >region.memory_class == I915_MEMORY_CLASS_DEVICE) {
> > > +                                   igt_assert_f(((region->probed_size >>
> > BAR_SIZE_SHIFT) == lmem_bar_size),
> > > +                                                    "Failed to set bar
> > size");
> > > +                                   if (bar_check)
> > > +                                           igt_assert_f((small_bar ==
> > (region->rsvd1[0] >> BAR_SIZE_SHIFT)),
> > > +                                                            "Small bar is
> > not set properly");
> > > +                                   else
> > > +                                           igt_assert_f(region-
> > >probed_size == region->rsvd1[0], "Small bar and"
> > > +                                                           " lmem bar
> > values need to be same");
> > > +                   }
> > > +           lmem_bar_size = lmem_bar_size >> 1;
> > > +           }
> > > +           igt_i915_driver_unload();
> > > +   }
> > > +
> > >     /* Subtests should unload the module themselves if they use
> > modparams */
> > >  }
> > > --
> > > 2.27.0
> > >
