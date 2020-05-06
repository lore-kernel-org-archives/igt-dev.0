Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0D86E05D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 06:02:06 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200506045354.19122-1-sai.gowtham.ch@intel.com>
References: <20200506045354.19122-1-sai.gowtham.ch@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158874489237.11789.2125532991114580066@build.alporthouse.com>
Date: Wed, 06 May 2020 07:01:32 +0100
Subject: Re: [igt-dev] [PATCH i-g-t][V2] tests/i915/gem_ringfill:Adjusted
 test to utilize all available engines.
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
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting sai gowtham (2020-05-06 05:53:54)
> @@ -203,8 +203,9 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
>                 igt_debug("Forking %d children\n", nchild);
>                 igt_fork(child, nchild) {
>                         if (flags & NEWFD) {
> -                               fd = drm_open_driver(DRIVER_INTEL);
> -                               setup_execbuf(fd, &execbuf, obj, reloc, ring);
> +                               i915 = drm_open_driver(DRIVER_INTEL);
> +                               gem_context_copy_engines(fd, 0, i915, 0);
> +                               setup_execbuf(i915, &execbuf, obj, reloc, e);
>                         }
>                         fill_ring(fd, &execbuf, flags, timeout);

NEWFD broken.

> @@ -276,17 +279,28 @@ igt_main
>                 igt_info("Ring size: %d batches\n", ring_size);
>                 igt_require(ring_size);
>         }
> -
>         for (m = modes; m->suffix; m++) {
> -               const struct intel_execution_engine *e;
> -
> -               for (e = intel_execution_engines; e->name; e++) {
> -                       igt_subtest_f("%s%s%s",
> -                                     m->basic && !e->exec_id ? "basic-" : "",
> -                                     e->name,
> -                                     m->suffix) {
> +               /* Legacy testing must be first. */
> +               igt_subtest_with_dynamic_f("legacy-%s", m->suffix) {
> +                       for (e = intel_execution_engines; e->name; e++) {
> +                               struct intel_execution_engine2 e2__;
> +                               e2__ = gem_eb_flags_to_engine(eb_ring(e));
> +                               if (e2__.flags == -1)
> +                                       continue;
> +                               e2 = &e2__;
>                                 igt_skip_on(m->flags & NEWFD && master);
> -                               run_test(fd, eb_ring(e), m->flags, m->timeout);
> +                               igt_dynamic_f("%s%s",
> +                                               m->basic && !e2->instance ? "basic-" : "",
> +                                       e2->name)
> +                                       run_test(fd, e2, m->flags, m->timeout);
> +                       }

Farcical.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
