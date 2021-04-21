Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E22689CD8
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Apr 2021 11:53:28 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j7so12111850eds.8
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Apr 2021 04:53:28 -0700 (PDT)
Date: Wed, 21 Apr 2021 13:53:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YIASMkCB9nVkbHPt@phenom.ffwll.local>
References: <20210413035350.261794-1-jason@jlekstrand.net>
 <20210413035350.261794-7-jason@jlekstrand.net>
 <YHhkdI0B5o6mg7xi@phenom.ffwll.local>
 <CAOFGe95dd-BnCytUT+y6ucexqAeZ_yqfwZKzR8o1Mktwb26i2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe95dd-BnCytUT+y6ucexqAeZ_yqfwZKzR8o1Mktwb26i2w@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 06/74] lib/i915/gem_engine_topology:
 Expose the __query_engines helper
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
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 11:55:26AM -0500, Jason Ekstrand wrote:
> On Thu, Apr 15, 2021 at 11:06 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Apr 12, 2021 at 10:52:42PM -0500, Jason Ekstrand wrote:
> >
> > gtkdoc + sob then Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Would it make sense to move it to ioctl_wrappers.c/h?  It seems like
> it makes more sense there in some ways.  I guess it's also
> topology-related.

From irc for completeness: I think the idea is to move i915 specific ioctl
wrappers into lib/i915, and at least long term get away from having i915
ioctl wrappers in ioctl_wrappers.c/h. That's an old thing back from when
igt was the intel gpu test suite ...
-Daniel

> 
> --Jason
> 
> > > ---
> > >  lib/i915/gem_engine_topology.c | 20 +++++++++++---------
> > >  lib/i915/gem_engine_topology.h |  4 ++++
> > >  2 files changed, 15 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> > > index c12cd920..5d196f59 100644
> > > --- a/lib/i915/gem_engine_topology.c
> > > +++ b/lib/i915/gem_engine_topology.c
> > > @@ -62,14 +62,9 @@ static int __gem_query(int fd, struct drm_i915_query *q)
> > >       return err;
> > >  }
> > >
> > > -static void gem_query(int fd, struct drm_i915_query *q)
> > > -{
> > > -     igt_assert_eq(__gem_query(fd, q), 0);
> > > -}
> > > -
> > > -static void query_engines(int fd,
> > > -                       struct drm_i915_query_engine_info *query_engines,
> > > -                       int length)
> > > +int __gem_query_engines(int fd,
> > > +                     struct drm_i915_query_engine_info *query_engines,
> > > +                     int length)
> > >  {
> > >       struct drm_i915_query_item item = { };
> > >       struct drm_i915_query query = { };
> > > @@ -81,7 +76,14 @@ static void query_engines(int fd,
> > >
> > >       item.data_ptr = to_user_pointer(query_engines);
> > >
> > > -     gem_query(fd, &query);
> > > +     return __gem_query(fd, &query);
> > > +}
> > > +
> > > +static void query_engines(int fd,
> > > +                       struct drm_i915_query_engine_info *query_engines,
> > > +                       int length)
> > > +{
> > > +     igt_assert_eq(__gem_query_engines(fd, query_engines, length), 0);
> > >  }
> > >
> > >  static void ctx_map_engines(int fd, struct intel_engine_data *ed,
> > > diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
> > > index f5edcb5d..76b7cd4d 100644
> > > --- a/lib/i915/gem_engine_topology.h
> > > +++ b/lib/i915/gem_engine_topology.h
> > > @@ -29,6 +29,10 @@
> > >
> > >  #define GEM_MAX_ENGINES              I915_EXEC_RING_MASK + 1
> > >
> > > +int __gem_query_engines(int fd,
> > > +                     struct drm_i915_query_engine_info *query_engines,
> > > +                     int length);
> > > +
> > >  struct intel_engine_data {
> > >       uint32_t nengines;
> > >       uint32_t n;
> > > --
> > > 2.31.1
> > >
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
