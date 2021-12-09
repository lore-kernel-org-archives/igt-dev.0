Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE77D10E116
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 06:23:11 +0000 (UTC)
Date: Thu, 9 Dec 2021 07:23:07 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211209062307.GA16758@zkempczy-mobl2>
References: <20211206164251.25983-1-arjun.melkaveri@intel.com>
 <163881187296.30657.6792120570675097718@build.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163881187296.30657.6792120570675097718@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_engines: Added out
 fence for execute-one subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris.p.wilson@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 06, 2021 at 05:31:12PM +0000, Chris Wilson wrote:
> Quoting Arjun Melkaveri (2021-12-06 16:42:51)
> > To make spinner to be on same context for following execbuf,
> > spin out_fence is passed to execbuf.rsvd2.
> > 
> > Used IGT_SPIN_FENCE_OUT flag in spinner.
> > 
> > Cc: Chris Wilson <chris.p.wilson@intel.com>
> > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > ---
> >  tests/i915/gem_ctx_engines.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> > index 003dd171..c746f268 100644
> > --- a/tests/i915/gem_ctx_engines.c
> > +++ b/tests/i915/gem_ctx_engines.c
> > @@ -298,7 +298,7 @@ static void execute_one(int i915)
> >                         spin = igt_spin_new(i915,
> >                                             .ahnd = ahnd,
> >                                             .ctx = ctx,
> > -                                           .flags = (IGT_SPIN_NO_PREEMPTION |
> > +                                           .flags = (IGT_SPIN_FENCE_OUT | IGT_SPIN_NO_PREEMPTION |
> 
> Introducing FENCE_OUT means we can stop using the no-preemption, as no
> subsequent request is allowed to execute before the cork.
> 
> But we do have to add I915_EXEC_FENCE_IN to the execbuf.flags so that it
> is executed after the spinner.
> 
> >                                                       IGT_SPIN_POLL_RUN));
> >  
> >                         do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
> > @@ -320,6 +320,7 @@ static void execute_one(int i915)
> >                                 int expected = j == i ? 0 : -EINVAL;
> >  
> >                                 execbuf.rsvd1 = ctx->id;
> > +                               execbuf.rsvd2 = spin->out_fence;
> 
> It's also complicated by that we re-execute the spinner for each engine,
> each time it will have a new out fence not recorded in spin->out_fence,
> but in spin->execbuf.rsvd2.

Are you sure it is same spinner? From what I see in execute_one for
each loop we create spinner on the beginning of that loop and free it
on the end.

--
Zbigniew

> 
> 6a4199ef96 HEAD@{1222}: am: i915/gem_ctx_engines: Replace NO_PREEMPT spinners with explicit fencing
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index 2804cae0fe..13555bc525 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -331,6 +331,7 @@ static void execute_one(int i915)
>                 .buffers_ptr = to_user_pointer(&obj),
>                 .buffer_count = 1,
>                 .rsvd1 = param.ctx_id,
> +               .flags = I915_EXEC_FENCE_IN,
>         };
>         const uint32_t bbe = MI_BATCH_BUFFER_END;
>         const struct intel_execution_engine2 *e;
> @@ -338,7 +339,7 @@ static void execute_one(int i915)
> 
>         /* Prewarm the spinner */
>         spin = igt_spin_new(i915, .ctx_id = param.ctx_id,
> -                           .flags = (IGT_SPIN_NO_PREEMPTION |
> +                           .flags = (IGT_SPIN_FENCE_OUT |
>                                       IGT_SPIN_POLL_RUN));
> 
>         gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
> @@ -369,6 +370,7 @@ static void execute_one(int i915)
>                         gem_sync(i915, spin->handle);
>                         igt_spin_reset(spin);
>                         gem_execbuf(i915, &spin->execbuf);
> +                       execbuf.rsvd2 = spin->execbuf.rsvd2 >> 32;
> 
>                         do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
>                         igt_assert_eq(busy.busy, 0);
> @@ -382,7 +384,6 @@ static void execute_one(int i915)
>                         param.size = sizeof(uint64_t) + (i + 1) * sizeof(uint32_t);
>                         gem_context_set_param(i915, &param);
> 
> -                       igt_spin_busywait_until_started(spin);
>                         for (int j = 0; j <= I915_EXEC_RING_MASK; j++) {
>                                 int expected = j == i ? 0 : -EINVAL;
> 
> @@ -397,6 +398,7 @@ static void execute_one(int i915)
>                                       i != -1 ? 1 << e->class : 0);
> 
>                         igt_spin_end(spin);
> +                       close(spin->execbuf.rsvd2 >> 32);
> 
>                         gem_sync(i915, obj.handle);
>                         do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
> 
> The bigger challenge is removing the NO_PREEMPTION from independent-all.
> -Chris
