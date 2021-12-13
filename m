Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B47A10E807
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Dec 2021 17:26:20 +0000 (UTC)
Date: Mon, 13 Dec 2021 18:26:15 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YbeCNwTjrHgNQVl2@zkempczy-mobl2>
References: <20211209200453.15885-1-zbigniew.kempczynski@intel.com>
 <20211209200453.15885-2-zbigniew.kempczynski@intel.com>
 <875yrsa1ho.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yrsa1ho.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915/intel_memory_region:
 Provide system memory region stub
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 08:55:15AM -0800, Dixit, Ashutosh wrote:
> On Thu, 09 Dec 2021 12:04:52 -0800, Zbigniew Kempczyński wrote:
> >
> > diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> > index 058b273dc..fd29eec90 100644
> > --- a/lib/i915/intel_memory_region.c
> > +++ b/lib/i915/intel_memory_region.c
> > @@ -123,9 +123,17 @@ struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd)
> >	 * Any DRM_I915_QUERY_MEMORY_REGIONS specific errors are encoded in the
> >	 * item.length, even though the ioctl might still return success.
> >	 */
> > +
> >	if (item.length < 0) {
> > -		igt_critical("DRM_I915_QUERY_MEMORY_REGIONS failed with %d\n",
> > -			     item.length);
> > +		/*
> > +		 * If kernel supports query but not memory regions query
> > +		 * just return predefined system memory region only.
> > +		 */
> > +		size_t sys_qi_size = offsetof(typeof(*query_info), regions[1]);
> > +
> > +		query_info = calloc(1, sys_qi_size);
> > +		query_info->num_regions = 1;
> > +		query_info->regions[0].region.memory_class = I915_MEMORY_CLASS_SYSTEM;
> 
> Should there be another check here that DRM_I915_QUERY_MEMORY_REGIONS query
> was not recognized? Otherwise the query could have failed for some other
> reason?

I may differentiate for item.length == -ENODEV and return system memory
region or assert for the other errors. Currently -ENODEV path is executed
on stable kernels where we fail on integrated what's not what we want.

So you've rightly noticed I return CLASS_SYSTEM for each error we encounter
from the kernel. This is wrong for discrete because we should fail where 
invalid arguments would be passed (and not return system memory region).
As the code is already merged (rb-d by Petri on irc), I'll prepare fix for it.

Thanks for review.
--
Zbigniew 
