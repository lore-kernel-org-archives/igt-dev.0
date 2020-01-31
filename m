Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F986FAAF
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 08:20:06 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87lfpo5i71.wl-ashutosh.dixit@intel.com>
References: <20200131001516.2228-1-antonio.argenziano@intel.com>
 <87lfpo5i71.wl-ashutosh.dixit@intel.com>
Message-ID: <158045880175.5254.4623082045631696572@skylake-alporthouse-com>
Date: Fri, 31 Jan 2020 08:20:01 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_basic: Skip subtest
 gtt if gtt mapping is unavailable
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dixit, Ashutosh (2020-01-31 05:05:38)
> On Thu, 30 Jan 2020 16:15:16 -0800, Antonio Argenziano wrote:
> >
> > The subtest tries to do a gtt mapping but if there is no mappable
> > aperture that is not possible.
> >
> > Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
> > ---
> >  tests/i915/gem_exec_basic.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> > index 70dce34b..08336168 100644
> > --- a/tests/i915/gem_exec_basic.c
> > +++ b/tests/i915/gem_exec_basic.c
> > @@ -93,6 +93,7 @@ static void gtt(int fd, uint64_t flags)
> >       struct drm_i915_gem_exec_object2 *exec;
> >       uint32_t handle;
> >
> > +     gem_require_mappable_ggtt(fd);
> >       gem_require_ring(fd, flags);
> >
> >       handle = gem_create(fd, 4096);
> 
> Since the test is not really using any tiling features of the ggtt perhaps
> no need to skip? Instead how about this:

The test is very confused about its purpose in life and what it is
doing. Lets not confuse it any more. I'd remove it but we do we need
some testing of poisoned pointers -- and as inaccurate as this is, this
is the only example for execbuf.

Whatever it is, it is not a gem_exec_basic.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
