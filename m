Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB5589DA6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 14:50:43 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id g142so15808149ybf.9
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 07:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210609173632.248880-1-jason@jlekstrand.net>
 <20210609173632.248880-22-jason@jlekstrand.net>
 <87fsxnn9j0.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87fsxnn9j0.wl-ashutosh.dixit@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 09:50:31 -0500
Message-ID: <CAOFGe97ak4ofFhtbU2VbwBc+R=C_2yfhsHtxQrYSLK_RExN0uw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 21/93] tests/i915/perf_pmu: Convert to
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

On Fri, Jun 11, 2021 at 8:49 PM Dixit, Ashutosh
<ashutosh.dixit@intel.com> wrote:
>
> On Wed, 09 Jun 2021 10:36:04 -0700, Jason Ekstrand wrote:
> >
> > @@ -2107,48 +2130,48 @@ igt_main
> >        * Test that a single engine metric can be initialized or it
> >        * is correctly rejected.
> >        */
> > -     test_each_engine("init-busy", fd, e)
> > +     test_each_engine("init-busy", fd, ctx, e)
> >               init(fd, e, I915_SAMPLE_BUSY);
> >
> > -     test_each_engine("init-wait", fd, e)
> > +     test_each_engine("init-wait", fd, ctx, e)
> >               init(fd, e, I915_SAMPLE_WAIT);
> >
> > -     test_each_engine("init-sema", fd, e)
> > +     test_each_engine("init-sema", fd, ctx, e)
> >               init(fd, e, I915_SAMPLE_SEMA);
>
> To be completely equivalent to the previous code it seems we should be
> passing in ctx into init() so that ctx->id can be passed into
> gem_context_has_engine() instead of id 0. Since only ctx has all engines
> and ctx 0 only has legacy engines (unlike previous code where ctx 0 had all
> engines).

Yup.  Fixed.


> >       /**
> >        * Check render nodes are counted.
> >        */
> >       igt_subtest_group {
> >               int render_fd = -1;
> > +             const intel_ctx_t *render_ctx = NULL;
> >
> >               igt_fixture {
> >                       render_fd = __drm_open_driver_render(DRIVER_INTEL);
> >                       igt_require_gem(render_fd);
> > +                     render_ctx = intel_ctx_create_all_physical(render_fd);
> >
> >                       gem_quiescent_gpu(fd);
> >               }
> >
> > -             test_each_engine("render-node-busy", render_fd, e)
> > -                     single(render_fd, e, TEST_BUSY);
> > -             test_each_engine("render-node-busy-idle", render_fd, e)
> > -                     single(render_fd, e, TEST_BUSY | TEST_TRAILING_IDLE);
> > +             test_each_engine("render-node-busy", render_fd, ctx, e)
>
> Shouldn't this be render_ctx instead of ctx?

Yup.  Didn't break anything because both drm FDs enumerate the same
engines but it's technically wrong.

> > +                     single(render_fd, render_ctx, e, TEST_BUSY);
> > +             test_each_engine("render-node-busy-idle", render_fd, ctx, e)
>
> Shouldn't this be render_ctx instead of ctx?

Fixed both.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
