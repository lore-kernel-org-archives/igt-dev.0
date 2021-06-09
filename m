Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08476899AB
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 14:41:26 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id i4so35860965ybe.2
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 07:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210609043035.102359-1-jason@jlekstrand.net>
 <20210609043035.102359-10-jason@jlekstrand.net>
 <87r1hbvc4l.wl-ashutosh.dixit@intel.com>
 <YMBfqle9oJwjHvBr@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YMBfqle9oJwjHvBr@platvala-desk.ger.corp.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 9 Jun 2021 09:41:14 -0500
Message-ID: <CAOFGe95Ux67OOc7=mSV4yvJYYDotyuf0HYHFpKvaqKZCUB_GtQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 09/93] lib: Add an intel_ctx wrapper
 struct and helpers (v4)
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 9, 2021 at 1:27 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Tue, Jun 08, 2021 at 10:30:02PM -0700, Dixit, Ashutosh wrote:
> > On Tue, 08 Jun 2021 21:29:55 -0700, Jason Ekstrand wrote:
> > > diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
> > > new file mode 100644
> > > index 00000000..79bc1154
> > > --- /dev/null
> > > +++ b/lib/intel_ctx.h
> > > @@ -0,0 +1,75 @@
> >
> > /snip/
> >
> > > +/**
> > > + * intel_ctx_cfg_t:
> > > + * @flags: Context create flags
> > > + * @vm: VM to inherit or 0 for using a per-context VM
> > > + * @num_engines: Number of client-specified engines or 0 for legacy mode
> > > + * @engines: Client-specified engines
> > > + *
> > > + * Represents the full configuration of an intel_ctx.
> > > + */
> > > +typedef struct intel_ctx_cfg {
> > > +   uint32_t flags;
> > > +   uint32_t vm;
> > > +   unsigned int num_engines;
> > > +   struct i915_engine_class_instance engines[GEM_MAX_ENGINES];
> > > +} intel_ctx_cfg_t;
> > > +
> > > +intel_ctx_cfg_t intel_ctx_cfg_for_engine(unsigned int class, unsigned int inst);
> > > +intel_ctx_cfg_t intel_ctx_cfg_all_physical(int fd);
> > > +
> > > +/**
> > > + * intel_ctx_t:
> > > + * @id: the context id/handle
> > > + * @cfg: the config used to create this context
> > > + *
> > > + * Represents the full configuration of an intel_ctx.
> > > + */
> > > +typedef struct intel_ctx {
> > > +   uint32_t id;
> > > +   intel_ctx_cfg_t cfg;
> > > +} intel_ctx_t;
> >
> > Just a comment about cosmetics. I am ok either way but I believe in the
> > linux kernel (and in IGT which follows the kernel coding style) such
> > typedefs are supposedly only to be used for "opaque" types and are
> > generally avoided. E.g.
> >
> > https://yarchive.net/comp/linux/typedefs.html
> >
> > There are not very many instances of such typedef's in IGT, certainly not
> > those which are this widely used.
> >
> > I copying Petri about this to see what he prefers, whether we should keep
> > these typedefs or replace intel_ctx_cfg_t and intel_ctx_t with 'struct
> > intel_ctx_cfg' and 'struct intel_ctx'.
>
> I have no hard preferences for this. Mostly it's a question of what
> makes the most sense to the author, and whether gtk-doc eats it
> without choking.

I did typedefs partly for less typing and partly because gtk-doc
didn't like me when I was doing struct intel_ctx_cfg

--Jason
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
