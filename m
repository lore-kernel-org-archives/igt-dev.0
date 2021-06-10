Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F096ED83
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 16:02:10 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id h15so11689957ybm.13
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 09:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210609173632.248880-1-jason@jlekstrand.net>
 <20210609173632.248880-10-jason@jlekstrand.net>
 <877dj2nvzj.wl-ashutosh.dixit@intel.com>
In-Reply-To: <877dj2nvzj.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 11:01:59 -0500
Message-ID: <CAOFGe963eZO7ObtegmqR9NjFzHwt5RJp_-ajysWi_VwUbd03xw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 09/93] lib: Add an intel_ctx wrapper
 struct and helpers (v5)
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

On Thu, Jun 10, 2021 at 12:18 AM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Wed, 09 Jun 2021 10:35:52 -0700, Jason Ekstrand wrote:
> >
> > diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
> >
> > +/**
> > + * SECTION:intel_ctx
> > + * @short_description: Wrapper structs for dealing with contexts
> > + * @title: Intel Context Wrapper
> > + *
> > + * This helper library contains a couple of wrapper structs for easier
> > + * dealing with GEM contexts.  This includes a context configuration struct
> > + * which represents important context construction parameters and a context
> > + * struct which contains the context ID and its configuration.  This makes
> > + * it easier to pass around a context without loosing the context create
>
> losing

Thanks

> Running kernel checkpatch on IGT patches shows interesting things including
> a free spell-check :)

My text editor spell-checks too, it's just that there's often enough
noise from weird things like "ctx" that stuff gets lost. :-(

> > +static const intel_ctx_t __intel_ctx_0 = {};
> > +
> > +/**
> > + * intel_ctx_0:
> > + * @fd: open i915 drm file descriptor
> > + *
> > + * Returns an intel_ctx_t representing the default context.
> > + */
> > +const intel_ctx_t *intel_ctx_0(int fd)
> > +{
> > +     (void)fd;
> > +     return &__intel_ctx_0;
> > +}
>
> OK, so this really is just a "representation" of ctx 0 since num_engines
> etc. are not what they are for the actual ctx 0 (even with just the legacy
> engines).

ctx0 is always in legacy mode, hence num_engines == 0.  If num_engines
> 0 that implies a userspace-specified engine set which ctx0 does not
have.  I feel like I've typed this explanation a couple times before
but I'm not sure you were on those e-mails so here it goes again:

With the new engine APIs, a context can have one of two different
modes with respect to engines:

 1. legacy mode.  This is the default.  In this mode, there is a fixed
set of engines and they're specified using the I915_EXEC_RENDER,
I915_EXEC_BLT, and friends flags.  This doesn't work well for new
hardware with 4 media engines or 8 copy engines or whatever.

 2. Userspace specified engines mode.  This is what you get if you use
CONTEXT_PARAM_ENGINES to specify an engine set.  In this mode, the
client specifies whatever set of engines they want as an array of
class+instance pairs.  When they execbuf, they put an integer index
(at most 63) in the flags field instead of I915_EXEC_BLT or whatever.

So when you set CONTEXT_PARAM_ENGINES, you're not just changing the
engine set, you're also changing how those engines are referenced in
execbuf.  In intel_ctx_t, we make the distinction by num_engines == 0
means legacy mode and num_engines > 0 means we're using the new
engines API.

Maybe I should add some of the above to the documentation for
intel_ctx_cfg_t?  I'll do that.

--Jason

> > diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
> > new file mode 100644
> > index 00000000..3e059478
> > --- /dev/null
> > +++ b/lib/intel_ctx.h
> > @@ -0,0 +1,57 @@
> > +// SPDX-License-Identifier: MIT
>
> Annoyingly the comment style for source and header files are actually a bit
> different:
>
> https://www.kernel.org/doc/html/v4.18/process/license-rules.html#license-identifier-syntax

Well, that is annoying.  Fixed the .h.

--Jason
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
