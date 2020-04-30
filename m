Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53396EB99
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2020 11:32:02 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200430112342.18271-1-sai.gowtham.ch@intel.com>
References: <20200430112342.18271-1-sai.gowtham.ch@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158824630453.7361.14418889503547070117@build.alporthouse.com>
Date: Thu, 30 Apr 2020 12:31:44 +0100
Subject: Re: [igt-dev] [PATCH i-g-t]tests/i915/gem_ringfill:Adjusted test to
 utilize all available engines.
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

Quoting sai gowtham (2020-04-30 12:23:42)
>         for (m = modes; m->suffix; m++) {
> -               const struct intel_execution_engine *e;
> -
> +               /* Legacy testing must be first. */
>                 for (e = intel_execution_engines; e->name; e++) {
> -                       igt_subtest_f("%s%s%s",
> -                                     m->basic && !e->exec_id ? "basic-" : "",
> -                                     e->name,
> -                                     m->suffix) {
> -                               igt_skip_on(m->flags & NEWFD && master);
> -                               run_test(fd, eb_ring(e), m->flags, m->timeout);
> +                       struct intel_execution_engine2 e2__;
> +                       e2__ = gem_eb_flags_to_engine(eb_ring(e));
> +                       if (e2__.flags == -1)
> +                               continue;
> +                       e2 = &e2__;
> +                       igt_skip_on(m->flags & NEWFD && master);
> +                       igt_subtest_f("legacy-%s%s%s",
> +                                       m->basic && !e->exec_id ? "basic-" : "",
> +                                       e->name,
> +                                       m->suffix)
> +                               run_test(fd, e2, m->flags, m->timeout);
> +               }
> +               igt_skip_on(m->flags & NEWFD && master);
> +               igt_subtest_with_dynamic_f("%s%s", m->basic  ? "basic" : "",  m->suffix) {
> +                       __for_each_physical_engine(fd, e2) {
> +                               igt_dynamic_f("%s", e2->name) {
> +                                       run_test(fd, e2, m->flags, m->timeout);
> +                               }

Dynamic selection for one and not the other?

Just because of default-forked? Try tuning all for use in BAT.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
