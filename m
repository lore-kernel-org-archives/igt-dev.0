Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C9B6E82D
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2020 07:52:01 +0000 (UTC)
Date: Wed, 1 Jul 2020 10:51:57 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200701075157.sqid4ezhm54ys476@ahiler-desk1.fi.intel.com>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
 <20200625062318.26368-1-mohammed.khajapasha@intel.com>
 <20200625062318.26368-2-mohammed.khajapasha@intel.com>
 <20200630120205.tly2cdeq3kjf7kj6@ahiler-desk1.fi.intel.com>
 <DM6PR11MB2938B173A6E99270FB67E43AE96C0@DM6PR11MB2938.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR11MB2938B173A6E99270FB67E43AE96C0@DM6PR11MB2938.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/7] lib/igt_kms: Add support for
 display with non-contiguous pipes
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
To: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 01, 2020 at 10:04:30AM +0300, Khajapasha, Mohammed wrote:
> 
> 
> > -----Original Message-----
> > From: Hiler, Arkadiusz <arkadiusz.hiler@intel.com>
> > Sent: Tuesday, June 30, 2020 5:32 PM
> > To: Khajapasha, Mohammed <mohammed.khajapasha@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH i-g-t v3 1/7] lib/igt_kms: Add support for display with
> > non-contiguous pipes
> >
> > On Thu, Jun 25, 2020 at 11:53:12AM +0530, Mohammed Khajapasha wrote:
> > > Add support for non-contiguous pipe display by allocating upper bound
> > > pipes array for display. Set the pipe enum name to igt pipe for
> > > enabled pipes in drm.
> > >
> > > v3:
> > >     Avoiding calling get pipe from crtc id ioctl for non i915 device
> > >     (petri)
> > >
> > > Signed-off-by: Mohammed Khajapasha
> > <mohammed.khajapasha@intel.com>
> > > ---
> > >  lib/igt_kms.c | 58
> > > ++++++++++++++++++++++++++++++++++++++++++++-------
> > >  lib/igt_kms.h | 13 +++++++-----
> > >  2 files changed, 58 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index afef5939..1b20c7e8
> > > 100644
> > > --- a/lib/igt_kms.c
> > > +++ b/lib/igt_kms.c
> > > @@ -1888,13 +1888,14 @@ void igt_display_require(igt_display_t
> > > *display, int drm_fd)  {
> > >  drmModeRes *resources;
> > >  drmModePlaneRes *plane_resources;
> > > -int i;
> > > +int i, i915_dev;
> >
> > Would be beter to name this is_i915_dev and make it bool.
> >
> > >  memset(display, 0, sizeof(igt_display_t));
> > >
> > >  LOG_INDENT(display, "init");
> > >
> > >  display->drm_fd = drm_fd;
> > > +i915_dev = is_i915_device(drm_fd);
> > >
> > >  resources = drmModeGetResources(display->drm_fd);
> > >  if (!resources)
> > > @@ -1921,10 +1922,37 @@ void igt_display_require(igt_display_t
> > *display, int drm_fd)
> > >   * We cache the number of pipes, that number is a physical limit of
> > the
> > >   * hardware and cannot change of time (for now, at least).
> > >   */
> > > -display->n_pipes = resources->count_crtcs;
> > > +if (i915_dev)
> > > +display->n_pipes = IGT_MAX_PIPES;
> > > +else
> > > +display->n_pipes = resources->count_crtcs;
> >
> > I don't think this if is necessary - we can always roll with n_pipes ==
> > IGT_MAX_PIPES, and the ones that are not there will be pipe->enabled ==
> > 0.
> >
> > >  display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
> > >  igt_assert_f(display->pipes, "Failed to allocate memory for %d
> > > pipes\n", display->n_pipes);
> > >
> > > +for(i = 0; i < resources->count_crtcs; i++) {
> >            ^ missing space
> >
> > > +igt_pipe_t *pipe;
> > > +
> > > +if (i915_dev) {
> >                                ^ tailing whitespace
> >
> > > +/* Get right pipe enum from kernel for a pipe */
> > > +struct drm_i915_get_pipe_from_crtc_id get_pipe;
> >
> > I see that we don't have anything similar for other drivers.
> >
> > I would extend the comment here a bit to explain the background of why
> > we have this i915 check and special case for it. Mention non-continous
> > pipes and explain a bit on pipe to crtc mapping.
> >
> 
> The i915 check has been introduced as per previous review comments in
> https://patchwork.freedesktop.org/patch/369594/?series=78198&rev=1

And it makes sense if you know the context, but to someone reading the
code later on this may be a bit hard to digest.

What I am asking for is to explain here that using pipes like IGT does
is a flawed concept, especially with non-continous pipes, and we should
move away from it in the end, but for now we have a way to work around
the possible issues for i915 because of that IOCTL.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
