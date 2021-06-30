Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80E6EA63
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 18:00:58 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id p15so6400435ybe.6
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 11:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210617191256.577244-1-jason@jlekstrand.net>
 <20210617191516.577394-16-jason@jlekstrand.net>
 <87zgv97njg.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87zgv97njg.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 30 Jun 2021 13:00:44 -0500
Message-ID: <CAOFGe979gCozyzjdxOOEzWQMMKdcj20gCsXZNmW_aJ6jv2zbGw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 65/79] lib/i915/gem_context: Delete all
 the context clone/copy stuff
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

On Mon, Jun 28, 2021 at 3:16 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Thu, 17 Jun 2021 12:15:02 -0700, Jason Ekstrand wrote:
> >
> >  lib/i915/gem_context: Delete all the context clone/copy stuff
>
> A couple of comments below but otherwise this is:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>
> > -bool gem_has_queues(int i915)
> > -{
> > -     return __gem_context_has(i915,
> > -                              I915_CONTEXT_CLONE_VM,
> > -                              I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
> > -}
> > -
> > -uint32_t gem_queue_create(int i915)
> > -{
> > -     return gem_context_clone(i915, 0,
> > -                              I915_CONTEXT_CLONE_VM |
> > -                              I915_CONTEXT_CLONE_ENGINES,
> > -                              I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
> > -}
>
> We are discussing if we can have alternative queue functions so let's see
> if that happens, now or later.
>
> > -uint32_t gem_context_create_for_engine(int i915, unsigned int class, unsigned int inst)
> > -{
> > -     I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
> > -             .engines = { { .engine_class = class, .engine_instance = inst } }
> > -     };
> > -     struct drm_i915_gem_context_create_ext_setparam p_engines = {
> > -             .base = {
> > -                     .name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> > -                     .next_extension = 0, /* end of chain */
> > -             },
> > -             .param = {
> > -                     .param = I915_CONTEXT_PARAM_ENGINES,
> > -                     .value = to_user_pointer(&engines),
> > -                     .size = sizeof(engines),
> > -             },
> > -     };
> > -     struct drm_i915_gem_context_create_ext create = {
> > -             .flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> > -             .extensions = to_user_pointer(&p_engines),
> > -     };
> > -
> > -     igt_assert_eq(create_ext_ioctl(i915, &create), 0);
> > -     igt_assert_neq(create.ctx_id, 0);
> > -     return create.ctx_id;
> > -}
>
> gem_context_create_for_engine could probably stay if it doesn't cause link
> warnings?

Sure.  We can leave it.  It's harmless.  I just deleted it because
it's now dead code.  But I'll leave it for now because it'll probably
make the internal rebase easier.

--Jason
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
