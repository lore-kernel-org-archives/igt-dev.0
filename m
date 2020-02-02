Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667256E056
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Feb 2020 10:26:51 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87zhe23tn5.wl-ashutosh.dixit@intel.com>
References: <20200201193347.7432-1-ayaz.siddiqui@intel.com>
 <20200201193347.7432-2-ayaz.siddiqui@intel.com>
 <87zhe23tn5.wl-ashutosh.dixit@intel.com>
Message-ID: <158063920607.17828.8869608002612498293@skylake-alporthouse-com>
Date: Sun, 02 Feb 2020 10:26:46 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_tiled_pread_*: Add check
 for FENCE based tiling support
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dixit, Ashutosh (2020-02-01 21:05:50)
> On Sat, 01 Feb 2020 11:33:46 -0800, Ayaz A Siddiqui wrote:
> >
> > These tests are verifying integrity of the tiled data read and write operation
> > on platforms which supports FENCE based tiling.
> >
> > A check has been added to skip these tests if FENCES  are not available
> > in platform.
> > Tests updated in this patch :
> > 1. gem_tiled_pread_basic
> > 2. gem_tiled_pread_pwrite
> >
> > Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > ---
> >  tests/i915/gem_tiled_pread_basic.c  | 2 +-
> >  tests/i915/gem_tiled_pread_pwrite.c | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
> > index 1ac9eccd..7cb64410 100644
> > --- a/tests/i915/gem_tiled_pread_basic.c
> > +++ b/tests/i915/gem_tiled_pread_basic.c
> > @@ -124,7 +124,7 @@ igt_simple_main
> >       uint32_t devid;
> >
> >       fd = drm_open_driver(DRIVER_INTEL);
> > -
> > +     igt_require(gem_available_fences(fd) > 0);
> >       handle = create_bo(fd);
> >       igt_require(gem_get_tiling(fd, handle, &tiling, &swizzle));
> >
> > diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
> > index 0988a4e8..ee163843 100644
> > --- a/tests/i915/gem_tiled_pread_pwrite.c
> > +++ b/tests/i915/gem_tiled_pread_pwrite.c
> > @@ -122,6 +122,7 @@ igt_simple_main
> >
> >               current_tiling_mode = I915_TILING_X;
> >
> > +             igt_require(gem_available_fences(fd) > 0);
> >               handle = create_bo_and_fill(fd);
> >               igt_require(gem_get_tiling(fd, handle, &tiling, &swizzle));
> 
> Both these places already have igt_require(gem_get_tiling()) which is
> equivalent so I'd say this patch is not requried.

Indeed. But I think adding igt_require(gem_foo_fences) will be a useful
addition to the explicit fenced tests. If we don't replace them all
first.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
