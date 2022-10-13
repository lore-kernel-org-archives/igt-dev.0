Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C49310E054
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 08:21:13 +0000 (UTC)
Date: Thu, 13 Oct 2022 11:20:54 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Message-ID: <Y0fKZqavHODg6ALR@platvala-desk.ger.corp.intel.com>
References: <20221010084448.140541-1-vinod.govindapillai@intel.com>
 <cc8942ff-7e69-9d8d-23a3-e0c220947f10@intel.com>
 <72d82e6e968a488f2432b3f71408efc13df04a2c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72d82e6e968a488f2432b3f71408efc13df04a2c.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: set provision to
 ignore long HPDs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nikula,
 Jani" <jani.nikula@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 13, 2022 at 07:52:41AM +0000, Govindapillai, Vinod wrote:
> On Tue, 2022-10-11 at 11:27 +0200, Andrzej Hajda wrote:
> > 
> > 
> > On 10.10.2022 10:44, Vinod Govindapillai wrote:
> > > Add provision to ignore long HPDs as some displays generate
> > > long HPDs even while connected. Setting to ignore the long
> > > HPDs to avoid unexpected CI execution issues
> > > 
> > > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> > > ---
> > >   lib/igt_debugfs.c | 22 ++++++++++++++++++++++
> > >   lib/igt_debugfs.h |  1 +
> > >   lib/igt_kms.c     |  3 +++
> > >   3 files changed, 26 insertions(+)
> > > 
> > > diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> > > index a56688a5..92ce52dd 100644
> > > --- a/lib/igt_debugfs.c
> > > +++ b/lib/igt_debugfs.c
> > > @@ -713,6 +713,28 @@ void igt_require_hpd_storm_ctl(int drm_fd)
> > >         close(fd);
> > >   }
> > >   
> > > +/**
> > > + * igt_ignore_long_hpd:
> > > + *
> > > + * Set / unset ignore long HPD events from the panels. Some panels
> > > + * generate long HPDs even while connected to the ports causing
> > > + * unexpected CI execution issues. Set this to ignore such unexpected
> > > + * long HPDs where we dont expect to disconnect the displays.
> > > + */
> > > +void igt_ignore_long_hpd(int drm_fd, bool enable)
> > > +{
> > > +       int fd = igt_debugfs_open(drm_fd, "i915_ignore_long_hpd", O_WRONLY);
> > > +
> > > +       if (fd < 0) {
> > > +               igt_debug("couldn't open ignore long hpd file\n");
> > > +               return;
> > > +       }
> > > +
> > > +       igt_assert_eq(write(fd, enable ? "1" : "0", 1), 1);
> > > +
> > > +       close(fd);
> > > +}
> > > +
> > >   static igt_pipe_crc_t *
> > >   pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
> > >   {
> > > diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> > > index 37e85067..50f5e00f 100644
> > > --- a/lib/igt_debugfs.h
> > > +++ b/lib/igt_debugfs.h
> > > @@ -129,6 +129,7 @@ void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
> > >   void igt_hpd_storm_reset(int fd);
> > >   bool igt_hpd_storm_detected(int fd);
> > >   void igt_require_hpd_storm_ctl(int fd);
> > > +void igt_ignore_long_hpd(int fd, bool enable);
> > >   
> > >   /*
> > >    * Drop caches
> > > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > > index 665594aa..2db4e5fa 100644
> > > --- a/lib/igt_kms.c
> > > +++ b/lib/igt_kms.c
> > > @@ -2356,6 +2356,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
> > >         display->drm_fd = drm_fd;
> > >         is_i915_dev = is_i915_device(drm_fd);
> > >   
> > > +       /* Ignore the long HPDs */
> > > +       igt_ignore_long_hpd(display->drm_fd, true);
> > > +
> > 
> > Long HPD, even if it comes from bad hw, is useful for testing 
> > unplug/replug of the monitor in unexpected moments.
> > With this setting we loose the opportunity, but at least we can focus on 
> > the real purpose of the tests.
> > Maybe it would be useful to run sometimes tests without ignore_long_hpd?
> > 
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > 
> > Regards
> > Andrzej
> 
> Thanks for the review and comments. 
> I had also similar concerns. This was how the internal version had been using.
> 
> + JP and Swati, 
> 
> JP and Swati, do you have any comments on this? Can the CI set this flag separately?

For BAT runs for example i915 CI no longer loads i915 on boot so CI
cannot perform this write, IGT needs to do it.

If this is needed only for particular identified hosts, something like

if (getenv("IGT_SOME_WELL_NAMED_VARIABLE"))
  igt_ignore_long_hpd();

could be used to make those hosts ignore long hpd by way of CI setting
that env var.


-- 
Petri Latvala
