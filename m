Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2366E2BC
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 16:46:14 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id h15so3904053ybm.13
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 09:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163704.365989-4-jason@jlekstrand.net>
 <87bl86u3vt.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87bl86u3vt.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 16 Jun 2021 11:46:02 -0500
Message-ID: <CAOFGe94yjH4=0_N=gxoLPArieDRJfTo-xDUCRZQdFE+XhA+siw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 03/77] tests/i915/gem_exec_schedule:
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

On Tue, Jun 15, 2021 at 6:03 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Mon, 14 Jun 2021 09:36:18 -0700, Jason Ekstrand wrote:
> >
> > @@ -1166,24 +1188,24 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
> >               .buffers_ptr = to_user_pointer(&obj),
> >               .buffer_count = 1,
> >               .flags = engine,
> > -             .rsvd1 = gem_context_clone_with_engines(i915, 0),
> >       };
> > +     intel_ctx_cfg_t vm_cfg = *cfg;
> > +     const intel_ctx_t *ctx;
> >       IGT_CORK_FENCE(cork);
> >       uint32_t *map, *cs;
> >       igt_spin_t *slice;
> >       igt_spin_t *spin;
> >       int fence = -1;
> >       uint64_t addr;
> > -     uint32_t ctx;
> >
> >       if (flags & CORKED)
> >               fence = igt_cork_plug(&cork, i915);
> >
> > -     ctx = gem_context_clone(i915, execbuf.rsvd1,
> > -                           I915_CONTEXT_CLONE_ENGINES |
> > -                           I915_CONTEXT_CLONE_VM,
> > -                           0);
> > -     spin = igt_spin_new(i915, ctx,
> > +     vm_cfg.vm = gem_vm_create(i915);
>
> I don't know a lot about this but anyway here goes: Not sure what the
> purpose of the origin I915_CONTEXT_CLONE_VM was but if we are creating a
> new VM and adding to the context that is probably not equivalent to cloning
> the VM.

I'm not 100% sure what the shared VM is for either, TBH.  I think it's
to prevent weird inter-dependencies caused by relocations.  In
particular, if a BO shared between two cotexts ends up with different
addresses in the two VMs, relocating back and forth between the two
addresses can cause serialization that we don't want.

As far as this vs. cloning goes, they're roughly the same.

> Also, i915_gem_vm_create_ioctl() in i915 has this:
>
>         if (!HAS_FULL_PPGTT(i915))
>                 return -ENODEV;
>
> Considering all this, I'm wondering if we are better off just skipping the
> gem_vm_create() above (and just use the default VM for the new context)?

There isn't a single "default VM" which is the problem, at least not
with HAS_FULL_PPGTT.  By default, if HAS_FULL_PPGTT, there is one VM
per context.  We clone to ensure they're all using the same one.  If
we don't HAS_FULL_PPGTT, then there is a single VM and we don't need
to do anything in the test.  We do have a gem_uses_full_ppgtt() helper
in IGT which we can predicate all the VM stuff on.  I'll do that.

> Since in the new API there will no way to clone a VM, correct?

You can't clone directly but you can assign the same one to both which
is what this does.

> gem_vm_destroy() is also missing at the end of the function.

Yup.  I'll fix that.

> > @@ -2455,8 +2491,10 @@ static void *iova_high(void *arg)
> >       return iova_thread(arg, MAX_PRIO);
> >  }
> >
> > -static void test_pi_iova(int i915, unsigned int engine, unsigned int flags)
> > +static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
> > +                      unsigned int engine, unsigned int flags)
> >  {
> > +     intel_ctx_cfg_t ufd_cfg = *cfg;
> >       struct uffdio_api api = { .api = UFFD_API };
> >       struct uffdio_register reg;
> >       struct uffdio_copy copy;
> > @@ -2490,9 +2528,12 @@ static void test_pi_iova(int i915, unsigned int engine, unsigned int flags)
> >       igt_require_f(ioctl(ufd, UFFDIO_API, &api) == 0 && api.api == UFFD_API,
> >                     "userfaultfd API v%lld:%lld\n", UFFD_API, api.api);
> >
> > +     if (flags & SHARED)
> > +             ufd_cfg.vm = gem_vm_create(i915);
>
> This once again is the same vm create/clone issue described above.

Yup.  Will rework.

> Apart from this, everything else seems good afaict and I can give a R-b
> after we close on the vm_create/clone issue. Thanks!

Thanks for your attention to detail!

--Jason
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
