Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9CD6E3E7
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 15:57:18 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200129152427.8833-2-krishnaiah.bommu@intel.com>
References: <20200129152427.8833-1-krishnaiah.bommu@intel.com>
 <20200129152427.8833-2-krishnaiah.bommu@intel.com>
Message-ID: <158031342086.11197.3814731215766351149@skylake-alporthouse-com>
Date: Wed, 29 Jan 2020 15:57:00 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/1] tests/i915/gem_ctx_persistence:
 Set context with supported engines
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Bommu Krishnaiah (2020-01-29 15:24:27)
> -static void test_process_mixed(int i915, unsigned int engine)
> +static void test_process_mixed(int pfd, unsigned int engine)
>  {
>         int fence[2], sv[2];
> +       int i915;

This is local to the child, best given local scope.

>         /*
>          * If a process dies early, any nonpersistent contexts it had
> @@ -565,14 +566,15 @@ static void test_process_mixed(int i915, unsigned int engine)
>         igt_require(socketpair(AF_UNIX, SOCK_DGRAM, 0, sv) == 0);
>  
>         igt_fork(child, 1) {
> -               i915 = gem_reopen_driver(i915);
> +               i915 = gem_reopen_driver(pfd);
>                 gem_quiescent_gpu(i915);
>  
>                 for (int persists = 0; persists <= 1; persists++) {
>                         igt_spin_t *spin;
>                         uint32_t ctx;
>  
> -                       ctx = gem_context_create(i915);
> +                       ctx = gem_context_clone_with_engines(i915, 0);
No point cloning from the wrong context, 

> +                       gem_context_copy_engines(pfd, 0, i915, ctx);
when you copy across the engines[] anyway.

>                         gem_context_set_persistence(i915, ctx, persists);
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
