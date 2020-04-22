Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D73C6E370
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 08:46:02 +0000 (UTC)
Date: Wed, 22 Apr 2020 11:45:59 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200422084559.GG9497@platvala-desk.ger.corp.intel.com>
References: <20200422081011.3523086-1-chris@chris-wilson.co.uk>
 <20200422081258.3542431-1-chris@chris-wilson.co.uk>
 <20200422083349.GE9497@platvala-desk.ger.corp.intel.com>
 <158754459592.11203.9839200188400166169@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158754459592.11203.9839200188400166169@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_pm_rpm: Split the planes into
 dynamic subtests
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 09:36:35AM +0100, Chris Wilson wrote:
> Quoting Petri Latvala (2020-04-22 09:33:49)
> > On Wed, Apr 22, 2020 at 09:12:58AM +0100, Chris Wilson wrote:
> > > Use the dynamic subtests to allow the user to individually run the
> > > per-plane rpm tests.
> > > 
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > ---
> > >  tests/i915/i915_pm_rpm.c | 18 +++++++-----------
> > >  1 file changed, 7 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> > > index 4f8124dc4..a34e78b6b 100644
> > > --- a/tests/i915/i915_pm_rpm.c
> > > +++ b/tests/i915/i915_pm_rpm.c
> > > @@ -1778,7 +1778,7 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
> > >  /* This one also triggered WARNs on our driver at some point in time. */
> > >  static void planes_subtest(bool universal, bool dpms)
> > >  {
> > > -     int i, rc, planes_tested = 0, crtc_idx;
> > > +     int i, rc, crtc_idx;
> > >       drmModePlaneResPtr planes;
> > >  
> > >       igt_require(default_mode_params);
> > > @@ -1803,8 +1803,8 @@ static void planes_subtest(bool universal, bool dpms)
> > >  
> > >                       type = universal ? get_plane_type(plane->plane_id) :
> > >                                          PLANE_OVERLAY;
> > > -                     test_one_plane(dpms, plane->plane_id, type);
> > > -                     planes_tested++;
> > > +                     igt_dynamic_f("plane-%d\n", plane->plane_id)
> > > +                             test_one_plane(dpms, plane->plane_id, type);
> > >               }
> > >               drmModeFreePlane(plane);
> > >       }
> > > @@ -1813,10 +1813,6 @@ static void planes_subtest(bool universal, bool dpms)
> > >       if (universal) {
> > >               rc = drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> > >               igt_assert_eq(rc, 0);
> > > -
> > > -             igt_assert_lte(3, planes_tested);
> > > -     } else {
> > > -             igt_assert_lte(1, planes_tested);
> > 
> > Sure, we cannot have these asserts anymore when people can run a
> > limited set. Do we need to check them somewhere else?
> > 
> > Hang on, what was the point of these asserts? Asserting that we have
> > at least 3 universal planes? And at least 1 of non-universal? Wtf?
> 
> I'm glad I wasn't the only one asking that :)
> 
> This isn't even a test for the universal/legacy API, it's just checking
> that we don't get runtime errors when poking them.


Yeah, off with them!

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
