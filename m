Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18DC6E029
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 20:42:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id l18so12807727edc.9
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 13:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223233.2982842-1-jason@jlekstrand.net>
 <20210319223233.2982842-9-jason@jlekstrand.net>
 <YFjvLPm5BLXLVGaI@phenom.ffwll.local>
In-Reply-To: <YFjvLPm5BLXLVGaI@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 22 Mar 2021 15:42:01 -0500
Message-ID: <CAOFGe959ywf9SBhZ14B8gP+8EE_3-fnav4UGwcFgF+DsPNjpNA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] lib/i915/gem_context: Implement VM
 and engine cloning manually
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

On Mon, Mar 22, 2021 at 2:25 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Mar 19, 2021 at 05:32:33PM -0500, Jason Ekstrand wrote:
> > We're going to be deleting the CONTEXT_CLONE API since IGT is the only
> > userspace to ever use it.  There are only two bits of this API that IGT
> > uses in interesting ways so implement them as create params instead of
> > cloning.
>
> I think this works, only major concern I have: Do we have a userspace that
> uses getparam with the engine param?

Not sure.  I kind-of doubt it.  Also, the getparam has some pretty
ugly corners.  If the client hasn't explicitly set any engines, it
doesn't return any so there's no "get me the default".  This makes me
suspect the answer is "no".

There are a few tests which use the engine clone for a useful purpose.
It could be plumbed through but it'd be semi-annoying.  That said,
it's only 1-2 tests so I could probably do that easily enough.

--Jason

