Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27286E96A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 10:57:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200131105037.GX25209@platvala-desk.ger.corp.intel.com>
References: <20200131001516.2228-1-antonio.argenziano@intel.com>
 <20200131105037.GX25209@platvala-desk.ger.corp.intel.com>
Message-ID: <158046821812.2430.13863012700596149680@skylake-alporthouse-com>
Date: Fri, 31 Jan 2020 10:56:58 +0000
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-01-31 10:50:37)
> On Thu, Jan 30, 2020 at 04:15:16PM -0800, Antonio Argenziano wrote:
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
> 
> 
> Hmm, without mappable aperture this ends up yielding a SKIP for each
> dynamic subtest. Note to self: Check that it gets properly handled...
> 
> Anyway, it's useless to loop and yield multiple SKIPs when you know a
> priori you're going to do it for each loop element.

There's no reason to loop over engines at all for this, since it's just
testing passing a pointer to the kernel and copy_from_user(). Sigh. It's
a confused test.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
