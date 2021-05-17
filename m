Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CCC6E7EF
 for <igt-dev@lists.freedesktop.org>; Mon, 17 May 2021 16:34:53 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Mon, 17 May 2021 16:34:20 +0000
Message-ID: <BYAPR11MB3784FD03E06A9004096972128A2D9@BYAPR11MB3784.namprd11.prod.outlook.com>
References: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
 <20210515230142.1816456-5-alan.previn.teres.alexis@intel.com>
 <YKJE2lzbAp11yVuZ@platvala-desk.ger.corp.intel.com>
 <874kf1s9p2.wl-ashutosh.dixit@intel.com>
 <YKKCuzDKRoClLRr0@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YKKCuzDKRoClLRr0@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 04/17] Add basic PXP testing of buffer
 and context alloc
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
To: "Latvala, Petri" <petri.latvala@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Okay will replace with igt_ioctl .. the history was skeleton code I inherited and I assumed that ioctl call method was already correct - so it wasnt an intentional gap.
...alan

-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com> 
Sent: Monday, May 17, 2021 7:51 AM
To: Dixit, Ashutosh <ashutosh.dixit@intel.com>
Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t 04/17] Add basic PXP testing of buffer and context alloc

On Mon, May 17, 2021 at 07:42:49AM -0700, Dixit, Ashutosh wrote:
> On Mon, 17 May 2021 03:26:34 -0700, Petri Latvala wrote:
> >
> > > +static int create_bo_ext(int i915, uint32_t size, bool 
> > > +protected_is_true, uint32_t *bo_out) {
> > > +	int ret;
> > > +
> > > +	struct drm_i915_gem_create_ext_protected_content protected_ext = {
> > > +		.base = { .name = I915_GEM_CREATE_EXT_PROTECTED_CONTENT },
> > > +		.flags = 0,
> > > +	};
> > > +
> > > +	struct drm_i915_gem_create_ext create_ext = {
> > > +		.size = size,
> > > +		.extensions = 0,
> > > +	};
> > > +
> > > +	if (protected_is_true)
> > > +		create_ext.extensions = (uintptr_t)&protected_ext;
> > > +
> > > +	ret = ioctl(i915, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> >
> > Why the naked ioctl on a DRM ioctl instead of the many wrappers we 
> > have in lib? (do_ioctl, do_ioctl_err, igt_ioctl, ...)
> 
> Mostly because Matt Auld's patchset which adds these wrappers for 
> DRM_IOCTL_I915_GEM_CREATE_EXT has not yet been merged.

Still, using plain

ioctl(i915, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext)

instead of

igt_ioctl(i915, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext)

needs a good reason.


--
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
