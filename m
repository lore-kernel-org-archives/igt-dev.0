Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A74E6E170
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:27:55 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id o139so3400287ybg.9
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-1-jason@jlekstrand.net>
 <20210617191516.577394-22-jason@jlekstrand.net>
 <871r8l930c.wl-ashutosh.dixit@intel.com>
 <CAOFGe95_rNdOksDeT7KpbtiM3q0MwjiU5izsWDT-N=26=kug5A@mail.gmail.com>
 <87eecjavk1.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87eecjavk1.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 7 Jul 2021 09:27:43 -0500
Message-ID: <CAOFGe95PrM0OwDHQruJg7=9JruJ7Qx1nHmKqTXiP+Z_6RQVHag@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 71/79] lib/i915: Rework engine API
 availability checks (v2)
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 4:31 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Wed, 30 Jun 2021 10:57:07 -0700, Jason Ekstrand wrote:
> >
> > On Mon, Jun 28, 2021 at 2:56 PM Dixit, Ashutosh
> > <ashutosh.dixit@intel.com> wrote:
> > >
> > > On Thu, 17 Jun 2021 12:15:08 -0700, Jason Ekstrand wrote:
> > > >
> > > >  bool gem_has_engine_topology(int fd)
> > > >  {
> > > > -     struct drm_i915_gem_context_param param = {
> > > > -             .param = I915_CONTEXT_PARAM_ENGINES,
> > > > -     };
> > > > -
> > > > -     return !__gem_context_get_param(fd, &param);
> > > > +     struct intel_engine_data ed;
> > > > +     return !__query_engine_list(fd, &ed);
> > >
> > > Is this correct? Isn't this actually a check for the presence of
> > > I915_CONTEXT_PARAM_ENGINES (seems so looking from which this is called)?
> >
> > You're right that the check here is slightly different.  The old check
> > queried the engine set on ctx0 but the new check queries the global
> > engine set.  The three callers are gem_ctx_engines, gem_exec_balancer,
> > and gem_exec_schedule, all of which really want "is the engines API
> > available?"  I don't think it matters which one we query from a kernel
> > support POV.  Every kernel that has the global engines query should
> > have the CONTEXT_PARAM_ENGINES and vice versa.
>
> Can we add a comment to the function about this since it is not obvious.

Yup.  I've added it to the function's docs.

> >
> > > So we could probably just create a new context and do a set_engines on it and
> > > return true if that succeeded?
> >
> > Yes, we could do that.  It's just a lot more annoying to get right
> > because we first have to query the engine set to get a valid engine to
> > attempt to set.  I'm not sure there's a point.
> >
> > Or do that in addition to
> > > __query_engine_list? Maybe intel_ctx_create_all_physical() will do both?
> >
> > Not sure what you mean by this.
>
> I was saying if we did a intel_ctx_create_all_physical() it would exercise
> and validate that all required uapi's are present in the kernel. However if
> you are saying that "Every kernel that has the global engines query should
> have the CONTEXT_PARAM_ENGINES and vice versa." then it's not needed and it
> seems there are no further changes to this needed (execpt maybe the comment
> I suggested above).
>
> Therefore this is:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks!

>
> >
> > --Jason
> >
> > > Thanks.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
