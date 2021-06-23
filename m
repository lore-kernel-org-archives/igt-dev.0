Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F366E0A2
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jun 2021 05:31:26 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id j184so2191779qkd.6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 22:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-32-jason@jlekstrand.net>
 <20210618164714.629477-1-jason@jlekstrand.net>
 <87bl83dlq8.wl-ashutosh.dixit@intel.com>
 <CAOFGe95LdZ76dB-QzycbPLHqB2DMW5t8W_XWg=ekg8Kp_gO-4w@mail.gmail.com>
 <87lf73iy5q.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87lf73iy5q.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 23 Jun 2021 00:31:14 -0500
Message-ID: <CAOFGe94YMAwEB+u08DTWM8EPqgEk+Bguc8fO-Y75EHyaH2XNwg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_switch: Convert to
 intel_ctx_t
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

On Mon, Jun 21, 2021 at 12:28 AM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Sun, 20 Jun 2021 20:48:32 -0700, Jason Ekstrand wrote:
> >
> > On Fri, Jun 18, 2021 at 2:19 PM Dixit, Ashutosh
> > <ashutosh.dixit@intel.com> wrote:
> > >
> > > On Fri, 18 Jun 2021 09:47:14 -0700, Jason Ekstrand wrote:
> > > >
> > > > @@ -315,8 +326,8 @@ igt_main
> > > >       } phases[] = {
> > > >               { "", 0, NULL },
> > > >               { "-interruptible", INTERRUPTIBLE, NULL },
> > > > -             { "-queue", QUEUE, gem_has_queues },
> > > > -             { "-queue-interruptible", QUEUE | INTERRUPTIBLE, gem_has_queues },
> > > > +             { "-queue", QUEUE, gem_has_vm },
> > > > +             { "-queue-interruptible", QUEUE | INTERRUPTIBLE, gem_has_vm },
> > >
> > > As I was saying ealier I think here we should replace gem_has_vm with
> > > gem_has_queues() where:
> > >
> > > gem_has_queues == gem_has_vm && gem_context_has_single_timeline
> >
> > Oh, I see what you mean now!  I've added this locally:
> >
> > static bool
> > has_queues(int fd)
> > {
> >     return gem_has_vm(fd) && gem_context_has_single_timeline(fd);
> > }
> >
> > and used it instead of gem_has_vm.  How's that sound?
>
> Thanks, though maybe add to the lib where we added
> gem_context_has_single_timeline() (lib/i915/gem_context.c) since there are
> other places too where this would be useful.

I'm a little hesitant to do that since we don't have a quick-and-easy
"create a queue" thing anymore.  It doesn't make sense to me to have a
central query for something that isn't a central concept, just because
it exists more than once.

--Jason


> >
> > --Jason
> >
> > > But even otherwise this is:
> > >
> > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
