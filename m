Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F266E5BD
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 06:18:14 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Mon, 26 Jul 2021 06:18:09 +0000
Message-ID: <BY5PR11MB43729358977CE867E5B626C789E89@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210724164624.31848-1-vidya.srinivas@intel.com>
 <20210724165317.32000-1-vidya.srinivas@intel.com>
 <87wnpfo1d8.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87wnpfo1d8.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms: Return false in gem_has_lmem
 for kernels not having DRM_I915_QUERY_MEMORY_REGIONS support
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
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Sunday, July 25, 2021 2:50 AM
> To: Srinivas, Vidya <vidya.srinivas@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Almahallawy, Khaled
> <khaled.almahallawy@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com>;
> Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; Lin, Charlton
> <charlton.lin@intel.com>; Latvala, Petri <petri.latvala@intel.com>; Lin,
> Charlton <charlton.lin@intel.com>
> Subject: Re: [PATCH i-g-t] tests/kms: Return false in gem_has_lmem for
> kernels not having DRM_I915_QUERY_MEMORY_REGIONS support
> 
> On Sat, 24 Jul 2021 09:53:17 -0700, Vidya Srinivas wrote:
> >
> > @@ -164,6 +175,9 @@ uint8_t gem_get_lmem_region_count(int fd)
> >   */
> >  bool gem_has_lmem(int fd)
> >  {
> > +	int ret = gem_has_memregion_query_support(fd);
> > +	if (ret == ENOSYS || ret == ENOTSUP)
> > +		return false;
> >	return gem_get_lmem_region_count(fd) > 0;
> 
> gem_get_query_memory_regions is still broken. So we should use
> __i915_query_items there.
> 
> The patch title also should not say tests/kms.

Thank you so much Ashutosh. Kindly have a check of the patch updated with your review comments addressed.
https://patchwork.freedesktop.org/patch/446489/?series=92935&rev=4

Regards
Vidya
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