> vm_id I know we need to keep working
> in some form, but engines I've not seen. And keeping the getparam working
> just for igt isn't much better than keeping clone working.
>
> Maybe we need to limit this to just VM sharing, and open code the other
> users in the test directly.
>
> Once that's sorted: For at least the functions you're touching, can you
> pls add gtkdoc in the libraries and wire it up for the doc build? I know
> in the past especially gem igt libarary code has been extremely lacking on
> this, but we need to start somewhere with better test code. This is as
> good a place as any. For that perhaps check with Petri and Zbyscek on irc
> how to get the doc build going, it's a bit an adventure unfortunately.
>
> Also I do wonder how much more fallout we'll see once we start to lock
> down the contexts after the first execbuf.
>
> Also needs sob.
>
> > ---
> >  lib/i915/gem_context.c         | 90 ++++++++++++++++++++++++++--------
> >  lib/i915/gem_context.h         |  7 ++-
> >  tests/i915/gem_ctx_shared.c    | 10 ++--
> >  tests/i915/gem_exec_balancer.c |  6 +--
> >  tests/i915/gem_exec_schedule.c |  8 +--
> >  5 files changed, 86 insertions(+), 35 deletions(-)
> >
> > diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
> > index 79411e10..ed56d974 100644
> > --- a/lib/i915/gem_context.c
> > +++ b/lib/i915/gem_context.c
> > @@ -334,28 +334,77 @@ bool gem_context_has_persistence(int i915)
> >       return __gem_context_get_param(i915, &param) == 0;
> >  }
> >
> > +static void
> > +add_ctx_create_ext(struct drm_i915_gem_context_create_ext *ctx,
> > +                struct i915_user_extension *ext)
> > +{
> > +     ext->next_extension = ctx->extensions;
> > +     ctx->extensions = to_user_pointer(ext);
> > +}
> > +
> >  int
> >  __gem_context_clone(int i915,
> > -                 uint32_t src, unsigned int share,
> > +                 uint32_t src, unsigned int clone,
> >                   unsigned int flags,
> >                   uint32_t *out)
> >  {
> > -     struct drm_i915_gem_context_create_ext_clone clone = {
> > -             { .name = I915_CONTEXT_CREATE_EXT_CLONE },
> > -             .clone_id = src,
> > -             .flags = share,
> > -     };
> > -     struct drm_i915_gem_context_create_ext arg = {
> > +     I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
> > +     uint32_t vm;
> > +     struct drm_i915_gem_context_create_ext_setparam engines_param, vm_param;
> > +     int err;
> > +
> > +     struct drm_i915_gem_context_create_ext ctx_create = {
> >               .flags = flags | I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> > -             .extensions = to_user_pointer(&clone),
> > +             .extensions = 0,
> >       };
> > -     int err;
> >
> > -     err = create_ext_ioctl(i915, &arg);
> > +     if (clone & GEM_CONTEXT_CLONE_ENGINES) {
> > +             engines_param = (struct drm_i915_gem_context_create_ext_setparam) {
> > +                     .base = {
> > +                             .name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> > +                     },
> > +                     .param = {
> > +                             .param = I915_CONTEXT_PARAM_ENGINES,
> > +                             .size = sizeof(engines),
> > +                             .value = to_user_pointer(&engines),
> > +                     },
> > +             };
> > +
> > +             engines_param.param.ctx_id = src;
> > +             err = __gem_context_get_param(i915, &engines_param.param);
> > +             if (err)
> > +                     return err;
> > +
> > +             engines_param.param.ctx_id = 0;
> > +             add_ctx_create_ext(&ctx_create, &engines_param.base);
> > +     }
> > +
> > +     if (clone & GEM_CONTEXT_CLONE_VM) {
> > +             vm_param = (struct drm_i915_gem_context_create_ext_setparam) {
> > +                     .base = {
> > +                             .name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> > +                     },
> > +                     .param = {
> > +                             .param = I915_CONTEXT_PARAM_VM,
> > +                             .size = sizeof(vm),
> > +                             .value = to_user_pointer(&vm),
> > +                     },
> > +             };
> > +
> > +             vm_param.param.ctx_id = src;
> > +             err = __gem_context_get_param(i915, &vm_param.param);
> > +             if (err)
> > +                     return err;
> > +
> > +             vm_param.param.ctx_id = 0;
> > +             add_ctx_create_ext(&ctx_create, &vm_param.base);
> > +     }
> > +
> > +     err = create_ext_ioctl(i915, &ctx_create);
> >       if (err)
> >               return err;
> >
> > -     *out = arg.ctx_id;
> > +     *out = ctx_create.ctx_id;
> >       return 0;
> >  }
> >
> > @@ -373,23 +422,22 @@ static bool __gem_context_has(int i915, uint32_t share, unsigned int flags)
> >
> >  bool gem_contexts_has_shared_gtt(int i915)
> >  {
> > -     return __gem_context_has(i915, I915_CONTEXT_CLONE_VM, 0);
> > +     return __gem_context_has(i915, GEM_CONTEXT_CLONE_VM, 0);
> >  }
> >
> >  bool gem_has_queues(int i915)
> >  {
> > -     return __gem_context_has(i915,
> > -                              I915_CONTEXT_CLONE_VM,
> > +     return __gem_context_has(i915, GEM_CONTEXT_CLONE_VM,
> >                                I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
> >  }
> >
> >  uint32_t gem_context_clone(int i915,
> > -                        uint32_t src, unsigned int share,
> > +                        uint32_t src, unsigned int clone,
> >                          unsigned int flags)
> >  {
> >       uint32_t ctx;
> >
> > -     igt_assert_eq(__gem_context_clone(i915, src, share, flags, &ctx), 0);
> > +     igt_assert_eq(__gem_context_clone(i915, src, clone, flags, &ctx), 0);
> >
> >       return ctx;
> >  }
> > @@ -426,15 +474,15 @@ uint32_t gem_context_clone_with_engines(int i915, uint32_t src)
> >       if (!gem_has_context_clone(i915))
> >               return gem_context_create(i915);
> >       else
> > -             return gem_context_clone(i915, src, I915_CONTEXT_CLONE_ENGINES,
> > +             return gem_context_clone(i915, src, GEM_CONTEXT_CLONE_ENGINES,
> >                                        0);
> >  }
> >
> >  uint32_t gem_queue_create(int i915)
> >  {
> >       return gem_context_clone(i915, 0,
> > -                              I915_CONTEXT_CLONE_VM |
> > -                              I915_CONTEXT_CLONE_ENGINES,
> > +                              GEM_CONTEXT_CLONE_VM |
> > +                              GEM_CONTEXT_CLONE_ENGINES,
> >                                I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
> >  }
> >
> > @@ -448,8 +496,8 @@ uint32_t gem_queue_create(int i915)
> >  uint32_t gem_queue_clone_with_engines(int i915, uint32_t src)
> >  {
> >       return gem_context_clone(i915, src,
> > -                              I915_CONTEXT_CLONE_ENGINES |
> > -                              I915_CONTEXT_CLONE_VM,
> > +                              GEM_CONTEXT_CLONE_ENGINES |
> > +                              GEM_CONTEXT_CLONE_VM,
> >                                I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
> >  }
> >
> > diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
> > index c2c2b827..e583ce09 100644
> > --- a/lib/i915/gem_context.h
> > +++ b/lib/i915/gem_context.h
> > @@ -37,12 +37,15 @@ int __gem_context_destroy(int fd, uint32_t ctx_id);
> >  uint32_t gem_context_create_for_engine(int fd, unsigned int class, unsigned int inst);
> >  uint32_t gem_context_create_for_class(int i915, unsigned int class, unsigned int *count);
> >
> > +#define GEM_CONTEXT_CLONE_ENGINES (1 << 4)
> > +#define GEM_CONTEXT_CLONE_VM (1 << 5)
>
> At least in the kernel we tend to make these enums so you have a place to
> put docs, but not sure about igt.
> -Daniel
>
> > +
> >  int __gem_context_clone(int i915,
> > -                     uint32_t src, unsigned int share,
> > +                     uint32_t src, unsigned int clone,
> >                       unsigned int flags,
> >                       uint32_t *out);
> >  uint32_t gem_context_clone(int i915,
> > -                        uint32_t src, unsigned int share,
> > +                        uint32_t src, unsigned int clone,
> >                          unsigned int flags);
> >  uint32_t gem_context_clone_with_engines(int i915, uint32_t src);
> >  void gem_context_copy_engines(int src_fd, uint32_t src,
> > diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> > index 6b21994d..21b07083 100644
> > --- a/tests/i915/gem_ctx_shared.c
> > +++ b/tests/i915/gem_ctx_shared.c
> > @@ -82,7 +82,7 @@ static void create_shared_gtt(int i915, unsigned int flags)
> >       igt_until_timeout(2) {
> >               parent = flags & DETACHED ? child : 0;
> >               child = gem_context_clone(i915,
> > -                                       parent, I915_CONTEXT_CLONE_VM,
> > +                                       parent, GEM_CONTEXT_CLONE_VM,
> >                                         0);
> >               execbuf.rsvd1 = child;
> >               gem_execbuf(i915, &execbuf);
> > @@ -98,7 +98,7 @@ static void create_shared_gtt(int i915, unsigned int flags)
> >               execbuf.rsvd1 = parent;
> >               igt_assert_eq(__gem_execbuf(i915, &execbuf), -ENOENT);
> >               igt_assert_eq(__gem_context_clone(i915,
> > -                                               parent, I915_CONTEXT_CLONE_VM,
> > +                                               parent, GEM_CONTEXT_CLONE_VM,
> >                                                 0, &parent), -ENOENT);
> >       }
> >       if (flags & DETACHED)
> > @@ -121,7 +121,7 @@ static void disjoint_timelines(int i915)
> >        * distinct timelines. A request queued to one context should be
> >        * independent of any shared contexts.
> >        */
> > -     child = gem_context_clone(i915, 0, I915_CONTEXT_CLONE_VM, 0);
> > +     child = gem_context_clone(i915, 0, GEM_CONTEXT_CLONE_VM, 0);
> >       plug = igt_cork_plug(&cork, i915);
> >
> >       spin[0] = __igt_spin_new(i915, .ctx = 0, .dependency = plug);
> > @@ -161,7 +161,7 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
> >               for (;;) {
> >                       parent = child;
> >                       err = __gem_context_clone(i915,
> > -                                               parent, I915_CONTEXT_CLONE_VM,
> > +                                               parent, GEM_CONTEXT_CLONE_VM,
> >                                                 0, &child);
> >                       if (err)
> >                               break;
> > @@ -201,7 +201,7 @@ static void exec_shared_gtt(int i915, unsigned int ring)
> >       int timeline;
> >       int i;
> >
> > -     clone = gem_context_clone(i915, 0, I915_CONTEXT_CLONE_VM, 0);
> > +     clone = gem_context_clone(i915, 0, GEM_CONTEXT_CLONE_VM, 0);
> >
> >       /* Find a hole big enough for both objects later */
> >       scratch = gem_create(i915, 16384);
> > diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> > index 9feb20fb..64ad259c 100644
> > --- a/tests/i915/gem_exec_balancer.c
> > +++ b/tests/i915/gem_exec_balancer.c
> > @@ -627,7 +627,7 @@ static void bonded(int i915, unsigned int flags)
> >               }
> >
> >               ctx = gem_context_clone(i915,
> > -                                     master, I915_CONTEXT_CLONE_VM,
> > +                                     master, GEM_CONTEXT_CLONE_VM,
> >                                       I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
> >               set_load_balancer(i915, ctx, siblings, count, &bonds[limit - 1]);
> >
> > @@ -827,7 +827,7 @@ static void bonded_slice(int i915)
> >                       igt_list_del(&spin->link);
> >
> >                       ctx = gem_context_clone(i915, ctx,
> > -                                             I915_CONTEXT_CLONE_ENGINES, 0);
> > +                                             GEM_CONTEXT_CLONE_ENGINES, 0);
> >
> >                       while (!READ_ONCE(*stop)) {
> >                               spin = igt_spin_new(i915,
> > @@ -2443,7 +2443,7 @@ static void nop(int i915)
> >                               .buffer_count = 1,
> >                               .flags = child + 1,
> >                               .rsvd1 = gem_context_clone(i915, ctx,
> > -                                                        I915_CONTEXT_CLONE_ENGINES, 0),
> > +                                                        GEM_CONTEXT_CLONE_ENGINES, 0),
> >                       };
> >                       struct timespec tv = {};
> >                       unsigned long nops;
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index 9585059d..aedcdf33 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -1183,8 +1183,8 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
> >               fence = igt_cork_plug(&cork, i915);
> >
> >       ctx = gem_context_clone(i915, execbuf.rsvd1,
> > -                           I915_CONTEXT_CLONE_ENGINES |
> > -                           I915_CONTEXT_CLONE_VM,
> > +                           GEM_CONTEXT_CLONE_ENGINES |
> > +                           GEM_CONTEXT_CLONE_VM,
> >                             0);
> >       spin = igt_spin_new(i915, ctx,
> >                           .engine = engine,
> > @@ -2428,9 +2428,9 @@ static void *iova_thread(struct ufd_thread *t, int prio)
> >       unsigned int clone;
> >       uint32_t ctx;
> >
> > -     clone = I915_CONTEXT_CLONE_ENGINES;
> > +     clone = GEM_CONTEXT_CLONE_ENGINES;
> >       if (t->flags & SHARED)
> > -             clone |= I915_CONTEXT_CLONE_VM;
> > +             clone |= GEM_CONTEXT_CLONE_VM;
> >
> >       ctx = gem_context_clone(t->i915, 0, clone, 0);
> >       gem_context_set_priority(t->i915, ctx, prio);
> > --
> > 2.29.2
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
