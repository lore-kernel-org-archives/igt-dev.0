Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F061D6E2D8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 12:05:14 +0000 (UTC)
Date: Wed, 18 Dec 2019 14:05:11 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191218120511.GJ25209@platvala-desk.ger.corp.intel.com>
References: <20191218112012.3539911-1-chris@chris-wilson.co.uk>
 <20191218113602.GH25209@platvala-desk.ger.corp.intel.com>
 <157666910199.3924.13406494050560432566@skylake-alporthouse-com>
 <20191218114940.GI25209@platvala-desk.ger.corp.intel.com>
 <157667029720.3924.5480524894029117788@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157667029720.3924.5480524894029117788@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests: Open DRM_MASTER for display
 operations
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

On Wed, Dec 18, 2019 at 11:58:17AM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2019-12-18 11:49:40)
> > On Wed, Dec 18, 2019 at 11:38:22AM +0000, Chris Wilson wrote:
> > > Quoting Petri Latvala (2019-12-18 11:36:02)
> > > > On Wed, Dec 18, 2019 at 11:20:12AM +0000, Chris Wilson wrote:
> > > > > To configure the display, one is required to be the DRM_MASTER.
> > > > > 
> > > > > Closes: https://gitlab.freedesktop.org/drm/intel/issues/855
> > > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > ---
> > > > >  tests/kms_content_protection.c | 2 +-
> > > > >  tests/kms_panel_fitting.c      | 2 +-
> > > > >  tests/kms_plane_alpha_blend.c  | 2 +-
> > > > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> > > > > index 8b361fdef..3b9cedcb4 100644
> > > > > --- a/tests/kms_content_protection.c
> > > > > +++ b/tests/kms_content_protection.c
> > > > > @@ -654,7 +654,7 @@ static void test_content_protection_cleanup(void)
> > > > >  igt_main
> > > > >  {
> > > > >       igt_fixture {
> > > > > -             data.drm_fd = drm_open_driver(DRIVER_ANY);
> > > > > +             data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> > > > >  
> > > > >               igt_display_require(&data.display, data.drm_fd);
> > > > >       }
> > > > > diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> > > > > index ac24730f8..065fc2df8 100644
> > > > > --- a/tests/kms_panel_fitting.c
> > > > > +++ b/tests/kms_panel_fitting.c
> > > > > @@ -252,7 +252,7 @@ igt_main
> > > > >       data_t data = {};
> > > > >  
> > > > >       igt_fixture {
> > > > > -             data.drm_fd = drm_open_driver(DRIVER_ANY);
> > > > > +             data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> > > > >               igt_display_require(&data.display, data.drm_fd);
> > > > >               igt_display_require_output(&data.display);
> > > > >       }
> > > > > diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> > > > > index d7dc44ab9..085099f81 100644
> > > > > --- a/tests/kms_plane_alpha_blend.c
> > > > > +++ b/tests/kms_plane_alpha_blend.c
> > > > > @@ -565,7 +565,7 @@ igt_main
> > > > >       enum pipe pipe;
> > > > >  
> > > > >       igt_fixture {
> > > > > -             data.gfx_fd = drm_open_driver(DRIVER_ANY);
> > > > > +             data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
> > > > >               igt_require_pipe_crc(data.gfx_fd);
> > > > >               igt_display_require(&data.display, data.gfx_fd);
> > > > >               igt_require(data.display.is_atomic);
> > > > 
> > > > 
> > > > Don't they implicitly become masters if that's the first-and-only
> > > > open() on the dev? Did that change?
> > > 
> > > That is the still the case. They aren't the only things running :)
> > > 
> > > By requesting master up front, we will get a complaint about what is
> > > still running that prevents us acquiring master, rather than a belated
> > > EACCES.
> > 
> > I see. Then claiming that this closes drm/intel#855 is a bit of a
> > stretch.
> 
> It closes the EACESS. That stuff is still running is that not this
> test's fault (not requiring the permission it needs is) and already
> known, most recently #844.
>  
> > Getting the error happening earlier is good. However, surely these
> > aren't the only tests that do master-requiring things (modeset? or any
> > kind of commit?) on an fd opened with drm_open_driver()? Are there any
> > tests that do igt_display_require and don't require master-y access?
> 
> I did a git grep and these 3 were the one's that I could identify that
> did not request the privilege they required.


Ok, I'm sold.


Acked-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
