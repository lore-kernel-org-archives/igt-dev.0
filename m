Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191836E07F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 06:24:16 +0000 (UTC)
Date: Thu, 8 Jul 2021 08:23:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210708062350.GA10726@zkempczy-mobl2>
References: <20210617191256.577244-1-jason@jlekstrand.net>
 <20210617191516.577394-11-jason@jlekstrand.net>
 <874kdq8tjv.wl-ashutosh.dixit@intel.com>
 <CAOFGe95gw+b_NhFrbfSuLx=1CyKNwBknOOVzryrubm5h75shBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe95gw+b_NhFrbfSuLx=1CyKNwBknOOVzryrubm5h75shBw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 60/79] tests/i915/gem_ctx_create:
 Convert benchmarks to intel_ctx_t
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 01:09:51AM -0500, Jason Ekstrand wrote:
> On Mon, Jun 21, 2021 at 10:30 PM Dixit, Ashutosh
> <ashutosh.dixit@intel.com> wrote:
> >
> > On Thu, 17 Jun 2021 12:14:57 -0700, Jason Ekstrand wrote:
> > >
> > > -static void maximum(int fd, int ncpus, unsigned mode)
> > > +static void maximum(int fd, const intel_ctx_cfg_t *cfg,
> > > +                 int ncpus, unsigned mode)
> > >  {
> > >       const uint32_t bbe = MI_BATCH_BUFFER_END;
> > >       struct drm_i915_gem_execbuffer2 execbuf;
> > > @@ -300,9 +302,7 @@ static void maximum(int fd, int ncpus, unsigned mode)
> > >
> > >               err = -ENOMEM;
> > >               if (avail_mem > (count + 1) * ctx_size)
> > > -                     err =  __gem_context_clone(fd, 0,
> > > -                                                I915_CONTEXT_CLONE_ENGINES,
> > > -                                                0, &ctx_id);
> > > +                     err =  __gem_context_create(fd, &ctx_id);
> > >               if (err) {
> > >                       igt_info("Created %lu contexts, before failing with '%s' [%d]\n",
> > >                                count, strerror(-err), -err);
> > > @@ -323,6 +323,7 @@ static void maximum(int fd, int ncpus, unsigned mode)
> > >
> > >       igt_fork(child, ncpus) {
> > >               struct timespec start, end;
> > > +             const intel_ctx_t *ctx;
> > >               int i915;
> > >
> > >               i915 = gem_reopen_driver(fd);
> >
> > Just a minor nit here. I'm thinking if we should remove the i915 variable
> > and the gem_reopen_driver() here and just use fd? Because it seems we have
> > exhausted the memory creating contexts earlier on, and now the previous
> > code was creating one additional context using gem_reopen_driver() whereas
> > we are creating two, one with gem_reopen_driver() and a second with
> > intel_ctx_create(). Not sure if it matters or not but just in case it does
> > we can get rid of gem_reopen_driver() and i915.
> 
> Wait a second... I'm not sure how this was expected to ever work.  In
> the first loop, the test creates a bunch of contexts with fd.  Then,
> it forks off children.  Each of those children re-open the driver and
> then try to execute using said contexts on i915.  But those contexts
> don't exist on the newly opened DRM device.  I don't see how this ever
> worked.

I think answer is in blacklist.txt:

igt@gem_ctx_create@(?!.*basic).*

So it just wasn't executed at all (apart of postmerge, but likely results
were ignored). 

--
Zbigniew

> 
> --Jason
> 
> > Apart from this, this is:
> >
> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> >
> > > @@ -331,7 +332,7 @@ static void maximum(int fd, int ncpus, unsigned mode)
> > >                * a nop execbuf and stalling for it.
> > >                */
> > >               gem_quiescent_gpu(i915);
> > > -             gem_context_copy_engines(fd, 0, i915, 0);
> > > +             ctx = intel_ctx_create(i915, cfg);
> > >
> > >               hars_petruska_f54_1_random_perturb(child);
> > >               obj[0].handle = gem_create(i915, 4096);
> > > @@ -352,6 +353,7 @@ static void maximum(int fd, int ncpus, unsigned mode)
> > >               gem_sync(i915, obj[0].handle);
> > >               clock_gettime(CLOCK_MONOTONIC, &end);
> > >               gem_close(i915, obj[0].handle);
> > > +             intel_ctx_destroy(i915, ctx);
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
