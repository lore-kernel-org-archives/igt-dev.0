Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0716E088
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Jul 2021 18:51:23 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Sat, 24 Jul 2021 17:43:45 +0000
Message-ID: <BY5PR11MB4372867B10B2C04D8AE4834A89E69@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210723093548.22273-1-vidya.srinivas@intel.com>
 <87v9519chq.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87v9519chq.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms: Return false in gem_has_lmem
 for platforms not having LMEM support
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Joshi,
 Kunal1" <kunal1.joshi@intel.com>, "Lin, Charlton" <charlton.lin@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Friday, July 23, 2021 10:47 PM
> To: Srinivas, Vidya <vidya.srinivas@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Joshi, Kunal1 <kunal1.joshi@intel.com>;
> Latvala, Petri <petri.latvala@intel.com>; Heikkila, Juha-pekka <juha-
> pekka.heikkila@intel.com>; Lin, Charlton <charlton.lin@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms: Return false in gem_has_lmem
> for platforms not having LMEM support
> 
> On Fri, 23 Jul 2021 02:35:48 -0700, Vidya Srinivas wrote:
> >
> > Starting commit (tests/kms: Create buffer object from LMEM for
> > discrete) it checks for LMEM. But this is breaking older kernels like
> > 5.4 without DRM_I915_QUERY_MEMORY_REGIONS support. This causes
> > item.length filled from IOCTL to be < 0 and gives segmentation fault.
> > Another way to fix is check for NULL query in
> > gem_get_lmem_region_count and return false.
> >
> > Patch returns false from gem_has_lmem for obvious platforms which dont
> > have LMEM support and also adds the check for NULL query in
> > gem_get_lmem_region_count.
> >
> > Signed-off-by: Lin Charlton <charlton.lin@intel.com>
> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > ---
> >  lib/i915/intel_memory_region.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/lib/i915/intel_memory_region.c
> > b/lib/i915/intel_memory_region.c index 144ae12ca7a0..635c21ab3765
> > 100644
> > --- a/lib/i915/intel_memory_region.c
> > +++ b/lib/i915/intel_memory_region.c
> > @@ -143,6 +143,10 @@ uint8_t gem_get_lmem_region_count(int fd)
> >	uint8_t lmem_regions = 0;
> >
> >	query_info = gem_get_query_memory_regions(fd);
> > +
> > +	if (!query_info)
> > +		return 0;
> 
> From the code doesn't look like this works.
> 
> > +
> >	num_regions = query_info->num_regions;
> >
> >	for (int i = 0; i < num_regions; i++) {  @@ -164,6 +168,9 @@ uint8_t
> >gem_get_lmem_region_count(int fd)
> >   */
> >  bool gem_has_lmem(int fd)
> >  {
> > +	if (intel_display_ver(intel_get_drm_devid(fd) < 12) ||
> > +		IS_ALDERLAKE_P(intel_get_drm_devid(fd)) ||
> IS_TIGERLAKE(intel_get_drm_devid(fd)))
> > +		return false;
> 
> No platform checks. Check if DRM_I915_QUERY_MEMORY_REGIONS is not
> supported and in that case return 0 from gem_get_lmem_region_count.

Thank you Ashutosh. Maybe we should just make our kernel return
Error. Right now that is missing. Then we wont need this patch.
I had submitted v3. But we can ignore that maybe. Sorry.

> 
> >	return gem_get_lmem_region_count(fd) > 0;
> >  }
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
