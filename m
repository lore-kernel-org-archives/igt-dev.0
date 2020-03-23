Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FD289E33
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 10:53:56 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200323083920.7544-1-arjun.melkaveri@intel.com>
References: <20200323083920.7544-1-arjun.melkaveri@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158496083224.17851.17744025631776061468@build.alporthouse.com>
Date: Mon, 23 Mar 2020 10:53:52 +0000
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t][V2]tests/i915/gem_ctx_create:
 Reverted device reopen logic
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

Quoting Arjun Melkaveri (2020-03-23 08:39:20)
> Removed gem_reopen_driver and gem_context_copy_engines
> logic from code as it is not recommended.
> No reopen after fork is needed .
> 
> V2:
> Added gem_context_copy_engines to copy engines over.
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_ctx_create.c | 44 +++++--------------------------------
>  1 file changed, 6 insertions(+), 38 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 2d477226..61a25d5b 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -100,11 +100,10 @@ static void files(int core, int timeout, const int ncpus)
>         igt_fork(child, ncpus) {
>                 struct timespec start, end;
>                 unsigned count = 0;
> -               int fd;
>  
>                 clock_gettime(CLOCK_MONOTONIC, &start);
>                 do {
> -                       fd = gem_reopen_driver(core);
> +                       int fd = drm_open_driver(DRIVER_INTEL);

gem_reopen_driver() is an improvement over drm_open_driver() in this
circumstance.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
