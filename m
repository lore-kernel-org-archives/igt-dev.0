Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F776F987
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 12:12:11 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200130120409.GA20639@ideak-desk.fi.intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
 <20200129181601.15918-8-imre.deak@intel.com>
 <158037984591.16598.12090164847858859078@skylake-alporthouse-com>
 <20200130120409.GA20639@ideak-desk.fi.intel.com>
Message-ID: <158038632644.16598.14492574632391920381@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 12:12:06 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 8/9] lib/igt_fb: Speed up format
 conversion for local memory
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Imre Deak (2020-01-30 12:04:09)
> On Thu, Jan 30, 2020 at 10:24:05AM +0000, Chris Wilson wrote:
> > Quoting Imre Deak (2020-01-29 18:16:00)
> > > To speed up the conversion that needs to read from a dGFX local memory
> > > use the same trick as what's used for GTT apertures and make a copy
> > > first into system memory.
> > > 
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  lib/igt_fb.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > index 30f3bfba..ef3fa2ed 100644
> > > --- a/lib/igt_fb.c
> > > +++ b/lib/igt_fb.c
> > > @@ -3427,6 +3427,10 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
> > >         if (use_enginecopy(fb) || use_blitter(fb) ||
> > >             igt_vc4_is_tiled(fb->modifier)) {
> > >                 setup_linear_mapping(&blit->base);
> > > +
> > > +               /* speed things up by working from a copy in system memory */
> > > +               cvt.src.slow_reads =
> > > +                       is_i915_device(fd) && !gem_has_mappable_ggtt(fd);
> > 
> > Any read from WC (including from GGTT) is greatly improved by using
> > memcpy_from_wc, and it even works with X/Y-tiling through fences.
> > 
> > slow_reads is a question of the mapping, at the time of use.
> 
> Yes, setting slow_reads above will lead to a memcpy_from_wc() of the
> source to a system memory buf and the conversion will happen from the
> latter. What's slow is the random access read during conversion from
> local memory.

We have fast routines for those, if needed. We can read from tiled
surfaces faster than the HW can detile in most cases.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
