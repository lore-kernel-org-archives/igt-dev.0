Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B74B10E491
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 09:03:52 +0000 (UTC)
Date: Wed, 16 Mar 2022 10:03:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YjGn8AweOLGtXDJy@kamilkon-DESK1>
References: <20220314171747.24668-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220314171747.24668-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_create: lower active
 subtests timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-03-14 at 18:17:47 +0100, Kamil Konieczny napisał(a):
> Active subtests measure time for one cycle of context creation
> and bufexec execution per engine and this is done until timeout
> of 20 seconds expires. On old gpu gens there are low number of
> engines so it runs in reasonable time, but on new ones it can
> take as long as over 800s. Lower timeout to only 2s to keep it
> low on CI. Below is example of dmesg output on new machine with
> long 20 seconds timeout:
> 
> [ 3683.594715] [IGT] gem_ctx_create: executing
> [ 3895.606195] [IGT] gem_ctx_create: starting subtest basic-active

[cut]

> [ 4551.486436] [IGT] gem_ctx_create: exiting, ret=0
> 
> so it took around 868s.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_ctx_create.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 44846652..8052e17c 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -37,6 +37,7 @@
>  #include "sw_sync.h"
>  
>  #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
> +#define ACTIVE_TIMEOUT 20

I forgot to change this to 2, but meanwhile I think about other
solution to this problem, so please drop this for now.

--
Kamil

>  
>  static unsigned all_engines[I915_EXEC_RING_MASK + 1];
>  static unsigned all_nengine;
> @@ -613,26 +614,26 @@ igt_main
>  
>  	/* NULL value means all engines */
>  	igt_subtest("active-all")
> -		active(fd, &cfg, NULL, 20, 1);
> +		active(fd, &cfg, NULL, ACTIVE_TIMEOUT, 1);

[cut]
> -- 
> 2.32.0
> 
