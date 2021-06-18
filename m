Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EE76E123
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 16:35:22 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id q64so6032496qke.7
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 09:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-1-jason@jlekstrand.net>
 <20210617191256.577244-32-jason@jlekstrand.net>
 <87h7hvepqu.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87h7hvepqu.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 18 Jun 2021 11:35:09 -0500
Message-ID: <CAOFGe96uzYUAg+EXo-MOMcqS7k-xLht+rLvJ6+P1s-qf1VvGVg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 31/79] tests/i915/gem_ctx_switch:
 Convert to intel_ctx_t
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

On Thu, Jun 17, 2021 at 11:55 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Thu, 17 Jun 2021 12:12:38 -0700, Jason Ekstrand wrote:
> >
> > @@ -127,12 +130,12 @@ static void single(int fd, uint32_t handle,
> >       shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> >       igt_assert(shared != MAP_FAILED);
> >
> > -     for (n = 0; n < 64; n++) {
> > -             if (flags & QUEUE)
> > -                     contexts[n] = gem_queue_clone_with_engines(fd, 0);
> > -             else
> > -                     contexts[n] = gem_context_clone_with_engines(fd, 0);
> > -     }
> > +     cfg = *base_cfg;
> > +     if (flags & QUEUE)
> > +             cfg.vm = gem_vm_create(fd);
>
> As we did in gem_exec_whisper.c and gem_ctx_shared.c, do we also need to
> handle I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE here?

Sure

> > +static void all(int fd, uint32_t handle, const intel_ctx_cfg_t *base_cfg,
> > +             unsigned flags, int timeout)
> >  {
> >       struct drm_i915_gem_execbuffer2 execbuf;
> >       struct drm_i915_gem_exec_object2 obj[2];
> >       struct intel_engine_data engines = { };
> > -     uint32_t contexts[65];
> > +     intel_ctx_cfg_t cfg;
> > +     const intel_ctx_t *contexts[65];
> >       int n, qlen;
> >
> > -     engines = intel_init_engine_list(fd, 0);
> > +     engines = intel_engine_list_for_ctx_cfg(fd, base_cfg);
> >       igt_require(engines.nengines);
> >
> > -     for (n = 0; n < ARRAY_SIZE(contexts); n++) {
> > -             if (flags & QUEUE)
> > -                     contexts[n] = gem_queue_clone_with_engines(fd, 0);
> > -             else
> > -                     contexts[n] = gem_context_clone_with_engines(fd, 0);
> > -     }
> > +     cfg = *base_cfg;
> > +     if (flags & QUEUE)
> > +             cfg.vm = gem_vm_create(fd);
>
> I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE?

Sure

> > @@ -244,13 +249,13 @@ static void all(int fd, uint32_t handle, unsigned flags, int timeout)
> >       memset(&execbuf, 0, sizeof(execbuf));
> >       execbuf.buffers_ptr = to_user_pointer(obj + 1);
> >       execbuf.buffer_count = 1;
> > -     execbuf.rsvd1 = contexts[0];
> > +     execbuf.rsvd1 = contexts[0]->id;
> >       execbuf.flags |= I915_EXEC_HANDLE_LUT;
> >       execbuf.flags |= I915_EXEC_NO_RELOC;
> >       igt_require(__gem_execbuf(fd, &execbuf) == 0);
> >       gem_sync(fd, handle);
> >
> > -     qlen = measure_qlen(fd, &execbuf, &engines, timeout);
> > +     qlen = measure_qlen(fd, base_cfg, &execbuf, &engines, timeout);
>
> Because the cfg in the QUEUE case is different, should we just pass cfg
> instead of base_cfg here?

Sure.  I kind-of don't think it matters but, In the original, it used
gem_context_clone_with_engines(fd, 0) which is identical
gem_queue_create().  Let's go ahead and keep the VM sharing even
though I don't know why it's useful.

> > @@ -315,8 +322,8 @@ igt_main
> >       } phases[] = {
> >               { "", 0, NULL },
> >               { "-interruptible", INTERRUPTIBLE, NULL },
> > -             { "-queue", QUEUE, gem_has_queues },
> > -             { "-queue-interruptible", QUEUE | INTERRUPTIBLE, gem_has_queues },
> > +             { "-queue", QUEUE, gem_has_vm },
> > +             { "-queue-interruptible", QUEUE | INTERRUPTIBLE, gem_has_vm },
>
> My suggestion would be to resurrect gem_has_queues() here where
> gem_has_queues == gem_has_vm && gem_context_has_single_timeline.
>
> (In general maybe we can see if we can reinstate the queue concept itself
> where a queue is a context with a shared VM and shared timeline, though not
> sure about this because we now have context configs and flags. Anyway this
> is a general observation, nothing specifically needed in this patch.)

Yeah, I've thought about that.  One option would be to make a helper
that copies cfg and sets cfg.vm to get_context_param(ctx=0,
CONTEXT_PARAM_VM).  It's not a great solution and depends on the VM
getparam which may go away in future.

I think the real answer to a lot of these is actually softpin.  Most
of the tests where VM sharing really matters are tests for parallel
execution with the execlist scheduler which means they likely don't
apply on older hardware anyway.  If we fix a few addresses, then
there's no need for VM sharing because there won't be any
serialization due to relocations to begin with.

In any case, I can add VMs to contexts and smash SINGLE_TIMELINE to
keep behavior the same for now.

--Jason
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
