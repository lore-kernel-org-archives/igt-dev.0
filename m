Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FB36E964
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 09:45:23 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200507094035.GW9497@platvala-desk.ger.corp.intel.com>
References: <20200507084550.656091-1-chris@chris-wilson.co.uk>
 <20200507094035.GW9497@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158884471985.20858.11402141781774451488@build.alporthouse.com>
Date: Thu, 07 May 2020 10:45:19 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Split igt_require_gem() into
 i915/
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-05-07 10:40:35)
> On Thu, May 07, 2020 at 09:45:50AM +0100, Chris Wilson wrote:
> > +void igt_require_gem(int i915)
> > +{
> > +     int err;
> > +
> > +     igt_require_intel(i915);
> > +
> > +     /*
> > +      * We only want to use the throttle-ioctl for its -EIO reporting
> > +      * of a wedged device, not for actually waiting on outstanding
> > +      * requests! So create a new drm_file for the device that is clean.
> > +      */
> > +     i915 = gem_reopen_driver(i915);
> > +
> > +     /*
> > +      * Reset the global seqno at the start of each test. This ensures that
> > +      * the test will not wrap unless it explicitly sets up seqno wrapping
> > +      * itself, which avoids accidentally hanging when setting up long
> > +      * sequences of batches.
> > +      */
> > +     reset_device(i915);
> > +
> > +     err = 0;
> > +     if (ioctl(i915, DRM_IOCTL_I915_GEM_THROTTLE)) {
> > +             err = -errno;
> > +             igt_assume(err);
> > +     }
> > +
> > +     close(i915);
> > +
> > +     igt_require_f(err == 0, "Unresponsive i915/GEM device\n");
> 
> 
> Food for thought (not for this patch): Using igt_abort_f() for this instead?

Not everything requires gem? But yeah, it's pretty common to have a pile
of skips after toasting the GPU.

> <snip>
> 
> > diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> > index 9e6c5c993..050670785 100644
> > --- a/lib/igt_debugfs.c
> > +++ b/lib/igt_debugfs.c
> > @@ -1110,13 +1110,10 @@ static int get_object_count(int fd)
> >   */
> >  int igt_get_stable_obj_count(int driver)
> >  {
> > -     int obj_count;
> > -     gem_quiescent_gpu(driver);
> > -     obj_count = get_object_count(driver);
> >       /* The test relies on the system being in the same state before and
> >        * after the test so any difference in the object count is a result of
> >        * leaks during the test. */
> > -     return obj_count;
> > +     return get_object_count(driver);
> >  }
> 
> No more quiescenting here?

gem_object_count() already was idling and freeing.

> <snip>
> 
> 
> > diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> > index 3d52987d1..bd3c819b4 100644
> > --- a/tests/i915/gem_ctx_persistence.c
> > +++ b/tests/i915/gem_ctx_persistence.c
> > @@ -29,6 +29,7 @@
> >  #include <unistd.h>
> >  
> >  #include "drmtest.h" /* gem_quiescent_gpu()! */
> 
> This comment appears on multiple tests and is now lying.

Good point, I can stop ranting in a few places :)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
