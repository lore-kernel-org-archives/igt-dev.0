Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268A36EAB7
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 18:51:11 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id g5so31717326ejx.0
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 11:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210413035350.261794-1-jason@jlekstrand.net>
 <20210413035350.261794-12-jason@jlekstrand.net>
 <YHhi5brLOMZTEZaJ@phenom.ffwll.local>
In-Reply-To: <YHhi5brLOMZTEZaJ@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 13:50:57 -0500
Message-ID: <CAOFGe94inehfuG9Y4oyh65Nx9rFsNm_JLVQtL_hzphBjkE_q_w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 11/74] lib/i915/gem_engine_topology: Add
 an iterator which doesn't munge contexts
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 10:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Apr 12, 2021 at 10:52:47PM -0500, Jason Ekstrand wrote:
> > the current for_each_physical_engine iterators smash the set of engines
> > on the context (or ctx0 for the __ version).  This new one just gets the
> > list of engines from i915 and iterates over them.
>
> gtkdoc for this please.
>
> Also since you screamed at this all quite a bit if you feel like adding
> the  SECTION: overview section which gives you a few pointers to the main
> concepts/functions would be really awesome. I guess asking for all the
> missing docs is a bit much, but the overview/wtf/howto would be nice to
> add. At least the canonical example for how to use this in an igt test or
> something like that.

This iterator is pretty uninteresting but the ones in the next patch
are much more important.  I've added a nice doc including code
examples in the next patch for how to use the config/context/for_each
pattern.

--Jason

> Anyway lgtm I guess, Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> > ---
> >  lib/i915/gem_engine_topology.c | 10 ++++++++++
> >  lib/i915/gem_engine_topology.h |  6 ++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> > index 606d3c1d..4319895f 100644
> > --- a/lib/i915/gem_engine_topology.c
> > +++ b/lib/i915/gem_engine_topology.c
> > @@ -224,6 +224,16 @@ static struct intel_engine_data intel_engine_list_for_static(int fd)
> >       return engine_data;
> >  }
> >
> > +struct intel_engine_data intel_engine_list_of_physical(int fd)
> > +{
> > +     struct intel_engine_data engine_data = { };
> > +
> > +     if (__query_engine_list(fd, &engine_data) == 0)
> > +             return engine_data;
> > +
> > +     return intel_engine_list_for_static(fd);
> > +}
> > +
> >  static int gem_topology_get_param(int fd,
> >                                 struct drm_i915_gem_context_param *p)
> >  {
> > diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
> > index 76b7cd4d..69565240 100644
> > --- a/lib/i915/gem_engine_topology.h
> > +++ b/lib/i915/gem_engine_topology.h
> > @@ -41,6 +41,7 @@ struct intel_engine_data {
> >  };
> >
> >  bool gem_has_engine_topology(int fd);
> > +struct intel_engine_data intel_engine_list_of_physical(int fd);
> >  struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id);
> >
> >  /* iteration functions */
> > @@ -70,6 +71,11 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
> >            ((e__) = intel_get_current_engine(&i__)); \
> >            intel_next_engine(&i__))
> >
> > +#define for_each_physical_engine(fd__, e__) \
> > +     for (struct intel_engine_data i__##e__ = intel_engine_list_of_physical(fd__); \
> > +          ((e__) = intel_get_current_physical_engine(&i__##e__)); \
> > +          intel_next_engine(&i__##e__))
> > +
> >  /* needs to replace "for_each_physical_engine" when conflicts are fixed */
> >  #define ____for_each_physical_engine(fd__, ctx__, e__) \
> >       for (struct intel_engine_data i__##e__ = intel_init_engine_list(fd__, ctx__); \
> > --
> > 2.31.1
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
