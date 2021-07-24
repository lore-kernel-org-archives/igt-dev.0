Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93095731A1
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Jul 2021 16:07:37 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Sat, 24 Jul 2021 16:07:34 +0000
Message-ID: <BY5PR11MB437234718B0D812A8A5BAF7889E69@BY5PR11MB4372.namprd11.prod.outlook.com>
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

Thank you Ashutosh. By returning 0, gem_get_lmem_region_count(fd) > 0 will return false which
Means gem_has_lmem will be returning false.
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

Thank you Ashutosh. I tried that. Problem is 5.4 kernel doesn't have this support and
The kernel doesn't return error ENOSYS. Even if I try to return error from kernel,
The current i915_query_items which is a #define just asserts and fails the test.
This is not what we want, we want gem_has_lmem to return false so that gem_create can be used in
gem_buffer_create_fb_obj. I feel,  gem_has_lmem needs a little modification for a proper fix.

Regards
Vidya

> 
> >	return gem_get_lmem_region_count(fd) > 0;
> >  }
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
