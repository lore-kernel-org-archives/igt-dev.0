Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7D98970E
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Dec 2020 10:07:20 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201228095207.376732-1-apoorva1.singh@intel.com>
References: <20201228095207.376732-1-apoorva1.singh@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 28 Dec 2020 10:07:16 +0000
Message-ID: <160915003696.9394.16485176372331352418@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_reset_stats: Call noop() with
 relevant params
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
To: apoorva1.singh@intel.com, arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting apoorva1.singh@intel.com (2020-12-28 09:52:07)
> @@ -350,8 +350,8 @@ static void test_ban(const struct intel_execution_engine *e)
>         inject_hang(fd_bad, 0, e, BAN | ASYNC);
>         active_count++;
>  
> -       noop(fd_good, 0, e);
> -       noop(fd_good, 0, e);
> +       igt_assert(noop(fd_bad, 0, e) > 0);
> +       igt_assert(noop(fd_good, 0, e) > 0);

Why?
>  
>         while (retry--) {
>                 inject_hang(fd_bad, 0, e, BAN);

> @@ -409,8 +409,8 @@ static void test_ban_ctx(const struct intel_execution_engine *e)
>         inject_hang(fd, ctx_bad, e, BAN | ASYNC);
>         active_count++;
>  
> -       noop(fd, ctx_good, e);
> -       noop(fd, ctx_good, e);
> +       igt_assert(noop(fd, ctx_bad, e) > 0);
> +       igt_assert(noop(fd, ctx_good, e) > 0);

Why?

The change looks irrelevant. The bad fd/ctx have hangs inflight, pinging
the good fd/ctx is verification for the later assertions.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
