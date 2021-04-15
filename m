Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3926EAA8
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 18:05:23 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id f8so29163253edd.11
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 11:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210413035350.261794-1-jason@jlekstrand.net>
 <20210413035350.261794-10-jason@jlekstrand.net>
 <YHhh9Fxgt7Y1RKE4@phenom.ffwll.local>
In-Reply-To: <YHhh9Fxgt7Y1RKE4@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 13:05:10 -0500
Message-ID: <CAOFGe94bWKrobEPNmASMqNvb=rss7PEkFB7k2MweJXi0jmX4oA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 09/74] lib/i915/gem_engine_topology:
 Rework query_engine_list()
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

On Thu, Apr 15, 2021 at 10:55 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Apr 12, 2021 at 10:52:45PM -0500, Jason Ekstrand wrote:
> > This gives us a no-assert version.
>
> Add gtk+sob and then Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

This is all static so no new API is exposed.

> > ---
> >  lib/i915/gem_engine_topology.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> > index 5d196f59..833b3abe 100644
> > --- a/lib/i915/gem_engine_topology.c
> > +++ b/lib/i915/gem_engine_topology.c
> > @@ -79,13 +79,6 @@ int __gem_query_engines(int fd,
> >       return __gem_query(fd, &query);
> >  }
> >
> > -static void query_engines(int fd,
> > -                       struct drm_i915_query_engine_info *query_engines,
> > -                       int length)
> > -{
> > -     igt_assert_eq(__gem_query_engines(fd, query_engines, length), 0);
> > -}
> > -
> >  static void ctx_map_engines(int fd, struct intel_engine_data *ed,
> >                           struct drm_i915_gem_context_param *param)
> >  {
> > @@ -144,14 +137,16 @@ static void init_engine(struct intel_execution_engine2 *e2,
> >       igt_assert(ret < sizeof(e2->name));
> >  }
> >
> > -static void query_engine_list(int fd, struct intel_engine_data *ed)
> > +static int __query_engine_list(int fd, struct intel_engine_data *ed)
> >  {
> >       uint8_t buff[SIZEOF_QUERY] = { };
> >       struct drm_i915_query_engine_info *query_engine =
> >                       (struct drm_i915_query_engine_info *) buff;
> > -     int i;
> > +     int i, err;
> >
> > -     query_engines(fd, query_engine, SIZEOF_QUERY);
> > +     err = __gem_query_engines(fd, query_engine, SIZEOF_QUERY);
> > +     if (err)
> > +             return err;
> >
> >       for (i = 0; i < query_engine->num_engines; i++)
> >               init_engine(&ed->engines[i],
> > @@ -159,6 +154,13 @@ static void query_engine_list(int fd, struct intel_engine_data *ed)
> >                           query_engine->engines[i].engine.engine_instance, i);
> >
> >       ed->nengines = query_engine->num_engines;
> > +
> > +     return 0;
> > +}
> > +
> > +static void query_engine_list(int fd, struct intel_engine_data *ed)
> > +{
> > +     igt_assert_eq(__query_engine_list(fd, ed), 0);
> >  }
> >
> >  struct intel_execution_engine2 *
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
