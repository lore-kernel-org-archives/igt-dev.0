Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452A289C0D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 07:45:46 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200207134527.17205-2-ramalingam.c@intel.com>
 <20200217094045.6788-1-ramalingam.c@intel.com>
 <20200217094442.GA6572@intel.com>
In-Reply-To: <20200217094442.GA6572@intel.com>
Message-ID: <158201194099.5228.14479505187034994340@skylake-alporthouse-com>
Date: Tue, 18 Feb 2020 07:45:41 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_rpm: mmap type based
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
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ramalingam C (2020-02-17 09:44:42)
> On 2020-02-17 at 15:10:45 +0530, Ramalingam C wrote:
> > Tests for gem_mmap_gtt/cpu are replaced with dynamic subtests with
> > the array of mmap_types passed to gem_mmap_offset.
> > 
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > cc: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  tests/i915/i915_pm_rpm.c | 34 ++++++++++++++--------------------
> >  1 file changed, 14 insertions(+), 20 deletions(-)
> > 
> > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> > index 3d7343240802..0c2821122956 100644
> > --- a/tests/i915/i915_pm_rpm.c
> > +++ b/tests/i915/i915_pm_rpm.c
> > @@ -1007,7 +1007,7 @@ static void debugfs_forcewake_user_subtest(void)
> >       igt_assert(wait_for_suspended());
> >  }
> >  
> > -static void gem_mmap_subtest(bool gtt_mmap)
> > +static void gem_mmap_args(const struct mmap_offset *t)
> >  {
> >       int i;
> >       uint32_t handle;
> > @@ -1019,14 +1019,9 @@ static void gem_mmap_subtest(bool gtt_mmap)
> >  
> >       handle = gem_create(drm_fd, buf_size);
> >  
> > -     if (gtt_mmap) {
> > -             gem_buf = gem_mmap__gtt(drm_fd, handle, buf_size,
> > -                                     PROT_READ | PROT_WRITE);
> > -     }
> > -     else {
> > -             gem_buf = gem_mmap__cpu(drm_fd, handle, 0, buf_size, 0);
> > -     }
> > -
> > +     gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
> > +                                 PROT_READ | PROT_WRITE, t->type);
> > +     igt_require(gem_buf);
> >  
> >       for (i = 0; i < buf_size; i++)
> >               gem_buf[i] = i & 0xFF;
> > @@ -1056,13 +1051,9 @@ static void gem_mmap_subtest(bool gtt_mmap)
> >        * suspended. */
> >       disable_all_screens_and_wait(&ms_data);
> >  
> > -     if (gtt_mmap) {
> > -             gem_buf = gem_mmap__gtt(drm_fd, handle, buf_size,
> > -                                     PROT_READ | PROT_WRITE);
> > -     }
> > -     else {
> > -             gem_buf = gem_mmap__cpu(drm_fd, handle, 0, buf_size, 0);
> > -     }
> > +     gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
> > +                                 PROT_READ | PROT_WRITE, t->type);
> > +     igt_require(gem_buf);
> >  
> >       igt_assert(wait_for_suspended());
> >  
> > @@ -2014,10 +2005,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
> >               modeset_subtest(SCREEN_TYPE_NON_LPSP, 1, WAIT_STATUS | USE_DPMS);
> >  
> >       /* GEM */
> > -     igt_subtest("gem-mmap-cpu")
> > -             gem_mmap_subtest(false);
> > -     igt_subtest("gem-mmap-gtt")
> > -             gem_mmap_subtest(true);
> > +     igt_subtest_with_dynamic("gem-mmap-type") {
> > +             for_each_mmap_offset_type(t) {
> > +                     igt_dynamic_f("%s", t->name)
> > +                             gem_mmap_args(t);
> > +             }
> > +     }
> Chris,
> 
> This is what you suggested I guess. But what is the mmap_offset is not
> supported? shouldn't we have the legacy tests in such scenario?

mmap-offset is a pure extension of mmap-gtt.

There's no point testing the plain mmap_ioctl in this test as that does
not use i915 for fault handling; it is independent of our rpm.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
