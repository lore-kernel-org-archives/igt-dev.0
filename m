Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23536E0BE
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 09:53:41 +0000 (UTC)
Date: Thu, 7 May 2020 12:53:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200507095334.GX9497@platvala-desk.ger.corp.intel.com>
References: <20200507084550.656091-1-chris@chris-wilson.co.uk>
 <20200507094035.GW9497@platvala-desk.ger.corp.intel.com>
 <158884471985.20858.11402141781774451488@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158884471985.20858.11402141781774451488@build.alporthouse.com>
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Martin Peres <martin.peres@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 07, 2020 at 10:45:19AM +0100, Chris Wilson wrote:
> Quoting Petri Latvala (2020-05-07 10:40:35)
> > On Thu, May 07, 2020 at 09:45:50AM +0100, Chris Wilson wrote:
> > > +void igt_require_gem(int i915)
> > > +{
> > > +     int err;
> > > +
> > > +     igt_require_intel(i915);
> > > +
> > > +     /*
> > > +      * We only want to use the throttle-ioctl for its -EIO reporting
> > > +      * of a wedged device, not for actually waiting on outstanding
> > > +      * requests! So create a new drm_file for the device that is clean.
> > > +      */
> > > +     i915 = gem_reopen_driver(i915);
> > > +
> > > +     /*
> > > +      * Reset the global seqno at the start of each test. This ensures that
> > > +      * the test will not wrap unless it explicitly sets up seqno wrapping
> > > +      * itself, which avoids accidentally hanging when setting up long
> > > +      * sequences of batches.
> > > +      */
> > > +     reset_device(i915);
> > > +
> > > +     err = 0;
> > > +     if (ioctl(i915, DRM_IOCTL_I915_GEM_THROTTLE)) {
> > > +             err = -errno;
> > > +             igt_assume(err);
> > > +     }
> > > +
> > > +     close(i915);
> > > +
> > > +     igt_require_f(err == 0, "Unresponsive i915/GEM device\n");
> > 
> > 
> > Food for thought (not for this patch): Using igt_abort_f() for this instead?
> 
> Not everything requires gem? But yeah, it's pretty common to have a pile
> of skips after toasting the GPU.

Generally if the GPU is toast there's really no point in testing
further, even if they don't require gem. I'd rather have that in CI
than flip-flopping skips. Validation is a different matter.

Martin can probably give a good opinion on that.

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
