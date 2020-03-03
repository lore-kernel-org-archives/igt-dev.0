Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D106EA74
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 14:28:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200207125941.22974-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200207125941.22974-1-arjun.melkaveri@intel.com>
Message-ID: <158324572493.6031.13719344880691742608@skylake-alporthouse-com>
Date: Tue, 03 Mar 2020 14:28:44 +0000
Subject: Re: [igt-dev] [PATCH V3] [PATCH i-g-t] gem_ctx_create:Adjusted test
 to use __for_each_physical_engine to utilize all available engines
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Arjun Melkaveri (2020-02-07 12:59:41)
> @@ -179,11 +195,22 @@ static void active(int fd, unsigned engine, int timeout, int ncpus)
>         igt_fork(child, ncpus) {
>                 struct timespec start, end;
>                 unsigned count = 0;
> +               int i915;
> +               uint32_t ctx;
> +
> +               i915 = gem_reopen_driver(fd);
> +               /*
> +                * Ensure the gpu is idle by launching
> +                * a nop execbuf and stalling for it.
> +                */
> +               gem_quiescent_gpu(i915);
> +               ctx = gem_context_create(i915);
> +               gem_context_copy_engines(fd, 0, i915, ctx);
>  
>                 clock_gettime(CLOCK_MONOTONIC, &start);
>                 do {
>                         do {
> -                               execbuf.rsvd1 = gem_context_create(fd);
> +                               execbuf.rsvd1 = ctx;
>                                 for (unsigned n = 0; n < nengine; n++) {
>                                         execbuf.flags = engines[n];
>                                         gem_execbuf(fd, &execbuf);

Ahem. The point of the test was to create a new context, not keep using
a dead context.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
