Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6678A6E135
 for <igt-dev@lists.freedesktop.org>; Mon, 17 May 2021 09:11:48 +0000 (UTC)
Date: Mon, 17 May 2021 12:11:30 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YKIzQtcWRBBqOqva@platvala-desk.ger.corp.intel.com>
References: <20210419060928.671111-1-viswax.krishna.raveendra.talabattula@intel.com>
 <87sg3mpyfl.wl-ashutosh.dixit@intel.com>
 <87h7j7csnd.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7j7csnd.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/i915: Remove I915_CACHING_NONE
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
Cc: igt-dev@lists.freedesktop.org, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 12, 2021 at 06:46:30PM -0700, Dixit, Ashutosh wrote:
> On Sun, 18 Apr 2021 23:42:54 -0700, Dixit, Ashutosh wrote:
> >
> > On Sun, 18 Apr 2021 23:09:28 -0700, <viswax.krishna.raveendra.talabattula@intel.com> wrote:
> > >
> > > From: Viswa Krishna Raveendra Talabattula <viswax.krishna.raveendra.talabattula@intel.com>
> > >
> > > The userptr memory does not support I915_CACHING_NONE(no caching) level
> > > as per the below commit related to i915 in the kernel
> > >
> > > drm/i915: Reject more ioctls for userptr, v2.
> > >
> > > Hence removing the cache level of I915_CACHING_NONE from the test case
> >
> > Instead of dropping the test should we check for -ENXIO return?
> 
> Because setting I915_CACHING_NONE on a userptr is not an unreasonable
> operation, if it is not supported IMO IGT should check for an -ENXIO return
> if someone tries to set I915_CACHING_NONE.
> 
> The only complication here is that this is a ABI change. So if IGT runs on
> an older kernel set_caching() will return 0 whereas it will return -ENXIO
> with a new kernel. There seems to be no way of determining a priori what
> the expected return is.
> 
> I am copying Petri too. Checking for both 0 and -ENXIO would sort of defeat
> the purpose. Also, having the IGT fail on older kernels is also probably
> unacceptable.

There is some value in making sure the operation doesn't fail with
something funky like ECONNREFUSED. How much value, that depends, up to
you.

Is it an option to have this mapping:

ENXIO - pass
0 - warn, with something like "kernel behaves in a deprecated way"
anything else - fail


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
